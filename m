Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A815957BB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 12:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388168.624790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNtZc-0004wM-P7; Tue, 16 Aug 2022 10:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388168.624790; Tue, 16 Aug 2022 10:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNtZc-0004s4-Ld; Tue, 16 Aug 2022 10:13:24 +0000
Received: by outflank-mailman (input) for mailman id 388168;
 Tue, 16 Aug 2022 10:13:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NQK8=YU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNtZa-00049L-UP
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 10:13:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dcc39bf-1d4c-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 12:13:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 60E1135226;
 Tue, 16 Aug 2022 10:13:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27ADA13B16;
 Tue, 16 Aug 2022 10:13:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MLZXCMBt+2IgEAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 16 Aug 2022 10:13:20 +0000
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
X-Inumbo-ID: 0dcc39bf-1d4c-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660644800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7aMac0xJGFVHnrQYBiYsDG0gFd0QHb+rgXXGs3E20s=;
	b=nyy+F09wPWxDRplIGpzr0LE1l+i0vabzVbegspekfH+LbI3s9HDguE8OmsQ5bcn6lgPmab
	i2yk1yhh1qxpoLS5WTeFQiAIRL24qpE5Xq7TdV9zbOkhbjw/E84+dcY5VXnbVplN1ijTlU
	T7G9OGqQZWq5P6mZRS5EtFyFoo+DGMg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Gao Ruifeng <ruifeng.gao@intel.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 3/3] xen/sched: fix cpu hotplug
Date: Tue, 16 Aug 2022 12:13:17 +0200
Message-Id: <20220816101317.23014-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220816101317.23014-1-jgross@suse.com>
References: <20220816101317.23014-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cpu cpu unplugging is calling schedule_cpu_rm() via stop_machine_run()
with interrupts disabled, thus any memory allocation or freeing must
be avoided.

Since commit 5047cd1d5dea ("xen/common: Use enhanced
ASSERT_ALLOC_CONTEXT in xmalloc()") this restriction is being enforced
via an assertion, which will now fail.

Before that commit cpu unplugging in normal configurations was working
just by chance as only the cpu performing schedule_cpu_rm() was doing
active work. With core scheduling enabled, however, failures could
result from memory allocations not being properly propagated to other
cpus' TLBs.

Fix this mess by allocating needed memory before entering
stop_machine_run() and freeing any memory only after having finished
stop_machine_run().

Fixes: 1ec410112cdd ("xen/sched: support differing granularity in schedule_cpu_[add/rm]()")
Reported-by: Gao Ruifeng <ruifeng.gao@intel.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- move affinity mask allocation into schedule_cpu_rm_alloc() (Jan Beulich)
---
 xen/common/sched/core.c    | 27 +++++++++++----
 xen/common/sched/cpupool.c | 68 +++++++++++++++++++++++++++++---------
 xen/common/sched/private.h |  5 ++-
 3 files changed, 78 insertions(+), 22 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 228470ac41..ffb2d6202b 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3247,7 +3247,7 @@ out:
  * by schedule_cpu_rm_alloc() is modified only in case the cpu in question is
  * being moved from or to a cpupool.
  */
-static struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
+struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu, bool aff_alloc)
 {
     struct cpu_rm_data *data;
     const struct sched_resource *sr;
@@ -3260,6 +3260,17 @@ static struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
     if ( !data )
         goto out;
 
+    if ( aff_alloc )
+    {
+        if ( !update_node_aff_alloc(&data->affinity) )
+        {
+            XFREE(data);
+            goto out;
+        }
+    }
+    else
+        memset(&data->affinity, 0, sizeof(data->affinity));
+
     data->old_ops = sr->scheduler;
     data->vpriv_old = idle_vcpu[cpu]->sched_unit->priv;
     data->ppriv_old = sr->sched_priv;
@@ -3280,6 +3291,7 @@ static struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
         {
             while ( idx > 0 )
                 sched_res_free(&data->sr[--idx]->rcu);
+            update_node_aff_free(&data->affinity);
             XFREE(data);
             goto out;
         }
@@ -3298,10 +3310,11 @@ static struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
     return data;
 }
 
-static void schedule_cpu_rm_free(struct cpu_rm_data *mem, unsigned int cpu)
+void schedule_cpu_rm_free(struct cpu_rm_data *mem, unsigned int cpu)
 {
     sched_free_udata(mem->old_ops, mem->vpriv_old);
     sched_free_pdata(mem->old_ops, mem->ppriv_old, cpu);
+    update_node_aff_free(&mem->affinity);
 
     xfree(mem);
 }
@@ -3312,17 +3325,18 @@ static void schedule_cpu_rm_free(struct cpu_rm_data *mem, unsigned int cpu)
  * The cpu is already marked as "free" and not valid any longer for its
  * cpupool.
  */
-int schedule_cpu_rm(unsigned int cpu)
+int schedule_cpu_rm(unsigned int cpu, struct cpu_rm_data *data)
 {
     struct sched_resource *sr;
-    struct cpu_rm_data *data;
     struct sched_unit *unit;
     spinlock_t *old_lock;
     unsigned long flags;
     int idx = 0;
     unsigned int cpu_iter;
+    bool freemem = !data;
 
-    data = schedule_cpu_rm_alloc(cpu);
+    if ( !data )
+        data = schedule_cpu_rm_alloc(cpu, false);
     if ( !data )
         return -ENOMEM;
 
@@ -3390,7 +3404,8 @@ int schedule_cpu_rm(unsigned int cpu)
     sched_deinit_pdata(data->old_ops, data->ppriv_old, cpu);
 
     rcu_read_unlock(&sched_res_rculock);
-    schedule_cpu_rm_free(data, cpu);
+    if ( freemem )
+        schedule_cpu_rm_free(data, cpu);
 
     return 0;
 }
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 58e082eb4c..2506861e4f 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -411,22 +411,28 @@ int cpupool_move_domain(struct domain *d, struct cpupool *c)
 }
 
 /* Update affinities of all domains in a cpupool. */
-static void cpupool_update_node_affinity(const struct cpupool *c)
+static void cpupool_update_node_affinity(const struct cpupool *c,
+                                         struct affinity_masks *masks)
 {
-    struct affinity_masks masks;
+    struct affinity_masks local_masks;
     struct domain *d;
 
-    if ( !update_node_aff_alloc(&masks) )
-        return;
+    if ( !masks )
+    {
+        if ( !update_node_aff_alloc(&local_masks) )
+            return;
+        masks = &local_masks;
+    }
 
     rcu_read_lock(&domlist_read_lock);
 
     for_each_domain_in_cpupool(d, c)
-        domain_update_node_aff(d, &masks);
+        domain_update_node_aff(d, masks);
 
     rcu_read_unlock(&domlist_read_lock);
 
-    update_node_aff_free(&masks);
+    if ( masks == &local_masks )
+        update_node_aff_free(masks);
 }
 
 /*
@@ -460,15 +466,17 @@ static int cpupool_assign_cpu_locked(struct cpupool *c, unsigned int cpu)
 
     rcu_read_unlock(&sched_res_rculock);
 
-    cpupool_update_node_affinity(c);
+    cpupool_update_node_affinity(c, NULL);
 
     return 0;
 }
 
-static int cpupool_unassign_cpu_finish(struct cpupool *c)
+static int cpupool_unassign_cpu_finish(struct cpupool *c,
+                                       struct cpu_rm_data *mem)
 {
     int cpu = cpupool_moving_cpu;
     const cpumask_t *cpus;
+    struct affinity_masks *masks = mem ? &mem->affinity : NULL;
     int ret;
 
     if ( c != cpupool_cpu_moving )
@@ -491,7 +499,7 @@ static int cpupool_unassign_cpu_finish(struct cpupool *c)
      */
     if ( !ret )
     {
-        ret = schedule_cpu_rm(cpu);
+        ret = schedule_cpu_rm(cpu, mem);
         if ( ret )
             cpumask_andnot(&cpupool_free_cpus, &cpupool_free_cpus, cpus);
         else
@@ -503,7 +511,7 @@ static int cpupool_unassign_cpu_finish(struct cpupool *c)
     }
     rcu_read_unlock(&sched_res_rculock);
 
-    cpupool_update_node_affinity(c);
+    cpupool_update_node_affinity(c, masks);
 
     return ret;
 }
@@ -567,7 +575,7 @@ static long cf_check cpupool_unassign_cpu_helper(void *info)
                       cpupool_cpu_moving->cpupool_id, cpupool_moving_cpu);
     spin_lock(&cpupool_lock);
 
-    ret = cpupool_unassign_cpu_finish(c);
+    ret = cpupool_unassign_cpu_finish(c, NULL);
 
     spin_unlock(&cpupool_lock);
     debugtrace_printk("cpupool_unassign_cpu ret=%ld\n", ret);
@@ -714,7 +722,7 @@ static int cpupool_cpu_add(unsigned int cpu)
  * This function is called in stop_machine context, so we can be sure no
  * non-idle vcpu is active on the system.
  */
-static void cpupool_cpu_remove(unsigned int cpu)
+static void cpupool_cpu_remove(unsigned int cpu, struct cpu_rm_data *mem)
 {
     int ret;
 
@@ -722,7 +730,7 @@ static void cpupool_cpu_remove(unsigned int cpu)
 
     if ( !cpumask_test_cpu(cpu, &cpupool_free_cpus) )
     {
-        ret = cpupool_unassign_cpu_finish(cpupool0);
+        ret = cpupool_unassign_cpu_finish(cpupool0, mem);
         BUG_ON(ret);
     }
     cpumask_clear_cpu(cpu, &cpupool_free_cpus);
@@ -788,7 +796,7 @@ static void cpupool_cpu_remove_forced(unsigned int cpu)
         {
             ret = cpupool_unassign_cpu_start(c, master_cpu);
             BUG_ON(ret);
-            ret = cpupool_unassign_cpu_finish(c);
+            ret = cpupool_unassign_cpu_finish(c, NULL);
             BUG_ON(ret);
         }
     }
@@ -1008,10 +1016,21 @@ static int cf_check cpu_callback(
 {
     unsigned int cpu = (unsigned long)hcpu;
     int rc = 0;
+    static struct cpu_rm_data *mem;
 
     switch ( action )
     {
     case CPU_DOWN_FAILED:
+        if ( system_state <= SYS_STATE_active )
+        {
+            if ( mem )
+            {
+                schedule_cpu_rm_free(mem, cpu);
+                mem = NULL;
+            }
+            rc = cpupool_cpu_add(cpu);
+        }
+        break;
     case CPU_ONLINE:
         if ( system_state <= SYS_STATE_active )
             rc = cpupool_cpu_add(cpu);
@@ -1019,12 +1038,31 @@ static int cf_check cpu_callback(
     case CPU_DOWN_PREPARE:
         /* Suspend/Resume don't change assignments of cpus to cpupools. */
         if ( system_state <= SYS_STATE_active )
+        {
             rc = cpupool_cpu_remove_prologue(cpu);
+            if ( !rc )
+            {
+                ASSERT(!mem);
+                mem = schedule_cpu_rm_alloc(cpu, true);
+                rc = mem ? 0 : -ENOMEM;
+            }
+        }
         break;
     case CPU_DYING:
         /* Suspend/Resume don't change assignments of cpus to cpupools. */
         if ( system_state <= SYS_STATE_active )
-            cpupool_cpu_remove(cpu);
+        {
+            ASSERT(mem);
+            cpupool_cpu_remove(cpu, mem);
+        }
+        break;
+    case CPU_DEAD:
+        if ( system_state <= SYS_STATE_active )
+        {
+            ASSERT(mem);
+            schedule_cpu_rm_free(mem, cpu);
+            mem = NULL;
+        }
         break;
     case CPU_RESUME_FAILED:
         cpupool_cpu_remove_forced(cpu);
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 601d639699..cc7a6cb571 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -603,6 +603,7 @@ void update_node_aff_free(struct affinity_masks *affinity);
 
 /* Memory allocation related data for schedule_cpu_rm(). */
 struct cpu_rm_data {
+    struct affinity_masks affinity;
     const struct scheduler *old_ops;
     void *ppriv_old;
     void *vpriv_old;
@@ -617,7 +618,9 @@ struct scheduler *scheduler_alloc(unsigned int sched_id);
 void scheduler_free(struct scheduler *sched);
 int cpu_disable_scheduler(unsigned int cpu);
 int schedule_cpu_add(unsigned int cpu, struct cpupool *c);
-int schedule_cpu_rm(unsigned int cpu);
+struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu, bool aff_alloc);
+void schedule_cpu_rm_free(struct cpu_rm_data *mem, unsigned int cpu);
+int schedule_cpu_rm(unsigned int cpu, struct cpu_rm_data *mem);
 int sched_move_domain(struct domain *d, struct cpupool *c);
 struct cpupool *cpupool_get_by_id(unsigned int poolid);
 void cpupool_put(struct cpupool *pool);
-- 
2.35.3


