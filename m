Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7ACA9ABE
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 01:04:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179621.1503074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRfm4-0004mY-21; Sat, 06 Dec 2025 00:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179621.1503074; Sat, 06 Dec 2025 00:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRfm3-0004kf-Vg; Sat, 06 Dec 2025 00:03:43 +0000
Received: by outflank-mailman (input) for mailman id 1179621;
 Sat, 06 Dec 2025 00:03:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vRfm3-0004kZ-D9
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 00:03:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vRfm2-008Tuh-1g;
 Sat, 06 Dec 2025 00:03:42 +0000
Received: from [2a02:8012:3a1:0:854f:f005:1bb3:e60a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vRfm1-0034f6-2j;
 Sat, 06 Dec 2025 00:03:42 +0000
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
	bh=JFqPOuRkfIdsKdnzGs6Jef0+U3BgrQIy5TzvYJQg+5M=; b=I5ueRRoQvWhZG7icLdboT5gXbj
	rXwcGa1r9TFud9d3X0wchsL0u+j8cqCzri7G9DT3e053154X8DOdBMzGR76fVT2svBilJwSFZu4gH
	dEzTCcd8/lCBxP6tU2CJjDzaBxDoeSjpWc2Bu463psJibHtTShCOSKIsz3uu/2UeDwfc=;
Message-ID: <e91789c6-37c3-406b-aab8-40b87a12425b@xen.org>
Date: Sat, 6 Dec 2025 00:03:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] xen/arm32: add CPU capability for IPA-based
 TLBI
Content-Language: en-GB
To: Haseeb Ashraf <haseebashraf091@gmail.com>, xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <ce2e7c32f06ba8a48a2074fa8cadd9c122b6490f.1764863575.git.haseebashraf091@gmail.com>
 <c06892e2b356b3186f790d96889b4ca9ba2498e0.1764863575.git.haseebashraf091@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c06892e2b356b3186f790d96889b4ca9ba2498e0.1764863575.git.haseebashraf091@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Haseeb,

On 04/12/2025 15:57, Haseeb Ashraf wrote:
> From: Haseeb Ashraf <haseeb.ashraf@siemens.com>
> 
> This feature is available since armv8 and can be used to perform
> IPA-based TLBI for arm32. XENMEM_remove_from_physmap performs this
> invalidation in each hypercall so this code path will be optimized,
> instead of performing a TLBIALL each time in presence of nTLBPA.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
> ---
>   xen/arch/arm/cpufeature.c                 | 12 ++++
>   xen/arch/arm/include/asm/arm32/flushtlb.h | 76 +++++++++++++++++++++++
>   xen/arch/arm/include/asm/cpregs.h         |  4 ++
>   xen/arch/arm/include/asm/cpufeature.h     |  7 ++-
>   xen/arch/arm/include/asm/processor.h      |  8 +++
>   5 files changed, 105 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 9fa1c45869..d18c6449c6 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -18,6 +18,11 @@ DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>   struct cpuinfo_arm __read_mostly domain_cpuinfo;
>   
>   #ifdef CONFIG_ARM_32
> +static bool has_tlb_ipa_instruction(const struct arm_cpu_capabilities *entry)
> +{
> +    return system_cpuinfo.mm32.unitlb == MM32_UNITLB_BY_IPA;
> +}
> +
>   static bool has_ntlbpa(const struct arm_cpu_capabilities *entry)
>   {
>       return system_cpuinfo.mm32.ntlbpa == MM32_NTLBPA_SUPPORT_IMP;
> @@ -37,6 +42,13 @@ static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
>   #endif
>   
>   static const struct arm_cpu_capabilities arm_features[] = {
> +#ifdef CONFIG_ARM_32
> +    {
> +        .desc = "IPA-based TLB Invalidation",
> +        .capability = ARM32_HAS_TLB_IPA,
> +        .matches = has_tlb_ipa_instruction,
> +    },
> +#endif
>   #if defined(CONFIG_ARM_32) || defined(CONFIG_ARM_64)
>       {
>           .desc = "Intermediate caching of translation table walks (nTLBPA)",
> diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
> index db15f29216..0fd45aaaed 100644
> --- a/xen/arch/arm/include/asm/arm32/flushtlb.h
> +++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
> @@ -1,6 +1,8 @@
>   #ifndef __ASM_ARM_ARM32_FLUSHTLB_H__
>   #define __ASM_ARM_ARM32_FLUSHTLB_H__
>   
> +#include <xen/sizes.h> /* For SZ_* macros. */
> +
>   /*
>    * Every invalidation operation use the following patterns:
>    *
> @@ -99,12 +101,56 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
>       asm volatile(STORE_CP32(0, TLBIMVAHIS) : : "r" (va) : "memory");
>   }
>   
> +/* Flush TLB of local processor for address ipa. */
> +static inline void __flush_guest_tlb_one_s2_local(paddr_t ipa)
> +{
> +    asm volatile(STORE_CP32(0, TLBIIPAS2)
> +                 : : "r" (ipa >> PAGE_SHIFT) : "memory");
> +}
> +
> +/* Flush TLB of all processors in the inner-shareable domain for address ipa. */
> +static inline void __flush_guest_tlb_one_s2(paddr_t ipa)
> +{
> +    asm volatile(STORE_CP32(0, TLBIIPAS2IS)
> +                 : : "r" (ipa >> PAGE_SHIFT) : "memory");
> +}
> +
>   /*
>    * Flush a range of IPA's mappings from the TLB of the local processor.
>    */
>   static inline void flush_guest_tlb_range_ipa_local(paddr_t ipa,
>                                                      unsigned long size)
>   {
> +    if ( cpus_have_const_cap(ARM_HAS_NTLBPA) &&
> +         cpus_have_const_cap(ARM32_HAS_TLB_IPA) )

I think this deserve a comment in the code explaining the logic for the 
decision. AFAIU, we require both capabilities because we would need to 
invalidate the S1 separately otherwise and on Arm32, there is not TLB 
instruction to just flush the S1. So it is pointless to flush by IPA.

> +    {
> +        paddr_t end;
> +
> +        /*
> +         * If IPA range is too big (empirically found to be 256M), then fallback
> +         * to full TLB flush
> +         */
> +        if ( size > SZ_256M )

I think we are hardcoding SZ_256M too many times for the same reason. It 
would be better if patch #1 introduces a define so we can explain in a 
single place the choice of the value. It would also be easier to update 
in the future.

 > +            goto default_tlbi;

Rather than having a goto, can't we just add this check in the 'if' 
above. So the function is turned to "if ... else".

> +
> +        end = ipa + size;
> +
> +        /*
> +         * See ARM ARM DDI 0487A.e D4.7.2 (Invalidation of TLB entries from
> +         * stage 2 translations) for details.
> +         */
> +        dsb(nshst); /* Ensure prior page-tables updates have completed */
> +        while ( ipa < end )
> +        {
> +            __flush_guest_tlb_one_s2_local(ipa);
> +            ipa += PAGE_SIZE;
> +        }
> +        dsb(nsh);
> +        isb();
> +        return;
> +    }
> +
> +default_tlbi:
>       /*
>        * Following can invalidate both stage-1 and stage-2 TLBs depending upon
>        * the execution mode.
> @@ -120,6 +166,36 @@ static inline void flush_guest_tlb_range_ipa_local(paddr_t ipa,
>   static inline void flush_guest_tlb_range_ipa(paddr_t ipa,
>                                                unsigned long size)
>   {
> +    if ( cpus_have_const_cap(ARM_HAS_NTLBPA) &&
> +         cpus_have_const_cap(ARM32_HAS_TLB_IPA) )
> +    {
> +        paddr_t end;
> +
> +        /*
> +         * If IPA range is too big (empirically found to be 256M), then fallback
> +         * to full TLB flush
> +         */
> +        if ( size > SZ_256M )
> +            goto default_tlbi;
 > +> +        end = ipa + size;
> +
> +        /*
> +         * See ARM ARM DDI 0487A.e D4.7.2 (Invalidation of TLB entries from
> +         * stage 2 translations) for details.
> +         */
> +        dsb(ishst); /* Ensure prior page-tables updates have completed */
> +        while ( ipa < end )
> +        {
> +            __flush_guest_tlb_one_s2(ipa);
> +            ipa += PAGE_SIZE;
> +        }
> +        dsb(ish);
> +        isb();
> +        return;
> +    }
> +
> +default_tlbi:
>       /*
>        * Following can invalidate both stage-1 and stage-2 TLBs depending upon
>        * the execution mode.
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index a7503a190f..46415b05d3 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -229,6 +229,10 @@
>   #define TLBIALLH        p15,4,c8,c7,0   /* Invalidate Entire Hyp. Unified TLB */
>   #define TLBIMVAH        p15,4,c8,c7,1   /* Invalidate Unified Hyp. TLB by MVA */
>   #define TLBIALLNSNH     p15,4,c8,c7,4   /* Invalidate Entire Non-Secure Non-Hyp. Unified TLB */
> +#define TLBIIPAS2IS     p15,4,c8,c0,1   /* Invalidate unified TLB entry for stage 2 by IPA inner shareable */
> +#define TLBIIPAS2LIS    p15,4,c8,c0,5   /* Invalidate unified TLB entry for stage 2 last level by IPA inner shareable */
> +#define TLBIIPAS2       p15,4,c8,c4,1   /* Invalidate unified TLB entry for stage 2 by IPA */
> +#define TLBIIPAS2L      p15,4,c8,c4,5   /* Invalidate unified TLB entry for stage 2 last level by IPA */

The cpregs are meant to be define in a specific order:

  * Order registers by Coprocessor-> CRn-> Opcode 1-> CRm-> Opcode 2

But if I am not mistaken, this would need to be moved a big higher in 
the list.

>   
>   /* CP15 CR9: Performance monitors */
>   #define PMCR            p15,0,c9,c12,0  /* Perf. Mon. Control Register */
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index af4e9bdf06..8f6b889850 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -77,8 +77,9 @@
>   #define ARM_HAS_SB 16
>   #define ARM64_WORKAROUND_1508412 17
>   #define ARM_HAS_NTLBPA 18
> +#define ARM32_HAS_TLB_IPA 19
>   
> -#define ARM_NCAPS           19
> +#define ARM_NCAPS           20
>   
>   #ifndef __ASSEMBLY__
>   
> @@ -440,7 +441,9 @@ struct cpuinfo_arm {
>               /* MMFR1 */
>               unsigned long __res1:32;
>               /* MMFR2 */
> -            unsigned long __res2:32;
> +            unsigned long __res2_0:16;
> +            unsigned long unitlb:4;
> +            unsigned long __res2_1:12;

There is only __res3 below. So let's rename it to __res4 and use __res3 
here.

>               /* MMFR3 */
>               unsigned long __res3:32;
>               /* MMFR4 */
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 01f3cb16a0..5a414e80df 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -459,6 +459,14 @@
>   #define FSRL_STATUS_DEBUG       (_AC(0x22,UL)<<0)
>   
>   #ifdef CONFIG_ARM_32
> +#define MM32_UNITLB_NI              0x0
> +#define MM32_UNITLB_BY_VA           0x1
> +#define MM32_UNITLB_BY_MATCH_ASID   0x2
> +#define MM32_UNITLB_BY_ALL_ASID     0x3
> +#define MM32_UNITLB_OTHER_TLBS      0x4

This name and ...

 > +#define MM32_UNITLB_BROADCAST       0x5


... this name are a bit confusing. For OTHER_TLBS, we still define some 
after. For BROADCAST, even before there was broadcast TLBs supported.

For simplicity, I would suggest just to define 0x6. We are not expected 
to use any other values. In fact for hypervisor mode, the minimum would 
be 0x4.

Cheers,

-- 
Julien Grall


