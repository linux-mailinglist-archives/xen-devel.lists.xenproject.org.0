Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B705A1E4E06
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1a7-0003zq-Lj; Wed, 27 May 2020 19:19:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1a6-0003zb-5F
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:19:14 +0000
X-Inumbo-ID: f27751dc-a04e-11ea-a777-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f27751dc-a04e-11ea-a777-12813bfff9fa;
 Wed, 27 May 2020 19:19:12 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ija9DmiPgoPmZNcL3bjjdKcpLaVY+8guYONj0oMriHZeiKRsozlQ4o9aitlckvP1s6btqJjxh1
 a18qRYR3chz2xqEmZi1iYjPkG72SPuWjfXyhVFoGpAviU1XOrbI66ZIQIbfdo4gTDSN5jj9AgB
 s6lRv7mYcHllksiQ687H74WJMWuU5rfZhBYRoEdw8kjtIZt8gT6+KHdasj18k6r8n/CwzOQovE
 kl3xiEYvA2VvsgwwvuZvjliwLI/IDNpuSXuy1dJz9R6NEaTju6WmHDxpgad7sSTQhi6ISl/cjt
 uPA=
X-SBRS: 2.7
X-MesageID: 18591103
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="18591103"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 02/14] x86/traps: Factor out extable_fixup() and make
 printing consistent
Date: Wed, 27 May 2020 20:18:35 +0100
Message-ID: <20200527191847.17207-3-andrew.cooper3@citrix.com>
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

UD faults never had any diagnostics printed, and the others were inconsistent.

Don't use dprintk() because identifying traps.c is actively unhelpful in the
message, as it is the location of the fixup, not the fault.  Use the new
vec_name() infrastructure, rather than leaving raw numbers for the log.

  (XEN) Running stub recovery selftests...
  (XEN) Fixup #UD[0000]: ffff82d07fffd040 [ffff82d07fffd040] -> ffff82d0403ac9d6
  (XEN) Fixup #GP[0000]: ffff82d07fffd041 [ffff82d07fffd041] -> ffff82d0403ac9d6
  (XEN) Fixup #SS[0000]: ffff82d07fffd040 [ffff82d07fffd040] -> ffff82d0403ac9d6
  (XEN) Fixup #BP[0000]: ffff82d07fffd041 [ffff82d07fffd041] -> ffff82d0403ac9d6

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase
 * Rename to extable_fixup() to better distinguish from fixup_page_fault()
---
 xen/arch/x86/traps.c | 77 ++++++++++++++++++++++++----------------------------
 1 file changed, 35 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 427178e649..eeb3e146ef 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -772,10 +772,31 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
           trapnr, vec_name(trapnr), regs->error_code);
 }
 
+static bool extable_fixup(struct cpu_user_regs *regs, bool print)
+{
+    unsigned long fixup = search_exception_table(regs);
+
+    if ( unlikely(fixup == 0) )
+        return false;
+
+    /*
+     * Don't use dprintk() because the __FILE__ reference is unhelpful.
+     * Can currently be triggered by guests.  Make sure we ratelimit.
+     */
+    if ( IS_ENABLED(CONFIG_DEBUG) && print )
+        printk(XENLOG_GUEST XENLOG_WARNING "Fixup %s[%04x]: %p [%ps] -> %p\n",
+               vec_name(regs->entry_vector), regs->error_code,
+               _p(regs->rip), _p(regs->rip), _p(fixup));
+
+    regs->rip = fixup;
+    this_cpu(last_extable_addr) = regs->rip;
+
+    return true;
+}
+
 static void do_trap(struct cpu_user_regs *regs)
 {
     unsigned int trapnr = regs->entry_vector;
-    unsigned long fixup;
 
     if ( regs->error_code & X86_XEC_EXT )
         goto hardware_trap;
@@ -793,14 +814,8 @@ static void do_trap(struct cpu_user_regs *regs)
         return;
     }
 
-    if ( likely((fixup = search_exception_table(regs)) != 0) )
-    {
-        dprintk(XENLOG_ERR, "Trap %u: %p [%ps] -> %p\n",
-                trapnr, _p(regs->rip), _p(regs->rip), _p(fixup));
-        this_cpu(last_extable_addr) = regs->rip;
-        regs->rip = fixup;
+    if ( likely(extable_fixup(regs, true)) )
         return;
-    }
 
  hardware_trap:
     if ( debugger_trap_fatal(trapnr, regs) )
@@ -1108,12 +1123,8 @@ void do_invalid_op(struct cpu_user_regs *regs)
     }
 
  die:
-    if ( (fixup = search_exception_table(regs)) != 0 )
-    {
-        this_cpu(last_extable_addr) = regs->rip;
-        regs->rip = fixup;
+    if ( likely(extable_fixup(regs, true)) )
         return;
-    }
 
     if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
         return;
@@ -1129,16 +1140,8 @@ void do_int3(struct cpu_user_regs *regs)
 
     if ( !guest_mode(regs) )
     {
-        unsigned long fixup;
-
-        if ( (fixup = search_exception_table(regs)) != 0 )
-        {
-            this_cpu(last_extable_addr) = regs->rip;
-            dprintk(XENLOG_DEBUG, "Trap %u: %p [%ps] -> %p\n",
-                    TRAP_int3, _p(regs->rip), _p(regs->rip), _p(fixup));
-            regs->rip = fixup;
+        if ( likely(extable_fixup(regs, true)) )
             return;
-        }
 
         if ( !debugger_trap_fatal(TRAP_int3, regs) )
             printk(XENLOG_DEBUG "Hit embedded breakpoint at %p [%ps]\n",
@@ -1415,7 +1418,7 @@ static int fixup_page_fault(unsigned long addr, struct cpu_user_regs *regs)
 
 void do_page_fault(struct cpu_user_regs *regs)
 {
-    unsigned long addr, fixup;
+    unsigned long addr;
     unsigned int error_code;
 
     addr = read_cr2();
@@ -1461,11 +1464,9 @@ void do_page_fault(struct cpu_user_regs *regs)
         if ( pf_type != real_fault )
             return;
 
-        if ( likely((fixup = search_exception_table(regs)) != 0) )
+        if ( likely(extable_fixup(regs, false)) )
         {
             perfc_incr(copy_user_faults);
-            this_cpu(last_extable_addr) = regs->rip;
-            regs->rip = fixup;
             return;
         }
 
@@ -1521,7 +1522,6 @@ void do_general_protection(struct cpu_user_regs *regs)
 #ifdef CONFIG_PV
     struct vcpu *v = current;
 #endif
-    unsigned long fixup;
 
     if ( debugger_trap_entry(TRAP_gp_fault, regs) )
         return;
@@ -1588,14 +1588,8 @@ void do_general_protection(struct cpu_user_regs *regs)
 
  gp_in_kernel:
 
-    if ( likely((fixup = search_exception_table(regs)) != 0) )
-    {
-        dprintk(XENLOG_INFO, "GPF (%04x): %p [%ps] -> %p\n",
-                regs->error_code, _p(regs->rip), _p(regs->rip), _p(fixup));
-        this_cpu(last_extable_addr) = regs->rip;
-        regs->rip = fixup;
+    if ( likely(extable_fixup(regs, true)) )
         return;
-    }
 
  hardware_gp:
     if ( debugger_trap_fatal(TRAP_gp_fault, regs) )
@@ -1754,18 +1748,17 @@ void do_device_not_available(struct cpu_user_regs *regs)
 
     if ( !guest_mode(regs) )
     {
-        unsigned long fixup = search_exception_table(regs);
-
-        gprintk(XENLOG_ERR, "#NM: %p [%ps] -> %p\n",
-                _p(regs->rip), _p(regs->rip), _p(fixup));
         /*
          * We shouldn't be able to reach here, but for release builds have
          * the recovery logic in place nevertheless.
          */
-        ASSERT_UNREACHABLE();
-        BUG_ON(!fixup);
-        regs->rip = fixup;
-        return;
+        if ( extable_fixup(regs, true) )
+        {
+            ASSERT_UNREACHABLE();
+            return;
+        }
+
+        fatal_trap(regs, false);
     }
 
 #ifdef CONFIG_PV
-- 
2.11.0


