Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB65A7F1500
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 14:56:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636746.992477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r54ki-00047z-3B; Mon, 20 Nov 2023 13:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636746.992477; Mon, 20 Nov 2023 13:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r54ki-00045c-0X; Mon, 20 Nov 2023 13:55:52 +0000
Received: by outflank-mailman (input) for mailman id 636746;
 Mon, 20 Nov 2023 13:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4RyQ=HB=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r54kg-00044B-QN
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 13:55:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81f1335c-87ac-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 14:55:48 +0100 (CET)
Received: from [10.253.41.90] (unknown [160.78.253.159])
 by support.bugseng.com (Postfix) with ESMTPSA id 48A3C4EE0739;
 Mon, 20 Nov 2023 14:55:47 +0100 (CET)
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
X-Inumbo-ID: 81f1335c-87ac-11ee-9b0e-b553b5be7939
Message-ID: <a03a8d60-5e46-4ef2-9e35-cc6892d229ee@bugseng.com>
Date: Mon, 20 Nov 2023 14:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/5] xen/common: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US, it
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1700209834.git.federico.serafini@bugseng.com>
 <ccc8b4bea515360e448f1975dadb326ad2e6c918.1700209834.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2311171851260.773207@ubuntu-linux-20-04-desktop>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <alpine.DEB.2.22.394.2311171851260.773207@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/23 03:59, Stefano Stabellini wrote:
> On Fri, 17 Nov 2023, Federico Serafini wrote:
>> diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
>> index 3adbe380de..398cfd507c 100644
>> --- a/xen/common/stop_machine.c
>> +++ b/xen/common/stop_machine.c
>> @@ -46,7 +46,7 @@ struct stopmachine_data {
>>   
>>       unsigned int fn_cpu;
>>       int fn_result;
>> -    int (*fn)(void *);
>> +    int (*fn)(void *data);
>>       void *fn_data;
>>   };
> 
> At least one of the possible function used here calls the parameter
> "arg", see take_cpu_down. But I don't think it is a MISRA requirement to
> also harmonize those?
> 
> 
>> @@ -73,7 +73,7 @@ static void stopmachine_wait_state(void)
>>    * mandatory to be called only on an idle vcpu, as otherwise active core
>>    * scheduling might hang.
>>    */
>> -int stop_machine_run(int (*fn)(void *), void *data, unsigned int cpu)
>> +int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
>>   {
>>       unsigned int i, nr_cpus;
>>       unsigned int this = smp_processor_id();
>> diff --git a/xen/common/tasklet.c b/xen/common/tasklet.c
>> index 3ad67b5c24..3649798e6b 100644
>> --- a/xen/common/tasklet.c
>> +++ b/xen/common/tasklet.c
>> @@ -199,7 +199,7 @@ static void migrate_tasklets_from_cpu(unsigned int cpu, struct list_head *list)
>>       spin_unlock_irqrestore(&tasklet_lock, flags);
>>   }
>>   
>> -void tasklet_init(struct tasklet *t, void (*func)(void *), void *data)
>> +void tasklet_init(struct tasklet *t, void (*func)(void *data), void *data)
>>   {
>>       memset(t, 0, sizeof(*t));
>>       INIT_LIST_HEAD(&t->list);
>> @@ -208,7 +208,8 @@ void tasklet_init(struct tasklet *t, void (*func)(void *), void *data)
>>       t->data = data;
>>   }
>>   
>> -void softirq_tasklet_init(struct tasklet *t, void (*func)(void *), void *data)
>> +void softirq_tasklet_init(struct tasklet *t,
>> +                          void (*func)(void *data), void *data)
>>   {
>>       tasklet_init(t, func, data);
>>       t->is_softirq = 1;
>> diff --git a/xen/common/timer.c b/xen/common/timer.c
>> index 0fddfa7487..bf7792dcb3 100644
>> --- a/xen/common/timer.c
>> +++ b/xen/common/timer.c
>> @@ -291,7 +291,7 @@ static bool active_timer(const struct timer *timer)
>>   
>>   void init_timer(
>>       struct timer *timer,
>> -    void        (*function)(void *),
>> +    void        (*function)(void *data),
>>       void         *data,
>>       unsigned int  cpu)
>>   {
>> @@ -441,7 +441,7 @@ void kill_timer(struct timer *timer)
>>   
>>   static void execute_timer(struct timers *ts, struct timer *t)
>>   {
>> -    void (*fn)(void *) = t->function;
>> +    void (*fn)(void *data) = t->function;
>>       void *data = t->data;
>>   
>>       t->status = TIMER_STATUS_inactive;
>> diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
>> index 135f33f606..390f7b6082 100644
>> --- a/xen/include/xen/rangeset.h
>> +++ b/xen/include/xen/rangeset.h
>> @@ -68,7 +68,7 @@ bool_t __must_check rangeset_overlaps_range(
>>       struct rangeset *r, unsigned long s, unsigned long e);
>>   int rangeset_report_ranges(
>>       struct rangeset *r, unsigned long s, unsigned long e,
>> -    int (*cb)(unsigned long s, unsigned long e, void *), void *ctxt);
>> +    int (*cb)(unsigned long s, unsigned long e, void *data), void *ctxt);
> 
> Also here some of the functions use "arg" instead of ctxt
> 
> 
>>   /*
>>    * Note that the consume function can return an error value apart from
>> @@ -77,7 +77,7 @@ int rangeset_report_ranges(
>>    */
>>   int rangeset_consume_ranges(struct rangeset *r,
>>                               int (*cb)(unsigned long s, unsigned long e,
>> -                                      void *, unsigned long *c),
>> +                                      void *ctxt, unsigned long *c),
>>                               void *ctxt);
> 
> Also here some of the functions use "dom" like irq_remove_cb.
> 
> 
> But I actually like the patch as is, so if that's OK from a MISRA point
> of view then I would give my reviewed-by.

Yes, this is OK for MISRA.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

