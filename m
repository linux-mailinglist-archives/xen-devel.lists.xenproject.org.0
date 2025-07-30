Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2101CB15ADE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 10:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063529.1429225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2Ra-00071q-Tx; Wed, 30 Jul 2025 08:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063529.1429225; Wed, 30 Jul 2025 08:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2Ra-0006zS-RD; Wed, 30 Jul 2025 08:45:50 +0000
Received: by outflank-mailman (input) for mailman id 1063529;
 Wed, 30 Jul 2025 08:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUWP=2L=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uh2Ra-0006zM-2t
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 08:45:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 969922a7-6d21-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 10:45:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26FBF1515;
 Wed, 30 Jul 2025 01:45:39 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.73.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CD173F66E;
 Wed, 30 Jul 2025 01:45:45 -0700 (PDT)
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
X-Inumbo-ID: 969922a7-6d21-11f0-a320-13f23c93f187
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/5] Third series for R82 MPU support
Date: Wed, 30 Jul 2025 09:45:29 +0100
Message-ID: <cover.1753864612.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series is the third set of patches in the ongoing work to
introduce support for MPU systems and Cortex R82 in Xen.

The patches in this series implement the necessary logic to transiently
map and unmap the static memory banks for initialization.

Cheers,
Hari

Luca Fancellu (4):
  arm/mpu: Implement setup_frametable_mappings for MPU systems
  arm/mpu: Implement setup_mm for MPU systems
  arm/mpu: Implement transient mapping
  arm/mpu: Implement ioremap_attr for MPU

Penny Zheng (1):
  xen/arm: map static memory on demand

 xen/arch/arm/include/asm/arm32/mpu.h     |   2 +
 xen/arch/arm/include/asm/arm64/mpu.h     |   2 +
 xen/arch/arm/include/asm/mmu/mm.h        |   3 +
 xen/arch/arm/include/asm/mpu/mm.h        |  40 +++-
 xen/arch/arm/include/asm/mpu/regions.inc |  19 +-
 xen/arch/arm/mpu/mm.c                    | 250 +++++++++++++++++++++--
 xen/arch/arm/mpu/setup.c                 |  11 +
 xen/include/xen/static-memory.h          |   8 +
 8 files changed, 316 insertions(+), 19 deletions(-)

-- 
2.34.1


