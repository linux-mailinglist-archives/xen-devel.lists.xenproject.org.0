Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8803A550FA4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 07:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352306.579101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o39hY-0002UC-On; Mon, 20 Jun 2022 05:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352306.579101; Mon, 20 Jun 2022 05:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o39hY-0002Ri-L6; Mon, 20 Jun 2022 05:11:52 +0000
Received: by outflank-mailman (input) for mailman id 352306;
 Mon, 20 Jun 2022 05:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqE0=W3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o39hW-0000aY-V7
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 05:11:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7d79a30a-f057-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 07:11:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C36271042;
 Sun, 19 Jun 2022 22:11:49 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CD15F3F7D7;
 Sun, 19 Jun 2022 22:11:46 -0700 (PDT)
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
X-Inumbo-ID: 7d79a30a-f057-11ec-b725-ed86ccbb4733
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v5 6/8] xen/arm: set up shared memory foreign mapping for borrower domain
Date: Mon, 20 Jun 2022 13:11:12 +0800
Message-Id: <20220620051114.210118-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620051114.210118-1-Penny.Zheng@arm.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit sets up shared memory foreign mapping for borrower domain.

If owner domain is the default dom_io, all shared domain are treated as
borrower domain.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v5 change:
- no change
---
v4 changes:
- no change
---
v3 change:
- use map_regions_p2mt instead
---
v2 change:
- remove guest_physmap_add_shm, since for borrower domain, we only
do P2M foreign memory mapping now.
---
 xen/arch/arm/domain_build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 650d18f5ef..1584e6c2ce 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -962,6 +962,15 @@ static int __init process_shm(struct domain *d,
             if ( ret )
                 return ret;
         }
+
+        if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
+        {
+            /* Set up P2M foreign mapping for borrower domain. */
+            ret = map_regions_p2mt(d, _gfn(PFN_UP(gbase)), PFN_DOWN(psize),
+                                   _mfn(PFN_UP(pbase)), p2m_map_foreign_rw);
+            if ( ret )
+                return ret;
+        }
     }
 
     return 0;
-- 
2.25.1


