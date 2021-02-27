Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FBE326D67
	for <lists+xen-devel@lfdr.de>; Sat, 27 Feb 2021 15:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90853.171928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lG0cU-0006hV-Vo; Sat, 27 Feb 2021 14:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90853.171928; Sat, 27 Feb 2021 14:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lG0cU-0006h6-S3; Sat, 27 Feb 2021 14:30:58 +0000
Received: by outflank-mailman (input) for mailman id 90853;
 Sat, 27 Feb 2021 14:30:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lG0cT-0006h1-Pb
 for xen-devel@lists.xenproject.org; Sat, 27 Feb 2021 14:30:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lG0cP-0007nb-So; Sat, 27 Feb 2021 14:30:53 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lG0cP-0002Z8-FI; Sat, 27 Feb 2021 14:30:53 +0000
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
	bh=OPgarU1oyRZ/YOKdGPUmtw6i3lRcmWekV1Hz2zo/IQA=; b=e4I1hAlZx2Bv7kdN2SCRZtSGc/
	rrsyMbXfzKYPMVe55iw6vPWnX+TuH8CexgWXPp45W/5On1ci3XFXocQVNlJiGEiyrkmxkOlbl5GTK
	PNG/fA5FuHIZy/S7Ct8UGH81MDTzkbIsXUxZNz6DHZ82cylmRuTq1Zv+rZoEzXdb6Fnk=;
Subject: Re: [PATCH] xen/arm: Ensure the vCPU context is seen before clearing
 the _VPF_down
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 ash.j.wilding@gmail.com, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <20210226205158.20991-1-julien@xen.org>
 <alpine.DEB.2.21.2102261756280.2682@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <ca41bfbb-d942-d8fd-e96e-c464f6b3643f@xen.org>
Date: Sat, 27 Feb 2021 14:30:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102261756280.2682@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(+ Dario and George)

Hi Stefano,

I have added Dario and George to get some inputs from the scheduling part.

On 27/02/2021 01:58, Stefano Stabellini wrote:
> On Fri, 26 Feb 2021, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> A vCPU can get scheduled as soon as _VPF_down is cleared. As there is
>> currently not ordering guarantee in arch_set_info_guest(), it may be
>> possible that flag can be observed cleared before the new values of vCPU
>> registers are observed.
>>
>> Add an smp_mb() before the flag is cleared to prevent re-ordering.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> Barriers should work in pair. However, I am not entirely sure whether to
>> put the other half. Maybe at the beginning of context_switch_to()?
> 
> It should be right after VGCF_online is set or cleared, right?

vcpu_guest_context_t is variable allocated on the heap just for the 
purpose of this call. So an ordering with VGFC_online is not going to do 
anything.

> So it
> would be:
> 
> xen/arch/arm/domctl.c:arch_get_info_guest
> xen/arch/arm/vpsci.c:do_common_cpu_on
> 
> But I think it is impossible that either of them get called at the same
> time as arch_set_info_guest, which makes me wonder if we actually need
> the barrier...
arch_get_info_guest() is called without the domain lock held and I can't 
see any other lock that could prevent it to be called in // of 
arch_set_info_guest().

So you could technically get corrupted information from 
XEN_DOMCTL_getvcpucontext. For this case, we would want a smp_wmb() 
before writing to v->is_initialised. The corresponding read barrier 
would be in vcpu_pause() -> vcpu_sleep_sync() -> sync_vcpu_execstate().

But this is not the issue I was originally trying to solve. Currently, 
do_common_cpu_on() will roughly do:

  1) domain_lock(d)

  2) v->arch.sctlr = ...
     v->arch.ttbr0 = ...

  3) clear_bit(_VFP_down, &v->pause_flags);

  4) domain_unlock(d)

  5) vcpu_wake(v);

If we had only one pCPU on the system, then we would only wake the vCPU 
in step 5. We would be fine in this situation. But that's not the 
interesting case.

If you add a second pCPU in the story, it may be possible to have 
vcpu_wake() happening in // (see more below). As there is no memory 
barrier, step 3 may be observed before 2. So, assuming the vcpu is 
runnable, we could start to schedule a vCPU before any update to the 
registers (step 2) are observed.

This means that when context_switch_to() is called, we may end up to 
restore some old values.

Now the question is can vcpu_wake() be called in // from another pCPU? 
AFAICT, it would be only called if a given flag in v->pause_flags is 
cleared (e.g. _VFP_blocked). But can we rely on that?

Even if we can rely on it, v->pause_flags has other flags in it. I 
couldn't rule out that _VPF_down cannot be set at the same time as the 
other _VPF_*.

Therefore, I think a barrier is necessary to ensure the ordering.

Do you agree with this analysis?

> 
> 
> 
>> The issues described here is also quite theoritical because there are
>> hundreds of instructions executed between the time a vCPU is seen
>> runnable and scheduled. But better be safe than sorry :).
>> ---
>>   xen/arch/arm/domain.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index bdd3d3e5b5d5..2b705e66be81 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -914,7 +914,14 @@ int arch_set_info_guest(
>>       v->is_initialised = 1;
>>   
>>       if ( ctxt->flags & VGCF_online )
>> +    {
>> +        /*
>> +         * The vCPU can be scheduled as soon as _VPF_down is cleared.
>> +         * So clear the bit *after* the context was loaded.
>> +         */
>> +        smp_mb();

 From the discussion above, I would move this barrier before 
v->is_initialised. So we also take care of the issue with 
arch_get_info_guest().

This barrier also can be reduced to a smp_wmb() as we only expect an 
ordering between writes.

The barrier would be paired with the barrier in:
    - sync_vcpu_execstate() in the case of arch_get_vcpu_info_guest().
    - context_switch_to() in the case of scheduling (The exact barrier 
is TDB).

>>           clear_bit(_VPF_down, &v->pause_flags);
>> +    }
>>       else
>>           set_bit(_VPF_down, &v->pause_flags);
>>   
>> -- 
>> 2.17.1
>>

Cheers,

-- 
Julien Grall

