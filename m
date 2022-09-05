Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F9E5ACB8B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 09:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398491.639348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV65d-0005Fx-9L; Mon, 05 Sep 2022 07:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398491.639348; Mon, 05 Sep 2022 07:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV65d-00058x-4B; Mon, 05 Sep 2022 07:00:13 +0000
Received: by outflank-mailman (input) for mailman id 398491;
 Mon, 05 Sep 2022 07:00:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XgUS=ZI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oV65a-0004y1-R9
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 07:00:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6081d192-2ce8-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 09:00:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 148BC385D1;
 Mon,  5 Sep 2022 07:00:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4225139C7;
 Mon,  5 Sep 2022 07:00:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WKefLneeFWNlZAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 05 Sep 2022 07:00:07 +0000
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
X-Inumbo-ID: 6081d192-2ce8-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662361208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcIcHlXy1U4J1S/sT61vK8cPPB3NmDByuTHbbmO7RMI=;
	b=Ef8liysk5Otlq0hfvLRZL7AjQ/kygkaLeqxNhX1yHMU0RUgDLikfndEVHkCCllQhLxvO++
	rjuqsHqsQ55gXYu+sgr9zSUNXMSNWxoFr0Rhkc7EBfYx4gROigSpECsP6h8K84WQ5vj/Lr
	NSBfFLvIshtbYB5FFxE/Tcpmfzr754I=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/3] xen/sched: introduce cpupool_update_node_affinity()
Date: Mon,  5 Sep 2022 09:00:03 +0200
Message-Id: <20220905070005.16788-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220905070005.16788-1-jgross@suse.com>
References: <20220905070005.16788-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For updating the node affinities of all domains in a cpupool add a new
function cpupool_update_node_affinity().

In order to avoid multiple allocations of cpumasks carve out memory
allocation and freeing from domain_update_node_affinity() into new
helpers, which can be used by cpupool_update_node_affinity().

Modify domain_update_node_affinity() to take an additional parameter
for passing the allocated memory in and to allocate and free the memory
via the new helpers in case NULL was passed.

This will help later to pre-allocate the cpumasks in order to avoid
allocations in stop-machine context.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- move helpers to core.c (Jan Beulich)
- allocate/free memory in domain_update_node_aff() if NULL was passed
  in (Jan Beulich)
V3:
- remove pointless initializer (Jan Beulich)
V4:
- rename alloc/free helpers (Andrew Cooper)
---
 xen/common/sched/core.c    | 54 ++++++++++++++++++++++++++------------
 xen/common/sched/cpupool.c | 39 +++++++++++++++------------
 xen/common/sched/private.h |  7 +++++
 xen/include/xen/sched.h    |  9 ++++++-
 4 files changed, 74 insertions(+), 35 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index ff1ddc7624..5f1a265889 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1824,9 +1824,28 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
     return ret;
 }
 
-void domain_update_node_affinity(struct domain *d)
+bool alloc_affinity_masks(struct affinity_masks *affinity)
 {
-    cpumask_var_t dom_cpumask, dom_cpumask_soft;
+    if ( !alloc_cpumask_var(&affinity->hard) )
+        return false;
+    if ( !alloc_cpumask_var(&affinity->soft) )
+    {
+        free_cpumask_var(affinity->hard);
+        return false;
+    }
+
+    return true;
+}
+
+void free_affinity_masks(struct affinity_masks *affinity)
+{
+    free_cpumask_var(affinity->soft);
+    free_cpumask_var(affinity->hard);
+}
+
+void domain_update_node_aff(struct domain *d, struct affinity_masks *affinity)
+{
+    struct affinity_masks masks;
     cpumask_t *dom_affinity;
     const cpumask_t *online;
     struct sched_unit *unit;
@@ -1836,14 +1855,16 @@ void domain_update_node_affinity(struct domain *d)
     if ( !d->vcpu || !d->vcpu[0] )
         return;
 
-    if ( !zalloc_cpumask_var(&dom_cpumask) )
-        return;
-    if ( !zalloc_cpumask_var(&dom_cpumask_soft) )
+    if ( !affinity )
     {
-        free_cpumask_var(dom_cpumask);
-        return;
+        affinity = &masks;
+        if ( !alloc_affinity_masks(affinity) )
+            return;
     }
 
+    cpumask_clear(affinity->hard);
+    cpumask_clear(affinity->soft);
+
     online = cpupool_domain_master_cpumask(d);
 
     spin_lock(&d->node_affinity_lock);
@@ -1864,22 +1885,21 @@ void domain_update_node_affinity(struct domain *d)
          */
         for_each_sched_unit ( d, unit )
         {
-            cpumask_or(dom_cpumask, dom_cpumask, unit->cpu_hard_affinity);
-            cpumask_or(dom_cpumask_soft, dom_cpumask_soft,
-                       unit->cpu_soft_affinity);
+            cpumask_or(affinity->hard, affinity->hard, unit->cpu_hard_affinity);
+            cpumask_or(affinity->soft, affinity->soft, unit->cpu_soft_affinity);
         }
         /* Filter out non-online cpus */
-        cpumask_and(dom_cpumask, dom_cpumask, online);
-        ASSERT(!cpumask_empty(dom_cpumask));
+        cpumask_and(affinity->hard, affinity->hard, online);
+        ASSERT(!cpumask_empty(affinity->hard));
         /* And compute the intersection between hard, online and soft */
-        cpumask_and(dom_cpumask_soft, dom_cpumask_soft, dom_cpumask);
+        cpumask_and(affinity->soft, affinity->soft, affinity->hard);
 
         /*
          * If not empty, the intersection of hard, soft and online is the
          * narrowest set we want. If empty, we fall back to hard&online.
          */
-        dom_affinity = cpumask_empty(dom_cpumask_soft) ?
-                           dom_cpumask : dom_cpumask_soft;
+        dom_affinity = cpumask_empty(affinity->soft) ? affinity->hard
+                                                     : affinity->soft;
 
         nodes_clear(d->node_affinity);
         for_each_cpu ( cpu, dom_affinity )
@@ -1888,8 +1908,8 @@ void domain_update_node_affinity(struct domain *d)
 
     spin_unlock(&d->node_affinity_lock);
 
-    free_cpumask_var(dom_cpumask_soft);
-    free_cpumask_var(dom_cpumask);
+    if ( affinity == &masks )
+        free_affinity_masks(affinity);
 }
 
 typedef long ret_t;
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 2afe54f54d..aac3a269b7 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -410,6 +410,25 @@ int cpupool_move_domain(struct domain *d, struct cpupool *c)
     return ret;
 }
 
+/* Update affinities of all domains in a cpupool. */
+static void cpupool_update_node_affinity(const struct cpupool *c)
+{
+    struct affinity_masks masks;
+    struct domain *d;
+
+    if ( !alloc_affinity_masks(&masks) )
+        return;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for_each_domain_in_cpupool(d, c)
+        domain_update_node_aff(d, &masks);
+
+    rcu_read_unlock(&domlist_read_lock);
+
+    free_affinity_masks(&masks);
+}
+
 /*
  * assign a specific cpu to a cpupool
  * cpupool_lock must be held
@@ -417,7 +436,6 @@ int cpupool_move_domain(struct domain *d, struct cpupool *c)
 static int cpupool_assign_cpu_locked(struct cpupool *c, unsigned int cpu)
 {
     int ret;
-    struct domain *d;
     const cpumask_t *cpus;
 
     cpus = sched_get_opt_cpumask(c->gran, cpu);
@@ -442,12 +460,7 @@ static int cpupool_assign_cpu_locked(struct cpupool *c, unsigned int cpu)
 
     rcu_read_unlock(&sched_res_rculock);
 
-    rcu_read_lock(&domlist_read_lock);
-    for_each_domain_in_cpupool(d, c)
-    {
-        domain_update_node_affinity(d);
-    }
-    rcu_read_unlock(&domlist_read_lock);
+    cpupool_update_node_affinity(c);
 
     return 0;
 }
@@ -456,18 +469,14 @@ static int cpupool_unassign_cpu_finish(struct cpupool *c)
 {
     int cpu = cpupool_moving_cpu;
     const cpumask_t *cpus;
-    struct domain *d;
     int ret;
 
     if ( c != cpupool_cpu_moving )
         return -EADDRNOTAVAIL;
 
-    /*
-     * We need this for scanning the domain list, both in
-     * cpu_disable_scheduler(), and at the bottom of this function.
-     */
     rcu_read_lock(&domlist_read_lock);
     ret = cpu_disable_scheduler(cpu);
+    rcu_read_unlock(&domlist_read_lock);
 
     rcu_read_lock(&sched_res_rculock);
     cpus = get_sched_res(cpu)->cpus;
@@ -494,11 +503,7 @@ static int cpupool_unassign_cpu_finish(struct cpupool *c)
     }
     rcu_read_unlock(&sched_res_rculock);
 
-    for_each_domain_in_cpupool(d, c)
-    {
-        domain_update_node_affinity(d);
-    }
-    rcu_read_unlock(&domlist_read_lock);
+    cpupool_update_node_affinity(c);
 
     return ret;
 }
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index a870320146..2b04b01a0c 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -593,6 +593,13 @@ affinity_balance_cpumask(const struct sched_unit *unit, int step,
         cpumask_copy(mask, unit->cpu_hard_affinity);
 }
 
+struct affinity_masks {
+    cpumask_var_t hard;
+    cpumask_var_t soft;
+};
+
+bool alloc_affinity_masks(struct affinity_masks *affinity);
+void free_affinity_masks(struct affinity_masks *affinity);
 void sched_rm_cpu(unsigned int cpu);
 const cpumask_t *sched_get_opt_cpumask(enum sched_gran opt, unsigned int cpu);
 void schedule_dump(struct cpupool *c);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1cf629e7ec..81f1fcba2a 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -666,8 +666,15 @@ static inline void get_knownalive_domain(struct domain *d)
     ASSERT(!(atomic_read(&d->refcnt) & DOMAIN_DESTROYED));
 }
 
+struct affinity_masks;
+
 int domain_set_node_affinity(struct domain *d, const nodemask_t *affinity);
-void domain_update_node_affinity(struct domain *d);
+void domain_update_node_aff(struct domain *d, struct affinity_masks *affinity);
+
+static inline void domain_update_node_affinity(struct domain *d)
+{
+    domain_update_node_aff(d, NULL);
+}
 
 /*
  * To be implemented by each architecture, sanity checking the configuration
-- 
2.35.3


