Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9224D4FF8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:11:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288509.489291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMJF-0003XB-Ue; Thu, 10 Mar 2022 17:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288509.489291; Thu, 10 Mar 2022 17:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMJF-0003Rn-Ns; Thu, 10 Mar 2022 17:10:41 +0000
Received: by outflank-mailman (input) for mailman id 288509;
 Thu, 10 Mar 2022 17:10:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/tR=TV=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nSMJD-0001lh-M3
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:10:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 01db4491-a095-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 18:10:38 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D93E716A3;
 Thu, 10 Mar 2022 09:10:37 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DDC13F99C;
 Thu, 10 Mar 2022 09:10:36 -0800 (PST)
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
X-Inumbo-ID: 01db4491-a095-11ec-8eba-a37418f5ba1a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v2 6/6] xen/cpupool: Allow cpupool0 to use different scheduler
Date: Thu, 10 Mar 2022 17:10:19 +0000
Message-Id: <20220310171019.6170-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310171019.6170-1-luca.fancellu@arm.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>

Currently cpupool0 can use only the default scheduler, and
cpupool_create has an harcoded behavior when creating the pool 0
that doesn't allocate new memory for the scheduler, but uses the
default scheduler structure in memory.

With this commit it is possible to allocate a different scheduler for
the cpupool0 when using the boot time cpupool.
To achieve this the hardcoded behavior in cpupool_create is removed
and the cpupool0 creation is moved.

When compiling without boot time cpupools enabled, the current
behavior is maintained (except that cpupool0 scheduler memory will be
allocated).

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v2:
- new patch
---
 xen/common/boot_cpupools.c | 39 ++++++++++++++++++--------------------
 xen/common/sched/cpupool.c |  8 +-------
 xen/include/xen/sched.h    |  5 ++++-
 3 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/xen/common/boot_cpupools.c b/xen/common/boot_cpupools.c
index 01a69f894f14..a8ae8c5b7852 100644
--- a/xen/common/boot_cpupools.c
+++ b/xen/common/boot_cpupools.c
@@ -189,31 +189,28 @@ void __init btcpupools_allocate_pools(const cpumask_t *cpu_online_map)
     {
         struct cpupool *pool = NULL;
         int pool_id, sched_id;
+        unsigned int i;
 
         pool_id = pool_cpu_map[cpu_num].pool_id;
         sched_id = pool_cpu_map[cpu_num].sched_id;
 
-        if ( pool_id )
-        {
-            unsigned int i;
-
-            /* Look for previously created pool with id pool_id */
-            for ( i = 0; i < cpu_num; i++ )
-                if ( (pool_cpu_map[i].pool_id == pool_id) &&
-                     pool_cpu_map[i].pool )
-                {
-                    pool = pool_cpu_map[i].pool;
-                    break;
-                }
-
-            /* If no pool was created before, create it */
-            if ( !pool )
-                pool = cpupool_create_pool(pool_id, sched_id);
-            if ( !pool )
-                panic("Error creating pool id %u!\n", pool_id);
-        }
-        else
-            pool = cpupool0;
+        /* Look for previously created pool with id pool_id */
+        for ( i = 0; i < cpu_num; i++ )
+            if ( (pool_cpu_map[i].pool_id == pool_id) && pool_cpu_map[i].pool )
+            {
+                pool = pool_cpu_map[i].pool;
+                break;
+            }
+
+        /* If no pool was created before, create it */
+        if ( !pool )
+            pool = cpupool_create_pool(pool_id, sched_id);
+        if ( !pool )
+            panic("Error creating pool id %u!\n", pool_id);
+
+        /* Keep track of cpupool id 0 with the global cpupool0 */
+        if ( !pool_id )
+            cpupool0 = pool;
 
         pool_cpu_map[cpu_num].pool = pool;
         printk(XENLOG_INFO "Logical CPU %u in Pool-%u.\n", cpu_num, pool_id);
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index b2495ad6d03e..3d458a4932b2 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -312,10 +312,7 @@ static struct cpupool *cpupool_create(unsigned int poolid,
         c->cpupool_id = q->cpupool_id + 1;
     }
 
-    if ( poolid == 0 )
-        c->sched = scheduler_get_default();
-    else
-        c->sched = scheduler_alloc(sched_id);
+    c->sched = scheduler_alloc(sched_id);
     if ( IS_ERR(c->sched) )
     {
         ret = PTR_ERR(c->sched);
@@ -1242,9 +1239,6 @@ static int __init cf_check cpupool_init(void)
 
     cpupool_hypfs_init();
 
-    cpupool0 = cpupool_create(0, 0);
-    BUG_ON(IS_ERR(cpupool0));
-    cpupool_put(cpupool0);
     register_cpu_notifier(&cpu_nfb);
 
     btcpupools_dtb_parse();
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 30a6538452bc..4007a3df4c1c 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1188,7 +1188,10 @@ static inline void btcpupools_dtb_parse(void) {}
 #endif
 
 #else
-static inline void btcpupools_allocate_pools(const cpumask_t *cpu_online_map) {}
+static inline void btcpupools_allocate_pools(const cpumask_t *cpu_online_map)
+{
+    cpupool0 = cpupool_create_pool(0, -1);
+}
 static inline void btcpupools_dtb_parse(void) {}
 static inline struct cpupool *btcpupools_get_cpupool(unsigned int cpu)
 {
-- 
2.17.1


