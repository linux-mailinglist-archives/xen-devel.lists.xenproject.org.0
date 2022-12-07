Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A836453E3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455848.713473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlF-0001hd-Pr; Wed, 07 Dec 2022 06:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455848.713473; Wed, 07 Dec 2022 06:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlF-0001eC-Lf; Wed, 07 Dec 2022 06:18:29 +0000
Received: by outflank-mailman (input) for mailman id 455848;
 Wed, 07 Dec 2022 06:18:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nlE-0001e0-44
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:18:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe59::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f527b47a-75f6-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 07:18:27 +0100 (CET)
Received: from DM6PR07CA0065.namprd07.prod.outlook.com (2603:10b6:5:74::42) by
 CY5PR12MB6430.namprd12.prod.outlook.com (2603:10b6:930:3a::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Wed, 7 Dec 2022 06:18:23 +0000
Received: from DS1PEPF0000E651.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::6a) by DM6PR07CA0065.outlook.office365.com
 (2603:10b6:5:74::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:18:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E651.mail.protection.outlook.com (10.167.18.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Wed, 7 Dec 2022 06:18:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:21 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:18:20 -0600
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
X-Inumbo-ID: f527b47a-75f6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXpJu77SjgdaGmTxdjRm4pHr2gCN/9RKNqXc4rMU8T4zMjO4fttqrlMZj183kyphRxkX2Q2/RSd3MjvJqNy1oJFmYkT9xVyErQwfsQBtr+dU4BfNOPT7Wj4jNaLeiIxjhDlszkr7Ip3tFHRtZdYVCkiFSJWyyBgDw5l9IwsKGkbKHUdtlQ5LBLZzpFV3/0/VJZgAHcxqjc4VVu8Elswf45wVpLBUtdE33NdkaeUZk22v68KZ7Ku9hC7j8l/YFtOUnM8O64S4rK7MQiqs2FuAAV1tA65G9bVR2HP5dIa0muhoTZkhDkhftPnm9TgkzG4TYZFSsFY1uWSdVjj4qRh+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbn+9h9tF7QZlww7kr6YoDzwWCRUPyZKofdb3QDs5Ls=;
 b=PQ+OzqXXeimtDKzjKu6YYvcKwF5RB8639RurEeEMf3Cas3X5BXtylALYlOcvgofWJMAOwCowLAA0E2/aektL2cgHprSsrDVtxq98CGLB3NLD1K1cUD7ZjH5XvOTFue/n/bO2PCOXeq3k7LnB3oB3lYmSIgTaLJrpBbP0Jot0OMQrjxoxY3UGQkm9QtNinaZKwqUoLzMPXZGvrwDTzGwmCZUeSsaHkvQdNip7RYuGsJ5R0nY5+Da9SuIIC7tJ2GZNPp5Wl2Ldi75SNKxv2wRNHWYDty7zE8JqdFkDeb47XIPkjZMkBbB5ZOk+CFODLywIt1Z1egsDgPE6pHT93xc2jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbn+9h9tF7QZlww7kr6YoDzwWCRUPyZKofdb3QDs5Ls=;
 b=dJDKp1Xg2ds0MDYyyUYiLAXURH3O+vH/q+qkI8HUiyoHVFo8RrRE78lOB+ysJQvp79xY85cBPQXh+xKzSOQ6foK7c8QdWzWUWWMrMiJbqFn91sBuf8NlnNs0n70xzUiW1jU6zCrlWxlr46DOxlocjwUdtgOQuwSAlUNOYGqodQI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	<Luca.Fancellu@arm.com>
Subject: [XEN][RFC PATCH v4 07/16] xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
Date: Tue, 6 Dec 2022 22:18:06 -0800
Message-ID: <20221207061815.7404-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E651:EE_|CY5PR12MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b05a9c-5245-40b5-122c-08dad81ad804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DvYPUn6sy3wVFri0HvA7SwtWb4o2YBcFtWhH0sEg4tOStYH9k7BUUbOhMve0ddh2ObvkNnBZkwkLerpDi0+A7iu/IAvCMoD8sbOwmWTtyCL3beasb+p2a6wgaRQ3lYAFZ8IzxIvZanFLpZ8CHJgLUysUpR2eMWxIIIY6wgpaRrWL4JWufgz0AlMQqSjIsjiBLQ8Plc50Ww64p4Glh897LSm/ce81l+fm152alsL3yvEc9226qPB/gqkDE06COYIPV5URLl2vEOZnGGIvbxnGK+tsfE8BpquNrGsx4qUVCjc4Y3E5UaWuc0w5MudGpuE/vqPblhDlBaQsfsYQeUs0mQbNQnAATUqMgUQecHOtsZyQTaN0biDVEu0WduHq0AFJL8jPMVYKj+3Mig39cCbf9x6H3ANKLUzi7HNsuuZtFxHBIODVF1lllfSVuJQuzLCSP0XztXx2MW1TL+ZzdoDHpWsaoAx6t4p/N7jIzMzagyXcSduVmEik1jXbazb9/f79mL16xtGUnaO/Yj9zIAplr/Uf9f0gud6WILtApEoKuRtI37ZkV5z8pb4H3fx5uPmL8octoN/3o3Rw17tr4kty7nBWwwC/o/J+WNfCrw8cSNYXQ7FJkoOXUTzgh0kyaXba7bjXMoR4AYcvhI86cG78jlbqRa2h+A4s7W8sc3ucLgiZglcxUUeoywM2YymwpME/y05XwMzqQSEk2yc1VVPnmihUglTdmw8tFGdBOYSTsNM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(70586007)(70206006)(186003)(4326008)(8676002)(41300700001)(1076003)(6666004)(2906002)(82740400003)(478600001)(40460700003)(40480700001)(36756003)(2616005)(81166007)(36860700001)(356005)(47076005)(8936002)(336012)(44832011)(82310400005)(426003)(5660300002)(6916009)(54906003)(316002)(26005)(86362001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:18:23.0459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b05a9c-5245-40b5-122c-08dad81ad804
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E651.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6430

Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_lock().

Moving spin_lock to caller was done to prevent the concurrent access to
iommu_dt_device_is_assigned while doing add/remove/assign/deassign.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/drivers/passthrough/device_tree.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1c32d7b50c..bb4cf7784d 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -83,16 +83,15 @@ fail:
     return rc;
 }
 
-static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
+static bool_t
+    iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
 {
     bool_t assigned = 0;
 
     if ( !dt_device_is_protected(dev) )
         return 0;
 
-    spin_lock(&dtdevs_lock);
     assigned = !list_empty(&dev->domain_list);
-    spin_unlock(&dtdevs_lock);
 
     return assigned;
 }
@@ -213,27 +212,43 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( (d && d->is_dying) || domctl->u.assign_device.flags )
             break;
 
+        spin_lock(&dtdevs_lock);
+
         ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
                                     domctl->u.assign_device.u.dt.size,
                                     &dev);
         if ( ret )
+        {
+            spin_unlock(&dtdevs_lock);
+
             break;
+        }
 
         ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
         if ( ret )
+        {
+            spin_unlock(&dtdevs_lock);
+
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
+
             break;
         }
 
+        spin_unlock(&dtdevs_lock);
+
         if ( d == dom_io )
             return -EINVAL;
 
-- 
2.17.1


