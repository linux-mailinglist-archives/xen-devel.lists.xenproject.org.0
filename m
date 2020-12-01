Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403E32C990D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41629.74986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0uz-0004ua-N0; Tue, 01 Dec 2020 08:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41629.74986; Tue, 01 Dec 2020 08:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0uz-0004tT-CG; Tue, 01 Dec 2020 08:21:49 +0000
Received: by outflank-mailman (input) for mailman id 41629;
 Tue, 01 Dec 2020 08:21:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0ux-0004VK-5f
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:21:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47543d46-c993-4e43-b9b2-580602c148f4;
 Tue, 01 Dec 2020 08:21:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08B27ADB3;
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
X-Inumbo-ID: 47543d46-c993-4e43-b9b2-580602c148f4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GDlThUHp1khXcMw14yFbWzJcy5msoaFCmMjGVwghDTw=;
	b=RIPBYEVfMZ0L6sdH0/scPIO3SUWJ8lAPqqmZDol9/cWCRirYglJ1FgSX3NSmO3Nu5pX/Lq
	4WFVSznlXIbgXjQ2yZ9id3JAVFzKg0DdKbWCHcvMaUAB8PRGhVyc3eV/Rwol412BKcfIOD
	ikPqSQ/8m2KDtAfgCoLyP1ZQYOA4A+U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v2 06/17] xen/cpupool: use ERR_PTR() for returning error cause from cpupool_create()
Date: Tue,  1 Dec 2020 09:21:17 +0100
Message-Id: <20201201082128.15239-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of a pointer to an error variable as parameter just use
ERR_PTR() to return the cause of an error in cpupool_create().

This propagates to scheduler_alloc(), too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/common/sched/core.c    | 13 ++++++-------
 xen/common/sched/cpupool.c | 38 ++++++++++++++++++++------------------
 xen/common/sched/private.h |  2 +-
 3 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 6063f6d9ea..a429fc7640 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3233,26 +3233,25 @@ struct scheduler *scheduler_get_default(void)
     return &ops;
 }
 
-struct scheduler *scheduler_alloc(unsigned int sched_id, int *perr)
+struct scheduler *scheduler_alloc(unsigned int sched_id)
 {
     int i;
+    int ret;
     struct scheduler *sched;
 
     for ( i = 0; i < NUM_SCHEDULERS; i++ )
         if ( schedulers[i] && schedulers[i]->sched_id == sched_id )
             goto found;
-    *perr = -ENOENT;
-    return NULL;
+    return ERR_PTR(-ENOENT);
 
  found:
-    *perr = -ENOMEM;
     if ( (sched = xmalloc(struct scheduler)) == NULL )
-        return NULL;
+        return ERR_PTR(-ENOMEM);
     memcpy(sched, schedulers[i], sizeof(*sched));
-    if ( (*perr = sched_init(sched)) != 0 )
+    if ( (ret = sched_init(sched)) != 0 )
     {
         xfree(sched);
-        sched = NULL;
+        sched = ERR_PTR(ret);
     }
 
     return sched;
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 714cd47ae9..0db7d77219 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -240,15 +240,15 @@ void cpupool_put(struct cpupool *pool)
  * - poolid already used
  * - unknown scheduler
  */
-static struct cpupool *cpupool_create(
-    unsigned int poolid, unsigned int sched_id, int *perr)
+static struct cpupool *cpupool_create(unsigned int poolid,
+                                      unsigned int sched_id)
 {
     struct cpupool *c;
     struct cpupool *q;
+    int ret;
 
-    *perr = -ENOMEM;
     if ( (c = alloc_cpupool_struct()) == NULL )
-        return NULL;
+        return ERR_PTR(-ENOMEM);
 
     /* One reference for caller, one reference for cpupool_destroy(). */
     atomic_set(&c->refcnt, 2);
@@ -267,7 +267,7 @@ static struct cpupool *cpupool_create(
             list_add_tail(&c->list, &q->list);
             if ( q->cpupool_id == poolid )
             {
-                *perr = -EEXIST;
+                ret = -EEXIST;
                 goto err;
             }
         }
@@ -294,15 +294,15 @@ static struct cpupool *cpupool_create(
     }
 
     if ( poolid == 0 )
-    {
         c->sched = scheduler_get_default();
-    }
     else
+        c->sched = scheduler_alloc(sched_id);
+    if ( IS_ERR(c->sched) )
     {
-        c->sched = scheduler_alloc(sched_id, perr);
-        if ( c->sched == NULL )
-            goto err;
+        ret = PTR_ERR(c->sched);
+        goto err;
     }
+
     c->sched->cpupool = c;
     c->gran = opt_sched_granularity;
     c->sched_gran = sched_granularity;
@@ -312,15 +312,16 @@ static struct cpupool *cpupool_create(
     debugtrace_printk("Created cpupool %u with scheduler %s (%s)\n",
                       c->cpupool_id, c->sched->name, c->sched->opt_name);
 
-    *perr = 0;
     return c;
 
  err:
     list_del(&c->list);
 
     spin_unlock(&cpupool_lock);
+
     free_cpupool_struct(c);
-    return NULL;
+
+    return ERR_PTR(ret);
 }
 /*
  * destroys the given cpupool
@@ -767,7 +768,7 @@ static void cpupool_cpu_remove_forced(unsigned int cpu)
  */
 int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
 {
-    int ret;
+    int ret = 0;
     struct cpupool *c;
 
     switch ( op->op )
@@ -779,8 +780,10 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
 
         poolid = (op->cpupool_id == XEN_SYSCTL_CPUPOOL_PAR_ANY) ?
             CPUPOOLID_NONE: op->cpupool_id;
-        c = cpupool_create(poolid, op->sched_id, &ret);
-        if ( c != NULL )
+        c = cpupool_create(poolid, op->sched_id);
+        if ( IS_ERR(c) )
+            ret = PTR_ERR(c);
+        else
         {
             op->cpupool_id = c->cpupool_id;
             cpupool_put(c);
@@ -1003,12 +1006,11 @@ static struct notifier_block cpu_nfb = {
 static int __init cpupool_init(void)
 {
     unsigned int cpu;
-    int err;
 
     cpupool_gran_init();
 
-    cpupool0 = cpupool_create(0, 0, &err);
-    BUG_ON(cpupool0 == NULL);
+    cpupool0 = cpupool_create(0, 0);
+    BUG_ON(IS_ERR(cpupool0));
     cpupool_put(cpupool0);
     register_cpu_notifier(&cpu_nfb);
 
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 6953cefa6e..92d0d49610 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -597,7 +597,7 @@ void sched_rm_cpu(unsigned int cpu);
 const cpumask_t *sched_get_opt_cpumask(enum sched_gran opt, unsigned int cpu);
 void schedule_dump(struct cpupool *c);
 struct scheduler *scheduler_get_default(void);
-struct scheduler *scheduler_alloc(unsigned int sched_id, int *perr);
+struct scheduler *scheduler_alloc(unsigned int sched_id);
 void scheduler_free(struct scheduler *sched);
 int cpu_disable_scheduler(unsigned int cpu);
 int schedule_cpu_add(unsigned int cpu, struct cpupool *c);
-- 
2.26.2


