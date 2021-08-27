Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7EC3F9B6F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 17:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173779.317060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJdPq-000851-ET; Fri, 27 Aug 2021 15:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173779.317060; Fri, 27 Aug 2021 15:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJdPq-000826-B6; Fri, 27 Aug 2021 15:05:10 +0000
Received: by outflank-mailman (input) for mailman id 173779;
 Fri, 27 Aug 2021 15:05:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJdPo-000820-Rf
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 15:05:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJdPn-0007sY-JS; Fri, 27 Aug 2021 15:05:07 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJdPn-00019c-96; Fri, 27 Aug 2021 15:05:07 +0000
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
	bh=jU1xukSr/pJB02h1HlKdF2KEK0r9TkRp6W3KgPAVq8Q=; b=ssLwYfaeghCocuq0Jz5W6KJxy5
	rigkRVybSLs8YmT5C18k6RMSXp8zEYy5Db1/Pt8S08/wtcna57RV3Wt2jSCvu7QSdPakYnWxZ773e
	EpIPDihvEOq0uqxqSdSCqyDLy9EDxBgDUB5ZgpWmR48HGt8KKEX4/UjzDYqKDy3G8GLs=;
Subject: Re: [PATCH v3 7/7] xen/arm: Sanitize CTR_EL0 and emulate it if needed
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629897306.git.bertrand.marquis@arm.com>
 <a7482653a0c29d68854846f25553f4938a6279b9.1629897306.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <14b1639e-c9e4-f8fb-e921-73d7f28681ac@xen.org>
Date: Fri, 27 Aug 2021 16:05:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a7482653a0c29d68854846f25553f4938a6279b9.1629897306.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On 25/08/2021 14:18, Bertrand Marquis wrote:
> Sanitize CTR_EL0 value between cores.
> 
> In most cases different values will taint Xen but if different
> i-cache policies are found, we choose the one which will be compatible
> between all cores in terms of invalidation/data cache flushing strategy.

I understand that all the CPUs in Xen needs to agree on the cache flush 
strategy. However...

> 
> In this case we need to activate the TID2 bit in HCR to emulate the
> TCR_EL0 register for guests. This patch is not activating TID2 bit all
> the time to limit the overhead when possible.

as we discussed in an earlier version, a vCPU is unlikely (at least in 
short/medium) to be able move across pCPU of different type. So the vCPU 
would be pinned to a set of pCPUs. IOW, the guest would have to be 
big.LITTLE aware and therefore would be able to do its own strategy 
decision.

So I think we should be able to get away from trappings the registers.

> When TID2 is activate we also need to emulate the CCSIDR, CSSELR and
> CLIDR registers which is done here for both 32 and 64bit versions of the
> registers.
> 
> Add CTR register field definitions using Linux value and define names
> and use the opportunity to rename CTR_L1Ip to use an upper case name
> instead. The patch is also defining ICACHE_POLICY_xxx instead of only
> having CTR_L1IP_xxx. Code using those defines is also updated by this
> patch (arm32 setup).
> 
> On most big/LITTLE platforms this patch will activate TID2 and emulate
> VIPT type of i-cache for all cores (as most LITTLE cores are VIPT where
> big ones are PIPT). This is the case for example on Juno boards.
> 
> On platforms with only the same type of cores, this patch should not
> modify the behaviour.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v3: none
> Change in v2: Patch introduced in v2
> ---
>   xen/arch/arm/arm64/cpufeature.c  | 19 +++++++++++---
>   xen/arch/arm/arm64/vsysreg.c     | 40 ++++++++++++++++++++++++++++
>   xen/arch/arm/cpufeature.c        |  2 ++
>   xen/arch/arm/domain.c            |  8 ++++++
>   xen/arch/arm/setup.c             |  2 +-
>   xen/arch/arm/vcpreg.c            | 45 ++++++++++++++++++++++++++++++++
>   xen/include/asm-arm/arm64/hsr.h  |  6 +++++
>   xen/include/asm-arm/cpufeature.h | 11 ++++++++
>   xen/include/asm-arm/processor.h  | 18 ++++++++++---
>   9 files changed, 143 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
> index b1936ef1d6..334d590ba0 100644
> --- a/xen/arch/arm/arm64/cpufeature.c
> +++ b/xen/arch/arm/arm64/cpufeature.c
> @@ -275,9 +275,6 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] = {
>   	ARM64_FTR_END,
>   };
>   
> -#if 0
> -/* TODO: use this to sanitize the cache line size among cores */
> -
>   static const struct arm64_ftr_bits ftr_ctr[] = {
>   	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 */
>   	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT, 1, 1),
> @@ -294,7 +291,6 @@ static const struct arm64_ftr_bits ftr_ctr[] = {
>   	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_SHIFT, 4, 0),
>   	ARM64_FTR_END,
>   };
> -#endif
>   
>   static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
>   	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_INNERSHR_SHIFT, 4, 0xf),
> @@ -510,6 +506,12 @@ static s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
>    * End of imported linux structures and code
>    */
>   
> +/*
> + * This is set to true if we have different type of i-caches on cores
> + * and used to activate TID2 bit to emulate CTR_EL0 register for guests
> + */
> +bool mismatch_cache_type = false;

If we are still planning to trap and emulate the registers, then this 
needs to be an HW capability (see cpus_set_cap()).

> +
>   static void sanitize_reg(u64 *cur_reg, u64 new_reg, const char *reg_name,
>   						const struct arm64_ftr_bits *ftrp)
>   {
> @@ -600,6 +602,15 @@ void update_system_features(const struct cpuinfo_arm *new)
>   	 */
>   	SANITIZE_REG(dczid, 0, dczid);
>   
> +	SANITIZE_REG(ctr, 0, ctr);
> +
> +	/*
> +	 * If CTR is different among cores, set mismatch_cache_type to activate
> +	 * TID2 bit in HCR and emulate CTR register access for guests.
> +	 */
> +	if ( system_cpuinfo.ctr.bits[0] != new->ctr.bits[0] )
> +		mismatch_cache_type = true;
> +
>   	if ( cpu_feature64_has_el0_32(&system_cpuinfo) )
>   	{
>   		SANITIZE_ID_REG(pfr32, 0, pfr0);
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index 887266dd46..17212bd7ae 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -341,6 +341,46 @@ void do_sysreg(struct cpu_user_regs *regs,
>       case HSR_SYSREG(3,0,c0,c7,7):
>           return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 1);
>   
> +    /*
> +     * HCR_EL2.TID2
> +     *
> +     * registers related to cache detection
> +     */
> +    case HSR_SYSREG_CTR_EL0:
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                system_cpuinfo.ctr.bits[0]);

Coding style: This needs to be aligned with the first argument.

> +
> +    case HSR_SYSREG_CLIDR_EL1:
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                READ_SYSREG(CLIDR_EL1));

Same.

> +
> +    case HSR_SYSREG_CSSELR_EL1:
> +        if ( psr_mode_is_user(regs) )
> +            return inject_undef_exception(regs, hsr);
> +        if ( hsr.sysreg.read )
> +            set_user_reg(regs, regidx, v->arch.csselr);
> +        else
> +            v->arch.csselr = get_user_reg(regs, regidx);
> +        break;
> +
> +    case HSR_SYSREG_CCSIDR_EL1:
> +        if ( psr_mode_is_user(regs) )
> +            return inject_undef_exception(regs, hsr);
> +        if ( hsr.sysreg.read )
> +        {
> +            /* we need to set CSSELR and do the read of CCSIDR atomically */

I couldn't find this requirement in the Arm Arm. Do you have the section 
at hand?

> +            WRITE_SYSREG(v->arch.csselr, CSSELR_EL1);
> +            set_user_reg(regs, regidx, READ_SYSREG(CCSIDR_EL1));
> +        }

 From the Arm Arm (D13.2.25 in ARM DDI 0487F.c):

"
If CSSELR_EL1.Level is programmed to a cache level that is not 
implemented, then on a read of the CCSIDR_EL1
the behavior is CONSTRAINED UNPREDICTABLE, and can be one of the following:
• The CCSIDR_EL1 read is treated as NOP.
• The CCSIDR_EL1 read is UNDEFINED.
• The CCSIDR_EL1 read returns an UNKNOWN value.
"

We can't trust the guest here, so we need to prevent any of this 
behavior (in particular 1 and 2) to happen. The options are:
  1) Sanitize the values from the guest
  2) Make sure the register is 0 before reading (for the NOP case to 
avoid leaking a value from Xen) and catch the undefined (some similar to 
the extable on x86).

> +        break;
> +
> +    case HSR_SYSREG_CCSIDR2_EL1:
> +        /*
> +         * This would need to return a properly defined value if CCIDX is
> +         * implemented in the processor
> +         */
> +        return inject_undef_exception(regs, hsr);
> +
>       /*
>        * HCR_EL2.TIDCP
>        *
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 113f20f601..6e51f530a8 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -127,6 +127,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>   
>       c->dczid.bits[0] = READ_SYSREG(DCZID_EL0);
>   
> +    c->ctr.bits[0] = READ_SYSREG(CTR_EL0);
> +
>       aarch32_el0 = cpu_feature64_has_el0_32(c);
>   #endif
>   
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 19c756ac3d..7a97fde3e7 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -585,6 +585,14 @@ int arch_vcpu_create(struct vcpu *v)
>       v->arch.vmpidr = MPIDR_SMP | vcpuid_to_vaffinity(v->vcpu_id);
>   
>       v->arch.hcr_el2 = get_default_hcr_flags();
> +#ifdef CONFIG_ARM64

This #ifdef could be droppped if we use an HW caps.

> +    /*
> +     * Only activated TID2 to catch access to CTR_EL0 if the platform has some
> +     * mismatching i-cache types among cores
> +     */
> +    if ( mismatch_cache_type )
> +        v->arch.hcr_el2 |= HCR_TID2;
> +#endif
>   
>       if ( (rc = vcpu_vgic_init(v)) != 0 )
>           goto fail;
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 3798c5ade0..33b7bfb59c 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -627,7 +627,7 @@ static void __init setup_mm(void)
>           panic("No memory bank\n");
>   
>       /* We only supports instruction caches implementing the IVIPT extension. */
> -    if ( ((ctr >> CTR_L1Ip_SHIFT) & CTR_L1Ip_MASK) == CTR_L1Ip_AIVIVT )
> +    if ( ((ctr >> CTR_L1IP_SHIFT) & CTR_L1IP_MASK) == ICACHE_POLICY_AIVIVT )
>           panic("AIVIVT instruction cache not supported\n");
>   
>       init_pdx();
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 33259c4194..5ffed96ded 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -361,6 +361,51 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>       HSR_CPREG32_TID3_CASES(c7):
>           return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
>   
> +#ifdef CONFIG_ARM64
> +    /*
> +     * HCR_EL2.TID2
> +     *
> +     * registers related to cache detection
> +     * Only supported on arm64 as we do not sanitize cpuinfo on arm32 so we
> +     * do not need to emulate those.
> +     */
> +    case HSR_CPREG32(CTR):
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
> +                system_cpuinfo.ctr.bits[0]);
> +
> +    case HSR_CPREG32(CLIDR):
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
> +                READ_SYSREG(CLIDR_EL1));
> +
> +    case HSR_CPREG32(CSSELR):
> +        if ( psr_mode_is_user(regs) )
> +            return inject_undef_exception(regs, hsr);
> +        if ( cp32.read )
> +            set_user_reg(regs, regidx, v->arch.csselr);
> +        else
> +            v->arch.csselr = get_user_reg(regs, regidx);
> +        break;
> +
> +    case HSR_CPREG32(CCSIDR):
> +        if ( psr_mode_is_user(regs) )
> +            return inject_undef_exception(regs, hsr);
> +        if ( cp32.read )
> +        {
> +            /* we need to set CSSELR and do the read of CCSIDR atomically */
> +            WRITE_SYSREG(v->arch.csselr, CSSELR_EL1);
> +            set_user_reg(regs, regidx, READ_SYSREG(CCSIDR_EL1));
> +        }
> +        break;
> +
> +    case HSR_CPREG32(CCSIDR2):
> +        /*
> +         * This would need to return a properly defined value if CCIDX is
> +         * implemented in the processor
> +         */
> +        return inject_undef_exception(regs, hsr);
> +
> +#endif
> +
>       /*
>        * HCR_EL2.TIDCP
>        *
> diff --git a/xen/include/asm-arm/arm64/hsr.h b/xen/include/asm-arm/arm64/hsr.h
> index e691d41c17..c33980e4e5 100644
> --- a/xen/include/asm-arm/arm64/hsr.h
> +++ b/xen/include/asm-arm/arm64/hsr.h
> @@ -147,6 +147,12 @@
>   #define HSR_SYSREG_ID_AA64AFR1_EL1   HSR_SYSREG(3,0,c0,c5,5)
>   #define HSR_SYSREG_ID_AA64ZFR0_EL1   HSR_SYSREG(3,0,c0,c4,4)
>   
> +#define HSR_SYSREG_CTR_EL0      HSR_SYSREG(3,3,c0,c0,1)
> +#define HSR_SYSREG_CLIDR_EL1    HSR_SYSREG(3,1,c0,c0,1)
> +#define HSR_SYSREG_CSSELR_EL1   HSR_SYSREG(3,2,c0,c0,0)
> +#define HSR_SYSREG_CCSIDR_EL1   HSR_SYSREG(3,1,c0,c0,0)
> +#define HSR_SYSREG_CCSIDR2_EL1  HSR_SYSREG(3,1,c0,c0,2)
> +
>   #endif /* __ASM_ARM_ARM64_HSR_H */
>   
>   /*
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 5219fd3bab..ca6e827fcb 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -267,6 +267,14 @@ struct cpuinfo_arm {
>           register_t bits[1];
>       } dczid;
>   
> +    /*
> +     * CTR is only used to check for different cache types or policies and
> +     * taint Xen in this case
> +     */
> +    struct {
> +        register_t bits[1];
> +    } ctr;
> +
>   #endif
>   
>       /*
> @@ -339,6 +347,9 @@ extern struct cpuinfo_arm system_cpuinfo;
>   extern void identify_cpu(struct cpuinfo_arm *);
>   
>   #ifdef CONFIG_ARM_64
> +
> +extern bool mismatched_cache_type;
> +
>   extern void update_system_features(const struct cpuinfo_arm *);
>   #else
>   static inline void update_system_features(const struct cpuinfo_arm *cpuinfo)
> diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
> index 2577e9a244..8c9843e12b 100644
> --- a/xen/include/asm-arm/processor.h
> +++ b/xen/include/asm-arm/processor.h
> @@ -7,9 +7,21 @@
>   #include <public/arch-arm.h>
>   
>   /* CTR Cache Type Register */
> -#define CTR_L1Ip_MASK       0x3
> -#define CTR_L1Ip_SHIFT      14
> -#define CTR_L1Ip_AIVIVT     0x1
> +#define CTR_L1IP_MASK       0x3
> +#define CTR_L1IP_SHIFT      14
> +#define CTR_DMINLINE_SHIFT  16
> +#define CTR_IMINLINE_SHIFT  0
> +#define CTR_IMINLINE_MASK   0xf
> +#define CTR_ERG_SHIFT       20
> +#define CTR_CWG_SHIFT       24
> +#define CTR_CWG_MASK        15
> +#define CTR_IDC_SHIFT       28
> +#define CTR_DIC_SHIFT       29
> +
> +#define ICACHE_POLICY_VPIPT  0
> +#define ICACHE_POLICY_AIVIVT 1
> +#define ICACHE_POLICY_VIPT   2
> +#define ICACHE_POLICY_PIPT   3
>   
>   /* MIDR Main ID Register */
>   #define MIDR_REVISION_MASK      0xf
> 

Cheers,

-- 
Julien Grall

