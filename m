Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B23BA90C
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 16:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149514.276515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzgqi-000345-MI; Sat, 03 Jul 2021 14:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149514.276515; Sat, 03 Jul 2021 14:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzgqi-00032B-J9; Sat, 03 Jul 2021 14:42:28 +0000
Received: by outflank-mailman (input) for mailman id 149514;
 Sat, 03 Jul 2021 14:42:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzgqh-000325-JD
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 14:42:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzgqZ-0004aN-49; Sat, 03 Jul 2021 14:42:19 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzgqY-0006IK-Sp; Sat, 03 Jul 2021 14:42:19 +0000
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
	bh=GmGfj4CP4QhiHxEv9OGxje+2tXPZSSTOYjEoiJtqazA=; b=QQHcl4/apn4T/UBYefJVqgACSS
	lEz+3Zwrs7wA6fxFbJWMDvDW+9QBV7R0/kWZXVi8JKtSmoZ0T48WwWSMUkyLJwQbklYbPYZAIYYcu
	sY1H4IU3pGOEUgiEssRUfpk0RLd6KztJLh8qZoW6PKoXmAD2idPVZfCeqXhUfkstbRLY=;
Subject: Re: [PATCH v3 10/10] arm64: Change type of hsr, cpsr, spsr_el1 to
 uint64_t
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20210505074308.11016-1-michal.orzel@arm.com>
 <20210505074308.11016-11-michal.orzel@arm.com>
 <d3fa0269-3779-c893-8adb-4db0e22f28c1@xen.org>
 <9bc0a398-8920-3a95-1bb4-f32e8753972b@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dc976871-f7ce-9f53-e59c-bafbec8c77db@xen.org>
Date: Sat, 3 Jul 2021 15:42:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9bc0a398-8920-3a95-1bb4-f32e8753972b@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 01/07/2021 09:19, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 07.06.2021 15:31, Julien Grall wrote:
>> Hi,
>>
>> On 05/05/2021 08:43, Michal Orzel wrote:
>>> AArch64 registers are 64bit whereas AArch32 registers
>>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>>> we should get rid of helpers READ/WRITE_SYSREG32
>>> in favour of using READ/WRITE_SYSREG.
>>> We should also use register_t type when reading sysregs
>>> which can correspond to uint64_t or uint32_t.
>>> Even though many AArch64 registers have upper 32bit reserved
>>> it does not mean that they can't be widen in the future.
>>>
>>> Modify type of hsr, cpsr, spsr_el1 to uint64_t.
>>> Previously we relied on the padding after SPSR_EL1.
>>> As we removed the padding, modify the union to be 64bit so we don't corrupt SPSR_FIQ.
>>> No need to modify the assembly code becuase the accesses were based on 64bit
>>
>> s/becuase/because/
>>
> Will do.
>>> registers as there was a 32bit padding after SPSR_EL1.
>>>
>>> Remove 32bit padding in cpu_user_regs before spsr_fiq
>>> as it is no longer needed due to upper union being 64bit now.
>>> Add 64bit padding in cpu_user_regs before spsr_el1
>>> because offset of spsr_el1 must be a multiple of 8.
>>>
>>> Change type of cpsr to uint64_t in the public outside interface
>>> "public/arch-arm.h" to allow ABI compatibility between 32bit and 64bit.
>>> Increment XEN_DOMCTL_INTERFACE_VERSION.
>>>
>>> Change type of cpsr to uint64_t in the public outside interface
>>> "public/vm_event.h" to allow ABI compatibility between 32bit and 64bit.
>> [...]
>>
>>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>> index e7384381cc..c8f9773566 100644
>>> --- a/xen/arch/arm/traps.c
>>> +++ b/xen/arch/arm/traps.c
>>> @@ -546,7 +546,7 @@ void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len)
>>>            PSR_IRQ_MASK | PSR_DBG_MASK;
>>>        regs->pc = handler;
>>>    -    WRITE_SYSREG32(esr.bits, ESR_EL1);
>>> +    WRITE_SYSREG(esr.bits, ESR_EL1);
>>>    }
>>>      /* Inject an abort exception into a 64 bit guest */
>>> @@ -580,7 +580,7 @@ static void inject_abt64_exception(struct cpu_user_regs *regs,
>>>        regs->pc = handler;
>>>          WRITE_SYSREG(addr, FAR_EL1);
>>> -    WRITE_SYSREG32(esr.bits, ESR_EL1);
>>> +    WRITE_SYSREG(esr.bits, ESR_EL1);
>>>    }
>>>      static void inject_dabt64_exception(struct cpu_user_regs *regs,
>>> @@ -717,7 +717,7 @@ struct reg_ctxt {
>>>        uint64_t vttbr_el2;
>>>    };
>>>    -static const char *mode_string(uint32_t cpsr)
>>> +static const char *mode_string(register_t cpsr)
>>>    {
>>>        uint32_t mode;
>>>        static const char *mode_strings[] = {
>>> @@ -756,14 +756,16 @@ static void show_registers_32(const struct cpu_user_regs *regs,
>>>    #ifdef CONFIG_ARM_64
>>>        BUG_ON( ! (regs->cpsr & PSR_MODE_BIT) );
>>>        printk("PC:     %08"PRIx32"\n", regs->pc32);
>>> +    printk("CPSR:   %016"PRIx64" MODE:%s\n", regs->cpsr,
>>> +           mode_string(regs->cpsr));
>> Why do you now need to duplicate this line? Can't we use PRIregister you did everywhere else a register is printed?
>>
> Indeed we do not need. It was needed at the beginning but I do not remember why. I will fix it.
>>>    #else
>>>        printk("PC:     %08"PRIx32, regs->pc);
>>>        if ( !guest_mode )
>>>            printk(" %pS", _p(regs->pc));
>>>        printk("\n");
>>> -#endif
>>>        printk("CPSR:   %08"PRIx32" MODE:%s\n", regs->cpsr,
>>>               mode_string(regs->cpsr));
>>> +#endif
>>
>> [...]
>>
>>> diff --git a/xen/include/asm-arm/arm64/processor.h b/xen/include/asm-arm/arm64/processor.h
>>> index 81dfc5e615..0e86079cbb 100644
>>> --- a/xen/include/asm-arm/arm64/processor.h
>>> +++ b/xen/include/asm-arm/arm64/processor.h
>>> @@ -63,18 +63,19 @@ struct cpu_user_regs
>>>          /* Return address and mode */
>>>        __DECL_REG(pc,           pc32);             /* ELR_EL2 */
>>> -    uint32_t cpsr;                              /* SPSR_EL2 */
>>> -    uint32_t hsr;                               /* ESR_EL2 */
>>> +    uint64_t cpsr;                              /* SPSR_EL2 */
>>> +    uint64_t hsr;                               /* ESR_EL2 */
>>> +
>>> +    /* Offset of spsr_el1 must be a multiple of 8 */
>>
>> I am guessing you are saying it should be 8-byte aligned, right? If so, the field before is a 64-bit value, therefore the offset should already be a multiple of 8. Did I miss anything?
>>
> Well, instead of 8 I should write 16.
> We have 2 bug_on checks:
> 1) BUILD_BUG_ON((sizeof (struct cpu_user_regs)) & 0xf);
> 2) BUILD_BUG_ON((offsetof(struct cpu_user_regs, spsr_el1)) & 0xf);
> 
> Total size of cpu_user_regs without padding is 344 which does not pass the first check.
> With the padding it is 352 and it passes the first check.
> 
> The offset without padding is 280 which does not pass the second check.
> The offset with padding is 288 which passes the second check.

Ah yes, I forgot that the stack should always be 16-byte aligned.

> 
> So I should write:
> "/* Offset of spsr_el1 must be a multiple of 16 bytes */"
I would suggest the following comment:

/* The kernel frame should be 16-byte aligned. */

So this would make clear that the 16-byte requirement is for the frame 
itself.

Cheers,

-- 
Julien Grall

