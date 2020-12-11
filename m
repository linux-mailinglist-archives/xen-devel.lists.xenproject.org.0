Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76F2D7F56
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 20:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50859.89672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kno4b-0007BU-Ci; Fri, 11 Dec 2020 19:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50859.89672; Fri, 11 Dec 2020 19:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kno4b-0007B5-9O; Fri, 11 Dec 2020 19:27:25 +0000
Received: by outflank-mailman (input) for mailman id 50859;
 Fri, 11 Dec 2020 19:27:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kno4Z-0007B0-PP
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 19:27:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kno4X-0005wj-6i; Fri, 11 Dec 2020 19:27:21 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kno4W-0000TP-Pd; Fri, 11 Dec 2020 19:27:21 +0000
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
	bh=gVVjjCCI/pCicmPL4u6pBHMA3vdJbw4qNPi8EGaFJUU=; b=3GyQ5Ze5VMUMkjQOQaBJi5qGgE
	oqwXFk87VgujU6iKsD+8g7mwm8cy2yCacQ8uNfSTLPTRI9y9sBNH6yk50ORtMIWHBzDvtqTc63n42
	H01DYDNvRtYpeoj5i+UHJOSEc55BcmhOoeXhFG+jl8a/lnME5Gux7JiyB9iBpomUigy8=;
Subject: Re: [PATCH V3 21/23] xen/arm: Add mapcache invalidation handling
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-22-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2012091822300.20986@sstabellini-ThinkPad-T480s>
 <a6897469-f031-e49d-0b4c-b1aa10d66d6d@xen.org>
 <alpine.DEB.2.21.2012101443060.20986@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <388a7e92-1881-c68e-dd7c-8c9c119c1be4@xen.org>
Date: Fri, 11 Dec 2020 19:27:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012101443060.20986@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 11/12/2020 01:28, Stefano Stabellini wrote:
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> CC: Julien Grall <julien.grall@arm.com>
>>>>
>>>> ---
>>>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>>>> "Add support for Guest IO forwarding to a device emulator"
>>>>
>>>> Changes V1 -> V2:
>>>>      - new patch, some changes were derived from (+ new explanation):
>>>>        xen/ioreq: Make x86's invalidate qemu mapcache handling common
>>>>      - put setting of the flag into __p2m_set_entry()
>>>>      - clarify the conditions when the flag should be set
>>>>      - use domain_has_ioreq_server()
>>>>      - update do_trap_hypercall() by adding local variable
>>>>
>>>> Changes V2 -> V3:
>>>>      - update patch description
>>>>      - move check to p2m_free_entry()
>>>>      - add a comment
>>>>      - use "curr" instead of "v" in do_trap_hypercall()
>>>> ---
>>>> ---
>>>>    xen/arch/arm/p2m.c   | 24 ++++++++++++++++--------
>>>>    xen/arch/arm/traps.c | 13 ++++++++++---
>>>>    2 files changed, 26 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>>> index 5b8d494..9674f6f 100644
>>>> --- a/xen/arch/arm/p2m.c
>>>> +++ b/xen/arch/arm/p2m.c
>>>> @@ -1,6 +1,7 @@
>>>>    #include <xen/cpu.h>
>>>>    #include <xen/domain_page.h>
>>>>    #include <xen/iocap.h>
>>>> +#include <xen/ioreq.h>
>>>>    #include <xen/lib.h>
>>>>    #include <xen/sched.h>
>>>>    #include <xen/softirq.h>
>>>> @@ -749,17 +750,24 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>>>>        if ( !p2m_is_valid(entry) )
>>>>            return;
>>>>    -    /* Nothing to do but updating the stats if the entry is a
>>>> super-page. */
>>>> -    if ( p2m_is_superpage(entry, level) )
>>>> +    if ( p2m_is_superpage(entry, level) || (level == 3) )
>>>>        {
>>>> -        p2m->stats.mappings[level]--;
>>>> -        return;
>>>> -    }
>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>> +        /*
>>>> +         * If this gets called (non-recursively) then either the entry
>>>> +         * was replaced by an entry with a different base (valid case) or
>>>> +         * the shattering of a superpage was failed (error case).
>>>> +         * So, at worst, the spurious mapcache invalidation might be
>>>> sent.
>>>> +         */
>>>> +        if ( domain_has_ioreq_server(p2m->domain) &&

Hmmm... I didn't realize that you were going to call 
domain_has_ioreq_server() here. Per your comment, this can only be 
called when on p2m->domain == current.

One way would be to switch the two check. However, I am not entirely 
sure this is necessary. I see no issue to always set mapcache_invalidate 
even if there are no IOREQ server available.

>>>> +             (p2m->domain == current->domain) &&
>>>> p2m_is_ram(entry.p2m.type) )
>>>> +            p2m->domain->mapcache_invalidate = true;
>>>
>>> Why the (p2m->domain == current->domain) check? Shouldn't we set
>>> mapcache_invalidate to true anyway? What happens if p2m->domain !=
>>> current->domain? We wouldn't want the domain to lose the
>>> mapcache_invalidate notification.
>>
>> This is also discussed in [1]. :) The main question is why would a
>> toolstack/device model modify the guest memory after boot?
>>
>> If we assume it does, then the device model would need to pause the domain
>> before modifying the RAM.
>>
>> We also need to make sure that all the IOREQ servers have invalidated
>> the mapcache before the domain run again.
>>
>> This would require quite a bit of work. I am not sure the effort is worth if
>> there are no active users today.
> 
> OK, that explains why we think p2m->domain == current->domain, but why
> do we need to have a check for it right here?
> 
> In other words, we don't think it is realistc to get here with
> p2m->domain != current->domain, but let's say that we do somehow.

I am guessing by "here", you mean in the situation where a RAM entry 
would be removed. Is it correct? If so yes, I don't believe this should 
happen today (even at domain creation/destruction).

> What's
> the best course of action?

The best course of action would be to forward the invalidation to *all* 
the IOREQ servers and wait for it before the domain can run again.

> Probably, set mapcache_invalidate to true and
> possibly print a warning?
So if the toolstack (or an IOREQ server ends to up use it), then we need 
to make sure all the IOREQ server have invalidated the mapcache before 
the domain can run again.

> 
> Leaving mapcache_invalidate to false doesn't seem to be what we want to
> do?

Setting to true/false is not going to be very helful because the guest 
may never issue an hypercall.

Without any more work, the guest may get corrupted. So I would suggest 
to either prevent the P2M to be modified after the domain has been 
created and before it is destroyed (it more a stopgap) or fix it properly.

>>>>        BUILD_BUG_ON(NR_hypercalls < ARRAY_SIZE(arm_hypercall_table) );
>>>>    @@ -1459,7 +1460,7 @@ static void do_trap_hypercall(struct cpu_user_regs
>>>> *regs, register_t *nr,
>>>>            return;
>>>>        }
>>>>    -    current->hcall_preempted = false;
>>>> +    curr->hcall_preempted = false;
>>>>          perfc_incra(hypercalls, *nr);
>>>>        call = arm_hypercall_table[*nr].fn;
>>>> @@ -1472,7 +1473,7 @@ static void do_trap_hypercall(struct cpu_user_regs
>>>> *regs, register_t *nr,
>>>>        HYPERCALL_RESULT_REG(regs) = call(HYPERCALL_ARGS(regs));
>>>>      #ifndef NDEBUG
>>>> -    if ( !current->hcall_preempted )
>>>> +    if ( !curr->hcall_preempted )
>>>>        {
>>>>            /* Deliberately corrupt parameter regs used by this hypercall.
>>>> */
>>>>            switch ( arm_hypercall_table[*nr].nr_args ) {
>>>> @@ -1489,8 +1490,14 @@ static void do_trap_hypercall(struct cpu_user_regs
>>>> *regs, register_t *nr,
>>>>    #endif
>>>>          /* Ensure the hypercall trap instruction is re-executed. */
>>>> -    if ( current->hcall_preempted )
>>>> +    if ( curr->hcall_preempted )
>>>>            regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
>>>> +
>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>> +    if ( unlikely(curr->domain->mapcache_invalidate) &&
>>>> +         test_and_clear_bool(curr->domain->mapcache_invalidate) )
>>>> +        ioreq_signal_mapcache_invalidate();
>>>
>>> Why not just:
>>>
>>> if ( unlikely(test_and_clear_bool(curr->domain->mapcache_invalidate)) )
>>>       ioreq_signal_mapcache_invalidate();
>>>
>>
>> This seems to match the x86 code. My guess is they tried to prevent the cost
>> of the atomic operation if there is no chance mapcache_invalidate is true.
>>
>> I am split whether the first check is worth it. The atomic operation should be
>> uncontended most of the time, so it should be quick. But it will always be
>> slower than just a read because there is always a store involved.
> 
> I am not a fun of optimizations with unclear benefits :-)

I thought a bit more about it and I am actually leaning towards keeping 
the first check.

The common implementation of the hypercall path is mostly (if not all) 
accessing per-vCPU variables. So the hypercalls can mostly work 
independently (at least in the common part).

Assuming we drop the first check, we would now be writing to a 
per-domain variable at every hypercall. You are probably going to notice 
performance impact if you were going to benchmark concurrent no-op 
hypercall, because the cache line is going to bounce (because of the write).

Arguably, this may become noise if you execute a full hypercall. But I 
would still like to treat the common hypercall path as the entry/exit 
path. IOW, I would like to be careful in what we add there.

The main reason is hypercalls may be used quite a lot by PV backends or 
device emulator (if we think about Virtio).

If we decided to move the change in the entry/exit path, then it would
definitely be an issue for the reasons I explained above. So I would 
also like to avoid the write in shared variable if we can.

FAOD, I am not saying this optmization will save the world :). I am sure 
there will be more (in particular in the vGIC part) in order to get 
Virtio performance in par with PV backends on Xen.

This discussion would also be moot if ...

> 
>> On a related topic, Jan pointed out that the invalidation would not work
>> properly if you have multiple vCPU modifying the P2M at the same time.

... we had a per-vCPU flag instead.

Cheers,

-- 
Julien Grall

