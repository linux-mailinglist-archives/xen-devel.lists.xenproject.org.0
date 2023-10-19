Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57727CF8F0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 14:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619303.964152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtSAq-0005lW-5U; Thu, 19 Oct 2023 12:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619303.964152; Thu, 19 Oct 2023 12:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtSAq-0005jI-2r; Thu, 19 Oct 2023 12:30:48 +0000
Received: by outflank-mailman (input) for mailman id 619303;
 Thu, 19 Oct 2023 12:30:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtSAo-0005j8-Jj
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 12:30:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtSAn-0007QV-UK; Thu, 19 Oct 2023 12:30:45 +0000
Received: from [15.248.3.1] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtSAn-0003f9-OI; Thu, 19 Oct 2023 12:30:45 +0000
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
	bh=8PxoLLotM7v+VwNyJXjxvYo2eQzVUxnDitYf5K/TFeM=; b=fGToxjVJttZv2v6Raxc5LShShs
	Mjtz0ONxaOClgvVjECl/cTpg5rCgtCLA2pPeIYDA/b5Vg4C2B71sFwqua28tdNATt1uhH2Ljf/0Il
	ymhRs7A0ntVLZ4vZ8kbioZ7R9LUiDxohVcs0pILhl8ifoarXgUL6DLeWBovT1bOUcUeI=;
Message-ID: <edc5d2b1-a3bd-44c4-83ea-6ff436fe7346@xen.org>
Date: Thu, 19 Oct 2023 13:30:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/4] xen/arm: address violations of MISRA C:2012 Rule
 13.1
Content-Language: en-GB
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <31a926a09dfcef43d13a402fd3b235aeba48009d.1697638210.git.simone.ballarin@bugseng.com>
 <41d82896-5471-4eaa-8bdd-a192e28d5546@xen.org>
 <3de5e340-30bb-44aa-affd-89f343ed1fa1@bugseng.com>
 <7066a646-711c-4dce-f3c0-effb6ae91a39@xen.org>
 <67782815-7803-4ef5-80f4-db6181f7a6e2@bugseng.com>
 <15923aaf-c005-45fb-8bb4-50d2e0995f18@xen.org>
 <8734535a-0c00-44b4-8257-64155807b052@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8734535a-0c00-44b4-8257-64155807b052@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 19/10/2023 12:10, Simone Ballarin wrote:
> On 19/10/23 12:11, Julien Grall wrote:
>> Hi,
>>
>> On 19/10/2023 09:43, Simone Ballarin wrote:
>>> On 19/10/23 10:19, Julien Grall wrote:
>>>> Hi Simone,
>>>>
>>>> On 19/10/2023 08:34, Simone Ballarin wrote:
>>>>> On 18/10/23 17:03, Julien Grall wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 18/10/2023 15:18, Simone Ballarin wrote:
>>>>>>> Rule 13.1: Initializer lists shall not contain persistent side 
>>>>>>> effects
>>>>>>>
>>>>>>> This patch moves expressions with side-effects into new variables 
>>>>>>> before
>>>>>>> the initializer lists.
>>>>>>
>>>>>> Looking at the code, I feel the commit message should be a bit 
>>>>>> more verbose because they are no apparent side-effects.
>>>>>>
>>>>>>>
>>>>>>> Function calls do not necessarily have side-effects, in these 
>>>>>>> cases the
>>>>>>> GCC pure or const attributes are added when possible.
>>>>>>
>>>>>> You are only adding pure in this patch.
>>>>>>
>>>>>>>
>>>>>>> No functional changes.
>>>>>>>
>>>>>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>>>>>>
>>>>>>> ---
>>>>>>> Function attributes pure and const do not need to be added as GCC
>>>>>>> attributes, they can be added using ECLAIR configurations.
>>>>>>> ---
>>>>>>>   xen/arch/arm/device.c              |  6 +++---
>>>>>>>   xen/arch/arm/guestcopy.c           | 12 ++++++++----
>>>>>>>   xen/arch/arm/include/asm/current.h |  2 +-
>>>>>>>   3 files changed, 12 insertions(+), 8 deletions(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
>>>>>>> index 1f631d3274..e9be078415 100644
>>>>>>> --- a/xen/arch/arm/device.c
>>>>>>> +++ b/xen/arch/arm/device.c
>>>>>>> @@ -319,6 +319,8 @@ int handle_device(struct domain *d, struct 
>>>>>>> dt_device_node *dev, p2m_type_t p2mt,
>>>>>>>       int res;
>>>>>>>       paddr_t addr, size;
>>>>>>>       bool own_device = !dt_device_for_passthrough(dev);
>>>>>>> +    bool dev_is_hostbridge = is_pci_passthrough_enabled() &&
>>>>>>> +                             device_get_class(dev) == 
>>>>>>> DEVICE_PCI_HOSTBRIDGE;
>>>>>>
>>>>>> The commit message suggests that the code is moved because there 
>>>>>> are side-effects. But none of them should have any side-effects.
>>>>>>
>>>>>
>>>>> device_get_class contains an 'ASSERT(dev != NULL)' which is definitely
>>>>> a side-effect.
>>>>
>>>> Just to confirm my understanding, the side-effect here would be the 
>>>> fact that it traps and then panic(). IOW, if the trap was 
>>>> hypothetically replaced by a while (1), then it would not be an 
>>>> issue. is it correct? >
>>>
>>> No, it isn't. A infinite loop is a side effect.
>>
>> I am not sure why. There are no change of state here.
>>
>>>
>>>> I can see two solutions:
>>>>    1) Remove the ASSERT(). It is only here to make the NULL 
>>>> dereference obvious in debug build. That said, the stack trace for a 
>>>> NULL dereference would still be as clear.
>>>
>>> Removing the ASSERT just to make MISRA happy does not sound good to me.
>>
>> I didn't suggest the ASSERT() just ot make MISRA happy. I suggested it 
>> because it has no value here (we still have stack track if there are 
>> any issue).
>>
>>>
>>>>    2) Replace the ASSERT with a proper check if ( !dev ) return 
>>>> DEVICE_UNKONWN. AFAIU, we would not be able to add a 
>>>> ASSERT_UNREACHABLE() because this would be again a perceived 
>>>> side-effect.
>>>>
>>>
>>> Replacing it with a proper check can be a solution, but I still 
>>> prefer to add a deviation or move the invocation outside the 
>>> initializer list.
>>
>> In general, I am not in favor of adding deviation if we can avoid them 
>> because the code can changed and therefore either moot the deviation 
>> or hide any other issue.
>>
> 
> Ok, I will proceed with option 1.
> 
>> [...]
>>
>>> Yes, sorry I was looking to the wrong definition.
>>> In ARM the problem is the presence of a *volatile* ASM.
>>> Please take a look here:
>>>
>>> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/arm/for-4.19/ARM64-Set2/latest/PROJECT.ecd;/by_service/MC3R1.R13.1.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":0,"domain":"fingerprint","inputs":[{"enabled":true,"text":"0da7f0c9aea5491eba343618f965c81f5d7aed3c"}]}}}
>>
>> Ok. So the problem is the READ_SYSREG(...). Is there a way we can 
>> encapsulate the call so we don't need to use your propose trick or 
>> deviate at every use of 'current'?
>>
> 
> The point is that we need to move "READ_SYSREG(TPIDR_EL2)" outside
> the initializer (there are no advantages in wrapping it on a function
> if the function cannot be declared pure).

I was thinking that maybe it could help to deviate.

> 
> The proposed solution seems to me the cleanest way do to it. I do not 
> see any other acceptable solutions.

I have some concern with the proposal (they are most likely matter of 
taste).

We usually use this trick when 'current' is used multiple time to save 
process (using 'current' is not cost free). But in this case, this is 
renaming without any apparent benefits.

If we wanted to go down this route, then this would likely want a 
comment. At which point we should just deviate.

I will have a think if there are something else we can do. Could we 
consider to not address it for now?

Cheers,

-- 
Julien Grall

