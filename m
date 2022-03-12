Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE22D4D7075
	for <lists+xen-devel@lfdr.de>; Sat, 12 Mar 2022 19:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289517.491086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nT6sU-0006uO-QN; Sat, 12 Mar 2022 18:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289517.491086; Sat, 12 Mar 2022 18:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nT6sU-0006sS-NR; Sat, 12 Mar 2022 18:54:10 +0000
Received: by outflank-mailman (input) for mailman id 289517;
 Sat, 12 Mar 2022 18:54:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nT6sS-0006s4-LQ
 for xen-devel@lists.xenproject.org; Sat, 12 Mar 2022 18:54:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nT6sR-0000aO-ET; Sat, 12 Mar 2022 18:54:07 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nT6sR-0000tb-8Q; Sat, 12 Mar 2022 18:54:07 +0000
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
	bh=b/uB3H0LsEV7GJm36w+JqXQECWN95jRxSpi+gckbZkw=; b=VTX5HbSzb9P9MtXSBrJavgCoIo
	zkWMAakoxXGVv1GrTfbzGN0xX+uamZvas+a5FVwyuE/53PiyabAjdBHENjy5tv3vsS4zISJJDydeo
	7Y7Yca6JzDuxJYcjml3tcu/AUIrSlgjNt6fFaHprgyAE+ErYbfSglNJvIzP2082BBUlo=;
Message-ID: <ece8f698-0abd-42eb-625e-693f69f02e27@xen.org>
Date: Sat, 12 Mar 2022 18:54:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech,
 lucmiccio@gmail.com, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-5-julien@xen.org>
 <alpine.DEB.2.22.394.2203111721130.3497@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
In-Reply-To: <alpine.DEB.2.22.394.2203111721130.3497@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/03/2022 01:31, Stefano Stabellini wrote:
> On Wed, 9 Mar 2022, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, switch_ttbr() is switching the TTBR whilst the MMU is
>> still on.
>>
>> Switching TTBR is like replacing existing mappings with new ones. So
>> we need to follow the break-before-make sequence.
>>
>> In this case, it means the MMU needs to be switched off while the
>> TTBR is updated. In order to disable the MMU, we need to first
>> jump to an identity mapping.
>>
>> Rename switch_ttbr() to switch_ttbr_id() and create an helper on
>> top to temporary map the identity mapping and call switch_ttbr()
>> via the identity address.
>>
>> switch_ttbr_id() is now reworked to temporarily turn off the MMU
>> before updating the TTBR.
>>
>> We also need to make sure the helper switch_ttbr() is part of the
>> identity mapping. So move _end_boot past it.
>>
>> Take the opportunity to instruction cache flush as the operation is
>> only necessary when the memory is updated.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>>      TODO:
>>          * Rename _end_boot to _end_id_mapping or similar
>>          * Check the memory barriers
>>          * I suspect the instruction cache flush will be necessary
>>            for cache coloring.
>> ---
>>   xen/arch/arm/arm64/head.S | 31 ++++++++++++++++++++-----------
>>   xen/arch/arm/mm.c         | 14 +++++++++++++-
>>   2 files changed, 33 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 878649280d73..c5cc72b8fe6f 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -803,36 +803,45 @@ fail:   PRINT("- Boot failed -\r\n")
>>           b     1b
>>   ENDPROC(fail)
>>   
>> -GLOBAL(_end_boot)
>> -
>>   /*
>>    * Switch TTBR
>>    *
>>    * x0    ttbr
>>    *
>> - * TODO: This code does not comply with break-before-make.
>> + * XXX: Check the barriers
>>    */
>> -ENTRY(switch_ttbr)
>> +ENTRY(switch_ttbr_id)
>>           dsb   sy                     /* Ensure the flushes happen before
>>                                         * continuing */
>>           isb                          /* Ensure synchronization with previous
>>                                         * changes to text */
>> +
>> +        /* Turn off MMU */
>> +        mrs    x1, SCTLR_EL2
>> +        bic    x1, x1, #SCTLR_Axx_ELx_M
>> +        msr    SCTLR_EL2, x1
>> +        dsb    sy
>> +        isb
>> +
>>           tlbi   alle2                 /* Flush hypervisor TLB */
>> -        ic     iallu                 /* Flush I-cache */
>>           dsb    sy                    /* Ensure completion of TLB flush */
>>           isb
>>   
>> -        msr    TTBR0_EL2, x0
>> +        msr   TTBR0_EL2, x0
>> +
>> +        mrs   x1, SCTLR_EL2
>> +        orr   x1, x1, #SCTLR_Axx_ELx_M  /* Enable MMU */
>> +        msr   SCTLR_EL2, x1
>>   
>>           isb                          /* Ensure synchronization with previous
>>                                         * changes to text */
>> -        tlbi   alle2                 /* Flush hypervisor TLB */
>> -        ic     iallu                 /* Flush I-cache */
>> -        dsb    sy                    /* Ensure completion of TLB flush */
>> -        isb
>> +        /* Turn on the MMU */
>> +
>>   
>>           ret
>> -ENDPROC(switch_ttbr)
>> +ENDPROC(switch_ttbr_id)
>> +
>> +GLOBAL(_end_boot)
>>   
>>   #ifdef CONFIG_EARLY_PRINTK
>>   /*
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 5c4dece16f7f..a53760af7af0 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -660,7 +660,19 @@ static void xen_pt_enforce_wnx(void)
>>       flush_xen_tlb_local();
>>   }
>>   
>> -extern void switch_ttbr(uint64_t ttbr);
>> +extern void switch_ttbr_id(uint64_t ttbr);
>> +
>> +typedef void (switch_ttbr_fn)(uint64_t ttbr);
>> +
>> +static void switch_ttbr(uint64_t ttbr)
>> +{
>> +    vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
>> +    switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
>> +
>> +    update_identity_mapping(true);
>> +    fn(ttbr);
>> +    update_identity_mapping(false);
>> +}
> 
> Controversial question: does it really matter that XEN_VIRT_START >
> 512GB and that _start < 512GB?
> 
> I am totally fine with the limit, I am just brainstorming: given that
> the mapping is used very temporarely, it wouldn't really be an issue if
> it conflicts with something important. Let's say that it conflicts with
> the VMAP or the FRAMETABLE. As long as:
> 
> - we save the current mapping
> - update it with the Xen 1:1
> - switch_ttbr
> - remove Xen 1:1
> - restore mapping
> 
> It should work, right? Basically, a mapping conflict shouldn't be an
> issue given that the mapping has only to live long enough to call
> switch_ttbr_id.

Today switch_ttbr() is called before we initialized most of the memory 
layout. So clashing with the VMAP and frametable is not a problem.

However, the identity mapping may also clash with the region used to map 
Xen. That said, technically, we are not able to handle Xen when its 
start address is in region 2MB + 4K to 4MB (Xen is loaded at a 4KB 
aligned address).

The trouble is some features (e.g. UBSAN, GCOV) can generate Xen image 
over 2MB. IOW, the range where Xen cannot be loaded will increase.

This is an issue because AFAIK, there is no away to tell GRUB "You can't 
load Xen at this region". But even if there were one, I feel this 
restriction is sort of random.

I already wrote a patch to get rid of the restriction. The code is not 
too bad (we only need an extra indirection). But I haven't sent it yet 
because it is less critical with the re-shuffling of the memory layout.

Anyway, that's a long way to say that it will soon become an issue if 
the ID mapping is clashing with Xen mappings.

> 
> I am less sure about patch #5 but it doesn't seem it would be a problem
> there either.

This is actually going to be problematic. On Arm64, the page-tables are 
shared with all the CPUs. You would need to prevent the CPUs to touch 
any of the mapping we removed.

While booting, idle pCPUs will usually scrub the pages. So the 
frametable will be used. In theory, we could make sure the CPUs are not 
scrubbing. This would get trick for CPU hotpluggling (not yet supported) 
as CPU would need to idle. IMHO, this would be unnaceptable to block all 
the CPUs just to bring a new one.

Furthermore, we would need to be careful anytime we define new regions 
in the memory layout or reshuffle it as we need to ensure that no-one 
else use them when the ID mapping is inplace.

The memory layout is far from been full on Arm64. So to me, the extra 
risk is not worth it. The same goes for Arm32 (even thought the memory 
has much less space).

Cheers,

-- 
Julien Grall

