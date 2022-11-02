Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0B0616581
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 16:01:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435970.689944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqFEP-0000EU-AM; Wed, 02 Nov 2022 15:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435970.689944; Wed, 02 Nov 2022 15:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqFEP-0000Ck-38; Wed, 02 Nov 2022 15:00:41 +0000
Received: by outflank-mailman (input) for mailman id 435970;
 Wed, 02 Nov 2022 15:00:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O20d=3C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqFEO-0000Ce-7I
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 15:00:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c980c8c-5abf-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 16:00:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EDEEF22BC1;
 Wed,  2 Nov 2022 15:00:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B425013AE0;
 Wed,  2 Nov 2022 15:00:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ynSiKhWGYmOIcAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 02 Nov 2022 15:00:37 +0000
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
X-Inumbo-ID: 1c980c8c-5abf-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667401237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xNCfxi96uIUvgpHLKVAC+IBUegMYVriE//mcaTsisWs=;
	b=Dw3EU0OT5O9jA9yNut1p5qnjHCtfmN2bw9l+LS09rzgQHVVDGO4cQoDVm8ZhLhABlTtASd
	Qg6D/HvC/4RScjxnxP34MVLDNpQCgu5yDRZDOpjigUHWfTgdwA1ibpAZmtMBzUMJD1zpo7
	O+t8dJ1agX/hpqaRL1D4T4qtyDGJSPQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Meng Xu <mengxu@cis.upenn.edu>,
	Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH-for-4.17 v3] xen/sched: migrate timers to correct cpus after suspend
Date: Wed,  2 Nov 2022 16:00:35 +0100
Message-Id: <20221102150035.4885-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Today all timers are migrated to cpu 0 when the system is being
suspended. They are not migrated back after resuming the system again.

This results (at least) to visible problems with the credit scheduler,
as the timer isn't handled on the cpu it was expected to occur, which
will result in an ASSERT() triggering. Other more subtle problems, like
uninterrupted elongated time slices, are probable. The least effect
will be worse performance on cpu 0 resulting from most scheduling
related timer interrupts happening there after suspend/resume.

Add migrating the scheduling related timers of a specific cpu from cpu
0 back to its original cpu when that cpu has gone up when resuming the
system.

Fixes: 0763cd268789 ("xen/sched: don't disable scheduler on cpus during suspend")
Signed-off-by: Juergen Gross <jgross@suse.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
V2:
- fix smt=0 case (Marek Marczykowski-Górecki)
V3:
- minor comment and commit message adjustments (Jan Beulich)
---
 xen/common/sched/core.c    | 29 +++++++++++++++++++
 xen/common/sched/cpupool.c |  2 ++
 xen/common/sched/credit.c  | 13 +++++++++
 xen/common/sched/private.h | 10 +++++++
 xen/common/sched/rt.c      | 58 ++++++++++++++++++++++++++------------
 5 files changed, 94 insertions(+), 18 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 23fa6845a8..43132ff6e0 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1284,6 +1284,35 @@ static int cpu_disable_scheduler_check(unsigned int cpu)
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
+
+    /*
+     * Note that on a system with parked cpus (e.g. smt=0 on Intel cpus) this
+     * will be called for the parked cpus, too, so the case for no scheduling
+     * resource being available must be considered.
+     */
+    if ( sr && sr->master_cpu == cpu )
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


