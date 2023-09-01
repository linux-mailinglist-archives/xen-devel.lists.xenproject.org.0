Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645B578F7DB
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594272.927605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwRM-00039q-Ir; Fri, 01 Sep 2023 05:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594272.927605; Fri, 01 Sep 2023 05:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwRM-00032s-B1; Fri, 01 Sep 2023 05:11:28 +0000
Received: by outflank-mailman (input) for mailman id 594272;
 Fri, 01 Sep 2023 05:11:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGn-0001Hn-Ds
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79449440-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:31 +0200 (CEST)
Received: from CY5PR19CA0085.namprd19.prod.outlook.com (2603:10b6:930:83::9)
 by IA0PR12MB9010.namprd12.prod.outlook.com (2603:10b6:208:48e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Fri, 1 Sep
 2023 05:00:28 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:83:cafe::d5) by CY5PR19CA0085.outlook.office365.com
 (2603:10b6:930:83::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Fri, 1 Sep 2023 05:00:27 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 22:00:14 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:14 -0500
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
X-Inumbo-ID: 79449440-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfZo7KZhLvVDthkBZjr4z6Is4q0UFGKOKCsNb7xrK4Fwae0YZVdxoxMLJfLpo8ZJGLS1mh5Li4Pg9uScT1XDX6lncr8SKwR4W97xjcDX8h9C4Ye4iZVv+IBmyGFk1fiCnYXbBDIIhGrKaSZOxzJy3BQB6dlwDX7GuYVSYBgSSF+WdYoZFLyvPURP1DS2zHUHK0uGOeDQ+WTf+Dg7sxxsPZAYPy0WMccra136hmHqTTRmnRYY7CTjidR0Kxgyhvw2a6Xj1mgfzaFal+bsf8z5SEihMhps2x7HoWP70dD0Fx3/TJSLovsHbMuethM4SnFQErbB+nO0fSxwOIVnOZYsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHjqTJ1UaUiiJx0UNTFIv0uoiG+uui8ndyNCkHPJ/Yg=;
 b=hllnZopp2EQJWo2615T2uaFsDmL5eLMT7FrWXxWQBt6ZoTrTtsGT5LVIqhF2BqBfKHrY449+NnU6mvt9fdKIcsvhHLRo5hInDiHyHpZJJ9tY7wJxxwaijyj3DOHe025XUcJSrs1rNKyCCWJXYsatK+n4hwGh4B7kDXVti+1XXoMZOCOLmXLG5H9hX40VkAFWXszhElZ723hNwRFbf3hxyScVI/lUrXREaN2zo0BRJGd8M8v7k7C3LXqAH/RW23JwXVc+4k/ZVpauemyVyf5vkw9pd1KgLodOPKW0TQPpNIseslpMtovYFfsjwZDDBp35KtZBZ1ld7SkXSuo4QxPt/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHjqTJ1UaUiiJx0UNTFIv0uoiG+uui8ndyNCkHPJ/Yg=;
 b=lIhXTlYpnCmkiAq4Ev2XrDZ4zRP/KDrT9XzxToTYNam+PHW44FerL77yKXwpqEvf4udMSj8jGO8wwNpZR05TNcsYf7NCITR6ZDG2w2yD4K/jBrSa7oWE8+gulHRuRsMHrQtjevnEyEVP6WKR3NRfCL6PsrkSQQl2TLbRMlIlhsQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v11 14/20] common/device_tree: Add rwlock for dt_host
Date: Thu, 31 Aug 2023 21:59:41 -0700
Message-ID: <20230901045947.32351-15-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|IA0PR12MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 27587e69-0acf-4bcb-d40b-08dbaaa85be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q7xsWm37SwrKiJXG/zuGJxpK9OucMlZD9lbw8WhXjfBSQlOXraC6Kw4ZSRnhb1HEZZTvWzRmNYnmc8yj0mwEMWqFzoq1h7PKpuq9EXaNt3WhJPzLH2T5Tyt6NoJ2QkE+SXgylBCEArLWBO+K7IfwwZLQe74j6L90CfjGWseXaR9dSEvVTIqgIH8Qz+EiXekFdT+RgczF34dnWpLlCilQLxmZy4MfwR4Q186iV09W2kVivILohrLDTzRo0orZky8SZnBouyYAAwCvMDnHhWSKvljO4358RR3+ywLFdi84RaWLNiQ7apYaUlm/7oYRcw8TGlULciZiurqXlaQKwydgsnFZTVad5LJr/cquATsNhpsYXSwrteWaaeeGTnNbhlqILiEGyjmE2/5AqEB3mmH66oKsCb6MV9CuX4CTIBxvdGnux8CvmuTc2CS6a4ci/ToCJH6QfMzVzlH1FMy8lk00iKHpBbzs+9EWhBFZqYQhQAgqgZSqyeiEKysQ+VRd/vVv3OuvoyOa2z4X0Ta2AFWNCoVrxN/vbRVXOdNh3U5Dx7lyYyw9QN+PM7xsg9JstxzYH88nbFg7fODZjmvduUhmbo9Tsv0Ay+EHRnptM3bWBkIHcz3BS5F7xvPymB7wxzQPoFFUN9x+4g3beqRi+WTzilnGcrrZDiiA3UZdRFWRPEN+fOaN5WTQWTAf/BtbYxzNYsrLSgGPnVkUP6J45zRQVwxeo2reoRcZFhjc6QJa6I+nieMz+2PZzx3GZoDritwhWt1u4F67M7sNhOn4x8n4vQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199024)(1800799009)(186009)(82310400011)(40470700004)(46966006)(36840700001)(70206006)(2906002)(36756003)(5660300002)(86362001)(44832011)(40460700003)(82740400003)(356005)(81166007)(40480700001)(36860700001)(47076005)(4326008)(8676002)(336012)(41300700001)(8936002)(83380400001)(426003)(1076003)(2616005)(26005)(316002)(54906003)(6666004)(478600001)(70586007)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:27.5267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27587e69-0acf-4bcb-d40b-08dbaaa85be7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9010

Dynamic programming ops will modify the dt_host and there might be other
functions which are browsing the dt_host at the same time. To avoid the race
conditions, adding rwlock for browsing the dt_host during runtime. dt_host
writer will be added in the follow-up patch for device tree overlay
functionalities.

Reason behind adding rwlock instead of spinlock:
    For now, dynamic programming is the sole modifier of dt_host in Xen during
    run time. All other access functions like iommu_release_dt_device() are
    just reading the dt_host during run-time. So, there is a need to protect
    others from browsing the dt_host while dynamic programming is modifying
    it. rwlock is better suitable for this task as spinlock won't be able to
    differentiate between read and write access.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from v10:
    Add ASSERT for iommu_assign_dt_device() and iommu_add_dt_device().
Changes from v9:
    Update commit message and fix indentation.
    Add ASSERT() for iommu_deassign_dt_device() and iommu_remove_dt_device().
    Fix code styles.
    Remove rwlock_init in unflatten_device_tree() and do DEFINE_RWLOCK in
        device-tree.c
Changes from v7:
    Keep one lock for dt_host instead of lock for each node under dt_host.
---
---
 xen/common/device_tree.c              |  1 +
 xen/drivers/passthrough/device_tree.c | 28 +++++++++++++++++++++++++--
 xen/include/xen/device_tree.h         |  7 +++++++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index f38f51ec0b..b1c2952951 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -31,6 +31,7 @@ dt_irq_xlate_func dt_irq_xlate;
 struct dt_device_node *dt_host;
 /* Interrupt controller node*/
 const struct dt_device_node *dt_interrupt_controller;
+DEFINE_RWLOCK(dt_host_lock);
 
 /**
  * struct dt_alias_prop - Alias property in 'aliases' node
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 80f6efc606..1f9cfccf95 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -31,6 +31,8 @@ int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev)
     int rc = -EBUSY;
     struct domain_iommu *hd = dom_iommu(d);
 
+    ASSERT(system_state <= SYS_STATE_active || rw_is_locked(&dt_host_lock));
+
     if ( !is_iommu_enabled(d) )
         return -EINVAL;
 
@@ -62,6 +64,8 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
     const struct domain_iommu *hd = dom_iommu(d);
     int rc;
 
+    ASSERT(rw_is_locked(&dt_host_lock));
+
     if ( !is_iommu_enabled(d) )
         return -EINVAL;
 
@@ -113,6 +117,8 @@ int iommu_release_dt_devices(struct domain *d)
     if ( !is_iommu_enabled(d) )
         return 0;
 
+    read_lock(&dt_host_lock);
+
     list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
     {
         rc = iommu_deassign_dt_device(d, dev);
@@ -120,10 +126,14 @@ int iommu_release_dt_devices(struct domain *d)
         {
             dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
                     dt_node_full_name(dev), d->domain_id);
+            read_unlock(&dt_host_lock);
+
             return rc;
         }
     }
 
+    read_unlock(&dt_host_lock);
+
     return 0;
 }
 
@@ -133,6 +143,8 @@ int iommu_remove_dt_device(struct dt_device_node *np)
     struct device *dev = dt_to_dev(np);
     int rc;
 
+    ASSERT(rw_is_locked(&dt_host_lock));
+
     if ( !iommu_enabled )
         return 1;
 
@@ -177,6 +189,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     struct device *dev = dt_to_dev(np);
     int rc = 1, index = 0;
 
+    ASSERT(system_state <= SYS_STATE_active || rw_is_locked(&dt_host_lock));
+
     if ( !iommu_enabled )
         return 1;
 
@@ -249,6 +263,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
     int ret;
     struct dt_device_node *dev;
 
+    read_lock(&dt_host_lock);
+
     switch ( domctl->cmd )
     {
     case XEN_DOMCTL_assign_device:
@@ -289,7 +305,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         }
 
         if ( d == dom_io )
-            return -EINVAL;
+        {
+            ret = -EINVAL;
+            break;
+        }
 
         ret = iommu_add_dt_device(dev);
         if ( ret < 0 )
@@ -327,7 +346,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
             break;
 
         if ( d == dom_io )
-            return -EINVAL;
+        {
+            ret = -EINVAL;
+            break;
+        }
 
         ret = iommu_deassign_dt_device(d, dev);
 
@@ -342,5 +364,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         break;
     }
 
+    read_unlock(&dt_host_lock);
+
     return ret;
 }
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 44d315c8ba..a262bba2ed 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -18,6 +18,7 @@
 #include <xen/string.h>
 #include <xen/types.h>
 #include <xen/list.h>
+#include <xen/rwlock.h>
 
 #define DEVICE_TREE_MAX_DEPTH 16
 
@@ -218,6 +219,12 @@ extern struct dt_device_node *dt_host;
  */
 extern const struct dt_device_node *dt_interrupt_controller;
 
+/*
+ * Lock that protects r/w updates to unflattened device tree i.e. dt_host during
+ * runtime. Lock may not be taken for boot only code.
+ */
+extern rwlock_t dt_host_lock;
+
 /**
  * Find the interrupt controller
  * For the moment we handle only one interrupt controller: the first
-- 
2.17.1


