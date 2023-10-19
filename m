Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D97CF251
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 10:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618980.963381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOGB-00010D-5I; Thu, 19 Oct 2023 08:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618980.963381; Thu, 19 Oct 2023 08:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOGB-0000vk-20; Thu, 19 Oct 2023 08:20:03 +0000
Received: by outflank-mailman (input) for mailman id 618980;
 Thu, 19 Oct 2023 08:20:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtOG9-0000hb-OQ
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 08:20:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtOG9-0000wp-3z; Thu, 19 Oct 2023 08:20:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtOG8-0000Io-Uq; Thu, 19 Oct 2023 08:20:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=ajAe7NkMxUXwaHEn5b+usjlscBSN7dnWbuTOJiht4JQ=; b=JHdny2LL/eyebbIqaZgUbdFkoJ
	JYujx7MJd9qFtMsL0dYb6YVgYoFEhFgaU+z7r+QRFlIL9UlaybJmnscXLdfYRkm97QRiH4l2ew6x0
	nOqjDzvbedKPebSVBn+IcK1HTCQLst6U1xPiZGS6howrx7Z4xRUzYKyQGvT4EvUTKmwQ=;
Message-ID: <7066a646-711c-4dce-f3c0-effb6ae91a39@xen.org>
Date: Thu, 19 Oct 2023 09:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <31a926a09dfcef43d13a402fd3b235aeba48009d.1697638210.git.simone.ballarin@bugseng.com>
 <41d82896-5471-4eaa-8bdd-a192e28d5546@xen.org>
 <3de5e340-30bb-44aa-affd-89f343ed1fa1@bugseng.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH 1/4] xen/arm: address violations of MISRA C:2012 Rule
 13.1
In-Reply-To: <3de5e340-30bb-44aa-affd-89f343ed1fa1@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Simone,

On 19/10/2023 08:34, Simone Ballarin wrote:
> On 18/10/23 17:03, Julien Grall wrote:
>> Hi,
>>
>> On 18/10/2023 15:18, Simone Ballarin wrote:
>>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>>
>>> This patch moves expressions with side-effects into new variables before
>>> the initializer lists.
>>
>> Looking at the code, I feel the commit message should be a bit more 
>> verbose because they are no apparent side-effects.
>>
>>>
>>> Function calls do not necessarily have side-effects, in these cases the
>>> GCC pure or const attributes are added when possible.
>>
>> You are only adding pure in this patch.
>>
>>>
>>> No functional changes.
>>>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>>
>>> ---
>>> Function attributes pure and const do not need to be added as GCC
>>> attributes, they can be added using ECLAIR configurations.
>>> ---
>>>   xen/arch/arm/device.c              |  6 +++---
>>>   xen/arch/arm/guestcopy.c           | 12 ++++++++----
>>>   xen/arch/arm/include/asm/current.h |  2 +-
>>>   3 files changed, 12 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
>>> index 1f631d3274..e9be078415 100644
>>> --- a/xen/arch/arm/device.c
>>> +++ b/xen/arch/arm/device.c
>>> @@ -319,6 +319,8 @@ int handle_device(struct domain *d, struct 
>>> dt_device_node *dev, p2m_type_t p2mt,
>>>       int res;
>>>       paddr_t addr, size;
>>>       bool own_device = !dt_device_for_passthrough(dev);
>>> +    bool dev_is_hostbridge = is_pci_passthrough_enabled() &&
>>> +                             device_get_class(dev) == 
>>> DEVICE_PCI_HOSTBRIDGE;
>>
>> The commit message suggests that the code is moved because there are 
>> side-effects. But none of them should have any side-effects.
>>
> 
> device_get_class contains an 'ASSERT(dev != NULL)' which is definitely
> a side-effect.

Just to confirm my understanding, the side-effect here would be the fact 
that it traps and then panic(). IOW, if the trap was hypothetically 
replaced by a while (1), then it would not be an issue. is it correct?

I can see two solutions:
   1) Remove the ASSERT(). It is only here to make the NULL dereference 
obvious in debug build. That said, the stack trace for a NULL 
dereference would still be as clear.
   2) Replace the ASSERT with a proper check if ( !dev ) return 
DEVICE_UNKONWN. AFAIU, we would not be able to add a 
ASSERT_UNREACHABLE() because this would be again a perceived side-effect.

The former feels a bit circumventing MISRA as the side effect is 
technically still present. Just hidden. But I do prefer over 2).

>>>       /*
>>>        * We want to avoid mapping the MMIO in dom0 for the following 
>>> cases:
>>>        *   - The device is owned by dom0 (i.e. it has been flagged for
>>> @@ -329,9 +331,7 @@ int handle_device(struct domain *d, struct 
>>> dt_device_node *dev, p2m_type_t p2mt,
>>>       struct map_range_data mr_data = {
>>>           .d = d,
>>>           .p2mt = p2mt,
>>> -        .skip_mapping = !own_device ||
>>> -                        (is_pci_passthrough_enabled() &&
>>> -                        (device_get_class(dev) == 
>>> DEVICE_PCI_HOSTBRIDGE)),
>>> +        .skip_mapping = !own_device || dev_is_hostbridge,
>>>           .iomem_ranges = iomem_ranges,
>>>           .irq_ranges = irq_ranges
>>>       };
>>> diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
>>> index 6716b03561..3ec6743bf6 100644
>>> --- a/xen/arch/arm/guestcopy.c
>>> +++ b/xen/arch/arm/guestcopy.c
>>> @@ -109,27 +109,31 @@ static unsigned long copy_guest(void *buf, 
>>> uint64_t addr, unsigned int len,
>>>   unsigned long raw_copy_to_guest(void *to, const void *from, 
>>> unsigned int len)
>>>   {
>>> +    struct vcpu *current_vcpu = current;
>>
>> It is not clear to me what is the perceived side effect here and the 
>> others below. Can you clarify?
>>
> 
> I will use the pure attribute.

So x86 is using a function to define current. But AFAICT this is not the 
case on Arm. So how would you add the pure?

If it is by adding a function, then I would first like to understand 
which part 'current' is currently perceived as a side-effect.

Cheers,

-- 
Julien Grall

