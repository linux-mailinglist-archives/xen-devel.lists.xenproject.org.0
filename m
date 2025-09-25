Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B6AB9ECD4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 12:48:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130375.1469965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1jWh-0006KT-Bi; Thu, 25 Sep 2025 10:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130375.1469965; Thu, 25 Sep 2025 10:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1jWh-0006HK-86; Thu, 25 Sep 2025 10:48:39 +0000
Received: by outflank-mailman (input) for mailman id 1130375;
 Thu, 25 Sep 2025 10:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1jWf-0006HA-8h
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 10:48:37 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f6010d8-99fd-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 12:48:35 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-63486ff378cso2409212a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 03:48:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353efa4696sm141811766b.27.2025.09.25.03.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:48:34 -0700 (PDT)
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
X-Inumbo-ID: 2f6010d8-99fd-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758797314; x=1759402114; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YMihasvWL1RRVVTZNRiWGSCKAq2TFuVC0buNt4sTSJk=;
        b=gaRpYnQlQhV9k6F1PF24h2V7lpGYccSOQaESBr89SVQpGm+OZ72KgydxpYslBP47mL
         Bg2sUqd6rprT5HijsiTeAve8g0glePLRGc/JIXnJX1zpAb7i8g5pz/YdHR8ZxNRjfHx2
         0Z9W2Q/vHtTU8BSkxPMCSimkg3MuPx/f84/d/pP0lY6T3kL6pMRkvffhhPXejnZmbcZY
         aCPmm9ruLeLpLyL4P3nPJT7SSyN6wC8lJ1QUTxbqgGMGh6lwnWKmB+xG7dUmaucqa3Il
         7dsesMizloDZgB5DIRRiJlKRmFh533MR5+L+xPM1NaI6PwLzVToiBQpqIKNf613uf9qE
         XuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797314; x=1759402114;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMihasvWL1RRVVTZNRiWGSCKAq2TFuVC0buNt4sTSJk=;
        b=fHvwYLgPIg2+pbICNUznVKnvCMljNGp6J+k2ayszvt10m1r9IVuspRNzyAyz6XhMnJ
         IfDvPVyFgyv2NfM768gNbdgIVRpiT+p245z5XXIZHzuBCLKia2dQbQ/ISsUovY2Nnufi
         wqGVQSfn+unHsDlIv0Ss+xAf3DOkmmc6cHNmDzyf9sgvgGgfLpw1NdBk+3Of+GryabxJ
         lqTphcRNYihZ+ZKIlGlSmP1WPZlBeAf1/meflZk2BMFZ4fhX5mo+aXc5sn5AYUVj1l+7
         XdKJcP2RtujA14AHmK8yR4dwDhmMGZEVsUlc9bNtlCntK9ODT332VbHBiTxMLxkYosCc
         0WGQ==
X-Gm-Message-State: AOJu0Yz/BgNKFQfHKROYHrUH55R1vfg5++srycGNzvMxUTsDkTeCyGe3
	tXszaVhieeBbl8M87A+zyrvsNgqWx852VV+cOR87TLlZVtbz99o7zmmeaARWK4juDVW3uGLNLCX
	YQNE=
X-Gm-Gg: ASbGnctPMTsbucnfyLnxw2SE/Dol4R1GG7x1l1+DYA3c8zac3QFTYT2iMzDvmMcNwjB
	yvR1nkAp4v7HZu/Cmo+H9yCBSFmFQ+5zJsJ1bVT+PATidglUCIldefphaU5Bi4ElI7mTeGigbO4
	S6tE/nuQcuwiBqthCrKCYEArbvHjz2fKZJO9obe9ZkorOe7FgdgT+1gG0UfrNY3bh4Pqjr+lThp
	OwlK5xvjcvYuvCfzBE3esLKjEvJA/XX68roe7i0M4XTMubBAUIpF1vUth3aaYMIAiIwdNeZaaS2
	nDc0BiTnq98S7r5VuhmAZMBzYahFD3mbpPcwHZ6WyWyks+b4s3W7wrccAe7shrdlexvaIM4GbW7
	VST/QAyxUSvoOiKmlbHvWDk7wC2Eco30ugjwRza6U3Pc+JDDY8QcgnBdejLrjyKTWsLK+VUzSYI
	Xrqs7goFg=
X-Google-Smtp-Source: AGHT+IFnf3sK4qUpnmU9CLGk2EfLfjeEP4XC8KY8xUjfb4U5kfXZjVeQTG+x/9RT8Tp38tpopupCwg==
X-Received: by 2002:a17:907:3f1d:b0:b11:ce93:4388 with SMTP id a640c23a62f3a-b354c63b3aamr252252866b.25.1758797314320;
        Thu, 25 Sep 2025 03:48:34 -0700 (PDT)
Message-ID: <48dcc0e0-2772-49b9-9383-5bf69f922053@suse.com>
Date: Thu, 25 Sep 2025 12:48:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86: guard synthetic feature and bug enumerators
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While adding new enumerators one may overlook the (rare) need to bump
X86_NR_{SYNTH,BUG}. Guard against that happening by adding respective
checking. The use of BUILD_BUG_ON_ZERO(), however, entails a number of
other changes, as the expansion may not appear in the assembly produced.
Furthermore inputs to file-scope asm() are only supported in gcc15 (or
newer).

No difference in generated code (debug info, however, grows quite a bit).

An implication from the changes is that users of the alternatives patching
macros may not use unnamed asm() input operands anymore, as the "injected"
new operands would break numbering expectations.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -70,12 +70,12 @@ extern void alternative_instructions(voi
                     alt_repl_len(n2)) "-" alt_orig_len)
 
 #define ALTINSTR_ENTRY(feature, num)                                    \
-        " .if (" STR(feature & ~ALT_FLAG_NOT) ") >= " STR(NCAPINTS * 32) "\n" \
+        " .if (%c" #feature " & " STR(~ALT_FLAG_NOT) ") >= " STR(NCAPINTS * 32) "\n" \
         " .error \"alternative feature outside of featureset range\"\n" \
         " .endif\n"                                                     \
         " .long .LXEN%=_orig_s - .\n"             /* label           */ \
         " .long " alt_repl_s(num)" - .\n"         /* new instruction */ \
-        " .word " STR(feature) "\n"               /* feature bit     */ \
+        " .word %c" #feature "\n"                 /* feature bit     */ \
         " .byte " alt_orig_len "\n"               /* source len      */ \
         " .byte " alt_repl_len(num) "\n"          /* replacement len */ \
         " .byte " alt_pad_len "\n"                /* padding len     */ \
@@ -127,14 +127,14 @@ extern void alternative_instructions(voi
  */
 #define alternative(oldinstr, newinstr, feature)                        \
     asm_inline volatile (                                               \
-        ALTERNATIVE(oldinstr, newinstr, feature)                        \
-        ::: "memory" )
+        ALTERNATIVE(oldinstr, newinstr, [feat])                         \
+        :: [feat] "i" (feature) : "memory" )
 
 #define alternative_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
     asm_inline volatile (                                               \
-        ALTERNATIVE_2(oldinstr, newinstr1, feature1,                    \
-                      newinstr2, feature2)                              \
-        ::: "memory" )
+        ALTERNATIVE_2(oldinstr, newinstr1, [feat1],                     \
+                      newinstr2, [feat2])                               \
+        ::  [feat1] "i" (feature1), [feat2] "i" (feature2) : "memory" )
 
 /*
  * Alternative inline assembly with input.
@@ -148,14 +148,14 @@ extern void alternative_instructions(voi
  */
 #define alternative_input(oldinstr, newinstr, feature, input...)        \
     asm_inline volatile (                                               \
-        ALTERNATIVE(oldinstr, newinstr, feature)                        \
-        :: input )
+        ALTERNATIVE(oldinstr, newinstr, [feat])                         \
+        :: [feat] "i" (feature), ## input  )
 
 /* Like alternative_input, but with a single output argument */
 #define alternative_io(oldinstr, newinstr, feature, output, input...)   \
     asm_inline volatile (                                               \
-        ALTERNATIVE(oldinstr, newinstr, feature)                        \
-        : output : input )
+        ALTERNATIVE(oldinstr, newinstr, [feat])                         \
+        : output : [feat] "i" (feature), ## input )
 
 /*
  * This is similar to alternative_io. But it has two features and
@@ -168,9 +168,9 @@ extern void alternative_instructions(voi
 #define alternative_io_2(oldinstr, newinstr1, feature1, newinstr2,      \
                          feature2, output, input...)                    \
     asm_inline volatile (                                               \
-        ALTERNATIVE_2(oldinstr, newinstr1, feature1,                    \
-                      newinstr2, feature2)                              \
-        : output : input )
+        ALTERNATIVE_2(oldinstr, newinstr1, [feat1],                     \
+                      newinstr2, [feat2])                               \
+        : output : [feat1] "i" (feature1), [feat2] "i" (feature2), ## input )
 
 /* Use this macro(s) if you need more than one output parameter. */
 #define ASM_OUTPUT2(a...) a
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -6,9 +6,16 @@
 /* Number of capability words covered by the featureset words. */
 #define FSCAPINTS FEATURESET_NR_ENTRIES
 
+#if !defined(__ASSEMBLY__) && __GNUC__ >= 15
+#include <xen/macros.h>
+#define X86_CHECK_FEAT_NR(x, n) BUILD_BUG_ON_ZERO((x) / 32 >= X86_NR_ ## n)
+#else
+#define X86_CHECK_FEAT_NR(x, n) 0
+#endif
+
 /* Synthetic words follow the featureset words. */
 #define X86_NR_SYNTH 2
-#define X86_SYNTH(x) (FSCAPINTS * 32 + (x))
+#define X86_SYNTH(x) (FSCAPINTS * 32 + (x) + X86_CHECK_FEAT_NR(x, SYNTH))
 
 /* Synthetic features */
 XEN_CPUFEATURE(CONSTANT_TSC,      X86_SYNTH( 0)) /* TSC ticks at a constant rate */
@@ -47,7 +54,8 @@ XEN_CPUFEATURE(XEN_REP_MOVSB,     X86_SY
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
-#define X86_BUG(x) ((FSCAPINTS + X86_NR_SYNTH) * 32 + (x))
+#define X86_BUG(x) ((FSCAPINTS + X86_NR_SYNTH) * 32 + (x) + \
+                    X86_CHECK_FEAT_NR(x, BUG))
 
 #define X86_BUG_FPU_PTRS          X86_BUG( 0) /* (F)X{SAVE,RSTOR} doesn't save/restore FOP/FIP/FDP. */
 #define X86_BUG_NULL_SEG          X86_BUG( 1) /* NULL-ing a selector preserves the base and limit. */
--- a/xen/arch/x86/include/asm/cpufeatureset.h
+++ b/xen/arch/x86/include/asm/cpufeatureset.h
@@ -12,8 +12,13 @@ enum {
 };
 #undef XEN_CPUFEATURE
 
+#if __GNUC__ >= 15
+#define XEN_CPUFEATURE(name, value) asm (".equ X86_FEATURE_" #name ", %c0" \
+                                         :: "i" (X86_FEATURE_##name));
+#else
 #define XEN_CPUFEATURE(name, value) asm (".equ X86_FEATURE_" #name ", " \
                                          __stringify(value));
+#endif
 #include <public/arch-x86/cpufeatureset.h>
 #include <asm/cpufeatures.h>
 
--- a/xen/arch/x86/include/asm/pdx.h
+++ b/xen/arch/x86/include/asm/pdx.h
@@ -13,9 +13,9 @@
     asm_inline goto (                               \
         ALTERNATIVE(                                \
             "",                                     \
-            "jmp %l0",                              \
-            ALT_NOT(X86_FEATURE_PDX_COMPRESSION))   \
-        : : : : label )
+            "jmp %l1",                              \
+            [feat])                                 \
+        : : [feat] "i" (ALT_NOT(X86_FEATURE_PDX_COMPRESSION)) : : label )
 
 static inline unsigned long pfn_to_pdx(unsigned long pfn)
 {
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -73,7 +73,7 @@ static always_inline void spec_ctrl_new_
 
     /* (ab)use alternative_input() to specify clobbers. */
     alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
-                      : "rax", "rcx");
+                      "i" (0) : "rax", "rcx");
 }
 
 extern int8_t opt_ibpb_ctxt_switch;
@@ -163,7 +163,7 @@ static always_inline void __spec_ctrl_en
      * (ab)use alternative_input() to specify clobbers.
      */
     alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_FEATURE_SC_RSB_IDLE,
-                      : "rax", "rcx");
+                      "i" (0) : "rax", "rcx");
 }
 
 /* WARNING! `ret`, `call *`, `jmp *` not safe after this call. */
--- a/xen/arch/x86/include/asm/tsc.h
+++ b/xen/arch/x86/include/asm/tsc.h
@@ -29,8 +29,7 @@ static inline uint64_t rdtsc_ordered(voi
     alternative_io_2("lfence; rdtsc",
                      "mfence; rdtsc", X86_FEATURE_MFENCE_RDTSC,
                      "rdtscp",        X86_FEATURE_RDTSCP,
-                     ASM_OUTPUT2("=a" (low), "=d" (high), "=c" (aux)),
-                     /* no inputs */);
+                     ASM_OUTPUT2("=a" (low), "=d" (high), "=c" (aux)));
 
     return (high << 32) | low;
 }


