Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764A8659FA8
	for <lists+xen-devel@lfdr.de>; Sat, 31 Dec 2022 01:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469952.729420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBPla-00021Z-3C; Sat, 31 Dec 2022 00:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469952.729420; Sat, 31 Dec 2022 00:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBPlZ-0001xy-Vx; Sat, 31 Dec 2022 00:30:25 +0000
Received: by outflank-mailman (input) for mailman id 469952;
 Sat, 31 Dec 2022 00:30:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cPaP=45=citrix.com=prvs=3576bb3e1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pBPlY-0001Tf-IL
 for xen-devel@lists.xenproject.org; Sat, 31 Dec 2022 00:30:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e3d10c4-88a2-11ed-8fd4-01056ac49cbb;
 Sat, 31 Dec 2022 01:30:21 +0100 (CET)
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
X-Inumbo-ID: 4e3d10c4-88a2-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672446621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H4aei8fxCJmeHTiWvlRflD56P4is8vavRwFfFPdiM2k=;
  b=CkckY2QgR/zJsXod0NJJMuKJYg6JjTa7xN7KEbhAkgnF7Xm0YIPi026z
   KtKkrbHn/Kdpn/ID85BRyxWH2SNRoMbIeDp9/mEIETSQHTy5GbDBXUfw4
   qAGrJGQ17HLWjW+r51GdCL1qrrSgrBZ9ELKJSHtNfQoYzYu1rgLQaEKAa
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90146733
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uI0LSqM0u8XvmHnvrR2rl8FynXyQoLVcMsEvi/4bfWQNrUpxhWRSy
 TAcWGjVafmMN2T2edh2a4i+pkhT6p+EzdZrSQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5QRmOZingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t5pPFNO1
 tECESEAdjaYrM2T+5S3V8A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9K4TTGZsKxR3wS
 mTu0GXeLzwDboamkyOdq02Pj76SgAzZYddHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/p9A
 UEJ/islrYAp6VemCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxuKJxUnLUwvfxYVQBMj+PLMhboVgg/mG4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj65hX7WwrkBr3+MGXE1ddChH/Gzv8s1gnPNLNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJrW/FF52LJ9o4DNRCyKBBbK45lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIUUPsIsLlPXrHszDaJ144wKuBF2+ZzTx
 L/BKZr8ZZrkIf8PIMWKqxc1juZwm3FWKZL7TpHn1RW3uYejiIquYe5dajOmN7lphJ5oVS2Jq
 76zwePWkUQAOAA/CwGLmbMuwacidylqXsCq8ZIGL4Zu4GNOQQkcNhMY+pt5E6QNokifvr2gE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:XCjnkKioi15Ys+BqMYs39cmDzHBQXv0ji2hC6mlwRA09TyX+rb
 HSoB17726PtN91YhodcL+7WZVoLUmsl6KdmLNhW4tKIjOWw1dAXbsD0WKK+VSJdxEWkNQtrJ
 uIXJIRNDSaNykYsS+V2njcLz48q+PpzEjh7d21858mJTsGV0nghD0JbjpyeydNNW577XpQLu
 vl2vZ6
X-IronPort-AV: E=Sophos;i="5.96,288,1665460800"; 
   d="scan'208";a="90146733"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
Date: Sat, 31 Dec 2022 00:30:06 +0000
Message-ID: <20221231003007.26916-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221231003007.26916-1-andrew.cooper3@citrix.com>
References: <20221231003007.26916-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We don't actually need ecx yet, but adding it in now will reduce the amount to
which leaf 7 is out of order in a featureset.

cpufeatureset.h remains in leaf architectrual order for the sanity of anyone
trying to locate where to insert new rows.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/misc/xen-cpuid.c                      | 10 ++++++++++
 xen/arch/x86/cpu/common.c                   |  3 ++-
 xen/include/public/arch-x86/cpufeatureset.h |  3 +++
 xen/include/xen/lib/x86/cpuid.h             | 15 ++++++++++++++-
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index d5833e9ce879..0091a11a67bc 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -202,6 +202,14 @@ static const char *const str_7b1[32] =
     [ 0] = "ppin",
 };
 
+static const char *const str_7c1[32] =
+{
+};
+
+static const char *const str_7d1[32] =
+{
+};
+
 static const char *const str_7d2[32] =
 {
     [ 0] = "intel-psfd",
@@ -229,6 +237,8 @@ static const struct {
     { "0x80000021.eax",  "e21a", str_e21a },
     { "0x00000007:1.ebx", "7b1", str_7b1 },
     { "0x00000007:2.edx", "7d2", str_7d2 },
+    { "0x00000007:1.ecx", "7b1", str_7c1 },
+    { "0x00000007:1.edx", "7b1", str_7d1 },
 };
 
 #define COL_ALIGN "18"
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 0412dbc915e5..b3fcf4680f3a 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -450,7 +450,8 @@ static void generic_identify(struct cpuinfo_x86 *c)
 			cpuid_count(7, 1,
 				    &c->x86_capability[FEATURESET_7a1],
 				    &c->x86_capability[FEATURESET_7b1],
-				    &tmp, &tmp);
+				    &c->x86_capability[FEATURESET_7c1],
+				    &c->x86_capability[FEATURESET_7d1]);
 		if (max_subleaf >= 2)
 			cpuid_count(7, 2,
 				    &tmp, &tmp, &tmp,
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 7915f5826f57..7a896f0e2d92 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -288,6 +288,9 @@ XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
 XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
 
+/* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
+/* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
+
 /* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
 XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
 XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*   MSR_SPEC_CTRL.IPRED_DIS_* */
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index 73a5c330365e..fa98b371eef4 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -18,6 +18,8 @@
 #define FEATURESET_e21a  11 /* 0x80000021.eax      */
 #define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
 #define FEATURESET_7d2   13 /* 0x00000007:2.edx    */
+#define FEATURESET_7c1   14 /* 0x00000007:1.ecx    */
+#define FEATURESET_7d1   15 /* 0x00000007:1.edx    */
 
 struct cpuid_leaf
 {
@@ -194,7 +196,14 @@ struct cpuid_policy
                 uint32_t _7b1;
                 struct { DECL_BITFIELD(7b1); };
             };
-            uint32_t /* c */:32, /* d */:32;
+            union {
+                uint32_t _7c1;
+                struct { DECL_BITFIELD(7c1); };
+            };
+            union {
+                uint32_t _7d1;
+                struct { DECL_BITFIELD(7d1); };
+            };
 
             /* Subleaf 2. */
             uint32_t /* a */:32, /* b */:32, /* c */:32;
@@ -343,6 +352,8 @@ static inline void cpuid_policy_to_featureset(
     fs[FEATURESET_e21a] = p->extd.e21a;
     fs[FEATURESET_7b1] = p->feat._7b1;
     fs[FEATURESET_7d2] = p->feat._7d2;
+    fs[FEATURESET_7c1] = p->feat._7c1;
+    fs[FEATURESET_7d1] = p->feat._7d1;
 }
 
 /* Fill in a CPUID policy from a featureset bitmap. */
@@ -363,6 +374,8 @@ static inline void cpuid_featureset_to_policy(
     p->extd.e21a  = fs[FEATURESET_e21a];
     p->feat._7b1  = fs[FEATURESET_7b1];
     p->feat._7d2  = fs[FEATURESET_7d2];
+    p->feat._7c1  = fs[FEATURESET_7c1];
+    p->feat._7d1  = fs[FEATURESET_7d1];
 }
 
 static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)
-- 
2.11.0


