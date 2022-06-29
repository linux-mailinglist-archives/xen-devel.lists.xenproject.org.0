Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3210755FCF7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 12:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357732.586508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Ulj-00067T-HX; Wed, 29 Jun 2022 10:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357732.586508; Wed, 29 Jun 2022 10:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Ulj-00063i-CG; Wed, 29 Jun 2022 10:17:59 +0000
Received: by outflank-mailman (input) for mailman id 357732;
 Wed, 29 Jun 2022 10:17:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6Ulh-000625-OL
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 10:17:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6Ulh-0008En-H8; Wed, 29 Jun 2022 10:17:57 +0000
Received: from [54.239.6.187] (helo=[192.168.9.41])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6Ulh-0003KL-BQ; Wed, 29 Jun 2022 10:17:57 +0000
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
	bh=tCNZoEBeaXiQQORTk17dQGs+E6WZpOg1vOmlhRfXa+A=; b=E4Wkgbj9pJCpCjBn+qTiKVwFS8
	ccsmOMzkMsKRSzfBQbI3XCOjEtT9sp3mrwrzMMceuq/Nkf9V8qdOlo0TGETyWaDdyM6bsvaHVcbEu
	4/5IxKhnzRQ8FcrjqJ/hwOfjYNp06CbulTKhFVRdyS8wn2jZ7+LupoUAbyDYadY6ORMA=;
Message-ID: <9172fc95-0939-3680-94cf-b991c46d0918@xen.org>
Date: Wed, 29 Jun 2022 11:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v5 1/8] xen/arm: introduce static shared memory
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-2-Penny.Zheng@arm.com>
 <45a41132-1520-a894-a9eb-6688c79a660d@xen.org>
 <DU2PR08MB7325C156D4D6D5A2D18E0FF4F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB7325C156D4D6D5A2D18E0FF4F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/06/2022 06:38, Penny Zheng wrote:
> Hi Julien

Hi Penny,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Saturday, June 25, 2022 1:55 AM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v5 1/8] xen/arm: introduce static shared memory
>>
>> Hi Penny,
>>
>> On 20/06/2022 06:11, Penny Zheng wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>>
>>> This patch serie introduces a new feature: setting up static
>>
>> Typo: s/serie/series/
>>
>>> shared memory on a dom0less system, through device tree configuration.
>>>
>>> This commit parses shared memory node at boot-time, and reserve it in
>>> bootinfo.reserved_mem to avoid other use.
>>>
>>> This commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
>>> static-shm-related codes, and this option depends on static memory(
>>> CONFIG_STATIC_MEMORY). That's because that later we want to reuse a
>>> few helpers, guarded with CONFIG_STATIC_MEMORY, like
>>> acquire_staticmem_pages, etc, on static shared memory.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>> v5 change:
>>> - no change
>>> ---
>>> v4 change:
>>> - nit fix on doc
>>> ---
>>> v3 change:
>>> - make nr_shm_domain unsigned int
>>> ---
>>> v2 change:
>>> - document refinement
>>> - remove bitmap and use the iteration to check
>>> - add a new field nr_shm_domain to keep the number of shared domain
>>> ---
>>>    docs/misc/arm/device-tree/booting.txt | 120
>> ++++++++++++++++++++++++++
>>>    xen/arch/arm/Kconfig                  |   6 ++
>>>    xen/arch/arm/bootfdt.c                |  68 +++++++++++++++
>>>    xen/arch/arm/include/asm/setup.h      |   3 +
>>>    4 files changed, 197 insertions(+)
>>>
>>> diff --git a/docs/misc/arm/device-tree/booting.txt
>>> b/docs/misc/arm/device-tree/booting.txt
>>> index 98253414b8..6467bc5a28 100644
>>> --- a/docs/misc/arm/device-tree/booting.txt
>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>> @@ -378,3 +378,123 @@ device-tree:
>>>
>>>    This will reserve a 512MB region starting at the host physical address
>>>    0x30000000 to be exclusively used by DomU1.
>>> +
>>> +Static Shared Memory
>>> +====================
>>> +
>>> +The static shared memory device tree nodes allow users to statically
>>> +set up shared memory on dom0less system, enabling domains to do
>>> +shm-based communication.
>>> +
>>> +- compatible
>>> +
>>> +    "xen,domain-shared-memory-v1"
>>> +
>>> +- xen,shm-id
>>> +
>>> +    An 8-bit integer that represents the unique identifier of the shared
>> memory
>>> +    region. The maximum identifier shall be "xen,shm-id = <0xff>".
>>> +
>>> +- xen,shared-mem
>>> +
>>> +    An array takes a physical address, which is the base address of the
>>> +    shared memory region in host physical address space, a size, and a
>> guest
>>> +    physical address, as the target address of the mapping. The number of
>> cells
>>> +    for the host address (and size) is the same as the guest pseudo-physical
>>> +    address and they are inherited from the parent node.
>>
>> Sorry for jump in the discussion late. But as this is going to be a stable ABI, I
>> would to make sure the interface is going to be easily extendable.
>>
>> AFAIU, with your proposal the host physical address is mandatory. I would
>> expect that some user may want to share memory but don't care about the
>> exact location in memory. So I think it would be good to make it optional in
>> the binding.
>>
>> I think this wants to be done now because it would be difficult to change the
>> binding afterwards (the host physical address is the first set of cells).
>>
>> The Xen doesn't need to handle the optional case.
>>
> 
> Sure, I'll make "the host physical address" optional here, and right now, with no actual
> code implementation. I'll make up it later in free time~
> 
> The user case you mentioned here is that we let xen to allocate an arbitrary static shared
> memory region, so size and guest physical address are still mandatory, right?

That's correct.

Cheers,

-- 
Julien Grall

