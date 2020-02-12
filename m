Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F92515A922
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 13:27:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1r42-0000sN-GJ; Wed, 12 Feb 2020 12:24:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TtlS=4A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1r41-0000sD-6s
 for xen-devel@lists.xen.org; Wed, 12 Feb 2020 12:24:21 +0000
X-Inumbo-ID: 9764368e-4d92-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9764368e-4d92-11ea-ade5-bc764e2007e4;
 Wed, 12 Feb 2020 12:24:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6AA99B1B3;
 Wed, 12 Feb 2020 12:24:18 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
References: <26757593-2d17-a440-92b1-3f11a83a5104@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2a007257-1b8e-dda9-9228-24c2a8ea5200@suse.com>
Date: Wed, 12 Feb 2020 13:24:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <26757593-2d17-a440-92b1-3f11a83a5104@citrix.com>
Content-Type: multipart/mixed; boundary="------------1F0C970BF91B754B9364E5ED"
Content-Language: en-US
Subject: Re: [Xen-devel] Core Scheduling "lock == schedule_lock" assertion
 failure
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------1F0C970BF91B754B9364E5ED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.02.20 12:21, Sergey Dyasli wrote:
> Hi Juergen,
> 
> Recently our testing has found a host crash which is reproducible.
> Do you have any idea what might be going on here?

Oh, nice catch!

The problem is that get_cpu_idle_time() is calling vcpu_runstate_get()
for an idle vcpu. This is fragile as idle vcpus are sometimes assigned
temporarily to normal scheduling units, thus the ASSERT() in the unlock
function is failing when the assignment of the idle vcpu is modified
under the feet of vcpu_runstate_get() and the unit it has been assigned
to before is already scheduled on another cpu.

The patch is rather easy, though. Can you try it, please?


Juergen

--------------1F0C970BF91B754B9364E5ED
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-sched-fix-get_cpu_idle_time-with-core-scheduling.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xen-sched-fix-get_cpu_idle_time-with-core-scheduling.pa";
 filename*1="tch"

From 0236aee221409fa826a81395f2f3e8b15d5128de Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Cc: Dario Faggioli <dfaggioli@suse.com>
Date: Wed, 12 Feb 2020 13:04:16 +0100
Subject: [PATCH] xen/sched: fix get_cpu_idle_time() with core scheduling

get_cpu_idle_time() is calling vcpu_runstate_get() for an idle vcpu.
With core scheduling active this is fragile, as idle vcpus are assigned
to other scheduling units temporarily, and that assignment is changed
in some cases without holding the scheduling lock, and
vcpu_runstate_get() is using v->sched_unit as parameter for
unit_schedule_[un]lock_irq(), resulting in an ASSERT() triggering in
unlock in case v->sched_unit has changed meanwhile.

Fix that by using a local unit variable holding the correct unit.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 2e43f8029f..de5a6b1a57 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -308,17 +308,26 @@ void vcpu_runstate_get(const struct vcpu *v,
 {
     spinlock_t *lock;
     s_time_t delta;
+    struct sched_unit *unit;
 
     rcu_read_lock(&sched_res_rculock);
 
-    lock = likely(v == current) ? NULL : unit_schedule_lock_irq(v->sched_unit);
+    /*
+     * Be careful in case of an idle vcpu: the assignment to a unit might
+     * change even with the scheduling lock held, so be sure to use the
+     * correct unit for locking in order to avoid triggering an ASSERT() in
+     * the unlock function.
+     */
+    unit = is_idle_vcpu(v) ? get_sched_res(v->processor)->sched_unit_idle
+                           : v->sched_unit;
+    lock = likely(v == current) ? NULL : unit_schedule_lock_irq(unit);
     memcpy(runstate, &v->runstate, sizeof(*runstate));
     delta = NOW() - runstate->state_entry_time;
     if ( delta > 0 )
         runstate->time[runstate->state] += delta;
 
     if ( unlikely(lock != NULL) )
-        unit_schedule_unlock_irq(lock, v->sched_unit);
+        unit_schedule_unlock_irq(lock, unit);
 
     rcu_read_unlock(&sched_res_rculock);
 }
-- 
2.16.4


--------------1F0C970BF91B754B9364E5ED
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------1F0C970BF91B754B9364E5ED--

