Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C460381737
	for <lists+xen-devel@lfdr.de>; Sat, 15 May 2021 11:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127712.240042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhqYY-0005jB-Np; Sat, 15 May 2021 09:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127712.240042; Sat, 15 May 2021 09:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhqYY-0005hJ-KC; Sat, 15 May 2021 09:25:58 +0000
Received: by outflank-mailman (input) for mailman id 127712;
 Sat, 15 May 2021 09:25:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhqYW-0005hD-SK
 for xen-devel@lists.xenproject.org; Sat, 15 May 2021 09:25:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhqYV-0003vk-86; Sat, 15 May 2021 09:25:55 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhqYV-0007XR-1x; Sat, 15 May 2021 09:25:55 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=XHtW0I3Psmjv7cxq+rSSr3L70g0qHUVT7vSAfNDsmHU=; b=5QLwqQ7TQs3urAFnAoIqzSfLlH
	Ql06Hsq/YFp0CtnIHRoayP0wLJbNKzu2i08/ZmpvcL13RX/3spqXSd8owDtSdD13n2UK2ZhWh0Y4Y
	6Fv9Ke0GXZXctV5edHoCxlPnI4d9Z5XGjXpUDWwjuPkZNy/+CcdaQY7eQoeZTykMuYT8=;
Subject: Re: [PATCH RFCv2 15/15] xen/arm: mm: Re-implement
 setup_frame_table_mappings() with map_pages_to_xen()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-16-julien@xen.org>
 <alpine.DEB.2.21.2105141658510.14426@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <2308478e-527b-a54a-206a-785f80515835@xen.org>
Date: Sat, 15 May 2021 10:25:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105141658510.14426@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 15/05/2021 01:02, Stefano Stabellini wrote:
> On Sun, 25 Apr 2021, Julien Grall wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> Now that map_pages_to_xen() has been extended to support 2MB mappings,
>> we can replace the create_mappings() call by map_pages_to_xen() call.
>>
>> This has the advantage to remove the different between 32-bit and 64-bit
>> code.
>>
>> Lastly remove create_mappings() as there is no more callers.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>      Changes in v2:
>>          - New patch
>>
>>      TODO:
>>          - Add support for setting the contiguous bit
>> ---
>>   xen/arch/arm/mm.c | 64 +++++------------------------------------------
>>   1 file changed, 6 insertions(+), 58 deletions(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index c49403b687f5..5f8ae029dd6d 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -359,40 +359,6 @@ void clear_fixmap(unsigned map)
>>       BUG_ON(res != 0);
>>   }
>>   
>> -/* Create Xen's mappings of memory.
>> - * Mapping_size must be either 2MB or 32MB.
>> - * Base and virt must be mapping_size aligned.
>> - * Size must be a multiple of mapping_size.
>> - * second must be a contiguous set of second level page tables
>> - * covering the region starting at virt_offset. */
>> -static void __init create_mappings(lpae_t *second,
>> -                                   unsigned long virt_offset,
>> -                                   unsigned long base_mfn,
>> -                                   unsigned long nr_mfns,
>> -                                   unsigned int mapping_size)
>> -{
>> -    unsigned long i, count;
>> -    const unsigned long granularity = mapping_size >> PAGE_SHIFT;
>> -    lpae_t pte, *p;
>> -
>> -    ASSERT((mapping_size == MB(2)) || (mapping_size == MB(32)));
>> -    ASSERT(!((virt_offset >> PAGE_SHIFT) % granularity));
>> -    ASSERT(!(base_mfn % granularity));
>> -    ASSERT(!(nr_mfns % granularity));
>> -
>> -    count = nr_mfns / LPAE_ENTRIES;
>> -    p = second + second_linear_offset(virt_offset);
>> -    pte = mfn_to_xen_entry(_mfn(base_mfn), MT_NORMAL);
>> -    if ( granularity == 16 * LPAE_ENTRIES )
>> -        pte.pt.contig = 1;  /* These maps are in 16-entry contiguous chunks. */
>> -    for ( i = 0; i < count; i++ )
>> -    {
>> -        write_pte(p + i, pte);
>> -        pte.pt.base += 1 << LPAE_SHIFT;
>> -    }
>> -    flush_xen_tlb_local();
>> -}
>> -
>>   #ifdef CONFIG_DOMAIN_PAGE
>>   void *map_domain_page_global(mfn_t mfn)
>>   {
>> @@ -850,36 +816,18 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>       unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
>>       mfn_t base_mfn;
>>       const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
>> -#ifdef CONFIG_ARM_64
>> -    lpae_t *second, pte;
>> -    unsigned long nr_second;
>> -    mfn_t second_base;
>> -    int i;
>> -#endif
>> +    int rc;
>>   
>>       frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
>>       /* Round up to 2M or 32M boundary, as appropriate. */
>>       frametable_size = ROUNDUP(frametable_size, mapping_size);
>>       base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
>>   
>> -#ifdef CONFIG_ARM_64
>> -    /* Compute the number of second level pages. */
>> -    nr_second = ROUNDUP(frametable_size, FIRST_SIZE) >> FIRST_SHIFT;
>> -    second_base = alloc_boot_pages(nr_second, 1);
>> -    second = mfn_to_virt(second_base);
>> -    for ( i = 0; i < nr_second; i++ )
>> -    {
>> -        clear_page(mfn_to_virt(mfn_add(second_base, i)));
>> -        pte = mfn_to_xen_entry(mfn_add(second_base, i), MT_NORMAL);
>> -        pte.pt.table = 1;
>> -        write_pte(&xen_first[first_table_offset(FRAMETABLE_VIRT_START)+i], pte);
>> -    }
>> -    create_mappings(second, 0, mfn_x(base_mfn), frametable_size >> PAGE_SHIFT,
>> -                    mapping_size);
>> -#else
>> -    create_mappings(xen_second, FRAMETABLE_VIRT_START, mfn_x(base_mfn),
>> -                    frametable_size >> PAGE_SHIFT, mapping_size);
>> -#endif
>> +    /* XXX: Handle contiguous bit */
>> +    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
>> +                          frametable_size >> PAGE_SHIFT, PAGE_HYPERVISOR_RW);
>> +    if ( rc )
>> +        panic("Unable to setup the frametable mappings.\n");
> 
> This is a lot better.
> 
> I take that "XXX: Handle contiguous bit" refers to the lack of
> _PAGE_BLOCK. Why can't we just | _PAGE_BLOCK like in other places?

I forgot to add _PAGE_BLOCK, however this is unrelated to my comment.

Currently, the frametable is mapped using 2MB mapping and setting the 
contiguous bit for each entry if the mapping is 32MB aligned.

_PAGE_BLOCK will only create 2MB mapping but will not set the contiguous 
bit. This will increase the pressure on the TLBs (we would get 16 entry 
rather than 1) if on system where the TLBs can take advantange of it.

So map_pages_to_xen() needs to gain support for contiguous bit. I 
haven't yet looked at it (hence the RFC state).

Cheers,

-- 
Julien Grall

