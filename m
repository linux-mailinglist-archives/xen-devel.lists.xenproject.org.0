Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BBE175628
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 09:42:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8gbs-0007ZX-6q; Mon, 02 Mar 2020 08:39:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xlOq=4T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j8gbq-0007ZS-UC
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 08:39:30 +0000
X-Inumbo-ID: 54d52dae-5c61-11ea-b472-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54d52dae-5c61-11ea-b472-bc764e2007e4;
 Mon, 02 Mar 2020 08:39:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C0D3FB132;
 Mon,  2 Mar 2020 08:39:28 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c9adeb2c-b580-f3d3-fba7-dd703b1efdfa@suse.com>
Date: Mon, 2 Mar 2020 09:39:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------525003B4C383CED8A4CEB59B"
Content-Language: en-US
Subject: [Xen-devel] Core scheduling and cpu offlining
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------525003B4C383CED8A4CEB59B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Igor,

could you please test the attached patch whether it fixes your problem
with cpu offlining?


Juergen

--------------525003B4C383CED8A4CEB59B
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-sched-fix-cpu-offlining-with-core-scheduling.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xen-sched-fix-cpu-offlining-with-core-scheduling.patch"

From 8f5df0d08b9eb7cbde4ec044d5b6d983c13569e9 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Mon, 2 Mar 2020 09:16:13 +0100
Subject: [PATCH] xen/sched: fix cpu offlining with core scheduling

Offlining a cpu with core scheduling active can result in a hanging
system. Reason is the scheduling resource and unit of the to be removed
cpus needs to be split in order to remove the cpu from its cpupool and
move it to the idle scheduler. In case one of the involved cpus happens
to have received a sched slave event due to a vcpu former having been
running on that cpu being woken up again, it can happen that this cpu
will enter sched_wait_rendezvous_in() while its scheduling resource is
just about to be split. It might wait for ever for the other sibling
to join, which will never happen due to the resources already being
modified.

This can easily be avoided by:
- resetting the rendezvous counters of the idle unit which is kept
- checking for a new scheduling resource in sched_wait_rendezvous_in()
  after reacquiring the scheduling lock and resetting the counters in
  that case without scheduling another vcpu

Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 7e8e7d2c39..d95f30e395 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2415,7 +2415,8 @@ static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev,
 {
     struct sched_unit *next;
     struct vcpu *v;
-    unsigned int gran = get_sched_res(cpu)->granularity;
+    struct sched_resource *sr = get_sched_res(cpu);
+    unsigned int gran = sr->granularity;
 
     if ( !--prev->rendezvous_in_cnt )
     {
@@ -2482,6 +2483,19 @@ static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev,
             atomic_set(&prev->next_task->rendezvous_out_cnt, 0);
             prev->rendezvous_in_cnt = 0;
         }
+
+        /*
+         * Check for scheduling resourced switched. This happens when we are
+         * moved away from our cpupool and cpus are subject of the idle
+         * scheduler now.
+         */
+        if ( unlikely(sr != get_sched_res(cpu)) )
+        {
+            ASSERT(is_idle_unit(prev));
+            atomic_set(&prev->next_task->rendezvous_out_cnt, 0);
+            prev->rendezvous_in_cnt = 0;
+            return NULL;
+        }
     }
 
     return prev->next_task;
@@ -3151,7 +3165,10 @@ int schedule_cpu_rm(unsigned int cpu)
         per_cpu(sched_res_idx, cpu_iter) = 0;
         if ( cpu_iter == cpu )
         {
-            idle_vcpu[cpu_iter]->sched_unit->priv = NULL;
+            unit = idle_vcpu[cpu_iter]->sched_unit;
+            unit->priv = NULL;
+            atomic_set(&unit->next_task->rendezvous_out_cnt, 0);
+            unit->rendezvous_in_cnt = 0;
         }
         else
         {
-- 
2.16.4


--------------525003B4C383CED8A4CEB59B
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------525003B4C383CED8A4CEB59B--

