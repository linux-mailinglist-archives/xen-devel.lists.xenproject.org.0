Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCBF1C210C
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 00:59:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUecZ-0007us-RN; Fri, 01 May 2020 22:59:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUecX-0007ud-Gj
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 22:59:01 +0000
X-Inumbo-ID: 57b0d122-8bff-11ea-9887-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57b0d122-8bff-11ea-9887-bc764e2007e4;
 Fri, 01 May 2020 22:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588373939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7x5ESMNeelNN6mx92zjbIOif/mDl8/XYbLA1njk7T8g=;
 b=R9E45x62qjLIIIrMD3jzK2GbTFHHkI+BwqxvDmcVb70lHvfjcb3mzZ/C
 ghkXCb8EpC4SZSzeTtfL4uwQlKdO5KPQpNKPWrHjIlvE4gTrPZAr9/USD
 1+ISsVUN2IdU39rVqsWHJNvkaCXBqRyz3J7RPXXlTYe2h6rJJJuEDwl9T 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V89ehA/w7+CdA8L11/1s8fe0cbsS4DVzi0DwAvyQ+3YkGGg7gmWsJXV9QR5avOXlUNEoFQS9n6
 8Gkk62mZSUQqmPjD3g7sISTx7m4uUmjqAVbftWuDHHvCj1CO0anil0m0yVq0Itnv+YA2QQ2jUW
 s5qAbhy5L3GsMo8wVxwOe+szIBB48mDxwqqJvPSEokAEDmXxXq2XAx5NcGxNIdnVWvXsnDaUSl
 +z8W3a83ZhXBmPRQGBGoZLvUnDFkqtwG/L+2gPxpuZ1w6nOicjY37awmlO9tdJUHNM27mrC9A8
 p8Y=
X-SBRS: 2.7
X-MesageID: 16994843
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16994843"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 07/16] x86/shstk: Re-layout the stack block for shadow stacks
Date: Fri, 1 May 2020 23:58:29 +0100
Message-ID: <20200501225838.9866-8-andrew.cooper3@citrix.com>
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

We have two free pages in the current stack.  A useful property of shadow
stacks and regular stacks is that they act as each others guard pages as far
as OoB writes go.

Move the regular IST stacks up by one page, to allow their shadow stack page
to be in slot 0.  The primary shadow stack uses slot 5.

As the shadow IST stacks are only 1k large, shuffle the order of IST vectors
to have #DF numerically highest (so there is no chance of a shadow stack
overflow clobbering the supervisor token).

The XPTI code already breaks the MEMORY_GUARD abstraction for stacks by
forcing it to be present.  To avoid having too many configurations, do away
with the concept entirely, and unconditionally unmap the pages in all cases.

A later change will turn these properly into shadow stacks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c       | 10 +++++-----
 xen/arch/x86/mm.c               | 19 ++++++-------------
 xen/arch/x86/smpboot.c          |  3 +--
 xen/arch/x86/traps.c            | 23 ++++++-----------------
 xen/include/asm-x86/current.h   | 12 ++++++------
 xen/include/asm-x86/mm.h        |  1 -
 xen/include/asm-x86/processor.h |  6 +++---
 7 files changed, 27 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 131ff03fcf..290f9f1c30 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -732,14 +732,14 @@ void load_system_tables(void)
 		.rsp2 = 0x8600111111111111ul,
 
 		/*
-		 * MCE, NMI and Double Fault handlers get their own stacks.
+		 * #DB, NMI, DF and #MCE handlers get their own stacks.
 		 * All others poisoned.
 		 */
 		.ist = {
-			[IST_MCE - 1] = stack_top + IST_MCE * PAGE_SIZE,
-			[IST_DF  - 1] = stack_top + IST_DF  * PAGE_SIZE,
-			[IST_NMI - 1] = stack_top + IST_NMI * PAGE_SIZE,
-			[IST_DB  - 1] = stack_top + IST_DB  * PAGE_SIZE,
+			[IST_MCE - 1] = stack_top + (1 + IST_MCE) * PAGE_SIZE,
+			[IST_NMI - 1] = stack_top + (1 + IST_NMI) * PAGE_SIZE,
+			[IST_DB  - 1] = stack_top + (1 + IST_DB)  * PAGE_SIZE,
+			[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE,
 
 			[IST_MAX ... ARRAY_SIZE(tss->ist) - 1] =
 				0x8600111111111111ul,
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 355c50ff91..bc44d865ef 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6002,25 +6002,18 @@ void memguard_unguard_range(void *p, unsigned long l)
 
 void memguard_guard_stack(void *p)
 {
-    /* IST_MAX IST pages + at least 1 guard page + primary stack. */
-    BUILD_BUG_ON((IST_MAX + 1) * PAGE_SIZE + PRIMARY_STACK_SIZE > STACK_SIZE);
+    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
 
-    memguard_guard_range(p + IST_MAX * PAGE_SIZE,
-                         STACK_SIZE - PRIMARY_STACK_SIZE - IST_MAX * PAGE_SIZE);
+    p += 5 * PAGE_SIZE;
+    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
 }
 
 void memguard_unguard_stack(void *p)
 {
-    memguard_unguard_range(p + IST_MAX * PAGE_SIZE,
-                           STACK_SIZE - PRIMARY_STACK_SIZE - IST_MAX * PAGE_SIZE);
-}
-
-bool memguard_is_stack_guard_page(unsigned long addr)
-{
-    addr &= STACK_SIZE - 1;
+    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_RW);
 
-    return addr >= IST_MAX * PAGE_SIZE &&
-           addr < STACK_SIZE - PRIMARY_STACK_SIZE;
+    p += 5 * PAGE_SIZE;
+    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_RW);
 }
 
 void arch_dump_shared_mem_info(void)
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index f999323bc4..e0f421ca3d 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -823,8 +823,7 @@ static int setup_cpu_root_pgt(unsigned int cpu)
 
     /* Install direct map page table entries for stack, IDT, and TSS. */
     for ( off = rc = 0; !rc && off < STACK_SIZE; off += PAGE_SIZE )
-        if ( !memguard_is_stack_guard_page(off) )
-            rc = clone_mapping(__va(__pa(stack_base[cpu])) + off, rpt);
+        rc = clone_mapping(__va(__pa(stack_base[cpu])) + off, rpt);
 
     if ( !rc )
         rc = clone_mapping(idt_tables[cpu], rpt);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index ddbe312f89..1cf00c1f4a 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -369,20 +369,15 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
 /*
  * Notes for get_stack_trace_bottom() and get_stack_dump_bottom()
  *
- * Stack pages 0 - 3:
+ * Stack pages 1 - 4:
  *   These are all 1-page IST stacks.  Each of these stacks have an exception
  *   frame and saved register state at the top.  The interesting bound for a
  *   trace is the word adjacent to this, while the bound for a dump is the
  *   very top, including the exception frame.
  *
- * Stack pages 4 and 5:
- *   None of these are particularly interesting.  With MEMORY_GUARD, page 5 is
- *   explicitly not present, so attempting to dump or trace it is
- *   counterproductive.  Without MEMORY_GUARD, it is possible for a call chain
- *   to use the entire primary stack and wander into page 5.  In this case,
- *   consider these pages an extension of the primary stack to aid debugging
- *   hopefully rare situations where the primary stack has effective been
- *   overflown.
+ * Stack pages 0 and 5:
+ *   Shadow stacks.  These are mapped read-only, and used by CET-SS capable
+ *   processors.  They will never contain regular stack data.
  *
  * Stack pages 6 and 7:
  *   These form the primary stack, and have a cpu_info at the top.  For a
@@ -396,13 +391,10 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
 {
     switch ( get_stack_page(sp) )
     {
-    case 0 ... 3:
+    case 1 ... 4:
         return ROUNDUP(sp, PAGE_SIZE) -
             offsetof(struct cpu_user_regs, es) - sizeof(unsigned long);
 
-#ifndef MEMORY_GUARD
-    case 4 ... 5:
-#endif
     case 6 ... 7:
         return ROUNDUP(sp, STACK_SIZE) -
             sizeof(struct cpu_info) - sizeof(unsigned long);
@@ -416,12 +408,9 @@ unsigned long get_stack_dump_bottom(unsigned long sp)
 {
     switch ( get_stack_page(sp) )
     {
-    case 0 ... 3:
+    case 1 ... 4:
         return ROUNDUP(sp, PAGE_SIZE) - sizeof(unsigned long);
 
-#ifndef MEMORY_GUARD
-    case 4 ... 5:
-#endif
     case 6 ... 7:
         return ROUNDUP(sp, STACK_SIZE) - sizeof(unsigned long);
 
diff --git a/xen/include/asm-x86/current.h b/xen/include/asm-x86/current.h
index 5b8f4dbc79..99b66a0087 100644
--- a/xen/include/asm-x86/current.h
+++ b/xen/include/asm-x86/current.h
@@ -16,12 +16,12 @@
  *
  * 7 - Primary stack (with a struct cpu_info at the top)
  * 6 - Primary stack
- * 5 - Optionally not present (MEMORY_GUARD)
- * 4 - Unused; optionally not present (MEMORY_GUARD)
- * 3 - Unused; optionally not present (MEMORY_GUARD)
- * 2 - MCE IST stack
- * 1 - NMI IST stack
- * 0 - Double Fault IST stack
+ * 5 - Primay Shadow Stack (read-only)
+ * 4 - #DF IST stack
+ * 3 - #DB IST stack
+ * 2 - NMI IST stack
+ * 1 - #MC IST stack
+ * 0 - IST Shadow Stacks (4x 1k, read-only)
  */
 
 /*
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index 3d3f9d49ac..7e74996053 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -536,7 +536,6 @@ void memguard_unguard_range(void *p, unsigned long l);
 
 void memguard_guard_stack(void *p);
 void memguard_unguard_stack(void *p);
-bool __attribute_const__ memguard_is_stack_guard_page(unsigned long addr);
 
 struct mmio_ro_emulate_ctxt {
         unsigned long cr2;
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index 5e8a0fb649..f7e80d12e4 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -439,10 +439,10 @@ struct tss_page {
 DECLARE_PER_CPU(struct tss_page, tss_page);
 
 #define IST_NONE 0UL
-#define IST_DF   1UL
+#define IST_MCE  1UL
 #define IST_NMI  2UL
-#define IST_MCE  3UL
-#define IST_DB   4UL
+#define IST_DB   3UL
+#define IST_DF   4UL
 #define IST_MAX  4UL
 
 /* Set the Interrupt Stack Table used by a particular IDT entry. */
-- 
2.11.0


