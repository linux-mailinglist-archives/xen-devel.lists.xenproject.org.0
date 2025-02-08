Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B381A2D1DF
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 01:05:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884152.1293950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgYLI-0001bn-Uw; Sat, 08 Feb 2025 00:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884152.1293950; Sat, 08 Feb 2025 00:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgYLI-0001a0-SH; Sat, 08 Feb 2025 00:05:04 +0000
Received: by outflank-mailman (input) for mailman id 884152;
 Sat, 08 Feb 2025 00:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lbac=U7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tgYLH-0001YL-9x
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2025 00:05:03 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56272700-e5b0-11ef-b3ef-695165c68f79;
 Sat, 08 Feb 2025 01:04:59 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso18428685e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 16:04:59 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da9656fsm72336295e9.3.2025.02.07.16.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:04:57 -0800 (PST)
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
X-Inumbo-ID: 56272700-e5b0-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738973099; x=1739577899; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HL/TlJYoeABGPFIOj6psDQQYRPwZg23L3IjBaSKmHIY=;
        b=REFspCN6G+fT9wzbbI0E73MRV3V/M4l2fGSTTnKIiUvxYUn7jxEBnKJoQ6F30Q3+3p
         fVA9/gTSp02kP8jbfI4Q1KR6o5XPoWZ8YxQXoTDdRvJ9BunRlMvqgx3TEHyQ1K+vSxCk
         q/ip6Z03CRXw4WhsnRoDTqdR+KsaREH5dDPF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738973099; x=1739577899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HL/TlJYoeABGPFIOj6psDQQYRPwZg23L3IjBaSKmHIY=;
        b=Ila6TEeFMnTYrWhqkW7S9eWmhkZCCYlo8qRcY4cEipEx01k73F1mAbJwe471gDVnyh
         OFbT79oEvl+qkp5ml+nPGPDhFUJn/xl4abMGZ/iXPGxCKiXZsdF/eZt4Bi200j0kKdwz
         dyykJ/GaGT4PO5c9v8Z8tlTGg3DKxdDoSPH6ULuXUmY759CRTJS1OfKYZ21NUlJbWxZK
         qN84gyPKPAa76oF/mhfLeNBC8KbDEjFpucecRzPX5JBOt/EEOZPJSwxJIXhEc6Z/FxVx
         91a3vo7aKRkFuKfLu7qcGQNUuoohDYG+hxFF+Yqi5fd7zHiv631GrHdR2oGSLCO8odJ/
         jnZw==
X-Gm-Message-State: AOJu0YztepoLh11UQ5//RZUOPfUYlL1BVsg1pMcRgQZYxJrvyog621/7
	mo3VGP6wq5f39XZ8p21atcfpGeyCcSgY4/53NJVYU1UmyjgD1tHRfN+6b+INYjC2R9VDrNBYBws
	XfaM=
X-Gm-Gg: ASbGncv3h1k8wH4OcsRAhAHxgo/vA4W+/eSdcUtidxeX3k1oyp61Ps1o68gYQl3zkDT
	exuNd7nezT8m/v29EiwUeF+IlnICWgcVt/FzBSqbkwO2Jj0XZqfkXzRqEsjwhEJfgCMtcWBmNbC
	SpaGYyfnVIH7WtfCTKQWY0Mr9zzBOV2t8SNYnpNVywcVHYRRnvVGSM5jiSWZwzAHm1uylMk2t2q
	7EHXW1UpBsyz33UQVma+uh81uo365fflRYVhuVYNpArPBPzWKOt3QpO8paaBZq72ehMJp8lw2G0
	rJWOgB6mgYwWJ6CulUw0SHpQrbkMrRovxKKocDN5bxGIXP3sVv+8Lo9uL8BE++45dFfkuW0=
X-Google-Smtp-Source: AGHT+IHLZDZ50TdvK/be2XrBj+VFeHXt1EpiecVQhauprUCbB+ZMeYT/E3MERHD5hPJqnfTPewtTzw==
X-Received: by 2002:a05:600c:1e15:b0:436:1aa6:b8ee with SMTP id 5b1f17b1804b1-4392497ce92mr42627775e9.2.1738973098760;
        Fri, 07 Feb 2025 16:04:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 0/4] Other fixes from UBSAN enablement
Date: Sat,  8 Feb 2025 00:02:52 +0000
Message-Id: <20250208000256.431883-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch 1 is a long outstanding bug, and hopefully still qualifies for 4.20 at
this point.

Patches 2 and 3 probably don't, seeing as I can't seem to get UBSAN working
for PPC (for which patch 3 at least would be a prerequisite to compile).  They
can wait until 4.21 now.

Andrew Cooper (4):
  ARM32/traps: Fix do_trap_undefined_instruction()'s detection of kernel text
  ARM: Fix register constraints in run_in_exception_handler()
  xen: Centralise the declaration of dump_execution_state()
  [BROKEN] PPC: Activate UBSAN in testing

 automation/gitlab-ci/build.yaml        | 3 +++
 xen/arch/arm/arm32/traps.c             | 3 +--
 xen/arch/arm/include/asm/bug.h         | 6 +++---
 xen/arch/arm/include/asm/processor.h   | 3 ---
 xen/arch/ppc/Kconfig                   | 1 +
 xen/arch/ppc/stubs.c                   | 2 +-
 xen/arch/riscv/include/asm/processor.h | 2 --
 xen/arch/x86/include/asm/processor.h   | 1 -
 xen/common/ubsan/ubsan.c               | 1 -
 xen/include/xen/bug.h                  | 3 +++
 xen/include/xen/kernel.h               | 2 --
 11 files changed, 12 insertions(+), 15 deletions(-)

-- 
2.39.5


