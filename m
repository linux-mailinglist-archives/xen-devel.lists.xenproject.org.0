Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C8D51E5D6
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 11:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323648.545412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnGSF-0005jx-2J; Sat, 07 May 2022 09:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323648.545412; Sat, 07 May 2022 09:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnGSE-0005hG-V9; Sat, 07 May 2022 09:10:22 +0000
Received: by outflank-mailman (input) for mailman id 323648;
 Sat, 07 May 2022 09:10:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nnGSE-0005hA-Bz
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 09:10:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nnGSE-00030v-5G; Sat, 07 May 2022 09:10:22 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nnGSD-0001mD-Vn; Sat, 07 May 2022 09:10:22 +0000
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
	bh=zkocKGVSy5OPtTBTK5xNgrKaOceMwXMtbM4UXd6wfi4=; b=DtWC70XTIToecDBG9NQuI7cycN
	kYFto4IOrp2hH3YK9uAm7qAGzpHa8wJ0I+C7OAIpHtYcQsg4FbvZL/KwdFwKyyfJGY6bjqbC4/drU
	Y3GiUMb80wnHZ9JKK9NUHzom8KGGId61OFGaMMI8v7Nr5oQdy7xRWi74ZOHpND1hsLbE=;
Message-ID: <a1497785-58fd-f0a1-3ad5-c23e42cdebf0@xen.org>
Date: Sat, 7 May 2022 10:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v2 4/9] xen/arm: introduce put_page_nr and get_page_nr
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com>
 <20220506072502.2177828-5-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220506072502.2177828-5-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 06/05/2022 08:24, Penny Zheng wrote:
> Later, we need to add the right amount of references, which should be
> the number of borrower domains, to the owner domain. Since we only have
> get_page() to increment the page reference by 1, a loop is needed per
> page, which is inefficient and time-consuming.
> 
> To save the loop time, this commit introduces a set of new helpers
> put_page_nr() and get_page_nr() to increment/drop the page reference by nr.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v2 change:
> - new commit
> ---
>   xen/arch/arm/include/asm/mm.h |  4 ++++
>   xen/arch/arm/mm.c             | 36 +++++++++++++++++++++++++----------
>   2 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 424aaf2823..c737d51e4d 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -347,6 +347,10 @@ void free_init_memory(void);
>   int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
>                                             unsigned int order);
>   
> +extern bool get_page_nr(struct page_info *page, const struct domain *domain,
> +                        unsigned long nr);
> +extern void put_page_nr(struct page_info *page, unsigned long nr);
> +
>   extern void put_page_type(struct page_info *page);
>   static inline void put_page_and_type(struct page_info *page)
>   {
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 7b1f2f4906..e565979f3c 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1537,7 +1537,8 @@ long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
>       return 0;
>   }
>   
> -struct domain *page_get_owner_and_reference(struct page_info *page)
> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
> +                                                      unsigned long nr)
>   {
>       unsigned long x, y = page->count_info;
>       struct domain *owner;
> @@ -1545,13 +1546,14 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
>       do {
>           x = y;
>           /*
> +         * Consider the minimum case(nr = 1):
>            * Count ==  0: Page is not allocated, so we cannot take a reference.
>            * Count == -1: Reference count would wrap, which is invalid.
>            */
>           if ( unlikely(((x + 1) & PGC_count_mask) <= 1) )

Shouldn't this be updated to check overflow with "n"?

>               return NULL;
>       }
> -    while ( (y = cmpxchg(&page->count_info, x, x + 1)) != x );
> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>   
>       owner = page_get_owner(page);
>       ASSERT(owner);
> @@ -1559,36 +1561,50 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
>       return owner;
>   }
>   
> -void put_page(struct page_info *page)
> +struct domain *page_get_owner_and_reference(struct page_info *page)
> +{
> +    return page_get_owner_and_nr_reference(page, 1);
> +}
> +
> +void put_page_nr(struct page_info *page, unsigned long nr)
>   {
>       unsigned long nx, x, y = page->count_info;
>   
>       do {
> -        ASSERT((y & PGC_count_mask) != 0);
> +        ASSERT(((y - nr) & PGC_count_mask) >= 0);
>           x  = y;
> -        nx = x - 1;
> +        nx = x - nr;
>       }
>       while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
>   
>       if ( unlikely((nx & PGC_count_mask) == 0) )
> -    {
>           free_domheap_page(page);
> -    }

Sounds like a spurious change.

>   }
>   
> -bool get_page(struct page_info *page, const struct domain *domain)
> +void put_page(struct page_info *page)
>   {
> -    const struct domain *owner = page_get_owner_and_reference(page);
> +    put_page_nr(page, 1);
> +}
> +
> +bool get_page_nr(struct page_info *page, const struct domain *domain,
> +                 unsigned long nr)
> +{
> +    const struct domain *owner = page_get_owner_and_nr_reference(page, nr);
>   
>       if ( likely(owner == domain) )
>           return true;
>   
>       if ( owner != NULL )
> -        put_page(page);
> +        put_page_nr(page, nr);
>   
>       return false;
>   }
>   
> +bool get_page(struct page_info *page, const struct domain *domain)
> +{
> +    return get_page_nr(page, domain, 1);
> +}
> +
>   /* Common code requires get_page_type and put_page_type.
>    * We don't care about typecounts so we just do the minimum to make it
>    * happy. */


Cheers,

-- 
Julien Grall

