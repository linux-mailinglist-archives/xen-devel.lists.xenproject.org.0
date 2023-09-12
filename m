Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4323B79CCCE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 12:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600305.935941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0El-0008G9-1U; Tue, 12 Sep 2023 10:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600305.935941; Tue, 12 Sep 2023 10:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0Ek-0008Dp-V8; Tue, 12 Sep 2023 10:03:14 +0000
Received: by outflank-mailman (input) for mailman id 600305;
 Tue, 12 Sep 2023 10:03:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qg0Ej-0008Dh-Jv
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 10:03:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qg0Ej-0002e5-9F; Tue, 12 Sep 2023 10:03:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qg0Ej-00030I-1x; Tue, 12 Sep 2023 10:03:13 +0000
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
	bh=u9xEYcPGxDMscrMJEr54KeD+W25FcsVlxHma95xRNHw=; b=EmrKei/opY2QVm6ntITxT2gCzd
	c+1vE9aZmpEiLeXVFSkfwrXvwK5LgeuXHgMBCb3UWjkuO1+3xHrc9hPnyXuS6qvPXwaZjxzICs6dK
	IfcQeQ64FGbY8FejXZYxFiL6fK2MUzoelY+pObiAXsn2Nh73+rB9/PFYFh+Yuf3qiks4=;
Message-ID: <6ca62546-8626-46ab-85bb-8e96e466251d@xen.org>
Date: Tue, 12 Sep 2023 11:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Skip Xen specific nodes/properties from hwdom
 /chosen node
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911123401.27659-1-michal.orzel@amd.com>
 <366e89e3-bc3d-4c54-b1ad-8147abbabdc7@xen.org>
 <042fae56-e8e2-c079-2686-d27c5469b7fc@amd.com>
 <e24a7d3a-ca18-474b-bce2-84b97512c58e@xen.org>
 <faf253c3-2c99-9380-c120-a2dd3110b796@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <faf253c3-2c99-9380-c120-a2dd3110b796@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/09/2023 16:09, Michal Orzel wrote:
> 
> 
> On 11/09/2023 16:48, Julien Grall wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> On 11/09/2023 15:01, Michal Orzel wrote:
>>> Hi Julien,
>>>
>>> On 11/09/2023 15:14, Julien Grall wrote:
>>>>
>>>>
>>>> Hi,
>>>>
>>>> On 11/09/2023 13:34, Michal Orzel wrote:
>>>>> Host device tree nodes under /chosen with compatible string
>>>>> "xen,evtchn-v1", "xen,domain-shared-memory-v1" are Xen specific and not
>>>>> meant to be exposed to hardware domain.
>>>>
>>>> So, how dom0 is meant to discover the static event channel, shared
>>>> memory it can use?
>>>
>>> For static shared memory:
>>> A node with this compatible is only meant for Xen since it contains information like host-guest mapping.
>>> Xen creates a different node for guests under /reserved-memory.
>>> Linux binding:
>>> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
>>> Xen node generation:
>>> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/domain_build.c;hb=HEAD#l1407
>>
>> Ah good point. I agree with this one.
>>
>>>
>>> For static event channels:
>>> This is a bit weird so let me put it in a different way.
>>> 1) Xen does not create any node for static evtchn for domU.
>>> 2) The booting.txt states:
>>> There is no need to describe the static event channel info in the domU device
>>> tree. Static event channels are only useful in fully static configurations,
>>> and in those configurations, the domU device tree dynamically generated by Xen
>>> is not needed.
>>> 3) The "xen,evtchn" property specifies the local port as well as phandle of domU node.
>>> dom0 does not have access to domU nodes, therefore exposing a property with not existing phandle
>>> makes me think that:
>>
>> You have a point for the phandle. Yet, this is the only way dom0 can
>> find the event channel today. As we exposed it, I don't think we can
>> remove it until we have a proper replacement.
>>
>> We might get away if the feature is not supported it at all. But there
>> is no statement, so it is a little unclear whether the feature is meant
>> to be in technical preview.
>>
>> In any case, I think the commit message deserve a bit more explanation
>> as hiding "xen,evtchn-v1"/"xen,domain-shared-memory-v1" is not
>> uncontroversial.
>>
>>> a) point 2) applies to dom0 as well and we should hide this node or > b) there is a missing property for both dom0 and domUs to tell them
>> about static local port in a proper way
>>>
>>> Exposing Xen specific evtchn node only to dom0 and not to domU with required information happen to be found as first value
>>> in xen,evtchn is definitely not a proper solution.
>>
>> My concern here is we exposed such information to dom0. So as I said
>> above, I don't think we can simply remove it as there is no other way to
>> find such information today.
>>
>> It doesn't matter that it wasn't exposed to domU.
>>
>>> Also, there is no Linux binding for it.
>>
>> AFAIK the static event channel support was not added in Linux until very
>> recently. Also, I think the kernel doesn't directly use the static event
>> channel. So it is possible, this is just an overlook.
> 
> I've found this thread in which Stefano, Rahul and Bertrand agrees on not exposing
> any dt property and the rationale behind:
> https://patchwork.kernel.org/project/xen-devel/patch/4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com/

Ok. So the expectation is that each end will have hardcoded event 
channel number. I feel this is going to lead to issue when someone will 
try to re-number event channel but forgot to update one of the 
component. Anyway...

> 
> I would not call exposing node to dom0 as something done deliberately given that it happens automatically by copying.
> So my understanding is
> that we did not want to expose any node and dom0 case was overlooked (since done automatically).
> 
> Exposing half the interface (from system POV) in a way it should not be done (phandle) is not great IMO.
> In any case, if you insist on keeping xen,evtchn, I can leave with it.
> 
> This feature is marked as tech preview with no Linux binding in place so I would not be worried.

... I overlooked it was a tech preview. So I am having less concern 
about remove the property. But I still think we need to find a way to 
describe it in the device-tree for future usage (see why above).

Cheers,

-- 
Julien Grall

