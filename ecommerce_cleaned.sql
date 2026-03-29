create database ecommerce;
use ecommerce;
select * from ecommerce_cleaned;
-- Total Revenue
SELECT SUM(sales) AS total_revenue
FROM ecommerce_cleaned;

-- revenue by year
SELECT order_year,
SUM(sales) AS revenue
FROM ecommerce_cleaned
GROUP BY order_year;

-- highest sales month
SELECT order_month,
SUM(sales) AS total_sales
FROM ecommerce_cleaned
GROUP BY order_month
ORDER BY total_sales DESC
LIMIT 1;

-- Most Profitable Category
SELECT category,
SUM(profit) AS total_profit
FROM ecommerce_cleaned
GROUP BY category
ORDER BY total_profit DESC;

-- Loss Making Orders %
SELECT
SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END)/COUNT(*)*100 AS loss_percentage
FROM ecommerce_cleaned;

-- Profit Margin by Segment
SELECT segment,
SUM(profit)/SUM(sales) AS profit_margin
FROM ecommerce_cleaned
GROUP BY segment;

-- Top Customers by Revenue
SELECT customer_name,
SUM(sales) AS revenue
FROM ecommerce_cleaned
GROUP BY customer_name
ORDER BY revenue DESC
LIMIT 10;

-- Repeat Customers
SELECT customer_name
FROM ecommerce_cleaned
GROUP BY customer_name
HAVING COUNT(customer_id) > 1;

--  Show repeat customers with number of orders
SELECT 
    customer_name,
    COUNT(customer_id) AS total_orders
FROM ecommerce_cleaned
GROUP BY customer_name
HAVING  COUNT(customer_id) > 1
order by total_orders desc;

-- Top Products by Sales
SELECT product_name,
SUM(sales) AS total_sales
FROM ecommerce_cleaned
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Discount vs Profit
SELECT discount,
AVG(profit)
FROM ecommerce_cleaned
GROUP BY discount
ORDER BY discount;

-- Average Delivery Time
SELECT AVG(delivery_days)
FROM ecommerce_cleaned;





