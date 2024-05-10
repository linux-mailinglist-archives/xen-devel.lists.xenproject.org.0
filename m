Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D515A8C201A
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 10:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719597.1122408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5M1F-0003SA-DH; Fri, 10 May 2024 08:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719597.1122408; Fri, 10 May 2024 08:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5M1F-0003Q3-AC; Fri, 10 May 2024 08:54:21 +0000
Received: by outflank-mailman (input) for mailman id 719597;
 Fri, 10 May 2024 08:54:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s5M1D-0003Px-Gq
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 08:54:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5M1D-0000xZ-1K; Fri, 10 May 2024 08:54:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5M1C-0003Uo-Oq; Fri, 10 May 2024 08:54:18 +0000
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
	bh=eD6xefNzE/+8FNvv8rtChVIbgkpHLFLLx+ZqnzygP1A=; b=rUV6fF4wk08LAK/GBmXyOl+rDI
	h/wcnjQWWaWFghF+PSqG6OveOoatt95fUlZVLoUn+cX6RCP6JhHZsIwHDN/ZiFqqkbNNLc8OrruY3
	tJS+kBg+NBP3toF1uBYfdoTOjhaoXzXScz6PJlUDMqZcnIGX4ROO1AvAsXEuUOLd8UNA=;
Message-ID: <1ad2c873-219c-4d96-82d6-e1bc58216f2d@xen.org>
Date: Fri, 10 May 2024 09:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] xen/arm/gic: Enable interrupt assignment to running
 VM
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-3-xin.wang2@amd.com>
 <670d1033-2443-4245-8ff1-cb7099a7c793@xen.org>
 <70c5a593-9ac5-485b-be81-b789562249d8@amd.com>
 <5ba38b7b-16b1-489b-ad55-083504690bbd@xen.org>
 <1a29ae76-a902-4a24-8fd1-ac26ef228971@amd.com>
 <365e1b12-6b20-40ed-8ca9-beb643c907ab@xen.org>
 <145e4192-3113-415f-876c-e67145d1d5c9@amd.com>
 <f30f7599-6bcd-4b8d-bd1f-6afde18c14c8@xen.org>
 <8957ab21-796f-4e15-a89e-d040e6f7b5ca@amd.com>
 <995ce39d-6a04-4bdc-bfe8-bcef3da24cc2@xen.org>
 <ff5e2477-ed5a-40cd-a592-5ceb3bc8f1f1@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ff5e2477-ed5a-40cd-a592-5ceb3bc8f1f1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 09/05/2024 16:31, Henry Wang wrote:
> On 5/9/2024 4:46 AM, Julien Grall wrote:
>> Hi Henry,
>> [...]
>>
>>>>> we have 3 possible states which can be read from LR for this case : 
>>>>> active, pending, pending and active.
>>>>> - I don't think we can do anything about the active state, so we 
>>>>> should return -EBUSY and reject the whole operation of removing the 
>>>>> IRQ from running guest, and user can always retry this operation.
>>>>
>>>> This would mean a malicious/buggy guest would be able to prevent a 
>>>> device to be de-assigned. This is not a good idea in particular when 
>>>> the domain is dying.
>>>>
>>>> That said, I think you can handle this case. The LR has a bit to 
>>>> indicate whether the pIRQ needs to be EOIed. You can clear it and 
>>>> this would prevent the guest to touch the pIRQ. There might be other 
>>>> clean-up to do in the vGIC datastructure.
>>>
>>> I probably misunderstood this sentence, do you mean the EOI bit in 
>>> the pINTID field? I think this bit is only available when the HW bit 
>>> of LR is 0, but in our case the HW is supposed to be 1 (as indicated 
>>> as your previous comment). Would you mind clarifying a bit more? Thanks!
>>
>> You are right, ICH_LR.HW will be 1 for physical IRQ routed to a guest. 
>> What I was trying to explain is this bit could be cleared (with 
>> ICH_LR.pINTD adjusted).
> 
> Thank you for all the discussions. Based on that, would below diff make 
> sense to you? I did a test of the dynamic dtbo adding/removing with a 
> ethernet device with this patch applied. Test steps are:
> (1) Use xl dt-overlay to add the ethernet device to Xen device tree and 
> assign it to dom0.
> (2) Create a domU.
> (3) Use xl dt-overlay to de-assign the device from dom0 and assign it to 
> domU.
> (4) Destroy the domU.
> 
> The ethernet device is functional in the domain respectively when it is 
> attached to a domain and I don't see errors when I destroy domU. But 
> honestly I think the case we talked about is a quite unusual case so I 
> am not sure if it was hit during my test.

Correct, they are not errors that will happen in normal operations. You 
will want to tweak Linux or use XTF to trigger them.

We want to test the state active, pending and both together before the 
physical interrupt is routed and also removed.

> 
> ```
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index a775f886ed..d3f9cd2299 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -135,16 +135,6 @@ int gic_route_irq_to_guest(struct domain *d, 
> unsigned int virq,
>       ASSERT(virq < vgic_num_irqs(d));
>       ASSERT(!is_lpi(virq));
> 
> -    /*
> -     * When routing an IRQ to guest, the virtual state is not synced
> -     * back to the physical IRQ. To prevent get unsync, restrict the
> -     * routing to when the Domain is been created.
> -     */
> -#ifndef CONFIG_OVERLAY_DTB
> -    if ( d->creation_finished )
> -        return -EBUSY;
> -#endif
> -
>       ret = vgic_connect_hw_irq(d, NULL, virq, desc, true);

This is checking if the interrupt is already enabled. Do we also need to 
check for active/pending?

>       if ( ret )
>           return ret;
> @@ -169,20 +159,40 @@ int gic_remove_irq_from_guest(struct domain *d, 
> unsigned int virq,
>       ASSERT(test_bit(_IRQ_GUEST, &desc->status));
>       ASSERT(!is_lpi(virq));
> 
> -    /*
> -     * Removing an interrupt while the domain is running may have
> -     * undesirable effect on the vGIC emulation.
> -     */
> -#ifndef CONFIG_OVERLAY_DTB
> -    if ( !d->is_dying )
> -        return -EBUSY;
> -#endif
> -
>       desc->handler->shutdown(desc);
> 
>       /* EOI the IRQ if it has not been done by the guest */
>       if ( test_bit(_IRQ_INPROGRESS, &desc->status) )
> +    {

I assume this is just a PoC state, but I just want to point out that 
this will not work with the new vGIC (some of the functions doesn't 
exist there).

> +        /*
> +         * Handle the LR where the physical interrupt is de-assigned 
> from the
> +         * guest before it was EOIed
> +         */
> +        struct vcpu *v_target = vgic_get_target_vcpu(d->vcpu[0], virq);

This will return a vCPU from the current affinity. This may not be where 
the interrupt was injected. From a brief look, I can't tell whether we 
have an easy way to know where the interrupt was injected (other than 
the pending_irq is in the list lr_queue/inflight)

> +        struct vgic_irq_rank *rank = vgic_rank_irq(v_target, virq);
> +        struct pending_irq *p = irq_to_pending(v_target, virq);
> +        unsigned long flags;
> +
> +        spin_lock_irqsave(&v_target->arch.vgic.lock, flags);
> +        /* LR allocated for the IRQ */
> +        if ( test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) &&
> +             test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) )
> +        {
> +            gic_hw_ops->clear_lr(p->lr);

This works on the current pCPU LR. However, the vCPU may not run on this 
pCPU.

> +            clear_bit(p->lr, &v_target->arch.lr_mask);
> +
> +            clear_bit(GIC_IRQ_GUEST_VISIBLE, &p->status);
> +            clear_bit(GIC_IRQ_GUEST_ACTIVE, &p->status);
> +            p->lr = GIC_INVALID_LR;

You also need to remove 'p' from the various list (e.g. inflight/lr_queue).

But as I wrote previously, I think it would be much easier if we simply 
clear the HW bit in the LR. So we don't have to try to mess up with the 
vGIC internal state which is quite complex.

I think it could be done as part of vgic_connect_hw_irq(). But I haven't 
fully investigate it.

> +        }
> +        spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
> +
> +        vgic_lock_rank(v_target, rank, flags);
> +        vgic_disable_irqs(v_target, (~rank->ienable) & rank->ienable, 
> rank->index);
> +        vgic_unlock_rank(v_target, rank, flags);

Why do you need to call vgic_disable_irqs()?

> +
>           gic_hw_ops->deactivate_irq(desc);
> +    }
>       clear_bit(_IRQ_INPROGRESS, &desc->status);
> 
>       ret = vgic_connect_hw_irq(d, NULL, virq, desc, false);
> ```
> 
> Kind regards,
> Henry
> 
>>
>> Cheers,
>>
> 

Cheers,

-- 
Julien Grall

