Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BD8B4064E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 16:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106612.1457260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRlq-0002xD-Q3; Tue, 02 Sep 2025 14:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106612.1457260; Tue, 02 Sep 2025 14:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRlq-0002uk-NH; Tue, 02 Sep 2025 14:14:02 +0000
Received: by outflank-mailman (input) for mailman id 1106612;
 Tue, 02 Sep 2025 14:14:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utRlp-0002uc-WE
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 14:14:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utRlp-002v4P-0f;
 Tue, 02 Sep 2025 14:14:01 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utRlp-00DA8y-09;
 Tue, 02 Sep 2025 14:14:01 +0000
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
	bh=5tu1LSOY3Kbt+gnMyCgXBKFFcZLyu+GvOiHMhJ+s2yE=; b=Q7SK1AceDogFOgSVo6yHyGcD2x
	/hAa/CO+hkLUCPWRFXOSIaZAn5WyT4iodRWW9rQdQuoyP/u6Y2gLor1lckdCalCLlWxCeb1HDVhkV
	vcOxFcvryLX4trk0e/MDIQYGjheaW7eHnoa4MrDzEDc4F2FWWV5iVfhNssvzcO8QZSB4=;
Message-ID: <49e321c0-d23f-48f0-a979-add2a6bccb50@xen.org>
Date: Tue, 2 Sep 2025 15:13:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <4b13dea924eabf1370d3f31030f3eef48371de06.1756481577.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4b13dea924eabf1370d3f31030f3eef48371de06.1756481577.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 29/08/2025 17:06, Leonid Komarianskyi wrote:
> This change introduces resource management in the VGIC to handle
> extended SPIs introduced in GICv3.1. The pending_irqs and
> allocated_irqs arrays are resized to support the required
> number of eSPIs, based on what is supported by the hardware and
> requested by the guest. A new field, ext_shared_irqs, is added
> to the VGIC structure to store information about eSPIs, similar
> to how shared_irqs is used for regular SPIs.
> 
> Since the eSPI range starts at INTID 4096 and INTIDs between 1025
> and 4095 are reserved, helper macros are introduced to simplify the
> transformation of indices and to enable easier access to eSPI-specific
> resources. These changes prepare the VGIC for processing eSPIs as
> required by future functionality.
> 
> The initialization and deinitialization paths for vgic have been updated
> to allocate and free these resources appropriately. Additionally,
> updated handling of INTIDs greater than 1024, passed from the toolstack
> during domain creation, and verification logic ensures only valid SPI or
> eSPI INTIDs are used.
> 
> The existing SPI behavior remains unaffected when guests do not request
> eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
> option is disabled.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> 
> ---
> Changes in V5:
> - removed the has_espi field because it can be determined by checking
>    whether domain->arch.vgic.nr_espis is zero or not
> - since vgic_ext_rank_offset is not used in this patch, it has been
>    moved to the appropriate patch in the patch series, which implements
>    vgic eSPI registers emulation and requires this function
> - removed ifdefs for eSPI-specific macros to reduce the number of ifdefs
>    and code duplication in further changes
> - fixed minor nit: used %pd for printing domain with its ID
> 
> Changes in V4:
> - added has_espi field to simplify determining whether a domain is able
>    to operate with eSPI
> - fixed formatting issues and misspellings
> 
> Changes in V3:
> - fixed formatting for lines with more than 80 symbols
> - introduced helper functions to be able to use stubs in case of
>    CONFIG_GICV3_ESPI disabled, and as a result, reduce the number of
>    #ifdefs
> - fixed checks for nr_spis in domain_vgic_init
> - updated comment about nr_spis adjustments with dom0less mention
> - moved comment with additional explanations before checks
> - used unsigned int for indexes since they cannot be negative
> - removed unnecessary parentheses
> - move vgic_ext_rank_offset to the below ifdef guard, to reduce the
>    number of ifdefs
> 
> Changes in V2:
> - change is_espi_rank to is_valid_espi_rank to verify whether the array
>    element ext_shared_irqs exists. The previous version, is_espi_rank,
>    only checked if the rank index was less than the maximum possible eSPI
>    rank index, but this could potentially result in accessing a
>    non-existing array element. To address this, is_valid_espi_rank was
>    introduced, which ensures that the required eSPI rank exists
> - move gic_number_espis to
>    xen/arm: gicv3: implement handling of GICv3.1 eSPI
> - update vgic_is_valid_irq checks to allow operating with eSPIs
> - remove redundant newline in vgic_allocate_virq
> ---
>   xen/arch/arm/include/asm/vgic.h |  12 ++
>   xen/arch/arm/vgic.c             | 199 +++++++++++++++++++++++++++++++-
>   2 files changed, 208 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 3e7cbbb196..912d5b7694 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -146,6 +146,10 @@ struct vgic_dist {
>       int nr_spis; /* Number of SPIs */
>       unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
>       struct vgic_irq_rank *shared_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +    struct vgic_irq_rank *ext_shared_irqs;
> +    int nr_espis; /* Number of extended SPIs */

For new code, we prefer using "unsigned int" when the value is meant to 
be >= 0.

> +#endif
>       /*
>        * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
>        * struct arch_vcpu.
> @@ -243,6 +247,14 @@ struct vgic_ops {
>   /* Number of ranks of interrupt registers for a domain */
>   #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
>   
> +#ifdef CONFIG_GICV3_ESPI
> +#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis+31)/32)
> +#endif
> +#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
> +#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
> +#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
> +#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)

For the 6 lines above, please add space before and after the operators.

> +
>   #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>   #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
>   
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 2bbf4d99aa..c9b9528c66 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -27,9 +27,82 @@
>   
>   bool vgic_is_valid_line(struct domain *d, unsigned int virq)
>   {
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( virq >= ESPI_BASE_INTID &&
> +         virq < ESPI_IDX2INTID(d->arch.vgic.nr_espis) )
> +        return true;
> +#endif
> +
>       return virq < vgic_num_irqs(d);
>   }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * Since eSPI indexes start from 4096 and numbers from 1024 to
> + * 4095 are forbidden, we need to check both lower and upper
> + * limits for ranks.
> + */
> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
> +{
> +    return rank >= EXT_RANK_MIN &&
> +           EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d);
> +}
> +
> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> +                                                       unsigned int rank)
> +{
> +    return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
> +}
> +
> +static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int virq)
> +{
> +    return !test_and_set_bit(ESPI_INTID2IDX(virq) + vgic_num_irqs(d),
> +                             d->arch.vgic.allocated_irqs);
> +}
> +
> +static void arch_move_espis(struct vcpu *v)
> +{
> +    const cpumask_t *cpu_mask = cpumask_of(v->processor);
> +    struct domain *d = v->domain;
> +    struct pending_irq *p;
> +    struct vcpu *v_target;

cpu_mask, p and v_target only seems to be used within the loop. If 
that's correct, then please move the definition within the loop.

> +    unsigned int i;
> +
> +    for ( i = ESPI_BASE_INTID;
> +          i < EXT_RANK_IDX2NUM(d->arch.vgic.nr_espis); i++ )
> +    {
> +        v_target = vgic_get_target_vcpu(v, i);
> +        p = irq_to_pending(v_target, i);
> +
> +        if ( v_target == v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
> +            irq_set_affinity(p->desc, cpu_mask);
> +    }
> +}
> +#else
> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
> +{
> +    return false;
> +}
> +
> +/*
> + * This function is stub and will not be called if CONFIG_GICV3_ESPI=n,
> + * because in this case, is_valid_espi_rank will always return false.
> + */
> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> +                                                       unsigned int rank)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NULL;
> +}
> +
> +static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int virq)
> +{
> +    return false;
> +}
> +
> +static void arch_move_espis(struct vcpu *v) { }
> +#endif
> +
>   static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>                                                     unsigned int rank)
>   {
> @@ -37,6 +110,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>           return v->arch.vgic.private_irqs;
>       else if ( rank <= DOMAIN_NR_RANKS(v->domain) )
>           return &v->domain->arch.vgic.shared_irqs[rank - 1];
> +    else if ( is_valid_espi_rank(v->domain, rank) )
> +        return vgic_get_espi_rank(v, rank);
>       else
>           return NULL;
>   }
> @@ -117,6 +192,62 @@ int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
>       return 0;
>   }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +static unsigned int vgic_num_spi_lines(struct domain *d)
> +{
> +    return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
> +}
> +
> +static int init_vgic_espi(struct domain *d)
> +{
> +    unsigned int i, idx;
> +
> +    if ( d->arch.vgic.nr_espis == 0 )
> +        return 0;
> +
> +    d->arch.vgic.ext_shared_irqs =
> +        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
> +    if ( d->arch.vgic.ext_shared_irqs == NULL )
> +        return -ENOMEM;
> +
> +    for ( i = d->arch.vgic.nr_spis, idx = 0;
> +          i < vgic_num_spi_lines(d); i++, idx++ )
> +        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
> +                              ESPI_IDX2INTID(idx));
> +
> +    for ( i = 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
> +        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);
> +
> +    return 0;
> +}
> +
> +struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
> +{
> +    irq = ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
> +    return &d->arch.vgic.pending_irqs[irq];
> +}
> +#else
> +static unsigned int init_vgic_espi(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static unsigned int vgic_num_spi_lines(struct domain *d)
> +{
> +    return d->arch.vgic.nr_spis;
> +}
> +
> +struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
> +{
> +    return NULL;
> +}
> +#endif
> +
> +static unsigned int vgic_num_alloc_irqs(struct domain *d)
> +{
> +    return vgic_num_spi_lines(d) + NR_LOCAL_IRQS;
> +}
> +
>   int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>   {
>       int i;
> @@ -131,6 +262,36 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>        */
>       nr_spis = ROUNDUP(nr_spis, 32);
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    /*
> +     * During domain creation, the dom0less DomUs code or toolstack specifies
> +     * the maximum INTID, which is defined in the domain config subtracted by
> +     * 32 to cover the local IRQs (please see the comment to VGIC_DEF_NR_SPIS).
> +     * To compute the actual number of eSPI that will be usable for,
> +     * add back 32.
> +     */
> +    if ( nr_spis + 32 > ESPI_IDX2INTID(NR_ESPI_IRQS) )
> +        return -EINVAL;
> +
> +    if ( nr_spis + 32 >= ESPI_BASE_INTID )
> +    {
> +        d->arch.vgic.nr_espis = min(nr_spis - ESPI_BASE_INTID + 32, 1024U);

We should return an error rather than silently capping the value.

> +        /* Verify if GIC HW can handle provided INTID */
> +        if ( d->arch.vgic.nr_espis > gic_number_espis() )
> +            return -EINVAL;
> +        /*
> +         * Set the maximum available number for regular
> +         * SPI to pass the next check
> +         */

I think it would be better to rework the code so the check is not called.

> +        nr_spis = VGIC_DEF_NR_SPIS;
> +    }
> +    else
> +    {
> +        /* Domain will use the regular SPI range */
> +        d->arch.vgic.nr_espis = 0;
> +    }
> +#endif
> +
>       /* Limit the number of virtual SPIs supported to (1020 - 32) = 988  */
>       if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
>           return -EINVAL;
> @@ -145,7 +306,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>           return -ENOMEM;
>   
>       d->arch.vgic.pending_irqs =
> -        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
> +        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
>       if ( d->arch.vgic.pending_irqs == NULL )
>           return -ENOMEM;
>   
> @@ -156,12 +317,16 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>       for ( i = 0; i < DOMAIN_NR_RANKS(d); i++ )
>           vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
>   
> +    ret = init_vgic_espi(d);
> +    if ( ret )
> +        return ret;
> +
>       ret = d->arch.vgic.handler->domain_init(d);
>       if ( ret )
>           return ret;
>   
>       d->arch.vgic.allocated_irqs =
> -        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
> +        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_alloc_irqs(d)));
>       if ( !d->arch.vgic.allocated_irqs )
>           return -ENOMEM;
>   
> @@ -195,9 +360,27 @@ void domain_vgic_free(struct domain *d)
>           }
>       }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i = 0; i < d->arch.vgic.nr_espis; i++ )

Now we are potentially doubling up the number of IRQs we have to 
release. I am not entirely sure this is still ok to do it without any 
preemption. Do you have any data?

> +    {
> +        struct pending_irq *p = spi_to_pending(d, ESPI_IDX2INTID(i));
> +
> +        if ( p->desc )
> +        {
> +            ret = release_guest_irq(d, p->irq);
> +            if ( ret )
> +                dprintk(XENLOG_G_WARNING, "%pd: Failed to release virq %u ret = %d\n",
> +                        d, p->irq, ret);
> +        }
> +    }
> +#endif
> +
>       if ( d->arch.vgic.handler )
>           d->arch.vgic.handler->domain_free(d);
>       xfree(d->arch.vgic.shared_irqs);
> +#ifdef CONFIG_GICV3_ESPI
> +    xfree(d->arch.vgic.ext_shared_irqs);
> +#endif
>       xfree(d->arch.vgic.pending_irqs);
>       xfree(d->arch.vgic.allocated_irqs);
>   }
> @@ -331,6 +514,8 @@ void arch_move_irqs(struct vcpu *v)
>           if ( v_target == v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
>               irq_set_affinity(p->desc, cpu_mask);
>       }
> +
> +    arch_move_espis(v);
>   }
>   
>   void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
> @@ -538,6 +723,8 @@ struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq)
>           n = &v->arch.vgic.pending_irqs[irq];
>       else if ( is_lpi(irq) )
>           n = v->domain->arch.vgic.handler->lpi_to_pending(v->domain, irq);
> +    else if ( is_espi(irq) )
> +        n = espi_to_pending(v->domain, irq);
>       else
>           n = &v->domain->arch.vgic.pending_irqs[irq - 32];
>       return n;
> @@ -547,6 +734,9 @@ struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
>   {
>       ASSERT(irq >= NR_LOCAL_IRQS);
>   
> +    if ( is_espi(irq) )
> +        return espi_to_pending(d, irq);
> +
>       return &d->arch.vgic.pending_irqs[irq - 32];
>   }
>   
> @@ -668,6 +858,9 @@ bool vgic_reserve_virq(struct domain *d, unsigned int virq)
>       if ( !vgic_is_valid_line(d, virq) )
>           return false;
>   
> +    if ( is_espi(virq) )
> +        return vgic_reserve_espi_virq(d, virq);
> +
>       return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
>   }
>   
> @@ -685,7 +878,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>       else
>       {
>           first = 32;
> -        end = vgic_num_irqs(d);
> +        end = vgic_num_alloc_irqs(d);
>       }
>   
>       /*

Cheers,

-- 
Julien Grall


