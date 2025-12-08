Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4484DCAD592
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180641.1503814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbiO-00061e-Ds; Mon, 08 Dec 2025 13:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180641.1503814; Mon, 08 Dec 2025 13:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbiO-0005xi-AF; Mon, 08 Dec 2025 13:55:48 +0000
Received: by outflank-mailman (input) for mailman id 1180641;
 Mon, 08 Dec 2025 13:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22jW=6O=gmail.com=haseebashraf091@srs-se1.protection.inumbo.net>)
 id 1vSbiM-00055Z-SP
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:55:46 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98332bf2-d43d-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 14:55:46 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso22220355e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:55:46 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.89.17])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792afe32cbsm144746585e9.0.2025.12.08.05.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 05:55:44 -0800 (PST)
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
X-Inumbo-ID: 98332bf2-d43d-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765202145; x=1765806945; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPopwKkyNB/YxawSKEN75nDXwr6v2rb4f3Mwy9XTqs4=;
        b=LaWRiAWH3U9p2RIolrxorVorRddIpUL9KEB4qmQO3ep2pEvJKXhfLOSTmTHsqABJs9
         WgiRp31Po7IXsXe/f6DWKKYIrN1Ki1vwc0+lq2tGfQGcub6iU7ep3WWj+mlytms/2M54
         0HSpMEhGCwPVGqf688jmiEHCmMoZGHVNyb+5h9Iav3Bdu+Pcjzti1AaAusFiy8wgr6+Z
         zBKlqwtQ+pBTndaaMkwYlSZMk6YnSQa0Ql3r4L2XX6s0NAJoXO9CebaomAZoSWpINS0/
         KYTiIFbv2SCjnRl/3RcARj5LoaFfuzwyRL0J1nmJLdFwfWL1eW5MqPyDk3KBS5zeodl4
         MZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765202145; x=1765806945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MPopwKkyNB/YxawSKEN75nDXwr6v2rb4f3Mwy9XTqs4=;
        b=M6L7RUGwLfWWH54Z83MIpHf1LqljWqp6syF/plFznR8fcyHWXxoq7FGkYB/RfWXBHk
         vkL29rO1ZyNNbZU6VQgD4OnLC/fvU4sn0Q1PwESGx2oL79itHpwI3AHhVO4gEJPrWpta
         X3Tw70DJXDqEYlHFeeOMnyDxCX8rJ4uDi8yGsiIpLQb/2lsetrbzEwtvLspBZprPd7Io
         uquk28i/5C7XHtL4gtbZtk1NliJPxNA9wgOzVcBzCM+AktnpYVrqF33l8zNHk3NZu/OV
         5KXD7KYkeU5a80VOSAxA2I8D2yiw1KIN+TI1EslUBgsl6NDjnLbDPj0Em11UknGWgr3E
         qFEQ==
X-Gm-Message-State: AOJu0YyZJTCjhnaDEjFWyBHKlVCRlWvSfPDRmg1D0ioNP/E+ozotSmUa
	wcbForT1pHwk0qKfuBVCfCH7jHXsldhFVNNMEsCYorWCvQWD+tBKq27lTWGZ+LiN
X-Gm-Gg: ASbGncsAfp2XKwc0auVl9Pxaeo4v6VMQwD1VcAxi1nWYxTcY5zJtbc/huJemPVaLyJX
	HKc1c81Vi9baV3D39TiN+eoXFEMB79lh+anYFz0IGkq00YUCdlDZpVIUVNq49SJZkrrWVK03Y9m
	evTu4hkPaWWO6JSIqtZXW/EVWhzaOEi4ndvsx+oHMMzmoAZcDt+NDJPopR3UPnbLquXn50AcfSa
	tMF8igiw7nhCKEhQ2Ogmkmg/u1S24giVE/NE4RL4e9H+BVCB2sLAiMaupDm0Q8/44tAnor1QQZd
	/VKo8M7lgEQj2YbMm/3jmstQqzhlmcWTpasmsINxgln2D+d3voyhqx/uGMKWWZtoMJEgsmpqF5S
	QoLHpkehchB4oWHtnjl8KBxZWkTRcqjwAk4LIvj166alwYkazRiT59iNyiBGwX5D3GXs76g1BAb
	lfl2W4rKR5sPb5du3gKL/V+w6wNZM1MJ1ML2IF4CVM+Gs0Php3
X-Google-Smtp-Source: AGHT+IFKsQ6KVKizbOCvWoWILsKDhV/jKkHa/MC30/90rsJ7rWCeFy9yjpUbWDLrWUqCwyT+/BK/SQ==
X-Received: by 2002:a05:600c:a43:b0:47a:75b6:32c with SMTP id 5b1f17b1804b1-47a7b17cfdfmr4106165e9.2.1765202145199;
        Mon, 08 Dec 2025 05:55:45 -0800 (PST)
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
Subject: [PATCH 3/3] xen/arm32: add CPU capability for IPA-based TLBI
Date: Mon,  8 Dec 2025 18:55:16 +0500
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


