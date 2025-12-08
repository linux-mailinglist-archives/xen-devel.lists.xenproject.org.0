Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8F3CAD589
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:55:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180637.1503795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbiC-0005Om-Q1; Mon, 08 Dec 2025 13:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180637.1503795; Mon, 08 Dec 2025 13:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbiC-0005Lm-Mi; Mon, 08 Dec 2025 13:55:36 +0000
Received: by outflank-mailman (input) for mailman id 1180637;
 Mon, 08 Dec 2025 13:55:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22jW=6O=gmail.com=haseebashraf091@srs-se1.protection.inumbo.net>)
 id 1vSbiB-0005KM-Ni
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:55:35 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90c39b8c-d43d-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 14:55:33 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so51066095e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:55:33 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.89.17])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792afe32cbsm144746585e9.0.2025.12.08.05.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 05:55:32 -0800 (PST)
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
X-Inumbo-ID: 90c39b8c-d43d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765202133; x=1765806933; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPY8I9p89Z49IT6xTWbbfssEr8lHB6MKrNil8DAb3PU=;
        b=B+6daUTjitQs6mQRROeawnJnY1RYRuoUWmakmIj/zPd7TD0zGHoBWwvKqwcJdM3GKq
         eNu9JegtYlP9BeHXMuKp1kd+0NM1c7huvh9/aGj3cs+fxOXtrq4sDvnS/TwpO+43MF6V
         6P14krpEu6iGJhE2gtn/4gdZOF25wmdK847voLKx+yF1xOtwv96lk/+i152tB9kr5uGZ
         RkoUwm8132DcsA+45BXAJBEwGXFgkUw2DfRVu0VcbFClELIYG2tNIuX/dYX9CQHTD28H
         91v6+Ku5N1OKE3TgLxauxDzqBvycKIE9L0MTvGHCFonVA4U3J4rho1nwtq7A490yWJwS
         svDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765202133; x=1765806933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uPY8I9p89Z49IT6xTWbbfssEr8lHB6MKrNil8DAb3PU=;
        b=Dnp3a0thcmnT6v0ykTj56QfozdxVJC9H31tKTe7zOJsbzBmsvvtmtX2XHN8Ztl3ijQ
         Ekc+qPPwHdwUMDpu7YCpk9wRJXlMwWEF+kLEhhAA0Hf5DfMyjgDJj4+MunGowz0Die2q
         J49w6PGLhtK0BwjqEOEQKIN2i2cGQrfO8SBXEBZVpW5CwDVeOcJ5sLuyEIpiJ8/aMu3K
         40xHFadJ23ZaPzWgM8En0qtIIw9si47sA+KNvsoottHygdLHiBvSoAB3QLLzr5upwes4
         iO+vfZSpqQnVuhskaJ2KZHlZMgckDjBJiHPZWYk8ekfAPU75sM96sPUKeJlqCKF+tR4B
         v7CQ==
X-Gm-Message-State: AOJu0YwGmzjwudb9FfBK77ob2undNoCCeCHKFINJqhQt4DbMNxKf0ZIK
	v3dI9AWR9x4+CeTSrGKIvw7jNxYNdF6IJJLWcli7IATKJtPEgdwQ+UNZmKIaQ9bb
X-Gm-Gg: ASbGnctUcsn8z0LqUoUg5v32v+P6VTDsEQLkxX3E9YfjZ8TEDpwqvXTAvEFzasWA8b8
	Q8oAzlkq23X4i2+vKw9w3epTq/DRrxXi4IbChTButN6Keh0S0SNd7WP4CKJmLd7aI6gWHg+FsBL
	FDou9VJWvWDvLdktl+TFXSuBwSJFa2nfEd+reCmHKAMKIaWaUxfA6N9uzj9Rb4pmqGgLLw45nBQ
	u6vX2zWGy7zz7Ah5Ttegigbfte0JzpzX0zcBGWOXm6DuOEC50GYJdeNDoYOJtFBwPsVDR/w64Sh
	zCypyWwV7PnttAlEGvksst5/E2pyI9QPeuHfv0o0wMC4RdW8wAFmZxsSQlX4LjHuddQAM73+myM
	mRh6JE4MP066BW3d7QfbC6BgP+VrwwnmhFxhTHy0/MhEOTTYXF1gaKWUxUNTZQUSjaOumL6yYHI
	rOQj1wJIQDpLZLQnLRugwJQ+TDeMet1CAieXvt617yjf2FIWB1
X-Google-Smtp-Source: AGHT+IFROT6R+E7EsRYwySNUKn1MFwIMxmn+zDuNcR6BsCHwzxL82BBKdgXgO2S5B43m42Q+sdWJqA==
X-Received: by 2002:a05:600c:1ca4:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-47939e27832mr96055955e9.22.1765202132629;
        Mon, 08 Dec 2025 05:55:32 -0800 (PST)
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
	Andrew Bachtel <andrew.bachtel@siemens.com>
Subject: [PATCH 1/3] xen/arm/p2m: perform IPA-based TLBI when IPA is known
Date: Mon,  8 Dec 2025 18:55:14 +0500
Message-ID: <f68ced43267116e3b9beaf9cf4eb201228fdadd1.1765197209.git.haseeb.ashraf@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765197209.git.haseeb.ashraf@siemens.com>
References: <cover.1765197209.git.haseeb.ashraf@siemens.com>
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
found to be 70K on Graviton4 in Xen on KVM virtualization. So,
64K * 4KB = 256MB is set as the threshold.

For arm32, TLBIALL instruction can invalidate both stage-1 and
stage-2 entries, so using IPA-based TLBI would be redundant as
TLBIALL is required in any case to invalidate corresponding cached
entries from stage-1.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Changes in v3:
- Updated IPA-based TLBI sequence to apply ARM64 repeat TLBI
  workaround to only final TLBI and DSB of the sequence.
- Removed TLB_HELPER_IPA and instead directly used the TLBI
  instruction where needed as that was the only instance where it is
  being used.
- Removed flush_guest_tlb_range_ipa_local() as it was not being used.
- Updated comments as per feedback in v2 about holding lock before
  p2m_load_vttbr.
- Updated references of ARM ARM to use newer version DDI 0487L.b
  instead of older version DDI 0487A.e.

Changes in v2:
- This commit implements the basline implementation to address the
  problem at hand. Removed the FEAT_nTLBPA implementation from this
  commit which will be implemented in following commit using CPU
  capability.
- Moved ARM32 and ARM64 specific implementations of TLBIs to
  architecture specific flushtlb.h.
- Added references of ARM ARM in code comments.
- Evaluated and added a threshold to select between IPA-based TLB
  invalidation vs fallback to full stage TLB invalidation above
  the threshold.
---
 xen/arch/arm/include/asm/arm32/flushtlb.h | 53 +++++++++++++
 xen/arch/arm/include/asm/arm64/flushtlb.h | 46 ++++++++++++
 xen/arch/arm/include/asm/mmu/p2m.h        |  2 +
 xen/arch/arm/mmu/p2m.c                    | 92 +++++++++++++++++------
 4 files changed, 168 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 61c25a3189..3c0c2123d4 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -45,6 +45,43 @@ TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh)
 
 #undef TLB_HELPER
 
+/*
+ * Flush TLB of local processor. Use when flush for only stage-1 is intended.
+ *
+ * The following function should be used where intention is to clear only
+ * stage-1 TLBs. This would be helpful in future in identifying which stage-1
+ * TLB flushes can be skipped such as in present of FEAT_nTLBPA.
+ */
+static inline void flush_guest_tlb_s1_local(void)
+{
+    /*
+     * Same instruction can invalidate both stage-1 and stage-2 TLBs depending
+     * upon the execution context.
+     *
+     * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
+     */
+    return flush_guest_tlb_local();
+}
+
+/*
+ * Flush TLB of inner-shareable processor domain. Use when flush for only
+ * stage-1 is intended.
+ *
+ * The following function should be used where intention is to clear only
+ * stage-1 TLBs. This would be helpful in future in identifying which stage-1
+ * TLB flushes can be skipped such as in present of FEAT_nTLBPA.
+ */
+static inline void flush_guest_tlb_s1(void)
+{
+    /*
+     * Same instruction can invalidate both stage-1 and stage-2 TLBs depending
+     * upon the execution context.
+     *
+     * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
+     */
+    return flush_guest_tlb();
+}
+
 /* Flush TLB of local processor for address va. */
 static inline void __flush_xen_tlb_one_local(vaddr_t va)
 {
@@ -57,6 +94,22 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
     asm volatile(STORE_CP32(0, TLBIMVAHIS) : : "r" (va) : "memory");
 }
 
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
+     *
+     * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
+     */
+    flush_guest_tlb();
+}
+
 #endif /* __ASM_ARM_ARM32_FLUSHTLB_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 3b99c11b50..67ae616993 100644
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
@@ -72,6 +74,12 @@ TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh)
 /* Flush innershareable TLBs, current VMID only */
 TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish)
 
+/* Flush local TLBs, current VMID, stage-1 only */
+TLB_HELPER(flush_guest_tlb_s1_local, vmalle1, nsh)
+
+/* Flush innershareable TLBs, current VMID, stage-1 only */
+TLB_HELPER(flush_guest_tlb_s1, vmalle1is, ish)
+
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
 TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh)
 
@@ -90,6 +98,44 @@ TLB_HELPER_VA(__flush_xen_tlb_one, vae2is)
 #undef TLB_HELPER
 #undef TLB_HELPER_VA
 
+/*
+ * Flush a range of IPA's mappings from the TLB of all processors in the
+ * inner-shareable domain.
+ */
+static inline void flush_guest_tlb_range_ipa(paddr_t ipa, unsigned long size)
+{
+    paddr_t end;
+
+    /*
+     * If IPA range is too big (empirically found to be 256M), then fallback to
+     * full TLB flush.
+     */
+    if ( size > SZ_256M )
+        return flush_guest_tlb();
+
+    end = ipa + size;
+
+    /*
+     * See ARM ARM DDI 0487L.b D8.17.6.1 (Invalidating TLB entries from stage 2
+     * translations) for details of TLBI sequence.
+     */
+    dsb(ishst); /* Ensure prior page-tables updates have completed */
+    while ( ipa < end )
+    {
+        /* Flush stage-2 TLBs for ipa address */
+        asm_inline volatile (
+            "tlbi ipas2e1is, %0;" : : "r" (ipa >> PAGE_SHIFT) : "memory" );
+        ipa += PAGE_SIZE;
+    }
+    /*
+     * As ARM64_WORKAROUND_REPEAT_TLBI is required to be applied to last TLBI
+     * of the sequence, it is only needed to be handled in the following
+     * invocation. Final dsb() and isb() are also applied in the following
+     * invocation.
+     */
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
index 51abf3504f..eec59056fa 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -235,33 +235,28 @@ void p2m_restore_state(struct vcpu *n)
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
  * Must be called with the p2m lock held.
+ *
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
@@ -280,8 +275,14 @@ void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
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
@@ -289,10 +290,58 @@ void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
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
@@ -1034,7 +1083,8 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
          * For more details see (D4.7.1 in ARM DDI 0487A.j).
          */
         p2m_remove_pte(entry, p2m->clean_pte);
-        p2m_force_tlb_flush_sync(p2m);
+        p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
+                                       1UL << page_order);
 
         p2m_write_pte(entry, split_pte, p2m->clean_pte);
 
@@ -1090,8 +1140,8 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
         p2m_remove_pte(entry, p2m->clean_pte);
 
     if ( removing_mapping )
-        /* Flush can be deferred if the entry is removed */
-        p2m->need_flush |= !!lpae_is_valid(orig_pte);
+        p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
+                                       1UL << page_order);
     else
     {
         lpae_t pte = mfn_to_p2m_entry(smfn, t, a);
@@ -1102,18 +1152,10 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
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


