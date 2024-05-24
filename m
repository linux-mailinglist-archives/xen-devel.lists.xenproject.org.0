Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6828CE589
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 14:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729528.1134720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUT3-0006Lo-DX; Fri, 24 May 2024 12:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729528.1134720; Fri, 24 May 2024 12:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUT3-0006Jt-A7; Fri, 24 May 2024 12:56:17 +0000
Received: by outflank-mailman (input) for mailman id 729528;
 Fri, 24 May 2024 12:56:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAUT1-0006Jn-Jc
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 12:56:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAUT1-0001cc-8h; Fri, 24 May 2024 12:56:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAUT1-00023j-1R; Fri, 24 May 2024 12:56:15 +0000
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
	bh=KSo6E1/ypMC6exwEzyNt1iyZhi/Mxf+YhL6fenkFbKw=; b=fN0IRUm0zeYwB8LPnynmOuoZka
	bMWL8jaIEymffoLA0b5s2kLJ+VbVfR+mPf75zPKqpLK/n8rZRYlUhRKtFdD6EtMVtQseQKoptFAol
	8Gy5jZfKpzVycOmB5sgfv9MuD6b/b+MEFNsw6Bj6MpfFhHPnwf6Z77qouZ2VErX4xLTs=;
Message-ID: <30d78526-da89-4228-9cf4-e9792ed2468d@xen.org>
Date: Fri, 24 May 2024 13:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] xen/p2m: put reference for level 2 superpage
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240524124055.3871399-1-luca.fancellu@arm.com>
 <20240524124055.3871399-4-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240524124055.3871399-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 24/05/2024 13:40, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> We are doing foreign memory mapping for static shared memory, and
> there is a great possibility that it could be super mapped.
> But today, p2m_put_l3_page could not handle superpages.
> 
> This commits implements a new function p2m_put_l2_superpage to handle
> 2MB superpages, specifically for helping put extra references for
> foreign superpages.
> 
> Modify relinquish_p2m_mapping as well to take into account preemption
> when type is foreign memory and order is above 9 (2MB).
> 
> Currently 1GB superpages are not handled because Xen is not preemptible
> and therefore some work is needed to handle such superpages, for which
> at some point Xen might end up freeing memory and therefore for such a
> big mapping it could end up in a very long operation.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
>   - optimised the path to call put_page() on the foreign mapping as
>     Julien suggested. Add a comment in p2m_put_l2_superpage to state
>     that any changes needs to take into account some change in the
>     relinquish code. (Julien)
> v3 changes:
>   - Add reasoning why we don't support now 1GB superpage, remove level_order
>     variable from p2m_put_l2_superpage, update TODO comment inside
>     p2m_free_entry, use XEN_PT_LEVEL_ORDER(2) instead of value 9 inside
>     relinquish_p2m_mapping. (Michal)
> v2:
>   - Do not handle 1GB super page as there might be some issue where
>     a lot of calls to put_page(...) might be issued which could lead
>     to free memory that is a long operation.
> v1:
>   - patch from https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-9-Penny.Zheng@arm.com/
> ---
>   xen/arch/arm/mmu/p2m.c | 82 +++++++++++++++++++++++++++++++-----------
>   1 file changed, 62 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 41fcca011cf4..986c5a03c54b 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -753,34 +753,66 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
>       return rc;
>   }
>   
> -/*
> - * Put any references on the single 4K page referenced by pte.
> - * TODO: Handle superpages, for now we only take special references for leaf
> - * pages (specifically foreign ones, which can't be super mapped today).
> - */
> -static void p2m_put_l3_page(const lpae_t pte)
> +static void p2m_put_foreign_page(struct page_info *pg)
>   {
> -    mfn_t mfn = lpae_get_mfn(pte);
> -
> -    ASSERT(p2m_is_valid(pte));
> -
>       /*
> -     * TODO: Handle other p2m types
> -     *
>        * It's safe to do the put_page here because page_alloc will
>        * flush the TLBs if the page is reallocated before the end of
>        * this loop.
>        */
> -    if ( p2m_is_foreign(pte.p2m.type) )
> +    put_page(pg);
> +}
> +
> +/* Put any references on the single 4K page referenced by mfn. */
> +static void p2m_put_l3_page(mfn_t mfn, p2m_type_t type)
> +{
> +    /* TODO: Handle other p2m types */
> +    if ( p2m_is_foreign(type) )
>       {
>           ASSERT(mfn_valid(mfn));
> -        put_page(mfn_to_page(mfn));
> +        p2m_put_foreign_page(mfn_to_page(mfn));
>       }
>       /* Detect the xenheap page and mark the stored GFN as invalid. */
> -    else if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
> +    else if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
>           page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
>   }
>   
> +/* Put any references on the superpage referenced by mfn. */
> +static void p2m_put_l2_superpage(mfn_t mfn, p2m_type_t type)
> +{
> +    struct page_info *pg;
> +    unsigned int i;
> +
> +    /*
> +     * TODO: Handle other p2m types, but be aware that any changes to handle
> +     * different types should require an update on the relinquish code to handle
> +     * preemption.
> +     */
> +    if ( !p2m_is_foreign(type) )
> +        return;
> +
> +    ASSERT(mfn_valid(mfn));
> +
> +    pg = mfn_to_page(mfn);
> +
> +    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++, pg++ )
> +        p2m_put_foreign_page(pg);
> +}
> +
> +/* Put any references on the page referenced by pte. */
> +static void p2m_put_page(const lpae_t pte, unsigned int level)
> +{
> +    mfn_t mfn = lpae_get_mfn(pte);
> +
> +    ASSERT(p2m_is_valid(pte));
> +
> +    /* We have a second level 2M superpage */
> +    if ( p2m_is_superpage(pte, level) && (level == 2) )

AFAICT, p2m_put_page() can only be called if the pte points to a 
superpage or page:

     if ( p2m_is_superpage(entry, level) || (level == 3) )
     {
        ...
        p2m_put_page()

     }

So do we actually need to check p2m_is_superpage()?

> +        return p2m_put_l2_superpage(mfn, pte.p2m.type);
> +    else if ( level == 3 )
> +        return p2m_put_l3_page(mfn, pte.p2m.type);
> +}
> +
>   /* Free lpae sub-tree behind an entry */
>   static void p2m_free_entry(struct p2m_domain *p2m,
>                              lpae_t entry, unsigned int level)
> @@ -809,9 +841,16 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>   #endif
>   
>           p2m->stats.mappings[level]--;
> -        /* Nothing to do if the entry is a super-page. */
> -        if ( level == 3 )
> -            p2m_put_l3_page(entry);
> +        /*
> +         * TODO: Currently we don't handle 1GB super-page, Xen is not
> +         * preemptible and therefore some work is needed to handle such
> +         * superpages, for which at some point Xen might end up freeing memory
> +         * and therefore for such a big mapping it could end up in a very long
> +         * operation.
> +         */
> +        if ( level >= 2 )

The code in p2m_put_page() can properly handle level 1. So I would 
rather prefer if we remove this check (again in order to reduce the 
amount of work in the P2M code).

This TODO could be moved there.

> +            p2m_put_page(entry, level);
> +
>           return;
>       }
>   
> @@ -1558,9 +1597,12 @@ int relinquish_p2m_mapping(struct domain *d)
>   
>           count++;
>           /*
> -         * Arbitrarily preempt every 512 iterations.
> +         * Arbitrarily preempt every 512 iterations or when type is foreign
> +         * mapping and the order is above 9 (2MB).

Let's avoid mentioning 2MB. This is only valid when using 4KB pages.

This is also talking about a specific when the code below is not 4KB 
specific. I would rework anything after the 'or' to:

'we have a level-2 foreign mapping'

The rest of the LGTM to me but I don't feel confortable to do all those 
changes on commit. So this will want a respin.

For simplicity, you can only resend this patch.

Cheers,

-- 
Julien Grall

