Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB41B1C7409
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 17:17:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWLnA-0003SJ-PN; Wed, 06 May 2020 15:17:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3H5S=6U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jWLn9-0003SE-FW
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 15:16:59 +0000
X-Inumbo-ID: a0b6ffda-8fac-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0b6ffda-8fac-11ea-ae69-bc764e2007e4;
 Wed, 06 May 2020 15:16:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57E58AE07;
 Wed,  6 May 2020 15:17:00 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] xen/sched: always modify vcpu pause flags atomically
Date: Wed,  6 May 2020 17:16:55 +0200
Message-Id: <20200506151655.26445-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
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

credit2 is currently modifying the pause flags of vcpus non-atomically
via sched_set_pause_flags() and sched_clear_pause_flags(). This is
dangerous as there are cases where the paus flags are modified without
any lock held.

So drop the non-atomic pause flag modification functions and rename the
atomic ones dropping the _atomic suffix.

Fixes: a76255b4266516 ("xen/sched: make credit2 scheduler vcpu agnostic.")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
It should be noted that this issue wasn't introduced by core scheduling
as even before credit2 was using the non-atomic __set_bit() and
__clear_bit() variants.
---
 xen/common/sched/credit.c  |  4 ++--
 xen/common/sched/private.h | 22 +---------------------
 2 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 93d89da278..d0aa017c64 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -453,7 +453,7 @@ static inline void __runq_tickle(const struct csched_unit *new)
                     SCHED_UNIT_STAT_CRANK(cur, kicked_away);
                     SCHED_UNIT_STAT_CRANK(cur, migrate_r);
                     SCHED_STAT_CRANK(migrate_kicked_away);
-                    sched_set_pause_flags_atomic(cur->unit, _VPF_migrating);
+                    sched_set_pause_flags(cur->unit, _VPF_migrating);
                 }
                 /* Tickle cpu anyway, to let new preempt cur. */
                 SCHED_STAT_CRANK(tickled_busy_cpu);
@@ -973,7 +973,7 @@ csched_unit_acct(struct csched_private *prv, unsigned int cpu)
         {
             SCHED_UNIT_STAT_CRANK(svc, migrate_r);
             SCHED_STAT_CRANK(migrate_running);
-            sched_set_pause_flags_atomic(currunit, _VPF_migrating);
+            sched_set_pause_flags(currunit, _VPF_migrating);
             /*
              * As we are about to tickle cpu, we should clear its bit in
              * idlers. But, if we are here, it means there is someone running
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 367811a12f..b9a5b4c01c 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -172,7 +172,7 @@ static inline void sched_set_pause_flags(struct sched_unit *unit,
     struct vcpu *v;
 
     for_each_sched_unit_vcpu ( unit, v )
-        __set_bit(bit, &v->pause_flags);
+        set_bit(bit, &v->pause_flags);
 }
 
 /* Clear a bit in pause_flags of all vcpus of a unit. */
@@ -181,26 +181,6 @@ static inline void sched_clear_pause_flags(struct sched_unit *unit,
 {
     struct vcpu *v;
 
-    for_each_sched_unit_vcpu ( unit, v )
-        __clear_bit(bit, &v->pause_flags);
-}
-
-/* Set a bit in pause_flags of all vcpus of a unit via atomic updates. */
-static inline void sched_set_pause_flags_atomic(struct sched_unit *unit,
-                                                unsigned int bit)
-{
-    struct vcpu *v;
-
-    for_each_sched_unit_vcpu ( unit, v )
-        set_bit(bit, &v->pause_flags);
-}
-
-/* Clear a bit in pause_flags of all vcpus of a unit via atomic updates. */
-static inline void sched_clear_pause_flags_atomic(struct sched_unit *unit,
-                                                  unsigned int bit)
-{
-    struct vcpu *v;
-
     for_each_sched_unit_vcpu ( unit, v )
         clear_bit(bit, &v->pause_flags);
 }
-- 
2.26.1


