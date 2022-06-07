Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18C153F8F0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 10:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343038.568178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyV2c-00055I-RS; Tue, 07 Jun 2022 08:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343038.568178; Tue, 07 Jun 2022 08:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyV2c-00052e-NI; Tue, 07 Jun 2022 08:58:22 +0000
Received: by outflank-mailman (input) for mailman id 343038;
 Tue, 07 Jun 2022 08:58:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nyV2b-00052Y-Ek
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 08:58:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyV2b-0000Yt-0Q; Tue, 07 Jun 2022 08:58:21 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.23.140]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyV2a-0005ce-NY; Tue, 07 Jun 2022 08:58:20 +0000
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
	bh=Ym+TPfi90d4P7YBhK8HDAaQK2v5n9QwP7LrydDG9wUI=; b=2ANxNonLk7LQsbGCmiimZNIwpS
	gbQIY58kl7fljJDjKI8DKtPZZ9xhNx2Gcj0hHIf4LtJjKLpfc/R5M3u+Aozf7UJeDnIJZmngBk9kj
	seBEkmK2MbFRV0i/UmtX2T+yv/fIENFoaT8q8FwPqwAd+GuujNYGzZ7HKjVOoWvSpjVk=;
Message-ID: <9f6013f2-c365-4d6f-1ebc-f30b774dbd28@xen.org>
Date: Tue, 7 Jun 2022 09:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v6 1/9] xen/arm: rename PGC_reserved to PGC_static
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220607073031.722174-1-Penny.Zheng@arm.com>
 <20220607073031.722174-2-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220607073031.722174-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/06/2022 08:30, Penny Zheng wrote:
> PGC_reserved could be ambiguous, and we have to tell what the pages are
> reserved for, so this commit intends to rename PGC_reserved to
> PGC_static, which clearly indicates the page is reserved for static
> memory.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> v6 changes:
> - rename PGC_staticmem to PGC_static
> ---
> v5 changes:
> - new commit
> ---
>   xen/arch/arm/include/asm/mm.h |  6 +++---
>   xen/common/page_alloc.c       | 22 +++++++++++-----------
>   2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 424aaf2823..fbff11c468 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -108,9 +108,9 @@ struct page_info
>     /* Page is Xen heap? */
>   #define _PGC_xen_heap     PG_shift(2)
>   #define PGC_xen_heap      PG_mask(1, 2)
> -  /* Page is reserved */
> -#define _PGC_reserved     PG_shift(3)
> -#define PGC_reserved      PG_mask(1, 3)
> +  /* Page is static memory */
> +#define _PGC_static    PG_shift(3)
> +#define PGC_static     PG_mask(1, 3)
>   /* ... */
>   /* Page is broken? */
>   #define _PGC_broken       PG_shift(7)
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 319029140f..9e5c757847 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -151,8 +151,8 @@
>   #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>   #endif
>   
> -#ifndef PGC_reserved
> -#define PGC_reserved 0
> +#ifndef PGC_static
> +#define PGC_static 0
>   #endif
>   
>   /*
> @@ -2286,7 +2286,7 @@ int assign_pages(
>   
>           for ( i = 0; i < nr; i++ )
>           {
> -            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
> +            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
>               if ( pg[i].count_info & PGC_extra )
>                   extra_pages++;
>           }
> @@ -2346,7 +2346,7 @@ int assign_pages(
>           page_set_owner(&pg[i], d);
>           smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
>           pg[i].count_info =
> -            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
> +            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
>   
>           page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
>       }
> @@ -2652,8 +2652,8 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>               scrub_one_page(pg);
>           }
>   
> -        /* In case initializing page of static memory, mark it PGC_reserved. */
> -        pg[i].count_info |= PGC_reserved;
> +        /* In case initializing page of static memory, mark it PGC_static. */
> +        pg[i].count_info |= PGC_static;
>       }
>   }
>   
> @@ -2682,8 +2682,8 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
>   
>       for ( i = 0; i < nr_mfns; i++ )
>       {
> -        /* The page should be reserved and not yet allocated. */
> -        if ( pg[i].count_info != (PGC_state_free | PGC_reserved) )
> +        /* The page should be static and not yet allocated. */
> +        if ( pg[i].count_info != (PGC_state_free | PGC_static) )
>           {
>               printk(XENLOG_ERR
>                      "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
> @@ -2697,10 +2697,10 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
>                                   &tlbflush_timestamp);
>   
>           /*
> -         * Preserve flag PGC_reserved and change page state
> +         * Preserve flag PGC_static and change page state
>            * to PGC_state_inuse.
>            */
> -        pg[i].count_info = PGC_reserved | PGC_state_inuse;
> +        pg[i].count_info = PGC_static | PGC_state_inuse;
>           /* Initialise fields which have other uses for free pages. */
>           pg[i].u.inuse.type_info = 0;
>           page_set_owner(&pg[i], NULL);
> @@ -2722,7 +2722,7 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
>   
>    out_err:
>       while ( i-- )
> -        pg[i].count_info = PGC_reserved | PGC_state_free;
> +        pg[i].count_info = PGC_static | PGC_state_free;
>   
>       spin_unlock(&heap_lock);
>   

-- 
Julien Grall

