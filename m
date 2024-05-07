Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2641E8BEF3D
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 23:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718498.1121031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4SlI-0002fw-KT; Tue, 07 May 2024 21:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718498.1121031; Tue, 07 May 2024 21:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4SlI-0002cm-Hk; Tue, 07 May 2024 21:54:12 +0000
Received: by outflank-mailman (input) for mailman id 718498;
 Tue, 07 May 2024 21:54:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s4SlH-0002cb-Ey
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 21:54:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4SlG-00089O-8X; Tue, 07 May 2024 21:54:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4SlG-0000U4-1O; Tue, 07 May 2024 21:54:10 +0000
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
	bh=P9VUyF33uGGarJ9y2y7l+KKZkEIaubY68qvQcvVYqlM=; b=u7UCKS0jdtJ4beIoEjnhytbXOE
	d9o2Up4MX9Z2i5ZvwKrkQYNbLqFn4bP1L8/L93yCHdbFjE8wBPZiNrpyvRWYpKYAK4dzOJ9k4tVQV
	g21mKay9Z9EK5VA6Pxf/eytPCbpYeinEnbx5ft9eDzAt4d43JRXvjDkMNtxJkYc1Ok6Y=;
Message-ID: <f30f7599-6bcd-4b8d-bd1f-6afde18c14c8@xen.org>
Date: Tue, 7 May 2024 22:54:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] xen/arm/gic: Enable interrupt assignment to running
 VM
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
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <145e4192-3113-415f-876c-e67145d1d5c9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 06/05/2024 09:32, Henry Wang wrote:
> On 5/1/2024 4:13 AM, Julien Grall wrote:
>> Hi Henry,
>>
>> On 30/04/2024 04:50, Henry Wang wrote:
>>> On 4/25/2024 10:28 PM, Julien Grall wrote:
>>>>> Thanks for your feeedback. After checking the b8577547236f commit 
>>>>> message I think I now understand your point. Do you have any 
>>>>> suggestion about how can I properly add the support to route/remove 
>>>>> the IRQ to running domains? Thanks.
>>>
>>> I spent some time going through the GIC/vGIC code and had some 
>>> discussions with Stefano and Stewart during the last couple of days, 
>>> let me see if I can describe the use case properly now to continue 
>>> the discussion:
>>>
>>> We have some use cases that requires assigning devices to domains 
>>> after domain boot time. For example, suppose there is an FPGA on the 
>>> board which can simulate a device, and the bitstream for the FPGA is 
>>> provided and programmed after domain boot. So we need a way to assign 
>>> the device to the running domain. This series tries to implement this 
>>> use case by using device tree overlay - users can firstly add the 
>>> overlay to Xen dtb, assign the device in the overlay to a domain by 
>>> the xl command, then apply the overlay to Linux.
>>
>> Thanks for the description! This helps to understand your goal :).
> 
> Thank you very much for spending your time on discussing this and 
> provide these valuable comments!
> 
>>>
>>>> I haven't really look at that code in quite a while. I think we need 
>>>> to make sure that the virtual and physical IRQ state matches at the 
>>>> time we do the routing.
>>>>
>>>> I am undecided on whether we want to simply prevent the action to 
>>>> happen or try to reset the state.
>>>>
>>>> There is also the question of what to do if the guest is enabling 
>>>> the vIRQ before it is routed.
>>>
>>> Sorry for bothering, would you mind elaborating a bit more about the 
>>> two cases that you mentioned above? Commit b8577547236f ("xen/arm: 
>>> Restrict when a physical IRQ can be routed/removed from/to a domain") 
>>> only said there will be undesirable effects, so I am not sure if I 
>>> understand the concerns raised above and the consequences of these 
>>> two use cases.
>>
>> I will try to explain them below after I answer the rest.
>>
>>> I am probably wrong, I think when we add the overlay, we are probably 
>>> fine as the interrupt is not being used before. 
>>
>> What if the DT overlay is unloaded and then reloaded? Wouldn't the 
>> same interrupt be re-used? As a more generic case, this could also be 
>> a new bitstream for the FPGA.
>>
>> But even if the interrupt is brand new every time for the DT overlay, 
>> you are effectively relaxing the check for every user (such as 
>> XEN_DOMCTL_bind_pt_irq). So the interrupt re-use case needs to be 
>> taken into account.
> 
> I agree. I think IIUC, with your explanation here and below, could we 
> simplify the problem to how to properly handle the removal of the IRQ 
> from a running guest, if we always properly remove and clean up the 
> information when remove the IRQ from the guest? In this way, the IRQ can 
> always be viewed as a brand new one when we add it back.

If we can make sure the virtual IRQ and physical IRQ is cleaned then yes.

> Then the only 
> corner case that we need to take care of would be...

Can you clarify whether you say the "only corner case" because you 
looked at the code? Or is it just because I mentioned only one?

> 
>>> Also since we only load the device driver after the IRQ is routed to 
>>> the guest, 
>>
>> This is what a well-behave guest will do. However, we need to think 
>> what will happen if a guest misbehaves. I am not concerned about a 
>> guest only impacting itself, I am more concerned about the case where 
>> the rest of the system is impacted.
>>
>>> I am not sure the guest can enable the vIRQ before it is routed.
>>
>> Xen allows the guest to enable a vIRQ even if there is no pIRQ 
>> assigned. Thanksfully, it looks like the vgic_connect_hw_irq(), in 
>> both the current and new vGIC, will return an error if we are trying 
>> to route a pIRQ to an already enabled vIRQ.
>>
>> But we need to investigate all the possible scenarios to make sure 
>> that any inconsistencies between the physical state and virtual state 
>> (including the LRs) will not result to bigger problem.
>>
>> The one that comes to my mind is: The physical interrupt is 
>> de-assigned from the guest before it was EOIed. In this case, the 
>> interrupt will still be in the LR with the HW bit set. This would 
>> allow the guest to EOI the interrupt even if it is routed to someone 
>> else. It is unclear what would be the impact on the other guest.
> 
> ...same as this case, i.e.
> test_bit(_IRQ_INPROGRESS, &desc->status) || !test_bit(_IRQ_DISABLED, 
> &desc->status)) when we try to remove the IRQ from a running domain.

We already call ->shutdown() which will disable the IRQ. So don't we 
only need to take care of _IRQ_INPROGRESS?

[...]

> we have 3 possible states which can be read from LR for this case : 
> active, pending, pending and active.
> - I don't think we can do anything about the active state, so we should 
> return -EBUSY and reject the whole operation of removing the IRQ from 
> running guest, and user can always retry this operation.

This would mean a malicious/buggy guest would be able to prevent a 
device to be de-assigned. This is not a good idea in particular when the 
domain is dying.

That said, I think you can handle this case. The LR has a bit to 
indicate whether the pIRQ needs to be EOIed. You can clear it and this 
would prevent the guest to touch the pIRQ. There might be other clean-up 
to do in the vGIC datastructure.

Anyway, we don't have to handle removing an active IRQ when the domain 
is still running (although we do when the domain is destroying). But I 
think this would need to be solved before the feature is (security) 
supported.

> - For the pending (and active) case,

Shouldn't the pending and active case handled the same way as the active 
case?

> can we clear the LR and point the 
> LR for the pending_irq to invalid?

LRs can be cleared. You will need to find which vCPU was used for the 
injection and then pause it so the LR can be safely updated.

There will also be some private state to clear. I don't know how easy it 
will be. However, we decided to not do anything for ICPENDR (which 
requires a similar behavior) as this was complex (?) to do with the 
existing vGIC.

I vaguely remember we had some discussions on the ML. I didn't look for 
them though.

Anyway, same as above, this could possibly handled later on. But this 
would probably need to be solved before the feature is (security supported).

Cheers,

-- 
Julien Grall

