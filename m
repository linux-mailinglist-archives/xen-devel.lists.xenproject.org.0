Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441F6524A16
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 12:15:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327599.550415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np5q5-0003HK-Fv; Thu, 12 May 2022 10:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327599.550415; Thu, 12 May 2022 10:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np5q5-0003En-DE; Thu, 12 May 2022 10:14:33 +0000
Received: by outflank-mailman (input) for mailman id 327599;
 Thu, 12 May 2022 10:14:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1np5q3-0003Eg-8v
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 10:14:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1np5q3-0004er-0B; Thu, 12 May 2022 10:14:31 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.236.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1np5q2-0000r6-Py; Thu, 12 May 2022 10:14:30 +0000
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
	bh=jJdpB9u/5hdWvX7qfd/nRwdaeX5kUREiPmuKjzzM7iM=; b=xb/40Ry/moi4YSsZoLL/U9JtN2
	+9O0i8plsqWjwOiRdGmRDlYAPnTa/JcRg9dax14/dHMvNEIlMwNMdueqg0hvhYDjRWJqqGTYaVW4D
	VnRadJTeazD21uwvetg5rgslR0R6dMK/ufZ0pJs117CXWy3CAKcRgrJXQ8gh+zh6gCgg=;
Message-ID: <47b4d6c2-3bc7-02bc-be5a-a2b782541c3c@xen.org>
Date: Thu, 12 May 2022 11:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/8] xen/arm: introduce put_page_nr and get_page_nr
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220512091129.2802997-1-Penny.Zheng@arm.com>
 <20220512091129.2802997-5-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220512091129.2802997-5-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/05/2022 10:11, Penny Zheng wrote:
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
> v3 changes:
> - check overflow with "n"
> - remove spurious change
> - bring back the check that we enter the loop only when count_info is
> greater than 0
> ---
> v2 change:
> - new commit
> ---
>   xen/arch/arm/include/asm/mm.h |  4 ++++
>   xen/arch/arm/mm.c             | 36 ++++++++++++++++++++++++++---------
>   2 files changed, 31 insertions(+), 9 deletions(-)
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
> index 7b1f2f4906..a9461e07aa 100644
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
> @@ -1548,10 +1549,10 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
>            * Count ==  0: Page is not allocated, so we cannot take a reference.
>            * Count == -1: Reference count would wrap, which is invalid.
>            */
> -        if ( unlikely(((x + 1) & PGC_count_mask) <= 1) )
> +        if ( unlikely(((x + nr) & PGC_count_mask) <= 1) )

This check looks wrong to me. You want to make sure that the right 
equation return is at least equal to n otherwise.

Furthermore, I think we need to restrict 'nr' to PGC_count_mask to fully 
catch any overflow.

Before the loop, the code would look like:

/* Restrict nr to avoid "double" overflow */
if ( nr >= PGC_count_mask )
{
     ASSERT_UNREACHABLE();
     return NULL;
}

The check in the loop would look like:

if ( unlikely((x + nr) & PGC_count_mask) <= n )

That said, it might be easier to read the overflow check if we do:

count = x & PGC_count_mask;
if ( !count || ((PGC_count_mask - count) <= n) )

I haven't measured and check which of the two options would result to 
better code and performance (get_page() is often called).

>               return NULL;
>       }
> -    while ( (y = cmpxchg(&page->count_info, x, x + 1)) != x );
> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>   
>       owner = page_get_owner(page);
>       ASSERT(owner);
> @@ -1559,14 +1560,20 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
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
> +        ASSERT(((y & PGC_count_mask) != 0) &&
> +               (((y - nr) & PGC_count_mask) >= 0));

I think there are a potential underflow here if 'y' is smaller than 
'nr'. But on v2, Stefano suggest to use ASSERT((y & PGC_count_mask) >= 
nr); which I think is sufficient here.

>           x  = y;
> -        nx = x - 1;
> +        nx = x - nr;
>       }
>       while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
>   
> @@ -1576,19 +1583,30 @@ void put_page(struct page_info *page)
>       }
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

