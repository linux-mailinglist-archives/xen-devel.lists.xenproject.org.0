Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E275C5B15E9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 09:47:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402777.644654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWCEz-0004vi-5S; Thu, 08 Sep 2022 07:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402777.644654; Thu, 08 Sep 2022 07:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWCEz-0004tO-2P; Thu, 08 Sep 2022 07:46:25 +0000
Received: by outflank-mailman (input) for mailman id 402777;
 Thu, 08 Sep 2022 07:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wZDO=ZL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWCEx-0004tG-10
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 07:46:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54bae50d-2f4a-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 09:46:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D26133BAA;
 Thu,  8 Sep 2022 07:46:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E409D13A6D;
 Thu,  8 Sep 2022 07:46:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B6dXNsydGWMjGgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 08 Sep 2022 07:46:20 +0000
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
X-Inumbo-ID: 54bae50d-2f4a-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662623181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8stUmslfXwqQ4rY4yqV0K4807cpifhdTUVRx/PmR6RU=;
	b=KiDgB6yhXX6BM0cM8WgB8fRfFB4c64hPj1AeCmzqf38RY6LayY7Vfv7IBcLs7T+tPrE9mQ
	NzZ01+IsA0lJ9GUB7KQi/D4YpyHLGJgRZjjddAUvV8Sf/3HgNwMem7iE9fa+ycWKaOkK5V
	MmBFuYT8UirtW6yHiThkok9/IETdO1A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/locks: add dynamic lock recursion checks
Date: Thu,  8 Sep 2022 09:46:19 +0200
Message-Id: <20220908074619.18221-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add checking of lock recursion to the hypervisor. This is done by using
a percpu data array for storing the address of each taken lock. Any
attempt to take a lock twice (with the exception of recursive
spinlocks) will result in a crash. This is especially meant for
detecting attempts to take a rwlock multiple times as a reader, which
will only result in a deadlock in case of another cpu trying to get the
lock as a writer in between.

The additional checks are not performance neutral, so they are enabled
only in debug builds per default, as the checks are active only with
CONFIG_DEBUG_LOCKS enabled. The size of the percpu data array can be
selected via a boot parameter.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
Further possible enhancements:
- record address or file/line of locker, too
- add sanity check when exiting hypervisor or going to idle that all locks
  have been released

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xen-command-line.pandoc |  12 +++
 xen/common/rwlock.c               |   6 ++
 xen/common/spinlock.c             | 145 ++++++++++++++++++++++++++++++
 xen/include/xen/rwlock.h          |  20 +++++
 xen/include/xen/spinlock.h        |   4 +
 5 files changed, 187 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9a79385a37..7d228ad5a1 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1631,6 +1631,18 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
 in hypervisor context to be able to dump the Last Interrupt/Exception To/From
 record with other registers.
 
+### lock-depth-size
+> `= <integer>`
+
+> Default: `lock-depth-size=64`
+
+Specifies the maximum number of nested locks tested for illegal recursions.
+Higher nesting levels still work, but recursion testing is omitted for those
+levels. In case an illegal recursion is detected the system will crash
+immediately. Specifying `0` will disable all testing of illegal lock nesting.
+
+This option is available for hypervisors built with CONFIG_DEBUG_LOCKS only.
+
 ### loglvl
 > `= <level>[/<rate-limited level>]` where level is `none | error | warning | info | debug | all`
 
diff --git a/xen/common/rwlock.c b/xen/common/rwlock.c
index aa15529bbe..18224a4bb5 100644
--- a/xen/common/rwlock.c
+++ b/xen/common/rwlock.c
@@ -54,6 +54,8 @@ void queue_read_lock_slowpath(rwlock_t *lock)
      * Signal the next one in queue to become queue head.
      */
     spin_unlock(&lock->lock);
+
+    lock_enter(&lock->lock.debug);
 }
 
 /*
@@ -100,6 +102,8 @@ void queue_write_lock_slowpath(rwlock_t *lock)
     }
  unlock:
     spin_unlock(&lock->lock);
+
+    lock_enter(&lock->lock.debug);
 }
 
 
@@ -146,4 +150,6 @@ void _percpu_write_lock(percpu_rwlock_t **per_cpudata,
         /* Give the coherency fabric a break. */
         cpu_relax();
     };
+
+    lock_enter(&percpu_rwlock->rwlock.lock.debug);
 }
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 62c83aaa6a..84996c3fbc 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -1,5 +1,8 @@
+#include <xen/cpu.h>
 #include <xen/lib.h>
 #include <xen/irq.h>
+#include <xen/notifier.h>
+#include <xen/param.h>
 #include <xen/smp.h>
 #include <xen/time.h>
 #include <xen/spinlock.h>
@@ -11,11 +14,77 @@
 
 #ifdef CONFIG_DEBUG_LOCKS
 
+/* Max. number of entries in locks_taken array. */
+static unsigned int __ro_after_init lock_depth_size = 64;
+integer_param("lock-depth-size", lock_depth_size);
+
+/*
+ * Array of addresses of taken locks.
+ * nr_locks_taken is the index after the last entry. As locks tend to be
+ * nested cleanly, when freeing a lock it will probably be the one before
+ * nr_locks_taken, and new entries can be entered at that index. It is fine
+ * for a lock to be released out of order, though.
+ */
+static DEFINE_PER_CPU(const union lock_debug **, locks_taken);
+static DEFINE_PER_CPU(unsigned int, nr_locks_taken);
+static bool __read_mostly max_depth_reached;
+
 static atomic_t spin_debug __read_mostly = ATOMIC_INIT(0);
 
+static int cf_check cpu_lockdebug_callback(struct notifier_block *nfb,
+                                           unsigned long action,
+                                           void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+
+    switch ( action )
+    {
+    case CPU_UP_PREPARE:
+        if ( !per_cpu(locks_taken, cpu) )
+            per_cpu(locks_taken, cpu) = xzalloc_array(const union lock_debug *,
+                                                      lock_depth_size);
+        if ( !per_cpu(locks_taken, cpu) )
+            printk(XENLOG_WARNING
+                   "cpu %u: failed to allocate lock recursion check area\n",
+                   cpu);
+        break;
+
+    case CPU_UP_CANCELED:
+    case CPU_DEAD:
+        XFREE(per_cpu(locks_taken, cpu));
+        break;
+
+    default:
+        break;
+    }
+
+    return 0;
+}
+
+static struct notifier_block cpu_lockdebug_nfb = {
+    .notifier_call = cpu_lockdebug_callback,
+};
+
+static int __init cf_check lockdebug_init(void)
+{
+    if ( lock_depth_size )
+    {
+        register_cpu_notifier(&cpu_lockdebug_nfb);
+        cpu_lockdebug_callback(&cpu_lockdebug_nfb, CPU_UP_PREPARE,
+                               (void *)(unsigned long)smp_processor_id());
+    }
+
+    return 0;
+}
+presmp_initcall(lockdebug_init);
+
 void check_lock(union lock_debug *debug, bool try)
 {
     bool irq_safe = !local_irq_is_enabled();
+    unsigned int cpu = smp_processor_id();
+    const union lock_debug *const *taken = per_cpu(locks_taken, cpu);
+    unsigned int nr_taken = per_cpu(nr_locks_taken, cpu);
+    unsigned int i;
 
     BUILD_BUG_ON(LOCK_DEBUG_PAD_BITS <= 0);
 
@@ -63,6 +132,16 @@ void check_lock(union lock_debug *debug, bool try)
             BUG();
         }
     }
+
+    if ( try )
+        return;
+
+    for ( i = 0; i < nr_taken; i++ )
+        if ( taken[i] == debug )
+        {
+            printk("CHECKLOCK FAILURE: lock at %p taken recursively\n", debug);
+            BUG();
+        }
 }
 
 static void check_barrier(union lock_debug *debug)
@@ -84,15 +163,81 @@ static void check_barrier(union lock_debug *debug)
     BUG_ON(!local_irq_is_enabled() && !debug->irq_safe);
 }
 
+void lock_enter(const union lock_debug *debug)
+{
+    unsigned int cpu = smp_processor_id();
+    const union lock_debug **taken = per_cpu(locks_taken, cpu);
+    unsigned int *nr_taken = &per_cpu(nr_locks_taken, cpu);
+    unsigned long flags;
+
+    if ( !taken )
+        return;
+
+    local_irq_save(flags);
+
+    if ( *nr_taken < lock_depth_size )
+        taken[(*nr_taken)++] = debug;
+    else if ( !max_depth_reached )
+    {
+        max_depth_reached = true;
+        printk("CHECKLOCK max lock depth %u reached!\n", lock_depth_size);
+        WARN();
+    }
+
+    local_irq_restore(flags);
+}
+
+void lock_exit(const union lock_debug *debug)
+{
+    unsigned int cpu = smp_processor_id();
+    const union lock_debug **taken = per_cpu(locks_taken, cpu);
+    unsigned int *nr_taken = &per_cpu(nr_locks_taken, cpu);
+    unsigned int i;
+    unsigned long flags;
+
+    if ( !taken )
+        return;
+
+    local_irq_save(flags);
+
+    for ( i = *nr_taken; i > 0; i-- )
+    {
+        if ( taken[i - 1] == debug )
+        {
+            memmove(taken + i - 1, taken + i,
+                    (*nr_taken - i) * sizeof(*taken));
+            (*nr_taken)--;
+            taken[*nr_taken] = NULL;
+
+            local_irq_restore(flags);
+
+            return;
+        }
+    }
+
+    if ( !max_depth_reached )
+    {
+        printk("CHECKLOCK released lock at %p not recorded!\n", debug);
+        WARN();
+    }
+
+    local_irq_restore(flags);
+}
+
 static void got_lock(union lock_debug *debug)
 {
     debug->cpu = smp_processor_id();
+
+    lock_enter(debug);
 }
 
 static void rel_lock(union lock_debug *debug)
 {
     if ( atomic_read(&spin_debug) > 0 )
         BUG_ON(debug->cpu != smp_processor_id());
+
+    lock_exit(debug);
+
     debug->cpu = SPINLOCK_NO_CPU;
 }
 
diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
index 0cc9167715..b8d52a5aa9 100644
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -66,7 +66,10 @@ static inline int _read_trylock(rwlock_t *lock)
          * arch_lock_acquire_barrier().
          */
         if ( likely(_can_read_lock(cnts)) )
+        {
+            lock_enter(&lock->lock.debug);
             return 1;
+        }
         atomic_sub(_QR_BIAS, &lock->cnts);
     }
     preempt_enable();
@@ -91,6 +94,7 @@ static inline void _read_lock(rwlock_t *lock)
     {
         /* The slow path calls check_lock() via spin_lock(). */
         check_lock(&lock->lock.debug, false);
+        lock_enter(&lock->lock.debug);
         return;
     }
 
@@ -123,6 +127,8 @@ static inline unsigned long _read_lock_irqsave(rwlock_t *lock)
  */
 static inline void _read_unlock(rwlock_t *lock)
 {
+    lock_exit(&lock->lock.debug);
+
     arch_lock_release_barrier();
     /*
      * Atomically decrement the reader count
@@ -170,6 +176,7 @@ static inline void _write_lock(rwlock_t *lock)
     {
         /* The slow path calls check_lock() via spin_lock(). */
         check_lock(&lock->lock.debug, false);
+        lock_enter(&lock->lock.debug);
         return;
     }
 
@@ -215,6 +222,8 @@ static inline int _write_trylock(rwlock_t *lock)
         return 0;
     }
 
+    lock_enter(&lock->lock.debug);
+
     /*
      * atomic_cmpxchg() is a full barrier so no need for an
      * arch_lock_acquire_barrier().
@@ -225,6 +234,9 @@ static inline int _write_trylock(rwlock_t *lock)
 static inline void _write_unlock(rwlock_t *lock)
 {
     ASSERT(_is_write_locked_by_me(atomic_read(&lock->cnts)));
+
+    lock_exit(&lock->lock.debug);
+
     arch_lock_release_barrier();
     atomic_and(~(_QW_CPUMASK | _QW_WMASK), &lock->cnts);
     preempt_enable();
@@ -343,6 +355,8 @@ static inline void _percpu_read_lock(percpu_rwlock_t **per_cpudata,
         /* All other paths have implicit check_lock() calls via read_lock(). */
         check_lock(&percpu_rwlock->rwlock.lock.debug, false);
     }
+
+    lock_enter(&percpu_rwlock->rwlock.lock.debug);
 }
 
 static inline void _percpu_read_unlock(percpu_rwlock_t **per_cpudata,
@@ -353,6 +367,9 @@ static inline void _percpu_read_unlock(percpu_rwlock_t **per_cpudata,
 
     /* Verify the read lock was taken for this lock */
     ASSERT(this_cpu_ptr(per_cpudata) != NULL);
+
+    lock_exit(&percpu_rwlock->rwlock.lock.debug);
+
     /*
      * Detect using a second percpu_rwlock_t simulatenously and fallback
      * to standard read_unlock.
@@ -379,6 +396,9 @@ static inline void _percpu_write_unlock(percpu_rwlock_t **per_cpudata,
 
     ASSERT(percpu_rwlock->writer_activating);
     percpu_rwlock->writer_activating = 0;
+
+    lock_exit(&percpu_rwlock->rwlock.lock.debug);
+
     write_unlock(&percpu_rwlock->rwlock);
 }
 
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 961891bea4..2fa6ba3654 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -22,12 +22,16 @@ union lock_debug {
 };
 #define _LOCK_DEBUG { LOCK_DEBUG_INITVAL }
 void check_lock(union lock_debug *debug, bool try);
+void lock_enter(const union lock_debug *debug);
+void lock_exit(const union lock_debug *debug);
 void spin_debug_enable(void);
 void spin_debug_disable(void);
 #else
 union lock_debug { };
 #define _LOCK_DEBUG { }
 #define check_lock(l, t) ((void)0)
+#define lock_enter(l) ((void)0)
+#define lock_exit(l) ((void)0)
 #define spin_debug_enable() ((void)0)
 #define spin_debug_disable() ((void)0)
 #endif
-- 
2.35.3


