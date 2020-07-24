Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F03022C818
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 16:35:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyymo-0003qS-1d; Fri, 24 Jul 2020 14:34:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M72E=BD=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1jyymm-0003qN-EH
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 14:34:56 +0000
X-Inumbo-ID: d66fce66-cdba-11ea-882c-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d66fce66-cdba-11ea-882c-bc764e2007e4;
 Fri, 24 Jul 2020 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595601294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+xEG2oRWVrcWwt8QM0VD8vNcd0fbr/DhAE0GizAuzY0=;
 b=YfXe75592delgNEi44dmKvM0d0PtIWCQh8ZZLBb3LppoSPsrkkpua/WRzREAwMsAOHlY8h
 pcPMuRHK4yQys0YinqrlloWZLemBI1MHRLxXHd3V4tpbd3GYVev85BWKEIT3hAy6QswaBX
 wBXFZUNWHVLpr+WXIRHNVA1gSLA6Gqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-WvzseDkuOl2JB5UQZyg1rA-1; Fri, 24 Jul 2020 10:34:50 -0400
X-MC-Unique: WvzseDkuOl2JB5UQZyg1rA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E5581083E8E;
 Fri, 24 Jul 2020 14:34:46 +0000 (UTC)
Received: from [10.36.113.94] (ovpn-113-94.ams2.redhat.com [10.36.113.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 228CF10027A6;
 Fri, 24 Jul 2020 14:34:41 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] xen: add helpers to allocate unpopulated memory
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20200724124241.48208-1-roger.pau@citrix.com>
 <20200724124241.48208-5-roger.pau@citrix.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <1778c97f-3a69-8280-141c-879814dd213f@redhat.com>
Date: Fri, 24 Jul 2020 16:34:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200724124241.48208-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CCing Dan

On 24.07.20 14:42, Roger Pau Monne wrote:
> To be used in order to create foreign mappings. This is based on the
> ZONE_DEVICE facility which is used by persistent memory devices in
> order to create struct pages and kernel virtual mappings for the IOMEM
> areas of such devices. Note that on kernels without support for
> ZONE_DEVICE Xen will fallback to use ballooned pages in order to
> create foreign mappings.
> 
> The newly added helpers use the same parameters as the existing
> {alloc/free}_xenballooned_pages functions, which allows for in-place
> replacement of the callers. Once a memory region has been added to be
> used as scratch mapping space it will no longer be released, and pages
> returned are kept in a linked list. This allows to have a buffer of
> pages and prevents resorting to frequent additions and removals of
> regions.
> 
> If enabled (because ZONE_DEVICE is supported) the usage of the new
> functionality untangles Xen balloon and RAM hotplug from the usage of
> unpopulated physical memory ranges to map foreign pages, which is the
> correct thing to do in order to avoid mappings of foreign pages depend
> on memory hotplug.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I've not added a new memory_type type and just used
> MEMORY_DEVICE_DEVDAX which seems to be what we want for such memory
> regions. I'm unsure whether abusing this type is fine, or if I should
> instead add a specific type, maybe MEMORY_DEVICE_GENERIC? I don't
> think we should be using a specific Xen type at all.
> ---
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Roger Pau Monne <roger.pau@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Yan Yankovskyi <yyankovskyi@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-mm@kvack.org
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> ---
>  drivers/gpu/drm/xen/xen_drm_front_gem.c |   8 +-
>  drivers/xen/Makefile                    |   1 +
>  drivers/xen/balloon.c                   |   4 +-
>  drivers/xen/grant-table.c               |   4 +-
>  drivers/xen/privcmd.c                   |   4 +-
>  drivers/xen/unpopulated-alloc.c         | 222 ++++++++++++++++++++++++
>  drivers/xen/xenbus/xenbus_client.c      |   6 +-
>  drivers/xen/xlate_mmu.c                 |   4 +-
>  include/xen/xen.h                       |   8 +
>  9 files changed, 246 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/xen/unpopulated-alloc.c
> 
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> index f0b85e094111..9dd06eae767a 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> @@ -99,8 +99,8 @@ static struct xen_gem_object *gem_create(struct drm_device *dev, size_t size)
>  		 * allocate ballooned pages which will be used to map
>  		 * grant references provided by the backend
>  		 */
> -		ret = alloc_xenballooned_pages(xen_obj->num_pages,
> -					       xen_obj->pages);
> +		ret = xen_alloc_unpopulated_pages(xen_obj->num_pages,
> +					          xen_obj->pages);
>  		if (ret < 0) {
>  			DRM_ERROR("Cannot allocate %zu ballooned pages: %d\n",
>  				  xen_obj->num_pages, ret);
> @@ -152,8 +152,8 @@ void xen_drm_front_gem_free_object_unlocked(struct drm_gem_object *gem_obj)
>  	} else {
>  		if (xen_obj->pages) {
>  			if (xen_obj->be_alloc) {
> -				free_xenballooned_pages(xen_obj->num_pages,
> -							xen_obj->pages);
> +				xen_free_unpopulated_pages(xen_obj->num_pages,
> +							   xen_obj->pages);
>  				gem_free_pages_array(xen_obj);
>  			} else {
>  				drm_gem_put_pages(&xen_obj->base,
> diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
> index 0d322f3d90cd..788a5d9c8ef0 100644
> --- a/drivers/xen/Makefile
> +++ b/drivers/xen/Makefile
> @@ -42,3 +42,4 @@ xen-gntdev-$(CONFIG_XEN_GNTDEV_DMABUF)	+= gntdev-dmabuf.o
>  xen-gntalloc-y				:= gntalloc.o
>  xen-privcmd-y				:= privcmd.o privcmd-buf.o
>  obj-$(CONFIG_XEN_FRONT_PGDIR_SHBUF)	+= xen-front-pgdir-shbuf.o
> +obj-$(CONFIG_ZONE_DEVICE)		+= unpopulated-alloc.o
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index b1d8b028bf80..815ef10eb2ff 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -654,7 +654,7 @@ void free_xenballooned_pages(int nr_pages, struct page **pages)
>  }
>  EXPORT_SYMBOL(free_xenballooned_pages);
>  
> -#ifdef CONFIG_XEN_PV
> +#if defined(CONFIG_XEN_PV) && !defined(CONFIG_ZONE_DEVICE)
>  static void __init balloon_add_region(unsigned long start_pfn,
>  				      unsigned long pages)
>  {
> @@ -708,7 +708,7 @@ static int __init balloon_init(void)
>  	register_sysctl_table(xen_root);
>  #endif
>  
> -#ifdef CONFIG_XEN_PV
> +#if defined(CONFIG_XEN_PV) && !defined(CONFIG_ZONE_DEVICE)
>  	{
>  		int i;
>  
> diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
> index 8d06bf1cc347..523dcdf39cc9 100644
> --- a/drivers/xen/grant-table.c
> +++ b/drivers/xen/grant-table.c
> @@ -801,7 +801,7 @@ int gnttab_alloc_pages(int nr_pages, struct page **pages)
>  {
>  	int ret;
>  
> -	ret = alloc_xenballooned_pages(nr_pages, pages);
> +	ret = xen_alloc_unpopulated_pages(nr_pages, pages);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -836,7 +836,7 @@ EXPORT_SYMBOL_GPL(gnttab_pages_clear_private);
>  void gnttab_free_pages(int nr_pages, struct page **pages)
>  {
>  	gnttab_pages_clear_private(nr_pages, pages);
> -	free_xenballooned_pages(nr_pages, pages);
> +	xen_free_unpopulated_pages(nr_pages, pages);
>  }
>  EXPORT_SYMBOL_GPL(gnttab_free_pages);
>  
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index a250d118144a..56000ab70974 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -425,7 +425,7 @@ static int alloc_empty_pages(struct vm_area_struct *vma, int numpgs)
>  	if (pages == NULL)
>  		return -ENOMEM;
>  
> -	rc = alloc_xenballooned_pages(numpgs, pages);
> +	rc = xen_alloc_unpopulated_pages(numpgs, pages);
>  	if (rc != 0) {
>  		pr_warn("%s Could not alloc %d pfns rc:%d\n", __func__,
>  			numpgs, rc);
> @@ -900,7 +900,7 @@ static void privcmd_close(struct vm_area_struct *vma)
>  
>  	rc = xen_unmap_domain_gfn_range(vma, numgfns, pages);
>  	if (rc == 0)
> -		free_xenballooned_pages(numpgs, pages);
> +		xen_free_unpopulated_pages(numpgs, pages);
>  	else
>  		pr_crit("unable to unmap MFN range: leaking %d pages. rc=%d\n",
>  			numpgs, rc);
> diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
> new file mode 100644
> index 000000000000..aaa91cefbbf9
> --- /dev/null
> +++ b/drivers/xen/unpopulated-alloc.c
> @@ -0,0 +1,222 @@
> +/*
> + * Helpers to allocate unpopulated memory for foreign mappings
> + *
> + * Copyright (c) 2020, Citrix Systems R&D
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License version 2
> + * as published by the Free Software Foundation; or, when distributed
> + * separately from the Linux kernel or incorporated into other
> + * software packages, subject to the following license:
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this source file (the "Software"), to deal in the Software without
> + * restriction, including without limitation the rights to use, copy, modify,
> + * merge, publish, distribute, sublicense, and/or sell copies of the Software,
> + * and to permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/gfp.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +#include <linux/memremap.h>
> +#include <linux/slab.h>
> +
> +#include <asm/page.h>
> +
> +#include <xen/page.h>
> +#include <xen/xen.h>
> +
> +static DEFINE_MUTEX(lock);
> +static LIST_HEAD(list);
> +static unsigned int count;
> +
> +static int fill(unsigned int nr_pages)
> +{
> +	struct dev_pagemap *pgmap;
> +	void *vaddr;
> +	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
> +	int nid, ret;
> +
> +	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
> +	if (!pgmap)
> +		return -ENOMEM;
> +
> +	pgmap->type = MEMORY_DEVICE_DEVDAX;
> +	pgmap->res.name = "XEN SCRATCH";
> +	pgmap->res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +
> +	ret = allocate_resource(&iomem_resource, &pgmap->res,
> +				alloc_pages * PAGE_SIZE, 0, -1,
> +				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
> +	if (ret < 0) {
> +		pr_err("Cannot allocate new IOMEM resource\n");
> +		kfree(pgmap);
> +		return ret;
> +	}
> +
> +	nid = memory_add_physaddr_to_nid(pgmap->res.start);
> +
> +#ifdef CONFIG_XEN_HAVE_PVMMU
> +	/*
> +	 * We don't support PV MMU when Linux and Xen is using
> +	 * different page granularity.
> +	 */
> +	BUILD_BUG_ON(XEN_PAGE_SIZE != PAGE_SIZE);
> +
> +        /*
> +         * memremap will build page tables for the new memory so
> +         * the p2m must contain invalid entries so the correct
> +         * non-present PTEs will be written.
> +         *
> +         * If a failure occurs, the original (identity) p2m entries
> +         * are not restored since this region is now known not to
> +         * conflict with any devices.
> +         */
> +	if (!xen_feature(XENFEAT_auto_translated_physmap)) {
> +		xen_pfn_t pfn = PFN_DOWN(pgmap->res.start);
> +
> +		for (i = 0; i < alloc_pages; i++) {
> +			if (!set_phys_to_machine(pfn + i, INVALID_P2M_ENTRY)) {
> +				pr_warn("set_phys_to_machine() failed, no memory added\n");
> +				release_resource(&pgmap->res);
> +				kfree(pgmap);
> +				return -ENOMEM;
> +			}
> +                }
> +	}
> +#endif
> +
> +	vaddr = memremap_pages(pgmap, nid);
> +	if (IS_ERR(vaddr)) {
> +		pr_err("Cannot remap memory range\n");
> +		release_resource(&pgmap->res);
> +		kfree(pgmap);
> +		return PTR_ERR(vaddr);
> +	}
> +
> +	for (i = 0; i < alloc_pages; i++) {
> +		struct page *pg = virt_to_page(vaddr + PAGE_SIZE * i);
> +
> +		BUG_ON(!virt_addr_valid(vaddr + PAGE_SIZE * i));
> +		list_add(&pg->lru, &list);
> +		count++;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xen_alloc_unpopulated_pages - alloc unpopulated pages
> + * @nr_pages: Number of pages
> + * @pages: pages returned
> + * @return 0 on success, error otherwise
> + */
> +int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
> +{
> +	unsigned int i;
> +	int ret = 0;
> +
> +	mutex_lock(&lock);
> +	if (count < nr_pages) {
> +		ret = fill(nr_pages);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	for (i = 0; i < nr_pages; i++) {
> +		struct page *pg = list_first_entry_or_null(&list, struct page,
> +							   lru);
> +
> +		BUG_ON(!pg);
> +		list_del(&pg->lru);
> +		count--;
> +		pages[i] = pg;
> +
> +#ifdef CONFIG_XEN_HAVE_PVMMU
> +		/*
> +		 * We don't support PV MMU when Linux and Xen is using
> +		 * different page granularity.
> +		 */
> +		BUILD_BUG_ON(XEN_PAGE_SIZE != PAGE_SIZE);
> +
> +		if (!xen_feature(XENFEAT_auto_translated_physmap)) {
> +			ret = xen_alloc_p2m_entry(page_to_pfn(pg));
> +			if (ret < 0) {
> +				unsigned int j;
> +
> +				for (j = 0; j <= i; j++) {
> +					list_add(&pages[j]->lru, &list);
> +					count++;
> +				}
> +				goto out;
> +			}
> +		}
> +#endif
> +	}
> +
> +out:
> +	mutex_unlock(&lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL(xen_alloc_unpopulated_pages);
> +
> +/**
> + * xen_free_unpopulated_pages - return unpopulated pages
> + * @nr_pages: Number of pages
> + * @pages: pages to return
> + */
> +void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
> +{
> +	unsigned int i;
> +
> +	mutex_lock(&lock);
> +	for (i = 0; i < nr_pages; i++) {
> +		list_add(&pages[i]->lru, &list);
> +		count++;
> +	}
> +	mutex_unlock(&lock);
> +}
> +EXPORT_SYMBOL(xen_free_unpopulated_pages);
> +
> +#ifdef CONFIG_XEN_PV
> +static int __init init(void)
> +{
> +	unsigned int i;
> +
> +	if (!xen_domain())
> +		return -ENODEV;
> +
> +	/*
> +	 * Initialize with pages from the extra memory regions (see
> +	 * arch/x86/xen/setup.c).
> +	 */
> +	for (i = 0; i < XEN_EXTRA_MEM_MAX_REGIONS; i++) {
> +		unsigned int j;
> +
> +		for (j = 0; j < xen_extra_mem[i].n_pfns; j++) {
> +			struct page *pg =
> +				pfn_to_page(xen_extra_mem[i].start_pfn + j);
> +
> +			list_add(&pg->lru, &list);
> +			count++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +subsys_initcall(init);
> +#endif
> diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
> index 786fbb7d8be0..70b6c4780fbd 100644
> --- a/drivers/xen/xenbus/xenbus_client.c
> +++ b/drivers/xen/xenbus/xenbus_client.c
> @@ -615,7 +615,7 @@ static int xenbus_map_ring_hvm(struct xenbus_device *dev,
>  	bool leaked = false;
>  	unsigned int nr_pages = XENBUS_PAGES(nr_grefs);
>  
> -	err = alloc_xenballooned_pages(nr_pages, node->hvm.pages);
> +	err = xen_alloc_unpopulated_pages(nr_pages, node->hvm.pages);
>  	if (err)
>  		goto out_err;
>  
> @@ -656,7 +656,7 @@ static int xenbus_map_ring_hvm(struct xenbus_device *dev,
>  			 addr, nr_pages);
>   out_free_ballooned_pages:
>  	if (!leaked)
> -		free_xenballooned_pages(nr_pages, node->hvm.pages);
> +		xen_free_unpopulated_pages(nr_pages, node->hvm.pages);
>   out_err:
>  	return err;
>  }
> @@ -852,7 +852,7 @@ static int xenbus_unmap_ring_hvm(struct xenbus_device *dev, void *vaddr)
>  			       info.addrs);
>  	if (!rv) {
>  		vunmap(vaddr);
> -		free_xenballooned_pages(nr_pages, node->hvm.pages);
> +		xen_free_unpopulated_pages(nr_pages, node->hvm.pages);
>  	}
>  	else
>  		WARN(1, "Leaking %p, size %u page(s)\n", vaddr, nr_pages);
> diff --git a/drivers/xen/xlate_mmu.c b/drivers/xen/xlate_mmu.c
> index 7b1077f0abcb..34742c6e189e 100644
> --- a/drivers/xen/xlate_mmu.c
> +++ b/drivers/xen/xlate_mmu.c
> @@ -232,7 +232,7 @@ int __init xen_xlate_map_ballooned_pages(xen_pfn_t **gfns, void **virt,
>  		kfree(pages);
>  		return -ENOMEM;
>  	}
> -	rc = alloc_xenballooned_pages(nr_pages, pages);
> +	rc = xen_alloc_unpopulated_pages(nr_pages, pages);
>  	if (rc) {
>  		pr_warn("%s Couldn't balloon alloc %ld pages rc:%d\n", __func__,
>  			nr_pages, rc);
> @@ -249,7 +249,7 @@ int __init xen_xlate_map_ballooned_pages(xen_pfn_t **gfns, void **virt,
>  	if (!vaddr) {
>  		pr_warn("%s Couldn't map %ld pages rc:%d\n", __func__,
>  			nr_pages, rc);
> -		free_xenballooned_pages(nr_pages, pages);
> +		xen_free_unpopulated_pages(nr_pages, pages);
>  		kfree(pages);
>  		kfree(pfns);
>  		return -ENOMEM;
> diff --git a/include/xen/xen.h b/include/xen/xen.h
> index 19a72f591e2b..aa33bc0d933c 100644
> --- a/include/xen/xen.h
> +++ b/include/xen/xen.h
> @@ -52,4 +52,12 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
>  extern u64 xen_saved_max_mem_size;
>  #endif
>  
> +#ifdef CONFIG_ZONE_DEVICE
> +int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
> +void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
> +#else
> +#define xen_alloc_unpopulated_pages alloc_xenballooned_pages
> +#define xen_free_unpopulated_pages free_xenballooned_pages
> +#endif
> +
>  #endif	/* _XEN_XEN_H */
> 



-- 
Thanks,

David / dhildenb


