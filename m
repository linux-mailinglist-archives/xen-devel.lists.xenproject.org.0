Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3397A2839
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 22:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603367.940395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYg-00034j-VS; Fri, 15 Sep 2023 20:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603367.940395; Fri, 15 Sep 2023 20:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYg-0002yG-RV; Fri, 15 Sep 2023 20:36:58 +0000
Received: by outflank-mailman (input) for mailman id 603367;
 Fri, 15 Sep 2023 20:36:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhFYe-0001T8-NG
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 20:36:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c0cd3e6-5407-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 22:36:55 +0200 (CEST)
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
X-Inumbo-ID: 9c0cd3e6-5407-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694810215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7pJYZHPzU8x0uG9Kmv7KnKwz7KvKmzAYE+fSnqR0OLg=;
  b=dzUTd/a9BmKH2fH/IKhsp65KR23mNHMHIqV8DHSjApqlh+skHycmmsMR
   aZs12mPf+G1d7m1yGoB9zXUOcdQ9NXt4ZUDT4joPQ2EStL10E2Kkhwjog
   GRpZVMxvnuQ9pCY5QtVJnY6G4SX9wCxMSvB9FDltC4kP85u+WL1XTsxvZ
   A=;
X-CSE-ConnectionGUID: ppT/OAW6TKudgRIJZBmesA==
X-CSE-MsgGUID: SK/ZAoiLR4Kv18qcewfBKA==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125538997
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:MOXGg6rp5hRGHOLW2RlTTxY6xH5eBmIuZRIvgKrLsJaIsI4StFCzt
 garIBnQa/zYamOkfNAiatnno01QusPWzIc1GwJk/3xhQSxBoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5wePziRNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACgVUlekrt3o/JGmRuZWp+YRBszmJ6pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jucojmiUkBLa7RzzxK+0TWer+jOuRmne5xLRKSz++Fkqn66kzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBLT5utrqVD3GU8LjSrimaNi0cLGtEbigBJTbp+PG6/tt11EiWCI8+Tujs1Iad9SzML
 y6itDACwJI6spA39Li38mrmoQCGo5XSZ1tgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9jhYyjJ5fK6fTgAahwzRoMUCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoFrtNieV0ln1umDq7qXXHI/KPi+L2iJm9E+xtDbdzRrphsPPsTPv9r
 L6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5U/SwJ3GSI/QDtJI6aIkdscl3lNw/w9ehHgo
 ivsBSe1CTPX2RX6FOl9Qis6Mem3AMcu8SpT0O5FFQ/A5kXPqL2HtM83H6bbt5F2nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:kQ2NE6HeRIvr8G9EpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-Talos-CUID: 9a23:7VEG4W8gJmjriPtVbwqVv1YMJocCW0KD8FTNL0CCKERbYriYUnbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AXDVQ7Aw4zl8CXK39wcFZWDJAbqqaqJ+NT3IklpQ?=
 =?us-ascii?q?igZWnK3UgIjyQkzqdYaZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,150,1688443200"; 
   d="scan'208";a="125538997"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 7/7] x86/pv: Rewrite %dr6 handling
Date: Fri, 15 Sep 2023 21:36:28 +0100
Message-ID: <20230915203628.837732-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915203628.837732-1-andrew.cooper3@citrix.com>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All #DB exceptions result in an update of %dr6, but this isn't handled
properly by Xen for any guest type.

Remove all ad-hoc dr6 handling, leaving it to pv_inject_event() in most cases
and using the new x86_merge_dr6() helper.

In do_debug(), swap the dr6 to pending_dbg in order to operate entirely with
positive polarity.  Among other things, this helps spot RTM/BLD in the
diagnostic message.

Drop the unconditional v->arch.dr6 adjustment.  pv_inject_event() performs the
adjustment in the common case, but retain the prior behaviour if a debugger is
attached.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>

v2:
 * Split pieces out into an earlier patch.
 * Extend do_debug() to use pending_dbg entirely, rather than have the same
   variable used with different polarity at different times.
---
 xen/arch/x86/pv/emul-priv-op.c  |  5 +----
 xen/arch/x86/pv/emulate.c       |  9 +++++++--
 xen/arch/x86/pv/ro-page-fault.c |  4 ++--
 xen/arch/x86/pv/traps.c         | 17 +++++++++++++----
 xen/arch/x86/traps.c            | 23 +++++++++++------------
 5 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 2f73ed0682e1..fe2011f28e34 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1364,10 +1364,7 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
         ASSERT(!curr->arch.pv.trap_bounce.flags);
 
         if ( ctxt.ctxt.retire.pending_dbg )
-        {
-            curr->arch.dr6 |= ctxt.ctxt.retire.pending_dbg | DR_STATUS_RESERVED_ONE;
-            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
-        }
+            pv_inject_DB(ctxt.ctxt.retire.pending_dbg);
 
         /* fall through */
     case X86EMUL_RETRY:
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index e7a1c0a2cc4f..29425a0a00ec 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -71,10 +71,15 @@ void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip)
 {
     regs->rip = rip;
     regs->eflags &= ~X86_EFLAGS_RF;
+
     if ( regs->eflags & X86_EFLAGS_TF )
     {
-        current->arch.dr6 |= DR_STEP | DR_STATUS_RESERVED_ONE;
-        pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        /*
+         * TODO, this should generally use TF from the start of the
+         * instruction.  It's only a latent bug for now, as this path isn't
+         * used for any instruction which modifies eflags.
+         */
+        pv_inject_DB(X86_DR6_BS);
     }
 }
 
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index cad28ef928ad..f6bb33556e72 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -389,8 +389,8 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
 
         /* Fallthrough */
     case X86EMUL_OKAY:
-        if ( ctxt.retire.singlestep )
-            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        if ( ctxt.retire.pending_dbg )
+            pv_inject_DB(ctxt.retire.pending_dbg);
 
         /* Fallthrough */
     case X86EMUL_RETRY:
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 74f333da7e1c..553b04bca956 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -13,6 +13,7 @@
 #include <xen/softirq.h>
 
 #include <asm/pv/trace.h>
+#include <asm/debugreg.h>
 #include <asm/shared.h>
 #include <asm/traps.h>
 #include <irq_vectors.h>
@@ -50,9 +51,9 @@ void pv_inject_event(const struct x86_event *event)
     tb->cs    = ti->cs;
     tb->eip   = ti->address;
 
-    if ( event->type == X86_EVENTTYPE_HW_EXCEPTION &&
-         vector == X86_EXC_PF )
+    switch ( vector | -(event->type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
+    case X86_EXC_PF:
         curr->arch.pv.ctrlreg[2] = event->cr2;
         arch_set_cr2(curr, event->cr2);
 
@@ -62,9 +63,17 @@ void pv_inject_event(const struct x86_event *event)
             error_code |= PFEC_user_mode;
 
         trace_pv_page_fault(event->cr2, error_code);
-    }
-    else
+        break;
+
+    case X86_EXC_DB:
+        curr->arch.dr6 = x86_merge_dr6(curr->domain->arch.cpu_policy,
+                                       curr->arch.dr6, event->pending_dbg);
+        /* Fallthrough */
+
+    default:
         trace_pv_trap(vector, regs->rip, use_error_code, error_code);
+        break;
+    }
 
     if ( use_error_code )
     {
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index dead728ce329..447edc827b3a 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1887,11 +1887,11 @@ void do_device_not_available(struct cpu_user_regs *regs)
 /* SAF-1-safe */
 void do_debug(struct cpu_user_regs *regs)
 {
-    unsigned long dr6;
+    unsigned long pending_dbg;
     struct vcpu *v = current;
 
-    /* Stash dr6 as early as possible. */
-    dr6 = read_debugreg(6);
+    /* Stash dr6 as early as possible, operating with positive polarity. */
+    pending_dbg = read_debugreg(6) ^ X86_DR6_DEFAULT;
 
     /*
      * At the time of writing (March 2018), on the subject of %dr6:
@@ -1963,13 +1963,13 @@ void do_debug(struct cpu_user_regs *regs)
          * If however we do, safety measures need to be enacted.  Use a big
          * hammer and clear all debug settings.
          */
-        if ( dr6 & (DR_TRAP3 | DR_TRAP2 | DR_TRAP1 | DR_TRAP0) )
+        if ( pending_dbg & X86_DR6_BP_MASK )
         {
             unsigned int bp, dr7 = read_debugreg(7);
 
             for ( bp = 0; bp < 4; ++bp )
             {
-                if ( (dr6 & (1u << bp)) && /* Breakpoint triggered? */
+                if ( (pending_dbg & (1u << bp)) && /* Breakpoint triggered? */
                      (dr7 & (3u << (bp * DR_ENABLE_SIZE))) && /* Enabled? */
                      ((dr7 & (3u << ((bp * DR_CONTROL_SIZE) + /* Insn? */
                                      DR_CONTROL_SHIFT))) == DR_RW_EXECUTE) )
@@ -1990,24 +1990,23 @@ void do_debug(struct cpu_user_regs *regs)
          * so ensure the message is ratelimited.
          */
         gprintk(XENLOG_WARNING,
-                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, dr6 %lx\n",
+                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, pending_dbg %lx\n",
                 regs->cs, _p(regs->rip), _p(regs->rip),
-                regs->ss, _p(regs->rsp), dr6);
+                regs->ss, _p(regs->rsp), pending_dbg);
 
         return;
     }
 
-    /* Save debug status register where guest OS can peek at it */
-    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
-    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
-
     if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
     {
+        /* Save debug status register where gdbsx can peek at it */
+        v->arch.dr6 = x86_merge_dr6(v->domain->arch.cpu_policy,
+                                    v->arch.dr6, pending_dbg);
         domain_pause_for_debugger();
         return;
     }
 
-    pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+    pv_inject_DB(pending_dbg);
 }
 
 /* SAF-1-safe */
-- 
2.30.2


