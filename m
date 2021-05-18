Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7AC387345
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 09:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128883.241914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liu5S-0003ne-2C; Tue, 18 May 2021 07:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128883.241914; Tue, 18 May 2021 07:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liu5R-0003lH-VB; Tue, 18 May 2021 07:24:17 +0000
Received: by outflank-mailman (input) for mailman id 128883;
 Tue, 18 May 2021 07:24:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liu5P-0003lB-QO
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 07:24:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15e980a4-3869-4f80-bc37-6830443bc962;
 Tue, 18 May 2021 07:24:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8CF2B149;
 Tue, 18 May 2021 07:24:13 +0000 (UTC)
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
X-Inumbo-ID: 15e980a4-3869-4f80-bc37-6830443bc962
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621322653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6SN2t2kr4nCsHFYuK21KCl0FjZfwoZetDLAugbr7I14=;
	b=hBhG+ahrGOgP+rI4LbMBMNvUW2A2oNb1NgBulLrRipGRxh5UF0gLSpvs1fzXXspkFpqh2R
	D7BF1176sFKsAuiKIa6gbASK0cwl4KvMA5Zshv/uF0Y+KyIfPt2ayJRpGMIQuwhXlGDws5
	3Rrcoe4YHleERz248UYqwRHk8DEopgw=
Subject: Re: [PATCH 05/10] xen/arm: introduce alloc_staticmem_pages
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-6-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a890200d-b75b-dd59-5d13-b0b211a58da5@suse.com>
Date: Tue, 18 May 2021 09:24:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 07:21, Penny Zheng wrote:
> alloc_staticmem_pages is designated to allocate nr_pfns contiguous
> pages of static memory. And it is the equivalent of alloc_heap_pages
> for static memory.
> This commit only covers allocating at specified starting address.
> 
> For each page, it shall check if the page is reserved
> (PGC_reserved) and free. It shall also do a set of necessary
> initialization, which are mostly the same ones in alloc_heap_pages,
> like, following the same cache-coherency policy and turning page
> status into PGC_state_used, etc.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/common/page_alloc.c | 64 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 58b53c6ac2..adf2889e76 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1068,6 +1068,70 @@ static struct page_info *alloc_heap_pages(
>      return pg;
>  }
>  
> +/*
> + * Allocate nr_pfns contiguous pages, starting at #start, of static memory.
> + * It is the equivalent of alloc_heap_pages for static memory
> + */
> +static struct page_info *alloc_staticmem_pages(unsigned long nr_pfns,
> +                                                paddr_t start,
> +                                                unsigned int memflags)

This is surely breaking the build (at this point in the series -
recall that a series should build fine at every patch boundary),
for introducing an unused static function, which most compilers
will warn about.

Also again - please avoid introducing code that's always dead for
certain architectures. Quite likely you want a Kconfig option to
put a suitable #ifdef around such functions.

And a nit: Please correct the apparently off-by-one indentation.

> +{
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +    unsigned int i;

This variable's type should (again) match nr_pfns'es (albeit I
think that parameter really wants to be nr_mfns).

> +    struct page_info *pg;
> +    mfn_t s_mfn;
> +
> +    /* For now, it only supports allocating at specified address. */
> +    s_mfn = maddr_to_mfn(start);
> +    pg = mfn_to_page(s_mfn);
> +    if ( !pg )
> +        return NULL;

Under what conditions would mfn_to_page() return NULL?

> +    for ( i = 0; i < nr_pfns; i++)
> +    {
> +        /*
> +         * Reference count must continuously be zero for free pages
> +         * of static memory(PGC_reserved).
> +         */
> +        ASSERT(pg[i].count_info & PGC_reserved);
> +        if ( (pg[i].count_info & ~PGC_reserved) != PGC_state_free )
> +        {
> +            printk(XENLOG_ERR
> +                    "Reference count must continuously be zero for free pages"
> +                    "pg[%u] MFN %"PRI_mfn" c=%#lx t=%#x\n",
> +                    i, mfn_x(page_to_mfn(pg + i)),
> +                    pg[i].count_info, pg[i].tlbflush_timestamp);

Nit: Indentation again.

> +            BUG();
> +        }
> +
> +        if ( !(memflags & MEMF_no_tlbflush) )
> +            accumulate_tlbflush(&need_tlbflush, &pg[i],
> +                                &tlbflush_timestamp);
> +
> +        /*
> +         * Reserve flag PGC_reserved and change page state

DYM "Preserve ..."?

> +         * to PGC_state_inuse.
> +         */
> +        pg[i].count_info = (pg[i].count_info & PGC_reserved) | PGC_state_inuse;
> +        /* Initialise fields which have other uses for free pages. */
> +        pg[i].u.inuse.type_info = 0;
> +        page_set_owner(&pg[i], NULL);
> +
> +        /*
> +         * Ensure cache and RAM are consistent for platforms where the
> +         * guest can control its own visibility of/through the cache.
> +         */
> +        flush_page_to_ram(mfn_x(page_to_mfn(&pg[i])),
> +                            !(memflags & MEMF_no_icache_flush));
> +    }
> +
> +    if ( need_tlbflush )
> +        filtered_flush_tlb_mask(tlbflush_timestamp);

With reserved pages dedicated to a specific domain, in how far is it
possible that stale mappings from a prior use can still be around,
making such TLB flushing necessary?

Jan

