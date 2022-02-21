Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9610A4BD910
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275986.472001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pp-0004HO-Ed; Mon, 21 Feb 2022 10:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275986.472001; Mon, 21 Feb 2022 10:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pp-0004FV-9j; Mon, 21 Feb 2022 10:22:25 +0000
Received: by outflank-mailman (input) for mailman id 275986;
 Mon, 21 Feb 2022 10:22:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM5pn-0004FJ-Lu
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:22:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pn-0002AS-0I; Mon, 21 Feb 2022 10:22:23 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pm-00070b-NS; Mon, 21 Feb 2022 10:22:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=4yA9Nr+hj5IU0/IE5qxpsEpm2+Op0kL5LsyBbZt/21Y=; b=wQ0vn/FgFMZs4XU85NDE+dCpUx
	wVoyzkWAzuEz78k23FqbvETjD+qdz2Py4qfxgnnONFpWKQs308YJV7RsY7HAt4mtVkxPNNSkm1K7X
	3uUJztNcz1Sw78ouUpfy+wJeevlvBUx6q8A33ZzRaREj9P3a1HdVGCm4Z1ahPe03WE9g=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 00/19] xen/arm: mm: Remove open-coding mappings
Date: Mon, 21 Feb 2022 10:21:59 +0000
Message-Id: <20220221102218.33785-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This series was originally sent as "xen/arm: mm: Add limited support
for superpages" [1] and finally has grown enough to remove most of
the open-coding mappings in the boot code.

This will help to:
    1) Get better compliance with the Arm memory model
    2) Pave the way to support other page size (64KB, 16KB)

The previous version was spent a few months ago. So I have decided
to remove all the acked-by/reviewed-by tags.

Cheers,

[1] <20201119190751.22345-1-julien@xen.org>
[2] <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>

Julien Grall (18):
  xen/arm: lpae: Rename LPAE_ENTRIES_MASK_GS to LPAE_ENTRY_MASK_GS
  xen/arm: lpae: Use the generic helpers to defined the Xen PT helpers
  xen/arm: p2m: Replace level_{orders, masks} arrays with
    XEN_PT_LEVEL_{ORDER, MASK}
  xen/arm: mm: Allow other mapping size in xen_pt_update_entry()
  xen/arm: mm: Add support for the contiguous bit
  xen/arm: mm: Avoid flushing the TLBs when mapping are inserted
  xen/arm: mm: Don't open-code Xen PT update in remove_early_mappings()
  xen/arm: mm: Re-implement early_fdt_map() using map_pages_to_xen()
  xen/arm32: mm: Check if the virtual address is shared before updating
    it
  xen/arm32: mm: Re-implement setup_xenheap_mappings() using
    map_pages_to_xen()
  xen/arm: mm: Allocate xen page tables in domheap rather than xenheap
  xen/arm: mm: Allow page-table allocation from the boot allocator
  xen/arm: Move fixmap definitions in a separate header
  xen/arm: mm: Clean-up the includes and order them
  xen/arm: mm: Use the PMAP helpers in xen_{,un}map_table()
  xen/arm64: mm: Add memory to the boot allocator first
  xen/arm: mm: Rework setup_xenheap_mappings()
  xen/arm: mm: Re-implement setup_frame_table_mappings() with
    map_pages_to_xen()

Wei Liu (1):
  xen/arm: add Persistent Map (PMAP) infrastructure

 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/acpi/lib.c                 |   2 +
 xen/arch/arm/arm32/head.S               |  14 +-
 xen/arch/arm/arm64/head.S               |  14 +-
 xen/arch/arm/include/asm/config.h       |  10 +-
 xen/arch/arm/include/asm/early_printk.h |   1 +
 xen/arch/arm/include/asm/fixmap.h       |  41 ++
 xen/arch/arm/include/asm/lpae.h         |  85 ++--
 xen/arch/arm/include/asm/mm.h           |   4 -
 xen/arch/arm/include/asm/page.h         |   8 +
 xen/arch/arm/include/asm/pmap.h         |  33 ++
 xen/arch/arm/kernel.c                   |   1 +
 xen/arch/arm/mm.c                       | 530 +++++++++++++-----------
 xen/arch/arm/p2m.c                      |  28 +-
 xen/arch/arm/setup.c                    |  63 ++-
 xen/common/Kconfig                      |   3 +
 xen/common/Makefile                     |   1 +
 xen/common/pmap.c                       |  79 ++++
 xen/include/xen/acpi.h                  |  18 +-
 xen/include/xen/pmap.h                  |  16 +
 20 files changed, 613 insertions(+), 339 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/fixmap.h
 create mode 100644 xen/arch/arm/include/asm/pmap.h
 create mode 100644 xen/common/pmap.c
 create mode 100644 xen/include/xen/pmap.h

-- 
2.32.0


