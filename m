Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA54D4FF9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:11:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288506.489259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMJB-0002b8-JW; Thu, 10 Mar 2022 17:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288506.489259; Thu, 10 Mar 2022 17:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMJB-0002YH-ET; Thu, 10 Mar 2022 17:10:37 +0000
Received: by outflank-mailman (input) for mailman id 288506;
 Thu, 10 Mar 2022 17:10:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/tR=TV=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nSMJ9-0001pg-K0
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:10:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f742fbd5-a094-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 18:10:20 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4EB71692;
 Thu, 10 Mar 2022 09:10:32 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B42F73F99C;
 Thu, 10 Mar 2022 09:10:31 -0800 (PST)
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
X-Inumbo-ID: f742fbd5-a094-11ec-853a-5f4723681683
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/6] xen/sched: retrieve scheduler id by name
Date: Thu, 10 Mar 2022 17:10:16 +0000
Message-Id: <20220310171019.6170-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310171019.6170-1-luca.fancellu@arm.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>

Add a static function to retrieve the scheduler pointer using the
scheduler name.

Add a public function to retrieve the scheduler id by the scheduler
name that makes use of the new static function.

Take the occasion to replace open coded scheduler search with the
new static function in scheduler_init.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v2:
- replace open coded scheduler search in scheduler_init (Juergen)
---
 xen/common/sched/core.c | 40 ++++++++++++++++++++++++++--------------
 xen/include/xen/sched.h | 11 +++++++++++
 2 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 19ab67818106..48ee01420fb8 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2947,10 +2947,30 @@ void scheduler_enable(void)
     scheduler_active = true;
 }
 
+static inline
+const struct scheduler *__init sched_get_by_name(const char *sched_name)
+{
+    unsigned int i;
+
+    for ( i = 0; i < NUM_SCHEDULERS; i++ )
+        if ( schedulers[i] && !strcmp(schedulers[i]->opt_name, sched_name) )
+            return schedulers[i];
+
+    return NULL;
+}
+
+int __init sched_get_id_by_name(const char *sched_name)
+{
+    const struct scheduler *scheduler = sched_get_by_name(sched_name);
+
+    return scheduler ? scheduler->sched_id : -1;
+}
+
 /* Initialise the data structures. */
 void __init scheduler_init(void)
 {
     struct domain *idle_domain;
+    const struct scheduler *scheduler;
     int i;
 
     scheduler_enable();
@@ -2981,25 +3001,17 @@ void __init scheduler_init(void)
                    schedulers[i]->opt_name);
             schedulers[i] = NULL;
         }
-
-        if ( schedulers[i] && !ops.name &&
-             !strcmp(schedulers[i]->opt_name, opt_sched) )
-            ops = *schedulers[i];
     }
 
-    if ( !ops.name )
+    scheduler = sched_get_by_name(opt_sched);
+    if ( !scheduler )
     {
         printk("Could not find scheduler: %s\n", opt_sched);
-        for ( i = 0; i < NUM_SCHEDULERS; i++ )
-            if ( schedulers[i] &&
-                 !strcmp(schedulers[i]->opt_name, CONFIG_SCHED_DEFAULT) )
-            {
-                ops = *schedulers[i];
-                break;
-            }
-        BUG_ON(!ops.name);
-        printk("Using '%s' (%s)\n", ops.name, ops.opt_name);
+        scheduler = sched_get_by_name(CONFIG_SCHED_DEFAULT);
+        BUG_ON(!scheduler);
+        printk("Using '%s' (%s)\n", scheduler->name, scheduler->opt_name);
     }
+    ops = *scheduler;
 
     if ( cpu_schedule_up(0) )
         BUG();
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 47fc856e0fe0..2c10303f0187 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -756,6 +756,17 @@ void sched_destroy_domain(struct domain *d);
 long sched_adjust(struct domain *, struct xen_domctl_scheduler_op *);
 long sched_adjust_global(struct xen_sysctl_scheduler_op *);
 int  sched_id(void);
+
+/*
+ * sched_get_id_by_name - retrieves a scheduler id given a scheduler name
+ * @sched_name: scheduler name as a string
+ *
+ * returns:
+ *     positive value being the scheduler id, on success
+ *     negative value if the scheduler name is not found.
+ */
+int sched_get_id_by_name(const char *sched_name);
+
 void vcpu_wake(struct vcpu *v);
 long vcpu_yield(void);
 void vcpu_sleep_nosync(struct vcpu *v);
-- 
2.17.1


