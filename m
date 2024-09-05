Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F11F96D74E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 13:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791044.1200818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smAmd-0007HP-Gx; Thu, 05 Sep 2024 11:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791044.1200818; Thu, 05 Sep 2024 11:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smAmd-0007F4-DX; Thu, 05 Sep 2024 11:36:15 +0000
Received: by outflank-mailman (input) for mailman id 791044;
 Thu, 05 Sep 2024 11:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smAmc-0007Eu-Ad
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 11:36:14 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d41d9ba-6b7b-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 13:36:12 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c26815e174so738518a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 04:36:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a62038bfesm123802466b.53.2024.09.05.04.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 04:36:11 -0700 (PDT)
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
X-Inumbo-ID: 0d41d9ba-6b7b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725536171; x=1726140971; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqqT6NlIsb5+wgnjVLOlIfpp2ZuuC/SEjsfn4gdI82I=;
        b=Rgbi9Y4KtP9ng3Smv50QomEWFpW+6U99QWDyzhuJt2ogAT4Y9MkOBbuUqwYQ2L2zD8
         WEbkgEj62G/NrDIWSfVvBiF5F26tHX3lpusHmJX7j9odZib4120OU3Ii682nQUcgbrwo
         CUrTVaKw4SFE4wjBzVINyRM926EkcgJF32li4gVbBARllxZAnRktsXzRW3EuNnLVm4Pk
         gIhN9urbymFkKVSJ4mAPSMtM1T6PWlZywSzsR6SfoOOWR082uI/FCHFJEwJefghK5eKd
         mQt2Q+HFQy0JWifqnSaVzZkGNhS7az4AkNHYclBli1XPiA7bWx3UUx6JO2en+R2PaLS8
         ZffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725536171; x=1726140971;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqqT6NlIsb5+wgnjVLOlIfpp2ZuuC/SEjsfn4gdI82I=;
        b=m2SeS8q45n+75UoFEymVL01DGA6E2TRfb7DGvN8IamAgYtUMaoq5Q9d1XGU6+ehfIf
         6lnAjx1/U8mZeABpVMUmY1yYifdzCWLtjL6v+jDnA03p4PeVqDer/w2KDD439qOnkYBy
         9v93veHlrq4SQGhODPSb6DG4FPdi7DDNlBLDSwxwyJClWorTyvE0YE6ZqRG6859bl9pk
         jHDMGK3FD8EF+jyJ78v9K3ckSPkvMCwnl6ZdIFNvZvOkVd8V3MCsLnMhMrJyZ5r6TIkk
         YgTwRdpd+X+kHA/HaVAo1CsSD4DXZnQ1u4dHZpYUU76M2G6vkTThYcGwj4b+I1gukyrR
         Kv4Q==
X-Gm-Message-State: AOJu0Yy8pSbIK5S/fWZNTXnAQzXQjW+lWS/IQm6MBkazlseNXEE56nlY
	qZQtiwx32Ll8519RpRN5cJB9DArsb57ShvREtWdKl+fVgHAqXn3kPdOBkQHlKGeTAdZ2cBimy7s
	=
X-Google-Smtp-Source: AGHT+IFof0kq9Bw5VJtTaRK+P6tv72wJLNHjkxNPz6nxMlClq4uH+tBeJWiPejkaq03UfVP3G8L2Gg==
X-Received: by 2002:a17:907:98b:b0:a88:b90b:bd5e with SMTP id a640c23a62f3a-a89d8723fedmr1322870666b.3.1725536171251;
        Thu, 05 Sep 2024 04:36:11 -0700 (PDT)
Message-ID: <8824b408-b27f-44ed-add1-87282e4d40af@suse.com>
Date: Thu, 5 Sep 2024 13:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Matthew Barnes <matthew.barnes@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] x86/xstate: enable AMX components
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

These being controlled by XCR0, enabling support is relatively
straightforward. Note however that there won't be any use of them until
their dependent ISA extension CPUID flags are exposed, not the least due
to recalculate_xstate() handling the dependencies in kind of a reverse
manner.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Intended to replace part of (and go beyond) "x86/cpufeatures: Add new
cpuid features in SPR to featureset".
---
v4: Add AMX-FP16 and AMX-COMPLEX. Add dependency on LM. Re-base. Split
    off of AMX series.
v3: Add new states to XSTATE_NONLAZY.
v2: New.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -216,6 +216,9 @@ static void recalculate_xstate(struct cp
     if ( p->feat.pku )
         xstates |= X86_XCR0_PKRU;
 
+    if ( p->feat.amx_tile )
+        xstates |= X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA;
+
     /* Subleaf 0 */
     p->xstate.max_size =
         xstate_uncompressed_size(xstates & ~XSTATE_XSAVES_ONLY);
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -35,7 +35,8 @@ extern uint32_t mxcsr_mask;
                         XSTATE_NONLAZY)
 
 #define XSTATE_ALL     (~(1ULL << 63))
-#define XSTATE_NONLAZY (X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU)
+#define XSTATE_NONLAZY (X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU | \
+                        X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA)
 #define XSTATE_LAZY    (XSTATE_ALL & ~XSTATE_NONLAZY)
 #define XSTATE_XSAVES_ONLY         0
 #define XSTATE_COMPACTION_ENABLED  (1ULL << 63)
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -278,8 +278,10 @@ XEN_CPUFEATURE(HYBRID,        9*32+15) /
 XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
 XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
+XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   AMX BFloat16 instruction */
 XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
 XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*   AMX Tile architecture */
+XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*   AMX 8-bit integer instructions */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
@@ -297,6 +299,7 @@ XEN_CPUFEATURE(FZRM,         10*32+10) /
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
+XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
@@ -331,6 +334,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
+XEN_CPUFEATURE(AMX_COMPLEX,        15*32+ 8) /*   AMX Complex Instructions */
 XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32+10) /*A  AVX-VNNI-INT16 Instructions */
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -252,7 +252,7 @@ def crunch_numbers(state):
         # instruction groups which are specified to require XSAVE for state
         # management.
         XSAVE: [XSAVEOPT, XSAVEC, XGETBV1, XSAVES,
-                AVX, MPX, PKU, LWP],
+                AVX, MPX, PKU, AMX_TILE, LWP],
 
         # AVX is taken to mean hardware support for 256bit registers (which in
         # practice depends on the VEX prefix to encode), and the instructions
@@ -274,7 +274,7 @@ def crunch_numbers(state):
         # superpages, PCID and PKU are only available in 4 level paging.
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
-        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL],
+        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.
@@ -338,6 +338,11 @@ def crunch_numbers(state):
 
         # The behaviour described by RRSBA depend on eIBRS being active.
         EIBRS: [RRSBA],
+
+        # AMX-TILE means hardware support for tile registers and general non-
+        # computational instructions.  All further AMX features are built on top
+        # of AMX-TILE.
+        AMX_TILE: [AMX_BF16, AMX_INT8, AMX_FP16, AMX_COMPLEX],
     }
 
     deep_features = tuple(sorted(deps.keys()))

