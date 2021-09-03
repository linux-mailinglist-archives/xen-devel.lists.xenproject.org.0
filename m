Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F3C4007F6
	for <lists+xen-devel@lfdr.de>; Sat,  4 Sep 2021 00:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178520.324594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMHyy-0003Fn-Ew; Fri, 03 Sep 2021 22:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178520.324594; Fri, 03 Sep 2021 22:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMHyy-0003D5-Ah; Fri, 03 Sep 2021 22:48:24 +0000
Received: by outflank-mailman (input) for mailman id 178520;
 Fri, 03 Sep 2021 22:48:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKUJ=NZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mMHyw-0003BT-Im
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 22:48:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffaf7407-2dd6-460a-9fe1-af28644ee89c;
 Fri, 03 Sep 2021 22:48:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 716676101A;
 Fri,  3 Sep 2021 22:48:20 +0000 (UTC)
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
X-Inumbo-ID: ffaf7407-2dd6-460a-9fe1-af28644ee89c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630709300;
	bh=L0jZaRecm61EmSsPjf7fpVTRHQ/Ab8AzvN4SzS0bsD8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VL+W57e/93aDPPY0itPIQAtj2qj4CAGw6qU/InbYWzei28csxrIeJhKknRalZ4M1z
	 SvIf8fJvqog+D7AlFAAlb94p1Jrso8HtBEKEaUJ/mHAUMlm+FyRMZeyXzkGzR0Ghzw
	 wWFYycWaGRtshNUBcZrnClMWu0EH3LcsEyx7HQfj9lkHUpnQJ8FArjKcQokdxUAPEG
	 LetOBjdfgfE6uB5+OCQY7A4g/N5o6Q2FqpHnSTSU0f+TbOaY32RCh70p6kQhgHsFHu
	 4Nan2eW59E0G0lzR/E6LFK3y/dD4AIC+qfecpVPwMfRZ9FNK+8eVqagalgkZZNm4Zb
	 rVU2Aqya/KCrg==
Date: Fri, 3 Sep 2021 15:48:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/7] xen/arm: Sanitize cpuinfo ID registers fields
In-Reply-To: <6710cc0ac3fbc9c8030dfa3d6dfc3ecb79de4b71.1629897306.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2109031425030.26072@sstabellini-ThinkPad-T480s>
References: <cover.1629897306.git.bertrand.marquis@arm.com> <6710cc0ac3fbc9c8030dfa3d6dfc3ecb79de4b71.1629897306.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Aug 2021, Bertrand Marquis wrote:
> Define a sanitize_cpu function to be called on secondary cores to
> sanitize the system cpuinfo structure.
> 
> The safest value is taken when possible and the system is marked tainted
> if we encounter values which are incompatible with each other.
> 
> Call the update_system_features function on all secondary cores that are
> kept running and taint the system if different midr are found between
> cores but hmp-unsafe=true was passed on Xen command line.
> 
> This is only supported on arm64 so update_system_features is an empty
> static inline on arm32.
> 
> The patch is adding a new TAINT_CPU_OUT_OF_SPEC to warn the user if
> Xen is running on a system with features differences between cores which
> are not supported.
> 
> The patch is disabling CTR_EL0, DCZID_EL0 and ZCRusing #if 0 with a TODO
> as this patch is not handling sanitization of those registers.
> CTR_EL0/DCZID will be handled in a future patch to properly handle
> different cache attributes when possible.
> ZCR should be sanitize once we add support for SVE in Xen.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Great patch! It looks good I only have a couple of minor questions
below.


> ---
> Changes in v3:
> - in case of different midr but hmp-unsafe passed on the command line,
> enable all cores anyway but taint Xen with CPU_OUT_OF_SPEC.
> - use current core info to sanitize cpu only if we keep it on
> Changes in v2:
> - add compilation of cpufeature.c in this patch instead of previous one
> - remove functions reused from linux code and moved to header
> - rename sanitize_cpu to update_system_features
> - change to Linux coding style
> - remove dev comments
> - surround currently not used Linux structures with #if 0 and adapt the
> commit message
> - add missing aa64dfr1 register
> - add TODO for CTR, DCZID and ZCR
> - add CPU_OUT_OF_SPEC support to print_taint
> - use system_cpuinfo instead of boot_cpu_data
> ---
>  xen/arch/arm/arm64/Makefile      |   1 +
>  xen/arch/arm/arm64/cpufeature.c  | 121 +++++++++++++++++++++++++++++++
>  xen/arch/arm/smpboot.c           |  34 +++++++--
>  xen/common/kernel.c              |   6 +-
>  xen/include/asm-arm/cpufeature.h |   9 +++
>  xen/include/xen/lib.h            |   1 +
>  6 files changed, 162 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 40642ff574..701d66883d 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -1,6 +1,7 @@
>  obj-y += lib/
>  
>  obj-y += cache.o
> +obj-y += cpufeature.o
>  obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) += bpi.o
>  obj-$(CONFIG_EARLY_PRINTK) += debug.o
>  obj-y += domctl.o
> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
> index 5777e33e5c..61f629ebaa 100644
> --- a/xen/arch/arm/arm64/cpufeature.c
> +++ b/xen/arch/arm/arm64/cpufeature.c
> @@ -275,6 +275,9 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] = {
>  	ARM64_FTR_END,
>  };
>  
> +#if 0
> +/* TODO: use this to sanitize the cache line size among cores */
> +
>  static const struct arm64_ftr_bits ftr_ctr[] = {
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 */
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT, 1, 1),
> @@ -291,6 +294,7 @@ static const struct arm64_ftr_bits ftr_ctr[] = {
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_SHIFT, 4, 0),
>  	ARM64_FTR_END,
>  };
> +#endif
>  
>  static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
>  	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_INNERSHR_SHIFT, 4, 0xf),
> @@ -325,11 +329,14 @@ static const struct arm64_ftr_bits ftr_mvfr2[] = {
>  	ARM64_FTR_END,
>  };
>  
> +#if 0
> +/* TODO: handle this when sanitizing cache related registers */
>  static const struct arm64_ftr_bits ftr_dczid[] = {
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, DCZID_DZP_SHIFT, 1, 1),
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, DCZID_BS_SHIFT, 4, 0),
>  	ARM64_FTR_END,
>  };
> +#endif
>  
>  static const struct arm64_ftr_bits ftr_id_isar0[] = {
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE_SHIFT, 4, 0),
> @@ -444,11 +451,15 @@ static const struct arm64_ftr_bits ftr_id_dfr1[] = {
>  	ARM64_FTR_END,
>  };
>  
> +#if 0
> +/* TODO: use this to sanitize SVE once we support it */
> +
>  static const struct arm64_ftr_bits ftr_zcr[] = {
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
>  		ZCR_ELx_LEN_SHIFT, ZCR_ELx_LEN_SIZE, 0),	/* LEN */
>  	ARM64_FTR_END,
>  };
> +#endif
>  
>  /*
>   * Common ftr bits for a 32bit register with all hidden, strict
> @@ -502,3 +513,113 @@ static s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
>   * End of imported linux structures and code
>   */
>  
> +static void sanitize_reg(u64 *cur_reg, u64 new_reg, const char *reg_name,
> +						const struct arm64_ftr_bits *ftrp)
> +{
> +	int taint = 0;
> +	u64 old_reg = *cur_reg;
> +
> +	for (;ftrp->width != 0;ftrp++)
> +	{
> +		u64 mask;
> +		s64 cur_field = arm64_ftr_value(ftrp, *cur_reg);
> +		s64 new_field = arm64_ftr_value(ftrp, new_reg);
> +
> +		if (cur_field == new_field)
> +			continue;
> +
> +		if (ftrp->strict)
> +			taint = 1;
> +
> +		mask = arm64_ftr_mask(ftrp);
> +
> +		*cur_reg &= ~mask;
> +		*cur_reg |= (arm64_ftr_safe_value(ftrp, new_field, cur_field)
> +					<< ftrp->shift) & mask;

I wonder why you haven't also imported arm64_ftr_set_value?  This seems
to be the open-coded version of it.


> +	}
> +
> +	if (old_reg != new_reg)
> +		printk(XENLOG_DEBUG "SANITY DIF: %s 0x%"PRIx64" -> 0x%"PRIx64"\n",
> +				reg_name, old_reg, new_reg);
> +	if (old_reg != *cur_reg)
> +		printk(XENLOG_DEBUG "SANITY FIX: %s 0x%"PRIx64" -> 0x%"PRIx64"\n",
> +				reg_name, old_reg, *cur_reg);
> +
> +	if (taint)
> +	{
> +		printk(XENLOG_WARNING "SANITY CHECK: Unexpected variation in %s.\n",
> +				reg_name);
> +		add_taint(TAINT_CPU_OUT_OF_SPEC);
> +	}
> +}
> +
> +
> +/*
> + * This function should be called on secondary cores to sanitize the boot cpu
> + * cpuinfo.
> + */
> +void update_system_features(const struct cpuinfo_arm *new)
> +{
> +
> +#define SANITIZE_REG(field, num, reg)  \
> +	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
> +				 #reg, ftr_##reg)
> +
> +#define SANITIZE_ID_REG(field, num, reg)  \
> +	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
> +				#reg, ftr_id_##reg)
> +
> +#define SANITIZE_RAZ_REG(field, num, reg)  \
> +	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
> +				#reg, ftr_raz)
> +
> +#define SANITIZE_GENERIC_REG(field, num, reg)  \
> +	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
> +				#reg, ftr_generic_32bits)
> +
> +	SANITIZE_ID_REG(pfr64, 0, aa64pfr0);
> +	SANITIZE_ID_REG(pfr64, 1, aa64pfr1);
> +
> +	SANITIZE_ID_REG(dbg64, 0, aa64dfr0);
> +	SANITIZE_RAZ_REG(dbg64, 1, aa64dfr1);
> +
> +	SANITIZE_ID_REG(mm64, 0, aa64mmfr0);
> +	SANITIZE_ID_REG(mm64, 1, aa64mmfr1);
> +	SANITIZE_ID_REG(mm64, 2, aa64mmfr2);
> +
> +	SANITIZE_ID_REG(isa64, 0, aa64isar0);
> +	SANITIZE_ID_REG(isa64, 1, aa64isar1);
> +
> +	SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
> +
> +	if ( cpu_feature64_has_el0_32(&system_cpuinfo) )
> +	{
> +		SANITIZE_ID_REG(pfr32, 0, pfr0);
> +		SANITIZE_ID_REG(pfr32, 1, pfr1);
> +		SANITIZE_ID_REG(pfr32, 2, pfr2);
> +
> +		SANITIZE_ID_REG(dbg32, 0, dfr0);
> +		SANITIZE_ID_REG(dbg32, 1, dfr1);
> +
> +		SANITIZE_ID_REG(mm32, 0, mmfr0);
> +		SANITIZE_GENERIC_REG(mm32, 1, mmfr1);
> +		SANITIZE_GENERIC_REG(mm32, 2, mmfr2);
> +		SANITIZE_GENERIC_REG(mm32, 3, mmfr3);
> +		SANITIZE_ID_REG(mm32, 4, mmfr4);
> +		SANITIZE_ID_REG(mm32, 5, mmfr5);
> +
> +		SANITIZE_ID_REG(isa32, 0, isar0);
> +		SANITIZE_GENERIC_REG(isa32, 1, isar1);
> +		SANITIZE_GENERIC_REG(isa32, 2, isar2);
> +		SANITIZE_GENERIC_REG(isa32, 3, isar3);
> +		SANITIZE_ID_REG(isa32, 4, isar4);
> +		SANITIZE_ID_REG(isa32, 5, isar5);
> +		SANITIZE_ID_REG(isa32, 6, isar6);
> +
> +		SANITIZE_GENERIC_REG(mvfr, 0, mvfr0);
> +		SANITIZE_GENERIC_REG(mvfr, 1, mvfr1);
> +#ifndef MVFR2_MAYBE_UNDEFINED
> +		SANITIZE_REG(mvfr, 2, mvfr2);
> +#endif
> +	}
> +}

Looking at the list of registers we are sanitizing here we are only
missing aux32 and aux64 compared to struct cpuinfo_arm. Is that because
there is nothing to sanitize there?

