Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469138CCD2A
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728098.1132913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34S-0002w2-4u; Thu, 23 May 2024 07:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728098.1132913; Thu, 23 May 2024 07:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34R-0002sv-VR; Thu, 23 May 2024 07:41:03 +0000
Received: by outflank-mailman (input) for mailman id 728098;
 Thu, 23 May 2024 07:41:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Po+=M2=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1sA34P-0001WY-GT
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:41:01 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbe9361c-18d7-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 09:41:00 +0200 (CEST)
Received: from SJ0PR03CA0271.namprd03.prod.outlook.com (2603:10b6:a03:39e::6)
 by CY5PR12MB6059.namprd12.prod.outlook.com (2603:10b6:930:2c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 07:40:57 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::7) by SJ0PR03CA0271.outlook.office365.com
 (2603:10b6:a03:39e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Thu, 23 May 2024 07:40:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 07:40:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:40:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:40:55 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:40:52 -0500
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
X-Inumbo-ID: cbe9361c-18d7-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgKPuDp7h7POl4wtY17dpSFPp8a6+4Lys+iwRMefruh2Udblq2blnNdDZi2gOiLTJUITY4Pt30iHICpvdu/IY45SLJxaonu2k56Nvtlcc2zkyH4fR7+F2SV2lm4pu1iQ0bAGDkbYbLp4KQCBL2pBRKC1MQ5j/hbMnaJX9OZivvlyyD4QIwrRKYg6VdSW624ucIJCCvaQ/E3Nfq2O/sIBjAebwwvhlXO/YjW+3HO4zenxkD3pN7vnBlXlyGeHyhY4jntT/HSyH9K2I1VT6bF4Dja1tXBj2pVOYYqvghCUZFXvc6doUtbVK3InJ7Xi7NdyaJ8M+146exxfVDx/GcgcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cGqHcXBoZTzyZBk/4TEkkSbTo+NOg9YMZd/62zSuww=;
 b=RBlHBzNTiHNVbAyJR/b4bLst0YADu4Ycino6UouZKWc+a32S6KnktaRy+HkL+wBuyLkQU44MdC0YXbpn7Jw0hhz5RBhs2zuzrZI2cG1blozJcZr0Te6yqw/3NUIk8vEP6mfpJDQUyjbmzrQVrYCjFWyG8HtgyVYH6hhhwJd5in2zvU+1ZwGbtZQy5DH0nrQFOYrLhPWJzzaVIoY+hTyn4DPYtcC+q3/WJdymv1+D9XHU9yos9RfxvUXiXUJ9EnRYOt+jPBCgqv5LA92mAWzhfLDk4+IPAGy8m8iJCZl1sdw7xKVUdCcSZ+hdT3DiK7To42ANjoRCkoDkvuYN1jiujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cGqHcXBoZTzyZBk/4TEkkSbTo+NOg9YMZd/62zSuww=;
 b=xJskQFAZddZKAwcQxfx5spyajeQxOAUZ5CLC36EHTuG3H+tvT9g5A8R8BMNF7673A55ScT+DapVPdqY95hX84GlS1FcxFOdX3tbmIETcnb91ATT50UnPRkfKbGn9joKxDy/hbTtNDfXEw8PRM3KHl+ZS/DKxxHpZ1QwpgcJyPo4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Henry Wang
	<xin.wang2@amd.com>
Subject: [PATCH v4 5/9] xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains
Date: Thu, 23 May 2024 15:40:36 +0800
Message-ID: <20240523074040.1611264-6-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523074040.1611264-1-xin.wang2@amd.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|CY5PR12MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c5f866-43a4-4ba9-97dc-08dc7afbaeb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lecmbsste4sgjSXM7CrLlaewWO9a0Gm4oDdXUun5hp1CNdD9qi9oXY/NcOhP?=
 =?us-ascii?Q?b5Aoly6URh3mwihLbtCIQmfwlpGGROZiV8qVCm01V9KDF/+8IjJGjGuDuecS?=
 =?us-ascii?Q?7+hLjf+xuKlOO7yj3eP4wMqgb3LxaR6j0JVSUO9bPa33vfjWa8zmS9E7pcrB?=
 =?us-ascii?Q?U0NY0a+0yXVsvVRR996oR0rCUp6Pky9x7oc7S6JkZfplifNdNbxdEz6zMt+D?=
 =?us-ascii?Q?/7gJg2cNkFXmGsHsp4NYq4Ji3Oa37H5Bb7Y3dfBh/dWjPt2Yl393SUZSoIyW?=
 =?us-ascii?Q?4MHU3Wz3lgvseYlLVizKeNWGdM2nUTgsBcxrGVlEuiywpIXShYZdoG+6qZxv?=
 =?us-ascii?Q?4FJwADCHHz7ofWzVDnbxcVg7iFcoabqASPITLiWwvkIWCARk9yk3VEJVNPjY?=
 =?us-ascii?Q?6Ne3w2KWdHvXswNje9US0aKIVjGcqigM0vM+mZyydpKzKBgRyMKyvmgl+zID?=
 =?us-ascii?Q?OpuarVZ8GHxTPn1nGtZwG5qDsWjVPbRoLy6wZQkrbwq+z1zOSzDWink23W28?=
 =?us-ascii?Q?Nu2Uy3Vzgw9FCxDMDwkazl9GbGzrdD+5WP0VslJB4osAP7/n99Y5m3EzIkqY?=
 =?us-ascii?Q?DAmCADFh1Qmzus9qwR7fwU5zDpYtC3s7MsEESyArq7eRLxQ5OKd7pq4jYq0I?=
 =?us-ascii?Q?/ZLKCz/y0FQMqiLxhDEqDqWzt1YDp/v0CHQp45NTDPBHLxCATlpKeki+QaId?=
 =?us-ascii?Q?ppgMBCQjKFeD2Rgel67RJyB6XRUALiud4f9ZrBIEkA6Zb1OdeSPcyomr03X1?=
 =?us-ascii?Q?9fD+Q3PuoIfi4W3GBVVIy14CYL+F1a1CCMjXVlTLLH4O0mQ3hR2FWerjAW+c?=
 =?us-ascii?Q?UkfFGyNQ0gNwPR6H/wIU9FBuLJ8p9C0wk6n8OXiPb5HpAXBUBEAdKcD4EmM6?=
 =?us-ascii?Q?lAAEpiiUTsIApv3jwBYeqtRT+04Yxj1ahBd3LJERH7yrzNs8rRYOG4hSzSZl?=
 =?us-ascii?Q?TwousILBfu/w9gmMuKmpQTPgvB3Lj6pEJI0USgDcDNs6j2ce2oFZ9/GcYotp?=
 =?us-ascii?Q?o3HG9ZIdMkL7zBnuFj1O8YwSw3LL7ok9Baq7HfOMcKCth25XCp/AaKMStMpj?=
 =?us-ascii?Q?HWKLF66fPgmw2alA+ng3GbgHuqpfIu3w/SKoJmk6QkNPaR1FWYGxNqBJHyIZ?=
 =?us-ascii?Q?Q7yH/2KFiG9RxgzvWa0NU2gZY27kgBzjjcHxv6sj9rFcJmro2GuyZ5I4cjtL?=
 =?us-ascii?Q?vOmqcZOam3DKCPRPD6cDMy3DBHqh7BeVLu5NkbdS+xy3q0Ogc5jJqnkBdpi4?=
 =?us-ascii?Q?y3ZsqzuQBa1P1JQVxoLWdwsNBqmhk027kiIZ+Iife+WUP2fOe3jGp+/QzM00?=
 =?us-ascii?Q?zk1pr49lswhj/DBugS9kIiAglfKOthZRkcgQoLCQ9ik3NLZht1itzJ7XNvbQ?=
 =?us-ascii?Q?Delnns7ksV2btW6C7aA4UHlTjAUd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 07:40:56.4696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c5f866-43a4-4ba9-97dc-08dc7afbaeb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6059

In order to support the dynamic dtbo device assignment to a running
VM, the add/remove of the DT overlay and the attach/detach of the
device from the DT overlay should happen separately. Therefore,
repurpose the existing XEN_SYSCTL_dt_overlay to only add the DT
overlay to Xen device tree, instead of assigning the device to the
hardware domain at the same time. Add the XEN_DOMCTL_dt_overlay with
operations XEN_DOMCTL_DT_OVERLAY_ATTACH to do the device assignment
to the domain.

The hypervisor firstly checks the DT overlay passed from the toolstack
is valid. Then the device nodes are retrieved from the overlay tracker
based on the DT overlay. The attach of the device is implemented by
mapping the IRQ and IOMMU resources.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
v4:
- Split the original patch, only do the device attachment.
v3:
- Style fixes for arch-selection #ifdefs.
- Do not include public/domctl.h, only add a forward declaration of
  struct xen_domctl_dt_overlay.
- Extract the overlay track entry finding logic to a function, drop
  the unused variables.
- Use op code 1&2 for XEN_DOMCTL_DT_OVERLAY_{ATTACH,DETACH}.
v2:
- New patch.
---
 xen/arch/arm/domctl.c        |   3 +
 xen/common/dt-overlay.c      | 199 ++++++++++++++++++++++++++---------
 xen/include/public/domctl.h  |  14 +++
 xen/include/public/sysctl.h  |  11 +-
 xen/include/xen/dt-overlay.h |   7 ++
 5 files changed, 176 insertions(+), 58 deletions(-)

diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad56efb0f5..12a12ee781 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2012, Citrix Systems
  */
 
+#include <xen/dt-overlay.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
@@ -176,6 +177,8 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return rc;
     }
+    case XEN_DOMCTL_dt_overlay:
+        return dt_overlay_domctl(d, &domctl->u.dt_overlay);
     default:
         return subarch_do_domctl(domctl, d, u_domctl);
     }
diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 9cece79067..1087f9b502 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -356,6 +356,42 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
     return 0;
 }
 
+/* This function should be called with the overlay_lock taken */
+static struct overlay_track *
+find_track_entry_from_tracker(const void *overlay_fdt,
+                              uint32_t overlay_fdt_size)
+{
+    struct overlay_track *entry, *temp;
+    bool found_entry = false;
+
+    ASSERT(spin_is_locked(&overlay_lock));
+
+    /*
+     * First check if dtbo is correct i.e. it should one of the dtbo which was
+     * used when dynamically adding the node.
+     * Limitation: Cases with same node names but different property are not
+     * supported currently. We are relying on user to provide the same dtbo
+     * as it was used when adding the nodes.
+     */
+    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
+    {
+        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
+        {
+            found_entry = true;
+            break;
+        }
+    }
+
+    if ( !found_entry )
+    {
+        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
+               " Operation is supported only for prior added dtbo.\n");
+        return NULL;
+    }
+
+    return entry;
+}
+
 /* Check if node itself can be removed and remove node from IOMMU. */
 static int remove_node_resources(struct dt_device_node *device_node)
 {
@@ -485,8 +521,7 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
                                         uint32_t overlay_fdt_size)
 {
     int rc;
-    struct overlay_track *entry, *temp, *track;
-    bool found_entry = false;
+    struct overlay_track *entry;
 
     rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
     if ( rc )
@@ -494,29 +529,10 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
 
     spin_lock(&overlay_lock);
 
-    /*
-     * First check if dtbo is correct i.e. it should one of the dtbo which was
-     * used when dynamically adding the node.
-     * Limitation: Cases with same node names but different property are not
-     * supported currently. We are relying on user to provide the same dtbo
-     * as it was used when adding the nodes.
-     */
-    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
-    {
-        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
-        {
-            track = entry;
-            found_entry = true;
-            break;
-        }
-    }
-
-    if ( !found_entry )
+    entry = find_track_entry_from_tracker(overlay_fdt, overlay_fdt_size);
+    if ( entry == NULL )
     {
         rc = -EINVAL;
-
-        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
-               " Removing nodes is supported only for prior added dtbo.\n");
         goto out;
 
     }
@@ -620,15 +636,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
             return -EFAULT;
         }
 
-        rc = handle_device(hardware_domain, overlay_node, p2m_mmio_direct_c,
-                           tr->iomem_ranges,
-                           tr->irq_ranges);
         write_unlock(&dt_host_lock);
-        if ( rc )
-        {
-            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
-            return rc;
-        }
 
         /* Keep overlay_node address in tracker. */
         tr->nodes_address[j] = (unsigned long)overlay_node;
@@ -638,9 +646,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
 }
 /*
  * Adds device tree nodes under target node.
- * We use tr->dt_host_new to unflatten the updated device_tree_flattened. This
- * is done to avoid the removal of device_tree generation, iomem regions mapping
- * to hardware domain done by handle_node().
+ * We use tr->dt_host_new to unflatten the updated device_tree_flattened.
  */
 static long handle_add_overlay_nodes(void *overlay_fdt,
                                      uint32_t overlay_fdt_size)
@@ -774,20 +780,6 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
         goto err;
     }
 
-    tr->irq_ranges = rangeset_new(hardware_domain, "Overlays: Interrupts", 0);
-    if (tr->irq_ranges == NULL)
-    {
-        printk(XENLOG_ERR "Creating IRQ rangeset failed");
-        goto err;
-    }
-
-    tr->iomem_ranges = rangeset_new(hardware_domain, "Overlay: I/O Memory", 0);
-    if (tr->iomem_ranges == NULL)
-    {
-        printk(XENLOG_ERR "Creating IOMMU rangeset failed");
-        goto err;
-    }
-
     rc = add_nodes(tr, nodes_full_path);
     if ( rc )
     {
@@ -843,14 +835,83 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
     xfree(tr->nodes_address);
     xfree(tr->fdt);
 
-    rangeset_destroy(tr->irq_ranges);
-    rangeset_destroy(tr->iomem_ranges);
-
     xfree(tr);
 
     return rc;
 }
 
+static long handle_attach_overlay_nodes(struct domain *d,
+                                        const void *overlay_fdt,
+                                        uint32_t overlay_fdt_size)
+{
+    int rc;
+    unsigned int j;
+    struct overlay_track *entry;
+
+    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
+    if ( rc )
+        return rc;
+
+    spin_lock(&overlay_lock);
+
+    entry = find_track_entry_from_tracker(overlay_fdt, overlay_fdt_size);
+    if ( entry == NULL )
+    {
+        rc = -EINVAL;
+        goto out;
+    }
+
+    entry->irq_ranges = rangeset_new(d, "Overlays: Interrupts", 0);
+    if (entry->irq_ranges == NULL)
+    {
+        rc = -ENOMEM;
+        printk(XENLOG_ERR "Creating IRQ rangeset failed");
+        goto out;
+    }
+
+    entry->iomem_ranges = rangeset_new(d, "Overlay: I/O Memory", 0);
+    if (entry->iomem_ranges == NULL)
+    {
+        rc = -ENOMEM;
+        printk(XENLOG_ERR "Creating IOMMU rangeset failed");
+        goto out;
+    }
+
+    for ( j = 0; j < entry->num_nodes; j++ )
+    {
+        struct dt_device_node *overlay_node;
+
+        overlay_node = (struct dt_device_node *)entry->nodes_address[j];
+        if ( overlay_node == NULL )
+        {
+            rc = -EINVAL;
+            goto out;
+        }
+
+        write_lock(&dt_host_lock);
+        rc = handle_device(d, overlay_node, p2m_mmio_direct_c,
+                           entry->iomem_ranges, entry->irq_ranges);
+        write_unlock(&dt_host_lock);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
+            goto out;
+        }
+    }
+
+    spin_unlock(&overlay_lock);
+
+    return 0;
+
+ out:
+    spin_unlock(&overlay_lock);
+
+    rangeset_destroy(entry->irq_ranges);
+    rangeset_destroy(entry->iomem_ranges);
+
+    return rc;
+}
+
 long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     long ret;
@@ -890,6 +951,42 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
     return ret;
 }
 
+long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op)
+{
+    long ret;
+    void *overlay_fdt;
+
+    if ( op->overlay_op != XEN_DOMCTL_DT_OVERLAY_ATTACH )
+        return -EOPNOTSUPP;
+
+    if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )
+        return -EINVAL;
+
+    if ( op->pad[0] || op->pad[1] || op->pad[2] )
+        return -EINVAL;
+
+    overlay_fdt = xmalloc_bytes(op->overlay_fdt_size);
+
+    if ( overlay_fdt == NULL )
+        return -ENOMEM;
+
+    ret = copy_from_guest(overlay_fdt, op->overlay_fdt, op->overlay_fdt_size);
+    if ( ret )
+    {
+        gprintk(XENLOG_ERR, "copy from guest failed\n");
+        xfree(overlay_fdt);
+
+        return -EFAULT;
+    }
+
+    if ( op->overlay_op == XEN_DOMCTL_DT_OVERLAY_ATTACH )
+        ret = handle_attach_overlay_nodes(d, overlay_fdt, op->overlay_fdt_size);
+
+    xfree(overlay_fdt);
+
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..ac3c2a7c4c 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1190,6 +1190,16 @@ struct xen_domctl_vmtrace_op {
 typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
 
+#if defined(__arm__) || defined(__aarch64__)
+struct xen_domctl_dt_overlay {
+    XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
+    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
+#define XEN_DOMCTL_DT_OVERLAY_ATTACH                1
+    uint8_t overlay_op;                     /* IN: Attach. */
+    uint8_t pad[3];                         /* IN: Must be zero. */
+};
+#endif
+
 struct xen_domctl {
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
@@ -1277,6 +1287,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
+#define XEN_DOMCTL_dt_overlay                    87
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1339,6 +1350,9 @@ struct xen_domctl {
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
         struct xen_domctl_paging_mempool    paging_mempool;
+#if defined(__arm__) || defined(__aarch64__)
+        struct xen_domctl_dt_overlay        dt_overlay;
+#endif
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index febaa4b16a..3a6e7d48f0 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1184,14 +1184,11 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
 DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
 #endif
 
-#if defined(__arm__) || defined (__aarch64__)
+#if defined(__arm__) || defined(__aarch64__)
 /*
  * XEN_SYSCTL_dt_overlay
- * Performs addition/removal of device tree nodes under parent node using dtbo.
- * This does in three steps:
- *  - Adds/Removes the nodes from dt_host.
- *  - Adds/Removes IRQ permission for the nodes.
- *  - Adds/Removes MMIO accesses.
+ * Performs addition/removal of device tree nodes under parent node using dtbo
+ * from dt_host.
  */
 struct xen_sysctl_dt_overlay {
     XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
@@ -1265,7 +1262,7 @@ struct xen_sysctl {
         struct xen_sysctl_cpu_policy        cpu_policy;
 #endif
 
-#if defined(__arm__) || defined (__aarch64__)
+#if defined(__arm__) || defined(__aarch64__)
         struct xen_sysctl_dt_overlay        dt_overlay;
 #endif
         uint8_t                             pad[128];
diff --git a/xen/include/xen/dt-overlay.h b/xen/include/xen/dt-overlay.h
index c0567741ee..7f0f3741b5 100644
--- a/xen/include/xen/dt-overlay.h
+++ b/xen/include/xen/dt-overlay.h
@@ -39,15 +39,22 @@ struct overlay_track {
 };
 
 struct xen_sysctl_dt_overlay;
+struct xen_domctl_dt_overlay;
 
 #ifdef CONFIG_OVERLAY_DTB
 long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op);
+long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op);
 #else
 #include <xen/errno.h>
 static inline long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     return -EOPNOTSUPP;
 }
+static inline long dt_overlay_domctl(struct domain *d,
+                                     struct xen_domctl_dt_overlay *op)
+{
+    return -EOPNOTSUPP;
+}
 #endif
 
 #endif /* __XEN_DT_OVERLAY_H__ */
-- 
2.34.1


