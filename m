Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387943792FF
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 17:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125348.235958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg88p-0005qk-71; Mon, 10 May 2021 15:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125348.235958; Mon, 10 May 2021 15:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg88p-0005oB-3c; Mon, 10 May 2021 15:48:19 +0000
Received: by outflank-mailman (input) for mailman id 125348;
 Mon, 10 May 2021 15:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfCf=KF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lg88n-0005kO-5S
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 15:48:17 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 03ff9d8b-7816-49a7-b3dc-18f0d05f1b0d;
 Mon, 10 May 2021 15:48:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CF0F168F;
 Mon, 10 May 2021 08:48:15 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB5433F73B;
 Mon, 10 May 2021 08:48:13 -0700 (PDT)
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
X-Inumbo-ID: 03ff9d8b-7816-49a7-b3dc-18f0d05f1b0d
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
	Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v5 2/2] xen/pci: Refactor MSI code that implements MSI functionality within XEN
Date: Mon, 10 May 2021 16:47:27 +0100
Message-Id: <2843d1c399e8ed81d807e680147cac5cd601d28a.1620661205.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620661205.git.rahul.singh@arm.com>
References: <cover.1620661205.git.rahul.singh@arm.com>
In-Reply-To: <cover.1620661205.git.rahul.singh@arm.com>
References: <cover.1620661205.git.rahul.singh@arm.com>

MSI code that implements MSI functionality to support MSI within XEN is
not usable on ARM. Move the code under CONFIG_HAS_PCI_MSI_INTERCEPT flag
to gate the code for ARM.

Currently, we have no idea how MSI functionality will be supported for
other architecture therefore we have decided to move the code under
CONFIG_PCI_MSI_INTERCEPT. We know this is not the right flag to gate the
code but to avoid an extra flag we decided to use this.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/msi-intercept.c | 41 +++++++++++++++++++++++++
 xen/drivers/passthrough/pci.c           | 34 ++++----------------
 xen/include/xen/msi-intercept.h         | 11 ++++++-
 xen/include/xen/pci.h                   | 11 ++++---
 xen/xsm/flask/hooks.c                   |  8 ++---
 5 files changed, 68 insertions(+), 37 deletions(-)

diff --git a/xen/drivers/passthrough/msi-intercept.c b/xen/drivers/passthrough/msi-intercept.c
index 757f3fc236..3f9d4f480b 100644
--- a/xen/drivers/passthrough/msi-intercept.c
+++ b/xen/drivers/passthrough/msi-intercept.c
@@ -44,6 +44,47 @@ void pdev_dump_msi(const struct pci_dev *pdev)
     printk(">");
 }
 
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
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 237461b4ab..a3ec85c293 100644
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
+        xfree(pdev);
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
index 5cfc21662c..08e467ff79 100644
--- a/xen/include/xen/msi-intercept.h
+++ b/xen/include/xen/msi-intercept.h
@@ -23,9 +23,10 @@
 
 int pdev_msix_assign(struct domain *d, struct pci_dev *pdev);
 void pdev_dump_msi(const struct pci_dev *pdev);
+int pdev_msi_init(struct pci_dev *pdev);
+void pdev_msi_deinit(struct pci_dev *pdev);
 
 #else /* !CONFIG_HAS_PCI_MSI_INTERCEPT */
-
 static inline int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
 {
     return 0;
@@ -33,6 +34,14 @@ static inline int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
 
 static inline void pdev_dump_msi(const struct pci_dev *pdev) {}
 
+static inline int pdev_msi_init(struct pci_dev *pdev)
+{
+    return 0;
+}
+
+static inline void pdev_msi_deinit(struct pci_dev *pdev) {}
+static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
+
 #endif /* CONFIG_HAS_PCI_MSI_INTERCEPT */
 
 #endif /* __XEN_MSI_INTERCEPT_H */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 8e3d4d9454..01a92ce9e6 100644
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
 
+#ifdef CONFIG_HAS_PCI_MSI_INTERCEPT
+    struct list_head msi_list;
+
+    struct arch_msix *msix;
+
     uint8_t msi_maxvec;
+#endif
+
     uint8_t phantom_stride;
 
     nodeid_t node; /* NUMA node */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index f1a1217c98..024c368fb8 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -21,7 +21,7 @@
 #include <xen/guest_access.h>
 #include <xen/xenoprof.h>
 #include <xen/iommu.h>
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_PCI_MSI_INTERCEPT
 #include <asm/msi.h>
 #endif
 #include <public/xen.h>
@@ -114,7 +114,7 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
         }
         return security_irq_sid(irq, sid);
     }
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_PCI_MSI_INTERCEPT
     {
         struct irq_desc *desc = irq_to_desc(irq);
         if ( desc->msi_desc && desc->msi_desc->dev ) {
@@ -874,7 +874,7 @@ static int flask_map_domain_pirq (struct domain *d)
 static int flask_map_domain_msi (struct domain *d, int irq, const void *data,
                                  u32 *sid, struct avc_audit_data *ad)
 {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_PCI_MSI_INTERCEPT
     const struct msi_info *msi = data;
     u32 machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
 
@@ -940,7 +940,7 @@ static int flask_unmap_domain_pirq (struct domain *d)
 static int flask_unmap_domain_msi (struct domain *d, int irq, const void *data,
                                    u32 *sid, struct avc_audit_data *ad)
 {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_PCI_MSI_INTERCEPT
     const struct pci_dev *pdev = data;
     u32 machine_bdf = (pdev->seg << 16) | (pdev->bus << 8) | pdev->devfn;
 
-- 
2.17.1


