Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CDB7BE2A3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 16:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614394.955430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qprAN-0000n5-Kn; Mon, 09 Oct 2023 14:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614394.955430; Mon, 09 Oct 2023 14:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qprAN-0000jj-Gn; Mon, 09 Oct 2023 14:23:27 +0000
Received: by outflank-mailman (input) for mailman id 614394;
 Mon, 09 Oct 2023 14:23:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXv8=FX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qprAL-0000jd-ML
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 14:23:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 662f4008-66af-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 16:23:22 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.82.74])
 by support.bugseng.com (Postfix) with ESMTPSA id 2EBA54EE0740;
 Mon,  9 Oct 2023 16:23:20 +0200 (CEST)
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
X-Inumbo-ID: 662f4008-66af-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH v2] xen/sched: address violations of MISRA C:2012 Rule 8.2
Date: Mon,  9 Oct 2023 16:23:13 +0200
Message-Id: <033b6f5f10e17409650dc438b22a0f0e0d5918a7.1696598833.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- added parameter names in accordance with schedulers in xen/common/sched/*;
- improved comment format.
---
 xen/common/sched/private.h | 99 ++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 46 deletions(-)

diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index c516976c37..79e3f56c5a 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -37,10 +37,11 @@ enum sched_gran {
  * locks.  The generic schedule init code will point each schedule lock
  * pointer to the schedule lock; if the scheduler wants to remap them,
  * it can simply modify the schedule locks.
- * 
+ *
  * For cache betterness, keep the actual lock in the same cache area
  * as the rest of the struct.  Just have the scheduler point to the
- * one it wants (This may be the one right in front of it).*/
+ * one it wants (This may be the one right in front of it).
+ */
 struct sched_resource {
     struct scheduler   *scheduler;
     struct cpupool     *cpupool;
@@ -280,59 +281,65 @@ struct scheduler {
 
     int          (*global_init)    (void);
 
-    int          (*init)           (struct scheduler *);
-    void         (*deinit)         (struct scheduler *);
+    int          (*init)           (struct scheduler *ops);
+    void         (*deinit)         (struct scheduler *ops);
+
+    void         (*free_udata)     (const struct scheduler *ops, void *priv);
+    void *       (*alloc_udata)    (const struct scheduler *ops,
+                                    struct sched_unit *unit, void *dd);
 
-    void         (*free_udata)     (const struct scheduler *, void *);
-    void *       (*alloc_udata)    (const struct scheduler *,
-                                    struct sched_unit *, void *);
-    void         (*free_pdata)     (const struct scheduler *, void *, int);
-    void *       (*alloc_pdata)    (const struct scheduler *, int);
-    void         (*deinit_pdata)   (const struct scheduler *, void *, int);
+    void         (*free_pdata)     (const struct scheduler *ops,
+                                    void *pcpu, int cpu);
+    void *       (*alloc_pdata)    (const struct scheduler *ops, int cpu);
+    void         (*deinit_pdata)   (const struct scheduler *ops,
+                                    void *pcpu, int cpu);
 
     /* Returns ERR_PTR(-err) for error, NULL for 'nothing needed'. */
-    void *       (*alloc_domdata)  (const struct scheduler *, struct domain *);
+    void *       (*alloc_domdata)  (const struct scheduler *ops,
+                                    struct domain *dom);
     /* Idempotent. */
-    void         (*free_domdata)   (const struct scheduler *, void *);
+    void         (*free_domdata)   (const struct scheduler *ops, void *data);
 
-    spinlock_t * (*switch_sched)   (struct scheduler *, unsigned int,
-                                    void *, void *);
+    spinlock_t * (*switch_sched)   (struct scheduler *new_ops, unsigned int cpu,
+                                    void *pdata, void *vdata);
 
     /* Activate / deactivate units in a cpu pool */
-    void         (*insert_unit)    (const struct scheduler *,
-                                    struct sched_unit *);
-    void         (*remove_unit)    (const struct scheduler *,
-                                    struct sched_unit *);
-
-    void         (*sleep)          (const struct scheduler *,
-                                    struct sched_unit *);
-    void         (*wake)           (const struct scheduler *,
-                                    struct sched_unit *);
-    void         (*yield)          (const struct scheduler *,
-                                    struct sched_unit *);
-    void         (*context_saved)  (const struct scheduler *,
-                                    struct sched_unit *);
-
-    void         (*do_schedule)    (const struct scheduler *,
-                                    struct sched_unit *, s_time_t,
+    void         (*insert_unit)    (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+    void         (*remove_unit)    (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+
+    void         (*sleep)          (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+    void         (*wake)           (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+    void         (*yield)          (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+    void         (*context_saved)  (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+
+    void         (*do_schedule)    (const struct scheduler *ops,
+                                    struct sched_unit *currunit, s_time_t now,
                                     bool tasklet_work_scheduled);
 
-    struct sched_resource *(*pick_resource)(const struct scheduler *,
-                                            const struct sched_unit *);
-    void         (*migrate)        (const struct scheduler *,
-                                    struct sched_unit *, unsigned int);
-    int          (*adjust)         (const struct scheduler *, struct domain *,
-                                    struct xen_domctl_scheduler_op *);
-    void         (*adjust_affinity)(const struct scheduler *,
-                                    struct sched_unit *,
-                                    const struct cpumask *,
-                                    const struct cpumask *);
-    int          (*adjust_global)  (const struct scheduler *,
-                                    struct xen_sysctl_scheduler_op *);
-    void         (*dump_settings)  (const struct scheduler *);
-    void         (*dump_cpu_state) (const struct scheduler *, int);
-    void         (*move_timers)    (const struct scheduler *,
-                                    struct sched_resource *);
+    struct sched_resource *(*pick_resource)(const struct scheduler *ops,
+                                            const struct sched_unit *unit);
+    void         (*migrate)        (const struct scheduler *ops,
+                                    struct sched_unit *unit,
+                                    unsigned int new_cpu);
+    int          (*adjust)         (const struct scheduler *ops,
+                                    struct domain *d,
+                                    struct xen_domctl_scheduler_op *op);
+    void         (*adjust_affinity)(const struct scheduler *ops,
+                                    struct sched_unit *unit,
+                                    const struct cpumask *hard,
+                                    const struct cpumask *soft);
+    int          (*adjust_global)  (const struct scheduler *ops,
+                                    struct xen_sysctl_scheduler_op *sc);
+    void         (*dump_settings)  (const struct scheduler *ops);
+    void         (*dump_cpu_state) (const struct scheduler *ops, int cpu);
+    void         (*move_timers)    (const struct scheduler *ops,
+                                    struct sched_resource *sr);
 };
 
 static inline int sched_init(struct scheduler *s)
-- 
2.34.1


