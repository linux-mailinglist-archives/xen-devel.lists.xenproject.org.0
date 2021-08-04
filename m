Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F0A3E0700
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 19:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163821.299959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBL7G-0008SK-W9; Wed, 04 Aug 2021 17:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163821.299959; Wed, 04 Aug 2021 17:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBL7G-0008QU-T6; Wed, 04 Aug 2021 17:55:42 +0000
Received: by outflank-mailman (input) for mailman id 163821;
 Wed, 04 Aug 2021 17:55:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RR6J=M3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mBL7F-0008QO-MB
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 17:55:41 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d39f796-f54d-11eb-9b8d-12813bfff9fa;
 Wed, 04 Aug 2021 17:55:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BA5E6222E2;
 Wed,  4 Aug 2021 17:55:39 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 81A9B139B5;
 Wed,  4 Aug 2021 17:55:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id FvmHHJvUCmHuCwAAGKfGzw
 (envelope-from <dfaggioli@suse.com>); Wed, 04 Aug 2021 17:55:39 +0000
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
X-Inumbo-ID: 2d39f796-f54d-11eb-9b8d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1628099739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vUn9a6mM8a/W9SbB0Gk55niQJEeh9IGVPImdi3mjQ90=;
	b=kSOTO0cWdiS9Y6oRVycIbblsQXC9ofUCXXMgRWfW+Kkc/n3sjwvo/m74SiCpq8AtJB5Mxd
	mjNOSRcQx4RtP/I38bRjADQFiYgENRiIiwq/WlwmdIqItYist2pLMMm6HPb3Xh1w/8XShM
	OKqOEZz4ztIOFQrAdYvtZm3HKdrgDSw=
Subject: [PATCH v2] Xen: credit2: avoid picking a spurious idle unit when caps
 are used
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Date: Wed, 04 Aug 2021 19:55:38 +0200
Message-ID: <162809973863.23114.6885532925742864556.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Commit 07b0eb5d0ef0 ("credit2: make sure we pick a runnable unit from the
runq if there is one") did not fix completely the problem of potentially
selecting a scheduling unit that will then not be able to run.

In fact, in case caps are used and the unit we are currently looking
at, during the runqueue scan, does not have enough budget for being run,
we should continue looking instead than giving up and picking the idle
unit.

Suggested-by: George Dunlap <george.dunlap@citrix.com>
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
---
Changes from v1:
* fixed the patch tags and some style issues
* reworked the patch so that it is both easier to backport and also
  more efficient (basing on suggestions received during v1 review)
---
This is necessary to completely fix the bug that was described in and
addressed by 07b0eb5d0ef0 ("credit2: make sure we pick a runnable unit
from the runq if there is one").

It should, therefore, be backported and applied to all the branches to
which that commit has been. Such backporting should be straigthforward
to do, at least until 4.13.

I will provide the backports myself in a email that I'll send as a
reply to this one.

For 4.12 and earlier, it's slightly trickier, but the fix is still necessary.
Actually, both 07b0eb5d0ef0 and this patch should be backported to that
branch(es).

Of course, there's no official support (except for security fixes) any longer
for 4.12 and earlier, so no one should expect that the patch will be applied
by Xen's stable maintainers. Nevertheless, I'll provide at least the backports
to 4.12, in my email, so that if there are users or, in general, downstreams
that are still using these codebases, they can pick them up and apply them
by themselves.

Regards,
Dario
---
 xen/common/sched/credit2.c |   32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index ebb09ea43a..46c4f6a251 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3463,6 +3463,15 @@ runq_candidate(struct csched2_runqueue_data *rqd,
                         (unsigned char *)&d);
         }
 
+        /*
+         * If the unit in the runqueue has more credits than current (or than
+         * idle, if current is not runnable) or if current is yielding, we may
+         * want to pick it up. Otherwise, there's no need to keep scanning the
+         * runqueue any further.
+         */
+        if ( !yield && svc->credit <= snext->credit )
+            break;
+
         /* Skip non runnable units that we (temporarily) have in the runq */
         if ( unlikely(!unit_runnable_state(svc->unit)) )
             continue;
@@ -3494,16 +3503,25 @@ runq_candidate(struct csched2_runqueue_data *rqd,
         }
 
         /*
-         * If the one in the runqueue has more credit than current (or idle,
-         * if current is not runnable), or if current is yielding, and also
-         * if the one in runqueue either is not capped, or is capped but has
-         * some budget, then choose it.
+         * If we are here, we are almost sure we want to pick the unit in
+         * the runqueue. Last thing we need to check is that it either is
+         * not capped or, if it is, it has some budget.
+         *
+         * Note that budget availability must be the very last check that
+         * we, in this loop, due to the side effects that unit_grab_budget().
+         * causes.
+         *
+         * In fact, if there is budget available in the unit's domain's
+         * budget pool, the function will pick some for running this unit.
+         * And we clearly want to do that only if we're otherwise sure that
+         * the unit will actually run, consume it, and return the leftover
+         * (if any) in the usual way.
          */
-        if ( (yield || svc->credit > snext->credit) &&
-             (!has_cap(svc) || unit_grab_budget(svc)) )
-            snext = svc;
+        if ( has_cap(svc) && !unit_grab_budget(svc) )
+            continue;
 
         /* In any case, if we got this far, break. */
+        snext = svc;
         break;
     }
 



