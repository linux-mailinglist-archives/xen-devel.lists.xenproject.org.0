Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F055241B5CB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198197.351567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHhR-0005sK-Hq; Tue, 28 Sep 2021 18:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198197.351567; Tue, 28 Sep 2021 18:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHhR-0005qQ-De; Tue, 28 Sep 2021 18:19:29 +0000
Received: by outflank-mailman (input) for mailman id 198197;
 Tue, 28 Sep 2021 18:19:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iZ8=OS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mVHhQ-0005qD-DE
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 18:19:28 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9cc18f95-2088-11ec-bcc4-12813bfff9fa;
 Tue, 28 Sep 2021 18:19:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B05B36D;
 Tue, 28 Sep 2021 11:19:25 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4F903F793;
 Tue, 28 Sep 2021 11:19:23 -0700 (PDT)
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
X-Inumbo-ID: 9cc18f95-2088-11ec-bcc4-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 01/17] xen/pci: Refactor MSI code that implements MSI functionality within XEN
Date: Tue, 28 Sep 2021 19:18:10 +0100
Message-Id: <db3af270e884838cbde7c29c366740bb3f628725.1632847120.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>

On Arm, the initial plan is to only support GICv3 ITS which doesn't
require us to manage the MSIs because the HW will protect against
spoofing. Move the code under CONFIG_HAS_PCI_MSI flag to gate the code
for ARM.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Change in v3: none 
Change in v2: Fixed minor comments
---
 xen/arch/x86/Kconfig             |  1 +
 xen/drivers/passthrough/Makefile |  1 +
 xen/drivers/passthrough/msi.c    | 83 ++++++++++++++++++++++++++++++++
 xen/drivers/passthrough/pci.c    | 54 +++++----------------
 xen/drivers/pci/Kconfig          |  4 ++
 xen/include/xen/msi.h            | 43 +++++++++++++++++
 xen/xsm/flask/hooks.c            |  8 +--
 7 files changed, 149 insertions(+), 45 deletions(-)
 create mode 100644 xen/drivers/passthrough/msi.c
 create mode 100644 xen/include/xen/msi.h

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 1f83518ee0..b4abfca46f 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -20,6 +20,7 @@ config X86
 	select HAS_NS16550
 	select HAS_PASSTHROUGH
 	select HAS_PCI
+	select HAS_PCI_MSI
 	select HAS_PDX
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
index 445690e3e5..a5efa22714 100644
--- a/xen/drivers/passthrough/Makefile
+++ b/xen/drivers/passthrough/Makefile
@@ -7,3 +7,4 @@ obj-y += iommu.o
 obj-$(CONFIG_HAS_PCI) += pci.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
 obj-$(CONFIG_HAS_PCI) += ats.o
+obj-$(CONFIG_HAS_PCI_MSI) += msi.o
diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.c
new file mode 100644
index 0000000000..ce1a450f6f
--- /dev/null
+++ b/xen/drivers/passthrough/msi.c
@@ -0,0 +1,83 @@
+#include <xen/init.h>
+#include <xen/pci.h>
+#include <xen/msi.h>
+#include <asm/hvm/io.h>
+
+int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
+{
+    int rc;
+
+    if ( pdev->msix )
+    {
+        rc = pci_reset_msix_state(pdev);
+        if ( rc )
+            return rc;
+        msixtbl_init(d);
+    }
+
+    return 0;
+}
+
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
+void pdev_dump_msi(const struct pci_dev *pdev)
+{
+    const struct msi_desc *msi;
+
+    if ( list_empty(&pdev->msi_list) )
+        return;
+
+    printk(" - MSIs < ");
+    list_for_each_entry ( msi, &pdev->msi_list, list )
+        printk("%d ", msi->irq);
+    printk(">");
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index fc4fa2e5c3..8996403161 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -32,8 +32,8 @@
 #include <xen/softirq.h>
 #include <xen/tasklet.h>
 #include <xen/vpci.h>
+#include <xen/msi.h>
 #include <xsm/xsm.h>
-#include <asm/msi.h>
 #include "ats.h"
 
 struct pci_seg {
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
-
-        pdev->msi_maxvec = multi_msi_capable(ctrl);
-    }
 
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
 
@@ -1271,18 +1249,16 @@ bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
 static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
 {
     struct pci_dev *pdev;
-    struct msi_desc *msi;
 
     printk("==== segment %04x ====\n", pseg->nr);
 
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
     {
-        printk("%pp - %pd - node %-3d - MSIs < ",
+        printk("%pp - %pd - node %-3d",
                &pdev->sbdf, pdev->domain,
                (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
-        list_for_each_entry ( msi, &pdev->msi_list, list )
-               printk("%d ", msi->irq);
-        printk(">\n");
+        pdev_dump_msi(pdev);
+        printk("\n");
     }
 
     return 0;
@@ -1422,13 +1398,9 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     ASSERT(pdev && (pdev->domain == hardware_domain ||
                     pdev->domain == dom_io));
 
-    if ( pdev->msix )
-    {
-        rc = pci_reset_msix_state(pdev);
-        if ( rc )
-            goto done;
-        msixtbl_init(d);
-    }
+    rc = pdev_msix_assign(d, pdev);
+    if ( rc )
+        goto done;
 
     pdev->fault.count = 0;
 
diff --git a/xen/drivers/pci/Kconfig b/xen/drivers/pci/Kconfig
index 7da03fa13b..c6a7bc8007 100644
--- a/xen/drivers/pci/Kconfig
+++ b/xen/drivers/pci/Kconfig
@@ -1,3 +1,7 @@
 
 config HAS_PCI
 	bool
+
+config HAS_PCI_MSI
+	bool
+	depends on HAS_PCI
diff --git a/xen/include/xen/msi.h b/xen/include/xen/msi.h
new file mode 100644
index 0000000000..c903d0050c
--- /dev/null
+++ b/xen/include/xen/msi.h
@@ -0,0 +1,43 @@
+#ifndef __XEN_MSI_H_
+#define __XEN_MSI_H_
+
+#include <xen/pci.h>
+
+#ifdef CONFIG_HAS_PCI_MSI
+
+#include <asm/msi.h>
+
+int pdev_msix_assign(struct domain *d, struct pci_dev *pdev);
+int pdev_msi_init(struct pci_dev *pdev);
+void pdev_msi_deinit(struct pci_dev *pdev);
+void pdev_dump_msi(const struct pci_dev *pdev);
+
+#else /* !CONFIG_HAS_PCI_MSI */
+
+static inline int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
+{
+    return 0;
+}
+
+static inline int pdev_msi_init(struct pci_dev *pdev)
+{
+    return 0;
+}
+
+static inline void pdev_msi_deinit(struct pci_dev *pdev) {}
+static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
+static inline void pdev_dump_msi(const struct pci_dev *pdev) {}
+
+#endif /* CONFIG_HAS_PCI_MSI */
+
+#endif /* __XEN_MSI_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 25e87180b4..ea9a12bd71 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -21,7 +21,7 @@
 #include <xen/guest_access.h>
 #include <xen/xenoprof.h>
 #include <xen/iommu.h>
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_PCI_MSI
 #include <asm/msi.h>
 #endif
 #include <public/xen.h>
@@ -114,7 +114,7 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
         }
         return security_irq_sid(irq, sid);
     }
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_PCI_MSI
     {
         struct irq_desc *desc = irq_to_desc(irq);
         if ( desc->msi_desc && desc->msi_desc->dev ) {
@@ -874,7 +874,7 @@ static int flask_map_domain_pirq (struct domain *d)
 static int flask_map_domain_msi (struct domain *d, int irq, const void *data,
                                  u32 *sid, struct avc_audit_data *ad)
 {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_PCI_MSI
     const struct msi_info *msi = data;
     u32 machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
 
@@ -940,7 +940,7 @@ static int flask_unmap_domain_pirq (struct domain *d)
 static int flask_unmap_domain_msi (struct domain *d, int irq, const void *data,
                                    u32 *sid, struct avc_audit_data *ad)
 {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_PCI_MSI
     const struct pci_dev *pdev = data;
     u32 machine_bdf = (pdev->seg << 16) | (pdev->bus << 8) | pdev->devfn;
 
-- 
2.17.1


