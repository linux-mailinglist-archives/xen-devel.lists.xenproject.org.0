Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7F8794BC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691810.1078212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nN-0004o1-JP; Tue, 12 Mar 2024 13:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691810.1078212; Tue, 12 Mar 2024 13:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nN-0004ko-G0; Tue, 12 Mar 2024 13:03:53 +0000
Received: by outflank-mailman (input) for mailman id 691810;
 Tue, 12 Mar 2024 13:03:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91vH=KS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rk1nL-0004Wa-Vl
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:03:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f8611b0f-e070-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 14:03:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 225A01570;
 Tue, 12 Mar 2024 06:04:27 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92F9D3F762;
 Tue, 12 Mar 2024 06:03:48 -0700 (PDT)
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
X-Inumbo-ID: f8611b0f-e070-11ee-afdd-a90da7624cb6
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH 01/11] xen/arm: remove stale addr_cells/size_cells in assign_shared_memory
Date: Tue, 12 Mar 2024 13:03:21 +0000
Message-Id: <20240312130331.78418-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312130331.78418-1-luca.fancellu@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

Function parameters {addr_cells,size_cells} are stale parameters in
assign_shared_memory, so we shall remove them.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v1:
 - This is this patch: https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-2-Penny.Zheng@arm.com/
---
 xen/arch/arm/static-shmem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 9097bc8b1511..cb268cd2edf1 100644
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
2.34.1


