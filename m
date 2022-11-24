Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7C36380A8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 22:30:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448050.704859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyJnA-0000a4-Tt; Thu, 24 Nov 2022 21:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448050.704859; Thu, 24 Nov 2022 21:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyJnA-0000XH-R6; Thu, 24 Nov 2022 21:29:56 +0000
Received: by outflank-mailman (input) for mailman id 448050;
 Thu, 24 Nov 2022 21:29:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oyJn9-0000XB-Dx
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 21:29:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyJn7-0006s0-Lj; Thu, 24 Nov 2022 21:29:53 +0000
Received: from [54.239.6.186] (helo=[192.168.1.238])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyJn7-0003w8-Ej; Thu, 24 Nov 2022 21:29:53 +0000
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
	bh=VxbrYK7WZDIG0H7Mg3eWIuTmq1Wga6d6EunaCC48low=; b=fHGP/RqIPY56bsNtl1f5fgShLz
	ZUSt0rnqMlnvmU5ij/hscOj+CCou0igRcPKlGU/Z1kcr934c0tr4vegDeibdFo+5X7HNtHWHg5/YK
	w5N1izH/Xd1vU0ZgSQxg3NtgWVGzhg6SQHt1EXY+cmLLCGSMG6UlVBoaqEIozOcjm8K8=;
Message-ID: <f1229a27-f92c-a0dc-928e-1d78b928fdd0@xen.org>
Date: Thu, 24 Nov 2022 22:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

I am still digesting this series and replying with some initial comments.

On 19/10/2022 09:43, Jan Beulich wrote:
> The registration by virtual/linear address has downsides: At least on
> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
> PV domains the areas are inaccessible (and hence cannot be updated by
> Xen) when in guest-user mode.
> 
> In preparation of the introduction of new vCPU operations allowing to
> register the respective areas (one of the two is x86-specific) by
> guest-physical address, flesh out the map/unmap functions.
> 
> Noteworthy differences from map_vcpu_info():
> - areas can be registered more than once (and de-registered),
> - remote vCPU-s are paused rather than checked for being down (which in
>    principle can change right after the check),
> - the domain lock is taken for a much smaller region.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: By using global domain page mappings the demand on the underlying
>       VA range may increase significantly. I did consider to use per-
>       domain mappings instead, but they exist for x86 only. Of course we
>       could have arch_{,un}map_guest_area() aliasing global domain page
>       mapping functions on Arm and using per-domain mappings on x86. Yet
>       then again map_vcpu_info() doesn't do so either (albeit that's
>       likely to be converted subsequently to use map_vcpu_area() anyway).
> 
> RFC: In map_guest_area() I'm not checking the P2M type, instead - just
>       like map_vcpu_info() - solely relying on the type ref acquisition.
>       Checking for p2m_ram_rw alone would be wrong, as at least
>       p2m_ram_logdirty ought to also be okay to use here (and in similar
>       cases, e.g. in Argo's find_ring_mfn()). p2m_is_pageable() could be
>       used here (like altp2m_vcpu_enable_ve() does) as well as in
>       map_vcpu_info(), yet then again the P2M type is stale by the time
>       it is being looked at anyway without the P2M lock held.
> 
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1563,7 +1563,82 @@ int map_guest_area(struct vcpu *v, paddr
>                      struct guest_area *area,
>                      void (*populate)(void *dst, struct vcpu *v))
>   {
> -    return -EOPNOTSUPP;
> +    struct domain *currd = v->domain;
> +    void *map = NULL;
> +    struct page_info *pg = NULL;
> +    int rc = 0;
> +
> +    if ( gaddr )

0 is technically a valid (guest) physical address on Arm.

> +    {
> +        unsigned long gfn = PFN_DOWN(gaddr);

This could be gfn_t for adding some type safety.

> +        unsigned int align;
> +        p2m_type_t p2mt;
> +
> +        if ( gfn != PFN_DOWN(gaddr + size - 1) )
> +            return -ENXIO;
> +
> +#ifdef CONFIG_COMPAT
> +        if ( has_32bit_shinfo(currd) )
> +            align = alignof(compat_ulong_t);
> +        else
> +#endif
> +            align = alignof(xen_ulong_t);
> +        if ( gaddr & (align - 1) )
> +            return -ENXIO;
> +
> +        rc = check_get_page_from_gfn(currd, _gfn(gfn), false, &p2mt, &pg);
> +        if ( rc )
> +            return rc;
> +
> +        if ( !get_page_type(pg, PGT_writable_page) )
> +        {
> +            put_page(pg);
> +            return -EACCES;
> +        }
> +
> +        map = __map_domain_page_global(pg);
> +        if ( !map )
> +        {
> +            put_page_and_type(pg);
> +            return -ENOMEM;
> +        }
> +        map += PAGE_OFFSET(gaddr);
> +    }
> +
> +    if ( v != current )
> +    {
> +        if ( !spin_trylock(&currd->hypercall_deadlock_mutex) )
> +        {
> +            rc = -ERESTART;
> +            goto unmap;
> +        }
> +
> +        vcpu_pause(v);

AFAIU, the goal of vcpu_pause() here is to guarantee that the "area" 
will not be touched by another pCPU. However, looking at the function 
context_switch() we have:

sched_context_switched(prev, next);
_update_runstate_area();

The first function will set v->is_running to false (see 
vcpu_context_saved()). So I think the "area" could be touched even afte 
vcpu_pause() is returned.

Therefore, I think we will need _update_runstate_area() (or 
update_runstate_area()) to be called first.

> +
> +        spin_unlock(&currd->hypercall_deadlock_mutex);
> +    }
> +
> +    domain_lock(currd);
> +
> +    if ( map )
> +        populate(map, v);
> +
> +    SWAP(area->pg, pg);
> +    SWAP(area->map, map);
> +
> +    domain_unlock(currd);
> +
> +    if ( v != current )
> +        vcpu_unpause(v);
> +
> + unmap:
> +    if ( pg )
> +    {
> +        unmap_domain_page_global(map);
> +        put_page_and_type(pg);
> +    }
> +
> +    return rc;
>   }
>   
>   /*
> @@ -1573,6 +1648,22 @@ int map_guest_area(struct vcpu *v, paddr
>    */
>   void unmap_guest_area(struct vcpu *v, struct guest_area *area)
>   {
> +    struct domain *d = v->domain;
> +    void *map;
> +    struct page_info *pg;

AFAIU, the assumption is the vCPU should be paused here. Should we add 
an ASSERT()?

> +
> +    domain_lock(d);
> +    map = area->map;
> +    area->map = NULL;
> +    pg = area->pg;
> +    area->pg = NULL;
> +    domain_unlock(d);
> +
> +    if ( pg )
> +    {
> +        unmap_domain_page_global(map);
> +        put_page_and_type(pg);
> +    }
>   }
>   
>   int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
> 

Cheers,

-- 
Julien Grall

