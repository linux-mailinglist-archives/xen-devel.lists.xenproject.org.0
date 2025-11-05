Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1ADC35B66
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 13:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156164.1485435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGd0n-0006Ia-An; Wed, 05 Nov 2025 12:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156164.1485435; Wed, 05 Nov 2025 12:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGd0n-0006Fl-83; Wed, 05 Nov 2025 12:53:17 +0000
Received: by outflank-mailman (input) for mailman id 1156164;
 Wed, 05 Nov 2025 12:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEDU=5N=gmail.com=haseebashraf091@srs-se1.protection.inumbo.net>)
 id 1vGcvU-0005AW-FE
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 12:47:48 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a08167ad-ba45-11f0-980a-7dc792cee155;
 Wed, 05 Nov 2025 13:47:45 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so4081573f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Nov 2025 04:47:45 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.37.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc1f5af7sm11129623f8f.28.2025.11.05.04.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 04:47:43 -0800 (PST)
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
X-Inumbo-ID: a08167ad-ba45-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762346865; x=1762951665; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NsyLKN81KL51kT2ye8MhBZOT8kMWEdsVKHKTDOIf0nM=;
        b=kxdt9rIWY1BE+i1qyn0hyX1bNbMcZy+B+aM4aTdLSc9U/Lltb/CHuIVcRMkXPYFRFq
         CwxQ5cNECsly0lqqpMUPBj/Gry7GW7B5Y9nCpxAQV8J2I34ySNUi6E+gBTGYzqfD+5IS
         Buh2ZVmwbe67wIUGUEUbRVsSuf3O0O9HXQCjNeh0+hyUs+oUApTYED5MTdW10GiK/LJz
         HVQc8OKpaoqacyhRMSHBMwu3pqrRuzdRPm+cLTPucuAlxtvT/Dd/LEM/cvtX1grbX+z8
         W4hjMTvULRsHyO9w2+salVBqCWGgKWP1UP2YOtAj/fat//BGIEyzmItWoSpyRa6jTQhm
         d15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762346865; x=1762951665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsyLKN81KL51kT2ye8MhBZOT8kMWEdsVKHKTDOIf0nM=;
        b=uLz/vG0bafZsn/pGBMYss+u9ixQDuvr9tkfVui3KHtmc5B8WIrKbgd7y49oZMFanxV
         cYc0z9lCHhcQ0aYIM0ulVTMW9X8Ujn9Me6D3SzADiFwvD0uYkr4Ly72OJhQAHKxgRwot
         L65SiSCzYiSHwhbLwy7NOZW8dl+dYMq/WX8xvC6kfRjnGqHFEcFzRPztwOt1j5w6hm+F
         JpEWOgq76zLMgg6NHhVfK0WNKw1R4Dcoslz8qWM+6Kh45u25Nciukjs3l5xt3znRB71I
         ycBGKAZykcuQIVAnOh4B9GOaTQpdRRYeLgqJKZIPPcRIOdt66H4VE3LJHuN/RozBM+YE
         t4zQ==
X-Gm-Message-State: AOJu0YyewgZ2Z1/exFfFwMZ80VHY9WxFWXP0cedkFpi0PfUDGhJ1T0JM
	/DQjcr22oAgVN+Q49/RDQ2efoWrQLDwQ2OP3ODs5LSiojV7q3Lr6pAd84pjOepfZHGs=
X-Gm-Gg: ASbGncvUBlENldb646iSiEeuF8s/yrA1+MrqBVvTMIzxy6igLp6posllPLHZBmndyUJ
	DzMPZ4F1P3Ta+VJAkkqUv6T2zu8uAMbkoLHw4OTD+PLQ3RtQfsFC2Z5hvtaNH37S7MT2pOnvI1X
	7t9CRMP2KGT5u1R5eKzX6ZpHrI9V4FTAWwDKMsmNZUlSiXsctyb9vEHozVfMyLAhzoaNL07h0Am
	X9z9h1P/dVHA0YZF5Qmdez5/hx0MI3CcxtI9w4vQMV0QbQdAZ6BUTv+lD+dBT+MgEQxE0jNNvYg
	VZneA7Z6tmP+qYN/YpvG+EMN/LOIWf1JO/l4Kmth3WhVbOwFC6b8LJzmlLPyDNFpBOloqhrCp/s
	dNZBNQYKHwyzFMPGtQe8l4XEvTqhr6z8Y6y7kdkwOr+1xf4Zme5Akpe9FjP75WA8dcGY5ot6QA+
	wFXypdbbDN81VQXzZVsgbwQ/VC1wibPchuzpdbThw=
X-Google-Smtp-Source: AGHT+IEE+sf/WD48p2Y44yAV1BGuwi9eignN7+Q6qPJ5YtvNNXiLknU+KhYbJrWk1eKklk6hh6x8pg==
X-Received: by 2002:a05:6000:1acc:b0:427:8c85:a4b0 with SMTP id ffacd0b85a97d-429e3311adfmr2978392f8f.56.1762346864516;
        Wed, 05 Nov 2025 04:47:44 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dan Driscoll <dan.driscoll@siemens.com>,
	Noor Ahsan Khawaja <noor.ahsan@siemens.com>,
	Fahad Arslan <fahad.arslan@siemens.com>,
	Andrew Bachtel <andrew.bachtel@siemens.com>,
	Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [XEN PATCH] xen/arm/p2m: perform IPA-based TLBI for arm64 when IPA is known
Date: Wed,  5 Nov 2025 17:47:27 +0500
Message-ID: <20251105124727.142272-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

This commit addresses a major issue for running Xen on KVM arm64 i.e.
costly emulation of VMALLS12E1IS which becomes worse when this TLBI
is invoked too many times. There are mainly two places where this is
problematic:
(a) When vCPUs switch on a pCPU or pCPUs
(b) When domu mapped pages onto dom0, are to be unmapped, then each
    page being removed by XENMEM_remove_from_physmap has its TLBs
    invalidated by VMALLS12E1IS.

The first one is addressed by relaxing VMALLS12E1IS -> VMALLE1IS.
Each CPU have their own private TLBs, so flush between vCPU of the
same domains is required to avoid translations from vCPUx to "leak"
to the vCPUy. This can be achieved by using VMALLE1. If FEAT_nTLBPA
is present then VMALLE1 can also be avoided.

The second one is addressed by using IPA-based TLBI (IPAS2E1) in
combination with VMALLE1 whenever the IPA range is known instead of
using VMALLS12E1. Again, VMALLE1 can be avoided FEAT_nTLBPA is
present.

Suggested-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 xen/arch/arm/include/asm/arm64/flushtlb.h | 34 ++++++++
 xen/arch/arm/include/asm/arm64/sysregs.h  |  1 +
 xen/arch/arm/include/asm/cpufeature.h     |  3 +-
 xen/arch/arm/include/asm/mmu/p2m.h        |  4 +
 xen/arch/arm/include/asm/processor.h      |  2 +
 xen/arch/arm/mmu/p2m.c                    | 96 ++++++++++++++++++++++-
 6 files changed, 136 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 3b99c11b50..6703aab8a7 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -45,6 +45,27 @@ static inline void name(void)                    \
         : : : "memory");                         \
 }
 
+/*
+ * FLush TLB by IPA. This will likely be used in a loop, so the caller
+ * is responsible to use the appropriate memory barriers before/after
+ * the sequence.
+ *
+ * See above about the ARM64_WORKAROUND_REPEAT_TLBI sequence.
+ */
+#define TLB_HELPER_IPA(name, tlbop)              \
+static inline void name(paddr_t ipa)             \
+{                                                \
+    asm volatile(                                \
+        "tlbi "  # tlbop  ", %0;"                \
+        ALTERNATIVE(                             \
+            "nop; nop;",                         \
+            "dsb  ish;"                          \
+            "tlbi "  # tlbop  ", %0;",           \
+            ARM64_WORKAROUND_REPEAT_TLBI,        \
+            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
+        : : "r" (ipa >> PAGE_SHIFT) : "memory"); \
+}
+
 /*
  * FLush TLB by VA. This will likely be used in a loop, so the caller
  * is responsible to use the appropriate memory barriers before/after
@@ -72,6 +93,18 @@ TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh)
 /* Flush innershareable TLBs, current VMID only */
 TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish)
 
+/* Flush local TLBs, current VMID, stage-1 only */
+TLB_HELPER(flush_guest_tlb_s1_local, vmalle1, nsh)
+
+/* Flush innershareable TLBs, current VMID, stage-1 only */
+TLB_HELPER(flush_guest_tlb_s1, vmalle1is, ish)
+
+/* Flush local TLBs, current VMID, stage-2 for ipa address */
+TLB_HELPER_IPA(flush_guest_tlb_one_s2_local, ipas2e1)
+
+/* Flush innershareable TLBs, current VMID, stage-2 for ipa address */
+TLB_HELPER_IPA(flush_guest_tlb_one_s2, ipas2e1is)
+
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
 TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh)
 
@@ -88,6 +121,7 @@ TLB_HELPER_VA(__flush_xen_tlb_one_local, vae2)
 TLB_HELPER_VA(__flush_xen_tlb_one, vae2is)
 
 #undef TLB_HELPER
+#undef TLB_HELPER_IPA
 #undef TLB_HELPER_VA
 
 #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 7440d495e4..30a7c3b9fd 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -286,6 +286,7 @@
 
 /* id_aa64mmfr1 */
 #define ID_AA64MMFR1_ECBHB_SHIFT     60
+#define ID_AA64MMFR1_NTLBPA_SHIFT    48
 #define ID_AA64MMFR1_AFP_SHIFT       44
 #define ID_AA64MMFR1_ETS_SHIFT       36
 #define ID_AA64MMFR1_TWED_SHIFT      32
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index b6df188011..21df7603fc 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -269,7 +269,8 @@ struct cpuinfo_arm {
             unsigned long ets:4;
             unsigned long __res1:4;
             unsigned long afp:4;
-            unsigned long __res2:12;
+            unsigned long ntlbpa:4;
+            unsigned long __res2:8;
             unsigned long ecbhb:4;
 
             /* MMFR2 */
diff --git a/xen/arch/arm/include/asm/mmu/p2m.h b/xen/arch/arm/include/asm/mmu/p2m.h
index 58496c0b09..fc2e08bbe8 100644
--- a/xen/arch/arm/include/asm/mmu/p2m.h
+++ b/xen/arch/arm/include/asm/mmu/p2m.h
@@ -10,6 +10,10 @@ extern unsigned int p2m_root_level;
 
 struct p2m_domain;
 void p2m_force_tlb_flush_sync(struct p2m_domain *p2m);
+#ifdef CONFIG_ARM_64
+void p2m_force_tlb_flush_range_sync(struct p2m_domain *p2m, uint64_t start_ipa,
+                                    uint64_t page_count);
+#endif
 void p2m_tlb_flush_sync(struct p2m_domain *p2m);
 
 void p2m_clear_root_pages(struct p2m_domain *p2m);
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 92c8bc1a31..07f6a2ef6a 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -461,6 +461,8 @@
 #ifdef CONFIG_ARM_64
 #define MM64_VMID_8_BITS_SUPPORT    0x0
 #define MM64_VMID_16_BITS_SUPPORT   0x2
+#define MM64_NTLBPA_SUPPORT_NI      0x0
+#define MM64_NTLBPA_SUPPORT_IMP     0x1
 #endif
 
 #ifndef __ASSEMBLY__
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504f..28268fb67f 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -235,7 +235,12 @@ void p2m_restore_state(struct vcpu *n)
      * when running multiple vCPU of the same domain on a single pCPU.
      */
     if ( *last_vcpu_ran != INVALID_VCPU_ID && *last_vcpu_ran != n->vcpu_id )
+#ifdef CONFIG_ARM_64
+        if ( system_cpuinfo.mm64.ntlbpa != MM64_NTLBPA_SUPPORT_IMP )
+            flush_guest_tlb_s1_local();
+#else
         flush_guest_tlb_local();
+#endif
 
     *last_vcpu_ran = n->vcpu_id;
 }
@@ -293,6 +298,75 @@ void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
     p2m->need_flush = false;
 }
 
+#ifdef CONFIG_ARM_64
+/*
+ * Force a synchronous P2M TLB flush on a range of addresses.
+ *
+ * Must be called with the p2m lock held.
+ */
+void p2m_force_tlb_flush_range_sync(struct p2m_domain *p2m, uint64_t start_ipa,
+                                    uint64_t page_count)
+{
+    unsigned long flags = 0;
+    uint64_t ovttbr;
+    uint64_t ipa = start_ipa;
+    uint64_t i;
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * ARM only provides an instruction to flush TLBs for the current
+     * VMID. So switch to the VTTBR of a given P2M if different.
+     */
+    ovttbr = READ_SYSREG64(VTTBR_EL2);
+    if ( ovttbr != p2m->vttbr )
+    {
+        uint64_t vttbr;
+
+        local_irq_save(flags);
+
+        /*
+         * ARM64_WORKAROUND_AT_SPECULATE: We need to stop AT to allocate
+         * TLBs entries because the context is partially modified. We
+         * only need the VMID for flushing the TLBs, so we can generate
+         * a new VTTBR with the VMID to flush and the empty root table.
+         */
+        if ( !cpus_have_const_cap(ARM64_WORKAROUND_AT_SPECULATE) )
+            vttbr = p2m->vttbr;
+        else
+            vttbr = generate_vttbr(p2m->vmid, empty_root_mfn);
+
+        WRITE_SYSREG64(vttbr, VTTBR_EL2);
+
+        /* Ensure VTTBR_EL2 is synchronized before flushing the TLBs */
+        isb();
+    }
+
+    /* Ensure prior page-tables updates have completed */
+    dsb(ishst);
+
+    /* Invalidate stage-2 TLB entries by IPA range */
+    for ( i = 0; i < page_count; i++ ) {
+        flush_guest_tlb_one_s2(ipa);
+        ipa += 1UL << PAGE_SHIFT;
+    }
+
+    if ( system_cpuinfo.mm64.ntlbpa != MM64_NTLBPA_SUPPORT_IMP )
+        flush_guest_tlb_s1_local();
+
+    /* Ensure the TLB invalidation has completed */
+    dsb(ishst);
+
+    if ( ovttbr != READ_SYSREG64(VTTBR_EL2) )
+    {
+        WRITE_SYSREG64(ovttbr, VTTBR_EL2);
+        /* Ensure VTTBR_EL2 is back in place before continuing. */
+        isb();
+        local_irq_restore(flags);
+    }
+}
+#endif
+
 void p2m_tlb_flush_sync(struct p2m_domain *p2m)
 {
     if ( p2m->need_flush )
@@ -1034,7 +1108,12 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
          * For more details see (D4.7.1 in ARM DDI 0487A.j).
          */
         p2m_remove_pte(entry, p2m->clean_pte);
+#ifdef CONFIG_ARM_64
+        p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
+                                       1UL << page_order);
+#else
         p2m_force_tlb_flush_sync(p2m);
+#endif
 
         p2m_write_pte(entry, split_pte, p2m->clean_pte);
 
@@ -1090,8 +1169,13 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
         p2m_remove_pte(entry, p2m->clean_pte);
 
     if ( removing_mapping )
+#ifdef CONFIG_ARM_64
+        p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
+                                       1UL << page_order);
+#else
         /* Flush can be deferred if the entry is removed */
         p2m->need_flush |= !!lpae_is_valid(orig_pte);
+#endif
     else
     {
         lpae_t pte = mfn_to_p2m_entry(smfn, t, a);
@@ -1102,17 +1186,23 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
         /*
          * It is necessary to flush the TLB before writing the new entry
          * to keep coherency when the previous entry was valid.
-         *
-         * Although, it could be defered when only the permissions are
-         * changed (e.g in case of memaccess).
          */
         if ( lpae_is_valid(orig_pte) )
         {
+#ifdef CONFIG_ARM_64
+            p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
+                                           1UL << page_order);
+#else
+        /*
+         * Although, flush could be defered when only the permissions are
+         * changed (e.g in case of memaccess).
+         */
             if ( likely(!p2m->mem_access_enabled) ||
                  P2M_CLEAR_PERM(pte) != P2M_CLEAR_PERM(orig_pte) )
                 p2m_force_tlb_flush_sync(p2m);
             else
                 p2m->need_flush = true;
+#endif
         }
         else if ( !p2m_is_valid(orig_pte) ) /* new mapping */
             p2m->stats.mappings[level]++;
-- 
2.34.1


