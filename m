Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458C568195F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 19:37:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487170.754699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMZ0u-0007Ue-7s; Mon, 30 Jan 2023 18:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487170.754699; Mon, 30 Jan 2023 18:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMZ0u-0007S4-4F; Mon, 30 Jan 2023 18:36:20 +0000
Received: by outflank-mailman (input) for mailman id 487170;
 Mon, 30 Jan 2023 18:36:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMZ0s-0007Ry-0I
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 18:36:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMZ0r-0000rZ-Kx; Mon, 30 Jan 2023 18:36:17 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMZ0r-0004jz-EU; Mon, 30 Jan 2023 18:36:17 +0000
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
	bh=a2kQJNrsHRx03dlxBg4S4RGE4AGxSGg4a/xMYq/lqP8=; b=2w3Fq/YXv3MsooNsbTyC3JtLYu
	IbrPjujvy3/ItQGWAhTlUrgoU8Pn61s6+Bh1j4hG0b4YlvGiX+GPaocHrZxtBp3oUQnC/jxA94qYd
	gbf4OvQW+CFID+5koYpm3eekD01/eK97I+DfZ5rs7uSkQCkymy9GAwJ1br4+Aw75n4j8=;
Message-ID: <044a4899-661b-8a84-d949-dd14d1d32383@xen.org>
Date: Mon, 30 Jan 2023 18:36:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 2/5] xen/arm64: Rework the memory layout
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-3-julien@xen.org>
 <af0bf576-373c-353e-b575-40f5bbde861f@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <af0bf576-373c-353e-b575-40f5bbde861f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/01/2023 09:08, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 27/01/2023 20:55, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Xen is currently not fully compliant with the Arm Arm because it will
>> switch the TTBR with the MMU on.
>>
>> In order to be compliant, we need to disable the MMU before
>> switching the TTBR. The implication is the page-tables should
>> contain an identity mapping of the code switching the TTBR.
>>
>> In most of the case we expect Xen to be loaded in low memory. I am aware
>> of one platform (i.e AMD Seattle) where the memory start above 512GB.
>> To give us some slack, consider that Xen may be loaded in the first 2TB
>> of the physical address space.
>>
>> The memory layout is reshuffled to keep the first four slots of the zeroeth
>> level free. Xen will now be loaded at (2TB + 2MB). This requires a slight
>> tweak of the boot code because XEN_VIRT_START cannot be used as an
>> immediate.
>>
>> This reshuffle will make trivial to create a 1:1 mapping when Xen is
>> loaded below 2TB.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> ---
>>      Changes in v5:
>>          - We are reserving 4 slots rather than 2.
>>          - Fix the addresses in the layout comment.
>>          - Fix the size of the region in the layout comment
>>          - Add Luca's tested-by (the reviewed-by was not added
>>            because of the changes requested by Michal
>>          - Add Michal's reviewed-by
>>
>>      Changes in v4:
>>          - Correct the documentation
>>          - The start address is 2TB, so slot0 is 4 not 2.
>>
>>      Changes in v2:
>>          - Reword the commit message
>>          - Load Xen at 2TB + 2MB
>>          - Update the documentation to reflect the new layout
>> ---
>>   xen/arch/arm/arm64/head.S         |  3 ++-
>>   xen/arch/arm/include/asm/config.h | 34 +++++++++++++++++++++----------
>>   xen/arch/arm/mm.c                 | 11 +++++-----
>>   3 files changed, 31 insertions(+), 17 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 4a3f87117c83..663f5813b12e 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -607,7 +607,8 @@ create_page_tables:
>>            * need an additional 1:1 mapping, the virtual mapping will
>>            * suffice.
>>            */
>> -        cmp   x19, #XEN_VIRT_START
>> +        ldr   x0, =XEN_VIRT_START
>> +        cmp   x19, x0
>>           bne   1f
>>           ret
>>   1:
>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
>> index 5df0e4c4959b..e388462c23d1 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -72,16 +72,13 @@
>>   #include <xen/page-size.h>
>>
>>   /*
>> - * Common ARM32 and ARM64 layout:
>> + * ARM32 layout:
>>    *   0  -   2M   Unmapped
>>    *   2M -   4M   Xen text, data, bss
>>    *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>>    *   6M -  10M   Early boot mapping of FDT
>>    *   10M - 12M   Livepatch vmap (if compiled in)
>>    *
>> - * ARM32 layout:
>> - *   0  -  12M   <COMMON>
>> - *
>>    *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
>>    * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
>>    *                    space
>> @@ -90,14 +87,23 @@
>>    *   2G -   4G   Domheap: on-demand-mapped
>>    *
>>    * ARM64 layout:
>> - * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
>> - *   0  -  12M   <COMMON>
>> + * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
>> + *
>> + *  Reserved to identity map Xen
>> + *
>> + * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4]
>> + *  (Relative offsets)
>> + *   0  -   2M   Unmapped
>> + *   2M -   4M   Xen text, data, bss
>> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>> + *   6M -  10M   Early boot mapping of FDT
>> + *  10M -  12M   Livepatch vmap (if compiled in)
>>    *
>>    *   1G -   2G   VMAP: ioremap and early_ioremap
>>    *
>>    *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>>    *
>> - * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
>> + * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
>>    *  Unused
>>    *
>>    * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
>> @@ -107,7 +113,17 @@
>>    *  Unused
>>    */
>>
>> +#ifdef CONFIG_ARM_32
>>   #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
>> +#else
>> +
>> +#define SLOT0_ENTRY_BITS  39
>> +#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
>> +#define SLOT0_ENTRY_SIZE  SLOT0(1)
>> +
>> +#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
>> +#endif
>> +
>>   #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
>>
>>   #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
>> @@ -163,10 +179,6 @@
>>
>>   #else /* ARM_64 */
>>
>> -#define SLOT0_ENTRY_BITS  39
>> -#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
>> -#define SLOT0_ENTRY_SIZE  SLOT0(1)
>> -
>>   #define VMAP_VIRT_START  GB(1)
>>   #define VMAP_VIRT_SIZE   GB(1)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index f758cad545fa..0b0edf28d57a 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -153,7 +153,7 @@ static void __init __maybe_unused build_assertions(void)
>>   #endif
>>       /* Page table structure constraints */
>>   #ifdef CONFIG_ARM_64
>> -    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
>> +    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START) < 2);
> I haven't spotted this before but this should be < 4.

Good catch! I am planning to handle it on commit unless there is more to 
fix in this patch.

Cheers,

-- 
Julien Grall

