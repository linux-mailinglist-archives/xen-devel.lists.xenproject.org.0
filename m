Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874A569CA64
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 13:00:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498064.768880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4qY-0006sW-13; Mon, 20 Feb 2023 12:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498064.768880; Mon, 20 Feb 2023 12:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4qX-0006r6-SQ; Mon, 20 Feb 2023 12:00:41 +0000
Received: by outflank-mailman (input) for mailman id 498064;
 Mon, 20 Feb 2023 12:00:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT8u=6Q=citrix.com=prvs=408b4b2b9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pU4qV-0006Ge-UM
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 12:00:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2aa2420d-b116-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 13:00:32 +0100 (CET)
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
X-Inumbo-ID: 2aa2420d-b116-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676894435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jFWfK3//BYlWrrP//RiyQIsCqar6JnZuHMmFCsiAJGE=;
  b=ex7M+X4pfy/Idn89icTojoR5/kzg4Euf2TTfO2kzNhTVJrjcYhl6zzN2
   diZeQR+LR9MyHT/GL7UX6a82qiYhr/oardMnrl7yt0aELBSvcH62H5rMq
   KdzRDpiUFwe/RChuQ0Xyyq67v9aiFizvg8F+zXjBZZvfE1YrF8hXZD9LH
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97740136
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:4kpdIqri00h0wwY77eYKn05GppheBmIJZRIvgKrLsJaIsI4StFCzt
 garIBmDbPmMZ2bxKopxaNiw9U9XuMDSnNBlHAtrqns0ES1G+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzSFNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAsNKQi4wPOs+76+ccJCqZ4JKMK3DqpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jOZoDihW0pEXDCZ4Squ02/8tNDepAzyf6AMHayp/9FQpGTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZTAFpMHY55AptR7Kdf1NP/SfitapKxill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8Ahkkey+F0e5eI1cFh
 XM/XisIvfdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxHOjzu0zhNxzvlkU
 Xt+TSpLJSxHYZmLMRLsH7tNuVPV7n1WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vdyDg5B
 +13bpPQoz0GCb2WX8Ui2dJLRbz8BSRhVM+eRg0+XrLrHzeK70l7VaaBnON+J90890mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMCALhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:/Upi7K7LTKZpyaVQiAPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.97,312,1669093200"; 
   d="scan'208";a="97740136"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86/treewide: Drop the TRAP_* legacy names
Date: Mon, 20 Feb 2023 11:59:56 +0000
Message-ID: <20230220115956.1522728-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230220115956.1522728-1-andrew.cooper3@citrix.com>
References: <20230220115956.1522728-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We have two naming schemes for exceptions - X86_EXC_?? which use the
archtiectural abbreviations, and TRAP_* which is a mix of terminology and
nonstandard abbrevations.  Switch to X86_EXC_* uniformly.

No funcational change, confirmed by diffing the disassembly.  Only 7 binary
changes, and they're all __LINE__ being passed into printk().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This is a bit of a large patch, but its treewide cleanup and splitting it up
by major subsystem doesn't make it easier to review.  Diffing the disassmebly
is by far the easiest way to confirm no functional change.
---
 xen/arch/x86/cpu/mcheck/vmce.c         |  2 +-
 xen/arch/x86/cpuid.c                   |  6 +-
 xen/arch/x86/crash.c                   |  6 +-
 xen/arch/x86/domain.c                  |  2 +-
 xen/arch/x86/extable.c                 |  8 +--
 xen/arch/x86/hvm/emulate.c             | 17 +++---
 xen/arch/x86/hvm/hvm.c                 | 61 ++++++++++----------
 xen/arch/x86/hvm/io.c                  |  2 +-
 xen/arch/x86/hvm/svm/emulate.c         |  2 +-
 xen/arch/x86/hvm/svm/intr.c            |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c       | 32 +++++------
 xen/arch/x86/hvm/svm/svm.c             | 76 ++++++++++++-------------
 xen/arch/x86/hvm/svm/vmcb.c            |  4 +-
 xen/arch/x86/hvm/vm_event.c            | 10 ++--
 xen/arch/x86/hvm/vmx/intr.c            |  2 +-
 xen/arch/x86/hvm/vmx/realmode.c        | 16 +++---
 xen/arch/x86/hvm/vmx/vmcs.c            |  4 +-
 xen/arch/x86/hvm/vmx/vmx.c             | 79 +++++++++++++-------------
 xen/arch/x86/hvm/vmx/vvmx.c            | 28 ++++-----
 xen/arch/x86/include/asm/domain.h      |  2 +-
 xen/arch/x86/include/asm/hvm/hvm.h     |  8 +--
 xen/arch/x86/include/asm/processor.h   | 44 +++-----------
 xen/arch/x86/include/asm/x86-defns.h   |  2 +
 xen/arch/x86/machine_kexec.c           |  2 +-
 xen/arch/x86/mm.c                      |  2 +-
 xen/arch/x86/mm/mem_access.c           |  2 +-
 xen/arch/x86/mm/shadow/hvm.c           |  2 +-
 xen/arch/x86/mm/shadow/multi.c         | 10 ++--
 xen/arch/x86/pv/callback.c             |  6 +-
 xen/arch/x86/pv/emul-gate-op.c         | 34 +++++------
 xen/arch/x86/pv/emul-inv-op.c          |  2 +-
 xen/arch/x86/pv/emul-priv-op.c         | 14 ++---
 xen/arch/x86/pv/emulate.c              |  2 +-
 xen/arch/x86/pv/iret.c                 |  2 +-
 xen/arch/x86/pv/ro-page-fault.c        |  4 +-
 xen/arch/x86/pv/traps.c                | 10 ++--
 xen/arch/x86/traps.c                   | 34 +++++------
 xen/arch/x86/x86_64/compat/entry.S     | 12 ++--
 xen/arch/x86/x86_64/entry.S            | 20 +++----
 xen/arch/x86/x86_emulate.c             | 10 ++--
 xen/arch/x86/x86_emulate/x86_emulate.h |  4 +-
 41 files changed, 278 insertions(+), 309 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index af30811afd44..6f1a7e4de013 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -414,7 +414,7 @@ int inject_vmce(struct domain *d, int vcpu)
             continue;
 
         if ( (is_hvm_domain(d) ||
-              pv_trap_callback_registered(v, TRAP_machine_check)) &&
+              pv_trap_callback_registered(v, X86_EXC_MC)) &&
              !test_and_set_bool(v->arch.mce_pending) )
         {
             mce_printk(MCE_VERBOSE, "MCE: inject vMCE to %pv\n", v);
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index b22725c492e7..49d401216ed3 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -1040,7 +1040,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
             /* OSXSAVE clear in policy.  Fast-forward CR4 back in. */
             if ( (v->arch.pv.ctrlreg[4] & X86_CR4_OSXSAVE) ||
                  (p->basic.xsave &&
-                  regs->entry_vector == TRAP_invalid_op &&
+                  regs->entry_vector == X86_EXC_UD &&
                   guest_kernel_mode(v, regs) &&
                   (read_cr4() & X86_CR4_OSXSAVE)) )
                 res->c |= cpufeat_mask(X86_FEATURE_OSXSAVE);
@@ -1076,7 +1076,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
                  * emulated CPUID from a faulted CPUID by whether a #UD or #GP
                  * fault is currently being serviced.  Yuck...
                  */
-                if ( cpu_has_monitor && regs->entry_vector == TRAP_gp_fault )
+                if ( cpu_has_monitor && regs->entry_vector == X86_EXC_GP )
                     res->c |= cpufeat_mask(X86_FEATURE_MONITOR);
 
                 /*
@@ -1101,7 +1101,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         regs = guest_cpu_user_regs();
         if ( is_pv_domain(d) && is_hardware_domain(d) &&
              guest_kernel_mode(v, regs) && cpu_has_monitor &&
-             regs->entry_vector == TRAP_gp_fault )
+             regs->entry_vector == X86_EXC_GP )
             *res = raw_cpuid_policy.basic.raw[5];
         break;
 
diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index 7850f0af2473..a789416ca3ae 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -60,7 +60,7 @@ static int noreturn cf_check do_nmi_crash(
          * This update is safe from a security point of view, as this
          * pcpu is never going to try to sysret back to a PV vcpu.
          */
-        set_ist(&idt_tables[cpu][TRAP_machine_check], IST_NONE);
+        set_ist(&idt_tables[cpu][X86_EXC_MC], IST_NONE);
 
         kexec_crash_save_cpu();
         __stop_this_cpu();
@@ -130,9 +130,9 @@ static void nmi_shootdown_cpus(void)
      * Disable IST for MCEs to avoid stack corruption race conditions, and
      * change the NMI handler to a nop to avoid deviation from this codepath.
      */
-    _set_gate_lower(&idt_tables[cpu][TRAP_nmi],
+    _set_gate_lower(&idt_tables[cpu][X86_EXC_NMI],
                     SYS_DESC_irq_gate, 0, &trap_nop);
-    set_ist(&idt_tables[cpu][TRAP_machine_check], IST_NONE);
+    set_ist(&idt_tables[cpu][X86_EXC_MC], IST_NONE);
 
     set_nmi_callback(do_nmi_crash);
     smp_send_nmi_allbutself();
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index db3ebf062dab..d56920b733df 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -112,7 +112,7 @@ void play_dead(void)
     local_irq_disable();
 
     /* Change the NMI handler to a nop (see comment below). */
-    _set_gate_lower(&idt_tables[cpu][TRAP_nmi], SYS_DESC_irq_gate, 0,
+    _set_gate_lower(&idt_tables[cpu][X86_EXC_NMI], SYS_DESC_irq_gate, 0,
                     &trap_nop);
 
     /*
diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 4913c4a6dd5d..5253ae41434b 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -135,15 +135,15 @@ static int __init cf_check stub_selftest(void)
     } tests[] __initconst = {
 #define endbr64 0xf3, 0x0f, 0x1e, 0xfa
         { .opc = { endbr64, 0x0f, 0xb9, 0xc3, 0xc3 }, /* ud1 */
-          .res.fields.trapnr = TRAP_invalid_op },
+          .res.fields.trapnr = X86_EXC_UD },
         { .opc = { endbr64, 0x90, 0x02, 0x00, 0xc3 }, /* nop; add (%rax),%al */
           .rax = 0x0123456789abcdef,
-          .res.fields.trapnr = TRAP_gp_fault },
+          .res.fields.trapnr = X86_EXC_GP },
         { .opc = { endbr64, 0x02, 0x04, 0x04, 0xc3 }, /* add (%rsp,%rax),%al */
           .rax = 0xfedcba9876543210,
-          .res.fields.trapnr = TRAP_stack_error },
+          .res.fields.trapnr = X86_EXC_SS },
         { .opc = { endbr64, 0xcc, 0xc3, 0xc3, 0xc3 }, /* int3 */
-          .res.fields.trapnr = TRAP_int3 },
+          .res.fields.trapnr = X86_EXC_BP },
 #undef endbr64
     };
     unsigned long addr = this_cpu(stubs.addr) + STUB_BUF_SIZE / 2;
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 95364deb1996..adb3b084b3b7 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -910,9 +910,8 @@ static int hvmemul_virtual_to_linear(
      * determine the kind of exception (#GP or #TS) in that case.
      */
     if ( is_x86_user_segment(seg) )
-        x86_emul_hw_exception((seg == x86_seg_ss)
-                              ? TRAP_stack_error
-                              : TRAP_gp_fault, 0, &hvmemul_ctxt->ctxt);
+        x86_emul_hw_exception((seg == x86_seg_ss) ? X86_EXC_SS : X86_EXC_GP,
+                              0, &hvmemul_ctxt->ctxt);
 
     return X86EMUL_EXCEPTION;
 }
@@ -2227,7 +2226,7 @@ static int cf_check hvmemul_write_cr(
     }
 
     if ( rc == X86EMUL_EXCEPTION )
-        x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+        x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
 
     return rc;
 }
@@ -2263,7 +2262,7 @@ static int cf_check hvmemul_read_msr(
     int rc = hvm_msr_read_intercept(reg, val);
 
     if ( rc == X86EMUL_EXCEPTION )
-        x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+        x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
 
     return rc;
 }
@@ -2276,7 +2275,7 @@ static int cf_check hvmemul_write_msr(
     int rc = hvm_msr_write_intercept(reg, val, true);
 
     if ( rc == X86EMUL_EXCEPTION )
-        x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+        x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
 
     return rc;
 }
@@ -2530,7 +2529,7 @@ static int cf_check hvmemul_tlb_op(
             paging_invlpg(current, addr);
         else
         {
-            x86_emul_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC, ctxt);
+            x86_emul_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC, ctxt);
             rc = X86EMUL_EXCEPTION;
         }
         break;
@@ -2548,7 +2547,7 @@ static int cf_check hvmemul_vmfunc(
         return X86EMUL_UNHANDLEABLE;
     rc = alternative_call(hvm_funcs.altp2m_vcpu_emulate_vmfunc, ctxt->regs);
     if ( rc == X86EMUL_EXCEPTION )
-        x86_emul_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC, ctxt);
+        x86_emul_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC, ctxt);
 
     return rc;
 }
@@ -2676,7 +2675,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
     }
 
     if ( hvmemul_ctxt->ctxt.retire.singlestep )
-        hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 
     new_intr_shadow = hvmemul_ctxt->intr_shadow;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5c1e64189600..bab0ed5d2d6a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -256,25 +256,25 @@ int hvm_event_needs_reinjection(uint8_t type, uint8_t vector)
 uint8_t hvm_combine_hw_exceptions(uint8_t vec1, uint8_t vec2)
 {
     const unsigned int contributory_exceptions =
-        (1 << TRAP_divide_error) |
-        (1 << TRAP_invalid_tss) |
-        (1 << TRAP_no_segment) |
-        (1 << TRAP_stack_error) |
-        (1 << TRAP_gp_fault);
+        (1 << X86_EXC_DE) |
+        (1 << X86_EXC_TS) |
+        (1 << X86_EXC_NP) |
+        (1 << X86_EXC_SS) |
+        (1 << X86_EXC_GP);
     const unsigned int page_faults =
-        (1 << TRAP_page_fault) |
-        (1 << TRAP_virtualisation);
+        (1 << X86_EXC_PF) |
+        (1 << X86_EXC_VE);
 
     /* Exception during double-fault delivery always causes a triple fault. */
-    if ( vec1 == TRAP_double_fault )
+    if ( vec1 == X86_EXC_DF )
     {
         hvm_triple_fault();
-        return TRAP_double_fault; /* dummy return */
+        return X86_EXC_DF; /* dummy return */
     }
 
     /* Exception during page-fault delivery always causes a double fault. */
     if ( (1u << vec1) & page_faults )
-        return TRAP_double_fault;
+        return X86_EXC_DF;
 
     /* Discard the first exception if it's benign or if we now have a #PF. */
     if ( !((1u << vec1) & contributory_exceptions) ||
@@ -282,7 +282,7 @@ uint8_t hvm_combine_hw_exceptions(uint8_t vec1, uint8_t vec2)
         return vec2;
 
     /* Cannot combine the exceptions: double fault. */
-    return TRAP_double_fault;
+    return X86_EXC_DF;
 }
 
 void hvm_set_rdtsc_exiting(struct domain *d, bool_t enable)
@@ -1700,7 +1700,7 @@ void hvm_inject_event(const struct x86_event *event)
     struct vcpu *curr = current;
     const uint8_t vector = event->vector;
     const bool has_ec = ((event->type == X86_EVENTTYPE_HW_EXCEPTION) &&
-                         (vector < 32) && ((TRAP_HAVE_EC & (1u << vector))));
+                         (vector < 32) && ((X86_EXC_HAVE_EC & (1u << vector))));
 
     ASSERT(vector == event->vector); /* Confirm no truncation. */
     if ( has_ec )
@@ -1782,7 +1782,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
             return -1;
         case NESTEDHVM_PAGEFAULT_MMIO:
             if ( !handle_mmio() )
-                hvm_inject_hw_exception(TRAP_gp_fault, 0);
+                hvm_inject_hw_exception(X86_EXC_GP, 0);
             return 1;
         case NESTEDHVM_PAGEFAULT_L0_ERROR:
             /* gpa is now translated to l1 guest address, update gfn. */
@@ -1799,7 +1799,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
     if ( !nestedhvm_vcpu_in_guestmode(curr) && hvm_mmio_internal(gpa) )
     {
         if ( !handle_mmio_with_translation(gla, gpa >> PAGE_SHIFT, npfec) )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
         rc = 1;
         goto out;
     }
@@ -1926,7 +1926,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
           (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
     {
         if ( !handle_mmio_with_translation(gla, gpa >> PAGE_SHIFT, npfec) )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
         rc = 1;
         goto out_put_gfn;
     }
@@ -2034,7 +2034,7 @@ int hvm_handle_xsetbv(u32 index, u64 new_bv)
 
     rc = x86emul_write_xcr(index, new_bv, NULL);
     if ( rc != X86EMUL_OKAY )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
 
     return rc;
 }
@@ -2167,7 +2167,7 @@ int hvm_mov_to_cr(unsigned int cr, unsigned int gpr)
     }
 
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
 
     return rc;
 
@@ -2817,7 +2817,7 @@ static int task_switch_load_seg(
     seg_desc_t *pdesc = NULL, desc;
     u8 dpl, rpl;
     bool_t writable;
-    int fault_type = TRAP_invalid_tss;
+    int fault_type = X86_EXC_TS;
     struct vcpu *v = current;
 
     if ( eflags & X86_EFLAGS_VM )
@@ -2910,8 +2910,7 @@ static int task_switch_load_seg(
         /* Segment present in memory? */
         if ( !(desc.b & _SEGMENT_P) )
         {
-            fault_type = (seg != x86_seg_ss) ? TRAP_no_segment
-                                             : TRAP_stack_error;
+            fault_type = (seg != x86_seg_ss) ? X86_EXC_NP : X86_EXC_SS;
             goto fault;
         }
     } while ( !(desc.b & 0x100) && /* Ensure Accessed flag is set */
@@ -3008,9 +3007,9 @@ void hvm_task_switch(
 
     if ( ((tss_sel & 0xfff8) + 7) > gdt.limit )
     {
-        hvm_inject_hw_exception((taskswitch_reason == TSW_iret) ?
-                             TRAP_invalid_tss : TRAP_gp_fault,
-                             tss_sel & 0xfff8);
+        hvm_inject_hw_exception(
+            (taskswitch_reason == TSW_iret) ? X86_EXC_TS : X86_EXC_GP,
+            tss_sel & 0xfff8);
         goto out;
     }
 
@@ -3037,20 +3036,20 @@ void hvm_task_switch(
     if ( tr.type != ((taskswitch_reason == TSW_iret) ? 0xb : 0x9) )
     {
         hvm_inject_hw_exception(
-            (taskswitch_reason == TSW_iret) ? TRAP_invalid_tss : TRAP_gp_fault,
+            (taskswitch_reason == TSW_iret) ? X86_EXC_TS : X86_EXC_GP,
             tss_sel & 0xfff8);
         goto out;
     }
 
     if ( !tr.p )
     {
-        hvm_inject_hw_exception(TRAP_no_segment, tss_sel & 0xfff8);
+        hvm_inject_hw_exception(X86_EXC_NP, tss_sel & 0xfff8);
         goto out;
     }
 
     if ( tr.limit < (sizeof(tss)-1) )
     {
-        hvm_inject_hw_exception(TRAP_invalid_tss, tss_sel & 0xfff8);
+        hvm_inject_hw_exception(X86_EXC_TS, tss_sel & 0xfff8);
         goto out;
     }
 
@@ -3119,7 +3118,7 @@ void hvm_task_switch(
 
     rc = hvm_set_cr3(tss.cr3, false, true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
         goto out;
 
@@ -3203,7 +3202,7 @@ void hvm_task_switch(
     }
 
     if ( (tss.trace & 1) && !exn_raised )
-        hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 
  out:
     hvm_unmap_entry(optss_desc);
@@ -3478,7 +3477,7 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
     if ( curr->arch.msrs->misc_features_enables.cpuid_faulting &&
          hvm_get_cpl(curr) > 0 )
     {
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
         return 1; /* Don't advance the guest IP! */
     }
 
@@ -3855,7 +3854,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
 
     if ( !should_emulate )
     {
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         return;
     }
 
@@ -3863,7 +3862,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
     {
     case X86EMUL_UNHANDLEABLE:
     case X86EMUL_UNIMPLEMENTED:
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         break;
     case X86EMUL_EXCEPTION:
         hvm_inject_event(&ctxt.ctxt.event);
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 5ae209d3b6b3..ae2feebd79e4 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -78,7 +78,7 @@ bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
 
     case X86EMUL_UNRECOGNIZED:
         hvm_dump_emulation_state(XENLOG_G_WARNING, descr, &ctxt, rc);
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         break;
 
     case X86EMUL_EXCEPTION:
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 16fc134883cf..4661cde44968 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -112,7 +112,7 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
     hvm_dump_emulation_state(XENLOG_G_WARNING, "SVM Insn len",
                              &ctxt, X86EMUL_UNHANDLEABLE);
 
-    hvm_inject_hw_exception(TRAP_gp_fault, 0);
+    hvm_inject_hw_exception(X86_EXC_GP, 0);
     return 0;
 }
 
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 9525f3559392..5aa723979c88 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -47,7 +47,7 @@ static void svm_inject_nmi(struct vcpu *v)
     event.raw = 0;
     event.v = true;
     event.type = X86_EVENTTYPE_NMI;
-    event.vector = TRAP_nmi;
+    event.vector = X86_EXC_NMI;
 
     ASSERT(!vmcb->event_inj.v);
     vmcb->event_inj = event;
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 9f5f35f16aff..1d7fe493cffc 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -194,7 +194,7 @@ static uint64_t nestedsvm_fpu_vmentry(uint64_t n1cr0,
          * Sync FPU state with l2 guest.
          */
         vcr0 |= X86_CR0_TS;
-        n2vmcb->_exception_intercepts |= (1U << TRAP_no_device);
+        n2vmcb->_exception_intercepts |= (1U << X86_EXC_NM);
     }
     else if ( !(vcr0 & X86_CR0_TS) && (n2vmcb->_cr0 & X86_CR0_TS) )
     {
@@ -203,7 +203,7 @@ static uint64_t nestedsvm_fpu_vmentry(uint64_t n1cr0,
          * Sync FPU state with l2 guest.
          */
         vcr0 &= ~X86_CR0_TS;
-        n2vmcb->_exception_intercepts &= ~(1U << TRAP_no_device);
+        n2vmcb->_exception_intercepts &= ~(1U << X86_EXC_NM);
     }
 
     return vcr0;
@@ -219,7 +219,7 @@ static void nestedsvm_fpu_vmexit(struct vmcb_struct *n1vmcb,
          * Sync FPU state with l1 guest.
          */
         n1vmcb->_cr0 |= X86_CR0_TS;
-        n1vmcb->_exception_intercepts |= (1U << TRAP_no_device);
+        n1vmcb->_exception_intercepts |= (1U << X86_EXC_NM);
     }
     else if ( !(n1cr0 & X86_CR0_TS) && (n1vmcb->_cr0 & X86_CR0_TS) )
     {
@@ -228,7 +228,7 @@ static void nestedsvm_fpu_vmexit(struct vmcb_struct *n1vmcb,
          * Sync FPU state with l1 guest.
          */
         n1vmcb->_cr0 &= ~X86_CR0_TS;
-        n1vmcb->_exception_intercepts &= ~(1U << TRAP_no_device);
+        n1vmcb->_exception_intercepts &= ~(1U << X86_EXC_NM);
     }
 }
 
@@ -283,7 +283,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     v->arch.hvm.guest_efer = n1vmcb->_efer;
     rc = hvm_set_efer(n1vmcb->_efer);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_efer failed, rc: %u\n", rc);
 
@@ -291,7 +291,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     v->arch.hvm.guest_cr[4] = n1vmcb->_cr4;
     rc = hvm_set_cr4(n1vmcb->_cr4, true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr4 failed, rc: %u\n", rc);
 
@@ -302,7 +302,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     n1vmcb->rflags &= ~X86_EFLAGS_VM;
     rc = hvm_set_cr0(n1vmcb->_cr0 | X86_CR0_PE, true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr0 failed, rc: %u\n", rc);
     svm->ns_cr0 = v->arch.hvm.guest_cr[0];
@@ -335,7 +335,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     }
     rc = hvm_set_cr3(n1vmcb->_cr3, false, true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr3 failed, rc: %u\n", rc);
 
@@ -557,7 +557,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     v->arch.hvm.guest_efer = ns_vmcb->_efer;
     rc = hvm_set_efer(ns_vmcb->_efer);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_efer failed, rc: %u\n", rc);
 
@@ -565,7 +565,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     v->arch.hvm.guest_cr[4] = ns_vmcb->_cr4;
     rc = hvm_set_cr4(ns_vmcb->_cr4, true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr4 failed, rc: %u\n", rc);
 
@@ -575,7 +575,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     v->arch.hvm.guest_cr[0] = ns_vmcb->_cr0;
     rc = hvm_set_cr0(cr0, true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr0 failed, rc: %u\n", rc);
 
@@ -594,7 +594,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
         rc = hvm_set_cr3(ns_vmcb->_cr3, false, true);
         if ( rc == X86EMUL_EXCEPTION )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
         if ( rc != X86EMUL_OKAY )
             gdprintk(XENLOG_ERR, "hvm_set_cr3 failed, rc: %u\n", rc);
     }
@@ -610,7 +610,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
         rc = hvm_set_cr3(ns_vmcb->_cr3, false, true);
         if ( rc == X86EMUL_EXCEPTION )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
         if ( rc != X86EMUL_OKAY )
             gdprintk(XENLOG_ERR, "hvm_set_cr3 failed, rc: %u\n", rc);
     }
@@ -788,7 +788,7 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     default:
         gdprintk(XENLOG_ERR,
             "nsvm_vcpu_vmentry failed, injecting #UD\n");
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         /* Must happen after hvm_inject_hw_exception or it doesn't work right. */
         nv->nv_vmswitch_in_progress = 0;
         return 1;
@@ -1579,7 +1579,7 @@ void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v)
      */
     if ( !nestedhvm_enabled(v->domain) )
     {
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         return;
     }
 
@@ -1600,7 +1600,7 @@ void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v)
 
     if ( !nsvm_efer_svm_enabled(v) )
     {
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         return;
     }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index fa7325720328..a9903c36bdda 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -91,7 +91,7 @@ static DEFINE_SPINLOCK(osvw_lock);
 static void svm_crash_or_fault(struct vcpu *v)
 {
     if ( vmcb_get_cpl(v->arch.hvm.svm.vmcb) )
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
     else
         domain_crash(v->domain);
 }
@@ -118,7 +118,7 @@ void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len)
     curr->arch.hvm.svm.vmcb->int_stat.intr_shadow = 0;
 
     if ( regs->eflags & X86_EFLAGS_TF )
-        hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 }
 
 static void cf_check svm_cpu_down(void)
@@ -133,7 +133,7 @@ static void svm_fpu_enter(struct vcpu *v)
     vcpu_restore_fpu_lazy(v);
     vmcb_set_exception_intercepts(
         n1vmcb,
-        vmcb_get_exception_intercepts(n1vmcb) & ~(1U << TRAP_no_device));
+        vmcb_get_exception_intercepts(n1vmcb) & ~(1U << X86_EXC_NM));
 }
 
 static void cf_check svm_fpu_leave(struct vcpu *v)
@@ -153,7 +153,7 @@ static void cf_check svm_fpu_leave(struct vcpu *v)
     {
         vmcb_set_exception_intercepts(
             n1vmcb,
-            vmcb_get_exception_intercepts(n1vmcb) | (1U << TRAP_no_device));
+            vmcb_get_exception_intercepts(n1vmcb) | (1U << X86_EXC_NM));
         vmcb_set_cr0(n1vmcb, vmcb_get_cr0(n1vmcb) | X86_CR0_TS);
     }
 }
@@ -601,9 +601,9 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
 
     if ( opt_hvm_fep ||
          (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
-        bitmap |= (1U << TRAP_invalid_op);
+        bitmap |= (1U << X86_EXC_UD);
     else
-        bitmap &= ~(1U << TRAP_invalid_op);
+        bitmap &= ~(1U << X86_EXC_UD);
 
     vmcb_set_exception_intercepts(vmcb, bitmap);
 
@@ -1039,8 +1039,8 @@ static void noreturn cf_check svm_do_resume(void)
 
         v->arch.hvm.debug_state_latch = debug_state;
         vmcb_set_exception_intercepts(
-            vmcb, debug_state ? (intercepts | (1U << TRAP_int3))
-                              : (intercepts & ~(1U << TRAP_int3)));
+            vmcb, debug_state ? (intercepts |  (1U << X86_EXC_BP))
+                              : (intercepts & ~(1U << X86_EXC_BP)));
     }
 
     if ( v->arch.hvm.svm.launch_core != smp_processor_id() )
@@ -1227,7 +1227,7 @@ static void svm_emul_swint_injection(struct x86_event *event)
     const struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
     const struct cpu_user_regs *regs = guest_cpu_user_regs();
     unsigned int trap = event->vector, type = event->type;
-    unsigned int fault = TRAP_gp_fault, ec = 0;
+    unsigned int fault = X86_EXC_GP, ec = 0;
     pagefault_info_t pfinfo;
     struct segment_register cs, idtr;
     unsigned int idte_size, idte_offset;
@@ -1273,7 +1273,7 @@ static void svm_emul_swint_injection(struct x86_event *event)
     {
         if ( rc == HVMTRANS_bad_linear_to_gfn )
         {
-            fault = TRAP_page_fault;
+            fault = X86_EXC_PF;
             ec = pfinfo.ec;
             event->cr2 = pfinfo.linear;
         }
@@ -1309,7 +1309,7 @@ static void svm_emul_swint_injection(struct x86_event *event)
     /* Is this entry present? */
     if ( !(idte.b & (1u << 15)) )
     {
-        fault = TRAP_no_segment;
+        fault = X86_EXC_NP;
         goto raise_exception;
     }
 
@@ -1350,14 +1350,14 @@ static void cf_check svm_inject_event(const struct x86_event *event)
 
     switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
-    case TRAP_debug:
+    case X86_EXC_DB:
         if ( regs->eflags & X86_EFLAGS_TF )
         {
             __restore_debug_registers(vmcb, curr);
             vmcb_set_dr6(vmcb, vmcb_get_dr6(vmcb) | DR_STEP);
         }
         /* fall through */
-    case TRAP_int3:
+    case X86_EXC_BP:
         if ( curr->domain->debugger_attached )
         {
             /* Debug/Int3: Trap to debugger. */
@@ -1366,7 +1366,7 @@ static void cf_check svm_inject_event(const struct x86_event *event)
         }
         break;
 
-    case TRAP_page_fault:
+    case X86_EXC_PF:
         ASSERT(_event.type == X86_EVENTTYPE_HW_EXCEPTION);
         curr->arch.hvm.guest_cr[2] = _event.cr2;
         vmcb_set_cr2(vmcb, _event.cr2);
@@ -1377,7 +1377,7 @@ static void cf_check svm_inject_event(const struct x86_event *event)
     {
         _event.vector = hvm_combine_hw_exceptions(
             eventinj.vector, _event.vector);
-        if ( _event.vector == TRAP_double_fault )
+        if ( _event.vector == X86_EXC_DF )
             _event.error_code = 0;
     }
 
@@ -1450,7 +1450,7 @@ static void cf_check svm_inject_event(const struct x86_event *event)
     ASSERT(!eventinj.ev || eventinj.ec == (uint16_t)eventinj.ec);
     vmcb->event_inj = eventinj;
 
-    if ( _event.vector == TRAP_page_fault &&
+    if ( _event.vector == X86_EXC_PF &&
          _event.type == X86_EVENTTYPE_HW_EXCEPTION )
         HVMTRACE_LONG_2D(PF_INJECT, _event.error_code,
                          TRC_PAR_LONG(_event.cr2));
@@ -1785,7 +1785,7 @@ static void cf_check svm_fpu_dirty_intercept(void)
     {
        /* Check if l1 guest must make FPU ready for the l2 guest */
        if ( v->arch.hvm.guest_cr[0] & X86_CR0_TS )
-           hvm_inject_hw_exception(TRAP_no_device, X86_EVENT_NO_EC);
+           hvm_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
        else
            vmcb_set_cr0(n1vmcb, vmcb_get_cr0(n1vmcb) & ~X86_CR0_TS);
        return;
@@ -2229,7 +2229,7 @@ static void svm_do_msr_access(struct cpu_user_regs *regs)
     if ( rc == X86EMUL_OKAY )
         __update_guest_eip(regs, inst_len);
     else if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
 }
 
 static void svm_vmexit_do_hlt(struct vmcb_struct *vmcb,
@@ -2252,7 +2252,7 @@ static void svm_vmexit_do_rdtsc(struct cpu_user_regs *regs, bool rdtscp)
 
     if ( rdtscp && !currd->arch.cpuid->extd.rdtscp )
     {
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         return;
     }
 
@@ -2290,14 +2290,14 @@ svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
 {
     if ( !nsvm_efer_svm_enabled(v) )
     {
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         return;
     }
 
     if ( !nestedsvm_vmcb_map(v, vmcbaddr) )
     {
         gdprintk(XENLOG_ERR, "VMRUN: mapping vmcb failed, injecting #GP\n");
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
         return;
     }
 
@@ -2343,7 +2343,7 @@ svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
 
     if ( !nsvm_efer_svm_enabled(v) )
     {
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         return;
     }
 
@@ -2352,7 +2352,7 @@ svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
     {
         gdprintk(XENLOG_ERR,
             "VMLOAD: mapping failed, injecting #GP\n");
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
         return;
     }
 
@@ -2378,7 +2378,7 @@ svm_vmexit_do_vmsave(struct vmcb_struct *vmcb,
 
     if ( !nsvm_efer_svm_enabled(v) )
     {
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         return;
     }
 
@@ -2387,7 +2387,7 @@ svm_vmexit_do_vmsave(struct vmcb_struct *vmcb,
     {
         gdprintk(XENLOG_ERR,
             "VMSAVE: mapping vmcb failed, injecting #GP\n");
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
         return;
     }
 
@@ -2777,7 +2777,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
             if ( rc < 0 )
                 goto unexpected_exit_type;
             if ( !rc )
-                hvm_inject_exception(TRAP_debug,
+                hvm_inject_exception(X86_EXC_DB,
                                      trap_type, insn_len, X86_EVENT_NO_EC);
         }
         else
@@ -2794,7 +2794,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
         {
             /* AMD Vol2, 15.11: INT3, INTO, BOUND intercepts do not update RIP. */
             __update_guest_eip(regs, insn_len);
-            current->arch.gdbsx_vcpu_event = TRAP_int3;
+            current->arch.gdbsx_vcpu_event = X86_EXC_BP;
             domain_pause_for_debugger();
         }
         else
@@ -2806,7 +2806,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
            if ( rc < 0 )
                goto unexpected_exit_type;
            if ( !rc )
-               hvm_inject_exception(TRAP_int3,
+               hvm_inject_exception(X86_EXC_BP,
                                     X86_EVENTTYPE_SW_EXCEPTION,
                                     insn_len, X86_EVENT_NO_EC);
         }
@@ -2847,8 +2847,8 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     }
 
     case VMEXIT_EXCEPTION_AC:
-        HVMTRACE_1D(TRAP, TRAP_alignment_check);
-        hvm_inject_hw_exception(TRAP_alignment_check, vmcb->exitinfo1);
+        HVMTRACE_1D(TRAP, X86_EXC_AC);
+        hvm_inject_hw_exception(X86_EXC_AC, vmcb->exitinfo1);
         break;
 
     case VMEXIT_EXCEPTION_UD:
@@ -2901,8 +2901,8 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
                  * semantics.
                  */
             case X86_EVENTTYPE_HW_EXCEPTION:
-                if ( vmcb->exit_int_info.vector == TRAP_int3 ||
-                     vmcb->exit_int_info.vector == TRAP_overflow )
+                if ( vmcb->exit_int_info.vector == X86_EXC_BP ||
+                     vmcb->exit_int_info.vector == X86_EXC_OF )
                     break;
                 /* Fallthrough */
             case X86_EVENTTYPE_EXT_INTR:
@@ -2958,7 +2958,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
                 __update_guest_eip(regs, vmcb->exitinfo2 - vmcb->rip);
         }
         else if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
         break;
 
     case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
@@ -2966,7 +2966,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
         if ( cpu_has_svm_decode && (vmcb->exitinfo1 & (1ULL << 63)) )
             svm_vmexit_do_cr_access(vmcb, regs);
         else if ( !hvm_emulate_one_insn(x86_insn_is_cr_access, "CR access") )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
         break;
 
     case VMEXIT_INVLPG:
@@ -2976,13 +2976,13 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
             __update_guest_eip(regs, vmcb->nextrip - vmcb->rip);
         }
         else if ( !hvm_emulate_one_insn(is_invlpg, "invlpg") )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
         break;
 
     case VMEXIT_INVLPGA:
         if ( !nsvm_efer_svm_enabled(v) )
         {
-            hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
             break;
         }
         if ( (insn_len = svm_get_insn_len(v, INSTR_INVLPGA)) == 0 )
@@ -3023,7 +3023,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     case VMEXIT_MWAIT:
     case VMEXIT_SKINIT:
     case VMEXIT_RDPRU:
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         break;
 
     case VMEXIT_VMRUN:
@@ -3044,7 +3044,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
 
     case VMEXIT_XSETBV:
         if ( vmcb_get_cpl(vmcb) )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
         else if ( (insn_len = svm_get_insn_len(v, INSTR_XSETBV)) &&
                   hvm_handle_xsetbv(regs->ecx, msr_fold(regs)) == X86EMUL_OKAY )
             __update_guest_eip(regs, insn_len);
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 305d4767e387..ba06acf2ee99 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -140,7 +140,7 @@ static int construct_vmcb(struct vcpu *v)
 
     vmcb->_exception_intercepts =
         HVM_TRAP_MASK |
-        (v->arch.fully_eager_fpu ? 0 : (1U << TRAP_no_device));
+        (v->arch.fully_eager_fpu ? 0 : (1U << X86_EXC_NM));
 
     if ( paging_mode_hap(v->domain) )
     {
@@ -164,7 +164,7 @@ static int construct_vmcb(struct vcpu *v)
     }
     else
     {
-        vmcb->_exception_intercepts |= (1U << TRAP_page_fault);
+        vmcb->_exception_intercepts |= (1U << X86_EXC_PF);
     }
 
     if ( cpu_has_pause_filter )
diff --git a/xen/arch/x86/hvm/vm_event.c b/xen/arch/x86/hvm/vm_event.c
index 19aac19bc354..3b064bcfade5 100644
--- a/xen/arch/x86/hvm/vm_event.c
+++ b/xen/arch/x86/hvm/vm_event.c
@@ -87,7 +87,7 @@ void hvm_vm_event_do_resume(struct vcpu *v)
                   VM_EVENT_FLAG_SET_EMUL_INSN_DATA )
             kind = EMUL_KIND_SET_CONTEXT_INSN;
 
-        hvm_emulate_one_vm_event(kind, TRAP_invalid_op,
+        hvm_emulate_one_vm_event(kind, X86_EXC_UD,
                                  X86_EVENT_NO_EC);
 
         v->arch.vm_event->emulate_flags = 0;
@@ -96,7 +96,7 @@ void hvm_vm_event_do_resume(struct vcpu *v)
     if ( unlikely(w->do_write.cr0) )
     {
         if ( hvm_set_cr0(w->cr0, false) == X86EMUL_EXCEPTION )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
 
         w->do_write.cr0 = 0;
     }
@@ -104,7 +104,7 @@ void hvm_vm_event_do_resume(struct vcpu *v)
     if ( unlikely(w->do_write.cr4) )
     {
         if ( hvm_set_cr4(w->cr4, false) == X86EMUL_EXCEPTION )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
 
         w->do_write.cr4 = 0;
     }
@@ -112,7 +112,7 @@ void hvm_vm_event_do_resume(struct vcpu *v)
     if ( unlikely(w->do_write.cr3) )
     {
         if ( hvm_set_cr3(w->cr3, w->cr3_noflush, false) == X86EMUL_EXCEPTION )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
 
         w->do_write.cr3 = 0;
     }
@@ -121,7 +121,7 @@ void hvm_vm_event_do_resume(struct vcpu *v)
     {
         if ( hvm_msr_write_intercept(w->msr, w->value, false) ==
              X86EMUL_EXCEPTION )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
 
         w->do_write.msr = 0;
     }
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 6a8316de0e25..87fb537b7c05 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -328,7 +328,7 @@ void vmx_intr_assist(void)
     }
     else if ( intack.source == hvm_intsrc_mce )
     {
-        hvm_inject_hw_exception(TRAP_machine_check, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_MC, X86_EVENT_NO_EC);
     }
     else if ( cpu_has_vmx_virtual_intr_delivery &&
               intack.source != hvm_intsrc_pic &&
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index 4ac93e081015..ff44ddcfa627 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -48,21 +48,21 @@ static void realmode_deliver_exception(
         if ( insn_len != 0 )
         {
             insn_len = 0;
-            vector = TRAP_gp_fault;
+            vector = X86_EXC_GP;
             goto again;
         }
 
         /* Exception or hardware interrupt. */
         switch ( vector )
         {
-        case TRAP_double_fault:
+        case X86_EXC_DF:
             hvm_triple_fault();
             return;
-        case TRAP_gp_fault:
-            vector = TRAP_double_fault;
+        case X86_EXC_GP:
+            vector = X86_EXC_DF;
             goto again;
         default:
-            vector = TRAP_gp_fault;
+            vector = X86_EXC_GP;
             goto again;
         }
     }
@@ -116,14 +116,14 @@ void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt)
         if ( curr->arch.hvm.guest_cr[0] & X86_CR0_PE )
             goto fail;
 
-        realmode_deliver_exception(TRAP_invalid_op, 0, hvmemul_ctxt);
+        realmode_deliver_exception(X86_EXC_UD, 0, hvmemul_ctxt);
     }
 
     if ( rc == X86EMUL_EXCEPTION )
     {
         if ( unlikely(curr->domain->debugger_attached) &&
-             ((hvmemul_ctxt->ctxt.event.vector == TRAP_debug) ||
-              (hvmemul_ctxt->ctxt.event.vector == TRAP_int3)) )
+             ((hvmemul_ctxt->ctxt.event.vector == X86_EXC_DB) ||
+              (hvmemul_ctxt->ctxt.event.vector == X86_EXC_BP)) )
         {
             domain_pause_for_debugger();
         }
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index e1c268789e7e..dbf7d3bef6a9 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1293,8 +1293,8 @@ static int construct_vmcs(struct vcpu *v)
     __vmwrite(VMCS_LINK_POINTER, ~0UL);
 
     v->arch.hvm.vmx.exception_bitmap = HVM_TRAP_MASK
-              | (paging_mode_hap(d) ? 0 : (1U << TRAP_page_fault))
-              | (v->arch.fully_eager_fpu ? 0 : (1U << TRAP_no_device));
+              | (paging_mode_hap(d) ? 0 : (1U << X86_EXC_PF))
+              | (v->arch.fully_eager_fpu ? 0 : (1U << X86_EXC_NM));
 
     if ( cpu_has_vmx_notify_vm_exiting )
         __vmwrite(NOTIFY_WINDOW, vm_notify_window);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0ec33bcc184b..7f1ccc2b4c68 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -789,9 +789,9 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
 
     if ( opt_hvm_fep ||
          (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
-        v->arch.hvm.vmx.exception_bitmap |= (1U << TRAP_invalid_op);
+        v->arch.hvm.vmx.exception_bitmap |= (1U << X86_EXC_UD);
     else
-        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_invalid_op);
+        v->arch.hvm.vmx.exception_bitmap &= ~(1U << X86_EXC_UD);
 
     vmx_vmcs_enter(v);
     vmx_update_exception_bitmap(v);
@@ -1071,7 +1071,7 @@ static int cf_check vmx_load_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 static void vmx_fpu_enter(struct vcpu *v)
 {
     vcpu_restore_fpu_lazy(v);
-    v->arch.hvm.vmx.exception_bitmap &= ~(1u << TRAP_no_device);
+    v->arch.hvm.vmx.exception_bitmap &= ~(1u << X86_EXC_NM);
     vmx_update_exception_bitmap(v);
     v->arch.hvm.vmx.host_cr0 &= ~X86_CR0_TS;
     __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
@@ -1098,7 +1098,7 @@ static void cf_check vmx_fpu_leave(struct vcpu *v)
     {
         v->arch.hvm.hw_cr[0] |= X86_CR0_TS;
         __vmwrite(GUEST_CR0, v->arch.hvm.hw_cr[0]);
-        v->arch.hvm.vmx.exception_bitmap |= (1u << TRAP_no_device);
+        v->arch.hvm.vmx.exception_bitmap |= (1u << X86_EXC_NM);
         vmx_update_exception_bitmap(v);
     }
 }
@@ -1616,9 +1616,9 @@ static void cf_check vmx_update_host_cr3(struct vcpu *v)
 void vmx_update_debug_state(struct vcpu *v)
 {
     if ( v->arch.hvm.debug_state_latch )
-        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
+        v->arch.hvm.vmx.exception_bitmap |= 1U << X86_EXC_BP;
     else
-        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
+        v->arch.hvm.vmx.exception_bitmap &= ~(1U << X86_EXC_BP);
 
     vmx_vmcs_enter(v);
     vmx_update_exception_bitmap(v);
@@ -2000,7 +2000,7 @@ void vmx_inject_nmi(void)
             nvmx_enqueue_n2_exceptions (v, 
                INTR_INFO_VALID_MASK |
                MASK_INSR(X86_EVENTTYPE_NMI, INTR_INFO_INTR_TYPE_MASK) |
-               MASK_INSR(TRAP_nmi, INTR_INFO_VECTOR_MASK),
+               MASK_INSR(X86_EXC_NMI, INTR_INFO_VECTOR_MASK),
                X86_EVENT_NO_EC, hvm_intsrc_nmi);
             return;
         }
@@ -2025,14 +2025,14 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
 
     switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
-    case TRAP_debug:
+    case X86_EXC_DB:
         if ( guest_cpu_user_regs()->eflags & X86_EFLAGS_TF )
         {
             __restore_debug_registers(curr);
             write_debugreg(6, read_debugreg(6) | DR_STEP);
         }
         if ( !nestedhvm_vcpu_in_guestmode(curr) ||
-             !nvmx_intercepts_exception(curr, TRAP_debug, _event.error_code) )
+             !nvmx_intercepts_exception(curr, X86_EXC_DB, _event.error_code) )
         {
             unsigned long val;
 
@@ -2044,7 +2044,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
         if ( cpu_has_monitor_trap_flag )
             break;
         /* fall through */
-    case TRAP_int3:
+    case X86_EXC_BP:
         if ( curr->domain->debugger_attached )
         {
             /* Debug/Int3: Trap to debugger. */
@@ -2053,7 +2053,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
         }
         break;
 
-    case TRAP_page_fault:
+    case X86_EXC_PF:
         ASSERT(_event.type == X86_EVENTTYPE_HW_EXCEPTION);
         curr->arch.hvm.guest_cr[2] = _event.cr2;
         break;
@@ -2070,7 +2070,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
     {
         _event.vector = hvm_combine_hw_exceptions(
             (uint8_t)intr_info, _event.vector);
-        if ( _event.vector == TRAP_double_fault )
+        if ( _event.vector == X86_EXC_DF )
             _event.error_code = 0;
     }
 
@@ -2090,7 +2090,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
     else
         __vmx_inject_exception(_event.vector, _event.type, _event.error_code);
 
-    if ( (_event.vector == TRAP_page_fault) &&
+    if ( (_event.vector == X86_EXC_PF) &&
          (_event.type == X86_EVENTTYPE_HW_EXCEPTION) )
         HVMTRACE_LONG_2D(PF_INJECT, _event.error_code,
                          TRC_PAR_LONG(curr->arch.hvm.guest_cr[2]));
@@ -2445,7 +2445,7 @@ static bool cf_check vmx_vcpu_emulate_ve(struct vcpu *v)
     __vmread(GUEST_PHYSICAL_ADDRESS, &veinfo->gpa);
     vmx_vmcs_exit(v);
 
-    hvm_inject_hw_exception(TRAP_virtualisation,
+    hvm_inject_hw_exception(X86_EXC_VE,
                             X86_EVENT_NO_EC);
 
  out:
@@ -3077,7 +3077,7 @@ void update_guest_eip(void)
     }
 
     if ( regs->eflags & X86_EFLAGS_TF )
-        hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 }
 
 static void cf_check vmx_fpu_dirty_intercept(void)
@@ -3175,7 +3175,7 @@ static int vmx_cr_access(cr_access_qual_t qual)
         HVMTRACE_LONG_1D(LMSW, value);
 
         if ( (rc = hvm_set_cr0(value, true)) == X86EMUL_EXCEPTION )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
 
         return rc;
     }
@@ -4093,9 +4093,9 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         __vmread(VM_EXIT_INTR_INFO, &intr_info);
         BUG_ON(!(intr_info & INTR_INFO_VALID_MASK));
         vector = intr_info & INTR_INFO_VECTOR_MASK;
-        if ( vector == TRAP_machine_check )
+        if ( vector == X86_EXC_MC )
             do_machine_check(regs);
-        if ( (vector == TRAP_nmi) &&
+        if ( (vector == X86_EXC_NMI) &&
              ((intr_info & INTR_INFO_INTR_TYPE_MASK) ==
               MASK_INSR(X86_EVENTTYPE_NMI, INTR_INFO_INTR_TYPE_MASK)) )
         {
@@ -4192,9 +4192,8 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         switch ( exit_reason )
         {
         case EXIT_REASON_EXCEPTION_NMI:
-            if ( vector != TRAP_page_fault
-                 && vector != TRAP_nmi 
-                 && vector != TRAP_machine_check ) 
+            if ( vector != X86_EXC_PF && vector != X86_EXC_NMI &&
+                 vector != X86_EXC_MC )
             {
         default:
                 perfc_incr(realmode_exits);
@@ -4243,14 +4242,14 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
          */
         if ( unlikely(intr_info & INTR_INFO_NMI_UNBLOCKED_BY_IRET) &&
              !(idtv_info & INTR_INFO_VALID_MASK) &&
-             (vector != TRAP_double_fault) )
+             (vector != X86_EXC_DF) )
             undo_nmis_unblocked_by_iret();
 
         perfc_incra(cause_vector, vector);
 
         switch ( vector )
         {
-        case TRAP_debug:
+        case X86_EXC_DB:
             /*
              * Updates DR6 where debugger can peek (See 3B 23.2.1,
              * Table 23-1, "Exit Qualification for Debug Exceptions").
@@ -4317,7 +4316,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
             else
                 domain_pause_for_debugger();
             break;
-        case TRAP_int3:
+        case X86_EXC_BP:
             HVMTRACE_1D(TRAP, vector);
             if ( !v->domain->debugger_attached )
             {
@@ -4338,15 +4337,15 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
             else
             {
                 update_guest_eip(); /* Safe: INT3 */
-                v->arch.gdbsx_vcpu_event = TRAP_int3;
+                v->arch.gdbsx_vcpu_event = X86_EXC_BP;
                 domain_pause_for_debugger();
             }
             break;
-        case TRAP_no_device:
+        case X86_EXC_NM:
             HVMTRACE_1D(TRAP, vector);
             vmx_fpu_dirty_intercept();
             break;
-        case TRAP_page_fault:
+        case X86_EXC_PF:
             __vmread(EXIT_QUALIFICATION, &exit_qualification);
             __vmread(VM_EXIT_INTR_ERROR_CODE, &ecode);
             regs->error_code = ecode;
@@ -4371,22 +4370,22 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
             hvm_inject_page_fault(regs->error_code, exit_qualification);
             break;
-        case TRAP_alignment_check:
+        case X86_EXC_AC:
             HVMTRACE_1D(TRAP, vector);
             vmx_propagate_intr(intr_info);
             break;
-        case TRAP_nmi:
+        case X86_EXC_NMI:
             if ( MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) !=
                  X86_EVENTTYPE_NMI )
                 goto exit_and_crash;
             HVMTRACE_0D(NMI);
             /* Already handled above. */
             break;
-        case TRAP_machine_check:
+        case X86_EXC_MC:
             HVMTRACE_0D(MCE);
             /* Already handled above. */
             break;
-        case TRAP_invalid_op:
+        case X86_EXC_UD:
             HVMTRACE_1D(TRAP, vector);
             hvm_ud_intercept(regs);
             break;
@@ -4467,7 +4466,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
     case EXIT_REASON_RDTSCP:
         if ( !currd->arch.cpuid->extd.rdtscp )
         {
-            hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
             break;
         }
 
@@ -4508,7 +4507,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
             break;
 
         case X86EMUL_EXCEPTION:
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
             break;
         }
         break;
@@ -4522,7 +4521,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
             break;
 
         case X86EMUL_EXCEPTION:
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
             break;
         }
         break;
@@ -4544,7 +4543,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
     case EXIT_REASON_VMFUNC:
         if ( vmx_vmfunc_intercept(regs) != X86EMUL_OKAY )
-            hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         else
             update_guest_eip();
         break;
@@ -4558,7 +4557,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
          * as far as vmexit.
          */
         WARN_ON(exit_reason == EXIT_REASON_GETSEC);
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         break;
 
     case EXIT_REASON_TPR_BELOW_THRESHOLD:
@@ -4566,7 +4565,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
     case EXIT_REASON_APIC_ACCESS:
         if ( !vmx_handle_eoi_write() && !handle_mmio() )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
         break;
 
     case EXIT_REASON_EOI_INDUCED:
@@ -4583,7 +4582,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         {
             /* INS, OUTS */
             if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
-                hvm_inject_hw_exception(TRAP_gp_fault, 0);
+                hvm_inject_hw_exception(X86_EXC_GP, 0);
         }
         else
         {
@@ -4714,7 +4713,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         gprintk(XENLOG_ERR, "Unexpected vmexit: reason %lu\n", exit_reason);
 
         if ( vmx_get_cpl() )
-            hvm_inject_hw_exception(TRAP_invalid_op,
+            hvm_inject_hw_exception(X86_EXC_UD,
                                     X86_EVENT_NO_EC);
         else
             domain_crash(v->domain);
@@ -4745,7 +4744,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         {
             __vmread(VM_ENTRY_INTR_INFO, &intr_info);
             if ( !(intr_info & INTR_INFO_VALID_MASK) )
-                hvm_inject_hw_exception(TRAP_gp_fault, 0);
+                hvm_inject_hw_exception(X86_EXC_GP, 0);
             /* Need to fix rIP nevertheless. */
             if ( mode == 8 )
                 regs->rip = (long)(regs->rip << (64 - VADDR_BITS)) >>
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 674cdabb0736..27221fdb733b 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -474,7 +474,7 @@ static int decode_vmx_inst(struct cpu_user_regs *regs,
     return X86EMUL_OKAY;
 
 gp_fault:
-    hvm_inject_hw_exception(TRAP_gp_fault, 0);
+    hvm_inject_hw_exception(X86_EXC_GP, 0);
     return X86EMUL_EXCEPTION;
 }
 
@@ -526,7 +526,7 @@ bool cf_check nvmx_intercepts_exception(
     exception_bitmap = get_vvmcs(v, EXCEPTION_BITMAP);
     r = exception_bitmap & (1 << vector) ? 1: 0;
 
-    if ( vector == TRAP_page_fault )
+    if ( vector == X86_EXC_PF )
     {
         pfec_match = get_vvmcs(v, PAGE_FAULT_ERROR_CODE_MATCH);
         pfec_mask  = get_vvmcs(v, PAGE_FAULT_ERROR_CODE_MASK);
@@ -1100,15 +1100,15 @@ static void load_shadow_guest_state(struct vcpu *v)
 
     rc = hvm_set_cr4(get_vvmcs(v, GUEST_CR4), true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
 
     rc = hvm_set_cr0(get_vvmcs(v, GUEST_CR0), true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
 
     rc = hvm_set_cr3(get_vvmcs(v, GUEST_CR3), false, true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
 
     control = get_vvmcs(v, VM_ENTRY_CONTROLS);
     if ( control & VM_ENTRY_LOAD_GUEST_PAT )
@@ -1118,7 +1118,7 @@ static void load_shadow_guest_state(struct vcpu *v)
         rc = hvm_msr_write_intercept(MSR_CORE_PERF_GLOBAL_CTRL,
                                      get_vvmcs(v, GUEST_PERF_GLOBAL_CTRL), false);
         if ( rc == X86EMUL_EXCEPTION )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
     }
 
     hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset, 0);
@@ -1314,15 +1314,15 @@ static void load_vvmcs_host_state(struct vcpu *v)
 
     rc = hvm_set_cr4(get_vvmcs(v, HOST_CR4), true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
 
     rc = hvm_set_cr0(get_vvmcs(v, HOST_CR0), true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
 
     rc = hvm_set_cr3(get_vvmcs(v, HOST_CR3), false, true);
     if ( rc == X86EMUL_EXCEPTION )
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
 
     control = get_vvmcs(v, VM_EXIT_CONTROLS);
     if ( control & VM_EXIT_LOAD_HOST_PAT )
@@ -1332,7 +1332,7 @@ static void load_vvmcs_host_state(struct vcpu *v)
         rc = hvm_msr_write_intercept(MSR_CORE_PERF_GLOBAL_CTRL,
                                      get_vvmcs(v, HOST_PERF_GLOBAL_CTRL), true);
         if ( rc == X86EMUL_EXCEPTION )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
     }
 
     hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset, 0);
@@ -2083,13 +2083,13 @@ int nvmx_handle_vmx_insn(struct cpu_user_regs *regs, unsigned int exit_reason)
          (vmx_guest_x86_mode(curr) < (hvm_long_mode_active(curr) ? 8 : 2)) ||
          (exit_reason != EXIT_REASON_VMXON && !nvmx_vcpu_in_vmx(curr)) )
     {
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         return X86EMUL_EXCEPTION;
     }
 
     if ( vmx_get_cpl() > 0 )
     {
-        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        hvm_inject_hw_exception(X86_EXC_GP, 0);
         return X86EMUL_EXCEPTION;
     }
 
@@ -2464,12 +2464,12 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
          * decided by L0 and L1 exception bitmap, if the vetor is set by
          * both, L0 has priority on #PF and #NM, L1 has priority on others
          */
-        if ( vector == TRAP_page_fault )
+        if ( vector == X86_EXC_PF )
         {
             if ( paging_mode_hap(v->domain) )
                 nvcpu->nv_vmexit_pending = 1;
         }
-        else if ( vector == TRAP_no_device )
+        else if ( vector == X86_EXC_NM )
         {
             if ( v->fpu_dirtied )
                 nvcpu->nv_vmexit_pending = 1;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b5354c367750..296a1ee79127 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -722,7 +722,7 @@ static inline void pv_inject_hw_exception(unsigned int vector, int errcode)
 static inline void pv_inject_page_fault(int errcode, unsigned long cr2)
 {
     const struct x86_event event = {
-        .vector = TRAP_page_fault,
+        .vector = X86_EXC_PF,
         .type = X86_EVENTTYPE_HW_EXCEPTION,
         .error_code = errcode,
         .cr2 = cr2,
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 43d3fc249887..258e0a1f2931 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -540,7 +540,7 @@ static inline void hvm_inject_hw_exception(unsigned int vector, int errcode)
 static inline void hvm_inject_page_fault(int errcode, unsigned long cr2)
 {
     struct x86_event event = {
-        .vector = TRAP_page_fault,
+        .vector = X86_EXC_PF,
         .type = X86_EVENTTYPE_HW_EXCEPTION,
         .error_code = errcode,
         .cr2 = cr2,
@@ -564,9 +564,9 @@ static inline void hvm_invlpg(struct vcpu *v, unsigned long linear)
     (X86_CR4_VMXE | X86_CR4_PAE | X86_CR4_MCE))
 
 /* These exceptions must always be intercepted. */
-#define HVM_TRAP_MASK ((1U << TRAP_debug)           | \
-                       (1U << TRAP_alignment_check) | \
-                       (1U << TRAP_machine_check))
+#define HVM_TRAP_MASK ((1U << X86_EXC_DB)           | \
+                       (1U << X86_EXC_AC) | \
+                       (1U << X86_EXC_MC))
 
 /* Called in boot/resume paths.  Must cope with no HVM support. */
 static inline int hvm_cpu_up(void)
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8725e0df11e9..2095d9a4e28d 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -17,34 +17,6 @@
 #include <asm/x86-defns.h>
 #include <asm/x86-vendors.h>
 
-/*
- * Trap/fault mnemonics.
- */
-#define TRAP_divide_error      0
-#define TRAP_debug             1
-#define TRAP_nmi               2
-#define TRAP_int3              3
-#define TRAP_overflow          4
-#define TRAP_bounds            5
-#define TRAP_invalid_op        6
-#define TRAP_no_device         7
-#define TRAP_double_fault      8
-#define TRAP_copro_seg         9
-#define TRAP_invalid_tss      10
-#define TRAP_no_segment       11
-#define TRAP_stack_error      12
-#define TRAP_gp_fault         13
-#define TRAP_page_fault       14
-#define TRAP_spurious_int     15
-#define TRAP_copro_error      16
-#define TRAP_alignment_check  17
-#define TRAP_machine_check    18
-#define TRAP_simd_error       19
-#define TRAP_virtualisation   20
-#define TRAP_nr               32
-
-#define TRAP_HAVE_EC X86_EXC_HAVE_EC
-
 /* Set for entry via SYSCALL. Informs return code to use SYSRETQ not IRETQ. */
 /* NB. Same as VGCF_in_syscall. No bits in common with any other TRAP_ defn. */
 #define TRAP_syscall         256
@@ -431,18 +403,18 @@ static inline void set_ist(idt_entry_t *idt, unsigned int ist)
 
 static inline void enable_each_ist(idt_entry_t *idt)
 {
-    set_ist(&idt[TRAP_double_fault],  IST_DF);
-    set_ist(&idt[TRAP_nmi],           IST_NMI);
-    set_ist(&idt[TRAP_machine_check], IST_MCE);
-    set_ist(&idt[TRAP_debug],         IST_DB);
+    set_ist(&idt[X86_EXC_DF],  IST_DF);
+    set_ist(&idt[X86_EXC_NMI], IST_NMI);
+    set_ist(&idt[X86_EXC_MC],  IST_MCE);
+    set_ist(&idt[X86_EXC_DB],  IST_DB);
 }
 
 static inline void disable_each_ist(idt_entry_t *idt)
 {
-    set_ist(&idt[TRAP_double_fault],  IST_NONE);
-    set_ist(&idt[TRAP_nmi],           IST_NONE);
-    set_ist(&idt[TRAP_machine_check], IST_NONE);
-    set_ist(&idt[TRAP_debug],         IST_NONE);
+    set_ist(&idt[X86_EXC_DF],  IST_NONE);
+    set_ist(&idt[X86_EXC_NMI], IST_NONE);
+    set_ist(&idt[X86_EXC_MC],  IST_NONE);
+    set_ist(&idt[X86_EXC_DB],  IST_NONE);
 }
 
 #define IDT_ENTRIES 256
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index fe1caba6f819..e350227e57eb 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -147,6 +147,8 @@
 #define X86_EXC_VC            29 /* VMM Communication */
 #define X86_EXC_SX            30 /* Security Exception */
 
+#define X86_EXC_NUM           32 /* 32 reserved vectors */
+
 /* Bitmap of exceptions which have error codes. */
 #define X86_EXC_HAVE_EC                                             \
     ((1u << X86_EXC_DF) | (1u << X86_EXC_TS) | (1u << X86_EXC_NP) | \
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index 1dd0c9aad802..d50772ad6ca3 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -170,7 +170,7 @@ void machine_kexec(struct kexec_image *image)
     {
         if ( idt_tables[i] == NULL )
             continue;
-        _update_gate_addr_lower(&idt_tables[i][TRAP_machine_check], &trap_nop);
+        _update_gate_addr_lower(&idt_tables[i][X86_EXC_MC], &trap_nop);
     }
 
     /* Reset CPUID masking and faulting to the host's default. */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0fe14faa5fa7..8e6d000950f8 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1232,7 +1232,7 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
         gprintk(XENLOG_WARNING,
                 "Attempt to implicitly unmap %pd's grant PTE %" PRIpte "\n",
                 l1e_owner, l1e_get_intpte(l1e));
-        pv_inject_hw_exception(TRAP_gp_fault, 0);
+        pv_inject_hw_exception(X86_EXC_GP, 0);
     }
 #endif
 
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index f3aed9fcc966..676d92297368 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -219,7 +219,7 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
          npfec.kind == npfec_kind_in_gpt )
     {
         v->arch.vm_event->send_event = true;
-        hvm_emulate_one_vm_event(EMUL_KIND_NORMAL, TRAP_invalid_op, X86_EVENT_NO_EC);
+        hvm_emulate_one_vm_event(EMUL_KIND_NORMAL, X86_EXC_UD, X86_EVENT_NO_EC);
         v->arch.vm_event->send_event = false;
 
         return true;
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 88c3c16322f2..1bc24e41ba12 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -98,7 +98,7 @@ static int hvm_translate_virtual_addr(
          */
         if ( is_x86_user_segment(seg) )
             x86_emul_hw_exception(
-                (seg == x86_seg_ss) ? TRAP_stack_error : TRAP_gp_fault,
+                (seg == x86_seg_ss) ? X86_EXC_SS : X86_EXC_GP,
                 0, &sh_ctxt->ctxt);
         return X86EMUL_EXCEPTION;
     }
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 5f3e175bbe03..252fede87d7f 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2745,9 +2745,9 @@ static int cf_check sh_page_fault(
          * stream under Xen's feet.
          */
         if ( emul_ctxt.ctxt.event.type == X86_EVENTTYPE_HW_EXCEPTION &&
-             ((emul_ctxt.ctxt.event.vector == TRAP_page_fault) ||
-              (((emul_ctxt.ctxt.event.vector == TRAP_gp_fault) ||
-                (emul_ctxt.ctxt.event.vector == TRAP_stack_error)) &&
+             ((emul_ctxt.ctxt.event.vector == X86_EXC_PF) ||
+              (((emul_ctxt.ctxt.event.vector == X86_EXC_GP) ||
+                (emul_ctxt.ctxt.event.vector == X86_EXC_SS)) &&
                emul_ctxt.ctxt.event.error_code == 0)) )
             hvm_inject_event(&emul_ctxt.ctxt.event);
         else
@@ -2809,7 +2809,7 @@ static int cf_check sh_page_fault(
 #endif
 
     if ( emul_ctxt.ctxt.retire.singlestep )
-        hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 
 #if GUEST_PAGING_LEVELS == 3 /* PAE guest */
     /*
@@ -2850,7 +2850,7 @@ static int cf_check sh_page_fault(
                 TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_EMULATION_LAST_FAILED);
 
                 if ( emul_ctxt.ctxt.retire.singlestep )
-                    hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+                    hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 
                 break; /* Don't emulate again if we failed! */
             }
diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index 067ee3b795d0..ca3bc30e91ba 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -29,12 +29,12 @@ static int register_guest_nmi_callback(unsigned long address)
 {
     struct vcpu *curr = current;
     struct domain *d = curr->domain;
-    struct trap_info *t = &curr->arch.pv.trap_ctxt[TRAP_nmi];
+    struct trap_info *t = &curr->arch.pv.trap_ctxt[X86_EXC_NMI];
 
     if ( !is_canonical_address(address) )
         return -EINVAL;
 
-    t->vector  = TRAP_nmi;
+    t->vector  = X86_EXC_NMI;
     t->flags   = 0;
     t->cs      = (is_pv_32bit_domain(d) ?
                   FLAT_COMPAT_KERNEL_CS : FLAT_KERNEL_CS);
@@ -54,7 +54,7 @@ static int register_guest_nmi_callback(unsigned long address)
 static void unregister_guest_nmi_callback(void)
 {
     struct vcpu *curr = current;
-    struct trap_info *t = &curr->arch.pv.trap_ctxt[TRAP_nmi];
+    struct trap_info *t = &curr->arch.pv.trap_ctxt[X86_EXC_NMI];
 
     memset(t, 0, sizeof(*t));
 }
diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
index 758a20ad9df4..9524982e7d2d 100644
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -185,12 +185,12 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
          (((ar >> 13) & 3) < (regs->cs & 3)) ||
          ((ar & _SEGMENT_TYPE) != 0xc00) )
     {
-        pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+        pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
         return;
     }
     if ( !(ar & _SEGMENT_P) )
     {
-        pv_inject_hw_exception(TRAP_no_segment, regs->error_code);
+        pv_inject_hw_exception(X86_EXC_NP, regs->error_code);
         return;
     }
     dpl = (ar >> 13) & 3;
@@ -206,7 +206,7 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
          !(ar & _SEGMENT_P) ||
          !(ar & _SEGMENT_CODE) )
     {
-        pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+        pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
         return;
     }
 
@@ -219,7 +219,7 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
         if ( PTR_ERR(state) == -X86EMUL_EXCEPTION )
             pv_inject_event(&ctxt.ctxt.event);
         else
-            pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+            pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
         return;
     }
 
@@ -268,7 +268,7 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
          (opnd_sel & ~3) != regs->error_code ||
          dpl < (opnd_sel & 3) )
     {
-        pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+        pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
         return;
     }
 
@@ -279,17 +279,17 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
           ((ar >> 13) & 3) > (regs->cs & 3) :
           ((ar >> 13) & 3) != (regs->cs & 3)) )
     {
-        pv_inject_hw_exception(TRAP_gp_fault, sel);
+        pv_inject_hw_exception(X86_EXC_GP, sel);
         return;
     }
     if ( !(ar & _SEGMENT_P) )
     {
-        pv_inject_hw_exception(TRAP_no_segment, sel);
+        pv_inject_hw_exception(X86_EXC_NP, sel);
         return;
     }
     if ( off > limit )
     {
-        pv_inject_hw_exception(TRAP_gp_fault, 0);
+        pv_inject_hw_exception(X86_EXC_GP, 0);
         return;
     }
 
@@ -316,7 +316,7 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
             /* Inner stack known only for kernel ring. */
             if ( (sel & 3) != GUEST_KERNEL_RPL(v->domain) )
             {
-                pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+                pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
                 return;
             }
             esp = v->arch.pv.kernel_sp;
@@ -328,19 +328,19 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
                  (ar & _SEGMENT_CODE) ||
                  !(ar & _SEGMENT_WR) )
             {
-                pv_inject_hw_exception(TRAP_invalid_tss, ss & ~3);
+                pv_inject_hw_exception(X86_EXC_TS, ss & ~3);
                 return;
             }
             if ( !(ar & _SEGMENT_P) ||
                  !check_stack_limit(ar, limit, esp, (4 + nparm) * 4) )
             {
-                pv_inject_hw_exception(TRAP_stack_error, ss & ~3);
+                pv_inject_hw_exception(X86_EXC_SS, ss & ~3);
                 return;
             }
             stkp = (unsigned int *)(unsigned long)((unsigned int)base + esp);
             if ( !compat_access_ok(stkp - 4 - nparm, 16 + nparm * 4) )
             {
-                pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+                pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
                 return;
             }
             push(regs->ss);
@@ -356,12 +356,12 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
                      (ar & _SEGMENT_CODE) ||
                      !(ar & _SEGMENT_WR) ||
                      !check_stack_limit(ar, limit, esp + nparm * 4, nparm * 4) )
-                    return pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+                    return pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
                 ustkp = (unsigned int *)(unsigned long)
                         ((unsigned int)base + regs->esp + nparm * 4);
                 if ( !compat_access_ok(ustkp - nparm, 0 + nparm * 4) )
                 {
-                    pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+                    pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
                     return;
                 }
                 do
@@ -387,18 +387,18 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
             if ( !pv_emul_read_descriptor(ss, v, &base, &limit, &ar, 0) ||
                  ((ar >> 13) & 3) != (sel & 3) )
             {
-                pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+                pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
                 return;
             }
             if ( !check_stack_limit(ar, limit, esp, 2 * 4) )
             {
-                pv_inject_hw_exception(TRAP_stack_error, 0);
+                pv_inject_hw_exception(X86_EXC_SS, 0);
                 return;
             }
             stkp = (unsigned int *)(unsigned long)((unsigned int)base + esp);
             if ( !compat_access_ok(stkp - 2, 2 * 4) )
             {
-                pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+                pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
                 return;
             }
         }
diff --git a/xen/arch/x86/pv/emul-inv-op.c b/xen/arch/x86/pv/emul-inv-op.c
index 2c07eed9a092..32eb34e1a291 100644
--- a/xen/arch/x86/pv/emul-inv-op.c
+++ b/xen/arch/x86/pv/emul-inv-op.c
@@ -57,7 +57,7 @@ static int emulate_forced_invalid_op(struct cpu_user_regs *regs)
          !guest_kernel_mode(current, regs) )
     {
         regs->rip = eip;
-        pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+        pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
         return EXCRET_fault_fixed;
     }
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 5da00e24e4ff..5ef8c184ed66 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -609,8 +609,7 @@ static int pv_emul_virt_to_linear(unsigned long base, unsigned long offset,
         rc = X86EMUL_EXCEPTION;
 
     if ( unlikely(rc == X86EMUL_EXCEPTION) )
-        x86_emul_hw_exception(seg != x86_seg_ss ? TRAP_gp_fault
-                                                : TRAP_stack_error,
+        x86_emul_hw_exception(seg != x86_seg_ss ? X86_EXC_GP : X86_EXC_SS,
                               0, ctxt);
 
     return rc;
@@ -645,7 +644,7 @@ static int cf_check rep_ins(
          (sreg.type & (_SEGMENT_CODE >> 8)) ||
          !(sreg.type & (_SEGMENT_WR >> 8)) )
     {
-        x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+        x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
         return X86EMUL_EXCEPTION;
     }
 
@@ -711,8 +710,7 @@ static int cf_check rep_outs(
          ((sreg.type & (_SEGMENT_CODE >> 8)) &&
           !(sreg.type & (_SEGMENT_WR >> 8))) )
     {
-        x86_emul_hw_exception(seg != x86_seg_ss ? TRAP_gp_fault
-                                                : TRAP_stack_error,
+        x86_emul_hw_exception(seg != x86_seg_ss ? X86_EXC_GP : X86_EXC_SS,
                               0, ctxt);
         return X86EMUL_EXCEPTION;
     }
@@ -893,7 +891,7 @@ static int cf_check read_msr(
     if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
     {
         if ( ret == X86EMUL_EXCEPTION )
-            x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+            x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
 
         goto done;
     }
@@ -1041,7 +1039,7 @@ static int cf_check write_msr(
     if ( (ret = guest_wrmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
     {
         if ( ret == X86EMUL_EXCEPTION )
-            x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+            x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
 
         return ret;
     }
@@ -1376,7 +1374,7 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
         {
             curr->arch.dr6 |= ctxt.bpmatch | DR_STATUS_RESERVED_ONE;
             if ( !(curr->arch.pv.trap_bounce.flags & TBF_EXCEPTION) )
-                pv_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+                pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
         }
         /* fall through */
     case X86EMUL_RETRY:
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index 0a7907ec5e84..2eff77c577e5 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -86,7 +86,7 @@ void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip)
     if ( regs->eflags & X86_EFLAGS_TF )
     {
         current->arch.dr6 |= DR_STEP | DR_STATUS_RESERVED_ONE;
-        pv_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+        pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
     }
 }
 
diff --git a/xen/arch/x86/pv/iret.c b/xen/arch/x86/pv/iret.c
index 316a23e77eb7..d3a1fb2c685b 100644
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -186,7 +186,7 @@ int compat_iret(void)
         regs->esp = ksp;
         regs->ss = v->arch.pv.kernel_ss;
 
-        ti = &v->arch.pv.trap_ctxt[TRAP_gp_fault];
+        ti = &v->arch.pv.trap_ctxt[X86_EXC_GP];
         if ( TI_GET_IF(ti) )
             eflags &= ~X86_EFLAGS_IF;
         regs->eflags &= ~(X86_EFLAGS_VM|X86_EFLAGS_RF|
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 5963f5ee2d51..d1fdbff0e909 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -390,7 +390,7 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
          * or a guest playing with the instruction stream under Xen's feet.
          */
         if ( ctxt.event.type == X86_EVENTTYPE_HW_EXCEPTION &&
-             ctxt.event.vector == TRAP_page_fault )
+             ctxt.event.vector == X86_EXC_PF )
             pv_inject_event(&ctxt.event);
         else
             gdprintk(XENLOG_WARNING,
@@ -400,7 +400,7 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
         /* Fallthrough */
     case X86EMUL_OKAY:
         if ( ctxt.retire.singlestep )
-            pv_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 
         /* Fallthrough */
     case X86EMUL_RETRY:
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 21f4860f7832..e3e030a5051b 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -43,7 +43,7 @@ void pv_inject_event(const struct x86_event *event)
     if ( event->type == X86_EVENTTYPE_HW_EXCEPTION )
     {
         ASSERT(vector < 32);
-        use_error_code = TRAP_HAVE_EC & (1u << vector);
+        use_error_code = X86_EXC_HAVE_EC & (1u << vector);
     }
     else
     {
@@ -63,7 +63,7 @@ void pv_inject_event(const struct x86_event *event)
     tb->eip   = ti->address;
 
     if ( event->type == X86_EVENTTYPE_HW_EXCEPTION &&
-         vector == TRAP_page_fault )
+         vector == X86_EXC_PF )
     {
         curr->arch.pv.ctrlreg[2] = event->cr2;
         arch_set_cr2(curr, event->cr2);
@@ -93,7 +93,7 @@ void pv_inject_event(const struct x86_event *event)
                 "Unhandled: vec %u, %s[%04x]\n",
                 vector, vector_name(vector), error_code);
 
-        if ( vector == TRAP_page_fault )
+        if ( vector == X86_EXC_PF )
             show_page_walk(event->cr2);
     }
 }
@@ -107,7 +107,7 @@ bool set_guest_machinecheck_trapbounce(void)
     struct vcpu *curr = current;
     struct trap_bounce *tb = &curr->arch.pv.trap_bounce;
 
-    pv_inject_hw_exception(TRAP_machine_check, X86_EVENT_NO_EC);
+    pv_inject_hw_exception(X86_EXC_MC, X86_EVENT_NO_EC);
     tb->flags &= ~TBF_EXCEPTION; /* not needed for MCE delivery path */
 
     return !null_trap_bounce(curr, tb);
@@ -122,7 +122,7 @@ bool set_guest_nmi_trapbounce(void)
     struct vcpu *curr = current;
     struct trap_bounce *tb = &curr->arch.pv.trap_bounce;
 
-    pv_inject_hw_exception(TRAP_nmi, X86_EVENT_NO_EC);
+    pv_inject_hw_exception(X86_EXC_NMI, X86_EVENT_NO_EC);
     tb->flags &= ~TBF_EXCEPTION; /* not needed for NMI delivery path */
 
     return !null_trap_bounce(curr, tb);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index bfd335777177..25a0c666cc14 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -805,7 +805,7 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
 
         show_execution_state(regs);
 
-        if ( trapnr == TRAP_page_fault )
+        if ( trapnr == X86_EXC_PF )
             show_page_walk(read_cr2());
 
         if ( show_remote )
@@ -944,7 +944,7 @@ void do_trap(struct cpu_user_regs *regs)
     if ( guest_mode(regs) )
     {
         pv_inject_hw_exception(trapnr,
-                               (TRAP_HAVE_EC & (1u << trapnr))
+                               (X86_EXC_HAVE_EC & (1u << trapnr))
                                ? regs->error_code : X86_EVENT_NO_EC);
         return;
     }
@@ -1176,7 +1176,7 @@ void do_invalid_op(struct cpu_user_regs *regs)
     if ( likely(guest_mode(regs)) )
     {
         if ( pv_emulate_invalid_op(regs) )
-            pv_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
+            pv_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         return;
     }
 
@@ -1241,7 +1241,7 @@ void do_invalid_op(struct cpu_user_regs *regs)
     case BUGFRAME_bug:
         printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
 
-        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
+        if ( debugger_trap_fatal(X86_EXC_UD, regs) )
             return;
 
         show_execution_state(regs);
@@ -1256,7 +1256,7 @@ void do_invalid_op(struct cpu_user_regs *regs)
         printk("Assertion '%s' failed at %s%s:%d\n",
                predicate, prefix, filename, lineno);
 
-        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
+        if ( debugger_trap_fatal(X86_EXC_UD, regs) )
             return;
 
         show_execution_state(regs);
@@ -1268,11 +1268,11 @@ void do_invalid_op(struct cpu_user_regs *regs)
     if ( likely(extable_fixup(regs, true)) )
         return;
 
-    if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
+    if ( debugger_trap_fatal(X86_EXC_UD, regs) )
         return;
 
     show_execution_state(regs);
-    panic("FATAL TRAP: vector = %d (invalid opcode)\n", TRAP_invalid_op);
+    panic("FATAL TRAP: vector = %d (invalid opcode)\n", X86_EXC_UD);
 }
 
 void do_int3(struct cpu_user_regs *regs)
@@ -1284,7 +1284,7 @@ void do_int3(struct cpu_user_regs *regs)
         if ( likely(extable_fixup(regs, true)) )
             return;
 
-        if ( !debugger_trap_fatal(TRAP_int3, regs) )
+        if ( !debugger_trap_fatal(X86_EXC_BP, regs) )
             printk(XENLOG_DEBUG "Hit embedded breakpoint at %p [%ps]\n",
                    _p(regs->rip), _p(regs->rip));
 
@@ -1293,12 +1293,12 @@ void do_int3(struct cpu_user_regs *regs)
 
     if ( guest_kernel_mode(curr, regs) && curr->domain->debugger_attached )
     {
-        curr->arch.gdbsx_vcpu_event = TRAP_int3;
+        curr->arch.gdbsx_vcpu_event = X86_EXC_BP;
         domain_pause_for_debugger();
         return;
     }
 
-    pv_inject_hw_exception(TRAP_int3, X86_EVENT_NO_EC);
+    pv_inject_hw_exception(X86_EXC_BP, X86_EVENT_NO_EC);
 }
 
 void do_general_protection(struct cpu_user_regs *regs)
@@ -1363,7 +1363,7 @@ void do_general_protection(struct cpu_user_regs *regs)
     }
 
     /* Pass on GPF as is. */
-    pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+    pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
     return;
 #endif
 
@@ -1372,7 +1372,7 @@ void do_general_protection(struct cpu_user_regs *regs)
         return;
 
  hardware_gp:
-    if ( debugger_trap_fatal(TRAP_gp_fault, regs) )
+    if ( debugger_trap_fatal(X86_EXC_GP, regs) )
         return;
 
     show_execution_state(regs);
@@ -1410,7 +1410,7 @@ static int handle_ldt_mapping_fault(unsigned int offset,
         {
             uint16_t ec = (offset & ~(X86_XEC_EXT | X86_XEC_IDT)) | X86_XEC_TI;
 
-            pv_inject_hw_exception(TRAP_gp_fault, ec);
+            pv_inject_hw_exception(X86_EXC_GP, ec);
         }
         else
             /* else pass the #PF back, with adjusted %cr2. */
@@ -1698,7 +1698,7 @@ void do_page_fault(struct cpu_user_regs *regs)
         }
 
     fatal:
-        if ( debugger_trap_fatal(TRAP_page_fault, regs) )
+        if ( debugger_trap_fatal(X86_EXC_PF, regs) )
             return;
 
         show_execution_state(regs);
@@ -1945,7 +1945,7 @@ void do_device_not_available(struct cpu_user_regs *regs)
 
     if ( curr->arch.pv.ctrlreg[0] & X86_CR0_TS )
     {
-        pv_inject_hw_exception(TRAP_no_device, X86_EVENT_NO_EC);
+        pv_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
         curr->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
     }
     else
@@ -2009,7 +2009,7 @@ void do_debug(struct cpu_user_regs *regs)
                 return;
             }
 #endif
-            if ( !debugger_trap_fatal(TRAP_debug, regs) )
+            if ( !debugger_trap_fatal(X86_EXC_DB, regs) )
             {
                 WARN();
                 regs->eflags &= ~X86_EFLAGS_TF;
@@ -2077,7 +2077,7 @@ void do_debug(struct cpu_user_regs *regs)
         return;
     }
 
-    pv_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+    pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 }
 
 void do_entry_CP(struct cpu_user_regs *regs)
diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index b86d38d1c50d..bd5abd8040bd 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -208,13 +208,13 @@ ENTRY(compat_syscall)
         leal  (,%rcx,TBF_INTERRUPT),%ecx
 UNLIKELY_START(z, compat_syscall_gpf)
         movq  VCPU_trap_ctxt(%rbx),%rdi
-        movl  $TRAP_gp_fault,UREGS_entry_vector(%rsp)
+        movl  $X86_EXC_GP, UREGS_entry_vector(%rsp)
         subl  $2,UREGS_rip(%rsp)
         /* %r12 is still zero at this point. */
         mov   %r12d, TRAPBOUNCE_error_code(%rdx)
-        movl  TRAP_gp_fault * TRAPINFO_sizeof + TRAPINFO_eip(%rdi),%eax
-        movzwl TRAP_gp_fault * TRAPINFO_sizeof + TRAPINFO_cs(%rdi),%esi
-        testb $4,TRAP_gp_fault * TRAPINFO_sizeof + TRAPINFO_flags(%rdi)
+        movl  X86_EXC_GP * TRAPINFO_sizeof + TRAPINFO_eip(%rdi),%eax
+        movzwl X86_EXC_GP * TRAPINFO_sizeof + TRAPINFO_cs(%rdi),%esi
+        testb $4, X86_EXC_GP * TRAPINFO_sizeof + TRAPINFO_flags(%rdi)
         setnz %cl
         leal  TBF_EXCEPTION|TBF_EXCEPTION_ERRCODE(,%rcx,TBF_INTERRUPT),%ecx
 UNLIKELY_END(compat_syscall_gpf)
@@ -226,9 +226,9 @@ UNLIKELY_END(compat_syscall_gpf)
 ENTRY(compat_sysenter)
         CR4_PV32_RESTORE
         movq  VCPU_trap_ctxt(%rbx),%rcx
-        cmpb  $TRAP_gp_fault,UREGS_entry_vector(%rsp)
+        cmpb  $X86_EXC_GP, UREGS_entry_vector(%rsp)
         movzwl VCPU_sysenter_sel(%rbx),%eax
-        movzwl TRAP_gp_fault * TRAPINFO_sizeof + TRAPINFO_cs(%rcx),%ecx
+        movzwl X86_EXC_GP * TRAPINFO_sizeof + TRAPINFO_cs(%rcx),%ecx
         cmovel %ecx,%eax
         testl $~3,%eax
         movl  $FLAT_COMPAT_USER_SS,UREGS_ss(%rsp)
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 6d7c15ce4371..16acd01c6087 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -413,10 +413,10 @@ UNLIKELY_END(sysenter_nt_set)
         leal  (,%rcx,TBF_INTERRUPT),%ecx
 UNLIKELY_START(z, sysenter_gpf)
         movq  VCPU_trap_ctxt(%rbx),%rsi
-        movl  $TRAP_gp_fault,UREGS_entry_vector(%rsp)
+        movl  $X86_EXC_GP, UREGS_entry_vector(%rsp)
         movl  %eax,TRAPBOUNCE_error_code(%rdx)
-        movq  TRAP_gp_fault * TRAPINFO_sizeof + TRAPINFO_eip(%rsi),%rax
-        testb $4,TRAP_gp_fault * TRAPINFO_sizeof + TRAPINFO_flags(%rsi)
+        movq  X86_EXC_GP * TRAPINFO_sizeof + TRAPINFO_eip(%rsi),%rax
+        testb $4, X86_EXC_GP * TRAPINFO_sizeof + TRAPINFO_flags(%rsi)
         setnz %cl
         leal  TBF_EXCEPTION|TBF_EXCEPTION_ERRCODE(,%rcx,TBF_INTERRUPT),%ecx
 UNLIKELY_END(sysenter_gpf)
@@ -507,7 +507,7 @@ int80_slow_path:
          * IDT entry with DPL==0.
          */
         movl  $((0x80 << 3) | X86_XEC_IDT),UREGS_error_code(%rsp)
-        movl  $TRAP_gp_fault,UREGS_entry_vector(%rsp)
+        movl  $X86_EXC_GP, UREGS_entry_vector(%rsp)
         /* A GPF wouldn't have incremented the instruction pointer. */
         subq  $2,UREGS_rip(%rsp)
         /*
@@ -693,7 +693,7 @@ ret_from_intr:
         .section .init.text, "ax", @progbits
 ENTRY(early_page_fault)
         ENDBR64
-        movl  $TRAP_page_fault, 4(%rsp)
+        movl  $X86_EXC_PF, 4(%rsp)
         SAVE_ALL
         movq  %rsp, %rdi
         call  do_early_page_fault
@@ -808,13 +808,13 @@ handle_exception_saved:
         jnz   .Lcr4_pv32_done
         /*
          * The below effectively is
-         * if ( regs->entry_vector == TRAP_page_fault &&
+         * if ( regs->entry_vector == X86_EXC_PF &&
          *      (regs->error_code & PFEC_page_present) &&
          *      !(regs->error_code & ~(PFEC_write_access|PFEC_insn_fetch)) )
          *     goto compat_test_all_events;
          */
         mov   $PFEC_page_present,%al
-        cmpb  $TRAP_page_fault,UREGS_entry_vector(%rsp)
+        cmpb  $X86_EXC_PF, UREGS_entry_vector(%rsp)
         jne   .Lcr4_pv32_done
         xor   UREGS_error_code(%rsp),%eax
         test  $~(PFEC_write_access|PFEC_insn_fetch),%eax
@@ -925,7 +925,7 @@ FATAL_exception_with_ints_disabled:
 
 ENTRY(entry_DF)
         ENDBR64
-        movl  $TRAP_double_fault,4(%rsp)
+        movl  $X86_EXC_DF, 4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
         ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
@@ -1047,7 +1047,7 @@ handle_ist_exception:
 .L_ist_dispatch_done:
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
-        cmpb  $TRAP_nmi,UREGS_entry_vector(%rsp)
+        cmpb  $X86_EXC_NMI, UREGS_entry_vector(%rsp)
         jne   ret_from_intr
 
         /* We want to get straight to the IRET on the NMI exit path. */
@@ -1118,7 +1118,7 @@ autogen_stubs: /* Automatically generated stubs. */
 
         /* Reserved exceptions, heading towards do_unhandled_trap(). */
         .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
-                vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < TRAP_nr)
+                vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < X86_EXC_NUM)
 
 1:
         ENDBR64
diff --git a/xen/arch/x86/x86_emulate.c b/xen/arch/x86/x86_emulate.c
index 8c7d18521807..9a502e04d68f 100644
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -78,7 +78,7 @@ int cf_check x86emul_read_xcr(
             break;
         /* fall through */
     default:
-        x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+        x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
         return X86EMUL_EXCEPTION;
     }
 
@@ -99,7 +99,7 @@ int cf_check x86emul_write_xcr(
     default:
     gp_fault:
         if ( ctxt )
-            x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+            x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
         return X86EMUL_EXCEPTION;
     }
 
@@ -146,7 +146,7 @@ int cf_check x86emul_read_dr(
     ud_fault:
     default:
         if ( ctxt )
-            x86_emul_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC, ctxt);
+            x86_emul_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC, ctxt);
 
         return X86EMUL_EXCEPTION;
     }
@@ -168,11 +168,11 @@ int cf_check x86emul_write_dr(
         return X86EMUL_OKAY;
 
     case -ENODEV:
-        x86_emul_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC, ctxt);
+        x86_emul_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC, ctxt);
         return X86EMUL_EXCEPTION;
 
     default:
-        x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
+        x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
         return X86EMUL_EXCEPTION;
     }
 }
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index bb7af967ffee..9644a9847950 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -90,7 +90,7 @@ struct x86_event {
     uint8_t       type;         /* X86_EVENTTYPE_* */
     uint8_t       insn_len;     /* Instruction length */
     int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
-    unsigned long cr2;          /* Only for TRAP_page_fault h/w exception */
+    unsigned long cr2;          /* Only for X86_EXC_PF h/w exception */
 };
 
 /*
@@ -835,7 +835,7 @@ static inline void x86_emul_pagefault(
 {
     ASSERT(!ctxt->event_pending);
 
-    ctxt->event.vector = 14; /* TRAP_page_fault */
+    ctxt->event.vector = X86_EXC_PF;
     ctxt->event.type = X86_EVENTTYPE_HW_EXCEPTION;
     ctxt->event.error_code = error_code;
     ctxt->event.cr2 = cr2;
-- 
2.30.2


