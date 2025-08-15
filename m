Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4BCB28742
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083895.1443424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1F1-0007v1-Uo; Fri, 15 Aug 2025 20:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083895.1443424; Fri, 15 Aug 2025 20:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1F1-0007nf-BB; Fri, 15 Aug 2025 20:41:35 +0000
Received: by outflank-mailman (input) for mailman id 1083895;
 Fri, 15 Aug 2025 20:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Ex-0005E7-RV
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:31 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39b96662-7a18-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 22:41:31 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45a1b0becf5so11026065e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:31 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:30 -0700 (PDT)
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
X-Inumbo-ID: 39b96662-7a18-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290491; x=1755895291; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Blw/OgqEV6s8KO1QT2Lc7w+OV2g1Z3TtGNPo19pd+aY=;
        b=Vb0k2LzJLNqlyyhFFtf8ltlj79iTEKH0KXsyAiWQs0mQOHb+Ox1DsXIwyNHEv1NOLR
         A+8PeCfHK+uswArl6wra17YuLxNyUdSAr0voVpBVn0C+AEyzP0H580CPqD1Ync9/9M7g
         OPsl6ssXPhiNAN2FqczmKHKUFlktv/3cIl8kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290491; x=1755895291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Blw/OgqEV6s8KO1QT2Lc7w+OV2g1Z3TtGNPo19pd+aY=;
        b=daltgyzlzR6fgMGQCllaxFTAIWWaiK9FHBCqk8WH3cLRDdLOD0KHeCJVQ1WSL07ZUx
         Jj5HZ+Ey5Ewqzs6juc0R3w4Dp4rL9pV1upP1HtTqx8e8JJCDxxmj+lVRnuqnCOV6PoQi
         LYGBv6O1c3xHAKvwQ5CCu+dyCn9C3zFa1Htag3cgaotHTJJwjhSWp1iiE6A99ntYtaX5
         72cBF6R2MQ6vkkCLF8NhfwWHFvuVWggHUWdTv7fh24vrNQ0+gFTqMFGeNeRBvM2eSNCG
         KthMdioq0IyYySOYBfSqX4RQUsZKvO8bX+mBBOUIv1KzymYnGIwFVBRkeyju3eFPAGCx
         tCSg==
X-Gm-Message-State: AOJu0Yx5do7LnvrE4TewkhvlVoPu9fonnNJEWUNawVPUjdYK7YJly/Zm
	DgG30JJ2ZV7l6i6ctg2TRCoJwC/jeOhwyyGIG1a2VMf1Ontq/RGi6UQdsxL7YWnqVWbzoz39jVi
	YNtmv
X-Gm-Gg: ASbGncvrdFKkSXnmcgLGC8QCwv8qBSLWbAso+uT8EHbZLya0yTbjSwMOrbXOSks9v5m
	UgO9OuHkedKk9MwgrpsgPFTtspTNYsgZuibA48imBrT8cTfhnSk9qxxXbQoXHIH2keMuguSFGoG
	8HKVNWDI//d/ArRWRho2SDoMwY0d2535j6ijvrzcK6dcsbXSVhpO0AQetTGrWjgHpJZNECUtgEH
	GMducyH8rXIOoEEUYeYH68mr+GRvtReNgDQbps2yDciR4HQ/mD+InEnKZ8IsUvm3FkeA8DAApIG
	IfSl+MVy6xfWHqYYhaCAap8PXPwVS6ub9YEyduCqYWLP7oc1YgEKZ2WAxvn2k87P+PzWGO6PQw8
	Ozig/hnZwhVaEgaB2X8D07qK4YKbjkRMdRAAoibqSNtdTLS2UFHtyCBegtEdOPFVf+1Zw3tRhpn
	gI
X-Google-Smtp-Source: AGHT+IEZ6wVEsLUR/pwMbyTNhLupnt76Uj/H6B8RQmZijH++982FmR/W9Us83m9j3vRuXU+XgWQsmw==
X-Received: by 2002:a05:600c:354b:b0:456:eb9:5236 with SMTP id 5b1f17b1804b1-45a21808b2bmr34021885e9.15.1755290490541;
        Fri, 15 Aug 2025 13:41:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 13/16] x86/msr: Use MSR_IMM when available
Date: Fri, 15 Aug 2025 21:41:14 +0100
Message-Id: <20250815204117.3312742-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most MSR accesses have compile time constant indexes.  By using the immediate
form when available, the decoder can start issuing uops directly for the
relevant MSR, rather than having to issue uops to implement "switch (%ecx)".
Modern CPUs have tens of thousands of MSRs, so that's quite an if/else chain.

Create __{rdmsr,wrmsrns}_imm() helpers and use them from {rdmsr,wrmsrns}()
when the compiler can determine that the msr index is known at compile time.

At the instruction level, the combined ABI is awkward.  Explain our choices in
detail.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

The expression wrmsrns(MSR_STAR, rdmsr(MSR_STAR)) now yields:

  <test_star>:
      b9 81 00 00 c0          mov    $0xc0000081,%ecx
      0f 32                   rdmsr
      48 c1 e2 20             shl    $0x20,%rdx
      48 09 d0                or     %rdx,%rax
      48 89 c2                mov    %rax,%rdx
      48 c1 ea 20             shr    $0x20,%rdx
      2e 0f 30                cs wrmsr
      e9 a3 84 e8 ff          jmp    ffff82d040204260 <__x86_return_thunk>

which is as good as we can manage.  The alternative form of this looks like:

  <test_star>:
      b9 81 00 00 c0          mov    $0xc0000081,%ecx
      c4 e7 7b f6 c0 81 00    rdmsr  $0xc0000081,%rax
      00 c0
      2e c4 e7 7a f6 c0 81    cs wrmsrns %rax,$0xc0000081
      00 00 c0
      e9 xx xx xx xx          jmp    ffff82d040204260 <__x86_return_thunk>

Still TBD.  We ought to update the *_safe() forms too.  rdmsr_safe() is easier
because the potential #GP locations line up, but there need to be two variants
because of

v2:
 * Let the compiler do %ecx setup
 * Add RDMSR $imm too
---
 xen/arch/x86/include/asm/alternative.h      |  7 ++
 xen/arch/x86/include/asm/msr.h              | 86 ++++++++++++++++++++-
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 3 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 0482bbf7cbf1..fe87b15ec72c 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -151,6 +151,13 @@ extern void alternative_instructions(void);
         ALTERNATIVE(oldinstr, newinstr, feature)                        \
         :: input )
 
+#define alternative_input_2(oldinstr, newinstr1, feature1,              \
+                            newinstr2, feature2, input...)              \
+    asm_inline volatile (                                               \
+        ALTERNATIVE_2(oldinstr, newinstr1, feature1,                    \
+                      newinstr2, feature2)                              \
+        :: input )
+
 /* Like alternative_input, but with a single output argument */
 #define alternative_io(oldinstr, newinstr, feature, output, input...)   \
     asm_inline volatile (                                               \
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 1bd27b989a4d..2ceff6cca8bb 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -29,10 +29,52 @@
  *  wrmsrl(MSR_FOO, val);
  */
 
-static inline uint64_t rdmsr(unsigned int msr)
+/*
+ * RDMSR with a compile-time constant index, when available.  Falls back to
+ * plain RDMSR.
+ */
+static always_inline uint64_t __rdmsr_imm(uint32_t msr)
+{
+    uint64_t val;
+
+    /*
+     * For best performance, RDMSR $msr, %r64 is recommended.  For
+     * compatibility, we need to fall back to plain RDMSR.
+     *
+     * The combined ABI is awkward, because RDMSR $imm produces an r64,
+     * whereas WRMSR{,NS} produces a split edx:eax pair.
+     *
+     * Always use RDMSR $imm, %rax, because it has the most in common with the
+     * legacy form.  When MSR_IMM isn't available, emit logic to fold %edx
+     * back into %rax.
+     *
+     * Let the compiler do %ecx setup.  This does mean there's a useless `mov
+     * $imm, %ecx` in the instruction stream in the MSR_IMM case, but it means
+     * the compiler can de-duplicate the setup in the common case of reading
+     * and writing the same MSR.
+     */
+    alternative_io(
+        "rdmsr\n\t"
+        "shl $32, %%rdx\n\t"
+        "or %%rdx, %%rax\n\t",
+
+        /* RDMSR $msr, %rax */
+        ".byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
+
+        "=a" (val),
+
+        [msr] "i" (msr), "c" (msr) : "rdx");
+
+    return val;
+}
+
+static always_inline uint64_t rdmsr(unsigned int msr)
 {
     unsigned long lo, hi;
 
+    if ( __builtin_constant_p(msr) )
+        return __rdmsr_imm(msr);
+
     asm volatile ( "rdmsr"
                    : "=a" (lo), "=d" (hi)
                    : "c" (msr) );
@@ -55,11 +97,51 @@ static inline void wrmsr(unsigned int msr, uint64_t val)
 }
 #define wrmsrl(msr, val) wrmsr(msr, val)
 
+/*
+ * Non-serialising WRMSR with a compile-time constant index, when available.
+ * Falls back to plain WRMSRNS, or to a serialising WRMSR.
+ */
+static always_inline void __wrmsrns_imm(uint32_t msr, uint64_t val)
+{
+    /*
+     * For best performance, WRMSRNS %r64, $msr is recommended.  For
+     * compatibility, we need to fall back to plain WRMSRNS, or to WRMSR.
+     *
+     * The combined ABI is awkward, because WRMSRNS $imm takes a single r64,
+     * whereas WRMSR{,NS} takes a split edx:eax pair.
+     *
+     * Always use WRMSRNS %rax, $imm, because it has the most in common with
+     * the legacy forms.  When MSR_IMM isn't available, emit setup logic for
+     * %edx.
+     *
+     * Let the compiler do %ecx setup.  This does mean there's a useless `mov
+     * $imm, %ecx` in the instruction stream in the MSR_IMM case, but it means
+     * the compiler can de-duplicate the setup in the common case of reading
+     * and writing the same MSR.
+     */
+    alternative_input_2(
+        "mov %%rax, %%rdx\n\t"
+        "shr $32, %%rdx\n\t"
+        ".byte 0x2e; wrmsr",
+
+        /* CS WRMSRNS %rax, $msr */
+        ".byte 0x2e,0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
+
+        "mov %%rax, %%rdx\n\t"
+        "shr $32, %%rdx\n\t"
+        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
+
+        [msr] "i" (msr), "a" (val), "c" (msr) : "rdx");
+}
+
 /* Non-serialising WRMSR, when available.  Falls back to a serialising WRMSR. */
-static inline void wrmsrns(uint32_t msr, uint64_t val)
+static always_inline void wrmsrns(uint32_t msr, uint64_t val)
 {
     uint32_t lo = val, hi = val >> 32;
 
+    if ( __builtin_constant_p(msr) )
+        return __wrmsrns_imm(msr, val);
+
     /*
      * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
      * prefix to avoid a trailing NOP.
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index f7312e0b04e7..990b1d13f301 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -349,6 +349,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
 XEN_CPUFEATURE(UC_LOCK_DIS,        13*32+ 6) /*   UC-lock disable */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
+XEN_CPUFEATURE(MSR_IMM,            14*32+ 5) /*   {RD,WR}MSR $imm32 */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
-- 
2.39.5


