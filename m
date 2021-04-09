Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7235A280
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 18:01:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107896.206197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUtZ4-0002zZ-9s; Fri, 09 Apr 2021 16:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107896.206197; Fri, 09 Apr 2021 16:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUtZ4-0002zA-6n; Fri, 09 Apr 2021 16:00:58 +0000
Received: by outflank-mailman (input) for mailman id 107896;
 Fri, 09 Apr 2021 16:00:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2A1F=JG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lUtZ3-0002z5-89
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 16:00:57 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 64ba5e7a-8871-4e18-a484-51d2702eecea;
 Fri, 09 Apr 2021 16:00:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65BF41FB;
 Fri,  9 Apr 2021 09:00:54 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 816A83F73D;
 Fri,  9 Apr 2021 09:00:52 -0700 (PDT)
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
X-Inumbo-ID: 64ba5e7a-8871-4e18-a484-51d2702eecea
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Date: Fri,  9 Apr 2021 17:00:41 +0100
Message-Id: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MSI related code in the "passthrough/pci.c” file is not useful for ARM
when MSI interrupts are injected via GICv3 ITS.

Therefore introducing the new flag CONFIG_PCI_MSI_INTERCEPT to gate the
MSI code for ARM in common code. Also move the arch-specific code to an
arch-specific directory and implement the stub version for the unused
code for ARM to avoid compilation error when HAS_PCI is enabled for ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes since v1:
 - Rename CONFIG_HAS_PCI_MSI to CONFIG_PCI_MSI_INTERCEPT
 - Implement stub version of the unused function for ARM.
 - Move unneeded function to x86 file.     
---
 xen/arch/x86/msi.c            | 64 +++++++++++++++++++++++++++++++++++
 xen/drivers/passthrough/pci.c | 51 +++++++---------------------
 xen/drivers/pci/Kconfig       |  4 +++
 xen/drivers/vpci/Makefile     |  3 +-
 xen/drivers/vpci/header.c     | 19 +++--------
 xen/drivers/vpci/msix.c       | 25 ++++++++++++++
 xen/drivers/vpci/vpci.c       |  3 +-
 xen/include/asm-arm/msi.h     | 44 ++++++++++++++++++++++++
 xen/include/asm-x86/msi.h     |  4 +++
 xen/include/xen/pci.h         | 11 +++---
 xen/include/xen/vpci.h        | 24 ++++++++++++-
 xen/xsm/flask/hooks.c         |  8 ++---
 12 files changed, 195 insertions(+), 65 deletions(-)
 create mode 100644 xen/include/asm-arm/msi.h

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 5febc0ea4b..a6356f4a63 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1411,6 +1411,70 @@ void __init early_msi_init(void)
         return;
 }
 
+int alloc_pci_msi(struct pci_dev *pdev)
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
+void free_pci_msi(struct pci_dev *pdev)
+{
+    xfree(pdev->msix);
+}
+
+int pci_assign_msix_init(struct domain *d, struct pci_dev *pdev)
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
+void dump_pci_msi(struct pci_dev *pdev)
+{
+    struct msi_desc *msi;
+
+    list_for_each_entry ( msi, &pdev->msi_list, list )
+        printk("%d ", msi->irq);
+}
+
 static void dump_msi(unsigned char key)
 {
     unsigned int irq;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 705137f8be..1b473502a1 100644
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
-
-        pdev->msi_maxvec = multi_msi_capable(ctrl);
-    }
 
-    pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-                              PCI_CAP_ID_MSIX);
-    if ( pos )
+    rc = alloc_pci_msi(pdev);
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
+    free_pci_msi(pdev);
     xfree(pdev);
 }
 
@@ -1271,7 +1249,6 @@ bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
 static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
 {
     struct pci_dev *pdev;
-    struct msi_desc *msi;
 
     printk("==== segment %04x ====\n", pseg->nr);
 
@@ -1280,8 +1257,7 @@ static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
         printk("%pp - %pd - node %-3d - MSIs < ",
                &pdev->sbdf, pdev->domain,
                (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
-        list_for_each_entry ( msi, &pdev->msi_list, list )
-               printk("%d ", msi->irq);
+        dump_pci_msi(pdev);
         printk(">\n");
     }
 
@@ -1303,12 +1279,15 @@ static int __init setup_dump_pcidevs(void)
 }
 __initcall(setup_dump_pcidevs);
 
+
+#ifdef CONFIG_PCI_MSI_INTERCEPT
 int iommu_update_ire_from_msi(
     struct msi_desc *msi_desc, struct msi_msg *msg)
 {
     return iommu_intremap
            ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
 }
+#endif
 
 static int iommu_add_device(struct pci_dev *pdev)
 {
@@ -1429,13 +1408,9 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     ASSERT(pdev && (pdev->domain == hardware_domain ||
                     pdev->domain == dom_io));
 
-    if ( pdev->msix )
-    {
-        rc = pci_reset_msix_state(pdev);
-        if ( rc )
-            goto done;
-        msixtbl_init(d);
-    }
+    rc = pci_assign_msix_init(d, pdev);
+    if ( rc )
+        goto done;
 
     pdev->fault.count = 0;
 
diff --git a/xen/drivers/pci/Kconfig b/xen/drivers/pci/Kconfig
index 7da03fa13b..7ab92bde6e 100644
--- a/xen/drivers/pci/Kconfig
+++ b/xen/drivers/pci/Kconfig
@@ -1,3 +1,7 @@
 
 config HAS_PCI
 	bool
+
+config PCI_MSI_INTERCEPT
+	def_bool y
+	depends on X86 && HAS_PCI
diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
index 55d1bdfda0..f91fa71a40 100644
--- a/xen/drivers/vpci/Makefile
+++ b/xen/drivers/vpci/Makefile
@@ -1 +1,2 @@
-obj-y += vpci.o header.o msi.o msix.o
+obj-y += vpci.o header.o
+obj-$(CONFIG_PCI_MSI_INTERCEPT) += msi.o msix.o
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ba9a036202..a7695a0e2a 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -206,7 +206,6 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     struct vpci_header *header = &pdev->vpci->header;
     struct rangeset *mem = rangeset_new(NULL, NULL, 0);
     struct pci_dev *tmp, *dev = NULL;
-    const struct vpci_msix *msix = pdev->vpci->msix;
     unsigned int i;
     int rc;
 
@@ -244,21 +243,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     }
 
     /* Remove any MSIX regions if present. */
-    for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
+    rc = remove_msix_regions(pdev,mem);
+    if ( rc )
     {
-        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
-        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
-                                     vmsix_table_size(pdev->vpci, i) - 1);
-
-        rc = rangeset_remove_range(mem, start, end);
-        if ( rc )
-        {
-            printk(XENLOG_G_WARNING
-                   "Failed to remove MSIX table [%lx, %lx]: %d\n",
-                   start, end, rc);
-            rangeset_destroy(mem);
-            return rc;
-        }
+        rangeset_destroy(mem);
+        return rc;
     }
 
     /*
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 846f1b8d70..ca0a9b5665 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -428,6 +428,31 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
+int remove_msix_regions(const struct pci_dev *pdev, struct rangeset *mem)
+{
+    const struct vpci_msix *msix = pdev->vpci->msix;
+    unsigned int i;
+    int rc;
+
+    for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
+    {
+        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
+        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
+                vmsix_table_size(pdev->vpci, i) - 1);
+
+        rc = rangeset_remove_range(mem, start, end);
+        if ( rc )
+        {
+            printk(XENLOG_G_WARNING
+                    "Failed to remove MSIX table [%lx, %lx]: %d\n",
+                    start, end, rc);
+            return rc;
+        }
+    }
+
+    return 0;
+}
+
 static int init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index cbd1bac7fc..ebe40b0538 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -48,8 +48,7 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
-    xfree(pdev->vpci->msix);
-    xfree(pdev->vpci->msi);
+    free_vpci_msi(pdev);
     xfree(pdev->vpci);
     pdev->vpci = NULL;
 }
diff --git a/xen/include/asm-arm/msi.h b/xen/include/asm-arm/msi.h
new file mode 100644
index 0000000000..c54193310e
--- /dev/null
+++ b/xen/include/asm-arm/msi.h
@@ -0,0 +1,44 @@
+/*
+ * Copyright (C) 2021 Arm Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __ASM_MSI_H_
+#define __ASM_MSI_H_
+
+static inline int alloc_pci_msi(struct pci_dev *pdev)
+{
+    return 0;
+}
+
+static inline int pci_assign_msix_init(struct domain *d, struct pci_dev *pdev)
+{
+    return 0;
+}
+
+static inline void dump_pci_msi(struct pci_dev *pdev) {}
+static inline void free_pci_msi(struct pci_dev *pdev) {}
+static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
+
+#endif /* __ASM_MSI_H */
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
diff --git a/xen/include/asm-x86/msi.h b/xen/include/asm-x86/msi.h
index e228b0f3f3..7ef0161b67 100644
--- a/xen/include/asm-x86/msi.h
+++ b/xen/include/asm-x86/msi.h
@@ -252,5 +252,9 @@ void unmask_msi_irq(struct irq_desc *);
 void guest_mask_msi_irq(struct irq_desc *, bool mask);
 void ack_nonmaskable_msi_irq(struct irq_desc *);
 void set_msi_affinity(struct irq_desc *, const cpumask_t *);
+int alloc_pci_msi(struct pci_dev *pdev);
+void free_pci_msi(struct pci_dev *pdev);
+void dump_pci_msi(struct pci_dev *pdev);
+int pci_assign_msix_init(struct domain *d, struct pci_dev *pdev);
 
 #endif /* __ASM_MSI_H */
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
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9f5b5d52e1..a6b12717b1 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -91,6 +91,7 @@ struct vpci {
         /* FIXME: currently there's no support for SR-IOV. */
     } header;
 
+#ifdef CONFIG_PCI_MSI_INTERCEPT
     /* MSI data. */
     struct vpci_msi {
       /* Address. */
@@ -136,6 +137,7 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+#endif /* CONFIG_PCI_MSI_INTERCEPT */
 #endif
 };
 
@@ -148,6 +150,7 @@ struct vpci_vcpu {
 };
 
 #ifdef __XEN__
+#ifdef CONFIG_PCI_MSI_INTERCEPT
 void vpci_dump_msi(void);
 
 /* Make sure there's a hole in the p2m for the MSIX mmio areas. */
@@ -174,7 +177,7 @@ int __must_check vpci_msix_arch_disable_entry(struct vpci_msix_entry *entry,
                                               const struct pci_dev *pdev);
 void vpci_msix_arch_init_entry(struct vpci_msix_entry *entry);
 int vpci_msix_arch_print(const struct vpci_msix *msix);
-
+int remove_msix_regions(const struct pci_dev *pdev, struct rangeset *mem);
 /*
  * Helper functions to fetch MSIX related data. They are used by both the
  * emulated MSIX code and the BAR handlers.
@@ -208,6 +211,25 @@ static inline unsigned int vmsix_entry_nr(const struct vpci_msix *msix,
 {
     return entry - msix->entries;
 }
+
+static inline void free_vpci_msi(const struct pci_dev *pdev)
+{
+    xfree(pdev->vpci->msix);
+    xfree(pdev->vpci->msi);
+}
+#else /* !CONFIG_PCI_MSI_INTERCEPT */
+static inline int vpci_make_msix_hole(const struct pci_dev *pdev)
+{
+    return 0;
+}
+
+static inline int remove_msix_regions(const struct pci_dev *pdev,
+                                      struct rangeset *mem)
+{
+    return 0;
+}
+static inline void free_vpci_msi(const struct pci_dev *pdev) {}
+#endif /* CONFIG_PCI_MSI_INTERCEPT */
 #endif /* __XEN__ */
 
 #else /* !CONFIG_HAS_VPCI */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 3b7313b949..1d6c994444 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -21,7 +21,7 @@
 #include <xen/guest_access.h>
 #include <xen/xenoprof.h>
 #include <xen/iommu.h>
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_PCI_MSI_INTERCEPT
 #include <asm/msi.h>
 #endif
 #include <public/xen.h>
@@ -114,7 +114,7 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
         }
         return security_irq_sid(irq, sid);
     }
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_PCI_MSI_INTERCEPT
     {
         struct irq_desc *desc = irq_to_desc(irq);
         if ( desc->msi_desc && desc->msi_desc->dev ) {
@@ -868,7 +868,7 @@ static int flask_map_domain_pirq (struct domain *d)
 static int flask_map_domain_msi (struct domain *d, int irq, const void *data,
                                  u32 *sid, struct avc_audit_data *ad)
 {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_PCI_MSI_INTERCEPT
     const struct msi_info *msi = data;
     u32 machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
 
@@ -934,7 +934,7 @@ static int flask_unmap_domain_pirq (struct domain *d)
 static int flask_unmap_domain_msi (struct domain *d, int irq, const void *data,
                                    u32 *sid, struct avc_audit_data *ad)
 {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_PCI_MSI_INTERCEPT
     const struct pci_dev *pdev = data;
     u32 machine_bdf = (pdev->seg << 16) | (pdev->bus << 8) | pdev->devfn;
 
-- 
2.17.1


