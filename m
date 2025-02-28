Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7475A49E89
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 17:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898955.1307406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34H-0003XE-IL; Fri, 28 Feb 2025 16:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898955.1307406; Fri, 28 Feb 2025 16:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34H-0003Ui-Ek; Fri, 28 Feb 2025 16:18:29 +0000
Received: by outflank-mailman (input) for mailman id 898955;
 Fri, 28 Feb 2025 16:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/q7=VT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1to34F-0003Ub-UT
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 16:18:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a3498972-f5ef-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 17:18:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89272150C;
 Fri, 28 Feb 2025 08:18:40 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 652D73F5A1;
 Fri, 28 Feb 2025 08:18:24 -0800 (PST)
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
X-Inumbo-ID: a3498972-f5ef-11ef-9aaf-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/9] First chunk for Arm R82 and MPU support
Date: Fri, 28 Feb 2025 16:18:08 +0000
Message-Id: <20250228161817.3342443-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is the first chunk of work to support MPU and R82 on Xen, this serie
reaches the early boot stages until setup_pagetables() which will be renamed
in one of the commit on the serie to have a more generic name between MPU and
MMU memory management subsystem.

Luca Fancellu (7):
  arm/mpu: Add HYPERVISOR_VIRT_START and avoid a check in xen.lds.S
  arm/mpu: Provide access to the MPU region from the C code
  arm/mpu: Introduce utility functions for the pr_t type
  arm/mpu: Provide a constructor for pr_t type
  arm/mpu: Introduce MPU memory mapping flags
  arm/mpu: Implement early_fdt_map support in MPU systems
  arm/mpu: Implement setup_mappings for MPU system

Penny Zheng (2):
  arm/mpu: Implement virt/maddr conversion in MPU system
  arm/mpu: Introduce MPU memory region map structure

 xen/arch/arm/Makefile                 |   1 +
 xen/arch/arm/include/asm/arm64/mpu.h  |  92 ++++++++++
 xen/arch/arm/include/asm/mm.h         |  15 +-
 xen/arch/arm/include/asm/mmu/mm.h     |   7 +
 xen/arch/arm/include/asm/mpu/layout.h |   2 +
 xen/arch/arm/include/asm/mpu/mm.h     |  59 +++++++
 xen/arch/arm/include/asm/page.h       |  25 +++
 xen/arch/arm/mmu/setup.c              |   2 +-
 xen/arch/arm/mpu/Makefile             |   2 +
 xen/arch/arm/mpu/mm.c                 | 236 ++++++++++++++++++++++++++
 xen/arch/arm/mpu/setup.c              | 112 ++++++++++++
 xen/arch/arm/setup.c                  |   2 +-
 xen/arch/arm/xen.lds.S                |   2 +
 13 files changed, 548 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
 create mode 100644 xen/arch/arm/mpu/Makefile
 create mode 100644 xen/arch/arm/mpu/mm.c
 create mode 100644 xen/arch/arm/mpu/setup.c

-- 
2.34.1


