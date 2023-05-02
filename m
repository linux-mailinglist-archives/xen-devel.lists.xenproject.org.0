Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAB26F4DA6
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528868.822618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ5-000055-3N; Tue, 02 May 2023 23:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528868.822618; Tue, 02 May 2023 23:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ4-0008Tz-Q1; Tue, 02 May 2023 23:37:46 +0000
Received: by outflank-mailman (input) for mailman id 528868;
 Tue, 02 May 2023 23:37:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzZ2-0004sC-Fg
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 552ea58e-e942-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 01:37:43 +0200 (CEST)
Received: from DM6PR10CA0030.namprd10.prod.outlook.com (2603:10b6:5:60::43) by
 PH8PR12MB6841.namprd12.prod.outlook.com (2603:10b6:510:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 23:37:38 +0000
Received: from DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::88) by DM6PR10CA0030.outlook.office365.com
 (2603:10b6:5:60::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 23:37:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT073.mail.protection.outlook.com (10.13.173.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:37 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 16:37:35 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:34 -0500
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
X-Inumbo-ID: 552ea58e-e942-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVNgEAorIrinAzAbFAp1oO37hZXxBb7ekDWjwhWkcemEPGnxRKqcW+m3UToKpPlfVd5OCRi1xKCFrZ5/wejFBIqH3b1Sg/PB2Gch6emWZvgQ8egmSLDJ33AbTJIrCRcn6yeNRSi5YjHKGgW0RvmZYOfrcEVXpXtwKkSabinpq7IdVcbt2VjGlEWFGoNlfIPP7T1S6jkb8Vo0Mo9X6mkX+eE+gQA5ntIefbtpOGhR9OAYBiD/6w84OY6lZSXdK3bZ4TBHKtP4l3CasBIvAKuwRFk9xrXybm5I2RfUkP1tfYo2E051mpKe4JBWuDr6UIg6bxyNST9AcCBfRsgz3JlGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45fuJEPfdOT3ElxOeWsri05r41QvJhpC/khBsBhOc+k=;
 b=ltr4GcawQtiBZOSzhjSlRlnkHepmTmdlewD6rX+IyOnI3Qa0LfkDFdAJL+YFn1zSkzgBVKIl0ZYra/377eGVtKJkDB/QS1G9Gx7cQ7W0OjEhLrtQVq05w0nrfPRtqcJKkocQAfU+tHtORxkrmo0ywS9hFQuhc05Ibiys4Kecv0D3QXRYBmMfDpNhqyZ1A+aNUwrMfA+hpyfeCtQpHSL0iqhcofaTixr4F5QliDttmXUExnqhYAnKj6S77jlubO6+MY3Tp00N1CFECr7kYBf3FrPJQVFXbMwR8saRecwD+Xe3vtR3s7sq4HF3eW9tfZdMPrwGcGMirvRqTe4uD/27SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45fuJEPfdOT3ElxOeWsri05r41QvJhpC/khBsBhOc+k=;
 b=f8ysGqbPRFTrPohT1BVu30l4EsRvmo5iN1OZd5jYXU1jJPbaurGryIB/ed7WzKBC8kShyNGm0hocom6HFA2xp3LLHwyDlR21MvM0LDlP8Qbr7lKzzckUhrnSyLtrgeB8JTqcJPoFLPry19PslYAGuGQKRG6I7Xlyu1gCoJ0yiFE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v6 10/19] xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
Date: Tue, 2 May 2023 16:36:41 -0700
Message-ID: <20230502233650.20121-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT073:EE_|PH8PR12MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ad38c7-1516-43e6-acb0-08db4b6636c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NU8RTqxFer0gTDcYCP8jr+YW3AMDAsYu2QvLaiu8yd98kz3m4aPe0bQWQEwgYiIdstnCe19lnOY3Xye7H7DwX7O8UW56F7yM9nwvcy1JQAc6rcNZbOSxR2PG2bdbrJCrkvTvNtHlhP4/M4d+rUoh8jEynp0yVWHXSMGg9uwY8OVHhZIFoOyYXZJiCgxo2CpVU81kWQdvBKJ+9dGL+mjsQQWor5CamdMZROucpMUupXD/bZIVlPAZ57cCYHaqf4W61yqsW8tV/XYcnKESHWvCva67K6QkrokKkyiExt2abTqEECYfekxRmbYg2bV3vuaEl6ZnnfYU7MQ32qxyPHEOTz4mMOQiAPSFnaMLfTh8vSzeelg+lLIfhxH0VYpNjyTHHahFFqXaIdCnBIMmMetWnFdmbOeElN7Q/kH+izWNQSsJIHioRxrKBZx+FzrvQNiOhJ4I6Le3omOpfDUIZXP/QYGpTUcFGVVtjGNZomH5v9QVIpauS3pOMtWTpnYWhH59Ze2ts3dBNAdqRy4zELKma4W2XvNmeVRCzdYT3fUsy4TMe7GaCkrCB3adacu7lAJTQCjA39Fs7PzN7nHMhzdFEMIvxp5WZezlFReFpekc5vT7EhmbuJ1WyntoWf33ocp/766tix0lhGZjAIwpelVWUPKZJOFmQbZDnIUfc6TAsFYYWcus/E24U1PsPwnlRU+rnwNKWIblsuESa/gPXDi3eNKp+UtS4VARwlth7KSQg1s=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(36840700001)(40470700004)(46966006)(54906003)(478600001)(2616005)(83380400001)(36860700001)(47076005)(40480700001)(6666004)(26005)(1076003)(336012)(6916009)(4326008)(316002)(356005)(82740400003)(70586007)(70206006)(186003)(426003)(41300700001)(2906002)(81166007)(8676002)(5660300002)(44832011)(8936002)(40460700003)(86362001)(36756003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:37.9816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ad38c7-1516-43e6-acb0-08db4b6636c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6841

Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access add.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/passthrough/device_tree.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index c386fda3e4..f3867ef1a6 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -145,6 +145,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( dev_iommu_fwspec_get(dev) )
         return 0;
 
+    spin_lock(&dtdevs_lock);
+
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
      * from Linux.
@@ -157,7 +159,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
          * these callback implemented.
          */
         if ( !ops->add_device || !ops->dt_xlate )
-            return -EINVAL;
+        {
+            rc = -EINVAL;
+            goto fail;
+        }
 
         if ( !dt_device_is_available(iommu_spec.np) )
             break;
@@ -188,6 +193,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( rc < 0 )
         iommu_fwspec_free(dev);
 
+fail:
+    spin_unlock(&dtdevs_lock);
     return rc;
 }
 
-- 
2.17.1


