Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26773192661
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:58:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH3gs-0005Ow-IH; Wed, 25 Mar 2020 10:55:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O/z9=5K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jH3gr-0005Ol-57
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:55:17 +0000
X-Inumbo-ID: 1bca5d9f-6e87-11ea-85cc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bca5d9f-6e87-11ea-85cc-12813bfff9fa;
 Wed, 25 Mar 2020 10:55:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1188AACBD;
 Wed, 25 Mar 2020 10:55:15 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Mar 2020 11:55:09 +0100
Message-Id: <20200325105511.20882-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200325105511.20882-1-jgross@suse.com>
References: <20200325105511.20882-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v7 3/5] xen: don't process rcu callbacks when
 holding a rcu_read_lock()
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

Some keyhandlers are calling process_pending_softirqs() while holding
a rcu_read_lock(). This is wrong, as process_pending_softirqs() might
activate rcu calls which should not happen inside a rcu_read_lock().

For that purpose modify process_pending_softirqs() to not allow rcu
callback processing when a rcu_read_lock() is being held.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V3:
- add RCU_SOFTIRQ to ignore in process_pending_softirqs_norcu()
  (Roger Pau Monné)

V5:
- block rcu processing depending on rch_read_lock() being held or not
  (Jan Beulich)
---
 xen/common/softirq.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/common/softirq.c b/xen/common/softirq.c
index b83ad96d6c..00d676b62c 100644
--- a/xen/common/softirq.c
+++ b/xen/common/softirq.c
@@ -29,6 +29,7 @@ static void __do_softirq(unsigned long ignore_mask)
 {
     unsigned int i, cpu;
     unsigned long pending;
+    bool rcu_allowed = !(ignore_mask & (1ul << RCU_SOFTIRQ));
 
     for ( ; ; )
     {
@@ -38,7 +39,7 @@ static void __do_softirq(unsigned long ignore_mask)
          */
         cpu = smp_processor_id();
 
-        if ( rcu_pending(cpu) )
+        if ( rcu_allowed && rcu_pending(cpu) )
             rcu_check_callbacks(cpu);
 
         if ( ((pending = (softirq_pending(cpu) & ~ignore_mask)) == 0)
@@ -53,9 +54,16 @@ static void __do_softirq(unsigned long ignore_mask)
 
 void process_pending_softirqs(void)
 {
+    unsigned long ignore_mask = (1ul << SCHEDULE_SOFTIRQ) |
+                                (1ul << SCHED_SLAVE_SOFTIRQ);
+
+    /* Block RCU processing in case of rcu_read_lock() held. */
+    if ( preempt_count() )
+        ignore_mask |= 1ul << RCU_SOFTIRQ;
+
     ASSERT(!in_irq() && local_irq_is_enabled());
     /* Do not enter scheduler as it can preempt the calling context. */
-    __do_softirq((1ul << SCHEDULE_SOFTIRQ) | (1ul << SCHED_SLAVE_SOFTIRQ));
+    __do_softirq(ignore_mask);
 }
 
 void do_softirq(void)
-- 
2.16.4


