Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF395985C6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389632.626691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgYZ-0001ST-Se; Thu, 18 Aug 2022 14:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389632.626691; Thu, 18 Aug 2022 14:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgYZ-0001Pm-Pb; Thu, 18 Aug 2022 14:31:35 +0000
Received: by outflank-mailman (input) for mailman id 389632;
 Thu, 18 Aug 2022 14:31:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOgYY-0001Pc-TQ
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:31:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOgYX-00017o-Sp; Thu, 18 Aug 2022 14:31:33 +0000
Received: from [54.239.6.188] (helo=[192.168.18.101])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOgYX-0006tJ-MN; Thu, 18 Aug 2022 14:31:33 +0000
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
	bh=qFI1CNIftCpOWj4cTOHBHq48hhWLaNj1J594H/rd6bM=; b=7IONU/lTHvwp1aNc0QEGdbx9Av
	gOb/xvy0ABop5DH2ahJV9YQy6RVM/XLvtBkFthWODVZb4dxbYwbAAInH64Tul8yWwfF1b5GMSXA/d
	Q2gkzP5aw3q+iXLNx4GWg2SmslOydSX6A7M5WFUj/vJg/pjjQ7Tz7YV+/W4L7qpT4/t4=;
Message-ID: <4613f385-b11e-6d4f-42df-2febac4440d1@xen.org>
Date: Thu, 18 Aug 2022 15:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v5 1/9] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
 <20220818105601.1896082-2-jens.wiklander@linaro.org>
 <EC23C48B-C9ED-4BD0-BD6D-4967A2509B2B@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <EC23C48B-C9ED-4BD0-BD6D-4967A2509B2B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 18/08/2022 14:44, Bertrand Marquis wrote:
>> On 18 Aug 2022, at 11:55, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>
>> SMCCC v1.2 [1] AArch64 allows x0-x17 to be used as both parameter
>> registers and result registers for the SMC and HVC instructions.
>>
>> Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
>> parameter and result registers.
>>
>> Let us add new interface to support this extended set of input/output
>> registers.
>>
>> This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
>> extended input/output registers") by Sudeep Holla from the Linux kernel
>>
>> The SMCCC version reported to the VM is bumped to 1.2 in order to support
>> handling FF-A messages.
> 
> With this patch, you add something so that you could call SMCCCv1.2 but in practice you are not using it anywhere.
> I do not think this patch should bump the version we present to guests.

IMHO, this is better to add it here rather than in a FFA specific patch. 
Otherwise, one could raise the question of why we are adding wrapper 
when they are not used?

> 
>>
>> [1] https://developer.arm.com/documentation/den0028/c/?lang=en
>>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>> ---
>> xen/arch/arm/arm64/asm-offsets.c |  9 +++++++
>> xen/arch/arm/arm64/smc.S         | 43 ++++++++++++++++++++++++++++++++
>> xen/arch/arm/include/asm/smccc.h | 40 +++++++++++++++++++++++++++++
>> xen/arch/arm/vsmc.c              |  2 +-
>> 4 files changed, 93 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
>> index 280ddb55bfd4..1721e1ed26e1 100644
>> --- a/xen/arch/arm/arm64/asm-offsets.c
>> +++ b/xen/arch/arm/arm64/asm-offsets.c
>> @@ -56,6 +56,15 @@ void __dummy__(void)
>>     BLANK();
>>     OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
>>     OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
>> +   OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs, a0);
>> +   OFFSET(ARM_SMCCC_1_2_REGS_X2_OFFS, struct arm_smccc_1_2_regs, a2);
>> +   OFFSET(ARM_SMCCC_1_2_REGS_X4_OFFS, struct arm_smccc_1_2_regs, a4);
>> +   OFFSET(ARM_SMCCC_1_2_REGS_X6_OFFS, struct arm_smccc_1_2_regs, a6);
>> +   OFFSET(ARM_SMCCC_1_2_REGS_X8_OFFS, struct arm_smccc_1_2_regs, a8);
>> +   OFFSET(ARM_SMCCC_1_2_REGS_X10_OFFS, struct arm_smccc_1_2_regs, a10);
>> +   OFFSET(ARM_SMCCC_1_2_REGS_X12_OFFS, struct arm_smccc_1_2_regs, a12);
>> +   OFFSET(ARM_SMCCC_1_2_REGS_X14_OFFS, struct arm_smccc_1_2_regs, a14);
>> +   OFFSET(ARM_SMCCC_1_2_REGS_X16_OFFS, struct arm_smccc_1_2_regs, a16);
>> }
>>
>> /*
>> diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
>> index 91bae62dd4d2..c546192e7f2d 100644
>> --- a/xen/arch/arm/arm64/smc.S
>> +++ b/xen/arch/arm/arm64/smc.S
>> @@ -27,3 +27,46 @@ ENTRY(__arm_smccc_1_0_smc)
>>          stp     x2, x3, [x4, #SMCCC_RES_a2]
>> 1:
>>          ret
>> +
>> +
> 
> Please only add one line only here
> 
>> +/*
>> + * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
>> + *                        struct arm_smccc_1_2_regs *res)
>> + */
>> +ENTRY(arm_smccc_1_2_smc)
>> +    /* Save `res` and free a GPR that won't be clobbered */
> 
> The comment here should be fixed, you are clobbering x19 hence you need to save it.

The comment is correct. x19 is one of the few registers that will not be 
clobbered by the SMC call. But we still need a register below to store 
'args', so we need to free it (what you call clobber).

> 
>> +    stp     x1, x19, [sp, #-16]!
>> +
>> +    /* Ensure `args` won't be clobbered while loading regs in next step */
>> +    mov	x19, x0
> 
> You do not need to save args (and no code is restoring it).

The next instruction will overwrite x0. So if you don't save 'x0' to 
'x19' then you will not be able to load the rest of the registers.

> 
>> +
>> +    /* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
>> +    ldp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
>> +    ldp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
>> +    ldp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
>> +    ldp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
>> +    ldp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
>> +    ldp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
>> +    ldp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
>> +    ldp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
>> +    ldp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
>> +
>> +    smc #0
>> +
>> +    /* Load the `res` from the stack */
>> +    ldr	x19, [sp]
>> +
>> +    /* Store the registers x0 - x17 into the result structure */
>> +    stp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
>> +    stp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
>> +    stp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
>> +    stp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
>> +    stp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
>> +    stp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
>> +    stp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
>> +    stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
>> +    stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
>> +
>> +    /* Restore original x19 */
>> +    ldp     xzr, x19, [sp], #16
> 
> You should use ldr and just load x19 value here.

AFAIU, this would mean an extra instruction to increment sp by 8 
(covering the xzr register).

Cheers,

-- 
Julien Grall

