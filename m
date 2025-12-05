Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC4ACA9A67
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 00:33:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179598.1503040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRfIM-0008FI-4d; Fri, 05 Dec 2025 23:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179598.1503040; Fri, 05 Dec 2025 23:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRfIM-0008Dr-1b; Fri, 05 Dec 2025 23:33:02 +0000
Received: by outflank-mailman (input) for mailman id 1179598;
 Fri, 05 Dec 2025 23:33:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vRfIK-0008Dk-PB
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 23:33:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vRfIK-008Sel-0C;
 Fri, 05 Dec 2025 23:33:00 +0000
Received: from [2a02:8012:3a1:0:854f:f005:1bb3:e60a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vRfIJ-000Lcp-1C;
 Fri, 05 Dec 2025 23:32:59 +0000
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
	bh=MhBWJ6axQuAjxK8+i48n1aoxKfH3LZm7+vNo05onsS8=; b=cnfB/1hjEWsZP0f9KGnuvWnJvH
	MF0llqCYyN9KUR3rwWqR8Pdee4m3rBKVtuiGThwBNCEYVapj1yjCfbuEc5XgpURJlaZZfRI3H/STB
	MjItCcud1oYuNk3Qq6DHnXw/Kd3bMQQrh/HrXGkixZYKfYZed1+SKfHmgfwNfozj/JhM=;
Message-ID: <a726e56e-b864-4ec1-81f4-da552fe71470@xen.org>
Date: Fri, 5 Dec 2025 23:32:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/3] xen/arm/p2m: perform IPA-based TLBI when IPA
 is known
Content-Language: en-GB
To: Haseeb Ashraf <haseebashraf091@gmail.com>, xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <ce2e7c32f06ba8a48a2074fa8cadd9c122b6490f.1764863575.git.haseebashraf091@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ce2e7c32f06ba8a48a2074fa8cadd9c122b6490f.1764863575.git.haseebashraf091@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Haseef,

Let me start with some process. In general, we expect multi-patch series 
to have a cover letter.

On 04/12/2025 15:57, Haseeb Ashraf wrote:
> From: Haseeb Ashraf <haseeb.ashraf@siemens.com>
> 
> This commit addresses a major issue for running Xen on KVM i.e.
> costly emulation of VMALLS12E1IS which becomes worse when this TLBI
> is invoked too many times. There are mainly two places where this is
> problematic:
> (a) When vCPUs switch on a pCPU or pCPUs
> (b) When domu mapped pages onto dom0, are to be unmapped, then each
>      page being removed by XENMEM_remove_from_physmap has its TLBs
>      invalidated by VMALLS12E1IS.
> 
> The first one is addressed by relaxing VMALLS12E1 -> VMALLE1 as the
> stage-2 is common between all the vCPUs of a VM. Since each CPU has
> its own private TLBs, so flush between vCPU of the same domains is
> still required to avoid translations from vCPUx to "leak" to the
> vCPUy which can be achieved by using VMALLE1.
> 
> The second one is addressed by using IPA-based TLBI (IPAS2E1) in
> combination with VMALLE1 whenever the IPA range is known instead of
> using VMALLS12E1. There is an upper cap placed on number of IPA-based
> TLBI. This factor for execution time of VMALLS12E1 vs IPAS2E1 is
> found to be 70K on Graviton4.

Is this running Xen on baremetal or in nested virt?

> So, ~65K * 4KB = 256M is set as the

Given that 4KB implies 4096 bytes. Did you intend to say 64K?

> threshold.
> 
> For arm32, TLBIALL instruction can invalidate both stage-1 and
> stage-2 entries, so using IPA-based TLBI would be redundant as
> TLBIALL is required in any case to invalidate corresponding cached
> entries from stage-1.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
> 
> Changes in v2:
> - Split up the commit in 3 commits. First commit implements the
>    basline implementation without any addition of new CPU
>    capabilities. Implemented new CPU caps in separate features to
>    emphasize how each of it optimizes the TLB invalidation.

This kind of changelog would belong to the cover letter. And each patch 
would contain specific changelog. For instance...

[...]

> - Evaluated and added a threshold to select between IPA-based TLB
>    invalidation vs fallback to full stage TLB invalidation above
>    the threshold.
> - Introduced ARM_HAS_NTLBPA CPU capability which leverages
>    FEAT_nTLBPA for arm32 as well as arm64.
> - Introduced ARM_HAS_TLB_IPA CPU capability for IPA-based TLBI
>    for arm32.

... none of these are related to this patch and it is quite confusing.

> ---
>   xen/arch/arm/include/asm/arm32/flushtlb.h | 69 ++++++++++++++++
>   xen/arch/arm/include/asm/arm64/flushtlb.h | 99 +++++++++++++++++++++++
>   xen/arch/arm/include/asm/mmu/p2m.h        |  2 +
>   xen/arch/arm/mmu/p2m.c                    | 94 ++++++++++++++-------
>   4 files changed, 237 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
> index 61c25a3189..70a8b1dad6 100644
> --- a/xen/arch/arm/include/asm/arm32/flushtlb.h
> +++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
> @@ -45,6 +45,46 @@ TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh)
>   
>   #undef TLB_HELPER
>   
> +/*
> + * Flush TLB of local processor. Use when flush for only stage-1 is
> + * intended.
> + */
> +static inline void flush_guest_tlb_s1_local(void)
> +{
> +    /*
> +     * Same instruction can invalidate both stage-1 and stage-2 TLBs
> +     * depending upon the execution context.
> +     *
> +     * See ARMv8 (DDI 0487A.e): G4-4126 Table G4-24.

This version of the specification is 10 years old. Any reason to use 
something that old?

> +     *
> +     * The following macros should be used where intention is to
> +     * clear only stage-1 TLBs. This would be helpful in future in
> +     * identifying which stage-1 TLB flushes can be skipped such as
> +     * in present of FEAT_nTLBPA.
> +     */

I am sorry but I don't get this comment. There is no macro involved 
(flush_guest_tlb_local() is an inline function). Is this meant to be a 
big comment outside of the function?

> +    return flush_guest_tlb_local();
> +}
> +
> +/*
> + * Flush TLB of inner-shareable processor domain. Use when flush for
> + * only stage-1 is intended.
> + */
> +static inline void flush_guest_tlb_s1(void)
> +{
> +    /*
> +     * Same instruction can invalidate both stage-1 and stage-2 TLBs
> +     * depending upon the execution context.
> +     *
> +     * See ARMv8 (DDI 0487A.e): G4-4126 Table G4-24.
> +     *
> +     * The following macros should be used where intention is to
> +     * clear only stage-1 TLBs. This would be helpful in future in
> +     * identifying which stage-1 TLB flushes can be skipped such as
> +     * in present of FEAT_nTLBPA.
> +     */
> +    return flush_guest_tlb();
> +}
> +
>   /* Flush TLB of local processor for address va. */
>   static inline void __flush_xen_tlb_one_local(vaddr_t va)
>   {
> @@ -57,6 +97,35 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
>       asm volatile(STORE_CP32(0, TLBIMVAHIS) : : "r" (va) : "memory");
>   }
>   
> +/*
> + * Flush a range of IPA's mappings from the TLB of the local processor.
> + */
> +static inline void flush_guest_tlb_range_ipa_local(paddr_t ipa,
> +                                                   unsigned long size)

I can't seem to find any use of flush_guest_tlb_range_ipa_local() in 
this series. Can we avoid introducing it? (I also have the suspicion 
this would violate the MISRA rules about dead code).

> +{
> +    /*
> +     * Following can invalidate both stage-1 and stage-2 TLBs depending upon
> +     * the execution mode.
> +     * see ARMv8 (DDI 0487A.e): G4-4126 Table G4-24
> +     */
> +    flush_guest_tlb_local();
> +}
> +
> +/*
> + * Flush a range of IPA's mappings from the TLB of all processors in the
> + * inner-shareable domain.
> + */
> +static inline void flush_guest_tlb_range_ipa(paddr_t ipa,
> +                                             unsigned long size)
> +{
> +    /*
> +     * Following can invalidate both stage-1 and stage-2 TLBs depending upon
> +     * the execution mode.
> +     * see ARMv8 (DDI 0487A.e): G4-4126 Table G4-24
> +     */
> +    flush_guest_tlb();
> +}
> +
>   #endif /* __ASM_ARM_ARM32_FLUSHTLB_H__ */
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
> index 3b99c11b50..fff76375a3 100644
> --- a/xen/arch/arm/include/asm/arm64/flushtlb.h
> +++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
> @@ -1,6 +1,8 @@
>   #ifndef __ASM_ARM_ARM64_FLUSHTLB_H__
>   #define __ASM_ARM_ARM64_FLUSHTLB_H__
>   
> +#include <xen/sizes.h> /* For SZ_* macros. */
> +
>   /*
>    * Every invalidation operation use the following patterns:
>    *
> @@ -45,6 +47,27 @@ static inline void name(void)                    \
>           : : : "memory");                         \
>   }
>   
> +/*
> + * FLush TLB by IPA. This will likely be used in a loop, so the caller
> + * is responsible to use the appropriate memory barriers before/after
> + * the sequence.
> + *
> + * See above about the ARM64_WORKAROUND_REPEAT_TLBI sequence.
> + */
> +#define TLB_HELPER_IPA(name, tlbop)              \
> +static inline void name(paddr_t ipa)             \
> +{                                                \
> +    asm volatile(                                \
> +        "tlbi "  # tlbop  ", %0;"                \
> +        ALTERNATIVE(                             \
> +            "nop; nop;",                         \
> +            "dsb  ish;"                          \
> +            "tlbi "  # tlbop  ", %0;",           \
> +            ARM64_WORKAROUND_REPEAT_TLBI,        \
> +            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \

Sorry I didn't get a chance to answer to your reply on my comment here. 
If you read the errata for Cortex-A76:

"
Note: For code sequences which have multiple TLB invalidate instructions 
followed by a single DSB, only
the last TLB invalidate and DSB need to be repeated a second time.
"

So I still think this approach is still too expensive. To give some 
context, above you said we would send up to 64K TLB IPA operation before 
deciding to switch to a single flush all. In the context of this errata, 
we would end up to send 64K extra TLBs when only one is necessary.

> +        : : "r" (ipa >> PAGE_SHIFT) : "memory"); \
> +}
> +
>   /*
>    * FLush TLB by VA. This will likely be used in a loop, so the caller
>    * is responsible to use the appropriate memory barriers before/after
> @@ -72,6 +95,18 @@ TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh)
>   /* Flush innershareable TLBs, current VMID only */
>   TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish)
>   
> +/* Flush local TLBs, current VMID, stage-1 only */
> +TLB_HELPER(flush_guest_tlb_s1_local, vmalle1, nsh)
> +
> +/* Flush innershareable TLBs, current VMID, stage-1 only */
> +TLB_HELPER(flush_guest_tlb_s1, vmalle1is, ish)
> +
> +/* Flush local TLBs, current VMID, stage-2 for ipa address */
> +TLB_HELPER_IPA(__flush_guest_tlb_one_s2_local, ipas2e1)
> +
> +/* Flush innershareable TLBs, current VMID, stage-2 for ipa address */
> +TLB_HELPER_IPA(__flush_guest_tlb_one_s2, ipas2e1is)
> +
>   /* Flush local TLBs, all VMIDs, non-hypervisor mode */
>   TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh)
>   
> @@ -88,8 +123,72 @@ TLB_HELPER_VA(__flush_xen_tlb_one_local, vae2)
>   TLB_HELPER_VA(__flush_xen_tlb_one, vae2is)
>   
>   #undef TLB_HELPER
> +#undef TLB_HELPER_IPA
>   #undef TLB_HELPER_VA
>   
> +/*
> + * Flush a range of IPA's mappings from the TLB of the local processor.
> + */
> +static inline void flush_guest_tlb_range_ipa_local(paddr_t ipa,
> +                                                   unsigned long size)
> +{
> +    paddr_t end;
> +
> +    /*
> +     * If IPA range is too big (empirically found to be 256M), then fallback to
> +     * full TLB flush
> +     */

Bertrand, Michal, Stefano, Luca, can you check this limit would be ok 
for your setup?

> +    if ( size > SZ_256M )
> +        return flush_guest_tlb_local();
> +
> +    end = ipa + size;
> +
> +    /*
> +     * See ARM ARM DDI 0487A.e D4.7.2 (Invalidation of TLB entries from stage 2
> +     * translations) for details.
> +     */
> +    dsb(nshst); /* Ensure prior page-tables updates have completed */
> +    while ( ipa < end )
> +    {
> +        __flush_guest_tlb_one_s2_local(ipa);
> +        ipa += PAGE_SIZE;
> +    }
> +    /* Final dsb() and isb() are done in following invocation */
> +    flush_guest_tlb_s1_local();
> +}
> +
> +/*
> + * Flush a range of IPA's mappings from the TLB of all processors in the
> + * inner-shareable domain.
> + */
> +static inline void flush_guest_tlb_range_ipa(paddr_t ipa,
> +                                             unsigned long size)
> +{
> +    paddr_t end;
> +
> +    /*
> +     * If IPA range is too big (empirically found to be 256M), then fallback to
> +     * full TLB flush
> +     */
> +    if ( size > SZ_256M )
> +        return flush_guest_tlb();
> +
> +    end = ipa + size;
> +
> +    /*
> +     * See ARM ARM DDI 0487A.e D4.7.2 (Invalidation of TLB entries from stage 2
> +     * translations) for details.
> +     */
> +    dsb(ishst); /* Ensure prior page-tables updates have completed */
> +    while ( ipa < end )
> +    {
> +        __flush_guest_tlb_one_s2(ipa);
> +        ipa += PAGE_SIZE;
> +    }
> +    /* Final dsb() and isb() are done in following invocation */
> +    flush_guest_tlb_s1();
> +}
> +
>   #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/include/asm/mmu/p2m.h b/xen/arch/arm/include/asm/mmu/p2m.h
> index 58496c0b09..8a16722b82 100644
> --- a/xen/arch/arm/include/asm/mmu/p2m.h
> +++ b/xen/arch/arm/include/asm/mmu/p2m.h
> @@ -10,6 +10,8 @@ extern unsigned int p2m_root_level;
>   
>   struct p2m_domain;
>   void p2m_force_tlb_flush_sync(struct p2m_domain *p2m);
> +void p2m_force_tlb_flush_range_sync(struct p2m_domain *p2m, uint64_t start_ipa,
> +                                    uint64_t page_count);
>   void p2m_tlb_flush_sync(struct p2m_domain *p2m);
>   
>   void p2m_clear_root_pages(struct p2m_domain *p2m);
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 51abf3504f..e72b06b732 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -235,33 +235,26 @@ void p2m_restore_state(struct vcpu *n)
>        * when running multiple vCPU of the same domain on a single pCPU.
>        */
>       if ( *last_vcpu_ran != INVALID_VCPU_ID && *last_vcpu_ran != n->vcpu_id )
> -        flush_guest_tlb_local();
> +        flush_guest_tlb_s1_local();
>   
>       *last_vcpu_ran = n->vcpu_id;
>   }
>   
>   /*
> - * Force a synchronous P2M TLB flush.
> + * Loads VTTBR from given P2M.
>    *
> - * Must be called with the p2m lock held.

Don't we still want to call p2m_load_vttbr() with the lock taken? If 
so.. this should be kept as well as ...

> + * This returns switched out VTTBR.
 >    */> -void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
> +static uint64_t p2m_load_vttbr(struct p2m_domain *p2m, unsigned long *flags)
>   {
> -    unsigned long flags = 0;
>       uint64_t ovttbr;
>   
> -    ASSERT(p2m_is_write_locked(p2m));

... this assert.

> -
> -    /*
> -     * ARM only provides an instruction to flush TLBs for the current
> -     * VMID. So switch to the VTTBR of a given P2M if different.
> -     */
>       ovttbr = READ_SYSREG64(VTTBR_EL2);
>       if ( ovttbr != p2m->vttbr )
>       {
>           uint64_t vttbr;
>   
> -        local_irq_save(flags);
> +        local_irq_save(*flags);
>   
>           /*
>            * ARM64_WORKAROUND_AT_SPECULATE: We need to stop AT to allocate
> @@ -276,12 +269,18 @@ void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>   
>           WRITE_SYSREG64(vttbr, VTTBR_EL2);
>   
> -        /* Ensure VTTBR_EL2 is synchronized before flushing the TLBs */
> +        /* Ensure VTTBR_EL2 is in place before continuing. */

I think the existing code is better. "in place" is vague and could only. 
mean the value should be loaded in VTTBR_EL2.

The rest of the patch looks good to me.

Cheers,

-- 
Julien Grall


