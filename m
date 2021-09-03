Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7932B4007FA
	for <lists+xen-devel@lfdr.de>; Sat,  4 Sep 2021 00:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178543.324617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMHzi-0004tO-2v; Fri, 03 Sep 2021 22:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178543.324617; Fri, 03 Sep 2021 22:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMHzh-0004r0-V9; Fri, 03 Sep 2021 22:49:09 +0000
Received: by outflank-mailman (input) for mailman id 178543;
 Fri, 03 Sep 2021 22:49:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKUJ=NZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mMHzg-0004pW-5x
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 22:49:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59256c8a-01da-49cc-a5ab-53bb46601b0c;
 Fri, 03 Sep 2021 22:49:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DC7E6101A;
 Fri,  3 Sep 2021 22:49:03 +0000 (UTC)
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
X-Inumbo-ID: 59256c8a-01da-49cc-a5ab-53bb46601b0c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630709343;
	bh=S/hCI4aNd0cSDI8CmUHd0XFH3442g/fhnIUYiVIArNA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZgA3V3osAHiiWa8wy42E9oJxR4wvoMSZDXARPUT8fYpa+9FEPaMH1XtpIXsb2SWVe
	 7OENlv0thp8D6iYy0RQD9FG15Aa1b6nJut2G5X/eo/QDhTi0z4TNhTNk12ZJOWC25S
	 csVfmz0CpJQ4Eeig3dBQzEIJMdwZOPWLfKCwkzezPmEIRrNvoo2CbsMR2V/2oVOcgB
	 OiIPRxNg1D9PEdDIHMoeV0E0U61qeljMIggl6Ex7Mj2+bfjOHzMz5n7+4bSE7F1z12
	 1XT5aZJviY3U37+nnYFNFsoP8rC1jMDNxIyeTvO+EDhZ7yiB/BUR1kfmHlraCAKxyG
	 I5bonXuCQUjTA==
Date: Fri, 3 Sep 2021 15:49:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/7] xen/arm: Taint Xen on incompatible DCZID values
In-Reply-To: <c1868fce1bcb0bcddf7bc786be166007f91f2f67.1629897306.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2109031529400.26072@sstabellini-ThinkPad-T480s>
References: <cover.1629897306.git.bertrand.marquis@arm.com> <c1868fce1bcb0bcddf7bc786be166007f91f2f67.1629897306.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Aug 2021, Bertrand Marquis wrote:
> Use arm64 cpu feature sanitization to TAIN Xen if different DCZID values
                                        ^  TAINT


> are found (ftr_dczid is using only STRICT method).
> In this case actual memory being cleaned by DC ZVA operations would be
> different depending on the cores which could make a guest zeroing too
> much or too little memory if it is merged between CPUs.
> 
> We could, on processor supporting it, trap access to DCZID_EL0 register
               ^ processors

> using HFGRTR_EL2 register but this would not solve the case where a
> process is being migrated during a copy or if it cached the value of the
> register.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Change in v3: none
> Change in v2: Patch introduced in v2
> ---
>  xen/arch/arm/arm64/cpufeature.c  | 14 +++++++++++---
>  xen/arch/arm/cpufeature.c        |  2 ++
>  xen/include/asm-arm/cpufeature.h |  8 ++++++++
>  3 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
> index 61f629ebaa..b1936ef1d6 100644
> --- a/xen/arch/arm/arm64/cpufeature.c
> +++ b/xen/arch/arm/arm64/cpufeature.c
> @@ -329,14 +329,11 @@ static const struct arm64_ftr_bits ftr_mvfr2[] = {
>  	ARM64_FTR_END,
>  };
>  
> -#if 0
> -/* TODO: handle this when sanitizing cache related registers */
>  static const struct arm64_ftr_bits ftr_dczid[] = {
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, DCZID_DZP_SHIFT, 1, 1),
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, DCZID_BS_SHIFT, 4, 0),
>  	ARM64_FTR_END,
>  };
> -#endif
>  
>  static const struct arm64_ftr_bits ftr_id_isar0[] = {
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE_SHIFT, 4, 0),
> @@ -592,6 +589,17 @@ void update_system_features(const struct cpuinfo_arm *new)
>  
>  	SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
>  
> +	/*
> +	 * Comment from Linux:

I don't know if I would keep or remove "Comment from Linux"

In any case:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Also I gave a quick test of the series on a ZCU102 and it worked fine.


> +	 * Userspace may perform DC ZVA instructions. Mismatched block sizes
> +	 * could result in too much or too little memory being zeroed if a
> +	 * process is preempted and migrated between CPUs.
> +	 *
> +	 * ftr_dczid is using STRICT comparison so we will taint Xen if different
> +	 * values are found.
> +	 */
> +	SANITIZE_REG(dczid, 0, dczid);
> +
>  	if ( cpu_feature64_has_el0_32(&system_cpuinfo) )
>  	{
>  		SANITIZE_ID_REG(pfr32, 0, pfr0);
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index f600a611bd..113f20f601 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -125,6 +125,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>  
>      c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
>  
> +    c->dczid.bits[0] = READ_SYSREG(DCZID_EL0);
> +
>      aarch32_el0 = cpu_feature64_has_el0_32(c);
>  #endif
>  
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 52cb3133e0..5219fd3bab 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -259,6 +259,14 @@ struct cpuinfo_arm {
>          register_t bits[1];
>      } zfr64;
>  
> +    /*
> +     * DCZID is only used to check for incoherent values between cores
> +     * and taint Xen in this case
> +     */
> +    struct {
> +        register_t bits[1];
> +    } dczid;
> +
>  #endif
>  
>      /*
> -- 
> 2.17.1
> 

