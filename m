Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52879B3F80A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 10:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105794.1456631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMCD-0000Pi-En; Tue, 02 Sep 2025 08:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105794.1456631; Tue, 02 Sep 2025 08:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMCD-0000Nr-Bz; Tue, 02 Sep 2025 08:16:53 +0000
Received: by outflank-mailman (input) for mailman id 1105794;
 Tue, 02 Sep 2025 08:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cv9L=3N=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1utMCB-0000Nl-EM
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 08:16:51 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d1f2ab2-87d5-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 10:16:50 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-336af6356a5so33544681fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 01:16:50 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032caasm3127831fa.35.2025.09.02.01.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 01:16:48 -0700 (PDT)
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
X-Inumbo-ID: 2d1f2ab2-87d5-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756801010; x=1757405810; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLY1d8KA4KLUy6FG3YkFSgHCh3n7IxayQ3VVQNip50o=;
        b=BuTkZXp3zsM97AEjwBGgfOpDNm9JPK8y/2vMm04a8NpA5wupiqC3OE5uDlWjhE3piY
         YIOpR0yCa3FYE7Lw9ZcZrKvd0d5aY5SPZgpgyLadWOhJPUVurlyV4CFbIcBdkhXubPgb
         1VL4YHNMUCSZmuh76VyayH3rdr1CMh4DtOWaKyu3gWOsRaPqn0Wfa7z8qdy8OB5dnTJy
         i9fl3KjQTZv9f0oQBgI75KyIwdqNXEChUmRiykCF4USDLHwVGjNnNhWVm7zZ5fx2F56X
         mdqttGi1aMXh7EKgV0it7BL161cKY3zktdqIkQ3tfOsbaZONXrqzkg6N35Ul0iE7rWpG
         teyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756801010; x=1757405810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLY1d8KA4KLUy6FG3YkFSgHCh3n7IxayQ3VVQNip50o=;
        b=O6Wk386Z4+nGvXjPtC4H0jMcnTkNpExNccqPo/71J984AzrFCcsb93VFI88waMagKv
         Xd1ke26tuyhRUm9Cc1xoOtIE/mt8yEEFNpXq7KfmIudduSIc8y8Ozfpjcg01M/y58NGT
         SPj1Rilgw2QJVyCIYxmQQBPKeecMwaSb8OQKfY6YRgTzVOjskqPqw1BO4zx1OcFdTltX
         fyfthmR0I1XTH5s1pSuQ8ODh7iFMAV1Aew1zi+BLWAJoveWfmH+WXOtWIcxkOwolLsh2
         BDhcH8c6OFwmXybdOyTD32FxWNEXmoVHIXvp6Geh0viLKKr36sj0q+Um5VPdO6bIZhH+
         27dw==
X-Gm-Message-State: AOJu0YzY5oIQ7AvJwbFACuuWCfYMNHW3El02+LM4326RtSh7SHcMqlfo
	dRCCNLMtHB6sBMcAf6qYkNeD4Mc/8aqQjtu7nILI1XiK4OoScFsk7U3B
X-Gm-Gg: ASbGncv4i8/ZsQ1N99Ttf8XmylPJf6ohD5+D1hKECKalQtQImlbKdPcUtiTvqqwKKG6
	f3wimQUygDhvjikYxIpNQe+O8PnX/fI77VKECzrTAO7EhDhxE0uP5Zp0FuEng+hkon6hNQw2ezJ
	3xeHuQrZdSfornaqLv10TuMcVmf+kstNPYx2z+4JFauE1VhMPrIZYkJW00+CnM7iCPQReYxoo+j
	Ye2VlJkGGNoqLXCubwpYX+qNh0292+1gmCXA1zvVED47j/VqIgfrKz/mQDNCWTv9ywUJLsBNBwF
	v5zOwfrSNMSQuz7pC8+pJIyr6YNwamDSWckWXP+/KXQL8NJHuEzYnaq+CYNhLL8U/9zDF3dp7bb
	ZIeZGSoW+HYDTonY1ET/T/h1VdA==
X-Google-Smtp-Source: AGHT+IEQHcZH6lTyvrBcZ45nn6xjQyHDPc+u1M8NCYQ4VmJ3xkt5+1JtJNwRvA+shTlyU1ZXOMWFmw==
X-Received: by 2002:a2e:a488:0:b0:32a:8bf4:3a81 with SMTP id 38308e7fff4ca-336ca9f4b3fmr22850551fa.5.1756801009346;
        Tue, 02 Sep 2025 01:16:49 -0700 (PDT)
Message-ID: <1aad2e68-04f2-4a71-8a21-8ee5360a7062@gmail.com>
Date: Tue, 2 Sep 2025 11:16:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] xen/arm: vgic: add resource management for
 extended SPIs
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <4b13dea924eabf1370d3f31030f3eef48371de06.1756481577.git.leonid_komarianskyi@epam.com>
 <87y0r1x3g2.fsf@epam.com> <be5a9af6-4d63-4075-8d38-fdb1576dfce4@gmail.com>
 <0e9e5b72-2bf1-46a8-867d-8e6d306fe956@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <0e9e5b72-2bf1-46a8-867d-8e6d306fe956@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01.09.25 21:00, Leonid Komarianskyi wrote:
> Hello Oleksandr,

Hello Leonid


> 
> Thank you for your review.
> 
> On 31.08.25 18:58, Oleksandr Tyshchenko wrote:
>>
>>
>> On 29.08.25 23:45, Volodymyr Babchuk wrote:
>>
>> Hello Leonid, Volodymyr
>>
>>>
>>> Hi Leonid,
>>>
>>> Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:
>>>
>>>> This change introduces resource management in the VGIC to handle
>>>> extended SPIs introduced in GICv3.1. The pending_irqs and
>>>> allocated_irqs arrays are resized to support the required
>>>> number of eSPIs, based on what is supported by the hardware and
>>>> requested by the guest. A new field, ext_shared_irqs, is added
>>>> to the VGIC structure to store information about eSPIs, similar
>>>> to how shared_irqs is used for regular SPIs.
>>>>
>>>> Since the eSPI range starts at INTID 4096 and INTIDs between 1025
>>>> and 4095 are reserved, helper macros are introduced to simplify the
>>>> transformation of indices and to enable easier access to eSPI-specific
>>>> resources. These changes prepare the VGIC for processing eSPIs as
>>>> required by future functionality.
>>>>
>>>> The initialization and deinitialization paths for vgic have been updated
>>>> to allocate and free these resources appropriately. Additionally,
>>>> updated handling of INTIDs greater than 1024, passed from the toolstack
>>>> during domain creation, and verification logic ensures only valid SPI or
>>>> eSPI INTIDs are used.
>>>>
>>>> The existing SPI behavior remains unaffected when guests do not request
>>>> eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
>>>> option is disabled.
>>>>
>>>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>>>>
>>>> ---
>>>> Changes in V5:
>>>> - removed the has_espi field because it can be determined by checking
>>>>     whether domain->arch.vgic.nr_espis is zero or not
>>>> - since vgic_ext_rank_offset is not used in this patch, it has been
>>>>     moved to the appropriate patch in the patch series, which implements
>>>>     vgic eSPI registers emulation and requires this function
>>>> - removed ifdefs for eSPI-specific macros to reduce the number of ifdefs
>>>>     and code duplication in further changes
>>>> - fixed minor nit: used %pd for printing domain with its ID
>>
>> @Leonid, thanks for optimizing the series, now it looks much better (the
>> number of #ifdef-s is reduced, code is reused).
>>
>>
> 
> I am doing my best, and you and the other reviewers are helping me
> improve the code. Thank you for that!
> 
>>>>
>>>> Changes in V4:
>>>> - added has_espi field to simplify determining whether a domain is able
>>>>     to operate with eSPI
>>>> - fixed formatting issues and misspellings
>>>>
>>>> Changes in V3:
>>>> - fixed formatting for lines with more than 80 symbols
>>>> - introduced helper functions to be able to use stubs in case of
>>>>     CONFIG_GICV3_ESPI disabled, and as a result, reduce the number of
>>>>     #ifdefs
>>>> - fixed checks for nr_spis in domain_vgic_init
>>>> - updated comment about nr_spis adjustments with dom0less mention
>>>> - moved comment with additional explanations before checks
>>>> - used unsigned int for indexes since they cannot be negative
>>>> - removed unnecessary parentheses
>>>> - move vgic_ext_rank_offset to the below ifdef guard, to reduce the
>>>>     number of ifdefs
>>>>
>>>> Changes in V2:
>>>> - change is_espi_rank to is_valid_espi_rank to verify whether the array
>>>>     element ext_shared_irqs exists. The previous version, is_espi_rank,
>>>>     only checked if the rank index was less than the maximum possible
>>>> eSPI
>>>>     rank index, but this could potentially result in accessing a
>>>>     non-existing array element. To address this, is_valid_espi_rank was
>>>>     introduced, which ensures that the required eSPI rank exists
>>>> - move gic_number_espis to
>>>>     xen/arm: gicv3: implement handling of GICv3.1 eSPI
>>>> - update vgic_is_valid_irq checks to allow operating with eSPIs
>>>> - remove redundant newline in vgic_allocate_virq
>>>> ---
>>>>    xen/arch/arm/include/asm/vgic.h |  12 ++
>>>>    xen/arch/arm/vgic.c             | 199 +++++++++++++++++++++++++++++++-
>>>>    2 files changed, 208 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/
>>>> asm/vgic.h
>>>> index 3e7cbbb196..912d5b7694 100644
>>>> --- a/xen/arch/arm/include/asm/vgic.h
>>>> +++ b/xen/arch/arm/include/asm/vgic.h
>>>> @@ -146,6 +146,10 @@ struct vgic_dist {
>>>>        int nr_spis; /* Number of SPIs */
>>>>        unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
>>>>        struct vgic_irq_rank *shared_irqs;
>>>> +#ifdef CONFIG_GICV3_ESPI
>>>> +    struct vgic_irq_rank *ext_shared_irqs;
>>>> +    int nr_espis; /* Number of extended SPIs */
>>
>> It seems you have agreed (V4) that nr_espis could not be negative.
>>
> 
> I appologize for that, I missed this change. I will fix it in V6.

everything is fine, no need to apologize


> 
>>>> +#endif
>>>>        /*
>>>>         * SPIs are domain global, SGIs and PPIs are per-VCPU and
>>>> stored in
>>>>         * struct arch_vcpu.
>>>> @@ -243,6 +247,14 @@ struct vgic_ops {
>>>>    /* Number of ranks of interrupt registers for a domain */
>>>>    #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
>>>> +#ifdef CONFIG_GICV3_ESPI
>>>> +#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis+31)/32)
>>>> +#endif
>>>> +#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
>>>> +#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
>>>> +#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
>>>> +#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)
>>>> +
>>>>    #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>>>>    #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
>>>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>>>> index 2bbf4d99aa..c9b9528c66 100644
>>>> --- a/xen/arch/arm/vgic.c
>>>> +++ b/xen/arch/arm/vgic.c
>>>> @@ -27,9 +27,82 @@
>>>>    bool vgic_is_valid_line(struct domain *d, unsigned int virq)
>>>>    {
>>>> +#ifdef CONFIG_GICV3_ESPI
>>>> +    if ( virq >= ESPI_BASE_INTID &&
>>>> +         virq < ESPI_IDX2INTID(d->arch.vgic.nr_espis) )
>>>> +        return true;
>>>> +#endif
>>>> +
>>>>        return virq < vgic_num_irqs(d);
>>>>    }
>>>> +#ifdef CONFIG_GICV3_ESPI
>>>> +/*
>>>> + * Since eSPI indexes start from 4096 and numbers from 1024 to
>>>> + * 4095 are forbidden, we need to check both lower and upper
>>>> + * limits for ranks.
>>>> + */
>>>> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int
>>>> rank)
>>>> +{
>>>> +    return rank >= EXT_RANK_MIN &&
>>>> +           EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d);
>>>> +}
>>>> +
>>>> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
>>>> +                                                       unsigned int
>>>> rank)
>>>> +{
>>>> +    return &v->domain-
>>>>> arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
>>>> +}
>>>> +
>>>> +static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned
>>>> int virq)
>>>> +{
>>>> +    return !test_and_set_bit(ESPI_INTID2IDX(virq) + vgic_num_irqs(d),
>>>> +                             d->arch.vgic.allocated_irqs);
>>>> +}
>>>> +
>>>> +static void arch_move_espis(struct vcpu *v)
>>>
>>> I don't need you need a copy of arch_move_irqs(). Se below for more info.
>>>
>>>> +{
>>>> +    const cpumask_t *cpu_mask = cpumask_of(v->processor);
>>>> +    struct domain *d = v->domain;
>>>> +    struct pending_irq *p;
>>>> +    struct vcpu *v_target;
>>>> +    unsigned int i;
>>>> +
>>>> +    for ( i = ESPI_BASE_INTID;
>>>> +          i < EXT_RANK_IDX2NUM(d->arch.vgic.nr_espis); i++ )
>>>> +    {
>>>> +        v_target = vgic_get_target_vcpu(v, i);
>>>> +        p = irq_to_pending(v_target, i);
>>>> +
>>>> +        if ( v_target == v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p-
>>>>> status) )
>>>> +            irq_set_affinity(p->desc, cpu_mask);
>>>> +    }
>>>> +}
>>>> +#else
>>>> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int
>>>> rank)
>>>> +{
>>>> +    return false;
>>>> +}
>>>> +
>>>> +/*
>>>> + * This function is stub and will not be called if CONFIG_GICV3_ESPI=n,
>>>> + * because in this case, is_valid_espi_rank will always return false.
>>>> + */
>>>> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
>>>> +                                                       unsigned int
>>>> rank)
>>>> +{
>>>> +    ASSERT_UNREACHABLE();
>>>> +    return NULL;
>>>> +}
>>>> +
>>>> +static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned
>>>> int virq)
>>>> +{
>>>> +    return false;
>>>> +}
>>>> +
>>>> +static void arch_move_espis(struct vcpu *v) { }
>>>> +#endif
>>>> +
>>>>    static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>>>>                                                      unsigned int rank)
>>>>    {
>>>> @@ -37,6 +110,8 @@ static inline struct vgic_irq_rank
>>>> *vgic_get_rank(struct vcpu *v,
>>>>            return v->arch.vgic.private_irqs;
>>>>        else if ( rank <= DOMAIN_NR_RANKS(v->domain) )
>>>>            return &v->domain->arch.vgic.shared_irqs[rank - 1];
>>>> +    else if ( is_valid_espi_rank(v->domain, rank) )
>>>> +        return vgic_get_espi_rank(v, rank);
>>>>        else
>>>>            return NULL;
>>>>    }
>>>> @@ -117,6 +192,62 @@ int domain_vgic_register(struct domain *d,
>>>> unsigned int *mmio_count)
>>>>        return 0;
>>>>    }
>>>> +#ifdef CONFIG_GICV3_ESPI
>>>> +static unsigned int vgic_num_spi_lines(struct domain *d)
>>>> +{
>>>> +    return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
>>>> +}
>>>> +
>>>> +static int init_vgic_espi(struct domain *d)
>>>> +{
>>>> +    unsigned int i, idx;
>>>> +
>>>> +    if ( d->arch.vgic.nr_espis == 0 )
>>>> +        return 0;
>>>> +
>>>> +    d->arch.vgic.ext_shared_irqs =
>>>> +        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
>>>> +    if ( d->arch.vgic.ext_shared_irqs == NULL )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    for ( i = d->arch.vgic.nr_spis, idx = 0;
>>>> +          i < vgic_num_spi_lines(d); i++, idx++ )
>>>> +        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
>>>> +                              ESPI_IDX2INTID(idx));
>>>> +
>>>> +    for ( i = 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
>>>> +        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
>>>
>>> I know that I should made this observation in previous version, but I
>>> didn't, sorry for that. Anyways, I don't think that this is a good idea
>>> to introduce this function and vgic_reserve_espi_virq(), as well as
>>> arch_move_espis(), actually, because in each case this is a code
>>> duplication, which is not good.
>>>
>>> I think that instead you need to introduce a pair of helpers that will
>>> map any (e)SPI number to pending_irq[]/allocate_irqs index and back.
>>>
>>> somethink like
>>>
>>> static inline unsigned virq_to_index(int virq)
>>> {
>>>      if (is_espi(virq))
>>>          return ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
>>>      return virq;
>>> }
>>>
>>> See below for examples.
>>>
>>>> +{
>>>> +    irq = ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
>>>> +    return &d->arch.vgic.pending_irqs[irq];
>>>> +}
>>>> +#else
>>>> +static unsigned int init_vgic_espi(struct domain *d)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static unsigned int vgic_num_spi_lines(struct domain *d)
>>>> +{
>>>> +    return d->arch.vgic.nr_spis;
>>>> +}
>>>> +
>>>> +struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
>>>> +{
>>>> +    return NULL;
>>>> +}
>>>> +#endif
>>>> +
>>>> +static unsigned int vgic_num_alloc_irqs(struct domain *d)
>>>> +{
>>>> +    return vgic_num_spi_lines(d) + NR_LOCAL_IRQS;
>>>> +}
>>
>> I do not know where it would be better to put a comment related to non-
>> visible in the patch context route_irq_to_guest(), but put it here.
>>
>> I am afraid, the vgic_num_irqs(d) printed in the following error message
>> is not entirely correct with your changes:
>>
>> route_irq_to_guest():
>>
>> ...
>>
>>       if ( !vgic_is_valid_line(d, virq) )
>>       {
>>           printk(XENLOG_G_ERR
>>                  "the vIRQ number %u is too high for domain %u (max =
>> %u)\n",
>>                  irq, d->domain_id, vgic_num_irqs(d));
>>           return -EINVAL;
>>       }
>>
>>
> 
> Would it be okay to change the error message to something like:
> "invalid vIRQ number %u for domain %pd\n"
> 
> I understand that it is a more generic error message, but I think it
> might become overly complicated if I add more information stating that
> the IRQ should be within the range 0...vgic_num_irqs(d) or
> 4096...ESPI_IDX2INTID(d->arch.vgic.nr_espis).
> 

I see, so it would not be precise to just let's say print 
vgic_num_irqs(d) or ESPI_IDX2INTID(d->arch.vgic.nr_espis) as "(max = 
%u)" since the vIRQ range is not contiguous.

Well, removing extra information (max) that could help the user to 
figure out what was wrong is not ideal, but if you think it would 
overcomplicate things, then I (not a maintainer of this code) would be 
okay with the proposed simplified error message.





