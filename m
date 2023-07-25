Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C94760DFD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 11:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569561.890412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOE2m-00066c-8c; Tue, 25 Jul 2023 09:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569561.890412; Tue, 25 Jul 2023 09:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOE2m-00064t-4C; Tue, 25 Jul 2023 09:09:24 +0000
Received: by outflank-mailman (input) for mailman id 569561;
 Tue, 25 Jul 2023 09:09:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Iib=DL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOE2l-00064n-76
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 09:09:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ece9c984-2aca-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 11:09:14 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.161.75.91])
 by support.bugseng.com (Postfix) with ESMTPSA id D6EDD4EE0739;
 Tue, 25 Jul 2023 11:09:17 +0200 (CEST)
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
X-Inumbo-ID: ece9c984-2aca-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] xen/sched: mechanical renaming to address MISRA C:2012 Rule 5.3
Date: Tue, 25 Jul 2023 11:08:39 +0200
Message-Id: <0b489f53751f8f7e80a7be85eb832f90bcadcbb0.1690272371.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The renaming s/sched_id/scheduler_id/ of the function defined in
'xen/common/sched/core.c' prevents any hiding of that function
by the instances of homonymous function parameters that
are defined in inner scopes.

Similarly, the renames
- s/ops/operations/ for the static variable in 'xen/common/sched/core.c'
- s/do_softirq/needs_softirq/
are introduced for variables, to avoid any conflict with homonymous
parameters or function identifiers.

Moreover, the variable 'loop' defined at 'xen/common/sched/credit2.c:3887'
has been dropped, in favour of the homonymous variable declared in the
outer scope. This in turn requires a modification of the printk call that
involves it.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- s/softirq/needs_softirq/
- Dropped local variable 'it'
- Renamed the 'ops' static variable instead of function parameters
in the idle scheduler for coherence.
---
 xen/common/sched/core.c    | 35 ++++++++++++++++++-----------------
 xen/common/sched/credit2.c |  9 +++++----
 xen/common/sysctl.c        |  2 +-
 xen/include/xen/sched.h    |  2 +-
 4 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 022f548652..ed977ddfd5 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -91,7 +91,7 @@ extern const struct scheduler *__start_schedulers_array[], *__end_schedulers_arr
 #define NUM_SCHEDULERS (__end_schedulers_array - __start_schedulers_array)
 #define schedulers __start_schedulers_array
 
-static struct scheduler __read_mostly ops;
+static struct scheduler __read_mostly operations;
 
 static bool scheduler_active;
 
@@ -99,14 +99,15 @@ static void sched_set_affinity(
     struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft);
 
 static struct sched_resource *cf_check
-sched_idle_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
+sched_idle_res_pick(
+    const struct scheduler *ops, const struct sched_unit *unit)
 {
     return unit->res;
 }
 
 static void *cf_check
-sched_idle_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
-                       void *dd)
+sched_idle_alloc_udata(
+    const struct scheduler *ops, struct sched_unit *unit, void *dd)
 {
     /* Any non-NULL pointer is fine here. */
     return ZERO_BLOCK_PTR;
@@ -171,7 +172,7 @@ static inline struct scheduler *dom_scheduler(const struct domain *d)
      * is the default scheduler that has been, choosen at boot.
      */
     ASSERT(is_idle_domain(d));
-    return &ops;
+    return &operations;
 }
 
 static inline struct scheduler *unit_scheduler(const struct sched_unit *unit)
@@ -2040,10 +2041,10 @@ long do_set_timer_op(s_time_t timeout)
     return 0;
 }
 
-/* sched_id - fetch ID of current scheduler */
-int sched_id(void)
+/* scheduler_id - fetch ID of current scheduler */
+int scheduler_id(void)
 {
-    return ops.sched_id;
+    return operations.sched_id;
 }
 
 /* Adjust scheduling parameter for a given domain. */
@@ -2579,7 +2580,7 @@ static void cf_check sched_slave(void)
     struct sched_unit    *prev = vprev->sched_unit, *next;
     s_time_t              now;
     spinlock_t           *lock;
-    bool                  do_softirq = false;
+    bool                  needs_softirq = false;
     unsigned int          cpu = smp_processor_id();
 
     ASSERT_NOT_IN_ATOMIC();
@@ -2604,7 +2605,7 @@ static void cf_check sched_slave(void)
             return;
         }
 
-        do_softirq = true;
+        needs_softirq = true;
     }
 
     if ( !prev->rendezvous_in_cnt )
@@ -2614,7 +2615,7 @@ static void cf_check sched_slave(void)
         rcu_read_unlock(&sched_res_rculock);
 
         /* Check for failed forced context switch. */
-        if ( do_softirq )
+        if ( needs_softirq )
             raise_softirq(SCHEDULE_SOFTIRQ);
 
         return;
@@ -3016,14 +3017,14 @@ void __init scheduler_init(void)
         BUG_ON(!scheduler);
         printk("Using '%s' (%s)\n", scheduler->name, scheduler->opt_name);
     }
-    ops = *scheduler;
+    operations = *scheduler;
 
     if ( cpu_schedule_up(0) )
         BUG();
     register_cpu_notifier(&cpu_schedule_nfb);
 
-    printk("Using scheduler: %s (%s)\n", ops.name, ops.opt_name);
-    if ( sched_init(&ops) )
+    printk("Using scheduler: %s (%s)\n", operations.name, operations.opt_name);
+    if ( sched_init(&operations) )
         panic("scheduler returned error on init\n");
 
     if ( sched_ratelimit_us &&
@@ -3363,7 +3364,7 @@ int schedule_cpu_rm(unsigned int cpu, struct cpu_rm_data *data)
 
 struct scheduler *scheduler_get_default(void)
 {
-    return &ops;
+    return &operations;
 }
 
 struct scheduler *scheduler_alloc(unsigned int sched_id)
@@ -3392,7 +3393,7 @@ struct scheduler *scheduler_alloc(unsigned int sched_id)
 
 void scheduler_free(struct scheduler *sched)
 {
-    BUG_ON(sched == &ops);
+    BUG_ON(sched == &operations);
     sched_deinit(sched);
     xfree(sched);
 }
@@ -3416,7 +3417,7 @@ void schedule_dump(struct cpupool *c)
     }
     else
     {
-        sched = &ops;
+        sched = &operations;
         cpus = &cpupool_free_cpus;
     }
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 87a1e31ee9..0a76652a66 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3809,7 +3809,8 @@ csched2_dump(const struct scheduler *ops)
     struct list_head *iter_sdom;
     struct csched2_private *prv = csched2_priv(ops);
     unsigned long flags;
-    unsigned int j, loop;
+    unsigned int loop;
+    int j;
     struct csched2_runqueue_data *rqd;
 
     /*
@@ -3874,7 +3875,7 @@ csched2_dump(const struct scheduler *ops)
 
             lock = unit_schedule_lock(unit);
 
-            printk("\t%3d: ", ++loop);
+            printk("\t%3u: ", ++loop);
             csched2_dump_unit(prv, svc);
 
             unit_schedule_unlock(lock, unit);
@@ -3884,7 +3885,7 @@ csched2_dump(const struct scheduler *ops)
     list_for_each_entry ( rqd, &prv->rql, rql )
     {
         struct list_head *iter, *runq = &rqd->runq;
-        int loop = 0;
+        loop = 0;
 
         /* We need the lock to scan the runqueue. */
         spin_lock(&rqd->lock);
@@ -3901,7 +3902,7 @@ csched2_dump(const struct scheduler *ops)
 
             if ( svc )
             {
-                printk("\t%3d: ", loop++);
+                printk("\t%3u: ", loop++);
                 csched2_dump_unit(prv, svc);
             }
         }
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 0cbfe8bd44..7cabfb0230 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -71,7 +71,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         break;
 
     case XEN_SYSCTL_sched_id:
-        op->u.sched_id.sched_id = sched_id();
+        op->u.sched_id.sched_id = scheduler_id();
         break;
 
     case XEN_SYSCTL_getdomaininfolist:
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 854f3e32c0..bfe714d2e2 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -791,7 +791,7 @@ int  sched_init_domain(struct domain *d, unsigned int poolid);
 void sched_destroy_domain(struct domain *d);
 long sched_adjust(struct domain *, struct xen_domctl_scheduler_op *);
 long sched_adjust_global(struct xen_sysctl_scheduler_op *);
-int  sched_id(void);
+int  scheduler_id(void);
 
 /*
  * sched_get_id_by_name - retrieves a scheduler id given a scheduler name
-- 
2.34.1


