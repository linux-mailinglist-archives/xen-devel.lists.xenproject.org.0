Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CAC78F7DD
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594297.927628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwRd-00051i-Ar; Fri, 01 Sep 2023 05:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594297.927628; Fri, 01 Sep 2023 05:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwRd-0004zh-4o; Fri, 01 Sep 2023 05:11:45 +0000
Received: by outflank-mailman (input) for mailman id 594297;
 Fri, 01 Sep 2023 05:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGY-0000Nr-8t
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:18 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70f13c05-4884-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 07:00:17 +0200 (CEST)
Received: from DM6PR17CA0006.namprd17.prod.outlook.com (2603:10b6:5:1b3::19)
 by CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Fri, 1 Sep
 2023 05:00:13 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:1b3:cafe::f1) by DM6PR17CA0006.outlook.office365.com
 (2603:10b6:5:1b3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 05:00:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:10 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:10 -0500
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
X-Inumbo-ID: 70f13c05-4884-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mS19cTSXN6/r9Wq3MHKmemP8Tf3XLbO8epJyRe/JM/bn4MPKghtxY5uxoVant/2cdUitBSYM2k3RVQxMI8bea1xSd5o/FV/7xo34JBZsQshikFtgwjcxanxgENtuS3LcJKO4iHiGdI1+N1sPIjA4dGZpMbZLROyrasekLDhslAc6i3qzyXR6rgmH8YdhvzxwzpceRNAxMas0EbR6/bOLP8BOZqkeqCmFSHP8gIr4g0TcqL+rGePv6Sedg6seSEn5zR4QS1Zt81Jxkn+nbclNq7yVMjGM1KUF8R2WtRgeriAPvr2myVq1FaWWaJRfWaIJPMB0riNAxJAAaB0ICcXp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgeWijtmTwTyogLk6WxOUL3kuOmYaDdqs1e6E0a1fkw=;
 b=PzOsEMnUeFs40RoROJpd2htayQ5BKj0MQK7aqXRM9PLi+71jSxFpknXr1/XyaUrbhJHZaCw3aDrGUIx0sE1Mcc1VOTkvTCCKZxUEer33cjz/uRxb06nuBwSW2C3PHJPR+0rNcCidvEUPfPAX86t+pV2kWWXdeUI7vUwYN/geRECC/xSix8E0D0E2R+tK8XHuWkNNFPuyArBu57DRwo0OWSpNmrSvvEGhwZiRP7WOApQntn/tg+9ijJsSiEOc/Wa3FRdFqm8GqhQAfapTFZO6hB0fjwY9UwUp92mbp7iS5hPD2/oZLPXEx3chTrxsBhi24ELf9BCQcE48AwNep5APQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgeWijtmTwTyogLk6WxOUL3kuOmYaDdqs1e6E0a1fkw=;
 b=jynGNOCY0JLwrjcg1JHg53n+o3xNSiMrb61xmuBS6oqmm5yu247IEfAW6OyMul2zGVwzrK1FGkyCKraC8zm+rhVAsAYN7Q0qRr2muT9I8XtgqnooFwC4XM2soUINLnq/LMe8KDZT3L7qI1ff/GDS3aiVm1fb4JC4yYEkeQyvUp8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v11 10/20] xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
Date: Thu, 31 Aug 2023 21:59:37 -0700
Message-ID: <20230901045947.32351-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CY5PR12MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbcc140-53e8-4f26-2881-08dbaaa85375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gTFr8QeWxDS82+Ho5lf8reBbi/hfAhBcY4PLg3H/SN78p2cJePkvXwU2vurlPEFj5ICOTQIVsYC7xfXQCiozyyL107I0JyjNL0JaedTbpe4sYmprnociFobA9k2eVUOsfSHjOxlCtqz7rAkbac3PMtTH27UIRVmn9gUYXY92ZBl3+5gbCEbPqKFlvNpYvahtUK4IB+TqAqQ2a95Nhgoi34fhh8aPlEmTXnArIO44rxlx7agFNNHPFrc/BxC74A1POKX87MITN4ZqMJWYLTBdkJp+Xdo6kZ4I4jBRRuU88d86/PBExlvxtu1+vPgM6rF06T+7M2i2yPiNGoO22bn3qdNhUNBytBfiQl0DnU0gooypR+gIAWQTzduGMswwTIoiFoPJGThdmOxZoiqp4kFcvk9zp0NQnuTA9oN9YcfHaVoGVYK7xld8UUQN2OSgJslUh7QKTIfiABTYTv5xN+Q2LJ2OCEitBYT2lqAeJAHw9E91qD1vVApVp9VZxyT5B5CE0VxMHargVqOZGESG9Eez9IOmkRZvoUEOK5aLgc9TNVI2J1FBQ+sta/+F+Jt2Q2IeiUFLo+GuOB2MHY1sgKGrj6jRVWbbef15OuFAQ0Y+XcIGmhz2PiK+biJW/fCnHEf9TIErecRA03BlyOAPVVrpuB7uB9Zl3a6+ICQMAlXlurjTRxOnTAice1keAY2MSB1X6sV6R0rpgq5+/nceecdBJyyx/Lvg7HNxpacic3CMsn8QW95PPnzTqmT4CHCzbizBXoHezALiFCYwlwVcBsdxiA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(81166007)(356005)(82740400003)(8936002)(6666004)(70206006)(478600001)(70586007)(54906003)(316002)(41300700001)(40460700003)(44832011)(1076003)(26005)(83380400001)(5660300002)(36756003)(2616005)(2906002)(86362001)(47076005)(8676002)(36860700001)(40480700001)(6916009)(426003)(336012)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:13.3379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbcc140-53e8-4f26-2881-08dbaaa85375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406

Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access
to add/remove/assign/deassign.
With addition of dynamic programming feature(follow-up patches in this series),
this function can be concurrently accessed by dynamic node add/remove using
device tree overlays.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

---
    Changes from v7:
        Update commit message and fix indent.
---
---
 xen/drivers/passthrough/device_tree.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index a7d86a20a0..687c61e7da 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -147,6 +147,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( dev_iommu_fwspec_get(dev) )
         return 0;
 
+    spin_lock(&dtdevs_lock);
+
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
      * from Linux.
@@ -159,7 +161,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
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
@@ -190,6 +195,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( rc < 0 )
         iommu_fwspec_free(dev);
 
+ fail:
+    spin_unlock(&dtdevs_lock);
     return rc;
 }
 
-- 
2.17.1


