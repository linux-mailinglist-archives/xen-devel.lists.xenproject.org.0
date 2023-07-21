Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4CC75CBB8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 17:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567618.886900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMs4A-0003pr-8N; Fri, 21 Jul 2023 15:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567618.886900; Fri, 21 Jul 2023 15:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMs4A-0003nr-5h; Fri, 21 Jul 2023 15:29:14 +0000
Received: by outflank-mailman (input) for mailman id 567618;
 Fri, 21 Jul 2023 15:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIrH=DH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qMs49-0003nl-6G
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 15:29:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 573f3b66-27db-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 17:29:11 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.162.18.33])
 by support.bugseng.com (Postfix) with ESMTPSA id 1894E4EE0C89;
 Fri, 21 Jul 2023 17:29:09 +0200 (CEST)
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
X-Inumbo-ID: 573f3b66-27db-11ee-8611-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/spinlock: mechanically rename parameter name 'debug'
Date: Fri, 21 Jul 2023 17:29:02 +0200
Message-Id: <78255b6c5caaaa02dad638c7d4102ea793a09b88.1689953306.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

To avoid any confusion resulting from the parameter 'debug'
hiding the homonymous function declared at
'xen/arch/x86/include/asm/processor.h:428'
the rename of parameters s/debug/dbg is performed.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
x86 maintainers CC'ed because the violation is caused by a declaration
in an x86 file, but I reckon it would harm understandability if
a function was renamed to 'dbg'
---
 xen/common/spinlock.c      | 38 +++++++++++++++++++-------------------
 xen/include/xen/spinlock.h |  6 +++---
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 7f453234a9..d8d2e6ad1a 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -78,7 +78,7 @@ static int __init cf_check lockdebug_init(void)
 }
 presmp_initcall(lockdebug_init);
 
-void check_lock(union lock_debug *debug, bool try)
+void check_lock(union lock_debug *dbg, bool try)
 {
     bool irq_safe = !local_irq_is_enabled();
     unsigned int cpu = smp_processor_id();
@@ -118,12 +118,12 @@ void check_lock(union lock_debug *debug, bool try)
     if ( try && irq_safe )
         return;
 
-    if ( unlikely(debug->irq_safe != irq_safe) )
+    if ( unlikely(dbg->irq_safe != irq_safe) )
     {
         union lock_debug seen, new = { 0 };
 
         new.irq_safe = irq_safe;
-        seen.val = cmpxchg(&debug->val, LOCK_DEBUG_INITVAL, new.val);
+        seen.val = cmpxchg(&dbg->val, LOCK_DEBUG_INITVAL, new.val);
 
         if ( !seen.unseen && seen.irq_safe == !irq_safe )
         {
@@ -137,14 +137,14 @@ void check_lock(union lock_debug *debug, bool try)
         return;
 
     for ( i = 0; i < nr_taken; i++ )
-        if ( taken[i] == debug )
+        if ( taken[i] == dbg )
         {
-            printk("CHECKLOCK FAILURE: lock at %p taken recursively\n", debug);
+            printk("CHECKLOCK FAILURE: lock at %p taken recursively\n", dbg);
             BUG();
         }
 }
 
-static void check_barrier(union lock_debug *debug)
+static void check_barrier(union lock_debug *dbg)
 {
     if ( unlikely(atomic_read(&spin_debug) <= 0) )
         return;
@@ -160,10 +160,10 @@ static void check_barrier(union lock_debug *debug)
      * However, if we spin on an IRQ-unsafe lock with IRQs disabled then that
      * is clearly wrong, for the same reason outlined in check_lock() above.
      */
-    BUG_ON(!local_irq_is_enabled() && !debug->irq_safe);
+    BUG_ON(!local_irq_is_enabled() && !dbg->irq_safe);
 }
 
-void lock_enter(const union lock_debug *debug)
+void lock_enter(const union lock_debug *dbg)
 {
     unsigned int cpu = smp_processor_id();
     const union lock_debug **taken = per_cpu(locks_taken, cpu);
@@ -176,7 +176,7 @@ void lock_enter(const union lock_debug *debug)
     local_irq_save(flags);
 
     if ( *nr_taken < lock_depth_size )
-        taken[(*nr_taken)++] = debug;
+        taken[(*nr_taken)++] = dbg;
     else if ( !max_depth_reached )
     {
         max_depth_reached = true;
@@ -187,7 +187,7 @@ void lock_enter(const union lock_debug *debug)
     local_irq_restore(flags);
 }
 
-void lock_exit(const union lock_debug *debug)
+void lock_exit(const union lock_debug *dbg)
 {
     unsigned int cpu = smp_processor_id();
     const union lock_debug **taken = per_cpu(locks_taken, cpu);
@@ -202,7 +202,7 @@ void lock_exit(const union lock_debug *debug)
 
     for ( i = *nr_taken; i > 0; i-- )
     {
-        if ( taken[i - 1] == debug )
+        if ( taken[i - 1] == dbg )
         {
             memmove(taken + i - 1, taken + i,
                     (*nr_taken - i) * sizeof(*taken));
@@ -217,28 +217,28 @@ void lock_exit(const union lock_debug *debug)
 
     if ( !max_depth_reached )
     {
-        printk("CHECKLOCK released lock at %p not recorded!\n", debug);
+        printk("CHECKLOCK released lock at %p not recorded!\n", dbg);
         WARN();
     }
 
     local_irq_restore(flags);
 }
 
-static void got_lock(union lock_debug *debug)
+static void got_lock(union lock_debug *dbg)
 {
-    debug->cpu = smp_processor_id();
+    dbg->cpu = smp_processor_id();
 
-    lock_enter(debug);
+    lock_enter(dbg);
 }
 
-static void rel_lock(union lock_debug *debug)
+static void rel_lock(union lock_debug *dbg)
 {
     if ( atomic_read(&spin_debug) > 0 )
-        BUG_ON(debug->cpu != smp_processor_id());
+        BUG_ON(dbg->cpu != smp_processor_id());
 
-    lock_exit(debug);
+    lock_exit(dbg);
 
-    debug->cpu = SPINLOCK_NO_CPU;
+    dbg->cpu = SPINLOCK_NO_CPU;
 }
 
 void spin_debug_enable(void)
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 0a02a527dc..d303c56f8a 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -22,9 +22,9 @@ union lock_debug {
     };
 };
 #define _LOCK_DEBUG { LOCK_DEBUG_INITVAL }
-void check_lock(union lock_debug *debug, bool try);
-void lock_enter(const union lock_debug *debug);
-void lock_exit(const union lock_debug *debug);
+void check_lock(union lock_debug *dbg, bool try);
+void lock_enter(const union lock_debug *dbg);
+void lock_exit(const union lock_debug *dbg);
 void spin_debug_enable(void);
 void spin_debug_disable(void);
 #else
-- 
2.34.1


