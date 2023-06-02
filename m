Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5C071F750
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542800.847178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syb-0003wa-KQ; Fri, 02 Jun 2023 00:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542800.847178; Fri, 02 Jun 2023 00:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4sya-0003it-JL; Fri, 02 Jun 2023 00:49:08 +0000
Received: by outflank-mailman (input) for mailman id 542800;
 Fri, 02 Jun 2023 00:49:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syV-00018B-AF
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:03 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 441e66ef-00df-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 02:49:01 +0200 (CEST)
Received: from BYAPR21CA0022.namprd21.prod.outlook.com (2603:10b6:a03:114::32)
 by IA1PR12MB8237.namprd12.prod.outlook.com (2603:10b6:208:3f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 00:48:58 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:114:cafe::82) by BYAPR21CA0022.outlook.office365.com
 (2603:10b6:a03:114::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.9 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:57 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:57 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:56 -0500
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
X-Inumbo-ID: 441e66ef-00df-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PT6FhhSe+0SPWpD+oZ4JGLeC5eTPAnQNRAJ+QKCbTp/C8LHo6MmOOPyJP+cSkSDvk4IkFfVU750ONdrkyMMpR3pJMQGx5pP05M3ZdAN6HXomdSqGHJaGuTdvK32IpqVy/0DUVsjQO8Mx/HBd1ZOjgRTwJkMkxv7HIfnPH+4Jct6Jr+yVLGgkVN8hY88WhbV1IQ8aDgOE9LAJoGGHsW8AkCFpmOHNTlzPTvTZ0q+P4pjVqAnjKfu1AqoGfCyG4j8koSRVGJKR5tRTZQrQJIrXSTiEpAJiFmkwMv0Y+6BfG3SyYyHu9aORlnRmUMN+a/k4wOOJWUMaon0F13SIiIqMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZPtY0Lq1veAssh7dnLe/7/35DwjQ+2mSJmqdDyTing=;
 b=IZc/P8PKYmkZBYBtCot8IEE0Yy02aUVyg4ly4RhaIgLe3qI9s2vXx8S7AkB+5/btbmu6hhXSzLyiad16ocn9iYprRisMVbkYqUlQaAH9xYx/H8Bv1LnduoRG4FCgpxi6KB5MQS+Y5B30EBCCQP4PsTsFxtBRBNITpmmBEd4IJQz9J4DgHO8hK/9hqUBfZw8Z2pmt/rEH6Gu9WsEbkHbaVPHXeCfXCX8A8kGK2/Vc58Y6+Z/GP9NfeYMsU4/hSBNHYSG3F8l+V/cr18kofwpln5Hkip2aagHFfxGQXbzzWQbsV6fH8qI40lJ+ZCAEW7X7NkePAmymNUb/VVwIzTx+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZPtY0Lq1veAssh7dnLe/7/35DwjQ+2mSJmqdDyTing=;
 b=egWQzMpwD0j5E+Z7jzXk2aaI9yhVGYNL9D/lFqFyhiGJo3zrjLn2clUKFQiw3/bVSAsnpy7YY7d9eU2cHA2Z5XFy3ajpDFyOmhM0f5cEUTXSdvHLvwyxczdWW6PzYj6Za/tg5vPcc0P9ycxfYzYxJSNpRJ1VTlFfyq1Z/AtIhJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v7 14/19] common/device_tree: Add rwlock for dt_host
Date: Thu, 1 Jun 2023 17:48:19 -0700
Message-ID: <20230602004824.20731-15-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT027:EE_|IA1PR12MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: bc50556f-839f-4c2f-19bb-08db6303262f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	06MA3nPPPXxc9L1rv4PGzDhESbrLTwpWtC3d3855GTpgJI5pDuwskJJerPp1zjcg7z6/xQW1wVHqXxzWJEnDtgHmWCMu2uf+EWIgzOYYZUSJ35Dq1E8sRVaLWFGIqt4JikmuvL/M5up6zZeia2AAMvyByUj9VrHvWHsPa+CMucuLOmHbBv31voHu9Hligd3oUK5rMZoAoduLPecHSYlzDDPXLY7zPTJT2ZNbYCShdUUYBfPse0rFOATpOsCgkOsN1McLjFPqwkzZht7CeUaT6qhpY0NpIUFYOktaskB6LDLM17/cXbmG+9M9cxV2hXA3JjP/iN5ktJzeENFwTGrIar2kRBsAupVFKlshD9YHLBxXT82i0DFFgaml4g377oP/4JhZBkhHMXq6wsrx3r2ot2EAf7WO/qchIcypxgAQwBj3f8psOGv7dyHK11bOQZMLKFy30UVnQP2J8s23bcCHN5TqHWurrse1EBStB4bfx6EXX/BesFBtWEFSvq58cEKB41L3EhnXG5JejXTZ3+vuk9YgRVv5gLXFPGs+1CiiMsVPY9e4YQzFd8jwK0Q7dJu4fV+H1jirR8IVPzuJ+MMRtSls3JY0d4G9Y0WK97K0EsMp4tCyzXfLoW7sbl1NmWK++l44PMVDKuDcn6hi/q8f6V9W/TdyGTyZ4ia+Yn4N4qdmVTUUX/Jem8oljdDKdKvdk3dXzYwehdM/c3Zz22xAqtsf3TFVAnOBlE6JOOmyOnGqbP47m+e/iVQ1uolbs5l+Ef7otiRI95v7O9OHKHF0HA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(44832011)(4326008)(6916009)(70586007)(70206006)(8676002)(41300700001)(316002)(54906003)(8936002)(2906002)(5660300002)(36860700001)(40460700003)(82310400005)(6666004)(478600001)(40480700001)(1076003)(356005)(26005)(36756003)(83380400001)(186003)(426003)(47076005)(336012)(81166007)(82740400003)(2616005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:57.8792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc50556f-839f-4c2f-19bb-08db6303262f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8237

 Dynamic programming ops will modify the dt_host and there might be other
 function which are browsing the dt_host at the same time. To avoid the race
 conditions, adding rwlock for browsing the dt_host during runtime.

 Reason behind adding rwlock instead of spinlock:
    For now, dynamic programming is the sole modifier of dt_host in Xen during
        run time. All other access functions like iommu_release_dt_device() are
        just reading the dt_host during run-time. So, there is a need to protect
        others from browsing the dt_host while dynamic programming is modifying
        it. rwlock is better suitable for this task as spinlock won't be able to
        differentiate between read and write access.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v6:
    Remove redundant "read_unlock(&dt_host->lock);" in the following case:
         XEN_DOMCTL_deassign_device
---
 xen/common/device_tree.c              |  4 ++++
 xen/drivers/passthrough/device_tree.c | 15 +++++++++++++++
 xen/include/xen/device_tree.h         |  6 ++++++
 3 files changed, 25 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index c5250a1644..c8fcdf8fa1 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2146,7 +2146,11 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
 
     dt_dprintk(" <- unflatten_device_tree()\n");
 
+    /* Init r/w lock for host device tree. */
+    rwlock_init(&dt_host->lock);
+
     return 0;
+
 }
 
 static void dt_alias_add(struct dt_alias_prop *ap,
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 301a5bcd97..f4d9deb624 100644
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
 
@@ -246,6 +252,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
     int ret;
     struct dt_device_node *dev;
 
+    read_lock(&dt_host->lock);
+
     switch ( domctl->cmd )
     {
     case XEN_DOMCTL_assign_device:
@@ -295,7 +303,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         spin_unlock(&dtdevs_lock);
 
         if ( d == dom_io )
+        {
+            read_unlock(&dt_host->lock);
             return -EINVAL;
+        }
 
         ret = iommu_add_dt_device(dev);
         if ( ret < 0 )
@@ -333,7 +344,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
             break;
 
         if ( d == dom_io )
+        {
+            read_unlock(&dt_host->lock);
             return -EINVAL;
+        }
 
         ret = iommu_deassign_dt_device(d, dev);
 
@@ -348,5 +362,6 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         break;
     }
 
+    read_unlock(&dt_host->lock);
     return ret;
 }
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index e239f7de26..dee40d2ea3 100644
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


