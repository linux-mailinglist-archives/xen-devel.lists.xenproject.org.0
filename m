Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF922F2D54
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 12:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65598.116245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHQ0-0003WM-G0; Tue, 12 Jan 2021 11:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65598.116245; Tue, 12 Jan 2021 11:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHQ0-0003Vv-BF; Tue, 12 Jan 2021 11:00:56 +0000
Received: by outflank-mailman (input) for mailman id 65598;
 Tue, 12 Jan 2021 11:00:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kzHPy-0003Vo-EW
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 11:00:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzHPx-0002HX-8l; Tue, 12 Jan 2021 11:00:53 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzHPw-00072U-SF; Tue, 12 Jan 2021 11:00:53 +0000
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
	bh=PPZGDOQ2u8TkP1CfnuAQX1FJAbNSWsDvOn3pR5vjrcY=; b=B7zg1KbZAoRJ26mMAv+I7//9Nf
	kl2Td9AKH00xT4uoujMR/fe0cZxAD+2/iEComVz2C5tNisk7JO/wFY0dxH2IcY7dES4tNIVSwJs/P
	xKc5e064J4w0SqVGpIAqn8dLUFBaOFfL9op0kzVyz6U0U2ekcwCsN0sy5OgJM8oA9FAw=;
Subject: Re: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210112001623.28421-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <db6949f1-6b19-b1bb-9bec-8b56a2ad83a1@xen.org>
Date: Tue, 12 Jan 2021 11:00:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112001623.28421-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 12/01/2021 00:16, Stefano Stabellini wrote:
> Don't read aarch32 system registers at boot time when the aarch32 state
> is not available. They are UNKNOWN, so it is not useful to read them.
> Moreover, on Cavium ThunderX reading ID_PFR2_EL1 causes a Xen crash.
> Instead, only read them when aarch32 is available.
AArch32 may be supported in EL0 but not in EL1. So I think you want to 
clarify in the commit message/title which EL you are referring to.

> 
> Leave the corresponding fields in struct cpuinfo_arm so that they
> are read-as-zero from a guest.
> 
> Since we are editing identify_cpu, also fix the indentation: 4 spaces
> instead of 8.

I was going to ask to split that in a separate patch. But then, I 
noticed that it avoids to change the indentation of the if body twice. 
So I am ok with that.

> 
> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
> Link: https://marc.info/?l=xen-devel&m=161035501118086

NIT: I would suggest to use lore.kernel.org just because the link 
contains the message-id. So if the website goes down, it is still 
possible to track the original discussion.

> Link: http://logs.test-lab.xenproject.org/osstest/logs/158293/test-arm64-arm64-xl-xsm/info.html

IIRC we only keep the logs around for a couple of weeks. So this is 
going to be break quickly. Therefore, I would suggest to remove this link.

> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/cpufeature.c | 35 +++++++++++++++++++++--------------
>   1 file changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 698bfa0201..b1c82ade49 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -101,29 +101,35 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_capabilities *caps)
>   
>   void identify_cpu(struct cpuinfo_arm *c)
>   {
> -        c->midr.bits = READ_SYSREG(MIDR_EL1);
> -        c->mpidr.bits = READ_SYSREG(MPIDR_EL1);
> +    bool aarch32 = true;
> +
> +    c->midr.bits = READ_SYSREG(MIDR_EL1);
> +    c->mpidr.bits = READ_SYSREG(MPIDR_EL1);
>   
>   #ifdef CONFIG_ARM_64
> -        c->pfr64.bits[0] = READ_SYSREG(ID_AA64PFR0_EL1);
> -        c->pfr64.bits[1] = READ_SYSREG(ID_AA64PFR1_EL1);
> +    c->pfr64.bits[0] = READ_SYSREG(ID_AA64PFR0_EL1);
> +    c->pfr64.bits[1] = READ_SYSREG(ID_AA64PFR1_EL1);
> +
> +    c->dbg64.bits[0] = READ_SYSREG(ID_AA64DFR0_EL1);
> +    c->dbg64.bits[1] = READ_SYSREG(ID_AA64DFR1_EL1);
>   
> -        c->dbg64.bits[0] = READ_SYSREG(ID_AA64DFR0_EL1);
> -        c->dbg64.bits[1] = READ_SYSREG(ID_AA64DFR1_EL1);
> +    c->aux64.bits[0] = READ_SYSREG(ID_AA64AFR0_EL1);
> +    c->aux64.bits[1] = READ_SYSREG(ID_AA64AFR1_EL1);
>   
> -        c->aux64.bits[0] = READ_SYSREG(ID_AA64AFR0_EL1);
> -        c->aux64.bits[1] = READ_SYSREG(ID_AA64AFR1_EL1);
> +    c->mm64.bits[0]  = READ_SYSREG(ID_AA64MMFR0_EL1);
> +    c->mm64.bits[1]  = READ_SYSREG(ID_AA64MMFR1_EL1);
> +    c->mm64.bits[2]  = READ_SYSREG(ID_AA64MMFR2_EL1);
>   
> -        c->mm64.bits[0]  = READ_SYSREG(ID_AA64MMFR0_EL1);
> -        c->mm64.bits[1]  = READ_SYSREG(ID_AA64MMFR1_EL1);
> -        c->mm64.bits[2]  = READ_SYSREG(ID_AA64MMFR2_EL1);
> +    c->isa64.bits[0] = READ_SYSREG(ID_AA64ISAR0_EL1);
> +    c->isa64.bits[1] = READ_SYSREG(ID_AA64ISAR1_EL1);
>   
> -        c->isa64.bits[0] = READ_SYSREG(ID_AA64ISAR0_EL1);
> -        c->isa64.bits[1] = READ_SYSREG(ID_AA64ISAR1_EL1);
> +    c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
>   
> -        c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
> +    aarch32 = c->pfr64.el1 == 2;

This is checking that AArch32 is available in EL1. However, it may not 
be the case yet it would be available in EL0.

As a consequence, 32-bit userspace wouldn't work properly after this patch.

The Arm Arm mandates that if AArch32 is available at EL(n), then it must 
be available at EL(n - 1).

So we should check that AArch32 is available at EL0 because this would
cover the case where AArch32 is enabled at EL1.

Furthermore, I would also like to avoid hardcoding value in the code as 
it is less readable. We already define cpu_has_el0_32 which use the boot 
CPU feature. Maybe we want to expand the macro or split it?

>   #endif
>   
> +    if ( aarch32 )
I read this check as "If AArch32 is not available at any EL". But you 
are checking whether it is available at a given level. So I would 
suggest to suffix with the EL for clarification.

In this case, I think you will want to call it aarch32_el0.

> +    {
>           c->pfr32.bits[0] = READ_SYSREG(ID_PFR0_EL1);
>           c->pfr32.bits[1] = READ_SYSREG(ID_PFR1_EL1);
>           c->pfr32.bits[2] = READ_SYSREG(ID_PFR2_EL1);
> @@ -153,6 +159,7 @@ void identify_cpu(struct cpuinfo_arm *c)
>   #ifndef MVFR2_MAYBE_UNDEFINED
>           c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
>   #endif
> +    }
>   }
>   
>   /*
> 

Cheers,

-- 
Julien Grall

