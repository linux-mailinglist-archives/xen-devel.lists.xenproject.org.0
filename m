Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA8B2E28C2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 20:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58807.103638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksWjg-0004Ly-Nz; Thu, 24 Dec 2020 19:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58807.103638; Thu, 24 Dec 2020 19:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksWjg-0004LZ-KK; Thu, 24 Dec 2020 19:57:20 +0000
Received: by outflank-mailman (input) for mailman id 58807;
 Thu, 24 Dec 2020 19:57:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jyih=F4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1ksWje-0004LU-D9
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 19:57:18 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69804aaf-80f5-454d-b233-6909a12adc8d;
 Thu, 24 Dec 2020 19:57:17 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id 23so6586451lfg.10
 for <xen-devel@lists.xenproject.org>; Thu, 24 Dec 2020 11:57:17 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l13sm4230158lje.138.2020.12.24.11.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Dec 2020 11:57:15 -0800 (PST)
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
X-Inumbo-ID: 69804aaf-80f5-454d-b233-6909a12adc8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/7eAk2jGlnv74ubcD8r1ftTtGUs2q9kdWJly7N4aqc4=;
        b=SNJ+FoyuTTb+eOXZ+2aFaw97Hwm/HWS5+v29AqnUWO8+imyNHRQ0xyr07b5OK6zYuB
         fCVQSvNvt6HkZJKwpIIiDg6gdHarlT0dhx5SPZ7PSiuTtqYhRafQq7cEEC5klhe5Ojfa
         rnxecV9i4EsrMBiezdV4hhw3PIi/ysXsYuzozD0B4ltVoYy6vg4wQ/uQ3XPKiZmp15qt
         kdr7dHehDaWirGC/YpEEqDeOsuOL4tDkeksQYwjYw6q/y1/sd8ltOYK/f+39uKX1KVsW
         P5ToJs7UHByxMNjHGyoAD0zvilBv+39UviScap4jv8A21HgMhMLIRh5WLztEp882NcIY
         6nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/7eAk2jGlnv74ubcD8r1ftTtGUs2q9kdWJly7N4aqc4=;
        b=QXJIesGTfY85oJ8nS+3yYUIzFyJD/r+80FeIbYfbMFJEVmFHI/vBemchoRZ1tFrXCc
         A4Sv0h6HC+KH2OPNngJbkI4QE/T7CoMf7STBu2BvTjer0AvXbPZpIK9pcPRU1XH3IPPT
         xt3mXBmKzBQbKNiUbeZIgT/QrYk9BiKe81iFnN7KLcjFZ/SsHSIaREqEv/IgvYjoBoMp
         ogUlhJbeabn7MhSM90jqHaTBnyd+D0lcImW93bdCGPUF1W9E9gN6Kb4mnd2ed3DHr/ok
         FRfAd2ZupB9IoILiCbEGbD/pwwkj+Wrrq2h4F1OpY7op0V2qYszzdMXnpjMjAfDUa3IU
         9Umg==
X-Gm-Message-State: AOAM531AQhEZwrmzDOm/HvRDxmgnApSloNIyr1ObP9VKZ6mVe+EXyanA
	gAcCKPQ48Dg1938324kUAMM=
X-Google-Smtp-Source: ABdhPJwAQXT8rDhhvW5BDI8vc29560RxImWLQRZNOYZJaml1fxUDBa/Lg0tvGLZTn7ay9Ch5/LKmVw==
X-Received: by 2002:a19:4311:: with SMTP id q17mr12445762lfa.453.1608839836351;
        Thu, 24 Dec 2020 11:57:16 -0800 (PST)
Subject: Re: [PATCH] xen/serial: scif: Rework how the parameters are found
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Rahul.Singh@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201224165021.449-1-julien@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a73a558c-77cd-e527-d82e-88752589cecc@gmail.com>
Date: Thu, 24 Dec 2020 21:57:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201224165021.449-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 24.12.20 18:50, Julien Grall wrote:

Hi Julien

> From: Julien Grall <jgrall@amazon.com>
>
> clang 11 will throw the following error while build Xen:
>
> scif-uart.c:333:33: error: cast to smaller integer type 'enum port_types' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>      uart->params = &port_params[(enum port_types)match->data];
>                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The error can be prevented by directly storing a pointer to the port
> parameters rather than the a cast of the port type.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>
> ---
>
> Only build tested as I don't have the HW.

I don't have an access to the SCIFA based HW at the moment, but on Gen3 
H3 SoC (SCIF) it works.


> ---
>   xen/drivers/char/scif-uart.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
> index 9d3f66b55b67..ee204a11a471 100644
> --- a/xen/drivers/char/scif-uart.c
> +++ b/xen/drivers/char/scif-uart.c
> @@ -286,8 +286,8 @@ static struct uart_driver __read_mostly scif_uart_driver = {
>   
>   static const struct dt_device_match scif_uart_dt_match[] __initconst =
>   {
> -    { .compatible = "renesas,scif",  .data = (void *)SCIF_PORT },
> -    { .compatible = "renesas,scifa", .data = (void *)SCIFA_PORT },
> +    { .compatible = "renesas,scif",  .data = &port_params[SCIF_PORT] },
> +    { .compatible = "renesas,scifa", .data = &port_params[SCIFA_PORT] },
>       { /* sentinel */ },
>   };
>   
> @@ -330,7 +330,7 @@ static int __init scif_uart_init(struct dt_device_node *dev,
>   
>       match = dt_match_node(scif_uart_dt_match, dev);
>       ASSERT( match );
> -    uart->params = &port_params[(enum port_types)match->data];
> +    uart->params = match->data;
>   
>       uart->vuart.base_addr  = addr;
>       uart->vuart.size       = size;

-- 
Regards,

Oleksandr Tyshchenko


