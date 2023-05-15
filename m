Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F64D70304A
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 16:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534779.832149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZQ2-0001AB-1S; Mon, 15 May 2023 14:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534779.832149; Mon, 15 May 2023 14:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZQ1-00016a-Tm; Mon, 15 May 2023 14:43:21 +0000
Received: by outflank-mailman (input) for mailman id 534779;
 Mon, 15 May 2023 14:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWdz=BE=citrix.com=prvs=492993889=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyZQ0-0000CT-TK
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 14:43:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4c22416-f32e-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 16:43:19 +0200 (CEST)
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
X-Inumbo-ID: d4c22416-f32e-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684161799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gxW2n1DVfIuRfs7m6wcVAnKuUcSoIDDOH3lmvyYJ/Bs=;
  b=UkT0JuDlM4RDzTOpNMbkX4eJCBcCiqghNiEZTkr1oFjvy9Accnm95wiC
   u6XUmG+ZNBjucs/pPvs+5kyDVnP9m8EqW+htSvqEJOFvplkV3CoLRrtGL
   ZfND+IOtCLcUTdrkN6K1zQg/u0pCh2saFGExlnpsad9F8/idE9YZPaOMA
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107840892
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+/MxvqxazdqT65HDIKJ6t+c/xirEfRIJ4+MujC+fZmUNrF6WrkUAx
 2MeXm/TbK6DN2HyKd1yOd+28h8G75OBnII1HQI9pSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPK0T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KW9Q/
 /1DNGsWUk+8itOPmZG5erRxme12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwNwRbE/
 jKXpQwVBDlEDfK6zBO400mhvf2UrXj5Rt4bDJiBo6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8wSyUG2wFRT5pc8E9uYk9QjlC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cMeyUFFhde+OW8n4wCt0vsTOY+DbGc24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9o4DNJWfh0B3iM4ldjBP
 ifuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKl/bpHE/PxHLjzu1+KTJrU3YE
 cbzTCpRJSxCVfQPIMSeHY/xLoPHNghhnDiOFPgXPjys0KaEZW79dIrpxGCmN7hjhIvd+VW9z
 jqqH5fSo/mpeLGkM3a/HE96BQxiEEXX8ris9p0GK7DZc1Y+cIzjYteIqY4cl0Vet/w9vo/1E
 ruVBie0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:ofAXFKs+dUl0UkyNAXMTdMSw7skDhtV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5CNB/KHHCAnTKadd/DGEmprY+ts3GR1WPH9Xg6IL1XYJNu6CeHcGIjWvnfACZe
 ChDswsnUvYRV0nKv6VK1MiROb5q9jChPvdEGM7705O0nj3sduwgoSKaCSl4g==
X-Talos-CUID: =?us-ascii?q?9a23=3A/qgE+muIPnPi3f4Y3qDcczSe6IsrbHfcl2uLOHP?=
 =?us-ascii?q?nNmtYceS2S2/N5bxNxp8=3D?=
X-Talos-MUID: 9a23:EVJnxAlBBa+JybIGNocUdno8DelN5o2TKXsAqoddi5KGK3B5IxKk2WE=
X-IronPort-AV: E=Sophos;i="5.99,276,1677560400"; 
   d="scan'208";a="107840892"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/6] x86/boot: Record MSR_ARCH_CAPS for the Raw and Host CPU policy
Date: Mon, 15 May 2023 15:42:58 +0100
Message-ID: <20230515144259.1009245-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Extend x86_cpu_policy_fill_native() with a read of ARCH_CAPS based on the
CPUID information just read, which removes the need handling it specially in
calculate_raw_cpu_policy().

Extend generic_identify() to read ARCH_CAPS into x86_capability[], which is
fed into the Host Policy.  This in turn means there's no need to special case
arch_caps in calculate_host_policy().

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c | 12 ------------
 xen/arch/x86/cpu/common.c |  5 +++++
 xen/lib/x86/cpuid.c       |  7 ++++++-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 49f5465ec445..dfd9abd8564c 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -354,9 +354,6 @@ void calculate_raw_cpu_policy(void)
 
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* Was already added by probe_cpuid_faulting() */
-
-    if ( cpu_has_arch_caps )
-        rdmsrl(MSR_ARCH_CAPABILITIES, p->arch_caps.raw);
 }
 
 static void __init calculate_host_policy(void)
@@ -409,15 +406,6 @@ static void __init calculate_host_policy(void)
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
-
-    /* Temporary, until we have known_features[] for feature bits in MSRs. */
-    p->arch_caps.raw = raw_cpu_policy.arch_caps.raw &
-        (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
-         ARCH_CAPS_SKIP_L1DFL | ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO |
-         ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_TAA_NO |
-         ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO | ARCH_CAPS_PSDP_NO |
-         ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA | ARCH_CAPS_BHI_NO |
-         ARCH_CAPS_PBRSB_NO);
 }
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index edc4db1335eb..a3a341fd7db2 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -474,6 +474,11 @@ static void generic_identify(struct cpuinfo_x86 *c)
 		cpuid_count(0xd, 1,
 			    &c->x86_capability[FEATURESET_Da1],
 			    &tmp, &tmp, &tmp);
+
+	if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
+		rdmsr(MSR_ARCH_CAPABILITIES,
+		      c->x86_capability[FEATURESET_10Al],
+		      c->x86_capability[FEATURESET_10Ah]);
 }
 
 /*
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index a9f31858aeff..dfd377cfb7ef 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -226,7 +226,12 @@ void x86_cpu_policy_fill_native(struct cpu_policy *p)
     p->hv_limit = 0;
     p->hv2_limit = 0;
 
-    /* TODO MSRs */
+#ifdef __XEN__
+    /* TODO MSR_PLATFORM_INFO */
+
+    if ( p->feat.arch_caps )
+        rdmsrl(MSR_ARCH_CAPABILITIES, p->arch_caps.raw);
+#endif
 
     x86_cpu_policy_recalc_synth(p);
 }
-- 
2.30.2


