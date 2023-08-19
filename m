Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C9D781610
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586703.918047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qI-0004ks-Px; Sat, 19 Aug 2023 00:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586703.918047; Sat, 19 Aug 2023 00:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qI-0004cm-2s; Sat, 19 Aug 2023 00:29:26 +0000
Received: by outflank-mailman (input) for mailman id 586703;
 Sat, 19 Aug 2023 00:29:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9qF-0001hl-7X
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:23 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7052373e-3e27-11ee-9b0c-b553b5be7939;
 Sat, 19 Aug 2023 02:29:21 +0200 (CEST)
Received: from MW4PR04CA0102.namprd04.prod.outlook.com (2603:10b6:303:83::17)
 by CH3PR12MB8902.namprd12.prod.outlook.com (2603:10b6:610:17d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sat, 19 Aug
 2023 00:29:17 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::d3) by MW4PR04CA0102.outlook.office365.com
 (2603:10b6:303:83::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:15 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:14 -0500
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
X-Inumbo-ID: 7052373e-3e27-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyZ4biw1G0MOgvnNAfIyj8DmRsIwfjxiPLn3X7j841whfl4UQ1SCzm5RjLHR8csmrVpVEEA2S65a60906I6A3a/gJQ7qRbuD0zwsCN2fhiv4e/NEM2FOaIOsBkMLGPokPupwMOkkVtwGLh50VKzYJWksjKqEuuPiMzYolAfIew/yGPygccT6qKWLf4LHWxK1HVQiZoyIjNA4HV0MIf0+HPQhm5+aYih9ZXqAu6+JL0BQ/JosHT2/uqpIIm5u4wA0dPsFeEU5Q9WClsHaD6ACgPD8N/DhtwJS8t59WFJKO6OQHEPXM0VKp0M3JXq1IxEfOZJuOgP0J9bqM8hOeX6LBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCyL0+8MSIKb4AwqqY4xSHJp57PvTVSjc1PRQ5LvHww=;
 b=hinGBmyAgoDYCdu8ukI9HDmyRJsffRX0y2QYXKr20607ZSI+E1EDU1+Xo+nH4kOaqRnNTLtF93rPFr0KQH855Uc305bFv9N1YKv++b0G5yCp0nT1tzXWPWBsnWAPSIKJnJKdtjR/e7Z3EZkMnou4Kh6kEEr/JpowUIAdTBAZvILiU7kZUPY0yXitxs9grUGL1hGmQ6/mnvhepEjimLSZMkF3z+We2X0I8I39lAzD6FvCtK15oFH0wy68UEBtGJFVXbIV8uXPJgn3PJal8lqKbC5QhVJ6uKi8kJpwILOnoAXkKelO4+SPeJ8vO25FBPhAhbAHeBpcaOUJs0m0SBa3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCyL0+8MSIKb4AwqqY4xSHJp57PvTVSjc1PRQ5LvHww=;
 b=AZEMiPB2TqwPQQX73BwA2drPi852+pREuYl/90JA9FbxDAMMh21NwNkhzpJDZ1Jqneb9YT3jwV74hbOzWkcm/O3nGaPTaoWPS4vgbi0YHVfLL4hfCBkvHL6Qmg7Mn0L/dfKnfyomqc9fr1x3hO6loRUnGDU5WENC9bgTa191ilk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v9 14/19] common/device_tree: Add rwlock for dt_host
Date: Fri, 18 Aug 2023 17:28:45 -0700
Message-ID: <20230819002850.32349-15-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|CH3PR12MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: a56f4a4c-349d-4678-bb16-08dba04b5282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H/lccUykTBvxLfFhv9nu5rHPkujA6TFkYzxxi4pDwtbX2hh+ucubwIdYZOnM+42A0bktC09c3FvpRkHPR97kUad77Gs1LDME/G1Fm55J3Bf01Omuki29qfgwZMum/D8pOLNXbzX1d31CNV3NQoKcj4BbPXfUOShyfibDe2F1V71fcZ88H6LjVjWOSwQ0Pnel2pmDPNhk+GDzvzALKUK1s2Y7d+O/nmxtXWRsjRElIKgU4AKTrIxInMxlaP4R1+Z0AVXwYUFGoQn9+kxoYmU39frgtqCxwA5+WXh+h7n78zju8s6xTTNf7A8wIQdQ6j7xmSVhix8Hzhs7VuR33nStCr/ClAR+4kCSJG0CePANoFuBkqqY1lh9dw9l3o6J3THruez+7Ig8EGXTNzOaUQ78Y8HEv0EVyUPg9wE7lELpfoNkSs5hEOGG+0nJIxEsgJyURsivQ0nCtCcojqIAeB0Q54sHm8V4TRDglO6c6mAzFM0Q5ATpjpu8u8z1AuNLDgqNohWCjNv8eD2OvAb5QTouAIDL7cFZz3JAStWKquRwxiY+8Zgq/D3I+hhQr06kQ/D67qFbkOlYMjfpPg0HdLkP/tXOXEkMXX50mwcAUHk61WHKWBDhdwAFP4dzy64dYonQv+xOe65nuhc7yvEtCNGr9Lx/wtQccJ2u9Cz+6yXMWyhu326Aas93RgAQ8rlbrResmjfhnCjTCcW6nnXxrBlzFaG2PiYEvsVoCRYnoTbYHiAjTnBF+/q6NP3toWXeMucCUhGhA87l9T7fIwDXfwZiTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199024)(82310400011)(186009)(1800799009)(40470700004)(36840700001)(46966006)(2906002)(6916009)(54906003)(70206006)(4326008)(5660300002)(44832011)(8676002)(8936002)(316002)(41300700001)(70586007)(478600001)(6666004)(2616005)(1076003)(26005)(336012)(426003)(40460700003)(83380400001)(47076005)(36860700001)(82740400003)(86362001)(81166007)(356005)(40480700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:16.8941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a56f4a4c-349d-4678-bb16-08dba04b5282
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8902

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


