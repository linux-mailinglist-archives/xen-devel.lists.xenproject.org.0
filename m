Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6895ACC12
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 09:27:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398528.639390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV6VV-0001Z0-5W; Mon, 05 Sep 2022 07:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398528.639390; Mon, 05 Sep 2022 07:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV6VV-0001Ww-2T; Mon, 05 Sep 2022 07:26:57 +0000
Received: by outflank-mailman (input) for mailman id 398528;
 Mon, 05 Sep 2022 07:26:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cA+y=ZI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oV6VU-0001Wq-6x
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 07:26:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1ddf97d2-2cec-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 09:26:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EAFBED1;
 Mon,  5 Sep 2022 00:27:00 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DCB473F73D;
 Mon,  5 Sep 2022 00:27:19 -0700 (PDT)
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
X-Inumbo-ID: 1ddf97d2-2cec-11ed-af93-0125da4c0113
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/4] Introduce reserved heap
Date: Mon,  5 Sep 2022 07:26:31 +0000
Message-Id: <20220905072635.16294-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

The reserved heap, or statically configured heap, refers to parts
of RAM reserved in the beginning for heap. Like the static memory
allocation, such reserved heap regions are reserved by configuration
in the device tree using physical address ranges.

This feature is useful to run Xen on Arm MPU systems, where only a
finite number of memory protection regions are available. The limited
number of protection regions places requirement on planning the use of
MPU protection regions and one or more MPU protection regions needs to
be reserved only for heap.

The first patch introduces the reserved heap and the device tree parsing
code. The second patch enhances the error handling in processing the dts
chosen node. The third patch adds the implementation of the reserved heap
pages handling in boot and heap allocator for Arm. The fourth patch
renames xenheap_* to directmap_* for better readablity.

Changes from v1 to v2:
- Rename the device tree property to xen,static-heap to avoid confusion.
- Change of commit msg and doc wording, correct typo in commit msg.
- Add an empty line in make_memory_node() memory type check to improve
  readability.
- Use enum membank_type to make the memory type cleaner.
- New commits for make process_chosen_node() return int and rename
  xenheap_* to directmap_*.
- Move the global bool `reserved_heap` to bootinfo.
- Replace the open open-coding address ~0 by INVALID_PADDR.
- Do not use reverted logic in heap_pages calculation.
- Remove unused Arm32 reserved_heap_start variable.
- Decouple the arm32 reserved heap too small size check with region
  end check.
- Reuse the arm32 original xenheap finding logic with the new helper
  to make sure xenheap on arm32 is contiguous.

Henry Wang (4):
  docs, xen/arm: Introduce reserved heap memory
  xen/arm: bootfdt: Make process_chosen_node() return int
  xen/arm: Handle reserved heap pages in boot and heap allocator
  xen/arm: mm: Rename xenheap_* variable to directmap_*

 docs/misc/arm/device-tree/booting.txt |  45 ++++++++
 xen/arch/arm/bootfdt.c                |  54 +++++++---
 xen/arch/arm/domain_build.c           |   8 +-
 xen/arch/arm/include/asm/config.h     |   2 +-
 xen/arch/arm/include/asm/mm.h         |  22 ++--
 xen/arch/arm/include/asm/setup.h      |   8 +-
 xen/arch/arm/mm.c                     |  24 ++---
 xen/arch/arm/setup.c                  | 145 ++++++++++++++++++++------
 8 files changed, 238 insertions(+), 70 deletions(-)

-- 
2.17.1


