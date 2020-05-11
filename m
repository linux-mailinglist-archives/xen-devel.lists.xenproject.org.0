Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F91CD866
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 13:29:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY6bs-0001fY-75; Mon, 11 May 2020 11:28:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tfUY=6Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jY6br-0001fN-61
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 11:28:35 +0000
X-Inumbo-ID: 8c1673a4-937a-11ea-a200-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c1673a4-937a-11ea-a200-12813bfff9fa;
 Mon, 11 May 2020 11:28:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7D308AEC1;
 Mon, 11 May 2020 11:28:35 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/3] xen/sched: don't call sync_vcpu_execstate() in
 sched_unit_migrate_finish()
Date: Mon, 11 May 2020 13:28:28 +0200
Message-Id: <20200511112829.5500-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200511112829.5500-1-jgross@suse.com>
References: <20200511112829.5500-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

With support of core scheduling sched_unit_migrate_finish() gained a
call of sync_vcpu_execstate() as it was believed to be called as a
result of vcpu migration in any case.

In case of migrating a vcpu away from a physical cpu for a short period
of time only this might not be true, so drop the call and let the lazy
state syncing do its job.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/common/sched/core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 5df66cbf9b..cb49a8bc02 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1078,12 +1078,7 @@ static void sched_unit_migrate_finish(struct sched_unit *unit)
     sched_spin_unlock_double(old_lock, new_lock, flags);
 
     if ( old_cpu != new_cpu )
-    {
-        /* Vcpus are moved to other pcpus, commit their states to memory. */
-        for_each_sched_unit_vcpu ( unit, v )
-            sync_vcpu_execstate(v);
         sched_move_irqs(unit);
-    }
 
     /* Wake on new CPU. */
     for_each_sched_unit_vcpu ( unit, v )
-- 
2.26.1


