Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9252B274655
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 18:14:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKkvY-0002YV-Th; Tue, 22 Sep 2020 16:14:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no0J=C7=linux.intel.com=tvrtko.ursulin@srs-us1.protection.inumbo.net>)
 id 1kKkvW-0002YQ-Sf
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 16:13:58 +0000
X-Inumbo-ID: 4a18c45a-335b-4405-bb92-c0c0b7e468ba
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a18c45a-335b-4405-bb92-c0c0b7e468ba;
 Tue, 22 Sep 2020 16:13:57 +0000 (UTC)
IronPort-SDR: iEQKbhiRpGVrdfdFqir3Q+3opX6Q4O7LW7m0dQ3VWNAwQ/2KNgToy16ZNmTV94VyXlxj1nOozL
 jSt5pQadJKwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="160716840"
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="160716840"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 09:13:55 -0700
IronPort-SDR: W+rmWqa0xT/ewOCnu96ywZFFN7sCksDJXZ0B8m2eSjjHf9ai3YA0OAm303ILetoqVH5E8M1i2E
 QP+Qxj+EsOlg==
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="454544739"
Received: from atroib-mobl2.ger.corp.intel.com (HELO [10.214.238.184])
 ([10.214.238.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 09:13:49 -0700
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: use vmap in shmem_pin_map
To: Christoph Hellwig <hch@lst.de>
Cc: Matthew Wilcox <willy@infradead.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>, intel-gfx@lists.freedesktop.org,
 Nitin Gupta <ngupta@vflare.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-4-hch@lst.de>
 <20200921191157.GX32101@casper.infradead.org> <20200922062249.GA30831@lst.de>
 <43d10588-2033-038b-14e4-9f41cd622d7b@linux.intel.com>
 <20200922143141.GA26637@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <e429c3e6-2143-f51a-4c1c-c1470076ad3e@linux.intel.com>
Date: Tue, 22 Sep 2020 17:13:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922143141.GA26637@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 22/09/2020 15:31, Christoph Hellwig wrote:
> On Tue, Sep 22, 2020 at 09:23:59AM +0100, Tvrtko Ursulin wrote:
>> If I understood this sub-thread correctly, iterating and freeing the pages
>> via the vmapped ptes, so no need for a
>> shmem_read_mapping_page_gfp loop in shmem_unpin_map looks plausible to me.
>>
>> I did not get the reference to kernel/dma/remap.c though,
> 
> What I mean is the code in dma_common_find_pages, which returns the
> page array for freeing.

Got it.

>> and also not sure
>> how to do the error unwind path in shmem_pin_map at which point the
>> allocated vm area hasn't been fully populated yet. Hand-roll the loop
>> walking vm area struct in there?
> 
> Yes.  What I originally did (re-created as I didn't save it) would be
> something like this:
> 
> ---
>>From 5605e77cda246df6dd7ded99ec22cb3f341ef5d5 Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Wed, 16 Sep 2020 13:54:04 +0200
> Subject: drm/i915: use vmap in shmem_pin_map
> 
> shmem_pin_map somewhat awkwardly reimplements vmap using
> alloc_vm_area and manual pte setup.  The only practical difference
> is that alloc_vm_area prefeaults the vmalloc area PTEs, which doesn't
> seem to be required here (and could be added to vmap using a flag
> if actually required).
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/gpu/drm/i915/gt/shmem_utils.c | 81 +++++++++------------------
>   1 file changed, 27 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
> index 43c7acbdc79dea..7ec6ba4c1065b2 100644
> --- a/drivers/gpu/drm/i915/gt/shmem_utils.c
> +++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
> @@ -49,80 +49,53 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
>   	return file;
>   }
>   
> -static size_t shmem_npte(struct file *file)
> +static size_t shmem_npages(struct file *file)
>   {
>   	return file->f_mapping->host->i_size >> PAGE_SHIFT;
>   }
>   
> -static void __shmem_unpin_map(struct file *file, void *ptr, size_t n_pte)
> -{
> -	unsigned long pfn;
> -
> -	vunmap(ptr);
> -
> -	for (pfn = 0; pfn < n_pte; pfn++) {
> -		struct page *page;
> -
> -		page = shmem_read_mapping_page_gfp(file->f_mapping, pfn,
> -						   GFP_KERNEL);
> -		if (!WARN_ON(IS_ERR(page))) {
> -			put_page(page);
> -			put_page(page);
> -		}
> -	}
> -}
> -
>   void *shmem_pin_map(struct file *file)
>   {
> -	const size_t n_pte = shmem_npte(file);
> -	pte_t *stack[32], **ptes, **mem;

Chris can comment how much he'd miss the 32 page stack shortcut.

> -	struct vm_struct *area;
> -	unsigned long pfn;
> -
> -	mem = stack;
> -	if (n_pte > ARRAY_SIZE(stack)) {
> -		mem = kvmalloc_array(n_pte, sizeof(*mem), GFP_KERNEL);
> -		if (!mem)
> -			return NULL;
> -	}
> +	size_t n_pages = shmem_npages(file), i;
> +	struct page **pages;
> +	void *vaddr;
>   
> -	area = alloc_vm_area(n_pte << PAGE_SHIFT, mem);
> -	if (!area) {
> -		if (mem != stack)
> -			kvfree(mem);
> +	pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
> +	if (!pages)
>   		return NULL;
> -	}
> -
> -	ptes = mem;
> -	for (pfn = 0; pfn < n_pte; pfn++) {
> -		struct page *page;
>   
> -		page = shmem_read_mapping_page_gfp(file->f_mapping, pfn,
> -						   GFP_KERNEL);
> -		if (IS_ERR(page))
> +	for (i = 0; i < n_pages; i++) {
> +		pages[i] = shmem_read_mapping_page_gfp(file->f_mapping, i,
> +						       GFP_KERNEL);
> +		if (IS_ERR(pages[i]))
>   			goto err_page;
> -
> -		**ptes++ = mk_pte(page,  PAGE_KERNEL);
>   	}
>   
> -	if (mem != stack)
> -		kvfree(mem);
> -
> +	vaddr = vmap(pages, n_pages, 0, PAGE_KERNEL);
> +	if (!vaddr)
> +		goto err_page;
>   	mapping_set_unevictable(file->f_mapping);
> -	return area->addr;
> -
> +	return vaddr;

Is there something in vmap() preventing us from freeing the pages array 
here? I can't spot anything that is holding on to the pointer. Or it was 
just a sketch before you realized we could walk the vm_area?

Also, I may be totally misunderstanding something, but I think you need 
to assign area->pages manually so shmem_unpin_map can access it below.

>   err_page:
> -	if (mem != stack)
> -		kvfree(mem);
> -
> -	__shmem_unpin_map(file, area->addr, pfn);
> +	while (--i >= 0)
> +		put_page(pages[i]);
> +	kvfree(pages);
>   	return NULL;
>   }
>   
>   void shmem_unpin_map(struct file *file, void *ptr)
>   {
> +	struct vm_struct *area = find_vm_area(ptr);
> +	size_t i = shmem_npages(file);
> +
> +	if (WARN_ON_ONCE(!area || !area->pages))
> +		return;
> +
>   	mapping_clear_unevictable(file->f_mapping);
> -	__shmem_unpin_map(file, ptr, shmem_npte(file));
> +	for (i = 0; i < shmem_npages(file); i++)
> +		put_page(area->pages[i]);
> +	kvfree(area->pages);
> +	vunmap(ptr);

Is the verdict from mm experts that we can't use vfree due __free_pages 
vs put_page differences?

Could we get from ptes to pages, so that we don't have to keep the 
area->pages array allocated for the duration of the pin?

Regards,

Tvrtko

>   }
>   
>   static int __shmem_rw(struct file *file, loff_t off,
> 

