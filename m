Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F990B848
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 19:39:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742540.1149387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKJ-0003uq-W1; Mon, 17 Jun 2024 17:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742540.1149387; Mon, 17 Jun 2024 17:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKJ-0003pT-QD; Mon, 17 Jun 2024 17:39:31 +0000
Received: by outflank-mailman (input) for mailman id 742540;
 Mon, 17 Jun 2024 17:39:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJGKH-00036g-L8
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 17:39:29 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b0748c8-2cd0-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 19:39:27 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6f936d2ba1so36321466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 10:39:27 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da4496sm532010666b.8.2024.06.17.10.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 10:39:25 -0700 (PDT)
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
X-Inumbo-ID: 8b0748c8-2cd0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718645966; x=1719250766; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zhl3ukCaOtB54z1wi1NLzU/jmU9SjtnheNpVm9jxFJQ=;
        b=QDCbE3XBxwBmCDbPdgqBaGh0tGF2vut0nRt3/l35Xh9dsR5M3sS+YoFU3THwsTYaOY
         ghyI6xKoEBvUtoiJqvBV+1Z7HpKSxxz4u4vTcuMH5ZU3ttlXWBMnvY6lNP7W8e6RIY6/
         CIQmBAhF+9LiuYxMkHzTRVrftEMN58dHQ6NEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645966; x=1719250766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zhl3ukCaOtB54z1wi1NLzU/jmU9SjtnheNpVm9jxFJQ=;
        b=Lgltc1MlhFgFx8zdRfCbuD3HJLUB/H8yYE8kE5aQ4MeaozTmSWysgFmAM2qufPycDp
         Cgk4H5Blk2lI14LY1zr7/B16rqsE81WSMlb13sR86msZLEVKUJCk9QyBZ9dcy5cxizVw
         aF+gbfgXuDVEVqSuX32nGIX76MS6+tbViCttXzRigxrKdXjA2u+uIP8AxTlKERwdeSJm
         OHBUT8pvhAprCuFDKUkN8xFJfaZ6UVGnFDzEPJZoLVxAOA4Li+elCSf8R+dukYF1LTvF
         c4BoKAJlw1L1b0SZ4Ovqgo9iMI9OUISHZfKRKULxaoxPm32Oqmn2k3Y8qHgQuxFtt8xe
         4c0Q==
X-Gm-Message-State: AOJu0YypyJkAFOB2xzd+w/fcVEO2whxF8Y9pILQjjGT43fGGwubBhuld
	0V8ozmzAiOftw65WAaBwkMS4rqtxGhlQ3s6ZLLkB8SjoChyUcma6pITaUm135IVZsoAv+yTNGgy
	XnvE=
X-Google-Smtp-Source: AGHT+IE2ePwbkm/Jzh5+1PD5kPs6RXA3hTe5nwJ2ydBXKARDAIfPc8oUxJZ52aObkYo78bSbB9bKjw==
X-Received: by 2002:a17:906:a847:b0:a6f:46f1:5434 with SMTP id a640c23a62f3a-a6f94c047famr24028366b.6.1718645966154;
        Mon, 17 Jun 2024 10:39:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 2/7] x86/xstate: Cross-check dynamic XSTATE sizes at boot
Date: Mon, 17 Jun 2024 18:39:16 +0100
Message-Id: <20240617173921.1755439-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, xstate_ctxt_size() performs a cross-check of size with CPUID in for
every call.  This is expensive, being used for domain create/migrate, as well
as to service certain guest CPUID instructions.

Instead, arrange to check the sizes once at boot.  See the code comments for
details.  Right now, it just checks hardware against the algorithm
expectations.  Later patches will add further cross-checking.

Introduce more X86_XCR0_* and X86_XSS_* constants CPUID bits.  This is to
maximise coverage in the sanity check, even if we don't expect to
use/virtualise some of these features any time soon.  Leave HDC and HWP alone
for now; we don't have CPUID bits from them stored nicely.

Only perform the cross-checks when SELF_TESTS are active.  It's only
developers or new hardware liable to trip these checks, and Xen at least
tracks "maximum value ever seen in xcr0" for the lifetime of the VM, which we
don't want to be tickling in the general case.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v3:
 * New
v4:
 * Rebase over CONFIG_SELF_TESTS
 * Swap one BUG_ON() for a WARN()

On Sapphire Rapids with the whole series inc diagnostics, we get this pattern:

  (XEN) *** check_new_xstate(, 0x00000003)
  (XEN) *** check_new_xstate(, 0x00000004)
  (XEN) *** check_new_xstate(, 0x000000e0)
  (XEN) *** check_new_xstate(, 0x00000200)
  (XEN) *** check_new_xstate(, 0x00060000)
  (XEN) *** check_new_xstate(, 0x00000100)
  (XEN) *** check_new_xstate(, 0x00000400)
  (XEN) *** check_new_xstate(, 0x00000800)
  (XEN) *** check_new_xstate(, 0x00001000)
  (XEN) *** check_new_xstate(, 0x00004000)
  (XEN) *** check_new_xstate(, 0x00008000)

and on Genoa, this pattern:

  (XEN) *** check_new_xstate(, 0x00000003)
  (XEN) *** check_new_xstate(, 0x00000004)
  (XEN) *** check_new_xstate(, 0x000000e0)
  (XEN) *** check_new_xstate(, 0x00000200)
  (XEN) *** check_new_xstate(, 0x00000800)
  (XEN) *** check_new_xstate(, 0x00001000)
---
 xen/arch/x86/include/asm/x86-defns.h        |  25 +++-
 xen/arch/x86/xstate.c                       | 158 ++++++++++++++++++++
 xen/include/public/arch-x86/cpufeatureset.h |   3 +
 3 files changed, 185 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 48d7a3b7af45..d7602ab225c4 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -77,7 +77,7 @@
 #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
 
 /*
- * XSTATE component flags in XCR0
+ * XSTATE component flags in XCR0 | MSR_XSS
  */
 #define X86_XCR0_FP_POS           0
 #define X86_XCR0_FP               (1ULL << X86_XCR0_FP_POS)
@@ -95,11 +95,34 @@
 #define X86_XCR0_ZMM              (1ULL << X86_XCR0_ZMM_POS)
 #define X86_XCR0_HI_ZMM_POS       7
 #define X86_XCR0_HI_ZMM           (1ULL << X86_XCR0_HI_ZMM_POS)
+#define X86_XSS_PROC_TRACE        (_AC(1, ULL) <<  8)
 #define X86_XCR0_PKRU_POS         9
 #define X86_XCR0_PKRU             (1ULL << X86_XCR0_PKRU_POS)
+#define X86_XSS_PASID             (_AC(1, ULL) << 10)
+#define X86_XSS_CET_U             (_AC(1, ULL) << 11)
+#define X86_XSS_CET_S             (_AC(1, ULL) << 12)
+#define X86_XSS_HDC               (_AC(1, ULL) << 13)
+#define X86_XSS_UINTR             (_AC(1, ULL) << 14)
+#define X86_XSS_LBR               (_AC(1, ULL) << 15)
+#define X86_XSS_HWP               (_AC(1, ULL) << 16)
+#define X86_XCR0_TILE_CFG         (_AC(1, ULL) << 17)
+#define X86_XCR0_TILE_DATA        (_AC(1, ULL) << 18)
 #define X86_XCR0_LWP_POS          62
 #define X86_XCR0_LWP              (1ULL << X86_XCR0_LWP_POS)
 
+#define X86_XCR0_STATES                                                 \
+    (X86_XCR0_FP | X86_XCR0_SSE | X86_XCR0_YMM | X86_XCR0_BNDREGS |     \
+     X86_XCR0_BNDCSR | X86_XCR0_OPMASK | X86_XCR0_ZMM |                 \
+     X86_XCR0_HI_ZMM | X86_XCR0_PKRU | X86_XCR0_TILE_CFG |              \
+     X86_XCR0_TILE_DATA |                                               \
+     X86_XCR0_LWP)
+
+#define X86_XSS_STATES                                                  \
+    (X86_XSS_PROC_TRACE | X86_XSS_PASID | X86_XSS_CET_U |               \
+     X86_XSS_CET_S | X86_XSS_HDC | X86_XSS_UINTR | X86_XSS_LBR |        \
+     X86_XSS_HWP |                                                      \
+     0)
+
 /*
  * Debug status flags in DR6.
  *
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 75788147966a..650206d9d2b6 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -604,9 +604,164 @@ static bool valid_xcr0(uint64_t xcr0)
     if ( !(xcr0 & X86_XCR0_BNDREGS) != !(xcr0 & X86_XCR0_BNDCSR) )
         return false;
 
+    /* TILECFG and TILEDATA must be the same. */
+    if ( !(xcr0 & X86_XCR0_TILE_CFG) != !(xcr0 & X86_XCR0_TILE_DATA) )
+        return false;
+
     return true;
 }
 
+struct xcheck_state {
+    uint64_t states;
+    uint32_t uncomp_size;
+    uint32_t comp_size;
+};
+
+static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
+{
+    uint32_t hw_size;
+
+    BUILD_BUG_ON(X86_XCR0_STATES & X86_XSS_STATES);
+
+    BUG_ON(s->states & new); /* States only increase. */
+    BUG_ON(!valid_xcr0(s->states | new)); /* Xen thinks it's a good value. */
+    BUG_ON(new & ~(X86_XCR0_STATES | X86_XSS_STATES)); /* Known state. */
+    BUG_ON((new & X86_XCR0_STATES) &&
+           (new & X86_XSS_STATES)); /* User or supervisor, not both. */
+
+    s->states |= new;
+    if ( new & X86_XCR0_STATES )
+    {
+        if ( !set_xcr0(s->states & X86_XCR0_STATES) )
+            BUG();
+    }
+    else
+        set_msr_xss(s->states & X86_XSS_STATES);
+
+    /*
+     * Check the uncompressed size.  Some XSTATEs are out-of-order and fill in
+     * prior holes in the state area, so we check that the size doesn't
+     * decrease.
+     */
+    hw_size = cpuid_count_ebx(0xd, 0);
+
+    if ( hw_size < s->uncomp_size )
+        panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, uncompressed hw size %#x < prev size %#x\n",
+              s->states, &new, hw_size, s->uncomp_size);
+
+    s->uncomp_size = hw_size;
+
+    /*
+     * Check the compressed size, if available.  All components strictly
+     * appear in index order.  In principle there are no holes, but some
+     * components have their base address 64-byte aligned for efficiency
+     * reasons (e.g. AMX-TILE) and there are other components small enough to
+     * fit in the gap (e.g. PKRU) without increasing the overall length.
+     */
+    hw_size = cpuid_count_ebx(0xd, 1);
+
+    if ( cpu_has_xsavec )
+    {
+        if ( hw_size < s->comp_size )
+            panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, compressed hw size %#x < prev size %#x\n",
+                  s->states, &new, hw_size, s->comp_size);
+
+        s->comp_size = hw_size;
+    }
+    else if ( hw_size ) /* Compressed size reported, but no XSAVEC ? */
+    {
+        static bool once;
+
+        if ( !once )
+        {
+            WARN();
+            once = true;
+        }
+    }
+}
+
+/*
+ * The {un,}compressed XSTATE sizes are reported by dynamic CPUID value, based
+ * on the current %XCR0 and MSR_XSS values.  The exact layout is also feature
+ * and vendor specific.  Cross-check Xen's understanding against real hardware
+ * on boot.
+ *
+ * Testing every combination is prohibitive, so we use a partial approach.
+ * Starting with nothing active, we add new XSTATEs and check that the CPUID
+ * dynamic values never decreases.
+ */
+static void __init noinline xstate_check_sizes(void)
+{
+    uint64_t old_xcr0 = get_xcr0();
+    uint64_t old_xss = get_msr_xss();
+    struct xcheck_state s = {};
+
+    /*
+     * User XSTATEs, increasing by index.
+     *
+     * Chronologically, Intel and AMD had identical layouts for AVX (YMM).
+     * AMD introduced LWP in Fam15h, following immediately on from YMM.  Intel
+     * left an LWP-shaped hole when adding MPX (BND{CSR,REGS}) in Skylake.
+     * AMD removed LWP in Fam17h, putting PKRU in the same space, breaking
+     * layout compatibility with Intel and having a knock-on effect on all
+     * subsequent states.
+     */
+    check_new_xstate(&s, X86_XCR0_SSE | X86_XCR0_FP);
+
+    if ( cpu_has_avx )
+        check_new_xstate(&s, X86_XCR0_YMM);
+
+    if ( cpu_has_mpx )
+        check_new_xstate(&s, X86_XCR0_BNDCSR | X86_XCR0_BNDREGS);
+
+    if ( cpu_has_avx512f )
+        check_new_xstate(&s, X86_XCR0_HI_ZMM | X86_XCR0_ZMM | X86_XCR0_OPMASK);
+
+    if ( cpu_has_pku )
+        check_new_xstate(&s, X86_XCR0_PKRU);
+
+    if ( boot_cpu_has(X86_FEATURE_AMX_TILE) )
+        check_new_xstate(&s, X86_XCR0_TILE_DATA | X86_XCR0_TILE_CFG);
+
+    if ( boot_cpu_has(X86_FEATURE_LWP) )
+        check_new_xstate(&s, X86_XCR0_LWP);
+
+    /*
+     * Supervisor XSTATEs, increasing by index.
+     *
+     * Intel Broadwell has Processor Trace but no XSAVES.  There doesn't
+     * appear to have been a new enumeration when X86_XSS_PROC_TRACE was
+     * introduced in Skylake.
+     */
+    if ( cpu_has_xsaves )
+    {
+        if ( cpu_has_proc_trace )
+            check_new_xstate(&s, X86_XSS_PROC_TRACE);
+
+        if ( boot_cpu_has(X86_FEATURE_ENQCMD) )
+            check_new_xstate(&s, X86_XSS_PASID);
+
+        if ( boot_cpu_has(X86_FEATURE_CET_SS) ||
+             boot_cpu_has(X86_FEATURE_CET_IBT) )
+        {
+            check_new_xstate(&s, X86_XSS_CET_U);
+            check_new_xstate(&s, X86_XSS_CET_S);
+        }
+
+        if ( boot_cpu_has(X86_FEATURE_UINTR) )
+            check_new_xstate(&s, X86_XSS_UINTR);
+
+        if ( boot_cpu_has(X86_FEATURE_ARCH_LBR) )
+            check_new_xstate(&s, X86_XSS_LBR);
+    }
+
+    /* Restore old state now the test is done. */
+    if ( !set_xcr0(old_xcr0) )
+        BUG();
+    if ( cpu_has_xsaves )
+        set_msr_xss(old_xss);
+}
+
 /* Collect the information of processor's extended state */
 void xstate_init(struct cpuinfo_x86 *c)
 {
@@ -683,6 +838,9 @@ void xstate_init(struct cpuinfo_x86 *c)
 
     if ( setup_xstate_features(bsp) && bsp )
         BUG();
+
+    if ( IS_ENABLED(CONFIG_SELF_TESTS) && bsp )
+        xstate_check_sizes();
 }
 
 int validate_xstate(const struct domain *d, uint64_t xcr0, uint64_t xcr0_accum,
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 6627453e3985..d9eba5e9a714 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -266,6 +266,7 @@ XEN_CPUFEATURE(IBPB_RET,      8*32+30) /*A  IBPB clears RSB/RAS too. */
 XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /*A  AVX512 Neural Network Instructions */
 XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*A  AVX512 Multiply Accumulation Single Precision */
 XEN_CPUFEATURE(FSRM,          9*32+ 4) /*A  Fast Short REP MOVS */
+XEN_CPUFEATURE(UINTR,         9*32+ 5) /*   User-mode Interrupts */
 XEN_CPUFEATURE(AVX512_VP2INTERSECT, 9*32+8) /*a  VP2INTERSECT{D,Q} insns */
 XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MCU_OPT_CTRL and RNGDS_MITG_DIS. */
 XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*!A| VERW clears microarchitectural buffers */
@@ -274,8 +275,10 @@ XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
 XEN_CPUFEATURE(HYBRID,        9*32+15) /*   Heterogeneous platform */
 XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
+XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
 XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
+XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*   AMX Tile architecture */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
-- 
2.39.2


