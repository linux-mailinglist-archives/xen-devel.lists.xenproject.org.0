Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B57EEDA4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 09:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634877.990445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uP9-0004uw-9v; Fri, 17 Nov 2023 08:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634877.990445; Fri, 17 Nov 2023 08:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uP9-0004sn-6d; Fri, 17 Nov 2023 08:40:47 +0000
Received: by outflank-mailman (input) for mailman id 634877;
 Fri, 17 Nov 2023 08:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Lb0=G6=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r3uP8-0004eV-6u
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 08:40:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe96b1de-8524-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 09:40:43 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.77.7])
 by support.bugseng.com (Postfix) with ESMTPSA id D15834EE0C81;
 Fri, 17 Nov 2023 09:40:42 +0100 (CET)
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
X-Inumbo-ID: fe96b1de-8524-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/5] xen/common: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 17 Nov 2023 09:40:05 +0100
Message-Id: <ccc8b4bea515360e448f1975dadb326ad2e6c918.1700209834.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700209834.git.federico.serafini@bugseng.com>
References: <cover.1700209834.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/efi/runtime.c       | 2 +-
 xen/common/rangeset.c          | 6 +++---
 xen/common/spinlock.c          | 8 ++++----
 xen/common/stop_machine.c      | 4 ++--
 xen/common/tasklet.c           | 5 +++--
 xen/common/timer.c             | 4 ++--
 xen/include/xen/rangeset.h     | 4 ++--
 xen/include/xen/spinlock.h     | 2 +-
 xen/include/xen/stop_machine.h | 2 +-
 xen/include/xen/tasklet.h      | 7 ++++---
 xen/include/xen/timer.h        | 4 ++--
 11 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 5cb7504c96..d952c3ba78 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -26,7 +26,7 @@ struct efi_rs_state {
 };
 
 struct efi_rs_state efi_rs_enter(void);
-void efi_rs_leave(struct efi_rs_state *);
+void efi_rs_leave(struct efi_rs_state *state);
 
 #ifndef COMPAT
 
diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index f3baf52ab6..aa3a94e053 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -288,7 +288,7 @@ bool_t rangeset_overlaps_range(
 
 int rangeset_report_ranges(
     struct rangeset *r, unsigned long s, unsigned long e,
-    int (*cb)(unsigned long s, unsigned long e, void *), void *ctxt)
+    int (*cb)(unsigned long s, unsigned long e, void *data), void *ctxt)
 {
     struct range *x;
     int rc = 0;
@@ -357,8 +357,8 @@ int rangeset_claim_range(struct rangeset *r, unsigned long size,
 }
 
 int rangeset_consume_ranges(struct rangeset *r,
-                            int (*cb)(unsigned long s, unsigned long e, void *,
-                                      unsigned long *c),
+                            int (*cb)(unsigned long s, unsigned long e,
+                                      void *ctxt, unsigned long *c),
                             void *ctxt)
 {
     int rc = 0;
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 7f453234a9..8fa3e253c0 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -305,7 +305,7 @@ static always_inline u16 observe_head(spinlock_tickets_t *t)
 }
 
 static void always_inline spin_lock_common(spinlock_t *lock,
-                                           void (*cb)(void *), void *data)
+                                           void (*cb)(void *data), void *data)
 {
     spinlock_tickets_t tickets = SPINLOCK_TICKET_INC;
     LOCK_PROFILE_VAR;
@@ -331,7 +331,7 @@ void _spin_lock(spinlock_t *lock)
     spin_lock_common(lock, NULL, NULL);
 }
 
-void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
+void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *data), void *data)
 {
     spin_lock_common(lock, cb, data);
 }
@@ -498,8 +498,8 @@ struct lock_profile_anc {
     const char                *name;     /* descriptive string for print */
 };
 
-typedef void lock_profile_subfunc(
-    struct lock_profile *, int32_t, int32_t, void *);
+typedef void lock_profile_subfunc(struct lock_profile *data, int32_t type,
+    int32_t idx, void *par);
 
 extern struct lock_profile *__lock_profile_start;
 extern struct lock_profile *__lock_profile_end;
diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
index 3adbe380de..398cfd507c 100644
--- a/xen/common/stop_machine.c
+++ b/xen/common/stop_machine.c
@@ -46,7 +46,7 @@ struct stopmachine_data {
 
     unsigned int fn_cpu;
     int fn_result;
-    int (*fn)(void *);
+    int (*fn)(void *data);
     void *fn_data;
 };
 
@@ -73,7 +73,7 @@ static void stopmachine_wait_state(void)
  * mandatory to be called only on an idle vcpu, as otherwise active core
  * scheduling might hang.
  */
-int stop_machine_run(int (*fn)(void *), void *data, unsigned int cpu)
+int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
 {
     unsigned int i, nr_cpus;
     unsigned int this = smp_processor_id();
diff --git a/xen/common/tasklet.c b/xen/common/tasklet.c
index 3ad67b5c24..3649798e6b 100644
--- a/xen/common/tasklet.c
+++ b/xen/common/tasklet.c
@@ -199,7 +199,7 @@ static void migrate_tasklets_from_cpu(unsigned int cpu, struct list_head *list)
     spin_unlock_irqrestore(&tasklet_lock, flags);
 }
 
-void tasklet_init(struct tasklet *t, void (*func)(void *), void *data)
+void tasklet_init(struct tasklet *t, void (*func)(void *data), void *data)
 {
     memset(t, 0, sizeof(*t));
     INIT_LIST_HEAD(&t->list);
@@ -208,7 +208,8 @@ void tasklet_init(struct tasklet *t, void (*func)(void *), void *data)
     t->data = data;
 }
 
-void softirq_tasklet_init(struct tasklet *t, void (*func)(void *), void *data)
+void softirq_tasklet_init(struct tasklet *t,
+                          void (*func)(void *data), void *data)
 {
     tasklet_init(t, func, data);
     t->is_softirq = 1;
diff --git a/xen/common/timer.c b/xen/common/timer.c
index 0fddfa7487..bf7792dcb3 100644
--- a/xen/common/timer.c
+++ b/xen/common/timer.c
@@ -291,7 +291,7 @@ static bool active_timer(const struct timer *timer)
 
 void init_timer(
     struct timer *timer,
-    void        (*function)(void *),
+    void        (*function)(void *data),
     void         *data,
     unsigned int  cpu)
 {
@@ -441,7 +441,7 @@ void kill_timer(struct timer *timer)
 
 static void execute_timer(struct timers *ts, struct timer *t)
 {
-    void (*fn)(void *) = t->function;
+    void (*fn)(void *data) = t->function;
     void *data = t->data;
 
     t->status = TIMER_STATUS_inactive;
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 135f33f606..390f7b6082 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -68,7 +68,7 @@ bool_t __must_check rangeset_overlaps_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 int rangeset_report_ranges(
     struct rangeset *r, unsigned long s, unsigned long e,
-    int (*cb)(unsigned long s, unsigned long e, void *), void *ctxt);
+    int (*cb)(unsigned long s, unsigned long e, void *data), void *ctxt);
 
 /*
  * Note that the consume function can return an error value apart from
@@ -77,7 +77,7 @@ int rangeset_report_ranges(
  */
 int rangeset_consume_ranges(struct rangeset *r,
                             int (*cb)(unsigned long s, unsigned long e,
-                                      void *, unsigned long *c),
+                                      void *ctxt, unsigned long *c),
                             void *ctxt);
 
 /* Merge rangeset r2 into rangeset r1. */
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 16d933ae7e..785ef689a0 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -179,7 +179,7 @@ typedef struct spinlock {
 #define spin_lock_init(l) (*(l) = (spinlock_t)SPIN_LOCK_UNLOCKED)
 
 void _spin_lock(spinlock_t *lock);
-void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data);
+void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *data), void *data);
 void _spin_lock_irq(spinlock_t *lock);
 unsigned long _spin_lock_irqsave(spinlock_t *lock);
 
diff --git a/xen/include/xen/stop_machine.h b/xen/include/xen/stop_machine.h
index c63da1b309..0bbf71f112 100644
--- a/xen/include/xen/stop_machine.h
+++ b/xen/include/xen/stop_machine.h
@@ -14,6 +14,6 @@
  *
  * This can be thought of as a very heavy write lock, equivalent to
  * grabbing every spinlock in the kernel. */
-int stop_machine_run(int (*fn)(void *), void *data, unsigned int cpu);
+int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu);
 
 #endif /* __XEN_STOP_MACHINE_H__ */
diff --git a/xen/include/xen/tasklet.h b/xen/include/xen/tasklet.h
index 193acf8f42..59f2b522f3 100644
--- a/xen/include/xen/tasklet.h
+++ b/xen/include/xen/tasklet.h
@@ -21,7 +21,7 @@ struct tasklet
     bool_t is_softirq;
     bool_t is_running;
     bool_t is_dead;
-    void (*func)(void *);
+    void (*func)(void *data);
     void *data;
 };
 
@@ -59,8 +59,9 @@ void tasklet_schedule_on_cpu(struct tasklet *t, unsigned int cpu);
 void tasklet_schedule(struct tasklet *t);
 void do_tasklet(void);
 void tasklet_kill(struct tasklet *t);
-void tasklet_init(struct tasklet *t, void (*func)(void *), void *data);
-void softirq_tasklet_init(struct tasklet *t, void (*func)(void *), void *data);
+void tasklet_init(struct tasklet *t, void (*func)(void *data), void *data);
+void softirq_tasklet_init(struct tasklet *t,
+                          void (*func)(void *data), void *data);
 void tasklet_subsys_init(void);
 
 #endif /* __XEN_TASKLET_H__ */
diff --git a/xen/include/xen/timer.h b/xen/include/xen/timer.h
index 3a2a05c6de..fb28517515 100644
--- a/xen/include/xen/timer.h
+++ b/xen/include/xen/timer.h
@@ -29,7 +29,7 @@ struct timer {
     };
 
     /* On expiry, '(*function)(data)' will be executed in softirq context. */
-    void (*function)(void *);
+    void (*function)(void *data);
     void *data;
 
     /* CPU on which this timer will be installed and executed. */
@@ -57,7 +57,7 @@ struct timer {
  */
 void init_timer(
     struct timer *timer,
-    void        (*function)(void *),
+    void        (*function)(void *data),
     void         *data,
     unsigned int  cpu);
 
-- 
2.34.1


