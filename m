Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F131DD232
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 17:44:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbnM1-0005iR-2o; Thu, 21 May 2020 15:43:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6/I=7D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbnLz-0005iM-UQ
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 15:43:27 +0000
X-Inumbo-ID: cf5a1a74-9b79-11ea-ab28-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf5a1a74-9b79-11ea-ab28-12813bfff9fa;
 Thu, 21 May 2020 15:43:26 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cEQAIyRN+tdQi+VpIaRV7Q1pQgxcZYrRRMia970thXQEK5dywKJkHh48aAL7Ff3uPsuI61o82a
 QaAonCbikwrrQ83ipUmYxEzHZmZ7EvZsKT1tJmVFyTLkfvUu57hbkFQiHpc4lD9O3hzaQtCJgF
 mvQuN0VxuPANzHU61Cbpm1PfgjNin52WjHzqApjU4r+ty6xv0ouy1Wr51SpvEh71cKSw7aPkcq
 nZEhUX+PIYl1pVuXig2c26Eh7+Xe8SpvchQMpv4wWmuw5wg6Dv1qP3k6vMBiozxPA6VkbdZkD2
 qdk=
X-SBRS: 2.7
X-MesageID: 18128437
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,418,1583211600"; d="scan'208";a="18128437"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2] x86/traps: Rework #PF[Rsvd] bit handling
Date: Thu, 21 May 2020 16:43:06 +0100
Message-ID: <20200521154306.29019-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200518153820.18170-1-andrew.cooper3@citrix.com>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
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

The reserved_bit_page_fault() paths effectively turn reserved bit faults into
a warning, but in the light of L1TF, the real impact is far more serious.

Make #PF[Rsvd] a hard error, irrespective of mode.  Any new panic() caused by
this constitutes pagetable corruption, and probably an L1TF gadget needing
fixing.

Drop the PFEC_reserved_bit check in __page_fault_type() which has been made
dead by the rearrangement in do_page_fault().

Additionally, drop the comment for do_page_fault().  It is inaccurate (bit 0
being set isn't always a protection violation) and stale (missing bits
5,6,15,31).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Reword commit message and comment in do_page_fault().
---
 xen/arch/x86/traps.c | 42 ++++++++++++++++--------------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 1f6f1dde76..e8a0877344 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1137,15 +1137,6 @@ void do_int3(struct cpu_user_regs *regs)
     pv_inject_hw_exception(TRAP_int3, X86_EVENT_NO_EC);
 }
 
-static void reserved_bit_page_fault(unsigned long addr,
-                                    struct cpu_user_regs *regs)
-{
-    printk("%pv: reserved bit in page table (ec=%04X)\n",
-           current, regs->error_code);
-    show_page_walk(addr);
-    show_execution_state(regs);
-}
-
 #ifdef CONFIG_PV
 static int handle_ldt_mapping_fault(unsigned int offset,
                                     struct cpu_user_regs *regs)
@@ -1248,10 +1239,6 @@ static enum pf_type __page_fault_type(unsigned long addr,
     if ( in_irq() )
         return real_fault;
 
-    /* Reserved bit violations are never spurious faults. */
-    if ( error_code & PFEC_reserved_bit )
-        return real_fault;
-
     required_flags  = _PAGE_PRESENT;
     if ( error_code & PFEC_write_access )
         required_flags |= _PAGE_RW;
@@ -1413,14 +1400,6 @@ static int fixup_page_fault(unsigned long addr, struct cpu_user_regs *regs)
     return 0;
 }
 
-/*
- * #PF error code:
- *  Bit 0: Protection violation (=1) ; Page not present (=0)
- *  Bit 1: Write access
- *  Bit 2: User mode (=1) ; Supervisor mode (=0)
- *  Bit 3: Reserved bit violation
- *  Bit 4: Instruction fetch
- */
 void do_page_fault(struct cpu_user_regs *regs)
 {
     unsigned long addr, fixup;
@@ -1439,6 +1418,21 @@ void do_page_fault(struct cpu_user_regs *regs)
     if ( unlikely(fixup_page_fault(addr, regs) != 0) )
         return;
 
+    /*
+     * Xen doesn't have reserved bits set in its pagetables, nor do we permit
+     * PV guests to write any.  Such entries would generally be vulnerable to
+     * the L1TF sidechannel.
+     *
+     * The shadow pagetable logic may use reserved bits as part of
+     * SHOPT_FAST_FAULT_PATH.  Pagefaults arising from these will be resolved
+     * via the fixup_page_fault() path.
+     *
+     * Anything remaining is an error, constituting corruption of the
+     * pagetables and probably an L1TF vulnerable gadget.
+     */
+    if ( error_code & PFEC_reserved_bit )
+        goto fatal;
+
     if ( unlikely(!guest_mode(regs)) )
     {
         enum pf_type pf_type = spurious_page_fault(addr, regs);
@@ -1457,13 +1451,12 @@ void do_page_fault(struct cpu_user_regs *regs)
         if ( likely((fixup = search_exception_table(regs)) != 0) )
         {
             perfc_incr(copy_user_faults);
-            if ( unlikely(regs->error_code & PFEC_reserved_bit) )
-                reserved_bit_page_fault(addr, regs);
             this_cpu(last_extable_addr) = regs->rip;
             regs->rip = fixup;
             return;
         }
 
+    fatal:
         if ( debugger_trap_fatal(TRAP_page_fault, regs) )
             return;
 
@@ -1475,9 +1468,6 @@ void do_page_fault(struct cpu_user_regs *regs)
               error_code, _p(addr));
     }
 
-    if ( unlikely(regs->error_code & PFEC_reserved_bit) )
-        reserved_bit_page_fault(addr, regs);
-
     pv_inject_page_fault(regs->error_code, addr);
 }
 
-- 
2.11.0


