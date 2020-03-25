Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5622419265F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:58:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH3h2-0005TO-SS; Wed, 25 Mar 2020 10:55:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O/z9=5K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jH3h1-0005SO-1W
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:55:27 +0000
X-Inumbo-ID: 1bca5da0-6e87-11ea-85cc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bca5da0-6e87-11ea-85cc-12813bfff9fa;
 Wed, 25 Mar 2020 10:55:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 50252ACC2;
 Wed, 25 Mar 2020 10:55:15 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Mar 2020 11:55:10 +0100
Message-Id: <20200325105511.20882-5-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200325105511.20882-1-jgross@suse.com>
References: <20200325105511.20882-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v7 4/5] xen/rcu: add assertions to debug build
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

Xen's RCU implementation relies on no softirq handling taking place
while being in a RCU critical section. Add ASSERT()s in debug builds
in order to catch any violations.

For that purpose modify rcu_read_[un]lock() to use a dedicated percpu
counter additional to preempt_[en|dis]able() as this enables to test
that condition in __do_softirq() (ASSERT_NOT_IN_ATOMIC() is not
usable there due to __cpu_up() calling process_pending_softirqs()
while holding the cpu hotplug lock).

While at it switch the rcu_read_[un]lock() implementation to static
inline functions instead of macros.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V3:
- add barriers to rcu_[en|dis]able() (Roger Pau Monné)
- add rcu_quiesce_allowed() to ASSERT_NOT_IN_ATOMIC (Roger Pau Monné)
- convert macros to static inline functions
- add sanity check in rcu_read_unlock()

V4:
- use barrier() in rcu_[en|dis]able() (Julien Grall)

V5:
- use rcu counter even if not using a debug build

V6:
- keep preempt_[dis|en]able() calls
---
 xen/common/rcupdate.c      |  2 ++
 xen/common/softirq.c       |  4 +++-
 xen/include/xen/rcupdate.h | 37 ++++++++++++++++++++++++++++++++++---
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index 12b89565d0..01b21951e0 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -46,6 +46,8 @@
 #include <xen/cpu.h>
 #include <xen/stop_machine.h>
 
+DEFINE_PER_CPU(unsigned int, rcu_lock_cnt);
+
 /* Global control variables for rcupdate callback mechanism. */
 static struct rcu_ctrlblk {
     long cur;           /* Current batch number.                      */
diff --git a/xen/common/softirq.c b/xen/common/softirq.c
index 00d676b62c..eba65c5fc0 100644
--- a/xen/common/softirq.c
+++ b/xen/common/softirq.c
@@ -31,6 +31,8 @@ static void __do_softirq(unsigned long ignore_mask)
     unsigned long pending;
     bool rcu_allowed = !(ignore_mask & (1ul << RCU_SOFTIRQ));
 
+    ASSERT(!rcu_allowed || rcu_quiesce_allowed());
+
     for ( ; ; )
     {
         /*
@@ -58,7 +60,7 @@ void process_pending_softirqs(void)
                                 (1ul << SCHED_SLAVE_SOFTIRQ);
 
     /* Block RCU processing in case of rcu_read_lock() held. */
-    if ( preempt_count() )
+    if ( !rcu_quiesce_allowed() )
         ignore_mask |= 1ul << RCU_SOFTIRQ;
 
     ASSERT(!in_irq() && local_irq_is_enabled());
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 31c8b86d13..6f2587058e 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -32,12 +32,35 @@
 #define __XEN_RCUPDATE_H
 
 #include <xen/cache.h>
+#include <xen/compiler.h>
 #include <xen/spinlock.h>
 #include <xen/cpumask.h>
+#include <xen/percpu.h>
 #include <xen/preempt.h>
 
 #define __rcu
 
+DECLARE_PER_CPU(unsigned int, rcu_lock_cnt);
+
+static inline void rcu_quiesce_disable(void)
+{
+    preempt_disable();
+    this_cpu(rcu_lock_cnt)++;
+    barrier();
+}
+
+static inline void rcu_quiesce_enable(void)
+{
+    barrier();
+    this_cpu(rcu_lock_cnt)--;
+    preempt_enable();
+}
+
+static inline bool rcu_quiesce_allowed(void)
+{
+    return !this_cpu(rcu_lock_cnt);
+}
+
 /**
  * struct rcu_head - callback structure for use with RCU
  * @next: next update requests in a list
@@ -91,16 +114,24 @@ typedef struct _rcu_read_lock rcu_read_lock_t;
  * will be deferred until the outermost RCU read-side critical section
  * completes.
  *
- * It is illegal to block while in an RCU read-side critical section.
+ * It is illegal to process softirqs or block while in an RCU read-side
+ * critical section.
  */
-#define rcu_read_lock(x)       ({ ((void)(x)); preempt_disable(); })
+static inline void rcu_read_lock(rcu_read_lock_t *lock)
+{
+    rcu_quiesce_disable();
+}
 
 /**
  * rcu_read_unlock - marks the end of an RCU read-side critical section.
  *
  * See rcu_read_lock() for more information.
  */
-#define rcu_read_unlock(x)     ({ ((void)(x)); preempt_enable(); })
+static inline void rcu_read_unlock(rcu_read_lock_t *lock)
+{
+    ASSERT(!rcu_quiesce_allowed());
+    rcu_quiesce_enable();
+}
 
 /*
  * So where is rcu_write_lock()?  It does not exist, as there is no
-- 
2.16.4


