Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E23CAD58C
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180635.1503784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbi3-00057p-I4; Mon, 08 Dec 2025 13:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180635.1503784; Mon, 08 Dec 2025 13:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbi3-00055f-FP; Mon, 08 Dec 2025 13:55:27 +0000
Received: by outflank-mailman (input) for mailman id 1180635;
 Mon, 08 Dec 2025 13:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22jW=6O=gmail.com=haseebashraf091@srs-se1.protection.inumbo.net>)
 id 1vSbi2-00055Z-Ov
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:55:26 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bf4eb0c-d43d-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 14:55:25 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so37623535e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:55:25 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.89.17])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792afe32cbsm144746585e9.0.2025.12.08.05.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 05:55:24 -0800 (PST)
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
X-Inumbo-ID: 8bf4eb0c-d43d-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765202125; x=1765806925; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yfRH+v8o1fMcD7nIgwoL2ojGo+xNx8nkGSixxBQ19g=;
        b=FJRVw3KkLFgO1ed+CEuE/qIbvuHaRhazEoUMdeiw+IdmkXev3MevQjcZ9KFFrXpOvP
         Nie5Q8pALAjozkMOfDCNUJIi5XyRXVCGSboU5O4nqa0JXrjnUUGDyWu69e4bSpTSn30F
         ep/0Cdide4ef1FyKKhRl/KDsBeiy+P6YF8Pqokg/LekwXxEG7ti56nU8qemk5iNaF8bE
         a8igvbwSAm7YG9sHLiUy3BdrJDoGUiemp3jsHcV2ynLDi2I7MRCo5oKUXoCUygU1OC4Z
         kgyba7W5yrO4gB+lc73LWkGDFZjoTvfIReyOkwTEfl2oQRpkQchgtLEJa/5wAFWoMQZh
         JYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765202125; x=1765806925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yfRH+v8o1fMcD7nIgwoL2ojGo+xNx8nkGSixxBQ19g=;
        b=i72WtMtHyE4hrw6Y89KA0NVHN7SjIgA3ra0mG1F159OYy4UibSWGXpkMz9GpC6/fkY
         CpuaqXax6i7JayoAChtDADIYQECxZqeRvtSxuVEOifskWiOiGTa8i7ML4wJ1/gPJ+tt9
         6+g5SS+V8ki+x+kfUfjTuob08p5sZR9zKQz9xhAYiUd3Pcmkf70PKRLRoa5Dt56PIt5d
         3LkAXcX91N2NKz62kzcI26txwZ1E6OGysTultBbXZDBozBI2nyi96uGPKfz9WX4QAS3D
         CEgFjOjvtVkq1NVxCkSE+DxygQtuVbYfqf2Ux/t6UMer7bDldnh36blcsAy3mHbcFvbQ
         ucQA==
X-Gm-Message-State: AOJu0YyjaYyxE2cdZw5ahtZuuMPX2nHpYTCdzaH0CpA5lZtopTmzRAhj
	HhOv4FnUZWHZLaTT8PQJM56ZMAXnAvvKMW7bpe+hBXCmHEdzUXCwo4h/2YD32Qwj
X-Gm-Gg: ASbGnctpyBseiYSRbGyvLDPk2Myy/O6aZQzotHEMHTDlojizD30+FeQoiPPFmcjbp1F
	enDaJGk5m4g4DktJWCQUSbxPDpuMbvhAfewderTtZw1T72hkPXRuu5tTSQZ4xCr5xaf/MMPvR10
	jnVY1tLBFmqwb2qhEeZR8F9mkwnlih4WCZuVT27W9M17GkWab4NkqDb4A+z/CGWrPw7JMn1kpfc
	n3zKRD30mJKm8HKA4wSFTA6PW3g287Ny+L2VRJ+8Tg22a6H+ysUJX9O9MfwOzi6r9JI+3zEkINW
	HioV+tlqHqGGbkeiFRGE8C2X+uy7gWQGlcu3vEw685EbYs/GAYot/MISjQRtp9DEMU1eubewYrW
	mxFkaozfYbXRwZA6ortz6ISEne67JeuDkEd+/enAvYp4HZ10Pb/5O3ZWWuuOZ2n6v3s/zv5pcRE
	UhUtM4NbUitzQWRfsbEaJKVKNbBWAFqiIMbc9EhQSoBoXUgQSs
X-Google-Smtp-Source: AGHT+IH7Tge21zbaw0o2DhiaC8f2/UyN/tyetWM5dBlNd3ZGUZd1a8k5he9cbrlcYGg45ED3UmsD/A==
X-Received: by 2002:a05:600c:6748:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-47939dfdc35mr81228885e9.15.1765202124462;
        Mon, 08 Dec 2025 05:55:24 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dan Driscoll <dan.driscoll@siemens.com>,
	Noor Ahsan Khawaja <noor.ahsan@siemens.com>,
	Fahad Arslan <fahad.arslan@siemens.com>,
	Andrew Bachtel <andrew.bachtel@siemens.com>
Subject: [PATCH 0/3] xen/arm{32,64}: perform IPA-based TLBI when IPA is
Date: Mon,  8 Dec 2025 18:55:13 +0500
Message-ID: <cover.1765197209.git.haseeb.ashraf@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

This patch series addresses a major issue for running Xen on KVM i.e.
costly emulation of VMALLS12E1IS which becomes worse when this TLBI
is invoked too many times. There are mainly two places where this is
problematic:
(a) When vCPUs switch on a pCPU or pCPUs
(b) When domu mapped pages onto dom0, are to be unmapped, then each
    page being removed by XENMEM_remove_from_physmap has its TLBs
    invalidated by the TLBI variant that flushes the whole range.

This patch series prefers usage of IPA-based TLBIs wherever possible
instead of complete flushing of TLBs every time.

It consists of three patches where the first one address the issue
being discussed for Arm64. Second patch further optimizes the
combined stage-1,2 TLB flushes by leveraging FEAT_nTLBPA. Third patch
introduces IPA-based TLBI for Arm32 in presence of FEAT_nTLBPA.

Haseeb Ashraf (3):
  xen/arm/p2m: perform IPA-based TLBI when IPA is known
  xen/arm: optimize stage-1,2 combined TLBI in presence of FEAT_nTLBPA
  xen/arm32: add CPU capability for IPA-based TLBI

Changes in v3:
- Mainly the handling of repeat TLBI workaround with IPA-based TLBI,
  so that the extra TLBI and DSB are repeated only for the final TLBI
  and DSB of the whole sequence.
- Updated code comments as per feedback. Further details are
  available in each commit's changelog.
- Minor updates to code as per feedback. Further details are
  available in each commit's changelog.

Changes in v2:
- Split up the commit in 3 commits. First commit implements the
  baseline implementation without any addition of new CPU
  capabilities. Implemented new CPU caps in separate features to
  emphasize how each of it optimizes the TLB invalidation.
- Moved ARM32 and ARM64 specific implementations of TLBIs to
  architecture specific flushtlb.h.
- Added references of ARM ARM in code comments.
- Evaluated and added a threshold to select between IPA-based TLB
  invalidation vs fallback to full stage TLB invalidation above
  the threshold.
- Introduced ARM_HAS_NTLBPA CPU capability which leverages
  FEAT_nTLBPA for arm32 as well as arm64.
- Introduced ARM_HAS_TLB_IPA CPU capability for IPA-based TLBI
  for arm32.

Haseeb Ashraf (3):
  xen/arm/p2m: perform IPA-based TLBI when IPA is known
  xen/arm: optimize stage-1,2 combined TLBI in presence of FEAT_nTLBPA
  xen/arm32: add CPU capability for IPA-based TLBI

 xen/arch/arm/cpufeature.c                 | 31 ++++++++
 xen/arch/arm/include/asm/arm32/flushtlb.h | 87 +++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/flushtlb.h | 77 +++++++++++++++++++
 xen/arch/arm/include/asm/cpregs.h         |  4 +
 xen/arch/arm/include/asm/cpufeature.h     | 27 ++++++-
 xen/arch/arm/include/asm/mmu/p2m.h        |  2 +
 xen/arch/arm/include/asm/processor.h      | 10 +++
 xen/arch/arm/mmu/p2m.c                    | 92 +++++++++++++++++------
 8 files changed, 302 insertions(+), 28 deletions(-)

-- 
2.43.0


