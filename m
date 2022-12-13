Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB41764B294
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 10:45:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460340.718232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51qe-0002tC-Aj; Tue, 13 Dec 2022 09:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460340.718232; Tue, 13 Dec 2022 09:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51qe-0002qM-7L; Tue, 13 Dec 2022 09:45:16 +0000
Received: by outflank-mailman (input) for mailman id 460340;
 Tue, 13 Dec 2022 09:45:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p51qd-0002qG-HD
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 09:45:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p51qd-0002mr-5b; Tue, 13 Dec 2022 09:45:15 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.2.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p51qc-0001Lp-Vf; Tue, 13 Dec 2022 09:45:15 +0000
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
	bh=KQ86Goubtns4N8CWC1j/jBdSSOAc7AKLigib8WTWJCM=; b=awEUJl2kxeUopCbDC5MPINsk+Z
	uMPhPT1Qc0hjqlsnvUHaDbLQ//RXYLN5iwM8di7LqckF7E2PHzTW6k5CLnCnSfpjY21js8EULPN6b
	EjfNEaqitG+wO1LBayiK8mLQMvtG0JkAIwAxBivwHZqoGJhsKwm4aorKaIBk+bU1p3Jw=;
Message-ID: <a45d9304-0db3-930b-7ebd-1ae1dafabac8@xen.org>
Date: Tue, 13 Dec 2022 09:45:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 01/18] xen/arm64: flushtlb: Reduce scope of barrier for
 local TLB flush
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-2-julien@xen.org>
 <650bc040-63a9-8950-e2ff-6829c9a452a8@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <650bc040-63a9-8950-e2ff-6829c9a452a8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/12/2022 09:11, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 12/12/2022 10:55, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Per D5-4929 in ARM DDI 0487H.a:
>> "A DSB NSH is sufficient to ensure completion of TLB maintenance
>>   instructions that apply to a single PE. A DSB ISH is sufficient to
>>   ensure completion of TLB maintenance instructions that apply to PEs
>>   in the same Inner Shareable domain.
>> "
>>
>> This means barrier after local TLB flushes could be reduced to
>> non-shareable.
>>
>> Note that the scope of the barrier in the workaround has not been
>> changed because Linux v6.1-rc8 is also using 'ish' and I couldn't
>> find anything in the Neoverse N1 suggesting that a 'nsh' would
>> be sufficient.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>>      I have used an older version of the Arm Arm because the explanation
>>      in the latest (ARM DDI 0487I.a) is less obvious. I reckon the paragraph
>>      about DSB in D8.13.8 is missing the shareability. But this is implied
>>      in B2.3.11:
>>
>>      "If the required access types of the DSB is reads and writes, the
>>       following instructions issued by PEe before the DSB are complete for
>>       the required shareability domain:
>>
>>       [...]
>>
>>       — All TLB maintenance instructions.
>>      "
>>
>>      Changes in v3:
>>          - Patch added
>> ---
>>   xen/arch/arm/include/asm/arm64/flushtlb.h | 27 ++++++++++++++---------
>>   1 file changed, 16 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
>> index 7c5431518741..39d429ace552 100644
>> --- a/xen/arch/arm/include/asm/arm64/flushtlb.h
>> +++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
>> @@ -12,8 +12,9 @@
>>    * ARM64_WORKAROUND_REPEAT_TLBI:
> Before this line, in the same comment, we state DSB ISHST. This should also be changed
> to reflect the change done by this patch.

This is on purpose. I decided to keep the sequence as-is and instead add 
a paragraph explaining that 'nsh' is sufficient for local TLB flushes.

> 
>>    * Modification of the translation table for a virtual address might lead to
>>    * read-after-read ordering violation.
>> - * The workaround repeats TLBI+DSB operation for all the TLB flush operations.
>> - * While this is stricly not necessary, we don't want to take any risk.
>> + * The workaround repeats TLBI+DSB ISH operation for all the TLB flush
>> + * operations. While this is stricly not necessary, we don't want to
> s/stricly/strictly/
> 
>> + * take any risk.
>>    *
>>    * For Xen page-tables the ISB will discard any instructions fetched
>>    * from the old mappings.
>> @@ -21,38 +22,42 @@
>>    * For the Stage-2 page-tables the ISB ensures the completion of the DSB
>>    * (and therefore the TLB invalidation) before continuing. So we know
>>    * the TLBs cannot contain an entry for a mapping we may have removed.
>> + *
>> + * Note that for local TLB flush, using non-shareable (nsh) is sufficient
>> + * (see D5-4929 in ARM DDI 0487H.a). Althougth, the memory barrier in
> s/Althougth/Although/
> 
>> + * for the workaround is left as inner-shareable to match with Linux.
> So for the workaround we stay with DSB ISH. But ...
> 
>>    */
>> -#define TLB_HELPER(name, tlbop)                  \
>> +#define TLB_HELPER(name, tlbop, sh)              \
>>   static inline void name(void)                    \
>>   {                                                \
>>       asm volatile(                                \
>> -        "dsb  ishst;"                            \
>> +        "dsb  "  # sh  "st;"                     \
>>           "tlbi "  # tlbop  ";"                    \
>>           ALTERNATIVE(                             \
>>               "nop; nop;",                         \
>> -            "dsb  ish;"                          \
>> +            "dsb  "  # sh  ";"                   \
> ... you do not adhere to this.

This is a leftover from my previous approach. I will drop it.

[...]

> 
> With the remarks fixed:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

I am not planning to fix the first remark. Please let me know if your 
Reviewed-by tag stands.

Cheers,

-- 
Julien Grall

