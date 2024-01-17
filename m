Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0F8304FD
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 13:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668444.1040662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ4kr-0008TG-L9; Wed, 17 Jan 2024 12:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668444.1040662; Wed, 17 Jan 2024 12:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ4kr-0008RG-Id; Wed, 17 Jan 2024 12:10:49 +0000
Received: by outflank-mailman (input) for mailman id 668444;
 Wed, 17 Jan 2024 12:10:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rQ4kq-0008R6-7H
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 12:10:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQ4kp-000756-J7; Wed, 17 Jan 2024 12:10:47 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQ4kp-0000zK-AD; Wed, 17 Jan 2024 12:10:47 +0000
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
	bh=qJVXl30sKPSmw01+z7oGpxut0lwh5RUu3gm61I287mE=; b=D87wIca1aA38ItJaHvE8GvR+h8
	LbOFe27xcp/Lrcn/LWfqqX0xROnWRImiRUFspB/RI5q9GaU+qlKq+yBdRuCFpPCAk5CHFdD8rq7Ap
	Q6Mu9DE1NsQordPHS97ADOqfQyePVeSBUBeGOXnj423TZtGM20DfqSEtgHTnu3quOUkk=;
Message-ID: <ea7b5499-5b15-4c03-8187-39a9456e6ea4@xen.org>
Date: Wed, 17 Jan 2024 12:10:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 repost 1/4] arm/mmu: Move init_ttbr to a new section
 .data.idmap
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: carlo.nonato@minervasys.tech, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240116143709.86584-1-julien@xen.org>
 <20240116143709.86584-2-julien@xen.org>
 <6b4bfccf-4455-40c0-b6bb-c5dd7c154ac3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6b4bfccf-4455-40c0-b6bb-c5dd7c154ac3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/01/2024 08:30, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 16/01/2024 15:37, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> With the upcoming work to color Xen, the binary will not be anymore
>> physically contiguous. This will be a problem during boot as the
>> assembly code will need to work out where each piece of Xen reside.
>>
>> An easy way to solve the issue is to have all code/data accessed
>> by the secondary CPUs while the MMU is off within a single page.
>>
>> Right now, init_ttbr is used by secondary CPUs to find there page-tables
>> before the MMU is on. Yet it is currently in .data which is unlikely
>> to be within the same page as the rest of the idmap.
>>
>> Create a new section .data.idmap that will be used for variables
>> accessed by the early boot code. The first one is init_ttbr.
>>
>> The idmap is currently part of the text section and therefore will
>> be mapped read-only executable. This means that we need to temporarily
>> remap init_ttbr in order to update it.
>>
>> Introduce a new function set_init_ttbr() for this purpose so the code
>> is not duplicated between arm64 and arm32.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> with ...
> 
>> ---
>>   xen/arch/arm/mmu/smpboot.c | 34 +++++++++++++++++++++++++++++-----
>>   xen/arch/arm/xen.lds.S     |  1 +
>>   2 files changed, 30 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
>> index b6fc0aae07f1..f1cf9252710c 100644
>> --- a/xen/arch/arm/mmu/smpboot.c
>> +++ b/xen/arch/arm/mmu/smpboot.c
>> @@ -9,6 +9,10 @@
>>
>>   #include <asm/setup.h>
>>
>> +/* Override macros from asm/page.h to make them work with mfn_t */
>> +#undef virt_to_mfn
>> +#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
>> +
>>   /*
>>    * Static start-of-day pagetables that we use before the allocators
>>    * are up. These are used by all CPUs during bringup before switching
>> @@ -44,7 +48,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_second);
>>   DEFINE_BOOT_PAGE_TABLES(boot_third, XEN_NR_ENTRIES(2));
>>
>>   /* Non-boot CPUs use this to find the correct pagetables. */
>> -uint64_t init_ttbr;
>> +uint64_t __section(".data.idmap") init_ttbr;
> Do we need to keep the declaration in mmu/mm.h? This variable is only used in this file
> and in assembly, so maybe better to drop declaration and use asmlinkage instead?

I don't see the problem of keeping the declaration in mmu/mm.h. In any 
case, this seems to be unrelated to this patch.

> 
>>
>>   /* Clear a translation table and clean & invalidate the cache */
>>   static void clear_table(void *table)
>> @@ -68,6 +72,27 @@ static void clear_boot_pagetables(void)
>>       clear_table(boot_third);
>>   }
>>
>> +static void set_init_ttbr(lpae_t *root)
>> +{
>> +    /*
>> +     * init_ttbr is part of the identity mapping which is read-only. So
>> +     * We need to re-map the region so it can be updated
> Would you mind fixing s/So We/So we/ and add a full stop after last sentence?

I can do that.

Cheers,

-- 
Julien Grall

