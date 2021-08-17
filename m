Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09613EEE89
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 16:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167904.306559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG06r-0005yz-PD; Tue, 17 Aug 2021 14:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167904.306559; Tue, 17 Aug 2021 14:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG06r-0005wO-G7; Tue, 17 Aug 2021 14:30:33 +0000
Received: by outflank-mailman (input) for mailman id 167904;
 Tue, 17 Aug 2021 14:30:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mG06p-0005vQ-K5
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 14:30:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abe11f68-ff67-11eb-a4c9-12813bfff9fa;
 Tue, 17 Aug 2021 14:30:30 +0000 (UTC)
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
X-Inumbo-ID: abe11f68-ff67-11eb-a4c9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629210630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/FBvFqnB8wJbrimRiM/iWYtiWgIJODR5Qqcri5t8FTY=;
  b=QYuv1fDU3B6Xlv9DyfNStHFfbUs7D91IT0Bbe3SvitWGSLHwEOnU51fW
   nO/sAMxE3QTyuBBFjCwN2sPH7n05bdXav+rktS8hQlGyDaga6Kd94WvUx
   DZMKef4ziLVc77nqaXP8DyIvkkh3L8T2CV5ZTrysQArgA058tDQa6ZKXY
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lAxEz1MgR93f0CROO64TwK1rFH5kwgH/wWQ7ButvQg/DYnOntpQWlIRw+d1tVQFMQh0nBxgBcC
 EISkMlA+oM7gwDZg4RYtwt/4HRgcwiCddX4IJ86havyLwOuq15guf9h9GnGvjz9eNg6qqmM26k
 3NtOn1OWVTxPY5tE5Q/QCN0u2vPos+iP8OWaMvPL0gv0DaFEd8bGZ2+K08frJ89SJ9pFASBZ1c
 8Qu++GA8xOH8aXwAXfgmFgU3h620P4eSmybPSGYHNxvGiVjebES9QK2tCkAbcyAAH0R6+q1Bxn
 DRsMVBwmTDbinVdAiHKbGNNk
X-SBRS: 5.1
X-MesageID: 51032081
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:74hY2qE2GeAaDVq/pLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-IronPort-AV: E=Sophos;i="5.84,329,1620705600"; 
   d="scan'208";a="51032081"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86/amd: Enumeration for speculative features/hints
Date: Tue, 17 Aug 2021 15:30:05 +0100
Message-ID: <20210817143006.2821-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210817143006.2821-1-andrew.cooper3@citrix.com>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is a step change in speculation protections between the Zen1 and Zen2
microarchitectures.

Zen1 and older have no special support.  Control bits in non-architectural
MSRs are used to make lfence be dispatch-serialising (Spectre v1), and to
disable Memory Disambiguation (Speculative Store Bypass).  IBPB was
retrofitted in a microcode update, and software methods are required for
Spectre v2 protections.

Because the bit controlling Memory Disambiguation is model specific,
hypervisors are expected to expose a MSR_VIRT_SPEC_CTRL interface which
abstracts the model specific details.

Zen2 and later implement the MSR_SPEC_CTRL interface in hardware, and
virtualise the interface for HVM guests to use.  A number of hint bits are
specified too to help guide OS software to the most efficient mitigation
strategy.

Zen3 introduced a new feature, Predictive Store Forwarding, along with a
control to disable it in sensitive code.

Add CPUID and VMCB details for all the new functionality.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

The current revision of the APM is buggy with the spec_ctrl VMCB field.  It is
currently described as a dword, but a correction is pending to change it to
qword like every other MSR.
---
 tools/libs/light/libxl_cpuid.c              | 10 ++++++++++
 tools/misc/xen-cpuid.c                      |  8 +++++++-
 xen/arch/x86/hvm/svm/svm.c                  |  1 +
 xen/arch/x86/hvm/svm/vmcb.c                 |  1 +
 xen/include/asm-x86/cpufeature.h            |  5 +++++
 xen/include/asm-x86/hvm/svm/svm.h           |  2 ++
 xen/include/asm-x86/hvm/svm/vmcb.h          |  4 +++-
 xen/include/asm-x86/msr-index.h             |  3 +++
 xen/include/public/arch-x86/cpufeatureset.h | 10 ++++++++++
 9 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index b2c673841a45..5ed7a87180b8 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -274,8 +274,18 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
         {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
         {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
+        {"ibrs",         0x80000008, NA, CPUID_REG_EBX, 14,  1},
+        {"amd-stibp",    0x80000008, NA, CPUID_REG_EBX, 15,  1},
+        {"ibrs-always",  0x80000008, NA, CPUID_REG_EBX, 16,  1},
+        {"stibp-always", 0x80000008, NA, CPUID_REG_EBX, 17,  1},
+        {"ibrs-fast",    0x80000008, NA, CPUID_REG_EBX, 18,  1},
+        {"ibrs-same-mode", 0x80000008, NA, CPUID_REG_EBX, 19,  1},
         {"no-lmsl",      0x80000008, NA, CPUID_REG_EBX, 20,  1},
         {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
+        {"amd-ssbd",     0x80000008, NA, CPUID_REG_EBX, 24,  1},
+        {"virt-ssbd",    0x80000008, NA, CPUID_REG_EBX, 25,  1},
+        {"ssb-no",       0x80000008, NA, CPUID_REG_EBX, 26,  1},
+        {"psfd",         0x80000008, NA, CPUID_REG_EBX, 28,  1},
 
         {"nc",           0x80000008, NA, CPUID_REG_ECX,  0,  8},
         {"apicidsize",   0x80000008, NA, CPUID_REG_ECX, 12,  4},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 735bcf8f0e60..713c1657f4df 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -148,12 +148,18 @@ static const char *const str_e8b[32] =
     [ 0] = "clzero",
     [ 2] = "rstr-fp-err-ptrs",
 
-    /* [ 8] */            [ 9] = "wbnoinvd",
+    /* [ 8] */                 [ 9] = "wbnoinvd",
 
     [12] = "ibpb",
+    [14] = "ibrs",             [15] = "amd-stibp",
+    [16] = "ibrs-always",      [17] = "stibp-always",
+    [18] = "ibrs-fast",        [19] = "ibrs-same-mode",
 
     [20] = "no-lmsl",
     /* [22] */                 [23] = "ppin",
+    [24] = "amd-ssbd",         [25] = "virt-ssbd",
+    [26] = "ssb-no",
+    [28] = "psfd",
 };
 
 static const char *const str_7d0[32] =
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 642a64b747ae..8dc92c8b9f96 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1659,6 +1659,7 @@ const struct hvm_function_table * __init start_svm(void)
     P(cpu_has_pause_thresh, "Pause-Intercept Filter Threshold");
     P(cpu_has_tsc_ratio, "TSC Rate MSR");
     P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
+    P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
 #undef P
 
     if ( !printed )
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 373d5d4af47e..55da9302e5d7 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -271,6 +271,7 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(offsetof(typeof(vmcb), rsp)                  != 0x5d8);
     BUILD_BUG_ON(offsetof(typeof(vmcb), rax)                  != 0x5f8);
     BUILD_BUG_ON(offsetof(typeof(vmcb), _g_pat)               != 0x668);
+    BUILD_BUG_ON(offsetof(typeof(vmcb), spec_ctrl)            != 0x6e0);
 
     /* Check struct segment_register against the VMCB segment layout. */
     BUILD_BUG_ON(sizeof(vmcb.es)       != 16);
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index 5f6b83f71c21..d9604ff58a49 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -128,6 +128,11 @@
 /* CPUID level 0x80000007.edx */
 #define cpu_has_itsc            boot_cpu_has(X86_FEATURE_ITSC)
 
+/* CPUID level 0x80000008.ebx */
+#define cpu_has_amd_ssbd        boot_cpu_has(X86_FEATURE_AMD_SSBD)
+#define cpu_has_virt_ssbd       boot_cpu_has(X86_FEATURE_VIRT_SSBD)
+#define cpu_has_ssb_no          boot_cpu_has(X86_FEATURE_SSB_NO)
+
 /* CPUID level 0x00000007:0.edx */
 #define cpu_has_avx512_4vnniw   boot_cpu_has(X86_FEATURE_AVX512_4VNNIW)
 #define cpu_has_avx512_4fmaps   boot_cpu_has(X86_FEATURE_AVX512_4FMAPS)
diff --git a/xen/include/asm-x86/hvm/svm/svm.h b/xen/include/asm-x86/hvm/svm/svm.h
index bee939156f4f..05e968502694 100644
--- a/xen/include/asm-x86/hvm/svm/svm.h
+++ b/xen/include/asm-x86/hvm/svm/svm.h
@@ -76,6 +76,7 @@ extern u32 svm_feature_flags;
 #define SVM_FEATURE_VLOADSAVE     15 /* virtual vmload/vmsave */
 #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
 #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
+#define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
 
 #define cpu_has_svm_feature(f) (svm_feature_flags & (1u << (f)))
 #define cpu_has_svm_npt       cpu_has_svm_feature(SVM_FEATURE_NPT)
@@ -91,6 +92,7 @@ extern u32 svm_feature_flags;
 #define cpu_has_tsc_ratio     cpu_has_svm_feature(SVM_FEATURE_TSCRATEMSR)
 #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
+#define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
 
 #define SVM_PAUSEFILTER_INIT    4000
 #define SVM_PAUSETHRESH_INIT    1000
diff --git a/xen/include/asm-x86/hvm/svm/vmcb.h b/xen/include/asm-x86/hvm/svm/vmcb.h
index 9e1e42f4941c..4fa2ddfb2ff2 100644
--- a/xen/include/asm-x86/hvm/svm/vmcb.h
+++ b/xen/include/asm-x86/hvm/svm/vmcb.h
@@ -521,7 +521,9 @@ struct vmcb_struct {
     u64 _lastbranchtoip;        /* cleanbit 10 */
     u64 _lastintfromip;         /* cleanbit 10 */
     u64 _lastinttoip;           /* cleanbit 10 */
-    u64 res17[301];
+    u64 res17[9];
+    u64 spec_ctrl;
+    u64 res18[291];
 };
 
 struct svm_domain {
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index a14841055f0e..903923e5a58b 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -33,6 +33,7 @@
 #define  SPEC_CTRL_IBRS                     (_AC(1, ULL) <<  0)
 #define  SPEC_CTRL_STIBP                    (_AC(1, ULL) <<  1)
 #define  SPEC_CTRL_SSBD                     (_AC(1, ULL) <<  2)
+#define  SPEC_CTRL_PSFD                     (_AC(1, ULL) <<  7)
 
 #define MSR_PRED_CMD                        0x00000049
 #define  PRED_CMD_IBPB                      (_AC(1, ULL) <<  0)
@@ -137,6 +138,8 @@
 #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
 #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
 
+#define MSR_VIRT_SPEC_CTRL                  0xc001011f /* Layout matches MSR_SPEC_CTRL */
+
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
  */
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 380b51b1b3b8..f1b072cf44cc 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -255,8 +255,18 @@ XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
 XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
+XEN_CPUFEATURE(IBRS,          8*32+14) /*   MSR_SPEC_CTRL.IBRS */
+XEN_CPUFEATURE(AMD_STIBP,     8*32+15) /*   MSR_SPEC_CTRL.STIBP */
+XEN_CPUFEATURE(IBRS_ALWAYS,   8*32+16) /*   IBRS preferred always on */
+XEN_CPUFEATURE(STIBP_ALWAYS,  8*32+17) /*   STIBP preferred always on */
+XEN_CPUFEATURE(IBRS_FAST,     8*32+18) /*   IBRS preferred over software options */
+XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*   IBRS provides same-mode protection */
 XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
+XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*   MSR_SPEC_CTRL.SSBD available */
+XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
+XEN_CPUFEATURE(SSB_NO,        8*32+26) /*   Hardware not vulnerable to SSB */
+XEN_CPUFEATURE(PSFD,          8*32+28) /*   MSR_SPEC_CTRL.PSFD */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.edx, word 9 */
 XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /*A  AVX512 Neural Network Instructions */
-- 
2.11.0


