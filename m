Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F8736EC9F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 16:48:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120092.227096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7xf-0002EZ-Rg; Thu, 29 Apr 2021 14:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120092.227096; Thu, 29 Apr 2021 14:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7xf-0002EB-Nc; Thu, 29 Apr 2021 14:48:15 +0000
Received: by outflank-mailman (input) for mailman id 120092;
 Thu, 29 Apr 2021 14:48:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKbL=J2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lc7xe-0002Dy-Fk
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 14:48:14 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ee86eacc-7629-43de-987d-0fb95e68d49e;
 Thu, 29 Apr 2021 14:48:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5E1D1FB;
 Thu, 29 Apr 2021 07:48:12 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0723F73B;
 Thu, 29 Apr 2021 07:48:11 -0700 (PDT)
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
X-Inumbo-ID: ee86eacc-7629-43de-987d-0fb95e68d49e
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
Subject: [PATCH v4 3/3] xen/pci: Refactor MSI code that implements MSI functionality within XEN
Date: Thu, 29 Apr 2021 15:46:53 +0100
Message-Id: <60b4c33fdcc2f7ad68d383ffae191e22b0b32f1c.1619707144.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619707144.git.rahul.singh@arm.com>
References: <cover.1619707144.git.rahul.singh@arm.com>
In-Reply-To: <cover.1619707144.git.rahul.singh@arm.com>
References: <cover.1619707144.git.rahul.singh@arm.com>

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
 xen/include/xen/msi-intercept.h         |  7 +++++
 xen/include/xen/pci.h                   | 11 ++++---
 xen/xsm/flask/hooks.c                   |  8 ++---
 5 files changed, 65 insertions(+), 36 deletions(-)

diff --git a/xen/drivers/passthrough/msi-intercept.c b/xen/drivers/passthrough/msi-intercept.c
index ed3ec38003..12187bc9b9 100644
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
index 1bf9fc4465..7b094e08f7 100644
--- a/xen/include/xen/msi-intercept.h
+++ b/xen/include/xen/msi-intercept.h
@@ -21,16 +21,23 @@
 
 #include <asm/msi.h>
 
+int pdev_msi_init(struct pci_dev *pdev);
+void pdev_msi_deinit(struct pci_dev *pdev);
 int pdev_msix_assign(struct domain *d, struct pci_dev *pdev);
 void pdev_dump_msi(const struct pci_dev *pdev);
 
 #else /* !CONFIG_HAS_PCI_MSI_INTERCEPT */
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
index 5a24d01f04..394455cc42 100644
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


