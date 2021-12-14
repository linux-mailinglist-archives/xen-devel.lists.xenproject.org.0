Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188634740B7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 11:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246570.425231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx5JW-0005Nr-IX; Tue, 14 Dec 2021 10:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246570.425231; Tue, 14 Dec 2021 10:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx5JW-0005LA-F3; Tue, 14 Dec 2021 10:45:42 +0000
Received: by outflank-mailman (input) for mailman id 246570;
 Tue, 14 Dec 2021 10:45:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JiGg=Q7=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1mx5JU-00054J-Fp
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 10:45:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1f633c3b-5cca-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 11:39:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 611016D;
 Tue, 14 Dec 2021 02:45:38 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7F4C3F5A1;
 Tue, 14 Dec 2021 02:45:36 -0800 (PST)
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
X-Inumbo-ID: 1f633c3b-5cca-11ec-85d3-df6b77346a89
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Date: Tue, 14 Dec 2021 10:45:17 +0000
Message-Id: <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
References: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpci/msix.c file will be used for arm architecture when vpci msix
support will be added to ARM, but there is x86 specific code in this
file.

Move x86 specific code to the x86_msix.c file to make sure common code
will be used for other architecture.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/x86/msi.c                       |   2 +-
 xen/drivers/passthrough/amd/iommu_init.c |   1 +
 xen/drivers/vpci/Makefile                |   1 +
 xen/drivers/vpci/msi.c                   |   3 +-
 xen/drivers/vpci/msix.c                  | 134 +++++---------------
 xen/drivers/vpci/x86_msix.c              | 155 +++++++++++++++++++++++
 xen/include/asm-x86/msi.h                |  28 ----
 xen/include/xen/msi.h                    |  28 ++++
 xen/include/xen/vpci.h                   |  21 +++
 9 files changed, 239 insertions(+), 134 deletions(-)
 create mode 100644 xen/drivers/vpci/x86_msix.c

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 5febc0ea4b..2b120f897f 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -23,7 +23,7 @@
 #include <asm/io.h>
 #include <asm/smp.h>
 #include <asm/desc.h>
-#include <asm/msi.h>
+#include <xen/msi.h>
 #include <asm/fixmap.h>
 #include <asm/p2m.h>
 #include <mach_apic.h>
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 559a734bda..fc385959c7 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -20,6 +20,7 @@
 #include <xen/acpi.h>
 #include <xen/delay.h>
 #include <xen/keyhandler.h>
+#include <xen/msi.h>
 
 #include "iommu.h"
 
diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
index 1a1413b93e..543c265199 100644
--- a/xen/drivers/vpci/Makefile
+++ b/xen/drivers/vpci/Makefile
@@ -1,2 +1,3 @@
 obj-y += vpci.o header.o
 obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
+obj-$(CONFIG_X86) += x86_msix.o
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 5757a7aed2..8fc82a9b8d 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -16,12 +16,11 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/msi.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/vpci.h>
 
-#include <asm/msi.h>
-
 static uint32_t control_read(const struct pci_dev *pdev, unsigned int reg,
                              void *data)
 {
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 846f1b8d70..7a9b02f1a5 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -17,15 +17,24 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/msi.h>
 #include <xen/sched.h>
 #include <xen/vpci.h>
 
-#include <asm/msi.h>
 #include <asm/p2m.h>
 
-#define VMSIX_ADDR_IN_RANGE(addr, vpci, nr)                               \
-    ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
-     (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
+/*
+ * The return value is different for the MMIO handler on ARM and x86
+ * architecture. To make the code common for both architectures create
+ * generic return code with architecture dependent values.
+ */
+#ifdef CONFIG_X86
+#define VPCI_EMUL_OKAY      X86EMUL_OKAY
+#define VPCI_EMUL_RETRY     X86EMUL_RETRY
+#else
+#define VPCI_EMUL_OKAY      1
+#define VPCI_EMUL_RETRY     VPCI_EMUL_OKAY
+#endif
 
 static uint32_t control_read(const struct pci_dev *pdev, unsigned int reg,
                              void *data)
@@ -138,29 +147,6 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, val);
 }
 
-static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
-{
-    struct vpci_msix *msix;
-
-    list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
-    {
-        const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
-        unsigned int i;
-
-        for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
-            if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
-                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
-                return msix;
-    }
-
-    return NULL;
-}
-
-static int msix_accept(struct vcpu *v, unsigned long addr)
-{
-    return !!msix_find(v->domain, addr);
-}
-
 static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
                            unsigned int len)
 {
@@ -182,21 +168,19 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
     return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
 }
 
-static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
-                     unsigned long *data)
+int msix_read(struct vpci_msix *msix, unsigned long addr, unsigned int len,
+              unsigned long *data)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
     const struct vpci_msix_entry *entry;
     unsigned int offset;
 
     *data = ~0ul;
 
     if ( !msix )
-        return X86EMUL_RETRY;
+        return VPCI_EMUL_RETRY;
 
     if ( !access_allowed(msix->pdev, addr, len) )
-        return X86EMUL_OKAY;
+        return VPCI_EMUL_OKAY;
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -210,11 +194,11 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
         switch ( len )
         {
         case 4:
-            *data = readl(addr);
+            *data = vpci_arch_readl(addr);
             break;
 
         case 8:
-            *data = readq(addr);
+            *data = vpci_arch_readq(addr);
             break;
 
         default:
@@ -222,7 +206,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
             break;
         }
 
-        return X86EMUL_OKAY;
+        return VPCI_EMUL_OKAY;
     }
 
     spin_lock(&msix->pdev->vpci->lock);
@@ -256,22 +240,20 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
     }
     spin_unlock(&msix->pdev->vpci->lock);
 
-    return X86EMUL_OKAY;
+    return VPCI_EMUL_OKAY;
 }
 
-static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
-                      unsigned long data)
+int msix_write(const struct domain *d, struct vpci_msix *msix,
+               unsigned long addr, unsigned int len, unsigned long data)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
     struct vpci_msix_entry *entry;
     unsigned int offset;
 
     if ( !msix )
-        return X86EMUL_RETRY;
+        return VPCI_EMUL_RETRY;
 
     if ( !access_allowed(msix->pdev, addr, len) )
-        return X86EMUL_OKAY;
+        return VPCI_EMUL_OKAY;
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -281,11 +263,11 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
             switch ( len )
             {
             case 4:
-                writel(data, addr);
+                vpci_arch_writel(data, addr);
                 break;
 
             case 8:
-                writeq(data, addr);
+                vpci_arch_writeq(data, addr);
                 break;
 
             default:
@@ -294,7 +276,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
             }
         }
 
-        return X86EMUL_OKAY;
+        return VPCI_EMUL_OKAY;
     }
 
     spin_lock(&msix->pdev->vpci->lock);
@@ -372,60 +354,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
     }
     spin_unlock(&msix->pdev->vpci->lock);
 
-    return X86EMUL_OKAY;
-}
-
-static const struct hvm_mmio_ops vpci_msix_table_ops = {
-    .check = msix_accept,
-    .read = msix_read,
-    .write = msix_write,
-};
-
-int vpci_make_msix_hole(const struct pci_dev *pdev)
-{
-    struct domain *d = pdev->domain;
-    unsigned int i;
-
-    if ( !pdev->vpci->msix )
-        return 0;
-
-    /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
-    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
-    {
-        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
-        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
-                                     vmsix_table_size(pdev->vpci, i) - 1);
-
-        for ( ; start <= end; start++ )
-        {
-            p2m_type_t t;
-            mfn_t mfn = get_gfn_query(d, start, &t);
-
-            switch ( t )
-            {
-            case p2m_mmio_dm:
-            case p2m_invalid:
-                break;
-            case p2m_mmio_direct:
-                if ( mfn_x(mfn) == start )
-                {
-                    clear_identity_p2m_entry(d, start);
-                    break;
-                }
-                /* fallthrough. */
-            default:
-                put_gfn(d, start);
-                gprintk(XENLOG_WARNING,
-                        "%pp: existing mapping (mfn: %" PRI_mfn
-                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
-                        &pdev->sbdf, mfn_x(mfn), t, start);
-                return -EEXIST;
-            }
-            put_gfn(d, start);
-        }
-    }
-
-    return 0;
+    return VPCI_EMUL_OKAY;
 }
 
 static int init_msix(struct pci_dev *pdev)
@@ -472,11 +401,10 @@ static int init_msix(struct pci_dev *pdev)
         vpci_msix_arch_init_entry(&msix->entries[i]);
     }
 
-    if ( list_empty(&d->arch.hvm.msix_tables) )
-        register_mmio_handler(d, &vpci_msix_table_ops);
+    register_msix_mmio_handler(d);
+    vpci_msix_add_to_msix_table(msix, d);
 
     pdev->vpci->msix = msix;
-    list_add(&msix->next, &d->arch.hvm.msix_tables);
 
     return 0;
 }
diff --git a/xen/drivers/vpci/x86_msix.c b/xen/drivers/vpci/x86_msix.c
new file mode 100644
index 0000000000..b38b52e410
--- /dev/null
+++ b/xen/drivers/vpci/x86_msix.c
@@ -0,0 +1,155 @@
+/*
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms and conditions of the GNU General Public
+ * License, version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public
+ * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/sched.h>
+#include <xen/vpci.h>
+
+#include <asm/msi.h>
+#include <asm/p2m.h>
+
+u32 vpci_arch_readl(unsigned long addr)
+{
+    return readl(addr);
+}
+
+u64 vpci_arch_readq(unsigned long addr)
+{
+    return readq(addr);
+}
+
+void vpci_arch_writel(u32 data, unsigned long addr)
+{
+    writel(data, addr);
+}
+
+void vpci_arch_writeq(u64 data, unsigned long addr)
+{
+    writeq(data, addr);
+}
+
+int vpci_make_msix_hole(const struct pci_dev *pdev)
+{
+    struct domain *d = pdev->domain;
+    unsigned int i;
+
+    if ( !pdev->vpci->msix )
+        return 0;
+
+    /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
+    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
+    {
+        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
+        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
+                                     vmsix_table_size(pdev->vpci, i) - 1);
+
+        for ( ; start <= end; start++ )
+        {
+            p2m_type_t t;
+            mfn_t mfn = get_gfn_query(d, start, &t);
+
+            switch ( t )
+            {
+            case p2m_mmio_dm:
+            case p2m_invalid:
+                break;
+            case p2m_mmio_direct:
+                if ( mfn_x(mfn) == start )
+                {
+                    clear_identity_p2m_entry(d, start);
+                    break;
+                }
+                /* fallthrough. */
+            default:
+                put_gfn(d, start);
+                gprintk(XENLOG_WARNING,
+                        "%pp: existing mapping (mfn: %" PRI_mfn
+                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
+                        &pdev->sbdf, mfn_x(mfn), t, start);
+                return -EEXIST;
+            }
+            put_gfn(d, start);
+        }
+    }
+
+    return 0;
+}
+
+struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
+{
+    struct vpci_msix *msix;
+
+    list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
+    {
+        const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
+        unsigned int i;
+
+        for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
+            if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
+                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
+                return msix;
+    }
+
+    return NULL;
+}
+
+static int x86_msix_accept(struct vcpu *v, unsigned long addr)
+{
+    return !!msix_find(v->domain, addr);
+}
+
+static int x86_msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
+                          unsigned long data)
+{
+    const struct domain *d = v->domain;
+    struct vpci_msix *msix = msix_find(d, addr);
+
+    return msix_write(d, msix, addr, len, data);
+}
+
+static int x86_msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
+                         unsigned long *data)
+{
+    const struct domain *d = v->domain;
+    struct vpci_msix *msix = msix_find(d, addr);
+
+    return msix_read(msix, addr, len, data);
+}
+
+static const struct hvm_mmio_ops vpci_msix_table_ops = {
+    .check = x86_msix_accept,
+    .read = x86_msix_read,
+    .write = x86_msix_write,
+};
+
+void register_msix_mmio_handler(struct domain *d)
+{
+    if ( list_empty(&d->arch.hvm.msix_tables) )
+        register_mmio_handler(d, &vpci_msix_table_ops);
+}
+
+void vpci_msix_add_to_msix_table(struct vpci_msix *msix,
+                                 struct domain *d)
+{
+    list_add(&msix->next, &d->arch.hvm.msix_tables);
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
diff --git a/xen/include/asm-x86/msi.h b/xen/include/asm-x86/msi.h
index e228b0f3f3..0a7912e9be 100644
--- a/xen/include/asm-x86/msi.h
+++ b/xen/include/asm-x86/msi.h
@@ -148,34 +148,6 @@ int msi_free_irq(struct msi_desc *entry);
  */
 #define NR_HP_RESERVED_VECTORS 	20
 
-#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
-#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
-#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
-#define msi_data_reg(base, is64bit)	\
-	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
-#define msi_mask_bits_reg(base, is64bit) \
-	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
-#define msi_pending_bits_reg(base, is64bit) \
-	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
-#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
-#define multi_msi_capable(control) \
-	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
-#define multi_msi_enable(control, num) \
-	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
-#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
-#define is_mask_bit_support(control)	(!!(control & PCI_MSI_FLAGS_MASKBIT))
-#define msi_enable(control, num) multi_msi_enable(control, num); \
-	control |= PCI_MSI_FLAGS_ENABLE
-
-#define msix_control_reg(base)		(base + PCI_MSIX_FLAGS)
-#define msix_table_offset_reg(base)	(base + PCI_MSIX_TABLE)
-#define msix_pba_offset_reg(base)	(base + PCI_MSIX_PBA)
-#define msix_enable(control)	 	control |= PCI_MSIX_FLAGS_ENABLE
-#define msix_disable(control)	 	control &= ~PCI_MSIX_FLAGS_ENABLE
-#define msix_table_size(control) 	((control & PCI_MSIX_FLAGS_QSIZE)+1)
-#define msix_unmask(address)	 	(address & ~PCI_MSIX_VECTOR_BITMASK)
-#define msix_mask(address)		(address | PCI_MSIX_VECTOR_BITMASK)
-
 /*
  * MSI Defined Data Structures
  */
diff --git a/xen/include/xen/msi.h b/xen/include/xen/msi.h
index c903d0050c..1c22c9a4a7 100644
--- a/xen/include/xen/msi.h
+++ b/xen/include/xen/msi.h
@@ -3,6 +3,34 @@
 
 #include <xen/pci.h>
 
+#define msi_control_reg(base)       (base + PCI_MSI_FLAGS)
+#define msi_lower_address_reg(base) (base + PCI_MSI_ADDRESS_LO)
+#define msi_upper_address_reg(base) (base + PCI_MSI_ADDRESS_HI)
+#define msi_data_reg(base, is64bit) \
+	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
+#define msi_mask_bits_reg(base, is64bit) \
+	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
+#define msi_pending_bits_reg(base, is64bit) \
+	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
+#define msi_disable(control)        control &= ~PCI_MSI_FLAGS_ENABLE
+#define multi_msi_capable(control) \
+	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
+#define multi_msi_enable(control, num) \
+	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
+#define is_64bit_address(control)   (!!(control & PCI_MSI_FLAGS_64BIT))
+#define is_mask_bit_support(control)    (!!(control & PCI_MSI_FLAGS_MASKBIT))
+#define msi_enable(control, num) multi_msi_enable(control, num); \
+	control |= PCI_MSI_FLAGS_ENABLE
+
+#define msix_control_reg(base)      (base + PCI_MSIX_FLAGS)
+#define msix_table_offset_reg(base) (base + PCI_MSIX_TABLE)
+#define msix_pba_offset_reg(base)   (base + PCI_MSIX_PBA)
+#define msix_enable(control)        control |= PCI_MSIX_FLAGS_ENABLE
+#define msix_disable(control)       control &= ~PCI_MSIX_FLAGS_ENABLE
+#define msix_table_size(control)    ((control & PCI_MSIX_FLAGS_QSIZE)+1)
+#define msix_unmask(address)        (address & ~PCI_MSIX_VECTOR_BITMASK)
+#define msix_mask(address)          (address | PCI_MSIX_VECTOR_BITMASK)
+
 #ifdef CONFIG_HAS_PCI_MSI
 
 #include <asm/msi.h>
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9ea66e033f..4cb7665d54 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -150,6 +150,11 @@ struct vpci_vcpu {
 };
 
 #ifdef __XEN__
+
+#define VMSIX_ADDR_IN_RANGE(addr, vpci, nr)                               \
+    ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
+     (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
+
 void vpci_dump_msi(void);
 
 /* Make sure there's a hole in the p2m for the MSIX mmio areas. */
@@ -220,6 +225,22 @@ bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
 bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
                     unsigned long *data);
 
+void register_msix_mmio_handler(struct domain *d);
+
+void vpci_msix_add_to_msix_table(struct vpci_msix *msix, struct domain *d);
+
+int msix_write(const struct domain *d, struct vpci_msix *msix,
+               unsigned long addr, unsigned int len, unsigned long data);
+
+int msix_read(struct vpci_msix *msix, unsigned long addr, unsigned int len,
+              unsigned long *data);
+
+u32 vpci_arch_readl(unsigned long addr);
+u64 vpci_arch_readq(unsigned long addr);
+
+void vpci_arch_writel(u32 data, unsigned long addr);
+void vpci_arch_writeq(u64 data, unsigned long addr);
+
 #endif /* __XEN__ */
 
 #else /* !CONFIG_HAS_VPCI */
-- 
2.25.1


