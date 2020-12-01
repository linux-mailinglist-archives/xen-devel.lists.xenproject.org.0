Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3A92C990B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:21:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41630.74995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0v0-0004wk-DI; Tue, 01 Dec 2020 08:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41630.74995; Tue, 01 Dec 2020 08:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0v0-0004uW-2U; Tue, 01 Dec 2020 08:21:50 +0000
Received: by outflank-mailman (input) for mailman id 41630;
 Tue, 01 Dec 2020 08:21:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0ux-0004Uj-JC
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:21:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4e9ee5b-0ccc-45a7-ab93-42acbd9a5809;
 Tue, 01 Dec 2020 08:21:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6DE7ADA2;
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
X-Inumbo-ID: d4e9ee5b-0ccc-45a7-ab93-42acbd9a5809
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mU9Pbrvb5/SbczGpyv+43AFg9f7JL1E6nM4w4+Kc8Ys=;
	b=ILvsAfc3DQfxMeBh7/UeyY7thcPBDBnKKQx/m85uM/6vnUDiWbyPot23PoNk501NzKpZEM
	KKYg3q5EdesuiQhDwclZrDFL62v2x8JPBIqUHpyfsi2HGSgabmKh+LC1RrVB5LNMxo5k/E
	vbgd9p2QtYA+jDJDCKCnQ77jyX/Ezns=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 05/17] xen/cpupool: switch cpupool list to normal list interface
Date: Tue,  1 Dec 2020 09:21:16 +0100
Message-Id: <20201201082128.15239-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of open coding something like a linked list just use the
available functionality from list.h.

The allocation of a new cpupool id is not aware of a possible wrap.
Fix that.

While adding the required new include to private.h sort the includes.

Signed-off-by: From: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/cpupool.c | 100 ++++++++++++++++++++-----------------
 xen/common/sched/private.h |   4 +-
 2 files changed, 57 insertions(+), 47 deletions(-)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 01fa71dd00..714cd47ae9 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -16,6 +16,7 @@
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
+#include <xen/list.h>
 #include <xen/param.h>
 #include <xen/percpu.h>
 #include <xen/sched.h>
@@ -23,13 +24,10 @@
 
 #include "private.h"
 
-#define for_each_cpupool(ptr)    \
-    for ((ptr) = &cpupool_list; *(ptr) != NULL; (ptr) = &((*(ptr))->next))
-
 struct cpupool *cpupool0;                /* Initial cpupool with Dom0 */
 cpumask_t cpupool_free_cpus;             /* cpus not in any cpupool */
 
-static struct cpupool *cpupool_list;     /* linked list, sorted by poolid */
+static LIST_HEAD(cpupool_list);          /* linked list, sorted by poolid */
 
 static int cpupool_moving_cpu = -1;
 static struct cpupool *cpupool_cpu_moving = NULL;
@@ -189,15 +187,15 @@ static struct cpupool *alloc_cpupool_struct(void)
  */
 static struct cpupool *__cpupool_find_by_id(unsigned int id, bool exact)
 {
-    struct cpupool **q;
+    struct cpupool *q;
 
     ASSERT(spin_is_locked(&cpupool_lock));
 
-    for_each_cpupool(q)
-        if ( (*q)->cpupool_id >= id )
-            break;
+    list_for_each_entry(q, &cpupool_list, list)
+        if ( q->cpupool_id == id || (!exact && q->cpupool_id > id) )
+            return q;
 
-    return (!exact || (*q == NULL) || ((*q)->cpupool_id == id)) ? *q : NULL;
+    return NULL;
 }
 
 static struct cpupool *cpupool_find_by_id(unsigned int poolid)
@@ -246,8 +244,7 @@ static struct cpupool *cpupool_create(
     unsigned int poolid, unsigned int sched_id, int *perr)
 {
     struct cpupool *c;
-    struct cpupool **q;
-    unsigned int last = 0;
+    struct cpupool *q;
 
     *perr = -ENOMEM;
     if ( (c = alloc_cpupool_struct()) == NULL )
@@ -260,23 +257,42 @@ static struct cpupool *cpupool_create(
 
     spin_lock(&cpupool_lock);
 
-    for_each_cpupool(q)
+    if ( poolid != CPUPOOLID_NONE )
     {
-        last = (*q)->cpupool_id;
-        if ( (poolid != CPUPOOLID_NONE) && (last >= poolid) )
-            break;
+        q = __cpupool_find_by_id(poolid, false);
+        if ( !q )
+            list_add_tail(&c->list, &cpupool_list);
+        else
+        {
+            list_add_tail(&c->list, &q->list);
+            if ( q->cpupool_id == poolid )
+            {
+                *perr = -EEXIST;
+                goto err;
+            }
+        }
+
+        c->cpupool_id = poolid;
     }
-    if ( *q != NULL )
+    else
     {
-        if ( (*q)->cpupool_id == poolid )
+        /* Cpupool 0 is created with specified id at boot and never removed. */
+        ASSERT(!list_empty(&cpupool_list));
+
+        q = list_last_entry(&cpupool_list, struct cpupool, list);
+        /* In case of wrap search for first free id. */
+        if ( q->cpupool_id == CPUPOOLID_NONE - 1 )
         {
-            *perr = -EEXIST;
-            goto err;
+            list_for_each_entry(q, &cpupool_list, list)
+                if ( q->cpupool_id + 1 != list_next_entry(q, list)->cpupool_id )
+                    break;
         }
-        c->next = *q;
+
+        list_add(&c->list, &q->list);
+
+        c->cpupool_id = q->cpupool_id + 1;
     }
 
-    c->cpupool_id = (poolid == CPUPOOLID_NONE) ? (last + 1) : poolid;
     if ( poolid == 0 )
     {
         c->sched = scheduler_get_default();
@@ -291,8 +307,6 @@ static struct cpupool *cpupool_create(
     c->gran = opt_sched_granularity;
     c->sched_gran = sched_granularity;
 
-    *q = c;
-
     spin_unlock(&cpupool_lock);
 
     debugtrace_printk("Created cpupool %u with scheduler %s (%s)\n",
@@ -302,6 +316,8 @@ static struct cpupool *cpupool_create(
     return c;
 
  err:
+    list_del(&c->list);
+
     spin_unlock(&cpupool_lock);
     free_cpupool_struct(c);
     return NULL;
@@ -312,27 +328,19 @@ static struct cpupool *cpupool_create(
  * possible failures:
  * - pool still in use
  * - cpus still assigned to pool
- * - pool not in list
  */
 static int cpupool_destroy(struct cpupool *c)
 {
-    struct cpupool **q;
-
     spin_lock(&cpupool_lock);
-    for_each_cpupool(q)
-        if ( *q == c )
-            break;
-    if ( *q != c )
-    {
-        spin_unlock(&cpupool_lock);
-        return -ENOENT;
-    }
+
     if ( (c->n_dom != 0) || cpumask_weight(c->cpu_valid) )
     {
         spin_unlock(&cpupool_lock);
         return -EBUSY;
     }
-    *q = c->next;
+
+    list_del(&c->list);
+
     spin_unlock(&cpupool_lock);
 
     cpupool_put(c);
@@ -732,17 +740,17 @@ static int cpupool_cpu_remove_prologue(unsigned int cpu)
  */
 static void cpupool_cpu_remove_forced(unsigned int cpu)
 {
-    struct cpupool **c;
+    struct cpupool *c;
     int ret;
     unsigned int master_cpu = sched_get_resource_cpu(cpu);
 
-    for_each_cpupool ( c )
+    list_for_each_entry(c, &cpupool_list, list)
     {
-        if ( cpumask_test_cpu(master_cpu, (*c)->cpu_valid) )
+        if ( cpumask_test_cpu(master_cpu, c->cpu_valid) )
         {
-            ret = cpupool_unassign_cpu_start(*c, master_cpu);
+            ret = cpupool_unassign_cpu_start(c, master_cpu);
             BUG_ON(ret);
-            ret = cpupool_unassign_cpu_finish(*c);
+            ret = cpupool_unassign_cpu_finish(c);
             BUG_ON(ret);
         }
     }
@@ -929,7 +937,7 @@ const cpumask_t *cpupool_valid_cpus(const struct cpupool *pool)
 void dump_runq(unsigned char key)
 {
     s_time_t         now = NOW();
-    struct cpupool **c;
+    struct cpupool *c;
 
     spin_lock(&cpupool_lock);
 
@@ -944,12 +952,12 @@ void dump_runq(unsigned char key)
         schedule_dump(NULL);
     }
 
-    for_each_cpupool(c)
+    list_for_each_entry(c, &cpupool_list, list)
     {
-        printk("Cpupool %u:\n", (*c)->cpupool_id);
-        printk("Cpus: %*pbl\n", CPUMASK_PR((*c)->cpu_valid));
-        sched_gran_print((*c)->gran, cpupool_get_granularity(*c));
-        schedule_dump(*c);
+        printk("Cpupool %u:\n", c->cpupool_id);
+        printk("Cpus: %*pbl\n", CPUMASK_PR(c->cpu_valid));
+        sched_gran_print(c->gran, cpupool_get_granularity(c));
+        schedule_dump(c);
     }
 
     spin_unlock(&cpupool_lock);
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index e69d9be1e8..6953cefa6e 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -8,8 +8,9 @@
 #ifndef __XEN_SCHED_IF_H__
 #define __XEN_SCHED_IF_H__
 
-#include <xen/percpu.h>
 #include <xen/err.h>
+#include <xen/list.h>
+#include <xen/percpu.h>
 #include <xen/rcupdate.h>
 
 /* cpus currently in no cpupool */
@@ -510,6 +511,7 @@ struct cpupool
     unsigned int     n_dom;
     cpumask_var_t    cpu_valid;      /* all cpus assigned to pool */
     cpumask_var_t    res_valid;      /* all scheduling resources of pool */
+    struct list_head list;
     struct cpupool   *next;
     struct scheduler *sched;
     atomic_t         refcnt;
-- 
2.26.2


