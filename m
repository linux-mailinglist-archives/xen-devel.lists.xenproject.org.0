Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D41E4E07
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1aM-00045B-8w; Wed, 27 May 2020 19:19:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1aK-00044V-Pr
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:19:28 +0000
X-Inumbo-ID: f35ede3a-a04e-11ea-81bc-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f35ede3a-a04e-11ea-81bc-bc764e2007e4;
 Wed, 27 May 2020 19:19:14 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6yVJg/lifPGO70PS2wgpoTRI1lbe6ilhKsuQKwn77mP8iPyQN+41b9d9G5++vpGzQ/ftQCiYYd
 ZgK+D1g3IJgzBulmn6XKKAh8lQHXEAR013SdwW9z7Es8GkxZwhq9lNVQL5o9+mJd8UZr4qw70k
 DPVef143ILoMh4hgxea53PUJo+MtnUWnGFsATZcYwMX6MwBk9SgtFF0lOnRrv5Cqp/CgWoewgF
 didimL59PEPr413Qm8eYsWKX+P+TE+UcqnnH6LksOZJyea05myySxgXXiSk46AV0q/4CMu/vFY
 1Qo=
X-SBRS: 2.7
X-MesageID: 19333917
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="19333917"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 05/14] x86/shstk: Re-layout the stack block for shadow
 stacks
Date: Wed, 27 May 2020 20:18:38 +0100
Message-ID: <20200527191847.17207-6-andrew.cooper3@citrix.com>
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

v2:
 * Adjust text
 * Introduce PRIMARY_SHSTK_SLOT (Name subject to improvement).
---
 xen/arch/x86/cpu/common.c       | 10 +++++-----
 xen/arch/x86/mm.c               | 19 ++++++-------------
 xen/arch/x86/smpboot.c          |  3 +--
 xen/arch/x86/traps.c            | 23 ++++++-----------------
 xen/include/asm-x86/config.h    |  3 +++
 xen/include/asm-x86/current.h   | 12 ++++++------
 xen/include/asm-x86/mm.h        |  1 -
 xen/include/asm-x86/processor.h |  6 +++---
 8 files changed, 30 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 09b911b3ba..690fd8baa8 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -753,14 +753,14 @@ void load_system_tables(void)
 	 * valid on every instruction boundary.  (Note: these are all
 	 * semantically ACCESS_ONCE() due to tss's volatile qualifier.)
 	 *
-	 * rsp0 refers to the primary stack.  #MC, #DF, NMI and #DB handlers
+	 * rsp0 refers to the primary stack.  #MC, NMI, #DB and #DF handlers
 	 * each get their own stacks.  No IO Bitmap.
 	 */
 	tss->rsp0 = stack_bottom;
-	tss->ist[IST_MCE - 1] = stack_top + IST_MCE * PAGE_SIZE;
-	tss->ist[IST_DF  - 1] = stack_top + IST_DF  * PAGE_SIZE;
-	tss->ist[IST_NMI - 1] = stack_top + IST_NMI * PAGE_SIZE;
-	tss->ist[IST_DB  - 1] = stack_top + IST_DB  * PAGE_SIZE;
+	tss->ist[IST_MCE - 1] = stack_top + (1 + IST_MCE) * PAGE_SIZE;
+	tss->ist[IST_NMI - 1] = stack_top + (1 + IST_NMI) * PAGE_SIZE;
+	tss->ist[IST_DB  - 1] = stack_top + (1 + IST_DB)  * PAGE_SIZE;
+	tss->ist[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE;
 	tss->bitmap = IOBMP_INVALID_OFFSET;
 
 	/* All other stack pointers poisioned. */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e42044eb74..2f1e716b6d 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5996,25 +5996,18 @@ void memguard_unguard_range(void *p, unsigned long l)
 
 void memguard_guard_stack(void *p)
 {
-    /* IST_MAX IST pages + at least 1 guard page + primary stack. */
-    BUILD_BUG_ON((IST_MAX + 1) * PAGE_SIZE + PRIMARY_STACK_SIZE > STACK_SIZE);
+    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
 
-    memguard_guard_range(p + IST_MAX * PAGE_SIZE,
-                         STACK_SIZE - PRIMARY_STACK_SIZE - IST_MAX * PAGE_SIZE);
+    p += PRIMARY_SHSTK_SLOT * PAGE_SIZE;
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
+    p += PRIMARY_SHSTK_SLOT * PAGE_SIZE;
+    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_RW);
 }
 
 void arch_dump_shared_mem_info(void)
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 170ab24e66..13b3dade9c 100644
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
index 90da787ee2..235a72cf4a 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -365,20 +365,15 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
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
@@ -392,13 +387,10 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
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
@@ -412,12 +404,9 @@ unsigned long get_stack_dump_bottom(unsigned long sp)
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
 
diff --git a/xen/include/asm-x86/config.h b/xen/include/asm-x86/config.h
index 266d281718..f3cf5df462 100644
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -75,6 +75,9 @@
 /* Primary stack is restricted to 8kB by guard pages. */
 #define PRIMARY_STACK_SIZE 8192
 
+/* Primary shadow stack is slot 5 of 8, immediately under the primary stack. */
+#define PRIMARY_SHSTK_SLOT 5
+
 /* Total size of syscall and emulation stubs. */
 #define STUB_BUF_SHIFT (L1_CACHE_SHIFT > 7 ? L1_CACHE_SHIFT : 7)
 #define STUB_BUF_SIZE  (1 << STUB_BUF_SHIFT)
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
index c2b9dc1ac0..8ab09cf7ed 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -440,10 +440,10 @@ struct tss_page {
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


