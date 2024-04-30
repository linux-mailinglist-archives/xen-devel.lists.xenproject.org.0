Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0105F8B6EBD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 11:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714688.1115967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1k5o-0005Ib-RM; Tue, 30 Apr 2024 09:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714688.1115967; Tue, 30 Apr 2024 09:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1k5o-0005Gw-OY; Tue, 30 Apr 2024 09:48:08 +0000
Received: by outflank-mailman (input) for mailman id 714688;
 Tue, 30 Apr 2024 09:48:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s1k5n-0005Gq-5M
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 09:48:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s1k5i-0004i4-Aw; Tue, 30 Apr 2024 09:48:02 +0000
Received: from [15.248.3.91] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s1k5i-0004pU-35; Tue, 30 Apr 2024 09:48:02 +0000
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
	bh=mkwFFQlrdfjuiOItEG4DOmgv9gVonIUEyjqAXEriw/w=; b=kIj6UQsapG4Fd77ENwIyDXQLq3
	O8Iry7LVVp0fAvpEmAPFR3ALUpk/nlOouGpHTiNYufmhTHNqH6DuzoK25Uytc6/1zUcQx9hrrvpc4
	wlJqgQuvUMZQD4Tfr8dsA+Y64YzJJk5vGx8tUwKaCuQBvIuPytiqGJragM+OyN/JnsK8=;
Message-ID: <63ad5cf3-5275-4fcd-a1d1-fbf5f3f167f4@xen.org>
Date: Tue, 30 Apr 2024 10:47:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] xen/overlay: Enable device tree overlay assignment
 to running domains
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-8-xin.wang2@amd.com>
 <da67f90f-6807-4fdc-b65b-f7a4ba9f78ad@suse.com>
 <97a401ff-4b5c-4e6a-8d9c-e36305ec64f5@amd.com>
 <128c7e68-0431-44e9-b4fc-96cc46e158ad@xen.org>
 <e3c7098b-a876-48f3-8ccb-18a2ced8521c@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e3c7098b-a876-48f3-8ccb-18a2ced8521c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 30/04/2024 05:00, Henry Wang wrote:
> Hi Julien,

Hi Henry,

> On 4/30/2024 1:34 AM, Julien Grall wrote:
>> On 29/04/2024 04:36, Henry Wang wrote:
>>> Hi Jan, Julien, Stefano,
>>
>> Hi Henry,
>>
>>> On 4/24/2024 2:05 PM, Jan Beulich wrote:
>>>> On 24.04.2024 05:34, Henry Wang wrote:
>>>>> --- a/xen/include/public/sysctl.h
>>>>> +++ b/xen/include/public/sysctl.h
>>>>> @@ -1197,7 +1197,9 @@ struct xen_sysctl_dt_overlay {
>>>>>   #define XEN_SYSCTL_DT_OVERLAY_ADD                   1
>>>>>   #define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
>>>>>       uint8_t overlay_op;                     /* IN: Add or remove. */
>>>>> -    uint8_t pad[3];                         /* IN: Must be zero. */
>>>>> +    bool domain_mapping;                    /* IN: True of False. */
>>>>> +    uint8_t pad[2];                         /* IN: Must be zero. */
>>>>> +    uint32_t domain_id;
>>>>>   };
>>>> If you merely re-purposed padding fields, all would be fine without
>>>> bumping the interface version. Yet you don't, albeit for an unclear
>>>> reason: Why uint32_t rather than domid_t? And on top of that - why a
>>>> separate boolean when you could use e.g. DOMID_INVALID to indicate
>>>> "no domain mapping"?
>>>
>>> I think both of your suggestion make great sense. I will follow the 
>>> suggestion in v2.
>>>
>>>> That said - anything taking a domain ID is certainly suspicious in a
>>>> sysctl. Judging from the description you really mean this to be a
>>>> domctl. Anything else will require extra justification.
>>>
>>> I also think a domctl is better. I had a look at the history of the 
>>> already merged series, it looks like in the first version of merged 
>>> part 1 [1], the hypercall was implemented as the domctl in the 
>>> beginning but later in v2 changed to sysctl. I think this makes sense 
>>> as the scope of that time is just to make Xen aware of the device 
>>> tree node via Xen device tree.
>>>
>>> However this is now a problem for the current part where the 
>>> scope (and the end goal) is extended to assign the added device to 
>>> Linux Dom0/DomU via device tree overlays. I am not sure which way is 
>>> better, should we repurposing the sysctl to domctl or maybe add 
>>> another domctl (I am worrying about the duplication because basically 
>>> we need the same sysctl functionality but now with a domid in it)? 
>>> What do you think?
>>
>> I am not entirely sure this is a good idea to try to add the device in 
>> Xen and attach it to the guests at the same time. Imagine the 
>> following situation:
>>
>> 1) Add and attach devices
>> 2) The domain is rebooted
>> 3) Detach and remove devices
>>
>> After step 2, you technically have a new domain. You could have also a 
>> case where this is a completely different guest. So the flow would 
>> look a little bit weird (you create the DT overlay with domain A but 
>> remove with domain B).
>>
>> So, at the moment, it feels like the add/attach (resp detech/remove) 
>> operations should happen separately.

Thinking a bit more about it, there is another problem with the single 
hypercall appproach. The MMIOs will be mapped 1:1 to the guest. These 
region may clash with other part of the layout for domain created by the 
toolstack
and dom0less (if the 1:1 option has not been enabled).

I guess for that add, it would be possible to specify the mapping in the 
Device-Tree. But that would not work for the removal (this may be a 
different domain).

On a somewhat similar topic, the number of IRQs supported by the vGIC is 
fixed at boot. How would that work with this patch?

>>
>> Can you clarify why you want to add devices to Xen and attach to a 
>> guest within a single hypercall?
> 
> Sorry I don't know if there is any specific thoughts on the design of 
> using a single hypercall to do both add devices to Xen device tree and 
> assign the device to the guest. In fact seeing your above comments, I 
> think separating these two functionality to two xl commands using 
> separated hypercalls would indeed be a better idea. Thank you for the 
> suggestion!
> 
> To make sure I understand correctly, would you mind confirming if below 
> actions for v2 make sense to you? Thanks!
> - Only use the XEN_SYSCTL_DT_OVERLAY_{ADD, REMOVE} sysctls to add/remove 
> overlay to Xen device tree

Note that this would attach the devices to dom0 first. Maybe this is why 
it was decided to merge the two operations? An option would be to allow 
the devices to be attached to no-one.

> - Introduce the xl dt-overlay attach <domid> command and respective 
> domctls to do the device assignment for the overlay to domain.

We already have domctls to route IRQs and map MMIOs. So do we actually 
need new domctls?

Cheers,

-- 
Julien Grall

