Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F035AFF3B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400943.642587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqYO-0002nJ-6X; Wed, 07 Sep 2022 08:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400943.642587; Wed, 07 Sep 2022 08:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqYO-0002lL-3f; Wed, 07 Sep 2022 08:37:00 +0000
Received: by outflank-mailman (input) for mailman id 400943;
 Wed, 07 Sep 2022 08:36:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gDT=ZK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVqYM-0002lD-CO
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:36:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3b39cd98-2e88-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 10:36:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09E2DD6E;
 Wed,  7 Sep 2022 01:37:02 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B9FDA3F534;
 Wed,  7 Sep 2022 01:37:21 -0700 (PDT)
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
X-Inumbo-ID: 3b39cd98-2e88-11ed-a016-b9edf5238543
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/4] Introduce static heap
Date: Wed,  7 Sep 2022 08:36:39 +0000
Message-Id: <20220907083643.20152-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

The static heap, or statically configured heap, refers to parts
of RAM reserved in the beginning for heap. Like the static memory
allocation, such static heap regions are reserved by configuration
in the device tree using physical address ranges.

This feature is useful to run Xen on Arm MPU systems, where only a
finite number of memory protection regions are available. The limited
number of protection regions places requirement on planning the use
of MPU protection regions and one or more MPU protection regions needs
to be reserved only for heap.

The first patch enhances the error handling in processing the dts
chosen node. The second patch introduces the static heap and the
device tree parsing code. The third patch renames xenheap_* to
directmap_* for better readablity. The fourth patch adds the
implementation of the static heap pages handling in boot and heap
allocator for Arm.

Changes from v2 to v3:
- Adjust the order of patches.
- Define `enum membank_type` properly, drop the typedef.
- Rename the feature terminology to static heap.
- Rename MEMBANK_MEMORY to MEMBANK_DEFAULT and MEMBANK_XEN_DOMAIN to
  MEMBANK_STATIC_DOMAIN. Add comments to `enum membank_type`.
- Correct typo, add the clarification of the static heap region
  should contain enough memory below 4GB to cater 32-bit DMA for Arm32,
  and add the 64KB alignment requirement in doc.
- Add Stefano's Acked-by for device tree interface.
- Adjustment of the terminology change to "static heap".
- Change of wording in comments.
- int i -> unsigned int i.
- Avoid extra indentation by reverting the check of MEMBANK_RSVD_HEAP.
- Use MB(32).
- Drop unnecessary panic and unused variables.
- Avoid the ternary operation in assigning the heap_pages.
- Rework populate_boot_allocator() for static heap.

Henry Wang (4):
  xen/arm: bootfdt: Make process_chosen_node() return int
  docs, xen/arm: Introduce static heap memory
  xen/arm: mm: Rename xenheap_* variable to directmap_*
  xen/arm: Handle static heap pages in boot and heap allocator

 docs/misc/arm/device-tree/booting.txt |  48 +++++++++
 xen/arch/arm/bootfdt.c                |  55 +++++++---
 xen/arch/arm/domain_build.c           |   8 +-
 xen/arch/arm/include/asm/config.h     |   2 +-
 xen/arch/arm/include/asm/mm.h         |  22 ++--
 xen/arch/arm/include/asm/setup.h      |  23 +++-
 xen/arch/arm/mm.c                     |  24 ++---
 xen/arch/arm/setup.c                  | 147 +++++++++++++++++++++-----
 8 files changed, 260 insertions(+), 69 deletions(-)

-- 
2.17.1


