Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50841B856
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 22:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198416.351914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJkk-00054P-DY; Tue, 28 Sep 2021 20:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198416.351914; Tue, 28 Sep 2021 20:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJkk-000515-A2; Tue, 28 Sep 2021 20:31:02 +0000
Received: by outflank-mailman (input) for mailman id 198416;
 Tue, 28 Sep 2021 20:31:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sVw8=OS=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mVJki-0004O5-8W
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 20:31:00 +0000
Received: from mail-pf1-x430.google.com (unknown [2607:f8b0:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 545b2fb6-0eea-4f78-a11d-edba8a427652;
 Tue, 28 Sep 2021 20:30:51 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id b68so1940566pfb.10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 13:30:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::5])
 by smtp.gmail.com with ESMTPSA id p15sm44201pfn.31.2021.09.28.13.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 13:30:50 -0700 (PDT)
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
X-Inumbo-ID: 545b2fb6-0eea-4f78-a11d-edba8a427652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H5uWePdNAFApbwchB0lEmCcQHqVtRGoM5xxH6A0jNPE=;
        b=OU8kbq/6odgsBLbuRYNvQcjSGO1agLQ/zNMWt3bSZnEt/x0KR4ZZVBJKRp646+p6a8
         wFLoSKNevE3pDOho2bHyMPS1QohH6VwQ6R1WCZtYiLmU5ut4kE4rwXA4w/vGHRvb6WoP
         2RBltHjW+YpY/nrFOPiKeg6cEpX5j/U/VpIv2LZD/7jSKWkaWVkthLzp2pf0TshKol3Y
         dmMpIiW5f5OR0Wf9C8uZm7wUrzd9gDkVUV+jiHXxzy//i9yj2GB62tqiGPJJOJA9i1uF
         Pd5GsekypPhshYhKjGPlzo1iG1RCBeLMyK4MM1ENZXf1m75IMxj0x4kJTnmevCYlJoiA
         9Adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=H5uWePdNAFApbwchB0lEmCcQHqVtRGoM5xxH6A0jNPE=;
        b=2MySHqMZYEwtT/m7mTG5BNW+3j0/4sr1cXRVNcXF2y+xucQSYpQ0tS85xpI0FNLTTI
         8KYKFzP09P4SdhOm4oPW1VvOKh0kKUCmTnGUHuRLyT7LZFequK/nq29YX0eeHN7qzCCL
         MQkP4bNp8y3aAfr3u/3c0xS5uwKAOCy8B2eRJpqTbOLICRIFMJM4GL0RyH1sSSanh0w4
         y904VqdcFasakPrXEa+/RAgb3oD1BuLxA3IL7CA9n94AwCR0GNJ6SKK+VX3tevjhQZvf
         L/FOd/UqvsiKXtmmT02FhtwcDv/6AydOKDFfOp0fPCA+SP/H0re0iaHA//F8B75U62om
         k6IA==
X-Gm-Message-State: AOAM5325TX0a9ai8ExhvZG097UPxKvxaNpkts7tWIGuDNIkgnDKgNxhA
	v0f0KSG7GQp6VMc+7jhkWKFrYH4Kna0wUHB6
X-Google-Smtp-Source: ABdhPJxz/2L818H7HQdZtDgvXYda6K8y0D3UwBb5Vo5vRi3oUcVuGZc0LXJGRokADf5XuTPMpykXTw==
X-Received: by 2002:a62:7dd3:0:b0:447:dd44:1580 with SMTP id y202-20020a627dd3000000b00447dd441580mr7427104pfc.19.1632861050693;
        Tue, 28 Sep 2021 13:30:50 -0700 (PDT)
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
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v4 2/6] x86/debugger: separate Xen and guest debugging debugger_trap_* functions
Date: Tue, 28 Sep 2021 13:30:25 -0700
Message-Id: <47e32bf1eb0cd18210df4273d564fa17d389f3ae.1632860589.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1632860589.git.bobby.eshleman@gmail.com>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions debugger_trap_fatal(), debugger_trap_immediate(), and
debugger_trap_entry() are generic hook functions for debugger support.
In practice, debugger_trap_fatal() and debugger_trap_immediate() are
only used in the debugging of Xen itself and debugger_trap_entry() is
only used in the debugging of guests. That is, debugger_trap_entry() is
part of gdbsx functionality and not the Xen gdstub. This is evidenced by
debugger_trap_fatal()'s usage of domain_pause_for_debugger(). Because of
this, debugger_trap_entry() many not belong alongside the Xen debug
functions.

This commit fixes this by expanding inline debugger_trap_entry() into
its usage sites in x86/traps.c and stubbing out
domain_pause_for_debugger() when !CONFIG_GDBSX. Placing what
was debugger_trap_entry() under the scope of gdbsx instead of gdbstub.

The function calls that caused an effective no-op and early exit out of
debugger_trap_entry() are removed completely (when the trapnr is not
int3/debug).

This commit is one of a series geared towards removing the unnecessary
requirement that all architectures to implement <asm/debugger.h>.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
Changes in v4:
- Reword commit message for accuracy (make weaker claims)
- Fix "if { return } else if { return }" anti-pattern

 xen/arch/x86/domain.c          |  2 +-
 xen/arch/x86/traps.c           | 50 ++++++++++++++++++++--------------
 xen/include/asm-x86/debugger.h | 42 ++--------------------------
 3 files changed, 33 insertions(+), 61 deletions(-)

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
index e60af16ddd..772e2a5bfc 100644
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
@@ -1216,6 +1219,13 @@ void do_int3(struct cpu_user_regs *regs)
         return;
     }
 
+    if ( guest_kernel_mode(curr, regs) && curr->domain->debugger_attached )
+    {
+        curr->arch.gdbsx_vcpu_event = TRAP_int3;
+        domain_pause_for_debugger();
+        return;
+    }
+
     pv_inject_hw_exception(TRAP_int3, X86_EVENT_NO_EC);
 }
 
@@ -1492,9 +1502,6 @@ void do_page_fault(struct cpu_user_regs *regs)
     /* fixup_page_fault() might change regs->error_code, so cache it here. */
     error_code = regs->error_code;
 
-    if ( debugger_trap_entry(TRAP_page_fault, regs) )
-        return;
-
     perfc_incr(page_faults);
 
     /* Any shadow stack access fault is a bug in Xen. */
@@ -1593,9 +1600,6 @@ void do_general_protection(struct cpu_user_regs *regs)
     struct vcpu *v = current;
 #endif
 
-    if ( debugger_trap_entry(TRAP_gp_fault, regs) )
-        return;
-
     if ( regs->error_code & X86_XEC_EXT )
         goto hardware_gp;
 
@@ -1888,9 +1892,6 @@ void do_debug(struct cpu_user_regs *regs)
     /* Stash dr6 as early as possible. */
     dr6 = read_debugreg(6);
 
-    if ( debugger_trap_entry(TRAP_debug, regs) )
-        return;
-
     /*
      * At the time of writing (March 2018), on the subject of %dr6:
      *
@@ -1995,6 +1996,12 @@ void do_debug(struct cpu_user_regs *regs)
         return;
     }
 
+    if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
+    {
+        domain_pause_for_debugger();
+        return;
+    }
+
     /* Save debug status register where guest OS can peek at it */
     v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
     v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
@@ -2014,9 +2021,6 @@ void do_entry_CP(struct cpu_user_regs *regs)
     const char *err = "??";
     unsigned int ec = regs->error_code;
 
-    if ( debugger_trap_entry(TRAP_debug, regs) )
-        return;
-
     /* Decode ec if possible */
     if ( ec < ARRAY_SIZE(errors) && errors[ec][0] )
         err = errors[ec];
@@ -2028,6 +2032,12 @@ void do_entry_CP(struct cpu_user_regs *regs)
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


