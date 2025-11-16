Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3F9C6154F
	for <lists+xen-devel@lfdr.de>; Sun, 16 Nov 2025 14:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163294.1490467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKcOl-0008Vl-6F; Sun, 16 Nov 2025 13:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163294.1490467; Sun, 16 Nov 2025 13:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKcOl-0008TQ-3K; Sun, 16 Nov 2025 13:02:31 +0000
Received: by outflank-mailman (input) for mailman id 1163294;
 Sun, 16 Nov 2025 13:02:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vKcOi-0008TK-VV
 for xen-devel@lists.xenproject.org; Sun, 16 Nov 2025 13:02:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKcOi-00A8J3-0g;
 Sun, 16 Nov 2025 13:02:28 +0000
Received: from [2a02:8012:3a1:0:850b:33c3:9f1f:5f9a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKcOh-000l0y-2t;
 Sun, 16 Nov 2025 13:02:28 +0000
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
	bh=ho6aklSNMVPgjXH534W+uD6zReKPs/VuFqARIVT4RTg=; b=1YH8KMmOzDFn8Lg3ryAVsk0suG
	OlwO2kJCswCdAlfiv+aQlxVZjl69cJnHNSMG/SB/+VnpI7FD+6Edqqta+nkm/WU5c3gHLkHaEDCDb
	aATB4qZYRm6kDE00dB5HgVMhi1pyMl8dHAwuwK7jHUbp5Mxd2u+8hAz52NhtGh4rF9lU=;
Message-ID: <cf7ab262-59f4-4f92-8194-be16b56ccbdc@xen.org>
Date: Sun, 16 Nov 2025 13:02:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/arm/p2m: perform IPA-based TLBI for arm64 when
 IPA is known
Content-Language: en-GB
To: Haseeb Ashraf <haseebashraf091@gmail.com>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dan Driscoll <dan.driscoll@siemens.com>,
 Noor Ahsan Khawaja <noor.ahsan@siemens.com>,
 Fahad Arslan <fahad.arslan@siemens.com>,
 Andrew Bachtel <andrew.bachtel@siemens.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20251105124727.142272-1-haseebashraf091@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20251105124727.142272-1-haseebashraf091@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Haseeb,

On 05/11/2025 12:47, Haseeb Ashraf wrote:
> From: Haseeb Ashraf <haseeb.ashraf@siemens.com>
> 
> This commit addresses a major issue for running Xen on KVM arm64 i.e.
> costly emulation of VMALLS12E1IS which becomes worse when this TLBI
> is invoked too many times. There are mainly two places where this is
> problematic:
> (a) When vCPUs switch on a pCPU or pCPUs
> (b) When domu mapped pages onto dom0, are to be unmapped, then each
>      page being removed by XENMEM_remove_from_physmap has its TLBs
>      invalidated by VMALLS12E1IS.
> 
> The first one is addressed by relaxing VMALLS12E1IS -> VMALLE1IS.
> Each CPU have their own private TLBs, so flush between vCPU of the
> same domains is required to avoid translations from vCPUx to "leak"
> to the vCPUy.

This doesn't really tell me why we don't need the flush the S2. The key 
point is (barring altp2m) the stage-2 is common between all the vCPUs of 
a VM.

> This can be achieved by using VMALLE1. If FEAT_nTLBPA
> is present then VMALLE1 can also be avoided.

I had a look at the Arm Arm and I can't figure out why it is fine to 
skip the flush. Can you provide a pointer? BTW, in general, it is useful 
to quote the Arm Arm for the reviewer and future reader. It makes easier 
to find what you are talking about.

> 
> The second one is addressed by using IPA-based TLBI (IPAS2E1) in
> combination with VMALLE1 whenever the IPA range is known instead of
> using VMALLS12E1. Again, VMALLE1 can be avoided FEAT_nTLBPA is
> present.
> 
> Suggested-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
> ---
>   xen/arch/arm/include/asm/arm64/flushtlb.h | 34 ++++++++
>   xen/arch/arm/include/asm/arm64/sysregs.h  |  1 +
>   xen/arch/arm/include/asm/cpufeature.h     |  3 +-
>   xen/arch/arm/include/asm/mmu/p2m.h        |  4 +
>   xen/arch/arm/include/asm/processor.h      |  2 +
>   xen/arch/arm/mmu/p2m.c                    | 96 ++++++++++++++++++++++-
>   6 files changed, 136 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
> index 3b99c11b50..6703aab8a7 100644
> --- a/xen/arch/arm/include/asm/arm64/flushtlb.h
> +++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
> @@ -45,6 +45,27 @@ static inline void name(void)                    \
>           : : : "memory");                         \
>   }
>   
> +/*
> + * FLush TLB by IPA. This will likely be used in a loop, so the caller
> + * is responsible to use the appropriate memory barriers before/after
> + * the sequence.

If the goal is to call TLB_HELPER_IPA() in a loop, then the current 
implementation is too expensive.

If the CPU doesn't need the repeat TLBI workaround, then you only need 
to do the dsb; isb once.

If the CPU need the repeat TLBI workaround, looking at the Cortex A76 
errata doc (https://developer.arm.com/documentation/SDEN885749/latest/) 
then I think you might be able to do:

"Flush TLBs"
"DSB"
"ISB"
"Flush TLBs"
"DSB"
"ISB"

Bertrand, what do you think?

> + *
> + * See above about the ARM64_WORKAROUND_REPEAT_TLBI sequence.
> + */
 > +#define TLB_HELPER_IPA(name, tlbop)              \> +static inline 
void name(paddr_t ipa)             \
> +{                                                \
> +    asm volatile(                                \
> +        "tlbi "  # tlbop  ", %0;"                \
> +        ALTERNATIVE(                             \
> +            "nop; nop;",                         \
> +            "dsb  ish;"                          \
> +            "tlbi "  # tlbop  ", %0;",           \
> +            ARM64_WORKAROUND_REPEAT_TLBI,        \
> +            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
> +        : : "r" (ipa >> PAGE_SHIFT) : "memory"); \
> +}
> +
>   /*
>    * FLush TLB by VA. This will likely be used in a loop, so the caller
>    * is responsible to use the appropriate memory barriers before/after
> @@ -72,6 +93,18 @@ TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh)
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
> +TLB_HELPER_IPA(flush_guest_tlb_one_s2_local, ipas2e1)
> +
> +/* Flush innershareable TLBs, current VMID, stage-2 for ipa address */
> +TLB_HELPER_IPA(flush_guest_tlb_one_s2, ipas2e1is)
> +
>   /* Flush local TLBs, all VMIDs, non-hypervisor mode */
>   TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh)
>   
> @@ -88,6 +121,7 @@ TLB_HELPER_VA(__flush_xen_tlb_one_local, vae2)
>   TLB_HELPER_VA(__flush_xen_tlb_one, vae2is)
>   
>   #undef TLB_HELPER
> +#undef TLB_HELPER_IPA
>   #undef TLB_HELPER_VA
>   
>   #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 7440d495e4..30a7c3b9fd 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -286,6 +286,7 @@
>   
>   /* id_aa64mmfr1 */
>   #define ID_AA64MMFR1_ECBHB_SHIFT     60
> +#define ID_AA64MMFR1_NTLBPA_SHIFT    48
>   #define ID_AA64MMFR1_AFP_SHIFT       44
>   #define ID_AA64MMFR1_ETS_SHIFT       36
>   #define ID_AA64MMFR1_TWED_SHIFT      32
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index b6df188011..21df7603fc 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -269,7 +269,8 @@ struct cpuinfo_arm {
>               unsigned long ets:4;
>               unsigned long __res1:4;
>               unsigned long afp:4;
> -            unsigned long __res2:12;
> +            unsigned long ntlbpa:4;
> +            unsigned long __res2:8;
>               unsigned long ecbhb:4;
>   
>               /* MMFR2 */
> diff --git a/xen/arch/arm/include/asm/mmu/p2m.h b/xen/arch/arm/include/asm/mmu/p2m.h
> index 58496c0b09..fc2e08bbe8 100644
> --- a/xen/arch/arm/include/asm/mmu/p2m.h
> +++ b/xen/arch/arm/include/asm/mmu/p2m.h
> @@ -10,6 +10,10 @@ extern unsigned int p2m_root_level;
>   
>   struct p2m_domain;
>   void p2m_force_tlb_flush_sync(struct p2m_domain *p2m);
> +#ifdef CONFIG_ARM_64

We should also handle Arm 32-bit. Barring nTLBA, the code should be the 
same.

> +void p2m_force_tlb_flush_range_sync(struct p2m_domain *p2m, uint64_t start_ipa,
> +                                    uint64_t page_count);
> +#endif
>   void p2m_tlb_flush_sync(struct p2m_domain *p2m);
>   
>   void p2m_clear_root_pages(struct p2m_domain *p2m);
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 92c8bc1a31..07f6a2ef6a 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -461,6 +461,8 @@
>   #ifdef CONFIG_ARM_64
>   #define MM64_VMID_8_BITS_SUPPORT    0x0
>   #define MM64_VMID_16_BITS_SUPPORT   0x2
> +#define MM64_NTLBPA_SUPPORT_NI      0x0
> +#define MM64_NTLBPA_SUPPORT_IMP     0x1
>   #endif
>   
>   #ifndef __ASSEMBLY__
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 51abf3504f..28268fb67f 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -235,7 +235,12 @@ void p2m_restore_state(struct vcpu *n)
>        * when running multiple vCPU of the same domain on a single pCPU.
>        */
>       if ( *last_vcpu_ran != INVALID_VCPU_ID && *last_vcpu_ran != n->vcpu_id )
> +#ifdef CONFIG_ARM_64
> +        if ( system_cpuinfo.mm64.ntlbpa != MM64_NTLBPA_SUPPORT_IMP )

If we decide to use nTLBA, then we should introduce a capability so the 
check can be patched at aboot time.

> +            flush_guest_tlb_s1_local();
> +#else
>           flush_guest_tlb_local();
> +#endif
>   
>       *last_vcpu_ran = n->vcpu_id;
>   }
> @@ -293,6 +298,75 @@ void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>       p2m->need_flush = false;
>   }
>   
> +#ifdef CONFIG_ARM_64
> +/*
> + * Force a synchronous P2M TLB flush on a range of addresses.
> + *
> + * Must be called with the p2m lock held.
> + */
> +void p2m_force_tlb_flush_range_sync(struct p2m_domain *p2m, uint64_t start_ipa,
> +                                    uint64_t page_count)
> +{
> +    unsigned long flags = 0;
> +    uint64_t ovttbr;
> +    uint64_t ipa = start_ipa;
> +    uint64_t i;
> +
> +    ASSERT(p2m_is_write_locked(p2m));
> +
> +    /*
> +     * ARM only provides an instruction to flush TLBs for the current
> +     * VMID. So switch to the VTTBR of a given P2M if different.
> +     */
> +    ovttbr = READ_SYSREG64(VTTBR_EL2);
> +    if ( ovttbr != p2m->vttbr )
> +    {
> +        uint64_t vttbr;
> +
> +        local_irq_save(flags);
> +
> +        /*
> +         * ARM64_WORKAROUND_AT_SPECULATE: We need to stop AT to allocate
> +         * TLBs entries because the context is partially modified. We
> +         * only need the VMID for flushing the TLBs, so we can generate
> +         * a new VTTBR with the VMID to flush and the empty root table.
> +         */
> +        if ( !cpus_have_const_cap(ARM64_WORKAROUND_AT_SPECULATE) )
> +            vttbr = p2m->vttbr;
> +        else
> +            vttbr = generate_vttbr(p2m->vmid, empty_root_mfn);
> +
> +        WRITE_SYSREG64(vttbr, VTTBR_EL2);
> +
> +        /* Ensure VTTBR_EL2 is synchronized before flushing the TLBs */
> +        isb();
> +    }

I don't really like the idea to duplicate the AT speculation logic. 
Could we try to consolidate by introducing helper to load and unload the 
VTTBR?

> +
> +    /* Ensure prior page-tables updates have completed */
> +    dsb(ishst);
> +
> +    /* Invalidate stage-2 TLB entries by IPA range */
> +    for ( i = 0; i < page_count; i++ ) {
> +        flush_guest_tlb_one_s2(ipa);
> +        ipa += 1UL << PAGE_SHIFT;
> +    }

In theory, __p2m_set_entry() could modify large region. For 1GB region 
it means the loop would send 262144 TLB instructions. This seems quite a 
lot.

If the region is a superpage, then you might be able to send a single 
TLB instruction (need to confirm from the ARM ARM).

If the region contains multiple mapping, then I wonder whether it would 
be better to flush the full S2. Not sure what would be the threshold.

Bertrand, Michal, Stefano, any opinions?

> +
> +    if ( system_cpuinfo.mm64.ntlbpa != MM64_NTLBPA_SUPPORT_IMP )
> +        flush_guest_tlb_s1_local();
> +
> +    /* Ensure the TLB invalidation has completed */
> +    dsb(ishst);
> +
> +    if ( ovttbr != READ_SYSREG64(VTTBR_EL2) )
> +    {
> +        WRITE_SYSREG64(ovttbr, VTTBR_EL2);
> +        /* Ensure VTTBR_EL2 is back in place before continuing. */
> +        isb();
> +        local_irq_restore(flags);
> +    }
> +}
> +#endif
> +
>   void p2m_tlb_flush_sync(struct p2m_domain *p2m)
>   {
>       if ( p2m->need_flush )
> @@ -1034,7 +1108,12 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
>            * For more details see (D4.7.1 in ARM DDI 0487A.j).
>            */
>           p2m_remove_pte(entry, p2m->clean_pte);
> +#ifdef CONFIG_ARM_64
> +        p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
> +                                       1UL << page_order);
> +#else
>           p2m_force_tlb_flush_sync(p2m);
> +#endif
>   
>           p2m_write_pte(entry, split_pte, p2m->clean_pte);
>   
> @@ -1090,8 +1169,13 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
>           p2m_remove_pte(entry, p2m->clean_pte);
>   
>       if ( removing_mapping )
> +#ifdef CONFIG_ARM_64
> +        p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
> +                                       1UL << page_order);
> +#else
>           /* Flush can be deferred if the entry is removed */
>           p2m->need_flush |= !!lpae_is_valid(orig_pte);
> +#endif

To emphasis on what I wrote above, this is one of the reason I would 
strongly prefer if we had support for p2m_force_flush_range_sync() on 
Arm 32-bit. This would make the code a lot simpler and easier to reason.

>       else
>       {
>           lpae_t pte = mfn_to_p2m_entry(smfn, t, a);
> @@ -1102,17 +1186,23 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
>           /*
>            * It is necessary to flush the TLB before writing the new entry
>            * to keep coherency when the previous entry was valid.
> -         *
> -         * Although, it could be defered when only the permissions are
> -         * changed (e.g in case of memaccess).
>            */
>           if ( lpae_is_valid(orig_pte) )
>           {
> +#ifdef CONFIG_ARM_64
> +            p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
> +                                           1UL << page_order);
> +#else
> +        /*
> +         * Although, flush could be defered when only the permissions are
> +         * changed (e.g in case of memaccess).
> +         */
>               if ( likely(!p2m->mem_access_enabled) ||
>                    P2M_CLEAR_PERM(pte) != P2M_CLEAR_PERM(orig_pte) )
>                   p2m_force_tlb_flush_sync(p2m);
>               else
>                   p2m->need_flush = true;
> +#endif
>           }
>           else if ( !p2m_is_valid(orig_pte) ) /* new mapping */
>               p2m->stats.mappings[level]++;

Cheers,

-- 
Julien Grall


