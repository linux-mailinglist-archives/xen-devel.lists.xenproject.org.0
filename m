Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E28FA2D036
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 23:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884030.1293831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWPj-0003FN-CV; Fri, 07 Feb 2025 22:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884030.1293831; Fri, 07 Feb 2025 22:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWPj-0003DJ-8f; Fri, 07 Feb 2025 22:01:31 +0000
Received: by outflank-mailman (input) for mailman id 884030;
 Fri, 07 Feb 2025 22:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVmI=U6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tgWPh-0002x7-UJ
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 22:01:29 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14b62bcd-e59f-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 23:01:28 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so30611255e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 14:01:28 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb4410e6sm2636035f8f.8.2025.02.07.14.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 14:01:26 -0800 (PST)
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
X-Inumbo-ID: 14b62bcd-e59f-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738965687; x=1739570487; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETRIGHhOQudaFGBOvr+95egwtYugvrL3PyDVwQ1dtZQ=;
        b=VgU2ifiholR3v2enlGhC9j+g75VSb/zz2NxTFrEO/pH5Gxw4i3QvGyqbxK/iV7+LrG
         EVUpjGIUKLXHlrRWnB84Zpesc/6xNHMIaK/LY7a1fM7ttIAd0t2P+8wfaLMtVfz/N+jD
         /qXXdm1IR2JpO6Xw26+42XCLzM73e3rxmV0j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738965687; x=1739570487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETRIGHhOQudaFGBOvr+95egwtYugvrL3PyDVwQ1dtZQ=;
        b=F1RwClxrrzRI6yW826fy5SAOb023vbNYlhCl3Q4d9YRH7bw9OaTMKmkI1mlvam4Wwq
         GE9lRFHjVjLBxWWQM7hd3ij7YcfV58jSpvEDGXXtmGfu6zNMn3EFNY2BSX0Gq6W3B9UU
         pkpgrd9lL7+I5lp4wp6+xgZ92VrdsisBFCIavQqm6KRwx9B6JTJyPnMRounKXglWMHIy
         J3qHoScgor2SDsQIEy2Qtdl54XtByrE6Vx+CpUG9Ywq2AjCQlAgIuRLne8DqOxza38Zd
         8ialgQvINwMyWK98576CsINPViRYUCwo0Z3NNu15W1iis6RvbGtwpYoXlEk4dPHe4pz9
         5mmQ==
X-Gm-Message-State: AOJu0YxoxUrHVUn/12solvpgzLwuYQe2IMPQZ4r0tPcMavtiYsYHpk88
	evCqaLtVmsb473IVLxzjFKLq8evP+2GP3PR5lglmslMGNoEjJNrGCy6ameLKpIsk3agjtpa/JK3
	gm+E=
X-Gm-Gg: ASbGncs6hZNxg7kk9XJh27OG7IhQ3cLVZZZ/qVpKhdPNghEcklshSBj5C4NukIMjHwY
	UXit0LFdRBfR6d0BozXYLLgRYEbKPBGrXiG7dLp/z1nB2AU137LUXdWJawsihAge/RqRSzozVPb
	Re3k1xN0L1geSo6wjJVUBT1J3lhix9Yaeaqc8t5DBTfNjZmuYGUfGJCMcuKK9pkpDHeykKgJ8IS
	dxnUIwj4uSUwUQGtHwb7H+HnNibPt9MyENlkdvAiwwiXtsnemD8kexfUcUOjVW5f38yvWNyaHgs
	OHY2PwcePxEuGhiOYTAgq5erHGJVrTs7pNKey+Hs8mZ8+++gpTKFqglyWLAE6hHBfrlHC0Q=
X-Google-Smtp-Source: AGHT+IF8hvncM2nE5o+lvfUrrz84Si2wuww25Mwdkt8buUV5xM48Zy/nWq/rLzV3LS9I1/1Qezyg1w==
X-Received: by 2002:a05:600c:4f8e:b0:436:1baa:de1c with SMTP id 5b1f17b1804b1-43924990cdbmr53215365e9.13.1738965687603;
        Fri, 07 Feb 2025 14:01:27 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH for-4.20 0/3] RISCV: Bugfixes and UBSAN
Date: Fri,  7 Feb 2025 22:01:19 +0000
Message-Id: <20250207220122.380214-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

One bugfix, and two minor patches to get UBSAN working with RISCV.  They
should be considered for 4.20 at this juncture.

I tried to get this working everywhere, but:

1) ARM32 has some problem with dump_execution_state() and dies with an
   undefined instruction error.

2) PPC doesn't get any console output, and also appears to have no exception
   handling either.  Also, when it doesn't succeed, it takes ages to fail.

Andrew Cooper (3):
  RISCV/boot: Run constructors during setup
  RISCV/asm: Use CALL rather than JAL
  RISCV: Activate UBSAN in testing

 automation/gitlab-ci/build.yaml        |  3 +++
 xen/arch/riscv/Kconfig                 |  1 +
 xen/arch/riscv/entry.S                 |  2 +-
 xen/arch/riscv/include/asm/processor.h |  2 ++
 xen/arch/riscv/riscv64/head.S          | 12 ++++++------
 xen/arch/riscv/setup.c                 |  2 ++
 xen/arch/riscv/traps.c                 |  2 +-
 xen/common/ubsan/ubsan.c               |  5 ++++-
 8 files changed, 20 insertions(+), 9 deletions(-)

-- 
2.39.5


