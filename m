Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951DF7BD19F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 03:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614074.954982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpegE-0005bk-Hc; Mon, 09 Oct 2023 01:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614074.954982; Mon, 09 Oct 2023 01:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpegE-0005Zz-Et; Mon, 09 Oct 2023 01:03:30 +0000
Received: by outflank-mailman (input) for mailman id 614074;
 Mon, 09 Oct 2023 01:03:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDuw=FX=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qpegC-0005Zt-En
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 01:03:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a6b111c5-663f-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 03:03:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0025C15;
 Sun,  8 Oct 2023 18:04:05 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4B353F5A1;
 Sun,  8 Oct 2023 18:03:22 -0700 (PDT)
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
X-Inumbo-ID: a6b111c5-663f-11ee-98d3-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 0/8] xen/arm: Split MMU code as the prepration of MPU work
Date: Mon,  9 Oct 2023 09:03:05 +0800
Message-Id: <20231009010313.3668423-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on the discussion in the Xen Summit [1], sending this series out after
addressing the comments in v6 [2] as the preparation work to add MPU support.
The series passed the GitLab CI check in [3].

Mostly code movement and function folding, with some of Kconfig and build
system (mainly Makefiles) adjustment.

This series is based on:
ffa1437686 tools/xenpvboot: remove as unable to convert to Python 3

[1] https://lore.kernel.org/xen-devel/AS8PR08MB799122F8B0CB841DED64F4819226A@AS8PR08MB7991.eurprd08.prod.outlook.com/
[2] https://lore.kernel.org/xen-devel/20230828013224.669433-1-Henry.Wang@arm.com/
[3] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1029280530 

Henry Wang (6):
  xen/arm: Split page table related code to mmu/pt.c
  xen/arm: Split MMU system SMP MM bringup code to mmu/smpboot.c
  xen/arm: Fold mmu_init_secondary_cpu() to head.S
  xen/arm: Extract MMU-specific MM code
  xen/arm: Split MMU-specific setup_mm() and related code out
  xen/arm: Fold pmap and fixmap into MMU system

Penny Zheng (2):
  xen/arm: Rename init_secondary_pagetables() to prepare_secondary_mm()
  xen/arm: mmu: move MMU specific P2M code to mmu/p2m.{c,h}

 xen/arch/arm/Kconfig               |    2 +-
 xen/arch/arm/Makefile              |    1 +
 xen/arch/arm/arm32/Makefile        |    1 +
 xen/arch/arm/arm32/head.S          |   22 +-
 xen/arch/arm/arm32/mmu/Makefile    |    1 +
 xen/arch/arm/arm32/mmu/mm.c        |  301 +++++
 xen/arch/arm/arm64/Makefile        |    1 -
 xen/arch/arm/arm64/mmu/Makefile    |    1 +
 xen/arch/arm/arm64/mmu/head.S      |   21 +
 xen/arch/arm/arm64/{ => mmu}/mm.c  |   84 ++
 xen/arch/arm/include/asm/mm.h      |   31 +-
 xen/arch/arm/include/asm/mmu/mm.h  |   44 +
 xen/arch/arm/include/asm/mmu/p2m.h |   18 +
 xen/arch/arm/include/asm/p2m.h     |   26 +-
 xen/arch/arm/include/asm/page.h    |   15 -
 xen/arch/arm/include/asm/setup.h   |    5 +
 xen/arch/arm/kernel.c              |   28 -
 xen/arch/arm/mm.c                  | 1212 ------------------
 xen/arch/arm/mmu/Makefile          |    4 +
 xen/arch/arm/mmu/p2m.c             | 1736 ++++++++++++++++++++++++++
 xen/arch/arm/mmu/pt.c              |  736 +++++++++++
 xen/arch/arm/mmu/setup.c           |  376 ++++++
 xen/arch/arm/mmu/smpboot.c         |  124 ++
 xen/arch/arm/p2m.c                 | 1837 +---------------------------
 xen/arch/arm/setup.c               |  324 +----
 xen/arch/arm/smpboot.c             |    4 +-
 26 files changed, 3565 insertions(+), 3390 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mmu/Makefile
 create mode 100644 xen/arch/arm/arm32/mmu/mm.c
 rename xen/arch/arm/arm64/{ => mmu}/mm.c (60%)
 create mode 100644 xen/arch/arm/include/asm/mmu/mm.h
 create mode 100644 xen/arch/arm/include/asm/mmu/p2m.h
 create mode 100644 xen/arch/arm/mmu/Makefile
 create mode 100644 xen/arch/arm/mmu/p2m.c
 create mode 100644 xen/arch/arm/mmu/pt.c
 create mode 100644 xen/arch/arm/mmu/setup.c
 create mode 100644 xen/arch/arm/mmu/smpboot.c

-- 
2.25.1


