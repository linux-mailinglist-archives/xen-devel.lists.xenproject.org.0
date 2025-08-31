Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92958B3D43F
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 17:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103864.1455213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uskS0-0002ii-Qr; Sun, 31 Aug 2025 15:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103864.1455213; Sun, 31 Aug 2025 15:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uskS0-0002fo-Mu; Sun, 31 Aug 2025 15:58:40 +0000
Received: by outflank-mailman (input) for mailman id 1103864;
 Sun, 31 Aug 2025 15:58:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8SH=3L=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uskRz-0002fi-Hv
 for xen-devel@lists.xenproject.org; Sun, 31 Aug 2025 15:58:39 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ae9f2ea-8683-11f0-8adc-4578a1afcccb;
 Sun, 31 Aug 2025 17:58:37 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55f6bb0a364so2401577e87.1
 for <xen-devel@lists.xenproject.org>; Sun, 31 Aug 2025 08:58:37 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dd6e2sm2281549e87.23.2025.08.31.08.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Aug 2025 08:58:35 -0700 (PDT)
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
X-Inumbo-ID: 5ae9f2ea-8683-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756655917; x=1757260717; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1dwMmVjvbLhsG95wPTqKxMWd+I70jRnWyPyn6H552Q=;
        b=ER8wO0Yiwb+85//2DgTuMpiVYTtBZDU6PVW11fkneca8LFM3VylJW3l+a8VtSvmyhx
         9P3cU3udZ+nZOypj1+CwGWqvN3jjua3k5bfX47vJ6LhsMj3hsiZ7KSfSn6rfIWI3RbzK
         711JNMD+/3GFhqN2uK1lydUX+auNW2auyRMBLD7OcBvz4zTulRNiKGL5A286cgtaPxvP
         wUcd1W0QMvolIhzlD6/AVVvaYr6bkxWgPsgJeQx6fQIyulZMy6+xdSqn6XXkGZ7ObRmL
         W5wibCXDnYCQumSyM2m2sH9czL+/5+30Sb7Mh7PvS6aONxpBBclETJM9g5teaBnukKtH
         Zgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756655917; x=1757260717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1dwMmVjvbLhsG95wPTqKxMWd+I70jRnWyPyn6H552Q=;
        b=C9lttBDFO/ShfonR/2z8aD8Xu3SQZ8rh+YyxHKKIFGFfw2bYpx0ENWiZ6ajU1XGvFL
         7JyOpem1h4jIRL2If+rUyXPfss6AjvkGKdS/O3Ez69KFWQPpzY9iOWVL8l1ytQRgHLLi
         Yy7yN7vOEqikU3axh0dL44vjzFU69M3sVjeWNquBGEH+dEDHN+KSfAXXbM2sHJq6g4IX
         a2T58r/fvqmA27e7atKTT6WtBQx/ETksdajltH8EyTn2Lsn/dPLDqXVOiLjOOwbiCug/
         XeQWcwtCm2Ap4YUNMIZEsSI7fqxxc9HS6fh1WvYcCZ6W41VzCJ/9kzh/Ry72nihWOzZb
         7uAg==
X-Gm-Message-State: AOJu0YwDcSMGr5pkNl7KqNPi0CjrRIV/fEC5sZg4NOkPmjBqykw7bOQm
	EDnXIqVcWBB6Q46H9ejc+SspCvOFMpAPGlBSD2bEDFoov15sqLa/shHy
X-Gm-Gg: ASbGncs8NKZDn8gye6KWWGgBTePeLF2DomFeNVIAaUqmSGy88ahxPrVQjiKyNXdLzLz
	2XZzpQnAn2XODc2LKtkurXRXIuWq7vL0xy75F2de1C/BN3f3TPFBnuC1jRWtZtDKyVbdZsrlYJ6
	TXfC0uZINIdj8aYwu/DR3aB99t8GLtQoORWQCe6ffnfjCotFCCMaek3oI+ByM0kOUp1Teleyhmf
	ZWu2umNr4PJvj7keohRmNAnoRKmvtWadkhc7Qi02Kh2YlMv8GKR4ix8kx5cNtw5/tkKd5/bJHYH
	7FwQz+c5m5yxazFFdIqWEIshx5QafPDKyw2vdcz2VyugaWxBtqisowK0jngcEz63TeUZKHnPXpw
	py7QC5kd+87u0zBWT1gyKefSZDw==
X-Google-Smtp-Source: AGHT+IF0zF0FK64cS9jA0p8hRPOZKZDTPPwItMyuHeqDWR7+YAZKTVe4Axay9hrKcOdlasQIW5QpXQ==
X-Received: by 2002:a05:6512:689:b0:55f:6d22:38b6 with SMTP id 2adb3069b0e04-55f7089c1a7mr1326107e87.2.1756655916172;
        Sun, 31 Aug 2025 08:58:36 -0700 (PDT)
Message-ID: <be5a9af6-4d63-4075-8d38-fdb1576dfce4@gmail.com>
Date: Sun, 31 Aug 2025 18:58:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] xen/arm: vgic: add resource management for
 extended SPIs
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <4b13dea924eabf1370d3f31030f3eef48371de06.1756481577.git.leonid_komarianskyi@epam.com>
 <87y0r1x3g2.fsf@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <87y0r1x3g2.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29.08.25 23:45, Volodymyr Babchuk wrote:

Hello Leonid, Volodymyr

> 
> Hi Leonid,
> 
> Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:
> 
>> This change introduces resource management in the VGIC to handle
>> extended SPIs introduced in GICv3.1. The pending_irqs and
>> allocated_irqs arrays are resized to support the required
>> number of eSPIs, based on what is supported by the hardware and
>> requested by the guest. A new field, ext_shared_irqs, is added
>> to the VGIC structure to store information about eSPIs, similar
>> to how shared_irqs is used for regular SPIs.
>>
>> Since the eSPI range starts at INTID 4096 and INTIDs between 1025
>> and 4095 are reserved, helper macros are introduced to simplify the
>> transformation of indices and to enable easier access to eSPI-specific
>> resources. These changes prepare the VGIC for processing eSPIs as
>> required by future functionality.
>>
>> The initialization and deinitialization paths for vgic have been updated
>> to allocate and free these resources appropriately. Additionally,
>> updated handling of INTIDs greater than 1024, passed from the toolstack
>> during domain creation, and verification logic ensures only valid SPI or
>> eSPI INTIDs are used.
>>
>> The existing SPI behavior remains unaffected when guests do not request
>> eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
>> option is disabled.
>>
>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>>
>> ---
>> Changes in V5:
>> - removed the has_espi field because it can be determined by checking
>>    whether domain->arch.vgic.nr_espis is zero or not
>> - since vgic_ext_rank_offset is not used in this patch, it has been
>>    moved to the appropriate patch in the patch series, which implements
>>    vgic eSPI registers emulation and requires this function
>> - removed ifdefs for eSPI-specific macros to reduce the number of ifdefs
>>    and code duplication in further changes
>> - fixed minor nit: used %pd for printing domain with its ID

@Leonid, thanks for optimizing the series, now it looks much better (the 
number of #ifdef-s is reduced, code is reused).


>>
>> Changes in V4:
>> - added has_espi field to simplify determining whether a domain is able
>>    to operate with eSPI
>> - fixed formatting issues and misspellings
>>
>> Changes in V3:
>> - fixed formatting for lines with more than 80 symbols
>> - introduced helper functions to be able to use stubs in case of
>>    CONFIG_GICV3_ESPI disabled, and as a result, reduce the number of
>>    #ifdefs
>> - fixed checks for nr_spis in domain_vgic_init
>> - updated comment about nr_spis adjustments with dom0less mention
>> - moved comment with additional explanations before checks
>> - used unsigned int for indexes since they cannot be negative
>> - removed unnecessary parentheses
>> - move vgic_ext_rank_offset to the below ifdef guard, to reduce the
>>    number of ifdefs
>>
>> Changes in V2:
>> - change is_espi_rank to is_valid_espi_rank to verify whether the array
>>    element ext_shared_irqs exists. The previous version, is_espi_rank,
>>    only checked if the rank index was less than the maximum possible eSPI
>>    rank index, but this could potentially result in accessing a
>>    non-existing array element. To address this, is_valid_espi_rank was
>>    introduced, which ensures that the required eSPI rank exists
>> - move gic_number_espis to
>>    xen/arm: gicv3: implement handling of GICv3.1 eSPI
>> - update vgic_is_valid_irq checks to allow operating with eSPIs
>> - remove redundant newline in vgic_allocate_virq
>> ---
>>   xen/arch/arm/include/asm/vgic.h |  12 ++
>>   xen/arch/arm/vgic.c             | 199 +++++++++++++++++++++++++++++++-
>>   2 files changed, 208 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
>> index 3e7cbbb196..912d5b7694 100644
>> --- a/xen/arch/arm/include/asm/vgic.h
>> +++ b/xen/arch/arm/include/asm/vgic.h
>> @@ -146,6 +146,10 @@ struct vgic_dist {
>>       int nr_spis; /* Number of SPIs */
>>       unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
>>       struct vgic_irq_rank *shared_irqs;
>> +#ifdef CONFIG_GICV3_ESPI
>> +    struct vgic_irq_rank *ext_shared_irqs;
>> +    int nr_espis; /* Number of extended SPIs */

It seems you have agreed (V4) that nr_espis could not be negative.

>> +#endif
>>       /*
>>        * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
>>        * struct arch_vcpu.
>> @@ -243,6 +247,14 @@ struct vgic_ops {
>>   /* Number of ranks of interrupt registers for a domain */
>>   #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
>>   
>> +#ifdef CONFIG_GICV3_ESPI
>> +#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis+31)/32)
>> +#endif
>> +#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
>> +#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
>> +#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
>> +#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)
>> +
>>   #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>>   #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
>>   
>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>> index 2bbf4d99aa..c9b9528c66 100644
>> --- a/xen/arch/arm/vgic.c
>> +++ b/xen/arch/arm/vgic.c
>> @@ -27,9 +27,82 @@
>>   
>>   bool vgic_is_valid_line(struct domain *d, unsigned int virq)
>>   {
>> +#ifdef CONFIG_GICV3_ESPI
>> +    if ( virq >= ESPI_BASE_INTID &&
>> +         virq < ESPI_IDX2INTID(d->arch.vgic.nr_espis) )
>> +        return true;
>> +#endif
>> +
>>       return virq < vgic_num_irqs(d);
>>   }
>>   
>> +#ifdef CONFIG_GICV3_ESPI
>> +/*
>> + * Since eSPI indexes start from 4096 and numbers from 1024 to
>> + * 4095 are forbidden, we need to check both lower and upper
>> + * limits for ranks.
>> + */
>> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
>> +{
>> +    return rank >= EXT_RANK_MIN &&
>> +           EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d);
>> +}
>> +
>> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
>> +                                                       unsigned int rank)
>> +{
>> +    return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
>> +}
>> +
>> +static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int virq)
>> +{
>> +    return !test_and_set_bit(ESPI_INTID2IDX(virq) + vgic_num_irqs(d),
>> +                             d->arch.vgic.allocated_irqs);
>> +}
>> +
>> +static void arch_move_espis(struct vcpu *v)
> 
> I don't need you need a copy of arch_move_irqs(). Se below for more info.
> 
>> +{
>> +    const cpumask_t *cpu_mask = cpumask_of(v->processor);
>> +    struct domain *d = v->domain;
>> +    struct pending_irq *p;
>> +    struct vcpu *v_target;
>> +    unsigned int i;
>> +
>> +    for ( i = ESPI_BASE_INTID;
>> +          i < EXT_RANK_IDX2NUM(d->arch.vgic.nr_espis); i++ )
>> +    {
>> +        v_target = vgic_get_target_vcpu(v, i);
>> +        p = irq_to_pending(v_target, i);
>> +
>> +        if ( v_target == v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
>> +            irq_set_affinity(p->desc, cpu_mask);
>> +    }
>> +}
>> +#else
>> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
>> +{
>> +    return false;
>> +}
>> +
>> +/*
>> + * This function is stub and will not be called if CONFIG_GICV3_ESPI=n,
>> + * because in this case, is_valid_espi_rank will always return false.
>> + */
>> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
>> +                                                       unsigned int rank)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +    return NULL;
>> +}
>> +
>> +static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int virq)
>> +{
>> +    return false;
>> +}
>> +
>> +static void arch_move_espis(struct vcpu *v) { }
>> +#endif
>> +
>>   static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>>                                                     unsigned int rank)
>>   {
>> @@ -37,6 +110,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>>           return v->arch.vgic.private_irqs;
>>       else if ( rank <= DOMAIN_NR_RANKS(v->domain) )
>>           return &v->domain->arch.vgic.shared_irqs[rank - 1];
>> +    else if ( is_valid_espi_rank(v->domain, rank) )
>> +        return vgic_get_espi_rank(v, rank);
>>       else
>>           return NULL;
>>   }
>> @@ -117,6 +192,62 @@ int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
>>       return 0;
>>   }
>>   
>> +#ifdef CONFIG_GICV3_ESPI
>> +static unsigned int vgic_num_spi_lines(struct domain *d)
>> +{
>> +    return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
>> +}
>> +
>> +static int init_vgic_espi(struct domain *d)
>> +{
>> +    unsigned int i, idx;
>> +
>> +    if ( d->arch.vgic.nr_espis == 0 )
>> +        return 0;
>> +
>> +    d->arch.vgic.ext_shared_irqs =
>> +        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
>> +    if ( d->arch.vgic.ext_shared_irqs == NULL )
>> +        return -ENOMEM;
>> +
>> +    for ( i = d->arch.vgic.nr_spis, idx = 0;
>> +          i < vgic_num_spi_lines(d); i++, idx++ )
>> +        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
>> +                              ESPI_IDX2INTID(idx));
>> +
>> +    for ( i = 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
>> +        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);
>> +
>> +    return 0;
>> +}
>> +
>> +struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
> 
> I know that I should made this observation in previous version, but I
> didn't, sorry for that. Anyways, I don't think that this is a good idea
> to introduce this function and vgic_reserve_espi_virq(), as well as
> arch_move_espis(), actually, because in each case this is a code
> duplication, which is not good.
> 
> I think that instead you need to introduce a pair of helpers that will
> map any (e)SPI number to pending_irq[]/allocate_irqs index and back.
> 
> somethink like
> 
> static inline unsigned virq_to_index(int virq)
> {
>     if (is_espi(virq))
>         return ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
>     return virq;
> }
> 
> See below for examples.
> 
>> +{
>> +    irq = ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
>> +    return &d->arch.vgic.pending_irqs[irq];
>> +}
>> +#else
>> +static unsigned int init_vgic_espi(struct domain *d)
>> +{
>> +    return 0;
>> +}
>> +
>> +static unsigned int vgic_num_spi_lines(struct domain *d)
>> +{
>> +    return d->arch.vgic.nr_spis;
>> +}
>> +
>> +struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
>> +{
>> +    return NULL;
>> +}
>> +#endif
>> +
>> +static unsigned int vgic_num_alloc_irqs(struct domain *d)
>> +{
>> +    return vgic_num_spi_lines(d) + NR_LOCAL_IRQS;
>> +}

I do not know where it would be better to put a comment related to 
non-visible in the patch context route_irq_to_guest(), but put it here.

I am afraid, the vgic_num_irqs(d) printed in the following error message 
is not entirely correct with your changes:

route_irq_to_guest():

...

     if ( !vgic_is_valid_line(d, virq) )
     {
         printk(XENLOG_G_ERR
                "the vIRQ number %u is too high for domain %u (max = %u)\n",
                irq, d->domain_id, vgic_num_irqs(d));
         return -EINVAL;
     }


>> +
>>   int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>>   {
>>       int i;
>> @@ -131,6 +262,36 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>>        */
>>       nr_spis = ROUNDUP(nr_spis, 32);
>>   
>> +#ifdef CONFIG_GICV3_ESPI
>> +    /*
>> +     * During domain creation, the dom0less DomUs code or toolstack specifies
>> +     * the maximum INTID, which is defined in the domain config subtracted by
>> +     * 32 to cover the local IRQs (please see the comment to VGIC_DEF_NR_SPIS).
>> +     * To compute the actual number of eSPI that will be usable for,
>> +     * add back 32.
>> +     */
>> +    if ( nr_spis + 32 > ESPI_IDX2INTID(NR_ESPI_IRQS) )
>> +        return -EINVAL;
>> +
>> +    if ( nr_spis + 32 >= ESPI_BASE_INTID )
>> +    {
>> +        d->arch.vgic.nr_espis = min(nr_spis - ESPI_BASE_INTID + 32, 1024U);
>> +        /* Verify if GIC HW can handle provided INTID */
>> +        if ( d->arch.vgic.nr_espis > gic_number_espis() )
>> +            return -EINVAL;
>> +        /*
>> +         * Set the maximum available number for regular
>> +         * SPI to pass the next check
>> +         */
>> +        nr_spis = VGIC_DEF_NR_SPIS;
>> +    }
>> +    else
>> +    {
>> +        /* Domain will use the regular SPI range */
>> +        d->arch.vgic.nr_espis = 0;
>> +    }
>> +#endif
>> +
>>       /* Limit the number of virtual SPIs supported to (1020 - 32) = 988  */
>>       if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
>>           return -EINVAL;
>> @@ -145,7 +306,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>>           return -ENOMEM;
>>   
>>       d->arch.vgic.pending_irqs =
>> -        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
>> +        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
>>       if ( d->arch.vgic.pending_irqs == NULL )
>>           return -ENOMEM;
>>   
>> @@ -156,12 +317,16 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>>       for ( i = 0; i < DOMAIN_NR_RANKS(d); i++ )
>>           vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
>>   
>> +    ret = init_vgic_espi(d);
>> +    if ( ret )
>> +        return ret;
>> +
>>       ret = d->arch.vgic.handler->domain_init(d);
>>       if ( ret )
>>           return ret;
>>   
>>       d->arch.vgic.allocated_irqs =
>> -        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
>> +        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_alloc_irqs(d)));
>>       if ( !d->arch.vgic.allocated_irqs )
>>           return -ENOMEM;
>>   
>> @@ -195,9 +360,27 @@ void domain_vgic_free(struct domain *d)
>>           }
>>       }
>>   
>> +#ifdef CONFIG_GICV3_ESPI
>> +    for ( i = 0; i < d->arch.vgic.nr_espis; i++ )
>> +    {
>> +        struct pending_irq *p = spi_to_pending(d, ESPI_IDX2INTID(i));
>> +
>> +        if ( p->desc )
>> +        {
>> +            ret = release_guest_irq(d, p->irq);
>> +            if ( ret )
>> +                dprintk(XENLOG_G_WARNING, "%pd: Failed to release virq %u ret = %d\n",
>> +                        d, p->irq, ret);
>> +        }
>> +    }
>> +#endif
>> +
>>       if ( d->arch.vgic.handler )
>>           d->arch.vgic.handler->domain_free(d);
>>       xfree(d->arch.vgic.shared_irqs);
>> +#ifdef CONFIG_GICV3_ESPI
>> +    xfree(d->arch.vgic.ext_shared_irqs);
>> +#endif
>>       xfree(d->arch.vgic.pending_irqs);
>>       xfree(d->arch.vgic.allocated_irqs);
>>   }
>> @@ -331,6 +514,8 @@ void arch_move_irqs(struct vcpu *v)
>>           if ( v_target == v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
>>               irq_set_affinity(p->desc, cpu_mask);
>>       }
>> +
>> +    arch_move_espis(v);
>>   }
>>   
>>   void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
>> @@ -538,6 +723,8 @@ struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq)
>>           n = &v->arch.vgic.pending_irqs[irq];
>>       else if ( is_lpi(irq) )
>>           n = v->domain->arch.vgic.handler->lpi_to_pending(v->domain, irq);
>> +    else if ( is_espi(irq) )
>> +        n = espi_to_pending(v->domain, irq);
>>       else
>>           n = &v->domain->arch.vgic.pending_irqs[irq - 32];
>>       return n;
>> @@ -547,6 +734,9 @@ struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
>>   {
>>       ASSERT(irq >= NR_LOCAL_IRQS);
>>   
>> +    if ( is_espi(irq) )
>> +        return espi_to_pending(d, irq);
>> +
> 
> here you can just do
> 
> idx = virq_to_idx(virq);
> 
>>       return &d->arch.vgic.pending_irqs[irq - 32];
> 
> and
> 
> return &d->arch.vgic.pending_irqs[idx];
> 
> instead
> 
>>   }
>>   
>> @@ -668,6 +858,9 @@ bool vgic_reserve_virq(struct domain *d, unsigned int virq)
>>       if ( !vgic_is_valid_line(d, virq) )
>>           return false;
>>   
>> +    if ( is_espi(virq) )
>> +        return vgic_reserve_espi_virq(d, virq);
>> +
> 
> here you can just do
> 
> idx = virq_to_idx(virq)
> 
>>       return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
> 
> and then just
> 
> return !test_and_set_bit(idx, d->arch.vgic.allocated_irqs);
> 
> 
>>   }
>>   
>> @@ -685,7 +878,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>>       else
>>       {
>>           first = 32;
>> -        end = vgic_num_irqs(d);
>> +        end = vgic_num_alloc_irqs(d);
>>       }
> 
> I thinj you need to recalculate "virq" value at the end of this
> function. You'll return index in bitfield, but this is not the same is
> IRQ number in case of eSPIs.

+1

  The helpers I mentioned before can help here.
> 
>>   
>>       /*
> 
> Lastly, I think that it is very wasteful to allocate pending_irqs as
> continuous array, because it will consist mostly of unused entries,
> especially with eSPIs enable. Probably, better approach will be to use radix
> tree. As a bonus, you can use IRQ line number as a key, and get rid of
> all these is_espi() checks and mappings between IRQ number and index in
> the array.  But this is a much more drastic change, and I don't think that it
> should be done in this patch series...
> 


