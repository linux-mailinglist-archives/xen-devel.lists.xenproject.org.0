Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C054806A4F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 10:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649005.1013226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnrc-0002fU-Al; Wed, 06 Dec 2023 09:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649005.1013226; Wed, 06 Dec 2023 09:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnrc-0002cn-6z; Wed, 06 Dec 2023 09:06:40 +0000
Received: by outflank-mailman (input) for mailman id 649005;
 Wed, 06 Dec 2023 09:06:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4rn=HR=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1rAnra-0002Yw-9o
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 09:06:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c221626e-9416-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 10:06:36 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3FCD139F;
 Wed,  6 Dec 2023 01:07:21 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 082133F762;
 Wed,  6 Dec 2023 01:06:32 -0800 (PST)
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
X-Inumbo-ID: c221626e-9416-11ee-98e5-6d05b1d4d9a1
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org,
	michal.orzel@amd.com
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 00/11] Follow-up static shared memory PART I
Date: Wed,  6 Dec 2023 17:06:12 +0800
Message-Id: <20231206090623.1932275-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some unsolving issues on current 4.18 static shared memory
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

Penny Zheng (11):
  xen/arm: remove stale addr_cells/size_cells in assign_shared_memory
  xen/arm: avoid repetitive checking in process_shm_node
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
  xen/arm: create another /memory node for static shm

 docs/misc/arm/device-tree/booting.txt   |  52 +-
 xen/arch/arm/dom0less-build.c           |  11 +-
 xen/arch/arm/domain_build.c             | 177 +++++-
 xen/arch/arm/include/asm/domain_build.h |   7 +
 xen/arch/arm/include/asm/kernel.h       |  11 +-
 xen/arch/arm/include/asm/setup.h        |  69 ++-
 xen/arch/arm/include/asm/static-shmem.h |  48 +-
 xen/arch/arm/mmu/p2m.c                  |  58 +-
 xen/arch/arm/static-shmem.c             | 742 ++++++++++++++++++------
 9 files changed, 929 insertions(+), 246 deletions(-)

-- 
2.25.1


