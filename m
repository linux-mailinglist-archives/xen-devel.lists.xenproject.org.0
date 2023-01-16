Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376E666BA5A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 10:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478495.741727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLoJ-00035q-S4; Mon, 16 Jan 2023 09:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478495.741727; Mon, 16 Jan 2023 09:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLoJ-00033v-PL; Mon, 16 Jan 2023 09:29:47 +0000
Received: by outflank-mailman (input) for mailman id 478495;
 Mon, 16 Jan 2023 09:29:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHLoI-00033p-IS
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 09:29:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHLoI-0001OJ-6c; Mon, 16 Jan 2023 09:29:46 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.9.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHLoH-0004D6-Vb; Mon, 16 Jan 2023 09:29:46 +0000
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
	bh=c41tjpbnGSyx0wKc64pMWfHAkpC8dRrAAtw6XGn+YjY=; b=iU0YNo9pO7sxIXpym6dfeCvk6C
	OeHKIMQAhMye7AHCasvJ4Nt4LE2g80tOipi47LkiXAVOZnVHfVRQhTd7qwXoAt2/Sc5c53IZuvf8F
	W8nErHhi6JsBR2vtqo5vyKNp4E2Ph1DJna4bfRBquCt0QrvVyCou8RzHuaDaWK2jTCUk=;
Message-ID: <54fdf78a-bd46-eae3-f00f-a21738561874@xen.org>
Date: Mon, 16 Jan 2023 09:29:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 11/14] xen/arm64: Rework the memory layout
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-12-julien@xen.org>
 <72b2be45-d7bc-a94f-1d49-b9fc0b2fd081@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <72b2be45-d7bc-a94f-1d49-b9fc0b2fd081@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/01/2023 08:46, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 13/01/2023 11:11, Julien Grall wrote:
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
>> The memory layout is reshuffled to keep the first two slots of the zeroeth
> Should be "four slots" instead of "two".
> 
>> level free. Xen will now be loaded at (2TB + 2MB). This requires a slight
>> tweak of the boot code because XEN_VIRT_START cannot be used as an
>> immediate.
>>
>> This reshuffle will make trivial to create a 1:1 mapping when Xen is
>> loaded below 2TB.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ----
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
>>   xen/arch/arm/include/asm/config.h | 35 ++++++++++++++++++++-----------
>>   xen/arch/arm/mm.c                 | 11 +++++-----
>>   3 files changed, 31 insertions(+), 18 deletions(-)
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
>> index 6c1b762e976d..c5d407a7495f 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -72,15 +72,12 @@
>>   #include <xen/page-size.h>
>>
>>   /*
>> - * Common ARM32 and ARM64 layout:
>> + * ARM32 layout:
>>    *   0  -   2M   Unmapped
>>    *   2M -   4M   Xen text, data, bss
>>    *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>>    *   6M -  10M   Early boot mapping of FDT
>> - *   10M - 12M   Livepatch vmap (if compiled in)
>> - *
>> - * ARM32 layout:
>> - *   0  -  12M   <COMMON>
>> + *  10M -  12M   Livepatch vmap (if compiled in)
>>    *
>>    *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
>>    * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
>> @@ -90,14 +87,22 @@
>>    *   2G -   4G   Domheap: on-demand-mapped
>>    *
>>    * ARM64 layout:
>> - * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
>> - *   0  -  12M   <COMMON>
>> + * 0x0000000000000000 - 0x00001fffffffffff (2TB, L0 slots [0..3])
> End address should be 0x1FFFFFFFFFF (one less f).
> 
>> + *  Reserved to identity map Xen
>> + *
>> + * 0x0000020000000000 - 0x000028fffffffff (512GB, L0 slot [4]
> End address should be 0x27FFFFFFFFF.
> 
>> + *  (Relative offsets)
>> + *   0  -   2M   Unmapped
>> + *   2M -   4M   Xen text, data, bss
>> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>> + *   6M -  10M   Early boot mapping of FDT
>> + *  10M -  12M   Livepatch vmap (if compiled in)
>>    *
>>    *   1G -   2G   VMAP: ioremap and early_ioremap
>>    *
>>    *  32G -  64G   Frametable: 24 bytes per page for 5.3TB of RAM
>>    *
>> - * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
>> + * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [5..255])
> Start address should be 0x28000000000.

I have updated all the addresses.

> 
> Not related to this patch:
> I took a look at config.h and spotted two things:
> 1) DIRECTMAP_SIZE calculation is incorrect. It is defined as (SLOT0_ENTRY_SIZE * (265-256))
> but it actually should be (SLOT0_ENTRY_SIZE * (266-256)) i.e. 10 slots and not 9. Due to this
> bug we actually support 4.5TB of direct-map and not 5TB.


> 
> 2) frametable information
> struct page_info is no longer 24B but 56B for arm64 and 32B for arm32.

The values were always wrong. I have an action in my todo list to look 
at it, but never got the time.

There are two problems with the current values:
   1) The size of the frametable is not big enough as you pointed one below.
   2) The struct page_info could cross a cache line. We should decide 
whether we want to increase the size or attempt to reduce it.

  It looks like SUPPORT.md
> took this into account when stating that we support 12GB for arm32 and 2TB for arm64. However,
> this is also wrong as it does not take into account physical address compression. With PDX that
> is enabled by default we could fit tens of TB in 32GB frametable.
I don't understand your argument. Yes the PDX can compress, but it will 
compress non-RAM pages. So while I agree that this could cover tens of 
TB of physical address space, we will always be able to support a fixed 
amount of RAM.

> I think we want to get rid of
> comments like "Frametable: 24 bytes per page for 16GB of RAM" in favor of just "Frametable".

I would rather update the comments because we need a way to explain how 
we came up with the size.

> This is to because the struct page_info size may change again
We could have a BUILD_BUG_ON() confirming the size of the page_info.

> and it is rather difficult to
> calculate the max RAM size supported with PDX enabled.
See above about the max RAM size.

> 
> If you want, I can push the patches for these issues.

Happy to review them.

Cheers,

-- 
Julien Grall

