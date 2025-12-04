Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B0BCA45F8
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 16:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177950.1501941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRBiP-0001BG-Gv; Thu, 04 Dec 2025 15:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177950.1501941; Thu, 04 Dec 2025 15:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRBiP-00018Y-DE; Thu, 04 Dec 2025 15:57:57 +0000
Received: by outflank-mailman (input) for mailman id 1177950;
 Thu, 04 Dec 2025 15:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=feRK=6K=gmail.com=haseebashraf091@srs-se1.protection.inumbo.net>)
 id 1vRBiN-00018S-FA
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 15:57:55 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd953e51-d129-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 16:57:52 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779a637712so8277445e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 07:57:52 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.37.252.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222506sm4506613f8f.28.2025.12.04.07.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 07:57:51 -0800 (PST)
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
X-Inumbo-ID: fd953e51-d129-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764863872; x=1765468672; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/L1DB7/W0yDOwHyCh6YYkIOBuN5JYLSIfe7krOMb+SM=;
        b=m+KWt3Ff/SjkmxpS0wRo4YHVP47D3zAjkQ6kiBZdznQibBa/N4RNmmlx8E25fkWv/A
         eSbNMIiFJohykP5Tznj6GTVRG7fbw51asw8N5jQTeawk7wxw/qiwuRbVGO2oKTz9JDBJ
         /iCqEMfYYjvA5TL11Lalr1H8pvmzFZ1Js0jvwexDq1GtGw6xAqaFHrOvz33DkMVXwLwV
         YuPZIyi19HiOGfcbb3aq8DROxBTlG9u3QLsqsGlh+/aBOPZORG/EYIrlNJ2M5jOdrmkN
         vQLlvdIQJ/06ym6FfKp2MMlPr32RTqTt171Lfof8ALyrf8fikdSGZ08SpnGrYbfLGuD2
         vbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764863872; x=1765468672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L1DB7/W0yDOwHyCh6YYkIOBuN5JYLSIfe7krOMb+SM=;
        b=WjSR7367Q2PlnDscMaHJ6EVZAl9BaR2yXGZraLARdBEGfdRiZStZwHtU7bYxTDBjBB
         VjpSjyiaxtUoW3T1r5IKj5coA43kThA5Gr0S6ccYTsHIasZ77Ov/mE9jdV14lFwnU0iq
         xDEc+aYwjUBXBJ/WGGh5qwBrodP9azrYyl/lNaVV42y+KdMeRrvqN6vazaZyaghryVPY
         BsN4poBxaduJhnDp/ZoSI8UqAa8RB2+fpbJy6/L+r8NwbQLsm2fOr+0/YAbNeFXJFQtP
         ks13wGXyP7wdcXP7lqhs/uqrWCdJPyvwvzKZUnMxEjdaj/V1YLsniMv6JOcPtiGwFf2z
         cIIA==
X-Gm-Message-State: AOJu0YyV+22JNgDWBshBsRBFm9vQS/9NpLCPjqIHr/fmY9dymHAvyx4J
	S2Y4kAv1POoOwE0TR8bCLN7WuHFK/v5279eCbcdsEm0SNoaPTvgNw0VYss6iBcht
X-Gm-Gg: ASbGncstmV/Ycl5W8Kv0R3oKe/afjbX4ohQkg/fIHpL2wywu/szjaOB4mDpe2iqgJpS
	JaxOsUkmU1O4eplz/m45L0hQe346ma01+sWrFXARyWR3QHZ9DIAAIQniXNsKjzDgH5m1rMJjqN0
	ktDJrUGMaVVBr1+0yYQnQf/S+MbbcEp8moshFnnrJR2TNCpMOlCEnstxSvEuxt6EMashClPjUdO
	9JsYqcDkHI/q4u4i4VBsJHP+/RG4hccGms64zdfXhAVBXdl9NmsNYhmakcFJ0c3EH92x+euUekJ
	RpYdznQxB2k9U4/+F+GXU+4r1AzPc3aZY3npnDm57ddOunlWp3gmsMBDFC+MXM2gzZloPCbUUX2
	PgllJ05bpSLUTdut29U5EJcWflUW0+oE3ioMCPUut3YZZF2zzA2/5cjzDWwL1uVgdBvxQAUB/wv
	PBNoy7666ubBUGSKlrLW1aArcS3BQhdxZm2pBvdxXL6PDHJaC4s3M=
X-Google-Smtp-Source: AGHT+IFRqxbHnqApQRDfsx3MFNbHC2mq4vzBMv0JMS4GaYnbUbWUsiM0iWESB9JJZpn+54opCCvMOA==
X-Received: by 2002:a05:600c:19ca:b0:477:94e3:8a96 with SMTP id 5b1f17b1804b1-4792af30f85mr68246925e9.20.1764863871638;
        Thu, 04 Dec 2025 07:57:51 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 1/3] xen/arm/p2m: perform IPA-based TLBI when IPA is known
Date: Thu,  4 Dec 2025 20:57:41 +0500
Message-ID: <ce2e7c32f06ba8a48a2074fa8cadd9c122b6490f.1764863575.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

This commit addresses a major issue for running Xen on KVM i.e.
costly emulation of VMALLS12E1IS which becomes worse when this TLBI
is invoked too many times. There are mainly two places where this is
problematic:
(a) When vCPUs switch on a pCPU or pCPUs
(b) When domu mapped pages onto dom0, are to be unmapped, then each
    page being removed by XENMEM_remove_from_physmap has its TLBs
    invalidated by VMALLS12E1IS.

The first one is addressed by relaxing VMALLS12E1 -> VMALLE1 as the
stage-2 is common between all the vCPUs of a VM. Since each CPU has
its own private TLBs, so flush between vCPU of the same domains is
still required to avoid translations from vCPUx to "leak" to the
vCPUy which can be achieved by using VMALLE1.

The second one is addressed by using IPA-based TLBI (IPAS2E1) in
combination with VMALLE1 whenever the IPA range is known instead of
using VMALLS12E1. There is an upper cap placed on number of IPA-based
TLBI. This factor for execution time of VMALLS12E1 vs IPAS2E1 is
found to be 70K on Graviton4. So, ~65K * 4KB = 256M is set as the
threshold.

For arm32, TLBIALL instruction can invalidate both stage-1 and
stage-2 entries, so using IPA-based TLBI would be redundant as
TLBIALL is required in any case to invalidate corresponding cached
entries from stage-1.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Changes in v2:
- Split up the commit in 3 commits. First commit implements the
  basline implementation without any addition of new CPU
  capabilities. Implemented new CPU caps in separate features to
  emphasize how each of it optimizes the TLB invalidation.
- Moved ARM32 and ARM64 specific implementations of TLBIs to
  architecture specific flushtlb.h.
- Added references of ARM ARM in code comments.
- Evaluated and added a threshold to select between IPA-based TLB
  invalidation vs fallback to full stage TLB invalidation above
  the threshold.
- Introduced ARM_HAS_NTLBPA CPU capability which leverages
  FEAT_nTLBPA for arm32 as well as arm64.
- Introduced ARM_HAS_TLB_IPA CPU capability for IPA-based TLBI
  for arm32.
---
 xen/arch/arm/include/asm/arm32/flushtlb.h | 69 ++++++++++++++++
 xen/arch/arm/include/asm/arm64/flushtlb.h | 99 +++++++++++++++++++++++
 xen/arch/arm/include/asm/mmu/p2m.h        |  2 +
 xen/arch/arm/mmu/p2m.c                    | 94 ++++++++++++++-------
 4 files changed, 237 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 61c25a3189..70a8b1dad6 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -45,6 +45,46 @@ TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh)
 
 #undef TLB_HELPER
 
+/*
+ * Flush TLB of local processor. Use when flush for only stage-1 is
+ * intended.
+ */
+static inline void flush_guest_tlb_s1_local(void)
+{
+    /*
+     * Same instruction can invalidate both stage-1 and stage-2 TLBs
+     * depending upon the execution context.
+     *
+     * See ARMv8 (DDI 0487A.e): G4-4126 Table G4-24.
+     *
+     * The following macros should be used where intention is to
+     * clear only stage-1 TLBs. This would be helpful in future in
+     * identifying which stage-1 TLB flushes can be skipped such as
+     * in present of FEAT_nTLBPA.
+     */
+    return flush_guest_tlb_local();
+}
+
+/*
+ * Flush TLB of inner-shareable processor domain. Use when flush for
+ * only stage-1 is intended.
+ */
+static inline void flush_guest_tlb_s1(void)
+{
+    /*
+     * Same instruction can invalidate both stage-1 and stage-2 TLBs
+     * depending upon the execution context.
+     *
+     * See ARMv8 (DDI 0487A.e): G4-4126 Table G4-24.
+     *
+     * The following macros should be used where intention is to
+     * clear only stage-1 TLBs. This would be helpful in future in
+     * identifying which stage-1 TLB flushes can be skipped such as
+     * in present of FEAT_nTLBPA.
+     */
+    return flush_guest_tlb();
+}
+
 /* Flush TLB of local processor for address va. */
 static inline void __flush_xen_tlb_one_local(vaddr_t va)
 {
@@ -57,6 +97,35 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
     asm volatile(STORE_CP32(0, TLBIMVAHIS) : : "r" (va) : "memory");
 }
 
+/*
+ * Flush a range of IPA's mappings from the TLB of the local processor.
+ */
+static inline void flush_guest_tlb_range_ipa_local(paddr_t ipa,
+                                                   unsigned long size)
+{
+    /*
+     * Following can invalidate both stage-1 and stage-2 TLBs depending upon
+     * the execution mode.
+     * see ARMv8 (DDI 0487A.e): G4-4126 Table G4-24
+     */
+    flush_guest_tlb_local();
+}
+
+/*
+ * Flush a range of IPA's mappings from the TLB of all processors in the
+ * inner-shareable domain.
+ */
+static inline void flush_guest_tlb_range_ipa(paddr_t ipa,
+                                             unsigned long size)
+{
+    /*
+     * Following can invalidate both stage-1 and stage-2 TLBs depending upon
+     * the execution mode.
+     * see ARMv8 (DDI 0487A.e): G4-4126 Table G4-24
+     */
+    flush_guest_tlb();
+}
+
 #endif /* __ASM_ARM_ARM32_FLUSHTLB_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 3b99c11b50..fff76375a3 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_ARM_ARM64_FLUSHTLB_H__
 #define __ASM_ARM_ARM64_FLUSHTLB_H__
 
+#include <xen/sizes.h> /* For SZ_* macros. */
+
 /*
  * Every invalidation operation use the following patterns:
  *
@@ -45,6 +47,27 @@ static inline void name(void)                    \
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
@@ -72,6 +95,18 @@ TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh)
 /* Flush innershareable TLBs, current VMID only */
 TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish)
 
+/* Flush local TLBs, current VMID, stage-1 only */
+TLB_HELPER(flush_guest_tlb_s1_local, vmalle1, nsh)
+
+/* Flush innershareable TLBs, current VMID, stage-1 only */
+TLB_HELPER(flush_guest_tlb_s1, vmalle1is, ish)
+
+/* Flush local TLBs, current VMID, stage-2 for ipa address */
+TLB_HELPER_IPA(__flush_guest_tlb_one_s2_local, ipas2e1)
+
+/* Flush innershareable TLBs, current VMID, stage-2 for ipa address */
+TLB_HELPER_IPA(__flush_guest_tlb_one_s2, ipas2e1is)
+
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
 TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh)
 
@@ -88,8 +123,72 @@ TLB_HELPER_VA(__flush_xen_tlb_one_local, vae2)
 TLB_HELPER_VA(__flush_xen_tlb_one, vae2is)
 
 #undef TLB_HELPER
+#undef TLB_HELPER_IPA
 #undef TLB_HELPER_VA
 
+/*
+ * Flush a range of IPA's mappings from the TLB of the local processor.
+ */
+static inline void flush_guest_tlb_range_ipa_local(paddr_t ipa,
+                                                   unsigned long size)
+{
+    paddr_t end;
+
+    /*
+     * If IPA range is too big (empirically found to be 256M), then fallback to
+     * full TLB flush
+     */
+    if ( size > SZ_256M )
+        return flush_guest_tlb_local();
+
+    end = ipa + size;
+
+    /*
+     * See ARM ARM DDI 0487A.e D4.7.2 (Invalidation of TLB entries from stage 2
+     * translations) for details.
+     */
+    dsb(nshst); /* Ensure prior page-tables updates have completed */
+    while ( ipa < end )
+    {
+        __flush_guest_tlb_one_s2_local(ipa);
+        ipa += PAGE_SIZE;
+    }
+    /* Final dsb() and isb() are done in following invocation */
+    flush_guest_tlb_s1_local();
+}
+
+/*
+ * Flush a range of IPA's mappings from the TLB of all processors in the
+ * inner-shareable domain.
+ */
+static inline void flush_guest_tlb_range_ipa(paddr_t ipa,
+                                             unsigned long size)
+{
+    paddr_t end;
+
+    /*
+     * If IPA range is too big (empirically found to be 256M), then fallback to
+     * full TLB flush
+     */
+    if ( size > SZ_256M )
+        return flush_guest_tlb();
+
+    end = ipa + size;
+
+    /*
+     * See ARM ARM DDI 0487A.e D4.7.2 (Invalidation of TLB entries from stage 2
+     * translations) for details.
+     */
+    dsb(ishst); /* Ensure prior page-tables updates have completed */
+    while ( ipa < end )
+    {
+        __flush_guest_tlb_one_s2(ipa);
+        ipa += PAGE_SIZE;
+    }
+    /* Final dsb() and isb() are done in following invocation */
+    flush_guest_tlb_s1();
+}
+
 #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/mmu/p2m.h b/xen/arch/arm/include/asm/mmu/p2m.h
index 58496c0b09..8a16722b82 100644
--- a/xen/arch/arm/include/asm/mmu/p2m.h
+++ b/xen/arch/arm/include/asm/mmu/p2m.h
@@ -10,6 +10,8 @@ extern unsigned int p2m_root_level;
 
 struct p2m_domain;
 void p2m_force_tlb_flush_sync(struct p2m_domain *p2m);
+void p2m_force_tlb_flush_range_sync(struct p2m_domain *p2m, uint64_t start_ipa,
+                                    uint64_t page_count);
 void p2m_tlb_flush_sync(struct p2m_domain *p2m);
 
 void p2m_clear_root_pages(struct p2m_domain *p2m);
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504f..e72b06b732 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -235,33 +235,26 @@ void p2m_restore_state(struct vcpu *n)
      * when running multiple vCPU of the same domain on a single pCPU.
      */
     if ( *last_vcpu_ran != INVALID_VCPU_ID && *last_vcpu_ran != n->vcpu_id )
-        flush_guest_tlb_local();
+        flush_guest_tlb_s1_local();
 
     *last_vcpu_ran = n->vcpu_id;
 }
 
 /*
- * Force a synchronous P2M TLB flush.
+ * Loads VTTBR from given P2M.
  *
- * Must be called with the p2m lock held.
+ * This returns switched out VTTBR.
  */
-void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
+static uint64_t p2m_load_vttbr(struct p2m_domain *p2m, unsigned long *flags)
 {
-    unsigned long flags = 0;
     uint64_t ovttbr;
 
-    ASSERT(p2m_is_write_locked(p2m));
-
-    /*
-     * ARM only provides an instruction to flush TLBs for the current
-     * VMID. So switch to the VTTBR of a given P2M if different.
-     */
     ovttbr = READ_SYSREG64(VTTBR_EL2);
     if ( ovttbr != p2m->vttbr )
     {
         uint64_t vttbr;
 
-        local_irq_save(flags);
+        local_irq_save(*flags);
 
         /*
          * ARM64_WORKAROUND_AT_SPECULATE: We need to stop AT to allocate
@@ -276,12 +269,18 @@ void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
 
         WRITE_SYSREG64(vttbr, VTTBR_EL2);
 
-        /* Ensure VTTBR_EL2 is synchronized before flushing the TLBs */
+        /* Ensure VTTBR_EL2 is in place before continuing. */
         isb();
     }
 
-    flush_guest_tlb();
+    return ovttbr;
+}
 
+/*
+ * Restores VTTBR which was switched out as a result of p2m_load_vttbr().
+ */
+static void p2m_restore_vttbr(uint64_t ovttbr, unsigned long flags)
+{
     if ( ovttbr != READ_SYSREG64(VTTBR_EL2) )
     {
         WRITE_SYSREG64(ovttbr, VTTBR_EL2);
@@ -289,10 +288,58 @@ void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
         isb();
         local_irq_restore(flags);
     }
+}
+
+/*
+ * Force a synchronous P2M TLB flush.
+ *
+ * Must be called with the p2m lock held.
+ */
+void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    unsigned long flags = 0;
+    uint64_t ovttbr;
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * ARM only provides an instruction to flush TLBs for the current
+     * VMID. So switch to the VTTBR of a given P2M if different.
+     */
+    ovttbr = p2m_load_vttbr(p2m, &flags);
+
+    flush_guest_tlb();
+
+    p2m_restore_vttbr(ovttbr, flags);
 
     p2m->need_flush = false;
 }
 
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
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * ARM only provides an instruction to flush TLBs for the current
+     * VMID. So switch to the VTTBR of a given P2M if different.
+     */
+    ovttbr = p2m_load_vttbr(p2m, &flags);
+
+    /* Invalidate TLB entries by IPA range */
+    flush_guest_tlb_range_ipa(start_ipa, PAGE_SIZE * page_count);
+
+    p2m_restore_vttbr(ovttbr, flags);
+}
+
 void p2m_tlb_flush_sync(struct p2m_domain *p2m)
 {
     if ( p2m->need_flush )
@@ -1034,7 +1081,8 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
          * For more details see (D4.7.1 in ARM DDI 0487A.j).
          */
         p2m_remove_pte(entry, p2m->clean_pte);
-        p2m_force_tlb_flush_sync(p2m);
+        p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
+                                       1UL << page_order);
 
         p2m_write_pte(entry, split_pte, p2m->clean_pte);
 
@@ -1090,8 +1138,8 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
         p2m_remove_pte(entry, p2m->clean_pte);
 
     if ( removing_mapping )
-        /* Flush can be deferred if the entry is removed */
-        p2m->need_flush |= !!lpae_is_valid(orig_pte);
+        p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
+                                       1UL << page_order);
     else
     {
         lpae_t pte = mfn_to_p2m_entry(smfn, t, a);
@@ -1102,18 +1150,10 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
         /*
          * It is necessary to flush the TLB before writing the new entry
          * to keep coherency when the previous entry was valid.
-         *
-         * Although, it could be defered when only the permissions are
-         * changed (e.g in case of memaccess).
          */
         if ( lpae_is_valid(orig_pte) )
-        {
-            if ( likely(!p2m->mem_access_enabled) ||
-                 P2M_CLEAR_PERM(pte) != P2M_CLEAR_PERM(orig_pte) )
-                p2m_force_tlb_flush_sync(p2m);
-            else
-                p2m->need_flush = true;
-        }
+            p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
+                                           1UL << page_order);
         else if ( !p2m_is_valid(orig_pte) ) /* new mapping */
             p2m->stats.mappings[level]++;
 
-- 
2.43.0


