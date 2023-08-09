Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE0776C16
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 00:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581411.910123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrVE-00077i-Fp; Wed, 09 Aug 2023 22:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581411.910123; Wed, 09 Aug 2023 22:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrVE-000745-Bh; Wed, 09 Aug 2023 22:18:04 +0000
Received: by outflank-mailman (input) for mailman id 581411;
 Wed, 09 Aug 2023 22:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTx5=D2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qTrVC-0006IW-F1
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 22:18:02 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98f7872f-3702-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 00:17:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DE5C482853C6;
 Wed,  9 Aug 2023 17:17:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id jflgPxlZXNrT; Wed,  9 Aug 2023 17:17:56 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D9345828663A;
 Wed,  9 Aug 2023 17:17:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0CZNlI3_fxqW; Wed,  9 Aug 2023 17:17:55 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 33CE48285C34;
 Wed,  9 Aug 2023 17:17:55 -0500 (CDT)
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
X-Inumbo-ID: 98f7872f-3702-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D9345828663A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691619475; bh=jRQHtUUKl76Rh39J66PCy9Aw7hkCY8hDbofqLNMxf3g=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=fBL6UOKFtQ0EzZ/XjXmnVsPFUXUwVaaQ8piO9JanMI2QoJ0O/mCTCqThqdY+0MGYf
	 1A+BM1P+7/dbsP1xnfsbAdBfDpMFyOQTxD83QVLTmxVc72rEXRtYobObRTM8QCJ4qE
	 BoyzMouhbECcqzEyCk+qaNEneGUw/0PLpgGbaD44=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 3/3] xen/ppc: Implement initial Radix MMU support
Date: Wed,  9 Aug 2023 17:17:43 -0500
Message-Id: <55621be668cdd13889fbbc251b74ae8e6e0af664.1691617957.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1691617957.git.sanastasio@raptorengineering.com>
References: <cover.1691617957.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add code to construct early identity-mapped page tables as well as the
required process and partition tables to enable the MMU.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v2:
  - Add missing ')' to mm.h/maddr_to_virt definition
  - Add missing parens around `va` argument in XEN_PT_INDEX_LVL
  - Drop '&' asm constraint modifier in processor.h/mfmsr()
  - Fix asm constraint formatting in processor.h
  - Change mtspr,mfspr to functions in processor.h
  - Drop unnecessary _Static_assert in mm-radix.c
  - Drop unnecessary cast in setup_initial_mapping
  - Use __va() to obtain pde/pte addresses in setup_initial_mapping
  - Wrap >80col lines in mm-radix.c
  - Drop unnecessary parameters in setup_{process,partition}_table
  - Add __init to setup_{process,partition}_table
  - Drop unnecessary opal.c changes
  - Drop manual prototype of setup_initial_pagetables in setup.c in
    favor of using the one already in asm/mm.h
  - Fix formatting of tlbiel asm block in tlb-radix.c

 xen/arch/ppc/Makefile                |   2 +
 xen/arch/ppc/include/asm/bitops.h    |   9 +
 xen/arch/ppc/include/asm/mm.h        |  18 ++
 xen/arch/ppc/include/asm/page-bits.h |   3 +-
 xen/arch/ppc/include/asm/page.h      | 178 ++++++++++++++++++
 xen/arch/ppc/include/asm/processor.h |  34 ++++
 xen/arch/ppc/include/asm/regs.h      | 138 ++++++++++++++
 xen/arch/ppc/include/asm/types.h     |   1 +
 xen/arch/ppc/mm-radix.c              | 268 +++++++++++++++++++++++++++
 xen/arch/ppc/ppc64/head.S            |  15 ++
 xen/arch/ppc/setup.c                 |   3 +
 xen/arch/ppc/tlb-radix.c             |  96 ++++++++++
 12 files changed, 764 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/ppc/include/asm/bitops.h
 create mode 100644 xen/arch/ppc/include/asm/mm.h
 create mode 100644 xen/arch/ppc/include/asm/page.h
 create mode 100644 xen/arch/ppc/include/asm/regs.h
 create mode 100644 xen/arch/ppc/mm-radix.c
 create mode 100644 xen/arch/ppc/tlb-radix.c

diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 0c0a7884a1..a059ac4c0a 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -2,8 +2,10 @@ obj-$(CONFIG_PPC64) +=3D ppc64/

 obj-y +=3D boot-of.init.o
 obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.init.o
+obj-y +=3D mm-radix.o
 obj-y +=3D opal.o
 obj-y +=3D setup.o
+obj-y +=3D tlb-radix.o

 $(TARGET): $(TARGET)-syms
 	cp -f $< $@
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm=
/bitops.h
new file mode 100644
index 0000000000..548e97b414
--- /dev/null
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -0,0 +1,9 @@
+#ifndef _ASM_PPC_BITOPS_H
+#define _ASM_PPC_BITOPS_H
+
+/* PPC bit number conversion */
+#define PPC_BITLSHIFT(be)	(BITS_PER_LONG - 1 - (be))
+#define PPC_BIT(bit)		(1UL << PPC_BITLSHIFT(bit))
+#define PPC_BITMASK(bs, be)	((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
+
+#endif /* _ASM_PPC_BITOPS_H */
diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.=
h
new file mode 100644
index 0000000000..c85a7ed686
--- /dev/null
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -0,0 +1,18 @@
+#ifndef _ASM_PPC_MM_H
+#define _ASM_PPC_MM_H
+
+#include <asm/page-bits.h>
+
+#define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
+#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
+
+#define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
+#define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START))
+
+/* Convert between Xen-heap virtual addresses and machine addresses. */
+#define __pa(x)             (virt_to_maddr(x))
+#define __va(x)             (maddr_to_virt(x))
+
+void setup_initial_pagetables(void);
+
+#endif /* _ASM_PPC_MM_H */
diff --git a/xen/arch/ppc/include/asm/page-bits.h b/xen/arch/ppc/include/=
asm/page-bits.h
index 4c01bf9716..0286177520 100644
--- a/xen/arch/ppc/include/asm/page-bits.h
+++ b/xen/arch/ppc/include/asm/page-bits.h
@@ -2,6 +2,7 @@
 #define __PPC_PAGE_BITS_H__

 #define PAGE_SHIFT              16 /* 64 KiB Pages */
-#define PADDR_BITS              48
+#define PADDR_BITS              53
+#define VADDR_BITS              52

 #endif /* __PPC_PAGE_BITS_H__ */
diff --git a/xen/arch/ppc/include/asm/page.h b/xen/arch/ppc/include/asm/p=
age.h
new file mode 100644
index 0000000000..9b49424714
--- /dev/null
+++ b/xen/arch/ppc/include/asm/page.h
@@ -0,0 +1,178 @@
+#ifndef _ASM_PPC_PAGE_H
+#define _ASM_PPC_PAGE_H
+
+#include <xen/types.h>
+
+#include <asm/bitops.h>
+#include <asm/byteorder.h>
+
+#define PDE_VALID     PPC_BIT(0)
+#define PDE_NLB_MASK  0xfffffffffffffUL
+#define PDE_NLB_SHIFT 5UL
+#define PDE_NLS_MASK  0x1f
+
+#define PTE_VALID     PPC_BIT(0)
+#define PTE_LEAF      PPC_BIT(1)
+#define PTE_REFERENCE PPC_BIT(55)
+#define PTE_CHANGE    PPC_BIT(56)
+
+/* PTE Attributes */
+#define PTE_ATT_SAO            PPC_BIT(59) /* Strong Access Ordering */
+#define PTE_ATT_NON_IDEMPOTENT PPC_BIT(58)
+#define PTE_ATT_TOLERANT       (PPC_BIT(58) | PPC_BIT(59))
+
+/* PTE Encoded Access Authority*/
+#define PTE_EAA_PRIVILEGED PPC_BIT(60)
+#define PTE_EAA_READ       PPC_BIT(61)
+#define PTE_EAA_WRITE      PPC_BIT(62)
+#define PTE_EAA_EXECUTE    PPC_BIT(63)
+
+/* Field shifts/masks */
+#define PTE_RPN_MASK  0x1fffffffffffUL
+#define PTE_RPN_SHIFT 12UL
+#define PTE_ATT_MASK  0x3UL
+#define PTE_ATT_SHIFT 4UL
+#define PTE_EAA_MASK  0xfUL
+
+#define PTE_XEN_BASE (PTE_VALID | PTE_EAA_PRIVILEGED | PTE_REFERENCE)
+#define PTE_XEN_RW   (PTE_XEN_BASE | PTE_EAA_READ | PTE_EAA_WRITE | PTE_=
CHANGE)
+#define PTE_XEN_RO   (PTE_XEN_BASE | PTE_EAA_READ)
+#define PTE_XEN_RX   (PTE_XEN_BASE | PTE_EAA_READ | PTE_EAA_EXECUTE)
+
+/*
+ * Radix Tree layout for 64KB pages:
+ *
+ * [ L1 (ROOT) PAGE DIRECTORY (8192 * sizeof(pde_t)) ]
+ *                     |
+ *                     |
+ *                     v
+ *    [ L2 PAGE DIRECTORY (512 * sizeof(pde_t)) ]
+ *                     |
+ *                     |
+ *                     v
+ *    [ L3 PAGE DIRECTORY (512 * sizeof(pde_t)) ]
+ *                     |
+ *                     |
+ *                     v
+ *      [ L4 PAGE TABLE (32 * sizeof(pte_t)) ]
+ *                     |
+ *                     |
+ *                     v
+ *            [ PAGE TABLE ENTRY ]
+ */
+
+#define XEN_PT_ENTRIES_LOG2_LVL_1 13 /* 2**13 entries, maps 2**13 * 512G=
B =3D 4PB */
+#define XEN_PT_ENTRIES_LOG2_LVL_2 9  /* 2**9  entries, maps 2**9  * 1GB =
=3D 512GB */
+#define XEN_PT_ENTRIES_LOG2_LVL_3 9  /* 2**9  entries, maps 2**9  * 1GB =
=3D 512GB */
+#define XEN_PT_ENTRIES_LOG2_LVL_4 5  /* 2**5  entries, maps 2**5  * 64K =
=3D 2MB */
+
+#define XEN_PT_SHIFT_LVL_1    (XEN_PT_SHIFT_LVL_2 + XEN_PT_ENTRIES_LOG2_=
LVL_2)
+#define XEN_PT_SHIFT_LVL_2    (XEN_PT_SHIFT_LVL_3 + XEN_PT_ENTRIES_LOG2_=
LVL_3)
+#define XEN_PT_SHIFT_LVL_3    (XEN_PT_SHIFT_LVL_4 + XEN_PT_ENTRIES_LOG2_=
LVL_4)
+#define XEN_PT_SHIFT_LVL_4    PAGE_SHIFT
+
+#define XEN_PT_ENTRIES_LOG2_LVL(lvl) (XEN_PT_ENTRIES_LOG2_LVL_##lvl)
+#define XEN_PT_SHIFT_LVL(lvl)        (XEN_PT_SHIFT_LVL_##lvl)
+#define XEN_PT_ENTRIES_LVL(lvl)      (1UL << XEN_PT_ENTRIES_LOG2_LVL(lvl=
))
+#define XEN_PT_MASK_LVL(lvl)         (XEN_PT_ENTRIES_LVL(lvl) - 1)
+#define XEN_PT_INDEX_LVL(lvl, va)    (((va) >> XEN_PT_SHIFT_LVL(lvl)) & =
XEN_PT_MASK_LVL(lvl))
+
+/*
+ * Calculate the index of the provided virtual address in the provided
+ * page table struct
+ */
+#define pt_index(pt, va) _Generic((pt), \
+    struct lvl1_pd * : XEN_PT_INDEX_LVL(1, (va)), \
+    struct lvl2_pd * : XEN_PT_INDEX_LVL(2, (va)), \
+    struct lvl3_pd * : XEN_PT_INDEX_LVL(3, (va)), \
+    struct lvl4_pt * : XEN_PT_INDEX_LVL(4, (va)))
+
+#define pt_entry(pt, va) (&((pt)->entries[pt_index((pt), (va))]))
+
+typedef struct
+{
+    __be64 pde;
+} pde_t;
+
+typedef struct
+{
+    __be64 pte;
+} pte_t;
+
+struct lvl1_pd
+{
+    pde_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_1];
+};
+
+struct lvl2_pd
+{
+    pde_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_2];
+};
+
+struct lvl3_pd
+{
+    pde_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_3];
+};
+
+struct lvl4_pt
+{
+    pte_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_4];
+};
+
+static inline pte_t paddr_to_pte(paddr_t paddr, unsigned long flags)
+{
+    return (pte_t){ .pte =3D cpu_to_be64(paddr | flags | PTE_LEAF) };
+}
+
+static inline pde_t paddr_to_pde(paddr_t paddr, unsigned long flags, uns=
igned long nls)
+{
+    return (pde_t){ .pde =3D cpu_to_be64(paddr | flags | nls) };
+}
+
+static inline paddr_t pte_to_paddr(pte_t pte)
+{
+    return be64_to_cpu(pte.pte) & (PTE_RPN_MASK << PTE_RPN_SHIFT);
+}
+
+static inline paddr_t pde_to_paddr(pde_t pde)
+{
+    return be64_to_cpu(pde.pde) & (PDE_NLB_MASK << PDE_NLB_SHIFT);
+}
+
+static inline bool pte_is_valid(pte_t pte)
+{
+    return pte.pte & be64_to_cpu(PTE_VALID);
+}
+
+static inline bool pde_is_valid(pde_t pde)
+{
+    return pde.pde & be64_to_cpu(PDE_VALID);
+}
+
+/*
+ * ISA 3.0 partition and process table entry format
+ */
+struct patb_entry {
+	__be64 patb0;
+	__be64 patb1;
+};
+#define PATB0_HR PPC_BIT(0) /* host uses radix */
+#define PATB1_GR PPC_BIT(0) /* guest uses radix; must match HR */
+
+struct prtb_entry {
+	__be64 prtb0;
+	__be64 reserved;
+};
+
+/*
+ * We support 52 bits, hence:
+ * bits 52 - 31 =3D 21, 0b10101
+ * RTS encoding details
+ * bits 0 - 3 of rts -> bits 6 - 8 unsigned long
+ * bits 4 - 5 of rts -> bits 62 - 63 of unsigned long
+ */
+#define RTS_FIELD ((0x2UL << 61) | (0x5UL << 5))
+
+void tlbie_all(void);
+
+#endif /* _ASM_PPC_PAGE_H */
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/=
asm/processor.h
index 2300640787..6b70569eb8 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -133,6 +133,40 @@ struct cpu_user_regs
     uint32_t entry_vector;
 };

+static __inline__ void sync(void)
+{
+    asm volatile ( "sync" );
+}
+
+static __inline__ void isync(void)
+{
+    asm volatile ( "isync" );
+}
+
+static inline unsigned long mfmsr(void)
+{
+    unsigned long msr;
+    asm volatile ( "mfmsr %0" : "=3Dr" (msr) );
+    return msr;
+}
+
+static inline void mtmsrd(unsigned long msr)
+{
+    asm volatile ( "mtmsrd %0" : : "r" (msr) );
+}
+
+static inline void mtspr(uint16_t spr, unsigned long val)
+{
+    asm volatile ( "mtspr %0, %1" : : "K" (spr), "r" (val) );
+}
+
+static inline unsigned long mfspr(uint16_t spr)
+{
+    unsigned long val;
+    asm volatile ( "mfspr %0, %1" : "=3Dr" (val) : "K" (spr) );
+    return val;
+}
+
 /*
  * panic() isn't available at the moment so an infinite loop will be
  * used temporarily.
diff --git a/xen/arch/ppc/include/asm/regs.h b/xen/arch/ppc/include/asm/r=
egs.h
new file mode 100644
index 0000000000..d5f47a6ff1
--- /dev/null
+++ b/xen/arch/ppc/include/asm/regs.h
@@ -0,0 +1,138 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, =
USA.
+ *
+ * Copyright IBM Corp. 2005, 2007
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ *          Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
+ */
+
+#ifndef _ASM_REG_DEFS_H_
+#define _ASM_REG_DEFS_H_
+
+/* Special Purpose Registers */
+#define SPRN_VRSAVE 256
+#define SPRN_DSISR  18
+#define SPRN_DAR    19
+#define SPRN_DEC    22
+#define SPRN_SRR0   26
+#define SPRN_SRR1   27
+#define SPRN_TBRL   268
+#define SPRN_TBRU   269
+#define SPRN_SPRG0  272
+#define SPRN_SPRG1  273
+#define SPRN_SPRG2  274
+#define SPRN_SPRG3  275
+#define SPRN_TBWL   284
+#define SPRN_TBWU   285
+
+#define SPRN_HSPRG0 304
+#define SPRN_HSPRG1 305
+#define SPRN_HDEC   310
+#define SPRN_HIOR   311
+#define SPRN_RMOR   312
+#define SPRN_HRMOR  313
+#define SPRN_HSRR0  314
+#define SPRN_HSRR1  315
+#define SPRN_LPIDR  319
+
+#define SPRN_PTCR	0x1D0	/* Partition table control Register */
+#define SPRN_PID	0x030	/* Process ID */
+
+/* Performance monitor spr encodings */
+#define SPRN_MMCRA  786
+#define   MMCRA_SAMPHV    _AC(0x10000000, UL) /* state of MSR HV when SI=
AR set */
+#define   MMCRA_SAMPPR    _AC(0x08000000, UL) /* state of MSR PR when SI=
AR set */
+#define   MMCRA_SAMPLE_ENABLE _AC(0x00000001, UL) /* enable sampling */
+#define NUM_PMCS 8
+#define SPRN_PMC1   787
+#define SPRN_PMC2   788
+#define SPRN_PMC3   789
+#define SPRN_PMC4   790
+#define SPRN_PMC5   791
+#define SPRN_PMC6   792
+#define SPRN_PMC7   793
+#define SPRN_PMC8   794
+#define SPRN_MMCR0  795
+#define   MMCR0_FC      _AC(0x80000000, UL) /* freeze counters */
+#define   MMCR0_FCS     _AC(0x40000000, UL) /* freeze in supervisor stat=
e */
+#define   MMCR0_FCP     _AC(0x20000000, UL) /* freeze in problem state *=
/
+#define   MMCR0_FCM1    _AC(0x10000000, UL) /* freeze counters while MSR=
 mark =3D 1 */
+#define   MMCR0_FCM0    _AC(0x08000000, UL) /* freeze counters while MSR=
 mark =3D 0 */
+#define   MMCR0_PMAE    _AC(0x04000000, UL) /* performance monitor alert=
 enabled */
+#define   MMCR0_PMAO    _AC(0x00000080, UL) /* performance monitor alert=
 occurred */
+#define   MMCR0_FCH     _AC(0x00000001, UL) /* freeze conditions in hype=
rvisor */
+#define SPRN_SIAR   796
+#define SPRN_SDAR   797
+#define SPRN_MMCR1  798
+
+/* As defined for PU G4 */
+#define SPRN_HID0   1008
+#define SPRN_HID1   1009
+#define SPRN_HID4   1012
+
+#define SPRN_DABR   1013
+#define SPRN_HID5   1014
+#define SPRN_DABRX  1015
+#define SPRN_HID6   1017
+#define SPRN_HID7   1018
+#define SPRN_HID8   1019
+#define SPRN_PIR    1023
+
+#define SPRN_LPCR	0x13E	/* LPAR Control Register */
+#define   LPCR_VPM0		_AC(0x8000000000000000, UL)
+#define   LPCR_VPM1		_AC(0x4000000000000000, UL)
+#define   LPCR_ISL		_AC(0x2000000000000000, UL)
+#define   LPCR_VC_SH		61
+#define   LPCR_DPFD_SH		52
+#define   LPCR_DPFD		(_AC(7, UL) << LPCR_DPFD_SH)
+#define   LPCR_VRMASD_SH	47
+#define   LPCR_VRMASD		(_AC(0x1f, UL) << LPCR_VRMASD_SH)
+#define   LPCR_VRMA_L		_AC(0x0008000000000000, UL)
+#define   LPCR_VRMA_LP0		_AC(0x0001000000000000, UL)
+#define   LPCR_VRMA_LP1		_AC(0x0000800000000000, UL)
+#define   LPCR_RMLS		0x1C000000	/* Implementation dependent RMO limit se=
l */
+#define   LPCR_RMLS_SH		26
+#define   LPCR_HAIL		_AC(0x0000000004000000, UL)   /* HV AIL (ISAv3.1) *=
/
+#define   LPCR_ILE		_AC(0x0000000002000000, UL)   /* !HV irqs set MSR:LE=
 */
+#define   LPCR_AIL		_AC(0x0000000001800000, UL)	/* Alternate interrupt l=
ocation */
+#define   LPCR_AIL_0		_AC(0x0000000000000000, UL)	/* MMU off exception o=
ffset 0x0 */
+#define   LPCR_AIL_3		_AC(0x0000000001800000, UL)   /* MMU on exception =
offset 0xc00...4xxx */
+#define   LPCR_ONL		_AC(0x0000000000040000, UL)	/* online - PURR/SPURR c=
ount */
+#define   LPCR_LD		_AC(0x0000000000020000, UL)	/* large decremeter */
+#define   LPCR_PECE		_AC(0x000000000001f000, UL)	/* powersave exit cause=
 enable */
+#define     LPCR_PECEDP	_AC(0x0000000000010000, UL)	/* directed priv dbe=
lls cause exit */
+#define     LPCR_PECEDH	_AC(0x0000000000008000, UL)	/* directed hyp dbel=
ls cause exit */
+#define     LPCR_PECE0		_AC(0x0000000000004000, UL)	/* ext. exceptions c=
an cause exit */
+#define     LPCR_PECE1		_AC(0x0000000000002000, UL)	/* decrementer can c=
ause exit */
+#define     LPCR_PECE2		_AC(0x0000000000001000, UL)	/* machine check etc=
 can cause exit */
+#define     LPCR_PECE_HVEE	_AC(0x0000400000000000, UL)	/* P9 Wakeup on H=
V interrupts */
+#define   LPCR_MER		_AC(0x0000000000000800, UL)	/* Mediated External Exc=
eption */
+#define   LPCR_MER_SH		11
+#define	  LPCR_GTSE		_AC(0x0000000000000400, UL)  	/* Guest Translation =
Shootdown Enable */
+#define   LPCR_TC		_AC(0x0000000000000200, UL)	/* Translation control */
+#define   LPCR_HEIC		_AC(0x0000000000000010, UL)   /* Hypervisor Externa=
l Interrupt Control */
+#define   LPCR_LPES		0x0000000c
+#define   LPCR_LPES0		_AC(0x0000000000000008, UL)      /* LPAR Env selec=
tor 0 */
+#define   LPCR_LPES1		_AC(0x0000000000000004, UL)      /* LPAR Env selec=
tor 1 */
+#define   LPCR_LPES_SH		2
+#define   LPCR_RMI		_AC(0x0000000000000002, UL)      /* real mode is cac=
he inhibit */
+#define   LPCR_HVICE		_AC(0x0000000000000002, UL)      /* P9: HV interru=
pt enable */
+#define   LPCR_HDICE		_AC(0x0000000000000001, UL)      /* Hyp Decr enabl=
e (HV,PR,EE) */
+#define   LPCR_UPRT		_AC(0x0000000000400000, UL)      /* Use Process Tab=
le (ISA 3) */
+#define   LPCR_HR		_AC(0x0000000000100000, UL)
+
+#endif /* _ASM_REG_DEFS_H_ */
diff --git a/xen/arch/ppc/include/asm/types.h b/xen/arch/ppc/include/asm/=
types.h
index b62ae0e7ae..ffaf378a4d 100644
--- a/xen/arch/ppc/include/asm/types.h
+++ b/xen/arch/ppc/include/asm/types.h
@@ -4,6 +4,7 @@
 #define _ASM_PPC_TYPES_H

 typedef unsigned long paddr_t;
+typedef unsigned long vaddr_t;
 #define INVALID_PADDR (~0UL)
 #define PRIpaddr "016lx"

diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
new file mode 100644
index 0000000000..a86cd2f73b
--- /dev/null
+++ b/xen/arch/ppc/mm-radix.c
@@ -0,0 +1,268 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/init.h>
+#include <xen/kernel.h>
+#include <xen/types.h>
+#include <xen/lib.h>
+
+#include <asm/bitops.h>
+#include <asm/byteorder.h>
+#include <asm/early_printk.h>
+#include <asm/mm.h>
+#include <asm/page.h>
+#include <asm/processor.h>
+#include <asm/regs.h>
+#include <asm/msr.h>
+
+void enable_mmu(void);
+
+#define INITIAL_LVL1_PD_COUNT      1
+#define INITIAL_LVL2_LVL3_PD_COUNT 2
+#define INITIAL_LVL4_PT_COUNT      256
+
+static size_t initial_lvl1_pd_pool_used;
+static struct lvl1_pd __aligned(sizeof(struct lvl1_pd))
+initial_lvl1_pd_pool[INITIAL_LVL1_PD_COUNT];
+
+static size_t initial_lvl2_lvl3_pd_pool_used;
+static struct lvl2_pd __aligned(sizeof(struct lvl2_pd))
+initial_lvl2_lvl3_pd_pool[INITIAL_LVL2_LVL3_PD_COUNT];
+
+static size_t initial_lvl4_pt_pool_used;
+static struct lvl4_pt __aligned(sizeof(struct lvl4_pt))
+initial_lvl4_pt_pool[INITIAL_LVL4_PT_COUNT];
+
+/* Only reserve minimum Partition and Process tables  */
+#define PATB_SIZE_LOG2 16 /* Only supported partition table size on POWE=
R9 */
+#define PATB_SIZE      (1UL << PATB_SIZE_LOG2)
+#define PRTB_SIZE_LOG2 12
+#define PRTB_SIZE      (1UL << PRTB_SIZE_LOG2)
+
+static struct patb_entry
+    __aligned(PATB_SIZE) initial_patb[PATB_SIZE / sizeof(struct patb_ent=
ry)];
+
+static struct prtb_entry
+    __aligned(PRTB_SIZE) initial_prtb[PRTB_SIZE / sizeof(struct prtb_ent=
ry)];
+
+static __init struct lvl1_pd *lvl1_pd_pool_alloc(void)
+{
+    if ( initial_lvl1_pd_pool_used >=3D INITIAL_LVL1_PD_COUNT )
+    {
+        early_printk("Ran out of space for LVL1 PD!\n");
+        die();
+    }
+
+    return &initial_lvl1_pd_pool[initial_lvl1_pd_pool_used++];
+}
+
+static __init struct lvl2_pd *lvl2_pd_pool_alloc(void)
+{
+    if ( initial_lvl2_lvl3_pd_pool_used >=3D INITIAL_LVL2_LVL3_PD_COUNT =
)
+    {
+        early_printk("Ran out of space for LVL2/3 PD!\n");
+        die();
+    }
+
+    return &initial_lvl2_lvl3_pd_pool[initial_lvl2_lvl3_pd_pool_used++];
+}
+
+static __init struct lvl3_pd *lvl3_pd_pool_alloc(void)
+{
+    BUILD_BUG_ON(sizeof(struct lvl3_pd) !=3D sizeof(struct lvl2_pd));
+
+    return (struct lvl3_pd *) lvl2_pd_pool_alloc();
+}
+
+static __init struct lvl4_pt *lvl4_pt_pool_alloc(void)
+{
+    if ( initial_lvl4_pt_pool_used >=3D INITIAL_LVL4_PT_COUNT )
+    {
+        early_printk("Ran out of space for LVL4 PT!\n");
+        die();
+    }
+
+    return &initial_lvl4_pt_pool[initial_lvl4_pt_pool_used++];
+}
+
+#ifndef NDEBUG
+/* TODO: Remove once we get common/ building */
+static char *__init itoa64_hex(uint64_t val, char *out_buf, size_t buf_l=
en)
+{
+    uint64_t cur;
+    size_t i =3D buf_len - 1;
+
+    /* Null terminate buffer */
+    out_buf[i] =3D '\0';
+
+    /* Add digits in reverse */
+    cur =3D val;
+    while ( cur && i > 0 )
+    {
+        out_buf[--i] =3D "0123456789ABCDEF"[cur % 16];
+        cur /=3D 16;
+    }
+
+    /* Pad to 16 digits */
+    while ( i > 0 )
+        out_buf[--i] =3D '0';
+
+    return out_buf + i;
+}
+#endif
+
+static void __init radix_dprint(uint64_t addr, const char *msg)
+{
+#ifndef NDEBUG
+    char buf[sizeof("DEADBEEFCAFEBABA")];
+    char *addr_s =3D itoa64_hex(addr, buf, sizeof(buf));
+
+    early_printk("(0x");
+    early_printk(addr_s);
+    early_printk(") ");
+    early_printk(msg);
+#endif
+}
+
+static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
+                                         vaddr_t map_start,
+                                         vaddr_t map_end,
+                                         paddr_t phys_base)
+{
+    uint64_t page_addr;
+
+    if ( map_start & ~PAGE_MASK )
+    {
+        early_printk("Xen _start be aligned to 64k (PAGE_SIZE) boundary\=
n");
+        die();
+    }
+
+    if ( phys_base & ~PAGE_MASK )
+    {
+        early_printk("Xen should be loaded at 64k (PAGE_SIZE) boundary\n=
");
+        die();
+    }
+
+    for ( page_addr =3D map_start; page_addr < map_end; page_addr +=3D P=
AGE_SIZE )
+    {
+        struct lvl2_pd *lvl2;
+        struct lvl3_pd *lvl3;
+        struct lvl4_pt *lvl4;
+        pde_t *pde;
+        pte_t *pte;
+
+        /* Allocate LVL 2 PD if necessary */
+        pde =3D pt_entry(lvl1, page_addr);
+        if ( !pde_is_valid(*pde) )
+        {
+            lvl2 =3D lvl2_pd_pool_alloc();
+            *pde =3D paddr_to_pde(__pa(lvl2), PDE_VALID,
+                                XEN_PT_ENTRIES_LOG2_LVL_2);
+        }
+        else
+            lvl2 =3D (struct lvl2_pd *)__va(pde_to_paddr(*pde));
+
+        /* Allocate LVL 3 PD if necessary */
+        pde =3D pt_entry(lvl2, page_addr);
+        if ( !pde_is_valid(*pde) )
+        {
+            lvl3 =3D lvl3_pd_pool_alloc();
+            *pde =3D paddr_to_pde(__pa(lvl3), PDE_VALID,
+                                XEN_PT_ENTRIES_LOG2_LVL_3);
+        }
+        else
+            lvl3 =3D (struct lvl3_pd *)__va(pde_to_paddr(*pde));
+
+        /* Allocate LVL 4 PT if necessary */
+        pde =3D pt_entry(lvl3, page_addr);
+        if ( !pde_is_valid(*pde) )
+        {
+            lvl4 =3D lvl4_pt_pool_alloc();
+            *pde =3D paddr_to_pde(__pa(lvl4), PDE_VALID,
+                                XEN_PT_ENTRIES_LOG2_LVL_4);
+        }
+        else
+            lvl4 =3D (struct lvl4_pt *)__va(pde_to_paddr(*pde));
+
+        /* Finally, create PTE in LVL 4 PT */
+        pte =3D pt_entry(lvl4, page_addr);
+        if ( !pte_is_valid(*pte) )
+        {
+            unsigned long paddr =3D (page_addr - map_start) + phys_base;
+            unsigned long flags;
+
+            radix_dprint(paddr, "being mapped to ");
+            radix_dprint(page_addr, "!\n");
+            if ( is_kernel_text(page_addr) || is_kernel_inittext(page_ad=
dr) )
+            {
+                radix_dprint(page_addr, "being marked as TEXT (RX)\n");
+                flags =3D PTE_XEN_RX;
+            }
+            else if ( is_kernel_rodata(page_addr) )
+            {
+                radix_dprint(page_addr, "being marked as RODATA (RO)\n")=
;
+                flags =3D PTE_XEN_RO;
+            }
+            else
+            {
+                radix_dprint(page_addr, "being marked as DEFAULT (RW)\n"=
);
+                flags =3D PTE_XEN_RW;
+            }
+
+            *pte =3D paddr_to_pte(paddr, flags);
+            radix_dprint(paddr_to_pte(paddr, flags).pte,
+                             "is result of PTE map!\n");
+        }
+        else
+        {
+            early_printk("BUG: Tried to create PTE for already-mapped pa=
ge!");
+            die();
+        }
+    }
+}
+
+static void __init setup_partition_table(struct lvl1_pd *root)
+{
+    unsigned long ptcr;
+
+    /* Configure entry for LPID 0 to enable Radix and point to root PD *=
/
+    uint64_t patb0 =3D RTS_FIELD | __pa(root) | XEN_PT_ENTRIES_LOG2_LVL_=
1 |
+                     PATB0_HR;
+    uint64_t patb1 =3D __pa(initial_prtb) | (PRTB_SIZE_LOG2 - 12) | PATB=
1_GR;
+    initial_patb[0].patb0 =3D cpu_to_be64(patb0);
+    initial_patb[0].patb1 =3D cpu_to_be64(patb1);
+
+    ptcr =3D __pa(initial_patb) | (PATB_SIZE_LOG2 - 12);
+    mtspr(SPRN_PTCR, ptcr);
+}
+
+static void __init setup_process_table(struct lvl1_pd *root)
+{
+    /* Configure entry for PID 0 to point to root PD */
+    uint64_t prtb0 =3D RTS_FIELD | __pa(root) | XEN_PT_ENTRIES_LOG2_LVL_=
1;
+    initial_prtb[0].prtb0 =3D cpu_to_be64(prtb0);
+}
+
+void __init setup_initial_pagetables(void)
+{
+    struct lvl1_pd *root =3D lvl1_pd_pool_alloc();
+    unsigned long lpcr;
+
+    setup_initial_mapping(root, (vaddr_t)_start, (vaddr_t)_end, __pa(_st=
art));
+
+    /* Enable Radix mode in LPCR */
+    lpcr =3D mfspr(SPRN_LPCR);
+    mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
+    early_printk("Enabled radix in LPCR\n");
+
+    /* Set up initial process table */
+    setup_process_table(root);
+
+    /* Set up initial partition table */
+    setup_partition_table(root);
+
+    /* Flush TLB */
+    tlbie_all();
+    early_printk("Flushed TLB\n");
+
+    /* Turn on the MMU */
+    enable_mmu();
+}
diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
index d91bd7f92d..1352bb5850 100644
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -2,6 +2,7 @@

 #include <asm/asm-defns.h>
 #include <asm/asm-offsets.h>
+#include <asm/msr.h>

     .section .text.header, "ax", %progbits

@@ -66,3 +67,17 @@ ENTRY(start)

     .size start, . - start
     .type start, %function
+
+ENTRY(enable_mmu)
+    mflr %r3
+    mfmsr %r4
+
+    /* enable instruction and data relocation (MMU) */
+    ori %r4, %r4, (MSR_IR | MSR_DR)
+
+    mtsrr0 %r3 /* return to caller after MMU enable */
+    mtsrr1 %r4
+    rfid
+
+    .size enable_mmu, . - enable_mmu
+    .type enable_mmu, %function
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 8ab7bc19ee..0106e9c9da 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -2,6 +2,7 @@
 #include <xen/init.h>
 #include <asm/boot.h>
 #include <asm/early_printk.h>
+#include <asm/mm.h>
 #include <asm/processor.h>

 /* Xen stack for bringing up the first CPU. */
@@ -27,6 +28,8 @@ void __init noreturn start_xen(unsigned long r3, unsign=
ed long r4,
         boot_opal_init((void *)r3);
     }

+    setup_initial_pagetables();
+
     early_printk("Hello, ppc64le!\n");

     for ( ; ; )
diff --git a/xen/arch/ppc/tlb-radix.c b/xen/arch/ppc/tlb-radix.c
new file mode 100644
index 0000000000..e9115ba2db
--- /dev/null
+++ b/xen/arch/ppc/tlb-radix.c
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Based on arch/powerpc/mm/book3s64/radix_tlb.c from Linux with the fol=
lowing
+ * copyright notice:
+ *
+ * Copyright 2015-2016, Aneesh Kumar K.V, IBM Corporation.
+ */
+#include <xen/stringify.h>
+
+#include <asm/bitops.h>
+#include <asm/msr.h>
+#include <asm/processor.h>
+
+/* TLB flush actions. Used as argument to tlbiel_flush() */
+enum
+{
+    TLB_INVAL_SCOPE_LPID,   /* invalidate TLBs for current LPID */
+    TLB_INVAL_SCOPE_GLOBAL, /* invalidate all TLBs */
+};
+
+#define POWER9_TLB_SETS_RADIX 128 /* # sets in POWER9 TLB Radix mode */
+
+#define RIC_FLUSH_TLB 0
+#define RIC_FLUSH_PWC 1
+#define RIC_FLUSH_ALL 2
+
+static void tlbiel_radix_set_isa300(unsigned int set, unsigned int is,
+                                    unsigned int pid, unsigned int ric,
+                                    unsigned int prs)
+{
+    unsigned long rb;
+    unsigned long rs;
+
+    rb =3D (set << PPC_BITLSHIFT(51)) | (is << PPC_BITLSHIFT(53));
+    rs =3D ((unsigned long) pid << PPC_BITLSHIFT(31));
+
+    asm volatile ( "tlbiel %0, %1, %2, %3, 1"
+                   :: "r" (rb), "r" (rs), "i" (ric), "i" (prs)
+                   : "memory" );
+}
+
+static void tlbiel_all_isa300(unsigned int num_sets, unsigned int is)
+{
+    unsigned int set;
+
+    asm volatile ( "ptesync" : : : "memory" );
+
+    /*
+     * Flush the first set of the TLB, and the entire Page Walk Cache
+     * and partition table entries. Then flush the remaining sets of the
+     * TLB.
+     */
+
+    if ( mfmsr() & MSR_HV )
+    {
+        /* MSR[HV] should flush partition scope translations first. */
+        tlbiel_radix_set_isa300(0, is, 0, RIC_FLUSH_ALL, 0);
+
+        for ( set =3D 1; set < num_sets; set++ )
+            tlbiel_radix_set_isa300(set, is, 0, RIC_FLUSH_TLB, 0);
+    }
+
+    /* Flush process scoped entries. */
+    tlbiel_radix_set_isa300(0, is, 0, RIC_FLUSH_ALL, 1);
+
+    for ( set =3D 1; set < num_sets; set++ )
+        tlbiel_radix_set_isa300(set, is, 0, RIC_FLUSH_TLB, 1);
+
+    asm volatile ( "ptesync" : : : "memory" );
+}
+
+void radix__tlbiel_all(unsigned int action)
+{
+    unsigned int is;
+
+    switch ( action )
+    {
+    case TLB_INVAL_SCOPE_GLOBAL:
+        is =3D 3;
+        break;
+    case TLB_INVAL_SCOPE_LPID:
+        is =3D 2;
+        break;
+    default:
+        die();
+    }
+
+    tlbiel_all_isa300(POWER9_TLB_SETS_RADIX, is);
+
+    asm volatile ( "slbia 7; isync" : : : "memory" );
+}
+
+void tlbie_all(void)
+{
+    radix__tlbiel_all(TLB_INVAL_SCOPE_GLOBAL);
+}
--
2.30.2


