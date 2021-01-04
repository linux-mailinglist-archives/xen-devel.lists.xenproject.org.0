Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6812E9C57
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 18:47:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61456.108181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTwq-00053G-FN; Mon, 04 Jan 2021 17:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61456.108181; Mon, 04 Jan 2021 17:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTwq-00052u-Bs; Mon, 04 Jan 2021 17:47:16 +0000
Received: by outflank-mailman (input) for mailman id 61456;
 Mon, 04 Jan 2021 17:47:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NE+=GH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kwTwo-00052p-JU
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:47:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18117d55-52ae-411e-af26-c07cd488aa2e;
 Mon, 04 Jan 2021 17:47:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA8E92068D;
 Mon,  4 Jan 2021 17:47:12 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 18117d55-52ae-411e-af26-c07cd488aa2e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609782433;
	bh=bsUMqtT9d5OhNjicBaXI5+ixr3A5Jx8Hhh6xXWm5414=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eN8NIO9iIR34o2GzczKLrXeS+gqgmKeEbnkvsUrmmamp38L5ccKnll+LnXF8AsBGx
	 w8ZeULaieIDXBDomBSuyqMqwY3Zc7x/1NNLBSE3+E4z/C+iXBxS/L/wMwiEfOmvjgf
	 9j7YuY5qXEoLHTLsK4xMTtxU1/3tYVq0nG+zJWOyKA8AoEnDOriY1xtBxOGDAYgOxz
	 YeJoTGsTdokRowOIekiD4NDeysN9eBsDqY3FrpVwz/rvGxX6zTOHO4eXk5Y1ZkoKQ5
	 4fbAOh2p20XvdiLwbwEDxK0Q3XT5SRgp+wqwJroCgU91fF5ukuYIwMEkNNtx/QNcHD
	 mhsGLaJtMkbWg==
Date: Mon, 4 Jan 2021 09:47:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Rahul.Singh@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/serial: scif: Rework how the parameters are found
In-Reply-To: <20201224165021.449-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2101040947030.3465@sstabellini-ThinkPad-T480s>
References: <20201224165021.449-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Dec 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> clang 11 will throw the following error while build Xen:
> 
> scif-uart.c:333:33: error: cast to smaller integer type 'enum port_types' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>     uart->params = &port_params[(enum port_types)match->data];
>                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The error can be prevented by directly storing a pointer to the port
> parameters rather than the a cast of the port type.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Only build tested as I don't have the HW.
> ---
>  xen/drivers/char/scif-uart.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
> index 9d3f66b55b67..ee204a11a471 100644
> --- a/xen/drivers/char/scif-uart.c
> +++ b/xen/drivers/char/scif-uart.c
> @@ -286,8 +286,8 @@ static struct uart_driver __read_mostly scif_uart_driver = {
>  
>  static const struct dt_device_match scif_uart_dt_match[] __initconst =
>  {
> -    { .compatible = "renesas,scif",  .data = (void *)SCIF_PORT },
> -    { .compatible = "renesas,scifa", .data = (void *)SCIFA_PORT },
> +    { .compatible = "renesas,scif",  .data = &port_params[SCIF_PORT] },
> +    { .compatible = "renesas,scifa", .data = &port_params[SCIFA_PORT] },
>      { /* sentinel */ },
>  };
>  
> @@ -330,7 +330,7 @@ static int __init scif_uart_init(struct dt_device_node *dev,
>  
>      match = dt_match_node(scif_uart_dt_match, dev);
>      ASSERT( match );
> -    uart->params = &port_params[(enum port_types)match->data];
> +    uart->params = match->data;
>  
>      uart->vuart.base_addr  = addr;
>      uart->vuart.size       = size;
> -- 
> 2.17.1
> 

