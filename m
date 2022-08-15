Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B27592DD4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387258.623450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNXtL-0002IG-QK; Mon, 15 Aug 2022 11:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387258.623450; Mon, 15 Aug 2022 11:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNXtL-0002FB-N6; Mon, 15 Aug 2022 11:04:19 +0000
Received: by outflank-mailman (input) for mailman id 387258;
 Mon, 15 Aug 2022 11:04:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dGwN=YT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNXtK-0001af-6J
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:04:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff2758f8-1c89-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 13:04:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6676F20781;
 Mon, 15 Aug 2022 11:04:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A11813A93;
 Mon, 15 Aug 2022 11:04:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WFy8DC0o+mLHBgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 15 Aug 2022 11:04:13 +0000
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
X-Inumbo-ID: ff2758f8-1c89-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660561453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cPpZ0KnROqbgy44j3t9FMKxKlKGwxhvHykExU9F22/A=;
	b=p4EDn98+z9gItWm5S+kJQSA0laXVnu7hAZ+hAXW0QdImMNChYyGIFKhEHFjoZnCaq0bVgR
	OkmAJJzbS2tqSkaWl/D7/C5WDRd6u9ueo3UL8bzzseH6vzH+uipTzSl9vgNS7DJDPyJ+ym
	qTTfgs+PzLHHP/cWR4nOtpCk/blvIqw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing from schedule_cpu_rm()
Date: Mon, 15 Aug 2022 13:04:09 +0200
Message-Id: <20220815110410.19872-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220815110410.19872-1-jgross@suse.com>
References: <20220815110410.19872-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to prepare not allocating or freeing memory from
schedule_cpu_rm(), move this functionality to dedicated functions.

For now call those functions from schedule_cpu_rm().

No change of behavior expected.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add const (Jan Beulich)
- use "unsigned int" for loop index (Jan Beulich)
- use xmalloc_flex_struct() (Jan Beulich)
- use XFREE() (Jan Beulich)
- hold rcu lock longer (Jan Beulich)
- add ASSERT() (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c    | 133 +++++++++++++++++++++----------------
 xen/common/sched/private.h |   9 +++
 2 files changed, 86 insertions(+), 56 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 085a9dd335..d0b6513b6f 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3237,6 +3237,65 @@ out:
     return ret;
 }
 
+static struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
+{
+    struct cpu_rm_data *data;
+    const struct sched_resource *sr;
+    unsigned int idx;
+
+    rcu_read_lock(&sched_res_rculock);
+
+    sr = get_sched_res(cpu);
+    data = xmalloc_flex_struct(struct cpu_rm_data, sr, sr->granularity - 1);
+    if ( !data )
+        goto out;
+
+    data->old_ops = sr->scheduler;
+    data->vpriv_old = idle_vcpu[cpu]->sched_unit->priv;
+    data->ppriv_old = sr->sched_priv;
+
+    for ( idx = 0; idx < sr->granularity - 1; idx++ )
+    {
+        data->sr[idx] = sched_alloc_res();
+        if ( data->sr[idx] )
+        {
+            data->sr[idx]->sched_unit_idle = sched_alloc_unit_mem();
+            if ( !data->sr[idx]->sched_unit_idle )
+            {
+                sched_res_free(&data->sr[idx]->rcu);
+                data->sr[idx] = NULL;
+            }
+        }
+        if ( !data->sr[idx] )
+        {
+            while ( idx > 0 )
+                sched_res_free(&data->sr[--idx]->rcu);
+            XFREE(data);
+            goto out;
+        }
+
+        data->sr[idx]->curr = data->sr[idx]->sched_unit_idle;
+        data->sr[idx]->scheduler = &sched_idle_ops;
+        data->sr[idx]->granularity = 1;
+
+        /* We want the lock not to change when replacing the resource. */
+        data->sr[idx]->schedule_lock = sr->schedule_lock;
+    }
+
+ out:
+    rcu_read_unlock(&sched_res_rculock);
+
+    return data;
+}
+
+static void schedule_cpu_rm_free(struct cpu_rm_data *mem, unsigned int cpu)
+{
+    sched_free_udata(mem->old_ops, mem->vpriv_old);
+    sched_free_pdata(mem->old_ops, mem->ppriv_old, cpu);
+
+    xfree(mem);
+}
+
 /*
  * Remove a pCPU from its cpupool. Its scheduler becomes &sched_idle_ops
  * (the idle scheduler).
@@ -3245,53 +3304,23 @@ out:
  */
 int schedule_cpu_rm(unsigned int cpu)
 {
-    void *ppriv_old, *vpriv_old;
-    struct sched_resource *sr, **sr_new = NULL;
+    struct sched_resource *sr;
+    struct cpu_rm_data *data;
     struct sched_unit *unit;
-    struct scheduler *old_ops;
     spinlock_t *old_lock;
     unsigned long flags;
-    int idx, ret = -ENOMEM;
+    int idx = 0;
     unsigned int cpu_iter;
 
+    data = schedule_cpu_rm_alloc(cpu);
+    if ( !data )
+        return -ENOMEM;
+
     rcu_read_lock(&sched_res_rculock);
 
     sr = get_sched_res(cpu);
-    old_ops = sr->scheduler;
 
-    if ( sr->granularity > 1 )
-    {
-        sr_new = xmalloc_array(struct sched_resource *, sr->granularity - 1);
-        if ( !sr_new )
-            goto out;
-        for ( idx = 0; idx < sr->granularity - 1; idx++ )
-        {
-            sr_new[idx] = sched_alloc_res();
-            if ( sr_new[idx] )
-            {
-                sr_new[idx]->sched_unit_idle = sched_alloc_unit_mem();
-                if ( !sr_new[idx]->sched_unit_idle )
-                {
-                    sched_res_free(&sr_new[idx]->rcu);
-                    sr_new[idx] = NULL;
-                }
-            }
-            if ( !sr_new[idx] )
-            {
-                for ( idx--; idx >= 0; idx-- )
-                    sched_res_free(&sr_new[idx]->rcu);
-                goto out;
-            }
-            sr_new[idx]->curr = sr_new[idx]->sched_unit_idle;
-            sr_new[idx]->scheduler = &sched_idle_ops;
-            sr_new[idx]->granularity = 1;
-
-            /* We want the lock not to change when replacing the resource. */
-            sr_new[idx]->schedule_lock = sr->schedule_lock;
-        }
-    }
-
-    ret = 0;
+    ASSERT(sr->granularity);
     ASSERT(sr->cpupool != NULL);
     ASSERT(cpumask_test_cpu(cpu, &cpupool_free_cpus));
     ASSERT(!cpumask_test_cpu(cpu, sr->cpupool->cpu_valid));
@@ -3299,10 +3328,6 @@ int schedule_cpu_rm(unsigned int cpu)
     /* See comment in schedule_cpu_add() regarding lock switching. */
     old_lock = pcpu_schedule_lock_irqsave(cpu, &flags);
 
-    vpriv_old = idle_vcpu[cpu]->sched_unit->priv;
-    ppriv_old = sr->sched_priv;
-
-    idx = 0;
     for_each_cpu ( cpu_iter, sr->cpus )
     {
         per_cpu(sched_res_idx, cpu_iter) = 0;
@@ -3316,27 +3341,27 @@ int schedule_cpu_rm(unsigned int cpu)
         else
         {
             /* Initialize unit. */
-            unit = sr_new[idx]->sched_unit_idle;
-            unit->res = sr_new[idx];
+            unit = data->sr[idx]->sched_unit_idle;
+            unit->res = data->sr[idx];
             unit->is_running = true;
             sched_unit_add_vcpu(unit, idle_vcpu[cpu_iter]);
             sched_domain_insert_unit(unit, idle_vcpu[cpu_iter]->domain);
 
             /* Adjust cpu masks of resources (old and new). */
             cpumask_clear_cpu(cpu_iter, sr->cpus);
-            cpumask_set_cpu(cpu_iter, sr_new[idx]->cpus);
+            cpumask_set_cpu(cpu_iter, data->sr[idx]->cpus);
             cpumask_set_cpu(cpu_iter, &sched_res_mask);
 
             /* Init timer. */
-            init_timer(&sr_new[idx]->s_timer, s_timer_fn, NULL, cpu_iter);
+            init_timer(&data->sr[idx]->s_timer, s_timer_fn, NULL, cpu_iter);
 
             /* Last resource initializations and insert resource pointer. */
-            sr_new[idx]->master_cpu = cpu_iter;
-            set_sched_res(cpu_iter, sr_new[idx]);
+            data->sr[idx]->master_cpu = cpu_iter;
+            set_sched_res(cpu_iter, data->sr[idx]);
 
             /* Last action: set the new lock pointer. */
             smp_mb();
-            sr_new[idx]->schedule_lock = &sched_free_cpu_lock;
+            data->sr[idx]->schedule_lock = &sched_free_cpu_lock;
 
             idx++;
         }
@@ -3352,16 +3377,12 @@ int schedule_cpu_rm(unsigned int cpu)
     /* _Not_ pcpu_schedule_unlock(): schedule_lock may have changed! */
     spin_unlock_irqrestore(old_lock, flags);
 
-    sched_deinit_pdata(old_ops, ppriv_old, cpu);
-
-    sched_free_udata(old_ops, vpriv_old);
-    sched_free_pdata(old_ops, ppriv_old, cpu);
+    sched_deinit_pdata(data->old_ops, data->ppriv_old, cpu);
 
-out:
     rcu_read_unlock(&sched_res_rculock);
-    xfree(sr_new);
+    schedule_cpu_rm_free(data, cpu);
 
-    return ret;
+    return 0;
 }
 
 struct scheduler *scheduler_get_default(void)
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 38251b1f7b..601d639699 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -600,6 +600,15 @@ struct affinity_masks {
 
 bool update_node_aff_alloc(struct affinity_masks *affinity);
 void update_node_aff_free(struct affinity_masks *affinity);
+
+/* Memory allocation related data for schedule_cpu_rm(). */
+struct cpu_rm_data {
+    const struct scheduler *old_ops;
+    void *ppriv_old;
+    void *vpriv_old;
+    struct sched_resource *sr[];
+};
+
 void sched_rm_cpu(unsigned int cpu);
 const cpumask_t *sched_get_opt_cpumask(enum sched_gran opt, unsigned int cpu);
 void schedule_dump(struct cpupool *c);
-- 
2.35.3


