Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9FD357FDF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 11:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107107.204758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lURHI-0004ho-MB; Thu, 08 Apr 2021 09:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107107.204758; Thu, 08 Apr 2021 09:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lURHI-0004ge-Gx; Thu, 08 Apr 2021 09:48:44 +0000
Received: by outflank-mailman (input) for mailman id 107107;
 Thu, 08 Apr 2021 09:48:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0/ag=JF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lURHG-0004WM-PL
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 09:48:42 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 01058904-8bb3-44bc-a1ec-534ffde50552;
 Thu, 08 Apr 2021 09:48:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D38711B3;
 Thu,  8 Apr 2021 02:48:34 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4EE73F694;
 Thu,  8 Apr 2021 02:48:32 -0700 (PDT)
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
X-Inumbo-ID: 01058904-8bb3-44bc-a1ec-534ffde50552
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/4] xen/arm: Reserve domid 0 for Dom0
Date: Thu,  8 Apr 2021 10:48:17 +0100
Message-Id: <20210408094818.8173-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210408094818.8173-1-luca.fancellu@arm.com>
References: <20210408094818.8173-1-luca.fancellu@arm.com>

This patch ensure that the domid 0 is allocated only during
start_xen() function by the create_dom0().
Add a comment in create_domUs() right before domain_create()
to explain the importance of the pre-increment operator
on the variable max_init_domid.
Add an additional check in do_domctl() to make sure domid 0
is never used when calling domain_create().

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/domain_build.c | 5 +++++
 xen/common/domctl.c         | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d7c9c7f4d1..3fa5c8e54c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2508,6 +2508,11 @@ void __init create_domUs(void)
                                          GUEST_VPL011_SPI - 32 + 1);
         }
 
+        /*
+         * The variable max_init_domid is initialized with zero, so here it's
+         * very important to use the pre-increment operator to call
+         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
+         */
         d = domain_create(++max_init_domid, &d_cfg, false);
         if ( IS_ERR(d) )
             panic("Error creating domain %s\n", dt_node_name(node));
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index af044e2eda..8258f157ef 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -419,7 +419,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             {
                 if ( dom == DOMID_FIRST_RESERVED )
                     dom = 1;
-                if ( is_free_domid(dom) )
+                if ( (dom != 0) && is_free_domid(dom) )
                     break;
             }
 
-- 
2.17.1


