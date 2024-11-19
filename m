Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B06B9D21FF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 09:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839758.1255546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDK46-0005QQ-IJ; Tue, 19 Nov 2024 08:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839758.1255546; Tue, 19 Nov 2024 08:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDK46-0005I5-Ee; Tue, 19 Nov 2024 08:58:30 +0000
Received: by outflank-mailman (input) for mailman id 839758;
 Tue, 19 Nov 2024 08:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Q5=SO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tDK44-0005G3-Qa
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 08:58:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6f2817e7-a654-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 09:58:24 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FB36150C;
 Tue, 19 Nov 2024 00:58:54 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C71E43F6A8;
 Tue, 19 Nov 2024 00:58:22 -0800 (PST)
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
X-Inumbo-ID: 6f2817e7-a654-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjZmMjgxN2U3LWE2NTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDA2NzA1LjEzMTAyNywic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
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
Subject: [PATCH v2 0/4] Prerequisite patches for R82 upstreaming
Date: Tue, 19 Nov 2024 08:58:02 +0000
Message-Id: <20241119085806.805142-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this serie I've taken out patches from the R82 branch already in the ML[1]
and some new patches I've done based on the current status of staging that will
not impact the current Armv8-R earlyboot work.

[1] https://patchwork.kernel.org/project/xen-devel/cover/20230626033443.2943270-1-Penny.Zheng@arm.com/

Luca Fancellu (3):
  common/vmap: Fall back to simple allocator when !HAS_VMAP
  arm/setup: Move MMU specific extern declarations to mmu/setup.h
  xen/arm: Use vmap_contig instead of __vmap where it's possible

Penny Zheng (1):
  xen/arm: do not give memory back to static heap

 xen/arch/arm/alternative.c           |  3 +-
 xen/arch/arm/arm32/mmu/mm.c          |  4 +-
 xen/arch/arm/cpuerrata.c             |  5 +--
 xen/arch/arm/include/asm/mmu/setup.h | 31 ++++++++++++++
 xen/arch/arm/include/asm/setup.h     | 20 +++------
 xen/arch/arm/kernel.c                |  9 ++--
 xen/arch/arm/livepatch.c             |  3 +-
 xen/arch/arm/mmu/setup.c             |  8 +++-
 xen/arch/arm/setup.c                 | 27 ++++++------
 xen/common/device-tree/bootfdt.c     |  4 +-
 xen/common/device-tree/bootinfo.c    |  2 +-
 xen/common/page_alloc.c              |  5 +++
 xen/include/xen/bootfdt.h            | 14 ++++++-
 xen/include/xen/vmap.h               | 61 ++++++++++++++++------------
 xen/include/xen/xvmalloc.h           | 36 +++++++++++++---
 15 files changed, 156 insertions(+), 76 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mmu/setup.h

-- 
2.34.1


