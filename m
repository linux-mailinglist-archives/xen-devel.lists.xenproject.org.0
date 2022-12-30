Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FD659889
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 14:02:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469898.729331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBF14-00005P-Ni; Fri, 30 Dec 2022 13:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469898.729331; Fri, 30 Dec 2022 13:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBF14-0008UL-Kj; Fri, 30 Dec 2022 13:01:42 +0000
Received: by outflank-mailman (input) for mailman id 469898;
 Fri, 30 Dec 2022 13:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dm99=44=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pBF13-0008U7-FH
 for xen-devel@lists.xenproject.org; Fri, 30 Dec 2022 13:01:41 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18686548-8842-11ed-8fd4-01056ac49cbb;
 Fri, 30 Dec 2022 14:01:37 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id co23so19870103wrb.4
 for <xen-devel@lists.xenproject.org>; Fri, 30 Dec 2022 05:01:37 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b00273cd321a1bsm19309548wro.107.2022.12.30.05.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 05:01:36 -0800 (PST)
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
X-Inumbo-ID: 18686548-8842-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0w1WXhENrTHSsk90yxf4HRg4bGLEGBPWs6UxuKZ0Zw=;
        b=Ht4htnfXIqaFf3fRYAY+hUt2gKN18eTp8EY1+KhN/jqu8jLG2TPMrfpCpywpTxCUDE
         FPKlQFrqPUGqpwTOxSfukKTQrXQ9OTrLte/0bCLLOQvevRDZ4fk3KfZaUmKzETytbIdo
         fOsqKdflKvj0CMGZiP32j62M9VVnyJq84piEN/Bo4+PLODwF4Pwb+v4cTxlbEZyudY5+
         CQmiVQMCpoI75CDBcM3rk2I6wQIIvjVwxRYVhI4lX8F4Dh4ceg5W6ORzza0cQNbBOdPk
         lSWmFTTPduZpwuD5JBy1TS3UyFpW6OsEw53qh0Dpf2Wn76yf1lO3Uect4FSuk7/5Hh2l
         XZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0w1WXhENrTHSsk90yxf4HRg4bGLEGBPWs6UxuKZ0Zw=;
        b=n7+t8PN8MMeKTvP+c4TGdYhz10dibpCkSjfOoEBTXhLsbezzBSJ0YxCzAIjSWDed6E
         G3RTYezfqFAr1ewVcAtyB4SJiG6IEAciJwbb0A0Tg5AnxQkfxhXgK0uvVArWt30W/ZkP
         xA+iLhAQuA/s989S0qnPiQYGmw4aDa6ieP4wWKboUSbkaPHFP+p+TwGFqQ7S4lAoevGT
         I4q5zMwkbgpVEn69nf6+HD3+j5DoGUu+0Eqb54JDKcgdFgWwgtEGYazLJDQVB45YfnOD
         KbB4SewsAabs68pRsqFHzwko/woYaVJhNlGM9akLuSvY52p7Vo5dVm6KR7v0HyWsqT+k
         a7Ng==
X-Gm-Message-State: AFqh2kpxs5FXzdt2Y6c45BDQSrjfQKAUXCcZqXiL8XxocdilzlRHS/y5
	hPcoZ7rFO2Ryvnww0Kx089K5KkGNtZWzp3lS
X-Google-Smtp-Source: AMrXdXt+fefo/AfbdDdAzF2kBMe0w6jpIkWQqNeoCpBUCT/Abm6Wjrc1+lvDikpHxh8ihZcSVNpfog==
X-Received: by 2002:a05:6000:614:b0:242:17a6:8bad with SMTP id bn20-20020a056000061400b0024217a68badmr25960680wrb.60.1672405297078;
        Fri, 30 Dec 2022 05:01:37 -0800 (PST)
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
Subject: [XEN PATCH v2 0/2] Add minimal RISC-V Xen build and build testing
Date: Fri, 30 Dec 2022 15:01:30 +0200
Message-Id: <cover.1672401599.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series introduces the following:
- provide a minimal amount of changes to add initial RISC-V support
  to make Xen binary buildable and runnable for RISC-V architecture
  which can be used for future development and testing.
- add RISC-V 64 cross-compile build jobs to check if any new changes
  break RISC-V build.

The patch series is based on "CI: Fixes/cleanup in preparation for
RISCV" patch series which can be found at
https://lists.xenproject.org/archives/html/xen-devel/2022-12/msg01761.html

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
 xen/arch/riscv/riscv64/head.S       |   2 +-
 xen/arch/riscv/xen.lds.S            | 158 ++++++++++++++++++++++++++++
 7 files changed, 233 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/riscv/xen.lds.S

-- 
2.38.1


