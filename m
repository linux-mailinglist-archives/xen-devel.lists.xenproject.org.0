Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BC7508A72
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 16:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309287.525420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5L-0002Hk-OJ; Wed, 20 Apr 2022 14:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309287.525420; Wed, 20 Apr 2022 14:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5L-000295-DB; Wed, 20 Apr 2022 14:13:35 +0000
Received: by outflank-mailman (input) for mailman id 309287;
 Wed, 20 Apr 2022 14:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E3+=U6=citrix.com=prvs=10247635a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhB5J-0001HR-7J
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 14:13:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e00f121-c0b4-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 16:13:31 +0200 (CEST)
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
X-Inumbo-ID: 0e00f121-c0b4-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650464011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ppo83czs3ZgYyCOMzHGediGbdWtmuqhueJbG2O/yc+o=;
  b=MFSzwkfMhTTu6qlVZq8Q6u+GRglnVaCNO1eZnAk+6K+NiNC6754bx5rm
   OZj8G0x2rP0tmzM/HbWfhu6TlGXPwgefBbHsdz/3VGj1lx3705SjoN5WB
   GG5FCLRxHACx0RdeH/mdJ0u8RGVvM9VfwYsvMFRZi8iOz3cWiffCa6GUK
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69517263
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:njTUzKBu+KwjUBVW/yPjw5YqxClBgxIJ4kV8jS/XYbTApGtw0D0Ex
 msWXm6BM63bZDakLo8ibIuwp0kFsZXTzddjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jj2tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhI8
 4lQp6eWcjtyN6LJh9wsUB5GMj5HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4fQK+BP
 ZRCAdZpRDjqWTJSAlgcM68FgsaV32D5aQ94hmvA8MLb5ECMlVcsgdABKuH9WPaHWMFUlUawv
 X/d8iLyBRRyHMOb4SqI9DSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3I
 Use8DtooLMy8EGuR9/VUBixoXrCtRkZM+e8CMVjtlvLkPCNpV/EWC5UFVatdeDKqucPfmA3x
 GSvpO+yDDNqr4WkSnWD16it+Gba1TcuEUcOYioNTA0g6tbloZ0ugh+ncuuPAJJZnfWuR2iun
 mniQDwWwuxK0JVVj/nTEUXv2WrEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUMnleM+lGrxl8FSVCxGtamO0vLKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcEOZCfyN/MoPNjhV6zGKJQM8/y8B5g4ifIUPPBMmPKvpnkyNSZ8IUix+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48gPUwDnUgDKZfobcmjlXyPiOPGDFbMEOttGAbfNYgRsfLbyDg5B
 v4CbqNmPT0ECL2gCsQWmKZORW03wY8TXMmo8J0GKrTeemKL2ggJUpfs/F/oQKQ994w9qwsC1
 irVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:4o56TKxqiMif+cPvhn2VKrPwFr1zdoMgy1knxilNoRw8SK2lfq
 eV7YwmPH7P+U8ssR4b6LO90cW7Lk80sKQFhbX5Xo3SOjUO2lHYTr2KhLGKq1aLdkHDH6xmpM
 BdmsBFeabN5DNB7foSjjPXLz9Z+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.90,275,1643691600"; 
   d="scan'208";a="69517263"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Bobby Eshleman <bobby.eshleman@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v5 1/6] x86/debugger: Remove debugger_trap_entry()
Date: Wed, 20 Apr 2022 15:13:02 +0100
Message-ID: <20220420141307.24153-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220420141307.24153-1-andrew.cooper3@citrix.com>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Bobby Eshleman <bobby.eshleman@gmail.com>

debugger_trap_entry() is unrelated to the other contents of debugger.h.  It is
a no-op for everything other than #DB/#BP, and for those it invokes guest
debugging (CONFIG_GDBSX) not host debugging (CONFIG_CRASH_DEBUG).

Furthermore, the description of how to use debugger_trap_entry() is at best,
stale.  It is not called from all exception paths, and because the developer
is forced to modify Xen to perform debugging, editing debugger_trap_entry() is
not the way one would efficiently go about diagnosing the problem.

Simplify everything by expanding debugger_trap_entry() into its two non-empty
locations, fixing bugs with their positioning (vs early exceptions and curr
not being safe to deference) and for #DB, deferring the pause until the
changes in %dr6 are saved to v->arch.dr6 so the debugger can actually see
which condition triggered.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v5:
 * Remove dead logic.  Move GDBSX changes into a later patch.
 * Rewrite commmit message.
---
 xen/arch/x86/include/asm/debugger.h | 42 ++-----------------------------------
 xen/arch/x86/traps.c                | 34 +++++++++++++-----------------
 2 files changed, 16 insertions(+), 60 deletions(-)

diff --git a/xen/arch/x86/include/asm/debugger.h b/xen/arch/x86/include/asm/debugger.h
index 221bcde13796..e83b346a21d1 100644
--- a/xen/arch/x86/include/asm/debugger.h
+++ b/xen/arch/x86/include/asm/debugger.h
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
+ * debugger_trap_fatal():
  *  Called when Xen is about to give up and crash. Typically you will use this
  *  hook to drop into a debug session. It can also be used to hook off
  *  deliberately caused traps (which you then handle and return non-zero).
  *
- * 3. debugger_trap_immediate():
+ * debugger_trap_immediate():
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
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 4c38f6c01539..84cd038dc38b 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -946,9 +946,6 @@ void do_trap(struct cpu_user_regs *regs)
     if ( regs->error_code & X86_XEC_EXT )
         goto hardware_trap;
 
-    if ( debugger_trap_entry(trapnr, regs) )
-        return;
-
     ASSERT(trapnr < 32);
 
     if ( guest_mode(regs) )
@@ -1177,9 +1174,6 @@ void do_invalid_op(struct cpu_user_regs *regs)
     int id = -1, lineno;
     const struct virtual_region *region;
 
-    if ( debugger_trap_entry(TRAP_invalid_op, regs) )
-        return;
-
     if ( likely(guest_mode(regs)) )
     {
         if ( pv_emulate_invalid_op(regs) )
@@ -1284,8 +1278,7 @@ void do_invalid_op(struct cpu_user_regs *regs)
 
 void do_int3(struct cpu_user_regs *regs)
 {
-    if ( debugger_trap_entry(TRAP_int3, regs) )
-        return;
+    struct vcpu *curr = current;
 
     if ( !guest_mode(regs) )
     {
@@ -1299,6 +1292,13 @@ void do_int3(struct cpu_user_regs *regs)
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
 
@@ -1575,9 +1575,6 @@ void do_page_fault(struct cpu_user_regs *regs)
     /* fixup_page_fault() might change regs->error_code, so cache it here. */
     error_code = regs->error_code;
 
-    if ( debugger_trap_entry(TRAP_page_fault, regs) )
-        return;
-
     perfc_incr(page_faults);
 
     /* Any shadow stack access fault is a bug in Xen. */
@@ -1676,9 +1673,6 @@ void do_general_protection(struct cpu_user_regs *regs)
     struct vcpu *v = current;
 #endif
 
-    if ( debugger_trap_entry(TRAP_gp_fault, regs) )
-        return;
-
     if ( regs->error_code & X86_XEC_EXT )
         goto hardware_gp;
 
@@ -1971,9 +1965,6 @@ void do_debug(struct cpu_user_regs *regs)
     /* Stash dr6 as early as possible. */
     dr6 = read_debugreg(6);
 
-    if ( debugger_trap_entry(TRAP_debug, regs) )
-        return;
-
     /*
      * At the time of writing (March 2018), on the subject of %dr6:
      *
@@ -2082,6 +2073,12 @@ void do_debug(struct cpu_user_regs *regs)
     v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
     v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
 
+    if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
+    {
+        domain_pause_for_debugger();
+        return;
+    }
+
     pv_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
 }
 
@@ -2097,9 +2094,6 @@ void do_entry_CP(struct cpu_user_regs *regs)
     const char *err = "??";
     unsigned int ec = regs->error_code;
 
-    if ( debugger_trap_entry(X86_EXC_CP, regs) )
-        return;
-
     /* Decode ec if possible */
     if ( ec < ARRAY_SIZE(errors) && errors[ec][0] )
         err = errors[ec];
-- 
2.11.0


