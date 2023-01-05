Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB6C65EA4F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 13:02:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471846.731856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOwU-00074y-N3; Thu, 05 Jan 2023 12:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471846.731856; Thu, 05 Jan 2023 12:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOwU-000728-Jc; Thu, 05 Jan 2023 12:01:54 +0000
Received: by outflank-mailman (input) for mailman id 471846;
 Thu, 05 Jan 2023 12:01:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZA+=5C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDOwT-0006u7-2X
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 12:01:53 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdc2f18e-8cf0-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 13:01:52 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id ja17so27834038wmb.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 04:01:52 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 x5-20020a05600c21c500b003d9b89a39b2sm2159826wmj.10.2023.01.05.04.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 04:01:51 -0800 (PST)
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
X-Inumbo-ID: bdc2f18e-8cf0-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SlLZPNoeJrg9cCvwh4LLybSVlr8nbBmVdnfp1y+ineg=;
        b=hzRcx6YBiRcm4FokAjkbrcKpadrRq2GwCMqX7mJssJXf+av4F1cwWTYDYof9ohOX0E
         QHgcn4c/eLYPFWKqfhCqQc+Ykp9kePrrxl/AMqDFaoZPULpGq7mIeKsHEl7ro1P+PGUK
         FGMzNL0ZvmJgpvRNdSJ75CaQteR7AZ1J/OjvyNObec5xt56Syz/1MpfyGmiy7XMM9kPO
         HUrS2E7ShbrxBzPhl3XVT6V1ojlxFDAM/wBuYC8cGNl4kLeGot/MhWuq+AKbsm0kgoGB
         Xzv3Wg95Qr2kIrKs7MjsTN2v9TSS5/AT/PbnN0VO9RGTyn2gQJLJrW4PjeuEwKmmqqsp
         /fEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlLZPNoeJrg9cCvwh4LLybSVlr8nbBmVdnfp1y+ineg=;
        b=yyAy/80HCFbkys9mSLXzkCL7lOle4CeiV8tGsFiVloqW+XC35tCWBDqTqiRkWU4BZg
         FaJJts5iLfShXLD4NtwTklyo12V0L/Emz9pqdGXoG7wk4o2QpLsOkdeW+LN0PvOQ0Krb
         DqbF1lcNwrbhAy6AzdEd7MOWS7rCyvvxUzQ8TEkIE4ytErb7gU65VAizOUJCUvwR+GZs
         KYXWxFOLFFJcN7Q35p06vxpl11gyIoQFRyGASXgEpErC0O5IwM2Zhe+DPWGaVQosvzil
         QBX433OvGQqswA4YEbo1SfamMLsID95lYsOpIt2hfNXhvIsC1JLVJAQE3T4LOhYGON83
         lVGw==
X-Gm-Message-State: AFqh2kpYZajz9b7jXzsZ6Q26iqiUceudNc86bSeyRnaX2SqP9N1D/and
	EmKhip8HAwLwcGugU1s/n6TOc0C6s8bQHab+
X-Google-Smtp-Source: AMrXdXvODMR5TZzDvOc65KDrVwjTNQu+GioNqH2BQd8eEEciG1Bvmi3YA5DM+yUlGniuo0fV8xbKIA==
X-Received: by 2002:a1c:7c0f:0:b0:3d5:816e:2fb2 with SMTP id x15-20020a1c7c0f000000b003d5816e2fb2mr39008747wmc.14.1672920111508;
        Thu, 05 Jan 2023 04:01:51 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [PATCH v4 0/2] Add minimal RISC-V Xen build and build testing
Date: Thu,  5 Jan 2023 14:01:44 +0200
Message-Id: <cover.1672912316.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series introduces the following:
- provide a minimal amount of changes to add initial RISC-V support
  to make Xen binary buildable and runnable for RISC-V architecture
  which can be used for future development and testing.
- add RISC-V 64 cross-compile build jobs to check if any new changes
  break RISC-V build.

Changes in V4:
- Rebase on mainline 'staging'.
- Code style fixes and commit message updates.
- Minor changes of riscv/Makefile and build.yaml

Changes in V3:
- Remove include of <asm/config.h> from head.S.

Changes in V2:
- Remove the patch "automation: add cross-compiler support
  for the build script" because it was reworked as a part of the patch
  series "CI: Fixes/cleanup in preparation for RISCV".
- Remove the patch "automation: add python3 package for riscv64.dockerfile"
  because it is not necessary for RISCV Xen binary build now.
- Rework the patch "arch/riscv: initial RISC-V support to build/run
  minimal Xen" according to the comments about v1 of the patch series.
- Add HYPERVISOR_ONLY to RISCV jobs in build.yaml after rebasing on
  "CI: Fixes/cleanup in preparation for RISCV" patch series.

Oleksii Kurochko (2):
  arch/riscv: initial RISC-V support to build/run minimal Xen
  automation: add RISC-V 64 cross-build tests for Xen

 automation/gitlab-ci/build.yaml     |  56 ++++++++++
 xen/arch/riscv/Makefile             |  14 +++
 xen/arch/riscv/arch.mk              |   4 +
 xen/arch/riscv/include/asm/config.h |   9 +-
 xen/arch/riscv/riscv64/Makefile     |   2 +-
 xen/arch/riscv/riscv64/head.S       |   4 +-
 xen/arch/riscv/xen.lds.S            | 158 ++++++++++++++++++++++++++++
 7 files changed, 242 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/riscv/xen.lds.S

-- 
2.38.1


