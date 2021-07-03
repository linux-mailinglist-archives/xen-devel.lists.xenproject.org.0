Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1223BA9EA
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 19:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149588.276693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjtL-0008RG-Le; Sat, 03 Jul 2021 17:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149588.276693; Sat, 03 Jul 2021 17:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjtL-0008Oo-Hq; Sat, 03 Jul 2021 17:57:23 +0000
Received: by outflank-mailman (input) for mailman id 149588;
 Sat, 03 Jul 2021 17:57:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzjtJ-0008Oi-Mk
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 17:57:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjtE-0008Uk-Nj; Sat, 03 Jul 2021 17:57:16 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjtE-0000vw-Gj; Sat, 03 Jul 2021 17:57:16 +0000
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
	bh=FRoQj8C3a/dd4DePsdlLWSExr9beT/irMjZWmijnTms=; b=GlSU7MO5pQkAJ80zHghZQJdXMJ
	4NmTGQSIq/Sh5GpysruccZSB6tZyNovC5m0eX6YI+LVrk0f4jJVTaYhmrCXjKsETc0kmZ0WCN9XT+
	44n6XVqRffAcgDAqeLmrG1owUYZk4eR1vBtW+TSoPD4pjMlg++yVrcamKfauzdmh3FwQ=;
Subject: Re: [PATCH RFCv2 12/15] xen/arm: add Persistent Map (PMAP)
 infrastructure
To: "Xia, Hongyan" <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Penny.Zheng@arm.com" <Penny.Zheng@arm.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "Wei.Chen@arm.com" <Wei.Chen@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "hongyax@amazon.com" <hongyax@amazon.com>,
 "Henry.Wang@arm.com" <Henry.Wang@arm.com>, "wl@xen.org" <wl@xen.org>,
 "Grall, Julien" <jgrall@amazon.co.uk>, "jbeulich@suse.com"
 <jbeulich@suse.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-13-julien@xen.org>
 <baccb4ab6c71a655a4ac19cc27f2eacc116b8d4b.camel@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d3bdec7f-837e-a055-4fe5-a5ceff0c5a51@xen.org>
Date: Sat, 3 Jul 2021 18:57:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <baccb4ab6c71a655a4ac19cc27f2eacc116b8d4b.camel@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Hongyan,

On 26/04/2021 10:41, Xia, Hongyan wrote:
> On Sun, 2021-04-25 at 21:13 +0100, Julien Grall wrote:
>> From: Wei Liu <wei.liu2@citrix.com>
>>
>> The basic idea is like Persistent Kernel Map (PKMAP) in Linux. We
>> pre-populate all the relevant page tables before the system is fully
>> set up.
>>
>> We will need it on Arm in order to rework the arm64 version of
>> xenheap_setup_mappings() as we may need to use pages allocated from
>> the boot allocator before they are effectively mapped.
>>
>> This infrastructure is not lock-protected therefore can only be used
>> before smpboot. After smpboot, map_domain_page() has to be used.
>>
>> This is based on the x86 version [1] that was originally implemented
>> by Wei Liu.
>>
>> Take the opportunity to switch the parameter attr from unsigned to
>> unsigned int.
>>
>> [1] <
>> e92da4ad6015b6089737fcccba3ec1d6424649a5.1588278317.git.hongyxia@amazon.com
>>>
>>
>> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>> [julien: Adapted for Arm]
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> [...]
> 
>> diff --git a/xen/arch/arm/pmap.c b/xen/arch/arm/pmap.c
>> new file mode 100644
>> index 000000000000..702b1bde982d
>> --- /dev/null
>> +++ b/xen/arch/arm/pmap.c
>> @@ -0,0 +1,101 @@
>> +#include <xen/init.h>
>> +#include <xen/mm.h>
>> +
>> +#include <asm/bitops.h>
>> +#include <asm/flushtlb.h>
>> +#include <asm/pmap.h>
>> +
>> +/*
>> + * To be able to use FIXMAP_PMAP_BEGIN.
>> + * XXX: move fixmap definition in a separate header
>> + */
>> +#include <xen/acpi.h>
>> +
>> +/*
>> + * Simple mapping infrastructure to map / unmap pages in fixed map.
>> + * This is used to set up the page table for mapcache, which is used
>> + * by map domain page infrastructure.
>> + *
>> + * This structure is not protected by any locks, so it must not be
>> used after
>> + * smp bring-up.
>> + */
>> +
>> +/* Bitmap to track which slot is used */
>> +static unsigned long __initdata inuse;
>> +
>> +/* XXX: Find an header to declare it */
>> +extern lpae_t xen_fixmap[LPAE_ENTRIES];
>> +
>> +void *__init pmap_map(mfn_t mfn)
>> +{
>> +    unsigned long flags;
>> +    unsigned int idx;
>> +    vaddr_t linear;
>> +    unsigned int slot;
>> +    lpae_t *entry, pte;
>> +
>> +    BUILD_BUG_ON(sizeof(inuse) * BITS_PER_LONG < NUM_FIX_PMAP);
> 
> This seems wrong to me. It should multiply with something like
> BITS_PER_BYTE.

Good spot! I have updated my tree.

> 
> I noticed this line was already present before the Arm version so
> probably my fault :(, which also needs to be fixed.

This should be taken care as the next version will create the pmap in 
common code :).

> 
>> +
>> +    ASSERT(system_state < SYS_STATE_smp_boot);
>> +
>> +    local_irq_save(flags);
>> +
>> +    idx = find_first_zero_bit(&inuse, NUM_FIX_PMAP);
>> +    if ( idx == NUM_FIX_PMAP )
>> +        panic("Out of PMAP slots\n");
>> +
>> +    __set_bit(idx, &inuse);
>> +
>> +    slot = idx + FIXMAP_PMAP_BEGIN;
>> +    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
>> +
> 
>  From here...
> 
>> +    linear = FIXMAP_ADDR(slot);
>> +    /*
>> +     * We cannot use set_fixmap() here. We use PMAP when there is no
>> direct map,
>> +     * so map_pages_to_xen() called by set_fixmap() needs to map
>> pages on
>> +     * demand, which then calls pmap() again, resulting in a loop.
>> Modify the
>> +     * PTEs directly instead. The same is true for pmap_unmap().
>> +     */
>> +    entry = &xen_fixmap[third_table_offset(linear)];
>> +
>> +    ASSERT(!lpae_is_valid(*entry));
>> +
>> +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
>> +    pte.pt.table = 1;
>> +    write_pte(entry, pte);
>> +
> 
> ...to here, I wonder if we can move this chunk into arch (like void
> *arch_write_pmap_slot(slot)). Such an arch function hides how fixmap is
> handled and how page table entry is written behind arch, and the rest
> can just be common.

This is similar to what I had in mind. Let me give a try for the next 
version.

> 
>> +    local_irq_restore(flags);
>> +
>> +    return (void *)linear;
>> +}
>> +
>> +void __init pmap_unmap(const void *p)
>> +{
>> +    unsigned long flags;
>> +    unsigned int idx;
>> +    lpae_t *entry;
>> +    lpae_t pte = { 0 };
>> +    unsigned int slot = third_table_offset((vaddr_t)p);
>> +
>> +    ASSERT(system_state < SYS_STATE_smp_boot);
>> +    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
>> +
>> +    idx = slot - FIXMAP_PMAP_BEGIN;
>> +    local_irq_save(flags);
>> +
>> +    __clear_bit(idx, &inuse);
>> +    entry = &xen_fixmap[third_table_offset((vaddr_t)p)];
>> +    write_pte(entry, pte);
>> +    flush_xen_tlb_range_va_local((vaddr_t)p, PAGE_SIZE);
> 
> and the same for the above, something like arch_clear_pmap(void *) and
> the rest into common.
> 
>  From a quick glance, I don't think x86 and Arm share any useful TLB
> flush helpers? So the TLB flush probably should be behind arch as well.

We could potential define flush_tlb_one_local() on Arm. But, I am not 
sure this is worth it because the page table manipulation is mainly 
happening in arch code so far. Although, this might change in the future.

> 
>> +
>> +    local_irq_restore(flags);
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
> 
> [...]
> 
>> diff --git a/xen/include/asm-arm/pmap.h b/xen/include/asm-arm/pmap.h
>> new file mode 100644
>> index 000000000000..8e1dce93f8e4
>> --- /dev/null
>> +++ b/xen/include/asm-arm/pmap.h
>> @@ -0,0 +1,10 @@
>> +#ifndef __ASM_PMAP_H__
>> +#define __ARM_PMAP_H__
> 
> This line doesn't seem to match the #ifndef, but if the functions are
> moved to common, this header can be moved to common as well.

Stefano pointed out the same. I have fixed it in my tree but I will 
likely rename the guard as the header will be moved in common.

Cheers,

-- 
Julien Grall

