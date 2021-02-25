Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E2D325A70
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 00:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90012.170167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFQQP-0003yQ-5N; Thu, 25 Feb 2021 23:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90012.170167; Thu, 25 Feb 2021 23:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFQQP-0003y1-1r; Thu, 25 Feb 2021 23:52:05 +0000
Received: by outflank-mailman (input) for mailman id 90012;
 Thu, 25 Feb 2021 23:52:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjlP=H3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFQQN-0003xw-K5
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 23:52:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d08a44e2-4d57-4784-b006-ef7536b343ea;
 Thu, 25 Feb 2021 23:52:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7ADFC64F29;
 Thu, 25 Feb 2021 23:52:01 +0000 (UTC)
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
X-Inumbo-ID: d08a44e2-4d57-4784-b006-ef7536b343ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614297121;
	bh=gKrc3LbPXjztB1RQb8Ri1kuoi7BqfPxmEstNJKugeKg=;
	h=From:To:Cc:Subject:Date:From;
	b=JHbF2ijUkzp1TFtMnJE0LhTEw3vqOrcDj9ulUyKy+7yXyhgUO6D3iUpWIoG8tHyvw
	 oAvCNIPwgg0F7XsXm6+3HIkfDSVZTQWEA4JVajQVqrPyCn9NYbguFElHaaFbZ/Py2x
	 sDLAXRg9Xna7mWSp7z+dGQeVeS+331XRryq52apYKufjqit4PcGO8McRoe5mEzisIG
	 PGKl3Ii7r6F7eHIM/3UzPeEt9jhoBuqrlzc5595TRJJwR7AVJlxjgES3Oth5gO6awN
	 9ssFnJL/EQwN3qmXwaMPcvuIGGr6tZoZR4GX5XC9tzzGbLAa1Rli9ok0i0EjUsE12u
	 +XUroRcE5Wl6g==
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH] xen/arm: introduce XENFEAT_direct_mapped and XENFEAT_not_direct_mapped
Date: Thu, 25 Feb 2021 15:51:58 -0800
Message-Id: <20210225235158.24001-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Newer Xen versions expose two Xen feature flags to tell us if the domain
is directly mapped or not. Only when a domain is directly mapped it
makes sense to enable swiotlb-xen on ARM.

Introduce a function on ARM to check the new Xen feature flags and also
to deal with the legacy case. Call the function xen_swiotlb_detect.

Also rename the existing pci_xen_swiotlb_detect on x86 to
xen_swiotlb_detect so that we can share a common function declaration.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---

This is the corresponding Xen patch under review:
https://marc.info/?l=xen-devel&m=161421618217686

We don't *have to* make the x86 function and the ARM function exactly
the same, but I thought it would be much nicer if we did. However, we
can't really call it pci_* on ARM as there is no PCI necessarily.

---
 arch/arm/xen/mm.c                      | 14 +++++++++++++-
 arch/arm64/mm/dma-mapping.c            |  2 +-
 arch/x86/include/asm/xen/swiotlb-xen.h |  4 ++--
 arch/x86/kernel/pci-swiotlb.c          |  2 +-
 arch/x86/xen/pci-swiotlb-xen.c         |  6 +++---
 include/xen/interface/features.h       |  7 +++++++
 include/xen/swiotlb-xen.h              |  6 ++++++
 7 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 467fa225c3d0..f8e5acbef05d 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -135,10 +135,22 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 	return;
 }
 
+int __init xen_swiotlb_detect(void)
+{
+	if (!xen_domain())
+		return 0;
+	if (xen_feature(XENFEAT_direct_mapped))
+		return 1;
+	/* legacy case */
+	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
+		return 1;
+	return 0;
+}
+
 static int __init xen_mm_init(void)
 {
 	struct gnttab_cache_flush cflush;
-	if (!xen_initial_domain())
+	if (!xen_swiotlb_detect())
 		return 0;
 	xen_swiotlb_init(1, false);
 
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 93e87b287556..4bf1dd3eb041 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -53,7 +53,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		iommu_setup_dma_ops(dev, dma_base, size);
 
 #ifdef CONFIG_XEN
-	if (xen_initial_domain())
+	if (xen_swiotlb_detect())
 		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 }
diff --git a/arch/x86/include/asm/xen/swiotlb-xen.h b/arch/x86/include/asm/xen/swiotlb-xen.h
index 6b56d0d45d15..494694744844 100644
--- a/arch/x86/include/asm/xen/swiotlb-xen.h
+++ b/arch/x86/include/asm/xen/swiotlb-xen.h
@@ -2,14 +2,14 @@
 #ifndef _ASM_X86_SWIOTLB_XEN_H
 #define _ASM_X86_SWIOTLB_XEN_H
 
+#include <xen/swiotlb-xen.h>
+
 #ifdef CONFIG_SWIOTLB_XEN
 extern int xen_swiotlb;
-extern int __init pci_xen_swiotlb_detect(void);
 extern void __init pci_xen_swiotlb_init(void);
 extern int pci_xen_swiotlb_init_late(void);
 #else
 #define xen_swiotlb (0)
-static inline int __init pci_xen_swiotlb_detect(void) { return 0; }
 static inline void __init pci_xen_swiotlb_init(void) { }
 static inline int pci_xen_swiotlb_init_late(void) { return -ENXIO; }
 #endif
diff --git a/arch/x86/kernel/pci-swiotlb.c b/arch/x86/kernel/pci-swiotlb.c
index c2cfa5e7c152..c18eb6629326 100644
--- a/arch/x86/kernel/pci-swiotlb.c
+++ b/arch/x86/kernel/pci-swiotlb.c
@@ -30,7 +30,7 @@ int __init pci_swiotlb_detect_override(void)
 	return swiotlb;
 }
 IOMMU_INIT_FINISH(pci_swiotlb_detect_override,
-		  pci_xen_swiotlb_detect,
+		  xen_swiotlb_detect,
 		  pci_swiotlb_init,
 		  pci_swiotlb_late_init);
 
diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
index 19ae3e4fe4e9..0a35657eeb85 100644
--- a/arch/x86/xen/pci-swiotlb-xen.c
+++ b/arch/x86/xen/pci-swiotlb-xen.c
@@ -21,12 +21,12 @@
 int xen_swiotlb __read_mostly;
 
 /*
- * pci_xen_swiotlb_detect - set xen_swiotlb to 1 if necessary
+ * xen_swiotlb_detect - set xen_swiotlb to 1 if necessary
  *
  * This returns non-zero if we are forced to use xen_swiotlb (by the boot
  * option).
  */
-int __init pci_xen_swiotlb_detect(void)
+int __init xen_swiotlb_detect(void)
 {
 
 	if (!xen_pv_domain())
@@ -90,7 +90,7 @@ int pci_xen_swiotlb_init_late(void)
 }
 EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
 
-IOMMU_INIT_FINISH(pci_xen_swiotlb_detect,
+IOMMU_INIT_FINISH(xen_swiotlb_detect,
 		  NULL,
 		  pci_xen_swiotlb_init,
 		  NULL);
diff --git a/include/xen/interface/features.h b/include/xen/interface/features.h
index 6d1384abfbdf..f0d00bb0ac63 100644
--- a/include/xen/interface/features.h
+++ b/include/xen/interface/features.h
@@ -83,6 +83,13 @@
  */
 #define XENFEAT_linux_rsdp_unrestricted   15
 
+/*
+ * A direct-mapped (or 1:1 mapped) domain is a domain for which its
+ * local pages have gfn == mfn.
+ */
+#define XENFEAT_not_direct_mapped         16
+#define XENFEAT_direct_mapped             17
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index d5eaf9d682b8..6a2fc4e4b838 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -12,4 +12,10 @@ void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
 extern int xen_swiotlb_init(int verbose, bool early);
 extern const struct dma_map_ops xen_swiotlb_dma_ops;
 
+#ifdef CONFIG_SWIOTLB_XEN
+extern int __init xen_swiotlb_detect(void);
+#else
+static inline int __init xen_swiotlb_detect(void) { return 0; }
+#endif
+
 #endif /* __LINUX_SWIOTLB_XEN_H */
-- 
2.17.1


