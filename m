Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509586A027A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 06:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499861.771143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV4MA-0000UQ-R6; Thu, 23 Feb 2023 05:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499861.771143; Thu, 23 Feb 2023 05:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV4MA-0000RH-LX; Thu, 23 Feb 2023 05:41:26 +0000
Received: by outflank-mailman (input) for mailman id 499861;
 Thu, 23 Feb 2023 05:41:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4j0=6T=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pV4M9-0000Ql-NG
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 05:41:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b3700423-b33c-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 06:41:21 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DC681FB;
 Wed, 22 Feb 2023 21:42:03 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C93253F587;
 Wed, 22 Feb 2023 21:41:17 -0800 (PST)
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
X-Inumbo-ID: b3700423-b33c-11ed-a82a-c9ca1d2f71af
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V2 0/8] Follow-up static shared memory PART I
Date: Thu, 23 Feb 2023 13:40:57 +0800
Message-Id: <20230223054105.2357217-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some unsolving issues on current 4.17 static shared memory
feature[1], including:
- In order to avoid keeping growing 'membank', having the shared memory
info in separate structures is preferred.
- Missing implementation on having the host address optional in
"xen,shared-mem" property
- Removing static shared memory from extended regions
- Missing reference release on foreign superpage
- Missing "xen,offset" feature, which is introduced in Linux DOC[2]

All above objects have been divided into two parts to complete. And this
patch serie is PART I.

[1] https://lore.kernel.org/all/20220908135513.1800511-1-Penny.Zheng@arm.com/
[2] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/xen%2Cshared-memory.txt

Penny Zheng (8):
  xen/arm: remove stale addr_cells/size_cells in assign_shared_memory
  xen/arm: re-define a set of data structures for static shared memory
    region
  xen/arm: introduce allocate_domheap_memory and guest_physmap_memory
  xen/arm: use paddr_assigned to indicate whether host address is
    provided
  xen/arm: support static shared memory when host address not provided
  xen/arm: remove shm holes for extended regions
  xen/p2m: put reference for superpage
  docs: refine docs about static shared memory

 docs/misc/arm/device-tree/booting.txt |  52 +-
 xen/arch/arm/bootfdt.c                | 129 +++--
 xen/arch/arm/domain_build.c           | 704 ++++++++++++++++++++------
 xen/arch/arm/include/asm/kernel.h     |   9 +-
 xen/arch/arm/include/asm/setup.h      |  57 ++-
 xen/arch/arm/p2m.c                    |  60 ++-
 6 files changed, 784 insertions(+), 227 deletions(-)

-- 
2.25.1


