Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A9A89D86E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 13:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702245.1097163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru9vK-0004LM-8S; Tue, 09 Apr 2024 11:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702245.1097163; Tue, 09 Apr 2024 11:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru9vK-0004JT-5N; Tue, 09 Apr 2024 11:45:58 +0000
Received: by outflank-mailman (input) for mailman id 702245;
 Tue, 09 Apr 2024 11:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0lRi=LO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1ru9vJ-0004JG-7S
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 11:45:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b82d0820-f666-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 13:45:53 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D4411007;
 Tue,  9 Apr 2024 04:46:23 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91CCE3F766;
 Tue,  9 Apr 2024 04:45:51 -0700 (PDT)
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
X-Inumbo-ID: b82d0820-f666-11ee-94a3-07e782e9044d
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 00/13] Static shared memory followup v2 - pt1
Date: Tue,  9 Apr 2024 12:45:30 +0100
Message-Id: <20240409114543.3332150-1-luca.fancellu@arm.com>
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
and the device tree generation, there will be a following serie addressing the
last missing feature soon.

From v1:
 - Add new patches, moved the patch related to the static memory helper.

Luca Fancellu (9):
  xen/arm: Pass struct kernel_info parameter to make_resv_memory_node
  xen/arm: Introduce a generic way to access memory bank structures
  xen/arm: Conditional compilation of kernel_info.shm_mem member
  xen/arm: Avoid code duplication in find_unallocated_memory
  xen/arm: Avoid code duplication in check_reserved_regions_overlap
  xen/arm: Introduce helper for static memory pages
  xen/arm: Reduce struct membank size on static shared memory
  xen/device_tree: Introduce function to merge overlapping intervals
  xen/arm: List static shared memory regions as /memory nodes

Penny Zheng (4):
  xen/arm: remove stale addr_cells/size_cells in assign_shared_memory
  xen/arm: avoid repetitive checking in process_shm_node
  xen/arm: remove shm holes from extended regions
  xen/arm: fix duplicate /reserved-memory node in Dom0

 xen/arch/arm/acpi/domain_build.c         |   6 +-
 xen/arch/arm/arm32/mmu/mm.c              |  68 ++++--
 xen/arch/arm/arm64/mmu/mm.c              |   4 +-
 xen/arch/arm/bootfdt.c                   |  45 ++--
 xen/arch/arm/dom0less-build.c            |  19 +-
 xen/arch/arm/domain_build.c              | 226 +++++++++++---------
 xen/arch/arm/efi/efi-boot.h              |   8 +-
 xen/arch/arm/efi/efi-dom0.c              |  13 +-
 xen/arch/arm/include/asm/domain_build.h  |   6 +-
 xen/arch/arm/include/asm/kernel.h        |  27 ++-
 xen/arch/arm/include/asm/setup.h         |  81 ++++++-
 xen/arch/arm/include/asm/static-memory.h |  13 ++
 xen/arch/arm/include/asm/static-shmem.h  |  62 +++++-
 xen/arch/arm/io.c                        |  11 +-
 xen/arch/arm/kernel.c                    |  12 +-
 xen/arch/arm/setup.c                     |  97 ++++++---
 xen/arch/arm/static-memory.c             |  35 ++-
 xen/arch/arm/static-shmem.c              | 260 ++++++++++++++++++-----
 xen/arch/x86/extable.c                   |   5 +-
 xen/common/device_tree.c                 | 140 ++++++++++++
 xen/include/xen/device_tree.h            |  19 ++
 xen/include/xen/sort.h                   |  14 +-
 22 files changed, 881 insertions(+), 290 deletions(-)

-- 
2.34.1


