Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9B5248CC
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 11:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327538.550371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np50y-0004mq-Np; Thu, 12 May 2022 09:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327538.550371; Thu, 12 May 2022 09:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np50y-0004kj-L0; Thu, 12 May 2022 09:21:44 +0000
Received: by outflank-mailman (input) for mailman id 327538;
 Thu, 12 May 2022 09:21:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsCQ=VU=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1np4s8-0000K4-BT
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 09:12:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a97b9672-d1d3-11ec-a406-831a346695d4;
 Thu, 12 May 2022 11:12:35 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F79D106F;
 Thu, 12 May 2022 02:12:35 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 79D313F73D;
 Thu, 12 May 2022 02:12:32 -0700 (PDT)
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
X-Inumbo-ID: a97b9672-d1d3-11ec-a406-831a346695d4
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <penny.zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 8/8] xen/arm: enable statically shared memory on Dom0
Date: Thu, 12 May 2022 17:11:29 +0800
Message-Id: <20220512091129.2802997-9-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512091129.2802997-1-Penny.Zheng@arm.com>
References: <20220512091129.2802997-1-Penny.Zheng@arm.com>
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
v3 change:
- no change
---
v2 change:
- no change
---
 xen/arch/arm/domain_build.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fb9146b6e0..f4740f9085 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2611,6 +2611,11 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
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
@@ -3622,6 +3627,9 @@ static int __init construct_dom0(struct domain *d)
 {
     struct kernel_info kinfo = {};
     int rc;
+#ifdef CONFIG_STATIC_SHM
+    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+#endif
 
     /* Sanity! */
     BUG_ON(d->domain_id != 0);
@@ -3656,6 +3664,12 @@ static int __init construct_dom0(struct domain *d)
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


