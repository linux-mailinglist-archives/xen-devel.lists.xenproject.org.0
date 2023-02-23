Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080A6A0279
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 06:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499862.771149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV4MB-0000Ze-3A; Thu, 23 Feb 2023 05:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499862.771149; Thu, 23 Feb 2023 05:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV4MA-0000UU-Tz; Thu, 23 Feb 2023 05:41:26 +0000
Received: by outflank-mailman (input) for mailman id 499862;
 Thu, 23 Feb 2023 05:41:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4j0=6T=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pV4M9-0000Ql-U2
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 05:41:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b565c53b-b33c-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 06:41:24 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F67BC14;
 Wed, 22 Feb 2023 21:42:06 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C34463F587;
 Wed, 22 Feb 2023 21:41:20 -0800 (PST)
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
X-Inumbo-ID: b565c53b-b33c-11ed-a82a-c9ca1d2f71af
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 1/8] xen/arm: remove stale addr_cells/size_cells in assign_shared_memory
Date: Thu, 23 Feb 2023 13:40:58 +0800
Message-Id: <20230223054105.2357217-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223054105.2357217-1-Penny.Zheng@arm.com>
References: <20230223054105.2357217-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function parameters {addr_cells,size_cells} are stale parameters in
assign_shared_memory, so we shall remove them.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v1 -> v2:
- new commit
---
 xen/arch/arm/domain_build.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index edca23b986..4a6f743f35 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -836,7 +836,6 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
 }
 
 static int __init assign_shared_memory(struct domain *d,
-                                       uint32_t addr_cells, uint32_t size_cells,
                                        paddr_t pbase, paddr_t psize,
                                        paddr_t gbase)
 {
@@ -998,7 +997,6 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
              * specified, so they should be assigned to dom_io.
              */
             ret = assign_shared_memory(owner_dom_io ? dom_io : d,
-                                       addr_cells, size_cells,
                                        pbase, psize, gbase);
             if ( ret )
                 return ret;
-- 
2.25.1


