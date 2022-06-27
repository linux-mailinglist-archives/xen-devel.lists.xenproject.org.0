Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E1055B900
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 11:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356366.584544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lLk-0002Fd-Fw; Mon, 27 Jun 2022 09:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356366.584544; Mon, 27 Jun 2022 09:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lLk-0002D1-Bo; Mon, 27 Jun 2022 09:48:08 +0000
Received: by outflank-mailman (input) for mailman id 356366;
 Mon, 27 Jun 2022 09:48:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5lLi-0002Cv-U2
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 09:48:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5lLi-0007qB-FO; Mon, 27 Jun 2022 09:48:06 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.2.226]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5lLi-0007Nb-7w; Mon, 27 Jun 2022 09:48:06 +0000
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
	bh=mdFORTlteAlYWpbLJ5/GfHtZl7sNIWJXyCTMz9o9s/A=; b=RA1OeKol2JlMFFp8O6COmJ7Lo2
	PM+ADyQJjUiDIJ4r8u9GQ462Qjhv2numML6pI/IEgU1Ipx/2NWJGahvxbpXEc4P0+xfQRSHR/DbHZ
	Pv2fjJAB+41c3WRnmc0ZRMaCXqM/IsUp8S/AdL0rx2+P9Rx8LNyJqtoKDn9rICAdks0I=;
Message-ID: <1b580210-9aab-106b-c0a7-60fe8726786f@xen.org>
Date: Mon, 27 Jun 2022 10:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 1/7] xen/arm: Remove most of the *_VIRT_END defines
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-2-julien@xen.org>
 <f078812a-bdd0-d27b-28ce-62c0c131ecdb@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f078812a-bdd0-d27b-28ce-62c0c131ecdb@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2022 07:23, Michal Orzel wrote:
> Hi Julien,

Hi,

Thanks for the review.

> On 24.06.2022 11:11, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/include/asm/config.h | 18 ++++++++----------
>>   xen/arch/arm/livepatch.c          |  2 +-
>>   xen/arch/arm/mm.c                 | 13 ++++++++-----
>>   3 files changed, 17 insertions(+), 16 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
>> index 3e2a55a91058..66db618b34e7 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -111,12 +111,11 @@
>>   #define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
>>   
>>   #define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
>> -#define BOOT_FDT_SLOT_SIZE     MB(4)
>> -#define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE)
>> +#define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
>>   
>>   #ifdef CONFIG_LIVEPATCH
>>   #define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
>> -#define LIVEPATCH_VMAP_END     (LIVEPATCH_VMAP_START + MB(2))
>> +#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
>>   #endif
>>   
>>   #define HYPERVISOR_VIRT_START  XEN_VIRT_START
>> @@ -132,18 +131,18 @@
>>   #define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
>>   
>>   #define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
>> +#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
>>   
>>   #define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
>> -#define XENHEAP_VIRT_END       _AT(vaddr_t,0x7fffffff)
>> -#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
>> -#define DOMHEAP_VIRT_END       _AT(vaddr_t,0xffffffff)
>> +#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
>>   
>> -#define VMAP_VIRT_END    XENHEAP_VIRT_START
>> +#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
>> +#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
>>   
>>   #define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
>>   
>>   /* Number of domheap pagetable pages required at the second level (2MB mappings) */
>> -#define DOMHEAP_SECOND_PAGES ((DOMHEAP_VIRT_END - DOMHEAP_VIRT_START + 1) >> FIRST_SHIFT)
>> +#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
>>   
>>   #else /* ARM_64 */
>>   
>> @@ -152,12 +151,11 @@
>>   #define SLOT0_ENTRY_SIZE  SLOT0(1)
>>   
>>   #define VMAP_VIRT_START  GB(1)
>> -#define VMAP_VIRT_END    (VMAP_VIRT_START + GB(1))
>> +#define VMAP_VIRT_SIZE   GB(1)
>>   
>>   #define FRAMETABLE_VIRT_START  GB(32)
>>   #define FRAMETABLE_SIZE        GB(32)
>>   #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>> -#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
>>   
>>   #define DIRECTMAP_VIRT_START   SLOT0(256)
>>   #define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
>> diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
>> index 75e8adcfd6a1..57abc746e60b 100644
>> --- a/xen/arch/arm/livepatch.c
>> +++ b/xen/arch/arm/livepatch.c
>> @@ -175,7 +175,7 @@ void __init arch_livepatch_init(void)
>>       void *start, *end;
>>   
>>       start = (void *)LIVEPATCH_VMAP_START;
>> -    end = (void *)LIVEPATCH_VMAP_END;
>> +    end = start + LIVEPATCH_VMAP_SIZE;
>>   
>>       vm_init_type(VMAP_XEN, start, end);
>>   
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index be37176a4725..0607c65f95cd 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -128,9 +128,11 @@ static DEFINE_PAGE_TABLE(xen_first);
>>   /* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
>>   static DEFINE_PER_CPU(lpae_t *, xen_pgtable);
>>   #define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
>> -/* xen_dommap == pages used by map_domain_page, these pages contain
>> +/*
>> + * xen_dommap == pages used by map_domain_page, these pages contain
>>    * the second level pagetables which map the domheap region
>> - * DOMHEAP_VIRT_START...DOMHEAP_VIRT_END in 2MB chunks. */
>> + * starting at DOMHEAP_VIRT_START in 2MB chunks.
>> + */
>>   static DEFINE_PER_CPU(lpae_t *, xen_dommap);
>>   /* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
>>   static DEFINE_PAGE_TABLE(cpu0_pgtable);
>> @@ -476,7 +478,7 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
>>       int slot = (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
>>       unsigned long offset = (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
>>   
>> -    if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
>> +    if ( (va >= VMAP_VIRT_START) && ((VMAP_VIRT_START - va) < VMAP_VIRT_SIZE) )
> The second condition does not seem to be correct.

Hmm... You are right, it wants to be

((va - VMAP_VIRT_START) < VMAP_VIRT_SIZE)

> Instead, this check should like like following:
> if ( (va >= VMAP_VIRT_START) && (va < (VMAP_VIRT_START + VMAP_VIRT_SIZE)) )
This check would still be incorrect because if the VMAP is right at the 
edge of the address (e.g. 2^32 - 1 on arm32), then VMAP_VIRT_START + 
VMAP_VIRT_SIZE would be 0.

Cheers,

-- 
Julien Grall

