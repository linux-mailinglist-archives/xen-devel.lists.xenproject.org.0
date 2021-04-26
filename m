Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081436B6B1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 18:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117785.223699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb410-0005JY-O4; Mon, 26 Apr 2021 16:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117785.223699; Mon, 26 Apr 2021 16:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb410-0005Is-JT; Mon, 26 Apr 2021 16:23:18 +0000
Received: by outflank-mailman (input) for mailman id 117785;
 Mon, 26 Apr 2021 16:23:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TQk4=JX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lb40y-0005IC-9f
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 16:23:16 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a0539e98-d2f5-4c07-989d-58d5af27a81c;
 Mon, 26 Apr 2021 16:23:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC9B11FB;
 Mon, 26 Apr 2021 09:23:13 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 609AE3F73B;
 Mon, 26 Apr 2021 09:23:12 -0700 (PDT)
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
X-Inumbo-ID: a0539e98-d2f5-4c07-989d-58d5af27a81c
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/3] xen/pci: Refactor MSI code that implements MSI functionality within XEN
Date: Mon, 26 Apr 2021 17:21:27 +0100
Message-Id: <7b6651f10922571a10685dc7652fbce03b6b6e51.1619453100.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619453100.git.rahul.singh@arm.com>
References: <cover.1619453100.git.rahul.singh@arm.com>
In-Reply-To: <cover.1619453100.git.rahul.singh@arm.com>
References: <cover.1619453100.git.rahul.singh@arm.com>

MSI code that implements MSI functionality to support MSI within XEN is
not usable on ARM. Move the code under CONFIG_PCI_MSI_INTERCEPT flag to
gate the code for ARM.

Currently, we have no idea how MSI functionality will be supported for
other architecture therefore we have decided to move the code under
CONFIG_PCI_MSI_INTERCEPT. We know this is not the right flag to gate the
code but to avoid an extra flag we decided to use this.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes since v2:
 - This patch is added in this version.
---
 xen/drivers/passthrough/msi-intercept.c | 41 +++++++++++++++++++++++++
 xen/drivers/passthrough/pci.c           | 34 ++++----------------
 xen/include/xen/msi-intercept.h         |  7 +++++
 xen/include/xen/pci.h                   | 11 ++++---
 4 files changed, 61 insertions(+), 32 deletions(-)

diff --git a/xen/drivers/passthrough/msi-intercept.c b/xen/drivers/passthrough/msi-intercept.c
index 1edae6d4e8..33ab71514d 100644
--- a/xen/drivers/passthrough/msi-intercept.c
+++ b/xen/drivers/passthrough/msi-intercept.c
@@ -19,6 +19,47 @@
 #include <asm/msi.h>
 #include <asm/hvm/io.h>
 
+int pdev_msi_init(struct pci_dev *pdev)
+{
+    unsigned int pos;
+
+    INIT_LIST_HEAD(&pdev->msi_list);
+
+    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
+                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSI);
+    if ( pos )
+    {
+        uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
+
+        pdev->msi_maxvec = multi_msi_capable(ctrl);
+    }
+
+    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
+                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSIX);
+    if ( pos )
+    {
+        struct arch_msix *msix = xzalloc(struct arch_msix);
+        uint16_t ctrl;
+
+        if ( !msix )
+            return -ENOMEM;
+
+        spin_lock_init(&msix->table_lock);
+
+        ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
+        msix->nr_entries = msix_table_size(ctrl);
+
+        pdev->msix = msix;
+    }
+
+    return 0;
+}
+
+void pdev_msi_deinit(struct pci_dev *pdev)
+{
+    XFREE(pdev->msix);
+}
+
 int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
 {
     int rc;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 298be21b5b..b1e3c711ad 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -314,6 +314,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
 {
     struct pci_dev *pdev;
     unsigned int pos;
+    int rc;
 
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
@@ -327,35 +328,12 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     *((u8*) &pdev->bus) = bus;
     *((u8*) &pdev->devfn) = devfn;
     pdev->domain = NULL;
-    INIT_LIST_HEAD(&pdev->msi_list);
-
-    pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-                              PCI_CAP_ID_MSI);
-    if ( pos )
-    {
-        uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
 
-        pdev->msi_maxvec = multi_msi_capable(ctrl);
-    }
-
-    pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-                              PCI_CAP_ID_MSIX);
-    if ( pos )
+    rc = pdev_msi_init(pdev);
+    if ( rc )
     {
-        struct arch_msix *msix = xzalloc(struct arch_msix);
-        uint16_t ctrl;
-
-        if ( !msix )
-        {
-            xfree(pdev);
-            return NULL;
-        }
-        spin_lock_init(&msix->table_lock);
-
-        ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
-        msix->nr_entries = msix_table_size(ctrl);
-
-        pdev->msix = msix;
+        XFREE(pdev);
+        return NULL;
     }
 
     list_add(&pdev->alldevs_list, &pseg->alldevs_list);
@@ -449,7 +427,7 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
     }
 
     list_del(&pdev->alldevs_list);
-    xfree(pdev->msix);
+    pdev_msi_deinit(pdev);
     xfree(pdev);
 }
 
diff --git a/xen/include/xen/msi-intercept.h b/xen/include/xen/msi-intercept.h
index 77c105e286..38ff7a09e1 100644
--- a/xen/include/xen/msi-intercept.h
+++ b/xen/include/xen/msi-intercept.h
@@ -21,16 +21,23 @@
 
 #include <asm/msi.h>
 
+int pdev_msi_init(struct pci_dev *pdev);
+void pdev_msi_deinit(struct pci_dev *pdev);
 int pdev_msix_assign(struct domain *d, struct pci_dev *pdev);
 void pdev_dump_msi(const struct pci_dev *pdev);
 
 #else /* !CONFIG_PCI_MSI_INTERCEPT */
+static inline int pdev_msi_init(struct pci_dev *pdev)
+{
+    return 0;
+}
 
 static inline int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
 {
     return 0;
 }
 
+static inline void pdev_msi_deinit(struct pci_dev *pdev) {}
 static inline void pdev_dump_msi(const struct pci_dev *pdev) {}
 static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
 
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 8e3d4d9454..f5b57270be 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -79,10 +79,6 @@ struct pci_dev {
     struct list_head alldevs_list;
     struct list_head domain_list;
 
-    struct list_head msi_list;
-
-    struct arch_msix *msix;
-
     struct domain *domain;
 
     const union {
@@ -94,7 +90,14 @@ struct pci_dev {
         pci_sbdf_t sbdf;
     };
 
+#ifdef CONFIG_PCI_MSI_INTERCEPT
+    struct list_head msi_list;
+
+    struct arch_msix *msix;
+
     uint8_t msi_maxvec;
+#endif
+
     uint8_t phantom_stride;
 
     nodeid_t node; /* NUMA node */
-- 
2.17.1


