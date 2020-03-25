Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A939192660
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:58:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH3gx-0005Pj-A3; Wed, 25 Mar 2020 10:55:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O/z9=5K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jH3gw-0005PF-17
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:55:22 +0000
X-Inumbo-ID: 1c5b9acb-6e87-11ea-85cc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c5b9acb-6e87-11ea-85cc-12813bfff9fa;
 Wed, 25 Mar 2020 10:55:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 76323ACC6;
 Wed, 25 Mar 2020 10:55:15 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Mar 2020 11:55:11 +0100
Message-Id: <20200325105511.20882-6-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200325105511.20882-1-jgross@suse.com>
References: <20200325105511.20882-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v7 5/5] xen/rcu: add per-lock counter in debug
 builds
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add a lock specific counter to rcu read locks in debug builds. This
allows to test for matching lock/unlock calls.

This will help to avoid cases like the one fixed by commit
98ed1f43cc2c89 where different rcu read locks were referenced in the
lock and unlock calls.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V5:
- updated commit message (Jan Beulich)
---
 xen/include/xen/rcupdate.h | 46 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 6f2587058e..cda1be9c88 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -37,21 +37,50 @@
 #include <xen/cpumask.h>
 #include <xen/percpu.h>
 #include <xen/preempt.h>
+#include <asm/atomic.h>
 
 #define __rcu
 
+#ifndef NDEBUG
+/* * Lock type for passing to rcu_read_{lock,unlock}. */
+struct _rcu_read_lock {
+    atomic_t cnt;
+};
+typedef struct _rcu_read_lock rcu_read_lock_t;
+#define DEFINE_RCU_READ_LOCK(x) rcu_read_lock_t x = { .cnt = ATOMIC_INIT(0) }
+#define RCU_READ_LOCK_INIT(x)   atomic_set(&(x)->cnt, 0)
+
+#else
+/*
+ * Dummy lock type for passing to rcu_read_{lock,unlock}. Currently exists
+ * only to document the reason for rcu_read_lock() critical sections.
+ */
+struct _rcu_read_lock {};
+typedef struct _rcu_read_lock rcu_read_lock_t;
+#define DEFINE_RCU_READ_LOCK(x) rcu_read_lock_t x
+#define RCU_READ_LOCK_INIT(x)
+
+#endif
+
 DECLARE_PER_CPU(unsigned int, rcu_lock_cnt);
 
-static inline void rcu_quiesce_disable(void)
+static inline void rcu_quiesce_disable(rcu_read_lock_t *lock)
 {
     preempt_disable();
     this_cpu(rcu_lock_cnt)++;
+#ifndef NDEBUG
+    atomic_inc(&lock->cnt);
+#endif
     barrier();
 }
 
-static inline void rcu_quiesce_enable(void)
+static inline void rcu_quiesce_enable(rcu_read_lock_t *lock)
 {
     barrier();
+#ifndef NDEBUG
+    ASSERT(atomic_read(&lock->cnt));
+    atomic_dec(&lock->cnt);
+#endif
     this_cpu(rcu_lock_cnt)--;
     preempt_enable();
 }
@@ -81,15 +110,6 @@ struct rcu_head {
 int rcu_pending(int cpu);
 int rcu_needs_cpu(int cpu);
 
-/*
- * Dummy lock type for passing to rcu_read_{lock,unlock}. Currently exists
- * only to document the reason for rcu_read_lock() critical sections.
- */
-struct _rcu_read_lock {};
-typedef struct _rcu_read_lock rcu_read_lock_t;
-#define DEFINE_RCU_READ_LOCK(x) rcu_read_lock_t x
-#define RCU_READ_LOCK_INIT(x)
-
 /**
  * rcu_read_lock - mark the beginning of an RCU read-side critical section.
  *
@@ -119,7 +139,7 @@ typedef struct _rcu_read_lock rcu_read_lock_t;
  */
 static inline void rcu_read_lock(rcu_read_lock_t *lock)
 {
-    rcu_quiesce_disable();
+    rcu_quiesce_disable(lock);
 }
 
 /**
@@ -130,7 +150,7 @@ static inline void rcu_read_lock(rcu_read_lock_t *lock)
 static inline void rcu_read_unlock(rcu_read_lock_t *lock)
 {
     ASSERT(!rcu_quiesce_allowed());
-    rcu_quiesce_enable();
+    rcu_quiesce_enable(lock);
 }
 
 /*
-- 
2.16.4


