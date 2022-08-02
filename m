Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C36587D17
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 15:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379319.612675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIrwY-0002y5-Si; Tue, 02 Aug 2022 13:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379319.612675; Tue, 02 Aug 2022 13:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIrwY-0002vE-Nx; Tue, 02 Aug 2022 13:28:18 +0000
Received: by outflank-mailman (input) for mailman id 379319;
 Tue, 02 Aug 2022 13:28:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NPAu=YG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oIrwW-0001vX-Lw
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 13:28:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6de6b48-1266-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 15:28:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC8E622874;
 Tue,  2 Aug 2022 13:27:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E0C01345B;
 Tue,  2 Aug 2022 13:27:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mEBLHVUm6WLWWQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 02 Aug 2022 13:27:49 +0000
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
X-Inumbo-ID: f6de6b48-1266-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659446869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yj8R2JmYTH+KzF/O2iIv9Z3fhDfAQu02NhWeFYfLre8=;
	b=lwLUtaEeuVk+gFRisncvqqkx5444Nn4lM9t61vxL75pUlEkb/cMRlj6SC0kewvhQAWO0Zg
	3boCcpP5Ojl+20YuGlGSNd6X0zHymzv2Q/lcJweet7VR93uKNGeyI6cO0+/3FeaANPIkP4
	jrhv4WXHD1WqKhZyiQxT9IJ0s5QEtC8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 1/3] xen/sched: introduce cpupool_update_node_affinity()
Date: Tue,  2 Aug 2022 15:27:45 +0200
Message-Id: <20220802132747.22507-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220802132747.22507-1-jgross@suse.com>
References: <20220802132747.22507-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For updating the node affinities of all domains in a cpupool add a new
function cpupool_update_node_affinity().

In order to avoid multiple allocations of cpumasks split
domain_update_node_affinity() into a wrapper doing the needed
allocations and a work function, which can be called by
cpupool_update_node_affinity(), too.

This will help later to pre-allocate the cpumasks in order to avoid
allocations in stop-machine context.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c    | 61 ++++++++++++++++++++-----------------
 xen/common/sched/cpupool.c | 62 +++++++++++++++++++++++++++-----------
 xen/common/sched/private.h |  8 +++++
 3 files changed, 87 insertions(+), 44 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index f689b55783..c8d1034d3d 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1790,28 +1790,14 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
     return ret;
 }
 
-void domain_update_node_affinity(struct domain *d)
+void domain_update_node_affinity_noalloc(struct domain *d,
+                                         const cpumask_t *online,
+                                         struct affinity_masks *affinity)
 {
-    cpumask_var_t dom_cpumask, dom_cpumask_soft;
     cpumask_t *dom_affinity;
-    const cpumask_t *online;
     struct sched_unit *unit;
     unsigned int cpu;
 
-    /* Do we have vcpus already? If not, no need to update node-affinity. */
-    if ( !d->vcpu || !d->vcpu[0] )
-        return;
-
-    if ( !zalloc_cpumask_var(&dom_cpumask) )
-        return;
-    if ( !zalloc_cpumask_var(&dom_cpumask_soft) )
-    {
-        free_cpumask_var(dom_cpumask);
-        return;
-    }
-
-    online = cpupool_domain_master_cpumask(d);
-
     spin_lock(&d->node_affinity_lock);
 
     /*
@@ -1830,22 +1816,21 @@ void domain_update_node_affinity(struct domain *d)
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
@@ -1853,9 +1838,31 @@ void domain_update_node_affinity(struct domain *d)
     }
 
     spin_unlock(&d->node_affinity_lock);
+}
+
+void domain_update_node_affinity(struct domain *d)
+{
+    struct affinity_masks masks;
+    const cpumask_t *online;
+
+    /* Do we have vcpus already? If not, no need to update node-affinity. */
+    if ( !d->vcpu || !d->vcpu[0] )
+        return;
+
+    if ( !zalloc_cpumask_var(&masks.hard) )
+        return;
+    if ( !zalloc_cpumask_var(&masks.soft) )
+    {
+        free_cpumask_var(masks.hard);
+        return;
+    }
+
+    online = cpupool_domain_master_cpumask(d);
+
+    domain_update_node_affinity_noalloc(d, online, &masks);
 
-    free_cpumask_var(dom_cpumask_soft);
-    free_cpumask_var(dom_cpumask);
+    free_cpumask_var(masks.soft);
+    free_cpumask_var(masks.hard);
 }
 
 typedef long ret_t;
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 2afe54f54d..1463dcd767 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -410,6 +410,48 @@ int cpupool_move_domain(struct domain *d, struct cpupool *c)
     return ret;
 }
 
+/* Update affinities of all domains in a cpupool. */
+static int cpupool_alloc_affin_masks(struct affinity_masks *masks)
+{
+    if ( !alloc_cpumask_var(&masks->hard) )
+        return -ENOMEM;
+    if ( alloc_cpumask_var(&masks->soft) )
+        return 0;
+
+    free_cpumask_var(masks->hard);
+    return -ENOMEM;
+}
+
+static void cpupool_free_affin_masks(struct affinity_masks *masks)
+{
+    free_cpumask_var(masks->soft);
+    free_cpumask_var(masks->hard);
+}
+
+static void cpupool_update_node_affinity(const struct cpupool *c)
+{
+    const cpumask_t *online = c->res_valid;
+    struct affinity_masks masks;
+    struct domain *d;
+
+    if ( cpupool_alloc_affin_masks(&masks) )
+        return;
+
+    rcu_read_lock(&domlist_read_lock);
+    for_each_domain_in_cpupool(d, c)
+    {
+        if ( d->vcpu && d->vcpu[0] )
+        {
+            cpumask_clear(masks.hard);
+            cpumask_clear(masks.soft);
+            domain_update_node_affinity_noalloc(d, online, &masks);
+        }
+    }
+    rcu_read_unlock(&domlist_read_lock);
+
+    cpupool_free_affin_masks(&masks);
+}
+
 /*
  * assign a specific cpu to a cpupool
  * cpupool_lock must be held
@@ -417,7 +459,6 @@ int cpupool_move_domain(struct domain *d, struct cpupool *c)
 static int cpupool_assign_cpu_locked(struct cpupool *c, unsigned int cpu)
 {
     int ret;
-    struct domain *d;
     const cpumask_t *cpus;
 
     cpus = sched_get_opt_cpumask(c->gran, cpu);
@@ -442,12 +483,7 @@ static int cpupool_assign_cpu_locked(struct cpupool *c, unsigned int cpu)
 
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
@@ -456,18 +492,14 @@ static int cpupool_unassign_cpu_finish(struct cpupool *c)
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
@@ -494,11 +526,7 @@ static int cpupool_unassign_cpu_finish(struct cpupool *c)
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
index a870320146..de0cf63ce8 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -593,6 +593,14 @@ affinity_balance_cpumask(const struct sched_unit *unit, int step,
         cpumask_copy(mask, unit->cpu_hard_affinity);
 }
 
+struct affinity_masks {
+    cpumask_var_t hard;
+    cpumask_var_t soft;
+};
+
+void domain_update_node_affinity_noalloc(struct domain *d,
+                                         const cpumask_t *online,
+                                         struct affinity_masks *affinity);
 void sched_rm_cpu(unsigned int cpu);
 const cpumask_t *sched_get_opt_cpumask(enum sched_gran opt, unsigned int cpu);
 void schedule_dump(struct cpupool *c);
-- 
2.35.3


