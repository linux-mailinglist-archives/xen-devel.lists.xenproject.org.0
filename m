Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF31BE562
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 19:36:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTqdU-0002CB-4Z; Wed, 29 Apr 2020 17:36:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbvF=6N=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jTqdS-0002Bo-Lt
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 17:36:38 +0000
X-Inumbo-ID: fa24707e-8a3f-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa24707e-8a3f-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 17:36:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C7367ACC5;
 Wed, 29 Apr 2020 17:36:35 +0000 (UTC)
Subject: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 29 Apr 2020 19:36:35 +0200
Message-ID: <158818179558.24327.11334680191217289878.stgit@Palanthas>
In-Reply-To: <158818022727.24327.14309662489731832234.stgit@Palanthas>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In Credit2 CPUs (can) share runqueues, depending on the topology. For
instance, with per-socket runqueues (the default) all the CPUs that are
part of the same socket share a runqueue.

On platform with a huge number of CPUs per socket, that could be a
problem. An example is AMD EPYC2 servers, where we can have up to 128
CPUs in a socket.

It is of course possible to define other, still topology-based, runqueue
arrangements (e.g., per-LLC, per-DIE, etc). But that may still result in
runqueues with too many CPUs on other/future platforms.

Therefore, let's set a limit to the max number of CPUs that can share a
Credit2 runqueue. The actual value is configurable (at boot time), the
default being 16. If, for instance,  there are more than 16 CPUs in a
socket, they'll be split among two (or more) runqueues.

Note: with core scheduling enabled, this parameter sets the max number
of *scheduling resources* that can share a runqueue. Therefore, with
granularity set to core (and assumint 2 threads per core), we will have
at most 16 cores per runqueue, which corresponds to 32 threads. But that
is fine, considering how core scheduling works.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/cpupool.c |    2 -
 xen/common/sched/credit2.c |  104 ++++++++++++++++++++++++++++++++++++++++++--
 xen/common/sched/private.h |    2 +
 3 files changed, 103 insertions(+), 5 deletions(-)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index d40345b585..0227457285 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -37,7 +37,7 @@ static cpumask_t cpupool_locked_cpus;
 
 static DEFINE_SPINLOCK(cpupool_lock);
 
-static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
+enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
 static unsigned int __read_mostly sched_granularity = 1;
 
 #ifdef CONFIG_HAS_SCHED_GRANULARITY
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 697c9f917d..abe4d048c8 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -471,6 +471,16 @@ static int __init parse_credit2_runqueue(const char *s)
 }
 custom_param("credit2_runqueue", parse_credit2_runqueue);
 
+/*
+ * How many CPUs will be put, at most, in the same runqueue.
+ * Runqueues are still arranged according to the host topology (and
+ * according to the value of the 'credit2_runqueue' parameter). But
+ * we also have a cap to the number of CPUs that share runqueues.
+ * As soon as we reach the limit, a new runqueue will be created.
+ */
+static unsigned int __read_mostly opt_max_cpus_runqueue = 16;
+integer_param("sched_credit2_max_cpus_runqueue", opt_max_cpus_runqueue);
+
 /*
  * Per-runqueue data
  */
@@ -852,14 +862,61 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
            (opt_runqueue == OPT_RUNQUEUE_NODE && same_node(peer_cpu, cpu));
 }
 
+/* Additional checks, to avoid separating siblings in different runqueues. */
+static bool
+cpu_runqueue_smt_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
+{
+    unsigned int nr_sibl = cpumask_weight(per_cpu(cpu_sibling_mask, cpu));
+    unsigned int rcpu, nr_smts = 0;
+
+    /*
+     * If we put the CPU in this runqueue, we must be sure that there will
+     * be enough room for accepting its hyperthread sibling(s) here as well.
+     */
+    cpumask_clear(cpumask_scratch_cpu(cpu));
+    for_each_cpu ( rcpu, &rqd->active )
+    {
+        ASSERT(rcpu != cpu);
+        if ( !cpumask_test_cpu(rcpu, cpumask_scratch_cpu(cpu)) )
+        {
+            /*
+             * For each CPU already in the runqueue, account for it and for
+             * its sibling(s), independently from whether such sibling(s) are
+             * in the runqueue already or not.
+             *
+             * Of course, if there are sibling CPUs in the runqueue already,
+             * only count them once.
+             */
+            cpumask_or(cpumask_scratch_cpu(cpu), cpumask_scratch_cpu(cpu),
+                       per_cpu(cpu_sibling_mask, rcpu));
+            nr_smts += nr_sibl;
+        }
+    }
+    /*
+     * We know that neither the CPU, nor any of its sibling are here,
+     * or we wouldn't even have entered the function.
+     */
+    ASSERT(!cpumask_intersects(cpumask_scratch_cpu(cpu),
+                               per_cpu(cpu_sibling_mask, cpu)));
+
+    /* Try adding CPU and its sibling(s) to the count and check... */
+    nr_smts += nr_sibl;
+
+    if ( nr_smts <= opt_max_cpus_runqueue )
+        return true;
+
+    return false;
+}
+
 static struct csched2_runqueue_data *
 cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
 {
     struct csched2_runqueue_data *rqd, *rqd_new;
+    struct csched2_runqueue_data *rqd_valid = NULL;
     struct list_head *rqd_ins;
     unsigned long flags;
     int rqi = 0;
-    bool rqi_unused = false, rqd_valid = false;
+    bool rqi_unused = false;
 
     /* Prealloc in case we need it - not allowed with interrupts off. */
     rqd_new = xzalloc(struct csched2_runqueue_data);
@@ -873,11 +930,44 @@ cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
         if ( !rqi_unused && rqd->id > rqi )
             rqi_unused = true;
 
-        if ( cpu_runqueue_match(rqd, cpu) )
+        /*
+         * Check whether the CPU should (according to the topology) and also
+         * can (if we there aren't too many already) go in this runqueue.
+         */
+        if ( rqd->refcnt < opt_max_cpus_runqueue &&
+             cpu_runqueue_match(rqd, cpu) )
         {
-            rqd_valid = true;
-            break;
+            cpumask_t *siblings = per_cpu(cpu_sibling_mask, cpu);
+
+            dprintk(XENLOG_DEBUG, "CPU %d matches runq %d, cpus={%*pbl} (max %d)\n",
+                    cpu, rqd->id, CPUMASK_PR(&rqd->active),
+                    opt_max_cpus_runqueue);
+
+            /*
+             * If we're using core (or socket!) scheduling, or we don't have
+             * hyperthreading, no need to do any further checking.
+             *
+             * If no (to both), but our sibling is already in this runqueue,
+             * then it's also ok for the CPU to stay in this runqueue..
+             *
+             * Otherwise, do some more checks, to better account for SMT.
+             */
+            if ( opt_sched_granularity != SCHED_GRAN_cpu ||
+                 cpumask_weight(siblings) <= 1 ||
+                 cpumask_intersects(&rqd->active, siblings) )
+            {
+                dprintk(XENLOG_DEBUG, "runq %d selected\n", rqd->id);
+                rqd_valid = rqd;
+                break;
+            }
+            else if ( cpu_runqueue_smt_match(rqd, cpu) )
+            {
+                dprintk(XENLOG_DEBUG, "considering runq %d...\n", rqd->id);
+                rqd_valid = rqd;
+            }
         }
+	else
+            dprintk(XENLOG_DEBUG, "ignoring runq %d\n", rqd->id);
 
         if ( !rqi_unused )
         {
@@ -900,6 +990,12 @@ cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
         rqd->pick_bias = cpu;
         rqd->id = rqi;
     }
+    else
+        rqd = rqd_valid;
+
+    printk(XENLOG_INFO "CPU %d (sibling={%*pbl}) will go to runqueue %d with {%*pbl}\n",
+           cpu, CPUMASK_PR(per_cpu(cpu_sibling_mask, cpu)), rqd->id,
+           CPUMASK_PR(&rqd->active));
 
     rqd->refcnt++;
 
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 367811a12f..e964e3f407 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -30,6 +30,8 @@ enum sched_gran {
     SCHED_GRAN_socket
 };
 
+extern enum sched_gran opt_sched_granularity;
+
 /*
  * In order to allow a scheduler to remap the lock->cpu mapping,
  * we have a per-cpu pointer, along with a pre-allocated set of


