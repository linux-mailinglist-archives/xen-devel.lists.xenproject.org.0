Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201FD880E97
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 10:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695832.1086001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmsHF-00065R-10; Wed, 20 Mar 2024 09:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695832.1086001; Wed, 20 Mar 2024 09:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmsHE-00063J-Ub; Wed, 20 Mar 2024 09:30:28 +0000
Received: by outflank-mailman (input) for mailman id 695832;
 Wed, 20 Mar 2024 09:30:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rmsHD-00063D-3D
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 09:30:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rmsHC-0002bc-JI; Wed, 20 Mar 2024 09:30:26 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rmsHC-0003As-Cp; Wed, 20 Mar 2024 09:30:26 +0000
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
	bh=4FbetOi/3Ab3QJN9s09ElkGp8JY7Pxge5atD5lan0Hk=; b=S5Anm6PWeyW4fj9moF2wedJ7Nu
	/OaaMyB+Dhca3EeImUaNfgQIXd5e3l38GUjHMBxs2HTT6tk/NAkNBqsrlYI6jlV6c3IHCAJXfMPPs
	ZDk2lb9foD2Ea3isumtlNXneu4bKkFzXSTxA/dpsA1RfqbDg2EcCKSBEZi5SmCWWSqdg=;
Message-ID: <72a2fa69-7e10-4282-ad7e-77b2f8f19548@xen.org>
Date: Wed, 20 Mar 2024 09:30:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] xen/arm: Introduce a generic way to access memory
 bank structures
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu
 <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-4-luca.fancellu@arm.com>
 <73dbf297-31ed-4cf1-b081-c6f82c234de8@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <73dbf297-31ed-4cf1-b081-c6f82c234de8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/03/2024 13:10, Michal Orzel wrote:
> Hi Luca,
> 
> On 12/03/2024 14:03, Luca Fancellu wrote:
>>
>>
>> Currently the 'stuct meminfo' is defining a static defined array of
>> 'struct membank' of NR_MEM_BANKS elements, some feature like
>> shared memory don't require such amount of memory allocation but
>> might want to reuse existing code to manipulate this kind of
>> structure that is just as 'struct meminfo' but less bulky.
>>
>> For this reason introduce a generic way to access this kind of
>> structure using a new stucture 'struct membanks', which implements
> s/stucture/structure
> 
>> all the fields needed by a structure related to memory banks
>> without the need to specify at build time the size of the
>> 'struct membank' array.
> Might be beneficial here to mention the use of FAM.
I had to look it up online and there was no hit on Google. I guess you 
mean "Flexible Array Member".

>> Modify 'struct meminfo' to implement the field related to the new
>> introduced structure, given the change all usage of this structure
>> are updated in this way:
>>   - code accessing bootinfo.{mem,reserved_mem,acpi} field now uses
>>     3 new introduced static inline helpers to access the new field
>>     of 'struct meminfo' named 'common'.
>>   - code accessing 'struct kernel_info *' member 'mem' now use the
>>     new introduced macro 'kernel_info_get_mem(...)' to access the
>>     new field of 'struct meminfo' named 'common'.
>>
>> Constify pointers where needed.
>>
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>   xen/arch/arm/acpi/domain_build.c        |   6 +-
>>   xen/arch/arm/arm32/mmu/mm.c             |  44 +++++-----
>>   xen/arch/arm/arm64/mmu/mm.c             |   2 +-
>>   xen/arch/arm/bootfdt.c                  |  27 +++---
>>   xen/arch/arm/dom0less-build.c           |  18 ++--
>>   xen/arch/arm/domain_build.c             | 106 +++++++++++++-----------
>>   xen/arch/arm/efi/efi-boot.h             |   8 +-
>>   xen/arch/arm/efi/efi-dom0.c             |  13 +--
>>   xen/arch/arm/include/asm/domain_build.h |   2 +-
>>   xen/arch/arm/include/asm/kernel.h       |   9 ++
>>   xen/arch/arm/include/asm/setup.h        |  40 ++++++++-
>>   xen/arch/arm/include/asm/static-shmem.h |   4 +-
>>   xen/arch/arm/kernel.c                   |  12 +--
>>   xen/arch/arm/setup.c                    |  58 +++++++------
>>   xen/arch/arm/static-memory.c            |  27 +++---
>>   xen/arch/arm/static-shmem.c             |  34 ++++----
>>   16 files changed, 243 insertions(+), 167 deletions(-)
> Lots of mechanical changes but in general I like this approach.
> I'd like other maintainers to share their opinion.
I don't mind the churn so long we get a correct interface at the end. 
The current interface looks alright (I know I suggested it ;)).

> 
> [...]
> 
>> @@ -1157,10 +1163,12 @@ int __init make_hypervisor_node(struct domain *d,
>>       }
>>       else
>>       {
>> -        ext_regions = xzalloc(struct meminfo);
>> +        ext_regions = (struct membanks *)xzalloc(struct meminfo);
> You're making assumption that struct membanks is the first member of meminfo but there's no sanity check.
> Why not xzalloc_flex_struct()?
> 
>>           if ( !ext_regions )
>>               return -ENOMEM;
> 
> [...]
>> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
>> index 0a23e86c2d37..d28b843c01a9 100644
>> --- a/xen/arch/arm/include/asm/kernel.h
>> +++ b/xen/arch/arm/include/asm/kernel.h
>> @@ -78,6 +78,15 @@ struct kernel_info {
>>       };
>>   };
>>
>> +#define kernel_info_get_mem(kinfo) \
>> +    (&(kinfo)->mem.common)
> Why this is a macro but for bootinfo you use static inline helpers?
> 
>> +
>> +#define KERNEL_INFO_INIT \
> NIT: in most places we prefer \ to be aligned (the same apply to other places)
> 
>> +{ \
>> +    .mem.common.max_banks = NR_MEM_BANKS, \
>> +    .shm_mem.common.max_banks = NR_MEM_BANKS, \
>> +}
>> +
>>   /*
>>    * Probe the kernel to detemine its type and select a loader.
>>    *
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index d15a88d2e0d1..a3e1dc8fdb6c 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -56,8 +56,14 @@ struct membank {
>>   #endif
>>   };
>>
>> -struct meminfo {
>> +struct membanks {
>>       unsigned int nr_banks;
>> +    unsigned int max_banks;
>> +    struct membank bank[];
>> +};
>> +
>> +struct meminfo {
>> +    struct membanks common;
> You were supposed to make sure there is no extra padding here. I don't see any check in this patch.
> I'd at least do sth like:
> BUILD_BUG_ON((offsetof(struct membanks, bank)) != (offsetof(struct meminfo, bank)));

+1. You could also check that "struct membanks" is 8-byte aligned.

Cheers,

-- 
Julien Grall

