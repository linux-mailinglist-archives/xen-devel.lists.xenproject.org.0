Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D665EB32940
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 16:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091289.1448016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uppPA-00031q-Hw; Sat, 23 Aug 2025 14:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091289.1448016; Sat, 23 Aug 2025 14:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uppPA-00031L-DR; Sat, 23 Aug 2025 14:39:40 +0000
Received: by outflank-mailman (input) for mailman id 1091289;
 Sat, 23 Aug 2025 14:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOa+=3D=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uppP9-00031F-AV
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 14:39:39 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fed54db1-802e-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 16:39:38 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-333f7ebc44dso28671201fa.0
 for <xen-devel@lists.xenproject.org>; Sat, 23 Aug 2025 07:39:38 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e24af34sm5339131fa.26.2025.08.23.07.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 07:39:36 -0700 (PDT)
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
X-Inumbo-ID: fed54db1-802e-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755959977; x=1756564777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlPo5dA2LWSRyv6b9RW7EwZzMJEpeFA8zVCVMoCQBN4=;
        b=luNUNWFM99N7+ISMrr4stF2BwrKkGBV3I5lKEAUYCU5rwZPeCu+YCBmw4lep60i4+b
         aEGA13jvxspUBM8f/NlB5TugByUeMTLoZUdANOSL8Ce1kaq0SpaIB+ogGdHuDARbAuvu
         MWHs8xJKvjma7Ei8UTrPtR1wkEfRl6YZR3BUp18zazTki0/8rluFn8yTnB2lPmdd66zB
         QgHWBZXbsKcAZBSZFDSkkqdZTqNM9JZ9bQDCxAagkk84uycl9x6pq636NKSVRvosFuAJ
         8eYZ7pQSJMbb5tzhva7DBIrb7ZqrIVvnFk8eMHWdXgMZw08kEZk9zFrH2KGUIH2FMW06
         yDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755959977; x=1756564777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SlPo5dA2LWSRyv6b9RW7EwZzMJEpeFA8zVCVMoCQBN4=;
        b=QE04Ae7vN9NcGovByspUeXcBo3YKl/Y6Mr79gE0WHRtg78+6mW5Fe/mwGFLKddNsuZ
         4aZnn/7LqSASldQc6AbUZDxf/1lt8QVIlNTkYaqm0DY/xXMnW0fsGwW+7Gd5v3b0sKZo
         pTlk0ZLfflPswXsAicNaHCzSX1HcnBpx9CE5al/Owf3Y1tGDWR83nhOlzb9yfHO/QcjI
         TI902mVeV75Z1bHIL1WHtoW95m9FcAjNYObpniYMYkdCTLDdScu00fBuiTYLQmFOXe0k
         uMamMlBHHpyAi5ZDD4GrMhq4y8Og+aO4j1w04ts78Mpr12rmf/mSohDF2GPOdh+T7eeL
         WypQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0NUUkSeA3tdb2brIlfSbBdVBUc+lwLPDWqBjoY3UttCoaw6IiVbd6qpdZwdvjwOBOR5f8MkUwOro=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy363zA6NEKVNHRAFhRi0Zjvd7ka4O5kJ+7sAJ2hcnuwofovuhR
	ojuvnXeBm44qGz+jUDI3oIVzCfqiOAc1nnIpP15L5jBlxwV/m7tgIFnW
X-Gm-Gg: ASbGncspKodj0TXMHf927/Vm5VB9K+lHrdBDY9zNqcKU9uZfNfmlMZP5uEwta0WU2Tx
	4I0dhuy4sV8K2dJp2RGbOx/P1vdQ24ZbEZuwOE/fY7pheWNwo4KNCB3gv5zzVee99X36YbQY4l6
	gTORCsBoTQ19gk/sGiaiCK5QIy/tMfi1ZZp+aT0ybAtNOcOImad3E9FdfmJUZ6+mYvDRKL4gQch
	CkqMW7iSmPDRKaJ2uEQ+/su3Kthok7Tu7TEzYroQcf3KNdX6735KPOY0Dsm+DyBlFfMGEY9K8vM
	yZ84hOc7yElv+gQB8vWO8J7bFancQUBFBklEnZc7sBMOi4RSJ7vWC+b6RuwIhcBicWG851eYyav
	6xhxCiVVvwiC/G7A2h43Oltz1tOnWuL6DkKlA
X-Google-Smtp-Source: AGHT+IFnvQAtqKSua9pdDhvOp+IqSlBOY+F4uwX4FWD1p7R18ubVgvmIDROqjGat54ljzkAjf9mKQw==
X-Received: by 2002:a05:651c:2141:b0:336:5d7d:f034 with SMTP id 38308e7fff4ca-3365d7df730mr6865171fa.1.1755959977301;
        Sat, 23 Aug 2025 07:39:37 -0700 (PDT)
Message-ID: <d22b3f56-1a2b-44b4-88b1-b70c7607c24d@gmail.com>
Date: Sat, 23 Aug 2025 17:39:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] xen/arm: vgic: add resource management for
 extended SPIs
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <fde65754a60a8cc090bb212749ec2c10877c4943.1754568795.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <fde65754a60a8cc090bb212749ec2c10877c4943.1754568795.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.08.25 15:33, Leonid Komarianskyi wrote:


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
>   xen/arch/arm/include/asm/vgic.h |  18 ++++
>   xen/arch/arm/vgic.c             | 145 ++++++++++++++++++++++++++++++++
>   2 files changed, 163 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 45201f4ca5..9fa4523018 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -146,6 +146,10 @@ struct vgic_dist {
>       int nr_spis; /* Number of SPIs */
>       unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
>       struct vgic_irq_rank *shared_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +    struct vgic_irq_rank *ext_shared_irqs;
> +    int nr_espis; /* Number of extended SPIs */
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
> +#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
> +#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
> +#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
> +#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)
> +#endif
> +
>   #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>   #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
>   
> @@ -302,6 +314,12 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v,
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
> index 48fbaf56fb..1a6c765af9 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -27,9 +27,26 @@
>   
>   bool vgic_is_valid_irq(struct domain *d, unsigned int virq)
>   {
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( virq >= ESPI_BASE_INTID && virq < ESPI_IDX2INTID(d->arch.vgic.nr_espis) )
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
> +    return ( rank >= EXT_RANK_MIN && EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d) );
> +}
> +#endif
> +
>   static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>                                                     unsigned int rank)
>   {
> @@ -37,6 +54,10 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>           return v->arch.vgic.private_irqs;
>       else if ( rank <= DOMAIN_NR_RANKS(v->domain) )
>           return &v->domain->arch.vgic.shared_irqs[rank - 1];
> +#ifdef CONFIG_GICV3_ESPI
> +    else if ( is_valid_espi_rank(v->domain, rank) )
> +        return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
> +#endif
>       else
>           return NULL;
>   }
> @@ -53,6 +74,16 @@ struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, unsigned int b,
>       return vgic_get_rank(v, rank);
>   }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
> +                                           unsigned int n, unsigned int s)
> +{
> +    unsigned int rank = REG_RANK_NR(b, (n >> s));
> +
> +    return vgic_get_rank(v, rank + EXT_RANK_MIN);
> +}
> +#endif
> +
>   struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq)
>   {
>       unsigned int rank = irq / 32;
> @@ -117,6 +148,29 @@ int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
>       return 0;
>   }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +static int init_vgic_espi(struct domain *d)
> +{
> +    int i;

please use unsigned int if "i" cannot be negative

> +
> +    if ( d->arch.vgic.nr_espis == 0 )
> +        return 0;
> +
> +    d->arch.vgic.ext_shared_irqs =
> +        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
> +    if ( d->arch.vgic.ext_shared_irqs == NULL )
> +        return -ENOMEM;
> +
> +    for ( i = 0; i < d->arch.vgic.nr_espis; i++ )
> +        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i + d->arch.vgic.nr_spis], ESPI_IDX2INTID(i));
> +
> +    for ( i = 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
> +        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);
> +
> +    return 0;
> +}
> +#endif
> +
>   int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>   {
>       int i;
> @@ -131,6 +185,30 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>        */
>       nr_spis = ROUNDUP(nr_spis, 32);
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( nr_spis > ESPI_MAX_INTID )
> +        return -EINVAL;
> +
> +    if ( is_espi(nr_spis) )
> +    {
> +        /*
> +         * During domain creation, the toolstack specifies the maximum INTID,

domain_vgic_init() is also called for dom0less DomUs (if present), which 
are created at Xen boot. So the toolstack might even be absent on the 
target system.

> +         * which is defined in the domain config subtracted by 32. To compute the
> +         * actual number of eSPI that will be usable for, add back 32.
> +         */
> +        d->arch.vgic.nr_espis = min(nr_spis - ESPI_BASE_INTID + 32, 1024U);
> +        /* Verify if GIC HW can handle provided INTID */
> +        if ( d->arch.vgic.nr_espis > gic_number_espis() )
> +            return -EINVAL;
> +        /* Set the maximum available number for defult SPI to pass the next check */
> +        nr_spis = VGIC_DEF_NR_SPIS;
> +    } else
> +    {
> +        /* Domain will use the regular SPI range */
> +        d->arch.vgic.nr_espis = 0;
> +    }
> +#endif
> +
>       /* Limit the number of virtual SPIs supported to (1020 - 32) = 988  */
>       if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
>           return -EINVAL;
> @@ -145,7 +223,12 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>           return -ENOMEM;
>   
>       d->arch.vgic.pending_irqs =
> +#ifdef CONFIG_GICV3_ESPI
> +        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis +
> +                      d->arch.vgic.nr_espis);
> +#else
>           xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
> +#endif
>       if ( d->arch.vgic.pending_irqs == NULL )
>           return -ENOMEM;
>   
> @@ -156,12 +239,23 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>       for ( i = 0; i < DOMAIN_NR_RANKS(d); i++ )
>           vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    ret = init_vgic_espi(d);
> +    if ( ret )
> +        return ret;
> +#endif
> +
>       ret = d->arch.vgic.handler->domain_init(d);
>       if ( ret )
>           return ret;
>   
>       d->arch.vgic.allocated_irqs =
> +#ifdef CONFIG_GICV3_ESPI
> +        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d) +
> +                      d->arch.vgic.nr_espis));
> +#else
>           xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
> +#endif
>       if ( !d->arch.vgic.allocated_irqs )
>           return -ENOMEM;
>   
> @@ -195,9 +289,27 @@ void domain_vgic_free(struct domain *d)
>           }
>       }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i = 0; i < (d->arch.vgic.nr_espis); i++ )

NIT: no need for () around d->arch.vgic.nr_espis

> +    {
> +        struct pending_irq *p = spi_to_pending(d, ESPI_IDX2INTID(i));
> +
> +        if ( p->desc )
> +        {
> +            ret = release_guest_irq(d, p->irq);
> +            if ( ret )
> +                dprintk(XENLOG_G_WARNING, "d%u: Failed to release virq %u ret = %d\n",
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
> @@ -331,6 +443,17 @@ void arch_move_irqs(struct vcpu *v)
>           if ( v_target == v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
>               irq_set_affinity(p->desc, cpu_mask);
>       }
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i = ESPI_BASE_INTID; i < (d)->arch.vgic.nr_espis; i++ )

NIT: no need for () around d

[snip]

