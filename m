Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7832F32ED
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 15:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65709.116454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzKdp-0006Y6-1Q; Tue, 12 Jan 2021 14:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65709.116454; Tue, 12 Jan 2021 14:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzKdo-0006Xf-UH; Tue, 12 Jan 2021 14:27:24 +0000
Received: by outflank-mailman (input) for mailman id 65709;
 Tue, 12 Jan 2021 14:27:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kzKdn-0006XX-Dr
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 14:27:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzKdm-0005o4-44; Tue, 12 Jan 2021 14:27:22 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzKdl-00038n-KV; Tue, 12 Jan 2021 14:27:21 +0000
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
	bh=oXkjiw10nCRZJMGWLEi/hlYTEwmCUhbQvRWD20meyUQ=; b=QgkwbzNSL8gcGuu9zC+YApaOJj
	Hvxb4OAp1R3Qbe9xtUNCeffhway4Adrg/C7I+uij6LGtCsOdmqTWkfeAkiN9Ga/d1BnyfsycX7FFT
	UIyDZo+IJOgTy950Fps/NU2zXqaiBakpOBvu8TQ94gtG4jKjcZORMFBgnNZpHvvzctxM=;
Subject: Re: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210112001623.28421-1-sstabellini@kernel.org>
 <db6949f1-6b19-b1bb-9bec-8b56a2ad83a1@xen.org>
 <265E97F3-1AA1-4DE7-BA26-E208D953302A@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <278d0e56-830c-5730-69ab-abf6db851a8d@xen.org>
Date: Tue, 12 Jan 2021 14:27:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <265E97F3-1AA1-4DE7-BA26-E208D953302A@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 12/01/2021 13:28, Rahul Singh wrote:
> Hello Julien,

Hi Rahul,

> 
>> On 12 Jan 2021, at 11:00 am, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Stefano,
>>
>> On 12/01/2021 00:16, Stefano Stabellini wrote:
>>> Don't read aarch32 system registers at boot time when the aarch32 state
>>> is not available. They are UNKNOWN, so it is not useful to read them.
>>> Moreover, on Cavium ThunderX reading ID_PFR2_EL1 causes a Xen crash.
>>> Instead, only read them when aarch32 is available.
>> AArch32 may be supported in EL0 but not in EL1. So I think you want to clarify in the commit message/title which EL you are referring to.
>>
>>> Leave the corresponding fields in struct cpuinfo_arm so that they
>>> are read-as-zero from a guest.
>>> Since we are editing identify_cpu, also fix the indentation: 4 spaces
>>> instead of 8.
>>
>> I was going to ask to split that in a separate patch. But then, I noticed that it avoids to change the indentation of the if body twice. So I am ok with that.
>>
>>> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
>>> Link: https://marc.info/?l=xen-devel&m=161035501118086
>>
>> NIT: I would suggest to use lore.kernel.org just because the link contains the message-id. So if the website goes down, it is still possible to track the original discussion.
>>
>>> Link: http://logs.test-lab.xenproject.org/osstest/logs/158293/test-arm64-arm64-xl-xsm/info.html
>>
>> IIRC we only keep the logs around for a couple of weeks. So this is going to be break quickly. Therefore, I would suggest to remove this link.
>>
>>> Suggested-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> ---
>>>   xen/arch/arm/cpufeature.c | 35 +++++++++++++++++++++--------------
>>>   1 file changed, 21 insertions(+), 14 deletions(-)
>>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>>> index 698bfa0201..b1c82ade49 100644
>>> --- a/xen/arch/arm/cpufeature.c
>>> +++ b/xen/arch/arm/cpufeature.c
>>> @@ -101,29 +101,35 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_capabilities *caps)
>>>     void identify_cpu(struct cpuinfo_arm *c)
>>>   {
>>> -        c->midr.bits = READ_SYSREG(MIDR_EL1);
>>> -        c->mpidr.bits = READ_SYSREG(MPIDR_EL1);
>>> +    bool aarch32 = true;
>>> +
>>> +    c->midr.bits = READ_SYSREG(MIDR_EL1);
>>> +    c->mpidr.bits = READ_SYSREG(MPIDR_EL1);
>>>     #ifdef CONFIG_ARM_64
>>> -        c->pfr64.bits[0] = READ_SYSREG(ID_AA64PFR0_EL1);
>>> -        c->pfr64.bits[1] = READ_SYSREG(ID_AA64PFR1_EL1);
>>> +    c->pfr64.bits[0] = READ_SYSREG(ID_AA64PFR0_EL1);
>>> +    c->pfr64.bits[1] = READ_SYSREG(ID_AA64PFR1_EL1);
>>> +
>>> +    c->dbg64.bits[0] = READ_SYSREG(ID_AA64DFR0_EL1);
>>> +    c->dbg64.bits[1] = READ_SYSREG(ID_AA64DFR1_EL1);
>>>   -        c->dbg64.bits[0] = READ_SYSREG(ID_AA64DFR0_EL1);
>>> -        c->dbg64.bits[1] = READ_SYSREG(ID_AA64DFR1_EL1);
>>> +    c->aux64.bits[0] = READ_SYSREG(ID_AA64AFR0_EL1);
>>> +    c->aux64.bits[1] = READ_SYSREG(ID_AA64AFR1_EL1);
>>>   -        c->aux64.bits[0] = READ_SYSREG(ID_AA64AFR0_EL1);
>>> -        c->aux64.bits[1] = READ_SYSREG(ID_AA64AFR1_EL1);
>>> +    c->mm64.bits[0]  = READ_SYSREG(ID_AA64MMFR0_EL1);
>>> +    c->mm64.bits[1]  = READ_SYSREG(ID_AA64MMFR1_EL1);
>>> +    c->mm64.bits[2]  = READ_SYSREG(ID_AA64MMFR2_EL1);
>>>   -        c->mm64.bits[0]  = READ_SYSREG(ID_AA64MMFR0_EL1);
>>> -        c->mm64.bits[1]  = READ_SYSREG(ID_AA64MMFR1_EL1);
>>> -        c->mm64.bits[2]  = READ_SYSREG(ID_AA64MMFR2_EL1);
>>> +    c->isa64.bits[0] = READ_SYSREG(ID_AA64ISAR0_EL1);
>>> +    c->isa64.bits[1] = READ_SYSREG(ID_AA64ISAR1_EL1);
>>>   -        c->isa64.bits[0] = READ_SYSREG(ID_AA64ISAR0_EL1);
>>> -        c->isa64.bits[1] = READ_SYSREG(ID_AA64ISAR1_EL1);
>>> +    c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
>>>   -        c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
>>> +    aarch32 = c->pfr64.el1 == 2;
>>
>> This is checking that AArch32 is available in EL1. However, it may not be the case yet it would be available in EL0.
> 
> As per my understanding please correct me if I am wrong, if AArch32 is allowed at an EL, it must be allowed all lower Exception levels.

This statement is correct.

> 
> For example, if EL3 allows AArch32, then it must be allowed at all lower Exception levels.That means if we are checking the EL1 for AArch32 EL0 should also support AArch32.
> I think  "aarch32 = c->pfr64.el1 == 2” is correct to check.

I agree that if EL1 supports AArch32, then it means EL0 will not support.

However, if EL1 doesn't support AArch32, then it doesn't imply that EL0 
will not support AArch32.

Therefore, the check suggested would not be correct because it would 
prevent 32-bit userspace running on HW (such as IIRC Cortex-A76) that 
only support AArch32 in EL0.

Cheers,

-- 
Julien Grall

