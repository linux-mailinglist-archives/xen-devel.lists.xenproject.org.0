Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7F4528D06
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 20:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330259.553626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqfT3-0007qZ-Fr; Mon, 16 May 2022 18:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330259.553626; Mon, 16 May 2022 18:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqfT3-0007o6-C9; Mon, 16 May 2022 18:29:17 +0000
Received: by outflank-mailman (input) for mailman id 330259;
 Mon, 16 May 2022 18:29:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqfT1-0007o0-Ta
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 18:29:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqfT1-0008VH-FL; Mon, 16 May 2022 18:29:15 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.22.38]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqfT1-0002lY-93; Mon, 16 May 2022 18:29:15 +0000
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
	bh=IL70NZxb6zoseb6l/HUHk2CGlwdjbX+D3he4HKunysU=; b=EGsjSvhU0cgahK08fXHdj7T49n
	ESTfv3sLcLigqoePctEWdLY9txbxeK7296bQ3M75Sif4I9ZO6/U1Xj5UdS7mUkh+thyMx+VZ23XkC
	VZBz5C9kBenujgp/BnvMySt1+n5r1C2ImMDu4wLUlypb3WrIsRA8zeHtAv3Ba/d989KE=;
Message-ID: <7af0d53c-6fdc-33a4-a09b-93831b4ee2c0@xen.org>
Date: Mon, 16 May 2022 19:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 6/6] xen: retrieve reserved pages on populate_physmap
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-7-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220510022733.2422581-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 10/05/2022 03:27, Penny Zheng wrote:
> When static domain populates memory through populate_physmap on runtime,

Typo: s/when static/when a static/ or "when static domains populate"

s/on runtime/at runtime/

> other than allocating from heap, it shall retrieve reserved pages from

I am not sure to understand the part before the comma. But it doens't 
sound necessary so maybe drop it?

> resv_page_list to make sure that guest RAM is still restricted in statically
> configured memory regions. And this commit introduces a new helper
> acquire_reserved_page to make it work.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

[...]

> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 290526adaf..06e7037a28 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2740,8 +2740,8 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
>    * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
>    * then assign them to one specific domain #d.
>    */
> -int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
> -                                   unsigned int nr_mfns, unsigned int memflags)
> +int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
> +                            unsigned int memflags)
>   {
>       struct page_info *pg;
>   
> @@ -2769,12 +2769,43 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>   
>       return 0;
>   }
> +
> +/*
> + * Acquire a page from reserved page list(resv_page_list), when populating
> + * memory for static domain on runtime.
> + */
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    struct page_info *page;
> +    mfn_t smfn;
> +
> +    /* Acquire a page from reserved page list(resv_page_list). */
> +    page = page_list_remove_head(&d->resv_page_list);
Alloc/free of memory can happen concurrently. So access to rsv_page_list 
needs to be protected with a spinlock (mostly like d->page_alloc_lock).

> +    if ( unlikely(!page) )
> +        return INVALID_MFN;
> +
> +    smfn = page_to_mfn(page);
> +
> +    if ( acquire_domstatic_pages(d, smfn, 1, memflags) )

I am OK if we call acquire_domstatic_pages() for now. But long term, I 
think we should consider to optimize it because we know the page is 
valid and belong to the guest. So there are a lot of pointless work 
(checking mfn_valid(), scrubbing in the free part, cleaning the cache...).

> +    {
> +        page_list_add_tail(page, &d->resv_page_list);
> +        return INVALID_MFN;
> +    }
> +
> +    return smfn;
> +}
>   #else
>   void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                             bool need_scrub)
>   {
>       ASSERT_UNREACHABLE();
>   }
> +
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    ASSERT_UNREACHABLE();
> +    return INVALID_MFN;
> +}
>   #endif
>   
>   /*
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 35dc7143a4..c613afa57e 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -38,6 +38,10 @@ void arch_get_domain_info(const struct domain *d,
>   #define CDF_staticmem            (1U << 2)
>   #endif
>   
> +#ifndef is_domain_using_staticmem
> +#define is_domain_using_staticmem(d) ((void)(d), false)
> +#endif
> +
>   /*
>    * Arch-specifics.
>    */
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 9fd95deaec..74810e1f54 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -92,6 +92,7 @@ void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>   int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
>                               unsigned int memflags);
>   #endif
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags);
>   
>   /* Map machine page range in Xen virtual address space. */
>   int map_pages_to_xen(

Cheers,

-- 
Julien Grall

