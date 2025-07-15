Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0208BB0538D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043595.1413570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMB-0002Rs-G1; Tue, 15 Jul 2025 07:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043595.1413570; Tue, 15 Jul 2025 07:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMB-0002Pg-DD; Tue, 15 Jul 2025 07:45:43 +0000
Received: by outflank-mailman (input) for mailman id 1043595;
 Tue, 15 Jul 2025 07:45:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCR=Z4=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1ubaMA-0002PZ-B9
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:45:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b43dcbf8-614f-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 09:45:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B83712FC;
 Tue, 15 Jul 2025 00:45:31 -0700 (PDT)
Received: from PWQ0QT7DJ1.emea.arm.com (PWQ0QT7DJ1.cambridge.arm.com
 [10.1.25.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8FA03F66E;
 Tue, 15 Jul 2025 00:45:38 -0700 (PDT)
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
X-Inumbo-ID: b43dcbf8-614f-11f0-a319-13f23c93f187
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/6] Second series for R82 MPU Support
Date: Tue, 15 Jul 2025 08:45:22 +0100
Message-ID: <cover.1752565274.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series is the second set of patches in the ongoing work to
introduce support for MPU systems and Cortex R82 in Xen.

The patches in this series implement the necessary logic to map and
unmap the Device Tree Blob in the early stages of the boot process.

Changes from v2:
- Changes mentioned in individual patches

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
 xen/arch/arm/mpu/mm.c                 | 232 ++++++++++++++++++++++++++
 xen/arch/arm/mpu/setup.c              |  89 +++++++++-
 8 files changed, 383 insertions(+), 11 deletions(-)

-- 
2.34.1


