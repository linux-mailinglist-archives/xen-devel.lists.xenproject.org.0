Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A543AABCD6
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976732.1363876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDSD-0000xF-KX; Tue, 06 May 2025 08:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976732.1363876; Tue, 06 May 2025 08:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDSD-0000uu-GZ; Tue, 06 May 2025 08:15:05 +0000
Received: by outflank-mailman (input) for mailman id 976732;
 Tue, 06 May 2025 08:15:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEbg=XW=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uCDSC-0000um-1G
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:15:04 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35d1acb1-2a52-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 10:15:02 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e5bc066283so7940026a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 01:15:02 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c0276sm659748166b.108.2025.05.06.01.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:15:00 -0700 (PDT)
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
X-Inumbo-ID: 35d1acb1-2a52-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746519302; x=1747124102; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uqyBqxUAyi5ilsJoxz1bXn/zQ+HZlt2a0tHEzNMVOEE=;
        b=QOYEnr2YVOanOscx148E3l6qbMEb9BM6SLXd1XR1fUa3NRWkfjU32mYnqpWuJPrF6v
         RAvUheezvecZLk+mhsQ1TDJCQDmbIyVyWG81UnHn4hXLeB8yMjgkA0gatHutJ1Z9gKhL
         BMPzFXzztvkWc4Qwg3FM1KFkehLKKkOntqPEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746519302; x=1747124102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqyBqxUAyi5ilsJoxz1bXn/zQ+HZlt2a0tHEzNMVOEE=;
        b=RsMo8YS9W/SoW9YYMaGvijcTi8Ujf3bfRVCH1+j5uVoMF7rkmfGfU/ZsA/HPLLdqI4
         XFx/d0sf0VMTwy7d29tjh58qsKr+Ec1j/UXQbyV3Gr1D/63/PXA3ALfL4uA8e7ztiFAC
         ZeYdiEikSbPl3a9EI/n/gtqkIBbj0s2anpsmNDoGhZDsNvvxAP/mtXMpWMqxFJSxsX/p
         IShZznatzAE9aBPn4fjj4KTfMCWzgOre61brJ4ssfL7paKZBOVEApFqnM60olRZYzNrG
         yx/eCseR2ShWPNttlLwbrUPY5lX3XM+X7S6YaoNdIhkEXmxwsZq5oJG/FyRYgY6Ldxn1
         kkIg==
X-Gm-Message-State: AOJu0YwJ5h+l2bwWsCTUU+yeP1Qr+D4qSxjW6sK/2vVnGwkcWsgv+0rn
	vY83vOZ8ezfCBRsr9thoyHd4jy451vlhJ5tJtQceWoB/MZa7sA6v7hCZkIRWn21CVpsEn8YyXFV
	58nk=
X-Gm-Gg: ASbGncubodelbNUlW15a/TIditUB4LfNeGs3/R1FHvWJBOCH7uITY61tI1rY9s4iXrM
	9myHnRhGdNPrnkyJQ+xcsA2x6/e4Xz0zYMM9H4LzKgtkraF2XhIB/MrQ+KNoWfHBe3N3SDRzKNT
	hyxzHgSua7Id7WX496keoMuJyOQfOiTf+it2sdcS7XT7XzqMfs/5qOTIPvRsLhe/fgoftZdzeYo
	PJoJeT7ptfGtmGQzEcyxZfPEZRH6j+Bq8fVQFkTHiTfl9RSaYpUKX4A8XCTsWYFJiaqGLNegqdL
	Jyp1XLZ+b41AJHKnqpwUJz9Daf1p+Slb8Hbkw7tw8XwhHlLrzVW1WCOnBQ==
X-Google-Smtp-Source: AGHT+IEOLk7s4WFABEB2b+m3lLblkvJi77LlzsZeXTYNRTVqnUswZZeYA5wwORlj3zO7NlB+NMu3kA==
X-Received: by 2002:a17:907:86a2:b0:acb:94d6:a841 with SMTP id a640c23a62f3a-ad1a490fc9emr959820766b.16.1746519301693;
        Tue, 06 May 2025 01:15:01 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	roger.pau@citrix.com,
	andrew.cooper3@citrix.com,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH v2] x86/cpufeatures: cpuid features for Sierra Forest
Date: Tue,  6 May 2025 09:13:30 +0100
Message-ID: <20250506081456.1572050-1-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new cpuid features for Sierra Forest.

Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
---
Changes in v2:
- change INVD_DISABLE to NO_INVD
- change UC_LOCK_DISABLE to UC_LOCK_DIS
- better comment for UIRET_UIF
- use MCU_ENUM because it's shorter and add better comment
---
 xen/include/public/arch-x86/cpufeatureset.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index cc6e984a88..089a133519 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -304,13 +304,18 @@ XEN_CPUFEATURE(SM3,          10*32+ 1) /*A  SM3 Instructions */
 XEN_CPUFEATURE(SM4,          10*32+ 2) /*A  SM4 Instructions */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
+XEN_CPUFEATURE(LASS,         10*32+ 6) /*   Linear Address Space Separation */
 XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /*a  CMPccXADD Instructions */
+XEN_CPUFEATURE(ARCH_PERF_MON, 10*32+ 8) /*  ArchPerfMonExt */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
 XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
+XEN_CPUFEATURE(LAM,          10*32+26) /*   Linear Address Masking */
+XEN_CPUFEATURE(MSRLIST,      10*32+27) /*   RDMSRLIST/WRMSRLIST/WRMSRNS */
+XEN_CPUFEATURE(NO_INVD,      10*32+30) /*   INVD_DISABLE_POST_BIOS_DONE */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(NO_NEST_BP,         11*32+ 0) /*A  No Nested Data Breakpoints */
@@ -340,6 +345,7 @@ XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*S  MSR_SPEC_CTRL.RRSBA_DIS_* */
 XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDP_DIS_U */
 XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*S  MSR_SPEC_CTRL.BHI_DIS_S */
 XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
+XEN_CPUFEATURE(UC_LOCK_DIS,        13*32+ 6) /*   UC-lock disable */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
 
@@ -349,7 +355,9 @@ XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
 XEN_CPUFEATURE(AMX_COMPLEX,        15*32+ 8) /*   AMX Complex Instructions */
 XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32+10) /*A  AVX-VNNI-INT16 Instructions */
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
+XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET updates UIF */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
+XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
 XEN_CPUFEATURE(RDCL_NO,            16*32+ 0) /*A  No Rogue Data Cache Load (Meltdown) */
@@ -368,6 +376,7 @@ XEN_CPUFEATURE(DOITM,              16*32+12) /*   Data Operand Invariant Timing
 XEN_CPUFEATURE(SBDR_SSDP_NO,       16*32+13) /*A  No Shared Buffer Data Read or Sideband Stale Data Propagation */
 XEN_CPUFEATURE(FBSDP_NO,           16*32+14) /*A  No Fill Buffer Stale Data Propagation */
 XEN_CPUFEATURE(PSDP_NO,            16*32+15) /*A  No Primary Stale Data Propagation */
+XEN_CPUFEATURE(MCU_ENUM,           16*32+16) /*   Runtime Microcode Update features */
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


