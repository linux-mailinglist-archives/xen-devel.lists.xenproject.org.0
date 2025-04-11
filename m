Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0C7A86126
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 16:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947474.1345102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Fob-0006gA-9Q; Fri, 11 Apr 2025 14:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947474.1345102; Fri, 11 Apr 2025 14:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Fob-0006ej-6p; Fri, 11 Apr 2025 14:57:09 +0000
Received: by outflank-mailman (input) for mailman id 947474;
 Fri, 11 Apr 2025 14:57:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TlgU=W5=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u3Foa-0006eX-1T
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 14:57:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3bc14f62-16e5-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 16:57:05 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF898106F;
 Fri, 11 Apr 2025 07:57:04 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 082BC3F59E;
 Fri, 11 Apr 2025 07:57:03 -0700 (PDT)
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
X-Inumbo-ID: 3bc14f62-16e5-11f0-9ffb-bf95429c2676
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/7] First chunk for Arm R82 and MPU support
Date: Fri, 11 Apr 2025 15:56:48 +0100
Message-Id: <20250411145655.140667-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is the first chunk of work to support MPU and R82 on Xen, this serie
reaches the early boot stages until setup_pagetables() which is not used for MPU
but it is just to give an idea about which stage of the boot is reached.

v3 changes:
 - stated on each patch
v2 changes for this serie:
 - rebased serie on the MPU skeleton that allow compilation
 - removed some patches already merged in the MPU skeleton


Luca Fancellu (6):
  arm/mpu: Provide access to the MPU region from the C code
  arm/mpu: Introduce utility functions for the pr_t type
  arm/mpu: Provide a constructor for pr_t type
  arm/mpu: Introduce MPU memory mapping flags
  arm/mpu: Implement early_fdt_map support in MPU systems
  arm/mpu: Implement setup_mpu for MPU system

Penny Zheng (1):
  arm/mpu: Introduce MPU memory region map structure

 xen/arch/arm/include/asm/arm64/mpu.h |  62 +++++++
 xen/arch/arm/include/asm/mpu.h       |  52 ++++++
 xen/arch/arm/include/asm/mpu/mm.h    |  27 +++
 xen/arch/arm/include/asm/page.h      |  25 +++
 xen/arch/arm/mpu/mm.c                | 251 ++++++++++++++++++++++++++-
 xen/arch/arm/mpu/setup.c             |  54 +++++-
 6 files changed, 468 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h

-- 
2.34.1


