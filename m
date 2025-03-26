Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9CCA7247A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 23:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928265.1330992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txZJf-0005TR-7P; Wed, 26 Mar 2025 22:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928265.1330992; Wed, 26 Mar 2025 22:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txZJf-0005RM-4j; Wed, 26 Mar 2025 22:33:43 +0000
Received: by outflank-mailman (input) for mailman id 928265;
 Wed, 26 Mar 2025 22:33:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1txZJd-0005RE-IM
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 22:33:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txZJd-009zAg-0t;
 Wed, 26 Mar 2025 22:33:41 +0000
Received: from [2a02:8012:3a1:0:ede3:7fd5:aa96:e2db]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txZJc-000b2b-2j;
 Wed, 26 Mar 2025 22:33:40 +0000
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
	bh=FAto5c8QjAx71EiHWSadHeNyzIBtiGDmIhZGznIHNlQ=; b=l9BEao2hoOHFPT0hdzJ6Bq87ws
	DA1s0PbDCBPBWDh7dEVdLLe+UMYyOYDvsrzthZ8zf5uFk0jOEAYgP/RIvgGQnU9W20MYNbPn5Ck1l
	Ni7/KAe7/6EJFcggdfwG5Lnymd04D5pR40Rq/6LyPkrqA6umyKzASOHSM3fGXZTKVImU=;
Message-ID: <8e19bb8a-ff23-4068-ae48-83e81eda2f20@xen.org>
Date: Wed, 26 Mar 2025 22:33:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
 <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
 <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
 <db47de86-b2c1-4860-9212-49c051e1bebd@xen.org>
 <24809d8d-5d95-4527-89e1-e82889d58e3f@epam.com>
 <180d0f62-cab1-4fb5-a09f-c82b117ff554@xen.org>
 <340d58e8-b4f0-43ce-8925-e509282bccf0@epam.com>
 <48c3c175-8249-4e9c-91b2-babc227f68fc@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <48c3c175-8249-4e9c-91b2-babc227f68fc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/03/2025 08:57, Orzel, Michal wrote:
> 
> 
> On 25/03/2025 17:54, Oleksandr Tyshchenko wrote:
>>
>>
>> On 25.03.25 18:09, Julien Grall wrote:
>>
>>
>>> Hi Oleksandr,
>>
>> Hello Julien
>>
>>>
>>> On 25/03/2025 16:05, Oleksandr Tyshchenko wrote:
>>>>>>> Furthermore, what happen if we decide to use ACPI afterwards? Wouldn't
>>>>>>> this mean that the static regions would be reserved even if ACPI
>>>>>>> doesn't
>>>>>>> use static memory (all the memory is expected to be given to the
>>>>>>> allocator)?
>>>>>> I don't think such hybrid configuration is valid (booting with ACPI yet
>>>>>> declaring reserved regions in DT). See commit:
>>>>>> 9c2bc0f24b2ba7082df408b3c33ec9a86bf20cf0
>>>>>
>>>>> I don't think the commit is preventing hybrid configuration. It is just
>>>>> saying that the region (which could be a static region because this is
>>>>> not supported) will be unreserved.
>>>>>
>>>>> IOW, when booting with Device-Tree you may be able to use static memory.
>>>>> But if you were booting with ACPI, static memory is not supported and
>>>>> therefore the regions should be free for other purpose.
>>>>
>>>>
>>>> Julien, I see your points, but the current patch does not attempt to
>>>> make static (reserved) memory properly work on ACPI-based system (if it
>>>> is available there), current patch tries to solve the real issue on
>>>> device-tree-based system with Xen compiled with CONFIG_ACPI=y (at least
>>>> unintentionally).
>>>
>>> I am not asking to make ACPI work with static memory. I am asking to not
>>> break ACPI if the Device-Tree is specifying static memory region.
>>>
>>>> However, I wonder, why it has not been noticed so far.
>>>
>>> ACPI is not a supported feature and gated by UNSUPPORTED. So the
>>> implication is you have enabled UNSUPPORTED and anything can happen
>>> really ;).
>>
>> Indeed, this answers the question.
>>
>>
>>>
>>>>
>>>> It took some time to understand why just enabling CONFIG_STATIC_MEMORY=y
>>>> triggered a BUG in common code. And it turned out that it was
>>>> CONFIG_ACPI=y in my Xen's .config that caused that consequence (I
>>>> specially wrote so long description to provide full context).
>>>
>>> As I wrote above, the only thing I am asking is that memory for static
>>> regions should be unreserved when ACPI is enabled like it is already the
>>> case today.
>>
>> So the concern is that not reserving provided by the device tree static
>> memory region is going to be a potential waste of the memory on the real
>> ACPI system? Or I missed something?
>>
>> I see two options with unreserving the static memory regions on the real
>> ACPI system. I assume, that we should unreserve only after we definitely
>> know that we are running with ACPI (i.e. after acpi_boot_table_init()
>> completes and acpi_disabled reflects the real state of things), right?
>>
>> 1. either call acpi_boot_table_init() before setup_mm() in Arm64's
>> start_xen().
> This cannot be done. acpi_boot_table_init() calls ACPI functions that make use
> of VMAP and alloc_boot_pages, so the boot allocator is expected to be populated
> at this point.
> 
>> 2. or go through reserved_mem->nr_banks and unreserve everything marked
>> with MEMBANK_STATIC_DOMAIN after acpi_boot_table_init() completes
> What if we split acpi_boot_table_init() into 2 parts, where first is used to
> determine the real "acpi_disabled" value, called before setup_mm and second used
> to parse the tables?

That would be fine with me in principle.

> There's one issue with this approach. Today, even after we
> evaluate that we should run with ACPI enabled [*], error in ACPI table parsing
> is ignored and ACPI is set to disabled. That's not really in the spirit of our
> current methodology, where we should panic if user requested something that does
> not work. Example: today, even after specifying "acpi=force", error in table
> parsing bails out to DT approach which is not what user wanted.

If you plan to send such patch, can you have a look at [1]? This was an 
attempt to panic if we can't enable ACPI and the user requested it.

[1] 
https://lore.kernel.org/all/1486149538-20432-6-git-send-email-julien.grall@arm.com/

> 
> ~Michal
> 

-- 
Julien Grall


