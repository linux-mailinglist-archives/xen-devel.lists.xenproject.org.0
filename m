Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E147369CA61
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 13:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498062.768858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4qP-0006MI-G3; Mon, 20 Feb 2023 12:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498062.768858; Mon, 20 Feb 2023 12:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4qP-0006JU-CL; Mon, 20 Feb 2023 12:00:33 +0000
Received: by outflank-mailman (input) for mailman id 498062;
 Mon, 20 Feb 2023 12:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT8u=6Q=citrix.com=prvs=408b4b2b9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pU4qO-0006JO-1D
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 12:00:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 289347f1-b116-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 13:00:29 +0100 (CET)
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
X-Inumbo-ID: 289347f1-b116-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676894429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yj+dJsOYesHuHvPclsO5KxRo4OfXGvABLY3cfH2A2n4=;
  b=JrpJVJzhM44Fv0WHClHvTUYaq6XDdE2lzlNaQ0aX0NeHColx4jQiO9v8
   PrqR8KZdgz7M27LfJOl12YFqY3zJPZEwOZ4ZIeNy5+JLnttTSn6gkJcyX
   FYXc3j9H8lvY2ZbQu27HJWXGLm87PV62UbVg9bLFNZRZVGcQcHnv1nPRR
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97740134
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:t++ppKgVpVIYYWgFQ6d/A9CIX161SRAKZh0ujC45NGQN5FlHY01je
 htvXziAbq3YMGOgeIonPYXk9UoBvpHRy9ZkSQFuqiljEi8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gWGzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQjKHcVVVeSndm6xYmQZMY2rMAocPvCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27J+
 T2apz2iXnn2MvSm+32BsVyB3tX1mC/ne4wMCprj8s5D1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspQMMinN87Q3otz
 FDht9DuAyZmvPuKSHae3rCOpDi2NG4eKmpqWMMfZVJbuZ+5+th110+RCI85S8ZZk+EZBxnLw
 3eSl28vnY4fiPUg+Yrh11TM3wCF882hohEO2i3bWWes7wVcbYGjZpC15VWz0cusPLp1XXHa4
 iFaxpH2APQmSMjUyXfTGLll8KSBva7tDdHKvbJ483DNHRyJ8mXrQ41f6SoWyKxBYpddIm+Bj
 KM+VGpsCH5v0JmCN/Afj2GZUZ5CIU3c+TPND6m8Uza2SsItHDJrBQk3DaJq40jjkVI3jYY0M
 oqBfMCnAB4yUPo4kmrtHrlGjOBznUjSIF8/orihknyaPUe2PibJGd/pznPTBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqHX07dDg3wYwALcmu8aR/L7fTSjeK7Ul9U5c9N5t9Id0690mU/8+Ul
 kyAtrhwkgSm1SCXdlnbMxiOqtrHBP5CkJ7yBgR0VX7A5pTpSd31hEvDX/PbpYUaydE=
IronPort-HdrOrdr: A9a23:80dKzalRPaauh40nvAqaPSzbiQjpDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.97,312,1669093200"; 
   d="scan'208";a="97740134"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/3] x86/entry: Rework the exception entrypoints
Date: Mon, 20 Feb 2023 11:59:55 +0000
Message-ID: <20230220115956.1522728-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230220115956.1522728-1-andrew.cooper3@citrix.com>
References: <20230220115956.1522728-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This fixes two issues preventing livepatching.  First, that #PF and NMI fall
through into other functions, and second to add ELF metadata.

Use a macro to generate the entrypoints programatically, rather than
opencoding them all.  Switch to using the architectural short names.

Remove the DECLARE_TRAP_HANDLER{,_CONST}() infrastructure.  Only NMI/#MC are
referenced externally (and NMI will cease to be soon, as part of adding FRED
support).  Move the entrypoint declarations into the respective traps.c where
they're used, rather than keeping them visible across ~all of Xen.

Drop the long-stale comment at the top of init_idt_traps().  It's mostly
discussing a 32bit Xen.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/include/asm/processor.h |  34 +------
 xen/arch/x86/pv/traps.c              |   2 +
 xen/arch/x86/traps.c                 |  70 ++++++++-----
 xen/arch/x86/x86_64/entry.S          | 147 +++++++++------------------
 4 files changed, 95 insertions(+), 158 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index b95d2483212a..8725e0df11e9 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -476,38 +476,8 @@ extern void mtrr_bp_init(void);
 
 void mcheck_init(struct cpuinfo_x86 *c, bool_t bsp);
 
-#define DECLARE_TRAP_HANDLER(_name)                    \
-    void _name(void);                                  \
-    void do_ ## _name(struct cpu_user_regs *regs)
-#define DECLARE_TRAP_HANDLER_CONST(_name)              \
-    void _name(void);                                  \
-    void do_ ## _name(const struct cpu_user_regs *regs)
-
-DECLARE_TRAP_HANDLER(divide_error);
-DECLARE_TRAP_HANDLER(debug);
-DECLARE_TRAP_HANDLER_CONST(nmi);
-DECLARE_TRAP_HANDLER(int3);
-DECLARE_TRAP_HANDLER(overflow);
-DECLARE_TRAP_HANDLER(bounds);
-DECLARE_TRAP_HANDLER(invalid_op);
-DECLARE_TRAP_HANDLER(device_not_available);
-DECLARE_TRAP_HANDLER(double_fault);
-DECLARE_TRAP_HANDLER(invalid_TSS);
-DECLARE_TRAP_HANDLER(segment_not_present);
-DECLARE_TRAP_HANDLER(stack_segment);
-DECLARE_TRAP_HANDLER(general_protection);
-DECLARE_TRAP_HANDLER(page_fault);
-DECLARE_TRAP_HANDLER(early_page_fault);
-DECLARE_TRAP_HANDLER(coprocessor_error);
-DECLARE_TRAP_HANDLER(simd_coprocessor_error);
-DECLARE_TRAP_HANDLER_CONST(machine_check);
-DECLARE_TRAP_HANDLER(alignment_check);
-DECLARE_TRAP_HANDLER(entry_CP);
-
-DECLARE_TRAP_HANDLER(entry_int82);
-
-#undef DECLARE_TRAP_HANDLER_CONST
-#undef DECLARE_TRAP_HANDLER
+void do_nmi(const struct cpu_user_regs *regs);
+void do_machine_check(const struct cpu_user_regs *regs);
 
 void trap_nop(void);
 
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 97fe54b5ee5a..21f4860f7832 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -144,6 +144,8 @@ static void cf_check nmi_softirq(void)
     *v_ptr = NULL;
 }
 
+void entry_int82(void);
+
 void __init pv_trap_init(void)
 {
 #ifdef CONFIG_PV32
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7fb0c54f884e..bfd335777177 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2184,35 +2184,49 @@ void percpu_traps_init(void)
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
 }
 
+/* Exception entries */
+void entry_DE(void);
+void entry_DB(void);
+void entry_NMI(void);
+void entry_BP(void);
+void entry_OF(void);
+void entry_BR(void);
+void entry_UD(void);
+void entry_NM(void);
+void entry_DF(void);
+void entry_TS(void);
+void entry_NP(void);
+void entry_SS(void);
+void entry_GP(void);
+void early_page_fault(void);
+void entry_PF(void);
+void entry_MF(void);
+void entry_AC(void);
+void entry_MC(void);
+void entry_XM(void);
+void entry_CP(void);
+
 void __init init_idt_traps(void)
 {
-    /*
-     * Note that interrupt gates are always used, rather than trap gates. We
-     * must have interrupts disabled until DS/ES/FS/GS are saved because the
-     * first activation must have the "bad" value(s) for these registers and
-     * we may lose them if another activation is installed before they are
-     * saved. The page-fault handler also needs interrupts disabled until %cr2
-     * has been read and saved on the stack.
-     */
-    set_intr_gate(TRAP_divide_error,&divide_error);
-    set_intr_gate(TRAP_debug,&debug);
-    set_intr_gate(TRAP_nmi,&nmi);
-    set_swint_gate(TRAP_int3,&int3);         /* usable from all privileges */
-    set_swint_gate(TRAP_overflow,&overflow); /* usable from all privileges */
-    set_intr_gate(TRAP_bounds,&bounds);
-    set_intr_gate(TRAP_invalid_op,&invalid_op);
-    set_intr_gate(TRAP_no_device,&device_not_available);
-    set_intr_gate(TRAP_double_fault,&double_fault);
-    set_intr_gate(TRAP_invalid_tss,&invalid_TSS);
-    set_intr_gate(TRAP_no_segment,&segment_not_present);
-    set_intr_gate(TRAP_stack_error,&stack_segment);
-    set_intr_gate(TRAP_gp_fault,&general_protection);
-    set_intr_gate(TRAP_page_fault,&early_page_fault);
-    set_intr_gate(TRAP_copro_error,&coprocessor_error);
-    set_intr_gate(TRAP_alignment_check,&alignment_check);
-    set_intr_gate(TRAP_machine_check,&machine_check);
-    set_intr_gate(TRAP_simd_error,&simd_coprocessor_error);
-    set_intr_gate(X86_EXC_CP, entry_CP);
+    set_intr_gate (X86_EXC_DE,  entry_DE);
+    set_intr_gate (X86_EXC_DB,  entry_DB);
+    set_intr_gate (X86_EXC_NMI, entry_NMI);
+    set_swint_gate(X86_EXC_BP,  entry_BP);
+    set_swint_gate(X86_EXC_OF,  entry_OF);
+    set_intr_gate (X86_EXC_BR,  entry_BR);
+    set_intr_gate (X86_EXC_UD,  entry_UD);
+    set_intr_gate (X86_EXC_NM,  entry_NM);
+    set_intr_gate (X86_EXC_DF,  entry_DF);
+    set_intr_gate (X86_EXC_TS,  entry_TS);
+    set_intr_gate (X86_EXC_NP,  entry_NP);
+    set_intr_gate (X86_EXC_SS,  entry_SS);
+    set_intr_gate (X86_EXC_GP,  entry_GP);
+    set_intr_gate (X86_EXC_PF,  early_page_fault);
+    set_intr_gate (X86_EXC_MF,  entry_MF);
+    set_intr_gate (X86_EXC_AC,  entry_AC);
+    set_intr_gate (X86_EXC_MC,  entry_MC);
+    set_intr_gate (X86_EXC_XM,  entry_XM);
+    set_intr_gate (X86_EXC_CP,  entry_CP);
 
     /* Specify dedicated interrupt stacks for NMI, #DF, and #MC. */
     enable_each_ist(idt_table);
@@ -2231,7 +2245,7 @@ void __init trap_init(void)
     unsigned int vector;
 
     /* Replace early pagefault with real pagefault handler. */
-    set_intr_gate(TRAP_page_fault, &page_fault);
+    set_intr_gate(X86_EXC_PF, entry_PF);
 
     pv_trap_init();
 
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index ae012851819a..6d7c15ce4371 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -142,6 +142,50 @@ process_trap:
 
         .section .text.entry, "ax", @progbits
 
+.macro IDT_ENTRY vec label handler
+ENTRY(\label)
+        ENDBR64
+	.if ((1 << \vec) & X86_EXC_HAVE_EC) == 0
+            push $0
+        .endif
+        movl  $\vec, 4(%rsp)
+        jmp   \handler
+
+        .type \label, @function
+        .size \label, . - \label
+.endm
+
+.macro ENTRY vec label
+        IDT_ENTRY \vec \label handle_exception
+.endm
+.macro ENTRY_IST vec label
+        IDT_ENTRY \vec \label handle_ist_exception
+.endm
+
+
+ENTRY     X86_EXC_DE  entry_DE  /* 00 Divide Error */
+ENTRY_IST X86_EXC_DB  entry_DB  /* 01 Debug Exception */
+ENTRY_IST X86_EXC_NMI entry_NMI /* 02 Non-Maskable Interrupt */
+ENTRY     X86_EXC_BP  entry_BP  /* 03 Breakpoint (int3) */
+ENTRY     X86_EXC_OF  entry_OF  /* 04 Overflow (into) */
+ENTRY     X86_EXC_BR  entry_BR  /* 05 Bound Range */
+ENTRY     X86_EXC_UD  entry_UD  /* 06 Undefined Opcode */
+ENTRY     X86_EXC_NM  entry_NM  /* 07 No Maths (Device Not Present) */
+/*   _IST X86_EXC_DF  entry_DF     08 Double Fault - Handled specially */
+/*        X86_EXC_CSO entry_CSO    09 Coprocessor Segment Override - Autogen */
+ENTRY     X86_EXC_TS  entry_TS  /* 10 Invalid TSS */
+ENTRY     X86_EXC_NP  entry_NP  /* 11 Segment Not Present */
+ENTRY     X86_EXC_SS  entry_SS  /* 12 Stack Segment Fault */
+ENTRY     X86_EXC_GP  entry_GP  /* 13 General Protection Fault */
+ENTRY     X86_EXC_PF  entry_PF  /* 14 Page Fault */
+/*        X86_EXC_SPV entry_SPV    15 PIC Spurious Interrupt Vector - Autogen */
+ENTRY     X86_EXC_MF  entry_MF  /* 16 Maths Fault (x87 FPU) */
+ENTRY     X86_EXC_AC  entry_AC  /* 17 Alignment Check */
+ENTRY_IST X86_EXC_MC  entry_MC  /* 18 Machine Check */
+ENTRY     X86_EXC_XM  entry_XM  /* 19 SIMD Maths Fault */
+/*        X86_EXC_VE  entry_VE     20 Virtualisation Exception - Not implemented */
+ENTRY     X86_EXC_CP  entry_CP  /* 21 Control-flow Protection */
+
 /* %rbx: struct vcpu, interrupts disabled */
 restore_all_guest:
         ASSERT_INTERRUPTS_DISABLED
@@ -707,9 +751,6 @@ ENTRY(common_interrupt)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         jmp ret_from_intr
 
-ENTRY(page_fault)
-        ENDBR64
-        movl  $TRAP_page_fault,4(%rsp)
 /* No special register assumptions. */
 GLOBAL(handle_exception)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
@@ -882,91 +923,7 @@ FATAL_exception_with_ints_disabled:
         call  fatal_trap
         BUG   /* fatal_trap() shouldn't return. */
 
-ENTRY(divide_error)
-        ENDBR64
-        pushq $0
-        movl  $TRAP_divide_error,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(coprocessor_error)
-        ENDBR64
-        pushq $0
-        movl  $TRAP_copro_error,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(simd_coprocessor_error)
-        ENDBR64
-        pushq $0
-        movl  $TRAP_simd_error,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(device_not_available)
-        ENDBR64
-        pushq $0
-        movl  $TRAP_no_device,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(debug)
-        ENDBR64
-        pushq $0
-        movl  $TRAP_debug,4(%rsp)
-        jmp   handle_ist_exception
-
-ENTRY(int3)
-        ENDBR64
-        pushq $0
-        movl  $TRAP_int3,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(overflow)
-        ENDBR64
-        pushq $0
-        movl  $TRAP_overflow,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(bounds)
-        ENDBR64
-        pushq $0
-        movl  $TRAP_bounds,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(invalid_op)
-        ENDBR64
-        pushq $0
-        movl  $TRAP_invalid_op,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(invalid_TSS)
-        ENDBR64
-        movl  $TRAP_invalid_tss,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(segment_not_present)
-        ENDBR64
-        movl  $TRAP_no_segment,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(stack_segment)
-        ENDBR64
-        movl  $TRAP_stack_error,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(general_protection)
-        ENDBR64
-        movl  $TRAP_gp_fault,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(alignment_check)
-        ENDBR64
-        movl  $TRAP_alignment_check,4(%rsp)
-        jmp   handle_exception
-
-ENTRY(entry_CP)
-        ENDBR64
-        movl  $X86_EXC_CP, 4(%rsp)
-        jmp   handle_exception
-
-ENTRY(double_fault)
+ENTRY(entry_DF)
         ENDBR64
         movl  $TRAP_double_fault,4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
@@ -991,10 +948,10 @@ ENTRY(double_fault)
         call  do_double_fault
         BUG   /* do_double_fault() shouldn't return. */
 
-ENTRY(nmi)
-        ENDBR64
-        pushq $0
-        movl  $TRAP_nmi,4(%rsp)
+        .type entry_DF, @function
+        .size entry_DF, . - entry_DF
+
+
 handle_ist_exception:
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
@@ -1120,12 +1077,6 @@ handle_ist_exception:
         jmp   restore_all_xen
 #endif
 
-ENTRY(machine_check)
-        ENDBR64
-        pushq $0
-        movl  $TRAP_machine_check,4(%rsp)
-        jmp   handle_ist_exception
-
 /* No op trap handler.  Required for kexec crash path. */
 GLOBAL(trap_nop)
         ENDBR64
-- 
2.30.2


