Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B0277EE6F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:41:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585007.916008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR4H-00067c-HN; Thu, 17 Aug 2023 00:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585007.916008; Thu, 17 Aug 2023 00:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR4H-00063S-B9; Thu, 17 Aug 2023 00:40:53 +0000
Received: by outflank-mailman (input) for mailman id 585007;
 Thu, 17 Aug 2023 00:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4F-0002YP-Et
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eab::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5e3c048-3c96-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 02:40:50 +0200 (CEST)
Received: from SN4PR0501CA0042.namprd05.prod.outlook.com
 (2603:10b6:803:41::19) by BL1PR12MB5048.namprd12.prod.outlook.com
 (2603:10b6:208:30a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 00:40:46 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:803:41:cafe::13) by SN4PR0501CA0042.outlook.office365.com
 (2603:10b6:803:41::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:43 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:43 -0500
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
X-Inumbo-ID: b5e3c048-3c96-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DF9z7OL7L1u6+rdVuEJscwipiXCcUltnvETwhAYU0AcP/CdsL4+j8W0FlRQtFvkLWlB7nJH5Q7eYmEnVVCAiijkO3I5rBe+lUByFRcsCuqJ8M662FRy+3xHGjw++MEe/f129bDC6El74oAG0vVfqXDFjHM9/LVM1u7eglI2kbuZdJIYGXIgf6e0Q3ppk6eIAgX0ltAeHtvHs7fuSLgqwcig3VXJNpFPGlH0/1eLbdiovtl4qBc5t4xrAoLs2lkyULkWYIMqxMC7zN19e4Yd4omohs8gh+WGxoUjQfuwwuxOKHiw2QyQMEad7FHQ1fxMfseOpuza47pcG9QydapPKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCyL0+8MSIKb4AwqqY4xSHJp57PvTVSjc1PRQ5LvHww=;
 b=JzsWHgrC5bH+bojZpjhTxGnY4suYZxCp2dCU64CiUX8rMRl4wAqPXLiT9yjeGnEO15uWSaN8wIeE0Y5Vj4oWYyrVBV9CIK2VunEXtUBWwvBxkwu4/JQeKUzC1bfFAUKRFRy+sq0mRBOhLumms08aueRtKA3pdmvqdQb75xkRhp39CAzfhaHD+2ldxuhgAeZL0tHq+cVRHYoMmAj7mbgyTvKT2hDfqo4BketH8R0kTwoZdgO96DO8P6w8KHOCNWfhYHrv13iVQ/3PZA07APuSrRzQaEP5IDZGp/wRI6fckkgwbGFVsu/erFA8oAsNIyQ0GkG7KdSKr/abUiySH4a4FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCyL0+8MSIKb4AwqqY4xSHJp57PvTVSjc1PRQ5LvHww=;
 b=iHmFigOKOR9df1lNP7F/SInjWf7HTgV8g7uFAVzTGHvdkFttxE5nGbbg/kYKgsX0y9ltgfkwDiQ43LCC3mm2XixItoYYrSGsZA8dv479Fjb/3bswT+MhieiDhwxM31c2r2HaKWoiKCELNr16ySGa4Ub/rL8UVcfDPWGO/WMofBU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v8 14/19] common/device_tree: Add rwlock for dt_host
Date: Wed, 16 Aug 2023 17:39:42 -0700
Message-ID: <20230817003947.3849-15-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|BL1PR12MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 18031cb1-2604-4d4b-c763-08db9eba9871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fjPNH5ONl/f6GPp6tFsxWpVEoL/a7ajQOnYN3o/k3ZoqOSAiHrVRFwRjT3bJ9O8/9DmFN9wAr4Z6StCbmiuIvW2OvU8axqKZDchwzzbM3NZr8qJtxqPcvvO99UlTUPovK5DMrqU+K1OPT/9zRbiXNGki2/9yR838K57yPgfThVHueMwlouTKDgIzTNvU0lugn3Tt20XkgFZgzB6tX76AvULgjYa07C6qAQXHieivN2G20IrwHB04NMMY6qwi3DkgmKZgsjbLOnI8EvgbggGxe989K+hGaj+2TcLjQmgwoEaqvZwi5atEEFoB5Yc/dGQG2vN2P/lzP8SD4Ab3vK7PO7t5pYB/uEQI3jGmYnoYeiU20D7F0wbtRGDqNK2z55LryGghwditQuToj1n7YKoKrwMaXLKY0PAN/+oOylFWNtNv99DXbSWFb8juXL8Nu0fsFFq3IWHpmzXoXrgj/bnPVxkCrcKFZIM3s50Vo1EmyaXtIKp8nGW5Uejjjor503U36THp28dNs3MjymcF+MB8UR/TKRIpIps/AQ3ETth5nkS7bdYqJTtsjo43gf6yD87YJYMTkYa2BpTwFMzH6fCvqm5oPHthzX9/y1WMTQPQL3nG504Rv8V5MzR06cMFg0xG6YHUvDbMZdHNqfiVGydJXl0ErJ8fHvGabBHtKw12eKWnzCQI8tmznk8DDP+hxEIe75XJizRABbq1M9ifKUP7JDEthUPuwDlFqnsSkxe7m8Wo24yhGNAF5x9dPkUMBc85RSiAxVxeAm6f9L+bBOcppQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(83380400001)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:46.1131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18031cb1-2604-4d4b-c763-08db9eba9871
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5048

 Dynamic programming ops will modify the dt_host and there might be other
 function which are browsing the dt_host at the same time. To avoid the race
 conditions, adding rwlock for browsing the dt_host during runtime. dt_host
 writer will be added in the follow-up patch titled "xen/arm: Implement device
 tree node addition functionalities."

 Reason behind adding rwlock instead of spinlock:
    For now, dynamic programming is the sole modifier of dt_host in Xen during
        run time. All other access functions like iommu_release_dt_device() are
        just reading the dt_host during run-time. So, there is a need to protect
        others from browsing the dt_host while dynamic programming is modifying
        it. rwlock is better suitable for this task as spinlock won't be able to
        differentiate between read and write access.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v7:
    Keep one lock for dt_host instead of lock for each node under dt_host.
---
---
 xen/common/device_tree.c              |  5 +++++
 xen/drivers/passthrough/device_tree.c | 15 +++++++++++++++
 xen/include/xen/device_tree.h         |  6 ++++++
 3 files changed, 26 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 0f10037745..6b934fe036 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -31,6 +31,7 @@ dt_irq_xlate_func dt_irq_xlate;
 struct dt_device_node *dt_host;
 /* Interrupt controller node*/
 const struct dt_device_node *dt_interrupt_controller;
+rwlock_t dt_host_lock;
 
 /**
  * struct dt_alias_prop - Alias property in 'aliases' node
@@ -2137,7 +2138,11 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
 
     dt_dprintk(" <- unflatten_device_tree()\n");
 
+    /* Init r/w lock for host device tree. */
+    rwlock_init(&dt_host_lock);
+
     return 0;
+
 }
 
 static void dt_alias_add(struct dt_alias_prop *ap,
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 4cb32dc0b3..31815d2b60 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -114,6 +114,8 @@ int iommu_release_dt_devices(struct domain *d)
     if ( !is_iommu_enabled(d) )
         return 0;
 
+    read_lock(&dt_host_lock);
+
     list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
     {
         rc = iommu_deassign_dt_device(d, dev);
@@ -121,10 +123,14 @@ int iommu_release_dt_devices(struct domain *d)
         {
             dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
                     dt_node_full_name(dev), d->domain_id);
+
+            read_unlock(&dt_host_lock);
             return rc;
         }
     }
 
+    read_unlock(&dt_host_lock);
+
     return 0;
 }
 
@@ -251,6 +257,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
     int ret;
     struct dt_device_node *dev;
 
+    read_lock(&dt_host_lock);
+
     switch ( domctl->cmd )
     {
     case XEN_DOMCTL_assign_device:
@@ -304,7 +312,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         spin_unlock(&dtdevs_lock);
 
         if ( d == dom_io )
+        {
+            read_unlock(&dt_host_lock);
             return -EINVAL;
+        }
 
         ret = iommu_add_dt_device(dev);
         if ( ret < 0 )
@@ -342,7 +353,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
             break;
 
         if ( d == dom_io )
+        {
+            read_unlock(&dt_host_lock);
             return -EINVAL;
+        }
 
         ret = iommu_deassign_dt_device(d, dev);
 
@@ -357,5 +371,6 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         break;
     }
 
+    read_unlock(&dt_host_lock);
     return ret;
 }
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index e507658b23..8191f30197 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -18,6 +18,7 @@
 #include <xen/string.h>
 #include <xen/types.h>
 #include <xen/list.h>
+#include <xen/rwlock.h>
 
 #define DEVICE_TREE_MAX_DEPTH 16
 
@@ -216,6 +217,11 @@ extern struct dt_device_node *dt_host;
  */
 extern const struct dt_device_node *dt_interrupt_controller;
 
+/*
+ * Lock that protects r/w updates to unflattened device tree i.e. dt_host.
+ */
+extern rwlock_t dt_host_lock;
+
 /**
  * Find the interrupt controller
  * For the moment we handle only one interrupt controller: the first
-- 
2.17.1


