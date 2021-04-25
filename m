Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68D536A91D
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117300.223099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal88-0001Qo-Qh; Sun, 25 Apr 2021 20:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117300.223099; Sun, 25 Apr 2021 20:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal88-0001QP-N0; Sun, 25 Apr 2021 20:13:24 +0000
Received: by outflank-mailman (input) for mailman id 117300;
 Sun, 25 Apr 2021 20:13:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lal87-0001QF-BU
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:13:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal86-0000nv-CE; Sun, 25 Apr 2021 20:13:22 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal86-0005m7-0Y; Sun, 25 Apr 2021 20:13:22 +0000
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
	bh=X15PJsfA8ZZe0WJ5gNkzuQ01mz4/pctOMdwEQyJoq0Y=; b=aki4KyKmRPMzQcN3N664q1pYhD
	VFTvNwGwcH5NDAaoSfIoOX7a3w5naRxH6VpTQlXTZrvpODwI6KALAvbnX9pN+rUvHY/fGka9pMnlo
	LfzN1dbaGBsRsREAT4kOMZIk8AcysTciftxSL0sCPKwO0b4lZ63OKFn6Kh/D6G1gAUSw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Hongian Xia <hongyax@amazon.com>
Subject: [PATCH RFCv2 00/15] xen/arm: mm: Remove open-coding mappings
Date: Sun, 25 Apr 2021 21:13:03 +0100
Message-Id: <20210425201318.15447-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
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

This is not fully finished (only boot tested on Arm64) but I sent it
early to get more testing and also unblock some of the on-going work
to support static memory allocation for dom0less (see [2]).

There are still a few TODOs:
    - Add support for setting the contiguous bits
    - Remove 1GB alignment in setup_xenheap_mappings()
    - Decide whether we want to provide a common PMAP

Cheers,

[1] <20201119190751.22345-1-julien@xen.org>
[2] <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>

Julien Grall (14):
  xen/arm: lpae: Rename LPAE_ENTRIES_MASK_GS to LPAE_ENTRY_MASK_GS
  xen/arm: lpae: Use the generic helpers to defined the Xen PT helpers
  xen/arm: p2m: Replace level_{orders, masks} arrays with LEVEL_{ORDER,
    MASK}
  xen/arm: mm: Allow other mapping size in xen_pt_update_entry()
  xen/arm: mm: Avoid flushing the TLBs when mapping are inserted
  xen/arm: mm: Don't open-code Xen PT update in remove_early_mappings()
  xen/arm: mm: Re-implement early_fdt_map() using map_pages_to_xen()
  xen/arm32: mm: Check if the virtual address is shared before updating
    it
  xen/arm32: mm: Re-implement setup_xenheap_mappings() using
    map_pages_to_xen()
  xen/arm: mm: Allocate xen page tables in domheap rather than xenheap
  xen/arm: mm: Allow page-table allocation from the boot allocator
  xen/arm: mm: Use the PMAP helpers in xen_{,un}map_table()
  xen/arm: mm: Rework setup_xenheap_mappings()
  xen/arm: mm: Re-implement setup_frame_table_mappings() with
    map_pages_to_xen()

Wei Liu (1):
  xen/arm: add Persistent Map (PMAP) infrastructure

 xen/arch/arm/Makefile        |   1 +
 xen/arch/arm/mm.c            | 362 +++++++++++++++++------------------
 xen/arch/arm/p2m.c           |  16 +-
 xen/arch/arm/pmap.c          | 101 ++++++++++
 xen/arch/arm/setup.c         |  10 +-
 xen/include/asm-arm/config.h |   6 +
 xen/include/asm-arm/lpae.h   |  83 ++++----
 xen/include/asm-arm/page.h   |   4 +
 xen/include/asm-arm/pmap.h   |  10 +
 9 files changed, 356 insertions(+), 237 deletions(-)
 create mode 100644 xen/arch/arm/pmap.c
 create mode 100644 xen/include/asm-arm/pmap.h

-- 
2.17.1


