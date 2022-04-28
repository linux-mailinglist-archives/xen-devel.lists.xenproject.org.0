Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2298D513159
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 12:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316411.535332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk1Tb-0004dz-TQ; Thu, 28 Apr 2022 10:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316411.535332; Thu, 28 Apr 2022 10:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk1Tb-0004bf-QG; Thu, 28 Apr 2022 10:34:23 +0000
Received: by outflank-mailman (input) for mailman id 316411;
 Thu, 28 Apr 2022 10:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMo3=VG=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1nk1Ta-0004bZ-Sk
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 10:34:22 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c408c76a-c6de-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 12:34:21 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id g6so8691581ejw.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Apr 2022 03:34:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z19-20020aa7cf93000000b0042617ba63a6sm1321952edx.48.2022.04.28.03.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 03:34:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1460B1FFB7;
 Thu, 28 Apr 2022 11:34:19 +0100 (BST)
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
X-Inumbo-ID: c408c76a-c6de-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b+QXBSMsT4vIBjhfjMiEyj5eYLbGz4qzg2d34+w60ac=;
        b=gnuxFjU6+xf1chs27XrAO54xQu1FL3sXqQaRSduZ/7xTfQmiOltGyx3Fe2p6Vifbox
         gIx6u+9a3HeZpgyE74w/j9rDFMOlI980fsMbawkgtZA26GTYhsAh1tlzytBxW/Tlj6BC
         uuoPxP40Xu7Y1u0YrTvh1t5NE1Ozs1XXfxgrYHIZyhT3dbs5Q0YMiIwvvEWfV/s04FTS
         kiOV+fwJK9MJ4wT8pb4GA4C0VgXqWlWtFzV4qEO5+/cQoyBSpdLD8F8/2DPjclFWavnu
         ln4XRkjo762TVyfcpGiiM0MRzQV76G36t+p8J+gazAOg27tZttAlymxYG26qMJyN0epZ
         CVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b+QXBSMsT4vIBjhfjMiEyj5eYLbGz4qzg2d34+w60ac=;
        b=utpPeA39bSv3bVzjNrMwOEpHmmU6BD+cfvh0LT1Iy69DcasiDshZPcQpe/oaByP29d
         NA4Rpxd6opaHh9P2ZjYobIkhKdLnmjWPtcFIfH5c9eFsL+SArKeaHAmYxfHmCfh08u0B
         BNFmmPCqYiWTUKbF3WeAij49E0+IFGC0d6W9KRyJleve8OdjVd/SiWv33xz6s1Yw9s+l
         Xlrcs/IDJPKn/2EpqM50gqDMYBOyuRHdIMmF87KeuiFj4D8ODy/wd/DI2QZxX/41crs8
         m5fPXdkVR4tmC9YAMEscgAidLfIm10eeY7+jLs8LM4Okz0rNC9aoTMXyjbDmALA6ohkU
         2Tbg==
X-Gm-Message-State: AOAM531wBJOI/dopKakCHQ8QidlcSjaepHnGlMzVgLEnlRTrdSDhu4Bf
	6B74bdYC9nFFaQ3S/DN9pESTPA==
X-Google-Smtp-Source: ABdhPJwsC25T+v0zCyeGasMm2dh3B+mS7qseNHEWvP654mvQ/Yvlek5ctOOAPIognlHMvbnzt6vI1Q==
X-Received: by 2002:a17:906:d288:b0:6f3:cb6f:428f with SMTP id ay8-20020a170906d28800b006f3cb6f428fmr6979307ejb.332.1651142061244;
        Thu, 28 Apr 2022 03:34:21 -0700 (PDT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2] xen/arm: p2m don't fall over on FEAT_LPA enabled hw
Date: Thu, 28 Apr 2022 11:34:10 +0100
Message-Id: <20220428103410.2723837-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When we introduced FEAT_LPA to QEMU's -cpu max we discovered older
kernels had a bug where the physical address was copied directly from
ID_AA64MMFR0_EL1.PARange field. The early cpu_init code of Xen commits
the same error by blindly copying across the max supported range.

Unsurprisingly when the page tables aren't set up for these greater
ranges hilarity ensues and the hypervisor crashes fairly early on in
the boot-up sequence. This happens when we write to the control
register in enable_mmu().

Attempt to fix this the same way as the Linux kernel does by gating
PARange to the maximum the hypervisor can handle. I also had to fix up
code in p2m which panics when it sees an "invalid" entry in PARange.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>

---
v2
  - clamp p2m_ipa_bits = PADDR_BIT instead
---
 xen/arch/arm/arm64/head.S |  6 ++++++
 xen/arch/arm/p2m.c        | 10 +++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index aa1f88c764..057dd5d925 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -473,6 +473,12 @@ cpu_init:
         ldr   x0, =(TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(64-48))
         /* ID_AA64MMFR0_EL1[3:0] (PARange) corresponds to TCR_EL2[18:16] (PS) */
         mrs   x1, ID_AA64MMFR0_EL1
+        /* Limit to 48 bits, 256TB PA range (#5) */
+        ubfm  x1, x1, #0, #3
+        mov   x2, #5
+        cmp   x1, x2
+        csel  x1, x1, x2, lt
+
         bfi   x0, x1, #16, #3
 
         msr   tcr_el2, x0
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index fb71fa4c1c..3349b464a3 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -32,10 +32,10 @@ static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
 #define P2M_ROOT_PAGES    (1<<P2M_ROOT_ORDER)
 
 /*
- * Set larger than any possible value, so the number of IPA bits can be
+ * Set to the maximum configured support for IPA bits, so the number of IPA bits can be
  * restricted by external entity (e.g. IOMMU).
  */
-unsigned int __read_mostly p2m_ipa_bits = 64;
+unsigned int __read_mostly p2m_ipa_bits = PADDR_BITS;
 
 /* Helpers to lookup the properties of each level */
 static const paddr_t level_masks[] =
@@ -2030,7 +2030,7 @@ void __init setup_virt_paging(void)
         unsigned int root_order; /* Page order of the root of the p2m */
         unsigned int sl0;    /* Desired SL0, maximum in comment */
     } pa_range_info[] = {
-        /* T0SZ minimum and SL0 maximum from ARM DDI 0487A.b Table D4-5 */
+        /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
         /*      PA size, t0sz(min), root-order, sl0(max) */
         [0] = { 32,      32/*32*/,  0,          1 },
         [1] = { 36,      28/*28*/,  0,          1 },
@@ -2038,7 +2038,7 @@ void __init setup_virt_paging(void)
         [3] = { 42,      22/*22*/,  3,          1 },
         [4] = { 44,      20/*20*/,  0,          2 },
         [5] = { 48,      16/*16*/,  0,          2 },
-        [6] = { 0 }, /* Invalid */
+        [6] = { 52,      12/*12*/,  3,          3 },
         [7] = { 0 }  /* Invalid */
     };
 
@@ -2069,7 +2069,7 @@ void __init setup_virt_paging(void)
         }
     }
 
-    /* pa_range is 4 bits, but the defined encodings are only 3 bits */
+    /* pa_range is 4 bits but we don't support all modes */
     if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
         panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
 
-- 
2.30.2


