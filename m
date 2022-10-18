Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180BB6026B4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 10:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424783.672476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okhtc-000472-DB; Tue, 18 Oct 2022 08:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424783.672476; Tue, 18 Oct 2022 08:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okhtc-00044C-9K; Tue, 18 Oct 2022 08:24:20 +0000
Received: by outflank-mailman (input) for mailman id 424783;
 Tue, 18 Oct 2022 08:24:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ieme=2T=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1okhta-000446-Md
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 08:24:18 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4083e01e-4ebe-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 10:24:15 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5CDBB68C4E; Tue, 18 Oct 2022 10:24:13 +0200 (CEST)
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
X-Inumbo-ID: 4083e01e-4ebe-11ed-8fd0-01056ac49cbb
Date: Tue, 18 Oct 2022 10:24:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev, xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev, Robert Beckett <bob.beckett@collabora.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: i915 "GPU HANG", bisected to a2daa27c0c61 "swiotlb: simplify
 swiotlb_max_segment"
Message-ID: <20221018082413.GA25785@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y04i8V7xamTkuqNA@mail-itl>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Oct 18, 2022 at 05:52:16AM +0200, Marek Marczykowski-Górecki wrote:
> not only) when using IGD in Xen PV dom0. After not very long time Xorg
> crashes, and dmesg contain messages like this:
> 
>     i915 0000:00:02.0: [drm] GPU HANG: ecode 7:1:01fffbfe, in Xorg [5337]
>     i915 0000:00:02.0: [drm] Resetting rcs0 for stopped heartbeat on rcs0
>     i915 0000:00:02.0: [drm] Xorg[5337] context reset due to GPU hang

<snip>

> I tried reverting just this commit on top of 6.0.x, but the context
> changed significantly in subsequent commits, so after trying reverting
> it together with 3 or 4 more commits I gave up.
> 
> What may be an important detail, the system heavily uses cross-VM shared
> memory (gntdev) to map window contents from VMs. This is Qubes OS, and
> it uses Xen 4.14.

Can you try the patch below?

---
From 26fe4749750f1bf843666ca777e297279994e33a Mon Sep 17 00:00:00 2001
From: Robert Beckett <bob.beckett@collabora.com>
Date: Tue, 26 Jul 2022 16:39:35 +0100
Subject: drm/i915: stop abusing swiotlb_max_segment

Calling swiotlb functions directly is nowadays considered harmful. See
https://lore.kernel.org/intel-gfx/20220711082614.GA29487@lst.de/

Replace swiotlb_max_segment() calls with dma_max_mapping_size().
In i915_gem_object_get_pages_internal() no longer consider max_segment
only if CONFIG_SWIOTLB is enabled. There can be other (iommu related)
causes of specific max segment sizes.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
[hch: added the Xen hack]
---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c | 19 +++----------
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  4 +--
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c  |  2 +-
 drivers/gpu/drm/i915/i915_scatterlist.h      | 30 +++++++++++---------
 5 files changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index c698f95af15fe..629acb403a2c9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -6,7 +6,6 @@
 
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
-#include <linux/swiotlb.h>
 
 #include "i915_drv.h"
 #include "i915_gem.h"
@@ -38,22 +37,12 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
 	struct scatterlist *sg;
 	unsigned int sg_page_sizes;
 	unsigned int npages;
-	int max_order;
+	int max_order = MAX_ORDER;
+	unsigned int max_segment;
 	gfp_t gfp;
 
-	max_order = MAX_ORDER;
-#ifdef CONFIG_SWIOTLB
-	if (is_swiotlb_active(obj->base.dev->dev)) {
-		unsigned int max_segment;
-
-		max_segment = swiotlb_max_segment();
-		if (max_segment) {
-			max_segment = max_t(unsigned int, max_segment,
-					    PAGE_SIZE) >> PAGE_SHIFT;
-			max_order = min(max_order, ilog2(max_segment));
-		}
-	}
-#endif
+	max_segment = i915_sg_segment_size(i915->drm.dev) >> PAGE_SHIFT;
+	max_order = min(max_order, get_order(max_segment));
 
 	gfp = GFP_KERNEL | __GFP_HIGHMEM | __GFP_RECLAIMABLE;
 	if (IS_I965GM(i915) || IS_I965G(i915)) {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index f42ca1179f373..11125c32dd35d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -194,7 +194,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 	struct intel_memory_region *mem = obj->mm.region;
 	struct address_space *mapping = obj->base.filp->f_mapping;
 	const unsigned long page_count = obj->base.size / PAGE_SIZE;
-	unsigned int max_segment = i915_sg_segment_size();
+	unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
 	struct sg_table *st;
 	struct sgt_iter sgt_iter;
 	struct page *page;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e3fc38dd5db04..de5d0a7241027 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -189,7 +189,7 @@ static int i915_ttm_tt_shmem_populate(struct ttm_device *bdev,
 	struct drm_i915_private *i915 = container_of(bdev, typeof(*i915), bdev);
 	struct intel_memory_region *mr = i915->mm.regions[INTEL_MEMORY_SYSTEM];
 	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
-	const unsigned int max_segment = i915_sg_segment_size();
+	const unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
 	const size_t size = (size_t)ttm->num_pages << PAGE_SHIFT;
 	struct file *filp = i915_tt->filp;
 	struct sgt_iter sgt_iter;
@@ -538,7 +538,7 @@ static struct i915_refct_sgt *i915_ttm_tt_get_st(struct ttm_tt *ttm)
 	ret = sg_alloc_table_from_pages_segment(st,
 			ttm->pages, ttm->num_pages,
 			0, (unsigned long)ttm->num_pages << PAGE_SHIFT,
-			i915_sg_segment_size(), GFP_KERNEL);
+			i915_sg_segment_size(i915_tt->dev), GFP_KERNEL);
 	if (ret) {
 		st->sgl = NULL;
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 8423df021b713..e4515d6acd43c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -129,7 +129,7 @@ static void i915_gem_object_userptr_drop_ref(struct drm_i915_gem_object *obj)
 static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 {
 	const unsigned long num_pages = obj->base.size >> PAGE_SHIFT;
-	unsigned int max_segment = i915_sg_segment_size();
+	unsigned int max_segment = i915_sg_segment_size(obj->base.dev->dev);
 	struct sg_table *st;
 	unsigned int sg_page_sizes;
 	struct page **pvec;
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index 9ddb3e743a3e5..c278888f71528 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.h
+++ b/drivers/gpu/drm/i915/i915_scatterlist.h
@@ -9,7 +9,8 @@
 
 #include <linux/pfn.h>
 #include <linux/scatterlist.h>
-#include <linux/swiotlb.h>
+#include <linux/dma-mapping.h>
+#include <xen/xen.h>
 
 #include "i915_gem.h"
 
@@ -127,19 +128,22 @@ static inline unsigned int i915_sg_dma_sizes(struct scatterlist *sg)
 	return page_sizes;
 }
 
-static inline unsigned int i915_sg_segment_size(void)
+static inline unsigned int i915_sg_segment_size(struct device *dev)
 {
-	unsigned int size = swiotlb_max_segment();
-
-	if (size == 0)
-		size = UINT_MAX;
-
-	size = rounddown(size, PAGE_SIZE);
-	/* swiotlb_max_segment_size can return 1 byte when it means one page. */
-	if (size < PAGE_SIZE)
-		size = PAGE_SIZE;
-
-	return size;
+	size_t max = min_t(size_t, UINT_MAX, dma_max_mapping_size(dev));
+
+	/*
+	 * Xen on x86 can reshuffle pages under us.  The DMA API takes
+	 * care of that both in dma_alloc_* (by calling into the hypervisor
+	 * to make the pages contigous) and in dma_map_* (by bounce buffering).
+	 * But i915 abuses ignores the coherency aspects of the DMA API and
+	 * thus can't cope with bounce buffering actually happening, so add
+	 * a hack here to force small allocations and mapping when running on
+	 * Xen.  (good luck with TDX, btw --hch)
+	 */
+	if (IS_ENABLED(CONFIG_X86) && xen_domain())
+		max = PAGE_SIZE;
+	return round_down(max, PAGE_SIZE);
 }
 
 bool i915_sg_trim(struct sg_table *orig_st);
-- 
2.30.2


