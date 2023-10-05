Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCE7B9C20
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 11:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612922.953106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoKco-00070x-NC; Thu, 05 Oct 2023 09:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612922.953106; Thu, 05 Oct 2023 09:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoKco-0006z3-KK; Thu, 05 Oct 2023 09:26:30 +0000
Received: by outflank-mailman (input) for mailman id 612922;
 Thu, 05 Oct 2023 09:26:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l68Z=FT=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qoKcn-0006ys-0u
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 09:26:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 421abcde-6361-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 11:26:26 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-11-204-216.retail.telecomitalia.it [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id 437544EE0737;
 Thu,  5 Oct 2023 11:26:26 +0200 (CEST)
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
X-Inumbo-ID: 421abcde-6361-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH] xen/sched: address violations of MISRA C:2012 Rule 8.2
Date: Thu,  5 Oct 2023 11:26:20 +0200
Message-Id: <142049155775072b2a43eb2f052ffd0ab322867e.1696497380.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/sched/private.h | 93 ++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 44 deletions(-)

diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index c516976c37..68de469537 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -280,59 +280,64 @@ struct scheduler {
 
     int          (*global_init)    (void);
 
-    int          (*init)           (struct scheduler *);
-    void         (*deinit)         (struct scheduler *);
+    int          (*init)           (struct scheduler *s);
+    void         (*deinit)         (struct scheduler *s);
 
-    void         (*free_udata)     (const struct scheduler *, void *);
-    void *       (*alloc_udata)    (const struct scheduler *,
-                                    struct sched_unit *, void *);
-    void         (*free_pdata)     (const struct scheduler *, void *, int);
-    void *       (*alloc_pdata)    (const struct scheduler *, int);
-    void         (*deinit_pdata)   (const struct scheduler *, void *, int);
+    void         (*free_udata)     (const struct scheduler *s, void *data);
+    void *       (*alloc_udata)    (const struct scheduler *s,
+                                    struct sched_unit *unit, void *data);
+
+    void         (*free_pdata)     (const struct scheduler *s,
+                                    void *data, int cpu);
+    void *       (*alloc_pdata)    (const struct scheduler *s, int cpu);
+    void         (*deinit_pdata)   (const struct scheduler *s,
+                                    void *pcpu, int cpu);
 
     /* Returns ERR_PTR(-err) for error, NULL for 'nothing needed'. */
-    void *       (*alloc_domdata)  (const struct scheduler *, struct domain *);
+    void *       (*alloc_domdata)  (const struct scheduler *s,
+                                    struct domain *d);
     /* Idempotent. */
-    void         (*free_domdata)   (const struct scheduler *, void *);
+    void         (*free_domdata)   (const struct scheduler *s, void *data);
 
-    spinlock_t * (*switch_sched)   (struct scheduler *, unsigned int,
-                                    void *, void *);
+    spinlock_t * (*switch_sched)   (struct scheduler *s, unsigned int cpu,
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
+    void         (*insert_unit)    (const struct scheduler *s,
+                                    struct sched_unit *unit);
+    void         (*remove_unit)    (const struct scheduler *s,
+                                    struct sched_unit *unit);
+
+    void         (*sleep)          (const struct scheduler *s,
+                                    struct sched_unit *unit);
+    void         (*wake)           (const struct scheduler *s,
+                                    struct sched_unit *unit);
+    void         (*yield)          (const struct scheduler *s,
+                                    struct sched_unit *unit);
+    void         (*context_saved)  (const struct scheduler *s,
+                                    struct sched_unit *unit);
+
+    void         (*do_schedule)    (const struct scheduler *s,
+                                    struct sched_unit *unit, s_time_t now,
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
+    struct sched_resource *(*pick_resource)(const struct scheduler *s,
+                                            const struct sched_unit *unit);
+    void         (*migrate)        (const struct scheduler *s,
+                                    struct sched_unit *unit, unsigned int cpu);
+    int          (*adjust)         (const struct scheduler *s,
+                                    struct domain *d,
+                                    struct xen_domctl_scheduler_op *op);
+    void         (*adjust_affinity)(const struct scheduler *s,
+                                    struct sched_unit *unit,
+                                    const struct cpumask *hard,
+                                    const struct cpumask *soft);
+    int          (*adjust_global)  (const struct scheduler *s,
+                                    struct xen_sysctl_scheduler_op *op);
+    void         (*dump_settings)  (const struct scheduler *s);
+    void         (*dump_cpu_state) (const struct scheduler *s, int cpu);
+    void         (*move_timers)    (const struct scheduler *s,
+                                    struct sched_resource *sr);
 };
 
 static inline int sched_init(struct scheduler *s)
-- 
2.34.1


