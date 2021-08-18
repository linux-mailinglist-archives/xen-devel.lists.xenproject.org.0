Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A863F0CC6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 22:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168320.307364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCX-0000iY-0c; Wed, 18 Aug 2021 20:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168320.307364; Wed, 18 Aug 2021 20:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCW-0000fH-S2; Wed, 18 Aug 2021 20:30:16 +0000
Received: by outflank-mailman (input) for mailman id 168320;
 Wed, 18 Aug 2021 20:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydNC=NJ=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mGSCU-000714-Ne
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 20:30:14 +0000
Received: from mail-pj1-x102a.google.com (unknown [2607:f8b0:4864:20::102a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8baf436-6195-4e7d-9640-fac0d15dc35e;
 Wed, 18 Aug 2021 20:29:53 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so3183136pjb.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Aug 2021 13:29:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id h25sm663775pfo.68.2021.08.18.13.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:29:49 -0700 (PDT)
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
X-Inumbo-ID: d8baf436-6195-4e7d-9640-fac0d15dc35e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4ydItZe/YrS4x0wkLgFOI7vFRBemhJhfaF8p2sL58+8=;
        b=j69g3PiS+OxRuyXwjF6Adopqs6d6B5vsr8+HrrpIV+qi3sDt04QKnw8l3WamaXbl8P
         lFe9uwvk+CFaTSbfKh9I5t/ZACiU87LZJYsQReYVHbHhpPCa5Dmf+cqjrqzZbjIjPx84
         y0cQ2HeRnAgmkSO/ld4sdqsp2QkNsU/5730BRWLuIlRo7WyiPErZjRRmIeemEtqpToqd
         /WGKvPoq9c8tz61cIK8W4H93byIz9PsXEvwGA2cBB8A6cTqydsB3pJQEJtTG4GI1f9JV
         07jDQEFjyYJx4xeIRNNfRysHilXtnKXOI+Fem2W7C8str9dKkjdT6dWKM45aCcIW4CNb
         +zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=4ydItZe/YrS4x0wkLgFOI7vFRBemhJhfaF8p2sL58+8=;
        b=hyXY/shnDNo4KsczubLg1NzZO5yjflxE3liTgHDWDeAf6mvcNNLGcglwwCf+uy3eeD
         xML8QA2R0OON8NBpkbtBX6EJt4UQxIBLdIluMvMnhv2+X1F2BrsVo+44Nj5vAARATgGs
         zpR3kWpSLqfF1D6XKUWK1vCFvuK9Dz/ujIDUOT4/ZCNzijcKDlw5pd9n9qpKQrDMCc7a
         KIWEa3TDsk5xKzv/3uIt6dYNJpvxB3Udpu3A2zKmdLvMc8WhANHI3BnED/wLjm2AaE9A
         kPdk6qLOW7jFCIsfTfaTDa3GZd/rJtZfTOeN0XPfB25m/zafZcRDKkdopOpD8tpzPZx/
         Tldw==
X-Gm-Message-State: AOAM530YuttnDbN3JX9wf9AV16Rm8jVwEMtIWyUgKul5fmETXAiB3PKI
	S2DQERGljO4EiPDbFtKbehk6T1G15XM4pm2R
X-Google-Smtp-Source: ABdhPJxM0yxuBeRAbA8LrpLo+klvMhi1bXn5XmaAsWbgMUvlPUn70NylvnbO/RZnS+q/ra6wqr4sSQ==
X-Received: by 2002:a17:90a:9411:: with SMTP id r17mr11107155pjo.49.1629318589386;
        Wed, 18 Aug 2021 13:29:49 -0700 (PDT)
Sender: Bobby Eshleman <bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v3 2/6] x86/debugger: separate Xen and guest debugging debugger_trap_* functions
Date: Wed, 18 Aug 2021 13:29:03 -0700
Message-Id: <7925a89cf830e0e3705a8700fce09a408fcfc27c.1629315873.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629315873.git.bobby.eshleman@gmail.com>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike debugger_trap_fatal() and debugger_trap_immediate(),
debugger_trap_entry() is specific to guest debugging and *NOT* the
debugging of Xen itself. That is, it is part of gdbsx functionality and
not the Xen gdstub. This is evidenced by debugger_trap_fatal()'s usage
of domain_pause_for_debugger(). Because of this, debugger_trap_entry()
does not belong alongside the generic Xen debugger functionality.

This commit fixes this by expanding inline debugger_trap_entry() into
its usage in x86/traps.c and stubbing out domain_pause_for_debugger()
when !CONFIG_GDBSX. Properly placing what was debugger_trap_entry()
under the scope of gdbsx instead of gdbstub.

The function calls that caused an effective no-op and early exit out of
debugger_trap_entry() are removed completely (when the trapnr is not
int3/debug).

This commit is one of a series geared towards removing the unnecessary
requirement that all architectures to implement <asm/debugger.h>.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
 xen/arch/x86/domain.c          |  2 +-
 xen/arch/x86/traps.c           | 48 ++++++++++++++++++++--------------
 xen/include/asm-x86/debugger.h | 42 ++---------------------------
 3 files changed, 31 insertions(+), 61 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc14..70894ff826 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2541,7 +2541,7 @@ __initcall(init_vcpu_kick_softirq);
 
 void domain_pause_for_debugger(void)
 {
-#ifdef CONFIG_CRASH_DEBUG
+#ifdef CONFIG_GDBSX
     struct vcpu *curr = current;
     struct domain *d = curr->domain;
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e60af16ddd..d0a4c0ea74 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -858,13 +858,20 @@ static void do_trap(struct cpu_user_regs *regs)
     if ( regs->error_code & X86_XEC_EXT )
         goto hardware_trap;
 
-    if ( debugger_trap_entry(trapnr, regs) )
-        return;
-
     ASSERT(trapnr < 32);
 
     if ( guest_mode(regs) )
     {
+        struct vcpu *curr = current;
+        if ( (trapnr == TRAP_debug || trapnr == TRAP_int3) &&
+              guest_kernel_mode(curr, regs) &&
+              curr->domain->debugger_attached )
+        {
+            if ( trapnr != TRAP_debug )
+                curr->arch.gdbsx_vcpu_event = trapnr;
+            domain_pause_for_debugger();
+            return;
+        }
         pv_inject_hw_exception(trapnr,
                                (TRAP_HAVE_EC & (1u << trapnr))
                                ? regs->error_code : X86_EVENT_NO_EC);
@@ -1094,9 +1101,6 @@ void do_invalid_op(struct cpu_user_regs *regs)
     int id = -1, lineno;
     const struct virtual_region *region;
 
-    if ( debugger_trap_entry(TRAP_invalid_op, regs) )
-        return;
-
     if ( likely(guest_mode(regs)) )
     {
         if ( pv_emulate_invalid_op(regs) )
@@ -1201,8 +1205,7 @@ void do_invalid_op(struct cpu_user_regs *regs)
 
 void do_int3(struct cpu_user_regs *regs)
 {
-    if ( debugger_trap_entry(TRAP_int3, regs) )
-        return;
+    struct vcpu *curr = current;
 
     if ( !guest_mode(regs) )
     {
@@ -1215,6 +1218,12 @@ void do_int3(struct cpu_user_regs *regs)
 
         return;
     }
+    else if ( guest_kernel_mode(curr, regs) && curr->domain->debugger_attached )
+    {
+        curr->arch.gdbsx_vcpu_event = TRAP_int3;
+        domain_pause_for_debugger();
+        return;
+    }
 
     pv_inject_hw_exception(TRAP_int3, X86_EVENT_NO_EC);
 }
@@ -1492,9 +1501,6 @@ void do_page_fault(struct cpu_user_regs *regs)
     /* fixup_page_fault() might change regs->error_code, so cache it here. */
     error_code = regs->error_code;
 
-    if ( debugger_trap_entry(TRAP_page_fault, regs) )
-        return;
-
     perfc_incr(page_faults);
 
     /* Any shadow stack access fault is a bug in Xen. */
@@ -1593,9 +1599,6 @@ void do_general_protection(struct cpu_user_regs *regs)
     struct vcpu *v = current;
 #endif
 
-    if ( debugger_trap_entry(TRAP_gp_fault, regs) )
-        return;
-
     if ( regs->error_code & X86_XEC_EXT )
         goto hardware_gp;
 
@@ -1888,9 +1891,6 @@ void do_debug(struct cpu_user_regs *regs)
     /* Stash dr6 as early as possible. */
     dr6 = read_debugreg(6);
 
-    if ( debugger_trap_entry(TRAP_debug, regs) )
-        return;
-
     /*
      * At the time of writing (March 2018), on the subject of %dr6:
      *
@@ -1994,6 +1994,11 @@ void do_debug(struct cpu_user_regs *regs)
 
         return;
     }
+    else if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
+    {
+        domain_pause_for_debugger();
+        return;
+    }
 
     /* Save debug status register where guest OS can peek at it */
     v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
@@ -2014,9 +2019,6 @@ void do_entry_CP(struct cpu_user_regs *regs)
     const char *err = "??";
     unsigned int ec = regs->error_code;
 
-    if ( debugger_trap_entry(TRAP_debug, regs) )
-        return;
-
     /* Decode ec if possible */
     if ( ec < ARRAY_SIZE(errors) && errors[ec][0] )
         err = errors[ec];
@@ -2028,6 +2030,12 @@ void do_entry_CP(struct cpu_user_regs *regs)
      */
     if ( guest_mode(regs) )
     {
+        struct vcpu *curr = current;
+        if ( guest_kernel_mode(curr, regs) && curr->domain->debugger_attached )
+        {
+            domain_pause_for_debugger();
+            return;
+        }
         gprintk(XENLOG_ERR, "Hit #CP[%04x] in guest context %04x:%p\n",
                 ec, regs->cs, _p(regs->rip));
         ASSERT_UNREACHABLE();
diff --git a/xen/include/asm-x86/debugger.h b/xen/include/asm-x86/debugger.h
index 99803bfd0c..cd6b9477f7 100644
--- a/xen/include/asm-x86/debugger.h
+++ b/xen/include/asm-x86/debugger.h
@@ -5,19 +5,12 @@
  * 
  * Each debugger should define two functions here:
  * 
- * 1. debugger_trap_entry(): 
- *  Called at start of any synchronous fault or trap, before any other work
- *  is done. The idea is that if your debugger deliberately caused the trap
- *  (e.g. to implement breakpoints or data watchpoints) then you can take
- *  appropriate action and return a non-zero value to cause early exit from
- *  the trap function.
- * 
- * 2. debugger_trap_fatal():
+ * 1. debugger_trap_fatal():
  *  Called when Xen is about to give up and crash. Typically you will use this
  *  hook to drop into a debug session. It can also be used to hook off
  *  deliberately caused traps (which you then handle and return non-zero).
  *
- * 3. debugger_trap_immediate():
+ * 2. debugger_trap_immediate():
  *  Called if we want to drop into a debugger now.  This is essentially the
  *  same as debugger_trap_fatal, except that we use the current register state
  *  rather than the state which was in effect when we took the trap.
@@ -49,31 +42,6 @@ static inline bool debugger_trap_fatal(
 /* Int3 is a trivial way to gather cpu_user_regs context. */
 #define debugger_trap_immediate() __asm__ __volatile__ ( "int3" );
 
-static inline bool debugger_trap_entry(
-    unsigned int vector, struct cpu_user_regs *regs)
-{
-    /*
-     * This function is called before any checks are made.  Amongst other
-     * things, be aware that during early boot, current is not a safe pointer
-     * to follow.
-     */
-    struct vcpu *v = current;
-
-    if ( vector != TRAP_int3 && vector != TRAP_debug )
-        return false;
-
-    if ( guest_mode(regs) && guest_kernel_mode(v, regs) &&
-         v->domain->debugger_attached  )
-    {
-        if ( vector != TRAP_debug ) /* domain pause is good enough */
-            current->arch.gdbsx_vcpu_event = vector;
-        domain_pause_for_debugger();
-        return true;
-    }
-
-    return false;
-}
-
 #else
 
 static inline bool debugger_trap_fatal(
@@ -84,12 +52,6 @@ static inline bool debugger_trap_fatal(
 
 #define debugger_trap_immediate() ((void)0)
 
-static inline bool debugger_trap_entry(
-    unsigned int vector, struct cpu_user_regs *regs)
-{
-    return false;
-}
-
 #endif
 
 #ifdef CONFIG_GDBSX
-- 
2.32.0


