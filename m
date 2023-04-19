Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDDE6E8153
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 20:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523738.814082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCh2-00031b-Io; Wed, 19 Apr 2023 18:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523738.814082; Wed, 19 Apr 2023 18:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCh2-0002zt-Fi; Wed, 19 Apr 2023 18:38:12 +0000
Received: by outflank-mailman (input) for mailman id 523738;
 Wed, 19 Apr 2023 18:38:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ppCh0-0002zl-Sv
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 18:38:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppCh0-0005Kx-D8; Wed, 19 Apr 2023 18:38:10 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.29.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppCh0-0000IA-5l; Wed, 19 Apr 2023 18:38:10 +0000
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
	bh=1X/1FwzRbM6pd+AOIWz25wUqPjVNmZ+pmCYZ5OuuyRk=; b=zCEigFSQh9F2crMzCjTwrxc6uk
	s+mmgfuMuMb6INrTGV5u0In9p6gbgeyvuV2HoONtmfM5ic40R8VNWO2Qa4yJk0gDb4DMTAIpEYmDj
	AE/LKv9M84F4R0bMHoETC3poB370RLYQDnAJysFuu4mCNf4wwt/LXN2ABsUTiLL7YQSg=;
Message-ID: <d69d88f5-c388-e72a-343f-a96c0a3753c8@xen.org>
Date: Wed, 19 Apr 2023 19:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v7 2/5] xen/arm64: Rework the memory layout
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-3-julien@xen.org>
 <b088d287-3809-0a37-1a41-992d6ed9d631@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b088d287-3809-0a37-1a41-992d6ed9d631@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 17/04/2023 08:28, Michal Orzel wrote:
> On 16/04/2023 16:32, Julien Grall wrote:
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
>> level free. All the regions currently in L0 slot 0 will not be part of
>> slot 4 (2TB). This requires a slight tweak of the boot code because
>> XEN_VIRT_START (2TB + 2MB) cannot be used as an immediate.
>>
>> This reshuffle will make trivial to create a 1:1 mapping when Xen is
>> loaded below 2TB.
>>
>> Lastly, take the opportunity to check a compile time if any of the
> s/a/at/ compile time
> 
>> regions may overlap with the reserved area for identity mapping.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ----
>>      Changes in v7:
>>          - Remove all tags
>>          - Add BUILD_BUG_ON()s
>>          - Don't forget to update FRAMETABLE_VIRT_START and
>>            VMAP_VIRT_START
>>
>>      Changes in v6:
>>          - Correct the BUILD_BUG_ON(), Xen virtual address should be
>>            above 2TB (i.e. slot0 > 4).
>>          - Add Bertrand's reviewed-by
>>
>>      Changes in v5:
>>          - We are reserving 4 slots rather than 2.
>>          - Fix the addresses in the layout comment.
>>          - Fix the size of the region in the layout comment
>>          - Add Luca's tested-by (the reviewed-by was not added
>>            because of the changes requested by Michal)
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
>>   xen/arch/arm/include/asm/config.h | 38 +++++++++++++++++++++----------
>>   xen/arch/arm/mm.c                 | 23 +++++++++++++++----
>>   3 files changed, 46 insertions(+), 18 deletions(-)
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
>> index 5df0e4c4959b..2cfe5e480256 100644
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
> missing closing parenthesis at the end of line
> 
> This can be done on commit, so:

Thanks for spotting the typoes. I will update on commit.

> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Cheers,

-- 
Julien Grall

