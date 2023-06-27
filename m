Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2EC73F982
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 12:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555957.868173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE5Ue-0001GR-HW; Tue, 27 Jun 2023 10:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555957.868173; Tue, 27 Jun 2023 10:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE5Ue-00018W-6u; Tue, 27 Jun 2023 10:00:16 +0000
Received: by outflank-mailman (input) for mailman id 555957;
 Tue, 27 Jun 2023 09:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8So=CP=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qE5QJ-0008Sr-6a
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 09:55:47 +0000
Received: from frasgout12.his.huawei.com (unknown [14.137.139.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8603752-14d0-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 11:55:45 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.227])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4Qr0Bs2wPsz9xGYX
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 17:43:17 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.45.153.185])
 by APP1 (Coremail) with SMTP id LxC2BwBnwdzesZpknnvHAw--.39096S3;
 Tue, 27 Jun 2023 10:55:17 +0100 (CET)
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
X-Inumbo-ID: c8603752-14d0-11ee-8611-37d641c3527e
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kees Cook <keescook@chromium.org>,
	Saravana Kannan <saravanak@google.com>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR ARM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	iommu@lists.linux.dev (open list:XEN SWIOTLB SUBSYSTEM)
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	petr@tesarici.cz
Subject: [PATCH v3 1/7] swiotlb: make io_tlb_default_mem local to swiotlb.c
Date: Tue, 27 Jun 2023 11:54:23 +0200
Message-Id: <a1ef6eeab8b64fac817b9734da4a056f05a68d01.1687859323.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687859323.git.petr.tesarik.ext@huawei.com>
References: <cover.1687859323.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwBnwdzesZpknnvHAw--.39096S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WF1DXF45KFykCry5JFyxKrg_yoWxuw1fpr
	y7AFyrGF42grn7ArW3C3WkAF1Y93Z7K3yxCryS9w1Ygr15Cwn8Ja1DtrWYyr1rJrW8uF4f
	AFy0vryaka17Aw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUma14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsG
	vfC2KfnxnUUI43ZEXa7VUjb_-PUUUUU==
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

SWIOTLB implementation details should not be exposed to the rest of the
kernel. This will allow to make changes to the implementation without
modifying non-swiotlb code.

To avoid breaking existing users, provide helper functions for the few
required fields. Enhance is_swiotlb_active() to work with the default IO
TLB pool when passed a NULL device.

As a bonus, using a helper function to initialize struct device allows to
get rid of an #ifdef in driver core.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 arch/arm/xen/mm.c          |  2 +-
 arch/mips/pci/pci-octeon.c |  2 +-
 arch/x86/kernel/pci-dma.c  |  2 +-
 drivers/base/core.c        |  4 +---
 drivers/xen/swiotlb-xen.c  |  2 +-
 include/linux/swiotlb.h    | 17 ++++++++++++++++-
 kernel/dma/swiotlb.c       | 39 ++++++++++++++++++++++++++++++++++++--
 7 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 3d826c0b5fee..529aabc1be38 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -125,7 +125,7 @@ static int __init xen_mm_init(void)
 		return 0;
 
 	/* we can work with the default swiotlb */
-	if (!io_tlb_default_mem.nslabs) {
+	if (!is_swiotlb_active(NULL)) {
 		rc = swiotlb_init_late(swiotlb_size_or_default(),
 				       xen_swiotlb_gfp(), NULL);
 		if (rc < 0)
diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
index e457a18cbdc5..c5c4c1f7d5e4 100644
--- a/arch/mips/pci/pci-octeon.c
+++ b/arch/mips/pci/pci-octeon.c
@@ -664,7 +664,7 @@ static int __init octeon_pci_setup(void)
 
 		/* BAR1 movable regions contiguous to cover the swiotlb */
 		octeon_bar1_pci_phys =
-			io_tlb_default_mem.start & ~((1ull << 22) - 1);
+			default_swiotlb_start() & ~((1ull << 22) - 1);
 
 		for (index = 0; index < 32; index++) {
 			union cvmx_pci_bar1_indexx bar1_index;
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index de6be0a3965e..33e960672837 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -90,7 +90,7 @@ int pci_xen_swiotlb_init_late(void)
 		return 0;
 
 	/* we can work with the default swiotlb */
-	if (!io_tlb_default_mem.nslabs) {
+	if (!is_swiotlb_active(NULL)) {
 		int rc = swiotlb_init_late(swiotlb_size_or_default(),
 					   GFP_KERNEL, xen_swiotlb_fixup);
 		if (rc < 0)
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 3dff5037943e..46d1d78c5beb 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3108,9 +3108,7 @@ void device_initialize(struct device *dev)
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 	dev->dma_coherent = dma_default_coherent;
 #endif
-#ifdef CONFIG_SWIOTLB
-	dev->dma_io_tlb_mem = &io_tlb_default_mem;
-#endif
+	swiotlb_dev_init(dev);
 }
 EXPORT_SYMBOL_GPL(device_initialize);
 
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 67aa74d20162..946bd56f0ac5 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -381,7 +381,7 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 static int
 xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 {
-	return xen_phys_to_dma(hwdev, io_tlb_default_mem.end - 1) <= mask;
+	return xen_phys_to_dma(hwdev, default_swiotlb_limit()) <= mask;
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 7af2673b47ba..b38045be532d 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -112,7 +112,6 @@ struct io_tlb_mem {
 	atomic_long_t used_hiwater;
 #endif
 };
-extern struct io_tlb_mem io_tlb_default_mem;
 
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
@@ -130,13 +129,19 @@ static inline bool is_swiotlb_force_bounce(struct device *dev)
 
 void swiotlb_init(bool addressing_limited, unsigned int flags);
 void __init swiotlb_exit(void);
+void swiotlb_dev_init(struct device *dev);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
+phys_addr_t default_swiotlb_start(void);
+phys_addr_t default_swiotlb_limit(void);
 #else
 static inline void swiotlb_init(bool addressing_limited, unsigned int flags)
 {
 }
+static inline void swiotlb_dev_init(struct device *dev)
+{
+}
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
@@ -161,6 +166,16 @@ static inline bool is_swiotlb_active(struct device *dev)
 static inline void swiotlb_adjust_size(unsigned long size)
 {
 }
+
+static inline phys_addr_t default_swiotlb_start(void)
+{
+	return 0;
+}
+
+static inline phys_addr_t default_swiotlb_limit(void)
+{
+	return 0;
+}
 #endif /* CONFIG_SWIOTLB */
 
 extern void swiotlb_print_info(void);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 079df5ad38d0..63d318059f27 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -71,7 +71,7 @@ struct io_tlb_slot {
 static bool swiotlb_force_bounce;
 static bool swiotlb_force_disable;
 
-struct io_tlb_mem io_tlb_default_mem;
+static struct io_tlb_mem io_tlb_default_mem;
 
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 static unsigned long default_nareas;
@@ -486,6 +486,15 @@ void __init swiotlb_exit(void)
 	memset(mem, 0, sizeof(*mem));
 }
 
+/**
+ * swiotlb_dev_init() - initialize swiotlb fields in &struct device
+ * @dev:	Device to be initialized.
+ */
+void swiotlb_dev_init(struct device *dev)
+{
+	dev->dma_io_tlb_mem = &io_tlb_default_mem;
+}
+
 /*
  * Return the offset into a iotlb slot required to keep the device happy.
  */
@@ -939,14 +948,40 @@ size_t swiotlb_max_mapping_size(struct device *dev)
 	return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE - min_align;
 }
 
+/**
+ * is_swiotlb_active() - check if the software IO TLB is initialized
+ * @dev:	Device to check, or %NULL for the default IO TLB.
+ */
 bool is_swiotlb_active(struct device *dev)
 {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	struct io_tlb_mem *mem = dev
+		? dev->dma_io_tlb_mem
+		: &io_tlb_default_mem;
 
 	return mem && mem->nslabs;
 }
 EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
+/**
+ * default_swiotlb_start() - get the start of the default SWIOTLB
+ *
+ * Get the lowest physical address used by the default software IO TLB pool.
+ */
+phys_addr_t default_swiotlb_start(void)
+{
+	return io_tlb_default_mem.start;
+}
+
+/**
+ * default_swiotlb_limit() - get the highest address in the default SWIOTLB
+ *
+ * Get the highest physical address used by the default software IO TLB pool.
+ */
+phys_addr_t default_swiotlb_limit(void)
+{
+	return io_tlb_default_mem.end - 1;
+}
+
 #ifdef CONFIG_DEBUG_FS
 
 static int io_tlb_used_get(void *data, u64 *val)
-- 
2.25.1


