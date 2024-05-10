Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1781A8C2CBC
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 00:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720097.1123129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YuT-0000il-0y; Fri, 10 May 2024 22:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720097.1123129; Fri, 10 May 2024 22:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YuS-0000fY-SU; Fri, 10 May 2024 22:40:12 +0000
Received: by outflank-mailman (input) for mailman id 720097;
 Fri, 10 May 2024 22:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5YuQ-0000RL-UH
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 22:40:10 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40e7ea54-0f1e-11ef-b4bb-af5377834399;
 Sat, 11 May 2024 00:40:08 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59a64db066so661797066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 15:40:08 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cf60sm233915866b.14.2024.05.10.15.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 15:40:06 -0700 (PDT)
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
X-Inumbo-ID: 40e7ea54-0f1e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715380807; x=1715985607; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZZNtujjN9pYr6HT0e0A2/j3Mym7RChiLwN22jfYFXQ=;
        b=dMcczuGdoQatw4rz5HetC7jd1Ll80NHUcG8fkCjdn2wstbs3XH4089I61pI+j1yc+x
         9byQh0qXw3hHgrwZaJq9ChMZ7nkNmYZD/FIits5YxxClNmWb+dfmewkP3Ar8Ts3q6FBW
         CmVJ/pAyDNoLlipGv4auyRxSRz5svuz9779Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715380807; x=1715985607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZZNtujjN9pYr6HT0e0A2/j3Mym7RChiLwN22jfYFXQ=;
        b=q/rBjAmNnQf+6nmPw0mH8EBedFvannOaxG9OwL68IJXTQCuxoDXpV4eunR4q4bIcvh
         CAE9fz4K9Knb4w1adgbaJxXFOZRpNZYE3VhhPQhUkpE32C6zAcaCkrc74SWM9+vyWxpA
         v/WYMKWrNrW9kuUCuG5oIwnOx+QYcti1+Uvu8WetWiYR+LPPcbfW5NRN1Ugl+oLSheRd
         cyGpXFaWCkd/tq3PCNfJUSWXmqSsx/7AoHa/6Wnt30dp9Maba6uOHAOHOP4fVoGPpmcT
         MJ3oqnSyx9gBoAT0xinOiLGO+HXVudOqVVNe6M6dqyZOVjVWy4EJlzyAy4YXRaqzqv6t
         +xgA==
X-Gm-Message-State: AOJu0YywnCw8MX1NLb0HfgZAyMXE4TAb9gyFbKA6zw0FgHUOveAbw7+k
	kZWQBDRFhl9eSGD+DYURm7TYtD+L8tS4PkbtrlxsZal6hvGNbu1jRHABwXaDrm1xBa9rom+F5+Q
	M
X-Google-Smtp-Source: AGHT+IFXXDmaCK9fx4msP1oV+MH9H9mEiBmmVYHwccM8SXOciaaLj3tBQWdnSEKuMH8C/e8C2XT1iw==
X-Received: by 2002:a17:906:1d16:b0:a59:dd91:3417 with SMTP id a640c23a62f3a-a5a2d53b132mr250376266b.5.1715380807400;
        Fri, 10 May 2024 15:40:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH 4/4] tools/xen-cpuid: Drop old names
Date: Fri, 10 May 2024 23:40:02 +0100
Message-Id: <20240510224002.2324578-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

Not used any more.  Split out of previous patch to aid legibility.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v3:
 * New (split out)
---
 tools/misc/xen-cpuid.c | 287 +++--------------------------------------
 1 file changed, 18 insertions(+), 269 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 2f34694e9c57..2cb5322ed9aa 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -15,279 +15,28 @@
 
 static uint32_t nr_features;
 
-static const char *const str_1d[32] =
-{
-    [ 0] = "fpu",  [ 1] = "vme",
-    [ 2] = "de",   [ 3] = "pse",
-    [ 4] = "tsc",  [ 5] = "msr",
-    [ 6] = "pae",  [ 7] = "mce",
-    [ 8] = "cx8",  [ 9] = "apic",
-    /* [10] */     [11] = "sysenter",
-    [12] = "mtrr", [13] = "pge",
-    [14] = "mca",  [15] = "cmov",
-    [16] = "pat",  [17] = "pse36",
-    [18] = "psn",  [19] = "clflush",
-    /* [20] */     [21] = "ds",
-    [22] = "acpi", [23] = "mmx",
-    [24] = "fxsr", [25] = "sse",
-    [26] = "sse2", [27] = "ss",
-    [28] = "htt",  [29] = "tm",
-    [30] = "ia64", [31] = "pbe",
-};
-
-static const char *const str_1c[32] =
-{
-    [ 0] = "sse3",    [ 1] = "pclmulqdq",
-    [ 2] = "dtes64",  [ 3] = "monitor",
-    [ 4] = "ds-cpl",  [ 5] = "vmx",
-    [ 6] = "smx",     [ 7] = "est",
-    [ 8] = "tm2",     [ 9] = "ssse3",
-    [10] = "cntx-id", [11] = "sdgb",
-    [12] = "fma",     [13] = "cx16",
-    [14] = "xtpr",    [15] = "pdcm",
-    /* [16] */        [17] = "pcid",
-    [18] = "dca",     [19] = "sse41",
-    [20] = "sse42",   [21] = "x2apic",
-    [22] = "movebe",  [23] = "popcnt",
-    [24] = "tsc-dl",  [25] = "aesni",
-    [26] = "xsave",   [27] = "osxsave",
-    [28] = "avx",     [29] = "f16c",
-    [30] = "rdrnd",   [31] = "hyper",
-};
-
-static const char *const str_e1d[32] =
-{
-    [ 0] = "fpu",    [ 1] = "vme",
-    [ 2] = "de",     [ 3] = "pse",
-    [ 4] = "tsc",    [ 5] = "msr",
-    [ 6] = "pae",    [ 7] = "mce",
-    [ 8] = "cx8",    [ 9] = "apic",
-    /* [10] */       [11] = "syscall",
-    [12] = "mtrr",   [13] = "pge",
-    [14] = "mca",    [15] = "cmov",
-    [16] = "fcmov",  [17] = "pse36",
-    /* [18] */       [19] = "mp",
-    [20] = "nx",     /* [21] */
-    [22] = "mmx+",   [23] = "mmx",
-    [24] = "fxsr",   [25] = "fxsr+",
-    [26] = "pg1g",   [27] = "rdtscp",
-    /* [28] */       [29] = "lm",
-    [30] = "3dnow+", [31] = "3dnow",
-};
-
-static const char *const str_e1c[32] =
-{
-    [ 0] = "lahf-lm",    [ 1] = "cmp",
-    [ 2] = "svm",        [ 3] = "extapic",
-    [ 4] = "cr8d",       [ 5] = "lzcnt",
-    [ 6] = "sse4a",      [ 7] = "msse",
-    [ 8] = "3dnowpf",    [ 9] = "osvw",
-    [10] = "ibs",        [11] = "xop",
-    [12] = "skinit",     [13] = "wdt",
-    /* [14] */           [15] = "lwp",
-    [16] = "fma4",       [17] = "tce",
-    /* [18] */           [19] = "nodeid",
-    /* [20] */           [21] = "tbm",
-    [22] = "topoext",    [23] = "perfctr-core",
-    [24] = "perfctr-nb", /* [25] */
-    [26] = "dbx",        [27] = "perftsc",
-    [28] = "pcx-l2i",    [29] = "monitorx",
-    [30] = "addr-msk-ext",
-};
-
-static const char *const str_7b0[32] =
-{
-    [ 0] = "fsgsbase", [ 1] = "tsc-adj",
-    [ 2] = "sgx",      [ 3] = "bmi1",
-    [ 4] = "hle",      [ 5] = "avx2",
-    [ 6] = "fdp-exn",  [ 7] = "smep",
-    [ 8] = "bmi2",     [ 9] = "erms",
-    [10] = "invpcid",  [11] = "rtm",
-    [12] = "pqm",      [13] = "depfpp",
-    [14] = "mpx",      [15] = "pqe",
-    [16] = "avx512f",  [17] = "avx512dq",
-    [18] = "rdseed",   [19] = "adx",
-    [20] = "smap",     [21] = "avx512-ifma",
-    [22] = "pcommit",  [23] = "clflushopt",
-    [24] = "clwb",     [25] = "proc-trace",
-    [26] = "avx512pf", [27] = "avx512er",
-    [28] = "avx512cd", [29] = "sha",
-    [30] = "avx512bw", [31] = "avx512vl",
-};
-
-static const char *const str_Da1[32] =
-{
-    [ 0] = "xsaveopt", [ 1] = "xsavec",
-    [ 2] = "xgetbv1",  [ 3] = "xsaves",
-};
-
-static const char *const str_7c0[32] =
-{
-    [ 0] = "prefetchwt1",      [ 1] = "avx512-vbmi",
-    [ 2] = "umip",             [ 3] = "pku",
-    [ 4] = "ospke",            [ 5] = "waitpkg",
-    [ 6] = "avx512-vbmi2",     [ 7] = "cet-ss",
-    [ 8] = "gfni",             [ 9] = "vaes",
-    [10] = "vpclmulqdq",       [11] = "avx512-vnni",
-    [12] = "avx512-bitalg",
-    [14] = "avx512-vpopcntdq",
-
-    [22] = "rdpid",
-    /* 24 */                   [25] = "cldemote",
-    /* 26 */                   [27] = "movdiri",
-    [28] = "movdir64b",        [29] = "enqcmd",
-    [30] = "sgx-lc",           [31] = "pks",
-};
-
-static const char *const str_e7d[32] =
-{
-    /* 6 */                    [ 7] = "hw-pstate",
-    [ 8] = "itsc",             [ 9] = "cpb",
-    [10] = "efro",
-};
-
-static const char *const str_e8b[32] =
-{
-    [ 0] = "clzero",
-    [ 2] = "rstr-fp-err-ptrs",
-
-    /* [ 8] */                 [ 9] = "wbnoinvd",
-
-    [12] = "ibpb",
-    [14] = "ibrs",             [15] = "amd-stibp",
-    [16] = "ibrs-always",      [17] = "stibp-always",
-    [18] = "ibrs-fast",        [19] = "ibrs-same-mode",
-
-    [20] = "no-lmsl",
-    /* [22] */                 [23] = "ppin",
-    [24] = "amd-ssbd",         [25] = "virt-ssbd",
-    [26] = "ssb-no",
-    [28] = "psfd",             [29] = "btc-no",
-    [30] = "ibpb-ret",
-};
-
-static const char *const str_7d0[32] =
-{
-    [ 2] = "avx512-4vnniw", [ 3] = "avx512-4fmaps",
-    [ 4] = "fsrm",
-
-    [ 8] = "avx512-vp2intersect", [ 9] = "srbds-ctrl",
-    [10] = "md-clear",            [11] = "rtm-always-abort",
-    /* 12 */                [13] = "tsx-force-abort",
-    [14] = "serialize",     [15] = "hybrid",
-    [16] = "tsxldtrk",
-    [18] = "pconfig",
-    [20] = "cet-ibt",
-    /* 22 */                [23] = "avx512-fp16",
-
-    [26] = "ibrsb",         [27] = "stibp",
-    [28] = "l1d-flush",     [29] = "arch-caps",
-    [30] = "core-caps",     [31] = "ssbd",
-};
-
-static const char *const str_7a1[32] =
-{
-    [ 0] = "sha512",        [ 1] = "sm3",
-    [ 2] = "sm4",
-    [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
-
-    [10] = "fzrm",          [11] = "fsrs",
-    [12] = "fsrcs",
-
-    /* 18 */                [19] = "wrmsrns",
-
-    /* 22 */                [23] = "avx-ifma",
-};
-
-static const char *const str_e21a[32] =
-{
-    [ 0] = "no-nest-bp",    [ 1] = "fs-gs-ns",
-    [ 2] = "lfence+",
-    [ 6] = "nscb",
-    [ 8] = "auto-ibrs",
-    [10] = "amd-fsrs",      [11] = "amd-fsrc",
-
-    /* 16 */                [17] = "cpuid-user-dis",
-    [18] = "epsf",          [19] = "fsrsc",
-    [20] = "amd-prefetchi",
-
-    /* 26 */                [27] = "sbpb",
-    [28] = "ibpb-brtype",   [29] = "srso-no",
-};
-
-static const char *const str_7b1[32] =
-{
-    [ 0] = "ppin",
-};
-
-static const char *const str_7c1[32] =
-{
-};
-
-static const char *const str_7d1[32] =
-{
-    [ 4] = "avx-vnni-int8",       [ 5] = "avx-ne-convert",
-
-    [10] = "avx-vnni-int16",
-
-    [14] = "prefetchi",
-
-    [18] = "cet-sss",
-};
-
-static const char *const str_7d2[32] =
-{
-    [ 0] = "intel-psfd",    [ 1] = "ipred-ctrl",
-    [ 2] = "rrsba-ctrl",    [ 3] = "ddp-ctrl",
-    [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
-};
-
-static const char *const str_m10Al[32] =
-{
-    [ 0] = "rdcl-no",             [ 1] = "eibrs",
-    [ 2] = "rsba",                [ 3] = "skip-l1dfl",
-    [ 4] = "intel-ssb-no",        [ 5] = "mds-no",
-    [ 6] = "if-pschange-mc-no",   [ 7] = "tsx-ctrl",
-    [ 8] = "taa-no",              [ 9] = "mcu-ctrl",
-    [10] = "misc-pkg-ctrl",       [11] = "energy-ctrl",
-    [12] = "doitm",               [13] = "sbdr-ssdp-no",
-    [14] = "fbsdp-no",            [15] = "psdp-no",
-    /* 16 */                      [17] = "fb-clear",
-    [18] = "fb-clear-ctrl",       [19] = "rrsba",
-    [20] = "bhi-no",              [21] = "xapic-status",
-    /* 22 */                      [23] = "ovrclk-status",
-    [24] = "pbrsb-no",            [25] = "gds-ctrl",
-    [26] = "gds-no",              [27] = "rfds-no",
-    [28] = "rfds-clear",
-};
-
-static const char *const str_m10Ah[32] =
-{
-};
-
 static const struct {
     const char *name;
     const char *abbr;
-    const char *const *strs;
 } leaf_info[FEATURESET_NR_ENTRIES] = {
-    { "CPUID 0x00000001.edx",        "1d", str_1d },
-    { "CPUID 0x00000001.ecx",        "1c", str_1c },
-    { "CPUID 0x80000001.edx",       "e1d", str_e1d },
-    { "CPUID 0x80000001.ecx",       "e1c", str_e1c },
-    { "CPUID 0x0000000d:1.eax",     "Da1", str_Da1 },
-    { "CPUID 0x00000007:0.ebx",     "7b0", str_7b0 },
-    { "CPUID 0x00000007:0.ecx",     "7c0", str_7c0 },
-    { "CPUID 0x80000007.edx",       "e7d", str_e7d },
-    { "CPUID 0x80000008.ebx",       "e8b", str_e8b },
-    { "CPUID 0x00000007:0.edx",     "7d0", str_7d0 },
-    { "CPUID 0x00000007:1.eax",     "7a1", str_7a1 },
-    { "CPUID 0x80000021.eax",      "e21a", str_e21a },
-    { "CPUID 0x00000007:1.ebx",     "7b1", str_7b1 },
-    { "CPUID 0x00000007:2.edx",     "7d2", str_7d2 },
-    { "CPUID 0x00000007:1.ecx",     "7c1", str_7c1 },
-    { "CPUID 0x00000007:1.edx",     "7d1", str_7d1 },
-    { "MSR_ARCH_CAPS.lo",         "m10Al", str_m10Al },
-    { "MSR_ARCH_CAPS.hi",         "m10Ah", str_m10Ah },
+    { "CPUID 0x00000001.edx",        "1d" },
+    { "CPUID 0x00000001.ecx",        "1c" },
+    { "CPUID 0x80000001.edx",       "e1d" },
+    { "CPUID 0x80000001.ecx",       "e1c" },
+    { "CPUID 0x0000000d:1.eax",     "Da1" },
+    { "CPUID 0x00000007:0.ebx",     "7b0" },
+    { "CPUID 0x00000007:0.ecx",     "7c0" },
+    { "CPUID 0x80000007.edx",       "e7d" },
+    { "CPUID 0x80000008.ebx",       "e8b" },
+    { "CPUID 0x00000007:0.edx",     "7d0" },
+    { "CPUID 0x00000007:1.eax",     "7a1" },
+    { "CPUID 0x80000021.eax",      "e21a" },
+    { "CPUID 0x00000007:1.ebx",     "7b1" },
+    { "CPUID 0x00000007:2.edx",     "7d2" },
+    { "CPUID 0x00000007:1.ecx",     "7c1" },
+    { "CPUID 0x00000007:1.edx",     "7d1" },
+    { "MSR_ARCH_CAPS.lo",         "m10Al" },
+    { "MSR_ARCH_CAPS.hi",         "m10Ah" },
 };
 
 #define COL_ALIGN "24"
-- 
2.30.2


