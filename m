Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE9F8C3C1B
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 09:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720690.1123594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Q9s-0000jj-IE; Mon, 13 May 2024 07:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720690.1123594; Mon, 13 May 2024 07:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Q9s-0000gs-FK; Mon, 13 May 2024 07:31:40 +0000
Received: by outflank-mailman (input) for mailman id 720690;
 Mon, 13 May 2024 07:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK/2=MQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6Q9q-0000gk-Rb
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 07:31:38 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3ff7a35-10fa-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 09:31:35 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59e4136010so1011377466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2024 00:31:35 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01652sm556288066b.167.2024.05.13.00.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 00:31:33 -0700 (PDT)
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
X-Inumbo-ID: d3ff7a35-10fa-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715585495; x=1716190295; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5FyUfslIyVZYh3axe0IevBunTjWFWu02v2aKCjG/MwU=;
        b=dAeWKWfB8ipRGbZbyogvYhPKfcIhH7MAog0GAliXVFKh+qoIpZy1TbcT5LZk+9+nPV
         3WyLETXlONfI7VR6OEwnFYQdhCNQ7EdmmZ2Z120MCr9vYZuPYjAznDijn3HXvcRHqPO5
         GDpe/phNyjQj3dK1KKCdlkxTAgE7D0kLzEiRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715585495; x=1716190295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5FyUfslIyVZYh3axe0IevBunTjWFWu02v2aKCjG/MwU=;
        b=w//juKejhiVnhWiLoY2MMClJi1SxpnWm6+qisJyjfsaix43lLKiDrKgE5tHDUPoLfM
         XFMx1D6usRwBQhMCfu8CNiNWcHqfTy5Vo2Chu2aoZ17Bc1zO9d6UR3BHyq/ZXO4Dg4MM
         WJGOHKS4Viiizi+YIjJx0mh4xD4FFyuqrttjZBx1KbWDgKjc0jNo6y4eSGUcuMifjgPz
         yirhr4pPR7p2qk6a2LUcHdHuI+zw/C1l4/91MHDyxHg4a3od2vaa60S7++40yDP6rhXS
         lxjMv1cmeDQ8E/2xU8eYH21ZWUb3JqAmHaB/Sz7iJlvbbA5X6wJ+/V2eJfGn9ocQR8E1
         YR2A==
X-Gm-Message-State: AOJu0YwD2ejxmE/ttIotrfgcVwG3qCwhY368KA1DLZbzMcCWOjxB+229
	3E4RFVRarTx1zM3yho4E6e/hw7RrjqQZk6+HD80dJFHwxSowxTlB+tTci199ddFkZ3CaARcC5aZ
	C
X-Google-Smtp-Source: AGHT+IHXzUCG2m9XGa+75xFOgk22cGczkjqwtB5niAVmdOsCIPoC3etJh6sRI3KLWRmfkRADSZpV8w==
X-Received: by 2002:a17:906:15cd:b0:a59:c9ce:3386 with SMTP id a640c23a62f3a-a5a2d5cb0c1mr526162066b.33.1715585494324;
        Mon, 13 May 2024 00:31:34 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v3] tools/xen-cpuid: switch to use cpu-policy defined names
Date: Mon, 13 May 2024 09:31:02 +0200
Message-ID: <20240513073102.56233-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Like it was done recently for libxl, switch to using the auto-generated feature
names by the processing of cpufeatureset.h, this allows removing the open-coded
feature names, and unifies the feature naming with libxl and the hypervisor.

Introduce a newly auto-generated array that contains the feature names indexed
at featureset bit position, otherwise using the existing INIT_FEATURE_NAMES
would require iterating over the array elements until a match with the expected
bit position is found.

Note that leaf names need to be kept, as the current auto-generated data
doesn't contain the leaf names.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
 - Remove __maybe_unused definition from the emulator harness.

Changes since v1:
 - Modify gen-cpuid.py to generate an array of strings with the feature names.
 - Introduce and use __maybe_unused.
---
 tools/include/xen-tools/common-macros.h |   4 +
 tools/misc/xen-cpuid.c                  | 320 +++---------------------
 tools/tests/x86_emulator/x86-emulate.h  |   1 -
 xen/tools/gen-cpuid.py                  |  26 ++
 4 files changed, 68 insertions(+), 283 deletions(-)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 60912225cb7a..560528dbc638 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -83,6 +83,10 @@
 #define __packed __attribute__((__packed__))
 #endif
 
+#ifndef __maybe_unused
+# define __maybe_unused __attribute__((__unused__))
+#endif
+
 #define container_of(ptr, type, member) ({              \
     typeof(((type *)0)->member) *mptr__ = (ptr);        \
     (type *)((char *)mptr__ - offsetof(type, member));  \
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 8893547bebce..2a1ac0ee8326 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -12,282 +12,33 @@
 
 #include <xen-tools/common-macros.h>
 
-static uint32_t nr_features;
-
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
+#include <xen/lib/x86/cpu-policy.h>
 
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
+static uint32_t nr_features;
 
 static const struct {
     const char *name;
     const char *abbr;
-    const char *const *strs;
-} decodes[] =
+} leaf_names[] =
 {
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
@@ -305,12 +56,6 @@ static void dump_leaf(uint32_t leaf, const char *const *strs)
 {
     unsigned i;
 
-    if ( !strs )
-    {
-        printf(" ???");
-        return;
-    }
-
     for ( i = 0; i < 32; ++i )
         if ( leaf & (1u << i) )
         {
@@ -326,6 +71,7 @@ static void decode_featureset(const uint32_t *features,
                               const char *name,
                               bool detail)
 {
+    static const uint32_t __maybe_unused known_features[] = INIT_KNOWN_FEATURES;
     unsigned int i;
 
     printf("%-"COL_ALIGN"s        ", name);
@@ -336,11 +82,21 @@ static void decode_featureset(const uint32_t *features,
     if ( !detail )
         return;
 
-    for ( i = 0; i < length && i < ARRAY_SIZE(decodes); ++i )
+    /* Ensure leaf names stay in sync with the policy leaf count. */
+    BUILD_BUG_ON(ARRAY_SIZE(known_features) != ARRAY_SIZE(leaf_names));
+
+    for ( i = 0; i < length && i < ARRAY_SIZE(leaf_names); ++i )
     {
-        printf("  [%02u] %-"COL_ALIGN"s", i, decodes[i].name ?: "<UNKNOWN>");
-        if ( decodes[i].name )
-            dump_leaf(features[i], decodes[i].strs);
+        static const char *const feature_names[] = INIT_FEATURE_NAME_ARRAY;
+
+        /* Ensure feature names stays in sync with number of feature words. */
+        BUILD_BUG_ON(ARRAY_SIZE(feature_names) !=
+                     ARRAY_SIZE(leaf_names) * sizeof(*features) * 8);
+
+        printf("  [%02u] %-"COL_ALIGN"s", i, leaf_names[i].name ?: "<UNKNOWN>");
+
+        /* Attempt to print features anyway even if the leaf name is unknown. */
+        dump_leaf(features[i], &feature_names[i * 32]);
         printf("\n");
     }
 }
@@ -355,8 +111,8 @@ static void dump_info(xc_interface *xch, bool detail)
     if ( !detail )
     {
         printf("       %"COL_ALIGN"s ", "KEY");
-        for ( i = 0; i < ARRAY_SIZE(decodes); ++i )
-            printf("%-8s ", decodes[i].abbr ?: "???");
+        for ( i = 0; i < ARRAY_SIZE(leaf_names); ++i )
+            printf("%-8s ", leaf_names[i].abbr ?: "???");
         printf("\n");
     }
 
diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index 8f8accfe3e70..a702c9faf207 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -50,7 +50,6 @@
 #define this_cpu(var) per_cpu_##var
 
 #define __init
-#define __maybe_unused __attribute__((__unused__))
 
 #define likely(x)   __builtin_expect(!!(x), true)
 #define unlikely(x) __builtin_expect(!!(x), false)
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 380b9d973a67..c0caa3bdebef 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -475,6 +475,32 @@ def write_results(state):
     state.output.write(
 """}
 
+""")
+
+    state.output.write(
+"""
+#define INIT_FEATURE_NAME_ARRAY { \\
+""")
+
+    try:
+        _tmp = state.names.iteritems()
+    except AttributeError:
+        _tmp = state.names.items()
+
+    for bit, name in sorted(_tmp):
+        state.output.write(
+            '    [%s] = "%s",\\\n' % (bit, name.lower().replace("_", "-"))
+            )
+
+    # Ensure array size matches featureset size.
+    if not state.names.get(state.nr_entries * 32 - 1, ""):
+        state.output.write(
+            '    [%s] = NULL,\\\n' % (state.nr_entries * 32 - 1)
+            )
+
+    state.output.write(
+"""}
+
 """)
 
     for idx, text in enumerate(state.bitfields):
-- 
2.44.0


