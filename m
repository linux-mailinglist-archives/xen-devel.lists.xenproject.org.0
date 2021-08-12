Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16F3EA92E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 19:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166538.303956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEEDj-0000xD-Mw; Thu, 12 Aug 2021 17:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166538.303956; Thu, 12 Aug 2021 17:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEEDj-0000uO-Jp; Thu, 12 Aug 2021 17:10:19 +0000
Received: by outflank-mailman (input) for mailman id 166538;
 Thu, 12 Aug 2021 17:10:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rsMc=ND=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mEEDh-0000uI-Cw
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 17:10:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28f3e700-fb90-11eb-a1e2-12813bfff9fa;
 Thu, 12 Aug 2021 17:10:15 +0000 (UTC)
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
X-Inumbo-ID: 28f3e700-fb90-11eb-a1e2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628788215;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2vk+22CWLeGFKU7TFxSSBYCGeIcpf60UuRjuX3+Sgek=;
  b=VqWHjrTeqpTglnpYZpKhVUO07XePjXbH+0QBcdCVbBaQsepkGr9YZpl4
   AcyOK7VMrrOeOImkdHLw1mkJZ4NlXFAvtemCf3qR5rkuE9CXIPB3SAAU2
   X21Ctq3kUy5g6AvWP+JbcQOnx8MdDbjAckrjBuayAkqldiWAucZM5aWfY
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GPYmbTzhh2ySuasRWmQ1JLB/2GsEMOcXaTltihiZl3bQbJFQHG58xR+XQJ/V2PAx5UV8r1qZrt
 vhcwlg9xz6pV6ZTJj+Z6pmJ2Bge/TX7i2+XuQNU9gZMyahJiAZgV+WqlP4uhVYkEy7++kVuoIl
 1tBT6+sRlEgaZ2NPcSdAdSBP5Ld2Hr4+HyJTkfkN3pODzEz1er5Yla4T5cjKmU1h8FuKAEIZdX
 J3uMpG0Z5n5nd5IFrVaWSItcK8Zemb34LsSWtgTAzlIEKCh/oww774VbBb4M1ya1JGPlgN90pi
 LHeTVznhFKIWa4xOELgvfqgl
X-SBRS: 5.1
X-MesageID: 52046591
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EzCN06tmk1sPFCCCVc+KkKNi7skDdtV00zEX/kB9WHVpmszxra
 CTdZMgpGbJYVcqKRcdcL+7Scu9qB/nm6KdgrNhWotKPjOW3VdARbsKheCJrlGOJ8SXzJ8k6U
 4KSdkcNDSfNzlHZL7BkW2FL+o=
X-IronPort-AV: E=Sophos;i="5.84,316,1620705600"; 
   d="scan'208";a="52046591"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/cet: Fix shskt manipulation error with BUGFRAME_{warn,run_fn}
Date: Thu, 12 Aug 2021 18:03:50 +0100
Message-ID: <20210812170350.23543-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This was a clear oversight in the original CET work.  The BUGFRAME_run_fn and
BUGFRAME_warn paths update regs->rip without an equivlenet adjustment to the
shadow stack, causes IRET to suffer #CP due to the mismatch.

One subtle, and therefore fragile, aspect of extable_shstk_fixup() was that it
required regs->rip to have its old value as a cross-check that the correct
word in the shadow stack was being adjusted.

Rework extable_shstk_fixup() into fixup_exception_return() which takes
ownership of the update to both the regular and shadow stacks, ensuring that
the regs->rip update is ordered suitably.

Use the new fixup_exception_return() for BUGFRAME_run_fn and BUGFRAME_warn to
ensure that the shadow stack is updated too.

Fixes: 209fb9919b50 ("x86/extable: Adjust extable handling to be shadow stack compatible")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Backport to 4.14

Only compile tested so far.  My one CET-SS machine is in use for other
purposes right now.

I'm not a massive fan of the large ifdef area.  The logic could be rearranged
to use IS_ENABLED(CONFIG_XEN_SHSTK) by indenting most of the function, but I
can't see any way to drop the goto's, and this is certainly the least-invasive
diff.
---
 xen/arch/x86/traps.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e60af16ddd8c..30eefbad4863 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -777,13 +777,15 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
           trapnr, vec_name(trapnr), regs->error_code);
 }
 
-static void extable_shstk_fixup(struct cpu_user_regs *regs, unsigned long fixup)
+static void fixup_exception_return(struct cpu_user_regs *regs,
+                                   unsigned long fixup)
 {
+#ifdef CONFIG_XEN_SHSTK
     unsigned long ssp, *ptr, *base;
 
     asm ( "rdsspq %0" : "=r" (ssp) : "0" (1) );
     if ( ssp == 1 )
-        return;
+        goto shstk_done;
 
     ptr = _p(ssp);
     base = _p(get_shstk_bottom(ssp));
@@ -814,7 +816,7 @@ static void extable_shstk_fixup(struct cpu_user_regs *regs, unsigned long fixup)
             asm ( "wrssq %[fix], %[stk]"
                   : [stk] "=m" (ptr[0])
                   : [fix] "r" (fixup) );
-            return;
+            goto shstk_done;
         }
     }
 
@@ -824,6 +826,12 @@ static void extable_shstk_fixup(struct cpu_user_regs *regs, unsigned long fixup)
      * executing the interrupted context.
      */
     BUG();
+
+ shstk_done:
+#endif /* CONFIG_XEN_SHSTK */
+
+    /* Fixup the regular stack. */
+    regs->rip = fixup;
 }
 
 static bool extable_fixup(struct cpu_user_regs *regs, bool print)
@@ -842,10 +850,7 @@ static bool extable_fixup(struct cpu_user_regs *regs, bool print)
                vec_name(regs->entry_vector), regs->error_code,
                _p(regs->rip), _p(regs->rip), _p(fixup));
 
-    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
-        extable_shstk_fixup(regs, fixup);
-
-    regs->rip = fixup;
+    fixup_exception_return(regs, fixup);
     this_cpu(last_extable_addr) = regs->rip;
 
     return true;
@@ -1138,7 +1143,7 @@ void do_invalid_op(struct cpu_user_regs *regs)
         void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
 
         fn(regs);
-        regs->rip = (unsigned long)eip;
+        fixup_exception_return(regs, (unsigned long)eip);
         return;
     }
 
@@ -1159,7 +1164,7 @@ void do_invalid_op(struct cpu_user_regs *regs)
     case BUGFRAME_warn:
         printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
         show_execution_state(regs);
-        regs->rip = (unsigned long)eip;
+        fixup_exception_return(regs, (unsigned long)eip);
         return;
 
     case BUGFRAME_bug:
-- 
2.11.0


