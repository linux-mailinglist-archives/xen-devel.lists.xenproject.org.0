Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48796F733D
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530040.825275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puenh-0006Sy-1o; Thu, 04 May 2023 19:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530040.825275; Thu, 04 May 2023 19:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueng-0006K7-Sy; Thu, 04 May 2023 19:39:36 +0000
Received: by outflank-mailman (input) for mailman id 530040;
 Thu, 04 May 2023 19:39:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puenf-00069l-T7
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:39:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65d9d6e2-eab3-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 21:39:35 +0200 (CEST)
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
X-Inumbo-ID: 65d9d6e2-eab3-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683229175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jr5O2ho0oh2dy6YyNewvIFzCxvBrXOJlZmgmV269Q/k=;
  b=bs2AD/Fs7u8FRnFxMUlW3QRP1fUgBjsvmJorU8NJ2LZzdeKpZyrIfaSb
   rQ2yZAo16A/RlrVY1gQts8UuiF7iGAYzQCItZCYZL0ULaQrhMQKMFzNtb
   eoYjBsI3CgDXHg1XQhIOH1X6K3KnJgElM2PMXI6s+2SOKNi1vd1xQ4dxF
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107931611
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:kJpQzKuPcYcZMGFx809kXMhjeOfnVCdeMUV32f8akzHdYApBsoF/q
 tZmKTyCa6yKMGX2foh0aY209hkDu5SAxtFrHQVkpHsxHigR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AKGyyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEz8saE25nNiPkY2FStA3r50DE5HxBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zqZrj+gXEhDXDCZ4WSP9nzzud3dpwDce4NIN7GX7uYyonTGkwT/DzVJDADm8JFVkHWWRNZ3O
 0ESvC00osAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZTAKwt++mpoJt0PwcNZaS4fsruKtAwill
 lhmsxMCa6UvYd8jjvvrpgie2WLz+fAlXSZuuFyJAzvNAhdRIdf8Otf2sQWzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF52LJ9o4DMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/i7T467CqmFNoERCnSUSDJrAQk0PRLAt4wTuBFEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYIWKtQF7TqLH/jTlk33uYdykVbJEd/pxnPSNLFmhE5FyS2Jm
 +ti2zyikUgEDrCkOHKPrub+7zkidBAGOHw/kOQPHsbrH+asMDtJ5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:dcGjLqjOHA+0jiMQx7THnu5Q8nBQXg4ji2hC6mlwRA09TyX4rb
 HKoB1/73LJYVkqN03I9ervBED4ewK5yXct2/h3AV7AZniFhILLFu1fBOLZqlWLJ8SZzI9gPM
 9bGJSWY+eAbmSS4/yb3OFte+xQueVu78iT9JjjJ2YEd3ANV0l/hz0JcjpzGHcGODWvWPICZe
 GhDtIunUvbRZwNBv7Le0U4Yw==
X-Talos-CUID: 9a23:ujj73W9qBqA70R+GzX2Vv3UbO8Z4SGbn9SbvHU+BUk8waILNU2bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AoOu8Lw9dfBjUJW2cTSXRQG6Qf5li56rxN3Ifq7Y?=
 =?us-ascii?q?hmMjeFiBfIy/Frh3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,250,1677560400"; 
   d="scan'208";a="107931611"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 5/6] x86/cpu-policy: Disentangle X86_NR_FEAT and FEATURESET_NR_ENTRIES
Date: Thu, 4 May 2023 20:39:23 +0100
Message-ID: <20230504193924.3305496-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When adding new words to a featureset, there is a reasonable amount of
boilerplate and it is preforable to split the addition into multiple patches.

GCC 12 spotted a real (transient) error which occurs when splitting additions
like this.  Right now, FEATURESET_NR_ENTRIES is dynamically generated from the
highest numeric XEN_CPUFEATURE() value, and can be less than what the
FEATURESET_* constants suggest the length of a featureset bitmap ought to be.

This causes the policy <-> featureset converters to genuinely access
out-of-bounds on the featureset array.

Rework X86_NR_FEAT to be related to FEATURESET_* alone, allowing it
specifically to grow larger than FEATURESET_NR_ENTRIES.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

To preempt what I expect will be the first review question, no FEATURESET_*
can't become an enumeration, because the constants undergo token concatination
in the preprocess as part of making DECL_BITFIELD() work.
---
 xen/arch/x86/cpu-policy.c              | 7 +++++++
 xen/arch/x86/include/asm/cpufeatures.h | 5 +----
 xen/include/xen/lib/x86/cpu-policy.h   | 4 ++--
 xen/include/xen/lib/x86/cpuid-consts.h | 2 ++
 xen/lib/x86/cpuid.c                    | 6 +++---
 5 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 774c512a03bd..00416244a3d8 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -883,6 +883,13 @@ void __init init_dom0_cpuid_policy(struct domain *d)
 
 static void __init __maybe_unused build_assertions(void)
 {
+    /*
+     * Generally these are the same, but tend to differ when adding new
+     * infrastructure split across several patches.  Simply confirm that the
+     * gen-cpuid.py X86_FEATURE_* bits fit within the bitmaps we operate on.
+     */
+    BUILD_BUG_ON(FEATURESET_NR_ENTRIES > X86_NR_FEAT);
+
     /* Find some more clever allocation scheme if this trips. */
     BUILD_BUG_ON(sizeof(struct cpu_policy) > PAGE_SIZE);
 
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 408ab4ba16a5..8989291bbfd6 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -2,10 +2,7 @@
  * Explicitly intended for multiple inclusion.
  */
 
-#include <xen/lib/x86/cpuid-autogen.h>
-
-/* Number of capability words covered by the featureset words. */
-#define X86_NR_FEAT FEATURESET_NR_ENTRIES
+#include <xen/lib/x86/cpuid-consts.h>
 
 /* Synthetic words follow the featureset words. */
 #define X86_NR_SYNTH 1
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index e9bda14a7595..01431de056c8 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -370,12 +370,12 @@ struct cpu_policy_errors
  * Copy the featureset words out of a cpu_policy object.
  */
 void x86_cpu_policy_to_featureset(const struct cpu_policy *p,
-                                  uint32_t fs[FEATURESET_NR_ENTRIES]);
+                                  uint32_t fs[X86_NR_FEAT]);
 
 /**
  * Copy the featureset words back into a cpu_policy object.
  */
-void x86_cpu_featureset_to_policy(const uint32_t fs[FEATURESET_NR_ENTRIES],
+void x86_cpu_featureset_to_policy(const uint32_t fs[X86_NR_FEAT],
                                   struct cpu_policy *p);
 
 static inline uint64_t cpu_policy_xcr0_max(const struct cpu_policy *p)
diff --git a/xen/include/xen/lib/x86/cpuid-consts.h b/xen/include/xen/lib/x86/cpuid-consts.h
index 6ca8c39a3df4..9fe931b8e31f 100644
--- a/xen/include/xen/lib/x86/cpuid-consts.h
+++ b/xen/include/xen/lib/x86/cpuid-consts.h
@@ -21,6 +21,8 @@
 #define FEATURESET_7c1   14 /* 0x00000007:1.ecx    */
 #define FEATURESET_7d1   15 /* 0x00000007:1.edx    */
 
+#define X86_NR_FEAT (FEATURESET_7d1 + 1)
+
 #endif /* !XEN_LIB_X86_CONSTS_H */
 
 /*
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 68aafb404927..76f26e92af8d 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -61,7 +61,7 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor)
 }
 
 void x86_cpu_policy_to_featureset(
-    const struct cpu_policy *p, uint32_t fs[FEATURESET_NR_ENTRIES])
+    const struct cpu_policy *p, uint32_t fs[X86_NR_FEAT])
 {
     fs[FEATURESET_1d]        = p->basic._1d;
     fs[FEATURESET_1c]        = p->basic._1c;
@@ -82,7 +82,7 @@ void x86_cpu_policy_to_featureset(
 }
 
 void x86_cpu_featureset_to_policy(
-    const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpu_policy *p)
+    const uint32_t fs[X86_NR_FEAT], struct cpu_policy *p)
 {
     p->basic._1d             = fs[FEATURESET_1d];
     p->basic._1c             = fs[FEATURESET_1c];
@@ -285,7 +285,7 @@ const uint32_t *x86_cpu_policy_lookup_deep_deps(uint32_t feature)
     static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
     static const struct {
         uint32_t feature;
-        uint32_t fs[FEATURESET_NR_ENTRIES];
+        uint32_t fs[X86_NR_FEAT];
     } deep_deps[] = INIT_DEEP_DEPS;
     unsigned int start = 0, end = ARRAY_SIZE(deep_deps);
 
-- 
2.30.2


