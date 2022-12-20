Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DFE651E5D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 11:05:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466910.725881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZV2-0003nk-K5; Tue, 20 Dec 2022 10:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466910.725881; Tue, 20 Dec 2022 10:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZV2-0003lh-Gj; Tue, 20 Dec 2022 10:05:28 +0000
Received: by outflank-mailman (input) for mailman id 466910;
 Tue, 20 Dec 2022 10:05:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7ZV1-0003lZ-Ad
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 10:05:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7ZV1-0004fA-09; Tue, 20 Dec 2022 10:05:27 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7ZV0-0001I0-PT; Tue, 20 Dec 2022 10:05:26 +0000
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
	bh=t5aJ5ovChQp67a30Kr5T1C7MD4uACIuY2fcj1B+WoYQ=; b=wZvyYGKVOLavWtoFnS7JU46KP1
	+onzbIXF6lvCT3QZXgGjqusRqZbZ2QV/EJuJqiSJBylGhuGLyQcN9SEqoZeRwhoh8jhg2xGxpyKWP
	1Xc4vmivGrCic1/Y5S0owWrC773m+FjNW6LIlAjUaoWkOA3vY1p7sTNEQCz1zKw562YA=;
Message-ID: <6e2b1f97-3e72-34b9-8faa-f00e79587b39@xen.org>
Date: Tue, 20 Dec 2022 10:05:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v3] xen/arm: Probe the entry point address of an uImage
 correctly
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221217193801.19485-1-ayan.kumar.halder@amd.com>
 <75635251-5f51-fbe0-28be-a99480541116@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <75635251-5f51-fbe0-28be-a99480541116@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/2022 09:44, Michal Orzel wrote:
> Hi Ayan,
> 
> On 17/12/2022 20:38, Ayan Kumar Halder wrote:
>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>> result, it contains the default value (ie 0). This causes,
>> kernel_zimage_place() to treat the binary (contained within uImage) as
>> position independent executable. Thus, it loads it at an incorrect address.
>>
>> The correct approach would be to read "uimage.ep" and set
>> info->zimage.start. This will ensure that the binary is loaded at the
>> correct address. Also, it checks that the load address and entry address
>> are the same. The reason being we currently support non compressed images
>> for uImage header. And as seen in uboot sources(image_decomp(), case
>> IH_COMP_NONE), load address and entry address can be the same.
>>
>> This behavior is applicable for both arm and arm64 platforms.
>>
>> Earlier for arm32 and arm64 platforms, Xen was ignoring the entry point
>> address set in the uImage header. With this commit, Xen will use the
>> kernel entry point address as specified in the header. This makes the
>> behavior of Xen consistent with uboot for uimage headers.
>>
>> Users who want to use Xen with statically partitioned domains, can
>> provide the fixed non zero load address for the dom0/domU kernel.
>>
>> A deviation from uboot behaviour is that we consider load address == 0x0,
>> to denote that the image supports position independent execution. This
>> is to make the behavior consistent across uImage and zImage.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from v1 :-
>> 1. Added a check to ensure load address and entry address are the same.
>> 2. Considered load address == 0x0 as position independent execution.
>> 3. Ensured that the uImage header interpretation is consistent across
>> arm32 and arm64.
>>
>> v2 :-
>> 1. Mentioned the change in existing behavior in booting.txt.
>> 2. Updated booting.txt with a new section to document "Booting Guests".
>>
>>   docs/misc/arm/booting.txt         | 21 +++++++++++++++++++++
>>   xen/arch/arm/include/asm/kernel.h |  2 +-
>>   xen/arch/arm/kernel.c             | 27 ++++++++++++++++++++++++++-
>>   3 files changed, 48 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>> index 3e0c03e065..01b12b49a5 100644
>> --- a/docs/misc/arm/booting.txt
>> +++ b/docs/misc/arm/booting.txt
>> @@ -23,6 +23,24 @@ The exceptions to this on 32-bit ARM are as follows:
>>   
>>   There are no exception on 64-bit ARM.
>>   
>> +Booting Guests
>> +--------------
>> +
>> +Xen supports the legacy image protocol[3], zImage protocol for 32-bit ARM
> uImage is not a protocol. It is just a header with no other information \wrt
> boot requirements.
> 
>> +Linux[1] and Image protocol defined for ARM64[2].
>> +
>> +Earlier for legacy image protocol, Xen ignored the load address and entry
>> +point specified in the header. This has now changed.
>> +
>> +Now, it loads the image at the load address provided in the header.
>> +For now, it supports images where load address is same as entry point.
> Would be beneficial to add explanation why load address must be equal to start address.
> 
>> +
>> +A deviation from uboot is that, Xen treats "load address == 0x0" as
>> +position independent execution. Thus, Xen will load such an image at an
>> +address it considers appropriate.
>> +
>> +Users who want to use Xen with statically partitioned domains, can provide
>> +the fixed non zero load address for the dom0/domU kernel.
> 
> I think this section is missing a note that in case of not PIE, a load/start address
> specified by the user in a header must be within the memory region allocated by Xen.
> 
>>   
>>   Firmware/bootloader requirements
>>   --------------------------------
>> @@ -39,3 +57,6 @@ Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
>>   
>>   [2] linux/Documentation/arm64/booting.rst
>>   Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
>> +
>> +[3] legacy format header
>> +Latest version: https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
>> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
>> index 5bb30c3f2f..4617cdc83b 100644
>> --- a/xen/arch/arm/include/asm/kernel.h
>> +++ b/xen/arch/arm/include/asm/kernel.h
>> @@ -72,7 +72,7 @@ struct kernel_info {
>>   #ifdef CONFIG_ARM_64
>>               paddr_t text_offset; /* 64-bit Image only */
>>   #endif
>> -            paddr_t start; /* 32-bit zImage only */
>> +            paddr_t start; /* Must be 0 for 64-bit Image */
>>           } zimage;
>>       };
>>   };
>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>> index 23b840ea9e..e9c18993ef 100644
>> --- a/xen/arch/arm/kernel.c
>> +++ b/xen/arch/arm/kernel.c
>> @@ -127,7 +127,7 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>>       paddr_t load_addr;
>>   
>>   #ifdef CONFIG_ARM_64
>> -    if ( info->type == DOMAIN_64BIT )
>> +    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
>>           return info->mem.bank[0].start + info->zimage.text_offset;
>>   #endif
>>   
>> @@ -223,6 +223,31 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>       if ( len > size - sizeof(uimage) )
>>           return -EINVAL;
>>   
>> +    info->zimage.start = be32_to_cpu(uimage.ep);
>> +
>> +    /*
>> +     * Currently, we support uImage headers for uncompressed images only.
>> +     * Thus, it is valid for the load address and start address to be the
>> +     * same. This is consistent with the uboot behavior (Refer
>> +     * "case IH_COMP_NONE" in image_decomp().
> Please make it clear that you are referring to uboot function.

Could we avoid to mention the u-boot function? The reason I am asking is 
the code is in a different repo and the function name can easily change 
without us noticing (so the comment would rot).

Is the behavior documented somewhere in U-boot (or online)? If not, 
what's the guarantee that it will not change?

Cheers,

-- 
Julien Grall

