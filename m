Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A96DE4AD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519853.806980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJX2-0000kA-JR; Tue, 11 Apr 2023 19:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519853.806980; Tue, 11 Apr 2023 19:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJX2-0000da-8b; Tue, 11 Apr 2023 19:19:56 +0000
Received: by outflank-mailman (input) for mailman id 519853;
 Tue, 11 Apr 2023 19:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUa-0004Ta-1x
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:24 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b2923f8-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:21 +0200 (CEST)
Received: from BN8PR04CA0036.namprd04.prod.outlook.com (2603:10b6:408:70::49)
 by BY5PR12MB4259.namprd12.prod.outlook.com (2603:10b6:a03:202::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 19:17:17 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::e1) by BN8PR04CA0036.outlook.office365.com
 (2603:10b6:408:70::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:17 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:16 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:16 -0500
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
X-Inumbo-ID: 7b2923f8-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NrtgAUF9Ql0p+k/3sbtJEEchhDJAFMiITvM5wvWAKrtZSJIjO/6bQ2SPX+rz/sappAVESgdPQ90GX61i3lkvKAUVAagdoKWZ+qGhdSqDj+1W3M78hBsQRPDvQEuP0zOaiwjBa1WdLKRdDgiPhCNC7bL+7NzgG+8yC5lDDbPWYrska49kaV8IRd4vCiddB8YjwsNqIijO3tP21NPdOOWtFamZ7xcHO7lRokyVp79nclMttnFjF63ePo6t8QqOSnwmt1qqCp32NS001hcwr0hcwauDEZiLw26N0xIwN4FZd5VzUnZmjO5JK/NdRSiQBB0c0PYZbIfpLKjaVzyjr7nXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbn+9h9tF7QZlww7kr6YoDzwWCRUPyZKofdb3QDs5Ls=;
 b=Y7u0NYxfZCHpmoCI6mcjMl+Z5AL5PPIYLf23plUFQFvxZIu8fvLzCeXV5nbGm35DbTKpGszQ380njpPIqH+SPu84vjpMPGsP7LCTf7YNv0nTs24ijswVw0zcB7DChv87DDhAVxByw1yAvt3xPi4/5bDP73uupyKAAj6V64XzqgDyJcnz+ZgJ2beVWBHqqHR69h6DqGA1+qRJZFk1u+AgQcy5s+Pa8KYdNOo3YrjOwskLAWPNMijG7j7YiIyj5wYE0BnbwynIwd0cBCzdLKd1Y+05b3Sxw1yj4tjsaztqB8JjZSBgYRDBej2dcQO+XyLqqC3pEHhQM7oQAXYWVeFebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbn+9h9tF7QZlww7kr6YoDzwWCRUPyZKofdb3QDs5Ls=;
 b=aXEeV2TDU5sVp4LNobPoDDRxdR0iWKUUyeDVrTIdLuz4fjJq/9AdC2FfmUKyk39Fvlf/pAaRkKeyUMtPzf90H3Z5+XN2xLCDyPoyuDGBQu8nyn3di2VJMCtHSSj6p5D+5sUEqjovHkYzqqu9cnKeNlQCvHRDKnORE8FF8B25tD4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>
Subject: [XEN][PATCH v5 08/17] xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
Date: Tue, 11 Apr 2023 12:16:27 -0700
Message-ID: <20230411191636.26926-27-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|BY5PR12MB4259:EE_
X-MS-Office365-Filtering-Correlation-Id: 637928ec-8ec6-4807-adc7-08db3ac15d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CajsAvd3Asi4MY6PTH9AjYDhGuRLyIwHjUjHGwBlOXg/mHrNQQ8RiN84aM42F9kCb8Cj4tDnawyfBdVqDnZ8RqIzMiOzOKHgvctzORSeTk02QwNr0WWCWp7/nipg+IxDjTM1PVxZgOek64p3GZ0ECZa8pxSl9dSzVyRsSenGOdKrYT4DC6h1nn4k6w6rrCZTkIaSdCbsnsa0asPmvRthqP53z3EhoNruocdb7RmDD0YKlDsCRs5PVM4wPG5M5Nut1WPFnjRKr6fhVbgKYMf0toL+bjgEG7nwQm24XGmapqg+w5fIaxNCNMj+kLSfSdtG+q/oV/FHmgD9h+v7orTiVklY6RNqzL7fBSMLZtdDStxtCgky06t2z3eGSkpWLSOyUMUryUkp4c1FyvhioYctp/DV9JSIAz/DhyHtQG933bmMtu9ltETVRF1TLmEzgawRqhVELxPcHcPwxGrHYQaRrEBynCvQk2Bx/Ak8dNiZEtMD71+2iudOjcviAcCCHLOqJu9sq1wvjj4JiYka0yl/3mS/39QJvuXBIJ0ivA6qLCGID6FXgVHONDH3fATNdTiUJ7ToRHGvX6qoWnp88Gxk7fREU2zwfTgn6vxhBnCkLjc6rIPWTGoiS4OEL0gKlqfZ5pO5PcqNV6ghDbqgdt9EnYT6lh4WDOlhMIL7GcOeCSM+p21BYtPi9saJs4TL50putv3/Xj+ZBrT6cvhG2ZejYl4ByzFU7356fVcMZZO6Fg4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(478600001)(83380400001)(86362001)(40460700003)(40480700001)(36756003)(82740400003)(81166007)(356005)(47076005)(36860700001)(336012)(2616005)(426003)(2906002)(1076003)(26005)(316002)(54906003)(186003)(44832011)(5660300002)(82310400005)(8676002)(6666004)(6916009)(8936002)(41300700001)(4326008)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:17.3574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 637928ec-8ec6-4807-adc7-08db3ac15d71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4259

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


