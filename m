Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4881C5FD64E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 10:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421748.667338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oitjj-00059K-Oi; Thu, 13 Oct 2022 08:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421748.667338; Thu, 13 Oct 2022 08:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oitjj-000561-LG; Thu, 13 Oct 2022 08:38:39 +0000
Received: by outflank-mailman (input) for mailman id 421748;
 Thu, 13 Oct 2022 08:38:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oitji-00055u-87
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 08:38:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6cc26f86-4ad2-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 10:38:35 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DD9415A1;
 Thu, 13 Oct 2022 01:38:41 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B1D23F67D;
 Thu, 13 Oct 2022 01:38:32 -0700 (PDT)
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
X-Inumbo-ID: 6cc26f86-4ad2-11ed-8fd0-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in arch_domain_create()
Date: Thu, 13 Oct 2022 08:38:18 +0000
Message-Id: <20221013083818.36209-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
when the domain is created. Considering the worst case of page tables
and keep a buffer, populate 16 pages as the default value to the P2M
pages pool in arch_domain_create() at the domain creation stage to
satisfy the GICv2 requirement.

Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M pool")
Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
This should also be backported to 4.13, 4.14, 4.15 and 4.16.
---
 xen/arch/arm/domain.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2c84e6dbbb..e40e2bcba1 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -740,6 +740,20 @@ int arch_domain_create(struct domain *d,
         BUG();
     }
 
+    spin_lock(&d->arch.paging.lock);
+    /*
+     * Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
+     * when the domain is created. Considering the worst case for page
+     * tables and keep a buffer, populate 16 pages to the P2M pages pool here.
+     */
+    if ( (rc = p2m_set_allocation(d, 16, NULL)) != 0 )
+    {
+        p2m_set_allocation(d, 0, NULL);
+        spin_unlock(&d->arch.paging.lock);
+        goto fail;
+    }
+    spin_unlock(&d->arch.paging.lock);
+
     if ( (rc = domain_vgic_register(d, &count)) != 0 )
         goto fail;
 
-- 
2.17.1


