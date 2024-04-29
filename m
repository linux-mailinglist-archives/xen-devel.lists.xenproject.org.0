Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3F18B5D24
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714187.1115282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk3-0006v0-UK; Mon, 29 Apr 2024 15:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714187.1115282; Mon, 29 Apr 2024 15:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk3-0006pU-PI; Mon, 29 Apr 2024 15:16:31 +0000
Received: by outflank-mailman (input) for mailman id 714187;
 Mon, 29 Apr 2024 15:16:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1Sk2-0006fc-Q0
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:16:30 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73c0a8fd-063b-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:16:28 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57255e89facso3753415a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:16:28 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ah2-20020a1709069ac200b00a4e393b6349sm13898875ejc.5.2024.04.29.08.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:16:27 -0700 (PDT)
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
X-Inumbo-ID: 73c0a8fd-063b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714403788; x=1715008588; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+jINRzKQ8ek5veBhc1V+WcM+rmOSm7v+UZN+AYLp0E=;
        b=A3N6db0lbtjwdmJuwq9ycoc7oKwxd67SAhGC/ZN9t+zMs9J48PDwwC4POAgK/eMOqo
         u/Ze41T9uygMaRHWndZZQHkcVsBYDicBd6i1WuUraVKqmZ4Hv8rsQxIuMwQ23baQJvpR
         AY+dkfxj9R4vq++hZtnOtAcqWRYN72Co2tWFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403788; x=1715008588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+jINRzKQ8ek5veBhc1V+WcM+rmOSm7v+UZN+AYLp0E=;
        b=SYDRtJex4kxGVU9VnoZ2fEH5Gl/PhStE+OeYEEPfvCU0+7TVK6Li8kCAx7j+r63HSD
         3dwDKOqt2GqQ23mEs4xLC2tw2vp+QexzzvCmS/FCDYaJK7wwJrTk5ew7VFIRaUyNHQaD
         qU4mAhWTFyIL5VQ3xZsd3ToVfICuHPAA8nrbLpFbx5UftLr2JfpBubLHxBMINWnJZyiD
         +jrLjnqbSOdGcmhsDMS6NDDqiHS82vCyS5sTQsoi7k/gJxo9Illr8hrfL/6R39LbjUL6
         ivh5y1zgVzHL1tRfDQD/d2SPCYmD8Sg3hIbP4/Le1ZgrBxcH1CJponB/CzbQDY31Anxl
         GoaA==
X-Gm-Message-State: AOJu0Yws/8WCf5GlFAwO1QRvxGiXXwVJKLCbESOqfnjbX5Yn925fnb1J
	Fi50YNhmBqhy1KTJ2zq4wGDVISXjMLgcCW/yOHEZzfhQY70521tafx72QHtTOj8gImSBzy4pLOu
	v
X-Google-Smtp-Source: AGHT+IE/C96C5lG5+P61Eon6C63GocYVL9KzxahT7A8hlbCisoZjEseQudsjd6yVoLdl4mDiR1tT8Q==
X-Received: by 2002:a17:906:b798:b0:a4d:fcc9:905c with SMTP id dt24-20020a170906b79800b00a4dfcc9905cmr4938349ejb.20.1714403787775;
        Mon, 29 Apr 2024 08:16:27 -0700 (PDT)
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
Subject: [PATCH 1/5] x86/cpu-policy: Infrastructure for the AMD SVM and SEV leaves
Date: Mon, 29 Apr 2024 16:16:21 +0100
Message-Id: <20240429151625.977884-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429151625.977884-1-andrew.cooper3@citrix.com>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allocate two new feature leaves, and extend cpu_policy with the non-feature
fields too.

The CPUID dependency between the SVM bit on the whole SVM leaf is
intentionally deferred, to avoid transiently breaking nested virt.

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
 tools/libs/light/libxl_cpuid.c              |  2 ++
 tools/misc/xen-cpuid.c                      | 10 +++++++++
 xen/arch/x86/cpu/common.c                   |  4 ++++
 xen/include/public/arch-x86/cpufeatureset.h |  4 ++++
 xen/include/xen/lib/x86/cpu-policy.h        | 24 +++++++++++++++++++--
 xen/lib/x86/cpuid.c                         |  4 ++++
 6 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index ce4f3c7095ba..c7a8b76f541d 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -342,6 +342,8 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         CPUID_ENTRY(0x00000007,  1, CPUID_REG_EDX),
         MSR_ENTRY(0x10a, CPUID_REG_EAX),
         MSR_ENTRY(0x10a, CPUID_REG_EDX),
+        CPUID_ENTRY(0x8000000a, NA, CPUID_REG_EDX),
+        CPUID_ENTRY(0x8000001f, NA, CPUID_REG_EAX),
 #undef MSR_ENTRY
 #undef CPUID_ENTRY
     };
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 8893547bebce..ab09410a05d6 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -264,6 +264,14 @@ static const char *const str_m10Ah[32] =
 {
 };
 
+static const char *const str_eAd[32] =
+{
+};
+
+static const char *const str_e1Fa[32] =
+{
+};
+
 static const struct {
     const char *name;
     const char *abbr;
@@ -288,6 +296,8 @@ static const struct {
     { "CPUID 0x00000007:1.edx",     "7d1", str_7d1 },
     { "MSR_ARCH_CAPS.lo",         "m10Al", str_m10Al },
     { "MSR_ARCH_CAPS.hi",         "m10Ah", str_m10Ah },
+    { "CPUID 0x8000000a.edx",       "eAd", str_eAd },
+    { "CPUID 0x8000001f.eax",      "e1Fa", str_e1Fa },
 };
 
 #define COL_ALIGN "24"
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 28d7f34c4dbe..25b11e6472b8 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -477,6 +477,10 @@ static void generic_identify(struct cpuinfo_x86 *c)
 		c->x86_capability[FEATURESET_e7d] = cpuid_edx(0x80000007);
 	if (c->extended_cpuid_level >= 0x80000008)
 		c->x86_capability[FEATURESET_e8b] = cpuid_ebx(0x80000008);
+	if (c->extended_cpuid_level >= 0x8000000a)
+		c->x86_capability[FEATURESET_eAd] = cpuid_edx(0x8000000a);
+	if (c->extended_cpuid_level >= 0x8000001f)
+		c->x86_capability[FEATURESET_e1Fa] = cpuid_eax(0x8000001f);
 	if (c->extended_cpuid_level >= 0x80000021)
 		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 53f13dec31f7..0f869214811e 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -357,6 +357,10 @@ XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A Register File(s) cleared by VE
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
 
+/* AMD-defined CPU features, CPUID level 0x8000000a.edx, word 18 */
+
+/* AMD-defined CPU features, CPUID level 0x8000001f.eax, word 19 */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index d5e447e9dc06..936e00e4da73 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -22,6 +22,8 @@
 #define FEATURESET_7d1       15 /* 0x00000007:1.edx    */
 #define FEATURESET_m10Al     16 /* 0x0000010a.eax      */
 #define FEATURESET_m10Ah     17 /* 0x0000010a.edx      */
+#define FEATURESET_eAd       18 /* 0x8000000a.edx      */
+#define FEATURESET_e1Fa      19 /* 0x8000001f.eax      */
 
 struct cpuid_leaf
 {
@@ -296,7 +298,16 @@ struct cpu_policy
             uint32_t /* d */:32;
 
             uint64_t :64, :64; /* Leaf 0x80000009. */
-            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
+
+            /* Leaf 0x8000000a - SVM rev and features. */
+            uint8_t svm_rev, :8, :8, :8;
+            uint32_t /* b */ :32;
+            uint32_t nr_asids;
+            union {
+                uint32_t eAd;
+                struct { DECL_BITFIELD(eAd); };
+            };
+
             uint64_t :64, :64; /* Leaf 0x8000000b. */
             uint64_t :64, :64; /* Leaf 0x8000000c. */
             uint64_t :64, :64; /* Leaf 0x8000000d. */
@@ -317,7 +328,16 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0x8000001c. */
             uint64_t :64, :64; /* Leaf 0x8000001d - Cache properties. */
             uint64_t :64, :64; /* Leaf 0x8000001e - Extd APIC/Core/Node IDs. */
-            uint64_t :64, :64; /* Leaf 0x8000001f - AMD Secure Encryption. */
+
+            /* Leaf 0x8000001f - AMD Secure Encryption. */
+            union {
+                uint32_t e1Fa;
+                struct { DECL_BITFIELD(e1Fa); };
+            };
+            uint32_t cbit:6, paddr_reduce:6, nr_vmpls:4, :16;
+            uint32_t nr_enc_guests;
+            uint32_t sev_min_asid;
+
             uint64_t :64, :64; /* Leaf 0x80000020 - Platform QoS. */
 
             /* Leaf 0x80000021 - Extended Feature 2 */
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index eb7698dc7325..14deb01a6d0b 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -81,6 +81,8 @@ void x86_cpu_policy_to_featureset(
     fs[FEATURESET_7d1]       = p->feat._7d1;
     fs[FEATURESET_m10Al]     = p->arch_caps.lo;
     fs[FEATURESET_m10Ah]     = p->arch_caps.hi;
+    fs[FEATURESET_eAd]       = p->extd.eAd;
+    fs[FEATURESET_e1Fa]      = p->extd.e1Fa;
 }
 
 void x86_cpu_featureset_to_policy(
@@ -104,6 +106,8 @@ void x86_cpu_featureset_to_policy(
     p->feat._7d1             = fs[FEATURESET_7d1];
     p->arch_caps.lo          = fs[FEATURESET_m10Al];
     p->arch_caps.hi          = fs[FEATURESET_m10Ah];
+    p->extd.eAd              = fs[FEATURESET_eAd];
+    p->extd.e1Fa             = fs[FEATURESET_e1Fa];
 }
 
 void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
-- 
2.30.2


