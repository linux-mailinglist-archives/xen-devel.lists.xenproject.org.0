Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11FE64F0B0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 18:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464866.723395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Ewi-0002jk-AU; Fri, 16 Dec 2022 17:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464866.723395; Fri, 16 Dec 2022 17:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Ewi-0002h1-7d; Fri, 16 Dec 2022 17:56:32 +0000
Received: by outflank-mailman (input) for mailman id 464866;
 Fri, 16 Dec 2022 17:56:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p6Ewh-0002gv-3r
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 17:56:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p6Ewg-0003NT-PA; Fri, 16 Dec 2022 17:56:30 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p6Ewg-0008Rm-IU; Fri, 16 Dec 2022 17:56:30 +0000
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
	bh=qtjQl/ZmimpDqsExk1IsEk/Ek05wzYHfuBJNNpaMk6w=; b=dgjQVYUmqm3iCUKRqvqvGHhgHt
	7R7603QbnRSZQSMwWTXo7suJK4WHsoiPEuuwrQT8jiT4CJEa4RS613w3PaHPuybcjRdbaTOAerxOo
	gTcNE6e0MzS+n7tLKIYrjTb/QO6vabHFrUircyjlpwRy+qLX35a5XDOjNcXu2wxWeiVg=;
Message-ID: <0e10dd87-8622-c47e-d925-734ae4b357e5@xen.org>
Date: Fri, 16 Dec 2022 17:56:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v2] xen/arm: Probe the entry point address of an uImage
 correctly
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20221215123826.24145-1-ayan.kumar.halder@amd.com>
 <8d02db8a-e4db-2e0d-b014-b88714b30b09@xen.org>
 <8d20ba6a-463a-1301-1531-795d1a7f0b2d@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8d20ba6a-463a-1301-1531-795d1a7f0b2d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/12/2022 17:50, Ayan Kumar Halder wrote:
> 
> On 16/12/2022 09:34, Julien Grall wrote:
>> Hi,
> Hi Julien,
>>
>> On 15/12/2022 12:38, Ayan Kumar Halder wrote:
>>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>>> result, it contains the default value (ie 0). This causes,
>>> kernel_zimage_place() to treat the binary (contained within uImage) as
>>> position independent executable. Thus, it loads it at an incorrect 
>>> address.
>>>
>>> The correct approach would be to read "uimage.ep" and set
>>> info->zimage.start. This will ensure that the binary is loaded at the
>>> correct address. Also, it checks that the load address and entry address
>>> are the same. The reason being we currently support non compressed 
>>> images
>>> for uImage header. And as seen in uboot sources(image_decomp(), case
>>> IH_COMP_NONE), load address and entry address can be the same.
>>>
>>> This behavior is applicable for both arm and arm64 platforms.
>>>
>>> Earlier for arm32 and arm64 platforms, Xen was ignoring the entry point
>>> address set in the uImage header. With this commit, Xen will use the
>>> kernel entry point address as specified in the header. This makes the
>>> behavior of Xen consistent with uboot for uimage headers.
>>
>> At the cost of breaking existing users. I think this want to be spelt 
>> out clearly.
> Do you mean I should document this in "docs/misc/arm/booting.txt" ?

Both the commit message and document.

>>
>>>
>>> A deviation from uboot behaviour is that we consider load address == 
>>> 0x0,
>>> to denote that the image supports position independent execution. This
>>> is to make the behavior consistent across uImage and zImage.
>>
>> You want to explain why users want to use "0x0". Or maybe the other 
>> way around, that only a very limited set of user (e.g. in static 
>> environment) should provide a fixed address.
> 
> Does the following explaination sound fine ?
> 
> "Users who want to use Xen with statically partitioned domains, should 
> provide the fixed non zero load address for the dom0/domU kernel."

I would replace "should" with "can" because there is no requirement to 
specify an address.

> 
>>
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>
>>> Changes from v1:-
>>> 1. Added a check to ensure load address and entry address are the same.
>>> 2. Considered load address == 0x0 as position independent execution.
>>> 3. Ensured that the uImage header interpretation is consistent across
>>> arm32 and arm64.
>>>
>>> Some unanswered queries from v1 :-
>>>
>>> Q1. "In non-statically allocated setup, a user doesn't know where the 
>>> memory
>>> for dom0/domU will be allocated.So I think this was correct to ignore 
>>> the
>>> address."
>>> A. I am not sure the best way to handle this. Can we make the uImage 
>>> probe
>>> dependent on STATIC_MEMORY ? Currently, I have mentioned that user 
>>> should
>>> use load address = 0x0 if they want Xen to ignore it.
>> See above.
>>
>>>
>>> Q2. Zephyr or any other RTOS have different requirements, then we may 
>>> need
>>> to modify Xen and document it.
>>> A. I will take it in a separate email/patch where we can list the
>>> requirements for booting Zephyr.
>>>
>>>   docs/misc/arm/booting.txt         | 11 ++++++++++-
>>>   xen/arch/arm/include/asm/kernel.h |  2 +-
>>>   xen/arch/arm/kernel.c             | 26 +++++++++++++++++++++++++-
>>>   3 files changed, 36 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>>> index 3e0c03e065..872262686a 100644
>>> --- a/docs/misc/arm/booting.txt
>>> +++ b/docs/misc/arm/booting.txt
>>> @@ -4,7 +4,13 @@ Booting Xen
>>>   Xen follows the zImage protocol defined for 32-bit ARM Linux[1] and 
>>> the
>>>   Image protocol defined for ARM64 Linux[2].
>>>   -In both cases the recommendation to boot in HYP/EL2 mode is a strict
>>> +Xen also supports the legacy image protocol[3] for 32-bit ARM and 
>>> ARM64.
>>> +For now, it supports images where load address is same as entry 
>>> address.
>>> +A deviation from uboot is that, Xen treats "load address == 0x0" as
>>> +position independent execution. Thus, Xen will load such an image at an
>>> +address it considers appropriate.
>>
>> Hmmmm... The section above is related to Xen itself and not the guest 
>> Image. So I think this is misplaced.
> I don't see a booting section for the guest. Should I create one in this 
> file ?

I would create a new section.

>>
>>> +
>>> +In all cases the recommendation to boot in HYP/EL2 mode is a strict
>>>   requirement for Xen.
>>>     The exceptions to this on 32-bit ARM are as follows:
>>> @@ -39,3 +45,6 @@ Latest version: 
>>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
>>>     [2] linux/Documentation/arm64/booting.rst
>>>   Latest version: 
>>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
>>> +
>>> +[3] legacy format header
>>> +Latest version: 
>>> https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
>>> diff --git a/xen/arch/arm/include/asm/kernel.h 
>>> b/xen/arch/arm/include/asm/kernel.h
>>> index 5bb30c3f2f..ee69a47052 100644
>>> --- a/xen/arch/arm/include/asm/kernel.h
>>> +++ b/xen/arch/arm/include/asm/kernel.h
>>> @@ -72,7 +72,7 @@ struct kernel_info {
>>>   #ifdef CONFIG_ARM_64
>>>               paddr_t text_offset; /* 64-bit Image only */
>>>   #endif
>>> -            paddr_t start; /* 32-bit zImage only */
>>> +            paddr_t start;
>>
>> I think the comment should be replaced by "Must be 0 for 64-bit Image".
> 
> But, 64 bit image can also have a fixed load address.

Note the uppercase 'I' which refers to the Linux kernel Image protocol.

> 
> For zImage(64), start is always 0.
The official name is Image not zImage. We could call it "linux Image" if 
you prefer.

> 
> For uImage(64), start can be a fixed load address (if it is not 0). >
>>
>>>           } zimage;
>>>       };
>>>   };
>>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>>> index 23b840ea9e..81ac945f5b 100644
>>> --- a/xen/arch/arm/kernel.c
>>> +++ b/xen/arch/arm/kernel.c
>>> @@ -127,7 +127,7 @@ static paddr_t __init kernel_zimage_place(struct 
>>> kernel_info *info)
>>>       paddr_t load_addr;
>>>     #ifdef CONFIG_ARM_64
>>> -    if ( info->type == DOMAIN_64BIT )
>>> +    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
>>>           return info->mem.bank[0].start + info->zimage.text_offset;
>>>   #endif
>>>   @@ -223,6 +223,30 @@ static int __init kernel_uimage_probe(struct 
>>> kernel_info *info,
>>>       if ( len > size - sizeof(uimage) )
>>>           return -EINVAL;
>>>   +    info->zimage.start = be32_to_cpu(uimage.ep);
>>> +
>>> +    /*
>>> +     * Currently, we support uImage headers for uncompressed images 
>>> only.
>>> +     * Thus, it is valid for the load address and start address to 
>>> be the
>>> +     * same. This is consistent with the uboot behavior (Refer
>>> +     * "case IH_COMP_NONE" in image_decomp()).
>>> +     */
>>> +    if ( info->zimage.start != be32_to_cpu(uimage.load) )
>>> +    {
>>> +        panic("Unable to support mismatching load address and entry 
>>> address\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /*
>>> +     * While uboot considers 0x0 to be a valid load/start address, 
>>> for Xen
>>> +     * to mantain parity with zimage, we consider 0x0 to denote 
>>> position
>>> +     * independent image. That means Xen is free to load such an 
>>> image at
>>> +     * any valid address.
>>> +     * Thus, we will print an appropriate warning.
>>> +     */
>>> +    if ( info->zimage.start == 0 )
>>> +        printk(XENLOG_WARNING "No valid load address provided\n");
>>
>> This is likely the way user will want to use it in a non-static 
>> environment. So why is this a warning?
> 
> Sorry, it should be.
> 
> printk(XENLOG_INFO, "No load address provided. Assuming domain is 
> dynamically allocated\n");
> 
> I just wanted to give user a heads-up in case if they are using in a 
> static environment.

Again there is no problem to let Xen choosing the address in the static 
environment...

So if there is a message then it should simply be:

"No load address provided. Xen will decide where to load it".

Cheers,

-- 
Julien Grall

