Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5D0367FC9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 13:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115322.219937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXoI-0000pS-AR; Thu, 22 Apr 2021 11:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115322.219937; Thu, 22 Apr 2021 11:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXoI-0000p3-7K; Thu, 22 Apr 2021 11:47:54 +0000
Received: by outflank-mailman (input) for mailman id 115322;
 Thu, 22 Apr 2021 11:47:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21uR=JT=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lZXoH-0000oy-7o
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 11:47:53 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d8cb1487-332a-484c-b01d-3e1906bb3109;
 Thu, 22 Apr 2021 11:47:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4FAD13A1;
 Thu, 22 Apr 2021 04:47:50 -0700 (PDT)
Received: from [10.57.23.240] (unknown [10.57.23.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 921A73F774;
 Thu, 22 Apr 2021 04:47:49 -0700 (PDT)
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
X-Inumbo-ID: d8cb1487-332a-484c-b01d-3e1906bb3109
Subject: Re: [PATCH 5/9] arm/mm: Get rid of READ/WRITE_SYSREG32
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-6-michal.orzel@arm.com>
 <32bfa7d7-33cb-0deb-32bb-fa7d2052e0d9@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <3cee323f-7273-094f-150f-8f790a347d87@arm.com>
Date: Thu, 22 Apr 2021 13:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <32bfa7d7-33cb-0deb-32bb-fa7d2052e0d9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 20.04.2021 15:37, Julien Grall wrote:
> Hi Michal,
> 
> On 20/04/2021 08:08, Michal Orzel wrote:
>> AArch64 system registers are 64bit whereas AArch32 ones
>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>> we should get rid of helpers READ/WRITE_SYSREG32
>> in favour of using READ/WRITE_SYSREG.
>> We should also use register_t type when reading sysregs
>> which can correspond to uint64_t or uint32_t.
>> Even though many AArch64 sysregs have upper 32bit reserved
>> it does not mean that they can't be widen in the future.
>>
>> Modify SCTLR_EL2 accesses to use READ/WRITE_SYSREG.
> 
> SCTLR_EL2 already has bits defined in the range [32:63]. So this change is going to have a side effect as AFAICT head.S will not touch those bits. So they are now going to be preserved.
> 
> The Arm Arm defines them as unknown if implemented. Therefore shouldn't we zero them somewhere else?
> 
SCTLR_EL2 is set in head.S using SCTLR_EL2_SET which means that we are zeroing the upper 32bit half.

> In any case, I think the commit message ought to contain an analysis for system registers that happened to have bits defined in the range [32:63].
> 
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
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
>>       printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
>>       printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
>>       printk("\n");
>>
> 
> Cheers,
> 

Cheers,
Michal

