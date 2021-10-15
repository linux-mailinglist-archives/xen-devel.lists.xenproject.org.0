Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14942F496
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 15:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210638.367590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNkN-00024i-IQ; Fri, 15 Oct 2021 13:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210638.367590; Fri, 15 Oct 2021 13:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNkN-00021x-F2; Fri, 15 Oct 2021 13:59:43 +0000
Received: by outflank-mailman (input) for mailman id 210638;
 Fri, 15 Oct 2021 13:59:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mbNkL-00020z-7t
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:59:41 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a2b38552-6df8-4faf-9778-cada5db9f8e5;
 Fri, 15 Oct 2021 13:59:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30528147A;
 Fri, 15 Oct 2021 06:59:40 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 301D93F694;
 Fri, 15 Oct 2021 06:59:39 -0700 (PDT)
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
X-Inumbo-ID: a2b38552-6df8-4faf-9778-cada5db9f8e5
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 1/5] xen/vpci: Move ecam access functions to common code
Date: Fri, 15 Oct 2021 14:59:18 +0100
Message-Id: <bac1cc0d06dffc8f00233ea31233080bae8868aa.1634305870.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634305870.git.bertrand.marquis@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PCI standard is using ECAM and not MCFG which is coming from ACPI[1].
Use ECAM/ecam instead of MCFG in common code and in new functions added
in common vpci code by this patch.

Move vpci_access_allowed from arch/x86/hvm/io.c to drivers/vpci/vpci.c.

Create vpci_ecam_{read,write} in drivers/vpci/vpci.c that
contains the common code to perform these operations, changed
vpci_mmcfg_{read,write} accordingly to make use of these functions.

The vpci_ecam_{read,write} functions are returning false on error and
true on success. As the x86 code was previously always returning
X86EMUL_OKAY the return code is ignored. A comment has been added in
the code to show that this is intentional.

Those functions will be used in a following patch inside by arm vpci
implementation.

Rename MMCFG_BDF to VPCI_ECAM_BDF and move it to vpci.h.
This macro is only used by functions calling vpci_ecam helpers.

No functional change intended with this patch.

[1] https://wiki.osdev.org/PCI_Express

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v7:
- Rename vpci_ecam_access_allowed to vpci_access_allowed
- Rename vpci_ecam_mmio_{read/write} to vpci_ecam_{read/write}
- Replace comment in x86/hvm/io.c with one suggested by Roger
- Remove 32bit comments and fixes from this patch and move it to the next
one to keep only the moving+renaming in this patch
- Change return type of vpci_ecam_{read/write} to bool
- rename ECAM_BDF to VPCI_ECAM_BDF and move it to vpci.h
Changes in v6: Patch added
---
 xen/arch/x86/hvm/io.c     | 46 ++++-----------------------------
 xen/drivers/vpci/vpci.c   | 54 +++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/pci.h |  2 --
 xen/include/xen/vpci.h    | 12 +++++++++
 4 files changed, 71 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 046a8eb4ed..eb3c80743e 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -260,20 +260,6 @@ unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
     return CF8_ADDR_LO(cf8) | (addr & 3);
 }
 
-/* Do some sanity checks. */
-static bool vpci_access_allowed(unsigned int reg, unsigned int len)
-{
-    /* Check access size. */
-    if ( len != 1 && len != 2 && len != 4 && len != 8 )
-        return false;
-
-    /* Check that access is size aligned. */
-    if ( (reg & (len - 1)) )
-        return false;
-
-    return true;
-}
-
 /* vPCI config space IO ports handlers (0xcf8/0xcfc). */
 static bool vpci_portio_accept(const struct hvm_io_handler *handler,
                                const ioreq_t *p)
@@ -394,7 +380,7 @@ static unsigned int vpci_mmcfg_decode_addr(const struct hvm_mmcfg *mmcfg,
                                            paddr_t addr, pci_sbdf_t *sbdf)
 {
     addr -= mmcfg->addr;
-    sbdf->bdf = MMCFG_BDF(addr);
+    sbdf->bdf = VCPI_ECAM_BDF(addr);
     sbdf->bus += mmcfg->start_bus;
     sbdf->seg = mmcfg->segment;
 
@@ -434,25 +420,8 @@ static int vpci_mmcfg_read(struct vcpu *v, unsigned long addr,
     reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
     read_unlock(&d->arch.hvm.mmcfg_lock);
 
-    if ( !vpci_access_allowed(reg, len) ||
-         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
-        return X86EMUL_OKAY;
-
-    /*
-     * According to the PCIe 3.1A specification:
-     *  - Configuration Reads and Writes must usually be DWORD or smaller
-     *    in size.
-     *  - Because Root Complex implementations are not required to support
-     *    accesses to a RCRB that cross DW boundaries [...] software
-     *    should take care not to cause the generation of such accesses
-     *    when accessing a RCRB unless the Root Complex will support the
-     *    access.
-     *  Xen however supports 8byte accesses by splitting them into two
-     *  4byte accesses.
-     */
-    *data = vpci_read(sbdf, reg, min(4u, len));
-    if ( len == 8 )
-        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
+    /* Failed reads are not propagated to the caller */
+    vpci_ecam_read(sbdf, reg, len, data);
 
     return X86EMUL_OKAY;
 }
@@ -476,13 +445,8 @@ static int vpci_mmcfg_write(struct vcpu *v, unsigned long addr,
     reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
     read_unlock(&d->arch.hvm.mmcfg_lock);
 
-    if ( !vpci_access_allowed(reg, len) ||
-         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
-        return X86EMUL_OKAY;
-
-    vpci_write(sbdf, reg, min(4u, len), data);
-    if ( len == 8 )
-        vpci_write(sbdf, reg + 4, 4, data >> 32);
+    /* Failed writes are not propagated to the caller */
+    vpci_ecam_write(sbdf, reg, len, data);
 
     return X86EMUL_OKAY;
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index cbd1bac7fc..ef690f15a9 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -478,6 +478,60 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
     spin_unlock(&pdev->vpci->lock);
 }
 
+/* Helper function to check an access size and alignment on vpci space. */
+bool vpci_access_allowed(unsigned int reg, unsigned int len)
+{
+    /* Check access size. */
+    if ( len != 1 && len != 2 && len != 4 && len != 8 )
+        return false;
+
+    /* Check that access is size aligned. */
+    if ( (reg & (len - 1)) )
+        return false;
+
+    return true;
+}
+
+bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
+                         unsigned long data)
+{
+    if ( !vpci_access_allowed(reg, len) ||
+         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
+        return false;
+
+    vpci_write(sbdf, reg, min(4u, len), data);
+    if ( len == 8 )
+        vpci_write(sbdf, reg + 4, 4, data >> 32);
+
+    return true;
+}
+
+bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
+                        unsigned long *data)
+{
+    if ( !vpci_access_allowed(reg, len) ||
+         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
+        return false;
+
+    /*
+     * According to the PCIe 3.1A specification:
+     *  - Configuration Reads and Writes must usually be DWORD or smaller
+     *    in size.
+     *  - Because Root Complex implementations are not required to support
+     *    accesses to a RCRB that cross DW boundaries [...] software
+     *    should take care not to cause the generation of such accesses
+     *    when accessing a RCRB unless the Root Complex will support the
+     *    access.
+     *  Xen however supports 8byte accesses by splitting them into two
+     *  4byte accesses.
+     */
+    *data = vpci_read(sbdf, reg, min(4u, len));
+    if ( len == 8 )
+        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
+
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
index edd7c3e71a..443f25347d 100644
--- a/xen/include/asm-x86/pci.h
+++ b/xen/include/asm-x86/pci.h
@@ -6,8 +6,6 @@
 #define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
 #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
 
-#define MMCFG_BDF(addr)  ( ((addr) & 0x0ffff000) >> 12)
-
 #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
                         || id == 0x01268086 || id == 0x01028086 \
                         || id == 0x01128086 || id == 0x01228086 \
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9f5b5d52e1..d6cf0baf14 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -19,6 +19,8 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
 #define VPCI_PRIORITY_MIDDLE    "5"
 #define VPCI_PRIORITY_LOW       "9"
 
+#define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
+
 #define REGISTER_VPCI_INIT(x, p)                \
   static vpci_register_init_t *const x##_entry  \
                __used_section(".data.vpci." p) = x
@@ -208,6 +210,16 @@ static inline unsigned int vmsix_entry_nr(const struct vpci_msix *msix,
 {
     return entry - msix->entries;
 }
+
+/* ECAM mmio read/write helpers */
+bool vpci_access_allowed(unsigned int reg, unsigned int len);
+
+bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
+                         unsigned long data);
+
+bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
+                        unsigned long *data);
+
 #endif /* __XEN__ */
 
 #else /* !CONFIG_HAS_VPCI */
-- 
2.25.1


