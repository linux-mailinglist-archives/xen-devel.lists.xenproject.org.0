Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24CEB39B36
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 13:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098394.1452485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraZf-0002RL-6O; Thu, 28 Aug 2025 11:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098394.1452485; Thu, 28 Aug 2025 11:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraZf-0002MV-2G; Thu, 28 Aug 2025 11:13:47 +0000
Received: by outflank-mailman (input) for mailman id 1098394;
 Thu, 28 Aug 2025 11:13:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zjrZ=3I=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uraZd-00023f-6Z
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 11:13:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0e9b443f-8400-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 13:13:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24F051688;
 Thu, 28 Aug 2025 04:13:34 -0700 (PDT)
Received: from PWQ0QT7DJ1.emea.arm.com (PWQ0QT7DJ1.cambridge.arm.com
 [10.1.33.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 050173F694;
 Thu, 28 Aug 2025 04:13:40 -0700 (PDT)
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
X-Inumbo-ID: 0e9b443f-8400-11f0-ae26-e363de0e7a9e
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/5] arm/mpu: Implement transient mapping
Date: Thu, 28 Aug 2025 12:12:05 +0100
Message-ID: <6dc15f5279ea76ac52e89b75d56e3bd2063e91f3.1756379422.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1756379422.git.hari.limaye@arm.com>
References: <cover.1756379422.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

Add a scheme to distinguish transient MPU regions, to identify MPU
regions which will be mapped for a short period of time. This is needed
for the functions which transiently map and unmap memory ranges on
demand which will be introduced in a future commit.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from v2:
- Define offsets programmatically, rather than hard-coding these
- Add Michal's R-b

Changes from v1:
- Improve commit message
- Mark parameter in read helper as const
---
 xen/arch/arm/arm32/asm-offsets.c         |  3 ++-
 xen/arch/arm/arm64/asm-offsets.c         |  2 ++
 xen/arch/arm/include/asm/arm32/mpu.h     |  2 ++
 xen/arch/arm/include/asm/arm64/mpu.h     |  2 ++
 xen/arch/arm/include/asm/mpu/mm.h        | 14 +++++++++++++-
 xen/arch/arm/include/asm/mpu/regions.inc | 17 +++++++++++++----
 xen/arch/arm/mpu/mm.c                    | 23 ++++++++++++++---------
 7 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
index c203ce269d..f354bf374d 100644
--- a/xen/arch/arm/arm32/asm-offsets.c
+++ b/xen/arch/arm/arm32/asm-offsets.c
@@ -43,7 +43,6 @@ void __dummy__(void)
    OFFSET(UREGS_SP_und, struct cpu_user_regs, sp_und);
    OFFSET(UREGS_LR_und, struct cpu_user_regs, lr_und);
    OFFSET(UREGS_SPSR_und, struct cpu_user_regs, spsr_und);
-
    OFFSET(UREGS_SP_irq, struct cpu_user_regs, sp_irq);
    OFFSET(UREGS_LR_irq, struct cpu_user_regs, lr_irq);
    OFFSET(UREGS_SPSR_irq, struct cpu_user_regs, spsr_irq);
@@ -79,6 +78,8 @@ void __dummy__(void)
 #ifdef CONFIG_MPU
    DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
    DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
+   DEFINE(XEN_MPUMAP_ENTRY_SHIFT, ilog2(sizeof(pr_t)));
+   DEFINE(XEN_MPUMAP_ENTRY_ZERO_OFFSET, sizeof(prbar_t) + sizeof(prlar_t));
    BLANK();
 #endif
 }
diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
index 320289b281..38a3894a3b 100644
--- a/xen/arch/arm/arm64/asm-offsets.c
+++ b/xen/arch/arm/arm64/asm-offsets.c
@@ -73,6 +73,8 @@ void __dummy__(void)
 #ifdef CONFIG_MPU
    DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
    DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
+   DEFINE(XEN_MPUMAP_ENTRY_SHIFT, ilog2(sizeof(pr_t)));
+   DEFINE(XEN_MPUMAP_ENTRY_ZERO_OFFSET, sizeof(prbar_t) + sizeof(prlar_t));
    BLANK();
 #endif
 }
diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
index 0a6930b3a0..9906d98809 100644
--- a/xen/arch/arm/include/asm/arm32/mpu.h
+++ b/xen/arch/arm/include/asm/arm32/mpu.h
@@ -39,6 +39,8 @@ typedef union {
 typedef struct {
     prbar_t prbar;
     prlar_t prlar;
+    bool transient;
+    uint8_t pad[7]; /* Pad structure to 16 Bytes */
 } pr_t;
 
 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index f0ce344e78..1d1843eda0 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -38,6 +38,8 @@ typedef union {
 typedef struct {
     prbar_t prbar;
     prlar_t prlar;
+    bool transient;
+    uint8_t pad[15]; /* Pad structure to 32 Bytes */
 } pr_t;
 
 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index e1ded6521d..566d338986 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -55,6 +55,16 @@ static inline void context_sync_mpu(void)
     isb();
 }
 
+static inline bool region_is_transient(const pr_t *pr)
+{
+    return pr->transient;
+}
+
+static inline void region_set_transient(pr_t *pr, bool transient)
+{
+    pr->transient = transient;
+}
+
 /*
  * The following API requires context_sync_mpu() after being used to modify MPU
  * regions:
@@ -75,9 +85,11 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel);
  * @param base      Base address of the range to map (inclusive).
  * @param limit     Limit address of the range to map (exclusive).
  * @param flags     Flags for the memory range to map.
+ * @param transient True for a transient mapping, otherwise False.
  * @return          0 on success, negative on error.
  */
-int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
+int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
+                      bool transient);
 
 /*
  * Creates a pr_t structure describing a protection region.
diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
index 23fead3b21..09e1dcf03f 100644
--- a/xen/arch/arm/include/asm/mpu/regions.inc
+++ b/xen/arch/arm/include/asm/mpu/regions.inc
@@ -14,19 +14,25 @@
 #define PRLAR_ELx_EN            0x1
 
 #ifdef CONFIG_ARM_64
-#define XEN_MPUMAP_ENTRY_SHIFT  0x4     /* 16 byte structure */
-
 .macro store_pair reg1, reg2, dst
     stp \reg1, \reg2, [\dst]
 .endm
 
-#else
-#define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
+.macro zero_pair dst, offset, tmp1, tmp2
+    stp xzr, xzr, [\dst, \offset]
+.endm
 
+#else
 .macro store_pair reg1, reg2, dst
     strd  \reg1, \reg2, [\dst]
 .endm
 
+.macro zero_pair dst, offset, tmp1, tmp2
+    mov \tmp1, #0
+    mov \tmp2, #0
+    strd \tmp1, \tmp2, [\dst, \offset]
+.endm
+
 #endif
 
 /*
@@ -97,6 +103,9 @@
 
 3:
 
+    /* Clear the rest of the xen_mpumap entry. Clobbers prbar and prlar. */
+    zero_pair \base, #XEN_MPUMAP_ENTRY_ZERO_OFFSET, \prbar, \prlar
+
     add   \sel, \sel, #1
 
 1:
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 4c517d6e43..33333181d5 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -265,13 +265,14 @@ static void disable_mpu_region_from_index(uint8_t index)
  * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
  * given memory range and flags, creating one if none exists.
  *
- * @param base  Base address (inclusive).
- * @param limit Limit address (exclusive).
- * @param flags Region attributes (a combination of PAGE_HYPERVISOR_XXX)
+ * @param base      Base address (inclusive).
+ * @param limit     Limit address (exclusive).
+ * @param flags     Region attributes (a combination of PAGE_HYPERVISOR_XXX)
+ * @param transient True for a transient mapping, otherwise False.
  * @return      0 on success, otherwise negative on error.
  */
 static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
-                                   unsigned int flags)
+                                   unsigned int flags, bool transient)
 {
     bool flags_has_page_present;
     uint8_t idx;
@@ -311,6 +312,7 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
             return -ENOENT;
 
         xen_mpumap[idx] = pr_of_addr(base, limit, flags);
+        region_set_transient(&xen_mpumap[idx], transient);
 
         write_protection_region(&xen_mpumap[idx], idx);
     }
@@ -330,7 +332,8 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
     return 0;
 }
 
-int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
+int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
+                      bool transient)
 {
     int rc;
 
@@ -356,7 +359,7 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
 
     spin_lock(&xen_mpumap_lock);
 
-    rc = xen_mpumap_update_entry(base, limit, flags);
+    rc = xen_mpumap_update_entry(base, limit, flags, transient);
     if ( !rc )
         context_sync_mpu();
 
@@ -371,14 +374,15 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     ASSERT(IS_ALIGNED(e, PAGE_SIZE));
     ASSERT(s < e);
 
-    return xen_mpumap_update(s, e, 0);
+    return xen_mpumap_update(s, e, 0, false);
 }
 
 int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
                      unsigned int flags)
 {
     /* MPU systems have no translation, ma == va, so pass virt directly */
-    return xen_mpumap_update(virt, mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
+    return xen_mpumap_update(virt, mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags,
+                             false);
 }
 
 /*
@@ -399,7 +403,8 @@ static void __init setup_staticheap_mappings(void)
             paddr_t bank_end = bank_start + bank_size;
 
             /* Map static heap with one MPU protection region */
-            if ( xen_mpumap_update(bank_start, bank_end, PAGE_HYPERVISOR) )
+            if ( xen_mpumap_update(bank_start, bank_end, PAGE_HYPERVISOR,
+                                   false) )
                 panic("Failed to map static heap\n");
 
             break;
-- 
2.34.1


