class Api::IndicatorsController < ApiController
  before_filter :get_indicator, only: [ :show, :update ]

  # GET /api/indicators
  def index
    respond_with Indicator.includes(:project, :service, :events).all.map(&:api_return_format)
  end

  # GET /api/indicators/:id
  def show
    respond_with @indicator
  end

  # PUT /api/indicators/:id
  def update
    @indicator.update_attributes(params[:indicator])
    respond_with @indicator
  end

private

  def get_indicator
    @indicator ||= Indicator.find(params[:id]) rescue render(nothing: true) and return
  end
end
