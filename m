Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE28587D39
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 15:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379327.612686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIs4O-0004eS-LN; Tue, 02 Aug 2022 13:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379327.612686; Tue, 02 Aug 2022 13:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIs4O-0004b1-I2; Tue, 02 Aug 2022 13:36:24 +0000
Received: by outflank-mailman (input) for mailman id 379327;
 Tue, 02 Aug 2022 13:36:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NPAu=YG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oIs4N-0004av-5c
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 13:36:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 189c781a-1268-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 15:36:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7773F1FD3A;
 Tue,  2 Aug 2022 13:36:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 396951345B;
 Tue,  2 Aug 2022 13:36:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nlWmDFUo6WLkXQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 02 Aug 2022 13:36:21 +0000
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
X-Inumbo-ID: 189c781a-1268-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659447381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxhfYvFG5L28ncEPs8ILtxibkaHQd3HYF/JgY5i75BY=;
	b=b3IxQFs7pm5TJYFxJon3cr8h1MiPCDNz75Eqm/ylqOqTDkoYGrOMu7gXGhFli6f7j/tZm7
	HOB7hxhqSrYoTpeVqS5jNkFiIUVLZCwDRvYfDYf2ECt+Q3vTIxyciMxLP7W3oZA11GWvaP
	0DSm1fquKkW7WbaDmD+qxs3QLWYSeno=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Gao Ruifeng <ruifeng.gao@intel.com>
Subject: [PATCH 3/3] xen/sched: fix cpu hotplug
Date: Tue,  2 Aug 2022 15:36:19 +0200
Message-Id: <20220802133619.22965-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220802132747.22507-1-jgross@suse.com>
References: <20220802132747.22507-1-jgross@suse.com>
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
---
 xen/common/sched/core.c    | 14 ++++---
 xen/common/sched/cpupool.c | 77 +++++++++++++++++++++++++++++---------
 xen/common/sched/private.h |  5 ++-
 3 files changed, 72 insertions(+), 24 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d6ff4f4921..1473cef372 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3190,7 +3190,7 @@ out:
     return ret;
 }
 
-static struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
+struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
 {
     struct cpu_rm_data *data;
     struct sched_resource *sr;
@@ -3242,7 +3242,7 @@ static struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
     return data;
 }
 
-static void schedule_cpu_rm_free(struct cpu_rm_data *mem, unsigned int cpu)
+void schedule_cpu_rm_free(struct cpu_rm_data *mem, unsigned int cpu)
 {
     sched_free_udata(mem->old_ops, mem->vpriv_old);
     sched_free_pdata(mem->old_ops, mem->ppriv_old, cpu);
@@ -3256,17 +3256,18 @@ static void schedule_cpu_rm_free(struct cpu_rm_data *mem, unsigned int cpu)
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
+        data = schedule_cpu_rm_alloc(cpu);
     if ( !data )
         return -ENOMEM;
 
@@ -3333,7 +3334,8 @@ int schedule_cpu_rm(unsigned int cpu)
     sched_deinit_pdata(data->old_ops, data->ppriv_old, cpu);
 
     rcu_read_unlock(&sched_res_rculock);
-    schedule_cpu_rm_free(data, cpu);
+    if ( freemem )
+        schedule_cpu_rm_free(data, cpu);
 
     return 0;
 }
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 1463dcd767..d9dadedea3 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -419,6 +419,8 @@ static int cpupool_alloc_affin_masks(struct affinity_masks *masks)
         return 0;
 
     free_cpumask_var(masks->hard);
+    memset(masks, 0, sizeof(*masks));
+
     return -ENOMEM;
 }
 
@@ -428,28 +430,34 @@ static void cpupool_free_affin_masks(struct affinity_masks *masks)
     free_cpumask_var(masks->hard);
 }
 
-static void cpupool_update_node_affinity(const struct cpupool *c)
+static void cpupool_update_node_affinity(const struct cpupool *c,
+                                         struct affinity_masks *masks)
 {
     const cpumask_t *online = c->res_valid;
-    struct affinity_masks masks;
+    struct affinity_masks local_masks;
     struct domain *d;
 
-    if ( cpupool_alloc_affin_masks(&masks) )
-        return;
+    if ( !masks )
+    {
+        if ( cpupool_alloc_affin_masks(&local_masks) )
+            return;
+        masks = &local_masks;
+    }
 
     rcu_read_lock(&domlist_read_lock);
     for_each_domain_in_cpupool(d, c)
     {
         if ( d->vcpu && d->vcpu[0] )
         {
-            cpumask_clear(masks.hard);
-            cpumask_clear(masks.soft);
-            domain_update_node_affinity_noalloc(d, online, &masks);
+            cpumask_clear(masks->hard);
+            cpumask_clear(masks->soft);
+            domain_update_node_affinity_noalloc(d, online, masks);
         }
     }
     rcu_read_unlock(&domlist_read_lock);
 
-    cpupool_free_affin_masks(&masks);
+    if ( masks == &local_masks )
+        cpupool_free_affin_masks(&local_masks);
 }
 
 /*
@@ -483,15 +491,17 @@ static int cpupool_assign_cpu_locked(struct cpupool *c, unsigned int cpu)
 
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
@@ -514,7 +524,7 @@ static int cpupool_unassign_cpu_finish(struct cpupool *c)
      */
     if ( !ret )
     {
-        ret = schedule_cpu_rm(cpu);
+        ret = schedule_cpu_rm(cpu, mem);
         if ( ret )
             cpumask_andnot(&cpupool_free_cpus, &cpupool_free_cpus, cpus);
         else
@@ -526,7 +536,7 @@ static int cpupool_unassign_cpu_finish(struct cpupool *c)
     }
     rcu_read_unlock(&sched_res_rculock);
 
-    cpupool_update_node_affinity(c);
+    cpupool_update_node_affinity(c, masks);
 
     return ret;
 }
@@ -590,7 +600,7 @@ static long cf_check cpupool_unassign_cpu_helper(void *info)
                       cpupool_cpu_moving->cpupool_id, cpupool_moving_cpu);
     spin_lock(&cpupool_lock);
 
-    ret = cpupool_unassign_cpu_finish(c);
+    ret = cpupool_unassign_cpu_finish(c, NULL);
 
     spin_unlock(&cpupool_lock);
     debugtrace_printk("cpupool_unassign_cpu ret=%ld\n", ret);
@@ -737,7 +747,7 @@ static int cpupool_cpu_add(unsigned int cpu)
  * This function is called in stop_machine context, so we can be sure no
  * non-idle vcpu is active on the system.
  */
-static void cpupool_cpu_remove(unsigned int cpu)
+static void cpupool_cpu_remove(unsigned int cpu, struct cpu_rm_data *mem)
 {
     int ret;
 
@@ -745,7 +755,7 @@ static void cpupool_cpu_remove(unsigned int cpu)
 
     if ( !cpumask_test_cpu(cpu, &cpupool_free_cpus) )
     {
-        ret = cpupool_unassign_cpu_finish(cpupool0);
+        ret = cpupool_unassign_cpu_finish(cpupool0, mem);
         BUG_ON(ret);
     }
     cpumask_clear_cpu(cpu, &cpupool_free_cpus);
@@ -811,7 +821,7 @@ static void cpupool_cpu_remove_forced(unsigned int cpu)
         {
             ret = cpupool_unassign_cpu_start(c, master_cpu);
             BUG_ON(ret);
-            ret = cpupool_unassign_cpu_finish(c);
+            ret = cpupool_unassign_cpu_finish(c, NULL);
             BUG_ON(ret);
         }
     }
@@ -1031,10 +1041,23 @@ static int cf_check cpu_callback(
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
+                if ( memchr_inv(&mem->affinity, 0, sizeof(mem->affinity)) )
+                    cpupool_free_affin_masks(&mem->affinity);
+                schedule_cpu_rm_free(mem, cpu);
+                mem = NULL;
+            }
+            rc = cpupool_cpu_add(cpu);
+        }
+        break;
     case CPU_ONLINE:
         if ( system_state <= SYS_STATE_active )
             rc = cpupool_cpu_add(cpu);
@@ -1042,12 +1065,32 @@ static int cf_check cpu_callback(
     case CPU_DOWN_PREPARE:
         /* Suspend/Resume don't change assignments of cpus to cpupools. */
         if ( system_state <= SYS_STATE_active )
+        {
             rc = cpupool_cpu_remove_prologue(cpu);
+            if ( !rc )
+            {
+                ASSERT(!mem);
+                mem = schedule_cpu_rm_alloc(cpu);
+                rc = mem ? cpupool_alloc_affin_masks(&mem->affinity) : -ENOMEM;
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
+            cpupool_free_affin_masks(&mem->affinity);
+            schedule_cpu_rm_free(mem, cpu);
+            mem = NULL;
+        }
         break;
     case CPU_RESUME_FAILED:
         cpupool_cpu_remove_forced(cpu);
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index c626ad4907..f5bf41226c 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -600,6 +600,7 @@ struct affinity_masks {
 
 /* Memory allocation related data for schedule_cpu_rm(). */
 struct cpu_rm_data {
+    struct affinity_masks affinity;
     struct scheduler *old_ops;
     void *ppriv_old;
     void *vpriv_old;
@@ -617,7 +618,9 @@ struct scheduler *scheduler_alloc(unsigned int sched_id);
 void scheduler_free(struct scheduler *sched);
 int cpu_disable_scheduler(unsigned int cpu);
 int schedule_cpu_add(unsigned int cpu, struct cpupool *c);
-int schedule_cpu_rm(unsigned int cpu);
+struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu);
+void schedule_cpu_rm_free(struct cpu_rm_data *mem, unsigned int cpu);
+int schedule_cpu_rm(unsigned int cpu, struct cpu_rm_data *mem);
 int sched_move_domain(struct domain *d, struct cpupool *c);
 struct cpupool *cpupool_get_by_id(unsigned int poolid);
 void cpupool_put(struct cpupool *pool);
-- 
2.35.3


