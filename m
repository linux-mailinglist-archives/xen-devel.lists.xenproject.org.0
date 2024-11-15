Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63129CDD05
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 11:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837071.1252984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtud-0000mS-Mw; Fri, 15 Nov 2024 10:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837071.1252984; Fri, 15 Nov 2024 10:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtud-0000k9-Js; Fri, 15 Nov 2024 10:50:51 +0000
Received: by outflank-mailman (input) for mailman id 837071;
 Fri, 15 Nov 2024 10:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntz=SK=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tBtuc-0000jy-Ce
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 10:50:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 77d84b60-a33f-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 11:50:46 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE3271476;
 Fri, 15 Nov 2024 02:51:15 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78D0C3F6A8;
 Fri, 15 Nov 2024 02:50:44 -0800 (PST)
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
X-Inumbo-ID: 77d84b60-a33f-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6Ijc3ZDg0YjYwLWEzM2YtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjY3ODQ2LjkzODI4NSwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/5] Prerequisite patches for R82 upstreaming
Date: Fri, 15 Nov 2024 10:50:31 +0000
Message-Id: <20241115105036.218418-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this serie I've taken out patches from the R82 branch already in the ML[1]
and some new patches I've done based on the current status of staging that will
not impact the current Armv8-R earlyboot work.

[1] https://patchwork.kernel.org/project/xen-devel/cover/20230626033443.2943270-1-Penny.Zheng@arm.com/

Luca Fancellu (3):
  common/vmap: Fall back to simple allocator when !HAS_VMAP
  arm/setup: Move MMU specific extern declarations to mmu/mm.h
  xen/arm: Use vmap_contig instead of __vmap where it's possible

Penny Zheng (2):
  xen/arm: only map the init text section RW in free_init_memory
  xen/arm: do not give memory back to static heap

 xen/arch/arm/alternative.c           |  3 +--
 xen/arch/arm/arm32/mmu/mm.c          |  4 ++--
 xen/arch/arm/cpuerrata.c             |  5 ++--
 xen/arch/arm/include/asm/mmu/mm.h    | 11 +++++++++
 xen/arch/arm/include/asm/setup.h     | 11 ---------
 xen/arch/arm/kernel.c                |  5 ++--
 xen/arch/arm/livepatch.c             |  3 +--
 xen/arch/arm/mmu/setup.c             | 16 +++++++++----
 xen/arch/arm/setup.c                 | 27 +++++++++++----------
 xen/common/device-tree/bootfdt.c     |  2 +-
 xen/common/device-tree/bootinfo.c    |  2 +-
 xen/common/device-tree/device-tree.c |  3 +++
 xen/common/vmap.c                    |  7 ++++++
 xen/include/xen/bootfdt.h            | 11 ++++++++-
 xen/include/xen/vmap.h               |  9 ++-----
 xen/include/xen/xvmalloc.h           | 36 ++++++++++++++++++++++++----
 16 files changed, 100 insertions(+), 55 deletions(-)

-- 
2.34.1


