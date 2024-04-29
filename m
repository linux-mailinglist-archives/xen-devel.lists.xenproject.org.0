Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF538B5D25
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714186.1115274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk3-0006pE-J3; Mon, 29 Apr 2024 15:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714186.1115274; Mon, 29 Apr 2024 15:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk3-0006n5-GO; Mon, 29 Apr 2024 15:16:31 +0000
Received: by outflank-mailman (input) for mailman id 714186;
 Mon, 29 Apr 2024 15:16:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1Sk2-0006Yb-Bl
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:16:30 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74580315-063b-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:16:29 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a55ab922260so615803366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:16:29 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ah2-20020a1709069ac200b00a4e393b6349sm13898875ejc.5.2024.04.29.08.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:16:28 -0700 (PDT)
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
X-Inumbo-ID: 74580315-063b-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714403789; x=1715008589; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI5h6UOov1WEGp6E29SV+XICdrE3ID4Y2ipNaivTcho=;
        b=e97P9c3+ERozSEXHyAfX0iRNeGuySjd/XoORSMxHzvr++GxKQe1wY9+bB4Ouqgbpii
         t4fua/QntdT/DyGm4QipFf5K1WkG4WaJiZGKflYMKdyxE2wOALS9KsFbsOTwZZdrfqo0
         kRuEKJyJmXZtgkcWzLVkumK8sznBq1fbzRwFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403789; x=1715008589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MI5h6UOov1WEGp6E29SV+XICdrE3ID4Y2ipNaivTcho=;
        b=CwO38OhZDME+QawE2KGBIpd9UVIfjRD1ZoeJBBRE4UNLBXKE361ONtVCVotXCxnku/
         VBcJB42SbUXuQ8p910+s++7b7rcvALNQmDXFgmKDUXh3M4UsDWTldebtaHVjwkVjWHS6
         X+6HlEMM0mJSunsP35mLkxsYjBedirjhR2zR69r3GmCqZtNlw2/MpGjQfbBM6HxzKoej
         iZeEDPJYxVDGnCEkgaabjaNnnwzIHi9XJxzz61qluA5oIivwK11EpdNLi659DvMmOZvR
         4CtDZ02VMTLKCYunQw5Fp/GxSg1X9f5aIqDwtCh8TrcUcutwFay5ldbAgLapVmW6ZsS9
         T4RA==
X-Gm-Message-State: AOJu0YxYsOAxk0FUqeDi506FpuPMFuMAifJpV/aG2yq1fDw0KMXHz/qW
	r6c/euJqx25duKgvfr6T/uX/FrTFuqqK+l770atbQr0E3AgAPmGlxljzsftGHCmJQvloxru0eiG
	w
X-Google-Smtp-Source: AGHT+IFp15N7bJoy1uj9VZVhqv262xx2DTCIl7aPyU0ozLfOJ9XP7as5n7JB5MZI1zMvOypBKRxu1A==
X-Received: by 2002:a17:906:480f:b0:a52:3ff7:744d with SMTP id w15-20020a170906480f00b00a523ff7744dmr7425863ejq.4.1714403789013;
        Mon, 29 Apr 2024 08:16:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrei Semenov <andrei.semenov@vates.fr>,
	Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: [PATCH 2/5] x86/cpu-policy: Add SVM features already used by Xen
Date: Mon, 29 Apr 2024 16:16:22 +0100
Message-Id: <20240429151625.977884-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429151625.977884-1-andrew.cooper3@citrix.com>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These will replace svm_feature_flags and the SVM_FEATURE_* constants over the
next few changes.  Take the opportunity to rationalise some names.

Drop the opencoded "inherit from host" logic in calculate_hvm_max_policy() and
use 'h'/'!' annotations.  The logic needs to operate on fs, not the policy
object, given its position within the function.

Drop some trailing whitespace introduced when this block of code was last
moved.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Andrei Semenov <andrei.semenov@vates.fr>
CC: Vaishali Thakkar <vaishali.thakkar@vates.tech>
---
 tools/misc/xen-cpuid.c                      | 11 +++++++++++
 xen/arch/x86/cpu-policy.c                   | 17 +++++------------
 xen/include/public/arch-x86/cpufeatureset.h | 14 ++++++++++++++
 xen/tools/gen-cpuid.py                      |  3 +++
 4 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index ab09410a05d6..0d01b0e797f1 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -266,6 +266,17 @@ static const char *const str_m10Ah[32] =
 
 static const char *const str_eAd[32] =
 {
+    [ 0] = "npt",                 [ 1] = "v-lbr",
+    [ 2] = "svm-lock",            [ 3] = "nrips",
+    [ 4] = "v-tsc-rate",          [ 5] = "vmcb-cleanbits",
+    [ 6] = "flush-by-asid",       [ 7] = "decode-assist",
+
+    [10] = "pause-filter",
+    [12] = "pause-thresh",
+    /* 14 */                      [15] = "v-loadsave",
+    [16] = "v-gif",
+    /* 18 */                      [19] = "npt-sss",
+    [20] = "v-spec-ctrl",
 };
 
 static const char *const str_e1Fa[32] =
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 4b6d96276399..da4401047e89 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -9,7 +9,6 @@
 #include <asm/amd.h>
 #include <asm/cpu-policy.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/svm/svm.h>
 #include <asm/intel-family.h>
 #include <asm/msr-index.h>
 #include <asm/paging.h>
@@ -748,22 +747,16 @@ static void __init calculate_hvm_max_policy(void)
     if ( !cpu_has_vmx )
         __clear_bit(X86_FEATURE_PKS, fs);
 
-    /* 
+    /*
      * Make adjustments to possible (nested) virtualization features exposed
      * to the guest
      */
-    if ( p->extd.svm )
+    if ( test_bit(X86_FEATURE_SVM, fs) )
     {
-        /* Clamp to implemented features which require hardware support. */
-        p->extd.raw[0xa].d &= ((1u << SVM_FEATURE_NPT) |
-                               (1u << SVM_FEATURE_LBRV) |
-                               (1u << SVM_FEATURE_NRIPS) |
-                               (1u << SVM_FEATURE_PAUSEFILTER) |
-                               (1u << SVM_FEATURE_DECODEASSISTS));
-        /* Enable features which are always emulated. */
-        p->extd.raw[0xa].d |= (1u << SVM_FEATURE_VMCBCLEAN);
+        /* Xen always emulates cleanbits. */
+        __set_bit(X86_FEATURE_VMCB_CLEANBITS, fs);
     }
-    
+
     guest_common_max_feature_adjustments(fs);
     guest_common_feature_adjustments(fs);
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 0f869214811e..80d252a38c2d 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -358,6 +358,20 @@ XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A Register File(s) cleared by VE
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
 
 /* AMD-defined CPU features, CPUID level 0x8000000a.edx, word 18 */
+XEN_CPUFEATURE(NPT,                18*32+ 0) /*h  Nested PageTables */
+XEN_CPUFEATURE(V_LBR,              18*32+ 1) /*h  Virtualised LBR */
+XEN_CPUFEATURE(SVM_LOCK,           18*32+ 2) /*   SVM locking MSR */
+XEN_CPUFEATURE(NRIPS,              18*32+ 3) /*h  Next-RIP saved on VMExit */
+XEN_CPUFEATURE(V_TSC_RATE,         18*32+ 4) /*   Virtualised TSC Ratio */
+XEN_CPUFEATURE(VMCB_CLEANBITS,     18*32+ 5) /*!  VMCB Clean-bits */
+XEN_CPUFEATURE(FLUSH_BY_ASID,      18*32+ 6) /*   TLB Flush by ASID */
+XEN_CPUFEATURE(DECODE_ASSIST,      18*32+ 7) /*h  Decode assists */
+XEN_CPUFEATURE(PAUSE_FILTER,       18*32+10) /*h  Pause filter */
+XEN_CPUFEATURE(PAUSE_THRESH,       18*32+12) /*   Pause filter threshold */
+XEN_CPUFEATURE(V_LOADSAVE,         18*32+15) /*   Virtualised VMLOAD/SAVE */
+XEN_CPUFEATURE(V_GIF,              18*32+16) /*   Virtualised GIF */
+XEN_CPUFEATURE(NPT_SSS,            18*32+19) /*   NPT Supervisor Shadow Stacks */
+XEN_CPUFEATURE(V_SPEC_CTRL,        18*32+20) /*   Virtualised MSR_SPEC_CTRL */
 
 /* AMD-defined CPU features, CPUID level 0x8000001f.eax, word 19 */
 
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index bf3f9ec01e6e..f07b1f4cf905 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -280,6 +280,9 @@ def crunch_numbers(state):
         # standard 3DNow in the earlier K6 processors.
         _3DNOW: [_3DNOWEXT],
 
+        # The SVM bit enumerates the whole SVM leave.
+        SVM: list(range(NPT, NPT + 32)),
+
         # This is just the dependency between AVX512 and AVX2 of XSTATE
         # feature flags.  If want to use AVX512, AVX2 must be supported and
         # enabled.  Certain later extensions, acting on 256-bit vectors of
-- 
2.30.2


