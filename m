Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E9B654F93
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 12:17:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468886.728083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8g2W-0001y7-29; Fri, 23 Dec 2022 11:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468886.728083; Fri, 23 Dec 2022 11:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8g2V-0001vo-UR; Fri, 23 Dec 2022 11:16:35 +0000
Received: by outflank-mailman (input) for mailman id 468886;
 Fri, 23 Dec 2022 11:16:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2p1Y=4V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1p8g2T-0001vi-En
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 11:16:33 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4055fcf3-82b3-11ed-8fd4-01056ac49cbb;
 Fri, 23 Dec 2022 12:16:31 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id h12so2109008wmq.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Dec 2022 03:16:31 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 bi20-20020a05600c3d9400b003c6c5a5a651sm4015400wmb.28.2022.12.23.03.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 03:16:29 -0800 (PST)
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
X-Inumbo-ID: 4055fcf3-82b3-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8p7FkEFHFM6Vf85oycH+J0C9gdLXBTWR3FE9O8T6i+o=;
        b=hnhWxG4Zc0VM1yUBQyVDX9KdnSJxKY3eR9sNH8+ldbO4Nf3zCxT/9CbMmc+3h/Gfuu
         3hCEGMhXVjABmUVyWcN3CKEi+IMcRgO2uuPea0hUJw7V55l0b3ZOVUOFRQKyQyE1uhXv
         ML3Raqsm96TX2rYpX5ktwP4xshEKrMynzvuFXT3lHLCsHHhjiRsusXmA2WjHwIw55FSn
         6wYy14SxU9G0PPEpsgBhsWvVO4DJnZaJLjJtyW6u11WtvohyLFj3B3WvbIPrHGHnQVIZ
         2yYCWAJHzJkPbVO2Jb0kgwiYM2joAXXJLaS+a5A2AM5YRXOuhzICmyNCqd/OGypbiA3N
         oCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p7FkEFHFM6Vf85oycH+J0C9gdLXBTWR3FE9O8T6i+o=;
        b=WbPKDOzIbMBNHPPURG1dMGwWutq0iUl299GKI8vbBIonRKaybOBSPGw1Q2H/zr0aaS
         xUqk97XqGzNc5FJXj77f8ofJ5hYzkciMu+hmXqRXVTY63ZAnoAYqthmWHPznU0g5110U
         T9xq6mt9eyQm1CZCfEyZcGLLVX/0hSwb+Y3PADlzJsmacGRFdtm6xC7Gaab/mKfIMR/P
         Q11SWSAUKGvcCcbHESiyqWLpR/PJMEOrI8uKKUwpyaQCwWVpxN0XOV2P4IyoqpAjO47B
         cW/3gulnKvi3eZeoAw7bheR6swlOZOn7dun+BU5VVHl5OR7svxLUTJq80jFryumTnxYl
         dtNg==
X-Gm-Message-State: AFqh2kobIZSzkksrQP6f03RsPiFDqHCKONFnSmuGJBXuzIEa/D+aPPU7
	46437nGFnvd3JSbltkvPKEUr8skZn05BUxfX
X-Google-Smtp-Source: AMrXdXuHoc1lQNz6cqhEbB68jWgtp+gqi4wJdIW8Vr5Y7GxMsuCxl0k1liV51sygYxcqeawd5HnP9g==
X-Received: by 2002:a05:600c:54eb:b0:3c6:e63e:89aa with SMTP id jb11-20020a05600c54eb00b003c6e63e89aamr6882566wmb.6.1671794190230;
        Fri, 23 Dec 2022 03:16:30 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v1 0/4] Add minimal RISC-V Xen build and build testing
Date: Fri, 23 Dec 2022 13:16:19 +0200
Message-Id: <cover.1671789736.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch series introduces the following:
- provide a minimal amount of changes to add initial RISC-V support
  to make Xen binary buildable and runnable for RISC-V architecture
   which can be used for future development and testing.
- add RISC-V 64 cross-compile build jobs to check if any new changes
  break RISC-V build.
- minor fixes to make automation build script work with cross-compilers.

Oleksii Kurochko (4):
  arch/riscv: initial RISC-V support to build/run minimal Xen
  automation: add cross-compiler support for the build script
  automation: add python3 package for riscv64.dockerfile
  automation: add RISC-V 64 cross-build tests for Xen

 automation/build/archlinux/riscv64.dockerfile |  3 +-
 automation/gitlab-ci/build.yaml               | 43 ++++++++++++
 automation/scripts/build                      | 10 +--
 xen/arch/riscv/Makefile                       | 30 ++++++++
 xen/arch/riscv/arch.mk                        | 10 +++
 xen/arch/riscv/include/asm/config.h           | 26 ++++++-
 xen/arch/riscv/include/asm/types.h            | 11 +++
 xen/arch/riscv/riscv64/Makefile               |  2 +-
 xen/arch/riscv/riscv64/head.S                 |  2 +-
 xen/arch/riscv/xen.lds.S                      | 69 +++++++++++++++++++
 10 files changed, 197 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/types.h
 create mode 100644 xen/arch/riscv/xen.lds.S

-- 
2.38.1


