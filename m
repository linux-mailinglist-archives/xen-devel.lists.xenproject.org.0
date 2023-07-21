Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F175CBCB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 17:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567624.886911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMs6h-0005GX-M9; Fri, 21 Jul 2023 15:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567624.886911; Fri, 21 Jul 2023 15:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMs6h-0005Dc-JF; Fri, 21 Jul 2023 15:31:51 +0000
Received: by outflank-mailman (input) for mailman id 567624;
 Fri, 21 Jul 2023 15:31:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIrH=DH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qMs6f-0005DW-Tc
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 15:31:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b552cbbb-27db-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 17:31:49 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.162.18.33])
 by support.bugseng.com (Postfix) with ESMTPSA id C77BA4EE0C89;
 Fri, 21 Jul 2023 17:31:46 +0200 (CEST)
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
X-Inumbo-ID: b552cbbb-27db-11ee-b23a-6b7b168915f2
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
Subject: [XEN PATCH] xen/sched: mechanical renaming to address MISRA C:2012 Rule 5.3
Date: Fri, 21 Jul 2023 17:31:36 +0200
Message-Id: <9945fd23b0bb88f3e0c6054a7f992cfa642d3f9f.1689953420.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The renaming s/sched_id/scheduler_id of the function defined in
'xen/common/sched/core.c' prevents any hiding of that function
by the many instances of omonymous function parameters.

Similarly, the renames
- s/ops/operations
- s/do_softirq/exec_softirq
- s/loop/it
are introduced for parameter names, to avoid any conflict
with the homonymous variable or function defined in an enclosing
scope.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/sched/core.c    | 18 +++++++++---------
 xen/common/sched/credit2.c |  4 ++--
 xen/common/sysctl.c        |  2 +-
 xen/include/xen/sched.h    |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 022f548652..e74b1208bd 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -99,13 +99,13 @@ static void sched_set_affinity(
     struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft);
 
 static struct sched_resource *cf_check
-sched_idle_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
+sched_idle_res_pick(const struct scheduler *operations, const struct sched_unit *unit)
 {
     return unit->res;
 }
 
 static void *cf_check
-sched_idle_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
+sched_idle_alloc_udata(const struct scheduler *operations, struct sched_unit *unit,
                        void *dd)
 {
     /* Any non-NULL pointer is fine here. */
@@ -113,12 +113,12 @@ sched_idle_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
 }
 
 static void cf_check
-sched_idle_free_udata(const struct scheduler *ops, void *priv)
+sched_idle_free_udata(const struct scheduler *operations, void *priv)
 {
 }
 
 static void cf_check sched_idle_schedule(
-    const struct scheduler *ops, struct sched_unit *unit, s_time_t now,
+    const struct scheduler *operations, struct sched_unit *unit, s_time_t now,
     bool tasklet_work_scheduled)
 {
     const unsigned int cpu = smp_processor_id();
@@ -2040,8 +2040,8 @@ long do_set_timer_op(s_time_t timeout)
     return 0;
 }
 
-/* sched_id - fetch ID of current scheduler */
-int sched_id(void)
+/* scheduler_id - fetch ID of current scheduler */
+int scheduler_id(void)
 {
     return ops.sched_id;
 }
@@ -2579,7 +2579,7 @@ static void cf_check sched_slave(void)
     struct sched_unit    *prev = vprev->sched_unit, *next;
     s_time_t              now;
     spinlock_t           *lock;
-    bool                  do_softirq = false;
+    bool                  exec_softirq = false;
     unsigned int          cpu = smp_processor_id();
 
     ASSERT_NOT_IN_ATOMIC();
@@ -2604,7 +2604,7 @@ static void cf_check sched_slave(void)
             return;
         }
 
-        do_softirq = true;
+        exec_softirq = true;
     }
 
     if ( !prev->rendezvous_in_cnt )
@@ -2614,7 +2614,7 @@ static void cf_check sched_slave(void)
         rcu_read_unlock(&sched_res_rculock);
 
         /* Check for failed forced context switch. */
-        if ( do_softirq )
+        if ( exec_softirq )
             raise_softirq(SCHEDULE_SOFTIRQ);
 
         return;
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 87a1e31ee9..aba51a7963 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3884,7 +3884,7 @@ csched2_dump(const struct scheduler *ops)
     list_for_each_entry ( rqd, &prv->rql, rql )
     {
         struct list_head *iter, *runq = &rqd->runq;
-        int loop = 0;
+        int it = 0;
 
         /* We need the lock to scan the runqueue. */
         spin_lock(&rqd->lock);
@@ -3901,7 +3901,7 @@ csched2_dump(const struct scheduler *ops)
 
             if ( svc )
             {
-                printk("\t%3d: ", loop++);
+                printk("\t%3d: ", it++);
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


