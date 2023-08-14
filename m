Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF9277B067
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 06:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583055.913069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9S-0002Gw-Oa; Mon, 14 Aug 2023 04:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583055.913069; Mon, 14 Aug 2023 04:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9S-0002FK-JV; Mon, 14 Aug 2023 04:25:58 +0000
Received: by outflank-mailman (input) for mailman id 583055;
 Mon, 14 Aug 2023 04:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M3t=D7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qVP9R-0002FE-GS
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 04:25:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a86cf4e4-3a5a-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 06:25:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A2D52F4;
 Sun, 13 Aug 2023 21:26:36 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 251F53F64C;
 Sun, 13 Aug 2023 21:25:49 -0700 (PDT)
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
X-Inumbo-ID: a86cf4e4-3a5a-11ee-b288-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 00/13] xen/arm: Split MMU code as the prepration of MPU work
Date: Mon, 14 Aug 2023 12:25:23 +0800
Message-Id: <20230814042536.878720-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on the discussion in the Xen Summit [1], sending this series out after
addressing the comments in v4 [2] as the preparation work to add MPU support.
Full series of single core MPU support to boot Linux guest can be found
in [3], which passed the GitLab CI check in [4].

Mostly code movement, with some of Kconfig and build system (mainly Makefiles)
adjustment. No functional change expected.

This series is based on:
a9a3b432a8 x86: adjust comparison for earlier signedness change

[1] https://lore.kernel.org/xen-devel/AS8PR08MB799122F8B0CB841DED64F4819226A@AS8PR08MB7991.eurprd08.prod.outlook.com/
[2] https://lore.kernel.org/xen-devel/20230801034419.2047541-1-Henry.Wang@arm.com/
[3] https://gitlab.com/xen-project/people/henryw/xen/-/commits/mpu_v5/
[4] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/966450933

Henry Wang (4):
  xen/arm: Introduce CONFIG_MMU Kconfig option
  xen/arm64: Split and move MMU-specific head.S to mmu/head.S
  xen/arm64: Fold setup_fixmap() to create_page_tables()
  xen/arm: Extract MMU-specific code

Penny Zheng (6):
  xen/arm: Fold pmap and fixmap into MMU system
  xen/arm: mm: Use generic variable/function names for extendability
  xen/arm: mmu: move MMU-specific setup_mm to mmu/setup.c
  xen/arm: mmu: move MMU specific P2M code to mmu/p2m.{c,h}
  xen/arm: mmu: relocate copy_from_paddr() to setup.c
  xen/arm: mmu: enable SMMU subsystem only in MMU

Wei Chen (3):
  xen/arm64: head.S: Introduce enable_{boot,secondary}_cpu_mm()
  xen/arm64: prepare for moving MMU related code from head.S
  xen/arm: Move MMU related definitions from config.h to mmu/layout.h

 xen/arch/arm/Kconfig                    |    5 +-
 xen/arch/arm/Makefile                   |    1 +
 xen/arch/arm/arm32/head.S               |    4 +-
 xen/arch/arm/arm64/Makefile             |    2 +-
 xen/arch/arm/arm64/head.S               |  496 +------
 xen/arch/arm/arm64/mmu/Makefile         |    2 +
 xen/arch/arm/arm64/mmu/head.S           |  460 ++++++
 xen/arch/arm/arm64/{ => mmu}/mm.c       |   11 +-
 xen/arch/arm/arm64/smpboot.c            |    6 +-
 xen/arch/arm/include/asm/arm64/macros.h |   36 +
 xen/arch/arm/include/asm/arm64/mm.h     |    7 +-
 xen/arch/arm/include/asm/config.h       |  132 +-
 xen/arch/arm/include/asm/fixmap.h       |    7 +-
 xen/arch/arm/include/asm/mm.h           |   30 +-
 xen/arch/arm/include/asm/mmu/layout.h   |  146 ++
 xen/arch/arm/include/asm/mmu/mm.h       |   55 +
 xen/arch/arm/include/asm/mmu/p2m.h      |   18 +
 xen/arch/arm/include/asm/p2m.h          |   33 +-
 xen/arch/arm/include/asm/page.h         |   15 -
 xen/arch/arm/include/asm/setup.h        |    8 +-
 xen/arch/arm/kernel.c                   |   27 -
 xen/arch/arm/mm.c                       | 1119 --------------
 xen/arch/arm/mmu/Makefile               |    3 +
 xen/arch/arm/mmu/mm.c                   | 1153 +++++++++++++++
 xen/arch/arm/mmu/p2m.c                  | 1610 ++++++++++++++++++++
 xen/arch/arm/mmu/setup.c                |  366 +++++
 xen/arch/arm/p2m.c                      | 1772 ++---------------------
 xen/arch/arm/setup.c                    |  326 +----
 xen/arch/arm/smpboot.c                  |    4 +-
 xen/arch/arm/xen.lds.S                  |    1 +
 xen/drivers/passthrough/Kconfig         |    3 +-
 31 files changed, 4042 insertions(+), 3816 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mmu/Makefile
 create mode 100644 xen/arch/arm/arm64/mmu/head.S
 rename xen/arch/arm/arm64/{ => mmu}/mm.c (95%)
 create mode 100644 xen/arch/arm/include/asm/mmu/layout.h
 create mode 100644 xen/arch/arm/include/asm/mmu/mm.h
 create mode 100644 xen/arch/arm/include/asm/mmu/p2m.h
 create mode 100644 xen/arch/arm/mmu/Makefile
 create mode 100644 xen/arch/arm/mmu/mm.c
 create mode 100644 xen/arch/arm/mmu/p2m.c
 create mode 100644 xen/arch/arm/mmu/setup.c

-- 
2.25.1


