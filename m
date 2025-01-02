Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94C99FF716
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 09:46:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863734.1275133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpx-0005ly-12; Thu, 02 Jan 2025 08:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863734.1275133; Thu, 02 Jan 2025 08:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpw-0005c9-Pn; Thu, 02 Jan 2025 08:45:48 +0000
Received: by outflank-mailman (input) for mailman id 863734;
 Thu, 02 Jan 2025 08:45:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pG5F=T2=bounce.vates.tech=bounce-md_30504962.67765234.v1-943f3a70b64046b588551a553066481c@srs-se1.protection.inumbo.net>)
 id 1tTGpu-0004rS-TN
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 08:45:46 +0000
Received: from mail180-50.suw31.mandrillapp.com
 (mail180-50.suw31.mandrillapp.com [198.2.180.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f31ee457-c8e5-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 09:45:43 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-50.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4YP0fD0pbvzCf9NcD
 for <xen-devel@lists.xenproject.org>; Thu,  2 Jan 2025 08:45:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 943f3a70b64046b588551a553066481c; Thu, 02 Jan 2025 08:45:40 +0000
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
X-Inumbo-ID: f31ee457-c8e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1735807540; x=1736068040;
	bh=dELO6CDglzR9hmFa5QjoLHtaiu13YDfJwfi0OKMMoQA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oEwTlY8uDgrvRWkS0Z9vdf4fv80hy5wYUCl1bQAtxZCXy+a1QHf/+Vw7ewex8sn5K
	 eUK4EyMLCAQH1cjCUXtH0wJGSGshlpGLnLY57S9VlGn6b981Hvj+1ygavAvbAs8tKm
	 TZgAXisAojhQk4K12Lnumis/aZ1DVZTnfa/5ZH7H7VfqLD+hTQMZI6dFIVDAnQwgwv
	 eQ9CokXO2brU/+Z9Nf5T6X/SBqElPw+EyFw7MAlCbiOeiI5+u67nlQU2lxXg5GD+/u
	 yiI0k2qrpnu44FvhZUsmGJNv/6T/sNQRWSBJ8J6oNrliD6oqnrhFzxtHhzan62Ilys
	 zmaABvDOSWDVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1735807540; x=1736068040; i=ngoc-tu.dinh@vates.tech;
	bh=dELO6CDglzR9hmFa5QjoLHtaiu13YDfJwfi0OKMMoQA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iGqymsuQXVhCzxCuEXFwK58EpGs985GZ3J9HGbTPgDBnKcVcrAO8BnTT+G50b4VpG
	 sBlw1IVDxfuwXMLzfVGCyMPFqvBl5osJzNzX+cA0nS6xt4e2Q2lrJ6vT/GwQyhIyHC
	 62Iax0x43PeL/aG8sCh5EsSV2ygK5lCPMQx3N5j5wn+0qQu0xp6oPgnCtjiIFNitDV
	 z3YQEsZQl0jKlLJdrL2AlvNwCOtk5RtQIixkoF828XmGwi1BCmAtNjPmzfvFs91CND
	 vW3e1HKYEEHaJYvdGIH+XRXIeDCjnQTVtQLJAgzXjgaXqBXgDEccYclf9mSeqD8iHG
	 kHJfqoEnTTFbw==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=2002/10]=20x86:=20Define=20arch=20LBR=20feature=20bits?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1735807539234
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20250102084413.102-3-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.943f3a70b64046b588551a553066481c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250102:md
Date: Thu, 02 Jan 2025 08:45:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Add three featureset words corresponding to the 3 CPUID words in leaf
0x1c.

Intel SDM states that CPUID may indicate a LBR depth of up to 64.
However, since XSAVE LBR state only goes up to 32 LBRs, don't expose the
other CPUID depth bits for now.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/include/asm/cpufeature.h       |  5 ++
 xen/include/public/arch-x86/cpufeatureset.h | 28 ++++++++++-
 xen/include/xen/lib/x86/cpu-policy.h        | 51 ++++++++++++++++++++-
 xen/lib/x86/cpuid.c                         |  6 +++
 4 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 3a06b6f297..4323ffb8cb 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -219,6 +219,11 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_rfds_no         boot_cpu_has(X86_FEATURE_RFDS_NO)
 #define cpu_has_rfds_clear      boot_cpu_has(X86_FEATURE_RFDS_CLEAR)
 
+/* CPUID level 0x0000001c.eax */
+
+#define current_cpu_has_lbr_lip cpu_has(&current_cpu_data, \
+                                        X86_FEATURE_LBR_LIP);
+
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
 #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 8fa3fb711a..86d3e61438 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -284,7 +284,7 @@ XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
 XEN_CPUFEATURE(HYBRID,        9*32+15) /*   Heterogeneous platform */
 XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
 XEN_CPUFEATURE(PCONFIG,       9*32+18) /*   PCONFIG instruction */
-XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
+XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*s  Architectural Last Branch Record */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
 XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   AMX BFloat16 instruction */
 XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
@@ -379,6 +379,32 @@ XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A| Register File(s) cleared by V
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
 
+/* Intel-defined CPU features, CPUID level 0x0000001c.eax, word 18 */
+XEN_CPUFEATURE(LBR_DEPTH_8,        18*32+ 0) /*s  Depth 8 */
+XEN_CPUFEATURE(LBR_DEPTH_16,       18*32+ 1) /*s  Depth 16 */
+XEN_CPUFEATURE(LBR_DEPTH_24,       18*32+ 2) /*s  Depth 24 */
+XEN_CPUFEATURE(LBR_DEPTH_32,       18*32+ 3) /*s  Depth 32 */
+XEN_CPUFEATURE(LBR_DEPTH_40,       18*32+ 4) /*   Depth 40 */
+XEN_CPUFEATURE(LBR_DEPTH_48,       18*32+ 5) /*   Depth 48 */
+XEN_CPUFEATURE(LBR_DEPTH_56,       18*32+ 6) /*   Depth 56 */
+XEN_CPUFEATURE(LBR_DEPTH_64,       18*32+ 7) /*   Depth 64 */
+XEN_CPUFEATURE(LBR_DCST_RST,       18*32+30) /*s  Deep C-state reset */
+XEN_CPUFEATURE(LBR_LIP,            18*32+31) /*!  IP is linear IP */
+
+/* Intel-defined CPU features, CPUID level 0x0000001c.ebx, word 19 */
+XEN_CPUFEATURE(LBR_CPL_FILTER,     19*32+ 0) /*s  CPL filtering */
+XEN_CPUFEATURE(LBR_BR_FILTER,      19*32+ 1) /*s  Branch filtering */
+XEN_CPUFEATURE(LBR_CALL_STACK,     19*32+ 2) /*s  Call stack mode */
+
+/* Intel-defined CPU features, CPUID level 0x0000001c.ecx, word 20 */
+XEN_CPUFEATURE(LBR_MISPRED,        20*32+ 0) /*s  Mispredict mode */
+XEN_CPUFEATURE(LBR_TIMED,          20*32+ 1) /*s  Timed mode */
+XEN_CPUFEATURE(LBR_BR_TYPE,        20*32+ 2) /*s  Branch type */
+XEN_CPUFEATURE(LBR_EVENT_LOG_0,    20*32+16) /*s  Event logging for counter 0 */
+XEN_CPUFEATURE(LBR_EVENT_LOG_1,    20*32+17) /*s  Event logging for counter 1 */
+XEN_CPUFEATURE(LBR_EVENT_LOG_2,    20*32+18) /*s  Event logging for counter 2 */
+XEN_CPUFEATURE(LBR_EVENT_LOG_3,    20*32+19) /*s  Event logging for counter 3 */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index f43e1a3b21..f3b331f36c 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -22,6 +22,9 @@
 #define FEATURESET_7d1       15 /* 0x00000007:1.edx    */
 #define FEATURESET_m10Al     16 /* 0x0000010a.eax      */
 #define FEATURESET_m10Ah     17 /* 0x0000010a.edx      */
+#define FEATURESET_1Ca       18 /* 0x0000001c.eax      */
+#define FEATURESET_1Cb       19 /* 0x0000001c.ebx      */
+#define FEATURESET_1Cc       20 /* 0x0000001c.ecx      */
 
 struct cpuid_leaf
 {
@@ -85,7 +88,7 @@ unsigned int x86_cpuid_lookup_vendor(uint32_t ebx, uint32_t ecx, uint32_t edx);
  */
 const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 
-#define CPUID_GUEST_NR_BASIC      (0xdu + 1)
+#define CPUID_GUEST_NR_BASIC      (0x1cu + 1)
 #define CPUID_GUEST_NR_CACHE      (5u + 1)
 #define CPUID_GUEST_NR_FEAT       (2u + 1)
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
@@ -158,6 +161,52 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0xb - Topology. */
             uint64_t :64, :64; /* Leaf 0xc - rsvd */
             uint64_t :64, :64; /* Leaf 0xd - XSTATE. */
+
+            uint64_t :64, :64; /* Leaf 0xe - rsvd */
+            uint64_t :64, :64; /* Leaf 0xf - rsvd */
+            uint64_t :64, :64; /* Leaf 0x10 - rsvd */
+            uint64_t :64, :64; /* Leaf 0x11 - rsvd */
+            uint64_t :64, :64; /* Leaf 0x12 - rsvd */
+            uint64_t :64, :64; /* Leaf 0x13 - rsvd */
+            uint64_t :64, :64; /* Leaf 0x14 - rsvd */
+            uint64_t :64, :64; /* Leaf 0x15 - rsvd */
+            uint64_t :64, :64; /* Leaf 0x16 - rsvd */
+            uint64_t :64, :64; /* Leaf 0x17 - rsvd */
+            uint64_t :64, :64; /* Leaf 0x18 - rsvd */
+            uint64_t :64, :64; /* Leaf 0x19 - rsvd */
+            uint64_t :64, :64; /* Leaf 0x1a - rsvd */
+            uint64_t :64, :64; /* Leaf 0x1b - rsvd */
+
+            union {
+                uint32_t _1Ca;
+                struct {
+                    uint32_t supported_depths:8;
+                    uint32_t :22;
+                    uint32_t deep_cstate_reset:1;
+                    uint32_t ip_contains_lip:1;
+                } lbr_1Ca;
+            };
+            union {
+                uint32_t _1Cb;
+                struct {
+                    uint32_t cpl_filter:1;
+                    uint32_t br_filter:1;
+                    uint32_t call_stack:1;
+                } lbr_1Cb;
+            };
+            union {
+                uint32_t _1Cc;
+                struct {
+                    uint32_t mispred:1;
+                    uint32_t timed:1;
+                    uint32_t br_type:1;
+                    uint32_t :13;
+                    uint32_t event_log_0:1;
+                    uint32_t event_log_1:1;
+                    uint32_t event_log_2:1;
+                    uint32_t event_log_3:1;
+                } lbr_1Cc;
+            };
         };
     } basic;
 
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index eb7698dc73..4d19349b17 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -81,6 +81,9 @@ void x86_cpu_policy_to_featureset(
     fs[FEATURESET_7d1]       = p->feat._7d1;
     fs[FEATURESET_m10Al]     = p->arch_caps.lo;
     fs[FEATURESET_m10Ah]     = p->arch_caps.hi;
+    fs[FEATURESET_1Ca]       = p->basic._1Ca;
+    fs[FEATURESET_1Cb]       = p->basic._1Cb;
+    fs[FEATURESET_1Cc]       = p->basic._1Cc;
 }
 
 void x86_cpu_featureset_to_policy(
@@ -104,6 +107,9 @@ void x86_cpu_featureset_to_policy(
     p->feat._7d1             = fs[FEATURESET_7d1];
     p->arch_caps.lo          = fs[FEATURESET_m10Al];
     p->arch_caps.hi          = fs[FEATURESET_m10Ah];
+    p->basic._1Ca            = fs[FEATURESET_1Ca];
+    p->basic._1Cb            = fs[FEATURESET_1Cb];
+    p->basic._1Cc            = fs[FEATURESET_1Cc];
 }
 
 void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

