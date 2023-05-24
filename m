Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AEB70F531
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 13:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538970.839429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcl-0007QW-M2; Wed, 24 May 2023 11:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538970.839429; Wed, 24 May 2023 11:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcl-0007Ny-IS; Wed, 24 May 2023 11:25:47 +0000
Received: by outflank-mailman (input) for mailman id 538970;
 Wed, 24 May 2023 11:25:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1mck-0006nQ-3u
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 11:25:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9607717-fa25-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 13:25:45 +0200 (CEST)
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
X-Inumbo-ID: b9607717-fa25-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684927544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GLjlEWjBPEDl+W06sqlUB6iIlh53o/yxuzce6ss5CB0=;
  b=Qi+5BXGND01m6HTjC3X8D6gegEGs66jAiIWtUfSqLNU5xepQ2M7q1/oC
   +6Zf0/5C67BqpEkHzLIsv3/4F+WUZgkjwEq1pAltj5fLMwwFmwBMWILBI
   1rOW3pv3H5NkUr7B7XTzMKxS/xNqT9KfqavyzaNNxqHy/nmtOM4vvPbuM
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110226277
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:TvcuLaDjCBcjSBVW/yHjw5YqxClBgxIJ4kV8jS/XYbTApDMg0mAGz
 mAfWW6HPfqKMDejctogad/n8xsEvJ7dydQyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G5C4gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIww7tJRj1nx
 8chLh8wSA6fhd+E2fG/Vbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XSH58LxBnHz
 o7A10TjOANBG8Gt8gCq2COBrOaMwgb8XKtHQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmPwKfJ5weSBkAfUyVMLtchsacLqScCj
 wHT2YmzXHo27ePTECjGnluJkd+sERFIEyheTB0/dA0q3v/9vIMOvAuMSsk2RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRz3oxZPnqgKulmSwXuF1e5aEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQMsQhKlHXoHowNBT4M4XRfK8EyPtXB
 HtmWZz0USZy5VpPl1JauNvxIZd0n3tjlAs/tLjwzgi90Kr2WUN5vYwtaQPUBshgtfPsnekg2
 4oHXyd840kFAbKWj+i+2dJ7EG3m2lBkWMmp8pULJ7Hrz8gPMDhJNsI9CIgJI+RN95m5XM+Rl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:e5orrazYnQeFjQXbdo0XKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: 9a23:K7xl32M4NjuJLO5DYXRZsxI9KPscdFLg6mnMIXKKECVtV+jA
X-Talos-MUID: 9a23:QRZiswSiWR5vjkV6RXTMngtwb+h10Z+UJ2pcvL8P+JahMihZbmI=
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="110226277"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 05/10] x86/boot: Record MSR_ARCH_CAPS for the Raw and Host CPU policy
Date: Wed, 24 May 2023 12:25:21 +0100
Message-ID: <20230524112526.3475200-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Extend x86_cpu_policy_fill_native() with a read of ARCH_CAPS based on the
CPUID information just read, removing the specially handling in
calculate_raw_cpu_policy().

Right now, the only use of x86_cpu_policy_fill_native() outside of Xen is the
unit tests.  Getting MSR data in this context is left to whomever first
encounters a genuine need to have it.

Extend generic_identify() to read ARCH_CAPS into x86_capability[], which is
fed into the Host Policy.  This in turn means there's no need to special case
arch_caps in calculate_host_policy().

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Extend commit message to discuss the absence of MSRs outside of __XEN__
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
index 9bbb385db42d..f1084bb1ed36 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -477,6 +477,11 @@ static void generic_identify(struct cpuinfo_x86 *c)
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
index e795ce375032..07e550191448 100644
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


