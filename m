Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37FA192664
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:58:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH3h1-0005Sa-J0; Wed, 25 Mar 2020 10:55:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O/z9=5K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jH3h0-0005S2-Ck
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:55:26 +0000
X-Inumbo-ID: 1bcaa79a-6e87-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bcaa79a-6e87-11ea-92cf-bc764e2007e4;
 Wed, 25 Mar 2020 10:55:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D5C47AC24;
 Wed, 25 Mar 2020 10:55:14 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Mar 2020 11:55:08 +0100
Message-Id: <20200325105511.20882-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200325105511.20882-1-jgross@suse.com>
References: <20200325105511.20882-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v7 2/5] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Today rcu_barrier() is calling stop_machine_run() to synchronize all
physical cpus in order to ensure all pending rcu calls have finished
when returning.

As stop_machine_run() is using tasklets this requires scheduling of
idle vcpus on all cpus imposing the need to call rcu_barrier() on idle
cpus only in case of core scheduling being active, as otherwise a
scheduling deadlock would occur.

There is no need at all to do the syncing of the cpus in tasklets, as
rcu activity is started in __do_softirq() called whenever softirq
activity is allowed. So rcu_barrier() can easily be modified to use
softirq for synchronization of the cpus no longer requiring any
scheduling activity.

As there already is a rcu softirq reuse that for the synchronization.

Remove the barrier element from struct rcu_data as it isn't used.

Finally switch rcu_barrier() to return void as it now can never fail.

Partially-based-on-patch-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add recursion detection

V3:
- fix races (Igor Druzhinin)

V5:
- rename done_count to pending_count (Jan Beulich)
- fix race (Jan Beulich)

V6:
- add barrier (Julien Grall)
- add ASSERT() (Julien Grall)
- hold cpu_map lock until end of rcu_barrier() (Julien Grall)

V7:
- update comment (Jan Beulich)
- add barriers (Jan Beulich)
---
 xen/common/rcupdate.c      | 100 +++++++++++++++++++++++++++++++++------------
 xen/include/xen/rcupdate.h |   2 +-
 2 files changed, 74 insertions(+), 28 deletions(-)

diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index 03d84764d2..12b89565d0 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -83,7 +83,6 @@ struct rcu_data {
     struct rcu_head **donetail;
     long            blimit;           /* Upper limit on a processed batch */
     int cpu;
-    struct rcu_head barrier;
     long            last_rs_qlen;     /* qlen during the last resched */
 
     /* 3) idle CPUs handling */
@@ -91,6 +90,7 @@ struct rcu_data {
     bool idle_timer_active;
 
     bool            process_callbacks;
+    bool            barrier_active;
 };
 
 /*
@@ -143,51 +143,90 @@ static int qhimark = 10000;
 static int qlowmark = 100;
 static int rsinterval = 1000;
 
-struct rcu_barrier_data {
-    struct rcu_head head;
-    atomic_t *cpu_count;
-};
+/*
+ * rcu_barrier() handling:
+ * Two counters are used to synchronize rcu_barrier() work:
+ * - cpu_count holds the number of cpus required to finish barrier handling.
+ *   It is decremented by each cpu when it has performed all pending rcu calls.
+ * - pending_count shows whether any rcu_barrier() activity is running and
+ *   it is used to synchronize leaving rcu_barrier() only after all cpus
+ *   have finished their processing. pending_count is initialized to nr_cpus + 1
+ *   and it is decremented by each cpu when it has seen that cpu_count has
+ *   reached 0. The cpu where rcu_barrier() has been called will wait until
+ *   pending_count has been decremented to 1 (so all cpus have seen cpu_count
+ *   reaching 0) and will then set pending_count to 0 indicating there is no
+ *   rcu_barrier() running.
+ * Cpus are synchronized via softirq mechanism. rcu_barrier() is regarded to
+ * be active if pending_count is not zero. In case rcu_barrier() is called on
+ * multiple cpus it is enough to check for pending_count being not zero on entry
+ * and to call process_pending_softirqs() in a loop until pending_count drops to
+ * zero, before starting the new rcu_barrier() processing.
+ */
+static atomic_t cpu_count = ATOMIC_INIT(0);
+static atomic_t pending_count = ATOMIC_INIT(0);
 
 static void rcu_barrier_callback(struct rcu_head *head)
 {
-    struct rcu_barrier_data *data = container_of(
-        head, struct rcu_barrier_data, head);
-    atomic_inc(data->cpu_count);
+    smp_mb__before_atomic();     /* Make all writes visible to other cpus. */
+    atomic_dec(&cpu_count);
 }
 
-static int rcu_barrier_action(void *_cpu_count)
+static void rcu_barrier_action(void)
 {
-    struct rcu_barrier_data data = { .cpu_count = _cpu_count };
-
-    ASSERT(!local_irq_is_enabled());
-    local_irq_enable();
+    struct rcu_head head;
 
     /*
      * When callback is executed, all previously-queued RCU work on this CPU
-     * is completed. When all CPUs have executed their callback, data.cpu_count
-     * will have been incremented to include every online CPU.
+     * is completed. When all CPUs have executed their callback, cpu_count
+     * will have been decremented to 0.
      */
-    call_rcu(&data.head, rcu_barrier_callback);
+    call_rcu(&head, rcu_barrier_callback);
 
-    while ( atomic_read(data.cpu_count) != num_online_cpus() )
+    while ( atomic_read(&cpu_count) )
     {
         process_pending_softirqs();
         cpu_relax();
     }
 
-    local_irq_disable();
-
-    return 0;
+    smp_mb__before_atomic();
+    atomic_dec(&pending_count);
 }
 
-/*
- * As rcu_barrier() is using stop_machine_run() it is allowed to be used in
- * idle context only (see comment for stop_machine_run()).
- */
-int rcu_barrier(void)
+void rcu_barrier(void)
 {
-    atomic_t cpu_count = ATOMIC_INIT(0);
-    return stop_machine_run(rcu_barrier_action, &cpu_count, NR_CPUS);
+    unsigned int n_cpus;
+
+    ASSERT(!in_irq() && local_irq_is_enabled());
+
+    for ( ; ; )
+    {
+        if ( !atomic_read(&pending_count) && get_cpu_maps() )
+        {
+            n_cpus = num_online_cpus();
+
+            if ( atomic_cmpxchg(&pending_count, 0, n_cpus + 1) == 0 )
+                break;
+
+            put_cpu_maps();
+        }
+
+        process_pending_softirqs();
+        cpu_relax();
+    }
+
+    smp_mb__before_atomic();
+    atomic_set(&cpu_count, n_cpus);
+    cpumask_raise_softirq(&cpu_online_map, RCU_SOFTIRQ);
+
+    while ( atomic_read(&pending_count) != 1 )
+    {
+        process_pending_softirqs();
+        cpu_relax();
+    }
+
+    atomic_set(&pending_count, 0);
+
+    put_cpu_maps();
 }
 
 /* Is batch a before batch b ? */
@@ -426,6 +465,13 @@ static void rcu_process_callbacks(void)
         rdp->process_callbacks = false;
         __rcu_process_callbacks(&rcu_ctrlblk, rdp);
     }
+
+    if ( atomic_read(&cpu_count) && !rdp->barrier_active )
+    {
+        rdp->barrier_active = true;
+        rcu_barrier_action();
+        rdp->barrier_active = false;
+    }
 }
 
 static int __rcu_pending(struct rcu_ctrlblk *rcp, struct rcu_data *rdp)
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index eb9b60df07..31c8b86d13 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -144,7 +144,7 @@ void rcu_check_callbacks(int cpu);
 void call_rcu(struct rcu_head *head, 
               void (*func)(struct rcu_head *head));
 
-int rcu_barrier(void);
+void rcu_barrier(void);
 
 void rcu_idle_enter(unsigned int cpu);
 void rcu_idle_exit(unsigned int cpu);
-- 
2.16.4


