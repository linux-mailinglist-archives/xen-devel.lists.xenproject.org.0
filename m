Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C291E79A4
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 11:44:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebYL-0003P0-80; Fri, 29 May 2020 09:43:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mKAR=7L=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jebYJ-0003Ov-Ai
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 09:43:47 +0000
X-Inumbo-ID: e4427aea-a190-11ea-81bc-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4427aea-a190-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KOGKXrDjJc4HsAjRnN91cMB+Y4PI364zII3ohOgiF/M=; b=oUp7MPF2gnkkQGKGfM12cC9xpI
 yWySF2g0JuiwPL572jiNjXiLcGZt1t+ddke84y5LowrjQkfqdAl5mkxQXnbOU1m+KLAwBlJC79PJW
 C3ExR6eRpj4YDQWwhPMOoxrq8pE5XpAHDgdX6U8hHqNCNVeCn0XiaclYQu0cy/1247sc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jebYC-0008PD-Va; Fri, 29 May 2020 09:43:40 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jebYC-0000x7-BD; Fri, 29 May 2020 09:43:40 +0000
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <07a1008d-1acb-aab6-ab10-176e7856a296@xen.org>
Date: Fri, 29 May 2020 10:43:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

On 29/05/2020 09:13, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 28 May 2020, at 19:54, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> Thank you for the patch.
>>
>> On 28/05/2020 16:25, Bertrand Marquis wrote:
>>> At the moment on Arm, a Linux guest running with KTPI enabled will
>>> cause the following error when a context switch happens in user mode:
>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>>> This patch is modifying runstate handling to map the area given by the
>>> guest inside Xen during the hypercall.
>>> This is removing the guest virtual to physical conversion during context
>>> switches which removes the bug
>>
>> It would be good to spell out that a virtual address is not stable. So relying on it is wrong.
>>
>>> and improve performance by preventing to
>>> walk page tables during context switches.
>>
>> With Secret free hypervisor in mind, I would like to suggest to map/unmap the runstate during context switch.
>>
>> The cost should be minimal when there is a direct map (i.e on Arm64 and x86) and still provide better performance on Arm32.
> 
> Even with a minimal cost this is still adding some non real-time behaviour to the context switch.

Just to be clear, by minimal I meant the mapping part is just a 
virt_to_mfn() call and the unmapping is a NOP.

IHMO, if virt_to_mfn() ends up to add non-RT behavior then you have much 
bigger problem than just this call.

> But definitely from the security point of view as we have to map a page from the guest, we could have accessible in Xen some data that should not be there.
> There is a trade here where:
> - xen can protect by map/unmapping
> - a guest which wants to secure his data should either not use it or make sure there is nothing else in the page

Both are valid and depends on your setup. One may want to protect all 
the existing guests, so modifying a guest may not be a solution.

> 
> That sounds like a thread local storage kind of problematic where we want data from xen to be accessible fast from the guest and easy to be modified from xen.

Agree. On x86, they have a perdomain mapping so it would be possible to 
do it. We would need to add the feature on Arm.

> 
>>
>> The change should be minimal compare to the current approach but this could be taken care separately if you don't have time.
> 
> I could add that to the serie in a separate patch so that it can be discussed and test separately ?

If you are picking the task, then I would suggest to add it directly in 
this patch.

> 
>>
>>> --
>>> In the current status, this patch is only working on Arm and needs to
>>> be fixed on X86 (see #error on domain.c for missing get_page_from_gva).
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>>   xen/arch/arm/domain.c   | 32 +++++++++-------
>>>   xen/arch/x86/domain.c   | 51 ++++++++++++++-----------
>>>   xen/common/domain.c     | 84 ++++++++++++++++++++++++++++++++++-------
>>>   xen/include/xen/sched.h | 11 ++++--
>>>   4 files changed, 124 insertions(+), 54 deletions(-)
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 31169326b2..799b0e0103 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -278,33 +278,37 @@ static void ctxt_switch_to(struct vcpu *n)
>>>   /* Update per-VCPU guest runstate shared memory area (if registered). */
>>>   static void update_runstate_area(struct vcpu *v)
>>>   {
>>> -    void __user *guest_handle = NULL;
>>> -    struct vcpu_runstate_info runstate;
>>> +    struct vcpu_runstate_info *runstate;
>>>   -    if ( guest_handle_is_null(runstate_guest(v)) )
>>> +    /* XXX why do we accept not to block here */
>>> +    if ( !spin_trylock(&v->runstate_guest_lock) )
>>>           return;
>>>   -    memcpy(&runstate, &v->runstate, sizeof(runstate));
>>> +    runstate = runstate_guest(v);
>>> +
>>> +    if (runstate == NULL)
>>> +    {
>>> +        spin_unlock(&v->runstate_guest_lock);
>>> +        return;
>>> +    }
>>>         if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>>       {
>>> -        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
>>> -        guest_handle--;
>>> -        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
>>> -        __raw_copy_to_guest(guest_handle,
>>> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
>>> +        runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
>>>           smp_wmb();
>>
>> Because you set v->runstate.state_entry_time below, the placement of the barrier seems a bit odd.
>>
>> I would suggest to update v->runstate.state_entry_time first and then update runstate->state_entry_time.
> 
> We do want the guest to know when we modify the runstate so we need to make sure the XEN_RUNSTATE_UPDATE is actually set in a visible way before we do the memcpy.
> That’s why the barrier is after.

I think you misunderstood my comment here. I meant to write the 
following code:

v->runstate.state_entry_time = ...
runstate->state_entry_time = ...
smp_wmb()

So it is much clearer that the barrier is because 
runstate->state_entry_time needs to be updated before the memcpy().

>>> +
>>> +#ifdef CONFIG_ARM
>>> +    page = get_page_from_gva(v, area->addr.p, GV2M_WRITE);
>>
>> A guest is allowed to setup the runstate for a different vCPU than the current one. This will lead to get_page_from_gva() to fail as the function cannot yet work with a vCPU other than current.
> 
> If the area is mapped per cpu but isn’t the aim of this to have a way to check other cpus status ?

The aim is to collect how much time a vCPU has been unscheduled. This 
doesn't have to be run from a different vCPU.

Anyway, my point is the hypercall allows it today. If you want to make 
such restriction, then we need to agree on it and document it.

> 
>>
>> AFAICT, there is no restriction on when the runstate hypercall can be called. So this can even be called before the vCPU is brought up.
> 
> I understand the remark but it still feels very weird to allow an invalid address in an hypercall.
> Wouldn’t we have a lot of potential issues accepting an address that we cannot check ?

Well, that's why you see errors when using KPTI ;). If you use a global 
mapping, then it is not possible to continue without validating the address.

But to do this, you will have to put restriction on the hypercalls. I 
would be OK to make such restriction on Arm.

Cheers,

-- 
Julien Grall

