Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF616752CD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 11:53:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481666.746719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIp1B-0007tE-QI; Fri, 20 Jan 2023 10:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481666.746719; Fri, 20 Jan 2023 10:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIp1B-0007rW-Nc; Fri, 20 Jan 2023 10:53:09 +0000
Received: by outflank-mailman (input) for mailman id 481666;
 Fri, 20 Jan 2023 10:53:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIp1A-0007rQ-JS
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 10:53:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIp1A-0002U6-A2; Fri, 20 Jan 2023 10:53:08 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.149.154]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIp1A-00084N-2c; Fri, 20 Jan 2023 10:53:08 +0000
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
	bh=GjpCtkR4EtAzb4QaHhXZTlW4qQXPZlyrGG0V6/kVMXQ=; b=aavb6nUgMH+J4SBmneY8U0cTOP
	/OO5XKQ07pzUJLP14+kQeTz65v6kIW13LzkzssWsCPWx+cO89W659n5R8RXlq+s2qlN2C+luqW65L
	6rVp7dBigPg3oRyCXz35sPiWwng71EqduKM4nv8Nh7fcSiM2VajsUGsn6PQSxE5BwlQo=;
Message-ID: <6743ca84-e54e-23be-575f-899a8770d523@xen.org>
Date: Fri, 20 Jan 2023 10:53:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 10/11] xen/arm: Restrict zeroeth_table_offset for ARM_64
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-11-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191553570.731018@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301191553570.731018@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Title: For me "restrict" means that the code macro cannot be used if 
!ARM_64. But this is not the case here.

On 20/01/2023 00:19, Stefano Stabellini wrote:
> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>> zeroeth_table_offset is not accessed by ARM_32.

I don't quite understand this sentence. The helper is used by 32-bit 
arm. The output may not be used thought.

I would suggest to say that there no zeroeth level on Arm 32-bit. But...

>> Also, when 32 bit physical addresses are used (ie ARM_PA_32=y), this
>> causes an overflow.

... this is the most important part.

>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v1 - Removed the duplicate declaration for DECLARE_OFFSETS.
>>
>>   xen/arch/arm/include/asm/lpae.h | 4 ++++
>>   xen/arch/arm/mm.c               | 7 +------
>>   2 files changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
>> index 3fdd5d0de2..2744e0eebf 100644
>> --- a/xen/arch/arm/include/asm/lpae.h
>> +++ b/xen/arch/arm/include/asm/lpae.h
>> @@ -259,7 +259,11 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
>>   #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
>>   #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
>>   #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
>> +#ifdef CONFIG_ARM_64
> 
> Julien was asking for a selectable Kconfig option that would allow us to
> have 32-bit paddr_t even on ARM_64. If we do that, assuming we are on
> aarch64, and we set VTCR_T0SZ to 0x20, hence we get 32-bit IPA, are we
> going to have a 3-level or a 4-level p2m pagetable?

It will start at level 1. So 3-level page-table.

> 
> In any case I think this should be:
> #ifndef CONFIG_PADDR_32

+1

> 
> And if it doesn't work today on aarch64 due to pagetable levels or other
> reasons, than I would make CONFIG_PADDR_32 not (yet) selectable on
> ARM_64 (until it is fixed).

+1

>>   #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
>> +#else
>> +#define zeroeth_table_offset(va)  0
> 
> Rather than 0 it might be better to have 32, hence zeroing the input
> address
I don't understand why you suggest 32. The macro is meant to return the 
index in the 0th table. So return 0 is correct here.

> 
> 
>> +#endif
>>   
>>   /*
>>    * Macros to define page-tables:
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index fab54618ab..95784e0c59 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -207,12 +207,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>>   {
>>       static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
>>       const mfn_t root_mfn = maddr_to_mfn(ttbr);
>> -    const unsigned int offsets[4] = {
>> -        zeroeth_table_offset(addr),
>> -        first_table_offset(addr),
>> -        second_table_offset(addr),
>> -        third_table_offset(addr)
>> -    };
>> +    DECLARE_OFFSETS(offsets, addr);

This wants to be explained in the commit message.

>>       lpae_t pte, *mapping;
>>       unsigned int level, root_table;
>>   
>> -- 
>> 2.17.1
>>

Cheers,

-- 
Julien Grall

