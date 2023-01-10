Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4F664744
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 18:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474878.736324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH5-0004Ua-Hx; Tue, 10 Jan 2023 17:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474878.736324; Tue, 10 Jan 2023 17:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH5-0004T2-EI; Tue, 10 Jan 2023 17:18:59 +0000
Received: by outflank-mailman (input) for mailman id 474878;
 Tue, 10 Jan 2023 17:18:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFIH3-0003S0-Pt
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 17:18:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc1f739e-910a-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 18:18:55 +0100 (CET)
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
X-Inumbo-ID: dc1f739e-910a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673371135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OplqtOF2TCVepI2xNnGz4FHobV4vVNUxy+l935bIbyE=;
  b=N6+J8k6yv34EOg1DTFfVyosztgSqztT/sVz7NenGSHSyAiebnS15G7Nt
   18xjxRWzaXgQxzqBICXtTxTS/30NvvzrBbnbfFHbHETeQK/v0EgLRGclq
   YVYUl/biioriDNNaAyyP2OZQMO+JwmxcdNggiqGoza2oc4MStePNxPYUt
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91449594
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:POXL86vAUteEsYTc3GrAQvmQR+fnVEVeMUV32f8akzHdYApBsoF/q
 tZmKTuEa/+PZDf9f4wjaoSw8R8D7JPTmNRiGlRrrn8zQStD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoQ5AaHzyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBBsARw+D3s2Nz+yWZ8hpjIc4CPLxI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27J/
 z6arjmoXnn2MvTD6QSq+0i1v9X9gArDaNgrKZGU3Nx11Qj7Kms7V0RNCArTTeOColG6c8JSL
 QoT4CVGhYoY+VGvT9L9dwalu3PCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTQMvQCIa44DMm45toz/uS9wgC4qOlMKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKu1mSx28zaK7onAMFh
 2eN0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZo3o0NR/IgD2wyRJEfUQD1
 XGzK57E4ZEyUPoP8dZLb71Fje9DKt4WmQs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iFy9z
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6SNneJwKtE4wf89eyWh1
 ijVZ3K0AWHX3RXvQThmoFg4AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:YMCwkqysP/VV8RpyfE9PKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="91449594"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/8] x86/prot-key: Enumeration for Protection Key Supervisor
Date: Tue, 10 Jan 2023 17:18:39 +0000
Message-ID: <20230110171845.20542-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230110171845.20542-1-andrew.cooper3@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Protection Key Supervisor works in a very similar way to Protection Key User,
except that instead of a PKRU register used by the {RD,WR}PKRU instructions,
the supervisor protection settings live in MSR_PKRS and is accessed using
normal {RD,WR}MSR instructions.

PKS has the same problematic interactions with PV guests as PKU (more infact,
given the guest kernel's CPL), so we'll only support this for HVM guests for
now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_cpuid.c              | 1 +
 tools/misc/xen-cpuid.c                      | 2 +-
 xen/arch/x86/include/asm/cpufeature.h       | 1 +
 xen/arch/x86/include/asm/msr-index.h        | 2 ++
 xen/arch/x86/include/asm/x86-defns.h        | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 6 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 2aa23225f42c..cbd4e511e8ab 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -211,6 +211,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"avx512-vpopcntdq",0x00000007,0,CPUID_REG_ECX, 14,  1},
         {"rdpid",        0x00000007,  0, CPUID_REG_ECX, 22,  1},
         {"cldemote",     0x00000007,  0, CPUID_REG_ECX, 25,  1},
+        {"pks",          0x00000007,  0, CPUID_REG_ECX, 31,  1},
 
         {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
         {"avx512-4fmaps",0x00000007,  0, CPUID_REG_EDX,  3,  1},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index d5833e9ce879..ea7ff320e0e4 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -134,7 +134,7 @@ static const char *const str_7c0[32] =
     /* 24 */                   [25] = "cldemote",
     /* 26 */                   [27] = "movdiri",
     [28] = "movdir64b",        [29] = "enqcmd",
-    [30] = "sgx-lc",
+    [30] = "sgx-lc",           [31] = "pks",
 };
 
 static const char *const str_e7d[32] =
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 044cfd9f882d..0a301013c3d9 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -121,6 +121,7 @@
 #define cpu_has_movdiri         boot_cpu_has(X86_FEATURE_MOVDIRI)
 #define cpu_has_movdir64b       boot_cpu_has(X86_FEATURE_MOVDIR64B)
 #define cpu_has_enqcmd          boot_cpu_has(X86_FEATURE_ENQCMD)
+#define cpu_has_pks             boot_cpu_has(X86_FEATURE_PKS)
 
 /* CPUID level 0x80000007.edx */
 #define cpu_has_hw_pstate       boot_cpu_has(X86_FEATURE_HW_PSTATE)
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 0a8852f3c246..7615d8087f46 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -148,6 +148,8 @@
 #define MSR_PL3_SSP                         0x000006a7
 #define MSR_INTERRUPT_SSP_TABLE             0x000006a8
 
+#define MSR_PKRS                            0x000006e1
+
 #define MSR_X2APIC_FIRST                    0x00000800
 #define MSR_X2APIC_LAST                     0x000008ff
 
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 42b5f382d438..fe1caba6f819 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -74,6 +74,7 @@
 #define X86_CR4_SMAP       0x00200000 /* enable SMAP */
 #define X86_CR4_PKE        0x00400000 /* enable PKE */
 #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
+#define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
 
 /*
  * XSTATE component flags in XCR0
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 7915f5826f57..ad7e89dd4c40 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -227,6 +227,7 @@ XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
 XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*a  MOVDIRI instruction */
 XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*a  MOVDIR64B instruction */
 XEN_CPUFEATURE(ENQCMD,        6*32+29) /*   ENQCMD{,S} instructions */
+XEN_CPUFEATURE(PKS,           6*32+31) /*   Protection Key for Supervisor */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
 XEN_CPUFEATURE(HW_PSTATE,     7*32+ 7) /*   Hardware Pstates */
-- 
2.11.0


