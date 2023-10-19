Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915E7CF318
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 10:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618987.963400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOcq-0006Vy-DB; Thu, 19 Oct 2023 08:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618987.963400; Thu, 19 Oct 2023 08:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOcq-0006UJ-9p; Thu, 19 Oct 2023 08:43:28 +0000
Received: by outflank-mailman (input) for mailman id 618987;
 Thu, 19 Oct 2023 08:43:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=in48=GB=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qtOcp-0006UD-3P
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 08:43:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f9ed852-6e5b-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 10:43:22 +0200 (CEST)
Received: from [192.168.1.9] (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id F32154EE0742;
 Thu, 19 Oct 2023 10:43:21 +0200 (CEST)
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
X-Inumbo-ID: 8f9ed852-6e5b-11ee-9b0e-b553b5be7939
Message-ID: <67782815-7803-4ef5-80f4-db6181f7a6e2@bugseng.com>
Date: Thu, 19 Oct 2023 10:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/4] xen/arm: address violations of MISRA C:2012 Rule
 13.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <31a926a09dfcef43d13a402fd3b235aeba48009d.1697638210.git.simone.ballarin@bugseng.com>
 <41d82896-5471-4eaa-8bdd-a192e28d5546@xen.org>
 <3de5e340-30bb-44aa-affd-89f343ed1fa1@bugseng.com>
 <7066a646-711c-4dce-f3c0-effb6ae91a39@xen.org>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <7066a646-711c-4dce-f3c0-effb6ae91a39@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/10/23 10:19, Julien Grall wrote:
> Hi Simone,
> 
> On 19/10/2023 08:34, Simone Ballarin wrote:
>> On 18/10/23 17:03, Julien Grall wrote:
>>> Hi,
>>>
>>> On 18/10/2023 15:18, Simone Ballarin wrote:
>>>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>>>
>>>> This patch moves expressions with side-effects into new variables 
>>>> before
>>>> the initializer lists.
>>>
>>> Looking at the code, I feel the commit message should be a bit more 
>>> verbose because they are no apparent side-effects.
>>>
>>>>
>>>> Function calls do not necessarily have side-effects, in these cases the
>>>> GCC pure or const attributes are added when possible.
>>>
>>> You are only adding pure in this patch.
>>>
>>>>
>>>> No functional changes.
>>>>
>>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>>>
>>>> ---
>>>> Function attributes pure and const do not need to be added as GCC
>>>> attributes, they can be added using ECLAIR configurations.
>>>> ---
>>>>   xen/arch/arm/device.c              |  6 +++---
>>>>   xen/arch/arm/guestcopy.c           | 12 ++++++++----
>>>>   xen/arch/arm/include/asm/current.h |  2 +-
>>>>   3 files changed, 12 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
>>>> index 1f631d3274..e9be078415 100644
>>>> --- a/xen/arch/arm/device.c
>>>> +++ b/xen/arch/arm/device.c
>>>> @@ -319,6 +319,8 @@ int handle_device(struct domain *d, struct 
>>>> dt_device_node *dev, p2m_type_t p2mt,
>>>>       int res;
>>>>       paddr_t addr, size;
>>>>       bool own_device = !dt_device_for_passthrough(dev);
>>>> +    bool dev_is_hostbridge = is_pci_passthrough_enabled() &&
>>>> +                             device_get_class(dev) == 
>>>> DEVICE_PCI_HOSTBRIDGE;
>>>
>>> The commit message suggests that the code is moved because there are 
>>> side-effects. But none of them should have any side-effects.
>>>
>>
>> device_get_class contains an 'ASSERT(dev != NULL)' which is definitely
>> a side-effect.
> 
> Just to confirm my understanding, the side-effect here would be the fact 
> that it traps and then panic(). IOW, if the trap was hypothetically 
> replaced by a while (1), then it would not be an issue. is it correct? >

No, it isn't. A infinite loop is a side effect.

> I can see two solutions:
>    1) Remove the ASSERT(). It is only here to make the NULL dereference 
> obvious in debug build. That said, the stack trace for a NULL 
> dereference would still be as clear.

Removing the ASSERT just to make MISRA happy does not sound good to me.

>    2) Replace the ASSERT with a proper check if ( !dev ) return 
> DEVICE_UNKONWN. AFAIU, we would not be able to add a 
> ASSERT_UNREACHABLE() because this would be again a perceived side-effect.
> 

Replacing it with a proper check can be a solution, but I still prefer 
to add a deviation or move the invocation outside the initializer list.

> The former feels a bit circumventing MISRA as the side effect is 
> technically still present. Just hidden. But I do prefer over 2).
> 
>>>>       /*
>>>>        * We want to avoid mapping the MMIO in dom0 for the following 
>>>> cases:
>>>>        *   - The device is owned by dom0 (i.e. it has been flagged for
>>>> @@ -329,9 +331,7 @@ int handle_device(struct domain *d, struct 
>>>> dt_device_node *dev, p2m_type_t p2mt,
>>>>       struct map_range_data mr_data = {
>>>>           .d = d,
>>>>           .p2mt = p2mt,
>>>> -        .skip_mapping = !own_device ||
>>>> -                        (is_pci_passthrough_enabled() &&
>>>> -                        (device_get_class(dev) == 
>>>> DEVICE_PCI_HOSTBRIDGE)),
>>>> +        .skip_mapping = !own_device || dev_is_hostbridge,
>>>>           .iomem_ranges = iomem_ranges,
>>>>           .irq_ranges = irq_ranges
>>>>       };
>>>> diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
>>>> index 6716b03561..3ec6743bf6 100644
>>>> --- a/xen/arch/arm/guestcopy.c
>>>> +++ b/xen/arch/arm/guestcopy.c
>>>> @@ -109,27 +109,31 @@ static unsigned long copy_guest(void *buf, 
>>>> uint64_t addr, unsigned int len,
>>>>   unsigned long raw_copy_to_guest(void *to, const void *from, 
>>>> unsigned int len)
>>>>   {
>>>> +    struct vcpu *current_vcpu = current;
>>>
>>> It is not clear to me what is the perceived side effect here and the 
>>> others below. Can you clarify?
>>>
>>
>> I will use the pure attribute.
> So x86 is using a function to define current. But AFAICT this is not the 
> case on Arm. So how would you add the pure?
> 
> If it is by adding a function, then I would first like to understand 
> which part 'current' is currently perceived as a side-effect.
> 

Yes, sorry I was looking to the wrong definition.
In ARM the problem is the presence of a *volatile* ASM.
Please take a look here:

https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/arm/for-4.19/ARM64-Set2/latest/PROJECT.ecd;/by_service/MC3R1.R13.1.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":0,"domain":"fingerprint","inputs":[{"enabled":true,"text":"0da7f0c9aea5491eba343618f965c81f5d7aed3c"}]}}}

> Cheers,
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


