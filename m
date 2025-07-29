Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA4B14EBE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062724.1428457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkiT-0001PO-G8; Tue, 29 Jul 2025 13:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062724.1428457; Tue, 29 Jul 2025 13:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkiT-0001Mi-Cu; Tue, 29 Jul 2025 13:50:05 +0000
Received: by outflank-mailman (input) for mailman id 1062724;
 Tue, 29 Jul 2025 13:50:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ugkiR-000107-Fh
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 13:50:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ugkiQ-007URA-2z;
 Tue, 29 Jul 2025 13:50:02 +0000
Received: from [15.248.3.91] (helo=[10.24.66.55])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ugkiQ-00Fqd4-2N;
 Tue, 29 Jul 2025 13:50:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=uqNn66Bj1N/NA6ENcA6UsZiIAAf35VwzOOw4WoH5kHE=; b=OgLqY+LIs4WAjazjdOlwMpuGn2
	BEA+RSpGg6srgpfwhsBsmHGkxZSkTKFYkwHXQ8CqIGYXtflLU1eHY7IqcA3w5EojoNOYfyHWWrdN9
	mSq1k882rZrrEbpXoOpBSFeq/rcvHCUr1HzUHN5agxoFrPJPnpI7x2CWILmDlGhRmT6Y=;
Message-ID: <67077c79-e8b0-496a-89da-ba18390443f2@xen.org>
Date: Tue, 29 Jul 2025 14:50:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
 <fde45aa6de09e955aee54ca38d7d0e994ce7f6b3.1753367178.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fde45aa6de09e955aee54ca38d7d0e994ce7f6b3.1753367178.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 24/07/2025 15:57, Leonid Komarianskyi wrote:
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
> ---
>   xen/arch/arm/Kconfig           |  9 +++++++++
>   xen/arch/arm/include/asm/irq.h | 25 +++++++++++++++++++++++++
>   xen/arch/arm/irq.c             | 30 ++++++++++++++++++++++++++++++
>   3 files changed, 64 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 17df147b25..08073ece1f 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -135,6 +135,15 @@ config GICV3
>   	  Driver for the ARM Generic Interrupt Controller v3.
>   	  If unsure, use the default setting.
>   
> +config GICV3_ESPI
> +	bool "Extended SPI range support"
> +	depends on GICV3 && !NEW_VGIC
> +	default y
> +	help
> +	  Allow Xen and domains to use interrupt numbers from the extended SPI
> +	  range, from 4096 to 5119. This feature is introduced in GICv3.1
> +	  architecture.
> +
>   config HAS_ITS
>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>           depends on GICV3 && !NEW_VGIC && !ARM_32
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index 5bc6475eb4..d621f17f10 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -32,6 +32,14 @@ struct arch_irq_desc {
>   #define SPI_MAX_INTID   1019
>   #define LPI_OFFSET      8192
>   
> +#ifdef CONFIG_GICV3_ESPI
> +#define ESPI_BASE_INTID 4096
> +#define ESPI_MAX_INTID  5119
> +
> +#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
> +#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
> +#endif
> +
>   /* LPIs are always numbered starting at 8192, so 0 is a good invalid case. */
>   #define INVALID_LPI     0
>   
> @@ -39,7 +47,15 @@ struct arch_irq_desc {
>   #define INVALID_IRQ     1023
>   
>   extern const unsigned int nr_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * This will also cover the eSPI range, as some critical devices
> + * for booting Xen (e.g., serial) may use this type of interrupts.
> + */
> +#define nr_static_irqs (ESPI_BASE_INTID + NR_IRQS)
> +#else
>   #define nr_static_irqs NR_IRQS
> +#endif

This seems a bit odd. NR_IRQS is supposed to indicate the last SPIs ID. 
This sort of works because in both case we have 1024. But this is really 
fragile. So I thin nr_irqs needs to be set to ESPI_MAX_INTID.

Same ...
>   
>   struct irq_desc;
>   struct irqaction;
> @@ -55,6 +71,15 @@ static inline bool is_lpi(unsigned int irq)
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
> index 03fbb90c6c..3f68257fde 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -19,7 +19,15 @@
>   #include <asm/gic.h>
>   #include <asm/vgic.h>
>   
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * To operate with IRQs in the eSPI range (4096-5119),
> + * we need to add the eSPI base interrupt ID.
> + */
 > +const unsigned int nr_irqs = ESPI_BASE_INTID + NR_IRQS;


... here.

> +#else>   const unsigned int nr_irqs = NR_IRQS;
> +#endif
>   
>   static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>   static DEFINE_SPINLOCK(local_irqs_type_lock);
> @@ -46,6 +54,9 @@ void irq_end_none(struct irq_desc *irq)
>   }
>   
>   static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
> +#ifdef CONFIG_GICV3_ESPI
> +static irq_desc_t espi_desc[NR_IRQS];
> +#endif

Why do we have to introduce a new array? Can't we use irq_desc?
>   static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
>   
>   struct irq_desc *__irq_to_desc(unsigned int irq)
> @@ -53,6 +64,11 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
>       if ( irq < NR_LOCAL_IRQS )
>           return &this_cpu(local_irq_desc)[irq];
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( is_espi(irq) )
> +        return &espi_desc[ESPI_INTID2IDX(irq)];
> +#endif
> +
>       return &irq_desc[irq-NR_LOCAL_IRQS];
>   }
>   
> @@ -79,6 +95,20 @@ static int __init init_irq_data(void)
>           desc->action  = NULL;
>       }
>   
> +#ifdef CONFIG_GICV3_ESPI
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
> +#endif
> +
>       return 0;
>   }
>   

Cheers,

-- 
Julien Grall


