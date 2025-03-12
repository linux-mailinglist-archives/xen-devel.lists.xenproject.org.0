Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B16A1A5DE67
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 14:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910335.1317077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWF-0006yA-1j; Wed, 12 Mar 2025 13:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910335.1317077; Wed, 12 Mar 2025 13:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWE-0006v8-T8; Wed, 12 Mar 2025 13:53:10 +0000
Received: by outflank-mailman (input) for mailman id 910335;
 Wed, 12 Mar 2025 13:53:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FzNf=V7=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tsMWD-0006ux-Ek
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 13:53:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 53a054d4-ff49-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 14:53:07 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A27A152B;
 Wed, 12 Mar 2025 06:53:17 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D1D73F5A1;
 Wed, 12 Mar 2025 06:53:05 -0700 (PDT)
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
X-Inumbo-ID: 53a054d4-ff49-11ef-9ab9-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 00/10] MPU mm subsistem skeleton
Date: Wed, 12 Mar 2025 13:52:48 +0000
Message-Id: <20250312135258.1815706-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this serie implements the skeleton for the MPU memory management subsystem,
at the end of the serie it will be possible to compile the Arm arch using MPU.

The minimum Arm Kconfig configuration is this one:

CONFIG_UNSUPPORTED=y
CONFIG_MPU=y
CONFIG_XEN_START_ADDRESS=0x0

Luca Fancellu (8):
  xen/passthrough: Provide stub functions when !HAS_PASSTHROUGH
  xen/arm: Restrict Kconfig configuration for LLC coloring
  arm/mpu: Add HYPERVISOR_VIRT_START and avoid a check in xen.lds.S
  arm/mpu: Introduce frame_table, virt_to_page, maddr_to_virt
  arm/mpu: Kconfig symbols for MPU build
  arm/mpu: Implement stubs for ioremap_attr on MPU
  xen/arm: Rename setup_pagetables with a more generic name
  arm/mpu: Create the skeleton for MPU compilation

Penny Zheng (2):
  arm/mpu: Implement virt/maddr conversion in MPU system
  xen/arm: introduce Kconfig HAS_PAGING_MEMPOOL

 xen/arch/arm/Kconfig                   |  9 ++-
 xen/arch/arm/arm64/mpu/Makefile        |  2 +
 xen/arch/arm/arm64/mpu/p2m.c           | 18 +++++
 xen/arch/arm/arm64/mpu/smpboot.c       | 23 +++++++
 xen/arch/arm/dom0less-build.c          |  2 +
 xen/arch/arm/include/asm/domain.h      |  2 +
 xen/arch/arm/include/asm/grant_table.h |  5 +-
 xen/arch/arm/include/asm/mm.h          | 33 +++++++--
 xen/arch/arm/include/asm/mmu/mm.h      |  7 ++
 xen/arch/arm/include/asm/mpu/layout.h  |  5 ++
 xen/arch/arm/include/asm/mpu/mm.h      | 30 ++++++++
 xen/arch/arm/include/asm/mpu/p2m.h     | 20 ++++++
 xen/arch/arm/include/asm/p2m.h         |  2 +-
 xen/arch/arm/mm.c                      |  5 ++
 xen/arch/arm/mmu/pt.c                  |  5 --
 xen/arch/arm/mmu/setup.c               |  2 +-
 xen/arch/arm/mpu/Makefile              |  3 +
 xen/arch/arm/mpu/mm.c                  | 41 +++++++++++
 xen/arch/arm/mpu/p2m.c                 | 94 ++++++++++++++++++++++++++
 xen/arch/arm/mpu/setup.c               | 42 ++++++++++++
 xen/arch/arm/mpu/vmap-mpu.c            | 24 +++++++
 xen/arch/arm/setup.c                   |  6 +-
 xen/arch/arm/xen.lds.S                 |  2 +
 xen/include/xen/iommu.h                | 54 ++++++++++++++-
 24 files changed, 414 insertions(+), 22 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm64/mpu/smpboot.c
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
 create mode 100644 xen/arch/arm/include/asm/mpu/p2m.h
 create mode 100644 xen/arch/arm/mpu/p2m.c
 create mode 100644 xen/arch/arm/mpu/setup.c
 create mode 100644 xen/arch/arm/mpu/vmap-mpu.c

-- 
2.34.1


