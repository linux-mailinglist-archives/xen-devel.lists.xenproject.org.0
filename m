Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238B3C07009
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 17:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150560.1481659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJrK-0003wh-SM; Fri, 24 Oct 2025 15:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150560.1481659; Fri, 24 Oct 2025 15:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJrK-0003tZ-PX; Fri, 24 Oct 2025 15:37:42 +0000
Received: by outflank-mailman (input) for mailman id 1150560;
 Fri, 24 Oct 2025 15:37:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QEVg=5B=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vCJrJ-0003nv-Jd
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 15:37:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5c9f0cea-b0ef-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 17:37:35 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5246D1515;
 Fri, 24 Oct 2025 08:37:26 -0700 (PDT)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA6403F63F;
 Fri, 24 Oct 2025 08:37:32 -0700 (PDT)
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
X-Inumbo-ID: 5c9f0cea-b0ef-11f0-980a-7dc792cee155
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/3] Third MPU series
Date: Fri, 24 Oct 2025 16:37:16 +0100
Message-ID: <20251024153719.408806-1-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series aims to further the ongoing work to introduce support for MPU
systems in xen.

The patches in this series implement the logic to map MPU regions.

Thanks,
Harry Ramsey

Harry Ramsey (2):
  arm/mpu: Implement setup_mm for MPU systems
  arm/mpu: Implement reference counting for overlapping regions

Luca Fancellu (1):
  arm/mpu: Implement ioremap_attr for MPU

 xen/arch/arm/arm32/asm-offsets.c         |   2 +
 xen/arch/arm/arm64/asm-offsets.c         |   2 +
 xen/arch/arm/arm64/mmu/mm.c              |  25 +----
 xen/arch/arm/include/asm/arm32/mpu.h     |   2 +
 xen/arch/arm/include/asm/arm64/mpu.h     |   2 +
 xen/arch/arm/include/asm/mm.h            |   2 +
 xen/arch/arm/include/asm/mpu/regions.inc |  11 ++-
 xen/arch/arm/mm.c                        |  45 +++++++++
 xen/arch/arm/mpu/mm.c                    | 121 +++++++++++++++++++----
 9 files changed, 166 insertions(+), 46 deletions(-)

--
2.43.0


