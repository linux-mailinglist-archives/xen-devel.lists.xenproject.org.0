Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21FAD39552
	for <lists+xen-devel@lfdr.de>; Sun, 18 Jan 2026 14:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1207813.1520206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhSuw-0004Zm-Hz; Sun, 18 Jan 2026 13:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1207813.1520206; Sun, 18 Jan 2026 13:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhSuw-0004YC-Eg; Sun, 18 Jan 2026 13:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1207813;
 Sun, 18 Jan 2026 13:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTiv=7X=gmail.com=haseebashraf091@srs-se1.protection.inumbo.net>)
 id 1vhSuv-0004Go-3D
 for xen-devel@lists.xenproject.org; Sun, 18 Jan 2026 13:34:09 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d942f59-f472-11f0-b15e-2bf370ae4941;
 Sun, 18 Jan 2026 14:34:08 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b87693c981fso603418766b.1
 for <xen-devel@lists.xenproject.org>; Sun, 18 Jan 2026 05:34:08 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.37.230.99])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65452cdab55sm7683163a12.10.2026.01.18.05.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 05:34:06 -0800 (PST)
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
X-Inumbo-ID: 5d942f59-f472-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768743247; x=1769348047; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPopwKkyNB/YxawSKEN75nDXwr6v2rb4f3Mwy9XTqs4=;
        b=TLLRLzwpZBMbs4Pi3ntS7kEG/W0q9sgqq2S5dlduZip5THOLP/WJSBbAgZaDtqNNH3
         G3x9VDhFlsE7UlZ6aa0zupOJH51ZUfzS3PYb4uI6fpQW+e7KcnWP3J3DFrXIQ6Kj3UEz
         6YFJtq6tt7O2QRMTgE3pniK0LALictVQRWGkMLWkxjAxtMhwPSZqQ4tnknDvP2AZRpJs
         siAW4yvrMNhXtd0APyyqD1Nb4bv103HT6fYCKIyXrTk8Kc+QxTwsWBayropGZaGCcW9B
         jWwTth9m7IpXdqFZJZAYVX7pcV86Aed0WpARBWq7yKXxU6OfaPVbHX+gfx2laXPFVl7Q
         Th7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768743247; x=1769348047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MPopwKkyNB/YxawSKEN75nDXwr6v2rb4f3Mwy9XTqs4=;
        b=fx81sk2IZKQ1bRImz2BhSgnksf0mt2pKpA73lHRjyG006/sMoSIA1LUrKxx/Lf+2Hj
         R9zxp5Np+cqjv3F9VzJvH2w6QcHDgav8bZbmYvmaffGl1omqqHuqbZ3ZoGb0JArFPJsS
         te3GqlLktLUKPLkWa3ynWZmXddQPU3ngV30a9a3ja+Ckxhztrdl/gYEATV0IoMfiMlGz
         +DShOnNlwevy+mM8Xw9EiXNvwHxGRzlNY+keotWVptZDOjFsakepJ9yE6LwoP3OMqRSK
         Db3Uh7w1TF5y/tAq/6230y+wkJ+trlAHBjJbw4i+JlpxtguMDhp806CnwVFX9+iywacP
         zPgQ==
X-Gm-Message-State: AOJu0YxP0ttHPaWOHOpBvgLMefHG3Tp+MpWLXLlYgPIOYaYwLVKNKSta
	P/Sn6v3v2UKVugrPZQnfMWe8mUhsL5EswvoD1ixitpI96AHUiTOdlZ0uq+BKQQ==
X-Gm-Gg: AY/fxX756sXDc2PLhL+w2DsWsqcpfhDnjC9IoxmrNvArK8sUZzA9ry3gvQCc0eLwh37
	wQ71pkuyFSgf2Q9iG2dxVxVYWMzLxjuyc6IBk7pIqrgEaRR+C5tZpQVP8P8+0hzA7omRgeM1qph
	4xaowlbcora4T7Ax1EhMTnSwf1SEHd17hJmhL0JFwoMUvpowGPeZaaZrLRnsNm63ZbQIGUXlnH2
	l8MvrgQtnxtQXBuzenPFfjHs62mB+eyOrYwk8tz5B6RYY2W7poVyF1yFDq/YLMgA3NPR2gQeg7W
	CegV7okDHVVjJcQg8LquEKXJAxfEp+MNCYQHEut/JoO7WVhogrYOPnpnJ0I/DvPxbt+h9tKYVRp
	tTh2nQCH3hSkGleDQkMUl1gq/SaxS4WQGYJtXpr7N5Heak1WX7HOMvaGMSgQBN1hf3zgz2lMc+j
	5hRhK/OFx5z/6mHYXrgVK5JkDeM0nDMj72VnJscJXTre2TNmnBCg==
X-Received: by 2002:a17:907:3c96:b0:b75:7b39:88bc with SMTP id a640c23a62f3a-b8792fee117mr817891566b.58.1768743246925;
        Sun, 18 Jan 2026 05:34:06 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v3 3/3] xen/arm32: add CPU capability for IPA-based TLBI
Date: Sun, 18 Jan 2026 18:33:29 +0500
Message-ID: <68ad0721305814f6d7081223df4039b71627ae1f.1765197209.git.haseeb.ashraf@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765197209.git.haseeb.ashraf@siemens.com>
References: <cover.1765197209.git.haseeb.ashraf@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

This feature is available since armv8 and can be used to perform
IPA-based TLBI for arm32. XENMEM_remove_from_physmap performs this
invalidation in each hypercall so this code path will be optimized,
instead of performing a TLBIALL each time in presence of nTLBPA.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Changes in v3:
- There are no functional changes in this version. There are minor
  code updates and comment updates as per the feedback on v2.
- The cpregs are defined in order as per Coprocessor-> CRn-> Opcode 1
  -> CRm-> Opcode 2.
- Added comment to explain why IPA-based TLBI is added only in
  presence of FEAT_nTLBPA.
- Replaced `goto default_tlbi` with if...else.
- Removed extra definitions of MM32_UNITLB_* macros which were not
  being used.

Changes in v2:
- This commit is implemented in v2 as per the feedback to implement
  IPA-based TLBI for Arm32 in addition to Arm64.
---
 xen/arch/arm/cpufeature.c                 | 12 +++++++
 xen/arch/arm/include/asm/arm32/flushtlb.h | 42 ++++++++++++++++++++---
 xen/arch/arm/include/asm/cpregs.h         |  4 +++
 xen/arch/arm/include/asm/cpufeature.h     | 15 ++++----
 xen/arch/arm/include/asm/processor.h      |  3 ++
 5 files changed, 65 insertions(+), 11 deletions(-)

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
index 7cff042508..3e6f86f6d2 100644
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
@@ -104,12 +106,42 @@ static inline void flush_guest_tlb_range_ipa(paddr_t ipa,
                                              unsigned long size)
 {
     /*
-     * Following can invalidate both stage-1 and stage-2 TLBs depending upon
-     * the execution mode.
-     *
-     * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
+     * IPA-based TLBI is used only in presence of nTLBPA, otherwise, stage-1
+     * invalidation would still be required and there is no separate TLBI for
+     * stage-1 on Arm32. So in absence of nTLBPA, it is pointless to flush by
+     * IPA.
      */
-    flush_guest_tlb();
+    if ( cpus_have_const_cap(ARM_HAS_NTLBPA) &&
+         cpus_have_const_cap(ARM32_HAS_TLB_IPA) )
+    {
+        /*
+         * If IPA range is too big (empirically found to be 256M), then
+         * fallback to full TLB flush
+         */
+        if ( size > SZ_256M )
+            /*
+             * Following can invalidate both stage-1 and stage-2 TLBs depending
+             * upon the execution mode.
+             *
+             * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
+             */
+            flush_guest_tlb();
+        else
+        {
+            paddr_t end = ipa + size;
+
+            dsb(ishst); /* Ensure prior page-tables updates have completed */
+            while ( ipa < end )
+            {
+                /* Flush stage-2 TLBs for ipa address. */
+                asm volatile(STORE_CP32(0, TLBIIPAS2IS)
+                             : : "r" (ipa >> PAGE_SHIFT) : "memory");
+                ipa += PAGE_SIZE;
+            }
+            dsb(ish);
+            isb();
+        }
+    }
 }
 
 #endif /* __ASM_ARM_ARM32_FLUSHTLB_H__ */
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index a7503a190f..51f091dace 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -223,9 +223,13 @@
 #define TLBIMVA         p15,0,c8,c7,1   /* invalidate unified TLB entry by MVA */
 #define TLBIASID        p15,0,c8,c7,2   /* invalid unified TLB by ASID match */
 #define TLBIMVAA        p15,0,c8,c7,3   /* invalidate unified TLB entries by MVA all ASID */
+#define TLBIIPAS2IS     p15,4,c8,c0,1   /* Invalidate unified TLB entry for stage 2 by IPA inner shareable */
+#define TLBIIPAS2LIS    p15,4,c8,c0,5   /* Invalidate unified TLB entry for stage 2 last level by IPA inner shareable */
 #define TLBIALLHIS      p15,4,c8,c3,0   /* Invalidate Entire Hyp. Unified TLB inner shareable */
 #define TLBIMVAHIS      p15,4,c8,c3,1   /* Invalidate Unified Hyp. TLB by MVA inner shareable */
 #define TLBIALLNSNHIS   p15,4,c8,c3,4   /* Invalidate Entire Non-Secure Non-Hyp. Unified TLB inner shareable */
+#define TLBIIPAS2       p15,4,c8,c4,1   /* Invalidate unified TLB entry for stage 2 by IPA */
+#define TLBIIPAS2L      p15,4,c8,c4,5   /* Invalidate unified TLB entry for stage 2 last level by IPA */
 #define TLBIALLH        p15,4,c8,c7,0   /* Invalidate Entire Hyp. Unified TLB */
 #define TLBIMVAH        p15,4,c8,c7,1   /* Invalidate Unified Hyp. TLB by MVA */
 #define TLBIALLNSNH     p15,4,c8,c7,4   /* Invalidate Entire Non-Secure Non-Hyp. Unified TLB */
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 9f796ed4c1..07f1d770b3 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -77,8 +77,9 @@
 #define ARM_HAS_SB 16
 #define ARM64_WORKAROUND_1508412 17
 #define ARM_HAS_NTLBPA 18
+#define ARM32_HAS_TLB_IPA 19
 
-#define ARM_NCAPS           19
+#define ARM_NCAPS           20
 
 #ifndef __ASSEMBLER__
 
@@ -440,15 +441,17 @@ struct cpuinfo_arm {
             /* MMFR1 */
             unsigned long __res1:32;
             /* MMFR2 */
-            unsigned long __res2:32;
+            unsigned long __res2:16;
+            unsigned long unitlb:4;
+            unsigned long __res3:12;
             /* MMFR3 */
-            unsigned long __res3:32;
-            /* MMFR4 */
             unsigned long __res4:32;
+            /* MMFR4 */
+            unsigned long __res5:32;
             /* MMFR5 */
-            unsigned long __res5:4;
+            unsigned long __res6:4;
             unsigned long ntlbpa:4;
-            unsigned long __res6:24;
+            unsigned long __res7:24;
         };
     } mm32;
 
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 85f3b643a0..eda39566e1 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -460,6 +460,9 @@
 #define FSRL_STATUS_DEBUG       (_AC(0x22,UL)<<0)
 
 #ifdef CONFIG_ARM_32
+#define MM32_UNITLB_NI              0x0
+#define MM32_UNITLB_BY_IPA          0x6
+
 #define MM32_NTLBPA_SUPPORT_NI      0x0
 #define MM32_NTLBPA_SUPPORT_IMP     0x1
 #endif
-- 
2.43.0


