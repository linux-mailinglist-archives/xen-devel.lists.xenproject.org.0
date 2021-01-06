Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B381D2EB993
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 06:43:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62298.110308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx1bD-00018k-2v; Wed, 06 Jan 2021 05:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62298.110308; Wed, 06 Jan 2021 05:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx1bC-000183-VM; Wed, 06 Jan 2021 05:43:10 +0000
Received: by outflank-mailman (input) for mailman id 62298;
 Wed, 06 Jan 2021 03:41:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBi8=GJ=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1kwzhe-0005e4-7x
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 03:41:42 +0000
Received: from mail-pl1-x62d.google.com (unknown [2607:f8b0:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd4f283c-986b-4984-b9ab-f4a3892b60de;
 Wed, 06 Jan 2021 03:41:40 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id q4so876723plr.7
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 19:41:40 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:3e52:82ff:fe5e:cc9d])
 by smtp.gmail.com with ESMTPSA id v15sm690974pfn.217.2021.01.05.19.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 19:41:38 -0800 (PST)
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
X-Inumbo-ID: cd4f283c-986b-4984-b9ab-f4a3892b60de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iaVOsKMvFDJYn55B6p38dczfl91LGu9UJUDGkSKIIuA=;
        b=Wd25yMi/LH9CrpDNCdod8ZuwAhKMpkRR0yK0iyOtUJX5+JrAlM8LRrWgdVy0/ZmO7b
         1jsT6wpnhxzgyKVtcN0/irI63tatCC+aG0Ke+zE9Hqqq+IC5FUQ/gEsRtxo1Iz0zjdp4
         mrFQo9eapIqiFBskqxNfIZwWHXaV3iOAHVbX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iaVOsKMvFDJYn55B6p38dczfl91LGu9UJUDGkSKIIuA=;
        b=p3KDIqSi4Q6raR3j5zBuv6eFpcDJqCGgguSbuVJpt8yD2FmGlIV8HPplZsVcXdTdoc
         6r86QrW/EDEmtwRKhdVX1AbN2NbxHwXB44/0Jt4FiPrxWvrYUeJKrSVYuty5hnTqQRcO
         w3/AELR/m+YB03075gWVNeOOo8MrbDjgCGtcFvSzDRcSbTAmlwHgKPzfnJ0jrg4H0KaK
         PcGSpgd32OjI9VyWRC7MRzWJpOBfMX/EjQIfXzHNmTe23VSgZuvU/qg/hD6hCZC3jiPt
         L5izKr6qY3uqBNJcWrZzUYD2vFUO9tPxhF6XjOjSCNxC9ItYgRRPT9gk7Qd3m2HH2R5o
         aUXg==
X-Gm-Message-State: AOAM532WdOKLWs/tLpnhHoKBT1On/9nNQ7l/m7gisvG85I91jNN4ETVz
	NPfXLXeI9nbD0VTHFJltyVsRmw==
X-Google-Smtp-Source: ABdhPJyuJpkeVt0ODIilijkP6Uq2ZjzjhDDZESbhcJhHxYV7NpHV8otDe9U+HR7alXQpTjFLXj3ueQ==
X-Received: by 2002:a17:90b:1882:: with SMTP id mn2mr2249148pjb.236.1609904499318;
        Tue, 05 Jan 2021 19:41:39 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: robh+dt@kernel.org,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	joro@8bytes.org,
	will@kernel.org,
	frowand.list@gmail.com,
	konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: grant.likely@arm.com,
	xypron.glpk@gmx.de,
	treding@nvidia.com,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	gregkh@linuxfoundation.org,
	saravanak@google.com,
	rafael.j.wysocki@intel.com,
	heikki.krogerus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org,
	dan.j.williams@intel.com,
	bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	tfiga@chromium.org,
	drinkcat@chromium.org,
	Claire Chang <tientzu@chromium.org>
Subject: [RFC PATCH v3 1/6] swiotlb: Add io_tlb_mem struct
Date: Wed,  6 Jan 2021 11:41:19 +0800
Message-Id: <20210106034124.30560-2-tientzu@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210106034124.30560-1-tientzu@chromium.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added a new struct, io_tlb_mem, as the IO TLB memory pool descriptor and
moved relevant global variables into that struct.
This will be useful later to allow for restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 arch/powerpc/platforms/pseries/svm.c |   4 +-
 drivers/xen/swiotlb-xen.c            |   4 +-
 include/linux/swiotlb.h              |  39 +++-
 kernel/dma/swiotlb.c                 | 292 +++++++++++++--------------
 4 files changed, 178 insertions(+), 161 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 7b739cc7a8a9..2b767f1ca5fd 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -55,8 +55,8 @@ void __init svm_swiotlb_init(void)
 	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
 		return;
 
-	if (io_tlb_start)
-		memblock_free_early(io_tlb_start,
+	if (io_tlb_default_mem.start)
+		memblock_free_early(io_tlb_default_mem.start,
 				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
 }
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99..4d17dff7ffd2 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -192,8 +192,8 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	/*
 	 * IO TLB memory already allocated. Just use it.
 	 */
-	if (io_tlb_start != 0) {
-		xen_io_tlb_start = phys_to_virt(io_tlb_start);
+	if (io_tlb_default_mem.start != 0) {
+		xen_io_tlb_start = phys_to_virt(io_tlb_default_mem.start);
 		goto end;
 	}
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index d9c9fc9ca5d2..dd8eb57cbb8f 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -70,11 +70,46 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
-extern phys_addr_t io_tlb_start, io_tlb_end;
+
+/**
+ * struct io_tlb_mem - IO TLB Memory Pool Descriptor
+ *
+ * @start:	The start address of the swiotlb memory pool. Used to do a quick
+ *		range check to see if the memory was in fact allocated by this
+ *		API.
+ * @end:	The end address of the swiotlb memory pool. Used to do a quick
+ *		range check to see if the memory was in fact allocated by this
+ *		API.
+ * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
+ *		@end. This is command line adjustable via setup_io_tlb_npages.
+ * @used:	The number of used IO TLB block.
+ * @list:	The free list describing the number of free entries available
+ *		from each index.
+ * @index:	The index to start searching in the next round.
+ * @orig_addr:	The original address corresponding to a mapped entry for the
+ *		sync operations.
+ * @lock:	The lock to protect the above data structures in the map and
+ *		unmap calls.
+ * @debugfs:	The dentry to debugfs.
+ */
+struct io_tlb_mem {
+	phys_addr_t start;
+	phys_addr_t end;
+	unsigned long nslabs;
+	unsigned long used;
+	unsigned int *list;
+	unsigned int index;
+	phys_addr_t *orig_addr;
+	spinlock_t lock;
+	struct dentry *debugfs;
+};
+extern struct io_tlb_mem io_tlb_default_mem;
 
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 {
-	return paddr >= io_tlb_start && paddr < io_tlb_end;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+
+	return paddr >= mem->start && paddr < mem->end;
 }
 
 void __init swiotlb_exit(void);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 7c42df6e6100..e4368159f88a 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -61,33 +61,11 @@
  * allocate a contiguous 1MB, we're probably in trouble anyway.
  */
 #define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
+#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
 
 enum swiotlb_force swiotlb_force;
 
-/*
- * Used to do a quick range check in swiotlb_tbl_unmap_single and
- * swiotlb_tbl_sync_single_*, to see if the memory was in fact allocated by this
- * API.
- */
-phys_addr_t io_tlb_start, io_tlb_end;
-
-/*
- * The number of IO TLB blocks (in groups of 64) between io_tlb_start and
- * io_tlb_end.  This is command line adjustable via setup_io_tlb_npages.
- */
-static unsigned long io_tlb_nslabs;
-
-/*
- * The number of used IO TLB block
- */
-static unsigned long io_tlb_used;
-
-/*
- * This is a free list describing the number of free entries available from
- * each index
- */
-static unsigned int *io_tlb_list;
-static unsigned int io_tlb_index;
+struct io_tlb_mem io_tlb_default_mem;
 
 /*
  * Max segment that we can provide which (if pages are contingous) will
@@ -95,27 +73,17 @@ static unsigned int io_tlb_index;
  */
 static unsigned int max_segment;
 
-/*
- * We need to save away the original address corresponding to a mapped entry
- * for the sync operations.
- */
-#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
-static phys_addr_t *io_tlb_orig_addr;
-
-/*
- * Protect the above data structures in the map and unmap calls
- */
-static DEFINE_SPINLOCK(io_tlb_lock);
-
 static int late_alloc;
 
 static int __init
 setup_io_tlb_npages(char *str)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+
 	if (isdigit(*str)) {
-		io_tlb_nslabs = simple_strtoul(str, &str, 0);
+		mem->nslabs = simple_strtoul(str, &str, 0);
 		/* avoid tail segment of size < IO_TLB_SEGSIZE */
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
 	}
 	if (*str == ',')
 		++str;
@@ -123,7 +91,7 @@ setup_io_tlb_npages(char *str)
 		swiotlb_force = SWIOTLB_FORCE;
 	} else if (!strcmp(str, "noforce")) {
 		swiotlb_force = SWIOTLB_NO_FORCE;
-		io_tlb_nslabs = 1;
+		mem->nslabs = 1;
 	}
 
 	return 0;
@@ -134,7 +102,7 @@ static bool no_iotlb_memory;
 
 unsigned long swiotlb_nr_tbl(void)
 {
-	return unlikely(no_iotlb_memory) ? 0 : io_tlb_nslabs;
+	return unlikely(no_iotlb_memory) ? 0 : io_tlb_default_mem.nslabs;
 }
 EXPORT_SYMBOL_GPL(swiotlb_nr_tbl);
 
@@ -156,13 +124,14 @@ unsigned long swiotlb_size_or_default(void)
 {
 	unsigned long size;
 
-	size = io_tlb_nslabs << IO_TLB_SHIFT;
+	size = io_tlb_default_mem.nslabs << IO_TLB_SHIFT;
 
 	return size ? size : (IO_TLB_DEFAULT_SIZE);
 }
 
 void __init swiotlb_adjust_size(unsigned long new_size)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long size;
 
 	/*
@@ -170,10 +139,10 @@ void __init swiotlb_adjust_size(unsigned long new_size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
-	if (!io_tlb_nslabs) {
+	if (!mem->nslabs) {
 		size = ALIGN(new_size, 1 << IO_TLB_SHIFT);
-		io_tlb_nslabs = size >> IO_TLB_SHIFT;
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+		mem->nslabs = size >> IO_TLB_SHIFT;
+		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
 
 		pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
 	}
@@ -181,14 +150,15 @@ void __init swiotlb_adjust_size(unsigned long new_size)
 
 void swiotlb_print_info(void)
 {
-	unsigned long bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	unsigned long bytes = mem->nslabs << IO_TLB_SHIFT;
 
 	if (no_iotlb_memory) {
 		pr_warn("No low mem\n");
 		return;
 	}
 
-	pr_info("mapped [mem %pa-%pa] (%luMB)\n", &io_tlb_start, &io_tlb_end,
+	pr_info("mapped [mem %pa-%pa] (%luMB)\n", &mem->start, &mem->end,
 	       bytes >> 20);
 }
 
@@ -200,57 +170,59 @@ void swiotlb_print_info(void)
  */
 void __init swiotlb_update_mem_attributes(void)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	void *vaddr;
 	unsigned long bytes;
 
 	if (no_iotlb_memory || late_alloc)
 		return;
 
-	vaddr = phys_to_virt(io_tlb_start);
-	bytes = PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT);
+	vaddr = phys_to_virt(mem->start);
+	bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
 	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
 	memset(vaddr, 0, bytes);
 }
 
 int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long i, bytes;
 	size_t alloc_size;
 
 	bytes = nslabs << IO_TLB_SHIFT;
 
-	io_tlb_nslabs = nslabs;
-	io_tlb_start = __pa(tlb);
-	io_tlb_end = io_tlb_start + bytes;
+	mem->nslabs = nslabs;
+	mem->start = __pa(tlb);
+	mem->end = mem->start + bytes;
 
 	/*
 	 * Allocate and initialize the free list array.  This array is used
 	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
-	 * between io_tlb_start and io_tlb_end.
+	 * between mem->start and mem->end.
 	 */
-	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(int));
-	io_tlb_list = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_list)
+	alloc_size = PAGE_ALIGN(mem->nslabs * sizeof(int));
+	mem->list = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!mem->list)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(phys_addr_t));
-	io_tlb_orig_addr = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_orig_addr)
+	alloc_size = PAGE_ALIGN(mem->nslabs * sizeof(phys_addr_t));
+	mem->orig_addr = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!mem->orig_addr)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	for (i = 0; i < io_tlb_nslabs; i++) {
-		io_tlb_list[i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
-		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
+	for (i = 0; i < mem->nslabs; i++) {
+		mem->list[i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
+		mem->orig_addr[i] = INVALID_PHYS_ADDR;
 	}
-	io_tlb_index = 0;
+	mem->index = 0;
 	no_iotlb_memory = false;
 
 	if (verbose)
 		swiotlb_print_info();
 
-	swiotlb_set_max_segment(io_tlb_nslabs << IO_TLB_SHIFT);
+	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
 	return 0;
 }
 
@@ -261,26 +233,27 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 void  __init
 swiotlb_init(int verbose)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	size_t default_size = IO_TLB_DEFAULT_SIZE;
 	unsigned char *vstart;
 	unsigned long bytes;
 
-	if (!io_tlb_nslabs) {
-		io_tlb_nslabs = (default_size >> IO_TLB_SHIFT);
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+	if (!mem->nslabs) {
+		mem->nslabs = (default_size >> IO_TLB_SHIFT);
+		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
 	}
 
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	bytes = mem->nslabs << IO_TLB_SHIFT;
 
 	/* Get IO TLB memory from the low pages */
 	vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
-	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, verbose))
+	if (vstart && !swiotlb_init_with_tbl(vstart, mem->nslabs, verbose))
 		return;
 
-	if (io_tlb_start) {
-		memblock_free_early(io_tlb_start,
-				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
-		io_tlb_start = 0;
+	if (mem->start) {
+		memblock_free_early(mem->start,
+				    PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT));
+		mem->start = 0;
 	}
 	pr_warn("Cannot allocate buffer");
 	no_iotlb_memory = true;
@@ -294,22 +267,23 @@ swiotlb_init(int verbose)
 int
 swiotlb_late_init_with_default_size(size_t default_size)
 {
-	unsigned long bytes, req_nslabs = io_tlb_nslabs;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	unsigned long bytes, req_nslabs = mem->nslabs;
 	unsigned char *vstart = NULL;
 	unsigned int order;
 	int rc = 0;
 
-	if (!io_tlb_nslabs) {
-		io_tlb_nslabs = (default_size >> IO_TLB_SHIFT);
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+	if (!mem->nslabs) {
+		mem->nslabs = (default_size >> IO_TLB_SHIFT);
+		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
 	}
 
 	/*
 	 * Get IO TLB memory from the low pages
 	 */
-	order = get_order(io_tlb_nslabs << IO_TLB_SHIFT);
-	io_tlb_nslabs = SLABS_PER_PAGE << order;
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	order = get_order(mem->nslabs << IO_TLB_SHIFT);
+	mem->nslabs = SLABS_PER_PAGE << order;
+	bytes = mem->nslabs << IO_TLB_SHIFT;
 
 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
 		vstart = (void *)__get_free_pages(GFP_DMA | __GFP_NOWARN,
@@ -320,15 +294,15 @@ swiotlb_late_init_with_default_size(size_t default_size)
 	}
 
 	if (!vstart) {
-		io_tlb_nslabs = req_nslabs;
+		mem->nslabs = req_nslabs;
 		return -ENOMEM;
 	}
 	if (order != get_order(bytes)) {
 		pr_warn("only able to allocate %ld MB\n",
 			(PAGE_SIZE << order) >> 20);
-		io_tlb_nslabs = SLABS_PER_PAGE << order;
+		mem->nslabs = SLABS_PER_PAGE << order;
 	}
-	rc = swiotlb_late_init_with_tbl(vstart, io_tlb_nslabs);
+	rc = swiotlb_late_init_with_tbl(vstart, mem->nslabs);
 	if (rc)
 		free_pages((unsigned long)vstart, order);
 
@@ -337,22 +311,25 @@ swiotlb_late_init_with_default_size(size_t default_size)
 
 static void swiotlb_cleanup(void)
 {
-	io_tlb_end = 0;
-	io_tlb_start = 0;
-	io_tlb_nslabs = 0;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+
+	mem->end = 0;
+	mem->start = 0;
+	mem->nslabs = 0;
 	max_segment = 0;
 }
 
 int
 swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long i, bytes;
 
 	bytes = nslabs << IO_TLB_SHIFT;
 
-	io_tlb_nslabs = nslabs;
-	io_tlb_start = virt_to_phys(tlb);
-	io_tlb_end = io_tlb_start + bytes;
+	mem->nslabs = nslabs;
+	mem->start = virt_to_phys(tlb);
+	mem->end = mem->start + bytes;
 
 	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
 	memset(tlb, 0, bytes);
@@ -360,39 +337,39 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	/*
 	 * Allocate and initialize the free list array.  This array is used
 	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
-	 * between io_tlb_start and io_tlb_end.
+	 * between mem->start and mem->end.
 	 */
-	io_tlb_list = (unsigned int *)__get_free_pages(GFP_KERNEL,
-	                              get_order(io_tlb_nslabs * sizeof(int)));
-	if (!io_tlb_list)
+	mem->list = (unsigned int *)__get_free_pages(GFP_KERNEL,
+	                              get_order(mem->nslabs * sizeof(int)));
+	if (!mem->list)
 		goto cleanup3;
 
-	io_tlb_orig_addr = (phys_addr_t *)
+	mem->orig_addr = (phys_addr_t *)
 		__get_free_pages(GFP_KERNEL,
-				 get_order(io_tlb_nslabs *
+				 get_order(mem->nslabs *
 					   sizeof(phys_addr_t)));
-	if (!io_tlb_orig_addr)
+	if (!mem->orig_addr)
 		goto cleanup4;
 
-	for (i = 0; i < io_tlb_nslabs; i++) {
-		io_tlb_list[i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
-		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
+	for (i = 0; i < mem->nslabs; i++) {
+		mem->list[i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
+		mem->orig_addr[i] = INVALID_PHYS_ADDR;
 	}
-	io_tlb_index = 0;
+	mem->index = 0;
 	no_iotlb_memory = false;
 
 	swiotlb_print_info();
 
 	late_alloc = 1;
 
-	swiotlb_set_max_segment(io_tlb_nslabs << IO_TLB_SHIFT);
+	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
 
 	return 0;
 
 cleanup4:
-	free_pages((unsigned long)io_tlb_list, get_order(io_tlb_nslabs *
-	                                                 sizeof(int)));
-	io_tlb_list = NULL;
+	free_pages((unsigned long)mem->list,
+		   get_order(mem->nslabs * sizeof(int)));
+	mem->list = NULL;
 cleanup3:
 	swiotlb_cleanup();
 	return -ENOMEM;
@@ -400,23 +377,25 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 
 void __init swiotlb_exit(void)
 {
-	if (!io_tlb_orig_addr)
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+
+	if (!mem->orig_addr)
 		return;
 
 	if (late_alloc) {
-		free_pages((unsigned long)io_tlb_orig_addr,
-			   get_order(io_tlb_nslabs * sizeof(phys_addr_t)));
-		free_pages((unsigned long)io_tlb_list, get_order(io_tlb_nslabs *
-								 sizeof(int)));
-		free_pages((unsigned long)phys_to_virt(io_tlb_start),
-			   get_order(io_tlb_nslabs << IO_TLB_SHIFT));
+		free_pages((unsigned long)mem->orig_addr,
+			   get_order(mem->nslabs * sizeof(phys_addr_t)));
+		free_pages((unsigned long)mem->list,
+			   get_order(mem->nslabs * sizeof(int)));
+		free_pages((unsigned long)phys_to_virt(mem->start),
+			   get_order(mem->nslabs << IO_TLB_SHIFT));
 	} else {
-		memblock_free_late(__pa(io_tlb_orig_addr),
-				   PAGE_ALIGN(io_tlb_nslabs * sizeof(phys_addr_t)));
-		memblock_free_late(__pa(io_tlb_list),
-				   PAGE_ALIGN(io_tlb_nslabs * sizeof(int)));
-		memblock_free_late(io_tlb_start,
-				   PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+		memblock_free_late(__pa(mem->orig_addr),
+				   PAGE_ALIGN(mem->nslabs * sizeof(phys_addr_t)));
+		memblock_free_late(__pa(mem->list),
+				   PAGE_ALIGN(mem->nslabs * sizeof(int)));
+		memblock_free_late(mem->start,
+				   PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT));
 	}
 	swiotlb_cleanup();
 }
@@ -465,7 +444,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, io_tlb_start);
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, mem->start);
 	unsigned long flags;
 	phys_addr_t tlb_addr;
 	unsigned int nslots, stride, index, wrap;
@@ -516,13 +496,13 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	 * Find suitable number of IO TLB entries size that will fit this
 	 * request and allocate a buffer from that IO TLB pool.
 	 */
-	spin_lock_irqsave(&io_tlb_lock, flags);
+	spin_lock_irqsave(&mem->lock, flags);
 
-	if (unlikely(nslots > io_tlb_nslabs - io_tlb_used))
+	if (unlikely(nslots > mem->nslabs - mem->used))
 		goto not_found;
 
-	index = ALIGN(io_tlb_index, stride);
-	if (index >= io_tlb_nslabs)
+	index = ALIGN(mem->index, stride);
+	if (index >= mem->nslabs)
 		index = 0;
 	wrap = index;
 
@@ -530,7 +510,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		while (iommu_is_span_boundary(index, nslots, offset_slots,
 					      max_slots)) {
 			index += stride;
-			if (index >= io_tlb_nslabs)
+			if (index >= mem->nslabs)
 				index = 0;
 			if (index == wrap)
 				goto not_found;
@@ -541,40 +521,40 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		 * contiguous buffers, we allocate the buffers from that slot
 		 * and mark the entries as '0' indicating unavailable.
 		 */
-		if (io_tlb_list[index] >= nslots) {
+		if (mem->list[index] >= nslots) {
 			int count = 0;
 
 			for (i = index; i < (int) (index + nslots); i++)
-				io_tlb_list[i] = 0;
-			for (i = index - 1; (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE - 1) && io_tlb_list[i]; i--)
-				io_tlb_list[i] = ++count;
-			tlb_addr = io_tlb_start + (index << IO_TLB_SHIFT);
+				mem->list[i] = 0;
+			for (i = index - 1; (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE - 1) && mem->list[i]; i--)
+				mem->list[i] = ++count;
+			tlb_addr = mem->start + (index << IO_TLB_SHIFT);
 
 			/*
 			 * Update the indices to avoid searching in the next
 			 * round.
 			 */
-			io_tlb_index = ((index + nslots) < io_tlb_nslabs
-					? (index + nslots) : 0);
+			mem->index = ((index + nslots) < mem->nslabs
+				      ? (index + nslots) : 0);
 
 			goto found;
 		}
 		index += stride;
-		if (index >= io_tlb_nslabs)
+		if (index >= mem->nslabs)
 			index = 0;
 	} while (index != wrap);
 
 not_found:
-	tmp_io_tlb_used = io_tlb_used;
+	tmp_io_tlb_used = mem->used;
 
-	spin_unlock_irqrestore(&io_tlb_lock, flags);
+	spin_unlock_irqrestore(&mem->lock, flags);
 	if (!(attrs & DMA_ATTR_NO_WARN) && printk_ratelimit())
 		dev_warn(hwdev, "swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-			 alloc_size, io_tlb_nslabs, tmp_io_tlb_used);
+			 alloc_size, mem->nslabs, tmp_io_tlb_used);
 	return (phys_addr_t)DMA_MAPPING_ERROR;
 found:
-	io_tlb_used += nslots;
-	spin_unlock_irqrestore(&io_tlb_lock, flags);
+	mem->used += nslots;
+	spin_unlock_irqrestore(&mem->lock, flags);
 
 	/*
 	 * Save away the mapping from the original address to the DMA address.
@@ -582,7 +562,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	 * needed.
 	 */
 	for (i = 0; i < nslots; i++)
-		io_tlb_orig_addr[index+i] = orig_addr + (i << IO_TLB_SHIFT);
+		mem->orig_addr[index+i] = orig_addr + (i << IO_TLB_SHIFT);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
 		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_TO_DEVICE);
@@ -597,10 +577,11 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 			      size_t mapping_size, size_t alloc_size,
 			      enum dma_data_direction dir, unsigned long attrs)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long flags;
 	int i, count, nslots = ALIGN(alloc_size, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
-	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = io_tlb_orig_addr[index];
+	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
+	phys_addr_t orig_addr = mem->orig_addr[index];
 
 	/*
 	 * First, sync the memory before unmapping the entry
@@ -616,36 +597,37 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	 * While returning the entries to the free list, we merge the entries
 	 * with slots below and above the pool being returned.
 	 */
-	spin_lock_irqsave(&io_tlb_lock, flags);
+	spin_lock_irqsave(&mem->lock, flags);
 	{
 		count = ((index + nslots) < ALIGN(index + 1, IO_TLB_SEGSIZE) ?
-			 io_tlb_list[index + nslots] : 0);
+			 mem->list[index + nslots] : 0);
 		/*
 		 * Step 1: return the slots to the free list, merging the
 		 * slots with superceeding slots
 		 */
 		for (i = index + nslots - 1; i >= index; i--) {
-			io_tlb_list[i] = ++count;
-			io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
+			mem->list[i] = ++count;
+			mem->orig_addr[i] = INVALID_PHYS_ADDR;
 		}
 		/*
 		 * Step 2: merge the returned slots with the preceding slots,
 		 * if available (non zero)
 		 */
-		for (i = index - 1; (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE -1) && io_tlb_list[i]; i--)
-			io_tlb_list[i] = ++count;
+		for (i = index - 1; (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE -1) && mem->list[i]; i--)
+			mem->list[i] = ++count;
 
-		io_tlb_used -= nslots;
+		mem->used -= nslots;
 	}
-	spin_unlock_irqrestore(&io_tlb_lock, flags);
+	spin_unlock_irqrestore(&mem->lock, flags);
 }
 
 void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 			     size_t size, enum dma_data_direction dir,
 			     enum dma_sync_target target)
 {
-	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = io_tlb_orig_addr[index];
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
+	phys_addr_t orig_addr = mem->orig_addr[index];
 
 	if (orig_addr == INVALID_PHYS_ADDR)
 		return;
@@ -713,21 +695,21 @@ size_t swiotlb_max_mapping_size(struct device *dev)
 bool is_swiotlb_active(void)
 {
 	/*
-	 * When SWIOTLB is initialized, even if io_tlb_start points to physical
-	 * address zero, io_tlb_end surely doesn't.
+	 * When SWIOTLB is initialized, even if mem->start points to physical
+	 * address zero, mem->end surely doesn't.
 	 */
-	return io_tlb_end != 0;
+	return io_tlb_default_mem.end != 0;
 }
 
 #ifdef CONFIG_DEBUG_FS
 
 static int __init swiotlb_create_debugfs(void)
 {
-	struct dentry *root;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 
-	root = debugfs_create_dir("swiotlb", NULL);
-	debugfs_create_ulong("io_tlb_nslabs", 0400, root, &io_tlb_nslabs);
-	debugfs_create_ulong("io_tlb_used", 0400, root, &io_tlb_used);
+	mem->debugfs = debugfs_create_dir("swiotlb", NULL);
+	debugfs_create_ulong("io_tlb_nslabs", 0400, mem->debugfs, &mem->nslabs);
+	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &mem->used);
 	return 0;
 }
 
-- 
2.29.2.729.g45daf8777d-goog

To make this change as mechanical as possible, I didn't fix any
checkpatch.pl ERROR/WARNING.

