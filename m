Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A1F9FF711
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 09:46:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863735.1275143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpx-0005wi-P4; Thu, 02 Jan 2025 08:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863735.1275143; Thu, 02 Jan 2025 08:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpx-0005pv-EH; Thu, 02 Jan 2025 08:45:49 +0000
Received: by outflank-mailman (input) for mailman id 863735;
 Thu, 02 Jan 2025 08:45:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oHwR=T2=bounce.vates.tech=bounce-md_30504962.67765234.v1-82f3a02c5edd4500b772e324054fe213@srs-se1.protection.inumbo.net>)
 id 1tTGpv-0004rS-Th
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 08:45:47 +0000
Received: from mail180-50.suw31.mandrillapp.com
 (mail180-50.suw31.mandrillapp.com [198.2.180.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f48e5d1a-c8e5-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 09:45:44 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-50.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4YP0fD3qg1zCfD7NJ
 for <xen-devel@lists.xenproject.org>; Thu,  2 Jan 2025 08:45:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 82f3a02c5edd4500b772e324054fe213; Thu, 02 Jan 2025 08:45:40 +0000
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
X-Inumbo-ID: f48e5d1a-c8e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1735807540; x=1736068040;
	bh=lteVOQO/826dQJiMQ3UsqhNPnk1VKMnXNeukA1WaOSo=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=A6bso6XOHwrewVbQ+GskSObYNPGIX1Z4vhv/ffgdUazMyxQSZsEEaPk0tuSGHrq/F
	 KYgQCzfwX0m5g/4AVJehlT1kJzGpXcUgETl0kHVv8aK1NpKDtShWDszEtWijRe+zhV
	 cxKDotiNCCNYhL3hCpGErxUnTkGhBQs05o0SmRlNIQpHr2AsrjP984+UZyIJoGBUpH
	 OMlT1szBwBRh4qM/VTzbHtG0B/ZEMCNUHKfo5dwdDFMSrxvtDDlQKIE/JNI386Y/E1
	 KJj/SXclW1/ha0rF9iIiQ+2V4tHqTxkU2c2XAoFEVl+/bucBAnFeacesc+Bai+6asa
	 W8WNAuglkrvOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1735807540; x=1736068040; i=ngoc-tu.dinh@vates.tech;
	bh=lteVOQO/826dQJiMQ3UsqhNPnk1VKMnXNeukA1WaOSo=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=UfzJS6fJ8E+WavFGOSGkBzZTURV4Gl+aOiYx+VuffqxzhyZWj3xr5tQAgiogajDYK
	 LuY4Us1eph/9dB0X8QxdP7KYNI+SqK5sXjzGPsH2XGjnN5j7cPb+fKjdFZhd9n0C8f
	 ZW0MyY0IP82iB+Z6lgdGg5J73x1Q5+SYD0PhNpnFBNeR4nj0KI089j6o8nSidVLkqN
	 WBJ+gyyL6n8i+mBxN1CRErFBE0wkFa/cpshmwfcEH7m8Ee0H/rFbKBeHcm8VrGk+WV
	 4TIzgUQcVJIEZiPNa6p19D9v2hNmiC4KzrFPa0xNfp+BCTO65QjEITQbBXmYsK4+JJ
	 onHUjurDqe5Kw==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=2004/10]=20x86:=20Calculate=20arch=20LBR=20CPUID=20policies?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1735807539667
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20250102084413.102-5-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.82f3a02c5edd4500b772e324054fe213?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250102:md
Date: Thu, 02 Jan 2025 08:45:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Ensure that the arch LBR feature and its dependents are disabled if any
prerequisites are not available.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/cpu-policy.c | 28 ++++++++++++++++++++++++++++
 xen/arch/x86/cpu/common.c |  7 +++++++
 2 files changed, 35 insertions(+)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 78bc9872b0..b1398b2e3c 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -190,6 +190,16 @@ static void sanitise_featureset(uint32_t *fs)
     }
 }
 
+static void recalculate_arch_lbr(struct cpu_policy *p)
+{
+    if ( p->basic.max_leaf < 0x1c ||
+         !(cpu_policy_xstates(&host_cpu_policy) & X86_XSS_LBR) ||
+         p->basic.lbr_1Ca.supported_depths == 0)
+        p->feat.arch_lbr = 0;
+    if ( !p->feat.arch_lbr )
+        p->basic.raw[0x1c] = EMPTY_LEAF;
+}
+
 static void recalculate_xstate(struct cpu_policy *p)
 {
     uint64_t xstates = XSTATE_FP_SSE;
@@ -219,6 +229,9 @@ static void recalculate_xstate(struct cpu_policy *p)
     if ( p->feat.amx_tile )
         xstates |= X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA;
 
+    if ( p->feat.arch_lbr )
+        xstates |= X86_XSS_LBR;
+
     /* Subleaf 0 */
     p->xstate.max_size =
         xstate_uncompressed_size(xstates & ~XSTATE_XSAVES_ONLY);
@@ -271,6 +284,8 @@ static void recalculate_misc(struct cpu_policy *p)
 
     p->basic.raw[0xc] = EMPTY_LEAF;
 
+    zero_leaves(p->basic.raw, 0xe, 0x1b);
+
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
 
     /* Most of Power/RAS hidden from guests. */
@@ -630,6 +645,7 @@ static void __init calculate_pv_max_policy(void)
 
     sanitise_featureset(fs);
     x86_cpu_featureset_to_policy(fs, p);
+    recalculate_arch_lbr(p);
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
@@ -670,6 +686,7 @@ static void __init calculate_pv_def_policy(void)
     }
 
     x86_cpu_featureset_to_policy(fs, p);
+    recalculate_arch_lbr(p);
     recalculate_xstate(p);
 }
 
@@ -755,6 +772,14 @@ static void __init calculate_hvm_max_policy(void)
 
         if ( !cpu_has_vmx_xsaves )
             __clear_bit(X86_FEATURE_XSAVES, fs);
+
+        /*
+         * VMX bitmap is needed for passing through LBR info MSRs.
+         * Require it for virtual arch LBR.
+         */
+        if ( !cpu_has_vmx_guest_lbr_ctl || !cpu_has_vmx_msr_bitmap ||
+             !cpu_has_vmx_xsaves )
+            __clear_bit(X86_FEATURE_ARCH_LBR, fs);
     }
 
     /*
@@ -787,6 +812,7 @@ static void __init calculate_hvm_max_policy(void)
 
     sanitise_featureset(fs);
     x86_cpu_featureset_to_policy(fs, p);
+    recalculate_arch_lbr(p);
     recalculate_xstate(p);
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
@@ -839,6 +865,7 @@ static void __init calculate_hvm_def_policy(void)
     }
 
     x86_cpu_featureset_to_policy(fs, p);
+    recalculate_arch_lbr(p);
     recalculate_xstate(p);
 }
 
@@ -971,6 +998,7 @@ void recalculate_cpuid_policy(struct domain *d)
 
     p->extd.maxlinaddr = p->extd.lm ? 48 : 32;
 
+    recalculate_arch_lbr(p);
     recalculate_xstate(p);
     recalculate_misc(p);
 
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 067d855bad..0056b55457 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -505,6 +505,13 @@ static void generic_identify(struct cpuinfo_x86 *c)
 			    &c->x86_capability[FEATURESET_Da1],
 			    &tmp, &tmp, &tmp);
 
+	if (c->cpuid_level >= 0x1c)
+		cpuid(0x1c,
+		      &c->x86_capability[FEATURESET_1Ca],
+		      &c->x86_capability[FEATURESET_1Cb],
+		      &c->x86_capability[FEATURESET_1Cc],
+		      &tmp);
+
 	if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
 		rdmsr(MSR_ARCH_CAPABILITIES,
 		      c->x86_capability[FEATURESET_m10Al],
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

