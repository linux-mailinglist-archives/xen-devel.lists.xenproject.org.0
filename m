Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4309D0B37
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 09:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839117.1254940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxRy-0005bX-2P; Mon, 18 Nov 2024 08:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839117.1254940; Mon, 18 Nov 2024 08:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxRx-0005VK-Si; Mon, 18 Nov 2024 08:49:37 +0000
Received: by outflank-mailman (input) for mailman id 839117;
 Mon, 18 Nov 2024 08:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wasq=SN=bounce.vates.tech=bounce-md_30504962.673aff99.v1-b69a6f8cf02f44949a0860350e2ff77a@srs-se1.protection.inumbo.net>)
 id 1tCxRw-0005D3-Nn
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 08:49:36 +0000
Received: from mail136-26.atl41.mandrillapp.com
 (mail136-26.atl41.mandrillapp.com [198.2.136.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 063fdedf-a58a-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 09:49:30 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-26.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XsLsP1tG0zJKF3ZY
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 08:49:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b69a6f8cf02f44949a0860350e2ff77a; Mon, 18 Nov 2024 08:49:29 +0000
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
X-Inumbo-ID: 063fdedf-a58a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNi4yNiIsImhlbG8iOiJtYWlsMTM2LTI2LmF0bDQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjA2M2ZkZWRmLWE1OGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTE5NzcxLjA3NzE4LCJzZW5kZXIiOiJib3VuY2UtbWRfMzA1MDQ5NjIuNjczYWZmOTkudjEtYjY5YTZmOGNmMDJmNDQ5NDlhMDg2MDM1MGUyZmY3N2FAYm91bmNlLnZhdGVzLnRlY2giLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731919769; x=1732180269;
	bh=r0skW4u++Ca1L9bVDD6J0qBy4MGffGcnZfM3V9qqDH4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CUSe+Ir4k3tMdpAj/Dd/Rbeja0nVh2sGHOLkPgH0I6pObb/A2ojIVqpI155JNEJTN
	 mu9kMzEHdWGdxgy7vhEHQdoM8XK0pvqKw/dvWDvmhiB+ke4cmT7cBtwYEBBeG6jL+9
	 hnsQyXfjzwsx1oy2ZpI5Ywx21CKQfYS+JciuVP3DetsCiz6BBlNxOBRsLm+/DoECri
	 rvZgw4bmGQuARrTy5TN3G/PdjMNJs44ljPN20UcIPgtdIbhDGRBFRMWpjyCWrOdkvb
	 cn5Wrno7RFSCYaTrYb6WUrydRvQClvcwctR6Olh7tm1eP2MA+1ovCdsPG3SYtGuc2q
	 mVlvtwq1h7yog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731919769; x=1732180269; i=ngoc-tu.dinh@vates.tech;
	bh=r0skW4u++Ca1L9bVDD6J0qBy4MGffGcnZfM3V9qqDH4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=I1Rjv4A+RIHq82t//DCkW/wl3q9n90J8I02rPWxgjhLlT59UALbxKz9A43kr80FA3
	 Hg0OUCVD9eCSMhwtc0a0MjEHQMfhZG6CQZCPwuYEbEVz7iNljd81OCf6VrQoqzN8LI
	 06Nla8fgKOgO6aLi2vLdjSv1mTyZlidpU0NMM8pPde1sJFFRAVop22d3jFcxX+bTYI
	 maEi5WBjZgjhYYgVv0ig2F9rBy+bQT14gSlSFZH3k1cU51m4zLT1HzzQYwnzCz47f1
	 a0Y/shOW4MrLYai7/Pos21hMaxK8jpmI6xu8fnKzZAi2DEfPSixhRNL2DBb6xcA4wU
	 UWkAPaImYTWfA==
From: ngoc-tu.dinh@vates.tech
Subject: =?utf-8?Q?[PATCH=201/4]=20x86:=20Add=20Intel=20architectural=20LBR=20featureset=20bits?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731919768581
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Message-Id: <20241118084914.22268-2-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b69a6f8cf02f44949a0860350e2ff77a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241118:md
Date: Mon, 18 Nov 2024 08:49:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Tu Dinh <ngoc-tu.dinh@vates.tech>

Expose ARCH_LBR feature to guests.

Extend CPU featureset with 3 words for CPUID leaf 0x1c.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 tools/libs/guest/xg_cpuid_x86.c             |  2 +-
 tools/misc/xen-cpuid.c                      |  3 ++
 xen/arch/x86/cpu-policy.c                   |  3 ++
 xen/arch/x86/cpu/common.c                   |  7 ++++
 xen/include/public/arch-x86/cpufeatureset.h | 28 ++++++++++++++-
 xen/include/xen/lib/x86/cpu-policy.h        | 38 ++++++++++++++++++++-
 xen/lib/x86/cpuid.c                         |  6 ++++
 7 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4453178100..64d9baa538 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -656,7 +656,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
             p->policy.feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
         }
 
-        p->policy.basic.max_leaf = min(p->policy.basic.max_leaf, 0xdu);
+        p->policy.basic.max_leaf = min(p->policy.basic.max_leaf, 0x1cu);
         p->policy.feat.max_subleaf = 0;
         p->policy.extd.max_leaf = min(p->policy.extd.max_leaf, 0x8000001c);
     }
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 4c4593528d..4f0fb0a6ea 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -37,6 +37,9 @@ static const struct {
     { "CPUID 0x00000007:1.edx",     "7d1" },
     { "MSR_ARCH_CAPS.lo",         "m10Al" },
     { "MSR_ARCH_CAPS.hi",         "m10Ah" },
+    { "CPUID 0x0000001c.eax",       "1Ca" },
+    { "CPUID 0x0000001c.ebx",       "1Cb" },
+    { "CPUID 0x0000001c.ecx",       "1Cc" },
 };
 
 #define COL_ALIGN "24"
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 78bc9872b0..cf6b212fb6 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -271,6 +271,8 @@ static void recalculate_misc(struct cpu_policy *p)
 
     p->basic.raw[0xc] = EMPTY_LEAF;
 
+    zero_leaves(p->basic.raw, 0xe, 0x1b);
+
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
 
     /* Most of Power/RAS hidden from guests. */
@@ -303,6 +305,7 @@ static void recalculate_misc(struct cpu_policy *p)
         zero_leaves(p->basic.raw, 0x2, 0x3);
         memset(p->cache.raw, 0, sizeof(p->cache.raw));
         zero_leaves(p->basic.raw, 0x9, 0xa);
+        p->basic.raw[0x1c] = EMPTY_LEAF;
 
         p->extd.vendor_ebx = p->basic.vendor_ebx;
         p->extd.vendor_ecx = p->basic.vendor_ecx;
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 067d855bad..4c8eb188e9 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -505,6 +505,13 @@ static void generic_identify(struct cpuinfo_x86 *c)
 			    &c->x86_capability[FEATURESET_Da1],
 			    &tmp, &tmp, &tmp);
 
+	if (c->cpuid_level >= 0x1c)
+		cpuid(0x1c,
+			  &c->x86_capability[FEATURESET_1Ca],
+			  &c->x86_capability[FEATURESET_1Cb],
+			  &c->x86_capability[FEATURESET_1Cc],
+			  &tmp);
+
 	if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
 		rdmsr(MSR_ARCH_CAPABILITIES,
 		      c->x86_capability[FEATURESET_m10Al],
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 8fa3fb711a..9304856fba 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -284,7 +284,7 @@ XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
 XEN_CPUFEATURE(HYBRID,        9*32+15) /*   Heterogeneous platform */
 XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
 XEN_CPUFEATURE(PCONFIG,       9*32+18) /*   PCONFIG instruction */
-XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
+XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*S  Architectural Last Branch Record */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
 XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   AMX BFloat16 instruction */
 XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
@@ -379,6 +379,32 @@ XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A| Register File(s) cleared by V
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
 
+/* Intel-defined CPU features, CPUID level 0x0000001c.eax, word 18 */
+XEN_CPUFEATURE(LBR_DEPTH_8,        18*32+ 0) /*S  Depth 8 */
+XEN_CPUFEATURE(LBR_DEPTH_16,       18*32+ 1) /*S  Depth 16 */
+XEN_CPUFEATURE(LBR_DEPTH_24,       18*32+ 2) /*S  Depth 24 */
+XEN_CPUFEATURE(LBR_DEPTH_32,       18*32+ 3) /*S  Depth 32 */
+XEN_CPUFEATURE(LBR_DEPTH_40,       18*32+ 4) /*S  Depth 40 */
+XEN_CPUFEATURE(LBR_DEPTH_48,       18*32+ 5) /*S  Depth 48 */
+XEN_CPUFEATURE(LBR_DEPTH_56,       18*32+ 6) /*S  Depth 56 */
+XEN_CPUFEATURE(LBR_DEPTH_64,       18*32+ 7) /*S  Depth 64 */
+XEN_CPUFEATURE(LBR_DCST_RST,       18*32+30) /*S  Deep C-state reset */
+XEN_CPUFEATURE(LBR_LIP,            18*32+31) /*S  IP is linear IP */
+
+/* Intel-defined CPU features, CPUID level 0x0000001c.ebx, word 19 */
+XEN_CPUFEATURE(LBR_CPL_FILTER,      19*32+ 0) /*S  CPL filtering */
+XEN_CPUFEATURE(LBR_BR_FILTER,       19*32+ 1) /*S  Branch filtering */
+XEN_CPUFEATURE(LBR_CALL_STACK_MODE, 19*32+ 2) /*S  Call stack mode */
+
+/* Intel-defined CPU features, CPUID level 0x0000001c.ecx, word 20 */
+XEN_CPUFEATURE(LBR_MISPRED,        20*32+ 0) /*S  Mispredict mode */
+XEN_CPUFEATURE(LBR_TIMED,          20*32+ 1) /*S  Timed mode */
+XEN_CPUFEATURE(LBR_BR_TYPE,        20*32+ 2) /*S  Branch type */
+XEN_CPUFEATURE(LBR_EVT_FMT0,       20*32+16) /*!S Event type format bit 0 */
+XEN_CPUFEATURE(LBR_EVT_FMT1,       20*32+17) /*!S Event type format bit 1 */
+XEN_CPUFEATURE(LBR_EVT_FMT2,       20*32+18) /*!S Event type format bit 2 */
+XEN_CPUFEATURE(LBR_EVT_FMT3,       20*32+19) /*!S Event type format bit 3 */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index f43e1a3b21..afd66b4158 100644
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
@@ -158,6 +161,39 @@ struct cpu_policy
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
+                };
+            };
+            union {
+                uint32_t _1Cb;
+                struct { DECL_BITFIELD(1Cb); };
+            };
+            union {
+                uint32_t _1Cc;
+                struct { DECL_BITFIELD(1Cc); };
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

