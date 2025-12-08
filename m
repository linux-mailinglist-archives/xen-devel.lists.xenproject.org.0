Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F195CAD58F
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180638.1503805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbiK-0005fs-1k; Mon, 08 Dec 2025 13:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180638.1503805; Mon, 08 Dec 2025 13:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbiJ-0005e6-Ts; Mon, 08 Dec 2025 13:55:43 +0000
Received: by outflank-mailman (input) for mailman id 1180638;
 Mon, 08 Dec 2025 13:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22jW=6O=gmail.com=haseebashraf091@srs-se1.protection.inumbo.net>)
 id 1vSbiI-00055Z-Sj
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:55:43 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95264e19-d43d-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 14:55:41 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso42487505e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:55:41 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.89.17])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792afe32cbsm144746585e9.0.2025.12.08.05.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 05:55:38 -0800 (PST)
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
X-Inumbo-ID: 95264e19-d43d-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765202140; x=1765806940; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89jrADcfTNLToqirJ07l6LVFLAbwHAWxMw55ZpCsj8k=;
        b=R7kOkrVKTZWHzlEqEkbplbZIhCsrLOv68BdOznIcfKCdt9TRx/5bRu4dYzwWINSQ9i
         Ukdonohwb8edMkgezbTC2RUrhlpDDTgsDE33y0C0yALQWTw8fAS9mYg2VAG81FTf084A
         DW52rixlqDid93HYVonlHknB8BbKldaTcAbo4S/YT16uYAsgK/phqKown7HKzxMOcQJV
         pPFNKLbjpLjYSDdxJnOgSwtNtrXMh0GNzb9SQarCZnA7/DrLAd8NOFzQD16tmF47Zj6X
         nLe4lAwaXBOmenbpBWU+cjD4hpYdQntEpWuMy1AhwaQRuhxVBKVDtxj1HybuHd6N0y7C
         8a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765202140; x=1765806940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=89jrADcfTNLToqirJ07l6LVFLAbwHAWxMw55ZpCsj8k=;
        b=jgX/oMZyYVE1gJZyj6U9HNq29vIWy9e4veAp0V+X7KVcgQMh5oHV7FCtuWJ/AhrIFy
         hpwdcYYHh2r1Ljc97vphEvkf9b0IxudR3yEeGKQ9oZ3lnYUytQRdpioEYT6MYEzK5pc0
         AHJbdauLUaSgzWWw1evoiaer3cQEwdgnOfmYFt+CdVpCraSlm7b8WzWjE7V2YCAeXk6l
         yWrNvcyqpjl08VN2TwOhaq6ULTmA0s0tnZo4VUX15+bE1sk8OvbzmY8aLtlt1UZG9JKe
         hgT52nrs9xixsOaiChOVRksIlSxHygBr0ufcD42/0sCdaAGRm+z8sOrPGrxw9k8EnTIh
         c2mg==
X-Gm-Message-State: AOJu0YzSKyjmsWky77lJti6UFgMi3vS+H3RwHy4/bBBPei616Qi5RWnE
	IyAaIDoFt2+t3Ogi2vm9wSjIUmr1bBLnqJxEH+TVIS9Z1QNcoWGr+iw6Qka5/E7i
X-Gm-Gg: ASbGnct4hRzhgim/epibP3p7OQ+/mrP6xV6HBVQlEyFJR1TC7kw8aUbdjNbLTFWsB9L
	eIMnU1ZrhlESPE/GW9Cx15l703/XbH3BCbiCZkWHyf3wWuGqxIIhyB2UkTPZUFolehvfNyzCWsU
	WZwHHxu+6CfvgvRUBVA6mROh6UmeYlNK4rQ7szfLcV3NcKLHojUQaXyAwA5NU4EpG45b/DLT3OH
	qZGB5nibi5J5WG55MOqrOtqW5I7ZcTMPlAA0yF97kdZI5qBmzmi6V+pIEbtuKnG4FcjaCpQ0Jw0
	6ZXpU5VcfQyjACTbiAWd/oSHgzgb2WN+tQffEvcDnqtWYYx04KpdQzc8+irx088ToF0QzyB6RDU
	094OZHfCOWhemnTczmxDXq1mBkTQqEOoPIVyDlpK6Muyg2A5dtgs5eY5uxiNTALwnrU8ZpdiYqd
	Bk1KA4zqZkADV/Ocg8X2DsgLxTCj+7tQb5EQt0arfc+uNFg9nm
X-Google-Smtp-Source: AGHT+IGpJ9lI7qlZKtyZlSbU9CKaEyhK+/QVNIKFw96TPH9dDQojcnNuoPmt6VzvmTXcTyZ7xin53w==
X-Received: by 2002:a05:600c:3513:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-47939deff25mr89472025e9.1.1765202139699;
        Mon, 08 Dec 2025 05:55:39 -0800 (PST)
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
Subject: [PATCH 2/3] xen/arm: optimize stage-1,2 combined TLBI in presence of FEAT_nTLBPA
Date: Mon,  8 Dec 2025 18:55:15 +0500
Message-ID: <025aae317ebfbb234554be7621fd38fcad08a0c7.1765197209.git.haseeb.ashraf@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765197209.git.haseeb.ashraf@siemens.com>
References: <cover.1765197209.git.haseeb.ashraf@siemens.com>
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

Changes in v3:
- This commit has no functional change in v3, only rebasing changes
  due to updates in commit-1.

Changes in v2:
- This commit is implemented in v2 and is splitted from commit-1 in
  v1. This is implemented by using CPU capability.
---
 xen/arch/arm/cpufeature.c                 | 19 ++++++
 xen/arch/arm/include/asm/arm32/flushtlb.h | 14 +++--
 xen/arch/arm/include/asm/arm64/flushtlb.h | 77 ++++++++++++++++-------
 xen/arch/arm/include/asm/cpufeature.h     | 24 ++++++-
 xen/arch/arm/include/asm/processor.h      |  7 +++
 5 files changed, 109 insertions(+), 32 deletions(-)

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
index 3c0c2123d4..7cff042508 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -49,8 +49,8 @@ TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh)
  * Flush TLB of local processor. Use when flush for only stage-1 is intended.
  *
  * The following function should be used where intention is to clear only
- * stage-1 TLBs. This would be helpful in future in identifying which stage-1
- * TLB flushes can be skipped such as in present of FEAT_nTLBPA.
+ * stage-1 TLBs. This would be helpful in identifying which stage-1 TLB flushes
+ * can be skipped such as in present of FEAT_nTLBPA.
  */
 static inline void flush_guest_tlb_s1_local(void)
 {
@@ -60,7 +60,8 @@ static inline void flush_guest_tlb_s1_local(void)
      *
      * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
      */
-    return flush_guest_tlb_local();
+    if ( !cpus_have_const_cap(ARM_HAS_NTLBPA) )
+        flush_guest_tlb_local();
 }
 
 /*
@@ -68,8 +69,8 @@ static inline void flush_guest_tlb_s1_local(void)
  * stage-1 is intended.
  *
  * The following function should be used where intention is to clear only
- * stage-1 TLBs. This would be helpful in future in identifying which stage-1
- * TLB flushes can be skipped such as in present of FEAT_nTLBPA.
+ * stage-1 TLBs. This would be helpful in identifying which stage-1 TLB flushes
+ * can be skipped such as in present of FEAT_nTLBPA.
  */
 static inline void flush_guest_tlb_s1(void)
 {
@@ -79,7 +80,8 @@ static inline void flush_guest_tlb_s1(void)
      *
      * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
      */
-    return flush_guest_tlb();
+    if ( !cpus_have_const_cap(ARM_HAS_NTLBPA) )
+        flush_guest_tlb();
 }
 
 /* Flush TLB of local processor for address va. */
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 67ae616993..0f0d5050e5 100644
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
  * FLush TLB by VA. This will likely be used in a loop, so the caller
  * is responsible to use the appropriate memory barriers before/after
@@ -75,10 +93,10 @@ TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh)
 TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish)
 
 /* Flush local TLBs, current VMID, stage-1 only */
-TLB_HELPER(flush_guest_tlb_s1_local, vmalle1, nsh)
+TLB_HELPER_NTLBPA(flush_guest_tlb_s1_local, vmalle1, nsh)
 
 /* Flush innershareable TLBs, current VMID, stage-1 only */
-TLB_HELPER(flush_guest_tlb_s1, vmalle1is, ish)
+TLB_HELPER_NTLBPA(flush_guest_tlb_s1, vmalle1is, ish)
 
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
 TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh)
@@ -104,8 +122,6 @@ TLB_HELPER_VA(__flush_xen_tlb_one, vae2is)
  */
 static inline void flush_guest_tlb_range_ipa(paddr_t ipa, unsigned long size)
 {
-    paddr_t end;
-
     /*
      * If IPA range is too big (empirically found to be 256M), then fallback to
      * full TLB flush.
@@ -113,27 +129,42 @@ static inline void flush_guest_tlb_range_ipa(paddr_t ipa, unsigned long size)
     if ( size > SZ_256M )
         return flush_guest_tlb();
 
-    end = ipa + size;
-
-    /*
-     * See ARM ARM DDI 0487L.b D8.17.6.1 (Invalidating TLB entries from stage 2
-     * translations) for details of TLBI sequence.
-     */
-    dsb(ishst); /* Ensure prior page-tables updates have completed */
-    while ( ipa < end )
+    else if ( size > 0 )
     {
-        /* Flush stage-2 TLBs for ipa address */
-        asm_inline volatile (
-            "tlbi ipas2e1is, %0;" : : "r" (ipa >> PAGE_SHIFT) : "memory" );
-        ipa += PAGE_SIZE;
+        paddr_t end = ipa + size;
+
+        /*
+         * See ARM ARM DDI 0487L.b D8.17.6.1 (Invalidating TLB entries from
+         * stage 2 translations) for details on TLBI sequence.
+         */
+        dsb(ishst); /* Ensure prior page-tables updates have completed */
+        while ( ipa < end )
+        {
+            /* Flush stage-2 TLBs for ipa address */
+            asm_inline volatile (
+                "tlbi ipas2e1is, %0;" : : "r" (ipa >> PAGE_SHIFT) : "memory" );
+            ipa += PAGE_SIZE;
+        }
+        if ( cpus_have_const_cap(ARM_HAS_NTLBPA) )
+            asm_inline volatile (
+                ALTERNATIVE(
+                    "nop; nop;",
+                    "dsb  ish;"
+                    "tlbi ipas2e1is, %0;",
+                    ARM64_WORKAROUND_REPEAT_TLBI,
+                    CONFIG_ARM64_WORKAROUND_REPEAT_TLBI)
+                "dsb  ish;"
+                "isb;"
+                : : "r" ((ipa - PAGE_SIZE) >> PAGE_SHIFT) : "memory" );
+        else
+            /*
+             * As ARM64_WORKAROUND_REPEAT_TLBI is required to be applied to
+             * last TLBI of the sequence, it is only needed to be handled in
+             * the following invocation. Final dsb() and isb() are also applied
+             * in the following invocation.
+             */
+            flush_guest_tlb_s1();
     }
-    /*
-     * As ARM64_WORKAROUND_REPEAT_TLBI is required to be applied to last TLBI
-     * of the sequence, it is only needed to be handled in the following
-     * invocation. Final dsb() and isb() are also applied in the following
-     * invocation.
-     */
-    flush_guest_tlb_s1();
 }
 
 #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 13353c8e1a..9f796ed4c1 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -76,8 +76,9 @@
 #define ARM_WORKAROUND_BHB_SMCC_3 15
 #define ARM_HAS_SB 16
 #define ARM64_WORKAROUND_1508412 17
+#define ARM_HAS_NTLBPA 18
 
-#define ARM_NCAPS           18
+#define ARM_NCAPS           19
 
 #ifndef __ASSEMBLER__
 
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
+            unsigned long __res5:4;
+            unsigned long ntlbpa:4;
+            unsigned long __res6:24;
+        };
     } mm32;
 
     struct {
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 1a48c9ff3b..85f3b643a0 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -459,9 +459,16 @@
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
 
 #ifndef __ASSEMBLER__
-- 
2.43.0


