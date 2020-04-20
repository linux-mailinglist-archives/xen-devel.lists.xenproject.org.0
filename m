Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F151B1573
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 21:09:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQbmu-0006f7-BU; Mon, 20 Apr 2020 19:09:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQbms-0006ey-18
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 19:08:58 +0000
X-Inumbo-ID: 61d66fea-833a-11ea-b58d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61d66fea-833a-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 19:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587409737;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J1UdN+Z09vl4PeSBpKdcHD5rJLhydkwGDGHiLZBiFto=;
 b=e5T5KY/uSCa/cUqlgRzpuqKh73kIzlpba8LQjEaBNfyO5V02YzPGQYp5
 Az42CCKoSmO0f/6YXrZPHGl91SeHD4YIuIuD9TpMxbG102/8dGnQ1Pcaw
 7ACJsJrNI8BuD1wJ+XX5aGWry0Mz1WFf30laZi86hcACGqJ8n78fR4YMY I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dIhjNs5TOxqhISzkCO6/P3I8cozFiAXEwDKOoTTuDVYbg8OcSHw7lQ64I73R3pY20uTR7c98kx
 bLw0FlxsT5RKsMMuHCFD+8YZdEhFL6rhAeXC377MotZqEQK4mXPdjEoUcVw4GvCjzKnk9JjIt7
 pTLemi0p/XseFKKdArwvXNH7DGHt1vk81a1hiROyXaxK400KBAhl29+yvxN5pu9LBjH4MnB36Y
 ZOBV3byptgLouM0TqkVprq7n7uFeK4GCdMSNDgX7VMdErWhhWmmpxGxGW7PKiRiUcf3n8uQMy0
 /1Y=
X-SBRS: 2.7
X-MesageID: 15976207
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,407,1580792400"; d="scan'208";a="15976207"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86: Enumeration for Control-flow Enforcement Technology
Date: Mon, 20 Apr 2020 20:08:29 +0100
Message-ID: <20200420190829.17874-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The CET spec has been published and guest kernels are starting to get support.
Introduce the CPUID and MSRs, and fully block the MSRs from guest use.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libxl/libxl_cpuid.c                   | 2 ++
 tools/misc/xen-cpuid.c                      | 3 ++-
 xen/arch/x86/msr.c                          | 6 ++++++
 xen/include/asm-x86/msr-index.h             | 8 ++++++++
 xen/include/public/arch-x86/cpufeatureset.h | 2 ++
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_cpuid.c b/tools/libxl/libxl_cpuid.c
index b4f6fd590d..00262a3f8f 100644
--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -201,6 +201,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"pku",          0x00000007,  0, CPUID_REG_ECX,  3,  1},
         {"ospke",        0x00000007,  0, CPUID_REG_ECX,  4,  1},
         {"avx512-vbmi2", 0x00000007,  0, CPUID_REG_ECX,  6,  1},
+        {"cet-ss",       0x00000007,  0, CPUID_REG_ECX,  7,  1},
         {"gfni",         0x00000007,  0, CPUID_REG_ECX,  8,  1},
         {"vaes",         0x00000007,  0, CPUID_REG_ECX,  9,  1},
         {"vpclmulqdq",   0x00000007,  0, CPUID_REG_ECX, 10,  1},
@@ -213,6 +214,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
         {"avx512-4fmaps",0x00000007,  0, CPUID_REG_EDX,  3,  1},
         {"md-clear",     0x00000007,  0, CPUID_REG_EDX, 10,  1},
+        {"cet-ibt",      0x00000007,  0, CPUID_REG_EDX, 20,  1},
         {"ibrsb",        0x00000007,  0, CPUID_REG_EDX, 26,  1},
         {"stibp",        0x00000007,  0, CPUID_REG_EDX, 27,  1},
         {"l1d-flush",    0x00000007,  0, CPUID_REG_EDX, 28,  1},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 585b530b21..ff36d8cee1 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -123,7 +123,7 @@ static const char *const str_7c0[32] =
     [ 0] = "prefetchwt1",      [ 1] = "avx512_vbmi",
     [ 2] = "umip",             [ 3] = "pku",
     [ 4] = "ospke",            [ 5] = "waitpkg",
-    [ 6] = "avx512_vbmi2",
+    [ 6] = "avx512_vbmi2",     [ 7] = "cet-ss",
     [ 8] = "gfni",             [ 9] = "vaes",
     [10] = "vpclmulqdq",       [11] = "avx512_vnni",
     [12] = "avx512_bitalg",
@@ -163,6 +163,7 @@ static const char *const str_7d0[32] =
     /* 12 */                [13] = "tsx-force-abort",
 
     [18] = "pconfig",
+    [20] = "cet-ibt",
 
     [26] = "ibrsb",         [27] = "stibp",
     [28] = "l1d_flush",     [29] = "arch_caps",
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index b4a1ab0fa6..dcacae58de 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -167,6 +167,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_CORE_CAPABILITIES:
     case MSR_TSX_FORCE_ABORT:
     case MSR_TSX_CTRL:
+    case MSR_U_CET:
+    case MSR_S_CET:
+    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
     case MSR_AMD64_LWP_CFG:
     case MSR_AMD64_LWP_CBADDR:
     case MSR_PPIN_CTL:
@@ -324,6 +327,9 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     case MSR_TEST_CTRL:
     case MSR_TSX_FORCE_ABORT:
     case MSR_TSX_CTRL:
+    case MSR_U_CET:
+    case MSR_S_CET:
+    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
     case MSR_AMD64_LWP_CFG:
     case MSR_AMD64_LWP_CBADDR:
     case MSR_PPIN_CTL:
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index bb4e601445..85c5f20b76 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -66,6 +66,14 @@
 #define  TSX_CTRL_RTM_DISABLE               (_AC(1, ULL) <<  0)
 #define  TSX_CTRL_CPUID_CLEAR               (_AC(1, ULL) <<  1)
 
+#define MSR_U_CET                           0x000006a0
+#define MSR_S_CET                           0x000006a2
+#define MSR_PL0_SSP                         0x000006a4
+#define MSR_PL1_SSP                         0x000006a5
+#define MSR_PL2_SSP                         0x000006a6
+#define MSR_PL3_SSP                         0x000006a7
+#define MSR_INTERRUPT_SSP_TABLE             0x000006a8
+
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
  */
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 295b2b7aa8..c061133282 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -229,6 +229,7 @@ XEN_CPUFEATURE(UMIP,          6*32+ 2) /*S  User Mode Instruction Prevention */
 XEN_CPUFEATURE(PKU,           6*32+ 3) /*H  Protection Keys for Userspace */
 XEN_CPUFEATURE(OSPKE,         6*32+ 4) /*!  OS Protection Keys Enable */
 XEN_CPUFEATURE(AVX512_VBMI2,  6*32+ 6) /*A  Additional AVX-512 Vector Byte Manipulation Instrs */
+XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*   CET - Shadow Stacks */
 XEN_CPUFEATURE(GFNI,          6*32+ 8) /*A  Galois Field Instrs */
 XEN_CPUFEATURE(VAES,          6*32+ 9) /*A  Vector AES Instrs */
 XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multiplication Instrs */
@@ -255,6 +256,7 @@ XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*A  AVX512 Multiply Accumulation Single
 XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
+XEN_CPUFEATURE(CET_IBT,       6*32+20) /*   CET - Indirect Branch Tracking */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
 XEN_CPUFEATURE(ARCH_CAPS,     9*32+29) /*   IA32_ARCH_CAPABILITIES MSR */
-- 
2.11.0


