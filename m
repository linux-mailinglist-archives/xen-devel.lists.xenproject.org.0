Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0568C2CB8
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 00:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720094.1123096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YuO-0008Bs-78; Fri, 10 May 2024 22:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720094.1123096; Fri, 10 May 2024 22:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YuO-00089K-2l; Fri, 10 May 2024 22:40:08 +0000
Received: by outflank-mailman (input) for mailman id 720094;
 Fri, 10 May 2024 22:40:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5YuN-000872-BN
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 22:40:07 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3a152e-0f1e-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 00:40:05 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a59a8f0d941so604152466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 15:40:05 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cf60sm233915866b.14.2024.05.10.15.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 15:40:04 -0700 (PDT)
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
X-Inumbo-ID: 3f3a152e-0f1e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715380805; x=1715985605; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3wFptMesC7scMbASW9uUHmAUxFS1IgS9Pg8ty+kfrw=;
        b=EpTAo49FsvSsODgxrPqrr9TrNKTloxjagvc3oiBngOaPPcakoQaQ9eM15/aGp3XLvI
         lURNMpM/bg0eElR/1juMUb8M+nvwc7+ecRglNqaWy6pwaaL2cSvY0z3IYTOTameYCRk1
         Kst9OBeIcYid6LPIi9Kez30+hupCgQBxPqx0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715380805; x=1715985605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3wFptMesC7scMbASW9uUHmAUxFS1IgS9Pg8ty+kfrw=;
        b=od3iLsbvYRnPepxP5HMVC1wTer8cJND7pHsL/3/n25FWl5i0mRpmZou2oa9kdJQRTa
         ZXztr9XU1w1N8zQ8GBtQFIaE+gWbVufy2LoZryg27sHxFHs3t/VqVnkxOxKrkw1LuIsw
         LQEk3gQFlpx7FAX64tsnmEcL5oyoCu1NYQKGSbqJolJoZXgWzxVJG8UyYu0WAfV+L/mz
         lFuSr1jlMVRwPnn2YttkavI8OoeNYZKYN3FgOWQPoJLhSoMWUfYyBFfF0rk8m2M02Jli
         H2UFvchyyDakBWNnjrnWk0INCVYEoVtyCa6binhfhF5COKMOuDvUuZmQLujD0nugR8fx
         h5Zw==
X-Gm-Message-State: AOJu0Yw6cLT3lcJapXexiLc8qfEzGY42oX86xx2O0PgZVlPfrU42E8T+
	vtcVYP8O194xiaGMeyvMVbQPLCi93i1SieAOgdFzpIytw0n7M0tr08PZEuTsNDuWLtXhZlJaPRa
	u
X-Google-Smtp-Source: AGHT+IH0oLMFKMzpEMCVInvb1E6s+F94kooOglSc0Ol6TYVo3iWnR3bdBI+xVyJPk4/L2nL4aRjWeA==
X-Received: by 2002:a17:906:22cc:b0:a59:c319:f1e3 with SMTP id a640c23a62f3a-a5a2d53ae7emr246124866b.12.1715380805100;
        Fri, 10 May 2024 15:40:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/4] x86/gen-cpuid: Minor cleanup
Date: Fri, 10 May 2024 23:39:59 +0100
Message-Id: <20240510224002.2324578-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename INIT_FEATURE_NAMES to INIT_FEATURE_NAME_TO_VAL as we're about to gain a
inverse mapping of the same thing.

Use dict.items() unconditionally.  iteritems() is a marginal perf optimsiation
for Python2 only, and simply not worth the effort on a script this small.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v3:
 * New
---
 tools/libs/light/libxl_cpuid.c | 2 +-
 xen/arch/x86/cpu-policy.c      | 2 +-
 xen/tools/gen-cpuid.py         | 9 ++-------
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index ce4f3c7095ba..063fe86eb72f 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -296,7 +296,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
 
         {NULL, 0, NA, CPUID_REG_INV, 0, 0}
     };
-    static const struct feature_name features[] = INIT_FEATURE_NAMES;
+    static const struct feature_name features[] = INIT_FEATURE_NAME_TO_VAL;
     /*
      * NB: if we switch to using a cpu_policy derived object instead of a
      * libxl_cpuid_policy_list we could get rid of the featureset -> cpuid leaf
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 99871b8e0e05..b96f4ee55cc4 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -43,7 +43,7 @@ static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
 static const struct feature_name {
     const char *name;
     unsigned int bit;
-} feature_names[] __initconstrel = INIT_FEATURE_NAMES;
+} feature_names[] __initconstrel = INIT_FEATURE_NAME_TO_VAL;
 
 /*
  * Parse a list of cpuid feature names -> bool, calling the callback for any
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 380b9d973a67..79d7f5c8e1c9 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -459,15 +459,10 @@ def write_results(state):
     state.output.write(
 """}
 
-#define INIT_FEATURE_NAMES { \\
+#define INIT_FEATURE_NAME_TO_VAL { \\
 """)
 
-    try:
-        _tmp = state.values.iteritems()
-    except AttributeError:
-        _tmp = state.values.items()
-
-    for name, bit in sorted(_tmp):
+    for name, bit in sorted(state.values.items()):
         state.output.write(
             '    { "%s", %sU },\\\n' % (name, bit)
             )
-- 
2.30.2


