Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FD62C9910
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:22:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41640.75018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0v5-00056y-Ld; Tue, 01 Dec 2020 08:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41640.75018; Tue, 01 Dec 2020 08:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0v5-00055R-1m; Tue, 01 Dec 2020 08:21:55 +0000
Received: by outflank-mailman (input) for mailman id 41640;
 Tue, 01 Dec 2020 08:21:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0v2-0004Uj-JJ
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:21:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5433781-6557-465d-9090-c775c13054ae;
 Tue, 01 Dec 2020 08:21:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DC4CAEFF;
 Tue,  1 Dec 2020 08:21:32 +0000 (UTC)
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
X-Inumbo-ID: d5433781-6557-465d-9090-c775c13054ae
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=708vSf4hdDLmhqVFIbpBu/E6M/WDwL53lyQ6wvfCs8c=;
	b=EEKGCdbaUJZM5ne+c6o2Igd6i7OnsH1A4VTVrMWIIJ8haSEigJ728u0IGOeBVBvrGYgD0G
	sZf9D/plSzZkk4iAqQKZVxKeKecfF4J/jpq2Tz6BeS2ijXbTAaGnfnE2i4avbbshJxq0pS
	iekW+Jec6R8Lugat7JGWYuvemBryrL8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v2 07/17] xen/cpupool: support moving domain between cpupools with different granularity
Date: Tue,  1 Dec 2020 09:21:18 +0100
Message-Id: <20201201082128.15239-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When moving a domain between cpupools with different scheduling
granularity the sched_units of the domain need to be adjusted.

Do that by allocating new sched_units and throwing away the old ones
in sched_move_domain().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c | 121 ++++++++++++++++++++++++++++++----------
 1 file changed, 90 insertions(+), 31 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index a429fc7640..2a61c879b3 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -613,17 +613,45 @@ static void sched_move_irqs(const struct sched_unit *unit)
         vcpu_move_irqs(v);
 }
 
+/*
+ * Move a domain from one cpupool to another.
+ *
+ * A domain with any vcpu having temporary affinity settings will be denied
+ * to move. Hard and soft affinities will be reset.
+ *
+ * In order to support cpupools with different scheduling granularities all
+ * scheduling units are replaced by new ones.
+ *
+ * The complete move is done in the following steps:
+ * - check prerequisites (no vcpu with temporary affinities)
+ * - allocate all new data structures (scheduler specific domain data, unit
+ *   memory, scheduler specific unit data)
+ * - pause domain
+ * - temporarily move all (old) units to the same scheduling resource (this
+ *   makes the final resource assignment easier in case the new cpupool has
+ *   a larger granularity than the old one, as the scheduling locks for all
+ *   vcpus must be held for that operation)
+ * - remove old units from scheduling
+ * - set new cpupool and scheduler domain data pointers in struct domain
+ * - switch all vcpus to new units, still assigned to the old scheduling
+ *   resource
+ * - migrate all new units to scheduling resources of the new cpupool
+ * - unpause the domain
+ * - free the old memory (scheduler specific domain data, unit memory,
+ *   scheduler specific unit data)
+ */
 int sched_move_domain(struct domain *d, struct cpupool *c)
 {
     struct vcpu *v;
-    struct sched_unit *unit;
+    struct sched_unit *unit, *old_unit;
+    struct sched_unit *new_units = NULL, *old_units;
+    struct sched_unit **unit_ptr = &new_units;
     unsigned int new_p, unit_idx;
-    void **unit_priv;
     void *domdata;
-    void *unitdata;
-    struct scheduler *old_ops;
+    struct scheduler *old_ops = dom_scheduler(d);
     void *old_domdata;
     unsigned int gran = cpupool_get_granularity(c);
+    unsigned int n_units = DIV_ROUND_UP(d->max_vcpus, gran);
     int ret = 0;
 
     for_each_vcpu ( d, v )
@@ -641,53 +669,78 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
         goto out;
     }
 
-    unit_priv = xzalloc_array(void *, DIV_ROUND_UP(d->max_vcpus, gran));
-    if ( unit_priv == NULL )
+    for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
     {
-        sched_free_domdata(c->sched, domdata);
-        ret = -ENOMEM;
-        goto out;
-    }
+        unit = sched_alloc_unit_mem();
+        if ( unit )
+        {
+            /* Initialize unit for sched_alloc_udata() to work. */
+            unit->domain = d;
+            unit->unit_id = unit_idx * gran;
+            unit->vcpu_list = d->vcpu[unit->unit_id];
+            unit->priv = sched_alloc_udata(c->sched, unit, domdata);
+            *unit_ptr = unit;
+        }
 
-    unit_idx = 0;
-    for_each_sched_unit ( d, unit )
-    {
-        unit_priv[unit_idx] = sched_alloc_udata(c->sched, unit, domdata);
-        if ( unit_priv[unit_idx] == NULL )
+        if ( !unit || !unit->priv )
         {
-            for ( unit_idx = 0; unit_priv[unit_idx]; unit_idx++ )
-                sched_free_udata(c->sched, unit_priv[unit_idx]);
-            xfree(unit_priv);
-            sched_free_domdata(c->sched, domdata);
+            old_units = new_units;
+            old_domdata = domdata;
             ret = -ENOMEM;
-            goto out;
+            goto out_free;
         }
-        unit_idx++;
+
+        unit_ptr = &unit->next_in_list;
     }
 
     domain_pause(d);
 
-    old_ops = dom_scheduler(d);
     old_domdata = d->sched_priv;
 
+    new_p = cpumask_first(d->cpupool->cpu_valid);
     for_each_sched_unit ( d, unit )
     {
+        spinlock_t *lock;
+
+        /*
+         * Temporarily move all units to same processor to make locking
+         * easier when moving the new units to the new processors.
+         */
+        lock = unit_schedule_lock_irq(unit);
+        sched_set_res(unit, get_sched_res(new_p));
+        spin_unlock_irq(lock);
+
         sched_remove_unit(old_ops, unit);
     }
 
+    old_units = d->sched_unit_list;
+
     d->cpupool = c;
     d->sched_priv = domdata;
 
+    unit = new_units;
+    for_each_vcpu ( d, v )
+    {
+        old_unit = v->sched_unit;
+        if ( unit->unit_id + gran == v->vcpu_id )
+            unit = unit->next_in_list;
+
+        unit->state_entry_time = old_unit->state_entry_time;
+        unit->runstate_cnt[v->runstate.state]++;
+        /* Temporarily use old resource assignment */
+        unit->res = get_sched_res(new_p);
+
+        v->sched_unit = unit;
+    }
+
+    d->sched_unit_list = new_units;
+
     new_p = cpumask_first(c->cpu_valid);
-    unit_idx = 0;
     for_each_sched_unit ( d, unit )
     {
         spinlock_t *lock;
         unsigned int unit_p = new_p;
 
-        unitdata = unit->priv;
-        unit->priv = unit_priv[unit_idx];
-
         for_each_sched_unit_vcpu ( unit, v )
         {
             migrate_timer(&v->periodic_timer, new_p);
@@ -713,8 +766,6 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
 
         sched_insert_unit(c->sched, unit);
 
-        sched_free_udata(old_ops, unitdata);
-
         unit_idx++;
     }
 
@@ -722,11 +773,19 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
 
     domain_unpause(d);
 
-    sched_free_domdata(old_ops, old_domdata);
+ out_free:
+    for ( unit = old_units; unit; )
+    {
+        if ( unit->priv )
+            sched_free_udata(c->sched, unit->priv);
+        old_unit = unit;
+        unit = unit->next_in_list;
+        xfree(old_unit);
+    }
 
-    xfree(unit_priv);
+    sched_free_domdata(old_ops, old_domdata);
 
-out:
+ out:
     rcu_read_unlock(&sched_res_rculock);
 
     return ret;
-- 
2.26.2


