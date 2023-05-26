Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE5C712543
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 13:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540060.841532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIK-0007QK-R9; Fri, 26 May 2023 11:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540060.841532; Fri, 26 May 2023 11:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIK-0007Lh-N3; Fri, 26 May 2023 11:07:40 +0000
Received: by outflank-mailman (input) for mailman id 540060;
 Fri, 26 May 2023 11:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDTS=BP=citrix.com=prvs=5031e17c9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q2VIJ-0006de-D0
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 11:07:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85dd0dc6-fbb5-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 13:07:37 +0200 (CEST)
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
X-Inumbo-ID: 85dd0dc6-fbb5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685099257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vEXEzdcx1S5fOqtwj2ao5hamG4txXf0RO67hpizdai4=;
  b=FEAJ+gYBr6LYHULZViVJXq+m/QuHEC+/x629ZJUb2kajNMvkVAs7S8Sw
   xGlZ9Qd3o+z8EQq1a0EGu5m6ajfEpHODhYhsHAMiXkFxbZ2Vo2b6bgzNu
   V5dFj310rlpUSvWBLbKrX0ig6zfRxIyybX1DLyHKsISxSIxN2BduYgjas
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113007428
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:tJ6uWqtd3OBBXcY/+tRZjNws5ufnVEZeMUV32f8akzHdYApBsoF/q
 tZmKTvUaPzcYWLwc9B2bIu+8U4Bv56HyN5jSQJv/HswRi9A+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AKEySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdCE/XgnYvOeNkeiXUO9VhtYHFeTmI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zudpzymXktKXDCZ4WGl1m+plOH2pz7UfolLGrKq0sAwilLGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZVcU0en6+7o2tUOVYsxlKa6nquTYFC6ll
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkkfC+F0e5eI1cFh
 XM/XisPjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwNRPIhDGxzBFywPtX1
 XKnnSCEVypy5UNPlWDeegvg+eVzmnBWKZ37GfgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnTg5B
 +13bpPQoz0GCb2WX8Ui2dJLRbz8BSRhVM+eRg0+XrLrHzeK70l7VqeKnet6It0890mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMS0LhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:wxLCwK0KRd9D0nOJOKu6kAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: =?us-ascii?q?9a23=3AWWr33mjv9KVZtgSkKcC2qGod5DJuLmzv/G6LGEq?=
 =?us-ascii?q?DWDxFUrusSU20wY5pjJ87?=
X-Talos-MUID: 9a23:r1ZrHwjq1uMW5mdymVQMK8Mpb+dM/qG8Bnk3jLogsJCKOj5UBW2Xg2Hi
X-IronPort-AV: E=Sophos;i="6.00,194,1681185600"; 
   d="scan'208";a="113007428"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/4] x86/spec-ctrl: Synthesize RSBA/RRSBA bits with older microcode
Date: Fri, 26 May 2023 12:06:54 +0100
Message-ID: <20230526110656.4018711-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In order to level a VM safely for migration, the toolstack needs to know the
RSBA/RRSBA properties of the CPU, whether or not they happen to be enumerated.

Synthesize the bits when missing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/spec_ctrl.c              | 50 +++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 50235f098d70..08e3eedd1280 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -192,6 +192,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
+#define cpu_has_rrsba           boot_cpu_has(X86_FEATURE_RRSBA)
 
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 0774d40627dd..2647784615cc 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -578,7 +578,10 @@ static bool __init check_smt_enabled(void)
     return false;
 }
 
-/* Calculate whether Retpoline is known-safe on this CPU. */
+/*
+ * Calculate whether Retpoline is known-safe on this CPU.  Synthesize missing
+ * RSBA/RRSBA bits when running with old microcode.
+ */
 static bool __init retpoline_calculations(void)
 {
     unsigned int ucode_rev = this_cpu(cpu_sig).rev;
@@ -592,13 +595,18 @@ static bool __init retpoline_calculations(void)
         return false;
 
     /*
-     * RSBA may be set by a hypervisor to indicate that we may move to a
-     * processor which isn't retpoline-safe.
-     *
      * Processors offering Enhanced IBRS are not guarenteed to be
      * repoline-safe.
      */
-    if ( cpu_has_rsba || cpu_has_eibrs )
+    if ( cpu_has_eibrs )
+        goto unsafe_maybe_fixup_rrsba;
+
+    /*
+     * RSBA is explicitly enumerated in some cases, but may also be set by a
+     * hypervisor to indicate that we may move to a processor which isn't
+     * retpoline-safe.
+     */
+    if ( cpu_has_rsba )
         return false;
 
     switch ( boot_cpu_data.x86_model )
@@ -648,6 +656,8 @@ static bool __init retpoline_calculations(void)
 
         /*
          * Skylake, Kabylake and Cannonlake processors are not retpoline-safe.
+         * Note: the eIBRS-capable steppings are filtered out earlier, so the
+         * remainder here are the ones which suffer only RSBA behaviour.
          */
     case 0x4e: /* Skylake M */
     case 0x55: /* Skylake X */
@@ -656,7 +666,7 @@ static bool __init retpoline_calculations(void)
     case 0x67: /* Cannonlake? */
     case 0x8e: /* Kabylake M */
     case 0x9e: /* Kabylake D */
-        return false;
+        goto unsafe_maybe_fixup_rsba;
 
         /*
          * Atom processors before Goldmont Plus/Gemini Lake are retpoline-safe.
@@ -687,6 +697,32 @@ static bool __init retpoline_calculations(void)
     if ( safe )
         return true;
 
+    /*
+     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
+     * agreed upon meaning at the time of writing (May 2023) is thus:
+     *
+     * - RSBA (RSB Alterantive) means that an RSB may fall back to an
+     *   alternative predictor on underflow.  Skylake uarch and later all have
+     *   this property.  Broadwell too, when running microcode versions prior
+     *   to Jan 2018.
+     *
+     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
+     *   tagging of predictions with the mode in which they were learned.  So
+     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
+     *
+     * Some parts (Broadwell) are not expected to ever enumerate this
+     * behaviour directly.  Other parts have differing enumeration with
+     * microcode version.  Fix up Xen's idea, so we can advertise them safely
+     * to guests, and so toolstacks can level a VM safelty for migration.
+     */
+ unsafe_maybe_fixup_rrsba:
+    if ( !cpu_has_rrsba )
+        setup_force_cpu_cap(X86_FEATURE_RRSBA);
+
+ unsafe_maybe_fixup_rsba:
+    if ( !cpu_has_rsba )
+        setup_force_cpu_cap(X86_FEATURE_RSBA);
+
     return false;
 }
 
@@ -1146,7 +1182,7 @@ void __init init_speculation_mitigations(void)
             thunk = THUNK_JMP;
     }
 
-    /* Determine if retpoline is safe on this CPU. */
+    /* Determine if retpoline is safe on this CPU.  Fix up RSBA/RRSBA enumerations. */
     retpoline_safe = retpoline_calculations();
 
     /*
-- 
2.30.2


