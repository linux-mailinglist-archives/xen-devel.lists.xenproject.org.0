Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B890A4E744A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 14:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294712.501252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXk6V-0006bQ-5c; Fri, 25 Mar 2022 13:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294712.501252; Fri, 25 Mar 2022 13:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXk6V-0006Y9-2K; Fri, 25 Mar 2022 13:35:47 +0000
Received: by outflank-mailman (input) for mailman id 294712;
 Fri, 25 Mar 2022 13:35:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXk6T-0006Xz-Bh
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 13:35:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXk6S-00034h-Ts; Fri, 25 Mar 2022 13:35:44 +0000
Received: from [54.239.6.185] (helo=[192.168.14.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXk6S-0003gs-NV; Fri, 25 Mar 2022 13:35:44 +0000
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
	bh=VuxNunzVcXuJ5LxCcdLWAckLk1N2dOsEWwlIsizybEs=; b=P7Ig11veZxVq+BD05MarN64BoJ
	sCoafa0urcKt7vtHiWCvCx7msvzMpIJDjvM85RpoMtOVi1EAHKti4Z4hqR2JczTx3D9JVDCFtlXbS
	IZhF2+9rdluSEiGtiGrHtvfCpUFTEPvivPgBQ+UORUhMEIRB4XOE72JiiZTYpNl1rNE0=;
Message-ID: <cf150c85-34cb-73fb-9808-0338de546271@xen.org>
Date: Fri, 25 Mar 2022 13:35:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH early-RFC 2/5] xen/arm64: Rework the memory layout
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
 "lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-3-julien@xen.org>
 <DE3C6104-82AD-41AE-BDAA-0074A08DDECF@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DE3C6104-82AD-41AE-BDAA-0074A08DDECF@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25/03/2022 13:17, Bertrand Marquis wrote:
> Hi Julien,

Hi,

>> On 9 Mar 2022, at 12:20, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Xen is currently not fully compliant with the Arm because it will
> I think you wanted to say “arm arm” her.

Yes. I will update it.

> 
>> switch the TTBR with the MMU on.
>>
>> In order to be compliant, we need to disable the MMU before
>> switching the TTBR. The implication is the page-tables should
>> contain an identity mapping of the code switching the TTBR.
>>
>> If we don't rework the memory layout, we would need to find a
>> virtual address that matches a physical address and doesn't clash
>> with the static virtual regions. This can be a bit tricky.
> 
> This sentence is a bit misleading. Even with the rework you need
> to do that just by moving the Xen virtual address upper you make
> sure that anything physical memory under 512GB can be mapped
> 1:1 without clashing with other Xen mappings (unless Xen is loaded
> in memory at physical address 512GB which would end in the same issue).

So the key difference is with the rework, it is trivial to create the 
1:1 mapping as we know it doesn't clash. This is not the case without 
the rework.

> 
> I think should be rephrased.

I am not entirely sure how to rephrase it. Do you have a proposal?

> 
>>
>> On arm64, the memory layout  has plenty of unused space. In most of
>> the case we expect Xen to be loaded in low memory.
>>
>> The memory layout is reshuffled to keep the 0th slot free. Xen will now
> 
> 0th slot of first level of page table.

We want to keep the first 512GB free. So did you intend to write "zero 
level"?

> 
>> be loaded at (512GB + 2MB). This requires a slight tweak of the boot
>> code as XEN_VIRT_START cannot be used as an immediate.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>>     TODO:
>>         - I vaguely recall that one of the early platform we supported add
>>           the memory starting in high memory (> 1TB). I need to check
>>           whether the new layout will be fine.
> 
> I think we have some Juno with some memory like that, tell me if you need help here.

Would you be able to check the memory layout and confirm?

> 
>>         - Update the documentation to reflect the new layout
>> ---
>> xen/arch/arm/arm64/head.S         |  3 ++-
>> xen/arch/arm/include/asm/config.h | 20 ++++++++++++++------
>> xen/arch/arm/mm.c                 | 14 +++++++-------
>> 3 files changed, 23 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 66d862fc8137..878649280d73 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -594,7 +594,8 @@ create_page_tables:
>>           * need an additional 1:1 mapping, the virtual mapping will
>>           * suffice.
>>           */
>> -        cmp   x19, #XEN_VIRT_START
>> +        ldr   x0, =XEN_VIRT_START
>> +        cmp   x19, x0
> A comment in the code would be good here to prevent someone reverting this.

Anyone trying to revert the change will face a compilation error:

   CC      arch/arm/arm64/head.o
arch/arm/arm64/head.S: Assembler messages:
arch/arm/arm64/head.S:597: Error: immediate out of range

So I don't think a comment is necessary because this is not specific to 
a compiler/assembler.
>> -#define SLOT0_ENTRY_BITS  39
>> -#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
>> -#define SLOT0_ENTRY_SIZE  SLOT0(1)
>> -
>> -#define VMAP_VIRT_START  GB(1)
>> +#define VMAP_VIRT_START  (SLOT0(1) + GB(1))
>> #define VMAP_VIRT_END    (VMAP_VIRT_START + GB(1))
>>
>> -#define FRAMETABLE_VIRT_START  GB(32)
>> +#define FRAMETABLE_VIRT_START  (SLOT0(1) + GB(32))
>> #define FRAMETABLE_SIZE        GB(32)
>> #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>> #define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 6b7c41d827ca..75ed9a3ce249 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -187,11 +187,10 @@ static void __init __maybe_unused build_assertions(void)
>>      BUILD_BUG_ON(DIRECTMAP_VIRT_START & ~FIRST_MASK);
>> #endif
>>      /* Page table structure constraints */
>> -#ifdef CONFIG_ARM_64
>> -    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
>> -#endif
> Don’t you want to enforce the opposite now ? Check that it is not on slot 0 ?

I can. But this is not going to guarantee us the first 512GB is going to 
be free.

Cheers,

-- 
Julien Grall

