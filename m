Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C350742FAA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 23:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557158.870260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzTt-0006JS-Mz; Thu, 29 Jun 2023 21:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557158.870260; Thu, 29 Jun 2023 21:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzTt-0006Gz-K8; Thu, 29 Jun 2023 21:47:13 +0000
Received: by outflank-mailman (input) for mailman id 557158;
 Thu, 29 Jun 2023 21:47:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEzTr-0006Gl-A5
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 21:47:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEzTq-0000Tj-Q9; Thu, 29 Jun 2023 21:47:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEzTq-0004Y1-J6; Thu, 29 Jun 2023 21:47:10 +0000
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
	bh=vsR9/4FR2ebbDWHpGXFdzwQIt95FS8fAmTfZDrK+dVA=; b=glrakY2kYOZVEO5c/x37m+yDMw
	kOKR2O9ZgJRR0XgIqSJ2itCfoWN9ZXglSvMYidShfSapN5cFym5soTVKVGfjYrGnPv8QzN7H0IBw+
	PqgIsggzPvwCXjIHboHyklQbowOBZ6JzKFWbNQxUaCAm3HhWALvEPPWdnOil5B2wk9uM=;
Message-ID: <2503e5dc-66d7-2b6b-2de1-abe4cfd60e09@xen.org>
Date: Thu, 29 Jun 2023 22:47:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/7] xen/arm: Improve readability of check for
 registered devices
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-2-stewart.hildebrand@amd.com>
 <e56be8a0-58a1-bb00-3b3f-8f90434dd315@xen.org>
 <347c6352-83ed-bbd5-8569-97619fb4faf8@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <347c6352-83ed-bbd5-8569-97619fb4faf8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Sorry for the late answer.

On 07/06/2023 14:41, Stewart Hildebrand wrote:
> On 6/7/23 03:27, Julien Grall wrote:
>> Hi Stewart,
>>
>> On 07/06/2023 04:02, Stewart Hildebrand wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Improve readability of check for devices already registered with the SMMU with
>>> legacy mmu-masters DT bindings by using is_protected.
>>
>> I am unconvinced with this change because...
>>
>>>
>>> There are 2 device tree bindings for registering a device with the SMMU:
>>> * mmu-masters (legacy, SMMUv1/2 only)
>>> * iommus
>>>
>>> A device tree may include both mmu-masters and iommus properties (although it is
>>> unnecessary to do so). When a device appears in the mmu-masters list,
>>> np->is_protected and dev->iommu_fwspec both get set by the SMMUv1/2 driver. The
>>> function iommu_add_dt_device() is subsequently invoked for devices that have an
>>> iommus specification.
>>>
>>> The check as it was before this patch:
>>>
>>>     if ( dev_iommu_fwspec_get(dev) )
>>>         return 0;
>>>
>>> and the new check:
>>>
>>>     if ( dt_device_is_protected(np) )
>>>         return 0;
>>>
>>> are guarding against the same corner case: when a device has both mmu-masters
>>> and iommus specifications in the device tree. The is_protected naming is more
>>> descriptive.
>>>
>>> If np->is_protected is not set (i.e. false), but dev->iommu_fwspec is set, it is
>>> an error condition, so return an error in this case.
>>>
>>> Expand the comment to further clarify the corner case.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> v3->v4:
>>> * new patch: this change was split from ("xen/arm: Move is_protected flag to struct device")
>>> ---
>>>    xen/drivers/passthrough/device_tree.c | 11 ++++++++---
>>>    1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>>> index 1c32d7b50cce..d9b63da7260a 100644
>>> --- a/xen/drivers/passthrough/device_tree.c
>>> +++ b/xen/drivers/passthrough/device_tree.c
>>> @@ -141,12 +141,17 @@ int iommu_add_dt_device(struct dt_device_node *np)
>>>            return -EINVAL;
>>>
>>>        /*
>>> -     * The device may already have been registered. As there is no harm in
>>> -     * it just return success early.
>>> +     * Devices that appear in the legacy mmu-masters list may have already been
>>> +     * registered with the SMMU. In case a device has both a mmu-masters entry
>>> +     * and iommus property, there is no need to register it again. In this case
>>> +     * simply return success early.
>>>         */
>>> -    if ( dev_iommu_fwspec_get(dev) )
>>> +    if ( dt_device_is_protected(np) )
>> ... we now have two checks and it implies that it would be normal for
>> dt_device_is_protected() to be false and ...
>>
>>>            return 0;
>>>
>>> +    if ( dev_iommu_fwspec_get(dev) )
>>
>> ... this returning a non-zero value. Is there any other benefits with
>> adding the two checks?
> 
> No, I can't think of any good rationale for the 2nd check. After splitting this change from the other patch ("xen/arm: Move is_protected flag to struct device"), I simply wanted to evaluate it on its own.
> 
>> If the others agree with the double check, then I think this should gain
>> an ASSERT_UNREACHABLE() because AFAIU this is a programming error.
> 
> Right, if the 2nd check was justified, there should be an ASSERT_UNREACHABLE(), good point. But I don't think the 2nd check is justified.
> 
> If the 2nd check is dropped (keeping only the is_protected check), then do you think the change is justified?

To be honest not with the current justification. I don't view the new 
check better than the other in term of readability.

Is this the only reason you want to switch to dt_device_is_protected()?

Cheers,

-- 
Julien Grall

