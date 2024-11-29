Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6899DC144
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 10:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845797.1261134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGx4M-0004u1-8y; Fri, 29 Nov 2024 09:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845797.1261134; Fri, 29 Nov 2024 09:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGx4M-0004s2-62; Fri, 29 Nov 2024 09:13:46 +0000
Received: by outflank-mailman (input) for mailman id 845797;
 Fri, 29 Nov 2024 09:13:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aowa=SY=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tGx4K-0004rr-IS
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 09:13:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3951ced5-ae32-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 10:13:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF9E712FC;
 Fri, 29 Nov 2024 01:14:09 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB1163F58B;
 Fri, 29 Nov 2024 01:13:38 -0800 (PST)
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
X-Inumbo-ID: 3951ced5-ae32-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjM5NTFjZWQ1LWFlMzItMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODcxNjIxLjM4MDMzMSwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
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
Subject: [PATCH v3 0/5] Prerequisite patches for R82 upstreaming
Date: Fri, 29 Nov 2024 09:12:32 +0000
Message-Id: <20241129091237.3409304-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In this serie I've taken out patches from the R82 branch already in the ML[1]
and some new patches I've done based on the current status of staging that will
not impact the current Armv8-R earlyboot work.

[1] https://patchwork.kernel.org/project/xen-devel/cover/20230626033443.2943270-1-Penny.Zheng@arm.com/

Changes between v2 and v3:
 - New patch
 - changes to previous patch are listed inside them

Luca Fancellu (4):
  common/vmap: Fall back to simple allocator when !HAS_VMAP
  arm/setup: Move MMU specific extern declarations to mmu/setup.h
  xen/arm: Use vmap_contig instead of __vmap where it's possible
  xen/arm: Move setup_frametable_mappings to arm/mmu

Penny Zheng (1):
  xen/arm: Check for Static Heap feature when freeing resources

 xen/arch/arm/alternative.c           |  3 +-
 xen/arch/arm/arm32/mmu/mm.c          |  4 +-
 xen/arch/arm/cpuerrata.c             |  5 +--
 xen/arch/arm/include/asm/mmu/setup.h | 31 ++++++++++++++
 xen/arch/arm/include/asm/setup.h     | 20 +++------
 xen/arch/arm/kernel.c                |  9 ++--
 xen/arch/arm/livepatch.c             |  3 +-
 xen/arch/arm/mm.c                    | 40 ------------------
 xen/arch/arm/mmu/Makefile            |  1 +
 xen/arch/arm/mmu/mm.c                | 61 ++++++++++++++++++++++++++++
 xen/arch/arm/mmu/setup.c             |  8 +++-
 xen/arch/arm/setup.c                 | 27 ++++++------
 xen/common/device-tree/bootfdt.c     |  4 +-
 xen/common/device-tree/bootinfo.c    |  2 +-
 xen/common/page_alloc.c              |  5 +++
 xen/include/xen/bootfdt.h            |  1 -
 xen/include/xen/mm.h                 | 13 ++++++
 xen/include/xen/vmap.h               |  2 +-
 xen/include/xen/xvmalloc.h           | 36 +++++++++++++---
 19 files changed, 184 insertions(+), 91 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mmu/setup.h
 create mode 100644 xen/arch/arm/mmu/mm.c

-- 
2.34.1


