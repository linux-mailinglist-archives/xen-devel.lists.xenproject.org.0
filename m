Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C67278962
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 15:22:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLnff-00073h-4b; Fri, 25 Sep 2020 13:21:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Inn=DC=linux.intel.com=tvrtko.ursulin@srs-us1.protection.inumbo.net>)
 id 1kLnfd-00073O-90
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 13:21:53 +0000
X-Inumbo-ID: 164009c7-aca2-4e5f-8bcb-fc221b018831
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 164009c7-aca2-4e5f-8bcb-fc221b018831;
 Fri, 25 Sep 2020 13:05:49 +0000 (UTC)
IronPort-SDR: HNPTlGjzuID6UFCPX3jP8hEbAd7UXQlOSQ00AFG/8JpDV7Hk4bSVuGMUOwVnq1p8xZ6j65VKr2
 s+tYJBxotxvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="162417562"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="162417562"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:05:43 -0700
IronPort-SDR: 5Dwboiqhy5yHPzqfhh5/S6fzq83iIqIUdZO8emD2bnlcA/WE0SaYoeYBpYxDMx5CtVPALBxtts
 ZUeFrbRupJww==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="455824158"
Received: from mlevy2-mobl.ger.corp.intel.com (HELO [10.251.176.131])
 ([10.251.176.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:05:34 -0700
Subject: Re: [PATCH 06/11] drm/i915: use vmap in shmem_pin_map
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Minchan Kim <minchan@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Nitin Gupta <ngupta@vflare.org>,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20200924135853.875294-1-hch@lst.de>
 <20200924135853.875294-7-hch@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9459e195-a412-3357-c53d-4349e600896d@linux.intel.com>
Date: Fri, 25 Sep 2020 14:05:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924135853.875294-7-hch@lst.de>
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


On 24/09/2020 14:58, Christoph Hellwig wrote:
> shmem_pin_map somewhat awkwardly reimplements vmap using
> alloc_vm_area and manual pte setup.  The only practical difference
> is that alloc_vm_area prefeaults the vmalloc area PTEs, which doesn't
> seem to be required here (and could be added to vmap using a flag if
> actually required).  Switch to use vmap, and use vfree to free both the
> vmalloc mapping and the page array, as well as dropping the references
> to each page.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/gpu/drm/i915/gt/shmem_utils.c | 76 +++++++--------------------
>   1 file changed, 18 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
> index 43c7acbdc79dea..f011ea42487e11 100644
> --- a/drivers/gpu/drm/i915/gt/shmem_utils.c
> +++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
> @@ -49,80 +49,40 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
>   	return file;
>   }
>   
> -static size_t shmem_npte(struct file *file)
> -{
> -	return file->f_mapping->host->i_size >> PAGE_SHIFT;
> -}
> -
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
> -	struct vm_struct *area;
> -	unsigned long pfn;
> -
> -	mem = stack;
> -	if (n_pte > ARRAY_SIZE(stack)) {
> -		mem = kvmalloc_array(n_pte, sizeof(*mem), GFP_KERNEL);
> -		if (!mem)
> -			return NULL;
> -	}
> +	struct page **pages;
> +	size_t n_pages, i;
> +	void *vaddr;
>   
> -	area = alloc_vm_area(n_pte << PAGE_SHIFT, mem);
> -	if (!area) {
> -		if (mem != stack)
> -			kvfree(mem);
> +	n_pages = file->f_mapping->host->i_size >> PAGE_SHIFT;
> +	pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
> +	if (!pages)
>   		return NULL;
> -	}
>   
> -	ptes = mem;
> -	for (pfn = 0; pfn < n_pte; pfn++) {
> -		struct page *page;
> -
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
> +	vaddr = vmap(pages, n_pages, VM_MAP_PUT_PAGES, PAGE_KERNEL);
> +	if (!vaddr)
> +		goto err_page;
>   	mapping_set_unevictable(file->f_mapping);
> -	return area->addr;
> -
> +	return vaddr;
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
>   	mapping_clear_unevictable(file->f_mapping);
> -	__shmem_unpin_map(file, ptr, shmem_npte(file));
> +	vfree(ptr);
>   }
>   
>   static int __shmem_rw(struct file *file, loff_t off,
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

