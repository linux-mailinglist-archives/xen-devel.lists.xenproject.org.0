Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A0760BC1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 09:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569484.890298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOCTg-0006CW-7A; Tue, 25 Jul 2023 07:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569484.890298; Tue, 25 Jul 2023 07:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOCTg-0006AW-4M; Tue, 25 Jul 2023 07:29:04 +0000
Received: by outflank-mailman (input) for mailman id 569484;
 Tue, 25 Jul 2023 07:29:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Iib=DL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOCTe-0006AP-NZ
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 07:29:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec2efe32-2abc-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 09:29:00 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.161.75.91])
 by support.bugseng.com (Postfix) with ESMTPSA id 65A584EE0739;
 Tue, 25 Jul 2023 09:28:58 +0200 (CEST)
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
X-Inumbo-ID: ec2efe32-2abc-11ee-8613-37d641c3527e
Message-ID: <bb145f45-934f-b2ae-5aa0-94dc86703287@bugseng.com>
Date: Tue, 25 Jul 2023 09:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/sched: mechanical renaming to address MISRA
 C:2012 Rule 5.3
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <9945fd23b0bb88f3e0c6054a7f992cfa642d3f9f.1689953420.git.nicola.vetrini@bugseng.com>
 <c08f1df7-e314-f3fb-b5ac-7aa5e4c546a9@suse.com>
Content-Language: en-US
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <c08f1df7-e314-f3fb-b5ac-7aa5e4c546a9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/23 10:26, Jan Beulich wrote:
> On 21.07.2023 17:31, Nicola Vetrini wrote:
>> Rule 5.3 has the following headline:
>> "An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope"
>>
>> The renaming s/sched_id/scheduler_id of the function defined in
>> 'xen/common/sched/core.c' prevents any hiding of that function
>> by the many instances of omonymous function parameters.
>>
>> Similarly, the renames
>> - s/ops/operations
>> - s/do_softirq/exec_softirq
>> - s/loop/it
>> are introduced for parameter names, to avoid any conflict
>> with the homonymous variable or function defined in an enclosing
>> scope.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>   xen/common/sched/core.c    | 18 +++++++++---------
>>   xen/common/sched/credit2.c |  4 ++--
>>   xen/common/sysctl.c        |  2 +-
>>   xen/include/xen/sched.h    |  2 +-
>>   4 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index 022f548652..e74b1208bd 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -99,13 +99,13 @@ static void sched_set_affinity(
>>       struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft);
>>   
>>   static struct sched_resource *cf_check
>> -sched_idle_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
>> +sched_idle_res_pick(const struct scheduler *operations, const struct sched_unit *unit)
>>   {
>>       return unit->res;
>>   }
>>   
>>   static void *cf_check
>> -sched_idle_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
>> +sched_idle_alloc_udata(const struct scheduler *operations, struct sched_unit *unit,
>>                          void *dd)
>>   {
>>       /* Any non-NULL pointer is fine here. */
>> @@ -113,12 +113,12 @@ sched_idle_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
>>   }
>>   
>>   static void cf_check
>> -sched_idle_free_udata(const struct scheduler *ops, void *priv)
>> +sched_idle_free_udata(const struct scheduler *operations, void *priv)
>>   {
>>   }
>>   
>>   static void cf_check sched_idle_schedule(
>> -    const struct scheduler *ops, struct sched_unit *unit, s_time_t now,
>> +    const struct scheduler *operations, struct sched_unit *unit, s_time_t now,
>>       bool tasklet_work_scheduled)
>>   {
>>       const unsigned int cpu = smp_processor_id();
> 
> These renames bring the idle scheduler out of sync with all others. I
> think it wants considering to rename the file scope variable instead.
> 

That's ok, since the variable is static.

>> @@ -2579,7 +2579,7 @@ static void cf_check sched_slave(void)
>>       struct sched_unit    *prev = vprev->sched_unit, *next;
>>       s_time_t              now;
>>       spinlock_t           *lock;
>> -    bool                  do_softirq = false;
>> +    bool                  exec_softirq = false;
> 
> As an alternative to Stefano's suggestion, maybe consider "need_softirq"?
> 

I like it, especially since it's a local variable.

>> --- a/xen/common/sched/credit2.c
>> +++ b/xen/common/sched/credit2.c
>> @@ -3884,7 +3884,7 @@ csched2_dump(const struct scheduler *ops)
>>       list_for_each_entry ( rqd, &prv->rql, rql )
>>       {
>>           struct list_head *iter, *runq = &rqd->runq;
>> -        int loop = 0;
>> +        int it = 0;
> 
> Instead of renaming, why can't we just drop this second variable, re-using
> the outer scope one here (and at the same time doing away with a not really
> appropriate use of plain "int")? (This may then want accompanying by ...
> 
>> @@ -3901,7 +3901,7 @@ csched2_dump(const struct scheduler *ops)
>>   
>>               if ( svc )
>>               {
>> -                printk("\t%3d: ", loop++);
>> +                printk("\t%3d: ", it++);
> 
> ... switching to %3u here.)
> 

Good point.

I'll submit a v2 shortly with these changes.

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

