Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18CC685D3F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 03:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488035.755896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN2em-0001CD-3A; Wed, 01 Feb 2023 02:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488035.755896; Wed, 01 Feb 2023 02:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN2em-0001AV-0M; Wed, 01 Feb 2023 02:15:28 +0000
Received: by outflank-mailman (input) for mailman id 488035;
 Wed, 01 Feb 2023 02:15:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1xX=55=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pN2ek-0001AP-GA
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 02:15:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 484018e8-a1d6-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 03:15:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAA242F4;
 Tue, 31 Jan 2023 18:16:04 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5BF3D3F882;
 Tue, 31 Jan 2023 18:15:20 -0800 (PST)
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
X-Inumbo-ID: 484018e8-a1d6-11ed-b63b-5f92e7d2e73a
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Wei Chen <wei.chen@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 0/3] Memory region overlap check in device tree
Date: Wed,  1 Feb 2023 10:15:10 +0800
Message-Id: <20230201021513.336837-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As we are having more and more types of memory region defined in the
device tree, it is necessary to add the overlap check of these memory
regions in Xen, because such check will help user to identify the
misconfiguration in the device tree at the early stage of boot time.

The first patch introduces the basic memory overlap check mechanism,
and does the memory check for memory regions in bootinfo.reserved_mem.
Following patches extend the overlap check to include bootmodules and
EfiACPIReclaimMemory.

v3 -> v4:
1. Correct printk error message, end should be exclusive.
2. Add comment explaining the unhandled case where '*_end' could be 0
   if the module/region is at the end of the physical address space.
3. Add Stefano's reviewed-by tag.

v2 -> v3:
1. Use "[start, end]" format in printk error message.
2. Change the return type of helper functions to bool.
3. Use 'start' and 'size' in helper functions to describe a region.

v1 -> v2:
- Split original `overlap_check()` to `meminfo_overlap_check()` and
  `bootmodules_overlap_check()`.
- Rework commit message.

Henry Wang (3):
  xen/arm: Add memory overlap check for bootinfo.reserved_mem
  xen/arm: Extend the memory overlap check to include bootmodules
  xen/arm: Extend the memory overlap check to include
    EfiACPIReclaimMemory

 xen/arch/arm/bootfdt.c           | 13 +++--
 xen/arch/arm/efi/efi-boot.h      | 10 +++-
 xen/arch/arm/include/asm/setup.h |  2 +
 xen/arch/arm/setup.c             | 90 ++++++++++++++++++++++++++++++++
 4 files changed, 106 insertions(+), 9 deletions(-)

-- 
2.25.1


