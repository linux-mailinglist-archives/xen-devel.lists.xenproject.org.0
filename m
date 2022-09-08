Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0257A5B13B4
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 06:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402628.644459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW971-0000DT-Ow; Thu, 08 Sep 2022 04:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402628.644459; Thu, 08 Sep 2022 04:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW971-0000BR-LG; Thu, 08 Sep 2022 04:25:59 +0000
Received: by outflank-mailman (input) for mailman id 402628;
 Thu, 08 Sep 2022 04:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymCA=ZL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oW96z-000054-N4
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 04:25:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 549c7b81-2f2e-11ed-a016-b9edf5238543;
 Thu, 08 Sep 2022 06:25:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B9DBD6E;
 Wed,  7 Sep 2022 21:26:01 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7DFC03F7B4;
 Wed,  7 Sep 2022 21:25:51 -0700 (PDT)
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
X-Inumbo-ID: 549c7b81-2f2e-11ed-a016-b9edf5238543
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 0/4] Introduce static heap
Date: Thu,  8 Sep 2022 04:25:34 +0000
Message-Id: <20220908042538.27076-1-Henry.Wang@arm.com>
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

Changes from v4 to v5:
- Use #address-cells and #size-cells for static heap, do not introduce
  new address/size cells. Update the dt-binding accordingly.
- Correct a typo in code comments.
- Drop Stefano's acked-by in patch #2 as it is not valid.
- Mention the function and code comment rename in commit mesg in patch #3.

Henry Wang (4):
  xen/arm: bootfdt: Make process_chosen_node() return int
  docs, xen/arm: Introduce static heap memory
  xen/arm: mm: Rename xenheap_* variable to directmap_*
  xen/arm: Handle static heap pages in boot and heap allocator

 SUPPORT.md                            |   7 ++
 docs/misc/arm/device-tree/booting.txt |  52 +++++++++
 xen/arch/arm/bootfdt.c                |  53 ++++++---
 xen/arch/arm/domain_build.c           |   8 +-
 xen/arch/arm/include/asm/config.h     |   2 +-
 xen/arch/arm/include/asm/mm.h         |  31 ++---
 xen/arch/arm/include/asm/setup.h      |  23 +++-
 xen/arch/arm/mm.c                     |  50 +++++----
 xen/arch/arm/setup.c                  | 156 ++++++++++++++++++++------
 9 files changed, 293 insertions(+), 89 deletions(-)

-- 
2.17.1


