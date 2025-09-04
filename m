Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5965FB43F07
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 16:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110379.1459615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuB5S-0002Gi-IG; Thu, 04 Sep 2025 14:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110379.1459615; Thu, 04 Sep 2025 14:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuB5S-0002Dy-Fa; Thu, 04 Sep 2025 14:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1110379;
 Thu, 04 Sep 2025 14:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJB8=3P=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uuB5R-0002Ds-HV
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 14:37:17 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6869c4d-899c-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 16:37:15 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3dcce361897so764078f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 07:37:15 -0700 (PDT)
Received: from [10.17.76.214] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d7ac825b88sm14982660f8f.7.2025.09.04.07.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 07:37:13 -0700 (PDT)
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
X-Inumbo-ID: a6869c4d-899c-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756996634; x=1757601434; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJCwKFoMwnJG5hneaGZsfWFqvLmvoxOanH68IbCRnyc=;
        b=m+G4WRzCJ/oHalyEGgtY8q9wZBm3BkebdrDMIiVduhLfMrre7221CN98pkkrOF6iMJ
         hvIN5xvflhqiPguf37KSOPW75JxGxi/p6PnTk0+4MtYHEwcKxJVUAkIOSfSiag74FfCj
         L4pv/e48Q3cRGgXAvjYcWSk/Dfr/fA3BJFfstNhHBdnktyXQPjHqpPhaq4FVYaz2nEYH
         9B8XmUd9jZBAgHFVa3AEUxzoeIiXBp18cvxQcn5Hj0ByyO7/KwSOmk91VzSBAKuDqaAb
         gbLKFdjJ0TMQCPqGgZJazGUyo4c7glAYfvdlGZ9gOi9xi0AFtD4lYfpmQo/N9Gg23e12
         tB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996634; x=1757601434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJCwKFoMwnJG5hneaGZsfWFqvLmvoxOanH68IbCRnyc=;
        b=jeQVdfZ6qFMt6rOJGpHSD6DVuhpPl+hyGgqy29btPxKTC5Ku1HaJxEZwa/zrvD18n1
         b/nq6U2dnDCVGlyx768m1pbNa+abiGgqQ50SlnkEHYPr6T4jbxgPSa2juTFvCFfGXOYe
         dN1sugozy6EYf+Z4KonbQRZv3+lhKL7LApKcMpgPidhOroADlEo+Z3MK6B6hfboBXcIZ
         holvbZ0He2dn3UQbYr5TtpzCxookmGkN4dBhUgPUS8/GuzZmDCVs67kM8+fYmKA/xOoO
         sJe2jOng/Gl8Hnj27IQQ64KAKQoE7/rv5s8w5fgMFJFMThaFnG60AybauySS2/f0Odfn
         wq0g==
X-Forwarded-Encrypted: i=1; AJvYcCVTmrXt/vL0JoC0MF/MCbeLobBRssB0LYOkGQ1ZbysDl/zqqzujAmzeSRyxvH/7Pp0qH+EEmKAjHYM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcJzYSUbSB8wSupXhdTHPjRoc0/Vxc13R7I/ZlCvtLpmBHUzPz
	cWjM2RN+VmNmY48tl/nH5sxbgtbbXsA1pkfDYVf+IT7XhDX34KDUfI44
X-Gm-Gg: ASbGncsBMNjN46JJkGcWLRiH5UXT8042xaSnK+mdvnI+Pi+GyR1TLhFkcsT7m8uE1vI
	uisCrnPTOGhGfpgDau5m+Itw+aZj/2UNClqp+bJoihL+kaocAAVGFT7xdCKWVsO2P/ZzUP4AlWx
	PzreGZsbXiIi/gmkWNWX2gasWtVZPROay1F98/3BsRtMSZJJdm6Pz0EFy1wEIoZR4uJqFBem///
	FxaA3KWv9+zX+H+PyYqv5vbStNC6uhzoVhVzWTLSXTL5v4cg0JUlduy9KmdtLi+WkWdOvcGKfja
	3Qw/Kk/ODcN/GuJkrwndKYBJC+KA7fLm8p4azTk9g7EfSoS2CKL3xkMGwLzi5xdjqczoHkmpaVJ
	4BUDcG6cR31t1mWg28C9yQaBOt5+hxHyugYURun8HJ12foYDsc/D38Xq3XmOk1EFgOQ==
X-Google-Smtp-Source: AGHT+IGP9XYswsF0kuWSHdZ+9DWYj1MiK//7idoUn9FVRQaIP7QA+oT1aQxbrNKYtzFm7sM4dh395g==
X-Received: by 2002:a05:6000:2381:b0:3d7:cd09:ae1e with SMTP id ffacd0b85a97d-3d7cd09b425mr9764805f8f.17.1756996634259;
        Thu, 04 Sep 2025 07:37:14 -0700 (PDT)
Message-ID: <b25eb195-a0fb-44aa-a0f7-aca7d4d0d076@gmail.com>
Date: Thu, 4 Sep 2025 17:37:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
 <e8433c8b860c4b8512a57432c61f55dfe629ed07.1756908472.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <e8433c8b860c4b8512a57432c61f55dfe629ed07.1756908472.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.09.25 17:30, Leonid Komarianskyi wrote:

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
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> ---
> Changes in V6:
> - removed unnecessary parentheses in gic_is_valid_espi()
> - updated gic_is_valid_line(): it now verifies the condition irq <
>    gic_number_lines() first, as it is more likely that the irq number
>    will be from the non-eSPI range
> - minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
>    into appropriate inline functions introduced in the previous patch
> - added reviewed-by from Oleksandr Tyshchenko
> 
> Changes in V5:
> - fixed minor nits, no functional changes: changed u32 to uint32_t and
>    added a comment noting that the configuration for eSPIs is the same as
>    for regular SPIs
> - removed ifdefs for eSPI-specific offsets to reduce the number of
>    ifdefs and code duplication in further changes
> - removed reviewed-by as moving offset from ifdefs requires additional
>    confirmation from reviewers
> 
> Changes in V4:
> - added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
>    for vGIC emulation
> - added a log banner with eSPI information, similar to the one for
>    regular SPI
> - added newline after ifdef and before gic_is_valid_line
> - added reviewed-by from Volodymyr Babchuk
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
> 
> Changes in V2:
> - move gic_number_espis function from
>    [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
>    to use it in the newly introduced gic_is_valid_espi
> - add gic_is_valid_espi which checks if IRQ number is in supported
>    by HW eSPI range
> - update gic_is_valid_irq conditions to allow operations with eSPIs
> ---
>   xen/arch/arm/gic-v3.c                  | 83 ++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/gic.h         | 21 ++++++-
>   xen/arch/arm/include/asm/gic_v3_defs.h | 38 ++++++++++++
>   3 files changed, 141 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index a1e302fea2..a69263e461 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_desc *irqd, uint32_t offset)
>           default:
>               break;
>           }
> +#ifdef CONFIG_GICV3_ESPI
> +    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
> +    {
> +        uint32_t irq_index = espi_intid_to_idx(irqd->irq);
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
> @@ -655,6 +685,55 @@ static void gicv3_set_irq_priority(struct irq_desc *desc,
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


Sorry, I have just noticed one thing, and gicv3_cpu_init() probably 
would be a more correct place to write about it, but since you don't 
modify that function (it is not visible in the context), so writing here:

 From "Arm IHI 0069H.b (ID041224)"
10.1.2 GICv3.1 extended INTID range support

Note
Arm recommends that Armv8-R AArch64 PEs report ICC_CTLR_EL1.ExtRange==1, 
indicating that the GICv3.1 extended SPI and PPI ranges are supported.

Linux driver has an extra check for that:

  WARN((gic_data.ppi_nr > 16 || GIC_ESPI_NR != 0) &&
  !(gic_read_ctlr() & ICC_CTLR_EL1_ExtRange),
  "Distributor has extended ranges, but CPU%d doesn't\n",
  smp_processor_id());

added by the following commit:
irqchip/gic-v3: Warn about inconsistent implementations of extended ranges
https://github.com/torvalds/linux/commit/ad5a78d3da81836c88d1f2d53310484462660997


What is your opinion, is it worth having a similar check in Xen?


> +    /* The GIC HW doesn't support eSPI, so we can leave from here */
> +    if ( gicv3_info.nr_espi == 0 )
> +        return;
> +
> +    printk("GICv3: %d eSPI lines\n", gicv3_info.nr_espi);
> +


[snip]


