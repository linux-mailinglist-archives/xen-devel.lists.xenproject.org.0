Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B62577C5A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 09:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369273.600608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1l-0005E2-Mo; Mon, 18 Jul 2022 07:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369273.600608; Mon, 18 Jul 2022 07:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1l-0005BN-JR; Mon, 18 Jul 2022 07:18:49 +0000
Received: by outflank-mailman (input) for mailman id 369273;
 Mon, 18 Jul 2022 07:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDL1j-0004tp-Eu
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 07:18:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db29b1b6-0669-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 09:18:45 +0200 (CEST)
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
X-Inumbo-ID: db29b1b6-0669-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658128725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PfqPuU4iTL51oPEUzQUxPoZi5ngRHlXvkVkGKzmfCpg=;
  b=Cl4/cJ4sG+JO9UjFbRgz+vXSyCSLwY79A0ptG1tdgkJzKNYr4D2Vq2ij
   aIeySyznHnmJTl5Eo+BkFr7il9rlQ97FsVghTuVZnzv6k2hnPrH0DucM3
   sGNoJvsGiIFgFCrEO27Yo4WMKZiepnP27NBNzddkBTiJzdhueUYvLHk0y
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76442482
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KjqbEqMATTNixGLvrR2xl8FynXyQoLVcMsEvi/4bfWQNrUpwhTQDy
 DAYUG+Hbv3fN2b0Kd13YN/npxwE7JTWmN5jSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyFULOZ82QsaDhMtPvc8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPd/uVFL2xmPrchucBsBW1q6
 85CGi0SO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJGahjabgIJEVAQEJ8kx8+jh2Xlci0eo1WQzUYyyzeNkFArjOi3WDbTUvOQfsRUsmmAn
 03l42bBWk4fGc247QPQpxpAgceQxHimCer+DoaQ9PFwh0aI7ncOExBQXly+ydG1hEexVNNYL
 0084Tc1oO4580nDZvvXUgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBTZcP2leF1JDuoS95tFo5v7Scjp9OJ+InvbWNGHz+
 QnJijM6i5ENv5Q5yrruqDgrnAmQSoj1oh8dv1uKATP9v1IlPuZJdKTztwGFsK8owJKxCwDY4
 SNaw5X2APUmV8nlqcCbfAka8FhFDd6hOSaUv1NgFoJJG9+Fqy/6JtA4DN2TyS5U3ic4ldzBO
 ha7Vft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlLXpHE0NBHIhjGx+KTJrU3YE
 c7BGftA8F5AUfg3pNZIb711PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYo43K+1RrlgtMus/VSKm
 +uzwuPQlH2zpsWiPXSMmWPSRHhWRUUG6Wfe8ZEPKL7bf1Y6QAnMyZb5mNscRmCspIwN/s+gw
 513chUwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:zruxQq8fbdeFxVAGgkJuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="scan'208";a="76442482"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 5/5] xen/wait: Remove VCPU_AFFINITY_WAIT
Date: Mon, 18 Jul 2022 08:18:25 +0100
Message-ID: <20220718071825.22113-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220718071825.22113-1-andrew.cooper3@citrix.com>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With the waitqueue logic updated to not use an absolute stack pointer
reference, the vCPU can safely be resumed anywhere.

Remove VCPU_AFFINITY_WAIT completely, getting rid of two domain crashes, and a
logical corner case where resetting the vcpu with an oustanding waitqueue
would crash the domain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Dario Faggioli <dfaggioli@suse.com>
---
 xen/common/domain.c     |  2 --
 xen/common/sched/core.c |  4 +---
 xen/common/wait.c       | 23 -----------------------
 xen/include/xen/sched.h |  1 -
 4 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 618410e3b257..323b92102cce 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1428,8 +1428,6 @@ int vcpu_reset(struct vcpu *v)
     v->is_initialised  = 0;
     if ( v->affinity_broken & VCPU_AFFINITY_OVERRIDE )
         vcpu_temporary_affinity(v, NR_CPUS, VCPU_AFFINITY_OVERRIDE);
-    if ( v->affinity_broken & VCPU_AFFINITY_WAIT )
-        vcpu_temporary_affinity(v, NR_CPUS, VCPU_AFFINITY_WAIT);
     clear_bit(_VPF_blocked, &v->pause_flags);
     clear_bit(_VPF_in_reset, &v->pause_flags);
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index f689b55783f7..cff8e59aba7c 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1610,12 +1610,10 @@ void watchdog_domain_destroy(struct domain *d)
 /*
  * Pin a vcpu temporarily to a specific CPU (or restore old pinning state if
  * cpu is NR_CPUS).
- * Temporary pinning can be done due to two reasons, which may be nested:
+ * Temporary pinning can be done for a number of reasons, which may be nested:
  * - VCPU_AFFINITY_OVERRIDE (requested by guest): is allowed to fail in case
  *   of a conflict (e.g. in case cpupool doesn't include requested CPU, or
  *   another conflicting temporary pinning is already in effect.
- * - VCPU_AFFINITY_WAIT (called by wait_event()): only used to pin vcpu to the
- *   CPU it is just running on. Can't fail if used properly.
  */
 int vcpu_temporary_affinity(struct vcpu *v, unsigned int cpu, uint8_t reason)
 {
diff --git a/xen/common/wait.c b/xen/common/wait.c
index 4f1daf650bc4..bd6f09662ac0 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -127,16 +127,6 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
 
     ASSERT(wqv->used == 0);
 
-    /* Save current VCPU affinity; force wakeup on *this* CPU only. */
-    if ( vcpu_temporary_affinity(curr, smp_processor_id(), VCPU_AFFINITY_WAIT) )
-    {
-        gdprintk(XENLOG_ERR, "Unable to set vcpu affinity\n");
-        domain_crash(curr->domain);
-
-        for ( ; ; )
-            do_softirq();
-    }
-
     /*
      * Hand-rolled setjmp().
      *
@@ -187,7 +177,6 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
 static void __finish_wait(struct waitqueue_vcpu *wqv)
 {
     wqv->used = 0;
-    vcpu_temporary_affinity(current, NR_CPUS, VCPU_AFFINITY_WAIT);
 }
 
 void check_wakeup_from_wait(void)
@@ -201,18 +190,6 @@ void check_wakeup_from_wait(void)
     if ( likely(!wqv->used) )
         return;
 
-    /* Check if we are still pinned. */
-    if ( unlikely(!(curr->affinity_broken & VCPU_AFFINITY_WAIT)) )
-    {
-        gdprintk(XENLOG_ERR, "vcpu affinity lost\n");
-        domain_crash(curr->domain);
-
-        /* Re-initiate scheduler and don't longjmp(). */
-        raise_softirq(SCHEDULE_SOFTIRQ);
-        for ( ; ; )
-            do_softirq();
-    }
-
     /*
      * Hand-rolled longjmp().
      *
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index b9515eb497de..ba859a4abed3 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -223,7 +223,6 @@ struct vcpu
     /* VCPU need affinity restored */
     uint8_t          affinity_broken;
 #define VCPU_AFFINITY_OVERRIDE    0x01
-#define VCPU_AFFINITY_WAIT        0x02
 
     /* A hypercall has been preempted. */
     bool             hcall_preempted;
-- 
2.11.0


