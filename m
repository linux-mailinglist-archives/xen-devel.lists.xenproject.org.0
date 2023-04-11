Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDE86DE4AB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519849.806973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJX1-0000av-Qt; Tue, 11 Apr 2023 19:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519849.806973; Tue, 11 Apr 2023 19:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJX1-0000Yx-JW; Tue, 11 Apr 2023 19:19:55 +0000
Received: by outflank-mailman (input) for mailman id 519849;
 Tue, 11 Apr 2023 19:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUf-0004Ta-7y
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:29 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f308f27-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:28 +0200 (CEST)
Received: from MW4PR03CA0028.namprd03.prod.outlook.com (2603:10b6:303:8f::33)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:24 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::e) by MW4PR03CA0028.outlook.office365.com
 (2603:10b6:303:8f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:20 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:19 -0500
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
X-Inumbo-ID: 7f308f27-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THcWC/giHtyMgrprcuU0OA3pwHxXNMdUgtgLjl6l1LPlqw6WBVt+khXjjWFhmDAgzqUF7UiMdv4dI7KWtb5aoVLa/2a1Y+jNT54qVZqUfaryLTfy3bcXNi4WS7eBXNJQuMazFGshN/GyCG3iZjEDyRotCMcyl8OIon1WyMhHg3d3vSGUw7gPuRUi6ZhWQ8rrE8c/S0AnJjHAENIq/CR2R77j2thE+wXaZMe3J2JXbPoL7aTEG1RQInihHjKdcDSKDJ37nDlLMAnlAfv6ruLrQhgvrW/w4t+/8YX2QUEsp20mea+4gQ/4C9/BJmUWKVscO92M0C/s1VhjpNku0TiJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOQW4Omju1dTUno8ADGoDg+I28lOLIV01naa3ZWrW1o=;
 b=Imta5BSur4SKHpXK1OWAg6ScqRx0I/4QXi5mKvt+7uUc4PMTlrEaF+jP8s2QdCGY3pC2xjOm9jxiv/buyrsEa6FtMTjHl5AAEsMQhlXhltPJXnRQgqUMILcl8g0Q+GKiRz0imGZl257O4n9t9aPcExhjDLkTorHq7p5aL1iMQdjfAnb5iXP8Eyoo4Tr9D7V1xSoxINEhabj8mGrEd2xiU+HEL+/AiZADEq7U5y63LFYzH1pA3M5wx5WcX+fGNnJFMng58wqLLP2z0AQ16WAaoUsa1xOveF6d9rojy4kmPJV9c5NwSpaPoiV4h391VR63Gwy/Mhd9G3UsDszCym8MjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOQW4Omju1dTUno8ADGoDg+I28lOLIV01naa3ZWrW1o=;
 b=bVqMaj/2byuHZk9KB58ch3tZUaCTDN6A8dmi21o0MZKHRB5YR1KnXT41/CI674SqlxxK0rfv06M811p4s2tWNoY1hIV3e0C1gugQoMlb6HPEbuMlMZlO0SSLbZL2uzlxhMaMLJrfz0I6wimh4GqV1YGKtSiADK/XtU1PLmOxWl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>
Subject: [XEN][PATCH v5 12/17] common/device_tree: Add rwlock for dt_host
Date: Tue, 11 Apr 2023 12:16:31 -0700
Message-ID: <20230411191636.26926-31-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|CH3PR12MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: a4eb61d8-5ff6-40fc-bc5e-08db3ac16151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HiPueW2wg3jaIMtd+UEEbXnwFPVrbmrZrGMl75Sfc/2DQnY7SCJkWLuxxLohuemFBARCMfBdCO3U3IKWJOCpKJWbUHFo+lZKF72rRQ7WmHKrCm1nrPV6jU+39VpsKIH783g/qXfZ+K3ys6k/BoC6AbXcd+5EAO5kuDLUKnEbxa5F1k9w4aYebEYTImOag5DUi50X8oVWYwtC0a9bzzVs3n+dhyRWokbof6EQ2XFh+BewN+4alARJcaE8xKzioSXJ9N9UZPKmA3E0SwyqRaZwKi+nl+aFHCaRQoHKW8VmEPfa4lTKVyjhWBQqHjOYmJ5QlKWqPwZQ0ISt1xX6o/1rkW14LZoZPq0kuLNJQ1T9yV4ORenDnYbpjb4/RjLm4gYCHYrdVBObuS/Wo1iGmXMnSQvDA8/Ou9BOAiNvanNo/YWa810hFcOc1vXjS8Zk0YcZFCWQvUHgKn0/NY2JU84vZa+7+HrnLw18HEXqYn3olKpfUyR7OBPzirk2NkSOj3DQLJEjaU8xPB8wyK99m+x2zdYg4rCEj04nDf8IR1hTzrrLXNJIaG4vRYDxhYiBWJWnTavnTYirvpBL0pXGIvTBjuRyGwOe+aezVRNvoS7B3azuwZUVecMvdphTkQbLzOHcF27V5DSQ3qsWVZW7pVi+ePwvhN/npoFLtFZs4P3gtG4TRrxykQl4smaZOcPB/KmFBWmxubxnDS6D2+hoJRabj0hE7dyjPEeZ73+6TLpsBp8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(40460700003)(44832011)(8936002)(26005)(1076003)(40480700001)(6666004)(83380400001)(2906002)(47076005)(36756003)(186003)(426003)(2616005)(336012)(356005)(81166007)(82740400003)(86362001)(82310400005)(36860700001)(478600001)(41300700001)(6916009)(4326008)(70206006)(8676002)(70586007)(316002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:23.7496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4eb61d8-5ff6-40fc-bc5e-08db3ac16151
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996

 Dynamic programming ops will modify the dt_host and there might be other
 function which are browsing the dt_host at the same time. To avoid the race
 conditions, adding rwlock for browsing the dt_host during runtime.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/device_tree.c              |  3 +++
 xen/drivers/passthrough/device_tree.c | 39 +++++++++++++++++++++++++++
 xen/include/xen/device_tree.h         |  6 +++++
 3 files changed, 48 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 507b4ac5b6..b330e6a013 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2098,6 +2098,9 @@ void unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
+
+    /* Init r/w lock for host device tree. */
+    rwlock_init(&dt_host->lock);
 }
 
 static void dt_alias_add(struct dt_alias_prop *ap,
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index a77a217f3d..74f994b9da 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -112,6 +112,8 @@ int iommu_release_dt_devices(struct domain *d)
     if ( !is_iommu_enabled(d) )
         return 0;
 
+    read_lock(&dt_host->lock);
+
     list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
     {
         rc = iommu_deassign_dt_device(d, dev);
@@ -119,10 +121,14 @@ int iommu_release_dt_devices(struct domain *d)
         {
             dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
                     dt_node_full_name(dev), d->domain_id);
+
+            read_unlock(&dt_host->lock);
             return rc;
         }
     }
 
+    read_unlock(&dt_host->lock);
+
     return 0;
 }
 
@@ -259,11 +265,15 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
 
         spin_lock(&dtdevs_lock);
 
+        read_lock(&dt_host->lock);
+
         ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
                                     domctl->u.assign_device.u.dt.size,
                                     &dev);
         if ( ret )
         {
+            read_unlock(&dt_host->lock);
+
             spin_unlock(&dtdevs_lock);
 
             break;
@@ -272,6 +282,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
         if ( ret )
         {
+            read_unlock(&dt_host->lock);
+
             spin_unlock(&dtdevs_lock);
 
             break;
@@ -287,6 +299,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                 ret = -EINVAL;
             }
 
+            read_unlock(&dt_host->lock);
+
             spin_unlock(&dtdevs_lock);
 
             break;
@@ -295,22 +309,31 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         spin_unlock(&dtdevs_lock);
 
         if ( d == dom_io )
+        {
+            read_unlock(&dt_host->lock);
             return -EINVAL;
+        }
 
         ret = iommu_add_dt_device(dev);
         if ( ret < 0 )
         {
             printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
                    dt_node_full_name(dev));
+
+            read_unlock(&dt_host->lock);
             break;
         }
 
         ret = iommu_assign_dt_device(d, dev);
 
         if ( ret )
+        {
             printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign \"%s\""
                    " to dom%u failed (%d)\n",
                    dt_node_full_name(dev), d->domain_id, ret);
+        }
+
+        read_unlock(&dt_host->lock);
         break;
 
     case XEN_DOMCTL_deassign_device:
@@ -322,25 +345,41 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( domctl->u.assign_device.flags )
             break;
 
+        read_lock(&dt_host->lock);
+
         ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
                                     domctl->u.assign_device.u.dt.size,
                                     &dev);
         if ( ret )
+        {
+            read_unlock(&dt_host->lock);
             break;
+        }
 
         ret = xsm_deassign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
+
         if ( ret )
+        {
+            read_unlock(&dt_host->lock);
             break;
+        }
 
         if ( d == dom_io )
+        {
+            read_unlock(&dt_host->lock);
             return -EINVAL;
+        }
 
         ret = iommu_deassign_dt_device(d, dev);
 
         if ( ret )
+        {
             printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign \"%s\""
                    " to dom%u failed (%d)\n",
                    dt_node_full_name(dev), d->domain_id, ret);
+        }
+
+        read_unlock(&dt_host->lock);
         break;
 
     default:
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 998f972ebc..b7272bbccc 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -18,6 +18,7 @@
 #include <xen/string.h>
 #include <xen/types.h>
 #include <xen/list.h>
+#include <xen/rwlock.h>
 
 #define DEVICE_TREE_MAX_DEPTH 16
 
@@ -106,6 +107,11 @@ struct dt_device_node {
     struct list_head domain_list;
 
     struct device dev;
+
+    /*
+     * Lock that protects r/w updates to unflattened device tree i.e. dt_host.
+     */
+    rwlock_t lock;
 };
 
 #define dt_to_dev(dt_node)  (&(dt_node)->dev)
-- 
2.17.1


