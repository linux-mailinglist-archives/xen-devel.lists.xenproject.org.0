Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BB0B36ECA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 17:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094809.1450037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqvxo-0000OC-Sj; Tue, 26 Aug 2025 15:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094809.1450037; Tue, 26 Aug 2025 15:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqvxo-0000MQ-PT; Tue, 26 Aug 2025 15:52:00 +0000
Received: by outflank-mailman (input) for mailman id 1094809;
 Tue, 26 Aug 2025 15:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33Xc=3G=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uqvxn-0000MK-D2
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 15:51:59 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98fb210d-8294-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 17:51:58 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55f48cb7db9so1908669e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 08:51:58 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bc89sm2376823e87.96.2025.08.26.08.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 08:51:57 -0700 (PDT)
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
X-Inumbo-ID: 98fb210d-8294-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756223518; x=1756828318; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tu/B+b9FVOUegPykySoQO1CG5bJfRfR472MlkTj3Aak=;
        b=laIva0Ev8vlt6Ea+3c1OTzXqPKVHq48dAGMWcnbtT3uG3gkNTROGWvTl8aaPEfxYtx
         SuF0TRQ6mN+YboFezAs73WicHxrJjY229Kd+XYzCVXbLTvoVcTwxICRsNAUqnRoCQZ9l
         IOJZunACseyzHqwjc6sJpdB9Nci3NyylmCtMvv5OhV9t8AJ4npM5LOjrApKY2haVAVec
         DJ71XeqqjWxwUS9lH4jwR/kd8TBLBCLa8mmZ2YVzD2fGKDIeZ/RPs2bPXGLeylLsLlPl
         NUksCrpPkZ+C5uHYWkgPiJYjcxGc+Mrg2h9gfA3q9e3nvIYVx/SioTL7fmi4OAkcfd7R
         f4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756223518; x=1756828318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tu/B+b9FVOUegPykySoQO1CG5bJfRfR472MlkTj3Aak=;
        b=ioR78ZYV1VFvrLts/m7cmyUftafFv62vqYSXm+1wLuyL4r1oQX7xFGA9gmH9z2CIFm
         B0ur6ImFU9nnqrBzgzlH11aM4slT5sL/VhrTfU2mjLsxSXojJCcuF4aAf322r2DNFmb/
         ++aTNHS0xZMashqCxtiYSJNRyzXsa+GiTzHv+/I/rP/e2O6czFbr5ORvBx9ytFbxrLYZ
         VVJfFNffVx03Qagqo+maKVko0KqUyHseplvQ+l7OO9FQFmlALZJ5wlpRsYs8f2TUhDXN
         Hm/2j6q4QETV7NoZzC1eHY1dUSplcn90EVdD42OXalZTQA2fPy2/x2wN8QTux9b5pOru
         sjfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+FpjxXoNwciOJHeMJOLh5W8IhNjMNuMb7/81z1NnTZ3w7rHcXZvCLZm27sbfAg26XR0I1OpjfTXY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHKSODmwg2bMnAQjMO7Af0nTbs/a8QjAkZ4AovWZhj4f6qQt18
	iI0eavpp+Gm/lrdkn4svBl0i2uu+S7q1OffYfqwJrcPyIFWxXPwCaBV5
X-Gm-Gg: ASbGncuKKxByMr2it5pN39L70I50N6iC1WRf9vMgxw9Z+cmLm5IoDdwElwCLAUjjWWM
	pgnn0F7MhH1A8qW5p80p4vWQMhbn3MFgPnOl7sHAFdXHrMshJEXIwIRG4eK4PpQu/lAtcAjxWHS
	rwe2IH9pSi0pbVm0Peik0XhoRGENuintpdgAizLKlY8wEkSmcq15oLhgH8w9SENpwNSMgYNUONt
	tuBzdCZOVbWlSXsR0Ztro06Bok8x2MyjnnT8FukucC0L1slKVDlY0gQUDNqudI0cZM3lTVI6jFB
	/LNLjl3fjyDErKdVLzcRjxtrhKCDLF2Afe4RSem69/7CeV7JoZ/CoFEGpTiOiJ8hl7eAUNjUnjn
	hZsy+hYnM2YfGXRIar665hVaCXbBs+XKvoyld
X-Google-Smtp-Source: AGHT+IGyQ59A/RhuTGtOFK5DCKjuGXv63ifHifdVHWa6wRMwnA36/b5v+vm3ChbpzxXl14IcwOAq4g==
X-Received: by 2002:a05:6512:ba5:b0:55f:4714:f37 with SMTP id 2adb3069b0e04-55f471412d1mr2122771e87.8.1756223517515;
        Tue, 26 Aug 2025 08:51:57 -0700 (PDT)
Message-ID: <60c0b456-bfda-430d-a1e9-f64c9a49ac54@gmail.com>
Date: Tue, 26 Aug 2025 18:51:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/char: implement suspend/resume calls for SCIF
 driver
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.08.25 08:16, Mykola Kvach wrote:


Hello Mykola,

In general patch looks good to me, just one question below ...

> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> Implement suspend and resume callbacks for the SCIF UART driver,
> enabled when CONFIG_SYSTEM_SUSPEND is set. This allows proper
> handling of UART state across system suspend/resume cycles.
> 
> Tested on Renesas R-Car H3 Starter Kit.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> In patch v5, there are no changes at all;
> it was done just to trigger a review.

I think, you could ping on V4.


> 
> In patch v4, enhance commit message, no functional changes
> 
> In patch v2, I just added a CONFIG_SYSTEM_SUSPEND check around
> the suspend/resume functions in the SCIF driver.
> ---
>   xen/drivers/char/scif-uart.c | 40 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
> index 757793ca45..888821a3b8 100644
> --- a/xen/drivers/char/scif-uart.c
> +++ b/xen/drivers/char/scif-uart.c
> @@ -139,9 +139,8 @@ static void scif_uart_interrupt(int irq, void *data)
>       }
>   }
>   
> -static void __init scif_uart_init_preirq(struct serial_port *port)
> +static void scif_uart_disable(struct scif_uart *uart)
>   {
> -    struct scif_uart *uart = port->uart;
>       const struct port_params *params = uart->params;
>   
>       /*
> @@ -155,6 +154,14 @@ static void __init scif_uart_init_preirq(struct serial_port *port)
>   
>       /* Reset TX/RX FIFOs */
>       scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
> +}
> +
> +static void scif_uart_init_preirq(struct serial_port *port)
> +{
> +    struct scif_uart *uart = port->uart;
> +    const struct port_params *params = uart->params;
> +
> +    scif_uart_disable(uart);
>   
>       /* Clear all errors and flags */
>       scif_readw(uart, params->status_reg);
> @@ -271,6 +278,31 @@ static void scif_uart_stop_tx(struct serial_port *port)
>       scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCSCR_TIE);
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static void scif_uart_suspend(struct serial_port *port)
> +{
> +    struct scif_uart *uart = port->uart;
> +
> +    scif_uart_stop_tx(port);

  ... I wonder, whether the call above (that disables Transmit 
interrupt) is really needed as the call below disables all interrupts 
anyway?


> +    scif_uart_disable(uart);
> +}

[snip]

