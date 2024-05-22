Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063678CBC59
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 09:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727262.1131687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9glZ-0005c1-1i; Wed, 22 May 2024 07:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727262.1131687; Wed, 22 May 2024 07:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9glY-0005aK-V0; Wed, 22 May 2024 07:52:04 +0000
Received: by outflank-mailman (input) for mailman id 727262;
 Wed, 22 May 2024 07:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfTZ=MZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1s9glX-0005YY-08
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 07:52:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2bf9491e-1810-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 09:52:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0254339;
 Wed, 22 May 2024 00:52:24 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D50B23F766;
 Wed, 22 May 2024 00:51:59 -0700 (PDT)
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
X-Inumbo-ID: 2bf9491e-1810-11ef-90a0-e314d9c70b13
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/7] Static shared memory followup v2 - pt2
Date: Wed, 22 May 2024 08:51:44 +0100
Message-Id: <20240522075151.3373899-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie is a partial rework of this other serie:
https://patchwork.kernel.org/project/xen-devel/cover/20231206090623.1932275-1-Penny.Zheng@arm.com/

The original serie is addressing an issue of the static shared memory feature
that impacts the memory footprint of other component when the feature is
enabled, another issue impacts the device tree generation for the guests when
the feature is enabled and used and the last one is a missing feature that is
the option to have a static shared memory region that is not from the host
address space.

This serie is handling some comment on the original serie and it is splitting
the rework in two part, this first part is addressing the memory footprint issue
and the device tree generation and currently is fully merged
(https://patchwork.kernel.org/project/xen-devel/cover/20240418073652.3622828-1-luca.fancellu@arm.com/),
this serie is addressing the static shared memory allocation from the Xen heap.

Luca Fancellu (5):
  xen/arm: Lookup bootinfo shm bank during the mapping
  xen/arm: Wrap shared memory mapping code in one function
  xen/arm: Parse xen,shared-mem when host phys address is not provided
  xen/arm: Rework heap page allocation outside allocate_bank_memory
  xen/arm: Implement the logic for static shared memory from Xen heap

Penny Zheng (2):
  xen/p2m: put reference for level 2 superpage
  xen/docs: Describe static shared memory when host address is not
    provided

 docs/misc/arm/device-tree/booting.txt   |  52 ++-
 xen/arch/arm/arm32/mmu/mm.c             |  11 +-
 xen/arch/arm/dom0less-build.c           |   4 +-
 xen/arch/arm/domain_build.c             |  84 +++--
 xen/arch/arm/include/asm/domain_build.h |   9 +-
 xen/arch/arm/mmu/p2m.c                  |  63 +++-
 xen/arch/arm/setup.c                    |  14 +-
 xen/arch/arm/static-shmem.c             | 432 +++++++++++++++++-------
 8 files changed, 486 insertions(+), 183 deletions(-)

-- 
2.34.1


