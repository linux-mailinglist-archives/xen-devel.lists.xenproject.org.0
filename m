Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A58686D1C5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 19:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687394.1070795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfkuw-0003bA-Pj; Thu, 29 Feb 2024 18:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687394.1070795; Thu, 29 Feb 2024 18:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfkuw-0003YU-MV; Thu, 29 Feb 2024 18:14:02 +0000
Received: by outflank-mailman (input) for mailman id 687394;
 Thu, 29 Feb 2024 18:14:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfkuv-0003YO-Jr
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 18:14:01 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f3bdb7b-d72e-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 19:13:59 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so251959766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 10:13:59 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gs41-20020a1709072d2900b00a3d9e6e9983sm920149ejc.174.2024.02.29.10.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 10:13:56 -0800 (PST)
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
X-Inumbo-ID: 4f3bdb7b-d72e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709230438; x=1709835238; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5eq2gDanKu26sYGf0JeKb4Y5I3SBwePWVmjX/aO+oM=;
        b=jH4YBtPcHT9+B+6qmxEDXR8hMW6ZtgVQFG4Ec82Q9zCxZaYI85mi6DfGCX6F4qebDh
         qtnKd2kzL+fL84/LtCZ/krQwaS+RiwnZCjDL2GVeei+liGjUGU6lQG5r2U05sfhEBMrq
         xro/VmcKpVc3nS3xS4thWob6xuI2h78sGOEUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709230438; x=1709835238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5eq2gDanKu26sYGf0JeKb4Y5I3SBwePWVmjX/aO+oM=;
        b=GCKw8k8TJ6pMZdtZOCq4yVmrAJpwFNmSg3woxHZpZy3lgxfpSmOLU7308HfjFX0+S7
         /DmVBNhuompN+hPGk36QPN3HjQDYggvZy+91N74QKM7qgoBcqxwCVetTmm+xQjoajg9V
         LbsKuTAVCshWMbhoc+V3gkZ9V4YpzCvgXwbbuVsLq+1TCVDOp2eogukNhHzsUvM4hqO3
         qlETwTmnfUbsWkL2uvuYD/QZtL4L7+qpDEv7ZcHEBRTcp/DoPowy3nAWaFqNaycJgvdW
         t8NfAtEUrxx0CjW1fXq8oPyhcV77iqIKpxsW60/xlDzQcBv+mco57NCkrqCcoa/BCaMJ
         WziQ==
X-Gm-Message-State: AOJu0YzM1JIh7pNuI71PYBr97cpfbg86V3gHNx9b2XSefhrbHmupsbj6
	vcpLwIZPDRke7QA/Tq57eir5sIKvBBy5JE85n3JY192mi9zX7pWMIe1kf73Ly4hMUWdQ2gRyCXL
	S
X-Google-Smtp-Source: AGHT+IH8BKZ8PMWYkZ046yAG3mTPMFd4XNAvPL9mFFkvxwVI30tPXCmRMFgRW4itFlHsp1Uqisnstg==
X-Received: by 2002:a17:906:6956:b0:a44:5a3d:7883 with SMTP id c22-20020a170906695600b00a445a3d7883mr1316934ejs.10.1709230437735;
        Thu, 29 Feb 2024 10:13:57 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cpu-policy: Allow for levelling of VERW side effects
Date: Thu, 29 Feb 2024 18:13:54 +0000
Message-Id: <20240229181354.2560819-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MD_CLEAR and FB_CLEAR need OR-ing across a migrate pool.  Allow this, by
having them unconditinally set in max, with the host values reflected in
default.  Annotate the bits as having special properies.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c                   | 24 +++++++++++++++++++++
 xen/include/public/arch-x86/cpufeatureset.h |  4 ++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index f3ed2d3a3227..41123e6cf778 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -442,6 +442,16 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
         __set_bit(X86_FEATURE_RSBA, fs);
         __set_bit(X86_FEATURE_RRSBA, fs);
 
+        /*
+         * These bits indicate that the VERW instruction may have gained
+         * scrubbing side effects.  With pooling, they mean "you might migrate
+         * somewhere where scrubbing is necessary", and may need exposing on
+         * unaffected hardware.  This is fine, because the VERW instruction
+         * has been around since the 286.
+         */
+        __set_bit(X86_FEATURE_MD_CLEAR, fs);
+        __set_bit(X86_FEATURE_FB_CLEAR, fs);
+
         /*
          * The Gather Data Sampling microcode mitigation (August 2023) has an
          * adverse performance impact on the CLWB instruction on SKX/CLX/CPX.
@@ -476,6 +486,20 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
              cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
             __clear_bit(X86_FEATURE_RDRAND, fs);
 
+        /*
+         * These bits indicate that the VERW instruction may have gained
+         * scrubbing side effects.  The max policy has them set for migration
+         * reasons, so reset the default policy back to the host values in
+         * case we're unaffected.
+         */
+        fs[FEATURESET_7d0]   &= ~cpufeat_mask(X86_FEATURE_MD_CLEAR);
+        fs[FEATURESET_m10Al] &= ~cpufeat_mask(X86_FEATURE_FB_CLEAR);
+
+        fs[FEATURESET_7d0]   |= (boot_cpu_data.x86_capability[FEATURESET_7d0] &
+                                 cpufeat_mask(X86_FEATURE_MD_CLEAR));
+        fs[FEATURESET_m10Al] |= (boot_cpu_data.x86_capability[FEATURESET_m10Al] &
+                                 cpufeat_mask(X86_FEATURE_FB_CLEAR));
+
         /*
          * The Gather Data Sampling microcode mitigation (August 2023) has an
          * adverse performance impact on the CLWB instruction on SKX/CLX/CPX.
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index b230d3a6907d..0374cec3a2af 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -262,7 +262,7 @@ XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*A  AVX512 Multiply Accumulation Single
 XEN_CPUFEATURE(FSRM,          9*32+ 4) /*A  Fast Short REP MOVS */
 XEN_CPUFEATURE(AVX512_VP2INTERSECT, 9*32+8) /*a  VP2INTERSECT{D,Q} insns */
 XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MCU_OPT_CTRL and RNGDS_MITG_DIS. */
-XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
+XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*!A VERW clears microarchitectural buffers */
 XEN_CPUFEATURE(RTM_ALWAYS_ABORT, 9*32+11) /*! June 2021 TSX defeaturing in microcode. */
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
@@ -334,7 +334,7 @@ XEN_CPUFEATURE(DOITM,              16*32+12) /*   Data Operand Invariant Timing
 XEN_CPUFEATURE(SBDR_SSDP_NO,       16*32+13) /*A  No Shared Buffer Data Read or Sideband Stale Data Propagation */
 XEN_CPUFEATURE(FBSDP_NO,           16*32+14) /*A  No Fill Buffer Stale Data Propagation */
 XEN_CPUFEATURE(PSDP_NO,            16*32+15) /*A  No Primary Stale Data Propagation */
-XEN_CPUFEATURE(FB_CLEAR,           16*32+17) /*A  Fill Buffers cleared by VERW */
+XEN_CPUFEATURE(FB_CLEAR,           16*32+17) /*!A Fill Buffers cleared by VERW */
 XEN_CPUFEATURE(FB_CLEAR_CTRL,      16*32+18) /*   MSR_OPT_CPU_CTRL.FB_CLEAR_DIS */
 XEN_CPUFEATURE(RRSBA,              16*32+19) /*!  Restricted RSB Alternative */
 XEN_CPUFEATURE(BHI_NO,             16*32+20) /*A  No Branch History Injection  */

base-commit: 54fd7b997470e6686667ca8e18f9ba6139efcdea
prerequisite-patch-id: d2cbc8f341e98ccfd66016f19532df3ddbfc68a4
prerequisite-patch-id: 4b4799fae62b5f41b9b0d2078e8b081605341a0a
-- 
2.30.2


