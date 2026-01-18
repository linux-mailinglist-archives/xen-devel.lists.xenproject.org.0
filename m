Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E6BD39550
	for <lists+xen-devel@lfdr.de>; Sun, 18 Jan 2026 14:34:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1207809.1520176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhSul-0003sO-Qh; Sun, 18 Jan 2026 13:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1207809.1520176; Sun, 18 Jan 2026 13:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhSul-0003pJ-KI; Sun, 18 Jan 2026 13:33:59 +0000
Received: by outflank-mailman (input) for mailman id 1207809;
 Sun, 18 Jan 2026 13:33:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTiv=7X=gmail.com=haseebashraf091@srs-se1.protection.inumbo.net>)
 id 1vhSuk-0003p9-1c
 for xen-devel@lists.xenproject.org; Sun, 18 Jan 2026 13:33:58 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5417a52e-f472-11f0-9ccf-f158ae23cfc8;
 Sun, 18 Jan 2026 14:33:54 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-64b921d9e67so5818392a12.3
 for <xen-devel@lists.xenproject.org>; Sun, 18 Jan 2026 05:33:52 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.37.230.99])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65452cdab55sm7683163a12.10.2026.01.18.05.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 05:33:50 -0800 (PST)
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
X-Inumbo-ID: 5417a52e-f472-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768743231; x=1769348031; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yfRH+v8o1fMcD7nIgwoL2ojGo+xNx8nkGSixxBQ19g=;
        b=Ep5NgPaj1b74b9VAFCFvCQEDHgRo3jj3jdj/mGancLWRoqfNdsTIJ2iYYdRw8c5jtd
         TR0ovftcbmdoLf8X4raUrtUX9mn+8jnaWBy9ZrdbSvGqizvEZtWW4gbsd8TCR/HTWycX
         UMTasm/flLMCr2xLM5xWllqRnA3ca6Ty86NEgkj8RTCJJnQp/57+5xk59oSOtBHkYCZI
         OEhl/nZzFyce5OhILb9A7jI+hmiOGubAyUiYs33wxzM1k1pKfnr3rH55WPZngo/8LyRs
         MPGlp9Gki/eFz4WsOUlIu6mTgt2RmgMEPIpYH8oDB9W2Vb9CdV38wD1YGtf0WuNTG4+J
         1cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768743231; x=1769348031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yfRH+v8o1fMcD7nIgwoL2ojGo+xNx8nkGSixxBQ19g=;
        b=iDXfFu9WLsBopzgHaOo3sYg6bvc8dfJ2aOODKFnkc88TYh0GyXDK1U1ptjsNZCGvvh
         lqIgArLbQ+O46vdnIs76O/Pyj3syWZC2OvnjmdjvlQRroKtchxmcVO4JzKpBpr8aiklj
         ZnkPsvaXRrvSFphbI5kpXP9gu7MNsae1Sujyuc4yYvtyPDi+pkN0JMXgZhIIAMvU5dcV
         jexSwHbzBzOnUhI5zWSyhSLY76RXo9cKqOT7XRKgVgL8ZClpBdO19wR9VCci8v2ne1+U
         pkWoUGSRy30ABu8NF5gN6kOoNTL7B26qcpeyIDRwKJ/LVdMXmPo4dXdHODgq3NK3GZc/
         s9DA==
X-Gm-Message-State: AOJu0Yz/RRE13w+FY5XiURIxwTCTZWgqUjob19DzSo0IR2WhoOfMHwof
	bGnUZmTfx/yBhzaDF3kPuEuEaivfkxDS1p/Mf+wjBLWb7bNJXKiR2Djk+HS8cw==
X-Gm-Gg: AY/fxX5RxaKdmdTW2CqeRpGpsrkWZGCE8QAN94dkffUepUy+aSJcL5BlHMljvD11DjL
	eOLPq9mIg5fBcLiKahowC2jEn9Umo9fcv4P8YFPpGGlt1qmGbUWUPTsT1pnTQgymj4QDONzE72s
	7ZE8ShCS7YVriCbVtHCgcTjF5OZdibL3qfVaghP2WRCV4SuIxeWxiMLQtkH1SzaD9tNtKstDmxE
	KsBwe1vIASFvLtXfvbQaw/SYKgV8ItpOmDvtvuEpDwLDc80XKh4POMY5ptcjwgRKzC4sEDJaZpA
	lzJdaM1H2C/9YsboSVXTWbjhlXG7niT2rR7qcMBIVQz+ADhXAmxK8jDyW6UI/iFsxSeI86jbtiw
	nLJ74sOfBgNLtZzREubbtrd7mj4ZFH9oCGtP/2soGLF4F9wAl/I37VvWv66HkC9gtCL1KDvYER5
	KKE7hLxZoZ6fYLAKnQLBToPKnuwGsEcvwbLBenPCJeoxwM5qZ16g==
X-Received: by 2002:a05:6402:1466:b0:640:aae4:b84e with SMTP id 4fb4d7f45d1cf-654b955d67bmr6344710a12.13.1768743231135;
        Sun, 18 Jan 2026 05:33:51 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v3 0/3] xen/arm{32,64}: perform IPA-based TLBI when IPA is known
Date: Sun, 18 Jan 2026 18:33:26 +0500
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


