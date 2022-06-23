Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F13558AEA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 23:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355201.582734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4UeI-0005Yq-Ru; Thu, 23 Jun 2022 21:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355201.582734; Thu, 23 Jun 2022 21:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4UeI-0005VZ-Ok; Thu, 23 Jun 2022 21:46:02 +0000
Received: by outflank-mailman (input) for mailman id 355201;
 Thu, 23 Jun 2022 21:46:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4UeH-0005VT-Mw
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 21:46:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4UeF-0006e0-J7; Thu, 23 Jun 2022 21:45:59 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4UeF-0003If-Cx; Thu, 23 Jun 2022 21:45:59 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=AacVPjNeEi7EN173UT+U8R06OOBWooAOgGR2mpo/RO8=; b=OCVhhaRKjjNFHZbFpmuVLEM7rj
	fVYS5GyllYXXtq57MYJJr94b5gmUs7/G6IED4fafN9NP7TZxK4lkWVJBmCUsFIstPyX5cXIsoRIBb
	oJNr71q72AKSNxvQ32Hi7ke/sCvGMwz6qBbLjuyydFjJmCb9+4c2VNQJ6uC3T2u7lC7Q=;
Message-ID: <b8f364cc-ef22-75bb-8362-c44698d318ff@xen.org>
Date: Thu, 23 Jun 2022 22:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20220523194953.70636-1-julien@xen.org>
 <F2040FC0-C040-46F5-8DD0-79EE0E1B3A1E@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
In-Reply-To: <F2040FC0-C040-46F5-8DD0-79EE0E1B3A1E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 24/05/2022 09:05, Bertrand Marquis wrote:
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ----
>>
>> I noticed that a few functions in Xen expect [start, end[. This is risky
>> as we may end up with end < start if the region is defined right at the
>> top of the address space.
>>
>> I haven't yet tackle this issue. But I would at least like to get rid
>> of *_VIRT_END.
>> ---
>> xen/arch/arm/include/asm/config.h | 18 ++++++++----------
>> xen/arch/arm/livepatch.c          |  2 +-
>> xen/arch/arm/mm.c                 | 13 ++++++++-----
>> 3 files changed, 17 insertions(+), 16 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
>> index 3e2a55a91058..66db618b34e7 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -111,12 +111,11 @@
>> #define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
>>
>> #define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
>> -#define BOOT_FDT_SLOT_SIZE     MB(4)
>> -#define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE)
>> +#define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
>>
>> #ifdef CONFIG_LIVEPATCH
>> #define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
>> -#define LIVEPATCH_VMAP_END     (LIVEPATCH_VMAP_START + MB(2))
>> +#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
>> #endif
>>
>> #define HYPERVISOR_VIRT_START  XEN_VIRT_START
>> @@ -132,18 +131,18 @@
>> #define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
>>
>> #define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
>> +#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
> 
> This looks a bit odd, any reason not to use MB(768) ?

This is to match how we define FRAMETABLE_SIZE. It is a lot easier to 
figure out how the size was found and match the comment:

  256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
                      space

> If not then there might be something worse explaining with a comment here.

This is really a matter of taste here. I don't think it has to be 
explained in the commit message.

[...]

>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index be37176a4725..0607c65f95cd 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -128,9 +128,11 @@ static DEFINE_PAGE_TABLE(xen_first);
>> /* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
>> static DEFINE_PER_CPU(lpae_t *, xen_pgtable);
>> #define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
>> -/* xen_dommap == pages used by map_domain_page, these pages contain
>> +/*
>> + * xen_dommap == pages used by map_domain_page, these pages contain
>>   * the second level pagetables which map the domheap region
>> - * DOMHEAP_VIRT_START...DOMHEAP_VIRT_END in 2MB chunks. */
>> + * starting at DOMHEAP_VIRT_START in 2MB chunks.
>> + */
> 
> Please just mention that you also fixed a comment coding style in the commit message.

Sure.

> 
>> static DEFINE_PER_CPU(lpae_t *, xen_dommap);
>> /* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
>> static DEFINE_PAGE_TABLE(cpu0_pgtable);
>> @@ -476,7 +478,7 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
>>      int slot = (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
>>      unsigned long offset = (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
>>
>> -    if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
>> +    if ( (va >= VMAP_VIRT_START) && ((VMAP_VIRT_START - va) < VMAP_VIRT_SIZE) )
>>          return virt_to_mfn(va);
>>
>>      ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
>> @@ -570,7 +572,8 @@ void __init remove_early_mappings(void)
>>      int rc;
>>
>>      /* destroy the _PAGE_BLOCK mapping */
>> -    rc = modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
>> +    rc = modify_xen_mappings(BOOT_FDT_VIRT_START,
>> +                             BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE,
>>                               _PAGE_BLOCK);
>>      BUG_ON(rc);
>> }
>> @@ -850,7 +853,7 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>
>> void *__init arch_vmap_virt_end(void)
>> {
>> -    return (void *)VMAP_VIRT_END;
>> +    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
>> }
>>
>> /*

Cheers,

-- 
Julien Grall

