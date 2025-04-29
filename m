Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100CAAA1049
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 17:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972771.1361077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9mlk-00029u-NU; Tue, 29 Apr 2025 15:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972771.1361077; Tue, 29 Apr 2025 15:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9mlk-00026s-KW; Tue, 29 Apr 2025 15:21:12 +0000
Received: by outflank-mailman (input) for mailman id 972771;
 Tue, 29 Apr 2025 15:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mkRs=XP=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u9mli-00026m-Mx
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 15:21:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 920d59fd-250d-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 17:21:06 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 162141515;
 Tue, 29 Apr 2025 08:20:59 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECBB33F673;
 Tue, 29 Apr 2025 08:21:04 -0700 (PDT)
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
X-Inumbo-ID: 920d59fd-250d-11f0-9eb4-5ba50f476ded
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 0/7] First chunk for Arm R82 and MPU support
Date: Tue, 29 Apr 2025 16:20:50 +0100
Message-Id: <20250429152057.2380536-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is the first chunk of work to support MPU and R82 on Xen, this serie
reaches the early boot stages just before early_fdt_map(), just to give an idea
about which stage of the boot is reached.

v4:
 - dropped setup_mpu() patch and early_fdt_map() patch (needs rework)
 - add new patches: boot protocol and early asm MPU structure update
 - general fixes listed on each patch
v3 changes:
 - stated on each patch
v2 changes for this serie:
 - rebased serie on the MPU skeleton that allow compilation
 - removed some patches already merged in the MPU skeleton

Luca Fancellu (6):
  docs/arm: Document Xen booting protocol on Armv8-R
  arm/mpu: Provide and populate MPU C data structures
  arm/mpu: Provide access to the MPU region from the C code
  arm/mpu: Introduce utility functions for the pr_t type
  arm/mpu: Provide a constructor for pr_t type
  arm/mpu: Introduce MPU memory mapping flags

Penny Zheng (1):
  arm/mpu: Introduce MPU memory region map structure

 docs/misc/arm/booting.txt                |   8 +
 xen/arch/arm/arm64/mpu/head.S            |  13 ++
 xen/arch/arm/include/asm/arm32/mpu.h     |  25 +++
 xen/arch/arm/include/asm/arm64/mpu.h     |  61 +++++++
 xen/arch/arm/include/asm/bitmap-op.inc   |  67 ++++++++
 xen/arch/arm/include/asm/mpu.h           |  78 +++++++++
 xen/arch/arm/include/asm/mpu/mm.h        |  51 ++++++
 xen/arch/arm/include/asm/mpu/regions.inc |  71 ++++++--
 xen/arch/arm/include/asm/page.h          |  25 +++
 xen/arch/arm/mpu/mm.c                    | 201 +++++++++++++++++++++++
 10 files changed, 590 insertions(+), 10 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/arm32/mpu.h
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
 create mode 100644 xen/arch/arm/include/asm/bitmap-op.inc

-- 
2.34.1


