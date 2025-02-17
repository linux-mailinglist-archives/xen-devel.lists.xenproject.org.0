Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82551A38017
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890173.1299188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyLv-00022u-Oa; Mon, 17 Feb 2025 10:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890173.1299188; Mon, 17 Feb 2025 10:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyLv-00021R-Jv; Mon, 17 Feb 2025 10:27:51 +0000
Received: by outflank-mailman (input) for mailman id 890173;
 Mon, 17 Feb 2025 10:27:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bV9=VI=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tjyLu-00021B-Si
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:27:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d5c0bd9a-ed19-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:27:49 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2464176C;
 Mon, 17 Feb 2025 02:28:07 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 383B73F6A8;
 Mon, 17 Feb 2025 02:27:47 -0800 (PST)
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
X-Inumbo-ID: d5c0bd9a-ed19-11ef-9aa6-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/2] xen/passthrough: Provide stub functions when !HAS_PASSTHROUGH
Date: Mon, 17 Feb 2025 10:27:31 +0000
Message-Id: <20250217102732.2343729-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217102732.2343729-1-luca.fancellu@arm.com>
References: <20250217102732.2343729-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When Xen is built without HAS_PASSTHROUGH, there are some parts
in arm and x86 where iommu_* functions are called in the codebase,
but their implementation is under xen/drivers/passthrough that is
not built.

So provide some stub for these functions in order to build Xen
when !HAS_PASSTHROUGH, which is the case for example on systems
with MPU support.

For gnttab_need_iommu_mapping() in the Arm part, modify the macro
to use IS_ENABLED for the HAS_PASSTHROUGH Kconfig.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2 Changes:
 - modify gnttab_need_iommu_mapping to use IS_ENABLED
 - removed macro that didn't allow some of the parameter to be
   evaluated
 - Changed commit message
---
---
 xen/arch/arm/include/asm/grant_table.h |  5 +--
 xen/include/xen/iommu.h                | 48 ++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index d3c518a926b9..c5d87b60c4df 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -73,8 +73,9 @@ int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
 #define gnttab_status_gfn(d, t, i)                                       \
     page_get_xenheap_gfn(gnttab_status_page(t, i))
 
-#define gnttab_need_iommu_mapping(d)                    \
-    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
+#define gnttab_need_iommu_mapping(d)                                     \
+    (IS_ENABLED(CONFIG_HAS_PASSTHROUGH) && is_domain_direct_mapped(d) && \
+     is_iommu_enabled(d))
 
 #endif /* __ASM_GRANT_TABLE_H__ */
 /*
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index b928c67e1995..3e49fef8544e 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -110,6 +110,8 @@ extern int8_t iommu_hwdom_reserved;
 
 extern unsigned int iommu_dev_iotlb_timeout;
 
+#ifdef CONFIG_HAS_PASSTHROUGH
+
 int iommu_setup(void);
 int iommu_hardware_setup(void);
 
@@ -122,6 +124,24 @@ int arch_iommu_domain_init(struct domain *d);
 void arch_iommu_check_autotranslated_hwdom(struct domain *d);
 void arch_iommu_hwdom_init(struct domain *d);
 
+#else
+
+static inline int iommu_setup(void)
+{
+    return -ENODEV;
+}
+
+static inline int iommu_domain_init(struct domain *d, unsigned int opts)
+{
+    return 0;
+}
+
+static inline void iommu_hwdom_init(struct domain *d) {}
+
+static inline void iommu_domain_destroy(struct domain *d) {}
+
+#endif /* HAS_PASSTHROUGH */
+
 /*
  * The following flags are passed to map (applicable ones also to unmap)
  * operations, while some are passed back by lookup operations.
@@ -209,6 +229,8 @@ struct msi_msg;
 #ifdef CONFIG_HAS_DEVICE_TREE
 #include <xen/device_tree.h>
 
+#ifdef CONFIG_HAS_PASSTHROUGH
+
 int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev);
 int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev);
 int iommu_dt_domain_init(struct domain *d);
@@ -238,6 +260,26 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
  */
 int iommu_remove_dt_device(struct dt_device_node *np);
 
+#else
+
+static inline int iommu_assign_dt_device(struct domain *d,
+                                         struct dt_device_node *dev)
+{
+    return -EINVAL;
+}
+
+static inline int iommu_add_dt_device(struct dt_device_node *np)
+{
+    return 1;
+}
+
+static inline int iommu_release_dt_devices(struct domain *d)
+{
+    return 0;
+}
+
+#endif /* HAS_PASSTHROUGH */
+
 #endif /* HAS_DEVICE_TREE */
 
 struct page_info;
@@ -381,17 +423,19 @@ struct domain_iommu {
 #define iommu_set_feature(d, f)   set_bit(f, dom_iommu(d)->features)
 #define iommu_clear_feature(d, f) clear_bit(f, dom_iommu(d)->features)
 
+/* Does the IOMMU pagetable need to be kept synchronized with the P2M */
+#ifdef CONFIG_HAS_PASSTHROUGH
 /* Are we using the domain P2M table as its IOMMU pagetable? */
 #define iommu_use_hap_pt(d)       (IS_ENABLED(CONFIG_HVM) && \
                                    dom_iommu(d)->hap_pt_share)
 
-/* Does the IOMMU pagetable need to be kept synchronized with the P2M */
-#ifdef CONFIG_HAS_PASSTHROUGH
 #define need_iommu_pt_sync(d)     (dom_iommu(d)->need_sync)
 
 int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
                     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 #else
+#define iommu_use_hap_pt(d)       ({ (void)(d); false; })
+
 #define need_iommu_pt_sync(d)     ({ (void)(d); false; })
 
 static inline int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
-- 
2.34.1


