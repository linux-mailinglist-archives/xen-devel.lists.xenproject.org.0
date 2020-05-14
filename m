Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7161D3539
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 17:36:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZFuR-0007BW-0a; Thu, 14 May 2020 15:36:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WGWk=64=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZFuP-0007BA-78
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 15:36:29 +0000
X-Inumbo-ID: a779f668-95f8-11ea-a4ad-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a779f668-95f8-11ea-a4ad-12813bfff9fa;
 Thu, 14 May 2020 15:36:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2CB67AC90;
 Thu, 14 May 2020 15:36:20 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 1/3] xen/sched: allow rcu work to happen when syncing cpus
 in core scheduling
Date: Thu, 14 May 2020 17:36:12 +0200
Message-Id: <20200514153614.2240-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200514153614.2240-1-jgross@suse.com>
References: <20200514153614.2240-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

With RCU barriers moved from tasklets to normal RCU processing cpu
offlining in core scheduling might deadlock due to cpu synchronization
required by RCU processing and core scheduling concurrently.

Fix that by bailing out from core scheduling synchronization in case
of pending RCU work. Additionally the RCU softirq is now required to
be of higher priority than the scheduling softirqs in order to do
RCU processing before entering the scheduler again, as bailing out from
the core scheduling synchronization requires to raise another softirq
SCHED_SLAVE, which would bypass RCU processing again.

Reported-by: Sergey Dyasli <sergey.dyasli@citrix.com>
Tested-by: Sergey Dyasli <sergey.dyasli@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Dario Faggioli <dfaggioli@suse.com>
---
V2:
- add BUILD_BUG_ON() and comment (Dario Faggioli)
---
 xen/common/sched/core.c   | 13 ++++++++++---
 xen/include/xen/softirq.h |  2 +-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d94b95285f..5df66cbf9b 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2457,13 +2457,20 @@ static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev,
             v = unit2vcpu_cpu(prev, cpu);
         }
         /*
-         * Coming from idle might need to do tasklet work.
+         * Check for any work to be done which might need cpu synchronization.
+         * This is either pending RCU work, or tasklet work when coming from
+         * idle. It is mandatory that RCU softirqs are of higher priority
+         * than scheduling ones as otherwise a deadlock might occur.
          * In order to avoid deadlocks we can't do that here, but have to
-         * continue the idle loop.
+         * schedule the previous vcpu again, which will lead to the desired
+         * processing to be done.
          * Undo the rendezvous_in_cnt decrement and schedule another call of
          * sched_slave().
          */
-        if ( is_idle_unit(prev) && sched_tasklet_check_cpu(cpu) )
+        BUILD_BUG_ON(RCU_SOFTIRQ > SCHED_SLAVE_SOFTIRQ ||
+                     RCU_SOFTIRQ > SCHEDULE_SOFTIRQ);
+        if ( rcu_pending(cpu) ||
+             (is_idle_unit(prev) && sched_tasklet_check_cpu(cpu)) )
         {
             struct vcpu *vprev = current;
 
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index b4724f5c8b..1f6c4783da 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -4,10 +4,10 @@
 /* Low-latency softirqs come first in the following list. */
 enum {
     TIMER_SOFTIRQ = 0,
+    RCU_SOFTIRQ,
     SCHED_SLAVE_SOFTIRQ,
     SCHEDULE_SOFTIRQ,
     NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ,
-    RCU_SOFTIRQ,
     TASKLET_SOFTIRQ,
     NR_COMMON_SOFTIRQS
 };
-- 
2.26.1


