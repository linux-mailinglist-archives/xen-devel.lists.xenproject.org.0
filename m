Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6EE49E722
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 17:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261604.453117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7LS-0000ZU-5y; Thu, 27 Jan 2022 16:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261604.453117; Thu, 27 Jan 2022 16:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7LS-0000W3-2Y; Thu, 27 Jan 2022 16:09:58 +0000
Received: by outflank-mailman (input) for mailman id 261604;
 Thu, 27 Jan 2022 16:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5DO=SL=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nD7LP-0000Fm-Vu
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 16:09:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ed35694-7f8b-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 17:09:53 +0100 (CET)
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
X-Inumbo-ID: 8ed35694-7f8b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643299793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cqDDNo9XQo+p+6wfnK3QCWiQ2Uhfmwi7vpbD69d9GwM=;
  b=NWzYDmhw8DJAO3UmrNQx8TfhQft1AxMrNyC4gJ7xwpYSyHVoMsXlOIUX
   YQ+5rf1aBEbeSsa6hyRbXnu5C156OWcyEfb8sPkMXeOtXdn79izxruSUG
   GdbNoo5XwJuCN1FvvirrB0FSadbHYpMRwpODP2S6bYvdFt1qltj3zdRuO
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IFj/TZilgoV/a5sUEyNk8b5YQVsqKHEcaT7+kCO5ldO5aEMbOXSAo/P+jfVHduehIgM8iyXhMI
 QWM78daELv5M1mWtT8SY6Sk7/FIuahDQGusy8Va03V9hmJLulUKRQvobphE3Rl0v1MAA+bNegn
 GqFU2DWWOYi7khmc3MmG62G0IxfVjAdBgHjrH7OLb+AhAHKMBUrW4rXkqWjRVuu91so5MEwoLd
 oYtyTh+kRp0ugsZ6ftWbG8jwHEgsMotUKmhRItH/WYi/d2tI6y1Xgsn81N5YPJNBXZ+UbQ18pL
 qfL1r6cdhodIJvVS0GysNFLn
X-SBRS: 5.2
X-MesageID: 62906692
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FEXvoqkfCCFXMZiQ9ie4v5no5gxVIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXDvQa/zYMGSheYgiPYqw9B4H75Tdy9NjTAQ/qC81EyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OxhnoSWbTsvApfJub4kWjxlMmZ/HrITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6yPP
 5RHOGAHgBLoM1piJGlHMM8Fper0nHKvdzBT826KnP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJpP8YiziWxzJbu5ifDP2Ehcx8Gaf854ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HwgbQ4xawZRGp8crVnl
 CJZ8yR5xLtWZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBwzaZ5fJ2KxP
 R67VeZtCHl7ZiXCgUhfONrZNijX5fK4SYSNug78MLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOG8yT50n5gNK2OS7EIZ9YYQDmRr1os8u5TPD9r
 ow32z2ikUsPCYUTo0D/rOYuELz9BSFrXM+t850OKLfrz8gPMDhJNsI9CIgJI+RN95m5XM+Rl
 p1kckMHmlf5m1PdLgCGNiJqZL/1BM4tpnMnJy08e12v3iF7M4qo6a4ecboxfKUmq7M/naIlE
 aFddpXSGOlLRxTG5y8ZMcv3ort9eUn5ngmJJSekPmQyJsYyWwzT99b4VQLz7y1SXDGvvM4zr
 uT4hAPWSJYOXSp4C8PSZK79xl+9pyFFyulzQ1HJMp9Yf0C1qNpmLCn4j/kWJcAQKEqcmmvGh
 ljOWRpB/LvDuY449tXNlJuolYbxHrssBFdeEkna8a2yaXvQ8F28zNISS+2PZz3cCj/5of3we
 eVPwvjgG/Qbh1IW4ZFkGrNmwK9itdvio7hWklZtEHnRNgn5D7phJj+N3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOhaMOhz3fzfUpO0GrtiZ48Y2OXVhWIxTR2jdWK6F4Md99z
 Oos0CLMB9dTVvb+3g66sx1p
IronPort-HdrOrdr: A9a23:Jf/qKKlADTwTNAPb36Gq304BkXjpDfIS3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tQ++xoVJPhfZq+z/9ICOsqTNGftWDd0QPDQe1fBOPZskTd8kbFh4tgPM
 lbAstD4fTLfCBHZZmQ2mKF+qwbruVvWprY/ts2tE0DcT1X
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; 
   d="scan'208";a="62906692"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/cpuid: Disentangle logic for new feature leaves
Date: Thu, 27 Jan 2022 16:09:38 +0000
Message-ID: <20220127160940.19469-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220127160940.19469-1-andrew.cooper3@citrix.com>
References: <20220127160940.19469-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Adding a new feature leaf is a reasonable amount of boilerplate and for the
patch to build, at least one feature from the new leaf needs defining.  This
typically causes two non-trivial changes to be merged together.

First, have gen-cpuid.py write out some extra placeholder defines:

  #define CPUID_BITFIELD_11 bool :1, :1, lfence_dispatch:1, ...
  #define CPUID_BITFIELD_12 uint32_t :32 /* placeholder */
  #define CPUID_BITFIELD_13 uint32_t :32 /* placeholder */
  #define CPUID_BITFIELD_14 uint32_t :32 /* placeholder */
  #define CPUID_BITFIELD_15 uint32_t :32 /* placeholder */

This allows DECL_BITFIELD() to be added to struct cpuid_policy without
requiring a XEN_CPUFEATURE() declared for the leaf.  The choice of 4 is
arbitrary, and allows us to add more than one leaf at a time if necessary.

Second, rework generic_identify() to not use feature leaf names.

The choice of deriving the index from a feature was to avoid mismatches, but
its correctness depends on bugs like c/s 249e0f1d8f20 ("x86/cpuid: Fix
TSXLDTRK definition") not happening.

Switch to using FEATURESET_* just like the policy/featureset helpers.  This
breaks the cognitive complexity of needing to know which leaf a specifically
named feature should reside in, and is shorter to write.  It is also far
easier to identify as correct at a glance, given the correlation with the
CPUID leaf being read.

In addition, tidy up some other bits of generic_identify()
 * Drop leading zeros from leaf numbers.
 * Don't use a locked update for X86_FEATURE_APERFMPERF.
 * Rework extended_cpuid_level calculation to avoid setting it twice.
 * Use "leaf >= $N" consistently so $N matches with the CPUID input.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/common.c | 54 +++++++++++++++++++++++------------------------
 xen/tools/gen-cpuid.py    |  2 ++
 2 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 4a163afbfc7e..c6773c85fd3e 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -379,7 +379,7 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	u32 eax, ebx, ecx, edx, tmp;
 
 	/* Get vendor name */
-	cpuid(0x00000000, &c->cpuid_level, &ebx, &ecx, &edx);
+	cpuid(0, &c->cpuid_level, &ebx, &ecx, &edx);
 	*(u32 *)&c->x86_vendor_id[0] = ebx;
 	*(u32 *)&c->x86_vendor_id[8] = ecx;
 	*(u32 *)&c->x86_vendor_id[4] = edx;
@@ -394,7 +394,7 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	/* Note that the vendor-specific code below might override */
 
 	/* Model and family information. */
-	cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
+	cpuid(1, &eax, &ebx, &ecx, &edx);
 	c->x86 = get_cpu_family(eax, &c->x86_model, &c->x86_mask);
 	c->apicid = phys_pkg_id((ebx >> 24) & 0xFF, 0);
 	c->phys_proc_id = c->apicid;
@@ -404,53 +404,53 @@ static void generic_identify(struct cpuinfo_x86 *c)
 
 	/* c_early_init() may have adjusted cpuid levels/features.  Reread. */
 	c->cpuid_level = cpuid_eax(0);
-	cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
-	c->x86_capability[cpufeat_word(X86_FEATURE_FPU)] = edx;
-	c->x86_capability[cpufeat_word(X86_FEATURE_SSE3)] = ecx;
+	cpuid(1, &eax, &ebx,
+	      &c->x86_capability[FEATURESET_1c],
+	      &c->x86_capability[FEATURESET_1d]);
 
 	if ( cpu_has(c, X86_FEATURE_CLFLUSH) )
 		c->x86_clflush_size = ((ebx >> 8) & 0xff) * 8;
 
 	if ( (c->cpuid_level >= CPUID_PM_LEAF) &&
 	     (cpuid_ecx(CPUID_PM_LEAF) & CPUID6_ECX_APERFMPERF_CAPABILITY) )
-		set_bit(X86_FEATURE_APERFMPERF, c->x86_capability);
+		__set_bit(X86_FEATURE_APERFMPERF, c->x86_capability);
+
+	eax = cpuid_eax(0x80000000);
+	if ((eax >> 16) == 0x8000)
+		c->extended_cpuid_level = eax;
 
 	/* AMD-defined flags: level 0x80000001 */
-	c->extended_cpuid_level = cpuid_eax(0x80000000);
-	if ((c->extended_cpuid_level >> 16) != 0x8000)
-		c->extended_cpuid_level = 0;
-	if (c->extended_cpuid_level > 0x80000000)
+	if (c->extended_cpuid_level >= 0x80000001)
 		cpuid(0x80000001, &tmp, &tmp,
-		      &c->x86_capability[cpufeat_word(X86_FEATURE_LAHF_LM)],
-		      &c->x86_capability[cpufeat_word(X86_FEATURE_SYSCALL)]);
+		      &c->x86_capability[FEATURESET_e1c],
+		      &c->x86_capability[FEATURESET_e1d]);
 
 	if (c->extended_cpuid_level >= 0x80000004)
 		get_model_name(c); /* Default name */
 	if (c->extended_cpuid_level >= 0x80000007)
-		c->x86_capability[cpufeat_word(X86_FEATURE_ITSC)]
-			= cpuid_edx(0x80000007);
+		c->x86_capability[FEATURESET_e7d] = cpuid_edx(0x80000007);
 	if (c->extended_cpuid_level >= 0x80000008)
-		c->x86_capability[cpufeat_word(X86_FEATURE_CLZERO)]
-			= cpuid_ebx(0x80000008);
+		c->x86_capability[FEATURESET_e8b] = cpuid_ebx(0x80000008);
 	if (c->extended_cpuid_level >= 0x80000021)
-		c->x86_capability[cpufeat_word(X86_FEATURE_LFENCE_DISPATCH)]
-			= cpuid_eax(0x80000021);
+		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
 
 	/* Intel-defined flags: level 0x00000007 */
-	if ( c->cpuid_level >= 0x00000007 ) {
-		cpuid_count(0x00000007, 0, &eax,
-			    &c->x86_capability[cpufeat_word(X86_FEATURE_FSGSBASE)],
-			    &c->x86_capability[cpufeat_word(X86_FEATURE_PKU)],
-			    &c->x86_capability[cpufeat_word(X86_FEATURE_AVX512_4VNNIW)]);
-		if (eax > 0)
-			cpuid_count(0x00000007, 1,
-				    &c->x86_capability[cpufeat_word(X86_FEATURE_AVX512_BF16)],
+	if (c->cpuid_level >= 7) {
+		uint32_t max_subleaf;
+
+		cpuid_count(7, 0, &max_subleaf,
+			    &c->x86_capability[FEATURESET_7b0],
+			    &c->x86_capability[FEATURESET_7c0],
+			    &c->x86_capability[FEATURESET_7d0]);
+		if (max_subleaf >= 1)
+			cpuid_count(7, 1,
+				    &c->x86_capability[FEATURESET_7a1],
 				    &tmp, &tmp, &tmp);
 	}
 
 	if (c->cpuid_level >= 0xd)
 		cpuid_count(0xd, 1,
-			    &c->x86_capability[cpufeat_word(X86_FEATURE_XSAVEOPT)],
+			    &c->x86_capability[FEATURESET_Da1],
 			    &tmp, &tmp, &tmp);
 }
 
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index b953648b6572..470cd76d1c52 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -423,6 +423,8 @@ def write_results(state):
 
 """)
 
+    state.bitfields += ["uint32_t :32 /* placeholder */"] * 4
+
     for idx, text in enumerate(state.bitfields):
         state.output.write(
             "#define CPUID_BITFIELD_%d \\\n    %s\n\n"
-- 
2.11.0


