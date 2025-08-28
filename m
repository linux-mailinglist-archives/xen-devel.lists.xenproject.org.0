Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCADDB3AA23
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 20:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099845.1453531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urhWu-0008Re-H9; Thu, 28 Aug 2025 18:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099845.1453531; Thu, 28 Aug 2025 18:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urhWu-0008Pj-E5; Thu, 28 Aug 2025 18:39:24 +0000
Received: by outflank-mailman (input) for mailman id 1099845;
 Thu, 28 Aug 2025 18:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvL0=3I=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urhWt-0008Pd-2h
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 18:39:23 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5000e171-843e-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 20:39:21 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-336ada26e92so6055791fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 11:39:21 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336b48f6cd5sm549401fa.64.2025.08.28.11.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 11:39:20 -0700 (PDT)
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
X-Inumbo-ID: 5000e171-843e-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756406361; x=1757011161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/9SzIXaxMPdactpzzkiUGrr3jeZLH2K9HfiIgjm08s=;
        b=AQ0w/dN8iJ/msAumrwNdQSiOyTJEbZKpKJQoI1Ryvslo6B/idY8dpij8e67Vi2WdiJ
         KN1E7z74whVJWXO3yJ96MlgkBVQ7uhvgI4RAYjcdyJXUnrMk6Oho1CcNg7Mel2SeT874
         wsqBRjNPNQrEaH5TO4+OH0tQeElj1vsEZRngCdjIohrI4zFOIwb4dHitdeWL1KyHec8c
         gAqdEwhSplME6SV4H7rBPI/Q5x5cM2gPBuRS638v7yDStiIpQYaChP7G4t8pNnBNzyWd
         TmEFmhDHvQmUDIoRYbyBcikR1arxtIdDjY1QH+iUcMB+S1sIHCsChXcjJ7M669h6DFgA
         6dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756406361; x=1757011161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/9SzIXaxMPdactpzzkiUGrr3jeZLH2K9HfiIgjm08s=;
        b=KkPzOuMNUJ+wDQ9AIfuaLlwedzA4UGs6XLCYKY8dQ6sYJUnspEkeFxZUvLY5IDDWfv
         49qjO2s5OWQF0TITHceOkh08I5f3tx68zRZANcFWTpuU8/voljUChH3eiFfgjNNJxZuw
         beJi/d82atgvtMdvphztQnyKP5dzPy6nzWay8c0UJgQxgD0XnehainkFmL1s2ucGhnKY
         KaZLyUkagfGQoxLo0MviuWYLFHyGA+FJzWn/LoLmy3XrbMDLqSK/zSeqxR5kpzpUS0jp
         NEnyylhT5AoIO3F6yj1zCjt+G2LCMgvPHa8hF49CT/+QzYdRea0g/C6m34I1XH2L+A2d
         ueWg==
X-Forwarded-Encrypted: i=1; AJvYcCVO5Aq9HYhCWR++M6hlkMlmJ0HeCcYu2imVXG74Esd8X3Ehs+T5uafSLvov3mzzR3hv/ZT7ax+bvzA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4eEMSNlikCP096pPShKmbdtQRoiIAjklz7h53irw9G76FIKU9
	jynzIpY9xbdtMiNJdhirJH4T/BALjkSqcFn2BtgKRm6obyg2ReUPfSxG
X-Gm-Gg: ASbGncuk9jjV0cHNl9j97hFXm5bK8FtTQpYUkmDQ6mj2Wh6P1wBJJpatYOmktYwDoCI
	/bs0xAD5P047QQjFm161qwECDwq78SAtENfmLEoJSgv/venHur929o6f7b6ikJf1iWBBBhInngN
	Za58hZLYvZX0mtSCXCHElhKcGy/8yUkFhtoiKmwPLj2sB4mEGVeAGuTSMvAfvGx3ElJhjoArIqO
	nbDUllPCZynypqc/lVYD+rq+N4CcENjzx8nYqQVmC99MPdju8TD7ya7xsIKIKrUogPiRiX5Bg/4
	LL8R9a+DhaEt1zeaVENz1S+h0hbIhgrQcu3ks7XM9KEGDLpuPh9I4W+YsR5MO0QA6rM5RMcS2xI
	QCbyNe7/ayMS/ETaXoHS0QKTed0sC0N4wcx7d
X-Google-Smtp-Source: AGHT+IGgu4PRV+G01q/WeXVQv5hSm8Lwa9nzOHcyYEEa7ro8Bifgc9pulxRIh15PO23lpipmzhZFdQ==
X-Received: by 2002:a2e:b8cf:0:b0:332:5fc0:24ae with SMTP id 38308e7fff4ca-33650ea1a4bmr53460341fa.15.1756406360628;
        Thu, 28 Aug 2025 11:39:20 -0700 (PDT)
Message-ID: <bd3827bf-1415-40cf-8a3a-a7968f1c1933@gmail.com>
Date: Thu, 28 Aug 2025 21:39:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <a5570863b6884ac115b8dba320c04eea55005d70.1756317702.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <a5570863b6884ac115b8dba320c04eea55005d70.1756317702.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27.08.25 21:24, Leonid Komarianskyi wrote:


Hello Leonid

> Currently, Xen does not support eSPI interrupts, leading
> to a data abort when such interrupts are defined in the DTS.
> 
> This patch introduces a separate array to initialize up to
> 1024 interrupt descriptors in the eSPI range and adds the
> necessary defines and helper function. These changes lay the
> groundwork for future implementation of full eSPI interrupt
> support. As this GICv3.1 feature is not required by all vendors,
> all changes are guarded by ifdefs, depending on the corresponding
> Kconfig option.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> Changes in V4:
> - removed redundant line with 'default n' in Kconfig, as it is disabled
>    by default, without explicit specification
> - added reviewed-by from Volodymyr Babchuk


only NITs below

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

> 
> Changes in V3:
> - introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
>    case of using NR_IRQS for espi_desc array
> - implemented helper functions espi_to_desc and init_espi_data to make
>    it possible to add stubs with the same name, and as a result, reduce
>    the number of #ifdefs
> - disable CONFIG_GICV3_ESPI default value to n
> 
> Changes in V2:
> - use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
> - remove unnecessary comment for nr_irqs initialization
> ---
>   xen/arch/arm/Kconfig           |  8 ++++++
>   xen/arch/arm/include/asm/irq.h | 26 +++++++++++++++++
>   xen/arch/arm/irq.c             | 52 +++++++++++++++++++++++++++++++++-
>   3 files changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 17df147b25..43b05533b1 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -135,6 +135,14 @@ config GICV3
>   	  Driver for the ARM Generic Interrupt Controller v3.
>   	  If unsure, use the default setting.
>   
> +config GICV3_ESPI
> +	bool "Extended SPI range support"
> +	depends on GICV3 && !NEW_VGIC
> +	help
> +	  Allow Xen and domains to use interrupt numbers from the extended SPI
> +	  range, from 4096 to 5119. This feature is introduced in GICv3.1
> +	  architecture.
> +
>   config HAS_ITS
>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>           depends on GICV3 && !NEW_VGIC && !ARM_32
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index 5bc6475eb4..221dbf23a2 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -32,6 +32,15 @@ struct arch_irq_desc {
>   #define SPI_MAX_INTID   1019
>   #define LPI_OFFSET      8192
>   
> +#ifdef CONFIG_GICV3_ESPI
> +#define ESPI_BASE_INTID 4096
> +#define ESPI_MAX_INTID  5119
> +#define NR_ESPI_IRQS    1024
> +
> +#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
> +#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
> +#endif
> +
>   /* LPIs are always numbered starting at 8192, so 0 is a good invalid case. */
>   #define INVALID_LPI     0
>   
> @@ -39,7 +48,15 @@ struct arch_irq_desc {
>   #define INVALID_IRQ     1023
>   
>   extern const unsigned int nr_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * This will also cover the eSPI range, as some critical devices
> + * for booting Xen (e.g., serial) may use this type of interrupts.
> + */
> +#define nr_static_irqs (ESPI_MAX_INTID + 1)
> +#else
>   #define nr_static_irqs NR_IRQS
> +#endif
>   
>   struct irq_desc;
>   struct irqaction;
> @@ -55,6 +72,15 @@ static inline bool is_lpi(unsigned int irq)
>       return irq >= LPI_OFFSET;
>   }
>   
> +static inline bool is_espi(unsigned int irq)
> +{
> +#ifdef CONFIG_GICV3_ESPI
> +    return (irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID);
> +#else
> +    return false;
> +#endif
> +}
> +
>   #define domain_pirq_to_irq(d, pirq) (pirq)
>   
>   bool is_assignable_irq(unsigned int irq);
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index b8eccfc924..adb5e49ea3 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -19,7 +19,11 @@
>   #include <asm/gic.h>
>   #include <asm/vgic.h>
>   
> +#ifdef CONFIG_GICV3_ESPI
> +const unsigned int nr_irqs = ESPI_MAX_INTID + 1;
> +#else
>   const unsigned int nr_irqs = NR_IRQS;
> +#endif
>   
>   static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>   static DEFINE_SPINLOCK(local_irqs_type_lock);
> @@ -46,6 +50,49 @@ void irq_end_none(struct irq_desc *irq)
>   }
>   
>   static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
> +#ifdef CONFIG_GICV3_ESPI
> +static irq_desc_t espi_desc[NR_ESPI_IRQS];

NIT: I would write "TODO: Consider allocating an array dynamically if
there is a need to enable GICV3_ESPI by default". But it is up to you.

> +
> +static struct irq_desc *espi_to_desc(unsigned int irq)
> +{
> +    return &espi_desc[ESPI_INTID2IDX(irq)];
> +}
> +
> +static int __init init_espi_data(void)
> +{
> +    int irq;

NIT: please use unsigned int


> +
> +    for ( irq = ESPI_BASE_INTID; irq <= ESPI_MAX_INTID; irq++ )
> +    {
> +        struct irq_desc *desc = irq_to_desc(irq);
> +        int rc = init_one_irq_desc(desc);
> +
> +        if ( rc )
> +            return rc;
> +
> +        desc->irq = irq;
> +        desc->action  = NULL;
> +    }
> +
> +    return 0;
> +}

[snip]


