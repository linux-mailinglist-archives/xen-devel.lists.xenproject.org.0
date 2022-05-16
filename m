Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493B4528C79
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 20:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330251.553615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqf1z-0005Kv-9O; Mon, 16 May 2022 18:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330251.553615; Mon, 16 May 2022 18:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqf1z-0005J7-68; Mon, 16 May 2022 18:01:19 +0000
Received: by outflank-mailman (input) for mailman id 330251;
 Mon, 16 May 2022 18:01:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqf1x-0005J1-T5
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 18:01:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqf1x-00084k-DP; Mon, 16 May 2022 18:01:17 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.22.38]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqf1x-00012P-5s; Mon, 16 May 2022 18:01:17 +0000
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
	bh=BFVqC6gJWelypNLb8jsRmm/X66gu0Uiod+rPrLVyjP8=; b=VWzLoqvReOZZeij0hbMCXH9r5s
	zWwqJcHNZ1HcbThmxJi816qj45Ly+YepIs2e+xOInmvyaXlkL0cyZ+sPy4uflEiPVCezsO6FyQpbN
	bFc36bfHdJVmXojhVBSnwtpH7lPPlfVPtpdtTYE+8C8EJyAogSt64or5Z8s7iHKjFCtM=;
Message-ID: <2ebda9bb-8045-56ec-619b-d0178d57ee17@xen.org>
Date: Mon, 16 May 2022 19:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 1/6] xen: do not free reserved memory into heap
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-2-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220510022733.2422581-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 10/05/2022 03:27, Penny Zheng wrote:
> Pages used as guest RAM for static domain, shall be reserved to this
> domain only.
> So in case reserved pages being used for other purpose, users
> shall not free them back to heap, even when last ref gets dropped.
> 
> free_staticmem_pages will be called by free_heap_pages in runtime
> for static domain freeing memory resource, so let's drop the __init
> flag.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v4 changes:
> - no changes
> ---
> v3 changes:
> - fix possible racy issue in free_staticmem_pages()
> - introduce a stub free_staticmem_pages() for the !CONFIG_STATIC_MEMORY case
> - move the change to free_heap_pages() to cover other potential call sites
> - fix the indentation
> ---
> v2 changes:
> - new commit
> ---
>   xen/common/page_alloc.c | 17 ++++++++++++++---
>   xen/include/xen/mm.h    |  2 +-
>   2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 319029140f..5e569a48a2 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1443,6 +1443,10 @@ static void free_heap_pages(
>   
>       ASSERT(order <= MAX_ORDER);
>   
> +    if ( pg->count_info & PGC_reserved )

NIT: I would suggest to use "unlikely()" here.

> +        /* Reserved page shall not go back to the heap. */
> +        return free_staticmem_pages(pg, 1UL << order, need_scrub);
> +
>       spin_lock(&heap_lock);
>   
>       for ( i = 0; i < (1 << order); i++ )
> @@ -2636,8 +2640,8 @@ struct domain *get_pg_owner(domid_t domid)
>   
>   #ifdef CONFIG_STATIC_MEMORY
>   /* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
> -void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> -                                 bool need_scrub)
> +void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                          bool need_scrub)

Looking at the implementation of free_staticmem_pages(), the page will 
be scrubbed synchronously.

If I am not mistaken, static memory is not yet supported so I would be 
OK to continue with synchronous scrubbing. However, this will need to be 
asynchronous before we even consider to security support it.

BTW, SUPPORT.md doesn't seem to explicitely say whether static memory is 
supported. Would you be able to send a patch to update it? I think this 
should be tech preview for now.

>   {
>       mfn_t mfn = page_to_mfn(pg);
>       unsigned long i;
> @@ -2653,7 +2657,8 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>           }
>   
>           /* In case initializing page of static memory, mark it PGC_reserved. */
> -        pg[i].count_info |= PGC_reserved;
> +        if ( !(pg[i].count_info & PGC_reserved) )

NIT: I understand the flag may have already been set, but I am not 
convinced if it is worth checking it and then set.

> +            pg[i].count_info |= PGC_reserved;


>       }
>   }
>   
> @@ -2762,6 +2767,12 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>   
>       return 0;
>   }
> +#else
> +void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                          bool need_scrub)
> +{
> +    ASSERT_UNREACHABLE();
> +}
>   #endif
>   
>   /*
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 3be754da92..9fd95deaec 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -85,10 +85,10 @@ bool scrub_free_pages(void);
>   } while ( false )
>   #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>   
> -#ifdef CONFIG_STATIC_MEMORY
>   /* These functions are for static memory */
>   void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                             bool need_scrub);
> +#ifdef CONFIG_STATIC_MEMORY
>   int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
>                               unsigned int memflags);
>   #endif

Cheers,

-- 
Julien Grall

