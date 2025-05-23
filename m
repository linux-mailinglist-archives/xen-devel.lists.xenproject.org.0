Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D87EAC1D53
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 08:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995194.1377730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMIQ-0002i4-E4; Fri, 23 May 2025 06:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995194.1377730; Fri, 23 May 2025 06:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMIQ-0002fQ-9h; Fri, 23 May 2025 06:54:22 +0000
Received: by outflank-mailman (input) for mailman id 995194;
 Fri, 23 May 2025 06:54:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ff/g=YH=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1uIMIO-0002CD-OS
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 06:54:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bd87fdf4-37a2-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 08:54:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FE3B1758;
 Thu, 22 May 2025 23:54:00 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98A1A3F673;
 Thu, 22 May 2025 23:54:13 -0700 (PDT)
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
X-Inumbo-ID: bd87fdf4-37a2-11f0-b892-0df219b8e170
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 0/6] First chunk for Arm R82 and MPU support
Date: Fri, 23 May 2025 07:54:00 +0100
Message-Id: <20250523065406.3795420-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is the first chunk of work to support MPU and R82 on Xen, this serie
reaches the early boot stages just before early_fdt_map(), just to give an idea
about which stage of the boot is reached.

v6:
 - general fixes listed on each patch
v5:
 - dropped patch that touches page.h, it is not needed
 - general fixes listed on each patch
v4:
 - dropped setup_mpu() patch and early_fdt_map() patch (needs rework)
 - add new patches: boot protocol and early asm MPU structure update
 - general fixes listed on each patch
v3 changes:
 - stated on each patch
v2 changes for this serie:
 - rebased serie on the MPU skeleton that allow compilation
 - removed some patches already merged in the MPU skeleton

Luca Fancellu (5):
  docs/arm: Document Xen booting protocol on Armv8-R
  arm/mpu: Provide and populate MPU C data structures
  arm/mpu: Provide access to the MPU region from the C code
  arm/mpu: Introduce utility functions for the pr_t type
  arm/mpu: Provide a constructor for pr_t type

Penny Zheng (1):
  arm/mpu: Introduce MPU memory region map structure

 docs/misc/arm/booting.txt                |  11 +-
 xen/arch/arm/arm64/asm-offsets.c         |   7 +
 xen/arch/arm/arm64/cache.S               |  21 +++
 xen/arch/arm/arm64/mpu/head.S            |  25 +++
 xen/arch/arm/include/asm/arm32/mpu.h     |  25 +++
 xen/arch/arm/include/asm/arm64/mpu.h     |  54 ++++++
 xen/arch/arm/include/asm/bitmap-op.inc   |  63 +++++++
 xen/arch/arm/include/asm/mpu.h           |  75 +++++++++
 xen/arch/arm/include/asm/mpu/mm.h        |  41 +++++
 xen/arch/arm/include/asm/mpu/regions.inc |  38 +++++
 xen/arch/arm/mpu/mm.c                    | 205 +++++++++++++++++++++++
 11 files changed, 562 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/arm32/mpu.h
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
 create mode 100644 xen/arch/arm/include/asm/bitmap-op.inc

-- 
2.34.1


