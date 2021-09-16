Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA8940EC57
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 23:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188745.338025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQyoN-00034B-Da; Thu, 16 Sep 2021 21:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188745.338025; Thu, 16 Sep 2021 21:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQyoN-00030k-9k; Thu, 16 Sep 2021 21:20:51 +0000
Received: by outflank-mailman (input) for mailman id 188745;
 Thu, 16 Sep 2021 21:20:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ef7n=OG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQyoM-00030X-5d
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 21:20:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23c1e5de-cf17-4120-ab0b-ac28d331571e;
 Thu, 16 Sep 2021 21:20:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6421460FC0;
 Thu, 16 Sep 2021 21:20:48 +0000 (UTC)
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
X-Inumbo-ID: 23c1e5de-cf17-4120-ab0b-ac28d331571e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631827248;
	bh=HWZT8ndIb8TWmTrUBrNqxhi3WlzxH1yvxu+3R3piHXE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OYUSFaz2ifdR3LUF8ght7wG0HwdADG8odifMf+QPq1mGB/jqGVVyfeoW1b9Djmvj3
	 EQnv9CRvpYaB+nEa0PPvYxdS0EnskohAFlENsEqnNWYspICUoH8WwUOE060tcCxnEX
	 zIrOa57zhPBberwDzLJ9Fsd6jbVT5cy+sBNbRPmeMx6F0mr07WYeWK2Uc1TgtdzJsz
	 k440LJ4EQ2fkU7krUvd/6eFKqwmBK86PHb/FTzxKnjWHZtrZN4MatBdiNE6QgK7kkd
	 eKgg5scJgsJlHPfgqy9vLcL4l9syB0DCJCq6R6v8m7MsUy1SgYijXHKJb3I7bcpbbu
	 BejP+xSgS83yQ==
Date: Thu, 16 Sep 2021 14:20:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 7/7] xen/arm: Sanitize CTR_EL0
In-Reply-To: <3a6a63701df71c0a0ea743c6229266077da0563e.1631772970.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2109161420210.21985@sstabellini-ThinkPad-T480s>
References: <cover.1631772970.git.bertrand.marquis@arm.com> <3a6a63701df71c0a0ea743c6229266077da0563e.1631772970.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Sep 2021, Bertrand Marquis wrote:
> Sanitize CTR_EL0 value between cores and taint Xen if incompatible
> values are found.
> 
> In the case of different i-cache types, the sanitize ctr_el0 will have a
> sanitize value but this is currently not used or exposed to guest which
> are seeing the original ctr_el0 value.
> 
> Use the opportunity to rename CTR_L1Ip to use an upper case name like
> Linux does.
> The patch is also defining ICACHE_POLICY_xxx instead of only having
> CTR_L1IP_xxx to sync the definitions with Linux and is updating the code
> using those accordingly (arm32 setup).
> 
> On platforms with only the same type of cores, this patch should not
> modify the current Xen behaviour.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in v4: Remove TID2 support and handling of corresponding
> register emulation in vcpreg/vsysreg.
> Changes in v3: none
> Change in v2: Patch introduced in v2
> ---
>  xen/arch/arm/arm64/cpufeature.c  |  6 ++----
>  xen/arch/arm/cpufeature.c        |  2 ++
>  xen/arch/arm/setup.c             |  2 +-
>  xen/include/asm-arm/cpufeature.h |  9 +++++++++
>  xen/include/asm-arm/processor.h  | 18 +++++++++++++++---
>  5 files changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
> index d4679f5df3..6e5d30dc7b 100644
> --- a/xen/arch/arm/arm64/cpufeature.c
> +++ b/xen/arch/arm/arm64/cpufeature.c
> @@ -275,9 +275,6 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] = {
>  	ARM64_FTR_END,
>  };
>  
> -#if 0
> -/* TODO: use this to sanitize the cache line size among cores */
> -
>  static const struct arm64_ftr_bits ftr_ctr[] = {
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 */
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT, 1, 1),
> @@ -294,7 +291,6 @@ static const struct arm64_ftr_bits ftr_ctr[] = {
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_SHIFT, 4, 0),
>  	ARM64_FTR_END,
>  };
> -#endif
>  
>  static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
>  	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_INNERSHR_SHIFT, 4, 0xf),
> @@ -606,6 +602,8 @@ void update_system_features(const struct cpuinfo_arm *new)
>  	 */
>  	SANITIZE_REG(dczid, 0, dczid);
>  
> +	SANITIZE_REG(ctr, 0, ctr);
> +
>  	if ( cpu_feature64_has_el0_32(&system_cpuinfo) )
>  	{
>  		SANITIZE_ID_REG(pfr32, 0, pfr0);
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 113f20f601..6e51f530a8 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -127,6 +127,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>  
>      c->dczid.bits[0] = READ_SYSREG(DCZID_EL0);
>  
> +    c->ctr.bits[0] = READ_SYSREG(CTR_EL0);
> +
>      aarch32_el0 = cpu_feature64_has_el0_32(c);
>  #endif
>  
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 4ab13d0fbe..49dc90d198 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -650,7 +650,7 @@ static void __init setup_mm(void)
>          panic("No memory bank\n");
>  
>      /* We only supports instruction caches implementing the IVIPT extension. */
> -    if ( ((ctr >> CTR_L1Ip_SHIFT) & CTR_L1Ip_MASK) == CTR_L1Ip_AIVIVT )
> +    if ( ((ctr >> CTR_L1IP_SHIFT) & CTR_L1IP_MASK) == ICACHE_POLICY_AIVIVT )
>          panic("AIVIVT instruction cache not supported\n");
>  
>      init_pdx();
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 5219fd3bab..cab89ee142 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -267,6 +267,14 @@ struct cpuinfo_arm {
>          register_t bits[1];
>      } dczid;
>  
> +    /*
> +     * CTR is only used to check for different cache types or policies and
> +     * taint Xen in this case
> +     */
> +    struct {
> +        register_t bits[1];
> +    } ctr;
> +
>  #endif
>  
>      /*
> @@ -339,6 +347,7 @@ extern struct cpuinfo_arm system_cpuinfo;
>  extern void identify_cpu(struct cpuinfo_arm *);
>  
>  #ifdef CONFIG_ARM_64
> +
>  extern void update_system_features(const struct cpuinfo_arm *);
>  #else
>  static inline void update_system_features(const struct cpuinfo_arm *cpuinfo)

Spurious change. I fixed it on commit.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

