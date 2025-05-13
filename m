Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E965FAB4E6E
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 10:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982633.1369002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uElGp-000283-Uh; Tue, 13 May 2025 08:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982633.1369002; Tue, 13 May 2025 08:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uElGp-00022G-QS; Tue, 13 May 2025 08:45:51 +0000
Received: by outflank-mailman (input) for mailman id 982633;
 Tue, 13 May 2025 08:45:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G6vE=X5=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1uElGp-0001kb-2u
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 08:45:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ab81f1b0-2fd6-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 10:45:49 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92A16176A;
 Tue, 13 May 2025 01:45:38 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9202E3F5A1;
 Tue, 13 May 2025 01:45:48 -0700 (PDT)
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
X-Inumbo-ID: ab81f1b0-2fd6-11f0-9eb6-5ba50f476ded
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 3/6] arm/mpu: Provide and populate MPU C data structures
Date: Tue, 13 May 2025 09:45:29 +0100
Message-Id: <20250513084532.4059388-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513084532.4059388-1-luca.fancellu@arm.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide some data structure in the C world to track the MPU
status, these structures will be filled at boot by the assembly
early code with the boot MPU regions and afterwards they will be
used at runtime.

Provide methods to update a bitmap created with DECLARE_BITMAP
from the assembly code for both Arm32 and Arm64.

Modify Arm64 assembly boot code to reset any unused MPU region,
initialise 'max_mpu_regions' with the number of supported MPU
regions and modify the common asm macro 'prepare_xen_region' to
load into xen_mpumap the MPU status and set/clear the bitmap
'xen_mpumap_mask' used to track the enabled regions.

Provide a stub implementation for the pr_t type and few asm
macro for the Arm32 to prevent compilation break, they will
be implemented later.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v5 changes:
 - changed variable name from 'max_xen_mpumap' to 'max_mpu_regions'
 - code style fixes
 - reverted back changes about parameter name of prepare_xen_region
 - optimised address computation for xen_mpumap entries
 - modified MAX_MPU_REGION_NR
v4 changes:
 - new patch
---
 xen/arch/arm/arm64/mpu/head.S            | 13 +++++
 xen/arch/arm/include/asm/arm32/mpu.h     | 25 +++++++++
 xen/arch/arm/include/asm/bitmap-op.inc   | 67 ++++++++++++++++++++++++
 xen/arch/arm/include/asm/mpu.h           |  5 ++
 xen/arch/arm/include/asm/mpu/mm.h        |  7 +++
 xen/arch/arm/include/asm/mpu/regions.inc | 49 +++++++++++++++++
 xen/arch/arm/mpu/mm.c                    | 16 ++++++
 7 files changed, 182 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/arm32/mpu.h
 create mode 100644 xen/arch/arm/include/asm/bitmap-op.inc

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index 6d336cafbbaf..59ddc46526eb 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -40,6 +40,9 @@ FUNC(enable_boot_cpu_mm)
     mrs   x5, MPUIR_EL2
     and   x5, x5, #NUM_MPU_REGIONS_MASK
 
+    ldr   x0, =max_mpu_regions
+    strb  w5, [x0]
+
     /* x0: region sel */
     mov   x0, xzr
     /* Xen text section. */
@@ -74,6 +77,16 @@ FUNC(enable_boot_cpu_mm)
     prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
 #endif
 
+zero_mpu:
+    /* Reset remaining MPU regions */
+    cmp   x0, x5
+    beq   out_zero_mpu
+    mov   x1, #0
+    mov   x2, #1
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prlar=REGION_DISABLED_PRLAR
+    b     zero_mpu
+
+out_zero_mpu:
     b    enable_mpu
     ret
 END(enable_boot_cpu_mm)
diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
new file mode 100644
index 000000000000..1bdae4c309dc
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm32/mpu.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_ARM32_MPU_H__
+#define __ARM_ARM32_MPU_H__
+
+#ifndef __ASSEMBLY__
+
+/* MPU Protection Region */
+typedef struct {
+    uint32_t prbar;
+    uint32_t prlar;
+} pr_t;
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ARM_ARM32_MPU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/bitmap-op.inc b/xen/arch/arm/include/asm/bitmap-op.inc
new file mode 100644
index 000000000000..ea7c8abbf6f0
--- /dev/null
+++ b/xen/arch/arm/include/asm/bitmap-op.inc
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * Sets a bit in a bitmap declared by DECLARE_BITMAP, symbol name passed through
+ * bitmap_symbol.
+ *
+ * bitmap_set_bit:      symbol of the bitmap declared by DECLARE_BITMAP
+ * bit:                 bit number to be set in the bitmap
+ * tmp1-tmp4:           temporary registers used for the computation
+ *
+ * Preserves bit.
+ * Output:
+ *  tmp1: Address of the word containing the changed bit.
+ * Clobbers: tmp1, tmp2, tmp3, tmp4.
+ */
+.macro bitmap_set_bit bitmap_symbol, bit, tmp1, tmp2, tmp3, tmp4
+    adr_l   \tmp1, \bitmap_symbol
+    mov     \tmp2, #(BYTES_PER_LONG - 1)
+    mvn     \tmp2, \tmp2
+    lsr     \tmp3, \bit, #3
+    and     \tmp2, \tmp3, \tmp2
+    add     \tmp1, \tmp1, \tmp2                 /* bitmap_symbol + (bit/BITS_PER_LONG)*BYTES_PER_LONG */
+    and     \tmp2, \bit, #(BITS_PER_LONG - 1)   /* bit offset inside word */
+
+    ldr     \tmp3, [\tmp1]
+    mov     \tmp4, #1
+    lsl     \tmp4, \tmp4, \tmp2                 /* (1 << offset) */
+    orr     \tmp3, \tmp3, \tmp4                 /* set the bit */
+    str     \tmp3, [\tmp1]
+.endm
+
+/*
+ * Clears a bit in a bitmap declared by DECLARE_BITMAP, symbol name passed
+ * through bitmap_symbol.
+ *
+ * bitmap_set_bit:      symbol of the bitmap declared by DECLARE_BITMAP
+ * bit:                 bit number to be set in the bitmap
+ * tmp1-tmp4:           temporary registers used for the computation
+ *
+ * Preserves bit.
+ * Output:
+ *  tmp1: Address of the word containing the changed bit.
+ * Clobbers: tmp1, tmp2, tmp3, tmp4.
+ */
+.macro bitmap_clear_bit bitmap_symbol, bit, tmp1, tmp2, tmp3, tmp4
+    adr_l   \tmp1, \bitmap_symbol
+    mov     \tmp2, #(BYTES_PER_LONG - 1)
+    mvn     \tmp2, \tmp2
+    lsr     \tmp3, \bit, #3
+    and     \tmp2, \tmp3, \tmp2
+    add     \tmp1, \tmp1, \tmp2                 /* bitmap_symbol + (bit/BITS_PER_LONG)*BYTES_PER_LONG */
+    and     \tmp2, \bit, #(BITS_PER_LONG - 1)   /* bit offset inside word */
+
+    ldr     \tmp3, [\tmp1]
+    mov     \tmp4, #1
+    lsl     \tmp4, \tmp4, \tmp2                 /* (1 << offset) */
+    mvn     \tmp4, \tmp4                        /* ~(1 << offset) */
+    and     \tmp3, \tmp3, \tmp4                 /* clear the bit */
+    str     \tmp3, [\tmp1]
+.endm
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index bb83f5a5f580..fb93b8b19d24 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -8,6 +8,10 @@
 
 #if defined(CONFIG_ARM_64)
 # include <asm/arm64/mpu.h>
+#elif defined(CONFIG_ARM_32)
+# include <asm/arm32/mpu.h>
+#else
+# error "unknown ARM variant"
 #endif
 
 #define MPU_REGION_SHIFT  6
@@ -17,6 +21,7 @@
 #define NUM_MPU_REGIONS_SHIFT   8
 #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
 #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
+#define MAX_MPU_REGION_NR       NUM_MPU_REGIONS_MASK
 
 #endif /* __ARM_MPU_H__ */
 
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index bfd840fa5d31..409b4dd53dc6 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -8,9 +8,16 @@
 #include <xen/page-size.h>
 #include <xen/types.h>
 #include <asm/mm.h>
+#include <asm/mpu.h>
 
 extern struct page_info *frame_table;
 
+extern uint8_t max_mpu_regions;
+
+extern DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR);
+
+extern pr_t xen_mpumap[MAX_MPU_REGION_NR];
+
 #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
 
 #ifdef CONFIG_ARM_32
diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
index 47868a152662..ba38213ffff1 100644
--- a/xen/arch/arm/include/asm/mpu/regions.inc
+++ b/xen/arch/arm/include/asm/mpu/regions.inc
@@ -1,14 +1,42 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/bitmap-op.inc>
 #include <asm/mpu.h>
 #include <asm/sysregs.h>
 
 /* Backgroud region enable/disable */
 #define SCTLR_ELx_BR    BIT(17, UL)
 
+#define REGION_DISABLED_PRLAR   0x00    /* NS=0 ATTR=000 EN=0 */
 #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
 #define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
 
+#define PRLAR_ELx_EN            0x1
+
+#ifdef CONFIG_ARM_64
+#define XEN_MPUMAP_ENTRY_SHIFT  0x4     /* 16 byte structure */
+
+.macro store_pair reg1, reg2, dst
+    stp \reg1, \reg2, [\dst]
+.endm
+
+.macro invalidate_dcache_one reg
+    dc ivac, \reg
+.endm
+
+#else
+#define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
+
+.macro store_pair reg1, reg2, dst
+    nop
+.endm
+
+.macro invalidate_dcache_one reg
+    nop
+.endm
+
+#endif
+
 /*
  * Macro to prepare and set a EL2 MPU memory region.
  * We will also create an according MPU memory region entry, which
@@ -56,6 +84,27 @@
     isb
     WRITE_SYSREG_ASM(\prbar, PRBAR_EL2)
     WRITE_SYSREG_ASM(\prlar, PRLAR_EL2)
+
+    /* Load pair into xen_mpumap and invalidate cache */
+    adr_l \base, xen_mpumap
+    add   \base, \base, \sel, LSL #XEN_MPUMAP_ENTRY_SHIFT
+    store_pair \prbar, \prlar, \base
+    invalidate_dcache_one \base
+
+    /* Set/clear xen_mpumap_mask bitmap */
+    tst   \prlar, #PRLAR_ELx_EN
+    bne   2f
+    /* Region is disabled, clear the bit in the bitmap */
+    bitmap_clear_bit xen_mpumap_mask, \sel, \base, \limit, \prbar, \prlar
+    b     3f
+
+2:
+    /* Region is enabled, set the bit in the bitmap */
+    bitmap_set_bit xen_mpumap_mask, \sel, \base, \limit, \prbar, \prlar
+
+3:
+    invalidate_dcache_one \base
+
     dsb   sy
     isb
 
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 07c8959f4ee9..ee035a54b942 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -7,9 +7,25 @@
 #include <xen/mm.h>
 #include <xen/sizes.h>
 #include <xen/types.h>
+#include <asm/mpu.h>
 
 struct page_info *frame_table;
 
+/* Maximum number of supported MPU memory regions by the EL2 MPU. */
+uint8_t __ro_after_init max_mpu_regions;
+
+/*
+ * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
+ * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
+ * region 1, ..., and so on.
+ * If a MPU memory region gets enabled, set the according bit to 1.
+ */
+DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
+    __section(".data.page_aligned");
+
+/* EL2 Xen MPU memory region mapping table. */
+pr_t __section(".data.page_aligned") xen_mpumap[MAX_MPU_REGION_NR];
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
-- 
2.34.1


