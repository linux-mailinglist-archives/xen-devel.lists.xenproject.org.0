Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6227736EC9A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 16:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120080.227073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7wy-00021U-92; Thu, 29 Apr 2021 14:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120080.227073; Thu, 29 Apr 2021 14:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7wy-000216-4S; Thu, 29 Apr 2021 14:47:32 +0000
Received: by outflank-mailman (input) for mailman id 120080;
 Thu, 29 Apr 2021 14:47:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKbL=J2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lc7ww-00020q-GK
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 14:47:30 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4d73e45a-6464-43d6-aaa6-87f0b1fb6232;
 Thu, 29 Apr 2021 14:47:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 051091FB;
 Thu, 29 Apr 2021 07:47:29 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 387803F73B;
 Thu, 29 Apr 2021 07:47:28 -0700 (PDT)
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
X-Inumbo-ID: 4d73e45a-6464-43d6-aaa6-87f0b1fb6232
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4 1/3] xen/iommu: Move iommu_update_ire_from_msi(..) to xen/iommu.h
Date: Thu, 29 Apr 2021 15:46:51 +0100
Message-Id: <3dd255f5715eee3f359a6187d83c57a262065830.1619707144.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619707144.git.rahul.singh@arm.com>
References: <cover.1619707144.git.rahul.singh@arm.com>
In-Reply-To: <cover.1619707144.git.rahul.singh@arm.com>
References: <cover.1619707144.git.rahul.singh@arm.com>

Move iommu_update_ire_from_msi(..) from passthrough/pci.c to
xen/iommu.h and wrap it under CONFIG_X86 as it is referenced in x86
code only to avoid compilation error for other architecture when
HAS_PCI is enabled.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


