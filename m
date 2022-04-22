Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA4D50AF52
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 07:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310679.527591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhlSm-0001B1-EK; Fri, 22 Apr 2022 05:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310679.527591; Fri, 22 Apr 2022 05:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhlSm-00018B-BM; Fri, 22 Apr 2022 05:04:12 +0000
Received: by outflank-mailman (input) for mailman id 310679;
 Fri, 22 Apr 2022 05:04:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uSuW=VA=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nhlSk-000185-4i
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 05:04:10 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3e31141-c1f9-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 07:04:08 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id ECC2D68B05; Fri, 22 Apr 2022 07:04:05 +0200 (CEST)
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
X-Inumbo-ID: a3e31141-c1f9-11ec-8fc2-03012f2f19d4
Date: Fri, 22 Apr 2022 07:04:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <Rahul.Singh@arm.com>, Christoph Hellwig <hch@lst.de>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
Message-ID: <20220422050405.GA10195@lst.de>
References: <20220415063705.GA24262@lst.de> <alpine.DEB.2.22.394.2204150917390.915916@ubuntu-linux-20-04-desktop> <4BC65913-EB0A-441C-A09C-4175697BDE9D@arm.com> <alpine.DEB.2.22.394.2204181225340.915916@ubuntu-linux-20-04-desktop> <49E3535A-5672-4047-AF86-05D5597C7019@arm.com> <alpine.DEB.2.22.394.2204191933450.915916@ubuntu-linux-20-04-desktop> <5C7EC3F4-9126-46E8-9321-60878357F939@arm.com> <alpine.DEB.2.22.394.2204201523390.915916@ubuntu-linux-20-04-desktop> <12279FAE-2141-469E-A424-9984348E84BB@arm.com> <alpine.DEB.2.22.394.2204211444190.915916@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204211444190.915916@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Apr 21, 2022 at 03:01:32PM -0700, Stefano Stabellini wrote:
> swiotlb-xen: handle DMA_ATTR_NO_KERNEL_MAPPING
> 
> If DMA_ATTR_NO_KERNEL_MAPPING is set then the returned vaddr is a struct
> *page instead of the virtual mapping of the buffer.
> 
> In xen_swiotlb_alloc_coherent, do not call virt_to_page, instead use the
> returned pointer directly. Also do not memset the buffer or struct page
> to zero.
> 
> In xen_swiotlb_free_coherent, check DMA_ATTR_NO_KERNEL_MAPPING and set
> the page pointer appropriately.

Something like that should work, but it makes swiotlb-xen poke even
more into the opaque dma-direct internals.  I'd rather do something
like the patch below that uses the dma_direct allocator directly for
arm, and simplifies the xen-swiotlb allocator now that it just needs
to cater to the x86 case:

diff --git a/arch/arm/include/asm/xen/page-coherent.h b/arch/arm/include/asm/xen/page-coherent.h
deleted file mode 100644
index 27e984977402b..0000000000000
--- a/arch/arm/include/asm/xen/page-coherent.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <xen/arm/page-coherent.h>
diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index a7e54a087b802..6e603e5fdebb1 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -118,23 +118,6 @@ bool xen_arch_need_swiotlb(struct device *dev,
 		!dev_is_dma_coherent(dev));
 }
 
-int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
-				 unsigned int address_bits,
-				 dma_addr_t *dma_handle)
-{
-	if (!xen_initial_domain())
-		return -EINVAL;
-
-	/* we assume that dom0 is mapped 1:1 for now */
-	*dma_handle = pstart;
-	return 0;
-}
-
-void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
-{
-	return;
-}
-
 static int __init xen_mm_init(void)
 {
 	struct gnttab_cache_flush cflush;
diff --git a/arch/arm64/include/asm/xen/page-coherent.h b/arch/arm64/include/asm/xen/page-coherent.h
deleted file mode 100644
index 27e984977402b..0000000000000
--- a/arch/arm64/include/asm/xen/page-coherent.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <xen/arm/page-coherent.h>
diff --git a/arch/x86/include/asm/xen/page-coherent.h b/arch/x86/include/asm/xen/page-coherent.h
deleted file mode 100644
index 63cd41b2e17ac..0000000000000
--- a/arch/x86/include/asm/xen/page-coherent.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_XEN_PAGE_COHERENT_H
-#define _ASM_X86_XEN_PAGE_COHERENT_H
-
-#include <asm/page.h>
-#include <linux/dma-mapping.h>
-
-static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_t size,
-		dma_addr_t *dma_handle, gfp_t flags,
-		unsigned long attrs)
-{
-	void *vstart = (void*)__get_free_pages(flags, get_order(size));
-	*dma_handle = virt_to_phys(vstart);
-	return vstart;
-}
-
-static inline void xen_free_coherent_pages(struct device *hwdev, size_t size,
-		void *cpu_addr, dma_addr_t dma_handle,
-		unsigned long attrs)
-{
-	free_pages((unsigned long) cpu_addr, get_order(size));
-}
-
-#endif /* _ASM_X86_XEN_PAGE_COHERENT_H */
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 47aebd98f52f5..557edb9c54879 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -36,7 +36,6 @@
 #include <xen/hvc-console.h>
 
 #include <asm/dma-mapping.h>
-#include <asm/xen/page-coherent.h>
 
 #include <trace/events/swiotlb.h>
 #define MAX_DMA_BITS 32
@@ -104,6 +103,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
+#ifdef CONFIG_X86
 static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
 	int rc;
@@ -129,6 +129,12 @@ static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 	} while (i < nslabs);
 	return 0;
 }
+#else
+static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
+{
+	return 0;
+}
+#endif
 
 enum xen_swiotlb_err {
 	XEN_SWIOTLB_UNKNOWN = 0,
@@ -256,97 +262,60 @@ void __init xen_swiotlb_init_early(void)
 		panic("Cannot allocate SWIOTLB buffer");
 	swiotlb_set_max_segment(PAGE_SIZE);
 }
-#endif /* CONFIG_X86 */
 
 static void *
-xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
-			   dma_addr_t *dma_handle, gfp_t flags,
-			   unsigned long attrs)
+xen_swiotlb_alloc_coherent(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
 {
-	void *ret;
+	u64 dma_mask = dev->coherent_dma_mask;
 	int order = get_order(size);
-	u64 dma_mask = DMA_BIT_MASK(32);
 	phys_addr_t phys;
-	dma_addr_t dev_addr;
-
-	/*
-	* Ignore region specifiers - the kernel's ideas of
-	* pseudo-phys memory layout has nothing to do with the
-	* machine physical layout.  We can't allocate highmem
-	* because we can't return a pointer to it.
-	*/
-	flags &= ~(__GFP_DMA | __GFP_HIGHMEM);
+	void *ret;
 
-	/* Convert the size to actually allocated. */
+	/* Align the allocation to the Xen page size */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
-	/* On ARM this function returns an ioremap'ped virtual address for
-	 * which virt_to_phys doesn't return the corresponding physical
-	 * address. In fact on ARM virt_to_phys only works for kernel direct
-	 * mapped RAM memory. Also see comment below.
-	 */
-	ret = xen_alloc_coherent_pages(hwdev, size, dma_handle, flags, attrs);
-
+	ret = (void *)__get_free_pages(flags, get_order(size));
 	if (!ret)
 		return ret;
-
-	if (hwdev && hwdev->coherent_dma_mask)
-		dma_mask = hwdev->coherent_dma_mask;
-
-	/* At this point dma_handle is the dma address, next we are
-	 * going to set it to the machine address.
-	 * Do not use virt_to_phys(ret) because on ARM it doesn't correspond
-	 * to *dma_handle. */
-	phys = dma_to_phys(hwdev, *dma_handle);
-	dev_addr = xen_phys_to_dma(hwdev, phys);
-	if (((dev_addr + size - 1 <= dma_mask)) &&
-	    !range_straddles_page_boundary(phys, size))
-		*dma_handle = dev_addr;
-	else {
-		if (xen_create_contiguous_region(phys, order,
-						 fls64(dma_mask), dma_handle) != 0) {
-			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
-			return NULL;
-		}
-		*dma_handle = phys_to_dma(hwdev, *dma_handle);
+	phys = virt_to_phys(ret);
+
+	*dma_handle = xen_phys_to_dma(dev, phys);
+	if (*dma_handle + size - 1 > dma_mask ||
+	    range_straddles_page_boundary(phys, size)) {
+		if (xen_create_contiguous_region(phys, order, fls64(dma_mask),
+				dma_handle) != 0)
+			goto out_free_pages;
 		SetPageXenRemapped(virt_to_page(ret));
 	}
+
 	memset(ret, 0, size);
 	return ret;
+
+out_free_pages:
+	free_pages((unsigned long)ret, get_order(size));
+	return NULL;
 }
 
 static void
-xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
-			  dma_addr_t dev_addr, unsigned long attrs)
+xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
+		dma_addr_t dma_handle, unsigned long attrs)
 {
+	phys_addr_t phys = virt_to_phys(vaddr);
 	int order = get_order(size);
-	phys_addr_t phys;
-	u64 dma_mask = DMA_BIT_MASK(32);
-	struct page *page;
-
-	if (hwdev && hwdev->coherent_dma_mask)
-		dma_mask = hwdev->coherent_dma_mask;
-
-	/* do not use virt_to_phys because on ARM it doesn't return you the
-	 * physical address */
-	phys = xen_dma_to_phys(hwdev, dev_addr);
 
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
-	if (is_vmalloc_addr(vaddr))
-		page = vmalloc_to_page(vaddr);
-	else
-		page = virt_to_page(vaddr);
+	if (WARN_ON_ONCE(dma_handle + size - 1 > dev->coherent_dma_mask) ||
+	    WARN_ON_ONCE(range_straddles_page_boundary(phys, size)))
+	    	return;
 
-	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
-		     range_straddles_page_boundary(phys, size)) &&
-	    TestClearPageXenRemapped(page))
+	if (TestClearPageXenRemapped(virt_to_page(vaddr)))
 		xen_destroy_contiguous_region(phys, order);
-
-	xen_free_coherent_pages(hwdev, size, vaddr, phys_to_dma(hwdev, phys),
-				attrs);
+	free_pages((unsigned long)vaddr, get_order(size));
 }
+#endif /* CONFIG_X86 */
 
 /*
  * Map a single buffer of the indicated size for DMA in streaming mode.  The
@@ -549,8 +518,13 @@ xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
+#ifdef CONFIG_X86
 	.alloc = xen_swiotlb_alloc_coherent,
 	.free = xen_swiotlb_free_coherent,
+#else
+	.alloc = dma_direct_alloc,
+	.free = dma_direct_free,
+#endif
 	.sync_single_for_cpu = xen_swiotlb_sync_single_for_cpu,
 	.sync_single_for_device = xen_swiotlb_sync_single_for_device,
 	.sync_sg_for_cpu = xen_swiotlb_sync_sg_for_cpu,
diff --git a/include/xen/arm/page-coherent.h b/include/xen/arm/page-coherent.h
deleted file mode 100644
index b9cc11e887ed5..0000000000000
--- a/include/xen/arm/page-coherent.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _XEN_ARM_PAGE_COHERENT_H
-#define _XEN_ARM_PAGE_COHERENT_H
-
-#include <linux/dma-mapping.h>
-#include <asm/page.h>
-
-static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_t size,
-		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
-{
-	return dma_direct_alloc(hwdev, size, dma_handle, flags, attrs);
-}
-
-static inline void xen_free_coherent_pages(struct device *hwdev, size_t size,
-		void *cpu_addr, dma_addr_t dma_handle, unsigned long attrs)
-{
-	dma_direct_free(hwdev, size, cpu_addr, dma_handle, attrs);
-}
-
-#endif /* _XEN_ARM_PAGE_COHERENT_H */

