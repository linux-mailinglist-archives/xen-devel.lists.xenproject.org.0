Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976CF8B2414
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 16:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712116.1112539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0056-0004C4-Va; Thu, 25 Apr 2024 14:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712116.1112539; Thu, 25 Apr 2024 14:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0056-0004AW-Si; Thu, 25 Apr 2024 14:28:12 +0000
Received: by outflank-mailman (input) for mailman id 712116;
 Thu, 25 Apr 2024 14:28:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s0055-0004AO-Uc
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 14:28:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s0055-0005eQ-Bk; Thu, 25 Apr 2024 14:28:11 +0000
Received: from [15.248.3.92] (helo=[10.24.67.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s0055-0004Qr-38; Thu, 25 Apr 2024 14:28:11 +0000
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
	bh=9yGu/lu+InNTlEVh4avqT4hJV9/yiRpah6Ex0VNxvvg=; b=heQlp8qWFaVYmJ3agrBxY0vkLF
	iS693CvwO44YVqeeUHIlHMFkcleHWqP0AOKTOr312J/JsN5B3iPhwgI3gpvmCn5MmI7YE5WCLSO9P
	yelFVqrMFxnMPlqTWyXqkKBijf3EIsFMfCVyYde/QH2dqPOsw3saR0pn9NocuH+b+MAM=;
Message-ID: <5ba38b7b-16b1-489b-ad55-083504690bbd@xen.org>
Date: Thu, 25 Apr 2024 15:28:08 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <70c5a593-9ac5-485b-be81-b789562249d8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 25/04/2024 08:06, Henry Wang wrote:
> Hi Julien,
> 
> On 4/24/2024 8:58 PM, Julien Grall wrote:
>> Hi Henry,
>>
>> On 24/04/2024 04:34, Henry Wang wrote:
>>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>>
>>> Enable interrupt assign/remove for running VMs in CONFIG_OVERLAY_DTB.
>>>
>>> Currently, irq_route and mapping is only allowed at the domain 
>>> creation. Adding
>>> exception for CONFIG_OVERLAY_DTB.
>>
>> AFAICT, this is mostly reverting b8577547236f ("xen/arm: Restrict when 
>> a physical IRQ can be routed/removed from/to a domain").
>>
>>>
>>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>>> ---
>>>   xen/arch/arm/gic.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>> index 44c40e86de..a775f886ed 100644
>>> --- a/xen/arch/arm/gic.c
>>> +++ b/xen/arch/arm/gic.c
>>> @@ -140,8 +140,10 @@ int gic_route_irq_to_guest(struct domain *d, 
>>> unsigned int virq,
>>>        * back to the physical IRQ. To prevent get unsync, restrict the
>>>        * routing to when the Domain is been created.
>>>        */
>>
>> The above comment explains why the check was added. But the commit 
>> message doesn't explain why this can be disregarded for your use-case.
>>
>> Looking at the history, I don't think you can simply remove the checks.
>>
>> Regardless that...
>>
>>> +#ifndef CONFIG_OVERLAY_DTB
>>
>> ... I am against such #ifdef. A distros may want to have OVERLAY_DTB 
>> enabled, yet the user will not use it.
>>
>> Instead, you want to remove the check once the code can properly 
>> handle routing an IRQ the domain is created or ...
>>
>>>       if ( d->creation_finished )
>>>           return -EBUSY;
>>> +#endif
>>>         ret = vgic_connect_hw_irq(d, NULL, virq, desc, true);
>>>       if ( ret )
>>> @@ -171,8 +173,10 @@ int gic_remove_irq_from_guest(struct domain *d, 
>>> unsigned int virq,
>>>        * Removing an interrupt while the domain is running may have
>>>        * undesirable effect on the vGIC emulation.
>>>        */
>>> +#ifndef CONFIG_OVERLAY_DTB
>>>       if ( !d->is_dying )
>>>           return -EBUSY;
>>> +#endif
>>
>> ... removed before they domain is destroyed.
> 
> Thanks for your feeedback. After checking the b8577547236f commit 
> message I think I now understand your point. Do you have any suggestion 
> about how can I properly add the support to route/remove the IRQ to 
> running domains? Thanks.

I haven't really look at that code in quite a while. I think we need to 
make sure that the virtual and physical IRQ state matches at the time we 
do the routing.

I am undecided on whether we want to simply prevent the action to happen 
or try to reset the state.

There is also the question of what to do if the guest is enabling the 
vIRQ before it is routed.

Overall, someone needs to spend some time reading the code and then make 
a proposal (this could be just documentation if we believe it is safe to 
do). Both the current vGIC and the new one may need an update.

Cheers,

-- 
Julien Grall

