Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 978D06079F8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 16:54:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427723.677057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oltPP-0003XS-QK; Fri, 21 Oct 2022 14:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427723.677057; Fri, 21 Oct 2022 14:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oltPP-0003VD-ML; Fri, 21 Oct 2022 14:54:03 +0000
Received: by outflank-mailman (input) for mailman id 427723;
 Fri, 21 Oct 2022 14:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MvAv=2W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oltPN-0003V4-MD
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 14:54:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29604d4e-5150-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 16:53:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 450FF1F8E1;
 Fri, 21 Oct 2022 14:53:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B7DF13A0E;
 Fri, 21 Oct 2022 14:53:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jue5AIeyUmPpLwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Oct 2022 14:53:58 +0000
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
X-Inumbo-ID: 29604d4e-5150-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666364039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ypwwZtddv/zbC+omssU6L3ECl6BXc92riOBC2cN9wvM=;
	b=PFV1mf5IhuJxOyLsor7uWtWecOb6oD/v1vV7NF2IBaNSbndlVmIsjkqjRU/w8IyHSrQMR+
	OmDYemgNNUSI+p/ZDFTOaF5ynFk8eVECHkogq8oBxG9tcpYk8PRt33PUaBR8bksv2TOmQ8
	NA2jtzCXURlIfklWtJfd6iemBGcJTLY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Meng Xu <mengxu@cis.upenn.edu>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH-for-4.17] xen/sched: migrate timers to correct cpus after suspend
Date: Fri, 21 Oct 2022 16:53:57 +0200
Message-Id: <20221021145357.17931-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today all timers are migrated to cpu 0 when the system is being
suspended. They are not migrated back after resuming the system again.

This results (at least) to problems with the credit scheduler, as the
timer isn't handled on the cpu it was expected to occur.

Add migrating the scheduling related timers of a specific cpu from cpu
0 back to its original cpu when that cpu has gone up when resuming the
system.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
This is an alternative approach to this one:
https://lists.xen.org/archives/html/xen-devel/2022-09/msg00510.html
---
 xen/common/sched/core.c    | 23 +++++++++++++++
 xen/common/sched/cpupool.c |  2 ++
 xen/common/sched/credit.c  | 13 +++++++++
 xen/common/sched/private.h | 10 +++++++
 xen/common/sched/rt.c      | 58 ++++++++++++++++++++++++++------------
 5 files changed, 88 insertions(+), 18 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 23fa6845a8..142d03ade5 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1284,6 +1284,29 @@ static int cpu_disable_scheduler_check(unsigned int cpu)
     return 0;
 }
 
+/*
+ * Called after a cpu has come up again in a suspend/resume cycle.
+ * Migrate all timers for this cpu (they have been migrated to cpu 0 when the
+ * cpu was going down).
+ * Note that only timers related to a physical cpu are migrated, not the ones
+ * related to a vcpu or domain.
+ */
+void sched_migrate_timers(unsigned int cpu)
+{
+    struct sched_resource *sr;
+
+    rcu_read_lock(&sched_res_rculock);
+
+    sr = get_sched_res(cpu);
+    if ( sr->master_cpu == cpu )
+    {
+        migrate_timer(&sr->s_timer, cpu);
+        sched_move_timers(sr->scheduler, sr);
+    }
+
+    rcu_read_unlock(&sched_res_rculock);
+}
+
 /*
  * In general, this must be called with the scheduler lock held, because the
  * adjust_affinity hook may want to modify the vCPU state. However, when the
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index b2c6f520c3..bdf6030ab0 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -1035,6 +1035,8 @@ static int cf_check cpu_callback(
     case CPU_ONLINE:
         if ( system_state <= SYS_STATE_active )
             rc = cpupool_cpu_add(cpu);
+        else
+            sched_migrate_timers(cpu);
         break;
     case CPU_DOWN_PREPARE:
         /* Suspend/Resume don't change assignments of cpus to cpupools. */
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 47945c2834..f2cd3d9da3 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -614,6 +614,18 @@ init_pdata(struct csched_private *prv, struct csched_pcpu *spc, int cpu)
     spc->nr_runnable = 0;
 }
 
+static void cf_check
+csched_move_timers(const struct scheduler *ops, struct sched_resource *sr)
+{
+    struct csched_private *prv = CSCHED_PRIV(ops);
+    struct csched_pcpu *spc = sr->sched_priv;
+
+    if ( sr->master_cpu == prv->master )
+        migrate_timer(&prv->master_ticker, prv->master);
+
+    migrate_timer(&spc->ticker, sr->master_cpu);
+}
+
 /* Change the scheduler of cpu to us (Credit). */
 static spinlock_t *cf_check
 csched_switch_sched(struct scheduler *new_ops, unsigned int cpu,
@@ -2264,6 +2276,7 @@ static const struct scheduler sched_credit_def = {
     .switch_sched   = csched_switch_sched,
     .alloc_domdata  = csched_alloc_domdata,
     .free_domdata   = csched_free_domdata,
+    .move_timers    = csched_move_timers,
 };
 
 REGISTER_SCHEDULER(sched_credit_def);
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 0126a4bb9e..0527a8c70d 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -331,6 +331,8 @@ struct scheduler {
                                     struct xen_sysctl_scheduler_op *);
     void         (*dump_settings)  (const struct scheduler *);
     void         (*dump_cpu_state) (const struct scheduler *, int);
+    void         (*move_timers)    (const struct scheduler *,
+                                    struct sched_resource *);
 };
 
 static inline int sched_init(struct scheduler *s)
@@ -485,6 +487,13 @@ static inline int sched_adjust_cpupool(const struct scheduler *s,
     return s->adjust_global ? s->adjust_global(s, op) : 0;
 }
 
+static inline void sched_move_timers(const struct scheduler *s,
+                                     struct sched_resource *sr)
+{
+    if ( s->move_timers )
+        s->move_timers(s, sr);
+}
+
 static inline void sched_unit_pause_nosync(const struct sched_unit *unit)
 {
     struct vcpu *v;
@@ -622,6 +631,7 @@ struct cpu_rm_data *alloc_cpu_rm_data(unsigned int cpu, bool aff_alloc);
 void free_cpu_rm_data(struct cpu_rm_data *mem, unsigned int cpu);
 int schedule_cpu_rm(unsigned int cpu, struct cpu_rm_data *mem);
 int sched_move_domain(struct domain *d, struct cpupool *c);
+void sched_migrate_timers(unsigned int cpu);
 struct cpupool *cpupool_get_by_id(unsigned int poolid);
 void cpupool_put(struct cpupool *pool);
 int cpupool_add_domain(struct domain *d, unsigned int poolid);
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 1f8d074884..d443cd5831 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -750,6 +750,27 @@ rt_switch_sched(struct scheduler *new_ops, unsigned int cpu,
     return &prv->lock;
 }
 
+static void move_repl_timer(struct rt_private *prv, unsigned int old_cpu)
+{
+    cpumask_t *online = get_sched_res(old_cpu)->cpupool->res_valid;
+    unsigned int new_cpu = cpumask_cycle(old_cpu, online);
+
+    /*
+     * Make sure the timer run on one of the cpus that are still available
+     * to this scheduler. If there aren't any left, it means it's the time
+     * to just kill it.
+     */
+    if ( new_cpu >= nr_cpu_ids )
+    {
+        kill_timer(&prv->repl_timer);
+        dprintk(XENLOG_DEBUG, "RTDS: timer killed on cpu %d\n", old_cpu);
+    }
+    else
+    {
+        migrate_timer(&prv->repl_timer, new_cpu);
+    }
+}
+
 static void cf_check
 rt_deinit_pdata(const struct scheduler *ops, void *pcpu, int cpu)
 {
@@ -759,25 +780,25 @@ rt_deinit_pdata(const struct scheduler *ops, void *pcpu, int cpu)
     spin_lock_irqsave(&prv->lock, flags);
 
     if ( prv->repl_timer.cpu == cpu )
-    {
-        cpumask_t *online = get_sched_res(cpu)->cpupool->res_valid;
-        unsigned int new_cpu = cpumask_cycle(cpu, online);
+        move_repl_timer(prv, cpu);
 
-        /*
-         * Make sure the timer run on one of the cpus that are still available
-         * to this scheduler. If there aren't any left, it means it's the time
-         * to just kill it.
-         */
-        if ( new_cpu >= nr_cpu_ids )
-        {
-            kill_timer(&prv->repl_timer);
-            dprintk(XENLOG_DEBUG, "RTDS: timer killed on cpu %d\n", cpu);
-        }
-        else
-        {
-            migrate_timer(&prv->repl_timer, new_cpu);
-        }
-    }
+    spin_unlock_irqrestore(&prv->lock, flags);
+}
+
+static void cf_check
+rt_move_timers(const struct scheduler *ops, struct sched_resource *sr)
+{
+    unsigned long flags;
+    struct rt_private *prv = rt_priv(ops);
+    unsigned int old_cpu;
+
+    spin_lock_irqsave(&prv->lock, flags);
+
+    old_cpu = prv->repl_timer.cpu;
+    if ( prv->repl_timer.status != TIMER_STATUS_invalid &&
+         prv->repl_timer.status != TIMER_STATUS_killed &&
+         !cpumask_test_cpu(old_cpu, sr->cpupool->res_valid) )
+        move_repl_timer(prv, old_cpu);
 
     spin_unlock_irqrestore(&prv->lock, flags);
 }
@@ -1561,6 +1582,7 @@ static const struct scheduler sched_rtds_def = {
     .sleep          = rt_unit_sleep,
     .wake           = rt_unit_wake,
     .context_saved  = rt_context_saved,
+    .move_timers    = rt_move_timers,
 };
 
 REGISTER_SCHEDULER(sched_rtds_def);
-- 
2.35.3


