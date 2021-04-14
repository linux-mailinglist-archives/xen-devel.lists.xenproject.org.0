Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12F835F08E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 11:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110391.210721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWbbW-0000fS-4a; Wed, 14 Apr 2021 09:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110391.210721; Wed, 14 Apr 2021 09:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWbbW-0000ex-0O; Wed, 14 Apr 2021 09:14:34 +0000
Received: by outflank-mailman (input) for mailman id 110391;
 Wed, 14 Apr 2021 09:14:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yF16=JL=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lWbbU-0000WW-8i
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 09:14:32 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0ce19af9-f6a3-457b-b6d4-ff9b5050315a;
 Wed, 14 Apr 2021 09:14:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 461DF11B3;
 Wed, 14 Apr 2021 02:14:18 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 605463F73B;
 Wed, 14 Apr 2021 02:14:17 -0700 (PDT)
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
X-Inumbo-ID: 0ce19af9-f6a3-457b-b6d4-ff9b5050315a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 3/4] xen/arm: Clarify how the domid is decided in create_domUs()
Date: Wed, 14 Apr 2021 10:14:03 +0100
Message-Id: <20210414091404.14215-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210414091404.14215-1-luca.fancellu@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>

This patch adds a comment in create_domUs() right before
domain_create() to explain the importance of the pre-increment
operator on the variable max_init_domid, to ensure that the
domid 0 is allocated only during start_xen() function by the
create_dom0() and not on any other possible code path to the
domain_create() function.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v4:
- Change to the commit title
Changes in v3:
- removed check introduced in v2.
---
 xen/arch/arm/domain_build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 359957dc1b..b1d7b9849f 100644
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
-- 
2.17.1


