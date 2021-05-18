Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22742387682
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 12:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129042.242237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwzU-00085H-Sp; Tue, 18 May 2021 10:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129042.242237; Tue, 18 May 2021 10:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwzU-00082g-OO; Tue, 18 May 2021 10:30:20 +0000
Received: by outflank-mailman (input) for mailman id 129042;
 Tue, 18 May 2021 10:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1liwzT-00082a-Nr
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 10:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwzT-0000Nw-Iq; Tue, 18 May 2021 10:30:19 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwzT-0001Oh-CP; Tue, 18 May 2021 10:30:19 +0000
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
	bh=RRj92iEerUBkZ4fQVZ1PLXfsaygjd/QklXf58ZdiFrE=; b=SH8BpndxuP9BJBf4oc8GaQrysj
	hjTsx7R1nSRGDOMiTyUxXQUqcmTH9QdNW6OmqTCpKn73X4aRHiIOYR8UHPJUMjbquKbqpIOELzqEw
	pf5EQjlv07aJEPeGZ+rsxLE8dAYKMyZ5x3l5nb+5SlrdQqWLVGBxgpfP4nULfgq+KHQA=;
Subject: Re: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-8-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d2d1c50f-16bb-778b-acdd-0684878c100f@xen.org>
Date: Tue, 18 May 2021 11:30:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-8-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

Title: s/intruduce/introduce/

On 18/05/2021 06:21, Penny Zheng wrote:
> alloc_domstatic_pages is the equivalent of alloc_domheap_pages for
> static mmeory, and it is to allocate nr_pfns pages of static memory
> and assign them to one specific domain.
> 
> It uses alloc_staticmen_pages to get nr_pages pages of static memory,
> then on success, it will use assign_pages to assign those pages to
> one specific domain, including using page_set_reserved_owner to set its
> reserved domain owner.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/common/page_alloc.c | 53 +++++++++++++++++++++++++++++++++++++++++
>   xen/include/xen/mm.h    |  4 ++++
>   2 files changed, 57 insertions(+)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 0eb9f22a00..f1f1296a61 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2447,6 +2447,9 @@ int assign_pages(
>       {
>           ASSERT(page_get_owner(&pg[i]) == NULL);
>           page_set_owner(&pg[i], d);
> +        /* use page_set_reserved_owner to set its reserved domain owner. */
> +        if ( (pg[i].count_info & PGC_reserved) )
> +            page_set_reserved_owner(&pg[i], d);

I have skimmed through the rest of the series and couldn't find anyone 
calling page_get_reserved_owner(). The value is also going to be the 
exact same as page_set_owner().

So why do we need it?

>           smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
>           pg[i].count_info =
>               (pg[i].count_info & PGC_extra) | PGC_allocated | 1;

This will clobber PGC_reserved.

> @@ -2509,6 +2512,56 @@ struct page_info *alloc_domheap_pages(
>       return pg;
>   }
>   
> +/*
> + * Allocate nr_pfns contiguous pages, starting at #start, of static memory,

s/nr_pfns/nr_mfns/

> + * then assign them to one specific domain #d.
> + * It is the equivalent of alloc_domheap_pages for static memory.
> + */
> +struct page_info *alloc_domstatic_pages(
> +        struct domain *d, unsigned long nr_pfns, paddr_t start,

s/nr_pfns/nf_mfns/. Also, I would the third parameter to be an mfn_t.

> +        unsigned int memflags)
> +{
> +    struct page_info *pg = NULL;
> +    unsigned long dma_size;
> +
> +    ASSERT(!in_irq());
> +
> +    if ( memflags & MEMF_no_owner )
> +        memflags |= MEMF_no_refcount;
> +
> +    if ( !dma_bitsize )
> +        memflags &= ~MEMF_no_dma;
> +    else
> +    {
> +        dma_size = 1ul << bits_to_zone(dma_bitsize);
> +        /* Starting address shall meet the DMA limitation. */
> +        if ( dma_size && start < dma_size )
> +            return NULL;
> +    }
> +
> +    pg = alloc_staticmem_pages(nr_pfns, start, memflags);
> +    if ( !pg )
> +        return NULL;
> +
> +    if ( d && !(memflags & MEMF_no_owner) )
> +    {
> +        if ( memflags & MEMF_no_refcount )
> +        {
> +            unsigned long i;
> +
> +            for ( i = 0; i < nr_pfns; i++ )
> +                pg[i].count_info = PGC_extra;
> +        }
> +        if ( assign_pages(d, pg, nr_pfns, memflags) )
> +        {
> +            free_staticmem_pages(pg, nr_pfns, memflags & MEMF_no_scrub);
> +            return NULL;
> +        }
> +    }
> +
> +    return pg;
> +}
> +
>   void free_domheap_pages(struct page_info *pg, unsigned int order)
>   {
>       struct domain *d = page_get_owner(pg);
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index dcf9daaa46..e45987f0ed 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -111,6 +111,10 @@ unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
>   int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
>   void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
>   
> +/* Static Memory */
> +struct page_info *alloc_domstatic_pages(struct domain *d,
> +        unsigned long nr_pfns, paddr_t start, unsigned int memflags);
> +
>   /* Domain suballocator. These functions are *not* interrupt-safe.*/
>   void init_domheap_pages(paddr_t ps, paddr_t pe);
>   struct page_info *alloc_domheap_pages(
> 

Cheers,

-- 
Julien Grall

