Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432883BD7BB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:25:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151313.279655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0l41-00006I-Vw; Tue, 06 Jul 2021 13:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151313.279655; Tue, 06 Jul 2021 13:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0l41-0008VT-SN; Tue, 06 Jul 2021 13:24:37 +0000
Received: by outflank-mailman (input) for mailman id 151313;
 Tue, 06 Jul 2021 13:24:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ZJM=L6=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1m0l40-0008VN-Ug
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:24:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51c9c996-d105-44be-8454-a39abb32c1aa;
 Tue, 06 Jul 2021 13:24:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE61061164;
 Tue,  6 Jul 2021 13:24:26 +0000 (UTC)
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
X-Inumbo-ID: 51c9c996-d105-44be-8454-a39abb32c1aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625577874;
	bh=1b6k92EMOVzHgyTq1RFb48ZKUcEXJlaaPAFN5oqwmF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tx92MCkf/DXZd6nh5mgnaOshLB4ggq26FqyP7BRdqm4hXED58hUYg3wTzF/ZikCOl
	 U+1P1/gbNfCqV4xnZ7pHjCf8/b987/nQ/mVKU1HbWyoJyOKg9fJOcN462l6+qNBbsk
	 mG027LEWXpfZtreWSaiuUnUFKCuYwjJn+lLcTB45MSBdJeGNl0JTrXgxYvizMLKavG
	 ZjJErAdgAQUwjFypjPCvRFBu+p+iugJjiDv/3nE/dAIeatFPDVEKPcPUEgF80LgmiZ
	 dhxesW61+bCVt47G9QVFd9FVhqxuurozkVLZ3Q4Ql0HvqNzplvnBtOnAkUoP1it1tH
	 ndRwRZDbWWvhQ==
Date: Tue, 6 Jul 2021 14:24:23 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Claire Chang <tientzu@chromium.org>,
	Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	benh@kernel.crashing.org, paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Stefano Stabellini <sstabellini@kernel.org>, grant.likely@arm.com,
	xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com,
	Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk,
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com, Jianxiong Gao <jxgao@google.com>,
	joonas.lahtinen@linux.intel.com, linux-pci@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Qian Cai <quic_qiancai@quicinc.com>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210706132422.GA20327@willie-the-truck>
References: <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
 <20210630114348.GA8383@willie-the-truck>
 <YNyUQwiagNeZ9YeJ@Ryzen-9-3900X.localdomain>
 <20210701074045.GA9436@willie-the-truck>
 <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706044848.GA13640@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jul 06, 2021 at 06:48:48AM +0200, Christoph Hellwig wrote:
> On Mon, Jul 05, 2021 at 08:03:52PM +0100, Will Deacon wrote:
> > So at this point, the AMD IOMMU driver does:
> > 
> > 	swiotlb        = (iommu_default_passthrough() || sme_me_mask) ? 1 : 0;
> > 
> > where 'swiotlb' is a global variable indicating whether or not swiotlb
> > is in use. It's picked up a bit later on by pci_swiotlb_late_init(), which
> > will call swiotlb_exit() if 'swiotlb' is false.
> > 
> > Now, that used to work fine, because swiotlb_exit() clears
> > 'io_tlb_default_mem' to NULL, but now with the restricted DMA changes, I
> > think that all the devices which have successfully probed beforehand will
> > have stale pointers to the freed structure in their 'dev->dma_io_tlb_mem'
> > field.
> 
> Yeah.  I don't think we can do that anymore, and I also think it is
> a bad idea to start with.

I've had a crack at reworking things along the following lines:

  - io_tlb_default_mem now lives in the BSS, the flexible array member
    is now a pointer and that part is allocated dynamically (downside of
    this is an extra indirection to get at the slots).

  - io_tlb_default_mem.nslabs tells you whether the thing is valid

  - swiotlb_exit() frees the slots array and clears the rest of the
    structure to 0. I also extended it to free the actual slabs, but I'm
    not sure why it wasn't doing that before.

So a non-NULL dev->dma_io_tlb_mem should always be valid to follow.

Untested diff below... Nathan, it would be ace if you're brave enough
to give this a shot.

Will

--->8

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bbad7c559901..9e1218f89e4b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2820,7 +2820,7 @@ void device_initialize(struct device *dev)
 	dev->dma_coherent = dma_default_coherent;
 #endif
 #ifdef CONFIG_SWIOTLB
-	dev->dma_io_tlb_mem = io_tlb_default_mem;
+	dev->dma_io_tlb_mem = &io_tlb_default_mem;
 #endif
 }
 EXPORT_SYMBOL_GPL(device_initialize);
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 785ec7e8be01..f06d9b4f1e0f 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -164,7 +164,7 @@ int __ref xen_swiotlb_init(void)
 	int rc = -ENOMEM;
 	char *start;
 
-	if (io_tlb_default_mem != NULL) {
+	if (io_tlb_default_mem.nslabs) {
 		pr_warn("swiotlb buffer already initialized\n");
 		return -EEXIST;
 	}
@@ -547,7 +547,7 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 static int
 xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 {
-	return xen_phys_to_dma(hwdev, io_tlb_default_mem->end - 1) <= mask;
+	return xen_phys_to_dma(hwdev, io_tlb_default_mem.end - 1) <= mask;
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 39284ff2a6cd..b0cb2a9973f4 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -103,9 +103,9 @@ struct io_tlb_mem {
 		phys_addr_t orig_addr;
 		size_t alloc_size;
 		unsigned int list;
-	} slots[];
+	} *slots;
 };
-extern struct io_tlb_mem *io_tlb_default_mem;
+extern struct io_tlb_mem io_tlb_default_mem;
 
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 0ffbaae9fba2..91cd1d413027 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -70,7 +70,7 @@
 
 enum swiotlb_force swiotlb_force;
 
-struct io_tlb_mem *io_tlb_default_mem;
+struct io_tlb_mem io_tlb_default_mem;
 
 /*
  * Max segment that we can provide which (if pages are contingous) will
@@ -101,7 +101,7 @@ early_param("swiotlb", setup_io_tlb_npages);
 
 unsigned int swiotlb_max_segment(void)
 {
-	return io_tlb_default_mem ? max_segment : 0;
+	return io_tlb_default_mem.nslabs ? max_segment : 0;
 }
 EXPORT_SYMBOL_GPL(swiotlb_max_segment);
 
@@ -134,9 +134,9 @@ void __init swiotlb_adjust_size(unsigned long size)
 
 void swiotlb_print_info(void)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 
-	if (!mem) {
+	if (!mem->nslabs) {
 		pr_warn("No low mem\n");
 		return;
 	}
@@ -163,11 +163,11 @@ static inline unsigned long nr_slots(u64 val)
  */
 void __init swiotlb_update_mem_attributes(void)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	void *vaddr;
 	unsigned long bytes;
 
-	if (!mem || mem->late_alloc)
+	if (!mem->nslabs || mem->late_alloc)
 		return;
 	vaddr = phys_to_virt(mem->start);
 	bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
@@ -201,25 +201,24 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 
 int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 {
-	struct io_tlb_mem *mem;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	size_t alloc_size;
 
 	if (swiotlb_force == SWIOTLB_NO_FORCE)
 		return 0;
 
 	/* protect against double initialization */
-	if (WARN_ON_ONCE(io_tlb_default_mem))
+	if (WARN_ON_ONCE(mem->nslabs))
 		return -ENOMEM;
 
-	alloc_size = PAGE_ALIGN(struct_size(mem, slots, nslabs));
-	mem = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!mem)
+	alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
+	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!mem->slots)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
 	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
 
-	io_tlb_default_mem = mem;
 	if (verbose)
 		swiotlb_print_info();
 	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
@@ -304,26 +303,24 @@ swiotlb_late_init_with_default_size(size_t default_size)
 int
 swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 {
-	struct io_tlb_mem *mem;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long bytes = nslabs << IO_TLB_SHIFT;
 
 	if (swiotlb_force == SWIOTLB_NO_FORCE)
 		return 0;
 
 	/* protect against double initialization */
-	if (WARN_ON_ONCE(io_tlb_default_mem))
+	if (WARN_ON_ONCE(mem->nslabs))
 		return -ENOMEM;
 
-	mem = (void *)__get_free_pages(GFP_KERNEL,
-		get_order(struct_size(mem, slots, nslabs)));
-	if (!mem)
+	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
+		get_order(array_size(sizeof(*mem->slots), nslabs)));
+	if (!mem->slots)
 		return -ENOMEM;
 
-	memset(mem, 0, sizeof(*mem));
 	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
 	swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
 
-	io_tlb_default_mem = mem;
 	swiotlb_print_info();
 	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
 	return 0;
@@ -331,18 +328,23 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 
 void __init swiotlb_exit(void)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
-	size_t size;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	size_t tbl_size, slots_size;
 
-	if (!mem)
+	if (!mem->nslabs)
 		return;
 
-	size = struct_size(mem, slots, mem->nslabs);
-	if (mem->late_alloc)
-		free_pages((unsigned long)mem, get_order(size));
-	else
-		memblock_free_late(__pa(mem), PAGE_ALIGN(size));
-	io_tlb_default_mem = NULL;
+	tbl_size = mem->end - mem->start;
+	slots_size = array_size(sizeof(*mem->slots), mem->nslabs);
+	if (mem->late_alloc) {
+		free_pages((unsigned long)mem->start, get_order(tbl_size));
+		free_pages((unsigned long)mem->slots, get_order(slots_size));
+	} else {
+		memblock_free_late(__pa(mem->start), PAGE_ALIGN(tbl_size));
+		memblock_free_late(__pa(mem->slots), PAGE_ALIGN(slots_size));
+	}
+
+	memset(mem, 0, sizeof(*mem));
 }
 
 /*
@@ -682,7 +684,9 @@ size_t swiotlb_max_mapping_size(struct device *dev)
 
 bool is_swiotlb_active(struct device *dev)
 {
-	return dev->dma_io_tlb_mem != NULL;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+
+	return mem && mem->nslabs;
 }
 EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
@@ -697,10 +701,10 @@ static void swiotlb_create_debugfs_files(struct io_tlb_mem *mem)
 
 static int __init swiotlb_create_default_debugfs(void)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 
 	debugfs_dir = debugfs_create_dir("swiotlb", NULL);
-	if (mem) {
+	if (mem->nslabs) {
 		mem->debugfs = debugfs_dir;
 		swiotlb_create_debugfs_files(mem);
 	}
@@ -754,10 +758,17 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 	 * to it.
 	 */
 	if (!mem) {
-		mem = kzalloc(struct_size(mem, slots, nslabs), GFP_KERNEL);
+		mem = kzalloc(sizeof(*mem), GFP_KERNEL);
 		if (!mem)
 			return -ENOMEM;
 
+		mem->slots = kzalloc(array_size(sizeof(*mem->slots), nslabs),
+				     GFP_KERNEL);
+		if (!mem->slots) {
+			kfree(mem);
+			return -ENOMEM;
+		}
+
 		set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
 				     rmem->size >> PAGE_SHIFT);
 		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
@@ -781,7 +792,7 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 static void rmem_swiotlb_device_release(struct reserved_mem *rmem,
 					struct device *dev)
 {
-	dev->dma_io_tlb_mem = io_tlb_default_mem;
+	dev->dma_io_tlb_mem = &io_tlb_default_mem;
 }
 
 static const struct reserved_mem_ops rmem_swiotlb_ops = {

