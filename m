Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CB5B1EF68
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075034.1437590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTco-0000nr-CV; Fri, 08 Aug 2025 20:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075034.1437590; Fri, 08 Aug 2025 20:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcn-0000eT-Er; Fri, 08 Aug 2025 20:23:37 +0000
Received: by outflank-mailman (input) for mailman id 1075034;
 Fri, 08 Aug 2025 20:23:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcj-0005tJ-Bi
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:33 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ca908cc-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:30 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4589b3e3820so26574225e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:30 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:29 -0700 (PDT)
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
X-Inumbo-ID: 8ca908cc-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684610; x=1755289410; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFVhdfvOQDjUoAaTEi0zstvy9aZcNZFPXKOhNL4LWc4=;
        b=ecW0HfCefNtC44XOQAVsPkiuTPIpzzA6LpioQ0O8kyQfKiwMzT3RIO0owGBi4fec0A
         PzufxLDZNaeSeudj/cRHe4MDvHjCol6qaE7z+oYUJYEk5ybEIoOCQfpb2bErTYH4xpI9
         TkDOKetrekXI41cy3wtGz+HuPYke3o1FY2Pe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684610; x=1755289410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFVhdfvOQDjUoAaTEi0zstvy9aZcNZFPXKOhNL4LWc4=;
        b=RK4QLcK321EULbgy2Bdd74l5o+fUXqS5Xd+0Tu5lxG8Z1tG23J8Hrfy36jkbKZ5/dL
         qn4caYEIsTTToj0Zh7gr6chaD2F1LNscZCpwq1rTpmx5pge8tBl6tkuIw78zg6Eo8pZ1
         f/6dF4hRlx9fMeqCqXT9KxhN/tyBFfzY8Cw/5p70+vRe04X7X5XUe9GmMhVF8d5M6Kye
         0ETy3pxe2lZI19s4d1BCAjWlNZdtZcVazAywojPg5Ri2oRVdeqOEJ6ICd+RP2J6JUpvt
         Yneb9A9/vXlE5ax6tZQzF6PNyex+RAmRvpnFNei1uj+16NQBCSQKLe41L7pqjG0BTuaB
         v6Yg==
X-Gm-Message-State: AOJu0Yx8zT41ChgCODrJqyubVpmD7uGOO5t70uQfiubeYvV3RlFexfUF
	pCdX32aP7WwQLHWcbc6SALLBs20sOQTf4252K9xUJhf9aSSvZx93tmoSdYzFLVaw5NbbbeA51jO
	Fz6QJ/s02xw==
X-Gm-Gg: ASbGnctGehCwC2XM4GcF+T3nIbeGI7dY/VmgIarRb4jgl3q63pvcCfNIoytFmH3SOUP
	bp0ENm/52yRVTQpV/mwViNgg7kmYo/PP4ftqDChGJ4vXkKi/pKte6Ueyan72haO/YfMjR1px/o4
	Hl4LuilMS+PFMNIojDGsSZJFa16fSIk0Dx0ktefFEoEL9ydxZQUBN189yhkb2T/n4ra33GEgxj0
	yP+CjejTP94WF9ppsAwUUwKrVWlzVsP5towp0vpTqEtURAzHMMqXQJ8lF/bQBs1ScTtYfU38ImH
	9Og9AxygDCgdjejixdTM2a/sabS9pvZJrvxYSd/YxSnrXIVcDfRwlPV55dSKSF2tf9tThJcR8Y6
	IMF3wJaJrK7ZDebnhKRFm6Lg2s56DEDKewSMn+GwoMEIM7nFaYXJAZwhkJD3SG4AhFWiZdCLUMu
	x6
X-Google-Smtp-Source: AGHT+IErUFYgJYCqo/f1FYTdB8yWmXUcMHWGJQXVcASgvlDey1jG1psADqBZ0NXjta7z31LyFSqxXA==
X-Received: by 2002:a05:600c:34d2:b0:458:caec:a741 with SMTP id 5b1f17b1804b1-459f525bfa8mr34064775e9.24.1754684609878;
        Fri, 08 Aug 2025 13:23:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 13/22] x86: FRED enumerations
Date: Fri,  8 Aug 2025 21:23:05 +0100
Message-Id: <20250808202314.1045968-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
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
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/Kconfig                        |  4 ++++
 xen/arch/x86/include/asm/asm-defns.h        |  9 +++++++++
 xen/arch/x86/include/asm/cpufeature.h       |  3 +++
 xen/arch/x86/include/asm/msr-index.h        | 11 +++++++++++
 xen/arch/x86/include/asm/x86-defns.h        |  1 +
 xen/include/public/arch-x86/cpufeatureset.h |  3 +++
 6 files changed, 31 insertions(+)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index a45ce106e210..90cbad13a7c7 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -57,6 +57,10 @@ config HAS_CC_CET_IBT
 	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654
 	def_bool $(cc-option,-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern) && $(as-instr,endbr64)
 
+config HAS_AS_FRED
+	# binutils >= 2.41 or LLVM >= 19
+	def_bool $(as-instr,eretu;lkgs %ax)
+
 menu "Architecture Features"
 
 source "arch/x86/Kconfig.cpu"
diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/asm/asm-defns.h
index 61a5faf90446..2e5200b94b82 100644
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -4,6 +4,15 @@
     .byte 0x0f, 0x01, 0xfc
 .endm
 
+#ifndef CONFIG_HAS_AS_FRED
+.macro eretu
+    .byte 0xf3, 0x0f, 0x01, 0xca
+.endm
+.macro erets
+    .byte 0xf2, 0x0f, 0x01, 0xca
+.endm
+#endif
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
index 23579c471f4a..513f18b3be4e 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -75,6 +75,7 @@
 #define X86_CR4_PKE        0x00400000 /* enable PKE */
 #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
 #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
+#define X86_CR4_FRED      0x100000000 /* Fast Return and Event Delivery */
 
 #define X86_CR8_VALID_MASK 0xf
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index f7312e0b04e7..9cd778586f10 100644
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


