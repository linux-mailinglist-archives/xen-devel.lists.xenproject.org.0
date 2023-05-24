Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16170F533
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 13:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538967.839398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mch-0006gX-MA; Wed, 24 May 2023 11:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538967.839398; Wed, 24 May 2023 11:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mch-0006eE-JB; Wed, 24 May 2023 11:25:43 +0000
Received: by outflank-mailman (input) for mailman id 538967;
 Wed, 24 May 2023 11:25:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1mcg-0006dp-BG
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 11:25:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4502455-fa25-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 13:25:38 +0200 (CEST)
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
X-Inumbo-ID: b4502455-fa25-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684927538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cEqAKJhSYdiDhZzPNXI65MjIM+ej5xzXmsT0GY2hH+4=;
  b=ecRy0NUWX5vR+LD/lWKf91PrAFnKjGEXvfsj7EpjZwcZdJKDR35eQoY3
   DzwN3aRSGQ1JCHh5KVtSz5dlyvqJCc6tS52Syko6yV0kbJO8UTBg1Dola
   Wk0zfxYwe+nPj4hetJ9KTHo0wHvWg5u1viVALBodQpZBZXfxegbE9e5J0
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110611672
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:HTHsMKzAyxe0REPuBV96t+c/xirEfRIJ4+MujC+fZmUNrF6WrkUEx
 mIdD2iDOKmCZzD0fN0jYISy/B9X6sSGzYI1TApu/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRjP6wT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV4R+
 vo5cS0gVxKCq9rqh+LqWu1Autt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwMxhjB/
 zyZpQwVBDkQPvLYyGKFzUv2revwty/RepMSM7uno6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0c9OiACbFIYzuDhoa0L0lWfH8ZnPJKq24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9g4DNJWfh0B3iM4ldjBP
 ifuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKl/brH8wNRLLgTG3+KTJrU3YE
 c7BGftA8F5AUfg3pNZIb7x1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYo43K+1Rrlhtsus+VyFm
 +uzwuPWk32zpsWiOHiImWPSRHhWRUUG6Wfe9JEOKbfafls5cIzjYteIqY4cl0Vet/w9vo/1E
 ruVAye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:pkObz6kqQG8KfA9w0wipdxQ6n5DpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: =?us-ascii?q?9a23=3Azi/5dGmKKTxOD+MkxR/u9dONFnTXOUKCw3HxelK?=
 =?us-ascii?q?VMGRoZIXJDg/B6KdIr9U7zg=3D=3D?=
X-Talos-MUID: 9a23:1/JwWArI4B1l889VhuIezztoGoBpu6SRMRomlaost+OmJCxXPSjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="110611672"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 03/10] x86/cpu-policy: Infrastructure for MSR_ARCH_CAPS
Date: Wed, 24 May 2023 12:25:19 +0100
Message-ID: <20230524112526.3475200-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Bits through 24 are already defined, meaning that we're not far off needing
the second word.  Put both in right away.

As both halves are present now, the arch_caps field is full width.  Adjust the
unit test, which notices.

The bool bitfield names in the arch_caps union are unused, and somewhat out of
date.  They'll shortly be automatically generated.

Add CPUID and MSR prefixes to the ./xen-cpuid verbose output, now that there
are a mix of the two.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Adjust the unit test.
 * Use an m prefix on the short name.
 * Add CPUID/MSR to the verbose name.
---
 tools/misc/xen-cpuid.c                      | 44 +++++++++++-------
 tools/tests/cpu-policy/test-cpu-policy.c    |  5 ---
 xen/include/public/arch-x86/cpufeatureset.h |  4 ++
 xen/include/xen/lib/x86/cpu-policy.h        | 50 ++++++++++-----------
 xen/lib/x86/cpuid.c                         |  4 ++
 5 files changed, 59 insertions(+), 48 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 8ec143ebc854..15ad2d33e2a1 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -226,31 +226,41 @@ static const char *const str_7d2[32] =
     [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
 };
 
+static const char *const str_10Al[32] =
+{
+};
+
+static const char *const str_10Ah[32] =
+{
+};
+
 static const struct {
     const char *name;
     const char *abbr;
     const char *const *strs;
 } decodes[] =
 {
-    { "0x00000001.edx",   "1d",  str_1d },
-    { "0x00000001.ecx",   "1c",  str_1c },
-    { "0x80000001.edx",   "e1d", str_e1d },
-    { "0x80000001.ecx",   "e1c", str_e1c },
-    { "0x0000000d:1.eax", "Da1", str_Da1 },
-    { "0x00000007:0.ebx", "7b0", str_7b0 },
-    { "0x00000007:0.ecx", "7c0", str_7c0 },
-    { "0x80000007.edx",   "e7d", str_e7d },
-    { "0x80000008.ebx",   "e8b", str_e8b },
-    { "0x00000007:0.edx", "7d0", str_7d0 },
-    { "0x00000007:1.eax", "7a1", str_7a1 },
-    { "0x80000021.eax",  "e21a", str_e21a },
-    { "0x00000007:1.ebx", "7b1", str_7b1 },
-    { "0x00000007:2.edx", "7d2", str_7d2 },
-    { "0x00000007:1.ecx", "7c1", str_7c1 },
-    { "0x00000007:1.edx", "7d1", str_7d1 },
+    { "CPUID 0x00000001.edx",        "1d", str_1d },
+    { "CPUID 0x00000001.ecx",        "1c", str_1c },
+    { "CPUID 0x80000001.edx",       "e1d", str_e1d },
+    { "CPUID 0x80000001.ecx",       "e1c", str_e1c },
+    { "CPUID 0x0000000d:1.eax",     "Da1", str_Da1 },
+    { "CPUID 0x00000007:0.ebx",     "7b0", str_7b0 },
+    { "CPUID 0x00000007:0.ecx",     "7c0", str_7c0 },
+    { "CPUID 0x80000007.edx",       "e7d", str_e7d },
+    { "CPUID 0x80000008.ebx",       "e8b", str_e8b },
+    { "CPUID 0x00000007:0.edx",     "7d0", str_7d0 },
+    { "CPUID 0x00000007:1.eax",     "7a1", str_7a1 },
+    { "CPUID 0x80000021.eax",      "e21a", str_e21a },
+    { "CPUID 0x00000007:1.ebx",     "7b1", str_7b1 },
+    { "CPUID 0x00000007:2.edx",     "7d2", str_7d2 },
+    { "CPUID 0x00000007:1.ecx",     "7c1", str_7c1 },
+    { "CPUID 0x00000007:1.edx",     "7d1", str_7d1 },
+    { "MSR   0x0000010a.lo",      "m10Al", str_10Al },
+    { "MSR   0x0000010a.hi",      "m10Ah", str_10Ah },
 };
 
-#define COL_ALIGN "18"
+#define COL_ALIGN "24"
 
 static const char *const fs_names[] = {
     [XEN_SYSCTL_cpu_featureset_raw]     = "Raw",
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index f1d968adfc39..301df2c00285 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -391,11 +391,6 @@ static void test_msr_deserialise_failure(void)
             .msr = { .idx = 0xce, .val = ~0ull },
             .rc = -EOVERFLOW,
         },
-        {
-            .name = "truncated val",
-            .msr = { .idx = 0x10a, .val = ~0ull },
-            .rc = -EOVERFLOW,
-        },
     };
 
     printf("Testing MSR deserialise failure:\n");
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 8de73aebc3e0..032cec3ccba2 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -307,6 +307,10 @@ XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
+/* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
+
+/* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index bfa425060464..6d5e9edd269b 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -4,22 +4,24 @@
 
 #include <xen/lib/x86/cpuid-autogen.h>
 
-#define FEATURESET_1d     0 /* 0x00000001.edx      */
-#define FEATURESET_1c     1 /* 0x00000001.ecx      */
-#define FEATURESET_e1d    2 /* 0x80000001.edx      */
-#define FEATURESET_e1c    3 /* 0x80000001.ecx      */
-#define FEATURESET_Da1    4 /* 0x0000000d:1.eax    */
-#define FEATURESET_7b0    5 /* 0x00000007:0.ebx    */
-#define FEATURESET_7c0    6 /* 0x00000007:0.ecx    */
-#define FEATURESET_e7d    7 /* 0x80000007.edx      */
-#define FEATURESET_e8b    8 /* 0x80000008.ebx      */
-#define FEATURESET_7d0    9 /* 0x00000007:0.edx    */
-#define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
-#define FEATURESET_e21a  11 /* 0x80000021.eax      */
-#define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
-#define FEATURESET_7d2   13 /* 0x00000007:2.edx    */
-#define FEATURESET_7c1   14 /* 0x00000007:1.ecx    */
-#define FEATURESET_7d1   15 /* 0x00000007:1.edx    */
+#define FEATURESET_1d         0 /* 0x00000001.edx      */
+#define FEATURESET_1c         1 /* 0x00000001.ecx      */
+#define FEATURESET_e1d        2 /* 0x80000001.edx      */
+#define FEATURESET_e1c        3 /* 0x80000001.ecx      */
+#define FEATURESET_Da1        4 /* 0x0000000d:1.eax    */
+#define FEATURESET_7b0        5 /* 0x00000007:0.ebx    */
+#define FEATURESET_7c0        6 /* 0x00000007:0.ecx    */
+#define FEATURESET_e7d        7 /* 0x80000007.edx      */
+#define FEATURESET_e8b        8 /* 0x80000008.ebx      */
+#define FEATURESET_7d0        9 /* 0x00000007:0.edx    */
+#define FEATURESET_7a1       10 /* 0x00000007:1.eax    */
+#define FEATURESET_e21a      11 /* 0x80000021.eax      */
+#define FEATURESET_7b1       12 /* 0x00000007:1.ebx    */
+#define FEATURESET_7d2       13 /* 0x00000007:2.edx    */
+#define FEATURESET_7c1       14 /* 0x00000007:1.ecx    */
+#define FEATURESET_7d1       15 /* 0x00000007:1.edx    */
+#define FEATURESET_m10Al     16 /* 0x0000010a.eax      */
+#define FEATURESET_m10Ah     17 /* 0x0000010a.edx      */
 
 struct cpuid_leaf
 {
@@ -350,17 +352,13 @@ struct cpu_policy
      * fixed in hardware.
      */
     union {
-        uint32_t raw;
+        uint64_t raw;
+        struct {
+            uint32_t lo, hi;
+        };
         struct {
-            bool rdcl_no:1;
-            bool ibrs_all:1;
-            bool rsba:1;
-            bool skip_l1dfl:1;
-            bool ssb_no:1;
-            bool mds_no:1;
-            bool if_pschange_mc_no:1;
-            bool tsx_ctrl:1;
-            bool taa_no:1;
+            DECL_BITFIELD(m10Al);
+            DECL_BITFIELD(m10Ah);
         };
     } arch_caps;
 
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 68aafb404927..e795ce375032 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -79,6 +79,8 @@ void x86_cpu_policy_to_featureset(
     fs[FEATURESET_7d2]       = p->feat._7d2;
     fs[FEATURESET_7c1]       = p->feat._7c1;
     fs[FEATURESET_7d1]       = p->feat._7d1;
+    fs[FEATURESET_m10Al]     = p->arch_caps.lo;
+    fs[FEATURESET_m10Ah]     = p->arch_caps.hi;
 }
 
 void x86_cpu_featureset_to_policy(
@@ -100,6 +102,8 @@ void x86_cpu_featureset_to_policy(
     p->feat._7d2             = fs[FEATURESET_7d2];
     p->feat._7c1             = fs[FEATURESET_7c1];
     p->feat._7d1             = fs[FEATURESET_7d1];
+    p->arch_caps.lo          = fs[FEATURESET_m10Al];
+    p->arch_caps.hi          = fs[FEATURESET_m10Ah];
 }
 
 void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
-- 
2.30.2


