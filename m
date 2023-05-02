Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC4B6F4DA7
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528870.822632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ6-0000VK-Tk; Tue, 02 May 2023 23:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528870.822632; Tue, 02 May 2023 23:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ6-0000Kd-E9; Tue, 02 May 2023 23:37:48 +0000
Received: by outflank-mailman (input) for mailman id 528870;
 Tue, 02 May 2023 23:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzZ3-0005Si-IN
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:45 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20624.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55505898-e942-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 01:37:42 +0200 (CEST)
Received: from BN9PR03CA0343.namprd03.prod.outlook.com (2603:10b6:408:f6::18)
 by CH0PR12MB5267.namprd12.prod.outlook.com (2603:10b6:610:d2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 23:37:39 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::43) by BN9PR03CA0343.outlook.office365.com
 (2603:10b6:408:f6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.32 via Frontend
 Transport; Tue, 2 May 2023 23:37:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:38 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:38 -0500
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
X-Inumbo-ID: 55505898-e942-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJGXP6I5DbTWCJd4UPQsUa0et2w6HnKRklEs3Tq0HDyaZjomDSMmOx394jyxoEYWtAH6vCir7FylPFU47fc5cNMSPqak6eMuO60yyiS1EqWOULnwGw6+asuLYM933ih96Mlz4rdVOpmwLYAyPBEP9t8vE5yFsf7bHbV4I/Dchquluyt4YAkiDVcSaV8BpTMtQTWOD10Gins5RVJpjeduZkDKnL3jubsobkU9OAVDcU58UFWtQO8oMrkNifcG8+gQmEa0XZxKFfY3bw7JHWvad/J1pZN6gywslRw3mFs+sy8g5c7DzMxMnnZh4ZUkhYrqSY0rHmnzyMydW8mBwsGjbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIBy8QBowBYZ6c4wTJeiTkeZZ3rBM64WqnXkHigySw8=;
 b=NR+ALs6okeXu7dtkr7pF8B7BIDy9LXA4clEVyPo7OHLKid4HxwQCPa6HuTiDDxEHk6LT1A9FfYuaNZDF//KamLzgVZnaUUBnezUlWuAH6zBLqG7DQy1KYcNd62eZkEb0CtH7SKWfVJLs1jTqL+vA3jr3TWWrHHeM6SbHyN1lqL+sVexlS2Spqx5JVYVgGFaf6aVbTt6irajHTJpcgjl5DCyoyXCQawyLUGXKgVeuBkdh7QYfOAU8kjH32Z2MPE6ORFCDwVcond62doT2494uDpknItOSiuq3S/LnYgdhmKt7LehAavC9htErHbgv7D1l0XH3IiGVzCBhjc9daIx9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIBy8QBowBYZ6c4wTJeiTkeZZ3rBM64WqnXkHigySw8=;
 b=FxrmF8KpbY8OMt9twCQcmBtIxQj5cssKdQJWsbfwwjf9LZ6+wqZgxnrMzBXMKkjrx/97XNSxcVTeU9iV1fn8YxDLaXlDFB+NgnzDSeKR8p1cOZ/EAxELUFAnFuguxJt4eaX1z3OTPb9ONhgsB6iCik+9jIrYsV0EUMufMGS4rZE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v6 14/19] common/device_tree: Add rwlock for dt_host
Date: Tue, 2 May 2023 16:36:45 -0700
Message-ID: <20230502233650.20121-15-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT047:EE_|CH0PR12MB5267:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a7aefba-4bc9-41ea-9579-08db4b663768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bY3CIOnIcI4X9pEmoRAiF0hbj8IBsn/tdl4KhSa8MyxKKPCRWysPgd+5Su4M60i8YtOI3p0Ob5N0HQGmeayfBYiS1j+xRM1O5UHiP3eVLwM3SB4Xert+T/Ta3TJvAWgRQMAju3f/bxjG975cMuNiwfCsys72Qfquwuc2QTVKY8iH9vAozLUVnqobOJiHJi2yGLIk5Uc73GNtigC7fOSTVU/dDDZn715IDTPsLtwj0f9YWiCBfZShzDp4cfOWCttgnVX7YmXIAIw35g8prowY3mh5dX7a/F6gAtEw+w5Zlg9N7nUY5KGlBINMtKrHyug7jsHHAceFgSKSfPKqhrLf4PsfetJAUldfao/+rkU4USgq+59DcH+RK5FR32N5VV3qNza4glve1w2pUBY4q0dwFuYCX9mb7RQ6FC212GdKc5CWVwGWnXtEvcK93whOoJcwYzlbnjyc1TGvF1DQIVDutwjYLMQgjyExTKPz+YpuxPWbd6+dWxzAmr6e/9gbYBRVEL+avVZOYBcFpS7SG8bE7kG+4h0SrM3RbvEpfrZXsLCNzadFqjC18NLaBVYyFbUh+DDMJRaoBnvU70sxgoqXCcbaM55SVGF1qXxgWB+eSaT7PMuJTw+FS0kTxfaJnkEP2Hr4WPdZP4lENxwUyzA5B+qZoRC2I374aMQUTVrLvVueswPoDjcuhl+HCx7F/QWwFH7COFZnePKschJzE3miL3N+gGL7wabVZMpH+GqMs70=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(81166007)(26005)(356005)(82740400003)(1076003)(186003)(83380400001)(2616005)(336012)(36860700001)(426003)(47076005)(36756003)(44832011)(40460700003)(2906002)(40480700001)(41300700001)(54906003)(5660300002)(82310400005)(478600001)(6666004)(70586007)(6916009)(70206006)(4326008)(8936002)(86362001)(316002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:39.1092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7aefba-4bc9-41ea-9579-08db4b663768
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5267

 Dynamic programming ops will modify the dt_host and there might be other
 function which are browsing the dt_host at the same time. To avoid the race
 conditions, adding rwlock for browsing the dt_host during runtime.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/device_tree.c              |  4 ++++
 xen/drivers/passthrough/device_tree.c | 18 ++++++++++++++++++
 xen/include/xen/device_tree.h         |  6 ++++++
 3 files changed, 28 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 426a809f42..48cb68bcd9 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2109,7 +2109,11 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
 
     dt_dprintk(" <- unflatten_device_tree()\n");
 
+    /* Init r/w lock for host device tree. */
+    rwlock_init(&dt_host->lock);
+
     return 0;
+
 }
 
 static void dt_alias_add(struct dt_alias_prop *ap,
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 46f9080c8f..e3be8e3f91 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -111,6 +111,8 @@ int iommu_release_dt_devices(struct domain *d)
     if ( !is_iommu_enabled(d) )
         return 0;
 
+    read_lock(&dt_host->lock);
+
     list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
     {
         rc = iommu_deassign_dt_device(d, dev);
@@ -118,10 +120,14 @@ int iommu_release_dt_devices(struct domain *d)
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
 
@@ -245,6 +251,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
     int ret;
     struct dt_device_node *dev;
 
+    read_lock(&dt_host->lock);
+
     switch ( domctl->cmd )
     {
     case XEN_DOMCTL_assign_device:
@@ -294,7 +302,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         spin_unlock(&dtdevs_lock);
 
         if ( d == dom_io )
+        {
+            read_unlock(&dt_host->lock);
             return -EINVAL;
+        }
 
         ret = iommu_add_dt_device(dev);
         if ( ret < 0 )
@@ -310,6 +321,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
             printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign \"%s\""
                    " to dom%u failed (%d)\n",
                    dt_node_full_name(dev), d->domain_id, ret);
+
+        read_unlock(&dt_host->lock);
         break;
 
     case XEN_DOMCTL_deassign_device:
@@ -328,11 +341,15 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
             break;
 
         ret = xsm_deassign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
+
         if ( ret )
             break;
 
         if ( d == dom_io )
+        {
+            read_unlock(&dt_host->lock);
             return -EINVAL;
+        }
 
         ret = iommu_deassign_dt_device(d, dev);
 
@@ -347,5 +364,6 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         break;
     }
 
+    read_unlock(&dt_host->lock);
     return ret;
 }
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index d6366d3dac..e616dd7e9c 100644
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


