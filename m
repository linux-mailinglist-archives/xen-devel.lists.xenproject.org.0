Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB2D341C04
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 13:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99209.188479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNE1F-00008m-IK; Fri, 19 Mar 2021 12:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99209.188479; Fri, 19 Mar 2021 12:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNE1F-00008M-FD; Fri, 19 Mar 2021 12:14:21 +0000
Received: by outflank-mailman (input) for mailman id 99209;
 Fri, 19 Mar 2021 12:14:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=egOj=IR=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lNE1E-00008H-55
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 12:14:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98cdc527-cff8-4d5c-92c4-40256dc92afd;
 Fri, 19 Mar 2021 12:14:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A537AE05;
 Fri, 19 Mar 2021 12:14:18 +0000 (UTC)
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
X-Inumbo-ID: 98cdc527-cff8-4d5c-92c4-40256dc92afd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616156058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pNBXp255V4Nv7U4JgUZxv/Bqd55c27yiYgH2ytB94Js=;
	b=cPBWJlkpY7ZZGPzojAjldjfqKI8ipwpojijn1fuFUiE/2UII2hz+/t7DFrBEJB/Odh67I+
	WFcwisi+QoXiVxRYhNSnq/PrKP6AN6Q9LtOaMycwjMRUvyXVB7LDjRj3YfJdyP3is6GeQd
	/406ECkgjw7Z9Rz4FA+Ildjzj5j8wYU=
Subject: [Bugfix PATCH for-4.15] xen: credit2: fix per-entity load tracking
 when continuing running
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Date: Fri, 19 Mar 2021 12:14:17 +0000
Message-ID: <161615605709.5036.4052641880659992679.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

If we schedule, and the current vCPU continues to run, its statistical
load is not properly updated, resulting in something like this, even if
all the 8 vCPUs are 100% busy:

(XEN) Runqueue 0:
(XEN) [...]
(XEN)   aveload            = 2097152 (~800%)
(XEN) [...]
(XEN)   Domain: 0 w 256 c 0 v 8
(XEN)     1: [0.0] flags=2 cpu=4 credit=9996885 [w=256] load=35 (~0%)
(XEN)     2: [0.1] flags=2 cpu=2 credit=9993725 [w=256] load=796 (~0%)
(XEN)     3: [0.2] flags=2 cpu=1 credit=9995885 [w=256] load=883 (~0%)
(XEN)     4: [0.3] flags=2 cpu=5 credit=9998833 [w=256] load=487 (~0%)
(XEN)     5: [0.4] flags=2 cpu=6 credit=9998942 [w=256] load=1595 (~0%)
(XEN)     6: [0.5] flags=2 cpu=0 credit=9994669 [w=256] load=22 (~0%)
(XEN)     7: [0.6] flags=2 cpu=7 credit=9997706 [w=256] load=0 (~0%)
(XEN)     8: [0.7] flags=2 cpu=3 credit=9992440 [w=256] load=0 (~0%)

As we can see, the average load of the runqueue as a whole is, instead,
computed properly.

This issue would, in theory, potentially affect Credit2 load balancing
logic. In practice, however, the problem only manifests (at least with
these characteristics) when there is only 1 runqueue active in the
cpupool, which also means there is no need to do any load-balancing.

Hence its real impact is pretty much limited to wrong per-vCPU load
percentages, when looking at the output of the 'r' debug-key.

With this patch, the load is updated and displayed correctly:

(XEN) Runqueue 0:
(XEN) [...]
(XEN)   aveload            = 2097152 (~800%)
(XEN) [...]
(XEN) Domain info:
(XEN)   Domain: 0 w 256 c 0 v 8
(XEN)     1: [0.0] flags=2 cpu=4 credit=9995584 [w=256] load=262144 (~100%)
(XEN)     2: [0.1] flags=2 cpu=6 credit=9992992 [w=256] load=262144 (~100%)
(XEN)     3: [0.2] flags=2 cpu=3 credit=9998918 [w=256] load=262118 (~99%)
(XEN)     4: [0.3] flags=2 cpu=5 credit=9996867 [w=256] load=262144 (~100%)
(XEN)     5: [0.4] flags=2 cpu=1 credit=9998912 [w=256] load=262144 (~100%)
(XEN)     6: [0.5] flags=2 cpu=2 credit=9997842 [w=256] load=262144 (~100%)
(XEN)     7: [0.6] flags=2 cpu=7 credit=9994623 [w=256] load=262144 (~100%)
(XEN)     8: [0.7] flags=2 cpu=0 credit=9991815 [w=256] load=262144 (~100%)

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
---
Despite the limited effect, it's a bug. So:
- it should be backported;
- I think it should be included in 4.15. The risk is pretty low, for
  the same reasons already explained when describing its limited impact.
---
 xen/common/sched/credit2.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index eb5e5a78c5..b3b5de94cf 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3646,6 +3646,8 @@ static void csched2_schedule(
             runq_remove(snext);
             __set_bit(__CSFLAG_scheduled, &snext->flags);
         }
+        else
+            update_load(ops, rqd, snext, 0, now);
 
         /* Clear the idle mask if necessary */
         if ( cpumask_test_cpu(sched_cpu, &rqd->idle) )



