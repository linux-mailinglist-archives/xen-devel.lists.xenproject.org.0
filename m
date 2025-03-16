Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E742A63736
	for <lists+xen-devel@lfdr.de>; Sun, 16 Mar 2025 20:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916066.1321222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tttc4-0004Bx-S0; Sun, 16 Mar 2025 19:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916066.1321222; Sun, 16 Mar 2025 19:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tttc4-0004Ar-KV; Sun, 16 Mar 2025 19:25:32 +0000
Received: by outflank-mailman (input) for mailman id 916066;
 Sun, 16 Mar 2025 19:25:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=84OC=WD=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tttc2-0004Ab-Of
 for xen-devel@lists.xenproject.org; Sun, 16 Mar 2025 19:25:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 69a3adb6-029c-11f0-9aba-95dc52dad729;
 Sun, 16 Mar 2025 20:25:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1802112FC;
 Sun, 16 Mar 2025 12:25:35 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6587A3F694;
 Sun, 16 Mar 2025 12:25:24 -0700 (PDT)
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
X-Inumbo-ID: 69a3adb6-029c-11f0-9aba-95dc52dad729
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/7] MPU mm subsystem skeleton
Date: Sun, 16 Mar 2025 19:24:38 +0000
Message-Id: <20250316192445.2376484-1-luca.fancellu@arm.com>
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
  xen: introduce Kconfig HAS_PAGING_MEMPOOL

 xen/arch/arm/Kconfig                  |  4 +-
 xen/arch/arm/arm64/mpu/Makefile       |  2 +
 xen/arch/arm/arm64/mpu/p2m.c          | 19 ++++++
 xen/arch/arm/arm64/mpu/smpboot.c      | 26 ++++++++
 xen/arch/arm/dom0less-build.c         | 48 ++++++++++----
 xen/arch/arm/include/asm/domain.h     |  2 +
 xen/arch/arm/include/asm/mm.h         | 76 +++-------------------
 xen/arch/arm/include/asm/mmu/mm.h     | 70 ++++++++++++++++++++
 xen/arch/arm/include/asm/mpu/layout.h |  5 ++
 xen/arch/arm/include/asm/mpu/mm.h     | 42 ++++++++++++
 xen/arch/arm/include/asm/mpu/p2m.h    | 21 ++++++
 xen/arch/arm/include/asm/p2m.h        |  2 +-
 xen/arch/arm/mm.c                     |  5 ++
 xen/arch/arm/mmu/pt.c                 |  5 --
 xen/arch/arm/mpu/Makefile             |  3 +
 xen/arch/arm/mpu/mm.c                 | 45 ++++++++++++-
 xen/arch/arm/mpu/p2m.c                | 94 +++++++++++++++++++++++++++
 xen/arch/arm/mpu/setup.c              | 40 ++++++++++++
 xen/arch/arm/mpu/vmap.c               | 26 ++++++++
 xen/arch/arm/xen.lds.S                |  2 +
 xen/common/Kconfig                    |  3 +
 21 files changed, 453 insertions(+), 87 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm64/mpu/smpboot.c
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
 create mode 100644 xen/arch/arm/include/asm/mpu/p2m.h
 create mode 100644 xen/arch/arm/mpu/p2m.c
 create mode 100644 xen/arch/arm/mpu/setup.c
 create mode 100644 xen/arch/arm/mpu/vmap.c

-- 
2.34.1


