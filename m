Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCFF4C5C33
	for <lists+xen-devel@lfdr.de>; Sun, 27 Feb 2022 15:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279967.477812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOKaZ-0005pB-9i; Sun, 27 Feb 2022 14:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279967.477812; Sun, 27 Feb 2022 14:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOKaZ-0005m5-46; Sun, 27 Feb 2022 14:31:55 +0000
Received: by outflank-mailman (input) for mailman id 279967;
 Sun, 27 Feb 2022 14:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKox=TK=bombadil.srs.infradead.org=BATV+9eb748f383daf30c13ac+6762+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nOKaX-0002ik-V3
 for xen-devel@lists.xenproject.org; Sun, 27 Feb 2022 14:31:54 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00bc9342-97da-11ec-8eba-a37418f5ba1a;
 Sun, 27 Feb 2022 15:31:52 +0100 (CET)
Received: from [213.208.157.39] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOKaG-009OB7-B1; Sun, 27 Feb 2022 14:31:36 +0000
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
X-Inumbo-ID: 00bc9342-97da-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JdxyTNAGqW27S4S6ZEFBFR/VybAHE6V5ih7t10OnNJI=; b=lI0hsR5ACeRAz7HzfuPC5f2lK6
	11HvIC9O4NjYRnETgO9aDFMfEu5IaSjQwavBrNtyeFaUnK1VKICC+EvoD/m4sVpcqPUCKIf7J8TIO
	kBH+bzO6Kb5/mhklOnVKyuSntEpcsKDaYbRMapKodjSLhHKUpNx/k352HQGSVdNU9J1FvY+TSUUUV
	iNxs46XhMSKFLl1tgVpvsAJehYzarwaM9seGJNuRg9Febx9zQzuxdr2AQBudJBC6nuIOBLlVa2I0+
	ys2VvDpaGvg+GlP1TI1q7FYVi01tT3qt8S/wKpq6zDzhhLTY1jsSwEb82vJFtzzMCsPrO/QdY/8Jf
	H4OKTSCQ==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: [PATCH 08/11] swiotlb: make the swiotlb_init interface more useful
Date: Sun, 27 Feb 2022 15:30:52 +0100
Message-Id: <20220227143055.335596-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220227143055.335596-1-hch@lst.de>
References: <20220227143055.335596-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Pass a bool to pass if swiotlb needs to be enabled based on the
addressing needs and replace the verbose argument with a set of
flags, including one to force enable bounce buffering.

Note that this patch removes the possibility to force xen-swiotlb
use using swiotlb=force on the command line on x86 (arm and arm64
never supported that), but this interface will be restored shortly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/mm/init.c                     |  6 +----
 arch/arm64/mm/init.c                   |  6 +----
 arch/ia64/mm/init.c                    |  4 +--
 arch/mips/cavium-octeon/dma-octeon.c   |  2 +-
 arch/mips/loongson64/dma.c             |  2 +-
 arch/mips/sibyte/common/dma.c          |  2 +-
 arch/powerpc/include/asm/swiotlb.h     |  1 +
 arch/powerpc/mm/mem.c                  |  3 ++-
 arch/powerpc/platforms/pseries/setup.c |  3 ---
 arch/riscv/mm/init.c                   |  8 +-----
 arch/s390/mm/init.c                    |  3 +--
 arch/x86/kernel/cpu/mshyperv.c         |  8 ------
 arch/x86/kernel/pci-dma.c              | 15 ++++++-----
 arch/x86/mm/mem_encrypt_amd.c          |  3 ---
 drivers/xen/swiotlb-xen.c              |  4 +--
 include/linux/swiotlb.h                | 15 ++++++-----
 include/trace/events/swiotlb.h         | 29 ++++++++-------------
 kernel/dma/swiotlb.c                   | 35 ++++++++++++++------------
 18 files changed, 56 insertions(+), 93 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 6d0cb0f7bc54b..73f30d278b565 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -312,11 +312,7 @@ static void __init free_highpages(void)
 void __init mem_init(void)
 {
 #ifdef CONFIG_ARM_LPAE
-	if (swiotlb_force == SWIOTLB_FORCE ||
-	    max_pfn > arm_dma_pfn_limit)
-		swiotlb_init(1);
-	else
-		swiotlb_force = SWIOTLB_NO_FORCE;
+	swiotlb_init(max_pfn > arm_dma_pfn_limit, SWIOTLB_VERBOSE);
 #endif
 
 	set_max_mapnr(pfn_to_page(max_pfn) - mem_map);
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index db63cc885771a..52102adda3d28 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -373,11 +373,7 @@ void __init bootmem_init(void)
  */
 void __init mem_init(void)
 {
-	if (swiotlb_force == SWIOTLB_FORCE ||
-	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
-		swiotlb_init(1);
-	else if (!xen_swiotlb_detect())
-		swiotlb_force = SWIOTLB_NO_FORCE;
+	swiotlb_init(max_pfn > PFN_DOWN(arm64_dma_phys_limit), SWIOTLB_VERBOSE);
 
 	/* this will put all unused low memory onto the freelists */
 	memblock_free_all();
diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
index 5d165607bf354..3c3e15b22608f 100644
--- a/arch/ia64/mm/init.c
+++ b/arch/ia64/mm/init.c
@@ -437,9 +437,7 @@ mem_init (void)
 		if (iommu_detected)
 			break;
 #endif
-#ifdef CONFIG_SWIOTLB
-		swiotlb_init(1);
-#endif
+		swiotlb_init(true, SWIOTLB_VERBOSE);
 	} while (0);
 
 #ifdef CONFIG_FLATMEM
diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index fb7547e217263..9fbba6a8fa4c5 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -235,5 +235,5 @@ void __init plat_swiotlb_setup(void)
 #endif
 
 	swiotlb_adjust_size(swiotlbsize);
-	swiotlb_init(1);
+	swiotlb_init(true, SWIOTLB_VERBOSE);
 }
diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
index 364f2f27c8723..8220a1bc0db64 100644
--- a/arch/mips/loongson64/dma.c
+++ b/arch/mips/loongson64/dma.c
@@ -24,5 +24,5 @@ phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
 
 void __init plat_swiotlb_setup(void)
 {
-	swiotlb_init(1);
+	swiotlb_init(true, SWIOTLB_VERBOSE);
 }
diff --git a/arch/mips/sibyte/common/dma.c b/arch/mips/sibyte/common/dma.c
index eb47a94f3583e..c5c2c782aff68 100644
--- a/arch/mips/sibyte/common/dma.c
+++ b/arch/mips/sibyte/common/dma.c
@@ -10,5 +10,5 @@
 
 void __init plat_swiotlb_setup(void)
 {
-	swiotlb_init(1);
+	swiotlb_init(true, SWIOTLB_VERBOSE);
 }
diff --git a/arch/powerpc/include/asm/swiotlb.h b/arch/powerpc/include/asm/swiotlb.h
index 3c1a1cd161286..4203b5e0a88ed 100644
--- a/arch/powerpc/include/asm/swiotlb.h
+++ b/arch/powerpc/include/asm/swiotlb.h
@@ -9,6 +9,7 @@
 #include <linux/swiotlb.h>
 
 extern unsigned int ppc_swiotlb_enable;
+extern unsigned int ppc_swiotlb_flags;
 
 #ifdef CONFIG_SWIOTLB
 void swiotlb_detect_4g(void);
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 8e301cd8925b2..d99b8b5b40ca6 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -17,6 +17,7 @@
 #include <linux/suspend.h>
 #include <linux/dma-direct.h>
 
+#include <asm/swiotlb.h>
 #include <asm/machdep.h>
 #include <asm/rtas.h>
 #include <asm/kasan.h>
@@ -251,7 +252,7 @@ void __init mem_init(void)
 	if (is_secure_guest())
 		svm_swiotlb_init();
 	else
-		swiotlb_init(0);
+		swiotlb_init(ppc_swiotlb_enable, ppc_swiotlb_flags);
 #endif
 
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 83a04d967a59f..45d637ab58261 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -838,9 +838,6 @@ static void __init pSeries_setup_arch(void)
 	}
 
 	ppc_md.pcibios_root_bridge_prepare = pseries_root_bridge_prepare;
-
-	if (swiotlb_force == SWIOTLB_FORCE)
-		ppc_swiotlb_enable = 1;
 }
 
 static void pseries_panic(char *str)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c27294128e182..6cdbb62672fe5 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -118,13 +118,7 @@ void __init mem_init(void)
 	BUG_ON(!mem_map);
 #endif /* CONFIG_FLATMEM */
 
-#ifdef CONFIG_SWIOTLB
-	if (swiotlb_force == SWIOTLB_FORCE ||
-	    max_pfn > PFN_DOWN(dma32_phys_limit))
-		swiotlb_init(1);
-	else
-		swiotlb_force = SWIOTLB_NO_FORCE;
-#endif
+	swiotlb_init(max_pfn > PFN_DOWN(dma32_phys_limit), SWIOTLB_VERBOSE);
 	high_memory = (void *)(__va(PFN_PHYS(max_low_pfn)));
 	memblock_free_all();
 
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 86ffd0d51fd59..6fb6bf64326f9 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -185,8 +185,7 @@ static void pv_init(void)
 		return;
 
 	/* make sure bounce buffers are shared */
-	swiotlb_force = SWIOTLB_FORCE;
-	swiotlb_init(1);
+	swiotlb_init(true, SWIOTLB_FORCE | SWIOTLB_VERBOSE);
 	swiotlb_update_mem_attributes();
 }
 
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 5a99f993e6392..568274917f1cd 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -336,14 +336,6 @@ static void __init ms_hyperv_init_platform(void)
 			swiotlb_unencrypted_base = ms_hyperv.shared_gpa_boundary;
 #endif
 		}
-
-#ifdef CONFIG_SWIOTLB
-		/*
-		 * Enable swiotlb force mode in Isolation VM to
-		 * use swiotlb bounce buffer for dma transaction.
-		 */
-		swiotlb_force = SWIOTLB_FORCE;
-#endif
 	}
 
 	if (hv_max_functions_eax >= HYPERV_CPUID_NESTED_FEATURES) {
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 17bcac942ac49..bb08184a50e3a 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -39,6 +39,7 @@ int iommu_detected __read_mostly = 0;
 
 #ifdef CONFIG_SWIOTLB
 bool x86_swiotlb_enable;
+static unsigned int x86_swiotlb_flags;
 
 /*
  * If 4GB or more detected (and iommu=off not set) or if SME is active
@@ -54,16 +55,16 @@ static void __init pci_swiotlb_detect_4gb(void)
 	 * Set swiotlb to 1 so that bounce buffers are allocated and used for
 	 * devices that can't support DMA to encrypted memory.
 	 */
-	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
-		x86_swiotlb_enable = true;
-
-	if (swiotlb_force == SWIOTLB_FORCE)
+	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)) {
 		x86_swiotlb_enable = true;
+		x86_swiotlb_flags |= SWIOTLB_FORCE;
+	}
 }
 #else
 static inline void __init pci_swiotlb_detect_4gb(void)
 {
 }
+#define x86_swiotlb_flags 0
 #endif /* CONFIG_SWIOTLB */
 
 #ifdef CONFIG_SWIOTLB_XEN
@@ -71,8 +72,7 @@ static bool xen_swiotlb;
 
 static void __init pci_xen_swiotlb_init(void)
 {
-	if (!xen_initial_domain() && !x86_swiotlb_enable &&
-	    swiotlb_force != SWIOTLB_FORCE)
+	if (!xen_initial_domain() && !x86_swiotlb_enable)
 		return;
 	x86_swiotlb_enable = false;
 	xen_swiotlb = true;
@@ -116,8 +116,7 @@ void __init pci_iommu_alloc(void)
 	gart_iommu_hole_init();
 	amd_iommu_detect();
 	detect_intel_iommu();
-	if (x86_swiotlb_enable)
-		swiotlb_init(0);
+	swiotlb_init(x86_swiotlb_enable, x86_swiotlb_flags);
 }
 
 /*
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index 2b2d018ea3450..a72942d569cf9 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -191,9 +191,6 @@ void __init sme_early_init(void)
 	/* Update the protection map with memory encryption mask */
 	for (i = 0; i < ARRAY_SIZE(protection_map); i++)
 		protection_map[i] = pgprot_encrypted(protection_map[i]);
-
-	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
-		swiotlb_force = SWIOTLB_FORCE;
 }
 
 void __init sev_setup_arch(void)
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 485cd06ed39e7..c2da3eb4826e8 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -251,7 +251,7 @@ void __init xen_swiotlb_init_early(void)
 		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
 	}
 
-	if (swiotlb_init_with_tbl(start, nslabs, true))
+	if (swiotlb_init_with_tbl(start, nslabs, SWIOTLB_VERBOSE))
 		panic("Cannot allocate SWIOTLB buffer");
 }
 #endif /* CONFIG_X86 */
@@ -376,7 +376,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	/*
 	 * Oh well, have to allocate and map a bounce buffer.
 	 */
-	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
+	trace_swiotlb_bounced(dev, dev_addr, size);
 
 	map = swiotlb_tbl_map_single(dev, phys, size, size, 0, dir, attrs);
 	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 1befd6b2ccf5e..dcecf953f7997 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -13,11 +13,8 @@ struct device;
 struct page;
 struct scatterlist;
 
-enum swiotlb_force {
-	SWIOTLB_NORMAL,		/* Default - depending on HW DMA mask etc. */
-	SWIOTLB_FORCE,		/* swiotlb=force */
-	SWIOTLB_NO_FORCE,	/* swiotlb=noforce */
-};
+#define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
+#define SWIOTLB_FORCE	(1 << 1) /* force bounce buffering */
 
 /*
  * Maximum allowable number of contiguous slabs to map,
@@ -36,8 +33,7 @@ enum swiotlb_force {
 /* default to 64MB */
 #define IO_TLB_DEFAULT_SIZE (64UL<<20)
 
-extern void swiotlb_init(int verbose);
-int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose);
+int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
 unsigned long swiotlb_size_or_default(void);
 extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
 int swiotlb_init_late(size_t size, gfp_t gfp_mask);
@@ -126,13 +122,16 @@ static inline bool is_swiotlb_force_bounce(struct device *dev)
 	return mem && mem->force_bounce;
 }
 
+void swiotlb_init(bool addressing_limited, unsigned int flags);
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
 #else
-#define swiotlb_force SWIOTLB_NO_FORCE
+static inline void swiotlb_init(bool addressing_limited, unsigned int flags)
+{
+}
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
diff --git a/include/trace/events/swiotlb.h b/include/trace/events/swiotlb.h
index 705be43b71ab0..da05c9ebd224a 100644
--- a/include/trace/events/swiotlb.h
+++ b/include/trace/events/swiotlb.h
@@ -8,20 +8,15 @@
 #include <linux/tracepoint.h>
 
 TRACE_EVENT(swiotlb_bounced,
-
-	TP_PROTO(struct device *dev,
-		 dma_addr_t dev_addr,
-		 size_t size,
-		 enum swiotlb_force swiotlb_force),
-
-	TP_ARGS(dev, dev_addr, size, swiotlb_force),
+	TP_PROTO(struct device *dev, dma_addr_t dev_addr, size_t size),
+	TP_ARGS(dev, dev_addr, size),
 
 	TP_STRUCT__entry(
-		__string(	dev_name,	dev_name(dev)		)
-		__field(	u64,	dma_mask			)
-		__field(	dma_addr_t,	dev_addr		)
-		__field(	size_t,	size				)
-		__field(	enum swiotlb_force,	swiotlb_force	)
+		__string(dev_name, dev_name(dev))
+		__field(u64, dma_mask)
+		__field(dma_addr_t, dev_addr)
+		__field(size_t, size)
+		__field(bool, force)
 	),
 
 	TP_fast_assign(
@@ -29,19 +24,15 @@ TRACE_EVENT(swiotlb_bounced,
 		__entry->dma_mask = (dev->dma_mask ? *dev->dma_mask : 0);
 		__entry->dev_addr = dev_addr;
 		__entry->size = size;
-		__entry->swiotlb_force = swiotlb_force;
+		__entry->force = is_swiotlb_force_bounce(dev);
 	),
 
-	TP_printk("dev_name: %s dma_mask=%llx dev_addr=%llx "
-		"size=%zu %s",
+	TP_printk("dev_name: %s dma_mask=%llx dev_addr=%llx size=%zu %s",
 		__get_str(dev_name),
 		__entry->dma_mask,
 		(unsigned long long)__entry->dev_addr,
 		__entry->size,
-		__print_symbolic(__entry->swiotlb_force,
-			{ SWIOTLB_NORMAL,	"NORMAL" },
-			{ SWIOTLB_FORCE,	"FORCE" },
-			{ SWIOTLB_NO_FORCE,	"NO_FORCE" }))
+		__entry->force ? "FORCE" : "NORMAL")
 );
 
 #endif /*  _TRACE_SWIOTLB_H */
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index a653fcf1fe6c2..ad604e5a0983d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -69,7 +69,8 @@
 
 #define INVALID_PHYS_ADDR (~(phys_addr_t)0)
 
-enum swiotlb_force swiotlb_force;
+static bool swiotlb_force_bounce;
+static bool swiotlb_force_disable;
 
 struct io_tlb_mem io_tlb_default_mem;
 
@@ -88,9 +89,9 @@ setup_io_tlb_npages(char *str)
 	if (*str == ',')
 		++str;
 	if (!strcmp(str, "force"))
-		swiotlb_force = SWIOTLB_FORCE;
+		swiotlb_force_bounce = true;
 	else if (!strcmp(str, "noforce"))
-		swiotlb_force = SWIOTLB_NO_FORCE;
+		swiotlb_force_disable = true;
 
 	return 0;
 }
@@ -211,7 +212,7 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	mem->index = 0;
 	mem->late_alloc = late_alloc;
 
-	if (swiotlb_force == SWIOTLB_FORCE)
+	if (swiotlb_force_bounce)
 		mem->force_bounce = true;
 
 	spin_lock_init(&mem->lock);
@@ -233,12 +234,13 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	return;
 }
 
-int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
+int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
+		unsigned int flags)
 {
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	size_t alloc_size;
 
-	if (swiotlb_force == SWIOTLB_NO_FORCE)
+	if (swiotlb_force_disable)
 		return 0;
 
 	/* protect against double initialization */
@@ -252,8 +254,9 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 		      __func__, alloc_size, PAGE_SIZE);
 
 	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
+	mem->force_bounce = flags & SWIOTLB_FORCE;
 
-	if (verbose)
+	if (flags & SWIOTLB_VERBOSE)
 		swiotlb_print_info();
 	return 0;
 }
@@ -262,20 +265,21 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
  * Statically reserve bounce buffer space and initialize bounce buffer data
  * structures for the software IO TLB used to implement the DMA API.
  */
-void  __init
-swiotlb_init(int verbose)
+void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 {
 	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
 	void *tlb;
 
-	if (swiotlb_force == SWIOTLB_NO_FORCE)
+	if (!addressing_limit && !swiotlb_force_bounce)
+		return;
+	if (swiotlb_force_disable)
 		return;
 
 	/* Get IO TLB memory from the low pages */
 	tlb = memblock_alloc_low(bytes, PAGE_SIZE);
 	if (!tlb)
 		goto fail;
-	if (swiotlb_init_with_tbl(tlb, default_nslabs, verbose))
+	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
 		goto fail_free_mem;
 	return;
 
@@ -298,7 +302,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
 	unsigned int order;
 	int rc = 0;
 
-	if (swiotlb_force == SWIOTLB_NO_FORCE)
+	if (swiotlb_force_disable)
 		return 0;
 
 	/*
@@ -337,7 +341,7 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long bytes = nslabs << IO_TLB_SHIFT;
 
-	if (swiotlb_force == SWIOTLB_NO_FORCE)
+	if (swiotlb_force_disable)
 		return 0;
 
 	/* protect against double initialization */
@@ -362,7 +366,7 @@ void __init swiotlb_exit(void)
 	unsigned long tbl_vaddr;
 	size_t tbl_size, slots_size;
 
-	if (swiotlb_force == SWIOTLB_FORCE)
+	if (swiotlb_force_bounce)
 		return;
 
 	if (!mem->nslabs)
@@ -708,8 +712,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 	phys_addr_t swiotlb_addr;
 	dma_addr_t dma_addr;
 
-	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size,
-			      swiotlb_force);
+	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size);
 
 	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, size, 0, dir,
 			attrs);
-- 
2.30.2


