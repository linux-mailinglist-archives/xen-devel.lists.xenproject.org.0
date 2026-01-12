Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE798D12A7C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 13:59:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200238.1516224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfHW2-0004aN-0l; Mon, 12 Jan 2026 12:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200238.1516224; Mon, 12 Jan 2026 12:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfHW1-0004Y7-TB; Mon, 12 Jan 2026 12:59:25 +0000
Received: by outflank-mailman (input) for mailman id 1200238;
 Mon, 12 Jan 2026 12:59:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/6n=7R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfHW0-0004Xy-3s
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 12:59:24 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dc5ae35-efb6-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 13:59:12 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so1339890766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 04:59:12 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a27c760sm1967564466b.24.2026.01.12.04.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 04:59:11 -0800 (PST)
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
X-Inumbo-ID: 7dc5ae35-efb6-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768222752; x=1768827552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcLjaSDmt8zdixcAkv3iQEjuW1yWLXi7sYbeFkeBBK8=;
        b=Q7u71d0Nb+Rovqk+UZB9d7kIGyPkPLJEwt3vaU6a5osCzP0o+qZ/AgRPK7CRLeqZ6Y
         N/WRDy3YKUaSn6tbGEIvrAf/CI0n6+M55H/dn2ew5HPdhgBc8wDEibqAmsmEj6zgzMq1
         lBX65s6wIZWYHbpOmU6/ozVN2HgWVizcWZqGJdqqWt+5F5gXH0gCKYVkZque/G6fjaik
         obT4AKyOUAO5iEQ689qQC2NOvo4aF2u85/bwX1OzMqS9GSqyimmi4r3xKV1/FaGZRcpG
         eUDvPV14wuE4D4A13KA+R8Ex4e7+TDna7Mh3Jt25t5yxUXCFvxlUYjBY6cjkr0wB9XWv
         lqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222752; x=1768827552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcLjaSDmt8zdixcAkv3iQEjuW1yWLXi7sYbeFkeBBK8=;
        b=vR7YuduIB3WKfCbvkSCU25ctq0OezUkrygVm3CeIDKeZReCA5c7CJm/QO/FboJbdGm
         GwZEaqoTue5CydqopWomIV2NEY1kQBe/uDUHcsYcM2QhJ8j4A6WdlmCPuRSt+QEcG0Pz
         01vvzAZK02CDbU5SoVdA91hWa/gynu+3HyDTUW3OD3Gge3FqepJEskGytkZzQgBR/CQ1
         zA6pW0G9VF15OLrdXkeR7TFON3OiC5OpZzkAJcfSUOORwEpKum+DIIchdmcMrMmK+OS0
         WGikHH0BQfaBifxnliztjNrCekTCQmPCT+cqCpKfnF0RfpVdoYXxXyYWUCogP/g6XPYF
         psrA==
X-Forwarded-Encrypted: i=1; AJvYcCWE2vtnldGBkHiMok/ZnihNVKtnkBxebkPQTsS2V5KspuavofNLOYHTo+3glNak06HwtOxwsPwgf0w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygQ+D8L/OMAZHkBd72ghs/4W+tbwIubQWy02eNdpel6H67iWPY
	8HAOGzbW8HS2bXSjpeerSx3bZcx2fRYLHWioleRr+uk4sumbrTGEkoY4
X-Gm-Gg: AY/fxX4fLo5sEifHD1alJtVylR1hp9w9moMTAP4CLlFYEdjR1pL8M5Ozwp+GGdn9DaA
	4vVsF31QbXktB5Co0MARurZZFx0thBboUcNORucCVAnky4zg6r/E+XGvNDEVrpVh1jwk/VsS1pE
	7GsJQUcdsPrNyCIl7v/y7s8/A3iLyNFu/Gb+xajycyvtO06HMrCMlbid/LcegLzgZ665VzhoZrY
	5VZvhqMBCPgSFfJcideQ7YIOTwPkIbviY8s2CUYNCRU5epnhuU2zJ0ZluV0FYm6k4vC+RMH4BLv
	NxWiVLAi7Ez4hW4s+H14sCJYKRM2Eaua5AdwhHZAYviapJZj87wQCDCqvBj5LXCR38iCeq3qHdz
	CZeiGG8eyZpaaseM6e0yod6ucqKfqdg31+5cg+RBreE9LjEnRgqGFHgcHLe77qkycQgIXcBFXdG
	3YC8l6X92pf5XXDJWFncDDdr81C1hf1WbDXrevwAn4opntqVxa1n2WC++C8aIapmI=
X-Google-Smtp-Source: AGHT+IHTRMgeK+LK5effZyjh5DKTZshLCckLCGliGW9d0NZDvXw60JbQj237teQWc9zfv133lRMa+g==
X-Received: by 2002:a17:906:fe4c:b0:b73:826a:9102 with SMTP id a640c23a62f3a-b8444fd0a3dmr1775800666b.49.1768222751304;
        Mon, 12 Jan 2026 04:59:11 -0800 (PST)
Message-ID: <7ba4bcfe-59d3-43f3-adb4-207424dc1713@gmail.com>
Date: Mon, 12 Jan 2026 13:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/15] xen/riscv: implement vcpu_csr_init()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <bf617d77bb9e75bbd2930614bb86ff83b80adcfc.1766595589.git.oleksii.kurochko@gmail.com>
 <dc24a8ea-9041-4097-bbe2-459c668e9e64@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <dc24a8ea-9041-4097-bbe2-459c668e9e64@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/7/26 9:46 AM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> Implement function to initialize VCPU's CSR registers to delegate handling
>> of some traps to VS-mode ( guest ), enable vstimecmp for VS-mode, and
>> allow some AIA-related register (thier vs* copies ) for VS-mode.
> The henvcfg setting isn't covered here at all, unless I'm failing to make the
> respective association. Nor is the setting of SMSTATEEN0_HSENVCFG in hstateen0.
>
> Overall it feels like the description here is too terse anyway, as the bits
> set (or not) are a pretty crucial thing for running guests. Then again maybe
> this is just me, for not being a RISC-V person ...

I will add more details to commit message then.

>
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -3,6 +3,67 @@
>>   #include <xen/mm.h>
>>   #include <xen/sched.h>
>>   
>> +#include <asm/cpufeature.h>
>> +#include <asm/csr.h>
>> +#include <asm/riscv_encoding.h>
>> +
>> +static void vcpu_csr_init(struct vcpu *v)
>> +{
>> +    unsigned long hedeleg, hideleg, hstatus;
>> +
>> +    hedeleg = 0;
>> +    hedeleg |= (1U << CAUSE_MISALIGNED_FETCH);
>> +    hedeleg |= (1U << CAUSE_FETCH_ACCESS);
>> +    hedeleg |= (1U << CAUSE_ILLEGAL_INSTRUCTION);
>> +    hedeleg |= (1U << CAUSE_MISALIGNED_LOAD);
>> +    hedeleg |= (1U << CAUSE_LOAD_ACCESS);
>> +    hedeleg |= (1U << CAUSE_MISALIGNED_STORE);
>> +    hedeleg |= (1U << CAUSE_STORE_ACCESS);
>> +    hedeleg |= (1U << CAUSE_BREAKPOINT);
>> +    hedeleg |= (1U << CAUSE_USER_ECALL);
>> +    hedeleg |= (1U << CAUSE_FETCH_PAGE_FAULT);
>> +    hedeleg |= (1U << CAUSE_LOAD_PAGE_FAULT);
>> +    hedeleg |= (1U << CAUSE_STORE_PAGE_FAULT);
>> +    v->arch.hedeleg = hedeleg;
> Wouldn't you better start from setting all of the non-reserved bits, to then
> clear the few that you mean to not delegate?

Maybe that would be better, but I don’t see much difference, especially if we
use the following define:
  #define HEDELEG_DEFAULT ( BIT(CAUSE_MISALIGNED_FETCH, U) | ... )
It would still be just one instruction to write the value to|hedeleg|.
(I think the compiler will likely produce the same optimization with the
current implementation.)

> Then again I'm not quite sure
> whether the set of CAUSE_* in the header file is actually complete: MCAUSE
> also can hold the values 16, 18, and 19.

Then 14 and 17 could be added as well. I see the sense in adding 18 and 19,
since they are defined as "software check" and "hardware error." However,
I don’t see much value in providing|CAUSE_*| for 14 and 16–17, as they are
just reserved and have no specific meaning.

I could add something like|CAUSE_RES_14|,|CAUSE_RES_16|,|CAUSE_RES_17|, but
since we aren’t actually handling them, I think it’s fine to update|CAUSE_* |only when there is a real use for them, like with 18 and 19.

>   (Otoh you have CAUSE_MACHINE_ECALL,
> which I don't think can ever be observed outside of M-mode.)

Good point, It seems like you are right and M-ecall can't be observed outside of
M-mode and even more it is marked as read only 0 so it is not expected to be
delegated to lower privilige mode, but then I don't know why it was added to
"Table 29 Bits of hedeleg that must be writable or must be read-only zero.".

>
> Also, while it may seem to not matter much, sorting the above by their numeric
> values would ease comparison against the full set.

I will move "hedeleg |= (1U << CAUSE_BREAKPOINT);" up; all others seems are sorted
properly.

>
>> +    hstatus = HSTATUS_SPV | HSTATUS_SPVP;
>> +    v->arch.hstatus = hstatus;
> Why would these (or in fact any) bits need setting here?

It could be moved to continue_new_vcpu() where now (in downstream) I have:
         csr_write(CSR_HSTATUS, vcpu_guest_cpu_user_regs(current)->hstatus);
         reset_stack_and_jump(return_to_new_vcpu);
But I put it here to have vCPU state (all or as much as possible) initialized
in one place.

> Isn't hstatus written
> upon exit from guest context?

Setting these bits manually is necessary for the initial entry into
a guest context.
While it is true that hardware updates hstatus during a trap from a guest,
software must set these bits to define the destination state for the
subsequent SRET instruction.

When a hypervisor prepares to run a guest for the first time, there has been no
previous "exit" from that guest to automatically populate the CSRs. Setting these
bits is essential for the following reasons:
- Defining the target Virtualization Mode (SPV): The SPV bit is used by the SRET
   instruction to determine the new virtualization mode. If the hypervisor is in
   HS-mode (V=0) and executes SRET, the hardware sets the new V to the current
   value of hstatus.SPV. Without manually setting HSTATUS_SPV, the SRET would
   return the hart to V=0 instead of entering the guest (V=1).
- Defining the target Privilege Level (SPVP): The SPVP bit tracks the nominal
   privilege level (S or U) of the guest. When V=1, this determines if the guest
   is in VS-mode or VU-mode.
- Controlling Hypervisor Load/Store Instructions: SPVP specifically controls
   the effective privilege of explicit memory accesses made by hypervisor
   virtual-machine load/store instructions (HLV, HLVX, and HSV).
   If the hypervisor needs to use these instructions to access guest memory
   as if it were the guest supervisor, SPVP must be set to 1.
   But maybe there is no too much sense in this instructions before guest is
   ran.

>
>> +    hideleg = MIP_VSTIP |  MIP_VSEIP | MIP_VSSIP;
>> +    v->arch.hideleg = hideleg;
> Again I think having MIP_VSTIP in the middle (to establish numeric sorting)
> would be slightly better.
>
> Also there's a stray blank after the first |.
>
>> +    /*
>> +     * VS should access only the time counter directly.
>> +     * Everything else should trap.
>> +     */
>> +    v->arch.hcounteren |= HCOUNTEREN_TM;
> Why are this and ...
>
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
>> +        v->arch.henvcfg |= ENVCFG_PBMTE;
> ... this using |= but the earlier ones simply = ? Unless there is a specific
> reason, consistency is likely preferable.

This was overlooked during refactoring; it seems I simply used|=| instead of||=|.
The idea is that if it’s the first initialization,|=| should be used; otherwise,
for subsequent writes,||=| is used to avoid clearing previous values.
I will update this part to use the same pattern consistently throughout
this function.

>
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +    {
>> +        /*
>> +         * If the hypervisor extension is implemented, the same three bitsare
>> +         * defined also in hypervisor CSR hstateen0 but concern only the state
>> +         * potentially accessible to a virtual machine executing in privilege
>> +         * modes VS and VU:
>> +         *      bit 60 CSRs siselect and sireg (really vsiselect and vsireg)
>> +         *      bit 59 CSRs siph and sieh (RV32 only) and stopi (really vsiph,
>> +         *             vsieh, and vstopi)
>> +         *      bit 58 all state of IMSIC guest interrupt files, including CSR
>> +         *             stopei (really vstopei)
>> +         * If one of these bits is zero in hstateen0, and the same bit is one
>> +         * in mstateen0, then an attempt to access the corresponding state from
>> +         * VS or VU-mode raises a virtual instruction exception.
>> +        */
>> +        v->arch.hstateen0 = SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT;
> What is SVSLCT? Bit 60 is named CSRIND in the spec I'm looking at, and the
> commentary above looks to confirm this.

This is how OpenSBI called this bit from where riscv_encoding.h was taken.
SVSLCT stands for Supervisor Virtual Select, referring to the access control of the
siselect and vsiselect registers.

>
> Also, wouldn't you better keep internal state in line with what hardware
> actually supports? CSRIND may be read-only-zero in the real register, in
> which case having the bit set in the "cached" copy can be misleading.

According to the AIA spec:
   If extension Smstateen is implemented together with the Advanced Interrupt Architecture (AIA),
   three bits of state-enable register mstateen0 control access to AIA-added state from privilege modes
   less privileged than M-mode:
     bit 60 CSRs siselect, sireg, vsiselect, and vsireg
     bit 59 all other state added by the AIA and not controlled by bits 60 and 58
     bit 58 all IMSIC state, including CSRs stopei and vstopei
What I read as if Smstateen is supported then all the bits are supported by
hardware, and that is why it is enough to check if Smstateen is supported.

But I decided to check what KVM does in the similar case and it seems that I incorrectly read
the first line of the mentioned about AIA's spec and it is need another one if-condition:
	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
		if (riscv_isa_extension_available(isa, SSAIA))
			cfg->hstateen0 |= SMSTATEEN0_AIA_IMSIC |
					  SMSTATEEN0_AIA |
					  SMSTATEEN0_AIA_ISEL;
		if (riscv_isa_extension_available(isa, SMSTATEEN))
			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
	}

> (This may similarly apply to at least hedeleg and hideleg, btw.)

Regarding the previous bits, I can understand that it would be an issue:
if SSAIA isn’t supported, then it is incorrect to update the corresponding
bits of|hstateen0|.

However, I’m not really sure I understand what the issue is with|h{i,e}deleg|.
All writable bits there don’t depend on hardware support. Am I missing something?

>
> As to consistency: Further up you use local helper variables (for imo no real
> reason), when here you don't. Instead this line ends up being too long.

I will update the code to have consistency.

Thanks.

~ Oleksii


