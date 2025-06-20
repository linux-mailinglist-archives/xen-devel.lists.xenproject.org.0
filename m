Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B85AE1836
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 11:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020712.1396837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYNh-0004m4-46; Fri, 20 Jun 2025 09:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020712.1396837; Fri, 20 Jun 2025 09:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYNh-0004kW-1c; Fri, 20 Jun 2025 09:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1020712;
 Fri, 20 Jun 2025 09:49:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxVL=ZD=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uSYNg-0004kQ-Lo
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 09:49:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ea705291-4dbb-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 11:49:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FF34176A;
 Fri, 20 Jun 2025 02:49:33 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.67.38])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BB813F673;
 Fri, 20 Jun 2025 02:49:51 -0700 (PDT)
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
X-Inumbo-ID: ea705291-4dbb-11f0-b894-0df219b8e170
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/6] Second series for R82 MPU Support
Date: Fri, 20 Jun 2025 10:49:18 +0100
Message-ID: <cover.1750411205.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series is the second set of patches in the ongoing work to
introduce support for MPU systems and Cortex R82 in Xen.

The patches in this series implement the necessary logic to map and
unmap the Device Tree Blob in the early stages of the boot process.

Cheers,
Hari

Luca Fancellu (4):
  arm/mpu: Find MPU region by range
  xen/arm: Introduce flags_has_rwx helper
  arm/mpu: Implement early_fdt_map support in MPU systems
  arm/mpu: Implement remove_early_mappings for MPU systems

Penny Zheng (2):
  arm/mpu: Populate a new region in Xen MPU mapping table
  arm/mpu: Destroy an existing entry in Xen MPU memory mapping table

 xen/arch/arm/include/asm/mm.h         |   2 +
 xen/arch/arm/include/asm/mpu.h        |   2 +
 xen/arch/arm/include/asm/mpu/cpregs.h |   4 +
 xen/arch/arm/include/asm/mpu/mm.h     |  41 +++++
 xen/arch/arm/mm.c                     |  15 ++
 xen/arch/arm/mmu/pt.c                 |   9 +-
 xen/arch/arm/mpu/mm.c                 | 229 ++++++++++++++++++++++++++
 xen/arch/arm/mpu/setup.c              |  83 +++++++++-
 8 files changed, 374 insertions(+), 11 deletions(-)

-- 
2.34.1


