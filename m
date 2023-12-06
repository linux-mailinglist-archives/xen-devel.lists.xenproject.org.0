Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7D806A51
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 10:06:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649006.1013236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnre-0002xg-Jx; Wed, 06 Dec 2023 09:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649006.1013236; Wed, 06 Dec 2023 09:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnre-0002ty-FN; Wed, 06 Dec 2023 09:06:42 +0000
Received: by outflank-mailman (input) for mailman id 649006;
 Wed, 06 Dec 2023 09:06:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4rn=HR=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1rAnrd-00022d-As
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 09:06:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c4103803-9416-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 10:06:39 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CDDF1474;
 Wed,  6 Dec 2023 01:07:25 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2486F3F762;
 Wed,  6 Dec 2023 01:06:35 -0800 (PST)
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
X-Inumbo-ID: c4103803-9416-11ee-9b0f-b553b5be7939
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org,
	michal.orzel@amd.com
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v5 01/11] xen/arm: remove stale addr_cells/size_cells in assign_shared_memory
Date: Wed,  6 Dec 2023 17:06:13 +0800
Message-Id: <20231206090623.1932275-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206090623.1932275-1-Penny.Zheng@arm.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function parameters {addr_cells,size_cells} are stale parameters in
assign_shared_memory, so we shall remove them.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v1 -> v2:
- new commit
---
v2 -> v3:
rebase and no change
---
v3 -> v4:
rebase and no change
---
v4 -> v5:
rebase and no change
---
 xen/arch/arm/static-shmem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 9097bc8b15..cb268cd2ed 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -90,7 +90,6 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
 }
 
 static int __init assign_shared_memory(struct domain *d,
-                                       uint32_t addr_cells, uint32_t size_cells,
                                        paddr_t pbase, paddr_t psize,
                                        paddr_t gbase)
 {
@@ -252,7 +251,6 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
              * specified, so they should be assigned to dom_io.
              */
             ret = assign_shared_memory(owner_dom_io ? dom_io : d,
-                                       addr_cells, size_cells,
                                        pbase, psize, gbase);
             if ( ret )
                 return ret;
-- 
2.25.1


