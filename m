Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A5219399C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 08:27:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHMsX-0003mv-9S; Thu, 26 Mar 2020 07:24:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BM0P=5L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jHMsW-0003mq-5I
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 07:24:36 +0000
X-Inumbo-ID: d7bdc3f0-6f32-11ea-875c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7bdc3f0-6f32-11ea-875c-12813bfff9fa;
 Thu, 26 Mar 2020 07:24:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C3EF2ABF6;
 Thu, 26 Mar 2020 07:24:33 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <20200325105511.20882-1-jgross@suse.com>
 <20200325105511.20882-3-jgross@suse.com>
 <1c688233-2f64-9dd0-7d98-4a0840489293@xen.org>
 <5950cabe-0065-904c-6c61-0e6eab8f8060@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7539a91f-6b9a-865d-f8c3-b8124d16f17a@suse.com>
Date: Thu, 26 Mar 2020 08:24:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5950cabe-0065-904c-6c61-0e6eab8f8060@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v7 2/5] xen/rcu: don't use
 stop_machine_run() for rcu_barrier()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.20 07:58, Jan Beulich wrote:
> On 25.03.2020 17:13, Julien Grall wrote:
>> On 25/03/2020 10:55, Juergen Gross wrote:
>>> @@ -143,51 +143,90 @@ static int qhimark = 10000;
>>>    static int qlowmark = 100;
>>>    static int rsinterval = 1000;
>>>    -struct rcu_barrier_data {
>>> -    struct rcu_head head;
>>> -    atomic_t *cpu_count;
>>> -};
>>> +/*
>>> + * rcu_barrier() handling:
>>> + * Two counters are used to synchronize rcu_barrier() work:
>>> + * - cpu_count holds the number of cpus required to finish barrier handling.
>>> + *   It is decremented by each cpu when it has performed all pending rcu calls.
>>> + * - pending_count shows whether any rcu_barrier() activity is running and
>>> + *   it is used to synchronize leaving rcu_barrier() only after all cpus
>>> + *   have finished their processing. pending_count is initialized to nr_cpus + 1
>>> + *   and it is decremented by each cpu when it has seen that cpu_count has
>>> + *   reached 0. The cpu where rcu_barrier() has been called will wait until
>>> + *   pending_count has been decremented to 1 (so all cpus have seen cpu_count
>>> + *   reaching 0) and will then set pending_count to 0 indicating there is no
>>> + *   rcu_barrier() running.
>>> + * Cpus are synchronized via softirq mechanism. rcu_barrier() is regarded to
>>> + * be active if pending_count is not zero. In case rcu_barrier() is called on
>>> + * multiple cpus it is enough to check for pending_count being not zero on entry
>>> + * and to call process_pending_softirqs() in a loop until pending_count drops to
>>> + * zero, before starting the new rcu_barrier() processing.
>>> + */
>>> +static atomic_t cpu_count = ATOMIC_INIT(0);
>>> +static atomic_t pending_count = ATOMIC_INIT(0);
>>>      static void rcu_barrier_callback(struct rcu_head *head)
>>>    {
>>> -    struct rcu_barrier_data *data = container_of(
>>> -        head, struct rcu_barrier_data, head);
>>> -    atomic_inc(data->cpu_count);
>>> +    smp_mb__before_atomic();     /* Make all writes visible to other cpus. */
>>
>> smp_mb__before_atomic() will order both read and write. However, the
>> comment suggest only the write are required to be ordered.
>>
>> So either the barrier is too strong or the comment is incorrect. Can
>> you clarify it?
> 
> Neither is the case, I guess: There simply is no smp_wmb__before_atomic()
> in Linux, and if we want to follow their model we shouldn't have one
> either. I'd rather take the comment to indicate that if one appeared, it
> could be used here.

Right. Currently we have the choice of either using
smp_mb__before_atomic() which is too strong for Arm, or smp_wmb() which
is too strong for x86.

> 
>>> +    atomic_dec(&cpu_count);
>>>    }
>>>    -static int rcu_barrier_action(void *_cpu_count)
>>> +static void rcu_barrier_action(void)
>>>    {
>>> -    struct rcu_barrier_data data = { .cpu_count = _cpu_count };
>>> -
>>> -    ASSERT(!local_irq_is_enabled());
>>> -    local_irq_enable();
>>> +    struct rcu_head head;
>>>          /*
>>>         * When callback is executed, all previously-queued RCU work on this CPU
>>> -     * is completed. When all CPUs have executed their callback, data.cpu_count
>>> -     * will have been incremented to include every online CPU.
>>> +     * is completed. When all CPUs have executed their callback, cpu_count
>>> +     * will have been decremented to 0.
>>>         */
>>> -    call_rcu(&data.head, rcu_barrier_callback);
>>> +    call_rcu(&head, rcu_barrier_callback);
>>>    -    while ( atomic_read(data.cpu_count) != num_online_cpus() )
>>> +    while ( atomic_read(&cpu_count) )
>>>        {
>>>            process_pending_softirqs();
>>>            cpu_relax();
>>>        }
>>>    -    local_irq_disable();
>>> -
>>> -    return 0;
>>> +    smp_mb__before_atomic();
>>> +    atomic_dec(&pending_count);
>>>    }
>>>    -/*
>>> - * As rcu_barrier() is using stop_machine_run() it is allowed to be used in
>>> - * idle context only (see comment for stop_machine_run()).
>>> - */
>>> -int rcu_barrier(void)
>>> +void rcu_barrier(void)
>>>    {
>>> -    atomic_t cpu_count = ATOMIC_INIT(0);
>>> -    return stop_machine_run(rcu_barrier_action, &cpu_count, NR_CPUS);
>>> +    unsigned int n_cpus;
>>> +
>>> +    ASSERT(!in_irq() && local_irq_is_enabled());
>>> +
>>> +    for ( ; ; )
>>> +    {
>>> +        if ( !atomic_read(&pending_count) && get_cpu_maps() )
>>> +        {
>>> +            n_cpus = num_online_cpus();
>>> +
>>> +            if ( atomic_cmpxchg(&pending_count, 0, n_cpus + 1) == 0 )
>>> +                break;
>>> +
>>> +            put_cpu_maps();
>>> +        }
>>> +
>>> +        process_pending_softirqs();
>>> +        cpu_relax();
>>> +    }
>>> +
>>> +    smp_mb__before_atomic();
>>
>> Our semantic of atomic_cmpxchg() is exactly the same as Linux. I.e
>> it will contain a full barrier when the cmpxchg succeed. So why do you need this barrier?
> 
> I was me I think to have (wrongly) suggested a barrier was missing
> here, sorry.

I'll update the patch dropping the barrier.


Juergen

