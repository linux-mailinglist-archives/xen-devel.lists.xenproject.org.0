Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09921E6DA7
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:30:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQ6L-0001KY-47; Thu, 28 May 2020 21:30:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LyZP=7K=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1jeQ6J-0001GE-NN
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:30:07 +0000
X-Inumbo-ID: 661e1d24-a12a-11ea-a83e-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 661e1d24-a12a-11ea-a83e-12813bfff9fa;
 Thu, 28 May 2020 21:30:06 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x13so942679wrv.4
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 14:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=yM9i/il81pQeM/q8E3fSLqcs+S42XWd8SHRMmUQBSRY=;
 b=lCwj9cddSm2qkutmRcrGljB4ZLt+V1qujCnsa56Pi+xWNUTCJGnTnW0O+IrayXXWz6
 ZxEHnvuySMVJPftn7Q6sINk979BicwX3lM553TGOlW2+kQODjl3t4ap8teVHwTztujOK
 SQ9XyuI9BD9ge9DYt0FR8R7+SPYAW4ph9xXRUYwAwoRaXegG+vkRZ5mzwB57fac4GKR/
 Ufnr8qQNXmXsTneSZeDoG4+WX7ixTFbLFpt79+kIC4jj5KQJpVP3YUsF2sTBSbCjrSPQ
 J5Ba6WVb08qqiSs8NwEVwD0YIlcs6MNaFZS4VXxZSf817m7OytKt5HJHhfbABUogGyM6
 AWvA==
X-Gm-Message-State: AOAM530GxwZTbDbIIButsZgwA7SfWZx7ZC7K1v6jo1m/ld7cC0n52XZX
 F063Z9TGWITRixycolCciVk=
X-Google-Smtp-Source: ABdhPJzRpciuBc1EO5nViCEa20e7q+SNxn2KdzPCdCSiQCg93fz7vpi2Hvt1MwpVn8NPee/t3YxoGg==
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr5428672wre.275.1590701405541; 
 Thu, 28 May 2020 14:30:05 -0700 (PDT)
Received: from [192.168.0.36] (87.78.186.89.cust.ip.kpnqwest.it.
 [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id l19sm7717544wmj.14.2020.05.28.14.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 14:30:04 -0700 (PDT)
Subject: [PATCH v2 7/7] xen: credit2: rebalance the number of CPUs in the
 scheduler runqueues
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 28 May 2020 23:30:04 +0200
Message-ID: <159070140400.12060.4466204111704460801.stgit@Palanthas>
In-Reply-To: <159070133878.12060.13318432301910522647.stgit@Palanthas>
References: <159070133878.12060.13318432301910522647.stgit@Palanthas>
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
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When adding and removing CPUs to/from a pool, we can end up in a
situation where some runqueues have a lot of CPUs, while other have only
a couple of them. Even if the scheduler (namely, the load balancer)
should be capable of dealing with such a situation, it is something that
is better avoided.

We now have all the pieces in place to attempt an actual re-balancement
of the Credit2 scheduler runqueues, so let's go for it.

In short:
- every time we add or remove a CPU, especially considering the topology
  implications (e.g., we may have removed the last HT from a queue, so
  now there's space there for two CPUs, etc), we try to rebalance;
- rebalancing happens under the control of the cpupool_sync() mechanism.
  Basically, it happens from inside a tasklet, after having put the
  cpupool in a quiescent state;
- the new runqueue configuration may end up being both different, but
  also identical to the current one. It would be good to have a way to
  check whether the result would be identical, and in which case skip
  the balancing, but there is no way to do that.

Rebalancing, since it pauses all the domain of a pool, etc, is a time
consuming operation. But it only happens when the cpupool configuration
is changed, so it is considered acceptable.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
Changes from v1:
* new patch
---
 xen/common/sched/credit2.c |  208 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 207 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index af6d374677..72d1961b1b 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3983,6 +3983,194 @@ init_pdata(struct csched2_private *prv, struct csched2_pcpu *spc,
     return rqd;
 }
 
+/*
+ * Let's get the hard work of rebalancing runqueues done.
+ *
+ * This function is called from a tasklet, spawned by cpupool_sync().
+ * We run in idle vcpu context and we can assume that all the vcpus of all
+ * the domains within this cpupool are stopped... So we are relatively free
+ * to manipulate the scheduler's runqueues.
+ */
+static void do_rebalance_runqueues(void *arg)
+{
+    const struct scheduler *ops = arg;
+    struct csched2_private *prv = csched2_priv(ops);
+    struct csched2_runqueue_data *rqd, *rqd_temp;
+    struct csched2_unit *csu, *csu_temp;
+    struct list_head rq_list, csu_list;
+    spinlock_t temp_lock;
+    unsigned long flags;
+    unsigned int cpu;
+
+    INIT_LIST_HEAD(&rq_list);
+    INIT_LIST_HEAD(&csu_list);
+    spin_lock_init(&temp_lock);
+
+    /*
+     * This is where we will temporarily re-route the locks of all the CPUs,
+     * while we take them outside of their current runqueue, and before adding
+     * them to their new ones. Let's just take it right away, so any sort of
+     * scheduling activity in any of them will stop at it, and won't race with
+     * us.
+     */
+    spin_lock_irq(&temp_lock);
+
+    /*
+     * Everyone is paused, so we don't have any unit in any runqueue. Still,
+     * units are "assigned" each one to a runqueue, for debug dumps and for
+     * calculating and tracking the weights. Since the current runqueues are
+     * going away, we need to deassign everyone from its runqueue. We will
+     * put all of them back into one of the new runqueue, before the end.
+     */
+    write_lock(&prv->lock);
+    list_for_each_entry_safe ( rqd, rqd_temp, &prv->rql, rql )
+    {
+        spin_lock(&rqd->lock);
+        /*
+         * We're deassigning the units, but we don't want to loose track
+         * of them... Otherwise how do we do the re-assignment to the new
+         * runqueues? So, let's stash them in a list.
+         */
+        list_for_each_entry_safe ( csu, csu_temp, &rqd->svc, rqd_elem )
+        {
+            runq_deassign(csu->unit);
+            list_add(&csu->rqd_elem, &csu_list);
+        }
+
+        /*
+         * Now we want to prepare for getting rid of the runqueues as well.
+         * Each CPU has a pointer to the scheduler lock, which in case of
+         * Credit2 is the runqueue lock of the runqueue where the CPU is.
+         * But again, runqueues are vanishing, so let's re-route all such
+         * locks to our safe temporary solution that we introduced above.
+         */
+        for_each_cpu ( cpu, &rqd->active )
+            get_sched_res(cpu)->schedule_lock = &temp_lock;
+        spin_unlock(&rqd->lock);
+
+        /*
+         * And, finally, "dequeue the runqueues", one by one. Similarly to
+         * what we do with units, we need to park them in a temporary list.
+         * In this case, they are actually going away, but we need to do this
+         * because we can't free() them with IRQs disabled.
+         */
+        prv->active_queues--;
+        list_del(&rqd->rql);
+        list_add(&rqd->rql, &rq_list);
+    }
+    ASSERT(prv->active_queues == 0);
+    write_unlock(&prv->lock);
+
+    spin_unlock_irq(&temp_lock);
+
+    /*
+     * Since we have to drop the lock anyway (in order to be able to call
+     * cpu_add_to_runqueue() below), let's also get rid of the old runqueues,
+     * now that we can.
+     */
+    list_for_each_entry_safe ( rqd, rqd_temp, &rq_list, rql )
+    {
+        list_del(&rqd->rql);
+        xfree(rqd);
+    }
+    rqd = NULL;
+
+    /*
+     * We've got no lock! Well, this is still fine as:
+     * - the CPUs may, for some reason, try to schedule, and manage to do so,
+     *   taking turns on our global temporary spinlock. But there should be
+     *   nothing to schedule;
+     * - we are safe from more cpupool manipulations as cpupool_sync() owns
+     *   the cpupool_lock.
+     */
+
+    /*
+     * Now, for each CPU, we have to put them back in a runqueue. Of course,
+     * we have no runqueue any longer, so they'll be re-created. We basically
+     * follow pretty much the exact same path of when we add a CPU to a pool.
+     */
+    for_each_cpu ( cpu, &prv->initialized )
+    {
+        struct csched2_pcpu *spc = csched2_pcpu(cpu);
+
+        /*
+         * The new runqueues need to be allocated, and cpu_add_to_runqueue()
+         * takes care of that. We are, however, in a very delicate state, as
+         * we have destroyed all the previous runqueues. I.e., if an error
+         * (e.g., not enough memory) occurs here, there is no way we can
+         * go back to a sane previous state, so let's just crash.
+         *
+         * Note that, at this time, the number of CPUs we have in the
+         * "initialized" mask represents how many CPUs we have in this pool.
+         * So we can use it, for computing the balance, basically in the same
+         * way as we use num_online_cpu() during boot time. 
+         */
+        rqd = cpu_add_to_runqueue(ops, cpumask_weight(&prv->initialized), cpu);
+        if ( IS_ERR(rqd) )
+        {
+            printk(XENLOG_ERR " Major problems while rebalancing the runqueues!\n");
+            BUG();
+        }
+        spc->rqd = rqd;
+
+        spin_lock_irq(&temp_lock);
+        write_lock(&prv->lock);
+
+        init_cpu_runqueue(prv, spc, cpu, rqd);
+
+        /*
+         * Bring the scheduler lock back to where it belongs, given the new
+         * runqueue, for the various CPUs. Barrier is there because we want
+         * all the runqueue initialization steps that we have made to be
+         * visible, exactly as it was for everyone that takes the lock
+         * (see the comment in common/sched/core.c:schedule_cpu_add() ).
+         */
+        smp_wmb();
+        get_sched_res(cpu)->schedule_lock = &rqd->lock;
+
+        write_unlock(&prv->lock);
+        spin_unlock_irq(&temp_lock);
+    }
+
+    /*
+     * And, finally, everything should be in place again. We can finalize the
+     * work by adding back the units in the runqueues' lists (picking them
+     * up from the temporary list we used). Note that it is not necessary to
+     * call csched2_res_pick(), for deciding on which runqueue to put each
+     * of them. Thins is:
+     *  - with the old runqueue, each entity was associated to a
+     *    sched_resource / CPU;
+     *  - they where assigned to the runqueue in which such CPU was;
+     *  - all the CPUs that were there, with the old runqueues, are still
+     *    here, although in different runqueues;
+     *  - we can just let the units be associated with the runqueues where
+     *    theirs CPU has gone.
+     *
+     *  This means that, even though the load was balanced, with the previous
+     *  runqueues, it now most likely now will not be. But this is not a big
+     *  deal as the load balancer will make things even again, given a little
+     *  time.
+     */
+    list_for_each_entry_safe ( csu, csu_temp, &csu_list, rqd_elem )
+    {
+        spinlock_t *lock;
+
+        lock = unit_schedule_lock_irqsave(csu->unit, &flags);
+        list_del_init(&csu->rqd_elem);
+        runq_assign(csu->unit);
+        unit_schedule_unlock_irqrestore(lock, flags, csu->unit);
+    }
+}
+
+static void rebalance_runqueues(const struct scheduler *ops)
+{
+    struct cpupool *c = ops->cpupool;
+
+    ASSERT(c->sched == ops);
+
+    cpupool_sync(c, do_rebalance_runqueues);
+}
+
 /* Change the scheduler of cpu to us (Credit2). */
 static spinlock_t *
 csched2_switch_sched(struct scheduler *new_ops, unsigned int cpu,
@@ -4017,6 +4205,16 @@ csched2_switch_sched(struct scheduler *new_ops, unsigned int cpu,
      */
     ASSERT(get_sched_res(cpu)->schedule_lock != &rqd->lock);
 
+    /*
+     * We have added a CPU to the pool. Unless we are booting (in which
+     * case cpu_add_to_runqueue() balances the CPUs by itself) or we are in
+     * the very special case of still having fewer CPUs than how many we
+     * can put in just one runqueue... We need to try to rebalance.
+     */
+    if ( system_state >= SYS_STATE_active &&
+          cpumask_weight(&prv->initialized) > opt_max_cpus_runqueue )
+        rebalance_runqueues(new_ops);
+
     write_unlock(&prv->lock);
 
     return &rqd->lock;
@@ -4105,7 +4303,15 @@ csched2_free_pdata(const struct scheduler *ops, void *pcpu, int cpu)
     else
         rqd = NULL;
 
-    write_unlock_irqrestore(&prv->lock, flags);
+    /*
+     * Similarly to what said in csched2_switch_sched(), since we have just
+     * removed a CPU, it's good to check whether we can rebalance the
+     * runqueues.
+     */
+    if ( cpumask_weight(&prv->initialized) >= opt_max_cpus_runqueue )
+        rebalance_runqueues(ops);
+
+     write_unlock_irqrestore(&prv->lock, flags);
 
     xfree(rqd);
     xfree(pcpu);


