Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7952EAA75D8
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 17:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974746.1362512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAs8f-0003tQ-DU; Fri, 02 May 2025 15:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974746.1362512; Fri, 02 May 2025 15:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAs8f-0003rL-As; Fri, 02 May 2025 15:17:21 +0000
Received: by outflank-mailman (input) for mailman id 974746;
 Fri, 02 May 2025 15:17:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iE6z=XS=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uAs8d-0003rB-HJ
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 15:17:19 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 889b2e30-2768-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 17:17:17 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ace98258d4dso294954566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 08:17:17 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891473a1sm63218766b.4.2025.05.02.08.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 08:17:15 -0700 (PDT)
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
X-Inumbo-ID: 889b2e30-2768-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746199036; x=1746803836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ggLUTb5elhqYRAVQYFSnXR1nma6iNQ6dGhAZ9EvxB2Y=;
        b=P0BN/ni1neC4Ad3twKK3tKt8JX/agXHnGlTM3ftzeogdo7mEgCJClWrYGGgyA6lnSH
         Az6GS1dZOZ4W4c4zPmmb//QLyB9IuWKbsOtWrRHXZHDDHCCB57mKIZRZf43N7SgXYTr2
         MiDy7c5QLiVJp4cIQunoDPAOqvxsyLlhmnbJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746199036; x=1746803836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggLUTb5elhqYRAVQYFSnXR1nma6iNQ6dGhAZ9EvxB2Y=;
        b=ITc/4ZS+HbYugGRC/KHBawWICSGNC6Fx01agt2sGvdUrluV+Q336+AbaVwLX0L6LLB
         RWHV4WwITBHJAyZc8XxUC7VsmTqaKDm20Rm8soxkv1s6EvH1AVLPfH6pmM1QABkROBom
         M4h8AMWWq0oPsjyvVN9pbbB8tYRrRcNXzV7ow3Y82hZ1/Pl9NOGLVD60De7dqBUFX8XL
         E476mSSnJqUVJrACxvn8DQzVJl4G3JrvrIay0X1rAHukLEG/YGX1zHjq8MzxzTDhICv5
         DsNBNmvHBnauGMUkY/FLwXjkJqiMCWqHMSD4iLciGi7vjV3DPS32owNqWFVVkEQrwgo7
         6agg==
X-Gm-Message-State: AOJu0Yx9DDt9WhRdbmhmo/sARyNehhBok5wvnEB4lLfzs8/xwbd3j31t
	1lwNX1l2hiaq3G6Mn4wCRVO9rlOCIzJqmPndOiVK9IOXr1ydegOGEX/S6O76hd4UpA8VsKdMIdH
	b40A=
X-Gm-Gg: ASbGncv9PJAu/gxxgtuBFNt+cw0qeb0kDhRahgaS/kIHQ03istU2Aa9aEiV2v5rBipL
	XePCcsKoXF5K5xMMxeJ7pdZ666zDJtkC2JoKPn9+ZWsAshp0g582dlueLZyb0ZEnN7fuq9CznqX
	EMBDF/7dEMXq+DujeUkfcXzccYhhNX3Yk2iq5RUM+1JiEmkI8hyxEDHyvFG6fO7LHIVqqezs06h
	ifuzf5TluJQj/5kyyhix0KLjTPfW05dheyidB87na7KdhRc92Mqj//36R2hK5C0MLOTlhJjX2Qo
	SAU0wAY7jyxKxUR6TW8dCdIE9vOmD8Id5D25/Z3ROqmT6dD3DVqSMNghNg==
X-Google-Smtp-Source: AGHT+IE7KwsITq4I4hp4EY9MD0v/RmkkA3yvCyD6W7GeQE39G7UKPfZwYgkms6n1sXy5j4qC/8cRJw==
X-Received: by 2002:a17:907:2d28:b0:ace:dd27:7c68 with SMTP id a640c23a62f3a-ad17aef2846mr370530666b.46.1746199035820;
        Fri, 02 May 2025 08:17:15 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH] x86/cpufeatures: cpuid features for Sierra Forest
Date: Fri,  2 May 2025 16:17:09 +0100
Message-ID: <20250502151709.1542875-1-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new cpuid features for Sierra Forest.

Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
---
 xen/include/public/arch-x86/cpufeatureset.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index cc6e984a88..c0587be972 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -304,13 +304,18 @@ XEN_CPUFEATURE(SM3,          10*32+ 1) /*A  SM3 Instructions */
 XEN_CPUFEATURE(SM4,          10*32+ 2) /*A  SM4 Instructions */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
+XEN_CPUFEATURE(LASS,         10*32+ 6) /*   Linear Address Space Separation */
 XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /*a  CMPccXADD Instructions */
+XEN_CPUFEATURE(ARCH_PERF_MON, 10*32+ 8) /*   ArchPerfMonExt */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
 XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
+XEN_CPUFEATURE(LAM,          10*32+26) /*   Linear Address Masking */
+XEN_CPUFEATURE(MSRLIST,      10*32+27) /*   RDMSRLIST/WRMSRLIST/WRMSRNS */
+XEN_CPUFEATURE(INVD_DISABLE, 10*32+30) /*   INVD_DISABLE_POST_BIOS_DONE */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(NO_NEST_BP,         11*32+ 0) /*A  No Nested Data Breakpoints */
@@ -340,6 +345,7 @@ XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*S  MSR_SPEC_CTRL.RRSBA_DIS_* */
 XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDP_DIS_U */
 XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*S  MSR_SPEC_CTRL.BHI_DIS_S */
 XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
+XEN_CPUFEATURE(UC_LOCK_DISABLE,    13*32+ 6) /*   UC-lock disable */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
 
@@ -349,7 +355,9 @@ XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
 XEN_CPUFEATURE(AMX_COMPLEX,        15*32+ 8) /*   AMX Complex Instructions */
 XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32+10) /*A  AVX-VNNI-INT16 Instructions */
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
+XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET_UIF */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
+XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
 XEN_CPUFEATURE(RDCL_NO,            16*32+ 0) /*A  No Rogue Data Cache Load (Meltdown) */
@@ -368,6 +376,7 @@ XEN_CPUFEATURE(DOITM,              16*32+12) /*   Data Operand Invariant Timing
 XEN_CPUFEATURE(SBDR_SSDP_NO,       16*32+13) /*A  No Shared Buffer Data Read or Sideband Stale Data Propagation */
 XEN_CPUFEATURE(FBSDP_NO,           16*32+14) /*A  No Fill Buffer Stale Data Propagation */
 XEN_CPUFEATURE(PSDP_NO,            16*32+15) /*A  No Primary Stale Data Propagation */
+XEN_CPUFEATURE(MCU_ENUMERATION,    16*32+16) /*   MCU_ENUMERATION */
 XEN_CPUFEATURE(FB_CLEAR,           16*32+17) /*!A| Fill Buffers cleared by VERW */
 XEN_CPUFEATURE(FB_CLEAR_CTRL,      16*32+18) /*   MSR_OPT_CPU_CTRL.FB_CLEAR_DIS */
 XEN_CPUFEATURE(RRSBA,              16*32+19) /*!  Restricted RSB Alternative */
@@ -379,6 +388,7 @@ XEN_CPUFEATURE(GDS_CTRL,           16*32+25) /*   MCU_OPT_CTRL.GDS_MIT_{DIS,LOCK
 XEN_CPUFEATURE(GDS_NO,             16*32+26) /*A  No Gather Data Sampling */
 XEN_CPUFEATURE(RFDS_NO,            16*32+27) /*A  No Register File Data Sampling */
 XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A| Register File(s) cleared by VERW */
+XEN_CPUFEATURE(IGN_UMONITOR,       16*32+29) /*   IGN_UMONITOR_SUPPORT */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
 
-- 
2.42.0


