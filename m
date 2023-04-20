Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B16E929F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524061.814670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSTD-0003be-8H; Thu, 20 Apr 2023 11:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524061.814670; Thu, 20 Apr 2023 11:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSTD-0003Zz-3h; Thu, 20 Apr 2023 11:28:59 +0000
Received: by outflank-mailman (input) for mailman id 524061;
 Thu, 20 Apr 2023 11:28:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE5v=AL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ppSQd-0006Vv-Ha
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:26:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2b79b97b-df6e-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 13:26:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 262E91480;
 Thu, 20 Apr 2023 04:27:02 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E01963F587;
 Thu, 20 Apr 2023 04:26:15 -0700 (PDT)
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
X-Inumbo-ID: 2b79b97b-df6e-11ed-b21f-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v3 11/17] xen/arm: keep guest still be NUMA unware
Date: Thu, 20 Apr 2023 19:25:15 +0800
Message-Id: <20230420112521.3272732-12-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420112521.3272732-1-Henry.Wang@arm.com>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

The NUMA information provided in the host Device-Tree
are only for Xen. For dom0, we want to hide them as they
may be different (for now, dom0 is still not aware of NUMA)
The CPU and memory nodes are recreated from scratch for the
domain. So we already skip the "numa-node-id" property for
these two types of nodes.

However, some devices like PCIe may have "numa-node-id"
property too. We have to skip them as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
1. No change.
v1 -> v2:
1. Add Rb
---
 xen/arch/arm/domain_build.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f80fdd1af2..2bf586fc45 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1185,6 +1185,10 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                 continue;
         }
 
+        /* Dom0 is currently NUMA unaware */
+        if ( dt_property_name_is_equal(prop, "numa-node-id") )
+            continue;
+
         res = fdt_property(kinfo->fdt, prop->name, prop_data, prop_len);
 
         if ( res )
@@ -2567,6 +2571,8 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         DT_MATCH_TYPE("memory"),
         /* The memory mapped timer is not supported by Xen. */
         DT_MATCH_COMPATIBLE("arm,armv7-timer-mem"),
+        /* Numa info doesn't need to be exposed to Domain-0 */
+        DT_MATCH_COMPATIBLE("numa-distance-map-v1"),
         { /* sentinel */ },
     };
     static const struct dt_device_match timer_matches[] __initconst =
-- 
2.25.1


