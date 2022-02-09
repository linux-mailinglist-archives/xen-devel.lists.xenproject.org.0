Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB3B4AF204
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 13:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269107.463098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHmIY-0000Ld-6c; Wed, 09 Feb 2022 12:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269107.463098; Wed, 09 Feb 2022 12:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHmIY-0000JK-3B; Wed, 09 Feb 2022 12:42:14 +0000
Received: by outflank-mailman (input) for mailman id 269107;
 Wed, 09 Feb 2022 12:42:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHmIW-0000JE-Mg
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 12:42:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHmIW-0004EU-Ha; Wed, 09 Feb 2022 12:42:12 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.1.215]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHmIW-00047g-Bo; Wed, 09 Feb 2022 12:42:12 +0000
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
	bh=NdjtchxeUtxUw2W7E0QA144yGg9uqmJLRANmaF4d+4I=; b=sPpFrtIPWXlw/IgK29ydwCAl6C
	jq4iUZI5PepZrKRhDj8iRxf9HqTXwQkoWuGVeQm8PuAaDzMa98n5GAX8fXOfKCt5IRQ32dnQEg2lN
	2vU69yszY1P/LtvnYWURSgSi5AQbt5RQyy9dRZvg1JRvBoC5dRUXySYpGn4tyNeHrB10=;
Message-ID: <6d73e9cd-1293-d2cf-5b61-d78246509a03@xen.org>
Date: Wed, 9 Feb 2022 12:42:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 02/11] xen: introduce CDF_directmap
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20220127074929.502885-1-penny.zheng@arm.com>
 <20220127074929.502885-3-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220127074929.502885-3-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/01/2022 07:49, Penny Zheng wrote:
> +- direct-map
> +
> +    Only available when statically allocated memory is used for the domain.
> +    An empty property to request the memory of the domain to be
> +    direct-map (guest physical address == physical address).

NIT: I would add "host" just after == so it is more explicit that we are 
talking about host physical address.

> +
>   Under the "xen,domain" compatible node, one or more sub-nodes are present
>   for the DomU kernel and ramdisk.
>   
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 92a6c509e5..8110c1df86 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -692,7 +692,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>   }
>   
>   int arch_domain_create(struct domain *d,
> -                       struct xen_domctl_createdomain *config)
> +                       struct xen_domctl_createdomain *config,
> +                       unsigned int flags)
>   {
>       int rc, count = 0;
>   
> @@ -708,6 +709,8 @@ int arch_domain_create(struct domain *d,
>       ioreq_domain_init(d);
>   #endif
>   
> +    d->arch.directmap = flags & CDF_directmap;
> +
>       /* p2m_init relies on some value initialized by the IOMMU subsystem */
>       if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
>           goto fail;

[...]

> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 9b3647587a..cb37ce89ec 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -29,8 +29,7 @@ enum domain_type {
>   #define is_64bit_domain(d) (0)
>   #endif
>   
> -/* The hardware domain has always its memory direct mapped. */
> -#define is_domain_direct_mapped(d) is_hardware_domain(d)
> +#define is_domain_direct_mapped(d) (d->arch.directmap)

The outter parentheses are not necessary. However, you want to surround 
d with parentheses to avoid any surprise.

>   
>   struct vtimer {
>       struct vcpu *v;
> @@ -89,6 +88,8 @@ struct arch_domain
>   #ifdef CONFIG_TEE
>       void *tee;
>   #endif
> +
> +    bool directmap;

I am OK with creating a boolean for now. But long term, I think we 
should switch to storing the flags directly as this is more space 
efficient and make easier to add new flags (see d->options for instance).

>   }  __cacheline_aligned;
>   
>   struct arch_vcpu
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index ef1812dc14..9835f90ea0 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -722,7 +722,8 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>   }
>   
>   int arch_domain_create(struct domain *d,
> -                       struct xen_domctl_createdomain *config)
> +                       struct xen_domctl_createdomain *config,
> +                       unsigned int flags)

Shouldn't we return an error if the flag CDF_directmap is on x86? The 
other alternative is to...

>   {
>       bool paging_initialised = false;
>       uint32_t emflags;
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index a79103e04a..3742322d22 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -659,7 +659,7 @@ struct domain *domain_create(domid_t domid,
>           radix_tree_init(&d->pirq_tree);
>       }
>   
> -    if ( (err = arch_domain_create(d, config)) != 0 )
> +    if ( (err = arch_domain_create(d, config, flags)) != 0 )
>           goto fail;
>       init_status |= INIT_arch;
>   
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index cfb0b47f13..3a2371d715 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -31,6 +31,8 @@ void arch_get_domain_info(const struct domain *d,
>   /* CDF_* constant. Internal flags for domain creation. */
>   /* Is this a privileged domain? */
>   #define CDF_privileged           (1U << 0)
> +/* Should domain memory be directly mapped? */
> +#define CDF_directmap            (1U << 1)

... protect this with #ifdef CONFIG_ARM.

Jan, what do you think?

>   
>   /*
>    * Arch-specifics.
> @@ -65,7 +67,8 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
>   void unmap_vcpu_info(struct vcpu *v);
>   
>   int arch_domain_create(struct domain *d,
> -                       struct xen_domctl_createdomain *config);
> +                       struct xen_domctl_createdomain *config,
> +                       unsigned int flags);
>   
>   void arch_domain_destroy(struct domain *d);
>   

Cheers,

-- 
Julien Grall

