Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB38A65EBB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 21:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918085.1322831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuGkQ-00063M-Eh; Mon, 17 Mar 2025 20:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918085.1322831; Mon, 17 Mar 2025 20:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuGkQ-00061j-BP; Mon, 17 Mar 2025 20:07:42 +0000
Received: by outflank-mailman (input) for mailman id 918085;
 Mon, 17 Mar 2025 20:07:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q9Sv=WE=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tuGkP-00061d-DX
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 20:07:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 78e0f172-036b-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 21:07:38 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC03913D5;
 Mon, 17 Mar 2025 13:07:45 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97EDE3F63F;
 Mon, 17 Mar 2025 13:07:34 -0700 (PDT)
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
X-Inumbo-ID: 78e0f172-036b-11f0-9aba-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3 0/7] MPU mm subsystem skeleton
Date: Mon, 17 Mar 2025 20:07:20 +0000
Message-Id: <20250317200727.798696-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this serie implements the skeleton for the MPU memory management subsystem,
at the end of the serie it will be possible to compile the Arm64 arch using MPU.

The minimum Arm Kconfig configuration is this one:

CONFIG_UNSUPPORTED=y
CONFIG_MPU=y
CONFIG_XEN_START_ADDRESS=0x0

Luca Fancellu (5):
  arm/mpu: Add HYPERVISOR_VIRT_START and avoid a check in xen.lds.S
  xen/arm: Introduce frame_table and virt_to_page
  arm/mpu: Kconfig symbols for MPU build
  arm/mpu: Implement stubs for ioremap_attr on MPU
  arm/mpu: Create the skeleton for MPU compilation

Penny Zheng (2):
  xen/arm: Implement virt/maddr conversion in MPU system
  xen: introduce Kconfig ARCH_PAGING_MEMPOOL

 xen/arch/arm/Kconfig                  |  4 +-
 xen/arch/arm/arm64/mpu/Makefile       |  2 +
 xen/arch/arm/arm64/mpu/p2m.c          | 19 ++++++
 xen/arch/arm/arm64/mpu/smpboot.c      | 26 +++++++++
 xen/arch/arm/dom0less-build.c         | 74 ++++++++++++++---------
 xen/arch/arm/include/asm/domain.h     |  2 +
 xen/arch/arm/include/asm/mm.h         | 76 +++---------------------
 xen/arch/arm/include/asm/mmu/mm.h     | 70 ++++++++++++++++++++++
 xen/arch/arm/include/asm/mpu/layout.h |  5 ++
 xen/arch/arm/include/asm/mpu/mm.h     | 41 +++++++++++++
 xen/arch/arm/include/asm/mpu/p2m.h    | 21 +++++++
 xen/arch/arm/include/asm/p2m.h        |  2 +-
 xen/arch/arm/mm.c                     |  5 ++
 xen/arch/arm/mmu/pt.c                 |  5 --
 xen/arch/arm/mpu/Makefile             |  3 +
 xen/arch/arm/mpu/mm.c                 | 45 +++++++++++++-
 xen/arch/arm/mpu/p2m.c                | 84 +++++++++++++++++++++++++++
 xen/arch/arm/mpu/setup.c              | 40 +++++++++++++
 xen/arch/arm/mpu/vmap.c               | 26 +++++++++
 xen/arch/arm/xen.lds.S                |  2 +
 xen/arch/riscv/Kconfig                |  1 +
 xen/arch/x86/Kconfig                  |  1 +
 xen/common/Kconfig                    |  3 +
 xen/include/xen/domain.h              | 17 ++++++
 24 files changed, 472 insertions(+), 102 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm64/mpu/smpboot.c
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
 create mode 100644 xen/arch/arm/include/asm/mpu/p2m.h
 create mode 100644 xen/arch/arm/mpu/p2m.c
 create mode 100644 xen/arch/arm/mpu/setup.c
 create mode 100644 xen/arch/arm/mpu/vmap.c

-- 
2.34.1


