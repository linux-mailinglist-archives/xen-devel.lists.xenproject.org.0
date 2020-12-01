Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972192C9906
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41623.74937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0uo-0004ad-BZ; Tue, 01 Dec 2020 08:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41623.74937; Tue, 01 Dec 2020 08:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0uo-0004Zi-7J; Tue, 01 Dec 2020 08:21:38 +0000
Received: by outflank-mailman (input) for mailman id 41623;
 Tue, 01 Dec 2020 08:21:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0un-0004VK-5O
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:21:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee50f3c3-d2f7-44ea-9920-1b24a7ede1b2;
 Tue, 01 Dec 2020 08:21:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B77C0AD8C;
 Tue,  1 Dec 2020 08:21:31 +0000 (UTC)
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
X-Inumbo-ID: ee50f3c3-d2f7-44ea-9920-1b24a7ede1b2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NBEIZ/iUOPwcq2uRt/bFtNmsh/ACI+DXq98XdmLhFc=;
	b=hdZaX9B1RgAYsdA+smYMrR7sOXU2D4lXiNtmBlqk9Mf5/VXLwUiDI6UiBOcH796x2QcFil
	t1XytGeNcSiE5W7plZ3w9C+bxO3dHz3P3d+3YMb8fO1odqhQj5UuS7/hw5XFkLjQ1rSv0V
	Gsjm0vREuLbyTM3rt3LfR7pYlUl2S40=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 04/17] xen/cpupool: switch cpupool id to unsigned
Date: Tue,  1 Dec 2020 09:21:15 +0100
Message-Id: <20201201082128.15239-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpupool id is an unsigned value in the public interface header, so
there is no reason why it is a signed value in struct cpupool.

Switch it to unsigned int.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/common/sched/core.c    |  2 +-
 xen/common/sched/cpupool.c | 48 +++++++++++++++++++-------------------
 xen/common/sched/private.h |  8 +++----
 xen/include/xen/sched.h    |  4 ++--
 4 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index f8c81592af..6063f6d9ea 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -757,7 +757,7 @@ void sched_destroy_vcpu(struct vcpu *v)
     }
 }
 
-int sched_init_domain(struct domain *d, int poolid)
+int sched_init_domain(struct domain *d, unsigned int poolid)
 {
     void *sdom;
     int ret;
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 84f326ea63..01fa71dd00 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -187,7 +187,7 @@ static struct cpupool *alloc_cpupool_struct(void)
  * the searched id is returned
  * returns NULL if not found.
  */
-static struct cpupool *__cpupool_find_by_id(int id, bool exact)
+static struct cpupool *__cpupool_find_by_id(unsigned int id, bool exact)
 {
     struct cpupool **q;
 
@@ -200,12 +200,12 @@ static struct cpupool *__cpupool_find_by_id(int id, bool exact)
     return (!exact || (*q == NULL) || ((*q)->cpupool_id == id)) ? *q : NULL;
 }
 
-static struct cpupool *cpupool_find_by_id(int poolid)
+static struct cpupool *cpupool_find_by_id(unsigned int poolid)
 {
     return __cpupool_find_by_id(poolid, true);
 }
 
-static struct cpupool *__cpupool_get_by_id(int poolid, bool exact)
+static struct cpupool *__cpupool_get_by_id(unsigned int poolid, bool exact)
 {
     struct cpupool *c;
     spin_lock(&cpupool_lock);
@@ -216,12 +216,12 @@ static struct cpupool *__cpupool_get_by_id(int poolid, bool exact)
     return c;
 }
 
-struct cpupool *cpupool_get_by_id(int poolid)
+struct cpupool *cpupool_get_by_id(unsigned int poolid)
 {
     return __cpupool_get_by_id(poolid, true);
 }
 
-static struct cpupool *cpupool_get_next_by_id(int poolid)
+static struct cpupool *cpupool_get_next_by_id(unsigned int poolid)
 {
     return __cpupool_get_by_id(poolid, false);
 }
@@ -243,11 +243,11 @@ void cpupool_put(struct cpupool *pool)
  * - unknown scheduler
  */
 static struct cpupool *cpupool_create(
-    int poolid, unsigned int sched_id, int *perr)
+    unsigned int poolid, unsigned int sched_id, int *perr)
 {
     struct cpupool *c;
     struct cpupool **q;
-    int last = 0;
+    unsigned int last = 0;
 
     *perr = -ENOMEM;
     if ( (c = alloc_cpupool_struct()) == NULL )
@@ -256,7 +256,7 @@ static struct cpupool *cpupool_create(
     /* One reference for caller, one reference for cpupool_destroy(). */
     atomic_set(&c->refcnt, 2);
 
-    debugtrace_printk("cpupool_create(pool=%d,sched=%u)\n", poolid, sched_id);
+    debugtrace_printk("cpupool_create(pool=%u,sched=%u)\n", poolid, sched_id);
 
     spin_lock(&cpupool_lock);
 
@@ -295,7 +295,7 @@ static struct cpupool *cpupool_create(
 
     spin_unlock(&cpupool_lock);
 
-    debugtrace_printk("Created cpupool %d with scheduler %s (%s)\n",
+    debugtrace_printk("Created cpupool %u with scheduler %s (%s)\n",
                       c->cpupool_id, c->sched->name, c->sched->opt_name);
 
     *perr = 0;
@@ -337,7 +337,7 @@ static int cpupool_destroy(struct cpupool *c)
 
     cpupool_put(c);
 
-    debugtrace_printk("cpupool_destroy(pool=%d)\n", c->cpupool_id);
+    debugtrace_printk("cpupool_destroy(pool=%u)\n", c->cpupool_id);
     return 0;
 }
 
@@ -521,7 +521,7 @@ static long cpupool_unassign_cpu_helper(void *info)
     struct cpupool *c = info;
     long ret;
 
-    debugtrace_printk("cpupool_unassign_cpu(pool=%d,cpu=%d)\n",
+    debugtrace_printk("cpupool_unassign_cpu(pool=%u,cpu=%d)\n",
                       cpupool_cpu_moving->cpupool_id, cpupool_moving_cpu);
     spin_lock(&cpupool_lock);
 
@@ -551,7 +551,7 @@ static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
     int ret;
     unsigned int master_cpu;
 
-    debugtrace_printk("cpupool_unassign_cpu(pool=%d,cpu=%d)\n",
+    debugtrace_printk("cpupool_unassign_cpu(pool=%u,cpu=%d)\n",
                       c->cpupool_id, cpu);
 
     if ( !cpu_online(cpu) )
@@ -561,7 +561,7 @@ static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
     ret = cpupool_unassign_cpu_start(c, master_cpu);
     if ( ret )
     {
-        debugtrace_printk("cpupool_unassign_cpu(pool=%d,cpu=%d) ret %d\n",
+        debugtrace_printk("cpupool_unassign_cpu(pool=%u,cpu=%d) ret %d\n",
                           c->cpupool_id, cpu, ret);
         return ret;
     }
@@ -582,7 +582,7 @@ static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
  * - pool does not exist
  * - no cpu assigned to pool
  */
-int cpupool_add_domain(struct domain *d, int poolid)
+int cpupool_add_domain(struct domain *d, unsigned int poolid)
 {
     struct cpupool *c;
     int rc;
@@ -604,7 +604,7 @@ int cpupool_add_domain(struct domain *d, int poolid)
         rc = 0;
     }
     spin_unlock(&cpupool_lock);
-    debugtrace_printk("cpupool_add_domain(dom=%d,pool=%d) n_dom %d rc %d\n",
+    debugtrace_printk("cpupool_add_domain(dom=%d,pool=%u) n_dom %d rc %d\n",
                       d->domain_id, poolid, n_dom, rc);
     return rc;
 }
@@ -614,7 +614,7 @@ int cpupool_add_domain(struct domain *d, int poolid)
  */
 void cpupool_rm_domain(struct domain *d)
 {
-    int cpupool_id;
+    unsigned int cpupool_id;
     int n_dom;
 
     if ( d->cpupool == NULL )
@@ -625,7 +625,7 @@ void cpupool_rm_domain(struct domain *d)
     n_dom = d->cpupool->n_dom;
     d->cpupool = NULL;
     spin_unlock(&cpupool_lock);
-    debugtrace_printk("cpupool_rm_domain(dom=%d,pool=%d) n_dom %d\n",
+    debugtrace_printk("cpupool_rm_domain(dom=%d,pool=%u) n_dom %d\n",
                       d->domain_id, cpupool_id, n_dom);
     return;
 }
@@ -767,7 +767,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
 
     case XEN_SYSCTL_CPUPOOL_OP_CREATE:
     {
-        int poolid;
+        unsigned int poolid;
 
         poolid = (op->cpupool_id == XEN_SYSCTL_CPUPOOL_PAR_ANY) ?
             CPUPOOLID_NONE: op->cpupool_id;
@@ -811,7 +811,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
         const cpumask_t *cpus;
 
         cpu = op->cpu;
-        debugtrace_printk("cpupool_assign_cpu(pool=%d,cpu=%d)\n",
+        debugtrace_printk("cpupool_assign_cpu(pool=%u,cpu=%u)\n",
                           op->cpupool_id, cpu);
 
         spin_lock(&cpupool_lock);
@@ -844,7 +844,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
 
     addcpu_out:
         spin_unlock(&cpupool_lock);
-        debugtrace_printk("cpupool_assign_cpu(pool=%d,cpu=%d) ret %d\n",
+        debugtrace_printk("cpupool_assign_cpu(pool=%u,cpu=%u) ret %d\n",
                           op->cpupool_id, cpu, ret);
 
     }
@@ -885,7 +885,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
             rcu_unlock_domain(d);
             break;
         }
-        debugtrace_printk("cpupool move_domain(dom=%d)->pool=%d\n",
+        debugtrace_printk("cpupool move_domain(dom=%d)->pool=%u\n",
                           d->domain_id, op->cpupool_id);
         ret = -ENOENT;
         spin_lock(&cpupool_lock);
@@ -895,7 +895,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
             ret = cpupool_move_domain_locked(d, c);
 
         spin_unlock(&cpupool_lock);
-        debugtrace_printk("cpupool move_domain(dom=%d)->pool=%d ret %d\n",
+        debugtrace_printk("cpupool move_domain(dom=%d)->pool=%u ret %d\n",
                           d->domain_id, op->cpupool_id, ret);
         rcu_unlock_domain(d);
     }
@@ -916,7 +916,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
     return ret;
 }
 
-int cpupool_get_id(const struct domain *d)
+unsigned int cpupool_get_id(const struct domain *d)
 {
     return d->cpupool ? d->cpupool->cpupool_id : CPUPOOLID_NONE;
 }
@@ -946,7 +946,7 @@ void dump_runq(unsigned char key)
 
     for_each_cpupool(c)
     {
-        printk("Cpupool %d:\n", (*c)->cpupool_id);
+        printk("Cpupool %u:\n", (*c)->cpupool_id);
         printk("Cpus: %*pbl\n", CPUMASK_PR((*c)->cpu_valid));
         sched_gran_print((*c)->gran, cpupool_get_granularity(*c));
         schedule_dump(*c);
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 685992cab9..e69d9be1e8 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -505,8 +505,8 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
 
 struct cpupool
 {
-    int              cpupool_id;
-#define CPUPOOLID_NONE    (-1)
+    unsigned int     cpupool_id;
+#define CPUPOOLID_NONE    (~0U)
     unsigned int     n_dom;
     cpumask_var_t    cpu_valid;      /* all cpus assigned to pool */
     cpumask_var_t    res_valid;      /* all scheduling resources of pool */
@@ -601,9 +601,9 @@ int cpu_disable_scheduler(unsigned int cpu);
 int schedule_cpu_add(unsigned int cpu, struct cpupool *c);
 int schedule_cpu_rm(unsigned int cpu);
 int sched_move_domain(struct domain *d, struct cpupool *c);
-struct cpupool *cpupool_get_by_id(int poolid);
+struct cpupool *cpupool_get_by_id(unsigned int poolid);
 void cpupool_put(struct cpupool *pool);
-int cpupool_add_domain(struct domain *d, int poolid);
+int cpupool_add_domain(struct domain *d, unsigned int poolid);
 void cpupool_rm_domain(struct domain *d);
 
 #endif /* __XEN_SCHED_IF_H__ */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index a345cc01f8..b2878e7b2a 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -691,7 +691,7 @@ void noreturn asm_domain_crash_synchronous(unsigned long addr);
 void scheduler_init(void);
 int  sched_init_vcpu(struct vcpu *v);
 void sched_destroy_vcpu(struct vcpu *v);
-int  sched_init_domain(struct domain *d, int poolid);
+int  sched_init_domain(struct domain *d, unsigned int poolid);
 void sched_destroy_domain(struct domain *d);
 long sched_adjust(struct domain *, struct xen_domctl_scheduler_op *);
 long sched_adjust_global(struct xen_sysctl_scheduler_op *);
@@ -1089,7 +1089,7 @@ static always_inline bool is_cpufreq_controller(const struct domain *d)
 
 int cpupool_move_domain(struct domain *d, struct cpupool *c);
 int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
-int cpupool_get_id(const struct domain *d);
+unsigned int cpupool_get_id(const struct domain *d);
 const cpumask_t *cpupool_valid_cpus(const struct cpupool *pool);
 extern void dump_runq(unsigned char key);
 
-- 
2.26.2


