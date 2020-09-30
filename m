Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0CF27F0D1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 19:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.857.2954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNgH2-0005bC-16; Wed, 30 Sep 2020 17:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857.2954; Wed, 30 Sep 2020 17:52:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNgH1-0005aY-Sl; Wed, 30 Sep 2020 17:52:15 +0000
Received: by outflank-mailman (input) for mailman id 857;
 Wed, 30 Sep 2020 17:52:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m0D6=DH=casper.srs.infradead.org=batv+fa6e45c137c1199df5c4+6247+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kNgGz-0005QF-Ol
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:52:13 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43254d8a-894e-459c-b989-d369b73407ae;
 Wed, 30 Sep 2020 17:51:56 +0000 (UTC)
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNgGW-0001Cd-FB; Wed, 30 Sep 2020 17:51:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=m0D6=DH=casper.srs.infradead.org=batv+fa6e45c137c1199df5c4+6247+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kNgGz-0005QF-Ol
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:52:13 +0000
X-Inumbo-ID: 43254d8a-894e-459c-b989-d369b73407ae
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 43254d8a-894e-459c-b989-d369b73407ae;
	Wed, 30 Sep 2020 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=giWGs+AwTWNV8LHpMiZma9cexmVqWf+SNEc+oXKQq0g=; b=gc8Cu/9Ep04/cNHhtVAeFa674D
	zmMnmMz0pFOZAswMboW9Wz7S7p/nm0RwMrBEiA1m1mLUFlbYp5G1UqNu5uGVVUqpdf5h2iMYVsyzS
	nTYpVR1f6i6LfcxhN8x77KKOnmNA6wQQ8sZYhH06NEL60WIhblkDoHJR5m9y4NXHDOLiAXfWntVTx
	QKMWe5aQlsxGdcTFNj53XhspaqiR5soZ8sPBUwgsTi5vAhPXxCiOiX9K4u5IGC+1P8VvevgsLCzRG
	Ns26rIc3Gx62UuCNirjJCIVCe7AuoBSq/0P5Q38CkkrBhcIWx7wUqGLGDsphbtE6XLrY8d+tPZT5E
	Q+ZGTjSg==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNgGW-0001Cd-FB; Wed, 30 Sep 2020 17:51:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Matthew Auld <matthew.auld@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Minchan Kim <minchan@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Nitin Gupta <ngupta@vflare.org>,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [PATCH 07/10] drm/i915: use vmap in i915_gem_object_map
Date: Wed, 30 Sep 2020 19:51:30 +0200
Message-Id: <20200930175133.1252382-8-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930175133.1252382-1-hch@lst.de>
References: <20200930175133.1252382-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

i915_gem_object_map implements fairly low-level vmap functionality in
a driver.  Split it into two helpers, one for remapping kernel memory
which can use vmap, and one for I/O memory that uses vmap_pfn.

The only practical difference is that alloc_vm_area prefeaults the
vmalloc area PTEs, which doesn't seem to be required here for the
kernel memory case (and could be added to vmap using a flag if actually
required).

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/Kconfig              |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 106 +++++++++++-----------
 2 files changed, 52 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 9afa5c4a6bf006..1e1cb245fca778 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -25,6 +25,7 @@ config DRM_I915
 	select CRC32
 	select SND_HDA_I915 if SND_HDA_CORE
 	select CEC_CORE if CEC_NOTIFIER
+	select VMAP_PFN
 	help
 	  Choose this option if you have a system that has "Intel Graphics
 	  Media Accelerator" or "HD Graphics" integrated graphics,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index e8a083743e0927..5c290cb3bada50 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -234,50 +234,23 @@ int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj)
 	return err;
 }
 
-static inline pte_t iomap_pte(resource_size_t base,
-			      dma_addr_t offset,
-			      pgprot_t prot)
-{
-	return pte_mkspecial(pfn_pte((base + offset) >> PAGE_SHIFT, prot));
-}
-
 /* The 'mapping' part of i915_gem_object_pin_map() below */
-static void *i915_gem_object_map(struct drm_i915_gem_object *obj,
-				 enum i915_map_type type)
+static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
+		enum i915_map_type type)
 {
-	unsigned long n_pte = obj->base.size >> PAGE_SHIFT;
-	struct sg_table *sgt = obj->mm.pages;
-	pte_t *stack[32], **mem;
-	struct vm_struct *area;
+	unsigned long n_pages = obj->base.size >> PAGE_SHIFT, i;
+	struct page *stack[32], **pages = stack, *page;
+	struct sgt_iter iter;
 	pgprot_t pgprot;
-
-	if (!i915_gem_object_has_struct_page(obj) && type != I915_MAP_WC)
-		return NULL;
-
-	/* A single page can always be kmapped */
-	if (n_pte == 1 && type == I915_MAP_WB)
-		return kmap(sg_page(sgt->sgl));
-
-	mem = stack;
-	if (n_pte > ARRAY_SIZE(stack)) {
-		/* Too big for stack -- allocate temporary array instead */
-		mem = kvmalloc_array(n_pte, sizeof(*mem), GFP_KERNEL);
-		if (!mem)
-			return NULL;
-	}
-
-	area = alloc_vm_area(obj->base.size, mem);
-	if (!area) {
-		if (mem != stack)
-			kvfree(mem);
-		return NULL;
-	}
+	void *vaddr;
 
 	switch (type) {
 	default:
 		MISSING_CASE(type);
 		fallthrough;	/* to use PAGE_KERNEL anyway */
 	case I915_MAP_WB:
+		if (n_pages == 1)
+			return kmap(sg_page(obj->mm.pages->sgl));
 		pgprot = PAGE_KERNEL;
 		break;
 	case I915_MAP_WC:
@@ -285,30 +258,50 @@ static void *i915_gem_object_map(struct drm_i915_gem_object *obj,
 		break;
 	}
 
-	if (i915_gem_object_has_struct_page(obj)) {
-		struct sgt_iter iter;
-		struct page *page;
-		pte_t **ptes = mem;
+	if (n_pages > ARRAY_SIZE(stack)) {
+		/* Too big for stack -- allocate temporary array instead */
+		pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
+		if (!pages)
+			return NULL;
+	}
 
-		for_each_sgt_page(page, iter, sgt)
-			**ptes++ = mk_pte(page, pgprot);
-	} else {
-		resource_size_t iomap;
-		struct sgt_iter iter;
-		pte_t **ptes = mem;
-		dma_addr_t addr;
+	i = 0;
+	for_each_sgt_page(page, iter, obj->mm.pages)
+		pages[i++] = page;
+	vaddr = vmap(pages, n_pages, 0, pgprot);
+	if (pages != stack)
+		kvfree(pages);
+	return vaddr;
+}
 
-		iomap = obj->mm.region->iomap.base;
-		iomap -= obj->mm.region->region.start;
+static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
+		enum i915_map_type type)
+{
+	resource_size_t iomap = obj->mm.region->iomap.base -
+		obj->mm.region->region.start;
+	unsigned long n_pfn = obj->base.size >> PAGE_SHIFT;
+	unsigned long stack[32], *pfns = stack, i;
+	struct sgt_iter iter;
+	dma_addr_t addr;
+	void *vaddr;
+
+	if (type != I915_MAP_WC)
+		return NULL;
 
-		for_each_sgt_daddr(addr, iter, sgt)
-			**ptes++ = iomap_pte(iomap, addr, pgprot);
+	if (n_pfn > ARRAY_SIZE(stack)) {
+		/* Too big for stack -- allocate temporary array instead */
+		pfns = kvmalloc_array(n_pfn, sizeof(*pfns), GFP_KERNEL);
+		if (!pfns)
+			return NULL;
 	}
 
-	if (mem != stack)
-		kvfree(mem);
-
-	return area->addr;
+	i = 0;
+	for_each_sgt_daddr(addr, iter, obj->mm.pages)
+		pfns[i++] = (iomap + addr) >> PAGE_SHIFT;
+	vaddr = vmap_pfn(pfns, n_pfn, pgprot_writecombine(PAGE_KERNEL_IO));
+	if (pfns != stack)
+		kvfree(pfns);
+	return vaddr;
 }
 
 /* get, pin, and map the pages of the object into kernel space */
@@ -360,7 +353,10 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 	}
 
 	if (!ptr) {
-		ptr = i915_gem_object_map(obj, type);
+		if (i915_gem_object_has_struct_page(obj))
+			ptr = i915_gem_object_map_page(obj, type);
+		else
+			ptr = i915_gem_object_map_pfn(obj, type);
 		if (!ptr) {
 			err = -ENOMEM;
 			goto err_unpin;
-- 
2.28.0


