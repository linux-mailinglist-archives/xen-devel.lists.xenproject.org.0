Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBEE175C8C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 15:06:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8lf2-0002qW-0O; Mon, 02 Mar 2020 14:03:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xlOq=4T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j8lf0-0002qK-Mm
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 14:03:06 +0000
X-Inumbo-ID: 899eda1c-5c8e-11ea-932e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 899eda1c-5c8e-11ea-932e-bc764e2007e4;
 Mon, 02 Mar 2020 14:03:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 98E7CB011;
 Mon,  2 Mar 2020 14:03:04 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <20200218122114.17596-1-jgross@suse.com>
 <709bf8df-1635-cb71-11ea-f8d1b629a071@citrix.com>
 <1fe4ab0e-0b36-af09-557a-e7783315ea4f@suse.com>
 <cc39b5ca-03a1-cfde-5d81-29ca27c2b5a2@citrix.com>
 <397d7d26-8ed8-82f0-6aa0-37c0a8537fdd@suse.com>
 <fc17fb5e-0351-8a87-6f77-61bf29b4c877@citrix.com>
 <1e245b89-d3cc-d8c7-c783-1fcc04eab411@suse.com>
 <c29bb636-a7d8-3bf0-ae59-f10a274a9238@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b287c3f5-4819-c6eb-6c77-dcb9cc5d5335@suse.com>
Date: Mon, 2 Mar 2020 15:03:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c29bb636-a7d8-3bf0-ae59-f10a274a9238@citrix.com>
Content-Type: multipart/mixed; boundary="------------CB8C5E8E0DC43CCEC05FDB4D"
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/4] xen/rcu: let rcu work better with
 core scheduling
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------CB8C5E8E0DC43CCEC05FDB4D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02.03.20 14:25, Igor Druzhinin wrote:
> On 28/02/2020 07:10, Jürgen Groß wrote:
>>
>> I think you are just narrowing the window of the race:
>>
>> It is still possible to have two cpus entering rcu_barrier() and to
>> make it into the if ( !initial ) clause.
>>
>> Instead of introducing another atomic I believe the following patch
>> instead of yours should do it:
>>
>> diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
>> index e6add0b120..0d5469a326 100644
>> --- a/xen/common/rcupdate.c
>> +++ b/xen/common/rcupdate.c
>> @@ -180,23 +180,17 @@ static void rcu_barrier_action(void)
>>
>>   void rcu_barrier(void)
>>   {
>> -    int initial = atomic_read(&cpu_count);
>> -
>>       while ( !get_cpu_maps() )
>>       {
>>           process_pending_softirqs();
>> -        if ( initial && !atomic_read(&cpu_count) )
>> +        if ( !atomic_read(&cpu_count) )
>>               return;
>>
>>           cpu_relax();
>> -        initial = atomic_read(&cpu_count);
>>       }
>>
>> -    if ( !initial )
>> -    {
>> -        atomic_set(&cpu_count, num_online_cpus());
>> +    if ( atomic_cmpxchg(&cpu_count, 0, num_online_cpus()) == 0 )
>>           cpumask_raise_softirq(&cpu_online_map, RCU_SOFTIRQ);
>> -    }
>>
>>       while ( atomic_read(&cpu_count) )
>>       {
>>
>> Could you give that a try, please?
> 
> With this patch I cannot disable SMT at all.
> 
> The problem that my diff solved was a race between 2 consecutive
> rcu_barrier operations on CPU0 (the pattern specific to SMT-on/off
> operation) where some CPUs didn't exit the cpu_count checking loop
> completely but cpu_count is already reinitialized on CPU0 - this
> results in some CPUs being stuck in the loop.

Ah, okay, then I believe a combination of the two patches is needed.

Something like the attached version?


Juergen

--------------CB8C5E8E0DC43CCEC05FDB4D
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-xen-rcu-don-t-use-stop_machine_run-for-rcu_barrier.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-xen-rcu-don-t-use-stop_machine_run-for-rcu_barrier.patc";
 filename*1="h"

From 560ecf8ca947b16aa5af7978905ace51965167e2 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Date: Mon, 17 Feb 2020 06:58:49 +0100
Subject: [PATCH 2/2] xen/rcu: don't use stop_machine_run() for rcu_barrier()

Today rcu_barrier() is calling stop_machine_run() to synchronize all
physical cpus in order to ensure all pending rcu calls have finished
when returning.

As stop_machine_run() is using tasklets this requires scheduling of
idle vcpus on all cpus imposing the need to call rcu_barrier() on idle
cpus only in case of core scheduling being active, as otherwise a
scheduling deadlock would occur.

There is no need at all to do the syncing of the cpus in tasklets, as
rcu activity is started in __do_softirq() called whenever softirq
activity is allowed. So rcu_barrier() can easily be modified to use
softirq for synchronization of the cpus no longer requiring any
scheduling activity.

As there already is a rcu softirq reuse that for the synchronization.

Finally switch rcu_barrier() to return void as it now can never fail.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/rcupdate.c      | 49 ++++++++++++++++++++++++++--------------------
 xen/include/xen/rcupdate.h |  2 +-
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index 079ea9d8a1..1f02a804e3 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -143,47 +143,51 @@ static int qhimark = 10000;
 static int qlowmark = 100;
 static int rsinterval = 1000;
 
-struct rcu_barrier_data {
-    struct rcu_head head;
-    atomic_t *cpu_count;
-};
+/*
+ * rcu_barrier() handling:
+ * cpu_count holds the number of cpu required to finish barrier handling.
+ * Cpus are synchronized via softirq mechanism. rcu_barrier() is regarded to
+ * be active if cpu_count is not zero. In case rcu_barrier() is called on
+ * multiple cpus it is enough to check for cpu_count being not zero on entry
+ * and to call process_pending_softirqs() in a loop until cpu_count drops to
+ * zero, as syncing has been requested already and we don't need to sync
+ * multiple times.
+ */
+static atomic_t cpu_count = ATOMIC_INIT(0);
 
 static void rcu_barrier_callback(struct rcu_head *head)
 {
-    struct rcu_barrier_data *data = container_of(
-        head, struct rcu_barrier_data, head);
-    atomic_inc(data->cpu_count);
+    atomic_dec(&cpu_count);
 }
 
-static int rcu_barrier_action(void *_cpu_count)
+static void rcu_barrier_action(void)
 {
-    struct rcu_barrier_data data = { .cpu_count = _cpu_count };
-
-    ASSERT(!local_irq_is_enabled());
-    local_irq_enable();
+    struct rcu_head head;
 
     /*
      * When callback is executed, all previously-queued RCU work on this CPU
      * is completed. When all CPUs have executed their callback, data.cpu_count
      * will have been incremented to include every online CPU.
      */
-    call_rcu(&data.head, rcu_barrier_callback);
+    call_rcu(&head, rcu_barrier_callback);
 
-    while ( atomic_read(data.cpu_count) != num_online_cpus() )
+    while ( atomic_read(&cpu_count) )
     {
         process_pending_softirqs();
         cpu_relax();
     }
-
-    local_irq_disable();
-
-    return 0;
 }
 
-int rcu_barrier(void)
+void rcu_barrier(void)
 {
-    atomic_t cpu_count = ATOMIC_INIT(0);
-    return stop_machine_run(rcu_barrier_action, &cpu_count, NR_CPUS);
+    if ( !atomic_cmpxchg(&cpu_count, 0, num_online_cpus()) )
+        cpumask_raise_softirq(&cpu_online_map, RCU_SOFTIRQ);
+
+    while ( atomic_read(&cpu_count) )
+    {
+        process_pending_softirqs();
+        cpu_relax();
+    }
 }
 
 /* Is batch a before batch b ? */
@@ -422,6 +426,9 @@ static void rcu_process_callbacks(void)
         rdp->process_callbacks = false;
         __rcu_process_callbacks(&rcu_ctrlblk, rdp);
     }
+
+    if ( atomic_read(&cpu_count) )
+        rcu_barrier_action();
 }
 
 static int __rcu_pending(struct rcu_ctrlblk *rcp, struct rcu_data *rdp)
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 174d058113..87f35b7704 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -143,7 +143,7 @@ void rcu_check_callbacks(int cpu);
 void call_rcu(struct rcu_head *head, 
               void (*func)(struct rcu_head *head));
 
-int rcu_barrier(void);
+void rcu_barrier(void);
 
 void rcu_idle_enter(unsigned int cpu);
 void rcu_idle_exit(unsigned int cpu);
-- 
2.16.4


--------------CB8C5E8E0DC43CCEC05FDB4D
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------CB8C5E8E0DC43CCEC05FDB4D--

