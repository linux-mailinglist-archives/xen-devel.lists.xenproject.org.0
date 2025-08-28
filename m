Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76BBB3A36E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099105.1453026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureBB-0003Vh-IE; Thu, 28 Aug 2025 15:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099105.1453026; Thu, 28 Aug 2025 15:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureBB-0003SN-FR; Thu, 28 Aug 2025 15:04:45 +0000
Received: by outflank-mailman (input) for mailman id 1099105;
 Thu, 28 Aug 2025 15:04:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureBA-0003MD-1b
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:04:44 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 540174e8-8420-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:04:43 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso6671005e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:04:43 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:04:20 -0700 (PDT)
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
X-Inumbo-ID: 540174e8-8420-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393482; x=1756998282; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2EVmmjqFS7PYu/ShHATpZ9lvd3vIceWFHS6NTUacMY=;
        b=s/TpVH4pbFVI3DZ9l1uap3T4yBgtYzZ8XvIMJvvm+Wbszs8Z9iTiY0QGO7Z1QfDUop
         5M0UBPsAcNWvTsE7gIw8Zpcsjzqg3vhtrBsHHcVWhMCpa2j2Mbv/96LNL29IbK0CuK+e
         Y6WKHUBqm8oPLIdvSlmOK1M/WAxH28jF/Dme0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393482; x=1756998282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2EVmmjqFS7PYu/ShHATpZ9lvd3vIceWFHS6NTUacMY=;
        b=jVdzgwcfdGQsmm/0OL4zQqESqC5y7s27CL9JeXk83Gmthp4WXcX0WIBcrrQ27PLsAV
         NvYAuSBfPteacgZI5ph/djILOgDL24d1TO8alHERFH8+aieGuPlGvwAqnF8mV+OJ1+ib
         5iGveAxILLP+obp+EosX5snAMrMTw5XhZPdS9s3oiAf9ZhuZ23MN4CeKjmXOwBekxsSq
         iHvBYNKq84Vj0ogsC1QFcG3m3iCSqiEpruSvVBSOJ/eMZW7G8Fvd0tVCq1/8wVaoRgMr
         jEuYcruqRiAaVLERNdS91DaY0Kn86iO6qcLQhhJ98ORLM1jcVIbx95RYUEDCNT5tnXP9
         nsEQ==
X-Gm-Message-State: AOJu0Yx4qyq+SBB8p1yz5WSySTtGh7Psv+SqisR3XARNVOH0CFCVUi1y
	OCWW6ayVquR3ZVNoTGiKHLSz3t2tMfl4rcFDDp0TTg+xwq1gCSI9T8SG+Aav48gW4Z3UDpTtI/i
	5C2d3
X-Gm-Gg: ASbGncslNTLvefhlHpY4GU6t1ViG7A51kmdXrlm7orFktnhkGYgMZU4GZhyPcktTS/p
	E2+sti3K/S7NW3bYMdpVbkoxaRvNpP4UxAmRZMNxYSsO46N95z7pzJDZboCzfddXwLAdluzu+t5
	ZNr3iyXcKMc/NDHv9T6MkQnsagAvuUNWw42LMSncQ6ZZyC4JOVt6d7o/3Dk5PYWEi8kGaWI5nuu
	qPuUS0OpRvGLoWKmZMXLdO9L5VdfxhCAEPU8VaYwkvkk/qRkwLpA1jX7gTDACxHx0L89D4Z0QF4
	geI+2y5qVlOm23S56u6cKtCQkr+4vBikjbaHFXQokUcsoRxM2M0TAA9vxzcPO+tObnPjELM4FG6
	i4XN/QrLFZn0BWj7sLf0NL7bhfArvVaQFFzGflT0OHY3ufV3ZgpJE/KTF+qHPW+7jLsPST04C5h
	o5
X-Google-Smtp-Source: AGHT+IEPs/ZTjczuKDfvvXkzmN25aXndPliXOGIOW9IGVxC+zz1AXw1vRurpUBoJLJcmgAcuN476jw==
X-Received: by 2002:a05:600c:5254:b0:45b:7bba:c7b5 with SMTP id 5b1f17b1804b1-45b7bbacbe5mr16434855e9.28.1756393482338;
        Thu, 28 Aug 2025 08:04:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 01/23] x86: FRED enumerations
Date: Thu, 28 Aug 2025 16:03:47 +0100
Message-Id: <20250828150409.901315-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Of note, CR4.FRED is bit 32 and cannot enabled outside of 64bit mode.

Most supported toolchains don't understand the FRED instructions yet.  ERETU
and ERETS are easy to wrap (they encoded as REPZ/REPNE CLAC), while LKGS is
more complicated and deferred for now.

I have intentionally named the FRED MSRs differently to the spec.  In the
spec, the stack pointer names alias the TSS fields of the same name, despite
very different semantics.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Drop CONFIG_HAS_AS_FRED
---
 xen/arch/x86/include/asm/asm-defns.h        |  8 ++++++++
 xen/arch/x86/include/asm/cpufeature.h       |  3 +++
 xen/arch/x86/include/asm/cpufeatures.h      |  2 +-
 xen/arch/x86/include/asm/msr-index.h        | 11 +++++++++++
 xen/arch/x86/include/asm/x86-defns.h        |  1 +
 xen/include/public/arch-x86/cpufeatureset.h |  3 +++
 6 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/asm/asm-defns.h
index 61a5faf90446..239dc3af096c 100644
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -4,6 +4,14 @@
     .byte 0x0f, 0x01, 0xfc
 .endm
 
+/* binutils >= 2.41 or LLVM >= 19 */
+.macro eretu
+    .byte 0xf3, 0x0f, 0x01, 0xca
+.endm
+.macro erets
+    .byte 0xf2, 0x0f, 0x01, 0xca
+.endm
+
 /*
  * Call a noreturn function.  This could be JMP, but CALL results in a more
  * helpful backtrace.  BUG is to catch functions which do decide to return...
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 441a7ecc494b..b6cf0c8dfc7c 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -246,6 +246,9 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
 #define cpu_has_cmpccxadd       boot_cpu_has(X86_FEATURE_CMPCCXADD)
+#define cpu_has_fred            boot_cpu_has(X86_FEATURE_FRED)
+#define cpu_has_lkgs            boot_cpu_has(X86_FEATURE_LKGS)
+#define cpu_has_nmi_src         boot_cpu_has(X86_FEATURE_NMI_SRC)
 #define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
 
 /* CPUID level 0x80000021.eax */
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 71308d9dafc8..0a98676c1604 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -18,7 +18,7 @@ XEN_CPUFEATURE(ARCH_PERFMON,      X86_SYNTH( 3)) /* Intel Architectural PerfMon
 XEN_CPUFEATURE(TSC_RELIABLE,      X86_SYNTH( 4)) /* TSC is known to be reliable */
 XEN_CPUFEATURE(XTOPOLOGY,         X86_SYNTH( 5)) /* cpu topology enum extensions */
 XEN_CPUFEATURE(CPUID_FAULTING,    X86_SYNTH( 6)) /* cpuid faulting */
-/* Bit 7 unused */
+XEN_CPUFEATURE(XEN_FRED,          X86_SYNTH( 7)) /* Xen uses FRED */
 XEN_CPUFEATURE(APERFMPERF,        X86_SYNTH( 8)) /* APERFMPERF */
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 428d993ee89b..bb48d16f0c6d 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -115,6 +115,17 @@
 #define  MCU_OPT_CTRL_GDS_MIT_DIS           (_AC(1, ULL) <<  4)
 #define  MCU_OPT_CTRL_GDS_MIT_LOCK          (_AC(1, ULL) <<  5)
 
+#define MSR_FRED_RSP_SL0                    0x000001cc
+#define MSR_FRED_RSP_SL1                    0x000001cd
+#define MSR_FRED_RSP_SL2                    0x000001ce
+#define MSR_FRED_RSP_SL3                    0x000001cf
+#define MSR_FRED_STK_LVLS                   0x000001d0
+#define MSR_FRED_SSP_SL0                    MSR_PL0_SSP
+#define MSR_FRED_SSP_SL1                    0x000001d1
+#define MSR_FRED_SSP_SL2                    0x000001d2
+#define MSR_FRED_SSP_SL3                    0x000001d3
+#define MSR_FRED_CONFIG                     0x000001d4
+
 #define MSR_RTIT_OUTPUT_BASE                0x00000560
 #define MSR_RTIT_OUTPUT_MASK                0x00000561
 #define MSR_RTIT_CTL                        0x00000570
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 23579c471f4a..0a0ba83de786 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -75,6 +75,7 @@
 #define X86_CR4_PKE        0x00400000 /* enable PKE */
 #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
 #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
+#define X86_CR4_FRED       (_AC(1, ULL) << 32) /* Fast Return and Event Delivery */
 
 #define X86_CR8_VALID_MASK 0xf
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 990b1d13f301..af69cf3822eb 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -310,7 +310,10 @@ XEN_CPUFEATURE(ARCH_PERF_MON, 10*32+8) /*   Architectural Perfmon */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
+XEN_CPUFEATURE(FRED,         10*32+17) /*   Fast Return and Event Delivery */
+XEN_CPUFEATURE(LKGS,         10*32+18) /*   Load Kernel GS instruction */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
+XEN_CPUFEATURE(NMI_SRC,      10*32+20) /*   NMI-Source Reporting */
 XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 XEN_CPUFEATURE(LAM,          10*32+26) /*   Linear Address Masking */
-- 
2.39.5


