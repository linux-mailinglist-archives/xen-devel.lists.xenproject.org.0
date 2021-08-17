Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE353EEB48
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 12:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167739.306219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFwmQ-0001cN-64; Tue, 17 Aug 2021 10:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167739.306219; Tue, 17 Aug 2021 10:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFwmQ-0001aO-0z; Tue, 17 Aug 2021 10:57:14 +0000
Received: by outflank-mailman (input) for mailman id 167739;
 Tue, 17 Aug 2021 10:57:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFwmO-0001aF-Gk
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 10:57:12 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8aaaa1cb-87a4-4300-a9a5-74ca4ce58918;
 Tue, 17 Aug 2021 10:57:11 +0000 (UTC)
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
X-Inumbo-ID: 8aaaa1cb-87a4-4300-a9a5-74ca4ce58918
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629197831;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BQ8nKRxYnOzuCTUS7vy1EeCr+2lKdChvZDrdJcoBwPw=;
  b=DaTZ3NZ/CJSmXzXMpdPP5yra7BLhrryPZzP4dSSqyk2OI7DBFMuCD9LK
   YwpFF9FSX09OExgXW3VotPSTC0hu6Lxe/wT9U9741P8Q+1lLYsgEh0Q0b
   g9oSNbfCRCwWbYfdP9Evdf9onGYvC68TSxIBbuPe3jyf6Z3x6bq2axaRM
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TINP3stfJaLZdlWN14ok0l2oywxkiexrxPmaQ1CAsf4w6cZ2pRHSqo2qJvBnxwv4Bl2SL24SB+
 djaZC71p12JECvCUdTy4LOLXgk6iecpQtu+1Gcv/rE0F/cfEiMbGUVUN7rJrDzsaXxVB+JB0i7
 4huD9JF2ACkc0yvE/Q8mwezr+Dg1Doirjsne16VStYKZDhgK+o+Eb+YZ8UR1Si0yKYna6iBM3d
 nfQazJxV6lCpnI1OTvwia9AtoUnoLlyQkcGZEwEHgFl5XcWxlMufaaxo0OCKSK+dqy0fiUiS/G
 FkJaR87R3IbvjQb/VZhlrbp0
X-SBRS: 5.1
X-MesageID: 50623342
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5U8xnKqHwvRCqJiHtNiDOhgaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.84,328,1620705600"; 
   d="scan'208";a="50623342"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/cet: Fix build on newer versions of GCC
Date: Tue, 17 Aug 2021 11:56:56 +0100
Message-ID: <20210817105656.19683-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Some versions of GCC complain with:

  traps.c:405:22: error: 'get_shstk_bottom' defined but not used [-Werror=unused-function]
   static unsigned long get_shstk_bottom(unsigned long sp)
                        ^~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Change #ifdef to if ( IS_ENABLED(...) ) to make the sole user of
get_shstk_bottom() visible to the compiler.

Fixes: 35727551c070 ("x86/cet: Fix shskt manipulation error with BUGFRAME_{warn,run_fn}")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Not actually tested.  I don't seem to have a new enough GCC to hand.

Most of the delta here is indentation.  This diff is more easily reviewed with
`git show --ignore-all-space`
---
 xen/arch/x86/traps.c | 83 ++++++++++++++++++++++++++--------------------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 30eefbad4863..4a0e498b4c21 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -780,55 +780,56 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
 static void fixup_exception_return(struct cpu_user_regs *regs,
                                    unsigned long fixup)
 {
-#ifdef CONFIG_XEN_SHSTK
-    unsigned long ssp, *ptr, *base;
+    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
+    {
+        unsigned long ssp, *ptr, *base;
 
-    asm ( "rdsspq %0" : "=r" (ssp) : "0" (1) );
-    if ( ssp == 1 )
-        goto shstk_done;
+        asm ( "rdsspq %0" : "=r" (ssp) : "0" (1) );
+        if ( ssp == 1 )
+            goto shstk_done;
 
-    ptr = _p(ssp);
-    base = _p(get_shstk_bottom(ssp));
+        ptr = _p(ssp);
+        base = _p(get_shstk_bottom(ssp));
 
-    for ( ; ptr < base; ++ptr )
-    {
-        /*
-         * Search for %rip.  The shstk currently looks like this:
-         *
-         *   ...  [Likely pointed to by SSP]
-         *   %cs  [== regs->cs]
-         *   %rip [== regs->rip]
-         *   SSP  [Likely points to 3 slots higher, above %cs]
-         *   ...  [call tree to this function, likely 2/3 slots]
-         *
-         * and we want to overwrite %rip with fixup.  There are two
-         * complications:
-         *   1) We cant depend on SSP values, because they won't differ by 3
-         *      slots if the exception is taken on an IST stack.
-         *   2) There are synthetic (unrealistic but not impossible) scenarios
-         *      where %rip can end up in the call tree to this function, so we
-         *      can't check against regs->rip alone.
-         *
-         * Check for both regs->rip and regs->cs matching.
-         */
-        if ( ptr[0] == regs->rip && ptr[1] == regs->cs )
+        for ( ; ptr < base; ++ptr )
         {
-            asm ( "wrssq %[fix], %[stk]"
-                  : [stk] "=m" (ptr[0])
-                  : [fix] "r" (fixup) );
-            goto shstk_done;
+            /*
+             * Search for %rip.  The shstk currently looks like this:
+             *
+             *   ...  [Likely pointed to by SSP]
+             *   %cs  [== regs->cs]
+             *   %rip [== regs->rip]
+             *   SSP  [Likely points to 3 slots higher, above %cs]
+             *   ...  [call tree to this function, likely 2/3 slots]
+             *
+             * and we want to overwrite %rip with fixup.  There are two
+             * complications:
+             *   1) We cant depend on SSP values, because they won't differ by
+             *      3 slots if the exception is taken on an IST stack.
+             *   2) There are synthetic (unrealistic but not impossible)
+             *      scenarios where %rip can end up in the call tree to this
+             *      function, so we can't check against regs->rip alone.
+             *
+             * Check for both regs->rip and regs->cs matching.
+             */
+            if ( ptr[0] == regs->rip && ptr[1] == regs->cs )
+            {
+                asm ( "wrssq %[fix], %[stk]"
+                      : [stk] "=m" (ptr[0])
+                      : [fix] "r" (fixup) );
+                goto shstk_done;
+            }
         }
-    }
 
-    /*
-     * We failed to locate and fix up the shadow IRET frame.  This could be
-     * due to shadow stack corruption, or bad logic above.  We cannot continue
-     * executing the interrupted context.
-     */
-    BUG();
+        /*
+         * We failed to locate and fix up the shadow IRET frame.  This could
+         * be due to shadow stack corruption, or bad logic above.  We cannot
+         * continue executing the interrupted context.
+         */
+        BUG();
 
+    }
  shstk_done:
-#endif /* CONFIG_XEN_SHSTK */
 
     /* Fixup the regular stack. */
     regs->rip = fixup;
-- 
2.11.0


