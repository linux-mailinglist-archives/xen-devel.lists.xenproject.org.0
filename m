Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091DB2B4242
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 12:10:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27839.56407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kecNW-0002jy-Ag; Mon, 16 Nov 2020 11:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27839.56407; Mon, 16 Nov 2020 11:08:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kecNW-0002jZ-78; Mon, 16 Nov 2020 11:08:58 +0000
Received: by outflank-mailman (input) for mailman id 27839;
 Mon, 16 Nov 2020 11:08:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwWO=EW=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1kecNV-0002jU-CY
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 11:08:57 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f2b41deb-9059-4e49-960e-bef1f0523321;
 Mon, 16 Nov 2020 11:08:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76EAF101E;
 Mon, 16 Nov 2020 03:08:54 -0800 (PST)
Received: from [10.57.25.95] (unknown [10.57.25.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86FF53F70D;
 Mon, 16 Nov 2020 03:08:53 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HwWO=EW=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
	id 1kecNV-0002jU-CY
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 11:08:57 +0000
X-Inumbo-ID: f2b41deb-9059-4e49-960e-bef1f0523321
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id f2b41deb-9059-4e49-960e-bef1f0523321;
	Mon, 16 Nov 2020 11:08:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76EAF101E;
	Mon, 16 Nov 2020 03:08:54 -0800 (PST)
Received: from [10.57.25.95] (unknown [10.57.25.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86FF53F70D;
	Mon, 16 Nov 2020 03:08:53 -0800 (PST)
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A76/Neoverse-N1
 erratum #1286807
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20201116072422.17400-1-michal.orzel@arm.com>
 <3c9cd4af-da71-e000-eedb-683c2bc0a40e@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <384e250e-7657-4c9d-0d8f-6df68aacbad4@arm.com>
Date: Mon, 16 Nov 2020 12:08:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3c9cd4af-da71-e000-eedb-683c2bc0a40e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 16.11.2020 11:12, Julien Grall wrote:
> Hi Michal,
> 
> On 16/11/2020 07:24, Michal Orzel wrote:
>> On the affected Cortex-A76/Neoverse-N1 cores (r0p0 to r3p0),
>> if a virtual address for a cacheable mapping of a location is being
>> accessed by a core while another core is remapping the virtual
>> address to a new physical page using the recommended break-before-make
>> sequence, then under very rare circumstances TLBI+DSB completes before
>> a read using the translation being invalidated has been observed by
>> other observers. The workaround repeats the TLBI+DSB operation.
> 
> The commit message suggests the second TLBI+DSB operation is only necessary for innershearable TLBs.
> 
> I agree that it is probably be best to cover all the TLB flush operations. However, it would be good to clarify it in the commit message that this is done on purpose.
> 
Hi Julien,

Ok I agree that such note can be added.
I will push v2 then.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>   docs/misc/arm/silicon-errata.txt     |  2 ++
>>   xen/arch/arm/Kconfig                 | 18 +++++++++++++++++
>>   xen/arch/arm/cpuerrata.c             | 14 ++++++++++++++
>>   xen/include/asm-arm/arm64/flushtlb.h | 29 +++++++++++++++++++---------
>>   xen/include/asm-arm/cpufeature.h     |  3 ++-
>>   5 files changed, 56 insertions(+), 10 deletions(-)
>>
>> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
>> index 552c4151d3..d183ba543f 100644
>> --- a/docs/misc/arm/silicon-errata.txt
>> +++ b/docs/misc/arm/silicon-errata.txt
>> @@ -53,5 +53,7 @@ stable hypervisors.
>>   | ARM            | Cortex-A72      | #853709         | N/A                     |
>>   | ARM            | Cortex-A73      | #858921         | ARM_ERRATUM_858921      |
>>   | ARM            | Cortex-A76      | #1165522        | N/A                     |
>> +| ARM            | Cortex-A76      | #1286807        | ARM64_ERRATUM_1286807   |
>>   | ARM            | Neoverse-N1     | #1165522        | N/A
>> +| ARM            | Neoverse-N1     | #1286807        | ARM64_ERRATUM_1286807   |
>>   | ARM            | MMU-500         | #842869         | N/A                     |
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index f938dd21bd..5d6d906d72 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -244,6 +244,24 @@ config ARM_ERRATUM_858921
>>           If unsure, say Y.
>>   +config ARM64_ERRATUM_1286807
>> +    bool "Cortex-A76/Neoverse-N1: 1286807: Modification of the translation table for a virtual address might lead to read-after-read ordering violation"
>> +    default y
>> +    depends on ARM_64
>> +    help
>> +      This option adds a workaround for ARM Cortex-A76/Neoverse-N1 erratum 1286807.
>> +
>> +      On the affected Cortex-A76/Neoverse-N1 cores (r0p0 to r3p0), if a virtual
>> +      address for a cacheable mapping of a location is being
>> +      accessed by a core while another core is remapping the virtual
>> +      address to a new physical page using the recommended
>> +      break-before-make sequence, then under very rare circumstances
>> +      TLBI+DSB completes before a read using the translation being
>> +      invalidated has been observed by other observers. The
>> +      workaround repeats the TLBI+DSB operation.
>> +
>> +      If unsure, say Y.
>> +
>>   endmenu
>>     config ARM64_HARDEN_BRANCH_PREDICTOR
>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>> index 567911d380..cb4795beec 100644
>> --- a/xen/arch/arm/cpuerrata.c
>> +++ b/xen/arch/arm/cpuerrata.c
>> @@ -424,6 +424,20 @@ static const struct arm_cpu_capabilities arm_errata[] = {
>>                      (1 << MIDR_VARIANT_SHIFT) | 2),
>>       },
>>   #endif
>> +#ifdef CONFIG_ARM64_ERRATUM_1286807
>> +    {
>> +        /* Cortex-A76 r0p0 - r3p0 */
>> +        .desc = "ARM erratum 1286807",
>> +        .capability = ARM64_WORKAROUND_REPEAT_TLBI,
>> +        MIDR_RANGE(MIDR_CORTEX_A76, 0, 3 << MIDR_VARIANT_SHIFT),
>> +    },
>> +    {
>> +        /* Neoverse-N1 r0p0 - r3p0 */
>> +        .desc = "ARM erratum 1286807",
>> +        .capability = ARM64_WORKAROUND_REPEAT_TLBI,
>> +        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 3 << MIDR_VARIANT_SHIFT),
>> +    },
>> +#endif
>>   #ifdef CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR
>>       {
>>           .capability = ARM_HARDEN_BRANCH_PREDICTOR,
>> diff --git a/xen/include/asm-arm/arm64/flushtlb.h b/xen/include/asm-arm/arm64/flushtlb.h
>> index ceec59542e..6726362211 100644
>> --- a/xen/include/asm-arm/arm64/flushtlb.h
>> +++ b/xen/include/asm-arm/arm64/flushtlb.h
>> @@ -9,6 +9,11 @@
>>    * DSB ISH          // Ensure the TLB invalidation has completed
>>    * ISB              // See explanation below
>>    *
>> + * ARM64_WORKAROUND_REPEAT_TLBI:
>> + * Modification of the translation table for a virtual address might lead to
>> + * read-after-read ordering violation.
>> + * The workaround repeats TLBI+DSB operation.
>> + *
>>    * For Xen page-tables the ISB will discard any instructions fetched
>>    * from the old mappings.
>>    *
>> @@ -16,15 +21,21 @@
>>    * (and therefore the TLB invalidation) before continuing. So we know
>>    * the TLBs cannot contain an entry for a mapping we may have removed.
>>    */
>> -#define TLB_HELPER(name, tlbop) \
>> -static inline void name(void)   \
>> -{                               \
>> -    asm volatile(               \
>> -        "dsb  ishst;"           \
>> -        "tlbi "  # tlbop  ";"   \
>> -        "dsb  ish;"             \
>> -        "isb;"                  \
>> -        : : : "memory");        \
>> +#define TLB_HELPER(name, tlbop)       \
>> +static inline void name(void)         \
>> +{                                     \
>> +    asm volatile(                     \
>> +        "dsb  ishst;"                 \
>> +        "tlbi "  # tlbop  ";"         \
>> +        ALTERNATIVE(                  \
>> +        "nop; nop;",                  \
> 
> This is a bit difficult to read. I would suggest to indent the arguments of ALTERNITIVE() by an extra soft tab.
> 
>> +        "dsb  ish;"                   \
>> +        "tlbi "  # tlbop  ";",        \
>> +        ARM64_WORKAROUND_REPEAT_TLBI, \
>> +        CONFIG_ARM64_ERRATUM_1286807) \
> 
> I think it would be fine to have this code unconditionally built. But if you prefer to keep it conditionally, then I would suggest to introduce CONFIG_ARM64_WORKAROUND_REPEAT_TLBI and gate the ALTERNATIVE with it.
> 
> The new config would be selected by CONFIG_ARM64_ERRATUM_1286807. This will make easier for future workaround to use it (AFAICT there are other platforms require the same thing).
> 
> Cheers,
> 

