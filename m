Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2853DF401
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 19:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163573.299606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAyLi-0005wF-Lk; Tue, 03 Aug 2021 17:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163573.299606; Tue, 03 Aug 2021 17:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAyLi-0005tg-IB; Tue, 03 Aug 2021 17:37:06 +0000
Received: by outflank-mailman (input) for mailman id 163573;
 Tue, 03 Aug 2021 17:37:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGB/=M2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mAyLg-0005ta-VY
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 17:37:05 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2713b9fb-dde5-4619-a686-f6df9c3a2413;
 Tue, 03 Aug 2021 17:37:03 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF9B022131;
 Tue,  3 Aug 2021 17:37:02 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7CFAC13B68;
 Tue,  3 Aug 2021 17:37:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id RXnkG75+CWGNGAAAGKfGzw
 (envelope-from <dfaggioli@suse.com>); Tue, 03 Aug 2021 17:37:02 +0000
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
X-Inumbo-ID: 2713b9fb-dde5-4619-a686-f6df9c3a2413
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1628012222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eRAfJZLVLs75g8g+cmBndLvXhUUoNMvH7ExcMt/31eI=;
	b=ktB3nkix1Q2XWTXHYJpuzlj5WcaUv8f8UxjCDe/GoSEA4dBMHcoA9lDBpy1UrVDG1KHOHT
	lUAXY5+zR3Rv7g9dPX71U8o/xWdMml/7C+W8uTh3dfPkDE0thuZ9hwUkrfGpX1kYqgJo4O
	ZVQ0tkEJzu7X8I7t5kzzWzED5y5v3Fg=
Subject: [pli PATCH bla] Xen: credit2: avoid picking a spurious idle unit when
 caps are used
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Date: Tue, 03 Aug 2021 19:36:56 +0200
Message-ID: <162801221667.955.3439735419862661383.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Commit 07b0eb5d0ef0 ("credit2: make sure we pick a runnable unit from the
runq if there is one") did not fix completely the problem of potentially
selecting a scheduling unit that will then not be able to run.

In fact, in case caps are used and the unit we are currently looking
at, during the runqueue scan, does not have budget to be executed, we
should continue looking instead than giving up and picking the idle
unit.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
Suggested-by: George Dunlap <george.dunlap@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
---
This is necessary to completely fix the bug that was described in and
addressed by 07b0eb5d0ef0 ("credit2: make sure we pick a runnable unit
from the runq if there is one").

It should, therefore, be backported and applied to all the branches to
which that commit has been. About backports, it should be
straigthforward to do that until 4.13.

For 4.12 and earlier, it's trickier, but the fix is still necessary.
Actually, both 07b0eb5d0ef0 and this patch should be backported to that
branch!

I will provide the backports myself in a email that I'll send as a
reply to this one.

Regards,
Dario
---
 xen/common/sched/credit2.c |   85 +++++++++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index ebb09ea43a..f9b95db313 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3463,48 +3463,61 @@ runq_candidate(struct csched2_runqueue_data *rqd,
                         (unsigned char *)&d);
         }
 
-        /* Skip non runnable units that we (temporarily) have in the runq */
-        if ( unlikely(!unit_runnable_state(svc->unit)) )
-            continue;
-
-        /* Only consider vcpus that are allowed to run on this processor. */
-        if ( !cpumask_test_cpu(cpu, svc->unit->cpu_hard_affinity) )
-            continue;
-
         /*
-         * If an unit is meant to be picked up by another processor, and such
-         * processor has not scheduled yet, leave it in the runqueue for him.
+         * If the unit in the runqueue has more credit than current (or than
+         * idle, if current is not runnable) or if current is yielding, we may
+         * want to pick it up.
          */
-        if ( svc->tickled_cpu != -1 && svc->tickled_cpu != cpu &&
-             cpumask_test_cpu(svc->tickled_cpu, &rqd->tickled) )
+        if ( (yield || svc->credit > snext->credit) )
         {
-            SCHED_STAT_CRANK(deferred_to_tickled_cpu);
-            continue;
-        }
+            /* Skip non runnable units that we (temporarily) have in the runq */
+            if ( unlikely(!unit_runnable_state(svc->unit)) )
+                continue;
 
-        /*
-         * If this is on a different processor, don't pull it unless
-         * its credit is at least CSCHED2_MIGRATE_RESIST higher.
-         */
-        if ( sched_unit_master(svc->unit) != cpu
-             && snext->credit + CSCHED2_MIGRATE_RESIST > svc->credit )
-        {
-            SCHED_STAT_CRANK(migrate_resisted);
-            continue;
-        }
+            /* Only consider vcpus that are allowed to run on this processor. */
+            if ( !cpumask_test_cpu(cpu, svc->unit->cpu_hard_affinity) )
+                continue;
 
-        /*
-         * If the one in the runqueue has more credit than current (or idle,
-         * if current is not runnable), or if current is yielding, and also
-         * if the one in runqueue either is not capped, or is capped but has
-         * some budget, then choose it.
-         */
-        if ( (yield || svc->credit > snext->credit) &&
-             (!has_cap(svc) || unit_grab_budget(svc)) )
-            snext = svc;
+            /*
+             * If an unit is meant to be picked up by another processor, and such
+             * processor has not scheduled yet, leave it in the runqueue for him.
+             */
+            if ( svc->tickled_cpu != -1 && svc->tickled_cpu != cpu &&
+                 cpumask_test_cpu(svc->tickled_cpu, &rqd->tickled) )
+            {
+                SCHED_STAT_CRANK(deferred_to_tickled_cpu);
+                continue;
+            }
 
-        /* In any case, if we got this far, break. */
-        break;
+            /*
+             * If this is on a different processor, don't pull it unless
+             * its credit is at least CSCHED2_MIGRATE_RESIST higher.
+             */
+            if ( sched_unit_master(svc->unit) != cpu
+                 && snext->credit + CSCHED2_MIGRATE_RESIST > svc->credit )
+            {
+                SCHED_STAT_CRANK(migrate_resisted);
+                continue;
+            }
+
+            /*
+             * If we are here, we are almost sure we want to pick the unit in
+             * the runqueue. Last thing we need to check is that it either is
+             * is not capped, or if it is, it has some budget.
+             *
+             * Note that cap & budget should really be the last thing we do
+             * check. In fact, unit_grab_budget() will reserve some budget for
+             * this unit, from the per-domain budget pool, and we want to do
+             * that only if we are sure that we'll then run the unit, consume
+             * some of it, and return the leftover (if any) in the usual way.
+             */
+            if ( has_cap(svc) && !unit_grab_budget(svc) )
+                continue;
+
+            /* If we got this far, we are done. */
+            snext = svc;
+            break;
+        }
     }
 
     if ( unlikely(tb_init_done) )



