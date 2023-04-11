Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5DB6DE495
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519777.806805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUP-0006cq-VY; Tue, 11 Apr 2023 19:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519777.806805; Tue, 11 Apr 2023 19:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUP-0006LA-F0; Tue, 11 Apr 2023 19:17:13 +0000
Received: by outflank-mailman (input) for mailman id 519777;
 Tue, 11 Apr 2023 19:17:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUM-0004DR-4r
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:10 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe59::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7309f7e2-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:08 +0200 (CEST)
Received: from BN9PR03CA0125.namprd03.prod.outlook.com (2603:10b6:408:fe::10)
 by BN9PR12MB5084.namprd12.prod.outlook.com (2603:10b6:408:135::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:05 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::84) by BN9PR03CA0125.outlook.office365.com
 (2603:10b6:408:fe::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.22 via Frontend Transport; Tue, 11 Apr 2023 19:17:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:00 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:00 -0500
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
X-Inumbo-ID: 7309f7e2-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5hwxHDiJ6cPXtGVi0oDhgGm3os2tvfuJk/rvPeOs5IMC2wLTyxhSHPzGdvuuRI/bYz0Ev6Rre1K2rIqyc6Ri59vS16WiVSCQ1l2QfFetjgsYV5Yff3j66E4dGWelns5JVGmuHmyH1IJ/kbG8OD8pCblaMZ0E+AZIamdZgxFL6/rMSeIGdzBgffGT18CcjFfcjPhq0SrSrarKjXWWlLoGAmgksCM4eUYqtYTTyJn79+PXiCL8X26kfGxK59CnhJuMs3jKTv4FM3xgKbn0JR2wtFqYfeAhFWUzF9AQNhkj4t7gwiq4fg9M5y2vc9uwGkqFYIy5rGppra40oH/rnLn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbn+9h9tF7QZlww7kr6YoDzwWCRUPyZKofdb3QDs5Ls=;
 b=QNK9jA3ONnSE1MrYZppf2BKDWAJikpDz/GOU3l1M5GQWpOa3zeWUIQHywMUMYHK0RC5LhxeEzDXtfOIAQM0QmgHUemK4J03w6+oy55pd+1fcryOg5UQwJPlFbpsShvUrxOvN3WuucMqSP7vpnPTswMhoDr+e5riI0lrri1kXnMMExr7tbXY2OIjsGQRMoYLXtR0TaNRsThkS/pCIwVm+3tEDFUWCdgtZB+TMJ0Br/XCmGe3kqYmcHtx8/disPE18Rg/weHlFOUxiy8yaxbv3rxBSTJ1V5a/C6+kS0j+q55PYoyljRW2We6QxUC4N36NIpQdhyaeMVVjcoS/mlftlmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbn+9h9tF7QZlww7kr6YoDzwWCRUPyZKofdb3QDs5Ls=;
 b=auVQJ0UMG/mylausafR6rHAq+f0clyeouWECzrLAe+0FRFpwvUeGm/ek4sst6QIP7jQR4I5kTJUXKwX0yStFdEbrBAO1c2cp3KYtzvbqVOIAn8vSEU5dQerSPjGyH1T2jf7RtpXR85IyJQbGr+k7taprljIZT/DgVkW0Mua+GrE=
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
Date: Tue, 11 Apr 2023 12:16:09 -0700
Message-ID: <20230411191636.26926-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|BN9PR12MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc72af7-9755-4072-ca37-08db3ac155e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aesU9CuNguun7Fu2Zu/Im/OValFm4zDIlA3vKluqIupLhBGOIhKJzL3kOBw9pc+M1uTqxvlV8M2MTLGidHSoQ9QYcZBNx5MMH4dzfVw9fHu7qhFgBOaDdU8yRkB/fpClf7vqVCXPJ1Qxo4cxojToznqjQ/baIHSEtTZfQSWDudyCvjxHCPZFDwqNLaq+Ah60vqJm/EhkmqwcHG9R1XA9y0IpflLQMperCGb1aIxadYWQRdN5a4EH0mC1C8e+dYSNpSaKavZkUiA+V2EX9NmlJ12gA+grRZfQMeksLwPkOQ5FNG+v0wlI22li2TB2cRwLDpz1No5Ao1bKRC7zkV3QaTsndXFhkrek7dVSAIrr8hAAWVzEq9n0xupoLdEtcP9yRez/dnhChpBsKdBbThmlvePtmhEY94uxyHALWIqEehztR9Yg/vkejNFzOw6ZYDzEL+XYrOIS4550vkADN18wNBsXdqTyNbygFJLwD0Iv21Ur58i01+RybNF6VvAKeqE7L9W5hZ/WPTdbA40j54Ab4SO/tSnJEw7LtXld4XERgzT4obmEtWSRllwB7nDL1sHWdinxTBN9pzhsBq6l7qW5ow7vY+9M2nJo5yHXIC3C0zVcOX/O2eqxZCsYvMIV81j7AW3n92+55NFguWetyfdNr2sKQDUo1FM+r7ncCtaDSeoKVob3SxQQosMjKUzuebtDao5PsQKzn0dHOwcXMmUi5flVdoIVD7EJQkivGjwgH4g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(86362001)(478600001)(41300700001)(316002)(4326008)(6916009)(70586007)(70206006)(8676002)(54906003)(8936002)(40480700001)(82310400005)(44832011)(5660300002)(2906002)(36860700001)(356005)(186003)(82740400003)(81166007)(1076003)(26005)(2616005)(426003)(47076005)(336012)(83380400001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:04.7072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc72af7-9755-4072-ca37-08db3ac155e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5084

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


