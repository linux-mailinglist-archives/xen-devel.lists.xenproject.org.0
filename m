Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C13781607
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586697.918003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qD-0003b1-Ly; Sat, 19 Aug 2023 00:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586697.918003; Sat, 19 Aug 2023 00:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qD-0003RH-9a; Sat, 19 Aug 2023 00:29:21 +0000
Received: by outflank-mailman (input) for mailman id 586697;
 Sat, 19 Aug 2023 00:29:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9q9-0001hl-Ek
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:17 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cbf578d-3e27-11ee-9b0c-b553b5be7939;
 Sat, 19 Aug 2023 02:29:15 +0200 (CEST)
Received: from MW4PR02CA0027.namprd02.prod.outlook.com (2603:10b6:303:16d::32)
 by SN7PR12MB7812.namprd12.prod.outlook.com (2603:10b6:806:329::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Sat, 19 Aug
 2023 00:29:12 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::d3) by MW4PR02CA0027.outlook.office365.com
 (2603:10b6:303:16d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.17 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:11 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 17:29:10 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:10 -0500
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
X-Inumbo-ID: 6cbf578d-3e27-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msnI/WxbJYEDx9AqeN4VmrLyc227ujFBMd61mPLQESQIFZ4YBiF9uGaF6G3BgQNJniCeGelEojIiHqPTWPUKOIYqLggVozcOvdGxuYLaUIo1yWuwzetudKXelMuuuwVga4Iv/iq7GmcFaQvQzFSPHNMtTX/0n/xeltiGIsPr2GjVz9TPaAJFfA1JyYSb4T6Jsyrz9Cu6tGv+aYv3MR+8ft68BSYlhYHCPOssjywkNxR9QAFptBhwIk8Zne136ZEDkvYN7+ENphkWSpAf3v6tjSMuKERWAOUcLJEHXjD2u4ZBzawXGqPk91+WoZ1a+QAO2QtDVgNiMcTfj8VY4fsmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIyUzT1AUXykQrgYpXKigDmIsrdrXXxfGP25yLD3dds=;
 b=FeSA+zTAokyOPZGrBE/6q5e1Y3Dp3WR6zc7Idg4iqzl3SHIZ79SMbIUzmgiV6rWMv992k21RgxzhPdkE+bAqi5hOgMUGa0+/02jIlJuJZxiGCj0Gk1o1JmG0KqtdczNeEV0Z+fcjYQqKDRHAA4mW3liz6mb3m6AFRooA6TugPb/eKpA7QNAEozCXLQpdkq1gPo8NxGSTEhK+oif9ma6lCa0IQ+tlY6PlEIU1fYGQcVJl1cYK8s7jTi0oHQHDM8ZpCiNSKbPQ9TuNmirdV6f2uN9tZT5MtGMmmJsXMd8Yt2puLH63ehSePbuymUGepZ4xB0E3YSq194Er3rZNaMqjrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIyUzT1AUXykQrgYpXKigDmIsrdrXXxfGP25yLD3dds=;
 b=hHQ8CZpyvbysa2+DHY+Kcfvs/GU0A+LIwZ9IOPK/ilbUGQHIelPjr2YtqGhhb/L4GS1RKBrmuQhI0Pi291jeqfaMt+f3rHYoCaUO7KsFRbE7X2YN4uBfLNErgI4dY53FpbyW0e+khAB4VqVKbI3NfhilS5F0xiS7l8FMLoupftg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN][PATCH v9 09/19] xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
Date: Fri, 18 Aug 2023 17:28:40 -0700
Message-ID: <20230819002850.32349-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|SN7PR12MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: d26b1754-4dfe-4e63-265b-08dba04b4f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b92X0J4++Nw9Vfwqjt1DWcnqTCYyviSLePgyMFozcQvwP3jGfSCBf/mZDrw6brXLsi7alcVqLKvLBy5LOJTPR6ZYhY22xTIOrjCX67dParWLBildk71r3qXqXZey/P4SE/LL4aq0UW2T1VsEepP/XTaHGvPh6OD36DC98U/lEbGy9bo2k3IX9QvxUzW6NDtFrwHt4SBcelh26e1ge0sLxibZK5fYwWGt+9URsocNKh5JQ9uxwS1Y3xBxVwqiVoqKTecymVUzKTrtwi1y5suf3wwctzhR/BaJ/ek7UUcEhT/YS/PuYV6QjoBWQI4jdb11dLl3FLM7ENllu3JUFAXFf+z2dEbCRpUkkZNL6gM0RYnHW/GmefX3XPyc4fRMfmzMK3t2BiNRWSWUOrSJIctbVzh23NHz6LJH8BrEhgkj67HzHxSp5szcYlNz0RyzG5GHQ1fD2X5+NOIZCu+ZkcW91jRoSUePd+0uz1zXga1eVTvwF8W9RZkjQSVgj96ar6MzYct++jQ08ZeKDvVl9et5T1gG19Ojn0Ko2IE0c56qTtHFrVdQNQ8sOzXjSb3ZgBOj/8XsV0TbXrPC2chjwXgL9kClZa6IvCQzkwJ5sI6lR+6LYjzdiM2v6bnnBbho5jxTtvstPI5ly9jdMyoWMNTFn9Wb9sDZESSjZdfIymeRZqDRry9Fo/H5ZrV/vx8PP03CJOcRP4jvp3peVDCRswmu3qAE8fBhQ3tU1gTk68HGih4xuN6cQWICyeqVA9OPwXddt2hQrkdY5TJR9aOIy29O/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199024)(82310400011)(1800799009)(186009)(46966006)(40470700004)(36840700001)(86362001)(36756003)(82740400003)(356005)(81166007)(40480700001)(44832011)(2616005)(5660300002)(70586007)(478600001)(316002)(70206006)(6666004)(6916009)(26005)(1076003)(41300700001)(8936002)(8676002)(4326008)(54906003)(47076005)(40460700003)(83380400001)(336012)(36860700001)(426003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:11.5884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d26b1754-4dfe-4e63-265b-08dba04b4f59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7812

Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
Remove static type so this can also be used by SMMU drivers to check if the
device is being used before removing.

Moving spin_lock to caller was done to prevent the concurrent access to
iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
patches in this series introduces node add/remove feature.

Also, caller is required hold the correct lock so moved the function prototype
to a private header.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v7:
    Update commit message.
    Add ASSERT().
---
---
 xen/drivers/passthrough/device_tree.c | 26 +++++++++++++++++++++----
 xen/include/xen/iommu-private.h       | 28 +++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100644 xen/include/xen/iommu-private.h

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1c32d7b50c..5796ee1f93 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -18,6 +18,7 @@
 #include <xen/device_tree.h>
 #include <xen/guest_access.h>
 #include <xen/iommu.h>
+#include <xen/iommu-private.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xsm/xsm.h>
@@ -83,16 +84,16 @@ fail:
     return rc;
 }
 
-static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
+bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
 {
     bool_t assigned = 0;
 
+    ASSERT(spin_is_locked(&dtdevs_lock));
+
     if ( !dt_device_is_protected(dev) )
         return 0;
 
-    spin_lock(&dtdevs_lock);
     assigned = !list_empty(&dev->domain_list);
-    spin_unlock(&dtdevs_lock);
 
     return assigned;
 }
@@ -213,27 +214,44 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( (d && d->is_dying) || domctl->u.assign_device.flags )
             break;
 
+        /*
+         * To ensure that the dev doesn't disappear between the time we look it
+         * up with dt_find_node_by_gpath() and we check the assignment later.
+         */
+        spin_lock(&dtdevs_lock);
+
         ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
                                     domctl->u.assign_device.u.dt.size,
                                     &dev);
         if ( ret )
+        {
+            spin_unlock(&dtdevs_lock);
             break;
+        }
 
         ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
         if ( ret )
+        {
+            spin_unlock(&dtdevs_lock);
             break;
+        }
 
         if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
         {
-            if ( iommu_dt_device_is_assigned(dev) )
+
+            if ( iommu_dt_device_is_assigned_locked(dev) )
             {
                 printk(XENLOG_G_ERR "%s already assigned.\n",
                        dt_node_full_name(dev));
                 ret = -EINVAL;
             }
+
+            spin_unlock(&dtdevs_lock);
             break;
         }
 
+        spin_unlock(&dtdevs_lock);
+
         if ( d == dom_io )
             return -EINVAL;
 
diff --git a/xen/include/xen/iommu-private.h b/xen/include/xen/iommu-private.h
new file mode 100644
index 0000000000..bb5c94e7a6
--- /dev/null
+++ b/xen/include/xen/iommu-private.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/iommu-private.h
+ */
+#ifndef __XEN_IOMMU_PRIVATE_H__
+#define __XEN_IOMMU_PRIVATE_H__
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+#include <xen/device_tree.h>
+
+/*
+ * Checks if dt_device_node is assigned to a domain or not. This function
+ * expects to be called with dtdevs_lock acquired by caller.
+ */
+bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
+#endif
+
+#endif /* __XEN_IOMMU_PRIVATE_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.17.1


