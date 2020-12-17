Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296352DDBCD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 00:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56219.98282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2WB-0002GE-Qx; Thu, 17 Dec 2020 23:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56219.98282; Thu, 17 Dec 2020 23:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2WB-0002Fp-Nc; Thu, 17 Dec 2020 23:17:07 +0000
Received: by outflank-mailman (input) for mailman id 56219;
 Thu, 17 Dec 2020 23:17:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kq2WA-0002Fk-E8
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 23:17:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 819e3839-668e-4748-869a-2df1ff976175;
 Thu, 17 Dec 2020 23:17:05 +0000 (UTC)
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
X-Inumbo-ID: 819e3839-668e-4748-869a-2df1ff976175
Date: Thu, 17 Dec 2020 15:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608247024;
	bh=jXN3v4FSewTv18rQKuXwSbNEsWTYD9/bX50bkqSnTm8=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=M6CiytJl/u9uAeakUziOfAFov3lalJ18c4+YeKU7McaIj72LALvQatMAVdGbmGWYC
	 Jh9EyBpSYPMrkknn2J9O+69KMW8jW37gmTDGZOWYaZP+XBq5bsqYGTnyEkPKm+Een9
	 56rN1WsPGrDwCjqGQmVdd6N53uqSzH1DO2IRezCNEKBdXg4a4xNybopqHkYPx5wy9y
	 pYq77U/tim8DK2XxkULvtXZVyu//YIHL4NzUWzpd+vL6dvY8csFrgSwB0eQlgrunvX
	 7YVZqOf6t+UlhPwZ7f16T53h2e9Qj9SpTryy8yPTQ+Ndc9LAjJLUo7ie8K9Um2O0pl
	 51dYJiVo3UKCA==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/8] xen/arm: Use READ_SYSREG instead of 32/64
 versions
In-Reply-To: <75ab5c84ed6ce1d004316ca4677735aa0543ecdc.1608214355.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012171505430.4040@sstabellini-ThinkPad-T480s>
References: <cover.1608214355.git.bertrand.marquis@arm.com> <75ab5c84ed6ce1d004316ca4677735aa0543ecdc.1608214355.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Dec 2020, Bertrand Marquis wrote:
> Modify identify_cpu function to use READ_SYSREG instead of READ_SYSREG32
> or READ_SYSREG64.
> The aarch32 versions of the registers are 64bit on an aarch64 processor
> so it was wrong to access them as 32bit registers.

This sentence is a bit confusing because, as an example, MIDR_EL1 is
also an aarch64 register, not only an aarch32 register. Maybe we should
clarify.

Aside from that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> ---
> Change in V4:
>   This patch was introduced in v4.
> 
> ---
>  xen/arch/arm/cpufeature.c | 50 +++++++++++++++++++--------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 44126dbf07..115e1b164d 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -99,44 +99,44 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_capabilities *caps)
>  
>  void identify_cpu(struct cpuinfo_arm *c)
>  {
> -        c->midr.bits = READ_SYSREG32(MIDR_EL1);
> +        c->midr.bits = READ_SYSREG(MIDR_EL1);
>          c->mpidr.bits = READ_SYSREG(MPIDR_EL1);
>  
>  #ifdef CONFIG_ARM_64
> -        c->pfr64.bits[0] = READ_SYSREG64(ID_AA64PFR0_EL1);
> -        c->pfr64.bits[1] = READ_SYSREG64(ID_AA64PFR1_EL1);
> +        c->pfr64.bits[0] = READ_SYSREG(ID_AA64PFR0_EL1);
> +        c->pfr64.bits[1] = READ_SYSREG(ID_AA64PFR1_EL1);
>  
> -        c->dbg64.bits[0] = READ_SYSREG64(ID_AA64DFR0_EL1);
> -        c->dbg64.bits[1] = READ_SYSREG64(ID_AA64DFR1_EL1);
> +        c->dbg64.bits[0] = READ_SYSREG(ID_AA64DFR0_EL1);
> +        c->dbg64.bits[1] = READ_SYSREG(ID_AA64DFR1_EL1);
>  
> -        c->aux64.bits[0] = READ_SYSREG64(ID_AA64AFR0_EL1);
> -        c->aux64.bits[1] = READ_SYSREG64(ID_AA64AFR1_EL1);
> +        c->aux64.bits[0] = READ_SYSREG(ID_AA64AFR0_EL1);
> +        c->aux64.bits[1] = READ_SYSREG(ID_AA64AFR1_EL1);
>  
> -        c->mm64.bits[0]  = READ_SYSREG64(ID_AA64MMFR0_EL1);
> -        c->mm64.bits[1]  = READ_SYSREG64(ID_AA64MMFR1_EL1);
> +        c->mm64.bits[0]  = READ_SYSREG(ID_AA64MMFR0_EL1);
> +        c->mm64.bits[1]  = READ_SYSREG(ID_AA64MMFR1_EL1);
>  
> -        c->isa64.bits[0] = READ_SYSREG64(ID_AA64ISAR0_EL1);
> -        c->isa64.bits[1] = READ_SYSREG64(ID_AA64ISAR1_EL1);
> +        c->isa64.bits[0] = READ_SYSREG(ID_AA64ISAR0_EL1);
> +        c->isa64.bits[1] = READ_SYSREG(ID_AA64ISAR1_EL1);
>  #endif
>  
> -        c->pfr32.bits[0] = READ_SYSREG32(ID_PFR0_EL1);
> -        c->pfr32.bits[1] = READ_SYSREG32(ID_PFR1_EL1);
> +        c->pfr32.bits[0] = READ_SYSREG(ID_PFR0_EL1);
> +        c->pfr32.bits[1] = READ_SYSREG(ID_PFR1_EL1);
>  
> -        c->dbg32.bits[0] = READ_SYSREG32(ID_DFR0_EL1);
> +        c->dbg32.bits[0] = READ_SYSREG(ID_DFR0_EL1);
>  
> -        c->aux32.bits[0] = READ_SYSREG32(ID_AFR0_EL1);
> +        c->aux32.bits[0] = READ_SYSREG(ID_AFR0_EL1);
>  
> -        c->mm32.bits[0]  = READ_SYSREG32(ID_MMFR0_EL1);
> -        c->mm32.bits[1]  = READ_SYSREG32(ID_MMFR1_EL1);
> -        c->mm32.bits[2]  = READ_SYSREG32(ID_MMFR2_EL1);
> -        c->mm32.bits[3]  = READ_SYSREG32(ID_MMFR3_EL1);
> +        c->mm32.bits[0]  = READ_SYSREG(ID_MMFR0_EL1);
> +        c->mm32.bits[1]  = READ_SYSREG(ID_MMFR1_EL1);
> +        c->mm32.bits[2]  = READ_SYSREG(ID_MMFR2_EL1);
> +        c->mm32.bits[3]  = READ_SYSREG(ID_MMFR3_EL1);
>  
> -        c->isa32.bits[0] = READ_SYSREG32(ID_ISAR0_EL1);
> -        c->isa32.bits[1] = READ_SYSREG32(ID_ISAR1_EL1);
> -        c->isa32.bits[2] = READ_SYSREG32(ID_ISAR2_EL1);
> -        c->isa32.bits[3] = READ_SYSREG32(ID_ISAR3_EL1);
> -        c->isa32.bits[4] = READ_SYSREG32(ID_ISAR4_EL1);
> -        c->isa32.bits[5] = READ_SYSREG32(ID_ISAR5_EL1);
> +        c->isa32.bits[0] = READ_SYSREG(ID_ISAR0_EL1);
> +        c->isa32.bits[1] = READ_SYSREG(ID_ISAR1_EL1);
> +        c->isa32.bits[2] = READ_SYSREG(ID_ISAR2_EL1);
> +        c->isa32.bits[3] = READ_SYSREG(ID_ISAR3_EL1);
> +        c->isa32.bits[4] = READ_SYSREG(ID_ISAR4_EL1);
> +        c->isa32.bits[5] = READ_SYSREG(ID_ISAR5_EL1);
>  }
>  
>  /*
> -- 
> 2.17.1
> 

