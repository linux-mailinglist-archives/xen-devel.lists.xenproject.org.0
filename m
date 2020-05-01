Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B51C2109
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 00:59:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUecx-00086e-Vd; Fri, 01 May 2020 22:59:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUecw-00085r-4x
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 22:59:26 +0000
X-Inumbo-ID: 5d9ce7c4-8bff-11ea-b9cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d9ce7c4-8bff-11ea-b9cf-bc764e2007e4;
 Fri, 01 May 2020 22:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588373949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yuj7W8FBuxAyknqo2wUBSETsY2vvMAq34uBhRh1QqIU=;
 b=PFIorDf9U2lcHF4KRelD4zKVEGGgTsqywgiKwD/Bmi46SZMqu8YuZkeW
 0s2ljweIozajvWXyGYmH9q5BiJ49GUwSgmqXF+nDVrpUxXhYRJpILFmDZ
 H8e3SlIc1ryWSusinCueyNFzy9pZdxvTMiYmCb9oy5lHoWHBtldDK33rx 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1A+w2IiSnHoSp+2Fe/WtiLGlowGS5xLZFh3Kc1HlxmeFkXDESQL+ABj8ImGYUdnf88c9oSuF95
 a2mnTEP9WFBGNQEjnPFutxWQz9U7Ez7a43V8iAZ0rtEJ06CQONN4B7XhJV7WDXek1nYwlUYK5c
 aD8KBkD6uU11lcpIelSRNn1Y0cMSTwvSdhvhe5L9Zo9aT9Zy9YNRw1M6yDMK3fix3Mc/o6574p
 m5HTRrk4b0vl6y0LGDEs9rEByLDJhIVH3i8BV6Df0L4cDc0L67G64vD8U8x3aBoqvuL1nUjasz
 uNs=
X-SBRS: 2.7
X-MesageID: 17293963
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="17293963"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 03/16] x86/traps: Factor out exception_fixup() and make
 printing consistent
Date: Fri, 1 May 2020 23:58:25 +0100
Message-ID: <20200501225838.9866-4-andrew.cooper3@citrix.com>
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
---
 xen/arch/x86/traps.c | 68 ++++++++++++++++++++++++----------------------------
 1 file changed, 31 insertions(+), 37 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e73f07f28a..737ab036d2 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -774,10 +774,27 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
           trapnr, vec_name(trapnr), regs->error_code);
 }
 
+static bool exception_fixup(struct cpu_user_regs *regs, bool print)
+{
+    unsigned long fixup = search_exception_table(regs);
+
+    if ( unlikely(fixup == 0) )
+        return false;
+
+    /* Can currently be triggered by guests.  Make sure we ratelimit. */
+    if ( IS_ENABLED(CONFIG_DEBUG) && print )
+        printk(XENLOG_GUEST XENLOG_WARNING "Fixup #%s[%04x]: %p [%ps] -> %p\n",
+               vec_name(regs->entry_vector), regs->error_code,
+               _p(regs->rip), _p(regs->rip), _p(fixup));
+
+    regs->rip = fixup;
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
@@ -795,13 +812,8 @@ static void do_trap(struct cpu_user_regs *regs)
         return;
     }
 
-    if ( likely((fixup = search_exception_table(regs)) != 0) )
-    {
-        dprintk(XENLOG_ERR, "Trap %u: %p [%ps] -> %p\n",
-                trapnr, _p(regs->rip), _p(regs->rip), _p(fixup));
-        regs->rip = fixup;
+    if ( likely(exception_fixup(regs, true)) )
         return;
-    }
 
  hardware_trap:
     if ( debugger_trap_fatal(trapnr, regs) )
@@ -1109,11 +1121,8 @@ void do_invalid_op(struct cpu_user_regs *regs)
     }
 
  die:
-    if ( (fixup = search_exception_table(regs)) != 0 )
-    {
-        regs->rip = fixup;
+    if ( likely(exception_fixup(regs, true)) )
         return;
-    }
 
     if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
         return;
@@ -1129,15 +1138,8 @@ void do_int3(struct cpu_user_regs *regs)
 
     if ( !guest_mode(regs) )
     {
-        unsigned long fixup;
-
-        if ( (fixup = search_exception_table(regs)) != 0 )
-        {
-            dprintk(XENLOG_DEBUG, "Trap %u: %p [%ps] -> %p\n",
-                    TRAP_int3, _p(regs->rip), _p(regs->rip), _p(fixup));
-            regs->rip = fixup;
+        if ( likely(exception_fixup(regs, true)) )
             return;
-        }
 
         if ( !debugger_trap_fatal(TRAP_int3, regs) )
             printk(XENLOG_DEBUG "Hit embedded breakpoint at %p [%ps]\n",
@@ -1435,7 +1437,7 @@ static int fixup_page_fault(unsigned long addr, struct cpu_user_regs *regs)
  */
 void do_page_fault(struct cpu_user_regs *regs)
 {
-    unsigned long addr, fixup;
+    unsigned long addr;
     unsigned int error_code;
 
     addr = read_cr2();
@@ -1466,12 +1468,11 @@ void do_page_fault(struct cpu_user_regs *regs)
         if ( pf_type != real_fault )
             return;
 
-        if ( likely((fixup = search_exception_table(regs)) != 0) )
+        if ( likely(exception_fixup(regs, false)) )
         {
             perfc_incr(copy_user_faults);
             if ( unlikely(regs->error_code & PFEC_reserved_bit) )
                 reserved_bit_page_fault(addr, regs);
-            regs->rip = fixup;
             return;
         }
 
@@ -1529,7 +1530,6 @@ void do_general_protection(struct cpu_user_regs *regs)
 #ifdef CONFIG_PV
     struct vcpu *v = current;
 #endif
-    unsigned long fixup;
 
     if ( debugger_trap_entry(TRAP_gp_fault, regs) )
         return;
@@ -1596,13 +1596,8 @@ void do_general_protection(struct cpu_user_regs *regs)
 
  gp_in_kernel:
 
-    if ( likely((fixup = search_exception_table(regs)) != 0) )
-    {
-        dprintk(XENLOG_INFO, "GPF (%04x): %p [%ps] -> %p\n",
-                regs->error_code, _p(regs->rip), _p(regs->rip), _p(fixup));
-        regs->rip = fixup;
+    if ( likely(exception_fixup(regs, true)) )
         return;
-    }
 
  hardware_gp:
     if ( debugger_trap_fatal(TRAP_gp_fault, regs) )
@@ -1761,18 +1756,17 @@ void do_device_not_available(struct cpu_user_regs *regs)
 
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
+        if ( exception_fixup(regs, true) )
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


