Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B64F2944
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 10:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298619.508762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbf0g-0005kq-Di; Tue, 05 Apr 2022 08:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298619.508762; Tue, 05 Apr 2022 08:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbf0g-0005Zu-7z; Tue, 05 Apr 2022 08:57:58 +0000
Received: by outflank-mailman (input) for mailman id 298619;
 Tue, 05 Apr 2022 08:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUJf=UP=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nbf0f-0005F2-1s
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 08:57:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 78a930de-b4be-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 10:57:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F943D6E;
 Tue,  5 Apr 2022 01:57:55 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21CFF3F73B;
 Tue,  5 Apr 2022 01:57:54 -0700 (PDT)
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
X-Inumbo-ID: 78a930de-b4be-11ec-8fbc-03012f2f19d4
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 3/6] xen/sched: retrieve scheduler id by name
Date: Tue,  5 Apr 2022 09:57:38 +0100
Message-Id: <20220405085741.18336-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220405085741.18336-1-luca.fancellu@arm.com>
References: <20220405085741.18336-1-luca.fancellu@arm.com>

Add a static function to retrieve the scheduler pointer using the
scheduler name.

Add a public function to retrieve the scheduler id by the scheduler
name that makes use of the new static function.

Take the occasion to replace open coded scheduler search with the
new static function in scheduler_init.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
Changes in v5:
- no changes
Changes in v4:
- no changes
Changes in v3:
- add R-by
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
index b07717987434..b527f141a1d3 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -758,6 +758,17 @@ void sched_destroy_domain(struct domain *d);
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


