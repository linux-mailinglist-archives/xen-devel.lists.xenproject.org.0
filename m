Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D088B5D27
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714190.1115314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk8-0007qb-32; Mon, 29 Apr 2024 15:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714190.1115314; Mon, 29 Apr 2024 15:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk7-0007np-Vm; Mon, 29 Apr 2024 15:16:35 +0000
Received: by outflank-mailman (input) for mailman id 714190;
 Mon, 29 Apr 2024 15:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1Sk6-0006fc-5n
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:16:34 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7609761f-063b-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:16:32 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a58e2740cd7so370488866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:16:32 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ah2-20020a1709069ac200b00a4e393b6349sm13898875ejc.5.2024.04.29.08.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:16:31 -0700 (PDT)
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
X-Inumbo-ID: 7609761f-063b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714403792; x=1715008592; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV04Tx+6NsZ8X0U2ufYfuFomh7VBRRmRmAKxgTh3wY4=;
        b=ul+veVfYxeRnBYKuGh62tNF+dlxekK+jLbnkK6MN773QU4zcOvQQ9Yqa4o9jMhxE5C
         IgTtHGNf6osYaGywVnEJqpAMG3wBqKxqhZAIARBqwZx4MK+KTKXjN50gwQ2zccOhx1pL
         vVWEmhedBsP7GQPJDF7kRVgwHDen4H8+ru69M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403792; x=1715008592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV04Tx+6NsZ8X0U2ufYfuFomh7VBRRmRmAKxgTh3wY4=;
        b=ic+/xL0VlPR4qI3dJ+s2ttKmKREwSrnUjYdG6LCC0VgNDwrU7uWbNEnafpafvxduQg
         hXjuGIYzm6C2n9QIBBMP0taJqZHMlC4JSniKQSXbYa5u3cfTvOwMA5wrbgkVvbzljMyj
         3kenc2Ae9nevkF8oeAZpLTwRLPWkjK6XVs8JEhuPHVCv/s7glK+4mOqHETKYEWh9CX0i
         JWJFxKhXuXFvO1wOGO6TT3wfejVeTaarwBSYp8MpxiQ1HI1Y6ETUBlFsBx3Q/wECHzmw
         6911o08F5xcComTjvFPMLYZ797UbDn9Notd1cG14IGoWrLgvkHzZVKfObSTmURJveHXe
         r6qg==
X-Gm-Message-State: AOJu0YwJeBDaldc4+TKYMUkni8+YszbHjkJNA4NvYbdHtmgDZGfjS2YH
	ncrU5FwiWwNdv4OtGySIIBwtadE4XLHnBTo0YvDJOzKKffikAG3/aeiYkrU8d2S3nMn0S4rQwew
	T
X-Google-Smtp-Source: AGHT+IGO5TKFQYD+gTBIWeGVUOgzvtYEWbvErapDz4z7ZkjskrEyh/eDv+ptI2Mb53VrbReYfmobjw==
X-Received: by 2002:a17:906:480f:b0:a58:8a33:1a39 with SMTP id w15-20020a170906480f00b00a588a331a39mr9853087ejq.3.1714403791795;
        Mon, 29 Apr 2024 08:16:31 -0700 (PDT)
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
Subject: [PATCH 5/5] x86/cpu-policy: Introduce some SEV features
Date: Mon, 29 Apr 2024 16:16:25 +0100
Message-Id: <20240429151625.977884-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429151625.977884-1-andrew.cooper3@citrix.com>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For display purposes only right now.

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

This is only half the work to get SEV working nicely.  The other
half (rearranging __start_xen() so we can move the host policy collection
earlier) is still a work-in-progress.
---
 tools/misc/xen-cpuid.c                      | 3 +++
 xen/arch/x86/include/asm/cpufeature.h       | 3 +++
 xen/include/public/arch-x86/cpufeatureset.h | 4 ++++
 xen/tools/gen-cpuid.py                      | 6 +++++-
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 0d01b0e797f1..1463e0429ba1 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -281,6 +281,9 @@ static const char *const str_eAd[32] =
 
 static const char *const str_e1Fa[32] =
 {
+    [ 0] = "sme",                 [ 1] = "sev",
+    /* 2 */                       [ 3] = "sev-es",
+    [ 4] = "sev-snp",
 };
 
 static const struct {
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index b6fb8c24423c..732f0d2bf758 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -230,6 +230,9 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_v_gif           boot_cpu_has(X86_FEATURE_V_GIF)
 #define cpu_has_v_spec_ctrl     boot_cpu_has(X86_FEATURE_V_SPEC_CTRL)
 
+/* CPUID level 0x8000001f.eax */
+#define cpu_has_sev             boot_cpu_has(X86_FEATURE_SEV)
+
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
 #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 80d252a38c2d..7ee0f2329151 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -374,6 +374,10 @@ XEN_CPUFEATURE(NPT_SSS,            18*32+19) /*   NPT Supervisor Shadow Stacks *
 XEN_CPUFEATURE(V_SPEC_CTRL,        18*32+20) /*   Virtualised MSR_SPEC_CTRL */
 
 /* AMD-defined CPU features, CPUID level 0x8000001f.eax, word 19 */
+XEN_CPUFEATURE(SME,                19*32+ 0) /*   Secure Memory Encryption */
+XEN_CPUFEATURE(SEV,                19*32+ 1) /*   Secure Encryped VM */
+XEN_CPUFEATURE(SEV_ES,             19*32+ 3) /*   SEV Encrypted State */
+XEN_CPUFEATURE(SEV_SNP,            19*32+ 4) /*   SEV Secure Nested Paging */
 
 #endif /* XEN_CPUFEATURE */
 
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index f07b1f4cf905..bff4d9389ff6 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -281,7 +281,7 @@ def crunch_numbers(state):
         _3DNOW: [_3DNOWEXT],
 
         # The SVM bit enumerates the whole SVM leave.
-        SVM: list(range(NPT, NPT + 32)),
+        SVM: list(range(NPT, NPT + 32)) + [SEV],
 
         # This is just the dependency between AVX512 and AVX2 of XSTATE
         # feature flags.  If want to use AVX512, AVX2 must be supported and
@@ -341,6 +341,10 @@ def crunch_numbers(state):
 
         # The behaviour described by RRSBA depend on eIBRS being active.
         EIBRS: [RRSBA],
+
+        SEV: [SEV_ES],
+
+        SEV_ES: [SEV_SNP],
     }
 
     deep_features = tuple(sorted(deps.keys()))
-- 
2.30.2


