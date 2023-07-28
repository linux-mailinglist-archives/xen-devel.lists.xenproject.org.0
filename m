Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F9D767682
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 21:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571547.895673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTNI-00072G-Tp; Fri, 28 Jul 2023 19:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571547.895673; Fri, 28 Jul 2023 19:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTNI-0006zK-R2; Fri, 28 Jul 2023 19:43:44 +0000
Received: by outflank-mailman (input) for mailman id 571547;
 Fri, 28 Jul 2023 19:43:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hHC=DO=citrix.com=prvs=56653927b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qPTNH-0006TZ-CQ
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 19:43:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0db341aa-2d7f-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 21:43:41 +0200 (CEST)
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
X-Inumbo-ID: 0db341aa-2d7f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690573420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PCPSAJXecSZYJzFdy0upyDxRBRjL68nWU3VefGt0Ksk=;
  b=KIqMEqyhDegLwZ/WDQqY/id0hbSHTGddqHXw8e/28t49h9qVGS+q1bwR
   A7WqmsNj6ywqGTWl+LRX3Te1cXOz4JU+MYtvA21K1+yVC1tEetAswflrj
   RGZWXvNwai9pun4oXLIPXmk5CauoC31fJF8DVuh6aqGsGoRYtlFjd/MPm
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120449229
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:4rhga6h44AFtwaPkDoIoGG39X161WxAKZh0ujC45NGQN5FlHY01je
 htvCDyOOfbfYTTzfIggbIngpkJS78DSndIwGwM/+XsxQSgb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4wWOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ0bw5cUg7cwNiN0eu2Q/hKovsYBtD0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 DqaozWjWEBy2Nq35zja0lKMnff1zSrgVLxCGOTg5M9hqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9/vzAjZiqqGSD3iU+bGdtzqaMzUaNmIEamkPSg5ty9/iq4Y3h1TRQ8p5Eai0ptfoFir9x
 T/Mpy8774j/luZSif/9pwqexWvx+N6QFFVdChjrsnyNwkRHNbK7OMuS0kmC4P9RCqKmdXOYo
 y1R8ySB19ziHa1hhQTUHrRVQe/3uajVWNHPqQUxRsd8rlxB71bmJNkNu28meS+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHwk0PyZ8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlglDuOG8Gjn0/8ieT2iJuppVEtagDmggcRtfPsneko2
 4wHa5viJ+t3DoUSnRU7AaZMdAtXfBDX9Lj9qtBNd/7rH+aVMDhJNhMl+pt4I9YNt/0Mxo/1E
 oSVBhcwJKzX2SeWdm1nqxlLNNvSYHqIhStqZnV1bQ74gShLjETGxP53SqbbtIIPrIRLpcOYh
 dFfEylcKpyjkgj6xgk=
IronPort-HdrOrdr: A9a23:ACUjr6itX89D+ZwM/iG2XyXq2HBQX5913DAbv31ZSRFFG/Fw9v
 re6cjzsCWe5gr5N0tBpTn+Atj9fZqxz/9ICOoqTMSftXfdyQmVxehZhOOJ/9SKIVycygcy79
 YET0B0YOeAcmST5azBjDVReLwbr+VuP8qT6Nv2/jNVaUVPVokl1gF+D2+gYz9LrMstP+tGKH
 JZjPA31wZJvB4sH7WG7wI+Loz+juyOrovifRkFQzY/8WC1/EqVwY+/KQGcwhAdFxhSwbIumF
 K17jDR1+GYqvSmzR2Z8GfW4/1t6bzc4+oGPtWIls8WbhPzjQqyDb4RPYGqjXQOueSy71Rvqv
 ngyi1QR/hb2jfqZ2Sophmo4QX6zzo0zHfnxTaj8ADeiP28fis+F81Cwb1UaQHY7U1IhqAH7J
 52
X-Talos-CUID: =?us-ascii?q?9a23=3AN5sJcmvx1ZHIBKW7UeDMPSpM6IsJNUOM8GmPZHW?=
 =?us-ascii?q?DGD9kQayzbWCr0rp7xp8=3D?=
X-Talos-MUID: 9a23:5QMuzwoukRLaBHqOdVsezx9ga+dIw7+2MhAEipk468XdbT5BMB7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,238,1684814400"; 
   d="scan'208";a="120449229"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 2/3] x86/entry: Rename the exception entrypoints
Date: Fri, 28 Jul 2023 20:43:19 +0100
Message-ID: <20230728194320.3082120-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
References: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This makes the names match the architectural short names that we use
elsewhere.  This avoids 'debug' in particular from being a global symbol
shadowed by many local parameter names.

Remove the DECLARE_TRAP_HANDLER{,_CONST}() infrastructure.  Only NMI/#MC are
referenced externally (and NMI will cease to be soon, as part of adding FRED
support).  Move the entrypoint declarations into the respective traps.c where
they're used, rather than keeping them visible across ~all of Xen.

Drop the long-stale comment at the top of init_idt_traps().  It's mostly
discussing a 32bit Xen, and bogus otherwise as it's impossible to use trap
gates correctly for these purposes.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

This is half of a previous patch, cut down to just the rename and header file
cleanup.
---
 xen/arch/x86/include/asm/processor.h | 34 +-------------
 xen/arch/x86/pv/traps.c              |  2 +
 xen/arch/x86/traps.c                 | 70 +++++++++++++++++-----------
 xen/arch/x86/x86_64/entry.S          | 36 +++++++-------
 4 files changed, 64 insertions(+), 78 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index c0529cc3d984..0989748be6d5 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -417,38 +417,8 @@ extern void mtrr_bp_init(void);
 
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
index 17ca4d1d5142..74f333da7e1c 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -132,6 +132,8 @@ static void cf_check nmi_softirq(void)
     *v_ptr = NULL;
 }
 
+void nocall entry_int82(void);
+
 void __init pv_trap_init(void)
 {
 #ifdef CONFIG_PV32
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e05e8964482e..8470561cbc27 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2107,35 +2107,49 @@ void percpu_traps_init(void)
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
 }
 
+/* Exception entries */
+void nocall entry_DE(void);
+void nocall entry_DB(void);
+void nocall entry_NMI(void);
+void nocall entry_BP(void);
+void nocall entry_OF(void);
+void nocall entry_BR(void);
+void nocall entry_UD(void);
+void nocall entry_NM(void);
+void nocall entry_DF(void);
+void nocall entry_TS(void);
+void nocall entry_NP(void);
+void nocall entry_SS(void);
+void nocall entry_GP(void);
+void nocall early_page_fault(void);
+void nocall entry_PF(void);
+void nocall entry_MF(void);
+void nocall entry_AC(void);
+void nocall entry_MC(void);
+void nocall entry_XM(void);
+void nocall entry_CP(void);
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
-    set_intr_gate(X86_EXC_DE,  divide_error);
-    set_intr_gate(X86_EXC_DB,  debug);
-    set_intr_gate(X86_EXC_NMI, nmi);
-    set_swint_gate(X86_EXC_BP, int3);     /* usable from all privileges */
-    set_swint_gate(X86_EXC_OF, overflow); /* usable from all privileges */
-    set_intr_gate(X86_EXC_BR,  bounds);
-    set_intr_gate(X86_EXC_UD,  invalid_op);
-    set_intr_gate(X86_EXC_NM,  device_not_available);
-    set_intr_gate(X86_EXC_DF,  double_fault);
-    set_intr_gate(X86_EXC_TS,  invalid_TSS);
-    set_intr_gate(X86_EXC_NP,  segment_not_present);
-    set_intr_gate(X86_EXC_SS,  stack_segment);
-    set_intr_gate(X86_EXC_GP,  general_protection);
-    set_intr_gate(X86_EXC_PF,  early_page_fault);
-    set_intr_gate(X86_EXC_MF,  coprocessor_error);
-    set_intr_gate(X86_EXC_AC,  alignment_check);
-    set_intr_gate(X86_EXC_MC,  machine_check);
-    set_intr_gate(X86_EXC_XM,  simd_coprocessor_error);
-    set_intr_gate(X86_EXC_CP,  entry_CP);
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
@@ -2154,7 +2168,7 @@ void __init trap_init(void)
     unsigned int vector;
 
     /* Replace early pagefault with real pagefault handler. */
-    set_intr_gate(X86_EXC_PF, &page_fault);
+    set_intr_gate(X86_EXC_PF, entry_PF);
 
     pv_trap_init();
 
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index bca1500e2b45..81dd2c74b876 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -708,7 +708,7 @@ ENTRY(common_interrupt)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         jmp ret_from_intr
 
-ENTRY(page_fault)
+ENTRY(entry_PF)
         ENDBR64
         movl  $X86_EXC_PF, 4(%rsp)
 /* No special register assumptions. */
@@ -881,81 +881,81 @@ FATAL_exception_with_ints_disabled:
         movq  %rsp,%rdi
         tailcall fatal_trap
 
-ENTRY(divide_error)
+ENTRY(entry_DE)
         ENDBR64
         pushq $0
         movl  $X86_EXC_DE, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(coprocessor_error)
+ENTRY(entry_MF)
         ENDBR64
         pushq $0
         movl  $X86_EXC_MF, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(simd_coprocessor_error)
+ENTRY(entry_XM)
         ENDBR64
         pushq $0
         movl  $X86_EXC_XM, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(device_not_available)
+ENTRY(entry_NM)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NM, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(debug)
+ENTRY(entry_DB)
         ENDBR64
         pushq $0
         movl  $X86_EXC_DB, 4(%rsp)
         jmp   handle_ist_exception
 
-ENTRY(int3)
+ENTRY(entry_BP)
         ENDBR64
         pushq $0
         movl  $X86_EXC_BP, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(overflow)
+ENTRY(entry_OF)
         ENDBR64
         pushq $0
         movl  $X86_EXC_OF, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(bounds)
+ENTRY(entry_BR)
         ENDBR64
         pushq $0
         movl  $X86_EXC_BR, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(invalid_op)
+ENTRY(entry_UD)
         ENDBR64
         pushq $0
         movl  $X86_EXC_UD, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(invalid_TSS)
+ENTRY(entry_TS)
         ENDBR64
         movl  $X86_EXC_TS, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(segment_not_present)
+ENTRY(entry_NP)
         ENDBR64
         movl  $X86_EXC_NP, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(stack_segment)
+ENTRY(entry_SS)
         ENDBR64
         movl  $X86_EXC_SS, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(general_protection)
+ENTRY(entry_GP)
         ENDBR64
         movl  $X86_EXC_GP, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(alignment_check)
+ENTRY(entry_AC)
         ENDBR64
         movl  $X86_EXC_AC, 4(%rsp)
         jmp   handle_exception
@@ -965,7 +965,7 @@ ENTRY(entry_CP)
         movl  $X86_EXC_CP, 4(%rsp)
         jmp   handle_exception
 
-ENTRY(double_fault)
+ENTRY(entry_DF)
         ENDBR64
         movl  $X86_EXC_DF, 4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
@@ -989,7 +989,7 @@ ENTRY(double_fault)
         movq  %rsp,%rdi
         tailcall do_double_fault
 
-ENTRY(nmi)
+ENTRY(entry_NMI)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NMI, 4(%rsp)
@@ -1117,7 +1117,7 @@ handle_ist_exception:
         jmp   restore_all_xen
 #endif
 
-ENTRY(machine_check)
+ENTRY(entry_MC)
         ENDBR64
         pushq $0
         movl  $X86_EXC_MC, 4(%rsp)
-- 
2.30.2


