Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A037152EB99
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:10:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333897.557814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Sb-0005Bg-39; Fri, 20 May 2022 12:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333897.557814; Fri, 20 May 2022 12:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Sb-00059a-01; Fri, 20 May 2022 12:10:25 +0000
Received: by outflank-mailman (input) for mailman id 333897;
 Fri, 20 May 2022 12:10:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1Sa-00059U-5U
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:10:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1SZ-0005lu-Lm; Fri, 20 May 2022 12:10:23 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1SZ-0001lI-Br; Fri, 20 May 2022 12:10:23 +0000
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
	bh=PfQdHha3NyDl+QbbUrGt+GR8CbRK1UHmtQoAcc4a784=; b=FcPNpO9ckqkCdhHITw729Ei3qR
	R8/nIoxBDcEWSOwKKfdPQ+1e8Gvcu4f84RTl37QvwXA/JXAp711pkVpVlde+4s3v7dCZsJqHqJsMg
	vpd9EZcQ9BIVpj8hRkoGvuBXH6lAFWfmvY1WJYoBmd9GOlkGYkI0JbHSHJ/ojC6xpNxg=;
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
Subject: [PATCH 00/16] xen/arm: mm: Remove open-coding mappings
Date: Fri, 20 May 2022 13:09:21 +0100
Message-Id: <20220520120937.28925-1-julien@xen.org>
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

Cheers,

[1] <20201119190751.22345-1-julien@xen.org>

Julien Grall (15):
  xen/arm: mm: Allow other mapping size in xen_pt_update_entry()
  xen/arm: mm: Add support for the contiguous bit
  xen/arm: mm: Avoid flushing the TLBs when mapping are inserted
  xen/arm: mm: Don't open-code Xen PT update in remove_early_mappings()
  xen/arm: mm: Re-implement early_fdt_map() using map_pages_to_xen()
  xen/arm32: mm: Re-implement setup_xenheap_mappings() using
    map_pages_to_xen()
  xen/arm: mm: Allocate xen page tables in domheap rather than xenheap
  xen/arm: mm: Allow page-table allocation from the boot allocator
  xen/arm: Move fixmap definitions in a separate header
  xen/arm: mm: Clean-up the includes and order them
  xen/arm: mm: Use the PMAP helpers in xen_{,un}map_table()
  xen/arm32: setup: Move out the code to populate the boot allocator
  xen/arm64: mm: Add memory to the boot allocator first
  xen/arm: mm: Rework setup_xenheap_mappings()
  xen/arm: mm: Re-implement setup_frame_table_mappings() with
    map_pages_to_xen()

Wei Liu (1):
  xen/arm: add Persistent Map (PMAP) infrastructure

 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/acpi/lib.c                 |   2 +
 xen/arch/arm/include/asm/config.h       |   6 -
 xen/arch/arm/include/asm/early_printk.h |   1 +
 xen/arch/arm/include/asm/fixmap.h       |  48 +++
 xen/arch/arm/include/asm/lpae.h         |   8 +
 xen/arch/arm/include/asm/mm.h           |   4 -
 xen/arch/arm/include/asm/page.h         |   8 +
 xen/arch/arm/include/asm/pmap.h         |  32 ++
 xen/arch/arm/kernel.c                   |   1 +
 xen/arch/arm/mm.c                       | 494 +++++++++++++-----------
 xen/arch/arm/setup.c                    | 141 +++----
 xen/common/Kconfig                      |   3 +
 xen/common/Makefile                     |   1 +
 xen/common/pmap.c                       |  72 ++++
 xen/include/xen/acpi.h                  |  18 +-
 xen/include/xen/pmap.h                  |  16 +
 17 files changed, 549 insertions(+), 307 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/fixmap.h
 create mode 100644 xen/arch/arm/include/asm/pmap.h
 create mode 100644 xen/common/pmap.c
 create mode 100644 xen/include/xen/pmap.h

-- 
2.32.0


