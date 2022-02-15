Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F644B6FB1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273314.468455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzia-0001EB-Cf; Tue, 15 Feb 2022 15:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273314.468455; Tue, 15 Feb 2022 15:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzia-0001CJ-91; Tue, 15 Feb 2022 15:26:16 +0000
Received: by outflank-mailman (input) for mailman id 273314;
 Tue, 15 Feb 2022 15:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ8a=S6=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1nJziY-00014w-CS
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:26:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9bb87121-8e73-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 16:26:12 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ABBE1396;
 Tue, 15 Feb 2022 07:26:12 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4CA13F66F;
 Tue, 15 Feb 2022 07:26:10 -0800 (PST)
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
X-Inumbo-ID: 9bb87121-8e73-11ec-b215-9bbe72dcb22c
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
Subject: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Date: Tue, 15 Feb 2022 15:25:16 +0000
Message-Id: <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644937405.git.rahul.singh@arm.com>
References: <cover.1644937405.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpci/msix.c file will be used for arm architecture when vpci msix
support will be added to ARM, but there is x86 specific code in this
file.

Move x86 specific code to the x86/hvm/vmsi.c file to make sure common
code will be used for other architecture.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes since v1:
 - Split return value of vpci_msix_{read,write} to separate patch.
 - Fix the {read,write}{l,q} call in common code to move to arch specific file. 
---
 xen/arch/x86/hvm/vmsi.c             | 102 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msi.h      |  28 --------
 xen/arch/x86/msi.c                  |   2 +-
 xen/drivers/passthrough/amd/iommu.h |   1 +
 xen/drivers/vpci/msi.c              |   3 +-
 xen/drivers/vpci/msix.c             | 101 +++------------------------
 xen/include/xen/msi.h               |  28 ++++++++
 xen/include/xen/vpci.h              |  13 ++++
 8 files changed, 154 insertions(+), 124 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 13e2a190b4..17426f238c 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -925,4 +925,106 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
 
     return 0;
 }
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
+struct vpci_msix *vpci_msix_find(const struct domain *d, unsigned long addr)
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
+    return !!vpci_msix_find(v->domain, addr);
+}
+
+static int x86_msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
+                          unsigned long data)
+{
+    const struct domain *d = v->domain;
+    struct vpci_msix *msix = vpci_msix_find(d, addr);
+
+    return vpci_msix_write(msix, addr, len, data);
+}
+
+static int x86_msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
+                         unsigned long *data)
+{
+    const struct domain *d = v->domain;
+    struct vpci_msix *msix = vpci_msix_find(d, addr);
+
+    return vpci_msix_read(msix, addr, len, data);
+}
+
+static const struct hvm_mmio_ops vpci_msix_table_ops = {
+    .check = x86_msix_accept,
+    .read = x86_msix_read,
+    .write = x86_msix_write,
+};
+
+void vpci_msix_arch_register(struct vpci_msix *msix, struct domain *d)
+{
+    if ( list_empty(&d->arch.hvm.msix_tables) )
+        register_mmio_handler(d, &vpci_msix_table_ops);
+
+    list_add(&msix->next, &d->arch.hvm.msix_tables);
+}
 #endif /* CONFIG_HAS_VPCI */
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index e228b0f3f3..0a7912e9be 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
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
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 5febc0ea4b..62fd7351dd 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -20,10 +20,10 @@
 #include <xen/iocap.h>
 #include <xen/keyhandler.h>
 #include <xen/pfn.h>
+#include <xen/msi.h>
 #include <asm/io.h>
 #include <asm/smp.h>
 #include <asm/desc.h>
-#include <asm/msi.h>
 #include <asm/fixmap.h>
 #include <asm/p2m.h>
 #include <mach_apic.h>
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 93243424e8..f007a0c083 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -26,6 +26,7 @@
 #include <xen/tasklet.h>
 #include <xen/sched.h>
 #include <xen/domain_page.h>
+#include <xen/msi.h>
 
 #include <asm/msi.h>
 #include <asm/apicdef.h>
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
index 846f1b8d70..d89396a3b4 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -17,16 +17,12 @@
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
-
 static uint32_t control_read(const struct pci_dev *pdev, unsigned int reg,
                              void *data)
 {
@@ -138,29 +134,6 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
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
@@ -182,11 +155,9 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
     return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
 }
 
-static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
-                     unsigned long *data)
+int vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
+                   unsigned int len, unsigned long *data)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
     const struct vpci_msix_entry *entry;
     unsigned int offset;
 
@@ -259,11 +230,10 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
     return X86EMUL_OKAY;
 }
 
-static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
-                      unsigned long data)
+int vpci_msix_write(struct vpci_msix *msix, unsigned long addr,
+                    unsigned int len, unsigned long data)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
+    const struct domain *d = msix->pdev->domain;
     struct vpci_msix_entry *entry;
     unsigned int offset;
 
@@ -375,59 +345,6 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
     return X86EMUL_OKAY;
 }
 
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
-}
-
 static int init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
@@ -472,11 +389,9 @@ static int init_msix(struct pci_dev *pdev)
         vpci_msix_arch_init_entry(&msix->entries[i]);
     }
 
-    if ( list_empty(&d->arch.hvm.msix_tables) )
-        register_mmio_handler(d, &vpci_msix_table_ops);
-
     pdev->vpci->msix = msix;
-    list_add(&msix->next, &d->arch.hvm.msix_tables);
+
+    vpci_msix_arch_register(msix, d);
 
     return 0;
 }
diff --git a/xen/include/xen/msi.h b/xen/include/xen/msi.h
index c903d0050c..c5c8e65feb 100644
--- a/xen/include/xen/msi.h
+++ b/xen/include/xen/msi.h
@@ -3,6 +3,34 @@
 
 #include <xen/pci.h>
 
+#define msi_control_reg(base)       (base + PCI_MSI_FLAGS)
+#define msi_lower_address_reg(base) (base + PCI_MSI_ADDRESS_LO)
+#define msi_upper_address_reg(base) (base + PCI_MSI_ADDRESS_HI)
+#define msi_data_reg(base, is64bit) \
+	( (is64bit) ? (base) + PCI_MSI_DATA_64 : (base) + PCI_MSI_DATA_32 )
+#define msi_mask_bits_reg(base, is64bit) \
+	( (is64bit) ? (base) + PCI_MSI_MASK_BIT : (base) + PCI_MSI_MASK_BIT - 4)
+#define msi_pending_bits_reg(base, is64bit) \
+	( (is64bit) ? (base) + PCI_MSI_MASK_BIT + 4 : (base) + PCI_MSI_MASK_BIT)
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
index e8ac1eb395..0381a2c911 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -148,6 +148,11 @@ struct vpci_vcpu {
 };
 
 #ifdef __XEN__
+
+#define VMSIX_ADDR_IN_RANGE(addr, vpci, nr)                               \
+    ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
+     (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
+
 void vpci_dump_msi(void);
 
 /* Make sure there's a hole in the p2m for the MSIX mmio areas. */
@@ -218,6 +223,14 @@ bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
 bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
                     unsigned long *data);
 
+void vpci_msix_arch_register(struct vpci_msix *msix, struct domain *d);
+
+int vpci_msix_write(struct vpci_msix *msix, unsigned long addr,
+                    unsigned int len, unsigned long data);
+
+int vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
+                   unsigned int len, unsigned long *data);
+
 #endif /* __XEN__ */
 
 #else /* !CONFIG_HAS_VPCI */
-- 
2.25.1


