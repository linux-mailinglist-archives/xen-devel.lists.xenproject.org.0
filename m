Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B2038770E
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 13:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129071.242293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixUI-0004k5-I5; Tue, 18 May 2021 11:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129071.242293; Tue, 18 May 2021 11:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixUI-0004hf-EO; Tue, 18 May 2021 11:02:10 +0000
Received: by outflank-mailman (input) for mailman id 129071;
 Tue, 18 May 2021 11:02:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lixUH-0004hZ-HA
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 11:02:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lixUH-0000y3-AM; Tue, 18 May 2021 11:02:09 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lixUH-000465-2C; Tue, 18 May 2021 11:02:09 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=sM8DWwqOPfusTvnpTGsD9A9ei6YMfjOEAiqzbWORjx0=; b=TyEt8Uv7XdsKpKf+Ixgzi4ItnI
	XYqIhjthN/BImQoZphI0Em5fd3BOYHQrjOTVkyohtNWwSIV8bnqkanqGdOS0JldQkPtQu5/c4KgKu
	SaPGpKMA+UOCpnZaegqw3jgCqCCtYJO8NJEs8bKhEw0Q27hzUd1ujagUcThUo5rgRixc=;
Subject: Re: [PATCH 08/10] xen/arm: introduce reserved_page_list
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-9-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c002d9b2-8210-1c03-b374-76e037b65e2f@xen.org>
Date: Tue, 18 May 2021 12:02:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-9-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 18/05/2021 06:21, Penny Zheng wrote:
> Since page_list under struct domain refers to linked pages as gueast RAM

s/gueast/guest/

> allocated from heap, it should not include reserved pages of static memory.

You already have PGC_reserved to indicate they are "static memory". So 
why do you need yet another list?

> 
> The number of PGC_reserved pages assigned to a domain is tracked in
> a new 'reserved_pages' counter. Also introduce a new reserved_page_list
> to link pages of static memory. Let page_to_list return reserved_page_list,
> when flag is PGC_reserved.
> 
> Later, when domain get destroyed or restarted, those new values will help
> relinquish memory to proper place, not been given back to heap.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/common/domain.c     | 1 +
>   xen/common/page_alloc.c | 7 +++++--
>   xen/include/xen/sched.h | 5 +++++
>   3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 6b71c6d6a9..c38afd2969 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -578,6 +578,7 @@ struct domain *domain_create(domid_t domid,
>       INIT_PAGE_LIST_HEAD(&d->page_list);
>       INIT_PAGE_LIST_HEAD(&d->extra_page_list);
>       INIT_PAGE_LIST_HEAD(&d->xenpage_list);
> +    INIT_PAGE_LIST_HEAD(&d->reserved_page_list);
>   
>       spin_lock_init(&d->node_affinity_lock);
>       d->node_affinity = NODE_MASK_ALL;
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index f1f1296a61..e3f07ec6c5 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2410,7 +2410,7 @@ int assign_pages(
>   
>           for ( i = 0; i < nr_pfns; i++ )
>           {
> -            ASSERT(!(pg[i].count_info & ~PGC_extra));
> +            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
I think this change belongs to the previous patch.

>               if ( pg[i].count_info & PGC_extra )
>                   extra_pages++;
>           }
> @@ -2439,6 +2439,9 @@ int assign_pages(
>           }
>       }
>   
> +    if ( pg[0].count_info & PGC_reserved )
> +        d->reserved_pages += nr_pfns;

reserved_pages doesn't seem to be ever read or decremented. So why do 
you need it?

> +
>       if ( !(memflags & MEMF_no_refcount) &&
>            unlikely(domain_adjust_tot_pages(d, nr_pfns) == nr_pfns) )
>           get_knownalive_domain(d);
> @@ -2452,7 +2455,7 @@ int assign_pages(
>               page_set_reserved_owner(&pg[i], d);
>           smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
>           pg[i].count_info =
> -            (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
> +            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;

Same here.

>           page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
>       }
>   
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 3982167144..b6333ed8bb 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -368,6 +368,7 @@ struct domain
>       struct page_list_head page_list;  /* linked list */
>       struct page_list_head extra_page_list; /* linked list (size extra_pages) */
>       struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
> +    struct page_list_head reserved_page_list; /* linked list (size reserved pages) */
>   
>       /*
>        * This field should only be directly accessed by domain_adjust_tot_pages()
> @@ -379,6 +380,7 @@ struct domain
>       unsigned int     outstanding_pages; /* pages claimed but not possessed */
>       unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
>       unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
> +    unsigned int     reserved_pages;    /* pages of static memory */
>       atomic_t         shr_pages;         /* shared pages */
>       atomic_t         paged_pages;       /* paged-out pages */
>   
> @@ -588,6 +590,9 @@ static inline struct page_list_head *page_to_list(
>       if ( pg->count_info & PGC_extra )
>           return &d->extra_page_list;
>   
> +    if ( pg->count_info & PGC_reserved )
> +        return &d->reserved_page_list;
> +
>       return &d->page_list;
>   }
>   
> 

Cheers,

-- 
Julien Grall

