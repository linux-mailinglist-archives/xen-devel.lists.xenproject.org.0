Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27FC7D7822
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 00:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623372.971200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmZ8-0000Bd-Q1; Wed, 25 Oct 2023 22:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623372.971200; Wed, 25 Oct 2023 22:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmZ8-0008UJ-Lc; Wed, 25 Oct 2023 22:41:30 +0000
Received: by outflank-mailman (input) for mailman id 623372;
 Wed, 25 Oct 2023 22:41:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm7K=GH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qvmZ7-0008LH-Rq
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 22:41:29 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1fbf1d8-7387-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 00:41:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A874582857E5;
 Wed, 25 Oct 2023 17:41:26 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5uj40imSKiaj; Wed, 25 Oct 2023 17:41:24 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8D1838285AFA;
 Wed, 25 Oct 2023 17:41:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AGct8azOHlj8; Wed, 25 Oct 2023 17:41:24 -0500 (CDT)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 20BC08285AB8;
 Wed, 25 Oct 2023 17:41:24 -0500 (CDT)
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
X-Inumbo-ID: a1fbf1d8-7387-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8D1838285AFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1698273684; bh=askIAUvrnNxM300C2WKkQJuD2UHz6pYYs2K9R4SJJTQ=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=F5sPMOCrf5F2DNjCgDk5QSCpkqdXfI9pbecR/MIbjShJCpVWMw84ZHhumEVtwLnHu
	 mRJmANIxQJiicBWkngCw8wp3DcTjbOyIv4bTEE9WLygc3CQW/WzEi3RMbtQDvj7ZSn
	 nU59Bvjf5I0yVaIsWHdu0IXKfGc9ydsS5uIK0ZwA=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 2/2] xen/ppc: Implement a basic exception handler
Date: Wed, 25 Oct 2023 17:41:04 -0500
Message-Id: <1d875c978caa4ed0b3d038655a39aa0cb0583565.1698273423.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1698273423.git.sanastasio@raptorengineering.com>
References: <cover.1698273423.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Implement a basic exception handler that dumps the CPU state to the
console, as well as the code required to set the correct exception
vector table's base address in setup.c.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v3:
  - Add comment to explain %r1 clobber
  - Add comment about ISR declaration order
  - Drop redundant " Interrupt" from exception name strings

v2:
  - Place {h_,}exception_common in .text.exceptions section
  - Use assembler macro instead of CPP macro for ISR definition
  - Tabulate ISR definitions

 xen/arch/ppc/include/asm/processor.h |  31 +++++++
 xen/arch/ppc/ppc64/Makefile          |   2 +
 xen/arch/ppc/ppc64/asm-offsets.c     |   1 +
 xen/arch/ppc/ppc64/exceptions-asm.S  | 129 +++++++++++++++++++++++++++
 xen/arch/ppc/ppc64/exceptions.c      | 102 +++++++++++++++++++++
 xen/arch/ppc/setup.c                 |  11 +++
 6 files changed, 276 insertions(+)
 create mode 100644 xen/arch/ppc/ppc64/exceptions-asm.S
 create mode 100644 xen/arch/ppc/ppc64/exceptions.c

diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
index d3dd943c20..a01b62b8a4 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -103,6 +103,37 @@
 #define PVR_BE        0x0070
 #define PVR_PA6T      0x0090

+/* Exception Definitions */
+#define EXC_SYSTEM_RESET    0x0100 /* System Reset Interrupt */
+#define EXC_MACHINE_CHECK   0x0200 /* Machine Check Interrupt */
+#define EXC_DATA_STORAGE    0x0300 /* Data Storage Interrupt */
+#define EXC_DATA_SEGMENT    0x0380 /* Data Segment Interrupt */
+#define EXC_INSN_STORAGE    0x0400 /* Instruction Storage Interrupt */
+#define EXC_INSN_SEGMENT    0x0480 /* Instruction Segment Interrupt */
+#define EXC_EXTERNAL        0x0500 /* External Interrupt */
+#define EXC_ALIGNMENT       0x0600 /* Alignment Interrupt */
+#define EXC_PROGRAM         0x0700 /* Program Interrupt */
+#define EXC_FPU_UNAVAIL     0x0800 /* Floating-Point Unavailable Interrupt */
+#define EXC_DECREMENTER     0x0900 /* Decrementer Interrupt */
+#define EXC_H_DECREMENTER   0x0980 /* Hypervisor Decrementer Interrupt */
+#define EXC_PRIV_DOORBELL   0x0A00 /* Directed Privileged Doorbell Interrupt */
+#define EXC_SYSTEM_CALL     0x0C00 /* System Call Interrupt */
+#define EXC_TRACE           0x0D00 /* Trace Interrupt */
+#define EXC_H_DATA_STORAGE  0x0E00 /* Hypervisor Data Storage Interrupt */
+#define EXC_H_INSN_STORAGE  0x0E20 /* Hypervisor Instruction Storage Interrupt */
+#define EXC_H_EMUL_ASST     0x0E40 /* Hypervisor Emulation Assistance Interrupt */
+#define EXC_H_MAINTENANCE   0x0E60 /* Hypervisor Maintenance Interrupt */
+#define EXC_H_DOORBELL      0x0E80 /* Directed Hypervisor Doorbell Interrupt */
+#define EXC_H_VIRT          0x0EA0 /* Hypervisor Virtualization Interrupt */
+#define EXC_PERF_MON        0x0F00 /* Performance Monitor Interrupt */
+#define EXC_VECTOR_UNAVAIL  0x0F20 /* Vector Unavailable Interrupt */
+#define EXC_VSX_UNAVAIL     0x0F40 /* VSX Unavailable Interrupt */
+#define EXC_FACIL_UNAVAIL   0x0F60 /* Facility Unavailable Interrupt */
+#define EXC_H_FACIL_UNAVAIL 0x0F80 /* Hypervisor Facility Unavailable Interrupt */
+
+/* Base address of interrupt vector table when LPCR[AIL]=3 */
+#define AIL_VECTOR_BASE _AC(0xc000000000004000, UL)
+
 #ifndef __ASSEMBLY__

 #include <xen/types.h>
diff --git a/xen/arch/ppc/ppc64/Makefile b/xen/arch/ppc/ppc64/Makefile
index 5b88355bb2..914bb21c40 100644
--- a/xen/arch/ppc/ppc64/Makefile
+++ b/xen/arch/ppc/ppc64/Makefile
@@ -1,2 +1,4 @@
+obj-y += exceptions.o
+obj-y += exceptions-asm.o
 obj-y += head.o
 obj-y += opal-calls.o
diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-offsets.c
index c15c1bf136..634d7260e3 100644
--- a/xen/arch/ppc/ppc64/asm-offsets.c
+++ b/xen/arch/ppc/ppc64/asm-offsets.c
@@ -46,6 +46,7 @@ void __dummy__(void)
     OFFSET(UREGS_dsisr, struct cpu_user_regs, dsisr);
     OFFSET(UREGS_cr, struct cpu_user_regs, cr);
     OFFSET(UREGS_fpscr, struct cpu_user_regs, fpscr);
+    OFFSET(UREGS_entry_vector, struct cpu_user_regs, entry_vector);
     DEFINE(UREGS_sizeof, sizeof(struct cpu_user_regs));

     OFFSET(OPAL_base, struct opal, base);
diff --git a/xen/arch/ppc/ppc64/exceptions-asm.S b/xen/arch/ppc/ppc64/exceptions-asm.S
new file mode 100644
index 0000000000..f1b14bb860
--- /dev/null
+++ b/xen/arch/ppc/ppc64/exceptions-asm.S
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <asm/asm-defns.h>
+#include <asm/processor.h>
+
+    .section .text.exceptions, "ax", %progbits
+
+    /* Helper to dump CPU state to struct cpu_user_regs pointed to by r1. */
+ENTRY(exception_common)
+    /*
+     * Save GPRs 1-31. TODO: The value of %r1 has already been modified by the
+     * ISR, so the value we save isn't the exact value we had on entry.
+     */
+    SAVE_GPRS(1, 31, %r1)
+
+    /* Save LR, CTR, CR */
+    mflr    %r0
+    std     %r0, UREGS_lr(%r1)
+    mfctr   %r0
+    std     %r0, UREGS_ctr(%r1)
+    mfcr    %r0
+    stw     %r0, UREGS_cr(%r1) /* 32-bit */
+
+    /* Save Exception Registers */
+    mfsrr0  %r0
+    std     %r0, UREGS_pc(%r1)
+    mfsrr1  %r0
+    std     %r0, UREGS_msr(%r1)
+    mfdsisr %r0
+    stw     %r0, UREGS_dsisr(%r1) /* 32-bit */
+    mfdar   %r0
+    std     %r0, UREGS_dar(%r1)
+    li      %r0, -1 /* OS's SRR0/SRR1 have been clobbered */
+    std     %r0, UREGS_srr0(%r1)
+    std     %r0, UREGS_srr1(%r1)
+
+    /* Setup TOC and a stack frame then call C exception handler */
+    mr      %r3, %r1
+    bcl     20, 31, 1f
+1:  mflr    %r12
+    addis   %r2, %r12, .TOC.-1b@ha
+    addi    %r2, %r2, .TOC.-1b@l
+
+    li      %r0, 0
+    stdu    %r0, -STACK_FRAME_OVERHEAD(%r1)
+    bl      exception_handler
+
+    .size exception_common, . - exception_common
+    .type exception_common, %function
+
+    /* Same as exception_common, but for exceptions that set HSRR{0,1} */
+ENTRY(h_exception_common)
+    /* Save GPRs 1-31 */
+    SAVE_GPRS(1, 31, %r1)
+
+    /* Save LR, CTR, CR */
+    mflr    %r0
+    std     %r0, UREGS_lr(%r1)
+    mfctr   %r0
+    std     %r0, UREGS_ctr(%r1)
+    mfcr    %r0
+    stw     %r0, UREGS_cr(%r1) /* 32-bit */
+
+    /* Save Exception Registers */
+    mfhsrr0 %r0
+    std     %r0, UREGS_pc(%r1)
+    mfhsrr1 %r0
+    std     %r0, UREGS_msr(%r1)
+    mfsrr0  %r0
+    std     %r0, UREGS_srr0(%r1)
+    mfsrr1  %r0
+    std     %r0, UREGS_srr1(%r1)
+    mfdsisr %r0
+    stw     %r0, UREGS_dsisr(%r1) /* 32-bit */
+    mfdar   %r0
+    std     %r0, UREGS_dar(%r1)
+
+    /* Setup TOC and a stack frame then call C exception handler */
+    mr      %r3, %r1
+    bcl     20, 31, 1f
+1:  mflr    %r12
+    addis   %r2, %r12, .TOC.-1b@ha
+    addi    %r2, %r2, .TOC.-1b@l
+
+    li      %r0, 0
+    stdu    %r0, -STACK_FRAME_OVERHEAD(%r1)
+    bl      exception_handler
+
+    .size h_exception_common, . - h_exception_common
+    .type h_exception_common, %function
+
+/*
+ * Declare an ISR for the provided exception that jumps to the specified handler
+ */
+.macro ISR name, exc, handler
+    . = (AIL_VECTOR_BASE - EXCEPTION_VECTORS_START) + \exc
+    ENTRY(\name)
+    /* TODO: switch stack */
+
+    /* Reserve space for struct cpu_user_regs */
+    subi    %r1, %r1, UREGS_sizeof
+
+    /* Save r0 immediately so we can use it as scratch space */
+    SAVE_GPR(0, %r1)
+
+    /* Save exception vector number */
+    li      %r0, \exc
+    std     %r0, UREGS_entry_vector(%r1)
+
+    /* Branch to common code */
+    b       \handler
+
+    .size \name, . - \name
+    .type \name, %function
+.endm
+
+/*
+ * Define all ISRs. Note: These must be declared in order from lowest exception
+ * vector to highest to satisfy the assembler.
+ */
+ISR exc_sysreset,   EXC_SYSTEM_RESET,   exception_common
+ISR exc_mcheck,     EXC_MACHINE_CHECK,  exception_common
+ISR exc_dstore,     EXC_DATA_STORAGE,   exception_common
+ISR exc_dsegment,   EXC_DATA_SEGMENT,   exception_common
+ISR exc_istore,     EXC_INSN_STORAGE,   exception_common
+ISR exc_isegment,   EXC_INSN_SEGMENT,   exception_common
+ISR exc_extern,     EXC_EXTERNAL,       exception_common
+ISR exc_align,      EXC_ALIGNMENT,      exception_common
+ISR exc_program,    EXC_PROGRAM,        exception_common
+ISR exc_fpu,        EXC_FPU_UNAVAIL,    exception_common
+ISR exc_dec,        EXC_DECREMENTER,    exception_common
+ISR exc_h_dec,      EXC_H_DECREMENTER,  h_exception_common
+/* EXC_PRIV_DOORBELL ... EXC_TRACE */
+ISR exc_h_dstore,   EXC_H_DATA_STORAGE, h_exception_common
+ISR exc_h_istore,   EXC_H_INSN_STORAGE, h_exception_common
diff --git a/xen/arch/ppc/ppc64/exceptions.c b/xen/arch/ppc/ppc64/exceptions.c
new file mode 100644
index 0000000000..c6a11c8639
--- /dev/null
+++ b/xen/arch/ppc/ppc64/exceptions.c
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/lib.h>
+
+#include <asm/processor.h>
+
+static const char *exception_name_from_vec(uint32_t vec)
+{
+    switch ( vec )
+    {
+    case EXC_SYSTEM_RESET:
+        return "System Reset";
+    case EXC_MACHINE_CHECK:
+        return "Machine Check";
+    case EXC_DATA_STORAGE:
+        return "Data Storage";
+    case EXC_DATA_SEGMENT:
+        return "Data Segment";
+    case EXC_INSN_STORAGE:
+        return "Instruction Storage";
+    case EXC_INSN_SEGMENT:
+        return "Instruction Segment";
+    case EXC_EXTERNAL:
+        return "External";
+    case EXC_ALIGNMENT:
+        return "Alignment";
+    case EXC_PROGRAM:
+        return "Program";
+    case EXC_FPU_UNAVAIL:
+        return "Floating-Point Unavailable";
+    case EXC_DECREMENTER:
+        return "Decrementer";
+    case EXC_H_DECREMENTER:
+        return "Hypervisor Decrementer";
+    case EXC_PRIV_DOORBELL:
+        return "Directed Privileged Doorbell";
+    case EXC_SYSTEM_CALL:
+        return "System Call";
+    case EXC_TRACE:
+        return "Trace";
+    case EXC_H_DATA_STORAGE:
+        return "Hypervisor Data Storage";
+    case EXC_H_INSN_STORAGE:
+        return "Hypervisor Instruction Storage";
+    case EXC_H_EMUL_ASST:
+        return "Hypervisor Emulation Assistance";
+    case EXC_H_MAINTENANCE:
+        return "Hypervisor Maintenance";
+    case EXC_H_DOORBELL:
+        return "Directed Hypervisor Doorbell";
+    case EXC_H_VIRT:
+        return "Hypervisor Virtualization";
+    case EXC_PERF_MON:
+        return "Performance Monitor";
+    case EXC_VECTOR_UNAVAIL:
+        return "Vector Unavailable";
+    case EXC_VSX_UNAVAIL:
+        return "VSX Unavailable";
+    case EXC_FACIL_UNAVAIL:
+        return "Facility Unavailable";
+    case EXC_H_FACIL_UNAVAIL:
+        return "Hypervisor Facility Unavailable";
+    default:
+        return "(unknown)";
+    }
+}
+
+void exception_handler(struct cpu_user_regs *regs)
+{
+    /* TODO: this is currently only useful for debugging */
+
+    printk("UNRECOVERABLE EXCEPTION: %s (0x%04x)\n\n"
+           "GPR 0-3   : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
+           "GPR 4-7   : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
+           "GPR 8-11  : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
+           "GPR 12-15 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
+           "GPR 16-19 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
+           "GPR 20-23 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
+           "GPR 24-27 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
+           "GPR 28-31 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n\n",
+           exception_name_from_vec(regs->entry_vector), regs->entry_vector,
+           regs->gprs[0], regs->gprs[1], regs->gprs[2], regs->gprs[3],
+           regs->gprs[4], regs->gprs[5], regs->gprs[6], regs->gprs[7],
+           regs->gprs[8], regs->gprs[9], regs->gprs[10], regs->gprs[11],
+           regs->gprs[12], regs->gprs[13], regs->gprs[14], regs->gprs[15],
+           regs->gprs[16], regs->gprs[17], regs->gprs[18], regs->gprs[19],
+           regs->gprs[20], regs->gprs[21], regs->gprs[22], regs->gprs[23],
+           regs->gprs[24], regs->gprs[25], regs->gprs[26], regs->gprs[27],
+           regs->gprs[28], regs->gprs[29], regs->gprs[30], regs->gprs[31]);
+    printk("LR        : 0x%016lx\n"
+           "CTR       : 0x%016lx\n"
+           "CR        : 0x%08x\n"
+           "PC        : 0x%016lx\n"
+           "MSR       : 0x%016lx\n"
+           "SRR0      : 0x%016lx\n"
+           "SRR1      : 0x%016lx\n"
+           "DAR       : 0x%016lx\n"
+           "DSISR     : 0x%08x\n",
+           regs->lr, regs->ctr, regs->cr, regs->pc, regs->msr, regs->srr0,
+           regs->srr1, regs->dar, regs->dsisr);
+
+    die();
+}
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 959c1454a0..101bdd8bb6 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -11,6 +11,15 @@
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);

+void setup_exceptions(void)
+{
+    unsigned long lpcr;
+
+    /* Set appropriate interrupt location in LPCR */
+    lpcr = mfspr(SPRN_LPCR);
+    mtspr(SPRN_LPCR, lpcr | LPCR_AIL_3);
+}
+
 void __init noreturn start_xen(unsigned long r3, unsigned long r4,
                                unsigned long r5, unsigned long r6,
                                unsigned long r7)
@@ -26,6 +35,8 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
         boot_opal_init((void *)r3);
     }

+    setup_exceptions();
+
     setup_initial_pagetables();

     early_printk("Hello, ppc64le!\n");
--
2.30.2


