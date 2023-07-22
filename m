Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5275DA8F
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 09:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567811.887335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN6ii-0000s7-JA; Sat, 22 Jul 2023 07:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567811.887335; Sat, 22 Jul 2023 07:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN6ii-0000qT-Fd; Sat, 22 Jul 2023 07:08:04 +0000
Received: by outflank-mailman (input) for mailman id 567811;
 Sat, 22 Jul 2023 07:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMan=DI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qN6ih-0000qN-3O
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 07:08:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ebfc7c3-285e-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 09:08:01 +0200 (CEST)
Received: from [192.168.31.238] (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 7E9A94EE0C89;
 Sat, 22 Jul 2023 09:07:59 +0200 (CEST)
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
X-Inumbo-ID: 7ebfc7c3-285e-11ee-b23a-6b7b168915f2
Message-ID: <8d31545a-dcc9-ef9e-8597-da8435872936@bugseng.com>
Date: Sat, 22 Jul 2023 09:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/sched: mechanical renaming to address MISRA
 C:2012 Rule 5.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <9945fd23b0bb88f3e0c6054a7f992cfa642d3f9f.1689953420.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2307211601230.3118466@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <alpine.DEB.2.22.394.2307211601230.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/07/23 01:06, Stefano Stabellini wrote:
> On Fri, 21 Jul 2023, Nicola Vetrini wrote:
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
> 
> nit: code style, now the line is over 80 chars, could be fixed on commit
> 

Ok


>> -/* sched_id - fetch ID of current scheduler */
>> -int sched_id(void)
>> +/* scheduler_id - fetch ID of current scheduler */
>> +int scheduler_id(void)
>>   {
>>       return ops.sched_id;
>>   }
>> @@ -2579,7 +2579,7 @@ static void cf_check sched_slave(void)
>>       struct sched_unit    *prev = vprev->sched_unit, *next;
>>       s_time_t              now;
>>       spinlock_t           *lock;
>> -    bool                  do_softirq = false;
>> +    bool                  exec_softirq = false;
> 
> We don't typically use "exec" especially in the context of softirqs.
> I would just change it to "softirq".
> 

Ok

> 
>>       unsigned int          cpu = smp_processor_id();
>>   
>>       ASSERT_NOT_IN_ATOMIC();
>> @@ -2604,7 +2604,7 @@ static void cf_check sched_slave(void)
>>               return;
>>           }
>>   
>> -        do_softirq = true;
>> +        exec_softirq = true;
>>       }
>>   
>>       if ( !prev->rendezvous_in_cnt )
>> @@ -2614,7 +2614,7 @@ static void cf_check sched_slave(void)
>>           rcu_read_unlock(&sched_res_rculock);
>>   
>>           /* Check for failed forced context switch. */
>> -        if ( do_softirq )
>> +        if ( exec_softirq )
>>               raise_softirq(SCHEDULE_SOFTIRQ);
>>   
>>           return;
>> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
>> index 87a1e31ee9..aba51a7963 100644
>> --- a/xen/common/sched/credit2.c
>> +++ b/xen/common/sched/credit2.c
>> @@ -3884,7 +3884,7 @@ csched2_dump(const struct scheduler *ops)
>>       list_for_each_entry ( rqd, &prv->rql, rql )
>>       {
>>           struct list_head *iter, *runq = &rqd->runq;
>> -        int loop = 0;
>> +        int it = 0;
> 
> Nice catch! This is almost a bug fix.
> 
> 
>>           /* We need the lock to scan the runqueue. */
>>           spin_lock(&rqd->lock);
>> @@ -3901,7 +3901,7 @@ csched2_dump(const struct scheduler *ops)
>>   
>>               if ( svc )
>>               {
>> -                printk("\t%3d: ", loop++);
>> +                printk("\t%3d: ", it++);
>>                   csched2_dump_unit(prv, svc);
>>               }
>>           }
>> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
>> index 0cbfe8bd44..7cabfb0230 100644
>> --- a/xen/common/sysctl.c
>> +++ b/xen/common/sysctl.c
>> @@ -71,7 +71,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>           break;
>>   
>>       case XEN_SYSCTL_sched_id:
>> -        op->u.sched_id.sched_id = sched_id();
>> +        op->u.sched_id.sched_id = scheduler_id();
> 
> I am confused about this one. There is no global variable or no other
> global function named "sched_id". Why do we need to rename sched_id to
> scheduler_id?
> 

sched_id is also a common parameter name used by functions declared 
where the declaration of function 'sched_id' is also visible, so it's 
entirely equivalent whether to change parameter names or the function 
identifier, but since there's just one usage of the function (in 
'xen/common/sysctl.c') I preferred to make the minimal change in the 
patch. If you prefer this done the other way around, no problem.

> 
>>           break;
>>   
>>       case XEN_SYSCTL_getdomaininfolist:
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index 854f3e32c0..bfe714d2e2 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -791,7 +791,7 @@ int  sched_init_domain(struct domain *d, unsigned int poolid);
>>   void sched_destroy_domain(struct domain *d);
>>   long sched_adjust(struct domain *, struct xen_domctl_scheduler_op *);
>>   long sched_adjust_global(struct xen_sysctl_scheduler_op *);
>> -int  sched_id(void);
>> +int  scheduler_id(void);
>>   
>>   /*
>>    * sched_get_id_by_name - retrieves a scheduler id given a scheduler name
>> -- 
>> 2.34.1
>>

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

