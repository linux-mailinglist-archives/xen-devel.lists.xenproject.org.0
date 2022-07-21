Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AC357CBCA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 15:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372769.604770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEW7t-0004em-H5; Thu, 21 Jul 2022 13:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372769.604770; Thu, 21 Jul 2022 13:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEW7t-0004aX-AF; Thu, 21 Jul 2022 13:22:01 +0000
Received: by outflank-mailman (input) for mailman id 372769;
 Thu, 21 Jul 2022 13:21:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEVB=X2=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oEW7r-0002GA-2h
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 13:21:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 18a15023-08f8-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 15:21:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D98A723A;
 Thu, 21 Jul 2022 06:21:57 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 42AF63F73D;
 Thu, 21 Jul 2022 06:21:55 -0700 (PDT)
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
X-Inumbo-ID: 18a15023-08f8-11ed-bd2d-47488cf2e6aa
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 8/9] xen/arm: enable statically shared memory on Dom0
Date: Thu, 21 Jul 2022 21:21:14 +0800
Message-Id: <20220721132115.3015761-9-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721132115.3015761-1-Penny.Zheng@arm.com>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <penny.zheng@arm.com>

To add statically shared memory nodes in Dom0, user shall put according
static shared memory configuration under /chosen node.

This commit adds shm-processing function process_shm in construct_dom0
to enable statically shared memory on Dom0.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v6 change:
- no change
---
v5 change:
- no change
---
v4 change:
- no change
---
v3 change:
- no change
---
v2 change:
- no change
---
 xen/arch/arm/domain_build.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8d2c465c99..7c592d63ab 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2684,6 +2684,11 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
             if ( res )
                 return res;
         }
+
+        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
+                                    &kinfo->shm_mem);
+        if ( res )
+            return res;
     }
 
     res = fdt_end_node(kinfo->fdt);
@@ -3756,6 +3761,9 @@ static int __init construct_dom0(struct domain *d)
 {
     struct kernel_info kinfo = {};
     int rc;
+#ifdef CONFIG_STATIC_SHM
+    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+#endif
 
     /* Sanity! */
     BUG_ON(d->domain_id != 0);
@@ -3790,6 +3798,12 @@ static int __init construct_dom0(struct domain *d)
     allocate_memory_11(d, &kinfo);
     find_gnttab_region(d, &kinfo);
 
+#ifdef CONFIG_STATIC_SHM
+    rc = process_shm(d, &kinfo, chosen);
+    if ( rc < 0 )
+        return rc;
+#endif
+
     /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
     rc = gic_map_hwdom_extra_mappings(d);
     if ( rc < 0 )
-- 
2.25.1


