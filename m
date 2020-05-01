Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F263B1C2104
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 00:59:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUecY-0007um-J8; Fri, 01 May 2020 22:59:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUecX-0007uc-3v
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 22:59:01 +0000
X-Inumbo-ID: 57b00d78-8bff-11ea-9b6f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57b00d78-8bff-11ea-9b6f-12813bfff9fa;
 Fri, 01 May 2020 22:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588373939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mdKKOqqqJIKSsZmEMlIiWYVPPhe96GgpGtAJ8re5vaM=;
 b=AoZkj8XWAXySDVIlp67DaBa4KIy3gfhba0AtRgtQR/Vz/5hQfTsH4NnA
 f4DFSaUYpybfSrJ+1e7APrU4EEa0b0bsZ4E7muV8rYG8EyzerlvRBk6cE
 j9m7FlE2Xu9dik/pahXmWkpw7yho5jvf85uJM6DAreNkKgX53QCdJbSZw k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: et/aZxFKlhLg+JTjMM/J44nwQ0ngPJ/IIJz7GCRgGRYgzmeti5B6CJG2rdhI1RBGdRwd39Wlq6
 h+HTh7Oi0XBaTAI3Wl3YDd0HgoitKVBNijB0hbAUhJ8EjgnVhE9vKorVbjJ9UU3L0qrcHIvxDt
 z3n8egHgMpzXiCWGKWMRpyRccw6RG+Z/re9cosldoJx3OZSniZ6LrRMhx1/v13FziJZKu6qwLo
 w59xsYhop4A+lThdHGdBCYHBup0BCl/WOjbedOTFug7t6GXDvd7fLSyI7QqRIktI/JadpUh7WW
 hyE=
X-SBRS: 2.7
X-MesageID: 16905916
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16905916"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 06/16] x86/traps: Implement #CP handler and extend #PF for
 shadow stacks
Date: Fri, 1 May 2020 23:58:28 +0100
Message-ID: <20200501225838.9866-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
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
attempt to recover if taken in guest context.

Drop the comment beside do_page_fault().  It's stale (missing PFEC_prot_key),
and inaccurate (PFEC_present being set means just that, not necesserily a
protection violation).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/traps.c            | 55 ++++++++++++++++++++++++++++++++++-------
 xen/arch/x86/x86_64/entry.S     |  7 +++++-
 xen/include/asm-x86/processor.h |  2 ++
 3 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 737ab036d2..ddbe312f89 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -158,7 +158,9 @@ void (* const exception_table[TRAP_nr])(struct cpu_user_regs *regs) = {
     [TRAP_alignment_check]              = do_trap,
     [TRAP_machine_check]                = (void *)do_machine_check,
     [TRAP_simd_error]                   = do_trap,
-    [TRAP_virtualisation ...
+    [TRAP_virtualisation]               = do_reserved_trap,
+    [X86_EXC_CP]                        = do_entry_CP,
+    [X86_EXC_CP + 1 ...
      (ARRAY_SIZE(exception_table) - 1)] = do_reserved_trap,
 };
 
@@ -1427,14 +1429,6 @@ static int fixup_page_fault(unsigned long addr, struct cpu_user_regs *regs)
     return 0;
 }
 
-/*
- * #PF error code:
- *  Bit 0: Protection violation (=1) ; Page not present (=0)
- *  Bit 1: Write access
- *  Bit 2: User mode (=1) ; Supervisor mode (=0)
- *  Bit 3: Reserved bit violation
- *  Bit 4: Instruction fetch
- */
 void do_page_fault(struct cpu_user_regs *regs)
 {
     unsigned long addr;
@@ -1457,6 +1451,10 @@ void do_page_fault(struct cpu_user_regs *regs)
     {
         enum pf_type pf_type = spurious_page_fault(addr, regs);
 
+        /* Any fault on a shadow stack access is a bug in Xen. */
+        if ( error_code & PFEC_shstk )
+            goto fatal;
+
         if ( (pf_type == smep_fault) || (pf_type == smap_fault) )
         {
             console_start_sync();
@@ -1476,6 +1474,7 @@ void do_page_fault(struct cpu_user_regs *regs)
             return;
         }
 
+    fatal:
         if ( debugger_trap_fatal(TRAP_page_fault, regs) )
             return;
 
@@ -1906,6 +1905,43 @@ void do_debug(struct cpu_user_regs *regs)
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
@@ -1995,6 +2031,7 @@ void __init init_idt_traps(void)
     set_intr_gate(TRAP_alignment_check,&alignment_check);
     set_intr_gate(TRAP_machine_check,&machine_check);
     set_intr_gate(TRAP_simd_error,&simd_coprocessor_error);
+    set_intr_gate(X86_EXC_CP, entry_CP);
 
     /* Specify dedicated interrupt stacks for NMI, #DF, and #MC. */
     enable_each_ist(idt_table);
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index a3ce298529..6403c0ab92 100644
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
+        .elseif vec == TRAP_copro_seg || vec == TRAP_spurious_int || \
+                vec == TRAP_virtualisation || (vec > X86_EXC_CP && vec < TRAP_nr)
 
 1:      test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
         jz    2f             /* size is 8 bytes.  Check whether the processor gave us an */
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index 12b55e1022..5e8a0fb649 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -68,6 +68,7 @@
 #define PFEC_reserved_bit   (_AC(1,U) << 3)
 #define PFEC_insn_fetch     (_AC(1,U) << 4)
 #define PFEC_prot_key       (_AC(1,U) << 5)
+#define PFEC_shstk         (_AC(1,U) << 6)
 #define PFEC_arch_mask      (_AC(0xffff,U)) /* Architectural PFEC values. */
 /* Internally used only flags. */
 #define PFEC_page_paged     (1U<<16)
@@ -529,6 +530,7 @@ DECLARE_TRAP_HANDLER(coprocessor_error);
 DECLARE_TRAP_HANDLER(simd_coprocessor_error);
 DECLARE_TRAP_HANDLER_CONST(machine_check);
 DECLARE_TRAP_HANDLER(alignment_check);
+DECLARE_TRAP_HANDLER(entry_CP);
 
 DECLARE_TRAP_HANDLER(entry_int82);
 
-- 
2.11.0


