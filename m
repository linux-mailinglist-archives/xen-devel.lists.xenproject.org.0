Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960CC36E765
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 10:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119792.226469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2Q5-00012i-1h; Thu, 29 Apr 2021 08:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119792.226469; Thu, 29 Apr 2021 08:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2Q4-00012O-UO; Thu, 29 Apr 2021 08:53:12 +0000
Received: by outflank-mailman (input) for mailman id 119792;
 Thu, 29 Apr 2021 08:53:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Zyx=J2=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lc2Q2-00012J-HX
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 08:53:10 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bdacfc8e-9912-4a63-b629-628e5053aa53;
 Thu, 29 Apr 2021 08:53:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79C4D1FB;
 Thu, 29 Apr 2021 01:53:07 -0700 (PDT)
Received: from [10.57.1.124] (unknown [10.57.1.124])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F7833F73B;
 Thu, 29 Apr 2021 01:53:05 -0700 (PDT)
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
X-Inumbo-ID: bdacfc8e-9912-4a63-b629-628e5053aa53
Subject: Re: [PATCH v2 10/10] arm64: Change type of hsr, cpsr, spsr_el1 to
 uint64_t
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, bertrand.marquis@arm.com
References: <20210427093546.30703-1-michal.orzel@arm.com>
 <20210427093546.30703-11-michal.orzel@arm.com>
 <f414e061-7afa-d781-e6ae-e6293f29cd40@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <0c90579b-4861-8f90-2978-9e7f9015fae3@arm.com>
Date: Thu, 29 Apr 2021 10:53:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f414e061-7afa-d781-e6ae-e6293f29cd40@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 27.04.2021 13:09, Julien Grall wrote:
> Hi Michal,
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
>> Modify type of hsr, cpsr, spsr_el1 to uint64_t.
> 
> As I pointed out in v1, the access to SPSR_EL1 has been quite fragile because we relied on the padding afterwards. I think this was ought to be explain in the commit message because it explain why the access in the assembly code is not modified.
> 
How about:
"
Modify type of hsr, cpsr, spsr_el1 to uint64_t.
Previously we relied on the padding after SPSR_EL1. As we removed the padding, modify the union to be 64bit
so we don't corrupt SPSR_FIQ.
No need to modify the assembly code becuase the accesses were based on 64bit registers as there was a 32bit padding after SPSR_EL1.
"
>>
>> Add 32bit RES0 members to structures inside hsr union.
>>
>> Remove 32bit padding in cpu_user_regs before spsr_fiq
>> as it is no longer needed due to upper union being 64bit now.
>>
>> Add 64bit padding in cpu_user_regs before spsr_el1
>> because offset of spsr_el1 must be a multiple of 8.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
>> index 29d4531f40..fb4a3b1274 100644
>> --- a/xen/include/asm-arm/hsr.h
>> +++ b/xen/include/asm-arm/hsr.h
>> @@ -16,11 +16,12 @@ enum dabt_size {
>>   };
>>     union hsr {
>> -    uint32_t bits;
>> +    register_t bits;
>>       struct {
>>           unsigned long iss:25;  /* Instruction Specific Syndrome */
>>           unsigned long len:1;   /* Instruction length */
>>           unsigned long ec:6;    /* Exception Class */
>> +        unsigned long _res0:32;
> 
> Sorry I wasn't clear in my original comment, what I meant I would rather not add this field (and also the _res0) because they are not strictly necessary.
> 
Ok I'll remove _res0 members. But bits can be of type register_t, right?
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index 713fd65317..c49bce2983 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -267,10 +267,10 @@ struct vcpu_guest_core_regs
>>         /* Return address and mode */
>>       __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
>> -    uint32_t cpsr;                              /* SPSR_EL2 */
>> +    register_t cpsr;                            /* SPSR_EL2 */
> 
> You can't use register_t here because this is a public header (we don't export register_t) and the header should be bitness agnostic.
> 
> Also, because this is a public header, you ought to explain why breaking the ABI is fine.
> 
> In this case, this is an ABI between the tools and this is not stable. However, we would still need to bump XEN_DOMCTL_INTERFACE_VERSION as I think this wasn't done for this development cycle.
> 
> Of course, this will also need a suitable mention in the commit message (I can help with that).
> 
Ok so I'll increment XEN_DOMCTL_INTERFACE_VERSION and write in commit msg:
"
Change type of cpsr to uint64_t in the public outside interface "public/arch-arm.h" to allow ABI compatibility between 32bit and 64bit.
Increment XEN_DOMCTL_INTERFACE_VERSION.
"
>>         union {
>> -        uint32_t spsr_el1;       /* AArch64 */
>> +        uint64_t spsr_el1;       /* AArch64 */
>>           uint32_t spsr_svc;       /* AArch32 */
>>       };
>>   diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
>> index 36135ba4f1..ad3d141fe8 100644
>> --- a/xen/include/public/vm_event.h
>> +++ b/xen/include/public/vm_event.h
>> @@ -266,8 +266,12 @@ struct vm_event_regs_arm {
>>       uint64_t ttbr1;
>>       uint64_t ttbcr;
>>       uint64_t pc;
>> +#ifdef CONFIG_ARM_32
>>       uint32_t cpsr;
>>       uint32_t _pad;
>> +#else
>> +    uint64_t cpsr;
>> +#endif
> 
> CONFIG_ARM_32 is not defined for public header. They also should be bitness agnostic. So cpsr should always be uint64_t.
> 
> Also, similar to public/arch-arm.h, this is not a stable ABI but you will need to bump VM_EVENT_INTERFACE_VERSION if this hasn't been done for this development cycle.
> 
Ok so I will change type of cpsr here to uint64_t, increment VM_EVENT_INTERFACE_VERSION and write in commit msg:
"
Change type of cpsr to uint64_t in the public outside interface "public/vm_event.h" to allow ABI compatibility between 32bit and 64bit.
Increment VM_EVENT_INTERFACE_VERSION.
"
Ok?
> Cheers,
> 
Cheers,
Michal

