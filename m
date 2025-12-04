Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9B8CA45F5
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 16:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177951.1501951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRBia-0001Rh-Sp; Thu, 04 Dec 2025 15:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177951.1501951; Thu, 04 Dec 2025 15:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRBia-0001PH-PW; Thu, 04 Dec 2025 15:58:08 +0000
Received: by outflank-mailman (input) for mailman id 1177951;
 Thu, 04 Dec 2025 15:58:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=feRK=6K=gmail.com=haseebashraf091@srs-se1.protection.inumbo.net>)
 id 1vRBiZ-0001Oh-2S
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 15:58:07 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 052baeb2-d12a-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 16:58:05 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42e2e628f8aso540282f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 07:58:05 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.37.252.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222506sm4506613f8f.28.2025.12.04.07.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 07:58:04 -0800 (PST)
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
X-Inumbo-ID: 052baeb2-d12a-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764863885; x=1765468685; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+2dUVKX6UmYMbNOIqJEEZtLFN5pzKK4HEh6eS2p2xY=;
        b=gt1oxO5ytuyDj5xBPWPlF1QSMaaun/fnOLIz1aSVwHcxYyEjG0g4Eqf1dLLzumLliL
         CWgqahKJuwqRfZ5SAgF6A5/rn/hUlmRwveNeAyv4HBejFjnUh/53QZlXIa7BhA5B1/yW
         BGuEkCbxf0NfM6dIioRuiC0iHxZ70RoLYktn4xWYdwedP6+s3rrqrTWbI4ygUrnXwj+4
         7A3f4paKYazwbrmilHHUyi+d2C4IYknJBy4yaTNVBgkquGVlqo/4qCSk1pJHCEjMOMwO
         KE8+LvvATimFfgFqvpToxvLKEKisgb6uTQDbyKSV9MBh73N8AABr3X4QQuovpSddB7YE
         bx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764863885; x=1765468685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+2dUVKX6UmYMbNOIqJEEZtLFN5pzKK4HEh6eS2p2xY=;
        b=SWAPlhSri93ve2Qe8mkkft11DBhBX5GBEH3cktTbc96ut99ZhipIqa5fjuQimKlnMC
         hrzK55pQzSkB+KgvB0UV3lRHn3B9+YNjskitsOeTkeI2UZD79ieozdWAD9AfW/g3j4r4
         vMEAtij9qMVRHpDfG+XGvonrAg9F/R6WFr0bicT6wBVd3679I149BOAw+Bc9c6uRj7jo
         M22sMvjrqmRcJSJTGCOit/6FFI+DDzASUEJEDl4ZkAoopeM+YPEBG7zpHTiyYoCX4uaP
         FhOPrADuN32I/BoYaqjuuzy71G12BCVGZYXCfanAz5cVht5P6yLtIQQtJ4jjda6OGJQe
         NHCg==
X-Gm-Message-State: AOJu0YycjUxp7JuVCN7JfPeikwK/SGjlxlKDtoEJsKfnuRGoAeQIJn+O
	95Q1Yij45Xxy88u8J2YxIZ+9fq5zujYu/II/XeQdnCjitNd23MOHH21CM/j65QPK
X-Gm-Gg: ASbGncvhtlUctJrTsoCOd2ie5FmklxJSzFZ0gEDnhwYGwi2gqxgooAug2KdPN58vSlF
	9ZlsFINFcouRAdZT/o9w9Csn3bnNhTkUCOX/xv73AeDQdDU/LggUZyLm+1SK+N6rOcCmQPEdb4W
	R4reRhmYSLuEJg26AibDw56wh8b6Hx4k76CEdQNmhTAQf9Wr6c1GOGXDr5l7sFP2jh6Jl5FywsF
	k3fWJDfk00imgkFg+FYc/3rvR4MFamHalYeXB6fblBpAP9BdzKXhh62ppneEbKBIvuJUTEjPo1x
	oaX2FXTYumVs7J++0EXpua7b3g/whvL3Qy8D+sQG28DGiRqr+aeI4KRBbXCJET6jPkgYyuSfTEc
	VT9iYpb2taLJM3M4Xmraik/uVP0vkVbPFVMPW/YIAtEumGqbSraRELsHztKjFXQo1vfKIEqpKw8
	NZVt/duQVVhXxJsk+sksNngqV0S5qomiQHPyhoBiaPlBDi3NSIiAc=
X-Google-Smtp-Source: AGHT+IEPQakLBv3nmBxyIY4SCGpMNj6qb++cVvmxtJYNNQQuBZnbWhJrzO7zwb9AAOLOs9H2Xd7NpA==
X-Received: by 2002:a05:6000:290c:b0:42b:3592:1b92 with SMTP id ffacd0b85a97d-42f7985ffeemr4011053f8f.47.1764863884543;
        Thu, 04 Dec 2025 07:58:04 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [XEN PATCH v2 2/3] xen/arm: optimize stage-1,2 combined TLBI in presence of FEAT_nTLBPA
Date: Thu,  4 Dec 2025 20:57:42 +0500
Message-ID: <c94db0e0468637a37a00157c6c338e19c98316ef.1764863575.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ce2e7c32f06ba8a48a2074fa8cadd9c122b6490f.1764863575.git.haseebashraf091@gmail.com>
References: <ce2e7c32f06ba8a48a2074fa8cadd9c122b6490f.1764863575.git.haseebashraf091@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

FEAT_nTLBPA (quoting definition) introduces a mechanism to identify
if the intermediate caching of translation table walks does not
include non-coherent caches of previous valid translation table
entries since the last completed TLBI applicable to the PE.

As there won't be any non-coherent caches since the last completed
TLBI, stage-1 TLBI won't be required while performing stage-2 TLBI.

This feature is optionally available in both arm32 and arm64.

Suggested-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 xen/arch/arm/cpufeature.c                 | 19 ++++++++++
 xen/arch/arm/include/asm/arm32/flushtlb.h | 18 +++++-----
 xen/arch/arm/include/asm/arm64/flushtlb.h | 42 ++++++++++++++++++++---
 xen/arch/arm/include/asm/cpufeature.h     | 24 +++++++++++--
 xen/arch/arm/include/asm/processor.h      |  7 ++++
 5 files changed, 95 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 1a80738571..9fa1c45869 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -17,7 +17,19 @@ DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
 
 struct cpuinfo_arm __read_mostly domain_cpuinfo;
 
+#ifdef CONFIG_ARM_32
+static bool has_ntlbpa(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.mm32.ntlbpa == MM32_NTLBPA_SUPPORT_IMP;
+}
+#endif
+
 #ifdef CONFIG_ARM_64
+static bool has_ntlbpa(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.mm64.ntlbpa == MM64_NTLBPA_SUPPORT_IMP;
+}
+
 static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
 {
     return system_cpuinfo.isa64.sb;
@@ -25,6 +37,13 @@ static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
 #endif
 
 static const struct arm_cpu_capabilities arm_features[] = {
+#if defined(CONFIG_ARM_32) || defined(CONFIG_ARM_64)
+    {
+        .desc = "Intermediate caching of translation table walks (nTLBPA)",
+        .capability = ARM_HAS_NTLBPA,
+        .matches = has_ntlbpa,
+    },
+#endif
 #ifdef CONFIG_ARM_64
     {
         .desc = "Speculation barrier instruction (SB)",
diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 70a8b1dad6..db15f29216 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -58,11 +58,12 @@ static inline void flush_guest_tlb_s1_local(void)
      * See ARMv8 (DDI 0487A.e): G4-4126 Table G4-24.
      *
      * The following macros should be used where intention is to
-     * clear only stage-1 TLBs. This would be helpful in future in
-     * identifying which stage-1 TLB flushes can be skipped such as
-     * in present of FEAT_nTLBPA.
+     * clear only stage-1 TLBs. This would be helpful in identifying
+     * which stage-1 TLB flushes can be skipped in present of
+     * FEAT_nTLBPA.
      */
-    return flush_guest_tlb_local();
+    if ( !cpus_have_const_cap(ARM_HAS_NTLBPA) )
+        flush_guest_tlb_local();
 }
 
 /*
@@ -78,11 +79,12 @@ static inline void flush_guest_tlb_s1(void)
      * See ARMv8 (DDI 0487A.e): G4-4126 Table G4-24.
      *
      * The following macros should be used where intention is to
-     * clear only stage-1 TLBs. This would be helpful in future in
-     * identifying which stage-1 TLB flushes can be skipped such as
-     * in present of FEAT_nTLBPA.
+     * clear only stage-1 TLBs. This would be helpful in identifying
+     * which stage-1 TLB flushes can be skipped in present of
+     * FEAT_nTLBPA.
      */
-    return flush_guest_tlb();
+    if ( !cpus_have_const_cap(ARM_HAS_NTLBPA) )
+        flush_guest_tlb();
 }
 
 /* Flush TLB of local processor for address va. */
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index fff76375a3..a2f1af833e 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -47,6 +47,24 @@ static inline void name(void)                    \
         : : : "memory");                         \
 }
 
+#define TLB_HELPER_NTLBPA(name, tlbop, sh)           \
+static inline void name(void)                        \
+{                                                    \
+    if ( !cpus_have_const_cap(ARM_HAS_NTLBPA) )      \
+        asm_inline volatile (                        \
+            "dsb  "  # sh  "st;"                     \
+            "tlbi "  # tlbop  ";"                    \
+            ALTERNATIVE(                             \
+                "nop; nop;",                         \
+                "dsb  ish;"                          \
+                "tlbi "  # tlbop  ";",               \
+                ARM64_WORKAROUND_REPEAT_TLBI,        \
+                CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
+            "dsb  "  # sh  ";"                       \
+            "isb;"                                   \
+            : : : "memory");                         \
+}
+
 /*
  * FLush TLB by IPA. This will likely be used in a loop, so the caller
  * is responsible to use the appropriate memory barriers before/after
@@ -96,10 +114,10 @@ TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh)
 TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish)
 
 /* Flush local TLBs, current VMID, stage-1 only */
-TLB_HELPER(flush_guest_tlb_s1_local, vmalle1, nsh)
+TLB_HELPER_NTLBPA(flush_guest_tlb_s1_local, vmalle1, nsh)
 
 /* Flush innershareable TLBs, current VMID, stage-1 only */
-TLB_HELPER(flush_guest_tlb_s1, vmalle1is, ish)
+TLB_HELPER_NTLBPA(flush_guest_tlb_s1, vmalle1is, ish)
 
 /* Flush local TLBs, current VMID, stage-2 for ipa address */
 TLB_HELPER_IPA(__flush_guest_tlb_one_s2_local, ipas2e1)
@@ -153,7 +171,15 @@ static inline void flush_guest_tlb_range_ipa_local(paddr_t ipa,
         __flush_guest_tlb_one_s2_local(ipa);
         ipa += PAGE_SIZE;
     }
-    /* Final dsb() and isb() are done in following invocation */
+
+    if ( cpus_have_const_cap(ARM_HAS_NTLBPA) )
+    {
+        dsb(nsh);
+        isb();
+        return;
+    }
+
+    /* Otherwise final dsb() and isb() are done in following invocation */
     flush_guest_tlb_s1_local();
 }
 
@@ -185,7 +211,15 @@ static inline void flush_guest_tlb_range_ipa(paddr_t ipa,
         __flush_guest_tlb_one_s2(ipa);
         ipa += PAGE_SIZE;
     }
-    /* Final dsb() and isb() are done in following invocation */
+
+    if ( cpus_have_const_cap(ARM_HAS_NTLBPA) )
+    {
+        dsb(ish);
+        isb();
+        return;
+    }
+
+    /* Otherwise final dsb() and isb() are done in following invocation */
     flush_guest_tlb_s1();
 }
 
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index b6df188011..af4e9bdf06 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -76,8 +76,9 @@
 #define ARM_WORKAROUND_BHB_SMCC_3 15
 #define ARM_HAS_SB 16
 #define ARM64_WORKAROUND_1508412 17
+#define ARM_HAS_NTLBPA 18
 
-#define ARM_NCAPS           18
+#define ARM_NCAPS           19
 
 #ifndef __ASSEMBLY__
 
@@ -269,7 +270,8 @@ struct cpuinfo_arm {
             unsigned long ets:4;
             unsigned long __res1:4;
             unsigned long afp:4;
-            unsigned long __res2:12;
+            unsigned long ntlbpa:4;
+            unsigned long __res2:8;
             unsigned long ecbhb:4;
 
             /* MMFR2 */
@@ -430,8 +432,24 @@ struct cpuinfo_arm {
         register_t bits[1];
     } aux32;
 
-    struct {
+    union {
         register_t bits[6];
+        struct {
+            /* MMFR0 */
+            unsigned long __res0:32;
+            /* MMFR1 */
+            unsigned long __res1:32;
+            /* MMFR2 */
+            unsigned long __res2:32;
+            /* MMFR3 */
+            unsigned long __res3:32;
+            /* MMFR4 */
+            unsigned long __res4:32;
+            /* MMFR5 */
+            unsigned long __res5_0:4;
+            unsigned long ntlbpa:4;
+            unsigned long __res5_1:24;
+        };
     } mm32;
 
     struct {
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 92c8bc1a31..01f3cb16a0 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -458,9 +458,16 @@
 /* FSR long format */
 #define FSRL_STATUS_DEBUG       (_AC(0x22,UL)<<0)
 
+#ifdef CONFIG_ARM_32
+#define MM32_NTLBPA_SUPPORT_NI      0x0
+#define MM32_NTLBPA_SUPPORT_IMP     0x1
+#endif
+
 #ifdef CONFIG_ARM_64
 #define MM64_VMID_8_BITS_SUPPORT    0x0
 #define MM64_VMID_16_BITS_SUPPORT   0x2
+#define MM64_NTLBPA_SUPPORT_NI      0x0
+#define MM64_NTLBPA_SUPPORT_IMP     0x1
 #endif
 
 #ifndef __ASSEMBLY__
-- 
2.43.0


