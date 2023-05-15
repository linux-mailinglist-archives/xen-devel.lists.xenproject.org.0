Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4C2703049
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 16:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534778.832130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZPq-0000Rb-Lx; Mon, 15 May 2023 14:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534778.832130; Mon, 15 May 2023 14:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZPq-0000LD-Gd; Mon, 15 May 2023 14:43:10 +0000
Received: by outflank-mailman (input) for mailman id 534778;
 Mon, 15 May 2023 14:43:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWdz=BE=citrix.com=prvs=492993889=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyZPp-0000CT-3R
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 14:43:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce87b97a-f32e-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 16:43:08 +0200 (CEST)
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
X-Inumbo-ID: ce87b97a-f32e-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684161788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7ExPV3k5UxWmHtT8O4awxl/SNyiFP8/mlp5LymAqznU=;
  b=b3SvCzhH2xJnuVY7xu7SZIO/wpl5VTzFPniz77zXKO0qxYfC51DK6SPp
   5hI+BPyH7bhe4OEQ32vP2yi5SbqG6u2a7rUqYCV/+cj6Pwqu2VZsdBJSn
   rX4j5Zk6JhuNkZ+4YhVcRG7sOkogvzQccUOXLainCjAJdEQVWbNGv2Xtp
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108969384
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:cTwuhawJh2tPRVLJuEV6t+c/xirEfRIJ4+MujC+fZmUNrF6WrkVRz
 2BMCDjTb//YNjakKY0nYIyyoU8PsJTdytNrSQU5qyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPK0T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXpV2
 r82cS8vUk6kucGa3qC7UMJMg+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwNzhfG9
 zmWowwVBDkqBMe+kjWO3kimrfHfhgWjSYIALZ2Ro6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cZfgBHY1IaweW9h78QogzdTsxIMKuc24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9o4DNJWfh0B3iM4ldjBP
 ifuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKl/bpHE/PxHLjzu1+KTJrU3YE
 cbzTCpRJSxCVfQPIMSeHY/xLoPHNghhnDiOFPgXPjys0KaEZW79dIrpxGCmN7hjhIvd+VW9z
 jqqH5fSo/mpeLGkM3a/HE96BQxiEEXX8ris9p0GK7DZc1Y+cIzjYteIqY4cl0Vet/w9vo/1E
 ruVBie0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:HPF36qx/FWb12r6faVwSKrPx/uskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9xYgBHpTnkAsW9qBznhPpICOUqTNWftWrdyQiVxeNZnPLfKlTbckWQmI5gPM
 9bAtBD4bbLfD9HZKjBkWyF+uIbsaK6Ge2T9JTj5kYoaTsvR7Br7g9/BAreOkpqRDNeDZ58MJ
 aH/MJIqxepZHxSN62Adww4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9n22
 nYlA7S4LmlrpiAu23h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtX4hlU63qhkFKnAn6gmxKrP
 D85zMbe+hj4XLYeW+45TH33RP77Too43j+jXeFnHrKu6XCNXgHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5uLPSwphmiOP0DEfeNYo/jFiuLYlGfZsRM0kjTVo+a47bVXHAVUcYa
 FT5MK13ocoTbrVVQGUgoBV+q3RYp0CJGb6fqE8gL3u79F3pgEJ86JK/r1uop5HzuNId6V5
X-Talos-CUID: 9a23:/FHBuGAh2VKbReL6EzJ82w06Q98HTiP68lT8PV24E01JTZTAHA==
X-Talos-MUID: 9a23:NisFiQVVxbrwjjfq/A/cnxA5O8xE2a6FFlAWt80Xu9u9FQUlbg==
X-IronPort-AV: E=Sophos;i="5.99,276,1677560400"; 
   d="scan'208";a="108969384"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max policies
Date: Mon, 15 May 2023 15:42:59 +0100
Message-ID: <20230515144259.1009245-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We already have common and default feature adjustment helpers.  Introduce one
for max featuresets too.

Offer MSR_ARCH_CAPS unconditionally in the max policy, and stop clobbering the
data inherited from the Host policy.  This will be necessary level a VM safely
for migration.  Note: ARCH_CAPS is still max-only for now, so will not be
inhereted by the default policies.

With this done, the special case for dom0 can be shrunk to just resampling the
Host policy (as ARCH_CAPS isn't visible by default yet).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c | 42 ++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index dfd9abd8564c..74266d30b551 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -408,6 +408,25 @@ static void __init calculate_host_policy(void)
     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
 }
 
+static void __init guest_common_max_feature_adjustments(uint32_t *fs)
+{
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    {
+        /*
+         * MSR_ARCH_CAPS is just feature data, and we can offer it to guests
+         * unconditionally, although limit it to Intel systems as it is highly
+         * uarch-specific.
+         *
+         * In particular, the RSBA and RRSBA bits mean "you might migrate to a
+         * system where RSB underflow uses alternative predictors (a.k.a
+         * Retpoline not safe)", so these need to be visible to a guest in all
+         * cases, even when it's only some other server in the pool which
+         * suffers the identified behaviour.
+         */
+        __set_bit(X86_FEATURE_ARCH_CAPS, fs);
+    }
+}
+
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
 {
     /*
@@ -483,6 +502,7 @@ static void __init calculate_pv_max_policy(void)
         __clear_bit(X86_FEATURE_IBRS, fs);
     }
 
+    guest_common_max_feature_adjustments(fs);
     guest_common_feature_adjustments(fs);
 
     sanitise_featureset(fs);
@@ -490,8 +510,6 @@ static void __init calculate_pv_max_policy(void)
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
-
-    p->arch_caps.raw = 0; /* Not supported yet. */
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -598,6 +616,7 @@ static void __init calculate_hvm_max_policy(void)
     if ( !cpu_has_vmx )
         __clear_bit(X86_FEATURE_PKS, fs);
 
+    guest_common_max_feature_adjustments(fs);
     guest_common_feature_adjustments(fs);
 
     sanitise_featureset(fs);
@@ -606,8 +625,6 @@ static void __init calculate_hvm_max_policy(void)
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
     p->platform_info.cpuid_faulting = true;
-
-    p->arch_caps.raw = 0; /* Not supported yet. */
 }
 
 static void __init calculate_hvm_def_policy(void)
@@ -828,7 +845,10 @@ void __init init_dom0_cpuid_policy(struct domain *d)
      * domain policy logic gains a better understanding of MSRs.
      */
     if ( is_hardware_domain(d) && cpu_has_arch_caps )
+    {
         p->feat.arch_caps = true;
+        p->arch_caps.raw = host_cpu_policy.arch_caps.raw;
+    }
 
     /* Apply dom0-cpuid= command line settings, if provided. */
     if ( dom0_cpuid_cmdline )
@@ -858,20 +878,6 @@ void __init init_dom0_cpuid_policy(struct domain *d)
         p->platform_info.cpuid_faulting = false;
 
     recalculate_cpuid_policy(d);
-
-    if ( is_hardware_domain(d) && cpu_has_arch_caps )
-    {
-        uint64_t val;
-
-        rdmsrl(MSR_ARCH_CAPABILITIES, val);
-
-        p->arch_caps.raw = val &
-            (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
-             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_IF_PSCHANGE_MC_NO |
-             ARCH_CAPS_TAA_NO | ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO |
-             ARCH_CAPS_PSDP_NO | ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA |
-             ARCH_CAPS_BHI_NO | ARCH_CAPS_PBRSB_NO);
-    }
 }
 
 static void __init __maybe_unused build_assertions(void)
-- 
2.30.2


