Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9C695A187
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 17:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781272.1190820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnOH-0006Ei-Af; Wed, 21 Aug 2024 15:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781272.1190820; Wed, 21 Aug 2024 15:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnOH-0006DG-71; Wed, 21 Aug 2024 15:36:53 +0000
Received: by outflank-mailman (input) for mailman id 781272;
 Wed, 21 Aug 2024 15:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WDzf=PU=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sgnOG-00068X-3F
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 15:36:52 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e21a2ea-5fd3-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 17:36:49 +0200 (CEST)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-44fe188d25cso27207201cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 08:36:49 -0700 (PDT)
Received: from mbarnes-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454e904ff81sm15792281cf.35.2024.08.21.08.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 08:36:47 -0700 (PDT)
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
X-Inumbo-ID: 2e21a2ea-5fd3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724254608; x=1724859408; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o1ov4xsmvf/8LjYhy1kZ/l5DlyUj+pR+QeRZhllCHsA=;
        b=MKtZaZBgbD0wkqsSu1CeqRBCqddtHqyJDixcb4ikMMuXHEP69tPrJ9b7GRzlDxO7bN
         mmAdNcO4VPLfb57jjuQOyffVIpO1FF2S9Grrb02IVBAFxWRqE/eJhLlleXLQ0E3EUZrP
         Yz0bp1Ur5v9j0OzdEptmWeDhVYxibrL+7XX6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724254608; x=1724859408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1ov4xsmvf/8LjYhy1kZ/l5DlyUj+pR+QeRZhllCHsA=;
        b=sXk0r+anNSIY3S1zPfe5iMVamKUxbDqzYHyDXwNrlXnmcbbXdi7wT9uMNbvDLtNKFN
         wrRSvAOpYO8KtEbq5nCL6D8Tgpi/YShVFwClScw6CpcTjnuXwmn2XlXiGPmMSkoJgFM+
         gbrWO5Z8WUR7N/ewhb6QA8CYe+ukJ0JXjS/JrZPI8Fo0pFymTDfC0tnVIPyTZ+nIQZjo
         V9zj+dZqFU2qbKimvHWLhyKzazx/uB9HWQGawhpWvlXbDLopbnRnbG+YZgw9YeiVbr4w
         YSuyHmQjHDB/f9BHyndw5/MKLdMjjM4bS5gA3HhhIs9JNyzzN3GeLxJ+APjgo4ONR2oO
         FL3g==
X-Gm-Message-State: AOJu0YznNEPZJ6r06M9uusWbXLQtb06StiImY8d6n90AMi5uP2+72j2Q
	BGzdc+vio2T7GkFV1glpfn+WW0zhqjcvMN9/P5ncQpmlolZ9LWk9y5p/+O11NrvaECkjrwGrGKP
	X
X-Google-Smtp-Source: AGHT+IHqYkgy6DEis85z12XDDdaLYN8b+hVpaU3de4zW8kvzJT0HC9PgQ+wjCTjrd+Slaz13dUGZEA==
X-Received: by 2002:a05:622a:6107:b0:44f:ff2a:5a0f with SMTP id d75a77b69052e-454f21f52e9mr18004451cf.15.1724254607734;
        Wed, 21 Aug 2024 08:36:47 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v2] x86/cpufeatures: Add new cpuid features in SPR to featureset
Date: Wed, 21 Aug 2024 16:34:37 +0100
Message-Id: <248b4ea259aa78a17b7b05043ed211a00863bf94.1724247366.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upon running `xen-cpuid -v` on a host machine with Sapphire Rapids
within Dom0, there exist unrecognised features.

This patch adds these features as macros to the CPU featureset,
disabled by default.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
Changes in v2:
- Remove MONITOR / UMONITOR features in MSR_ARCH_CAPS
  (these will be included properly in a separate patch)
- Xen cpufeature label renames
- Xen cpufeature comment rewords
- Tweak cli flag in commit description
---
 xen/include/public/arch-x86/cpufeatureset.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index abab78fa86db..9daaf92988ed 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -121,6 +121,7 @@ XEN_CPUFEATURE(SMX,           1*32+ 6) /*   Safer Mode Extensions */
 XEN_CPUFEATURE(EIST,          1*32+ 7) /*   Enhanced SpeedStep */
 XEN_CPUFEATURE(TM2,           1*32+ 8) /*   Thermal Monitor 2 */
 XEN_CPUFEATURE(SSSE3,         1*32+ 9) /*A  Supplemental Streaming SIMD Extensions-3 */
+XEN_CPUFEATURE(SDBG,          1*32+11) /*   IA32_DEBUG_INTERFACE MSR for silicon debugging support */
 XEN_CPUFEATURE(FMA,           1*32+12) /*A  Fused Multiply Add */
 XEN_CPUFEATURE(CX16,          1*32+13) /*A  CMPXCHG16B */
 XEN_CPUFEATURE(XTPR,          1*32+14) /*   Send Task Priority Messages */
@@ -181,6 +182,7 @@ XEN_CPUFEATURE(XSAVEOPT,      4*32+ 0) /*A  XSAVEOPT instruction */
 XEN_CPUFEATURE(XSAVEC,        4*32+ 1) /*A  XSAVEC/XRSTORC instructions */
 XEN_CPUFEATURE(XGETBV1,       4*32+ 2) /*A  XGETBV with %ecx=1 */
 XEN_CPUFEATURE(XSAVES,        4*32+ 3) /*S  XSAVES/XRSTORS instructions */
+XEN_CPUFEATURE(XFD,           4*32+ 4) /*   MSR_XFD{,_ERR} (eXtended Feature Disable) */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.ebx, word 5 */
 XEN_CPUFEATURE(FSGSBASE,      5*32+ 0) /*A  {RD,WR}{FS,GS}BASE instructions */
@@ -221,6 +223,7 @@ XEN_CPUFEATURE(AVX512_VBMI,   6*32+ 1) /*A  AVX-512 Vector Byte Manipulation Ins
 XEN_CPUFEATURE(UMIP,          6*32+ 2) /*S  User Mode Instruction Prevention */
 XEN_CPUFEATURE(PKU,           6*32+ 3) /*H  Protection Keys for Userspace */
 XEN_CPUFEATURE(OSPKE,         6*32+ 4) /*!  OS Protection Keys Enable */
+XEN_CPUFEATURE(WAITPKG,       6*32+ 5) /*   UMONITOR/UMWAIT/TPAUSE monitoring support */
 XEN_CPUFEATURE(AVX512_VBMI2,  6*32+ 6) /*A  Additional AVX-512 Vector Byte Manipulation Instrs */
 XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*   CET - Shadow Stacks */
 XEN_CPUFEATURE(GFNI,          6*32+ 8) /*A  Galois Field Instrs */
@@ -228,13 +231,16 @@ XEN_CPUFEATURE(VAES,          6*32+ 9) /*A  Vector AES Instrs */
 XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multiplication Instrs */
 XEN_CPUFEATURE(AVX512_VNNI,   6*32+11) /*A  Vector Neural Network Instrs */
 XEN_CPUFEATURE(AVX512_BITALG, 6*32+12) /*A  Support for VPOPCNT[B,W] and VPSHUFBITQMB */
+XEN_CPUFEATURE(TME,           6*32+13) /*   Total Memory Encryption */
 XEN_CPUFEATURE(AVX512_VPOPCNTDQ, 6*32+14) /*A  POPCNT for vectors of DW/QW */
+XEN_CPUFEATURE(LA57,          6*32+16) /*   5-level paging (57-bit linear address) */
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
+XEN_CPUFEATURE(SGX_KEYS,      9*32+ 1) /*   SGX Attestation Service */
 XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /*   Xeon Phi AVX512 Neural Network Instructions */
 XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*   Xeon Phi AVX512 Multiply Accumulation Single Precision */
 XEN_CPUFEATURE(FSRM,          9*32+ 4) /*A  Fast Short REP MOVS */
@@ -276,10 +283,13 @@ XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
 XEN_CPUFEATURE(HYBRID,        9*32+15) /*   Heterogeneous platform */
 XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
+XEN_CPUFEATURE(PCONFIG,       9*32+18) /*   PCONFIG insn */
 XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
+XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   Tile computational operations on bfloat16 numbers */
 XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
 XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*   AMX Tile architecture */
+XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*   Tile computational operations on 8-bit integers */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
-- 
2.46.0


