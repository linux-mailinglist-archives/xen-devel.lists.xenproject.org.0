Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0BC2F2F54
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 13:47:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65670.116377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzJ4L-0005Dg-H8; Tue, 12 Jan 2021 12:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65670.116377; Tue, 12 Jan 2021 12:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzJ4L-0005DH-Di; Tue, 12 Jan 2021 12:46:41 +0000
Received: by outflank-mailman (input) for mailman id 65670;
 Tue, 12 Jan 2021 12:46:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kzJ4J-0005DC-Qm
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 12:46:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzJ4I-00043o-Lv; Tue, 12 Jan 2021 12:46:38 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzJ4I-00058s-FW; Tue, 12 Jan 2021 12:46:38 +0000
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
	bh=S83t/QpAw0pJKCGM282xck/CpUXP8hWg9erKLVcD/oQ=; b=FjsovrfxsINSw8dZW1itH3DnY5
	CRl03bdHb2w5jeScid3bKendKTwbcRxHM62Vn4ZSCsijnBjEx7agYZwIGkE2wONZ8WGBUVHMPqZgU
	AvgEyEgdpr9AldQjN1gzEZ8i/aj0wPVEEr5+9PjR7AaJLrdAJRNNsFSIOwXfNLuZdfpI=;
Subject: Re: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210112001623.28421-1-sstabellini@kernel.org>
 <05DC1229-9A51-421F-8BBB-73D719CD0F93@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <acc5c206-ae0c-8671-beae-c890c50f04ca@xen.org>
Date: Tue, 12 Jan 2021 12:46:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <05DC1229-9A51-421F-8BBB-73D719CD0F93@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 12/01/2021 10:50, Bertrand Marquis wrote:
> Hi Stefano,
> 
>> On 12 Jan 2021, at 00:16, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> Don't read aarch32 system registers at boot time when the aarch32 state
>> is not available. They are UNKNOWN, so it is not useful to read them.
>> Moreover, on Cavium ThunderX reading ID_PFR2_EL1 causes a Xen crash.
>> Instead, only read them when aarch32 is available.
>>
>> Leave the corresponding fields in struct cpuinfo_arm so that they
>> are read-as-zero from a guest.
> 
> I agree with the fact that all users of identify_cpu are currently using spaces
> which are 0 but to make the core a bit more robust we could do a memset(0)
> of the structure at the beginning of the function.
> 
>>
>> Since we are editing identify_cpu, also fix the indentation: 4 spaces
>> instead of 8.
>>
>> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
>> Link: https://marc.info/?l=xen-devel&m=161035501118086
>> Link: http://logs.test-lab.xenproject.org/osstest/logs/158293/test-arm64-arm64-xl-xsm/info.html
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> ---
>> xen/arch/arm/cpufeature.c | 35 +++++++++++++++++++++--------------
>> 1 file changed, 21 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index 698bfa0201..b1c82ade49 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -101,29 +101,35 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_capabilities *caps)
>>
>> void identify_cpu(struct cpuinfo_arm *c)
>> {
>> -        c->midr.bits = READ_SYSREG(MIDR_EL1);
>> -        c->mpidr.bits = READ_SYSREG(MPIDR_EL1);
>> +    bool aarch32 = true;
>> +
>> +    c->midr.bits = READ_SYSREG(MIDR_EL1);
>> +    c->mpidr.bits = READ_SYSREG(MPIDR_EL1);
>>
>> #ifdef CONFIG_ARM_64
>> -        c->pfr64.bits[0] = READ_SYSREG(ID_AA64PFR0_EL1);
>> -        c->pfr64.bits[1] = READ_SYSREG(ID_AA64PFR1_EL1);
>> +    c->pfr64.bits[0] = READ_SYSREG(ID_AA64PFR0_EL1);
>> +    c->pfr64.bits[1] = READ_SYSREG(ID_AA64PFR1_EL1);
>> +
>> +    c->dbg64.bits[0] = READ_SYSREG(ID_AA64DFR0_EL1);
>> +    c->dbg64.bits[1] = READ_SYSREG(ID_AA64DFR1_EL1);
>>
>> -        c->dbg64.bits[0] = READ_SYSREG(ID_AA64DFR0_EL1);
>> -        c->dbg64.bits[1] = READ_SYSREG(ID_AA64DFR1_EL1);
>> +    c->aux64.bits[0] = READ_SYSREG(ID_AA64AFR0_EL1);
>> +    c->aux64.bits[1] = READ_SYSREG(ID_AA64AFR1_EL1);
>>
>> -        c->aux64.bits[0] = READ_SYSREG(ID_AA64AFR0_EL1);
>> -        c->aux64.bits[1] = READ_SYSREG(ID_AA64AFR1_EL1);
>> +    c->mm64.bits[0]  = READ_SYSREG(ID_AA64MMFR0_EL1);
>> +    c->mm64.bits[1]  = READ_SYSREG(ID_AA64MMFR1_EL1);
>> +    c->mm64.bits[2]  = READ_SYSREG(ID_AA64MMFR2_EL1);
>>
>> -        c->mm64.bits[0]  = READ_SYSREG(ID_AA64MMFR0_EL1);
>> -        c->mm64.bits[1]  = READ_SYSREG(ID_AA64MMFR1_EL1);
>> -        c->mm64.bits[2]  = READ_SYSREG(ID_AA64MMFR2_EL1);
>> +    c->isa64.bits[0] = READ_SYSREG(ID_AA64ISAR0_EL1);
>> +    c->isa64.bits[1] = READ_SYSREG(ID_AA64ISAR1_EL1);
>>
>> -        c->isa64.bits[0] = READ_SYSREG(ID_AA64ISAR0_EL1);
>> -        c->isa64.bits[1] = READ_SYSREG(ID_AA64ISAR1_EL1);
>> +    c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
>>
>> -        c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
>> +    aarch32 = c->pfr64.el1 == 2;
> 
> I would put some () around the test.
> 
>> #endif
>>
>> +    if ( aarch32 )
>> +    {
>>          c->pfr32.bits[0] = READ_SYSREG(ID_PFR0_EL1);
>>          c->pfr32.bits[1] = READ_SYSREG(ID_PFR1_EL1);
>>          c->pfr32.bits[2] = READ_SYSREG(ID_PFR2_EL1);
>> @@ -153,6 +159,7 @@ void identify_cpu(struct cpuinfo_arm *c)
>> #ifndef MVFR2_MAYBE_UNDEFINED
>>          c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
>> #endif
> 
> If we test for aarch32, the ifndef here should not be needed anymore.
>  > Is your previous patch really still needed if we go with the aarch32 
path ?

There were two undefs discovered:
    1) On Armv7 when accessing MVFR2_EL1
    2) On Cavium Thunder-X (Armv8) when accessing ID_PFR2_EL1

If you remove the #ifdef, then you will re-introduce the UNDEF on Armv7.

Cheers,

-- 
Julien Grall

