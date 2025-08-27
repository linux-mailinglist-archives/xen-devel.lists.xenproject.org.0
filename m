Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796B0B37FD9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 12:26:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095882.1450744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urDMD-0001lF-RU; Wed, 27 Aug 2025 10:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095882.1450744; Wed, 27 Aug 2025 10:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urDMD-0001ig-Oo; Wed, 27 Aug 2025 10:26:21 +0000
Received: by outflank-mailman (input) for mailman id 1095882;
 Wed, 27 Aug 2025 10:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BCET=3H=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urDMC-0001iL-A4
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 10:26:20 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 389fb8c5-8330-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 12:25:58 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-3366f102680so27294051fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 03:25:58 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33672ad74dcsm18579511fa.24.2025.08.27.03.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 03:25:56 -0700 (PDT)
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
X-Inumbo-ID: 389fb8c5-8330-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756290357; x=1756895157; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RtTPOToBz1rG1gXUmUOzXdRQVKpyGdZjRT3Zys0huh4=;
        b=ncYZCEcDKEdV8TOKj3RQowR8xGXXqI268oU8WhLDPchcEvha+uk/98co9VzC8nYIH8
         vQTQbJl6now7JjzmGuLH1wHqxeZVBe+BLE65HPgogo1C2aAmsnMmK6sSBw1bOyp4ILrG
         oSNxMzAY5yv28IRuYPWQw5p3ULajWNTIm6G3g4HEP6wWfL99Q4HoIfLwW5c04S1i9xiI
         3F4mif80uUK3KL+47BeO6by1UxSDh1kIdF2BJcMjlgkpljFDNEsE5g9PELgeIHzc3XLz
         0NiF8zTJqFYRsa3h8gAFdCGtEZgcfCy5DqerLqjC/TubnP0w1LDNx52P95VxEsO326Ix
         V26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756290357; x=1756895157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtTPOToBz1rG1gXUmUOzXdRQVKpyGdZjRT3Zys0huh4=;
        b=vD6rpo+DIEg0qwpIhyP20xt7V4I9J99bF5+nK135xcJWP6r83DZ3EU76r4qjlZQjAc
         FTK5Qb4Fu2n5azpQ5jvYZQDlwQlRzXsnYu2tgmqCPYYV2pJ47D1X1sZyGv23S8LtKgnx
         TUsKWMa9Rh6RtG6QoVxsoH/cVAmYrb/y34pExBynhVaAMfnh//bR5vXonrYs+f491VKK
         BAMdvVNR2b3Klbb9Augks657cFnjFdL0bv0UxMIK+PgbzLWFu4PpLYACG/UKMgKO0CSq
         y6zbiJ2DmgcOFWqPrj5hOfQgKTPyAgR6UJz9ZwPJl0GfeL+lKEOX6nzP2g9cbr0lWT5U
         yT6A==
X-Forwarded-Encrypted: i=1; AJvYcCWGOatBIM0/i7zw3SJ+pAOOYG9+g7Kk6rQ1/RJl0ubhyD+t6iyK8EZDSnq/ImgvxNmLyK4G8glxK3k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywrswd2575vt9/jVtbdc0xcQcQU54fBLwGc1lYxx2c/yTy3UBXo
	iLVKE9il5Zy3EFPQ8KIwfl1+IEqA5MBGtUJst8MjbSdkNvx4sMpKWuhc
X-Gm-Gg: ASbGnctTODq1Kg77u4QpWxmZsSgCLGvJDPhWjQvaQRJHK5/TsE0jYHDKONDHoo5rmkm
	m4DZ7dV9Iy6x/3y240k6Xtvuwm0OJX9XmFyhXPzaAWK1gCrHoS638VE60AbFYpbuKOtqOGtY+4I
	94W8NVEDDXsdO4nR9/Ulte+Yzy1ibOingOO6EiSGqTpEZfru4tBmNyt/kLehhvj44F7J5GiFS/v
	UnNQVhcT0fGJVYY0IOR+OK8cNdILrMBATfV2dKL15d8d9HNWjj5xjPOg8/DSQ+9dNtW8rYge+jJ
	IFB9woxZN9Zct91qK90ABWleBikPvz/FwKcZnMdRW9yXwj/bZtouPOKrluDMiYAgiTtZOc7L/zg
	L7/gzNkr2T2NSFqT4lt39FfXttQ==
X-Google-Smtp-Source: AGHT+IHLKioI0qA8Wz4DzKYijtk+tudRu/27TPrDMCUMkwCHmtv1Fy3deWkZpmpeaSQmtqtz+yCgfQ==
X-Received: by 2002:a05:651c:31ca:20b0:333:fff0:7d21 with SMTP id 38308e7fff4ca-33650da385fmr32255441fa.10.1756290357169;
        Wed, 27 Aug 2025 03:25:57 -0700 (PDT)
Message-ID: <c9ec5d69-6b2e-4226-aa8f-ee6062c84885@gmail.com>
Date: Wed, 27 Aug 2025 13:25:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <398ad09617f4f97d57d13fa9f3771bd2db83916b.1756216943.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <398ad09617f4f97d57d13fa9f3771bd2db83916b.1756216943.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26.08.25 17:05, Leonid Komarianskyi wrote:


Hello Leonid,

In general patch looks good to me, just one question below ...

> Introduced appropriate register definitions, helper macros,
> and initialization of required GICv3.1 distributor registers
> to support eSPI. This type of interrupt is handled in the
> same way as regular SPI interrupts, with the following
> differences:
> 
> 1) eSPIs can have up to 1024 interrupts, starting from the
> beginning of the range, whereas regular SPIs use INTIDs from
> 32 to 1019, totaling 988 interrupts;
> 2) eSPIs start at INTID 4096, necessitating additional interrupt
> index conversion during register operations.
> 
> In case if appropriate config is disabled, or GIC HW doesn't
> support eSPI, the existing functionality will remain the same.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> 
> ---
> Changes in V2:
> - move gic_number_espis function from
>    [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
>    to use it in the newly introduced gic_is_valid_espi
> - add gic_is_valid_espi which checks if IRQ number is in supported
>    by HW eSPI range
> - update gic_is_valid_irq conditions to allow operations with eSPIs
> 
> Changes in V3:
> - add __init attribute to gicv3_dist_espi_common_init
> - change open-codded eSPI register initialization to the appropriate
>    gen-mask macro
> - fixed formatting for lines with more than 80 symbols
> - introduced gicv3_dist_espi_init_aff to be able to use stubs in case of
>    CONFIG_GICV3_ESPI disabled
> - renamed parameter in the GICD_TYPER_ESPI_RANGE macro to espi_range
>    (name was taken from GIC specification) to avoid confusion
> - changed type for i variable to unsigned int since it cannot be
>    negative
> ---
>   xen/arch/arm/gic-v3.c                  | 80 ++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/gic.h         | 21 +++++++
>   xen/arch/arm/include/asm/gic_v3_defs.h | 34 +++++++++++
>   3 files changed, 135 insertions(+)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index a959fefebe..3aa5cc1765 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32 offset)
>           default:
>               break;
>           }
> +#ifdef CONFIG_GICV3_ESPI
> +    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
> +    {
> +        u32 irq_index = ESPI_INTID2IDX(irqd->irq);
> +
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ICENABLER:
> +            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ISPENDR:
> +            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ICPENDR:
> +            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ISACTIVER:
> +            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICACTIVER:
> +            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICFGR:
> +            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
> +        case GICD_IROUTER:
> +            return (GICD + GICD_IROUTERnE + irq_index * 8);
> +        case GICD_IPRIORITYR:
> +            return (GICD + GICD_IPRIORITYRnE + irq_index);
> +        default:
> +            break;
> +        }
> +    }
> +#endif
>       default:
>           break;
>       }
> @@ -655,6 +685,52 @@ static void gicv3_set_irq_priority(struct irq_desc *desc,
>       spin_unlock(&gicv3.lock);
>   }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +unsigned int gic_number_espis(void)
> +{
> +    return gic_hw_ops->info->nr_espi;
> +}
> +
> +static void __init gicv3_dist_espi_common_init(uint32_t type)
> +{
> +    unsigned int espi_nr, i;
> +
> +    espi_nr = min(1024U, GICD_TYPER_ESPIS_NUM(type));
> +    gicv3_info.nr_espi = espi_nr;
> +    /* The GIC HW doesn't support eSPI, so we can leave from here */
> +    if ( gicv3_info.nr_espi == 0 )
> +        return;
> +
> +    for ( i = 0; i < espi_nr; i += 16 )
> +        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
> +
> +    for ( i = 0; i < espi_nr; i += 4 )
> +        writel_relaxed(GIC_PRI_IRQ_ALL,
> +                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
> +
> +    for ( i = 0; i < espi_nr; i += 32 )
> +    {
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i / 32) * 4);
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVERnE + (i / 32) * 4);
> +    }
> +
> +    for ( i = 0; i < espi_nr; i += 32 )
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) * 4);
> +}
> +
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < gicv3_info.nr_espi; i++ )
> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8);
> +}
> +#else
> +static void __init gicv3_dist_espi_common_init(uint32_t type) { }
> +
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
> +#endif
> +
>   static void __init gicv3_dist_init(void)
>   {
>       uint32_t type;
> @@ -700,6 +776,8 @@ static void __init gicv3_dist_init(void)
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i += 32 )
>           writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);


There is a banner in this function (not visible from the patch context), 
that prints nr_lines, etc.

E.g.:
(XEN) GICv3: 288 lines, (IID 0000043b).

What do you think, would it be important/valuable to also print nr_espi 
if non-zero (extended SPI range is supported)?


>   
> +    gicv3_dist_espi_common_init(type);
> +
>       gicv3_dist_wait_for_rwp();
>   
>       /* Turn on the distributor *
> @@ -713,6 +791,8 @@ static void __init gicv3_dist_init(void)
>   
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>           writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
> +
> +    gicv3_dist_espi_init_aff(affinity);
>   }
> 


[snip]




