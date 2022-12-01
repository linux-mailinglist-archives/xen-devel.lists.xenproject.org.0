Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3EF63F500
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:15:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451008.708586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mDs-00025Z-N8; Thu, 01 Dec 2022 16:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451008.708586; Thu, 01 Dec 2022 16:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mDs-00022Y-Jc; Thu, 01 Dec 2022 16:15:40 +0000
Received: by outflank-mailman (input) for mailman id 451008;
 Thu, 01 Dec 2022 16:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0mDr-00020U-6D
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:15:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 647e17e1-7193-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:15:38 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37060D6E;
 Thu,  1 Dec 2022 08:15:44 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CFB73F73B;
 Thu,  1 Dec 2022 08:15:36 -0800 (PST)
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
X-Inumbo-ID: 647e17e1-7193-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 15/21] xen/arm: vsmmuv3: Emulated SMMUv3 device tree node for dom0less
Date: Thu,  1 Dec 2022 16:02:39 +0000
Message-Id: <4e4d4fff4bb20d9718bd61b729f9421525baaa15.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XEN will create an Emulated SMMUv3 device tree node in the device tree
to enable the dom0less domains to discover the virtual SMMUv3 during
boot. Emulated SMMUv3 device tree node will only be created when cmdline
option vsmmuv3 is enabled.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domain_build.c           | 52 +++++++++++++++++++++++++++
 xen/include/public/device_tree_defs.h |  1 +
 2 files changed, 53 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b82121beb5..29f00b18ec 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2322,6 +2322,49 @@ static int make_hwdom_viommu_node(const struct kernel_info *kinfo)
 }
 #endif
 
+#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
+static int __init make_vsmmuv3_node(const struct kernel_info *kinfo)
+{
+    int res;
+    char buf[24];
+    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    __be32 *cells;
+    void *fdt = kinfo->fdt;
+
+    snprintf(buf, sizeof(buf), "iommu@%llx", GUEST_VSMMUV3_BASE);
+
+    res = fdt_begin_node(fdt, buf);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", "arm,smmu-v3");
+    if ( res )
+        return res;
+
+    /* Create reg property */
+    cells = &reg[0];
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                       GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
+    res = fdt_property(fdt, "reg", reg,
+                       (GUEST_ROOT_ADDRESS_CELLS +
+                       GUEST_ROOT_SIZE_CELLS) * sizeof(*reg));
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_VSMMUV3);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#iommu-cells", 1);
+    if ( res )
+        return res;
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+#endif
+
 int __init map_irq_to_domain(struct domain *d, unsigned int irq,
                              bool need_mapping, const char *devname)
 {
@@ -3395,6 +3438,15 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
             goto err;
     }
 
+#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
+    if ( is_viommu_enabled() )
+    {
+        ret = make_vsmmuv3_node(kinfo);
+        if ( ret )
+            goto err;
+    }
+#endif
+
     ret = fdt_end_node(kinfo->fdt);
     if ( ret < 0 )
         goto err;
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
index 9e80d0499d..7846a0425c 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -14,6 +14,7 @@
  */
 #define GUEST_PHANDLE_GIC (65000)
 #define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
+#define GUEST_PHANDLE_VSMMUV3 (GUEST_PHANDLE_IOMMU + 1)
 
 #define GUEST_ROOT_ADDRESS_CELLS 2
 #define GUEST_ROOT_SIZE_CELLS 2
-- 
2.25.1


