Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5AA64BCBE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 20:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461095.719129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Adb-00044I-FS; Tue, 13 Dec 2022 19:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461095.719129; Tue, 13 Dec 2022 19:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Adb-00041m-CL; Tue, 13 Dec 2022 19:08:23 +0000
Received: by outflank-mailman (input) for mailman id 461095;
 Tue, 13 Dec 2022 19:08:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5Ada-00041d-4L
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 19:08:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5AdZ-0000Y0-LR; Tue, 13 Dec 2022 19:08:21 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.2.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5AdZ-00043m-EW; Tue, 13 Dec 2022 19:08:21 +0000
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
	bh=3aWGQN60DPPv8Q6n0KPsy27lBgN4V0tszruDaqxQCak=; b=I5a7ePmOyQXeq1hXz+6TYAt/MY
	d2H6nPyod4wOUCM2FURb/oGDPUQhmjGWMJRXUcWW7QAXRyWulJNZSKkxYF1toXnCWe2A60UOFa/pT
	4OoQXS1y1biVrAfnHabv8cs+ctbqsWxhkdomvICd95PjKLhpXPGZm3CDnoECQmNUlbFE=;
Message-ID: <aa82a916-5c2b-83eb-328d-ac234eabc77c@xen.org>
Date: Tue, 13 Dec 2022 19:08:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 18/18] xen/arm64: mm: Rework switch_ttbr()
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-19-julien@xen.org>
 <alpine.DEB.2.22.394.2212121748560.3075842@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2212121748560.3075842@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/12/2022 02:00, Stefano Stabellini wrote:
> On Mon, 12 Dec 2022, Julien Grall wrote:
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
>> The arm32 code will use a different approach. So this issue is for now
>> only resolved on arm64.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> This patch looks overall good to me, aside from the few minor comments
> below. I would love for someone else, maybe from ARM, reviewing steps
> 1-6 making sure they are the right sequence.
> 
> 
>> ---
>>
>>      Changes in v2:
>>          - Remove the arm32 changes. This will be addressed differently
>>          - Re-instate the instruct cache flush. This is not strictly
>>            necessary but kept it for safety.
>>          - Use "dsb ish"  rather than "dsb sy".
>>
>>      TODO:
>>          * Handle the case where the runtime Xen is loaded at a different
>>            position for cache coloring. This will be dealt separately.
>> ---
>>   xen/arch/arm/arm64/head.S     | 50 +++++++++++++++++++++++------------
>>   xen/arch/arm/arm64/mm.c       | 39 +++++++++++++++++++++++++++
>>   xen/arch/arm/include/asm/mm.h |  2 ++
>>   xen/arch/arm/mm.c             | 14 +++++-----
>>   4 files changed, 82 insertions(+), 23 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 663f5813b12e..1f69864492b6 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -816,30 +816,46 @@ ENDPROC(fail)
>>    * Switch TTBR
>>    *
>>    * x0    ttbr
>> - *
>> - * TODO: This code does not comply with break-before-make.
>>    */
>> -ENTRY(switch_ttbr)
>> -        dsb   sy                     /* Ensure the flushes happen before
>> -                                      * continuing */
>> -        isb                          /* Ensure synchronization with previous
>> -                                      * changes to text */
>> -        tlbi   alle2                 /* Flush hypervisor TLB */
>> -        ic     iallu                 /* Flush I-cache */
>> -        dsb    sy                    /* Ensure completion of TLB flush */
>> +ENTRY(switch_ttbr_id)
>> +        /* 1) Ensure any previous read/write have completed */
>> +        dsb    ish
>> +        isb
>> +
>> +        /* 2) Turn off MMU */
>> +        mrs    x1, SCTLR_EL2
>> +        bic    x1, x1, #SCTLR_Axx_ELx_M
> 
> do we need a "dsb   sy" here? we have in enable_mmu

Hmmm... The explanation of the dsb + isb in enable_mmu makes no sense. 
The isb doesn't flush the I-cache, it just flushes the pipeline.

For the dsb, I am not convinced it is necessary because we already have 
the 'dsb nsh' above and in any case the barrier seems to be too strong.

I guess that will be another patch... (probably at a lower priority).

Now back to your question of the 'dsb' here. There is already a 'dsb 
ish' above. So memory access before turning off the MMU should be 
completed. Also...

> 
> 
>> +        msr    SCTLR_EL2, x1
>> +        isb

... this isb will ensure the completion of SCTLR before the TLBs are 
flushed before. And there should be no memory access (or than 
instructions here). So I don't think the a dsb is needed.

Would you mind to explain why you think there is one needed?

>> +
>> +        /*
>> +         * 3) Flush the TLBs.
>> +         * See asm/arm64/flushtlb.h for the explanation of the sequence.
>> +         */
>> +        dsb   nshst
>> +        tlbi  alle2
>> +        dsb   nsh
>> +        isb
>> +
>> +        /* 4) Update the TTBR */
>> +        msr   TTBR0_EL2, x0
>>           isb
>>   
>> -        msr    TTBR0_EL2, x0
>> +        /*
>> +         * 5) Flush I-cache
>> +         * This should not be necessary but it is kept for safety.
>> +         */
>> +        ic     iallu
>> +        isb
>>   
>> -        isb                          /* Ensure synchronization with previous
>> -                                      * changes to text */
>> -        tlbi   alle2                 /* Flush hypervisor TLB */
>> -        ic     iallu                 /* Flush I-cache */
>> -        dsb    sy                    /* Ensure completion of TLB flush */
>> +        /* 5) Turn on the MMU */
> 
> This should be 6)

I will update it.

> 
> 
>> +        mrs   x1, SCTLR_EL2
>> +        orr   x1, x1, #SCTLR_Axx_ELx_M  /* Enable MMU */
>> +        msr   SCTLR_EL2, x1
>>           isb
>>   
>>           ret
>> -ENDPROC(switch_ttbr)
>> +ENDPROC(switch_ttbr_id)
>>   
>>   #ifdef CONFIG_EARLY_PRINTK
>>   /*
>> diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
>> index 9eaf545ea9dd..2ede4e75ae33 100644
>> --- a/xen/arch/arm/arm64/mm.c
>> +++ b/xen/arch/arm/arm64/mm.c
>> @@ -31,6 +31,15 @@ static void __init prepare_boot_identity_mapping(void)
>>       lpae_t pte;
>>       DECLARE_OFFSETS(id_offsets, id_addr);
>>   
>> +    /*
>> +     * We will be re-using the boot ID tables. They may not have been
>> +     * zeroed but they should be unlinked. So it is fine to use
>> +     * clear_page().
>> +     */
>> +    clear_page(boot_first_id);
>> +    clear_page(boot_second_id);
>> +    clear_page(boot_third_id);
> 
> Could this code be in patch #15?

Yes, I can't remember why I decided to clear them in patch #18.

>>       if ( id_offsets[0] != 0 )
>>           panic("Cannot handled ID mapping above 512GB\n");
>>   
>> @@ -111,6 +120,36 @@ void update_identity_mapping(bool enable)
>>       BUG_ON(rc);
>>   }
>>   
>> +extern void switch_ttbr_id(uint64_t ttbr);
>> +
>> +typedef void (switch_ttbr_fn)(uint64_t ttbr);
>> +
>> +void __init switch_ttbr(uint64_t ttbr)
>> +{
>> +    vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
>> +    switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
>> +    lpae_t pte;
>> +
>> +    /* Enable the identity mapping in the boot page tables */
> 
> See below...
> 
>> +    update_identity_mapping(true);
>> +    /* Enable the identity mapping in the runtime page tables */
>> +    pte = pte_of_xenaddr((vaddr_t)switch_ttbr_id);
>> +    pte.pt.table = 1;
>> +    pte.pt.xn = 0;
>> +    pte.pt.ro = 1;
>> +    write_pte(&xen_third_id[third_table_offset(id_addr)], pte);
>> +
>> +    /* Switch TTBR */
>> +    fn(ttbr);
>> +
>> +    /*
>> +     * Disable the identity mapping in the runtime page tables.
>> +     * Note it is not necessary to disable it in the boot page tables
>> +     * because they are not going to be used by this CPU anymore.
>> +     */
> 
> ...is update_identity_mapping acting on the boot pagetables or the
> runtime pagetables? The two comments make me think that
> update_identity_mapping is enabling mapping in the boot pagetables and
> removing them from the runtime pagetable, which would be strangely
> inconsistent.

update_identity_mapping() is acting on the live page-tables (i.e. the 
one pointed by TTBR_EL2).

Before switch_ttbr(), this will be the boot page-tables. But after, this 
will be the runtime page-tables.

Would the following comment on top of the declaration of 
update_identity_mapping() clarifies it:

"Enable/disable the identity mapping in the live page-tables (i.e. the 
one pointed by TTBR_EL2)."

Cheers,

-- 
Julien Grall

