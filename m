Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554D4323A2E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 11:08:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89233.167914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEr5X-0005r5-74; Wed, 24 Feb 2021 10:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89233.167914; Wed, 24 Feb 2021 10:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEr5X-0005qg-3q; Wed, 24 Feb 2021 10:08:11 +0000
Received: by outflank-mailman (input) for mailman id 89233;
 Wed, 24 Feb 2021 10:08:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lEr5W-0005qb-Hd
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:08:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEr5S-0002sJ-NW; Wed, 24 Feb 2021 10:08:06 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEr5S-0002gl-8T; Wed, 24 Feb 2021 10:08:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=P8UPJzC3UVnf2vnPo+e/z/VoBKXYTUsIKLcYt3UxOws=; b=S+tjCUX2+lMsgcde0UJSc5xqfC
	SOYWAddDIDu6cRN4uQowvGNNPglvZK/OABG0tRiaj8JZEPb2uaOTHYLtYv5o6+gngwkFyB5mnhbFS
	DzcZdDZeAk/XaStL1pVjp9pBjQLesgc6EDN0ac44p5+ZA1tZkLTdJfSziKkIYzSP6uzw=;
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <e6d8726c-4074-fe4c-dbbe-e879da2bb7f6@xen.org> <87zgzv56pm.fsf@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c1c55bcb-dfd4-a552-836a-985268655cf1@xen.org>
Date: Wed, 24 Feb 2021 10:08:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87zgzv56pm.fsf@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/02/2021 12:06, Volodymyr Babchuk wrote:
> 
> Hi Julien,

Hi Volodymyr,

> Julien Grall writes:
>> On 23/02/2021 02:34, Volodymyr Babchuk wrote:
>> ... just rescheduling the vCPU. It will also give the opportunity for
>> the guest to handle interrupts.
>>
>> If you don't return to the guest, then risk to get an RCU sched stall
>> on that the vCPU (some hypercalls can take really really long).
> 
> Ah yes, you are right. I'd only wish that hypervisor saved context of
> hypercall on it's side...
> 
> I have example of OP-TEE before my eyes. They have special return code
> "task was interrupted" and they use separate call "continue execution of
> interrupted task", which takes opaque context handle as a
> parameter. With this approach state of interrupted call never leaks to > rest of the system.

Feel free to suggest a new approach for the hypercals.

>>
>>> This approach itself have obvious
>>> problems: code that executes hypercall is responsible for preemption,
>>> preemption checks are infrequent (because they are costly by
>>> themselves), hypercall execution state is stored in guest-controlled
>>> area, we rely on guest's good will to continue the hypercall.
>>
>> Why is it a problem to rely on guest's good will? The hypercalls
>> should be preempted at a boundary that is safe to continue.
> 
> Yes, and it imposes restrictions on how to write hypercall
> handler.
> In other words, there are much more places in hypercall handler code
> where it can be preempted than where hypercall continuation can be
> used. For example, you can preempt hypercall that holds a mutex, but of
> course you can't create an continuation point in such place.

I disagree, you can create continuation point in such place. Although it 
will be more complex because you have to make sure you break the work in 
a restartable place.

I would also like to point out that preemption also have some drawbacks.
With RT in mind, you have to deal with priority inversion (e.g. a lower 
priority vCPU held a mutex that is required by an higher priority).

Outside of RT, you have to be careful where mutex are held. In your 
earlier answer, you suggested to held mutex for the memory allocation. 
If you do that, then it means a domain A can block allocation for domain 
B as it helds the mutex.

This can lead to quite serious problem if domain A cannot run (because 
it exhausted its credit) for a long time.

> 
>>> All this
>>> imposes restrictions on which hypercalls can be preempted, when they
>>> can be preempted and how to write hypercall handlers. Also, it
>>> requires very accurate coding and already led to at least one
>>> vulnerability - XSA-318. Some hypercalls can not be preempted at all,
>>> like the one mentioned in [1].
>>> Absence of hypervisor threads/vCPUs. Hypervisor owns only idle
>>> vCPUs,
>>> which are supposed to run when the system is idle. If hypervisor needs
>>> to execute own tasks that are required to run right now, it have no
>>> other way than to execute them on current vCPU. But scheduler does not
>>> know that hypervisor executes hypervisor task and accounts spent time
>>> to a domain. This can lead to domain starvation.
>>> Also, absence of hypervisor threads leads to absence of high-level
>>> synchronization primitives like mutexes, conditional variables,
>>> completions, etc. This leads to two problems: we need to use spinlocks
>>> everywhere and we have problems when porting device drivers from linux
>>> kernel.
>>> Proposed solution
>>> =================
>>> It is quite obvious that to fix problems above we need to allow
>>> preemption in hypervisor mode. I am not familiar with x86 side, but
>>> for the ARM it was surprisingly easy to implement. Basically, vCPU
>>> context in hypervisor mode is determined by its stack at general
>>> purpose registers. And __context_switch() function perfectly switches
>>> them when running in hypervisor mode. So there are no hard
>>> restrictions, why it should be called only in leave_hypervisor() path.
>>> The obvious question is: when we should to try to preempt running
>>> vCPU?  And answer is: when there was an external event. This means
>>> that we should try to preempt only when there was an interrupt request
>>> where we are running in hypervisor mode. On ARM, in this case function
>>> do_trap_irq() is called. Problem is that IRQ handler can be called
>>> when vCPU is already in atomic state (holding spinlock, for
>>> example). In this case we should try to preempt right after leaving
>>> atomic state. This is basically all the idea behind this PoC.
>>> Now, about the series composition.
>>> Patches
>>>     sched: core: save IRQ state during locking
>>>     sched: rt: save IRQ state during locking
>>>     sched: credit2: save IRQ state during locking
>>>     preempt: use atomic_t to for preempt_count
>>>     arm: setup: disable preemption during startup
>>>     arm: context_switch: allow to run with IRQs already disabled
>>> prepare the groundwork for the rest of PoC. It appears that not all
>>> code is ready to be executed in IRQ state, and schedule() now can be
>>> called at end of do_trap_irq(), which technically is considered IRQ
>>> handler state. Also, it is unwise to try preempt things when we are
>>> still booting, so ween to enable atomic context during the boot
>>> process.
>>
>> I am really surprised that this is the only changes necessary in
>> Xen. For a first approach, we may want to be conservative when the
>> preemption is happening as I am not convinced that all the places are
>> safe to preempt.
>>
> 
> Well, I can't say that I ran extensive tests, but I played with this for
> some time and it seemed quite stable. Of course, I had some problems
> with RTDS...
> 
> As I see it, Xen is already supports SMP, so all places where races are
> possible should already be covered by spinlocks or taken into account by
> some other means.
That's correct for shared resources. I am more worried for any 
hypercalls that expected to run more or less continuously (e.g not 
taking into account interrupt) on the same pCPU.

> 
> Places which may not be safe to preempt are clustered around task
> management code itself: schedulers, xen entry/exit points, vcpu
> creation/destruction and such.
> 
> For example, for sure we do not want to destroy vCPU which was preempted
> in hypervisor mode. I didn't covered this case, by the way.
> 
>>> Patches
>>>     preempt: add try_preempt() function
>>>     sched: core: remove ASSERT_NOT_IN_ATOMIC and disable preemption[!]
>>>     arm: traps: try to preempt before leaving IRQ handler
>>> are basically the core of this PoC. try_preempt() function tries to
>>> preempt vCPU when either called by IRQ handler and when leaving atomic
>>> state. Scheduler now enters atomic state to ensure that it will not
>>> preempt self. do_trap_irq() calls try_preempt() to initiate preemption.
>>
>> AFAICT, try_preempt() will deal with the rescheduling. But how about
>> softirqs? Don't we want to handle them in try_preempt() as well?
> 
> Well, yes and no. We have the following softirqs:
> 
>   TIMER_SOFTIRQ - should be called, I believe
>   RCU_SOFTIRQ - I'm not sure about this, but probably no

When would you call RCU callback then?

>   SCHED_SLAVE_SOFTIRQ - no
>   SCHEDULE_SOFTIRQ - no
>   NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ - should be moved to a separate
>   thread, maybe?
>   TASKLET_SOFTIRQ - should be moved to a separate thread >
> So, looks like only timers should be handled for sure.
> 
>>
>> [...]
>>
>>> Conclusion
>>> ==========
>>> My main intention is to begin discussion of hypervisor
>>> preemption. As
>>> I showed, it is doable right away and provides some immediate
>>> benefits. I do understand that proper implementation requires much
>>> more efforts. But we are ready to do this work if community is
>>> interested in it.
>>> Just to reiterate main benefits:
>>> 1. More controllable latency. On embedded systems customers care
>>> about
>>> such things.
>>
>> Is the plan to only offer preemptible Xen?
>>
> 
> Sorry, didn't get the question.

What's your plan for the preemption support? Will an admin be able to 
configure Xen to be either preemptible or not?

Cheers,

-- 
Julien Grall

