Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4673D694
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555107.866918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5z-0006mX-1V; Mon, 26 Jun 2023 03:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555107.866918; Mon, 26 Jun 2023 03:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5x-0006Ep-GQ; Mon, 26 Jun 2023 03:40:53 +0000
Received: by outflank-mailman (input) for mailman id 555107;
 Mon, 26 Jun 2023 03:40:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1e-0000HH-A0
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9fb1b15c-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:36:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96FA21FB;
 Sun, 25 Jun 2023 20:37:07 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF6F33F64C;
 Sun, 25 Jun 2023 20:36:20 -0700 (PDT)
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
X-Inumbo-ID: 9fb1b15c-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 24/52] xen/mpu: build up start-of-day Xen MPU memory region map
Date: Mon, 26 Jun 2023 11:34:15 +0800
Message-Id: <20230626033443.2943270-25-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The start-of-day Xen MPU memory region layout shall be like
as follows:

xen_mpumap[0] : Xen text
xen_mpumap[1] : Xen read-only data
xen_mpumap[2] : Xen read-only after init data
xen_mpumap[3] : Xen read-write data
xen_mpumap[4] : Xen BSS
xen_mpumap[5] : Xen init text
xen_mpumap[6] : Xen init data

The layout shall be compliant with what we describe in xen.lds.S,
or the codes need adjustment.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- cache maintanence for safety when modifying MPU memory mapping table
- Hardcode index for all data/text sections
- To make sure that alternative instructions are included, use "_einitext"
as the start of the "Init data" section.
---
 xen/arch/arm/Makefile                    |   2 +
 xen/arch/arm/arm64/Makefile              |   2 +
 xen/arch/arm/arm64/mpu/head.S            | 178 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu.h     |  59 ++++++++
 xen/arch/arm/include/asm/arm64/sysregs.h |  14 ++
 xen/arch/arm/mpu/mm.c                    |  37 +++++
 6 files changed, 292 insertions(+)
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
 create mode 100644 xen/arch/arm/mpu/mm.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index a83a535cd7..3bd193ee32 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -40,6 +40,8 @@ ifeq ($(CONFIG_HAS_MMU), y)
 obj-y += mmu/mm.o
 obj-y += mmu/setup.o
 obj-y += mmu/p2m.o
+else
+obj-y += mpu/mm.o
 endif
 obj-y += mm.o
 obj-y += monitor.o
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 55895ecb53..2641fb13ba 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -11,6 +11,8 @@ obj-y += head.o
 ifeq ($(CONFIG_HAS_MMU),y)
 obj-y += mmu/head.o
 obj-y += mmu/mm.o
+else
+obj-y += mpu/head.o
 endif
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
new file mode 100644
index 0000000000..93a7a75029
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -0,0 +1,178 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Start-of-day code for an Armv8-R AArch64 MPU system.
+ *
+ * Copyright (C) 2023 Arm Ltd.
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
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <asm/arm64/mpu.h>
+#include <asm/page.h>
+
+/*
+ * One entry in Xen MPU memory region mapping table(xen_mpumap) is a structure
+ * of pr_t, which is 16-bytes size, so the entry offset is the order of 4.
+ */
+#define MPU_ENTRY_SHIFT         0x4
+
+#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
+#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
+#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+
+#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+
+/*
+ * Macro to round up the section address to be PAGE_SIZE aligned
+ * Each section(e.g. .text, .data, etc) in xen.lds.S is page-aligned,
+ * which is usually guarded with ". = ALIGN(PAGE_SIZE)" in the head,
+ * or in the end
+ */
+.macro roundup_section, xb
+        add   \xb, \xb, #(PAGE_SIZE-1)
+        and   \xb, \xb, #PAGE_MASK
+.endm
+
+/*
+ * Macro to prepare and configure a particular EL2 MPU memory region with
+ * base address as \base and limit address as \limit.
+ * We will also create an according MPU memory region entry, which
+ * is a structure of pr_t, in Xen EL2 mpu memory region mapping table
+ * xen_mpumap.
+ *
+ * Inputs:
+ * base:        reg storing base address (should be page-aligned)
+ * limit:       reg storing limit address
+ * sel:         region selector
+ * prbar:       store computed PRBAR_EL2 value
+ * prlar:       store computed PRLAR_EL2 value
+ * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be REGION_DATA_PRBAR
+ * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be REGION_NORMAL_PRLAR
+ *
+ * Clobber \tmp1, \tmp2
+ *
+ */
+.macro prepare_xen_region, sel, base, limit, prbar, prlar, tmp1, tmp2, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
+    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
+    and   \base, \base, #MPU_REGION_MASK
+    mov   \prbar, #\attr_prbar
+    orr   \prbar, \prbar, \base
+
+    /* Prepare value for PRLAR_EL2 reg and preserve it in \prlar.*/
+    /* Round up limit address to be PAGE_SIZE aligned */
+    roundup_section \limit
+    /* Limit address should be inclusive */
+    sub   \limit, \limit, #1
+    and   \limit, \limit, #MPU_REGION_MASK
+    mov   \prlar, #\attr_prlar
+    orr   \prlar, \prlar, \limit
+
+    /*
+     * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
+     * PRSELR_EL2.REGION determines which MPU region is selected.
+     */
+    msr   PRSELR_EL2, \sel
+    isb
+    msr   PRBAR_EL2, \prbar
+    msr   PRLAR_EL2, \prlar
+    isb
+
+    mov   \tmp1, \sel
+    lsl   \tmp1, \tmp1, #MPU_ENTRY_SHIFT
+    load_paddr \tmp2, xen_mpumap
+    add   \tmp2, \tmp2, \tmp1
+    stp   \prbar, \prlar, [\tmp2]
+    /* Invalidate data cache for safety */
+    dc ivac, \tmp2
+    isb
+.endm
+
+.section .text.idmap, "ax", %progbits
+
+/*
+ * Static start-of-day Xen EL2 MPU memory region layout:
+ *
+ *     xen_mpumap[0] : Xen text
+ *     xen_mpumap[1] : Xen read-only data
+ *     xen_mpumap[2] : Xen read-only after init data
+ *     xen_mpumap[3] : Xen read-write data
+ *     xen_mpumap[4] : Xen BSS
+ *     xen_mpumap[5] : Xen init text
+ *     xen_mpumap[6] : Xen init data
+ *
+ * Clobbers x0 - x6
+ *
+ * It shall be compliant with what describes in xen.lds.S, or the below
+ * codes need adjustment.
+ */
+ENTRY(prepare_early_mappings)
+    /* x0: region sel */
+    mov   x0, xzr
+    /* Xen text section. */
+    load_paddr x1, _stext
+    load_paddr x2, _etext
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_TEXT_PRBAR
+
+    add   x0, x0, #1
+    /* Xen read-only data section. */
+    load_paddr x1, _srodata
+    load_paddr x2, _erodata
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_RO_PRBAR
+
+    add   x0, x0, #1
+    /* Xen read-only after init data section. */
+    load_paddr x1, __ro_after_init_start
+    load_paddr x2, __ro_after_init_end
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
+
+    add   x0, x0, #1
+    /* Xen read-write data section. */
+    load_paddr x1, __ro_after_init_end
+    load_paddr x2, __init_begin
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
+
+    add   x0, x0, #1
+    /* Xen BSS section. */
+    load_paddr x1, __bss_start
+    load_paddr x2, __bss_end
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
+
+    add   x0, x0, #1
+    /* Xen init text section. */
+    load_paddr x1, _sinittext
+    load_paddr x2, _einittext
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_TEXT_PRBAR
+
+    add   x0, x0, #1
+    /* Xen init data section. */
+    /*
+     * Even though we are not using alternative instructions in MPU yet,
+     * we want to use "_einitext" for the start of the "Init data" section
+     * to make sure they are included.
+     */
+    load_paddr x1, _einittext
+    roundup_section x1
+    load_paddr x2, __init_end
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
+
+    /* Ensure any MPU memory mapping table updates made above have occurred. */
+    dsb   nshst
+    ret
+ENDPROC(prepare_early_mappings)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
new file mode 100644
index 0000000000..0c479086f4
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * mpu.h: Arm Memory Protection Region definitions.
+ */
+
+#ifndef __ARM64_MPU_H__
+#define __ARM64_MPU_H__
+
+/*
+ * MPUIR_EL2.Region identifies the number of regions supported by the EL2 MPU.
+ * It is a 8-bit field, so 255 MPU memory regions at most.
+ */
+#define ARM_MAX_MPU_MEMORY_REGIONS 255
+
+#ifndef __ASSEMBLY__
+
+/* Protection Region Base Address Register */
+typedef union {
+    struct __packed {
+        unsigned long xn:2;       /* Execute-Never */
+        unsigned long ap:2;       /* Acess Permission */
+        unsigned long sh:2;       /* Sharebility */
+        unsigned long base:42;    /* Base Address */
+        unsigned long pad:16;
+    } reg;
+    uint64_t bits;
+} prbar_t;
+
+/* Protection Region Limit Address Register */
+typedef union {
+    struct __packed {
+        unsigned long en:1;     /* Region enable */
+        unsigned long ai:3;     /* Memory Attribute Index */
+        unsigned long ns:1;     /* Not-Secure */
+        unsigned long res:1;    /* Reserved 0 by hardware */
+        unsigned long limit:42; /* Limit Address */
+        unsigned long pad:16;
+    } reg;
+    uint64_t bits;
+} prlar_t;
+
+/* MPU Protection Region */
+typedef struct {
+    prbar_t prbar;
+    prlar_t prlar;
+} pr_t;
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ARM64_MPU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 3fdeb9d8cd..c41d805fde 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -462,6 +462,20 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
+/* System registers for Armv8-R AArch64 */
+#ifdef CONFIG_HAS_MPU
+
+/* EL2 MPU Protection Region Base Address Register encode */
+#define PRBAR_EL2   S3_4_C6_C8_0
+
+/* EL2 MPU Protection Region Limit Address Register encode */
+#define PRLAR_EL2   S3_4_C6_C8_1
+
+/* MPU Protection Region Selection Register encode */
+#define PRSELR_EL2  S3_4_C6_C2_1
+
+#endif
+
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
new file mode 100644
index 0000000000..fb6bb721b1
--- /dev/null
+++ b/xen/arch/arm/mpu/mm.c
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xen/arch/arm/mpu/mm.c
+ *
+ * MPU-based memory managment code for Armv8-R AArch64.
+ *
+ * Copyright (C) 2023 Arm Ltd.
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
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/init.h>
+#include <xen/page-size.h>
+#include <asm/arm64/mpu.h>
+
+/* EL2 Xen MPU memory region mapping table. */
+pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
+     xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1


