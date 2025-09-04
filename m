Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDDEB44520
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 20:13:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110610.1459714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuERr-0007wH-Bw; Thu, 04 Sep 2025 18:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110610.1459714; Thu, 04 Sep 2025 18:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuERr-0007tI-7t; Thu, 04 Sep 2025 18:12:39 +0000
Received: by outflank-mailman (input) for mailman id 1110610;
 Thu, 04 Sep 2025 18:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJB8=3P=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uuERp-0007tA-Vv
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 18:12:38 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbbfeab0-89ba-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 20:12:35 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3df2f4aedc7so812328f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 11:12:35 -0700 (PDT)
Received: from [10.17.76.214] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e23d29bb9esm1904026f8f.4.2025.09.04.11.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 11:12:34 -0700 (PDT)
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
X-Inumbo-ID: bbbfeab0-89ba-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757009555; x=1757614355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0UUr3AwLcLrhB6YEzODmxI4kys16aqgKfK/o2RcQ2E=;
        b=O8gC+gukgsa5QjEHu5s1yhd6T+rzX7PpXNZpcp/wAVWuKEimNhkMOru50F0XIVL0sJ
         NXgHHG4jqb0u1i8h8JfLysFf/egDk88IZiTt1Udvn1apy533JpWCLIyWi5pT2CMRh/gR
         XQTc9MvzPxuEzX70nBOYnA9ZD2GHqWj7AZ/bF52Ipr8RmxWVCJpSXmHDmXPMeitMRkKx
         1xTxj9Rb2Z5f+AAvQFrYs0Y8dUT1EqPOwovVP0NBNXCaSc+OygB6HbJNSpxwMog8mxPG
         6FeWjw+zxDd+I3FeB1BT9hAcPMEEv8L7qpbMDZrHfyiFgkyCwYpCjhuzJR8HLQYznf3j
         8xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757009555; x=1757614355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0UUr3AwLcLrhB6YEzODmxI4kys16aqgKfK/o2RcQ2E=;
        b=rFcByBtgyf0upVSAtu82A0cMhKV3zM24Ke3QjVB45UU8qEyH07AP7x9L/956pK6PAG
         9RfCp9hzAp09uoSk+/XZJJbwFilcvPSulcAsPCv/VLucesIKseCJ7ZPwdFsXx87F39hF
         QF1q5xWLRd9t1//NAERYMoX5+KxUAukKJGctuDlDNdft9bfu67fGIvFL3XKHNfEYVeDB
         Si8VjbStXGSsTgoXaoxZ5Q1dvA3vjiVwjlUN31J8dTx5tUil11qZV6VdBw4QgBz8iLhZ
         3UP4O26xYluZqCMkSIv0s1y8MeWAClmwOE01PZJLmMliGiAa/Yw86xWjjPWCFlwtrCNz
         0hfg==
X-Forwarded-Encrypted: i=1; AJvYcCX/SYFHDxaVVEypw5sWZwMkAfvezvoN7VfXymjjzhwgtDQwThd3HtjlDsjbR3xLt63EInenBPznrKI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjMWI8Bgf+HMhlZVgJcfFh5RGt3YCFlOM7ZDSbJ0Mcukuyiu45
	n1rscWnA4RvCFJKJ+ks/pj//qMGP8sOvezEgDomuXFcPQvoTk1j3HHq0
X-Gm-Gg: ASbGncuykkFpiZL/9wr6+jKIh2+vykJ74byU7WFUZGTOknF5C7ebEpO0rb66d+nHN/q
	Z5g/qHJYIMCpbHn5ios8nvD1L1ND8+o/5tfqSvyGkJsnUBpW7qFW+YGfYzlP3tcIvnlXQN/7pgK
	l5wKw0RQyPrGewP51G41ybmDmuGlbZWrLXU4NdnmtbcnJ0ovWgMnL79DjVAjQesZdN6vhtY1ymX
	Jkpmo6WcpDmF7kDxEj8lcjXd9+jPBRNdee+2E2f+//nd3b94qVtCAApyKAP1lz0TYDruYXt4uEw
	tlfbkyp9+84t1HcJEnU8tqhv84UDLc8oIfFm6E0U3alLt4zAEiXybyiWtBcTvvkIORV5a2JduFr
	JeD8IWCzmJX1S2SU4LcsbV3uwYW95j2f7h+EMDuK8V3nBsJYmQheXnF0=
X-Google-Smtp-Source: AGHT+IETZhSOmf7SXVDSQlSkiMOgX+gGwqA0w4/OY+F//VaBIeokPy+vgk9sIlNcdLA+f7SHoEaHxQ==
X-Received: by 2002:a05:6000:2011:b0:3cd:edee:c7f1 with SMTP id ffacd0b85a97d-3d1e07a4d63mr14486267f8f.56.1757009554689;
        Thu, 04 Sep 2025 11:12:34 -0700 (PDT)
Message-ID: <454e10ed-c873-4782-a669-b1dea4ec405f@gmail.com>
Date: Thu, 4 Sep 2025 21:12:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/12] xen/arm: vgic: add resource management for
 extended SPIs
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
 <e91abc4c21f9f1fe425b71b3000e7ec0135d5cb9.1756908472.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <e91abc4c21f9f1fe425b71b3000e7ec0135d5cb9.1756908472.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03.09.25 17:30, Leonid Komarianskyi wrote:

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
> Changes for V6:
> - introduced a new function for index to virq conversion, idx_to_virq.
>    This allows the removal of eSPI-specific functions and enables the
>    reuse of existing code for regular SPIs
> - fixed the return value of vgic_allocate_virq in the case of eSPI
> - updated the error message in route_irq_to_guest(). To simplify it and
>    avoid overcomplicating with INTID ranges, propose removing the
>    information about the max number of IRQs
> - fixed eSPI rank initialization to avoid using EXT_RANK_IDX2NUM for
>    converting the eSPI rank to the extended range
> - updated the recalculation logic to avoid the nr_spis > 1020 -
>    NR_LOCAL_IRQS check when nr_spis is reassigned in the case of eSPI
> - fixed formatting issues for macros
> - minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
>    into appropriate inline functions introduced in the previous patch
> - minor change: changed int to unsigned int for nr_espis

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

preferably with NIT below


> 
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
>   xen/arch/arm/include/asm/vgic.h |  12 +++
>   xen/arch/arm/irq.c              |   3 +-
>   xen/arch/arm/vgic.c             | 174 ++++++++++++++++++++++++++++++--
>   3 files changed, 176 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 3e7cbbb196..1cf0a05832 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -146,6 +146,10 @@ struct vgic_dist {
>       int nr_spis; /* Number of SPIs */
>       unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
>       struct vgic_irq_rank *shared_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +    struct vgic_irq_rank *ext_shared_irqs;
> +    unsigned int nr_espis; /* Number of extended SPIs */
> +#endif
>       /*
>        * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
>        * struct arch_vcpu.
> @@ -243,6 +247,14 @@ struct vgic_ops {
>   /* Number of ranks of interrupt registers for a domain */
>   #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
>   
> +#ifdef CONFIG_GICV3_ESPI
> +#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis + 31) / 32)
> +#endif
> +#define EXT_RANK_MIN (ESPI_BASE_INTID / 32)
> +#define EXT_RANK_MAX ((ESPI_MAX_INTID + 31) / 32)
> +#define EXT_RANK_NUM2IDX(num) ((num) - EXT_RANK_MIN)
> +#define EXT_RANK_IDX2NUM(idx) ((idx) + EXT_RANK_MIN)
> +
>   #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>   #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
>   
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index c934d39bf6..c2f1ceb91f 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -494,8 +494,7 @@ int route_irq_to_guest(struct domain *d, unsigned int virq,
>       if ( !vgic_is_valid_line(d, virq) )
>       {
>           printk(XENLOG_G_ERR
> -               "the vIRQ number %u is too high for domain %u (max = %u)\n",
> -               irq, d->domain_id, vgic_num_irqs(d));
> +               "invalid vIRQ number %u for domain %pd\n", irq, d);
>           return -EINVAL;
>       }
>   
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 2bbf4d99aa..b42aee8d0c 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -25,11 +25,61 @@
>   #include <asm/vgic.h>
>   
>   
> +static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
> +{
> +    if ( idx >= vgic_num_irqs(d) )
> +        return espi_idx_to_intid(idx - vgic_num_irqs(d));
> +
> +    return idx;
> +}
> +
>   bool vgic_is_valid_line(struct domain *d, unsigned int virq)
>   {
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( virq >= ESPI_BASE_INTID &&
> +         virq < espi_idx_to_intid(d->arch.vgic.nr_espis) )
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
> +#endif
> +
>   static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>                                                     unsigned int rank)
>   {
> @@ -37,6 +87,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>           return v->arch.vgic.private_irqs;
>       else if ( rank <= DOMAIN_NR_RANKS(v->domain) )
>           return &v->domain->arch.vgic.shared_irqs[rank - 1];
> +    else if ( is_valid_espi_rank(v->domain, rank) )
> +        return vgic_get_espi_rank(v, rank);
>       else
>           return NULL;
>   }
> @@ -117,6 +169,54 @@ int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
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
> +                              espi_idx_to_intid(idx));
> +
> +    for ( i = 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
> +        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i],
> +                       EXT_RANK_IDX2NUM(i), 0);
> +
> +    return 0;
> +}
> +
> +#else
> +static int init_vgic_espi(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static unsigned int vgic_num_spi_lines(struct domain *d)
> +{
> +    return d->arch.vgic.nr_spis;
> +}
> +
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
> @@ -133,7 +233,39 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>   
>       /* Limit the number of virtual SPIs supported to (1020 - 32) = 988  */
>       if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
> +#ifndef CONFIG_GICV3_ESPI
>           return -EINVAL;
> +#else
> +    {
> +        /*
> +         * During domain creation, the dom0less DomUs code or toolstack
> +         * specifies the maximum INTID, which is defined in the domain
> +         * config subtracted by 32 to cover the local IRQs (please see
> +         * the comment to VGIC_DEF_NR_SPIS). To compute the actual number
> +         * of eSPI that will be usable for, add back 32.
> +         */
> +        nr_spis += 32;
> +        if ( nr_spis > espi_idx_to_intid(NR_ESPI_IRQS) )
> +            return -EINVAL;
> +
> +        if ( nr_spis >= ESPI_BASE_INTID )
> +        {
> +            unsigned int nr_espis = min(nr_spis - ESPI_BASE_INTID, 1024U);
> +
> +            /* Verify if GIC HW can handle provided INTID */
> +            if ( nr_espis > gic_number_espis() )
> +                return -EINVAL;
> +
> +            d->arch.vgic.nr_espis = nr_espis;
> +            /* Set the maximum available number for regular SPIs */
> +            nr_spis = VGIC_DEF_NR_SPIS;
> +        }
> +        else
> +        {
> +            return -EINVAL;
> +        }
> +    }
> +#endif
>   
>       d->arch.vgic.nr_spis = nr_spis;
>   
> @@ -145,7 +277,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>           return -ENOMEM;
>   
>       d->arch.vgic.pending_irqs =
> -        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
> +        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));


So, you do not keep two separate pending_irqs arrays, just like 
the shared_irqs and ext_shared_irqs arrays. You allocate
pending_irqs array as a single flat array to hold both regular SPIs and 
eSPIs with looks like the following mapping ---> regular SPIs 
[0..nr_spis-1] and eSPIs [nr_spis..nr_spis+nr_espis-1].

NIT: I would add a comment above the pending_irqs field in struct 
vgic_dist saying that an array is also supposed to hold extended SPIs if 
present, or something like that.
Otherwise, by just looking into struct vgic_dist in the header, it is 
not clear where other (than ext_shared_irqs, nr_espis) eSPI bits are.


>       if ( d->arch.vgic.pending_irqs == NULL )
>           return -ENOMEM;
>   
> @@ -156,12 +288,16 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
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

NIT: The same goes for the allocated_irqs field.

>       if ( !d->arch.vgic.allocated_irqs )
>           return -ENOMEM;
>   


[snip]

