Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9818AB3A0C1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 16:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099004.1452921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urdPr-0000hA-Bc; Thu, 28 Aug 2025 14:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099004.1452921; Thu, 28 Aug 2025 14:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urdPr-0000ff-7l; Thu, 28 Aug 2025 14:15:51 +0000
Received: by outflank-mailman (input) for mailman id 1099004;
 Thu, 28 Aug 2025 14:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvL0=3I=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urdPp-0000fZ-V4
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 14:15:49 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f1af208-8419-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 16:15:49 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-55f4cf36c00so1046215e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 07:15:49 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35bffaa6sm3325030e87.32.2025.08.28.07.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 07:15:47 -0700 (PDT)
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
X-Inumbo-ID: 7f1af208-8419-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756390548; x=1756995348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yn7QQsyNuU8SddtSSajSgw4g05yv92+Y7Z5YpM/sUsY=;
        b=RQTF1wLLEEfRKHsg98Z+DUY/rTgrAlQkyUv6yij20v115MULlYTgxTJrjke7C5yhZD
         3QFgGkpER92V0ZWd/E0FXo5nN71bYLZBKCf4tpiw3VAhe7i8v5E5wgeR8HFHaW9s/Y2a
         7L+21thCsK3MXC/90yKijI3Kunf2VGY3ggwZeqKqRolEQrR7zhMxW5noe5YRvWwkMBsK
         JFyzi1U9WlVG+xwSuu1QmGirIy9qyxPVRlv8aJ9rWgDXxnPZGKB/mKHYhfxtzBzk7yFK
         FGs6GbVey5pc+Yj4cmGKV8Hnn4Hu14qnWQvBmdqOuTJTqX7FWCfrG3lymIX3dxTAJP7q
         VcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756390548; x=1756995348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yn7QQsyNuU8SddtSSajSgw4g05yv92+Y7Z5YpM/sUsY=;
        b=OxFYRY9WzW+GlJZFppIoCTWxSYm+kfQjLWf136O4tuePXC8uaCZFIDMox0bM7gA9vy
         /rS2BW4uHF/qEolIGmJHflVK6iGeXKKWJj1yTF7VjYwuIlpdLr/WzCp5Dfo0D8jf+qJS
         5Gse65rrCTiyXmnu9Z7MUmeQwU37nwnBJXL0s9PTGvai/nWGqgEavtMvsVM6I3OGkhGB
         ffL80zbrScWVuLic0zXMlZn804vC6c2VFN7rF1VTf+GQlL4zh8Z2xqKP1S7OnCNT53de
         GJro5ua2W7gifQZS9Ke+0vkjkBouj4KihK23o/3ctXlA7lM1mQtNQH6CPnTbt5hMCldw
         JCRg==
X-Forwarded-Encrypted: i=1; AJvYcCW3hUpI4s2nLRJhoJ+VEvOTlUMwBZzvv+z8fkOkE6W8qG7n9NITFjJI0oVohIOzV+klmBi+Kmeur3E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwShsYRUgnJr2CR+NxlwTu+LZJ2EcZGWJPvS5TyGwN9xAxSqXh8
	MSuHNqFh21AImvcLfMsupT/WGQWCkZ+Zvw5G1gG3V9VYcQM+aG60VI6woCe6tA==
X-Gm-Gg: ASbGncu+uIpucOUooTEpYcy4QfHV2Z9hQ1k06RHVkFZmy2mNcRu8ENDc0bBQXWdGdtq
	kjSzRkfPf9RaTPw+EhBwsK6ioKuq4XJGwP4Zsgd7LPM7VYbuDekCibG8xghvRmuCYvfgOvQHqQJ
	dIUmRXUPIjKEff+Yuhgsialbh9+vU1C3PVfimJNi79vHhgzPngo9U5HLr+n47DUAUFuuC6RPYCz
	DboDoN+zcGPpx2GrgDRs80SZ51p/5AQg6zAmqbUlhjcpS+N5Z7Q/nmsE11pWLZk7cO8cmQbad6l
	5aahWcqpZa8tptXHBeUR2bVZIYRJcJKdauKgXWDMY7Mk/KqZ8kjNkrEf5GTQ1n98x91uaE5xNnV
	6aSKNVadhxI2y4XUFEXxjaOJxaA==
X-Google-Smtp-Source: AGHT+IEovbtRTjKgHTnCtsVwKqkJLut7pLL06xZzEMnbw18UYeV2Zh8/16RgpFQUV5Jy5bJm0DTpaA==
X-Received: by 2002:a05:6512:4403:b0:55f:4d51:7ee8 with SMTP id 2adb3069b0e04-55f4d518088mr3210990e87.38.1756390547624;
        Thu, 28 Aug 2025 07:15:47 -0700 (PDT)
Message-ID: <a759fb03-002a-4de4-993e-ad7a7f86017a@gmail.com>
Date: Thu, 28 Aug 2025 17:15:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <864522724dd6058952cad8b505b0589750b7f8d7.1756317702.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <864522724dd6058952cad8b505b0589750b7f8d7.1756317702.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27.08.25 21:24, Leonid Komarianskyi wrote:

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
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> Changes in V4:
> - added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
>    for vGIC emulation
> - added a log banner with eSPI information, similar to the one for
>    regular SPI
> - added newline after ifdef and before gic_is_valid_line
> - added reviewed-by from Volodymyr Babchuk

only NITs below

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

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
> 
> Changes for V4:
> 
> Changes in V4:
> - added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
>    for vGIC emulation
> - added newline after ifdef and before gic_is_valid_line
> - added reviewed-by from Volodymyr Babchuk
> - added a log banner with eSPI information, similar to the one for
>    regular SPI
> ---
>   xen/arch/arm/gic-v3.c                  | 82 ++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/gic.h         | 22 +++++++
>   xen/arch/arm/include/asm/gic_v3_defs.h | 38 ++++++++++++
>   3 files changed, 142 insertions(+)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index a959fefebe..b939a1f490 100644
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

NIT: I have heard that no uN for new code, but uintN_t (sorry for didn't 
spot this before), so I would use uint32_t


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
> @@ -655,6 +685,54 @@ static void gicv3_set_irq_priority(struct irq_desc *desc,
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
> +    printk("GICv3: %d eSPI lines\n", gicv3_info.nr_espi);
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

NIT: From what I see, the eSPIs are configured exactly as regular SPIs 
in gicv3_dist_init() (i.e. the eSPIs are level-triggered, disabled and 
deactivated, belong to the same group, etc). In gicv3_dist_init() we 
have comments clarying the actions, but here we do not. I would at least 
write a sentence in patch description/in-code comment saying that eSPIs 
configuration is the same as for regular SPIs.


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
> @@ -700,6 +778,8 @@ static void __init gicv3_dist_init(void)
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i += 32 )
>           writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
>   
> +    gicv3_dist_espi_common_init(type);
> +
>       gicv3_dist_wait_for_rwp();
>   
>       /* Turn on the distributor */
> @@ -713,6 +793,8 @@ static void __init gicv3_dist_init(void)
>   
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>           writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
> +
> +    gicv3_dist_espi_init_aff(affinity);
>   }
>   
>   static int gicv3_enable_redist(void)


[snip]


