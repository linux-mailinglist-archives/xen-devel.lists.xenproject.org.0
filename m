Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DB51E4E3B
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:34:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1oy-0006cq-8j; Wed, 27 May 2020 19:34:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1ow-0006cN-HW
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:34:34 +0000
X-Inumbo-ID: 130007e4-a051-11ea-81bc-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 130007e4-a051-11ea-81bc-bc764e2007e4;
 Wed, 27 May 2020 19:34:26 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NPahr4HOwB/rPxUenW5oMXduKyL+uOiKhCpIDIFNdBdKGst4pFLbAcGaUzrmUK8S5AUttl92jn
 apZJLDNuAGxnq7nvb+RwyoDq0h6KJ9aNV5JKxkAqDGy05fCpCQYS+sW5Infn+BhObaVgccfRD7
 Cniq80QEBLLaA/PichBP8Kol8/FhBO7RzKG9oVCKq0naYVLJyYLSV1aBHMrJLVBP/cEpRLYDvF
 Gyf0yoFxFWl5qT/uT969foSfPYFHrdrSEZ43ePELaNMyryXcW9PQ+rV9YGfN093+Y80M8uaY2f
 f+w=
X-SBRS: 2.7
X-MesageID: 18592446
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="18592446"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 10/14] x86/extable: Adjust extable handling to be shadow
 stack compatible
Date: Wed, 27 May 2020 20:18:43 +0100
Message-ID: <20200527191847.17207-11-andrew.cooper3@citrix.com>
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

When adjusting an IRET frame to recover from a fault, and equivalent
adjustment needs making in the shadow IRET frame.

The adjustment in exception_with_ints_disabled() could in principle be an
alternative block rather than an ifdef, as the only two current users of
_PRE_EXTABLE() are IRET-to-guest instructions.  However, this is not a
fastpath, and this form is more robust to future changes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Break extable_shstk_fixup() out into a separate function.
 * Guard from shstk underflows, and unrealistic call traces.
---
 xen/arch/x86/traps.c        | 67 ++++++++++++++++++++++++++++++++++++++++++++-
 xen/arch/x86/x86_64/entry.S | 11 +++++++-
 2 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 235a72cf4a..ce910294ea 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -363,7 +363,7 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
 }
 
 /*
- * Notes for get_stack_trace_bottom() and get_stack_dump_bottom()
+ * Notes for get_{stack,shstk}*_bottom() helpers
  *
  * Stack pages 1 - 4:
  *   These are all 1-page IST stacks.  Each of these stacks have an exception
@@ -400,6 +400,18 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
     }
 }
 
+static unsigned long get_shstk_bottom(unsigned long sp)
+{
+    switch ( get_stack_page(sp) )
+    {
+#ifdef CONFIG_XEN_SHSTK
+    case 0:  return ROUNDUP(sp, IST_SHSTK_SIZE) - sizeof(unsigned long);
+    case 5:  return ROUNDUP(sp, PAGE_SIZE)      - sizeof(unsigned long);
+#endif
+    default: return sp - sizeof(unsigned long);
+    }
+}
+
 unsigned long get_stack_dump_bottom(unsigned long sp)
 {
     switch ( get_stack_page(sp) )
@@ -763,6 +775,56 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
           trapnr, vec_name(trapnr), regs->error_code);
 }
 
+static void extable_shstk_fixup(struct cpu_user_regs *regs, unsigned long fixup)
+{
+    unsigned long ssp, *ptr, *base;
+
+    asm ( "rdsspq %0" : "=r" (ssp) : "0" (1) );
+    if ( ssp == 1 )
+        return;
+
+    ptr = _p(ssp);
+    base = _p(get_shstk_bottom(ssp));
+
+    for ( ; ptr < base; ++ptr )
+    {
+        /*
+         * Search for %rip.  The shstk currently looks like this:
+         *
+         *   ...  [Likely pointed to by SSP]
+         *   %cs  [== regs->cs]
+         *   %rip [== regs->rip]
+         *   SSP  [Likely points to 3 slots higher, above %cs]
+         *   ...  [call tree to this function, likely 2/3 slots]
+         *
+         * and we want to overwrite %rip with fixup.  There are two
+         * complications:
+         *   1) We cant depend on SSP values, because they won't differ by 3
+         *      slots if the exception is taken on an IST stack.
+         *   2) There are synthetic (unrealistic but not impossible) scenarios
+         *      where %rip can end up in the call tree to this function, so we
+         *      can't check against regs->rip alone.
+         *
+         * Check for both reg->rip and regs->cs matching.
+         */
+
+        if ( ptr[0] == regs->rip && ptr[1] == regs->cs )
+        {
+            asm ( "wrssq %[fix], %[stk]"
+                  : [stk] "=m" (*ptr)
+                  : [fix] "r" (fixup) );
+            return;
+        }
+    }
+
+    /*
+     * We failed to locate and fix up the shadow IRET frame.  This could be
+     * due to shadow stack corruption, or bad logic above.  We cannot continue
+     * executing the interrupted context.
+     */
+    BUG();
+}
+
 static bool extable_fixup(struct cpu_user_regs *regs, bool print)
 {
     unsigned long fixup = search_exception_table(regs);
@@ -779,6 +841,9 @@ static bool extable_fixup(struct cpu_user_regs *regs, bool print)
                vec_name(regs->entry_vector), regs->error_code,
                _p(regs->rip), _p(regs->rip), _p(fixup));
 
+    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
+        extable_shstk_fixup(regs, fixup);
+
     regs->rip = fixup;
     this_cpu(last_extable_addr) = regs->rip;
 
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index f7ee3dce91..78ac0df49f 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -708,7 +708,16 @@ exception_with_ints_disabled:
         call  search_pre_exception_table
         testq %rax,%rax                 # no fixup code for faulting EIP?
         jz    1b
-        movq  %rax,UREGS_rip(%rsp)
+        movq  %rax,UREGS_rip(%rsp)      # fixup regular stack
+
+#ifdef CONFIG_XEN_SHSTK
+        mov    $1, %edi
+        rdsspq %rdi
+        cmp    $1, %edi
+        je     .L_exn_shstk_done
+        wrssq  %rax, (%rdi)             # fixup shadow stack
+.L_exn_shstk_done:
+#endif
         subq  $8,UREGS_rsp(%rsp)        # add ec/ev to previous stack frame
         testb $15,UREGS_rsp(%rsp)       # return %rsp is now aligned?
         jz    1f                        # then there is a pad quadword already
-- 
2.11.0


