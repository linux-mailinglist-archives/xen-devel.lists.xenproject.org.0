Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E64CA3FCB
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 15:22:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177698.1501899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRADL-00057V-3o; Thu, 04 Dec 2025 14:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177698.1501899; Thu, 04 Dec 2025 14:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRADL-000564-0r; Thu, 04 Dec 2025 14:21:47 +0000
Received: by outflank-mailman (input) for mailman id 1177698;
 Thu, 04 Dec 2025 14:21:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vRADJ-00055w-9g
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 14:21:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vRADH-006ZQY-2i;
 Thu, 04 Dec 2025 14:21:43 +0000
Received: from [15.248.2.26] (helo=[10.24.67.138])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vRADH-00CKUR-0C;
 Thu, 04 Dec 2025 14:21:43 +0000
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
	bh=mV+Fp6dxMdUUH2m1Gd/PAw9haVuZEOoC3Wlzn2wttgE=; b=pz5RkF6Bcbq23VcGNzPTXnzUSY
	0Syva5wIZyTNJjL0d9Sk4yiXc2u67aruWKY8S65fPWTA1eZ1LbrJiudkqu7etcKbH6o1jY7oebXrU
	rHgfJ8CR8GeZz1euEbd/bLUlxOfmqpj7ObLuMv5//7XhXHB+tmNNYdtg5KrfUHq+kNTA=;
Message-ID: <42990627-9764-4a86-924b-3723cc493da9@xen.org>
Date: Thu, 4 Dec 2025 14:21:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
 <6e83d3bc-c49c-49f4-9dbd-e994e53a62a7@xen.org>
 <44f6cb05-33c3-4937-b508-7616c36d0e4d@epam.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <44f6cb05-33c3-4937-b508-7616c36d0e4d@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/12/2025 22:25, Oleksandr Tyshchenko wrote:
> 
> 
> On 03.12.25 23:10, Julien Grall wrote:
>> Hi,
> 
> Hello Julien
> 
>>
>> On 03/12/2025 18:58, Oleksandr Tyshchenko wrote:
>>> Creating a dom0less guest with a high vCPU count (e.g., >32) fails
>>> because the fixed 4KiB device tree buffer (DOMU_DTB_SIZE) overflows
>>> during creation.
>>>
>>> The FDT nodes for each vCPU are the primary consumer of space,
>>> and the previous fixed-size buffer was insufficient.
>>>
>>> This patch replaces the fixed size with a formula that calculates
>>> the required buffer size based on a fixed baseline plus a scalable
>>> portion for each potential vCPU up to the MAX_VIRT_CPUS limit.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> V1: https://eur01.safelinks.protection.outlook.com/?
>>> url=https%3A%2F%2Fpatchew.org%2FXen%2F20251202193246.3357821-1-
>>> oleksandr._5Ftyshchenko%40epam.com%2F&data=05%7C02%7COleksandr_Tyshchenko%40epam.com%7C57bf7711ac4747de3d2f08de32b069ce%7Cb41b72d04e9f4c268a69f949f367c91d%7C1%7C0%7C639003930443970639%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=u6pp39%2FVto2vU7Hp5aXl46VF4zDvD8C79Xp09bbowS4%3D&reserved=0
>>>
>>>     V2:
>>>      - update commit subj/desc
>>>      - use a formula that accounts MAX_VIRT_CPUS
>>>      - add BUILD_BUG_ON
>>> ---
>>> ---
>>>    xen/common/device-tree/dom0less-build.c | 16 +++++++++++++---
>>>    1 file changed, 13 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/
>>> device-tree/dom0less-build.c
>>> index 3f5b987ed8..38a5830813 100644
>>> --- a/xen/common/device-tree/dom0less-build.c
>>> +++ b/xen/common/device-tree/dom0less-build.c
>>> @@ -461,15 +461,25 @@ static int __init
>>> domain_handle_dtb_boot_module(struct domain *d,
>>>    /*
>>>     * The max size for DT is 2MB. However, the generated DT is small
>>> (not including
>>> - * domU passthrough DT nodes whose size we account separately), 4KB
>>> are enough
>>> - * for now, but we might have to increase it in the future.
>>> + * domU passthrough DT nodes whose size we account separately). The
>>> size is
>>> + * calculated from a fixed baseline plus a scalable portion for each
>>> potential
>>> + * vCPU node up to the system limit (MAX_VIRT_CPUS), as the vCPU
>>> nodes are
>>> + * the primary consumer of space.
>>> + *
>>> + * The baseline of 2KiB is a safe buffer for all non-vCPU FDT content.
>>
>> What if the use decides to pass a DTB fragment? How do we know this will
>> fit in the 2KiB?
> 
> If a partial device tree is provided then it will be accounted
> separately. There is a code, non-visible is the context, so I think, we
> are good here.

Ah yes! I missed that code. Sorry for the noise.

> 
> 
>>
>>> + * Empirical testing with the maximum number of other device tree
>>> nodes shows
>>> + * a final compacted base size of ~1.5KiB. The 128 bytes per vCPU is
>>> derived
>>> + * from a worst-case analysis of the FDT construction-time size for a
>>> single
>>> + * vCPU node.
>>
>> For in-code documentation, this is ok to just provide some numbers. But
>> this needs a bit more details in the commit message with the exact tests
>> you did. This would be helpful if we ever need to change the size (for
>> instance we could have extra emulated devices or we need another
>> property per CPU).
> 
> ok, I will add my testing details into the commit description.
> 
>>
>>>     */
>>> -#define DOMU_DTB_SIZE 4096
>>> +#define DOMU_DTB_SIZE (2048 + (MAX_VIRT_CPUS * 128))
>>
>> On Arm32, MAX_VIRT_CPUS is 8. This means the new DOMU_DTB_SIZE is going
>> to be smaller than 4096. Why is it ok?
> 
> You are correct to question the impact on Arm32, where MAX_VIRT_CPUS is
> smaller, leading to a calculated buffer size of 3072 bytes, which is
> less than the original 4096 bytes.
> 
> Unfortunately, I have no possibility to test on Arm32. But, I do not see
> much difference between Arm64 and Arm32 in the context of DomU device
> tree generation by looking into the code.
> 
> I simulated this exact environment on my Arm64 setup to validate that
> the new size remains sufficient. To do this, I temporarily switched
> MAX_VIRT_CPUS to 8 and ran tests with 1 and 8 vCPUs.

Thanks for doing that! I also see Luca is going to help. If he also 
confirms the size is good then can you mention the change for Arm 32-bit?

Cheers,

-- 
Julien Grall


