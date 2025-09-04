Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF7B44087
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 17:26:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110433.1459650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuBqS-0001mT-Rs; Thu, 04 Sep 2025 15:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110433.1459650; Thu, 04 Sep 2025 15:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuBqS-0001kk-Oi; Thu, 04 Sep 2025 15:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1110433;
 Thu, 04 Sep 2025 15:25:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJB8=3P=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uuBqS-0001ke-1a
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 15:25:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70443f51-89a3-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 17:25:50 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso2158035e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 08:25:50 -0700 (PDT)
Received: from [10.17.76.214] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3da13041bcasm11898450f8f.35.2025.09.04.08.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 08:25:49 -0700 (PDT)
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
X-Inumbo-ID: 70443f51-89a3-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756999550; x=1757604350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tyHSFAuZBycwb3f9nK3RwRJ9aOJ/KqELn7Qj7AhEtqQ=;
        b=L3R+H+K6GKB4FdXQXyXL+dnOKfDnocGm93ykeAXndA9v+6ucE7D9BT+Dw+bR5H/2yd
         iAJYIO2dDsAAXfYcKvq2dzTJFVpCPi7A1zWfCgNhnqRB0UcxQGy2aHK8cR1jilVUpJTg
         vllU5OHAUfH29+of+cR65g1TiEtG4deEUW9JS+vd/bO+p+zJenIgyJ9+zNkciAYeJGC6
         degULukoUS4RNhPydRaM49rLYYHLZfUKnOXvGBU4t5wO5vdCGcbJUq6BgrovMWX+nRQe
         6gPnGBx+JuEBKp3rPbRk6+zMtlGqZbt6a5y82yQ9UXQhRbjOiwkNrY3AJ1iMeMss0Eay
         Qvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999550; x=1757604350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tyHSFAuZBycwb3f9nK3RwRJ9aOJ/KqELn7Qj7AhEtqQ=;
        b=wRMYEHdShaQXVgRHecoPro9fXLG8aHE3ig9XdxZ6ganbZcDexGsinp4OMAko/gR+YY
         pSCOawIwmYzb0oxY+xwX80sed5OcP/Y2mrGlvLmak1EnNfIzL4oDj8aO1ne7BpMLQTCO
         v4qT3dvq4BPa35/1Q8ApMQU0dQUvXmslv84VMkHfeeXDRNky1NjiKI7PODPmdAyIm0ai
         pptnDFEa09YzvJyRj3ZbAImr8CU63DXG3Lsq7XHuO9SZKas/Nm8n+/3k5bq8aAXl59LK
         YpLn53U4wqEW5raLqU068j0muDXvO6+a4QlTywUNKbsvLtt/8vcsI91MvqDnKMYgKs5X
         3/vA==
X-Forwarded-Encrypted: i=1; AJvYcCUlwmIMCB5KyYgJPgEWi0nmO7LIeuEnLcGqz1aNwFMYDy5FZQQrZZi9VLEDz6FFb8Yqd4bHTSEdCp4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUN72xfIBbX94D0Xhx2QPb1Pgfs8XTsI4DPwkNgJwXtLyLjRw0
	H5WGXEc1YLucQ2DzckMkHYvO9EKz0FfgqI+YtYRG/yO9YlivymR7Dyiq
X-Gm-Gg: ASbGncsP7NrPfOJe9F/2OPY5lJn92KL4JhwD73rfyPs5D2+co9PJJ6AohjENqwUWeVl
	yrHTz+9qgDGaMCdn85Uj4t0NXFbDRAW1q88gER+b/ykN2xlff+FImGf+3nPo6i9c4ft2HOykuZ0
	I1aLjgoqh1c63EhtUgFrNBN8+5290JhesyDVu5XaVfvIZ4htobRy6AIzk7HPuVovObvOv5pryzp
	SeqgWuSdYlX73PlxXLscBTrCUr/hRxl/LFj9kWCpi4LLS6E4Q1d3gbRTYyizHjje6GnHdp52u5U
	mMjiDsCTla6pkblDQOVsY31hONM6OKdJFpRncKJKDpW9k7K2gCXlTvqlOZWbg6f9cCPd8AsBqMW
	XMUPodStl0WT6yGDkH6OlJ8GPPFtM/MTD0vhpqIRwhXdBdIUT7Tai/ng=
X-Google-Smtp-Source: AGHT+IEy/Ogm62ztKNU2ZChot8pIxpQhAStH7E9hgq9jmck8bK0njhwd68p4UsBLkNqBDbgWQtGa1g==
X-Received: by 2002:a05:600c:45c9:b0:458:bbed:a81a with SMTP id 5b1f17b1804b1-45b877be05bmr178574555e9.10.1756999549823;
        Thu, 04 Sep 2025 08:25:49 -0700 (PDT)
Message-ID: <c6b6f77f-cc0c-4d60-ba87-3e82b47fc403@gmail.com>
Date: Thu, 4 Sep 2025 18:25:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: irq: Use appropriate priority for SGIs in
 setup_irq()
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.1756867760.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.1756867760.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.09.25 05:55, Mykola Kvach wrote:

Hello Mykola

> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Use GIC_PRI_IPI priority for SGI interrupts instead of the generic
> GIC_PRI_IRQ priority in setup_irq().
> 
> This change ensures that SGIs get the correct priority level when
> being set up for Xen's use, maintaining proper interrupt precedence
> in the system.
> 
> The priority assignment now follows ARM GIC best practices:
> - SGIs (0-15): GIC_PRI_IPI (higher priority)
> - PPIs/SPIs (16+): GIC_PRI_IRQ (standard priority)
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


> ---
>   xen/arch/arm/irq.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 02ca82c089..17c7ac92b5 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -397,7 +397,13 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
>       /* First time the IRQ is setup */
>       if ( disabled )
>       {
> -        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
> +        unsigned int prio = GIC_PRI_IRQ;
> +
> +        /* Use appropriate priority based on interrupt type */
> +        if (desc->irq < NR_GIC_SGI)
> +            prio = GIC_PRI_IPI;
> +
> +        gic_route_irq_to_xen(desc, prio);
>           /* It's fine to use smp_processor_id() because:
>            * For SGI and PPI: irq_desc is banked
>            * For SPI: we don't care for now which CPU will receive the


