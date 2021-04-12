Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8F335C466
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 12:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108962.207979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuBs-0000pp-7Z; Mon, 12 Apr 2021 10:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108962.207979; Mon, 12 Apr 2021 10:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuBs-0000p5-2S; Mon, 12 Apr 2021 10:53:12 +0000
Received: by outflank-mailman (input) for mailman id 108962;
 Mon, 12 Apr 2021 10:53:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKKJ=JJ=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lVuBq-0000jA-Kz
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:53:10 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fea0e1d6-044f-4d5b-b334-ffe3636f831e;
 Mon, 12 Apr 2021 10:53:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A329D6E;
 Mon, 12 Apr 2021 03:53:05 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33BF53F694;
 Mon, 12 Apr 2021 03:53:04 -0700 (PDT)
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
X-Inumbo-ID: fea0e1d6-044f-4d5b-b334-ffe3636f831e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/4] xen/arm: Reserve domid 0 for Dom0
Date: Mon, 12 Apr 2021 11:52:42 +0100
Message-Id: <20210412105243.23354-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210412105243.23354-1-luca.fancellu@arm.com>
References: <20210412105243.23354-1-luca.fancellu@arm.com>

This patch adds a comment in create_domUs() right before
domain_create() to explain the importance of the pre-increment
operator on the variable max_init_domid, to ensure that the
domid 0 is allocated only during start_xen() function by the
create_dom0() and not on any other possible code path to the
domain_create() function.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
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


