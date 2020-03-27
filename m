Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6825F19555C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 11:35:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHmHH-0004Xk-6q; Fri, 27 Mar 2020 10:31:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fmA7=5M=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jHmHF-0004XJ-Jp
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 10:31:49 +0000
X-Inumbo-ID: 29ca194f-7016-11ea-893a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29ca194f-7016-11ea-893a-12813bfff9fa;
 Fri, 27 Mar 2020 10:31:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1AD2AAE07;
 Fri, 27 Mar 2020 10:31:47 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 11:31:44 +0100
Message-Id: <20200327103144.19914-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/softirq: adjust comment
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

With commit cef21210fb133 ("rcu: don't process callbacks when holding
a rcu_read_lock()") the comment in process_pending_softirqs() about
not entering the scheduler should have been moved.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/softirq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/softirq.c b/xen/common/softirq.c
index eba65c5fc0..063e93cbe3 100644
--- a/xen/common/softirq.c
+++ b/xen/common/softirq.c
@@ -56,6 +56,7 @@ static void __do_softirq(unsigned long ignore_mask)
 
 void process_pending_softirqs(void)
 {
+    /* Do not enter scheduler as it can preempt the calling context. */
     unsigned long ignore_mask = (1ul << SCHEDULE_SOFTIRQ) |
                                 (1ul << SCHED_SLAVE_SOFTIRQ);
 
@@ -64,7 +65,6 @@ void process_pending_softirqs(void)
         ignore_mask |= 1ul << RCU_SOFTIRQ;
 
     ASSERT(!in_irq() && local_irq_is_enabled());
-    /* Do not enter scheduler as it can preempt the calling context. */
     __do_softirq(ignore_mask);
 }
 
-- 
2.16.4


