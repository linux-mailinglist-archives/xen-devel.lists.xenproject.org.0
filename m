Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6140FCF3490
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 12:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195263.1513227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcisI-0004AV-2X; Mon, 05 Jan 2026 11:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195263.1513227; Mon, 05 Jan 2026 11:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcisH-00047O-Vz; Mon, 05 Jan 2026 11:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1195263;
 Mon, 05 Jan 2026 11:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lUuJ=7K=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vcisG-00047I-GR
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 11:35:48 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ad2b40f7-ea2a-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 12:35:46 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5E8E339;
 Mon,  5 Jan 2026 03:35:38 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D11563F5A1;
 Mon,  5 Jan 2026 03:35:44 -0800 (PST)
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
X-Inumbo-ID: ad2b40f7-ea2a-11f0-b15e-2bf370ae4941
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/6] Fourth MPU Series
Date: Mon,  5 Jan 2026 11:34:57 +0000
Message-ID: <20260105113503.2674777-1-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to further the ongoing work to introduce support for MPU
systems in xen.

The patches in this series implement various memory functions and enable the
hypervisor timer.

Luca Fancellu (3):
  arm/mpu: Implement copy_from_paddr for MPU systems
  arm/mpu: Implement vmap functions for MPU
  arm/mpu: Introduce modify_after_init_mappings

Penny Zheng (3):
  arm/mpu: Implement free_init_memory for MPU systems
  arm: Use secure hypervisor timer in MPU system
  arm/mpu: Map domain page in AArch64 MPU systems

 xen/arch/arm/Kconfig                     |   1 +
 xen/arch/arm/include/asm/arm64/sysregs.h |  11 ++
 xen/arch/arm/include/asm/mpu/mm.h        |  16 +-
 xen/arch/arm/include/asm/setup.h         |   5 +
 xen/arch/arm/mmu/setup.c                 |  15 ++
 xen/arch/arm/mpu/Makefile                |   1 +
 xen/arch/arm/mpu/domain-page.c           |  53 +++++++
 xen/arch/arm/mpu/mm.c                    | 189 ++++++++++++++++++-----
 xen/arch/arm/mpu/setup.c                 |  54 ++++++-
 xen/arch/arm/mpu/vmap.c                  |  14 +-
 xen/arch/arm/setup.c                     |  15 +-
 11 files changed, 318 insertions(+), 56 deletions(-)
 create mode 100644 xen/arch/arm/mpu/domain-page.c

--
2.43.0


