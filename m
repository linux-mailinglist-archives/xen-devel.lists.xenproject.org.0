Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31264B3A831
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 19:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099809.1453522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urgW3-0000sI-Va; Thu, 28 Aug 2025 17:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099809.1453522; Thu, 28 Aug 2025 17:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urgW3-0000qk-So; Thu, 28 Aug 2025 17:34:27 +0000
Received: by outflank-mailman (input) for mailman id 1099809;
 Thu, 28 Aug 2025 17:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvL0=3I=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urgW2-0000qd-AJ
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 17:34:26 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ce7b788-8435-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 19:34:24 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55f467f3c06so1006920e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 10:34:23 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676f53acsm5887e87.36.2025.08.28.10.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 10:34:22 -0700 (PDT)
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
X-Inumbo-ID: 3ce7b788-8435-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756402463; x=1757007263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwT4vLrOo/tqSOx2sv0ayFZxmR5B8FFSr5cNOd/P5so=;
        b=K1TZJ9Njdv/CGIQxt+2y4F9D5IB4/q2/m3YAEImXQL5l6Gt+McxNePF/uFXsiDxZcp
         PNNMoGjAnAH/eE2osjD9IS+ekSrLPiQInrxDJA4tnz9gUiVjcczIE4dfmQROc9lbCA5O
         Ea353BaQdbkfjJ6pl89E5B3bK96MIknSfZ9wyjAVEp78Aol4redg/fiP2Go+iOWNwJTq
         O14b1lVT+0funifebDYAu/Qfh4QMQR5SQa5A0wpZM7FJ8CmyIh2eBfz1xYv3+Sb8iNqh
         lEaYxZgBTIzQrrpeRRmFX0pBPO2QIq+/yFPktGsbGRwqsJzpfRQeSac948px3iLC3T8Y
         8uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402463; x=1757007263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwT4vLrOo/tqSOx2sv0ayFZxmR5B8FFSr5cNOd/P5so=;
        b=vMeje0Ch1bsA08vopl+9boLSLPV2jFm2QBCfo+i/J2qFXV/34v4kFGQ3D8trC01wkt
         SVoC40AvY9IyHwssU09SI5uHKXa0A7kWO9nUtVdbju2b9p57d/RWXq86kNp2AhJqpmKT
         l+I3VlRgoKL23tZVhvPPQZgL/EAQXZvOXPq67Q03Di01IilB0eebA05gy/3p6K3zXGYR
         bRrGZ+rZpGvAcMMW6b6zMgFAAwwpi6lmJr6g6Ffo7epKE+Me7gq6+yJCEZXN7rOaqLVg
         ew+AEe9gigR5awgNknLvXPnS8VjYZ+BD/MYhadNfGgaKEL1eWhlSeD1cV9sj9XZdH0GH
         8k3A==
X-Forwarded-Encrypted: i=1; AJvYcCUK7T3EmJ2SNVZgpogiiopbCjcepbgURQxLI4CFqFPWCa9MX4yeLaHWkE///ux6bB1NnSGisgop9FQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAdtNAwrUwH4ItKBT93W5DaHE5GHhVEUtSzC9p6vVHKONI/1mK
	SRK7qwdGUQ2O9T+HYaGqny0ieVhR6FWa9tyhfUbGjwdVomzp74LK03TpibwJaA==
X-Gm-Gg: ASbGncukddR9kVp/xiObICMWjtFiJwUzX+W2nuWe8rI8W7+yr6XyJ2Aad6niXjJ9wqm
	TqlLtqhWU9xAgdkxc2TVR+sKjtdzSlfAuRkbljY0jVqiKl7MP1pA9WUwOHhNj/Yy1gEOKkLBh5m
	+hphkA0G/4HZCoZ2fBIkuV8sc+NTpUvoe79XDUQZu8aZKWuxOemW+dj8sOcrfyhqFMJu/IJzxkO
	2OwWrX899r0EInZHVXwb69wJvuqqfcg8/qx3hM+vINLotzEibGGhTcO3z35jBfk4RYAN0UVi5vn
	CEZSc8r0SZOXRJqSes+I+7l3GSn0opLppifPINnKY3JzC0gnUBzsmkrMCZiMlX7BESei/aTI5xY
	H/0dSti11v2rWkb3m/ZKlRXArL9hZd5Zjv5fg
X-Google-Smtp-Source: AGHT+IF/zoWWQbuFaLVAE/oVNG5ZccBXQG13LHuAh7stGYLDxnf4tzquZkpRqCm9+/YbEzrovShS5w==
X-Received: by 2002:a05:6512:10cc:b0:55f:4e27:f1be with SMTP id 2adb3069b0e04-55f4e27f2d9mr3166209e87.53.1756402462861;
        Thu, 28 Aug 2025 10:34:22 -0700 (PDT)
Message-ID: <01a964ac-a9aa-4301-b3da-5691e18b1b73@gmail.com>
Date: Thu, 28 Aug 2025 20:34:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] xen/arm: vgic: add resource management for
 extended SPIs
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <9e8a11b024833c1b91b8806e7708bf35b04a8f6e.1756317702.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <9e8a11b024833c1b91b8806e7708bf35b04a8f6e.1756317702.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27.08.25 21:24, Leonid Komarianskyi wrote:

Hello Leonid

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
>   xen/arch/arm/include/asm/vgic.h |  20 +++
>   xen/arch/arm/vgic.c             | 213 +++++++++++++++++++++++++++++++-
>   2 files changed, 230 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 3e7cbbb196..fb4cea73eb 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -146,6 +146,12 @@ struct vgic_dist {
>       int nr_spis; /* Number of SPIs */
>       unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
>       struct vgic_irq_rank *shared_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +    struct vgic_irq_rank *ext_shared_irqs;
> +    int nr_espis; /* Number of extended SPIs */

Can nr_espis be negative?

> +    /* To simplify determining whether a domain is able to operate with eSPI */
> +    bool has_espi;

I agree with the Volodymyr's comment provided in separate letter that we 
could avoid adding an extra var.

> +#endif
>       /*
>        * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
>        * struct arch_vcpu.
> @@ -243,6 +249,14 @@ struct vgic_ops {
>   /* Number of ranks of interrupt registers for a domain */
>   #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
>   
> +#ifdef CONFIG_GICV3_ESPI
> +#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis+31)/32)
> +#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
> +#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
> +#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
> +#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)
> +#endif
> +
>   #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>   #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
>   
> @@ -302,6 +316,12 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v,
>                                                 unsigned int b,
>                                                 unsigned int n,
>                                                 unsigned int s);
> +#ifdef CONFIG_GICV3_ESPI
> +extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
> +                                                  unsigned int b,
> +                                                  unsigned int n,
> +                                                  unsigned int s);
> +#endif
>   extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq);
>   extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
>   extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 2bbf4d99aa..f4b80cb05f 100644
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
> @@ -117,6 +192,74 @@ int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
>       return 0;
>   }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * The function behavior is the same as for regular SPIs (vgic_rank_offset),
> + * but it operates with extended SPI ranks.
> + */
> +struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
> +                                           unsigned int n, unsigned int s)
> +{
> +    unsigned int rank = REG_RANK_NR(b, (n >> s));
> +
> +    return vgic_get_rank(v, rank + EXT_RANK_MIN);
> +}

So the difference between vgic_rank_offset() and vgic_ext_rank_offset() 
in using EXT_RANK_MIN in the latter. I am wondering, whether it makes 
sense to reuse the existing vgic_rank_offset() by moving #ifdef into it? 
Maybe it would be possible to optimize some code added in "[PATCH v4 
10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers".

e.g. __vgic_v3_distr_common_mmio_read:

Code for the following cases looks very similar to the regular counterparts.
case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):

The difference is in the said helper and the base calculated as
"reg - GICD_XXX", where GICD_XXX is the start of the range for the 
eSPI-based reg (e.g. GICD_IPRIORITYRnE) or regular SPI-based reg 
(e.g.GICD_IPRIORITYR). The GICD_XXX could probably be chosen
based on the "reg" value itself, for example:

rank = vgic_rank_offset(v, 8, reg >= GICD_IPRIORITYRnE ? reg - 
GICD_IPRIORITYRnE : reg - GICD_IPRIORITYR, DABT_WORD);

Please note, I am not requesting for any updates regarding to that, I am 
just thinking out loud.


> +
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
> +static unsigned int init_vgic_espi(struct domain *d
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
> @@ -131,6 +274,38 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
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
> +        /* Verify if GIC HW can handle provided INTID */
> +        if ( d->arch.vgic.nr_espis > gic_number_espis() )
> +            return -EINVAL;
> +        /*
> +         * Set the maximum available number for regular
> +         * SPI to pass the next check
> +         */
> +        nr_spis = VGIC_DEF_NR_SPIS;
> +        d->arch.vgic.has_espi = true;
> +    }
> +    else
> +    {
> +        /* Domain will use the regular SPI range */
> +        d->arch.vgic.nr_espis = 0;
> +        d->arch.vgic.has_espi = false;
> +    }
> +#endif
> +
>       /* Limit the number of virtual SPIs supported to (1020 - 32) = 988  */
>       if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
>           return -EINVAL;
> @@ -145,7 +320,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>           return -ENOMEM;
>   
>       d->arch.vgic.pending_irqs =
> -        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
> +        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
>       if ( d->arch.vgic.pending_irqs == NULL )
>           return -ENOMEM;
>   
> @@ -156,12 +331,16 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
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
> @@ -195,9 +374,27 @@ void domain_vgic_free(struct domain *d)
>           }
>       }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i = 0; i < d->arch.vgic.nr_espis; i++ )
> +    {
> +        struct pending_irq *p = spi_to_pending(d, ESPI_IDX2INTID(i));
> +
> +        if ( p->desc )
> +        {
> +            ret = release_guest_irq(d, p->irq);
> +            if ( ret )
> +                dprintk(XENLOG_G_WARNING, "d%u: Failed to release virq %u ret = %d\n",


NIT: you can use %pd for printing domain with its ID


> +                        d->domain_id, p->irq, ret);
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
> @@ -331,6 +528,8 @@ void arch_move_irqs(struct vcpu *v)
>           if ( v_target == v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
>               irq_set_affinity(p->desc, cpu_mask);
>       }
> +
> +    arch_move_espis(v);
>   }
>   
>   void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
> @@ -538,6 +737,8 @@ struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq)
>           n = &v->arch.vgic.pending_irqs[irq];
>       else if ( is_lpi(irq) )
>           n = v->domain->arch.vgic.handler->lpi_to_pending(v->domain, irq);
> +    else if ( is_espi(irq) )
> +        n = espi_to_pending(v->domain, irq);
>       else
>           n = &v->domain->arch.vgic.pending_irqs[irq - 32];
>       return n;
> @@ -547,6 +748,9 @@ struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
>   {
>       ASSERT(irq >= NR_LOCAL_IRQS);
>   
> +    if ( is_espi(irq) )
> +        return espi_to_pending(d, irq);
> +
>       return &d->arch.vgic.pending_irqs[irq - 32];
>   }
>   
> @@ -668,6 +872,9 @@ bool vgic_reserve_virq(struct domain *d, unsigned int virq)
>       if ( !vgic_is_valid_line(d, virq) )
>           return false;
>   
> +    if ( is_espi(virq) )
> +        return vgic_reserve_espi_virq(d, virq);
> +
>       return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
>   }
>   
> @@ -685,7 +892,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>       else
>       {
>           first = 32;
> -        end = vgic_num_irqs(d);
> +        end = vgic_num_alloc_irqs(d);
>       }
>   
>       /*


