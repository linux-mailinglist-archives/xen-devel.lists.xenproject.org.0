Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E05AE3AC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 11:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399681.640945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVURM-0001uQ-5N; Tue, 06 Sep 2022 09:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399681.640945; Tue, 06 Sep 2022 09:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVURM-0001pI-1w; Tue, 06 Sep 2022 09:00:16 +0000
Received: by outflank-mailman (input) for mailman id 399681;
 Tue, 06 Sep 2022 09:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YUvx=ZJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oVURK-0007aG-EM
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 09:00:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5197c71e-2dc2-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 11:00:13 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53905176C;
 Tue,  6 Sep 2022 02:00:19 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78A923F7B4;
 Tue,  6 Sep 2022 02:00:10 -0700 (PDT)
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
X-Inumbo-ID: 5197c71e-2dc2-11ed-a016-b9edf5238543
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v7 6/9] xen/arm: set up shared memory foreign mapping for borrower domain
Date: Tue,  6 Sep 2022 16:59:38 +0800
Message-Id: <20220906085941.944592-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906085941.944592-1-Penny.Zheng@arm.com>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit sets up shared memory foreign mapping for borrower domain.

If owner domain is the default dom_io, all shared domain are treated as
borrower domain.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v7 change:
- no changes
---
v6 change:
- no change
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
index dbb880b5f2..d0ff487cc6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -990,6 +990,15 @@ static int __init process_shm(struct domain *d,
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


