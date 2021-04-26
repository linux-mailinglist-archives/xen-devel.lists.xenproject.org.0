Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CBC36B6AB
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 18:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117772.223660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb401-00052N-Kb; Mon, 26 Apr 2021 16:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117772.223660; Mon, 26 Apr 2021 16:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb401-00051x-H5; Mon, 26 Apr 2021 16:22:17 +0000
Received: by outflank-mailman (input) for mailman id 117772;
 Mon, 26 Apr 2021 16:22:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TQk4=JX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lb400-00051q-Sx
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 16:22:16 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ee8e2cf1-8407-410e-8596-3d6d76011d4b;
 Mon, 26 Apr 2021 16:22:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 652021FB;
 Mon, 26 Apr 2021 09:22:15 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97D3E3F73B;
 Mon, 26 Apr 2021 09:22:14 -0700 (PDT)
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
X-Inumbo-ID: ee8e2cf1-8407-410e-8596-3d6d76011d4b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 1/3] xen/iommu: Move iommu_update_ire_from_msi(..) to xen/iommu.h
Date: Mon, 26 Apr 2021 17:21:25 +0100
Message-Id: <30f0c8057969f9777f11352b9b7ca1e4a7a730e8.1619453100.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619453100.git.rahul.singh@arm.com>
References: <cover.1619453100.git.rahul.singh@arm.com>
In-Reply-To: <cover.1619453100.git.rahul.singh@arm.com>
References: <cover.1619453100.git.rahul.singh@arm.com>

Move iommu_update_ire_from_msi(..) from passthrough/pci.c to
xen/iommu.h and wrap it under CONFIG_X86 as it is referenced in x86
code only to avoid compilation error for other architecture when
HAS_PCI is enabled.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes since v2:
- This patch is added in this version to make sure iommu related code is in
  separate patch.
---
 xen/drivers/passthrough/pci.c |  7 -------
 xen/include/xen/iommu.h       | 13 ++++++++++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 705137f8be..199ce08612 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1303,13 +1303,6 @@ static int __init setup_dump_pcidevs(void)
 }
 __initcall(setup_dump_pcidevs);
 
-int iommu_update_ire_from_msi(
-    struct msi_desc *msi_desc, struct msi_msg *msg)
-{
-    return iommu_intremap
-           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
-}
-
 static int iommu_add_device(struct pci_dev *pdev)
 {
     const struct domain_iommu *hd;
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 4f0e5ac622..460755df29 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -187,8 +187,6 @@ void free_hvm_irq_dpci(struct hvm_irq_dpci *dpci);
 struct msi_desc;
 struct msi_msg;
 
-int iommu_update_ire_from_msi(struct msi_desc *msi_desc, struct msi_msg *msg);
-
 #define PT_IRQ_TIME_OUT MILLISECS(8)
 #endif /* HAS_PCI */
 
@@ -238,7 +236,6 @@ struct iommu_ops {
                            u8 devfn, device_t *dev);
 #ifdef CONFIG_HAS_PCI
     int (*get_device_group_id)(u16 seg, u8 bus, u8 devfn);
-    int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);
 #endif /* HAS_PCI */
 
     void (*teardown)(struct domain *d);
@@ -267,6 +264,7 @@ struct iommu_ops {
     int (*adjust_irq_affinities)(void);
     void (*sync_cache)(const void *addr, unsigned int size);
     void (*clear_root_pgtable)(struct domain *d);
+    int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);
 #endif /* CONFIG_X86 */
 
     int __must_check (*suspend)(void);
@@ -374,6 +372,15 @@ extern struct page_list_head iommu_pt_cleanup_list;
 
 bool arch_iommu_use_permitted(const struct domain *d);
 
+#ifdef CONFIG_X86
+static inline int iommu_update_ire_from_msi(
+    struct msi_desc *msi_desc, struct msi_msg *msg)
+{
+    return iommu_intremap
+           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
+}
+#endif
+
 #endif /* _IOMMU_H_ */
 
 /*
-- 
2.17.1


