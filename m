Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653AA58AF29
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 19:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381460.616160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK1T3-00022r-V2; Fri, 05 Aug 2022 17:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381460.616160; Fri, 05 Aug 2022 17:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK1T3-0001zv-Qt; Fri, 05 Aug 2022 17:50:37 +0000
Received: by outflank-mailman (input) for mailman id 381460;
 Fri, 05 Aug 2022 17:50:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oK1T1-0001zp-V8
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 17:50:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oK1T1-0006Qi-Bm; Fri, 05 Aug 2022 17:50:35 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.9.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oK1T1-0003SF-5N; Fri, 05 Aug 2022 17:50:35 +0000
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
	bh=L+Y3zK0Xq8TngzvyxfphnC2WFUcpRUOxUsi+dQtvGH4=; b=RdamraHWR/EDua2nhTXhvJaBpq
	LkCCiV3I/ItQGDEERwJ1JZxub7qZDJfo81U7uT/8CukbhmRFZ/4v377HoMHU7tcUYJzwFaPDrhWnO
	tRJM6agqf96dh8N0+YnLMF5EawadaojCjlYRawPqJjgt4VQVOm3+xC5WS3CjDk8TdQUU=;
Message-ID: <00ca8cb1-bd87-563d-a31d-a642a69d5f3f@xen.org>
Date: Fri, 5 Aug 2022 18:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v9 2/8] xen: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-3-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220720054611.2695787-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 20/07/2022 06:46, Penny Zheng wrote:
> Pages used as guest RAM for static domain, shall be reserved to this
> domain only.
> So in case reserved pages being used for other purpose, users
> shall not free them back to heap, even when last ref gets dropped.
> 
> This commit introduces a new helper free_domstatic_page to free
> static page in runtime, and free_staticmem_pages will be called by it
> in runtime, so let's drop the __init flag.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

With a couple of comments below:

Reviewed-by: Julien Grall <jgrall@amazon.com>

> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index ed56379b96..a12622e921 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -151,10 +151,6 @@
>   #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>   #endif
>   
> -#ifndef PGC_static
> -#define PGC_static 0
> -#endif
> -
>   /*
>    * Comma-separated list of hexadecimal page numbers containing bad bytes.
>    * e.g. 'badpage=0x3f45,0x8a321'.
> @@ -2636,12 +2632,14 @@ struct domain *get_pg_owner(domid_t domid)
>   
>   #ifdef CONFIG_STATIC_MEMORY
>   /* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
> -void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> -                                 bool need_scrub)
> +void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                          bool need_scrub)
>   {
>       mfn_t mfn = page_to_mfn(pg);
>       unsigned long i;
>   
> +    spin_lock(&heap_lock);
> +
>       for ( i = 0; i < nr_mfns; i++ )
>       {
>           mark_page_free(&pg[i], mfn_add(mfn, i));
> @@ -2652,9 +2650,34 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>               scrub_one_page(pg);
>           }
>   
> -        /* In case initializing page of static memory, mark it PGC_static. */
>           pg[i].count_info |= PGC_static;
>       }
> +
> +    spin_unlock(&heap_lock);
> +}
> +
> +void free_domstatic_page(struct page_info *page)
> +{
> +    struct domain *d = page_get_owner(page);
> +    bool drop_dom_ref;
> +
> +    ASSERT(d);

I saw Jan commenting on this. I agree with him to switch to

if ( d )
{
   ASSERT_UNREACHABLE();
   return;
}

I would even go further and add a printk() to log the problem in prod.

> +
> +    ASSERT_ALLOC_CONTEXT();
> +
> +    /* NB. May recursively lock from relinquish_memory(). */
> +    spin_lock_recursive(&d->page_alloc_lock);
> +
> +    arch_free_heap_page(d, page);
> +
> +    drop_dom_ref = !domain_adjust_tot_pages(d, -1);
> +
> +    spin_unlock_recursive(&d->page_alloc_lock);
> +
> +    free_staticmem_pages(page, 1, scrub_debug);
> +
> +    if ( drop_dom_ref )
> +        put_domain(d);
>   }
>   
>   /*
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 3be754da92..f1a7d5c991 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -85,13 +85,12 @@ bool scrub_free_pages(void);
>   } while ( false )
>   #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>   
> -#ifdef CONFIG_STATIC_MEMORY
>   /* These functions are for static memory */
>   void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                             bool need_scrub);
> +void free_domstatic_page(struct page_info *page);
>   int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
>                               unsigned int memflags);
> -#endif

NIT: The removal of #ifdef seems to be unrelated to this patch. If you 
plan to send a v10, then I would suggest to mention it on the commit 
message.

>   
>   /* Map machine page range in Xen virtual address space. */
>   int map_pages_to_xen(
> @@ -212,6 +211,10 @@ extern struct domain *dom_cow;
>   
>   #include <asm/mm.h>
>   
> +#ifndef PGC_static
> +#define PGC_static 0
> +#endif

I saw Jan commenting on this change. So, FYI, I am OK either way.

> +
>   static inline bool is_special_page(const struct page_info *page)
>   {
>       return is_xen_heap_page(page) || (page->count_info & PGC_extra);

-- 
Julien Grall

