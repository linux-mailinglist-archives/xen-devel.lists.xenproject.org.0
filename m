Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F8C79A237
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 06:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598903.934084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfYAs-0005pj-Oa; Mon, 11 Sep 2023 04:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598903.934084; Mon, 11 Sep 2023 04:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfYAs-0005nS-Lz; Mon, 11 Sep 2023 04:05:22 +0000
Received: by outflank-mailman (input) for mailman id 598903;
 Mon, 11 Sep 2023 04:05:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ExPs=E3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qfYAr-0005n2-Jx
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 04:05:21 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6a8e3e66-5058-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 06:05:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A36EFD75;
 Sun, 10 Sep 2023 21:05:53 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C7DDA3F67D;
 Sun, 10 Sep 2023 21:05:13 -0700 (PDT)
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
X-Inumbo-ID: 6a8e3e66-5058-11ee-9b0d-b553b5be7939
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 00/10] Follow-up static shared memory PART I
Date: Mon, 11 Sep 2023 12:04:32 +0800
Message-Id: <20230911040442.2541398-1-Penny.Zheng@arm.com>
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
- Fix duplicated /reserved-memory node on Dom0
- Missing static shm node declaration on guest /memory node
- Missing "xen,offset" feature, which is introduced in Linux DOC[2]

All above objects have been divided into two parts to complete. And this
patch serie is PART I.

[1] https://lore.kernel.org/all/20220908135513.1800511-1-Penny.Zheng@arm.com/
[2] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/xen%2Cshared-memory.txt

Penny Zheng (10):
  xen/arm: remove stale addr_cells/size_cells in assign_shared_memory
  xen/arm: re-define a set of data structures for static shared memory
    region
  xen/arm: introduce allocate_domheap_memory and guest_physmap_memory
  xen/arm: use paddr_assigned to indicate whether host address is
    provided
  xen/arm: support static shared memory when host address not provided
  xen/arm: remove shm holes for extended regions
  xen/p2m: put reference for superpage
  xen/docs: refine docs about static shared memory
  xen/arm: fix duplicate /reserved-memory node in Dom0
  xen/arm: reate another /memory node for static shm

 docs/misc/arm/device-tree/booting.txt |  52 +-
 xen/arch/arm/bootfdt.c                | 125 ++++-
 xen/arch/arm/domain_build.c           | 780 ++++++++++++++++++++------
 xen/arch/arm/include/asm/kernel.h     |  11 +-
 xen/arch/arm/include/asm/setup.h      |  57 +-
 xen/arch/arm/p2m.c                    |  58 +-
 6 files changed, 856 insertions(+), 227 deletions(-)

-- 
2.25.1


