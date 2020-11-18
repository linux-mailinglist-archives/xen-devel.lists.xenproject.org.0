Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAE52B76B2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 08:13:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29353.58683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfHe0-0004y2-0t; Wed, 18 Nov 2020 07:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29353.58683; Wed, 18 Nov 2020 07:12:43 +0000
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
	id 1kfHdz-0004xd-Tv; Wed, 18 Nov 2020 07:12:43 +0000
Received: by outflank-mailman (input) for mailman id 29353;
 Wed, 18 Nov 2020 07:12:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3RgB=EY=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1kfHdz-0004xY-AO
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 07:12:43 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a7a83d6f-1fd1-417e-83c5-9960a96d6108;
 Wed, 18 Nov 2020 07:12:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F32FF101E;
 Tue, 17 Nov 2020 23:12:40 -0800 (PST)
Received: from [10.57.22.240] (unknown [10.57.22.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A60523F70D;
 Tue, 17 Nov 2020 23:12:39 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RgB=EY=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
	id 1kfHdz-0004xY-AO
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 07:12:43 +0000
X-Inumbo-ID: a7a83d6f-1fd1-417e-83c5-9960a96d6108
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id a7a83d6f-1fd1-417e-83c5-9960a96d6108;
	Wed, 18 Nov 2020 07:12:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F32FF101E;
	Tue, 17 Nov 2020 23:12:40 -0800 (PST)
Received: from [10.57.22.240] (unknown [10.57.22.240])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A60523F70D;
	Tue, 17 Nov 2020 23:12:39 -0800 (PST)
Subject: Re: [PATCH v2] xen/arm: Add workaround for Cortex-A76/Neoverse-N1
 erratum #1286807
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20201116121140.26763-1-michal.orzel@arm.com>
 <c7475d91-c956-3e2c-4445-ef5c005ff465@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <d6d632b2-eba7-1746-d398-2bd539a51caf@arm.com>
Date: Wed, 18 Nov 2020 08:12:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c7475d91-c956-3e2c-4445-ef5c005ff465@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 17.11.2020 18:30, Julien Grall wrote:
> Hi Michal,
> 
> On 16/11/2020 12:11, Michal Orzel wrote:
>> On the affected Cortex-A76/Neoverse-N1 cores (r0p0 to r3p0),
>> if a virtual address for a cacheable mapping of a location is being
>> accessed by a core while another core is remapping the virtual
>> address to a new physical page using the recommended break-before-make
>> sequence, then under very rare circumstances TLBI+DSB completes before
>> a read using the translation being invalidated has been observed by
>> other observers. The workaround repeats the TLBI+DSB operation
>> for all the TLB flush operations on purpose.
> 
> Sorry for nitpicking, the commit message should contain enough information for future reader to understand why this was done "on purpose".
> 
> So how about:
> 
> "The workaround repeats the TLBI+DSB operation for all the TLB flush operations. While this is stricly not necessary, we don't want to take any risk.".
> 
> I can fix it on commit.
> 
Ok I agree to add this extra clarification.
Please go on and fix it on commit/etc.

Thanks,
Michal
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>   docs/misc/arm/silicon-errata.txt     |  2 ++
>>   xen/arch/arm/Kconfig                 | 23 +++++++++++++++++++++
>>   xen/arch/arm/cpuerrata.c             | 14 +++++++++++++
>>   xen/include/asm-arm/arm64/flushtlb.h | 30 +++++++++++++++++++---------
>>   xen/include/asm-arm/cpufeature.h     |  3 ++-
>>   5 files changed, 62 insertions(+), 10 deletions(-)
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
>> index f938dd21bd..8171b8d04a 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -244,6 +244,29 @@ config ARM_ERRATUM_858921
>>           If unsure, say Y.
>>   +config ARM64_WORKAROUND_REPEAT_TLBI
>> +    bool
>> +
>> +config ARM64_ERRATUM_1286807
>> +    bool "Cortex-A76/Neoverse-N1: 1286807: Modification of the translation table for a virtual address might lead to read-after-read ordering violation"
>> +    default y
>> +    select ARM64_WORKAROUND_REPEAT_TLBI
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
>> +      workaround repeats the TLBI+DSB operation for all the TLB flush
>> +      operations on purpose.
> If you agree with what I wrote above, I will update this section and ...
> 
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
>> index ceec59542e..8f2abfaf1d 100644
>> --- a/xen/include/asm-arm/arm64/flushtlb.h
>> +++ b/xen/include/asm-arm/arm64/flushtlb.h
>> @@ -9,6 +9,12 @@
>>    * DSB ISH          // Ensure the TLB invalidation has completed
>>    * ISB              // See explanation below
>>    *
>> + * ARM64_WORKAROUND_REPEAT_TLBI:
>> + * Modification of the translation table for a virtual address might lead to
>> + * read-after-read ordering violation.
>> + * The workaround repeats TLBI+DSB operation for all the TLB flush operations
>> + * on purpose.
> 
> ... this section while committing.
> 
> Cheers,
> 

