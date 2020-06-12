Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB51F7766
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 13:41:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jji3L-0000s9-Qd; Fri, 12 Jun 2020 11:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=liIz=7Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jji3K-0000s4-OX
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:40:54 +0000
X-Inumbo-ID: 9274a550-aca1-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9274a550-aca1-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 11:40:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 330B3AD75;
 Fri, 12 Jun 2020 11:40:56 +0000 (UTC)
Subject: Re: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-3-volodymyr_babchuk@epam.com>
 <a40aac2a-326b-9efa-fed3-49826bb2ff9c@suse.com>
 <daf3aa1c6fa565076755437e7e74347b58e3a9b6.camel@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <918fa2e1-232c-a3ff-d0a9-776b470ee5db@suse.com>
Date: Fri, 12 Jun 2020 13:40:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <daf3aa1c6fa565076755437e7e74347b58e3a9b6.camel@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.20 13:30, Volodymyr Babchuk wrote:
> On Fri, 2020-06-12 at 06:43 +0200, Jürgen Groß wrote:
>> On 12.06.20 02:22, Volodymyr Babchuk wrote:
>>> +void vcpu_end_hyp_task(struct vcpu *v)
>>> +{
>>> +    int delta;
>>> +
>>> +    if ( is_idle_vcpu(v) )
>>> +        return;
>>> +
>>> +    ASSERT(v->in_hyp_task);
>>> +
>>> +    /* We assume that hypervisor task time will not overflow int */
>>
>> This will definitely happen for long running VMs. Please use a 64-bit
>> variable.
>>
> 
> It is not suposed to hold long time spans, as I described in the reply
> to previous email.
> 
>>> +    delta = NOW() - v->hyp_entry_time;
>>> +    atomic_add(delta, &v->sched_unit->hyp_time);
>>> +
>>> +#ifndef NDEBUG
>>> +    v->in_hyp_task = false;
>>> +#endif
>>> +}
>>> +
>>>    /*
>>>     * Do the actual movement of an unit from old to new CPU. Locks for *both*
>>>     * CPUs needs to have been taken already when calling this!
>>> @@ -2615,6 +2646,7 @@ static void schedule(void)
>>>    
>>>        SCHED_STAT_CRANK(sched_run);
>>>    
>>> +    vcpu_end_hyp_task(current);
>>>        rcu_read_lock(&sched_res_rculock);
>>>    
>>>        lock = pcpu_schedule_lock_irq(cpu);
>>> diff --git a/xen/common/softirq.c b/xen/common/softirq.c
>>> index 063e93cbe3..03a29384d1 100644
>>> --- a/xen/common/softirq.c
>>> +++ b/xen/common/softirq.c
>>> @@ -71,7 +71,9 @@ void process_pending_softirqs(void)
>>>    void do_softirq(void)
>>>    {
>>>        ASSERT_NOT_IN_ATOMIC();
>>> +    vcpu_begin_hyp_task(current);
>>>        __do_softirq(0);
>>> +    vcpu_end_hyp_task(current);
>>
>> This won't work for scheduling. current will either have changed,
>> or in x86 case __do_softirq() might just not return. You need to
>> handle that case explicitly in schedule() (you did that for the
>> old vcpu, but for the case schedule() is returning you need to
>> call vcpu_begin_hyp_task(current) there).
>>
> 
> Well, this is one of questions, I wanted to discuss. I certainly need
> to call vcpu_begin_hyp_task(current) after context switch. But what it
> is the right place? If my understaning is right, code on x86 platform
> will never reach this point. Or I'm wrong there?

No, this is correct.

You can add the call to context_switch() just after set_current() has
been called.


Juergen

