Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C087EE259
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 15:08:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634260.989693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3d21-00062X-9E; Thu, 16 Nov 2023 14:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634260.989693; Thu, 16 Nov 2023 14:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3d21-00060k-6R; Thu, 16 Nov 2023 14:07:45 +0000
Received: by outflank-mailman (input) for mailman id 634260;
 Thu, 16 Nov 2023 14:07:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3d20-0005zC-Ct
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 14:07:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3d20-0006ka-53; Thu, 16 Nov 2023 14:07:44 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[10.95.133.161]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3d1z-0001rF-VV; Thu, 16 Nov 2023 14:07:44 +0000
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
	bh=SX8Irm1FdenL9YqdGh46BjIleAFx3slt7CiP/oirLtE=; b=ii+s0TD6iuObBOu0FS/LrRO0Oc
	oiPXlpRTlidg4gloSsi6sTz9KrxS6CFnQISRCkuQf0E4N2FUnuEUoggbaB04IXofR7NjC0Jbpclcm
	bDHeX6DHkeMEh+cyC8B58xPNAIRqrNV83DqU4zmuwW9FYWk72Pd9F4TDVIj/sEkiD4OA=;
Message-ID: <8231d8ac-dd0c-42a7-b8cb-df1145c06a71@xen.org>
Date: Thu, 16 Nov 2023 14:07:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v3] xen/arm32: head: Replace load_paddr with adr_l when they
 are equivalent
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com
References: <20231027180715.3484439-1-ayan.kumar.halder@amd.com>
 <fd9a1eb2-c62f-44ed-977a-e4fee498fe0c@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fd9a1eb2-c62f-44ed-977a-e4fee498fe0c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/10/2023 08:28, Michal Orzel wrote:
> Hi Ayan,
> 
> On 27/10/2023 20:07, Ayan Kumar Halder wrote:
>> Before the MMU is turned on, PC uses physical address. Thus, one can use adr_l
>> instead of load_paddr to obtain the physical address of a symbol.
>>
>> The only exception (for this replacement) is create_table_entry() which is
>> called before and after MMU is turned on.
>>
>> Also, in lookup_processor_type() "r10" is no longer used. The reason being
>> __lookup_processor_type uses adr_l (thus r10 is no longer used to obtain the
>> physical address offset). Consequently, there is no need to save/restore r10.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Refer https://lists.archive.carbon60.com/xen/devel/682900 for details.
>>
>> Changes from :-
>>
>> v1 :- 1. No need to modify create_table_entry().
>> 2. Remove "mov   r10, #0 " in lookup_processor_type().
>>
>> v2 :- 1. No need to save/restore r10 in lookup_processor_type().
>> 2. Update the commit message title.
>>
>>   xen/arch/arm/arm32/head.S | 19 ++++++++-----------
>>   1 file changed, 8 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 33b038e7e0..1fcc6f745e 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -171,7 +171,7 @@ past_zImage:
>>   
>>           /* Using the DTB in the .dtb section? */
>>   .ifnes CONFIG_DTB_FILE,""
>> -        load_paddr r8, _sdtb
>> +        adr_l r8, _sdtb
>>   .endif
>>   
>>           /* Initialize the UART if earlyprintk has been enabled. */
>> @@ -213,7 +213,7 @@ GLOBAL(init_secondary)
>>           mrc   CP32(r1, MPIDR)
>>           bic   r7, r1, #(~MPIDR_HWID_MASK) /* Mask out flags to get CPU ID */
>>   
>> -        load_paddr r0, smp_up_cpu
>> +        adr_l r0, smp_up_cpu
>>           dsb
>>   2:      ldr   r1, [r0]
>>           cmp   r1, r7
>> @@ -479,7 +479,7 @@ create_page_tables:
>>            * create_table_entry_paddr() will clobber the register storing
>>            * the physical address of the table to point to.
>>            */
>> -        load_paddr r5, boot_third
>> +        adr_l r5, boot_third
>>           mov_w r4, XEN_VIRT_START
>>   .rept XEN_NR_ENTRIES(2)
>>           mov   r0, r5                        /* r0 := paddr(l3 table) */
>> @@ -578,7 +578,7 @@ enable_mmu:
>>           flush_xen_tlb_local r0
>>   
>>           /* Write Xen's PT's paddr into the HTTBR */
>> -        load_paddr r0, boot_pgtable
>> +        adr_l r0, boot_pgtable
>>           mov   r1, #0                 /* r0:r1 is paddr (boot_pagetable) */
>>           mcrr  CP64(r0, r1, HTTBR)
>>           isb
>> @@ -876,11 +876,10 @@ putn:   mov   pc, lr
>>   
>>   /* This provides a C-API version of __lookup_processor_type */
>>   ENTRY(lookup_processor_type)
>> -        stmfd sp!, {r4, r10, lr}
>> -        mov   r10, #0                   /* r10 := offset between virt&phys */
>> +        stmfd sp!, {r4, lr}
>>           bl    __lookup_processor_type
>>           mov r0, r1
>> -        ldmfd sp!, {r4, r10, pc}
>> +        ldmfd sp!, {r4, pc}
>>   
>>   /*
>>    *  Read processor ID register (CP#15, CR0), and Look up in the linker-built
>> @@ -888,8 +887,6 @@ ENTRY(lookup_processor_type)
>>    * the __proc_info lists since we aren't running with the MMU on (and therefore,
>>    * we are not in correct address space). We have to calculate the offset.
> In v2, I mentioned that this comment needs to be tweaked as well. We no longer use load_paddr
> thus we don't care about the offset. I would remove the comment starting from "Note that...".
> to avoid confusion or add a proper explanation if you want to keep it.
> With that addressed:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

I have committed with the following diff:

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 1fcc6f745e31..bbbdf7daf89e 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -882,10 +882,8 @@ ENTRY(lookup_processor_type)
          ldmfd sp!, {r4, pc}

  /*
- *  Read processor ID register (CP#15, CR0), and Look up in the 
linker-built
- * supported processor list. Note that we can't use the absolute 
addresses for
- * the __proc_info lists since we aren't running with the MMU on (and 
therefore,
- * we are not in correct address space). We have to calculate the offset.
+ * Read processor ID register (CP#15, CR0), and Look up in the linker-built
+ * supported processor list.
   *
   * Returns:
   * r0: CPUID

Note that I took the opportunity to remove the extra space on the first 
line of the comment.

> 
> ~Michal

-- 
Julien Grall

