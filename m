Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD88951F27
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 17:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777502.1187644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seGK4-00015C-As; Wed, 14 Aug 2024 15:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777502.1187644; Wed, 14 Aug 2024 15:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seGK4-00012y-6D; Wed, 14 Aug 2024 15:54:04 +0000
Received: by outflank-mailman (input) for mailman id 777502;
 Wed, 14 Aug 2024 15:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8Zn=PN=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1seGK3-0000wO-7L
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 15:54:03 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c5ea128-5a55-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 17:54:01 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7a3375015f8so466626085a.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 08:54:01 -0700 (PDT)
Received: from mbarnes-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4c7e05db8sm449388285a.124.2024.08.14.08.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 08:53:59 -0700 (PDT)
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
X-Inumbo-ID: 6c5ea128-5a55-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723650840; x=1724255640; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QG/M0V684VfpYQYWG1KSktx6rzyoliVsgiAOZUPbgck=;
        b=QHfikBeUTIAC6atWM1hCEmdTLxfhUio/uIQivo6oEsUY5901D1Bf63hmjVKFCtlX2h
         Ynd6MC90isehY1l5lldsvl91whz82NOBY6To5DnPk2rF45oBAhQRt5vW04JDnVHmBBC3
         JE/rgHCvUEELxxu/ioXheDp02SHx0MjAz3Kd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723650840; x=1724255640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QG/M0V684VfpYQYWG1KSktx6rzyoliVsgiAOZUPbgck=;
        b=t2oql0rs2NWP7g17gotTKNzgykyBMU+I2fuS3HYO47MKUt5bhfrz6zJgPINT65BE/G
         7mL7waXeuNzFhnVf4r+5XFiEsPz0xlhssVbDSSyXElGghRQdl/tGDOIjyG8SOCWOixNk
         HdSC1ZCkmyEdLPrNXZ0E0DQjNEv5slBZYqgHlSNCFv6hHzUSskHNbFHrUZYtB3eGpumP
         OMAf7VFHmouc+GIQnKWbwWByOMekGiXEnT0Va/nWFFk7Ght42NnVMHucmWZh42XI3nK2
         S7C8wxK8s/tTXJQQJgbhMRq8EQ/D4o8y9jpFncQ/S1B4QEkUxF4oYJIVIYy/GTjmJn0v
         N74Q==
X-Gm-Message-State: AOJu0YyjYGkIf/ZUtP/f6enA2tBT1snfitDFywe8swMhEYSlt+EimWqt
	i/C2bdS3Tpf80a2PCxO71yv5xKHgOclOeJF15feocnX8jCWFVqv44HYWHlFvnHMUMuxSRMj2KiL
	X
X-Google-Smtp-Source: AGHT+IE7puL+/qymNHfKF/aQ9f3ZVfT4VU4D/MNvgjPHZCbelsZJz8yCegkmfxE2DxoJGNsay3Z7mA==
X-Received: by 2002:a05:620a:4152:b0:7a1:e271:ee37 with SMTP id af79cd13be357-7a4ee32ddb9mr387198785a.16.1723650839719;
        Wed, 14 Aug 2024 08:53:59 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH] x86/cpufeatures: Add new cpuid features in SPR to featureset
Date: Wed, 14 Aug 2024 16:52:54 +0100
Message-Id: <09353a67d79b12f2ff2a9be797866902bcd71825.1723650205.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upon running `xen-cpuid -d` on a host machine with Sapphire Rapids
within Dom0, there exist unrecognised features.

This patch adds these features as macros to the CPU featureset,
disabled by default.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/include/public/arch-x86/cpufeatureset.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index abab78fa86db..db633bd5c128 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -121,6 +121,7 @@ XEN_CPUFEATURE(SMX,           1*32+ 6) /*   Safer Mode Extensions */
 XEN_CPUFEATURE(EIST,          1*32+ 7) /*   Enhanced SpeedStep */
 XEN_CPUFEATURE(TM2,           1*32+ 8) /*   Thermal Monitor 2 */
 XEN_CPUFEATURE(SSSE3,         1*32+ 9) /*A  Supplemental Streaming SIMD Extensions-3 */
+XEN_CPUFEATURE(SDGB,          1*32+11) /*   Silicon Debugging */
 XEN_CPUFEATURE(FMA,           1*32+12) /*A  Fused Multiply Add */
 XEN_CPUFEATURE(CX16,          1*32+13) /*A  CMPXCHG16B */
 XEN_CPUFEATURE(XTPR,          1*32+14) /*   Send Task Priority Messages */
@@ -181,6 +182,7 @@ XEN_CPUFEATURE(XSAVEOPT,      4*32+ 0) /*A  XSAVEOPT instruction */
 XEN_CPUFEATURE(XSAVEC,        4*32+ 1) /*A  XSAVEC/XRSTORC instructions */
 XEN_CPUFEATURE(XGETBV1,       4*32+ 2) /*A  XGETBV with %ecx=1 */
 XEN_CPUFEATURE(XSAVES,        4*32+ 3) /*S  XSAVES/XRSTORS instructions */
+XEN_CPUFEATURE(XFD,           4*32+ 4) /*   Extended Feature Disable */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.ebx, word 5 */
 XEN_CPUFEATURE(FSGSBASE,      5*32+ 0) /*A  {RD,WR}{FS,GS}BASE instructions */
@@ -221,6 +223,7 @@ XEN_CPUFEATURE(AVX512_VBMI,   6*32+ 1) /*A  AVX-512 Vector Byte Manipulation Ins
 XEN_CPUFEATURE(UMIP,          6*32+ 2) /*S  User Mode Instruction Prevention */
 XEN_CPUFEATURE(PKU,           6*32+ 3) /*H  Protection Keys for Userspace */
 XEN_CPUFEATURE(OSPKE,         6*32+ 4) /*!  OS Protection Keys Enable */
+XEN_CPUFEATURE(WAITPKG,       6*32+ 5) /*   User-level monitoring support */
 XEN_CPUFEATURE(AVX512_VBMI2,  6*32+ 6) /*A  Additional AVX-512 Vector Byte Manipulation Instrs */
 XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*   CET - Shadow Stacks */
 XEN_CPUFEATURE(GFNI,          6*32+ 8) /*A  Galois Field Instrs */
@@ -228,13 +231,16 @@ XEN_CPUFEATURE(VAES,          6*32+ 9) /*A  Vector AES Instrs */
 XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multiplication Instrs */
 XEN_CPUFEATURE(AVX512_VNNI,   6*32+11) /*A  Vector Neural Network Instrs */
 XEN_CPUFEATURE(AVX512_BITALG, 6*32+12) /*A  Support for VPOPCNT[B,W] and VPSHUFBITQMB */
+XEN_CPUFEATURE(TME_EN,        6*32+13) /*   TME MSR support */
 XEN_CPUFEATURE(AVX512_VPOPCNTDQ, 6*32+14) /*A  POPCNT for vectors of DW/QW */
+XEN_CPUFEATURE(LA57,          6*32+16) /*   57-bit linear addressing and five-level paging */
 XEN_CPUFEATURE(RDPID,         6*32+22) /*A  RDPID instruction */
 XEN_CPUFEATURE(BLD,           6*32+24) /*   BusLock Detect (#DB trap) support */
 XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
 XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*a  MOVDIRI instruction */
 XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*a  MOVDIR64B instruction */
 XEN_CPUFEATURE(ENQCMD,        6*32+29) /*   ENQCMD{,S} instructions */
+XEN_CPUFEATURE(SGX_LC,        6*32+30) /*   SGX Launch Configuration */
 XEN_CPUFEATURE(PKS,           6*32+31) /*H  Protection Key for Supervisor */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
@@ -264,6 +270,7 @@ XEN_CPUFEATURE(BTC_NO,        8*32+29) /*A  Hardware not vulnerable to Branch Ty
 XEN_CPUFEATURE(IBPB_RET,      8*32+30) /*A  IBPB clears RSB/RAS too. */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.edx, word 9 */
+XEN_CPUFEATURE(SGX_KEYS,      9*32+ 1) /*   Attestation Services for Intel SGX */
 XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /*   Xeon Phi AVX512 Neural Network Instructions */
 XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*   Xeon Phi AVX512 Multiply Accumulation Single Precision */
 XEN_CPUFEATURE(FSRM,          9*32+ 4) /*A  Fast Short REP MOVS */
@@ -276,10 +283,13 @@ XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
 XEN_CPUFEATURE(HYBRID,        9*32+15) /*   Heterogeneous platform */
 XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
+XEN_CPUFEATURE(PCONFIG,       9*32+18) /*   Platform configuration support */
 XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
+XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   Tile computational operations on bfloat16 numbers */
 XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
 XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*   AMX Tile architecture */
+XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*   Tile computational operations on 8-bit integers */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
@@ -363,6 +373,8 @@ XEN_CPUFEATURE(GDS_CTRL,           16*32+25) /*   MCU_OPT_CTRL.GDS_MIT_{DIS,LOCK
 XEN_CPUFEATURE(GDS_NO,             16*32+26) /*A  No Gather Data Sampling */
 XEN_CPUFEATURE(RFDS_NO,            16*32+27) /*A  No Register File Data Sampling */
 XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A| Register File(s) cleared by VERW */
+XEN_CPUFEATURE(IGN_UMONITOR_SUPPORT, 16*32+29) /*  UMONITOR Ignore support */
+XEN_CPUFEATURE(MON_UMON_MITG_SUPPORT, 16*32+30) /*  (U)MONITOR Mitigation support */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
 
-- 
2.46.0


