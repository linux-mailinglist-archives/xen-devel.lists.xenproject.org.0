Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8517623E1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 22:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569938.891164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOvv-0007AF-0H; Tue, 25 Jul 2023 20:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569938.891164; Tue, 25 Jul 2023 20:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOvu-00078a-Tv; Tue, 25 Jul 2023 20:47:02 +0000
Received: by outflank-mailman (input) for mailman id 569938;
 Tue, 25 Jul 2023 20:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Iib=DL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOOvu-00078T-AP
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 20:47:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 672ea056-2b2c-11ee-b240-6b7b168915f2;
 Tue, 25 Jul 2023 22:47:00 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.163.26.148])
 by support.bugseng.com (Postfix) with ESMTPSA id 906644EE0738;
 Tue, 25 Jul 2023 22:46:58 +0200 (CEST)
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
X-Inumbo-ID: 672ea056-2b2c-11ee-b240-6b7b168915f2
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
Subject: [XEN PATCH v3] xen/spinlock: mechanically rename parameter name 'debug'
Date: Tue, 25 Jul 2023 22:45:33 +0200
Message-Id: <a66f1084686b77b098c5ccf3d0cf5f52980fdf5a.1690317797.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

To avoid any confusion resulting from the parameter 'debug'
hiding the homonymous function declared at
'xen/arch/x86/include/asm/processor.h:428'
the rename of parameters s/debug/lkdbg/ is performed.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- s/dbg/lkdbg/
Changes in v3:
- Added missing renames for consistency
---
 xen/common/spinlock.c      | 38 +++++++++++++++++++-------------------
 xen/include/xen/spinlock.h |  6 +++---
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 7f453234a9..d4088f910d 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -78,7 +78,7 @@ static int __init cf_check lockdebug_init(void)
 }
 presmp_initcall(lockdebug_init);
 
-void check_lock(union lock_debug *debug, bool try)
+void check_lock(union lock_debug *lkdbg, bool try)
 {
     bool irq_safe = !local_irq_is_enabled();
     unsigned int cpu = smp_processor_id();
@@ -118,12 +118,12 @@ void check_lock(union lock_debug *debug, bool try)
     if ( try && irq_safe )
         return;
 
-    if ( unlikely(debug->irq_safe != irq_safe) )
+    if ( unlikely(lkdbg->irq_safe != irq_safe) )
     {
         union lock_debug seen, new = { 0 };
 
         new.irq_safe = irq_safe;
-        seen.val = cmpxchg(&debug->val, LOCK_DEBUG_INITVAL, new.val);
+        seen.val = cmpxchg(&lkdbg->val, LOCK_DEBUG_INITVAL, new.val);
 
         if ( !seen.unseen && seen.irq_safe == !irq_safe )
         {
@@ -137,14 +137,14 @@ void check_lock(union lock_debug *debug, bool try)
         return;
 
     for ( i = 0; i < nr_taken; i++ )
-        if ( taken[i] == debug )
+        if ( taken[i] == lkdbg )
         {
-            printk("CHECKLOCK FAILURE: lock at %p taken recursively\n", debug);
+            printk("CHECKLOCK FAILURE: lock at %p taken recursively\n", lkdbg);
             BUG();
         }
 }
 
-static void check_barrier(union lock_debug *debug)
+static void check_barrier(union lock_debug *lkdbg)
 {
     if ( unlikely(atomic_read(&spin_debug) <= 0) )
         return;
@@ -160,10 +160,10 @@ static void check_barrier(union lock_debug *debug)
      * However, if we spin on an IRQ-unsafe lock with IRQs disabled then that
      * is clearly wrong, for the same reason outlined in check_lock() above.
      */
-    BUG_ON(!local_irq_is_enabled() && !debug->irq_safe);
+    BUG_ON(!local_irq_is_enabled() && !lkdbg->irq_safe);
 }
 
-void lock_enter(const union lock_debug *debug)
+void lock_enter(const union lock_debug *lkdbg)
 {
     unsigned int cpu = smp_processor_id();
     const union lock_debug **taken = per_cpu(locks_taken, cpu);
@@ -176,7 +176,7 @@ void lock_enter(const union lock_debug *debug)
     local_irq_save(flags);
 
     if ( *nr_taken < lock_depth_size )
-        taken[(*nr_taken)++] = debug;
+        taken[(*nr_taken)++] = lkdbg;
     else if ( !max_depth_reached )
     {
         max_depth_reached = true;
@@ -187,7 +187,7 @@ void lock_enter(const union lock_debug *debug)
     local_irq_restore(flags);
 }
 
-void lock_exit(const union lock_debug *debug)
+void lock_exit(const union lock_debug *lkdbg)
 {
     unsigned int cpu = smp_processor_id();
     const union lock_debug **taken = per_cpu(locks_taken, cpu);
@@ -202,7 +202,7 @@ void lock_exit(const union lock_debug *debug)
 
     for ( i = *nr_taken; i > 0; i-- )
     {
-        if ( taken[i - 1] == debug )
+        if ( taken[i - 1] == lkdbg )
         {
             memmove(taken + i - 1, taken + i,
                     (*nr_taken - i) * sizeof(*taken));
@@ -217,28 +217,28 @@ void lock_exit(const union lock_debug *debug)
 
     if ( !max_depth_reached )
     {
-        printk("CHECKLOCK released lock at %p not recorded!\n", debug);
+        printk("CHECKLOCK released lock at %p not recorded!\n", lkdbg);
         WARN();
     }
 
     local_irq_restore(flags);
 }
 
-static void got_lock(union lock_debug *debug)
+static void got_lock(union lock_debug *lkdbg)
 {
-    debug->cpu = smp_processor_id();
+    lkdbg->cpu = smp_processor_id();
 
-    lock_enter(debug);
+    lock_enter(lkdbg);
 }
 
-static void rel_lock(union lock_debug *debug)
+static void rel_lock(union lock_debug *lkdbg)
 {
     if ( atomic_read(&spin_debug) > 0 )
-        BUG_ON(debug->cpu != smp_processor_id());
+        BUG_ON(lkdbg->cpu != smp_processor_id());
 
-    lock_exit(debug);
+    lock_exit(lkdbg);
 
-    debug->cpu = SPINLOCK_NO_CPU;
+    lkdbg->cpu = SPINLOCK_NO_CPU;
 }
 
 void spin_debug_enable(void)
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 0a02a527dc..464af705eb 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -22,9 +22,9 @@ union lock_debug {
     };
 };
 #define _LOCK_DEBUG { LOCK_DEBUG_INITVAL }
-void check_lock(union lock_debug *debug, bool try);
-void lock_enter(const union lock_debug *debug);
-void lock_exit(const union lock_debug *debug);
+void check_lock(union lock_debug *lkdbg, bool try);
+void lock_enter(const union lock_debug *lkdbg);
+void lock_exit(const union lock_debug *lkdbg);
 void spin_debug_enable(void);
 void spin_debug_disable(void);
 #else
-- 
2.34.1


