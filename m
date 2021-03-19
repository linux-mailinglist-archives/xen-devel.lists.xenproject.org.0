Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F15DD342699
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 21:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99401.189078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNLJY-0006Qu-5A; Fri, 19 Mar 2021 20:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99401.189078; Fri, 19 Mar 2021 20:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNLJY-0006QV-1T; Fri, 19 Mar 2021 20:01:44 +0000
Received: by outflank-mailman (input) for mailman id 99401;
 Fri, 19 Mar 2021 20:01:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBZJ=IR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lNLJX-0006QQ-BU
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 20:01:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9566f02b-5b90-4b07-941e-abee63570c39;
 Fri, 19 Mar 2021 20:01:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79FDA61976;
 Fri, 19 Mar 2021 20:01:41 +0000 (UTC)
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
X-Inumbo-ID: 9566f02b-5b90-4b07-941e-abee63570c39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616184101;
	bh=spE54JSHaVmbOM/94skCFsybasDYxZUijV8bIpX+UK8=;
	h=From:To:Cc:Subject:Date:From;
	b=f8gc5ta3rUp2wkMTeobyuvq6qTK6gD6Nv04MpCS9HQG4QBt+FYZzd5MJLxUD5YWWv
	 TMUGfbb1I0ZcJ8mwVlFa4yTAGmXi/zpwz1V3+KOhUI0wfIxoZE31Ux8YTvT8PAgaT2
	 mS4q+CAp1ZFAgtrkE+b3m8SxA4ECCaSC6YN6KuvGY/t3geL2x9rdb2m/NlQIrR7uLG
	 iIdhPpPecj6JhkFQFIqQlrYoIOlGXNzh3YlhN75llevocVGxf2dBpHGWmcaDSBuyVK
	 VifwQfrij4Mq+ImooaSs4xidvqP5z7+FKxiswuzCCFvXpy1Q4oVB7DKDFgivjLM1nz
	 QwKJne6AiDsWg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: boris.ostrovsky@oracle.com
Cc: jgross@suse.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3] xen/arm: introduce XENFEAT_direct_mapped and XENFEAT_not_direct_mapped
Date: Fri, 19 Mar 2021 13:01:40 -0700
Message-Id: <20210319200140.12512-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Newer Xen versions expose two Xen feature flags to tell us if the domain
is directly mapped or not. Only when a domain is directly mapped it
makes sense to enable swiotlb-xen on ARM.

Introduce a function on ARM to check the new Xen feature flags and also
to deal with the legacy case. Call the function xen_swiotlb_detect.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---

Changes in v3:
- remove any x86 changes
- introduce asm/xen/swiotlb-xen.h for arm

---
 arch/arm/include/asm/xen/swiotlb-xen.h   |  1 +
 arch/arm/xen/mm.c                        | 14 +++++++++++++-
 arch/arm64/include/asm/xen/swiotlb-xen.h |  1 +
 arch/arm64/mm/dma-mapping.c              |  2 +-
 include/xen/arm/swiotlb-xen.h            |  7 +++++++
 include/xen/interface/features.h         | 14 ++++++++++++++
 include/xen/swiotlb-xen.h                |  1 +
 7 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/include/asm/xen/swiotlb-xen.h
 create mode 100644 arch/arm64/include/asm/xen/swiotlb-xen.h
 create mode 100644 include/xen/arm/swiotlb-xen.h

diff --git a/arch/arm/include/asm/xen/swiotlb-xen.h b/arch/arm/include/asm/xen/swiotlb-xen.h
new file mode 100644
index 000000000000..455ade5d5320
--- /dev/null
+++ b/arch/arm/include/asm/xen/swiotlb-xen.h
@@ -0,0 +1 @@
+#include <xen/arm/swiotlb-xen.h>
diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 467fa225c3d0..e1b12b242a32 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -135,10 +135,22 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 	return;
 }
 
+int xen_swiotlb_detect(void)
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
 
diff --git a/arch/arm64/include/asm/xen/swiotlb-xen.h b/arch/arm64/include/asm/xen/swiotlb-xen.h
new file mode 100644
index 000000000000..455ade5d5320
--- /dev/null
+++ b/arch/arm64/include/asm/xen/swiotlb-xen.h
@@ -0,0 +1 @@
+#include <xen/arm/swiotlb-xen.h>
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
diff --git a/include/xen/arm/swiotlb-xen.h b/include/xen/arm/swiotlb-xen.h
new file mode 100644
index 000000000000..2994fe6031a0
--- /dev/null
+++ b/include/xen/arm/swiotlb-xen.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM_SWIOTLB_XEN_H
+#define _ASM_ARM_SWIOTLB_XEN_H
+
+extern int xen_swiotlb_detect(void);
+
+#endif /* _ASM_ARM_SWIOTLB_XEN_H */
diff --git a/include/xen/interface/features.h b/include/xen/interface/features.h
index 6d1384abfbdf..5a7bdefa06a8 100644
--- a/include/xen/interface/features.h
+++ b/include/xen/interface/features.h
@@ -83,6 +83,20 @@
  */
 #define XENFEAT_linux_rsdp_unrestricted   15
 
+/*
+ * A direct-mapped (or 1:1 mapped) domain is a domain for which its
+ * local pages have gfn == mfn. If a domain is direct-mapped,
+ * XENFEAT_direct_mapped is set; otherwise XENFEAT_not_direct_mapped
+ * is set.
+ *
+ * If neither flag is set (e.g. older Xen releases) the assumptions are:
+ * - not auto_translated domains (x86 only) are always direct-mapped
+ * - on x86, auto_translated domains are not direct-mapped
+ * - on ARM, Dom0 is direct-mapped, DomUs are not
+ */
+#define XENFEAT_not_direct_mapped         16
+#define XENFEAT_direct_mapped             17
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index d5eaf9d682b8..dbc4a4b785f6 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -3,6 +3,7 @@
 #define __LINUX_SWIOTLB_XEN_H
 
 #include <linux/swiotlb.h>
+#include <asm/xen/swiotlb-xen.h>
 
 void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
 			  size_t size, enum dma_data_direction dir);
-- 
2.17.1


