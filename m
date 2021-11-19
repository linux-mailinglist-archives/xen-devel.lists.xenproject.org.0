Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE82457654
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 19:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228182.394819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vz-0004AS-0Y; Fri, 19 Nov 2021 18:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228182.394819; Fri, 19 Nov 2021 18:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vy-00045P-OF; Fri, 19 Nov 2021 18:21:34 +0000
Received: by outflank-mailman (input) for mailman id 228182;
 Fri, 19 Nov 2021 18:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvWs=QG=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mo8Vw-0002lj-Di
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 18:21:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83ae3c8b-4965-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 19:21:29 +0100 (CET)
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
X-Inumbo-ID: 83ae3c8b-4965-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637346089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7vzlAG4/8XA2/yA95Szl0X1Xge6hpLYeA3lSnn/oSps=;
  b=gan2s9ZlVMXkLV7ZI2jx709pcF1HqVW4TaF8Fz7vHJt//1bSyVT7SeiQ
   fmIbED+EV3tkMBGSYmkYH8w6tzP55nO5vqEeYtIQzK7XZhuKFzDFlRRA0
   XLUScDQ8wcZ7IZat+UmrDGK4EjiJ/0bC7ENJHvP7+dfA1sP9+oT6g4JI8
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SQRwZzHJffDlvilNT5NvYAsz3ZTjeh2Lt7ERYVPUXYlpOl96AEHLVzHBIkSMuJA+R9dUwsgg1f
 XbhAhKGgbImjPgzk+HTCgKhw4x5aO01IYEDWZiJeHP7vFKtiISRNH84ExsGNkeqgYSiN/1WS6a
 qRIXpgrakB/aKMvi+MlJZcsMBiSgN22Wz2BbTGsc8pM/t6/jI/7dXzdoJHHlpGa2bkhKaCj46/
 jP8kJLTshKr5EDTOvCcUM9fEr4YN20FP2dqZ2myT/gdSDbWxQkJDXDL3CqNZBY5BVWc82BtoI8
 CnIPbQGiO6/HllARb4Z97ukP
X-SBRS: 5.1
X-MesageID: 58204893
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4ubKA6k8IGSEpChbyCrb8Dno5gxMIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdDz3TPaqNNmv0fdFyOY63pkxXusLTz9ZmQAdk/380RSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29c52YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OsOlaywdz4wB6fVg91BDCNmGHhwfoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKaEP
 5ZJOGEHgBLobhd+GQtLGq4Hluq23UKhfiZahkifqv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJuUM0K6D+005Pe+h2gWjc+cDUYZp8P4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud14WtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0tjA3Dt4ade51q2VtW
 lBexqByC8hUU/mweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehw2aJhcKG+0P
 R+P0e+02HO1FCH3BUOQS9jvY/nGMIC6TYi1PhwqRoQmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnWNrNNIcwlVdSNT6FKfg5U/S9Nv6zFOQAkJY8I9C5t7E2C8t6gKxOrO4
 F+nXUpUlAj2iXHdcF3YYXF/crL/G514qCtjbyArOF+p3VklYJqus/hDJ8dmI+F/+bwx1+NwQ
 tkEZ96EXqZFRAPY9mlPdpL6toFjKkim3FrcIyq/bTEjVJd8XAiVqMT8dw7i+XBWXCq6vMczu
 ZO60QbfTcZRTghuFp+OOvmu00mwrT4Wn+crBxnEJdxaeUPN9ol2KnOu0q9rcp9UcRian2mUz
 QebBxsctNLhmY5t/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkVsW4YpxF7FnkfA369f1/uIIyw1lGDPAbkixC6MmKX6DhJEduqpIz75fmA23R
 kPQpYUKZeTXYJvoQAwLOQ4oTuWfzvVFyDDd4MM8LFj++CIqrqGMVl9fPkXUhSFQRFev3FjJH
 Qv1VBYq1jGC
IronPort-HdrOrdr: A9a23:qOJJS61WLZPOYjWGPFz+ZwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,248,1631592000"; 
   d="scan'208";a="58204893"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/5] x86/traps: Drop exception_table[] and use if/else dispatching
Date: Fri, 19 Nov 2021 18:21:05 +0000
Message-ID: <20211119182106.14868-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211119182106.14868-1-andrew.cooper3@citrix.com>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is also a lot of redundancy in the table.  8 vectors head to do_trap(),
3 are handled in the IST logic, and that only leaves 7 others not heading to
the do_reserved_trap() catch-all.  This also removes the fragility that any
accidental NULL entry in the table becomes a ticking timebomb.

Function pointers are expensive under retpoline, and different vectors have
wildly different frequences.  Drop the indirect call, and use an if/else chain
instead, which is a code layout technique used by profile-guided optimsiation.

Using Xen's own perfcounter infrastructure, we see the following frequences of
vectors measured from boot until I can SSH into dom0 and collect the stats:

  vec | CFL-R   | Milan   | Notes
  ----+---------+---------+
  NMI |     345 |    3768 | Watchdog.  Milan has many more CPUs.
  ----+---------+---------+
  #PF | 1233234 | 2006441 |
  #GP |   90054 |   96193 |
  #UD |     848 |     851 |
  #NM |       0 |     132 | Per-vendor lazy vs eager FPU policy.
  #DB |      67 |      67 | No clue, but it's something in userspace.

Bloat-o-meter (after some manual insertion of ELF metadata) reports:

  add/remove: 0/1 grow/shrink: 2/0 up/down: 102/-256 (-154)
  Function                                     old     new   delta
  handle_exception_saved                       148     226     +78
  handle_ist_exception                         453     477     +24
  exception_table                              256       -    -256

showing that the if/else chains are less than half the size that
exception_table[] was in the first place.

As part of this change, make two other minor changes.  do_reserved_trap() is
renamed to do_unhandled_trap() because it is the catchall, and already covers
things that aren't reserved any more (#VE/#VC/#HV/#SX).

Furthermore, don't forward #TS to guests.  #TS is specifically for errors
relating to the Task State Segment, which is a Xen-owned structure, not a
guest-owned structure.  Even in the 32bit days, we never let guests register
their own Task State Segments.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Preliminary perf data says that there is no measurable difference with
bti-thunk=jmp.  bti-thunk=lfence shows up to a 3% improvement, and
bti-thunk=retpoline is expected to have a better improvement still.
---
 xen/arch/x86/traps.c            | 34 ++-------------------
 xen/arch/x86/x86_64/entry.S     | 67 ++++++++++++++++++++++++++++++++++++-----
 xen/include/asm-x86/processor.h |  3 --
 3 files changed, 62 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 096a411fdf94..e82ab007abcf 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -135,36 +135,6 @@ const unsigned int nmi_cpu;
 #define stack_words_per_line 4
 #define ESP_BEFORE_EXCEPTION(regs) ((unsigned long *)regs->rsp)
 
-static void do_trap(struct cpu_user_regs *regs);
-static void do_reserved_trap(struct cpu_user_regs *regs);
-
-void (* const exception_table[TRAP_nr])(struct cpu_user_regs *regs) = {
-    [TRAP_divide_error]                 = do_trap,
-    [TRAP_debug]                        = do_debug,
-    [TRAP_nmi]                          = (void *)do_nmi,
-    [TRAP_int3]                         = do_int3,
-    [TRAP_overflow]                     = do_trap,
-    [TRAP_bounds]                       = do_trap,
-    [TRAP_invalid_op]                   = do_invalid_op,
-    [TRAP_no_device]                    = do_device_not_available,
-    [TRAP_double_fault]                 = do_reserved_trap,
-    [TRAP_copro_seg]                    = do_reserved_trap,
-    [TRAP_invalid_tss]                  = do_trap,
-    [TRAP_no_segment]                   = do_trap,
-    [TRAP_stack_error]                  = do_trap,
-    [TRAP_gp_fault]                     = do_general_protection,
-    [TRAP_page_fault]                   = do_page_fault,
-    [TRAP_spurious_int]                 = do_reserved_trap,
-    [TRAP_copro_error]                  = do_trap,
-    [TRAP_alignment_check]              = do_trap,
-    [TRAP_machine_check]                = (void *)do_machine_check,
-    [TRAP_simd_error]                   = do_trap,
-    [TRAP_virtualisation]               = do_reserved_trap,
-    [X86_EXC_CP]                        = do_entry_CP,
-    [X86_EXC_CP + 1 ...
-     (ARRAY_SIZE(exception_table) - 1)] = do_reserved_trap,
-};
-
 void show_code(const struct cpu_user_regs *regs)
 {
     unsigned char insns_before[8] = {}, insns_after[16] = {};
@@ -881,7 +851,7 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
           (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
 }
 
-static void do_reserved_trap(struct cpu_user_regs *regs)
+void do_unhandled_trap(struct cpu_user_regs *regs)
 {
     unsigned int trapnr = regs->entry_vector;
 
@@ -973,7 +943,7 @@ static bool extable_fixup(struct cpu_user_regs *regs, bool print)
     return true;
 }
 
-static void do_trap(struct cpu_user_regs *regs)
+void do_trap(struct cpu_user_regs *regs)
 {
     unsigned int trapnr = regs->entry_vector;
 
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 3caa5654768d..3eaf0e67b2b9 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -773,14 +773,48 @@ handle_exception_saved:
         sti
 1:      movq  %rsp,%rdi
         movzbl UREGS_entry_vector(%rsp),%eax
-        leaq  exception_table(%rip),%rdx
 #ifdef CONFIG_PERF_COUNTERS
         lea   per_cpu__perfcounters(%rip), %rcx
         add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rcx
         incl  ASM_PERFC_exceptions * 4(%rcx, %rax, 4)
 #endif
-        mov   (%rdx, %rax, 8), %rdx
-        INDIRECT_CALL %rdx
+
+        /*
+         * Dispatch to appropriate C handlers.
+         *
+         * The logic is implemented as an if/else chain.  DISPATCH() calls
+         * need be in frequency order for best performance.
+         */
+#define DISPATCH(vec, handler)         \
+        cmp   $vec, %al;               \
+        jne   .L_ ## vec ## _done;     \
+        call  handler;                 \
+        jmp   .L_exn_dispatch_done;    \
+.L_ ## vec ## _done:
+
+        DISPATCH(X86_EXC_PF, do_page_fault)
+        DISPATCH(X86_EXC_GP, do_general_protection)
+        DISPATCH(X86_EXC_UD, do_invalid_op)
+        DISPATCH(X86_EXC_NM, do_device_not_available)
+        DISPATCH(X86_EXC_BP, do_int3)
+
+        /* Logically "if ( (1 << vec) & MASK ) { do_trap(); }" */
+        mov   $(1 << X86_EXC_DE) | (1 << X86_EXC_OF) | (1 << X86_EXC_BR) |\
+               (1 << X86_EXC_NP) | (1 << X86_EXC_SS) | (1 << X86_EXC_MF) |\
+               (1 << X86_EXC_AC) | (1 << X86_EXC_XM), %edx
+        bt    %eax, %edx
+        jnc   .L_do_trap_done
+        call  do_trap
+        jmp   .L_exn_dispatch_done
+.L_do_trap_done:
+
+        DISPATCH(X86_EXC_CP, do_entry_CP)
+#undef DISPATCH
+
+        call  do_unhandled_trap
+        BUG   /* do_unhandled_trap() shouldn't return. */
+
+.L_exn_dispatch_done:
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %r13b, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
 #ifdef CONFIG_PV
@@ -1012,9 +1046,28 @@ handle_ist_exception:
         incl  ASM_PERFC_exceptions * 4(%rcx, %rax, 4)
 #endif
 
-        leaq  exception_table(%rip),%rdx
-        mov   (%rdx, %rax, 8), %rdx
-        INDIRECT_CALL %rdx
+        /*
+         * Dispatch to appropriate C handlers.
+         *
+         * The logic is implemented as an if/else chain.  DISPATCH() calls
+         * need be in frequency order for best performance.
+         */
+#define DISPATCH(vec, handler)         \
+        cmp   $vec, %al;               \
+        jne   .L_ ## vec ## _done;     \
+        call  handler;                 \
+        jmp   .L_ist_dispatch_done;    \
+.L_ ## vec ## _done:
+
+        DISPATCH(X86_EXC_NMI, do_nmi)
+        DISPATCH(X86_EXC_DB,  do_debug)
+        DISPATCH(X86_EXC_MC,  do_machine_check)
+#undef DISPATCH
+
+        call  do_unhandled_trap
+        BUG   /* do_unhandled_trap() shouldn't return. */
+
+.L_ist_dispatch_done:
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         cmpb  $TRAP_nmi,UREGS_entry_vector(%rsp)
@@ -1088,7 +1141,7 @@ autogen_stubs: /* Automatically generated stubs. */
 
         entrypoint 1b
 
-        /* Reserved exceptions, heading towards do_reserved_trap(). */
+        /* Reserved exceptions, heading towards do_unhandled_trap(). */
         .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
                 vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < TRAP_nr)
 
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index bc4dc6925372..f031a050cba0 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -506,9 +506,6 @@ extern void mtrr_bp_init(void);
 
 void mcheck_init(struct cpuinfo_x86 *c, bool_t bsp);
 
-/* Dispatch table for exceptions */
-extern void (* const exception_table[TRAP_nr])(struct cpu_user_regs *regs);
-
 #define DECLARE_TRAP_HANDLER(_name)                    \
     void _name(void);                                  \
     void do_ ## _name(struct cpu_user_regs *regs)
-- 
2.11.0


