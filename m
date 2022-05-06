Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51E851D238
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 09:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322668.544118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsMh-0002dt-I0; Fri, 06 May 2022 07:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322668.544118; Fri, 06 May 2022 07:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsMh-0002az-Ci; Fri, 06 May 2022 07:27:03 +0000
Received: by outflank-mailman (input) for mailman id 322668;
 Fri, 06 May 2022 07:27:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5MfP=VO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmsLz-00078X-QD
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 07:26:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cf6aa5d6-cd0d-11ec-a406-831a346695d4;
 Fri, 06 May 2022 09:26:14 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3E7C1063;
 Fri,  6 May 2022 00:26:13 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C7FB53FA27;
 Fri,  6 May 2022 00:26:10 -0700 (PDT)
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
X-Inumbo-ID: cf6aa5d6-cd0d-11ec-a406-831a346695d4
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 7/9] xen/arm: set up shared memory foreign mapping for borrower domain
Date: Fri,  6 May 2022 15:25:00 +0800
Message-Id: <20220506072502.2177828-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506072502.2177828-1-Penny.Zheng@arm.com>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit sets up shared memory foreign mapping for borrower domain.

If owner domain is the default dom_io, all shared domain are treated as
borrower domain.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 change:
- remove guest_physmap_add_shm, since for borrower domain, we only
do P2M foreign memory mapping now.
---
 xen/arch/arm/domain_build.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 089b9e99fc..8d299a3616 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -965,6 +965,16 @@ static int __init process_shm(struct domain *d,
             if ( ret )
                 return ret;
         }
+
+        if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
+        {
+            /* Set up P2M foreign mapping for borrower domain. */
+            ret = guest_physmap_add_pages(d, _gfn(PFN_UP(gbase)),
+                                          _mfn(PFN_UP(pbase)), PFN_DOWN(psize),
+                                          p2m_map_foreign_rw);
+            if ( ret )
+                return ret;
+        }
     }
 
     return 0;
-- 
2.25.1


