Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5806B36EC9C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 16:47:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120083.227085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7xB-00026g-Hq; Thu, 29 Apr 2021 14:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120083.227085; Thu, 29 Apr 2021 14:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7xB-00026E-EN; Thu, 29 Apr 2021 14:47:45 +0000
Received: by outflank-mailman (input) for mailman id 120083;
 Thu, 29 Apr 2021 14:47:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKbL=J2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lc7xA-000265-Cm
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 14:47:44 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 53b275d3-9361-444c-98a8-0deddf254de2;
 Thu, 29 Apr 2021 14:47:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D94411FB;
 Thu, 29 Apr 2021 07:47:41 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30D5F3F73B;
 Thu, 29 Apr 2021 07:47:40 -0700 (PDT)
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
X-Inumbo-ID: 53b275d3-9361-444c-98a8-0deddf254de2
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
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4 2/3] xen/pci: Refactor PCI MSI intercept related code
Date: Thu, 29 Apr 2021 15:46:52 +0100
Message-Id: <07cb9f45a91a283af1991c42266555bb0bfe3b71.1619707144.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619707144.git.rahul.singh@arm.com>
References: <cover.1619707144.git.rahul.singh@arm.com>
In-Reply-To: <cover.1619707144.git.rahul.singh@arm.com>
References: <cover.1619707144.git.rahul.singh@arm.com>

MSI intercept related code is not useful for ARM when MSI interrupts are
injected via GICv3 ITS.

Therefore introducing the new flag CONFIG_HAS_PCI_MSI_INTERCEPT to gate
the MSI code for ARM in common code and also implemented the stub
version for the unused code for ARM to avoid compilation error when
HAS_PCI is enabled for ARM.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/x86/Kconfig                    |  1 +
 xen/drivers/passthrough/Makefile        |  1 +
 xen/drivers/passthrough/msi-intercept.c | 53 ++++++++++++++++++++++++
 xen/drivers/passthrough/pci.c           | 20 ++++-----
 xen/drivers/pci/Kconfig                 |  4 ++
 xen/drivers/vpci/Makefile               |  3 +-
 xen/drivers/vpci/header.c               | 19 ++-------
 xen/drivers/vpci/msix.c                 | 55 +++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c                 |  3 +-
 xen/include/xen/msi-intercept.h         | 49 ++++++++++++++++++++++
 xen/include/xen/vpci.h                  | 41 ++++++++----------
 11 files changed, 195 insertions(+), 54 deletions(-)
 create mode 100644 xen/drivers/passthrough/msi-intercept.c
 create mode 100644 xen/include/xen/msi-intercept.h

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 32b9f23a20..a822687c2e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -20,6 +20,7 @@ config X86
 	select HAS_NS16550
 	select HAS_PASSTHROUGH
 	select HAS_PCI
+	select HAS_PCI_MSI_INTERCEPT
 	select HAS_PDX
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
index 445690e3e5..eb27d10f5a 100644
--- a/xen/drivers/passthrough/Makefile
+++ b/xen/drivers/passthrough/Makefile
@@ -7,3 +7,4 @@ obj-y += iommu.o
 obj-$(CONFIG_HAS_PCI) += pci.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
 obj-$(CONFIG_HAS_PCI) += ats.o
+obj-$(CONFIG_HAS_PCI_MSI_INTERCEPT) += msi-intercept.o
diff --git a/xen/drivers/passthrough/msi-intercept.c b/xen/drivers/passthrough/msi-intercept.c
new file mode 100644
index 0000000000..ed3ec38003
--- /dev/null
+++ b/xen/drivers/passthrough/msi-intercept.c
@@ -0,0 +1,53 @@
+/*
+ * Copyright (C) 2008,  Netronome Systems, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/init.h>
+#include <xen/pci.h>
+#include <asm/msi.h>
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
+void pdev_dump_msi(const struct pci_dev *pdev)
+{
+    const struct msi_desc *msi;
+
+    list_for_each_entry ( msi, &pdev->msi_list, list )
+        printk("- MSIs < %d >", msi->irq);
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
index 199ce08612..237461b4ab 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -32,8 +32,8 @@
 #include <xen/softirq.h>
 #include <xen/tasklet.h>
 #include <xen/vpci.h>
+#include <xen/msi-intercept.h>
 #include <xsm/xsm.h>
-#include <asm/msi.h>
 #include "ats.h"
 
 struct pci_seg {
@@ -1271,18 +1271,16 @@ bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
 static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
 {
     struct pci_dev *pdev;
-    struct msi_desc *msi;
 
     printk("==== segment %04x ====\n", pseg->nr);
 
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
     {
-        printk("%pp - %pd - node %-3d - MSIs < ",
+        printk("%pp - %pd - node %-3d ",
                &pdev->sbdf, pdev->domain,
                (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
-        list_for_each_entry ( msi, &pdev->msi_list, list )
-               printk("%d ", msi->irq);
-        printk(">\n");
+        pdev_dump_msi(pdev);
+        printk("\n");
     }
 
     return 0;
@@ -1422,13 +1420,9 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
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
index 7da03fa13b..295731a3f4 100644
--- a/xen/drivers/pci/Kconfig
+++ b/xen/drivers/pci/Kconfig
@@ -1,3 +1,7 @@
 
 config HAS_PCI
 	bool
+
+config HAS_PCI_MSI_INTERCEPT
+	bool
+	depends on HAS_PCI
diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
index 55d1bdfda0..a95e6c2ca0 100644
--- a/xen/drivers/vpci/Makefile
+++ b/xen/drivers/vpci/Makefile
@@ -1 +1,2 @@
-obj-y += vpci.o header.o msi.o msix.o
+obj-y += vpci.o header.o
+obj-$(CONFIG_HAS_PCI_MSI_INTERCEPT) += msi.o msix.o
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ba9a036202..81d3d2d17f 100644
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
+    rc = vpci_remove_msix_regions(pdev->vpci, mem);
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
index 846f1b8d70..b62106ddf9 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -27,6 +27,36 @@
     ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
      (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
 
+/*
+ * Helper functions to fetch MSIX related data. They are used by both the
+ * emulated MSIX code and the BAR handlers.
+ */
+static inline paddr_t vmsix_table_base(const struct vpci *vpci,
+                                       unsigned int nr)
+{
+    return vpci->header.bars[vpci->msix->tables[nr] & PCI_MSIX_BIRMASK].addr;
+}
+
+static inline paddr_t vmsix_table_addr(const struct vpci *vpci,
+                                       unsigned int nr)
+{
+    return vmsix_table_base(vpci, nr) +
+           (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
+}
+
+/*
+ * Note regarding the size calculation of the PBA: the spec mentions "The last
+ * QWORD will not necessarily be fully populated", so it implies that the PBA
+ * size is 64-bit aligned.
+ */
+static inline size_t vmsix_table_size(const struct vpci *vpci, unsigned int nr)
+{
+    return
+        (nr == VPCI_MSIX_TABLE) ? vpci->msix->max_entries * PCI_MSIX_ENTRY_SIZE
+                                : ROUNDUP(DIV_ROUND_UP(vpci->msix->max_entries,
+                                                       8), 8);
+}
+
 static uint32_t control_read(const struct pci_dev *pdev, unsigned int reg,
                              void *data)
 {
@@ -428,6 +458,31 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
+int vpci_remove_msix_regions(const struct vpci *vpci, struct rangeset *mem)
+{
+    const struct vpci_msix *msix = vpci->msix;
+    unsigned int i;
+    int rc;
+
+    for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
+    {
+        unsigned long start = PFN_DOWN(vmsix_table_addr(vpci, i));
+        unsigned long end = PFN_DOWN(vmsix_table_addr(vpci, i) +
+                vmsix_table_size(vpci, i) - 1);
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
index cbd1bac7fc..85084dd924 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -48,8 +48,7 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
-    xfree(pdev->vpci->msix);
-    xfree(pdev->vpci->msi);
+    vpci_msi_free(pdev->vpci);
     xfree(pdev->vpci);
     pdev->vpci = NULL;
 }
diff --git a/xen/include/xen/msi-intercept.h b/xen/include/xen/msi-intercept.h
new file mode 100644
index 0000000000..1bf9fc4465
--- /dev/null
+++ b/xen/include/xen/msi-intercept.h
@@ -0,0 +1,49 @@
+/*
+ * Copyright (C) 2008,  Netronome Systems, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __XEN_MSI_INTERCEPT_H_
+#define __XEN_MSI_INTERCEPT_H_
+
+#ifdef CONFIG_HAS_PCI_MSI_INTERCEPT
+
+#include <asm/msi.h>
+
+int pdev_msix_assign(struct domain *d, struct pci_dev *pdev);
+void pdev_dump_msi(const struct pci_dev *pdev);
+
+#else /* !CONFIG_HAS_PCI_MSI_INTERCEPT */
+
+static inline int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
+{
+    return 0;
+}
+
+static inline void pdev_dump_msi(const struct pci_dev *pdev) {}
+static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
+
+#endif /* CONFIG_HAS_PCI_MSI_INTERCEPT */
+
+#endif /* __XEN_MSI_INTERCEPT_H */
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
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9f5b5d52e1..4197407464 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -91,6 +91,7 @@ struct vpci {
         /* FIXME: currently there's no support for SR-IOV. */
     } header;
 
+#ifdef CONFIG_HAS_PCI_MSI_INTERCEPT
     /* MSI data. */
     struct vpci_msi {
       /* Address. */
@@ -136,6 +137,7 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+#endif /* CONFIG_HAS_PCI_MSI_INTERCEPT */
 #endif
 };
 
@@ -148,6 +150,7 @@ struct vpci_vcpu {
 };
 
 #ifdef __XEN__
+#ifdef CONFIG_HAS_PCI_MSI_INTERCEPT
 void vpci_dump_msi(void);
 
 /* Make sure there's a hole in the p2m for the MSIX mmio areas. */
@@ -174,40 +177,32 @@ int __must_check vpci_msix_arch_disable_entry(struct vpci_msix_entry *entry,
                                               const struct pci_dev *pdev);
 void vpci_msix_arch_init_entry(struct vpci_msix_entry *entry);
 int vpci_msix_arch_print(const struct vpci_msix *msix);
+int vpci_remove_msix_regions(const struct vpci *vpci, struct rangeset *mem);
 
-/*
- * Helper functions to fetch MSIX related data. They are used by both the
- * emulated MSIX code and the BAR handlers.
- */
-static inline paddr_t vmsix_table_base(const struct vpci *vpci, unsigned int nr)
+static inline unsigned int vmsix_entry_nr(const struct vpci_msix *msix,
+                                          const struct vpci_msix_entry *entry)
 {
-    return vpci->header.bars[vpci->msix->tables[nr] & PCI_MSIX_BIRMASK].addr;
+    return entry - msix->entries;
 }
 
-static inline paddr_t vmsix_table_addr(const struct vpci *vpci, unsigned int nr)
+static inline void vpci_msi_free(struct vpci *vpci)
 {
-    return vmsix_table_base(vpci, nr) +
-           (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
+    XFREE(vpci->msix);
+    XFREE(vpci->msi);
 }
-
-/*
- * Note regarding the size calculation of the PBA: the spec mentions "The last
- * QWORD will not necessarily be fully populated", so it implies that the PBA
- * size is 64-bit aligned.
- */
-static inline size_t vmsix_table_size(const struct vpci *vpci, unsigned int nr)
+#else /* !CONFIG_HAS_PCI_MSI_INTERCEPT */
+static inline int vpci_make_msix_hole(const struct pci_dev *pdev)
 {
-    return
-        (nr == VPCI_MSIX_TABLE) ? vpci->msix->max_entries * PCI_MSIX_ENTRY_SIZE
-                                : ROUNDUP(DIV_ROUND_UP(vpci->msix->max_entries,
-                                                       8), 8);
+    return 0;
 }
 
-static inline unsigned int vmsix_entry_nr(const struct vpci_msix *msix,
-                                          const struct vpci_msix_entry *entry)
+static inline int vpci_remove_msix_regions(const struct vpci *vpci,
+                                           struct rangeset *mem)
 {
-    return entry - msix->entries;
+    return 0;
 }
+static inline void vpci_msi_free(struct vpci *vpci) {}
+#endif /* CONFIG_HAS_PCI_MSI_INTERCEPT */
 #endif /* __XEN__ */
 
 #else /* !CONFIG_HAS_VPCI */
-- 
2.17.1


