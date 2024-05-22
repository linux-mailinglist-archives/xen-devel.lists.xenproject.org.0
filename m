Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3158CC1B5
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727601.1132128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ldC-0004Vh-KH; Wed, 22 May 2024 13:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727601.1132128; Wed, 22 May 2024 13:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ldC-0004T0-Gy; Wed, 22 May 2024 13:03:46 +0000
Received: by outflank-mailman (input) for mailman id 727601;
 Wed, 22 May 2024 13:03:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s9ldA-0004Ss-FK
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:03:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s9ldA-0004z9-5B; Wed, 22 May 2024 13:03:44 +0000
Received: from [15.248.2.235] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s9ld9-0007LV-VI; Wed, 22 May 2024 13:03:44 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=i8TmxNEgU3AOS6pP//wlBVKSGvFnWCKtg1OZBAIjH4I=; b=fwJpHJR3BU4M5jX0n7l+IEspfW
	X/ga8s+6BifKcySyHRiXpmhbob7SY/J8cDrcs6ZRof6iT5b9d6gGR2f0xrE3tNAEL7l7/5r4Wh5Pv
	QLK4ir4wEB35FqfEWVk0fOyb7W7VleSxPq1n925kAnFl/ugAwEc/I8eL+Kwc6LZLSf4Q=;
Message-ID: <1754e63c-00a5-4d66-b151-8fa436f5c844@xen.org>
Date: Wed, 22 May 2024 14:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] xen/arm/gic: Allow routing/removing interrupt to
 running VMs
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
 <20240521043557.1580753-6-xin.wang2@amd.com>
 <3f6fa7e7-c02c-4fa5-b4aa-5e4c2efed65f@xen.org>
 <4f6a24b5-5e7b-41e0-9314-496bbcaa8888@amd.com>
 <alpine.DEB.2.22.394.2405211815040.1052252@ubuntu-linux-20-04-desktop>
 <29073700-673d-40aa-8759-efc60af3b7c0@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <29073700-673d-40aa-8759-efc60af3b7c0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry,

On 22/05/2024 02:22, Henry Wang wrote:
> On 5/22/2024 9:16 AM, Stefano Stabellini wrote:
>> On Wed, 22 May 2024, Henry Wang wrote:
>>> Hi Julien,
>>>
>>> On 5/21/2024 8:30 PM, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 21/05/2024 05:35, Henry Wang wrote:
>>>>> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
>>>>> index 56490dbc43..956c11ba13 100644
>>>>> --- a/xen/arch/arm/gic-vgic.c
>>>>> +++ b/xen/arch/arm/gic-vgic.c
>>>>> @@ -439,24 +439,33 @@ int vgic_connect_hw_irq(struct domain *d, struct
>>>>> vcpu *v, unsigned int virq,
>>>>>          /* We are taking to rank lock to prevent parallel 
>>>>> connections. */
>>>>>        vgic_lock_rank(v_target, rank, flags);
>>>>> +    spin_lock(&v_target->arch.vgic.lock);
>>>> I know this is what Stefano suggested, but v_target would point to the
>>>> current affinity whereas the interrupt may be pending/active on the
>>>> "previous" vCPU. So it is a little unclear whether v_target is the 
>>>> correct
>>>> lock. Do you have more pointer to show this is correct?
>>> No I think you are correct, we have discussed this in the initial 
>>> version of
>>> this patch. Sorry.
>>>
>>> I followed the way from that discussion to note down the vcpu ID and 
>>> retrieve
>>> here, below is the diff, would this make sense to you?
>>>
>>> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
>>> index 956c11ba13..134ed4e107 100644
>>> --- a/xen/arch/arm/gic-vgic.c
>>> +++ b/xen/arch/arm/gic-vgic.c
>>> @@ -439,7 +439,7 @@ int vgic_connect_hw_irq(struct domain *d, struct 
>>> vcpu *v,
>>> unsigned int virq,
>>>
>>>       /* We are taking to rank lock to prevent parallel connections. */
>>>       vgic_lock_rank(v_target, rank, flags);
>>> -    spin_lock(&v_target->arch.vgic.lock);
>>> + spin_lock(&d->vcpu[p->spi_vcpu_id]->arch.vgic.lock);
>>>
>>>       if ( connect )
>>>       {
>>> @@ -465,7 +465,7 @@ int vgic_connect_hw_irq(struct domain *d, struct 
>>> vcpu *v,
>>> unsigned int virq,
>>>               p->desc = NULL;
>>>       }
>>>
>>> -    spin_unlock(&v_target->arch.vgic.lock);
>>> + spin_unlock(&d->vcpu[p->spi_vcpu_id]->arch.vgic.lock);
>>>       vgic_unlock_rank(v_target, rank, flags);
>>>
>>>       return ret;
>>> diff --git a/xen/arch/arm/include/asm/vgic.h 
>>> b/xen/arch/arm/include/asm/vgic.h
>>> index 79b73a0dbb..f4075d3e75 100644
>>> --- a/xen/arch/arm/include/asm/vgic.h
>>> +++ b/xen/arch/arm/include/asm/vgic.h
>>> @@ -85,6 +85,7 @@ struct pending_irq
>>>       uint8_t priority;
>>>       uint8_t lpi_priority;       /* Caches the priority if this is 
>>> an LPI. */
>>>       uint8_t lpi_vcpu_id;        /* The VCPU for an LPI. */
>>> +    uint8_t spi_vcpu_id;        /* The VCPU for an SPI. */
>>>       /* inflight is used to append instances of pending_irq to
>>>        * vgic.inflight_irqs */
>>>       struct list_head inflight;
>>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>>> index c04fc4f83f..e852479f13 100644
>>> --- a/xen/arch/arm/vgic.c
>>> +++ b/xen/arch/arm/vgic.c
>>> @@ -632,6 +632,7 @@ void vgic_inject_irq(struct domain *d, struct 
>>> vcpu *v,
>>> unsigned int virq,
>>>       }
>>>       list_add_tail(&n->inflight, &v->arch.vgic.inflight_irqs);
>>>   out:
>>> +    n->spi_vcpu_id = v->vcpu_id;
>>>       spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>>>
>>>       /* we have a new higher priority irq, inject it into the guest */
>>>       vcpu_kick(v);
>>>
>>>
>>>> Also, while looking at the locking, I noticed that we are not doing 
>>>> anything
>>>> with GIC_IRQ_GUEST_MIGRATING. In gic_update_one_lr(), we seem to 
>>>> assume that
>>>> if the flag is set, then p->desc cannot be NULL.
>>>>
>>>> Can we reach vgic_connect_hw_irq() with the flag set?
>>> I think even from the perspective of making the code extra safe, we 
>>> should
>>> also check GIC_IRQ_GUEST_MIGRATING as the LR is allocated for this 
>>> case. I
>>> will also add the check of GIC_IRQ_GUEST_MIGRATING here.
>> Yes. I think it might be easier to check for GIC_IRQ_GUEST_MIGRATING
>> early and return error immediately in that case. Otherwise, we can
>> continue and take spin_lock(&v_target->arch.vgic.lock) because no
>> migration is in progress
> 
> Ok, this makes sense to me, I will add
> 
>      if( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
>      {
>          vgic_unlock_rank(v_target, rank, flags);
>          return -EBUSY;
>      }
> 
> right after taking the vgic rank lock.

I think that would be ok. I have to admit, I am still a bit wary about 
allowing to remove interrupts when the domain is running.

I am less concerned about the add part. Do you need the remove part now? 
If not, I would suggest to split in two so we can get the most of this 
series merged for 4.19 and continue to deal with the remove path in the 
background.

I will answer here to the other reply:

 > I don't think so, if I am not mistaken, no LR will be allocated with 
other flags set.

I wasn't necessarily thinking about the LR allocation. I was more 
thinking whether there are any flags that could still be set.

IOW, will the vIRQ like new once vgic_connect_hw_irq() is succesful?

Also, while looking at the flags, I noticed we clear _IRQ_INPROGRESS 
before vgic_connect_hw_irq(). Shouldn't we only clear *after*?

This brings to another question. You don't special case a dying domain. 
If the domain is crashing, wouldn't this mean it wouldn't be possible to 
destroy it?

Cheers,

-- 
Julien Grall

