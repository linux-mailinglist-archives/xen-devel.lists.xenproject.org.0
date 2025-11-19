Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8B3C6D400
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 08:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165585.1492320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLd1F-0000NJ-QY; Wed, 19 Nov 2025 07:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165585.1492320; Wed, 19 Nov 2025 07:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLd1F-0000LO-Mm; Wed, 19 Nov 2025 07:54:25 +0000
Received: by outflank-mailman (input) for mailman id 1165585;
 Wed, 19 Nov 2025 07:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YCl=53=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vLd1D-0007zV-VK
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 07:54:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ed6da2df-c51c-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 08:54:08 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3369AFEC;
 Tue, 18 Nov 2025 23:54:00 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2FA53F740;
 Tue, 18 Nov 2025 23:54:06 -0800 (PST)
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
X-Inumbo-ID: ed6da2df-c51c-11f0-980a-7dc792cee155
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/3] Third MPU Series
Date: Wed, 19 Nov 2025 07:53:48 +0000
Message-ID: <20251119075351.3926690-1-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement `setup_mm` for MPU systems. This variant does not require
setting up a direct map.

To reduce code duplication the common initalisation code for both MPU
and MMU Arm64 configurations is refactored into `setup_mm`. Platform-specific
setup steps are now handled by a new helper function `setup_mm_helper`.

Harry Ramsey (3):
  arm/mpu: Implement setup_mm for MPU systems
  arm/mpu: Implement reference counting for inclusive regions
  arm/mpu: Implement ioremap_attr for MPU

 xen/arch/arm/arm32/asm-offsets.c         |   2 +
 xen/arch/arm/arm64/asm-offsets.c         |   2 +
 xen/arch/arm/arm64/mmu/mm.c              |  26 +-----
 xen/arch/arm/include/asm/arm32/mpu.h     |   2 +
 xen/arch/arm/include/asm/arm64/mpu.h     |   2 +
 xen/arch/arm/include/asm/mm.h            |   2 +
 xen/arch/arm/include/asm/mpu/regions.inc |  11 ++-
 xen/arch/arm/mm.c                        |  45 +++++++++
 xen/arch/arm/mpu/mm.c                    | 112 +++++++++++++++++++----
 9 files changed, 159 insertions(+), 45 deletions(-)

--
2.43.0


