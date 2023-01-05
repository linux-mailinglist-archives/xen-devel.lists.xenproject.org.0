Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D556965E6F5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 09:41:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471706.731657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDLo2-0003eX-L5; Thu, 05 Jan 2023 08:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471706.731657; Thu, 05 Jan 2023 08:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDLo2-0003cX-I7; Thu, 05 Jan 2023 08:40:58 +0000
Received: by outflank-mailman (input) for mailman id 471706;
 Thu, 05 Jan 2023 08:40:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZA+=5C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDLo1-0003Um-3i
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 08:40:57 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab522935-8cd4-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 09:40:56 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so757335wms.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 00:40:55 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003cffd3c3d6csm1752711wmq.12.2023.01.05.00.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 00:40:54 -0800 (PST)
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
X-Inumbo-ID: ab522935-8cd4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fZgScg//r5KpzoqMeCWFDkQSqGzHzzpOB/W401gAMtM=;
        b=TqO7OCnB85PKAFF38C3QVGCH5mxK+Y46APnEg13YshyyClqX3Ok8C4+Uq4mYpAhotM
         jzwi0GnpBFxDeKNN3z7KcBZ5JLZsuaw4d1o/YpUtTKBuLbhDgXql4Ti8XQ0otJtvFJJs
         EHavA3csOSEz/2zy/kdF+wWD5eD5fqIwybW+P1FNZIZlRR7aAdlZBiHJwlO86+6wzIvh
         q92rg76kyQhZk7Fwe3G1AMylMdBAyFsUdS3ye+IEFLNQLybLYOiM/BTGKHI4kNYsWWj1
         +jgM3QxyN+PKnUWoqd7NSOKOTJjGe43SxyOE8BAyaPZKs+OD+GOpgt6gDxJyY1TxRPDE
         CZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZgScg//r5KpzoqMeCWFDkQSqGzHzzpOB/W401gAMtM=;
        b=inZWW4C78Mg+PEIDtukyX0xDQ5YWYz5pR7B68otZsZTryYPGT5+mlBT3sYyQbCU6Fj
         cZKUISy7WBwXDgmgxrtkiuaBZoucBi5loHtjR/IlCqVpVNpSYRx3zqwfNSztP/wZ+h9R
         F2UmWNARVm+ldXeAJ1aWhdnwUgyUZ3ISVkOyfWJhyLl7F7INZaSsNFrMV1+Fb9DwhL0B
         M3Qijxe5o3AEzQ3H2TmKWwbaP+BoNf8hC70WG8Qq9Zp7/Wf3obcn2a7tKyIPx9/xI/zO
         tZarxb5FU1FSVSZAe6E0Jw3mcvlXbZeQF2EmYTPNUxn01MmkQv8/uASXheBOlnzuvw4Y
         R+EA==
X-Gm-Message-State: AFqh2kpU/66Alm1sGJaUGQx1EvzuJashoDs6QLcFsUjsqAcHqj4R5QdY
	6xoZY1GYYUXgInDpvRMRIlziPN55eQfPm/1u
X-Google-Smtp-Source: AMrXdXuYODPiQgWsNEyisCw6VhRWEzZEI8c5abzEX6U4l/O3cjPsGK7MvNB2/q/BRvvZ2+FmAB/bYw==
X-Received: by 2002:a1c:2b04:0:b0:3d3:4f28:40c6 with SMTP id r4-20020a1c2b04000000b003d34f2840c6mr34647278wmr.1.1672908054693;
        Thu, 05 Jan 2023 00:40:54 -0800 (PST)
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
Subject: [PATCH v3 0/2] Add minimal RISC-V Xen build and build testing
Date: Thu,  5 Jan 2023 10:40:49 +0200
Message-Id: <cover.1672906559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series introduces the following:
- provide a minimal amount of changes to add initial RISC-V support
  to make Xen binary buildable and runnable for RISC-V architecture
  which can be used for future development and testing.
- add RISC-V 64 cross-compile build jobs to check if any new changes
  break RISC-V build.

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

 automation/gitlab-ci/build.yaml     |  45 ++++++++
 xen/arch/riscv/Makefile             |  16 +++
 xen/arch/riscv/arch.mk              |   4 +
 xen/arch/riscv/include/asm/config.h |   9 +-
 xen/arch/riscv/riscv64/Makefile     |   2 +-
 xen/arch/riscv/riscv64/head.S       |   4 +-
 xen/arch/riscv/xen.lds.S            | 158 ++++++++++++++++++++++++++++
 7 files changed, 233 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/riscv/xen.lds.S

-- 
2.38.1


