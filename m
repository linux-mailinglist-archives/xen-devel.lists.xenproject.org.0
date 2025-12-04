Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC3CA45FB
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 16:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177953.1501961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRBii-0001kG-4q; Thu, 04 Dec 2025 15:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177953.1501961; Thu, 04 Dec 2025 15:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRBii-0001iU-14; Thu, 04 Dec 2025 15:58:16 +0000
Received: by outflank-mailman (input) for mailman id 1177953;
 Thu, 04 Dec 2025 15:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=feRK=6K=gmail.com=haseebashraf091@srs-se1.protection.inumbo.net>)
 id 1vRBif-00018S-Ml
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 15:58:13 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08e4dde7-d12a-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 16:58:11 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso6030765e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 07:58:11 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.37.252.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222506sm4506613f8f.28.2025.12.04.07.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 07:58:10 -0800 (PST)
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
X-Inumbo-ID: 08e4dde7-d12a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764863891; x=1765468691; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HexRP3kCPBPdVMxiYVlpGD6XbwosWnacNZ/AQKuaGBw=;
        b=Ya0G0y4V/g8bADOgtKyi/cqOSrwH7gnqRpVO3IomM866xFuyHpNHfUzh3GoNN1k1G2
         LJuw2HFMC/vzf3D4eEkA1S54JXVgPGILXtjtURQliz6p32wvXrQ8Y1xeyPuEfCqLDzjg
         Bp+MBa9hN5gfIFOv2SwEuNJZO/EB0DRvB4HP2xP0Vbq3f2lxEa8AFtnzKQ3FQKl5kYCS
         IpMXu8uUdCWZ3F132t0WDW73xRBSKJ7ctfkKJRV7Dg3UNyKAj6dDLpHkgQ3rbWgig+Pv
         YvDY6PU2ALts1JppnzPb/42gHBc6OKbXQqNNsexM84JLrPH9zjPYlplL/m9z9u5tDxMH
         hDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764863891; x=1765468691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HexRP3kCPBPdVMxiYVlpGD6XbwosWnacNZ/AQKuaGBw=;
        b=l7T3dLJkw1F0gtaRRjyZnqWMzioKSI9dfeMibzOAqExMdbZ2HymtczT44k5Cyg7Q82
         hbkcr317rMbiWdMZtdd9S6ja0lPG36JTMzMTRMEWpo0hpBHJMa4zP26/w2K7puHJxoNA
         MT5BzH4HijTOwMjtretH9ga6rJdSsk3v6J6w4WZy4KKoR/l0ZjOo2k5VpuE8Wel7vNQQ
         0rl5Z6ovnmPBBRrTqggrFZtgYgfndszybd6C+sWsakKRutd3XzekF+AXnkB3INQRCjWm
         5iBlMFq4rBNEtt3j95nu1Urk7vGauCbaPNAQ4AM9R1PBgNXh0pZejz5Tzqhp9O8kxDyb
         lbag==
X-Gm-Message-State: AOJu0Yw9Q+IUJMkiJXvJm7/vB2ZEQGx7kdyGwTLR1TpANemDQ8bBYofL
	d7l5yShDpmuryjNTmt0+HHRgU3S4DQdAZfQo5pUkc27yEAtlELJ/4efuM+M2/AY9
X-Gm-Gg: ASbGncvY1HrsrLl67JRnizCQv/Y+oOklP37C4SVjfaWGpO2xuvCostvSiR7ieMTZ9Y7
	v6wR+8R6hbrRU5gvDsk/YusXG7w2ngimZ0k2BGVtfseIAJi09qx4D29fOvZr2XeKUNZDhxVJJdX
	LvSZC24koqzOOs1iA535l1gmEt7jln/G0kyGzJj6PQMqP2+0Z023Ug23anHYxQgBmsM7IKi07zz
	zHXL+K3YghEvPRRoWNzyl1C+o03iSxWoumVT9o4Fg1OE8dcue3TZFxm0JDbtntTaT0cLyXN6g3O
	PhmC5k9ne5oqtVPgoXluDHb0KbPq+P62cP1FIcZvrpJtU5H4UiH+4PCoAhEm5MUgyla53HV5NiE
	SJnBDykxj6IPuwT9IznZ+fBuIo2A/vF5feerhRFTxFWy84L5OyRVPSx19JGNYW8t5IFknp3ZJzR
	n9vD4pw+swTPnICQ81sFvp8mgQrqHyOPjC766kEUGai/3maNrXQuI=
X-Google-Smtp-Source: AGHT+IH2c9OxsyAwaaPGllssIxRhN3CFVv7oAV/hp/C5ztaJSwkIJPlNqULY/P/ejTISuaUgGPUWPQ==
X-Received: by 2002:a05:600c:4755:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-4792aed9b2emr68785085e9.2.1764863890563;
        Thu, 04 Dec 2025 07:58:10 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 3/3] xen/arm32: add CPU capability for IPA-based TLBI
Date: Thu,  4 Dec 2025 20:57:43 +0500
Message-ID: <c06892e2b356b3186f790d96889b4ca9ba2498e0.1764863575.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ce2e7c32f06ba8a48a2074fa8cadd9c122b6490f.1764863575.git.haseebashraf091@gmail.com>
References: <ce2e7c32f06ba8a48a2074fa8cadd9c122b6490f.1764863575.git.haseebashraf091@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

This feature is available since armv8 and can be used to perform
IPA-based TLBI for arm32. XENMEM_remove_from_physmap performs this
invalidation in each hypercall so this code path will be optimized,
instead of performing a TLBIALL each time in presence of nTLBPA.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 xen/arch/arm/cpufeature.c                 | 12 ++++
 xen/arch/arm/include/asm/arm32/flushtlb.h | 76 +++++++++++++++++++++++
 xen/arch/arm/include/asm/cpregs.h         |  4 ++
 xen/arch/arm/include/asm/cpufeature.h     |  7 ++-
 xen/arch/arm/include/asm/processor.h      |  8 +++
 5 files changed, 105 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 9fa1c45869..d18c6449c6 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -18,6 +18,11 @@ DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
 struct cpuinfo_arm __read_mostly domain_cpuinfo;
 
 #ifdef CONFIG_ARM_32
+static bool has_tlb_ipa_instruction(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.mm32.unitlb == MM32_UNITLB_BY_IPA;
+}
+
 static bool has_ntlbpa(const struct arm_cpu_capabilities *entry)
 {
     return system_cpuinfo.mm32.ntlbpa == MM32_NTLBPA_SUPPORT_IMP;
@@ -37,6 +42,13 @@ static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
 #endif
 
 static const struct arm_cpu_capabilities arm_features[] = {
+#ifdef CONFIG_ARM_32
+    {
+        .desc = "IPA-based TLB Invalidation",
+        .capability = ARM32_HAS_TLB_IPA,
+        .matches = has_tlb_ipa_instruction,
+    },
+#endif
 #if defined(CONFIG_ARM_32) || defined(CONFIG_ARM_64)
     {
         .desc = "Intermediate caching of translation table walks (nTLBPA)",
diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index db15f29216..0fd45aaaed 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_ARM_ARM32_FLUSHTLB_H__
 #define __ASM_ARM_ARM32_FLUSHTLB_H__
 
+#include <xen/sizes.h> /* For SZ_* macros. */
+
 /*
  * Every invalidation operation use the following patterns:
  *
@@ -99,12 +101,56 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
     asm volatile(STORE_CP32(0, TLBIMVAHIS) : : "r" (va) : "memory");
 }
 
+/* Flush TLB of local processor for address ipa. */
+static inline void __flush_guest_tlb_one_s2_local(paddr_t ipa)
+{
+    asm volatile(STORE_CP32(0, TLBIIPAS2)
+                 : : "r" (ipa >> PAGE_SHIFT) : "memory");
+}
+
+/* Flush TLB of all processors in the inner-shareable domain for address ipa. */
+static inline void __flush_guest_tlb_one_s2(paddr_t ipa)
+{
+    asm volatile(STORE_CP32(0, TLBIIPAS2IS)
+                 : : "r" (ipa >> PAGE_SHIFT) : "memory");
+}
+
 /*
  * Flush a range of IPA's mappings from the TLB of the local processor.
  */
 static inline void flush_guest_tlb_range_ipa_local(paddr_t ipa,
                                                    unsigned long size)
 {
+    if ( cpus_have_const_cap(ARM_HAS_NTLBPA) &&
+         cpus_have_const_cap(ARM32_HAS_TLB_IPA) )
+    {
+        paddr_t end;
+
+        /*
+         * If IPA range is too big (empirically found to be 256M), then fallback
+         * to full TLB flush
+         */
+        if ( size > SZ_256M )
+            goto default_tlbi;
+
+        end = ipa + size;
+
+        /*
+         * See ARM ARM DDI 0487A.e D4.7.2 (Invalidation of TLB entries from
+         * stage 2 translations) for details.
+         */
+        dsb(nshst); /* Ensure prior page-tables updates have completed */
+        while ( ipa < end )
+        {
+            __flush_guest_tlb_one_s2_local(ipa);
+            ipa += PAGE_SIZE;
+        }
+        dsb(nsh);
+        isb();
+        return;
+    }
+
+default_tlbi:
     /*
      * Following can invalidate both stage-1 and stage-2 TLBs depending upon
      * the execution mode.
@@ -120,6 +166,36 @@ static inline void flush_guest_tlb_range_ipa_local(paddr_t ipa,
 static inline void flush_guest_tlb_range_ipa(paddr_t ipa,
                                              unsigned long size)
 {
+    if ( cpus_have_const_cap(ARM_HAS_NTLBPA) &&
+         cpus_have_const_cap(ARM32_HAS_TLB_IPA) )
+    {
+        paddr_t end;
+
+        /*
+         * If IPA range is too big (empirically found to be 256M), then fallback
+         * to full TLB flush
+         */
+        if ( size > SZ_256M )
+            goto default_tlbi;
+
+        end = ipa + size;
+
+        /*
+         * See ARM ARM DDI 0487A.e D4.7.2 (Invalidation of TLB entries from
+         * stage 2 translations) for details.
+         */
+        dsb(ishst); /* Ensure prior page-tables updates have completed */
+        while ( ipa < end )
+        {
+            __flush_guest_tlb_one_s2(ipa);
+            ipa += PAGE_SIZE;
+        }
+        dsb(ish);
+        isb();
+        return;
+    }
+
+default_tlbi:
     /*
      * Following can invalidate both stage-1 and stage-2 TLBs depending upon
      * the execution mode.
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index a7503a190f..46415b05d3 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -229,6 +229,10 @@
 #define TLBIALLH        p15,4,c8,c7,0   /* Invalidate Entire Hyp. Unified TLB */
 #define TLBIMVAH        p15,4,c8,c7,1   /* Invalidate Unified Hyp. TLB by MVA */
 #define TLBIALLNSNH     p15,4,c8,c7,4   /* Invalidate Entire Non-Secure Non-Hyp. Unified TLB */
+#define TLBIIPAS2IS     p15,4,c8,c0,1   /* Invalidate unified TLB entry for stage 2 by IPA inner shareable */
+#define TLBIIPAS2LIS    p15,4,c8,c0,5   /* Invalidate unified TLB entry for stage 2 last level by IPA inner shareable */
+#define TLBIIPAS2       p15,4,c8,c4,1   /* Invalidate unified TLB entry for stage 2 by IPA */
+#define TLBIIPAS2L      p15,4,c8,c4,5   /* Invalidate unified TLB entry for stage 2 last level by IPA */
 
 /* CP15 CR9: Performance monitors */
 #define PMCR            p15,0,c9,c12,0  /* Perf. Mon. Control Register */
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index af4e9bdf06..8f6b889850 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -77,8 +77,9 @@
 #define ARM_HAS_SB 16
 #define ARM64_WORKAROUND_1508412 17
 #define ARM_HAS_NTLBPA 18
+#define ARM32_HAS_TLB_IPA 19
 
-#define ARM_NCAPS           19
+#define ARM_NCAPS           20
 
 #ifndef __ASSEMBLY__
 
@@ -440,7 +441,9 @@ struct cpuinfo_arm {
             /* MMFR1 */
             unsigned long __res1:32;
             /* MMFR2 */
-            unsigned long __res2:32;
+            unsigned long __res2_0:16;
+            unsigned long unitlb:4;
+            unsigned long __res2_1:12;
             /* MMFR3 */
             unsigned long __res3:32;
             /* MMFR4 */
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 01f3cb16a0..5a414e80df 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -459,6 +459,14 @@
 #define FSRL_STATUS_DEBUG       (_AC(0x22,UL)<<0)
 
 #ifdef CONFIG_ARM_32
+#define MM32_UNITLB_NI              0x0
+#define MM32_UNITLB_BY_VA           0x1
+#define MM32_UNITLB_BY_MATCH_ASID   0x2
+#define MM32_UNITLB_BY_ALL_ASID     0x3
+#define MM32_UNITLB_OTHER_TLBS      0x4
+#define MM32_UNITLB_BROADCAST       0x5
+#define MM32_UNITLB_BY_IPA          0x6
+
 #define MM32_NTLBPA_SUPPORT_NI      0x0
 #define MM32_NTLBPA_SUPPORT_IMP     0x1
 #endif
-- 
2.43.0


