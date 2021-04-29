Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E425336E5C3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 09:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119765.226429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc0uj-0000FM-2p; Thu, 29 Apr 2021 07:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119765.226429; Thu, 29 Apr 2021 07:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc0ui-0000Ex-Vc; Thu, 29 Apr 2021 07:16:44 +0000
Received: by outflank-mailman (input) for mailman id 119765;
 Thu, 29 Apr 2021 07:16:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Zyx=J2=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lc0ui-0000Er-57
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 07:16:44 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a2771862-c108-4ab4-b06c-17cc1c38aae8;
 Thu, 29 Apr 2021 07:16:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2598531B;
 Thu, 29 Apr 2021 00:16:43 -0700 (PDT)
Received: from [10.57.1.124] (unknown [10.57.1.124])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 340663F73B;
 Thu, 29 Apr 2021 00:16:42 -0700 (PDT)
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
X-Inumbo-ID: a2771862-c108-4ab4-b06c-17cc1c38aae8
Subject: Re: [PATCH v2 07/10] arm/mm: Get rid of READ/WRITE_SYSREG32
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210427093546.30703-1-michal.orzel@arm.com>
 <20210427093546.30703-8-michal.orzel@arm.com>
 <04adaf9b-e2fe-460e-35e4-09e5e5ff7b6f@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <00f462b7-c5db-5228-cad2-13c4b6e82c6e@arm.com>
Date: Thu, 29 Apr 2021 09:16:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <04adaf9b-e2fe-460e-35e4-09e5e5ff7b6f@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 27.04.2021 11:59, Julien Grall wrote:
> 
> 
> On 27/04/2021 10:35, Michal Orzel wrote:
>> AArch64 registers are 64bit whereas AArch32 registers
>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>> we should get rid of helpers READ/WRITE_SYSREG32
>> in favour of using READ/WRITE_SYSREG.
>> We should also use register_t type when reading sysregs
>> which can correspond to uint64_t or uint32_t.
>> Even though many AArch64 registers have upper 32bit reserved
>> it does not mean that they can't be widen in the future.
>>
>> Modify SCTLR_EL2 accesses to use READ/WRITE_SYSREG.
>>
>> SCTLR_EL2 already has bits defined in the range [32:63].
>> The ARM ARM defines them as unknown if implemented.
> 
> This is a bit ambiguous.
> 
>> By writing in head.S SCTLR_EL2_SET we are zeroing the upper
>> 32bit half which is correct but referring to this sysreg
>> as 32bit is a latent bug because the top 32bit was not used
>> by Xen.
> 
> This seems to suggest the patch below will call SCTLR_EL2_SET whereas this is already existing code.
> 
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>> Changes since v1:
>> -Update commit message with SCTLR_EL2 analysis
>> ---
>>   xen/arch/arm/mm.c    | 2 +-
>>   xen/arch/arm/traps.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 59f8a3f15f..0e07335291 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -613,7 +613,7 @@ void __init remove_early_mappings(void)
>>    */
>>   static void xen_pt_enforce_wnx(void)
>>   {
>> -    WRITE_SYSREG32(READ_SYSREG32(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
>> +    WRITE_SYSREG(READ_SYSREG(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
>>       /*
>>        * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
>>        * before flushing the TLBs.
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index c7acdb2087..e7384381cc 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -915,7 +915,7 @@ static void _show_registers(const struct cpu_user_regs *regs,
>>       printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
>>       printk("\n");
>>   -    printk(" SCTLR_EL2: %08"PRIx32"\n", READ_SYSREG32(SCTLR_EL2));
>> +    printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
> 
> Your commit title suggests that you will modify mm.c but you are also modifying traps.c. So how about the following commit message:
> 
> "
> xen/arm: Always access SCTLR_EL2 using {READ, WRITE}_SYSREG()
> 
> The Armv8 specification describes the system register as a 64-bit value on AArch64 and 32-bit value on AArch32 (same as Armv7).
> 
> Unfortunately, Xen is accessing the system registers using {READ, WRITE}_SYSREG32() which means the top 32-bit are clobbered.
> 
> This is only a latent bug so far because Xen will not yet use the top 32-bit.
> 
> There is also no change in behavior because arch/arm/arm64/head.S will initialize SCTLR_EL2 to a sane value with the top 32-bit zeroed.
> "
> 
Thank you. I will modify the commit msg according to what you suggested.
> Cheers,
> 

