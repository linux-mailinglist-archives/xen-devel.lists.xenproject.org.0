Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E761E4E01
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:19:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1aM-00045h-IK; Wed, 27 May 2020 19:19:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1aL-00044e-2t
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:19:29 +0000
X-Inumbo-ID: f518fc1b-a04e-11ea-a777-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f518fc1b-a04e-11ea-a777-12813bfff9fa;
 Wed, 27 May 2020 19:19:18 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KPMzHN7M4o1atLAbnD8TJWcgtq/9W44k99HeJc51xZ7vy4wcR5MQtaZJzm2CQRb+Ipd249maSA
 OaNFGgLYbqehzstG49rMtAVS/JzuM0k0ReG9EOH6uo6/HzEi9Q8++2XrVFWwYIBnNTRi4KllVz
 +4x4wdu5Lz5xRs2n6pYNOQnrFVW7ZHQqnGxgvwKAmi+0TgLBB6AYYvhTZcTWG1za+cpJP4B3Gm
 vSFvFtaX+5p/yZLjM28gA1QiJ/4pKYlUDpjvMmSozDeI4tHq/hkXy477SMg3vBDaRUdJZ32oMY
 9Co=
X-SBRS: 2.7
X-MesageID: 19333923
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="19333923"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 04/14] x86/traps: Implement #CP handler and extend #PF for
 shadow stacks
Date: Wed, 27 May 2020 20:18:37 +0100
Message-ID: <20200527191847.17207-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200527191847.17207-1-andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

For now, any #CP exception or shadow stack #PF indicate a bug in Xen, but
attempt to recover from #CP if taken in guest context.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase over #PF[Rsvd] rework.
 * Alignment for PFEC_shstk.
 * Use more X86_EXC_* names.
---
 xen/arch/x86/traps.c            | 46 +++++++++++++++++++++++++++++++++++++++--
 xen/arch/x86/x86_64/entry.S     |  7 ++++++-
 xen/include/asm-x86/processor.h |  2 ++
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index eeb3e146ef..90da787ee2 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -156,7 +156,9 @@ void (* const exception_table[TRAP_nr])(struct cpu_user_regs *regs) = {
     [TRAP_alignment_check]              = do_trap,
     [TRAP_machine_check]                = (void *)do_machine_check,
     [TRAP_simd_error]                   = do_trap,
-    [TRAP_virtualisation ...
+    [TRAP_virtualisation]               = do_reserved_trap,
+    [X86_EXC_CP]                        = do_entry_CP,
+    [X86_EXC_CP + 1 ...
      (ARRAY_SIZE(exception_table) - 1)] = do_reserved_trap,
 };
 
@@ -1445,8 +1447,10 @@ void do_page_fault(struct cpu_user_regs *regs)
      *
      * Anything remaining is an error, constituting corruption of the
      * pagetables and probably an L1TF vulnerable gadget.
+     *
+     * Any shadow stack access fault is a bug in Xen.
      */
-    if ( error_code & PFEC_reserved_bit )
+    if ( error_code & (PFEC_reserved_bit | PFEC_shstk) )
         goto fatal;
 
     if ( unlikely(!guest_mode(regs)) )
@@ -1898,6 +1902,43 @@ void do_debug(struct cpu_user_regs *regs)
     pv_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
 }
 
+void do_entry_CP(struct cpu_user_regs *regs)
+{
+    static const char errors[][10] = {
+        [1] = "near ret",
+        [2] = "far/iret",
+        [3] = "endbranch",
+        [4] = "rstorssp",
+        [5] = "setssbsy",
+    };
+    const char *err = "??";
+    unsigned int ec = regs->error_code;
+
+    if ( debugger_trap_entry(TRAP_debug, regs) )
+        return;
+
+    /* Decode ec if possible */
+    if ( ec < ARRAY_SIZE(errors) && errors[ec][0] )
+        err = errors[ec];
+
+    /*
+     * For now, only supervisors shadow stacks should be active.  A #CP from
+     * guest context is probably a Xen bug, but kill the guest in an attempt
+     * to recover.
+     */
+    if ( guest_mode(regs) )
+    {
+        gprintk(XENLOG_ERR, "Hit #CP[%04x] in guest context %04x:%p\n",
+                ec, regs->cs, _p(regs->rip));
+        ASSERT_UNREACHABLE();
+        domain_crash(current->domain);
+        return;
+    }
+
+    show_execution_state(regs);
+    panic("CONTROL-FLOW PROTECTION FAULT: #CP[%04x] %s\n", ec, err);
+}
+
 static void __init noinline __set_intr_gate(unsigned int n,
                                             uint32_t dpl, void *addr)
 {
@@ -1987,6 +2028,7 @@ void __init init_idt_traps(void)
     set_intr_gate(TRAP_alignment_check,&alignment_check);
     set_intr_gate(TRAP_machine_check,&machine_check);
     set_intr_gate(TRAP_simd_error,&simd_coprocessor_error);
+    set_intr_gate(X86_EXC_CP, entry_CP);
 
     /* Specify dedicated interrupt stacks for NMI, #DF, and #MC. */
     enable_each_ist(idt_table);
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index d55453f3f3..f7ee3dce91 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -795,6 +795,10 @@ ENTRY(alignment_check)
         movl  $TRAP_alignment_check,4(%rsp)
         jmp   handle_exception
 
+ENTRY(entry_CP)
+        movl  $X86_EXC_CP, 4(%rsp)
+        jmp   handle_exception
+
 ENTRY(double_fault)
         movl  $TRAP_double_fault,4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
@@ -940,7 +944,8 @@ autogen_stubs: /* Automatically generated stubs. */
         entrypoint 1b
 
         /* Reserved exceptions, heading towards do_reserved_trap(). */
-        .elseif vec == TRAP_copro_seg || vec == TRAP_spurious_int || (vec > TRAP_simd_error && vec < TRAP_nr)
+        .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
+                vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < TRAP_nr)
 
 1:      test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
         jz    2f             /* size is 8 bytes.  Check whether the processor gave us an */
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index 96deac73ed..c2b9dc1ac0 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -68,6 +68,7 @@
 #define PFEC_reserved_bit   (_AC(1,U) << 3)
 #define PFEC_insn_fetch     (_AC(1,U) << 4)
 #define PFEC_prot_key       (_AC(1,U) << 5)
+#define PFEC_shstk          (_AC(1,U) << 6)
 #define PFEC_arch_mask      (_AC(0xffff,U)) /* Architectural PFEC values. */
 /* Internally used only flags. */
 #define PFEC_page_paged     (1U<<16)
@@ -530,6 +531,7 @@ DECLARE_TRAP_HANDLER(coprocessor_error);
 DECLARE_TRAP_HANDLER(simd_coprocessor_error);
 DECLARE_TRAP_HANDLER_CONST(machine_check);
 DECLARE_TRAP_HANDLER(alignment_check);
+DECLARE_TRAP_HANDLER(entry_CP);
 
 DECLARE_TRAP_HANDLER(entry_int82);
 
-- 
2.11.0


