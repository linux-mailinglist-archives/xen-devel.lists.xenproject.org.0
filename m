Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C175F5EF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568868.888951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNuV9-0003ar-05; Mon, 24 Jul 2023 12:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568868.888951; Mon, 24 Jul 2023 12:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNuV8-0003WC-P7; Mon, 24 Jul 2023 12:17:22 +0000
Received: by outflank-mailman (input) for mailman id 568868;
 Mon, 24 Jul 2023 12:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0CZD=DK=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qNuSh-0007hM-NM
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:14:51 +0000
Received: from frasgout13.his.huawei.com (unknown [14.137.139.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aff8c014-2a1b-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:14:50 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.227])
 by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4R8f2D1l2pz9yh9n
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 20:03:32 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.222.124])
 by APP2 (Coremail) with SMTP id GxC2BwA3_lTGar5ky0byBA--.27936S7;
 Mon, 24 Jul 2023 13:14:23 +0100 (CET)
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
X-Inumbo-ID: aff8c014-2a1b-11ee-8612-37d641c3527e
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Seo <james@equiv.tech>,
	James Clark <james.clark@arm.com>,
	Kees Cook <keescook@chromium.org>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR ARM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	iommu@lists.linux.dev (open list:XEN SWIOTLB SUBSYSTEM)
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	petr@tesarici.cz
Subject: [PATCH v5 5/9] swiotlb: add a flag whether SWIOTLB is allowed to grow
Date: Mon, 24 Jul 2023 14:12:41 +0200
Message-Id: <0c0c9033b48962930c66c0325bb385ce2744b8bd.1690200598.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1690200598.git.petr.tesarik.ext@huawei.com>
References: <cover.1690200598.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GxC2BwA3_lTGar5ky0byBA--.27936S7
X-Coremail-Antispam: 1UD129KBjvJXoWxWrW8XF1fKr1fZr13Wr4UArb_yoWrWryUpF
	15XF4rtF4IqF1xArZ7Cw1xGF9akw4kKrW7urWa9ry5Ar43Jw1Yq3WDKayYq34Fqrs2qF4S
	qFyS9r1Ykr17ZwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUml14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_
	Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JbIYCTnIWIevJa73UjIFyTuYvjfUnzVbDUUUU
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

Add a config option (CONFIG_SWIOTLB_DYNAMIC) to enable or disable dynamic
allocation of additional bounce buffers.

If this option is set, mark the default SWIOTLB as able to grow and
restricted DMA pools as unable.

However, if the address of the default memory pool is explicitly queried,
make the default SWIOTLB also unable to grow. This is currently used to set
up PCI BAR movable regions on some Octeon MIPS boards which may not be able
to use a SWIOTLB pool elsewhere in physical memory. See octeon_pci_setup()
for more details.

If a remap function is specified, it must be also called on any dynamically
allocated pools, but there are some issues:

- The remap function may block, so it should not be called from an atomic
  context.
- There is no corresponding unremap() function if the memory pool is
  freed.
- The only in-tree implementation (xen_swiotlb_fixup) requires that the
  number of slots in the memory pool is a multiple of SWIOTLB_SEGSIZE.

Keep it simple for now and disable growing the SWIOTLB if a remap function
was specified.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 include/linux/swiotlb.h |  4 ++++
 kernel/dma/Kconfig      | 13 +++++++++++++
 kernel/dma/swiotlb.c    | 13 +++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index fd01a0870b38..78a51d2f9f5c 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -100,6 +100,7 @@ struct io_tlb_pool {
  * @debugfs:	The dentry to debugfs.
  * @force_bounce: %true if swiotlb bouncing is forced
  * @for_alloc:  %true if the pool is used for memory allocation
+ * @can_grow:	%true if more pools can be allocated dynamically.
  * @total_used:	The total number of slots in the pool that are currently used
  *		across all areas. Used only for calculating used_hiwater in
  *		debugfs.
@@ -112,6 +113,9 @@ struct io_tlb_mem {
 	struct dentry *debugfs;
 	bool force_bounce;
 	bool for_alloc;
+#ifdef CONFIG_SWIOTLB_DYNAMIC
+	bool can_grow;
+#endif
 #ifdef CONFIG_DEBUG_FS
 	atomic_long_t total_used;
 	atomic_long_t used_hiwater;
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 11d077003205..68c61fdf2b44 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -90,6 +90,19 @@ config SWIOTLB
 	bool
 	select NEED_DMA_MAP_STATE
 
+config SWIOTLB_DYNAMIC
+	bool "Dynamic allocation of DMA bounce buffers"
+	default n
+	depends on SWIOTLB
+	help
+	  This enables dynamic resizing of the software IO TLB. The kernel
+	  starts with one memory pool at boot and it will allocate additional
+	  pools as needed. To reduce run-time kernel memory requirements, you
+	  may have to specify a smaller size of the initial pool using
+	  "swiotlb=" on the kernel command line.
+
+	  If unsure, say N.
+
 config DMA_BOUNCE_UNALIGNED_KMALLOC
 	bool
 	depends on SWIOTLB
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 11bacde00df7..5acb4552f869 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -330,6 +330,11 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 	io_tlb_default_mem.force_bounce =
 		swiotlb_force_bounce || (flags & SWIOTLB_FORCE);
 
+#ifdef CONFIG_SWIOTLB_DYNAMIC
+	if (!remap)
+		io_tlb_default_mem.can_grow = true;
+#endif
+
 	if (!default_nareas)
 		swiotlb_adjust_nareas(num_possible_cpus());
 
@@ -400,6 +405,11 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 
 	io_tlb_default_mem.force_bounce = swiotlb_force_bounce;
 
+#ifdef CONFIG_SWIOTLB_DYNAMIC
+	if (!remap)
+		io_tlb_default_mem.can_grow = true;
+#endif
+
 	if (!default_nareas)
 		swiotlb_adjust_nareas(num_possible_cpus());
 
@@ -1066,6 +1076,9 @@ EXPORT_SYMBOL_GPL(is_swiotlb_active);
  */
 phys_addr_t default_swiotlb_base(void)
 {
+#ifdef CONFIG_SWIOTLB_DYNAMIC
+	io_tlb_default_mem.can_grow = false;
+#endif
 	return io_tlb_default_mem.defpool.start;
 }
 
-- 
2.25.1


