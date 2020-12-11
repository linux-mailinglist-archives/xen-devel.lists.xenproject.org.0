Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495B92D7F77
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 20:38:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50866.89685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knoET-0008Fx-BI; Fri, 11 Dec 2020 19:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50866.89685; Fri, 11 Dec 2020 19:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knoET-0008FY-8B; Fri, 11 Dec 2020 19:37:37 +0000
Received: by outflank-mailman (input) for mailman id 50866;
 Fri, 11 Dec 2020 19:37:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1knoER-0008FT-Ll
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 19:37:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knoEQ-00069T-HW; Fri, 11 Dec 2020 19:37:34 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knoEQ-0001Bi-3t; Fri, 11 Dec 2020 19:37:34 +0000
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
	bh=50C/8hgHJ0gb0loEo9qrkV4vBVsfJ8aByzF86l2MjbE=; b=oagEvo6AhxrWUFDTH2l8Oc/NeZ
	8i3eFp65F3z+gAV7aQe7u3B9+O0AZ34kUK2Mcmsjx6W8GNUbAouSzKjAKav0jOJnIIAXvBnxwiED0
	Y5+tikDdQbC4DoR68BfbtRJBLSTmiFD20I2D/fKDpFuOiUjF8b67YSdIO1yitGTuqO84=;
Subject: Re: [PATCH V3 21/23] xen/arm: Add mapcache invalidation handling
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-22-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2012091822300.20986@sstabellini-ThinkPad-T480s>
 <a6897469-f031-e49d-0b4c-b1aa10d66d6d@xen.org>
 <alpine.DEB.2.21.2012101443060.20986@sstabellini-ThinkPad-T480s>
 <7c8a9ad9-2b18-7028-17bc-20ee5a341323@gmail.com>
 <alpine.DEB.2.21.2012111105520.10222@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <945a5444-dc96-5f47-854c-b42b1d17ce0b@xen.org>
Date: Fri, 11 Dec 2020 19:37:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012111105520.10222@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 11/12/2020 19:07, Stefano Stabellini wrote:
> On Fri, 11 Dec 2020, Oleksandr wrote:
>> On 11.12.20 03:28, Stefano Stabellini wrote:
>>> On Thu, 10 Dec 2020, Julien Grall wrote:
>>>> On 10/12/2020 02:30, Stefano Stabellini wrote:
>>>>> On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>
>>>>>> We need to send mapcache invalidation request to qemu/demu everytime
>>>>>> the page gets removed from a guest.
>>>>>>
>>>>>> At the moment, the Arm code doesn't explicitely remove the existing
>>>>>> mapping before inserting the new mapping. Instead, this is done
>>>>>> implicitely by __p2m_set_entry().
>>>>>>
>>>>>> So we need to recognize a case when old entry is a RAM page *and*
>>>>>> the new MFN is different in order to set the corresponding flag.
>>>>>> The most suitable place to do this is p2m_free_entry(), there
>>>>>> we can find the correct leaf type. The invalidation request
>>>>>> will be sent in do_trap_hypercall() later on.
>>>>> Why is it sent in do_trap_hypercall() ?
>>>> I believe this is following the approach used by x86. There are actually
>>>> some
>>>> discussion about it (see [1]).
>>>>
>>>> Leaving aside the toolstack case for now, AFAIK, the only way a guest can
>>>> modify its p2m is via an hypercall. Do you have an example otherwise?
>>> OK this is a very important assumption. We should write it down for sure.
>>> I think it is true today on ARM.
>>>
>>>
>>>> When sending the invalidation request, the vCPU will be blocked until all
>>>> the
>>>> IOREQ server have acknowledged the invalidation. So the hypercall seems to
>>>> be
>>>> the best position to do it.
>>>>
>>>> Alternatively, we could use check_for_vcpu_work() to check if the mapcache
>>>> needs to be invalidated. The inconvenience is we would execute a few more
>>>> instructions in each entry/exit path.
>>> Yeah it would be more natural to call it from check_for_vcpu_work(). If
>>> we put it between #ifdef CONFIG_IOREQ_SERVER it wouldn't be bad. But I
>>> am not a fan of increasing the instructions on the exit path either.
>>>   From this point of view, putting it at the end of do_trap_hypercall is a
>>> nice trick actually. Let's just make sure it has a good comment on top.
>>>
>>>
>>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>> CC: Julien Grall <julien.grall@arm.com>
>>>>>>
>>>>>> ---
>>>>>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>>>>>> "Add support for Guest IO forwarding to a device emulator"
>>>>>>
>>>>>> Changes V1 -> V2:
>>>>>>       - new patch, some changes were derived from (+ new explanation):
>>>>>>         xen/ioreq: Make x86's invalidate qemu mapcache handling common
>>>>>>       - put setting of the flag into __p2m_set_entry()
>>>>>>       - clarify the conditions when the flag should be set
>>>>>>       - use domain_has_ioreq_server()
>>>>>>       - update do_trap_hypercall() by adding local variable
>>>>>>
>>>>>> Changes V2 -> V3:
>>>>>>       - update patch description
>>>>>>       - move check to p2m_free_entry()
>>>>>>       - add a comment
>>>>>>       - use "curr" instead of "v" in do_trap_hypercall()
>>>>>> ---
>>>>>> ---
>>>>>>     xen/arch/arm/p2m.c   | 24 ++++++++++++++++--------
>>>>>>     xen/arch/arm/traps.c | 13 ++++++++++---
>>>>>>     2 files changed, 26 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>>>>> index 5b8d494..9674f6f 100644
>>>>>> --- a/xen/arch/arm/p2m.c
>>>>>> +++ b/xen/arch/arm/p2m.c
>>>>>> @@ -1,6 +1,7 @@
>>>>>>     #include <xen/cpu.h>
>>>>>>     #include <xen/domain_page.h>
>>>>>>     #include <xen/iocap.h>
>>>>>> +#include <xen/ioreq.h>
>>>>>>     #include <xen/lib.h>
>>>>>>     #include <xen/sched.h>
>>>>>>     #include <xen/softirq.h>
>>>>>> @@ -749,17 +750,24 @@ static void p2m_free_entry(struct p2m_domain
>>>>>> *p2m,
>>>>>>         if ( !p2m_is_valid(entry) )
>>>>>>             return;
>>>>>>     -    /* Nothing to do but updating the stats if the entry is a
>>>>>> super-page. */
>>>>>> -    if ( p2m_is_superpage(entry, level) )
>>>>>> +    if ( p2m_is_superpage(entry, level) || (level == 3) )
>>>>>>         {
>>>>>> -        p2m->stats.mappings[level]--;
>>>>>> -        return;
>>>>>> -    }
>>>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>>>> +        /*
>>>>>> +         * If this gets called (non-recursively) then either the
>>>>>> entry
>>>>>> +         * was replaced by an entry with a different base (valid
>>>>>> case) or
>>>>>> +         * the shattering of a superpage was failed (error case).
>>>>>> +         * So, at worst, the spurious mapcache invalidation might be
>>>>>> sent.
>>>>>> +         */
>>>>>> +        if ( domain_has_ioreq_server(p2m->domain) &&
>>>>>> +             (p2m->domain == current->domain) &&
>>>>>> p2m_is_ram(entry.p2m.type) )
>>>>>> +            p2m->domain->mapcache_invalidate = true;
>>>>> Why the (p2m->domain == current->domain) check? Shouldn't we set
>>>>> mapcache_invalidate to true anyway? What happens if p2m->domain !=
>>>>> current->domain? We wouldn't want the domain to lose the
>>>>> mapcache_invalidate notification.
>>>> This is also discussed in [1]. :) The main question is why would a
>>>> toolstack/device model modify the guest memory after boot?
>>>>
>>>> If we assume it does, then the device model would need to pause the domain
>>>> before modifying the RAM.
>>>>
>>>> We also need to make sure that all the IOREQ servers have invalidated
>>>> the mapcache before the domain run again.
>>>>
>>>> This would require quite a bit of work. I am not sure the effort is worth
>>>> if
>>>> there are no active users today.
>>> OK, that explains why we think p2m->domain == current->domain, but why
>>> do we need to have a check for it right here?
>>>
>>> In other words, we don't think it is realistc to get here with
>>> p2m->domain != current->domain, but let's say that we do somehow. What's
>>> the best course of action? Probably, set mapcache_invalidate to true and
>>> possibly print a warning?
>>>
>>> Leaving mapcache_invalidate to false doesn't seem to be what we want to
>>> do?
>>>
>>>    
>>>>>>         BUILD_BUG_ON(NR_hypercalls < ARRAY_SIZE(arm_hypercall_table) );
>>>>>>     @@ -1459,7 +1460,7 @@ static void do_trap_hypercall(struct
>>>>>> cpu_user_regs
>>>>>> *regs, register_t *nr,
>>>>>>             return;
>>>>>>         }
>>>>>>     -    current->hcall_preempted = false;
>>>>>> +    curr->hcall_preempted = false;
>>>>>>           perfc_incra(hypercalls, *nr);
>>>>>>         call = arm_hypercall_table[*nr].fn;
>>>>>> @@ -1472,7 +1473,7 @@ static void do_trap_hypercall(struct
>>>>>> cpu_user_regs
>>>>>> *regs, register_t *nr,
>>>>>>         HYPERCALL_RESULT_REG(regs) = call(HYPERCALL_ARGS(regs));
>>>>>>       #ifndef NDEBUG
>>>>>> -    if ( !current->hcall_preempted )
>>>>>> +    if ( !curr->hcall_preempted )
>>>>>>         {
>>>>>>             /* Deliberately corrupt parameter regs used by this
>>>>>> hypercall.
>>>>>> */
>>>>>>             switch ( arm_hypercall_table[*nr].nr_args ) {
>>>>>> @@ -1489,8 +1490,14 @@ static void do_trap_hypercall(struct
>>>>>> cpu_user_regs
>>>>>> *regs, register_t *nr,
>>>>>>     #endif
>>>>>>           /* Ensure the hypercall trap instruction is re-executed. */
>>>>>> -    if ( current->hcall_preempted )
>>>>>> +    if ( curr->hcall_preempted )
>>>>>>             regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
>>>>>> +
>>>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>>>> +    if ( unlikely(curr->domain->mapcache_invalidate) &&
>>>>>> +         test_and_clear_bool(curr->domain->mapcache_invalidate) )
>>>>>> +        ioreq_signal_mapcache_invalidate();
>>>>> Why not just:
>>>>>
>>>>> if ( unlikely(test_and_clear_bool(curr->domain->mapcache_invalidate)) )
>>>>>        ioreq_signal_mapcache_invalidate();
>>>>>
>>>> This seems to match the x86 code. My guess is they tried to prevent the
>>>> cost
>>>> of the atomic operation if there is no chance mapcache_invalidate is true.
>>>>
>>>> I am split whether the first check is worth it. The atomic operation
>>>> should be
>>>> uncontended most of the time, so it should be quick. But it will always be
>>>> slower than just a read because there is always a store involved.
>>> I am not a fun of optimizations with unclear benefits :-)
>>>
>>>
>>>> On a related topic, Jan pointed out that the invalidation would not work
>>>> properly if you have multiple vCPU modifying the P2M at the same time.
>>>>
>> Thanks to Julien, he explained all bits in detail. Indeed I followed how it
>> was done on x86 (place where to send the invalidation request, the code to
>> check whether the flag is set, which at first glance, appears odd, etc)
>> and review comments (to latch current into the local variable, and make sure
>> that domain sends invalidation request on itself).
>> Regarding what to do if p2m->domain != current->domain in p2m_free_entry().
>> Probably we could set flag only if guest is paused, otherwise just print a
>> warning. Thoughts?
> 
> I'd do something like:
> 
> if ( domain_has_ioreq_server(p2m->domain) && p2m_is_ram(entry.p2m.type) )
> {
>      WARN_ON(p2m->domain != current->domain)

IOREQ server are not trusted. Yet they will be able to reach this patch 
if one re-use the stubdomain model (they are allowed to modify guest 
layout).

So this change would hand a DoS attack to the IOREQ server on a silver 
platter :).

In general, we should avoid to use WARN_ON() for things that can be 
triggered by a domain. Instead we should use gprintk(XENLOG_WARNING, 
"...") to allow rate-limit.

On the cons side, it would be more difficult to spot any misue with a 
gprintk().

>      p2m->domain->mapcache_invalidate = true;
> }
> 
> but maybe Julien has a better idea.

I suggested a different approach and some rationale in answer to your 
e-mail. Although, I am not sure if we could call it a better approach 
:). We can continue the discusison there.

Cheers,

-- 
Julien Grall

