Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7637A21B1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603212.940187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJc-0006CZ-5t; Fri, 15 Sep 2023 15:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603212.940187; Fri, 15 Sep 2023 15:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJb-0006A7-R4; Fri, 15 Sep 2023 15:01:03 +0000
Received: by outflank-mailman (input) for mailman id 603212;
 Fri, 15 Sep 2023 15:01:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhAJa-0004UV-8S
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:01:02 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af01a903-53d8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 17:01:01 +0200 (CEST)
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
X-Inumbo-ID: af01a903-53d8-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694790061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iqRrxOP3pxe6jZWttoS6DHQOzltrAeSnz0bv2Vp0Iyo=;
  b=eQQAFigzmhqxVeht+7Agb10UcXChbBH4VJ2Z+8oyCHf/kEAqeadxW9Xm
   ++cK0Lnn31fMQ9VT1Jyw5pytyCxjTZqkQbR6jU7g/l6WncEFLziA2olvg
   G2m6jdF7LvQlQbjTutNZZKYKGTSsTBEt13YVVyksisVh10kcJQyigstGJ
   I=;
X-CSE-ConnectionGUID: T6/GhXioRSe6SFi4s144KQ==
X-CSE-MsgGUID: CDhin9m1QGyvT2GKHUBMJQ==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125509279
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:D5UCQ6ysCzvRT1q0Qv16t+coxirEfRIJ4+MujC+fZmUNrF6WrkVRy
 jdOXGrXaareZWfxfd11atvn/E8DvpDUm99mHgdv+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EkHUMja4mtC5QRvPK0T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV0Qs
 tMYGDEKVCuO2dmYwe6gE7Uwpf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwPwxvA9
 ziZrgwVBDkxGNyez2uAq0uDl/HzxwzYeL84MZ+Bo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0c+O2grTTsE5OPYrd8IoBOTVY8/TI2M24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9A4DNJWfh0B3iM4ldjBO
 RS7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHWoHg3PBLAhzuxyCDAdJ3T3
 7/BIa5A6l5AVcxaIMeeHb9BgdfHOAhhrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+W3oH
 yJkH5LSkX13CbSuChQ7BKZPdTjm21BnX8GpwyGWH8bfSjdb9JYJUKOJm+l4KtY0z8y4VI7gp
 xmAZ6OR83Kn7VWvFOlAQi0LhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:QNS2g63KRC48Pi88Pt/udgqjBJ0kLtp133Aq2lEZdPU1SL37qy
 nKpp536faaslossR0b9uxoQZPwJE80rKQFhbX5Xo3SPzUO2lHIEGgK1+KLqAEIfReOkNK1vp
 0BT0ERMrPN5BdB/KHHCPrTKadY/DD+ytHTuQ4o9QYRcenTAZsQlDuRozzranFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AeDw+oGhb2Wh7EEo6TBnavLAYpzJuTiOa43fgIki?=
 =?us-ascii?q?CMms3c5OUFUTJpP9Hqp87?=
X-Talos-MUID: 9a23:h0P4rAiCZpFCuxOzQEOpc8MpH+to4qL/DRk0voQYh5OrFgxNERK/tWHi
X-IronPort-AV: E=Sophos;i="6.02,149,1688443200"; 
   d="scan'208";a="125509279"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 8/9] x86/amd: Introduce is_zen{1,2}_uarch() predicates
Date: Fri, 15 Sep 2023 16:00:37 +0100
Message-ID: <20230915150038.602577-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915150038.602577-1-andrew.cooper3@citrix.com>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We already have 3 cases using STIBP as a Zen1/2 heuristic, and are about to
introduce a 4th.  Wrap the heuristic into a pair of predictes rather than
opencoding it, and the explaination of the heursitic, at each usage site.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 xen/arch/x86/cpu/amd.c         | 18 ++++--------------
 xen/arch/x86/include/asm/amd.h | 11 +++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index bbf7887f2e1d..4f27187f92ec 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -882,15 +882,13 @@ void amd_set_legacy_ssbd(bool enable)
  * non-branch instructions to be ignored.  It is to be set unilaterally in
  * newer microcode.
  *
- * This chickenbit is something unrelated on Zen1, and Zen1 vs Zen2 isn't a
- * simple model number comparison, so use STIBP as a heuristic to separate the
- * two uarches in Fam17h(AMD)/18h(Hygon).
+ * This chickenbit is something unrelated on Zen1.
  */
 void amd_init_spectral_chicken(void)
 {
 	uint64_t val, chickenbit = 1 << 1;
 
-	if (cpu_has_hypervisor || !boot_cpu_has(X86_FEATURE_AMD_STIBP))
+	if (cpu_has_hypervisor || !is_zen2_uarch())
 		return;
 
 	if (rdmsr_safe(MSR_AMD64_DE_CFG2, val) == 0 && !(val & chickenbit))
@@ -939,11 +937,8 @@ void amd_check_zenbleed(void)
 		 * With the Fam17h check above, most parts getting here are
 		 * Zen1.  They're not affected.  Assume Zen2 ones making it
 		 * here are affected regardless of microcode version.
-		 *
-		 * Zen1 vs Zen2 isn't a simple model number comparison, so use
-		 * STIBP as a heuristic to distinguish.
 		 */
-		if (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
+		if (is_zen1_uarch())
 			return;
 		good_rev = ~0U;
 		break;
@@ -1298,12 +1293,7 @@ static int __init cf_check zen2_c6_errata_check(void)
 	 */
 	s_time_t delta;
 
-	/*
-	 * Zen1 vs Zen2 isn't a simple model number comparison, so use STIBP as
-	 * a heuristic to separate the two uarches in Fam17h.
-	 */
-	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x17 ||
-	    !boot_cpu_has(X86_FEATURE_AMD_STIBP))
+	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x17 || !is_zen2_uarch())
 		return 0;
 
 	/*
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 09ee52dc1c09..d862cb7972a1 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -140,6 +140,17 @@
                        AMD_MODEL_RANGE(0x11, 0x0, 0x0, 0xff, 0xf),	\
                        AMD_MODEL_RANGE(0x12, 0x0, 0x0, 0xff, 0xf))
 
+/*
+ * The Zen1 and Zen2 microarchitectures are implemented by AMD (Fam17h) and
+ * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
+ * as a heuristic that distinguishes the two.
+ *
+ * The caller is required to perform the appropriate vendor/family checks
+ * first.
+ */
+#define is_zen1_uarch() (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
+#define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
+
 struct cpuinfo_x86;
 int cpu_has_amd_erratum(const struct cpuinfo_x86 *, int, ...);
 
-- 
2.30.2


