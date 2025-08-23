Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A79AB3291E
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 16:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091274.1448005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upp9a-0001Kz-6w; Sat, 23 Aug 2025 14:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091274.1448005; Sat, 23 Aug 2025 14:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upp9a-0001Ir-45; Sat, 23 Aug 2025 14:23:34 +0000
Received: by outflank-mailman (input) for mailman id 1091274;
 Sat, 23 Aug 2025 14:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOa+=3D=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1upp9Y-0001Ic-Ct
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 14:23:32 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be45201b-802c-11f0-b898-0df219b8e170;
 Sat, 23 Aug 2025 16:23:30 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55ce5253adcso3122933e87.2
 for <xen-devel@lists.xenproject.org>; Sat, 23 Aug 2025 07:23:30 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f3db23af2sm230150e87.55.2025.08.23.07.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 07:23:28 -0700 (PDT)
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
X-Inumbo-ID: be45201b-802c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755959010; x=1756563810; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jxafceqXQ3sqq5LJ9WvUErToiUGz649vQj9CWWcV1Gs=;
        b=K+7le6PPCofAbzj1rAyidFeX5Pkn0arB7db+KVi5RseVymH/NojoIu3kjXavaNCyW9
         6IIN5PooF0MoAaLhPAOd7noMstLcIT9GEWd7ovDA151X/241nARPyKh9SsKcDV6s7u/9
         eJOaftXp5zwDpkJJ/bQSOoXlTPjvT82gnNibN7yXeCP01tOH7U5WPshbI42sLJGfPxxq
         6sHEWlNfBOaXsHE22RAGBVp7VNgu8oRiVNn6JKQSrKU7KXjfDRgHiKq1ibF5OB2aRDbH
         Vl1GkTUTCJgqg+yBG7S63UMueFXUB90SlnUT/EqCCbDVVgouiPIOOXW5hz3y8Q8LAuiH
         IDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755959010; x=1756563810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxafceqXQ3sqq5LJ9WvUErToiUGz649vQj9CWWcV1Gs=;
        b=HF+6nWnsV+qSFKOmz+FmO1oLHeUBha4c8ExM4tyC4y4Tb+6iEQv0xTYtAkD0ARPWCM
         +bfev86K/wLPge2ttpaD05ZQycWZamoch9NwhSuDh4GXxLS3zxMN5D7ESlaycrWv3v+f
         3WEWbxc+Kod0hXM+tNDXMSkvKpkGM9fdYVBng7EfsE7CGSGDAdykjISKRDRYJNdYyrv/
         oZDfSRtUxzP9cLG5nz1nGSVmyR3AFyO/WSf6zdPakAz+VWM5H5C5wIJL/7vr8XgRENXc
         ZWgtTFswBvGooFkB76SkN6yQdo17OlmGY9r3m+Dwb5aB5g1H0w/3UNUKP1UF6g+ysK7E
         EfOQ==
X-Gm-Message-State: AOJu0YxLDwFqIO1eaoDCbrvpA7gyku2csG90tjdy00Dpv+CbVBX0J0qg
	28vT/Vu1TJImD6rYHNm6lQgd+/N8agiRA4BQo+mNUIafl6x3krfMnhXVO4kZyg==
X-Gm-Gg: ASbGncuc0vc6F60FxjpF2rH2e/aULXioRYA5HbTxtUBO2b/riEJ5wPKw4548FIIey1M
	obHys+murLuWAHFsdxFMOMYo+8R7HRhqWeJv6cIb6pe2KXNah2/EHCPeLjQ71Dd41wWWH2Xn5th
	wTr75RNxMaOZFQybm2WofhN0QAUEaAEePF9dwIauHZItdd25uXNH0lCfSWIGMnWDMMDRqS80YSL
	zGCiI7EdRxElrQXlTpviktW65jchqfcM6gevvJB6unfiy6VFarqYBxipWJqvCWX8tlSM9Oe3vMf
	a0Z32qOVHLFexn716mxt5g41DaGQ1jfCC6CaaD3JS/dfZ2GZNwOiGgpKLdic1ykYafUEM3zctZT
	qVuehqs+S6nfUZuXwmLh6IykO87/8Jl7BWydU
X-Google-Smtp-Source: AGHT+IFhmZSZx4Ywb0a8sPkfBHESkTu7fIfcdajDPDV5q/89NoI5rC/4wxS1iG4UcNwK5ZMbiK4EQg==
X-Received: by 2002:a05:6512:6095:b0:55c:e752:e9c3 with SMTP id 2adb3069b0e04-55f0cce11ffmr2010149e87.8.1755959009454;
        Sat, 23 Aug 2025 07:23:29 -0700 (PDT)
Message-ID: <b2870d5f-cf54-41f4-9cfe-b83161c157df@gmail.com>
Date: Sat, 23 Aug 2025 17:23:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
To: xen-devel@lists.xenproject.org,
 Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
References: <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <2491bee7441f13a3c1a01fd77ece1749e7276352.1754568795.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <2491bee7441f13a3c1a01fd77ece1749e7276352.1754568795.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.08.25 15:33, Leonid Komarianskyi wrote:

Hello Leonid


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
> ---
>   xen/arch/arm/gic-v3.c                  | 73 ++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/gic.h         | 17 ++++++
>   xen/arch/arm/include/asm/gic_v3_defs.h | 33 ++++++++++++
>   3 files changed, 123 insertions(+)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 8fd78aba44..a0e8ee1a1e 100644
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
> @@ -645,6 +675,40 @@ static void gicv3_set_irq_priority(struct irq_desc *desc,
>       spin_unlock(&gicv3.lock);
>   }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +unsigned int gic_number_espis(void)
> +{
> +    return gic_hw_ops->info->nr_espi;
> +}
> +
> +static void gicv3_dist_espi_common_init(uint32_t type)

missing __init ?

> +{
> +    unsigned int espi_nr;
> +    int i;

please use unsigned int if "i" cannot be negative

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
> +        writel_relaxed(GIC_PRI_IRQ_ALL, GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
> +
> +    for ( i = 0; i < espi_nr; i += 32 )
> +    {
> +        writel_relaxed(0xffffffffU, GICD + GICD_ICENABLERnE + (i / 32) * 4);
> +        writel_relaxed(0xffffffffU, GICD + GICD_ICACTIVERnE + (i / 32) * 4);
> +    }
> +
> +    for ( i = 0; i < espi_nr; i += 32 )
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) * 4);
> +}
> +#endif
> +
>   static void __init gicv3_dist_init(void)
>   {
>       uint32_t type;
> @@ -690,6 +754,10 @@ static void __init gicv3_dist_init(void)
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i += 32 )
>           writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    gicv3_dist_espi_common_init(type);
> +#endif
> +
>       gicv3_dist_wait_for_rwp();
>   
>       /* Turn on the distributor */
> @@ -703,6 +771,11 @@ static void __init gicv3_dist_init(void)
>   
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>           writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i = 0; i < gicv3_info.nr_espi; i++ )
> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8);
> +#endif
>   }
>   
>   static int gicv3_enable_redist(void)


[snip]


