Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D1CB3EBF6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 18:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105189.1456143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut77o-0006YY-H2; Mon, 01 Sep 2025 16:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105189.1456143; Mon, 01 Sep 2025 16:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut77o-0006VQ-Dx; Mon, 01 Sep 2025 16:11:20 +0000
Received: by outflank-mailman (input) for mailman id 1105189;
 Mon, 01 Sep 2025 16:11:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ut77n-0006VK-2K
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 16:11:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ut77m-001Etf-0g;
 Mon, 01 Sep 2025 16:11:18 +0000
Received: from [2a02:8012:3a1:0:e5e9:9db0:73a2:cd65]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ut77m-00C2kZ-0h;
 Mon, 01 Sep 2025 16:11:18 +0000
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
	bh=O+uwXkWmJIqFCYhYk0EbVwGCQFr0La7xSx8HvhWQliI=; b=WFk02pcSrGWctjTxspPH/zgIF0
	28om3MKX0+9oj051PDvkRCfG5E2s57FAmYojFxlxlIWTKmyVnb9oxroOkinUtQrbAsMyUostUNngh
	Cha6wTTquG82l7PODzu+DeXzEso5ImLb0oR7AFDxbGP8XzbPIaM8v3OJwcfHJo5oSgJI=;
Message-ID: <2e91a95a-3109-46ae-b796-1a1c50a9ac2d@xen.org>
Date: Mon, 1 Sep 2025 17:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <e0f76a1533332cef68bfaacbdf57fd05f27764a6.1756481577.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e0f76a1533332cef68bfaacbdf57fd05f27764a6.1756481577.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 29/08/2025 17:06, Leonid Komarianskyi wrote:
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
> 
> ---
> Changes in V5:
> - no functional changes introduced by this version compared with V4, only
>    minor fixes and removal of ifdefs for macroses
> - added TODO comment, suggested by Oleksandr Tyshchenko
> - changed int to unsigned int for irqs
> - removed ifdefs for eSPI-specific defines and macros to reduce the
>    number of ifdefs and code duplication in further changes
> - removed reviewed-by as moving defines from ifdefs requires additional
>    confirmation from reviewers
> 
> Changes in V4:
> - removed redundant line with 'default n' in Kconfig, as it is disabled
>    by default, without explicit specification
> - added reviewed-by from Volodymyr Babchuk
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
>   xen/arch/arm/Kconfig           |  8 +++++
>   xen/arch/arm/include/asm/irq.h | 24 +++++++++++++++
>   xen/arch/arm/irq.c             | 56 +++++++++++++++++++++++++++++++++-
>   3 files changed, 87 insertions(+), 1 deletion(-)
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
> index 5bc6475eb4..4443799648 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -32,6 +32,13 @@ struct arch_irq_desc {
>   #define SPI_MAX_INTID   1019
>   #define LPI_OFFSET      8192
>   
> +#define ESPI_BASE_INTID 4096
> +#define ESPI_MAX_INTID  5119
> +#define NR_ESPI_IRQS    1024
> +
> +#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
> +#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)

NIT: I would consider adding sanity check (i.e. ASSERT()) to confirm 
that both ``intid`` and ``idx`` are within the bounds.

> +
>   /* LPIs are always numbered starting at 8192, so 0 is a good invalid case. */
>   #define INVALID_LPI     0
>   
> @@ -39,7 +46,15 @@ struct arch_irq_desc {
>   #define INVALID_IRQ     1023
>   
>   extern const unsigned int nr_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * This will also cover the eSPI range, as some critical devices
> + * for booting Xen (e.g., serial) may use this type of interrupts.
> + */

Reading this again, I still don't quite understand why we are mentioning 
Xen devices. Looking at the code, for Arm, we only seem to use 
nr_static_irqs to configure nr_pirqs and XSM. Both are ony used by domains.

So I think this needs to be clarified.

> +#define nr_static_irqs (ESPI_MAX_INTID + 1)
> +#else
>   #define nr_static_irqs NR_IRQS
> +#endif
>   
>   struct irq_desc;
>   struct irqaction;
> @@ -55,6 +70,15 @@ static inline bool is_lpi(unsigned int irq)
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
> index b8eccfc924..61c915c3f9 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -19,7 +19,11 @@
>   #include <asm/gic.h>
>   #incl#ude <asm/vgic.h>
>   
> +#ifdef CONFIG_GICV3_ESPI
> +const unsigned int nr_irqs = ESPI_MAX_INTID + 1;
> +#else
>   const unsigned int nr_irqs = NR_IRQS;
> +#endif

NIT: I think you can use:

const unsigned int nr_irqs = IS_ENABLED(CONFIG_GICV3_ESPI)? 
(ESPI_MAX_INTID + 1) : NR_IRQS;

That said, I think we need to rethink about the use of nr_irqs and 
nr_static_irqs because they don't entirely make sense for Arm as we 
don't support PIRQs.

I would at least try to get rid of one of the variable (maybe nr_irqs) 
if not both.

This could be done as a follow-up.

>   
>   static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>   static DEFINE_SPINLOCK(local_irqs_type_lock);
> @@ -46,6 +50,53 @@ void irq_end_none(struct irq_desc *irq)
>   }
>   
>   static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * TODO: Consider allocating an array dynamically if
> + * there is a need to enable GICV3_ESPI by default.
> + */

I know this was suggested by Oleksandr, however most likely distro will 
want to enable this feature so they can be booted on a wide range of 
platform. So I think "if there is a need to enable GICV3_ESPI by 
default" should be removed.

 > +static irq_desc_t espi_desc[NR_ESPI_IRQS];> +
> +static struct irq_desc *espi_to_desc(unsigned int irq)
> +{
> +    return &espi_desc[ESPI_INTID2IDX(irq)];
> +}
> +
> +static int __init init_espi_data(void)
> +{
> +    unsigned int irq;
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
> +#else
> +/*
> + * This function is stub and will not be called if CONFIG_GICV3_ESPI=n,
> + * because in this case, is_espi will always return false.
> + */

Is this is not mean to be called, then can we only define the prototype 
like we do for __bad_atomic_read()?

> +static struct irq_desc *espi_to_desc(unsigned int irq)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NULL;
> +}
> +
> +static int __init init_espi_data(void)
> +{
> +    return 0;
> +}
> +#endif
> +
>   static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
>   
>   struct irq_desc *__irq_to_desc(unsigned int irq)
> @@ -53,6 +104,9 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
>       if ( irq < NR_LOCAL_IRQS )
>           return &this_cpu(local_irq_desc)[irq];
>   
> +    if ( is_espi(irq) )
> +        return espi_to_desc(irq);
> +
>       return &irq_desc[irq-NR_LOCAL_IRQS];
>   }
>   
> @@ -79,7 +133,7 @@ static int __init init_irq_data(void)
>           desc->action  = NULL;
>       }
>   
> -    return 0;
> +    return init_espi_data();
>   }
>   
>   static int init_local_irq_data(unsigned int cpu)

Cheers,

-- 
Julien Grall


