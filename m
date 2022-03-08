Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC54D21DE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287460.487506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfnw-0005Qr-PE; Tue, 08 Mar 2022 19:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287460.487506; Tue, 08 Mar 2022 19:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfnw-0005MH-Ki; Tue, 08 Mar 2022 19:47:32 +0000
Received: by outflank-mailman (input) for mailman id 287460;
 Tue, 08 Mar 2022 19:47:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfnv-0004Om-9Q
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96a8cb47-9f18-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 20:47:30 +0100 (CET)
Received: from SN6PR16CA0062.namprd16.prod.outlook.com (2603:10b6:805:ca::39)
 by CH0PR02MB8092.namprd02.prod.outlook.com (2603:10b6:610:10c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 19:47:27 +0000
Received: from SN1NAM02FT0027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:ca:cafe::5c) by SN6PR16CA0062.outlook.office365.com
 (2603:10b6:805:ca::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:27 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0027.mail.protection.outlook.com (10.97.4.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:22 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:22 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnm-000Cws-Ei; Tue, 08 Mar 2022 11:47:22 -0800
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
X-Inumbo-ID: 96a8cb47-9f18-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETL0EnEm8zZvceHCk9Sc4USiDH9/QC18lc6pSqjuz/35oSSQjpuMi533y+I/hXd8+9KituXkPncfRdmBUh02HNuOxP3DC0ClJnuCkjo1+rzOkI4QXsqYjGDpkydGeP26AQ2d7bwIHxHWBuuTxNbFWdBBM0LTyvfOL7tIKFnOCvk/ix6YZwARL9T+1q3hkIkSP48DNXtwzfjZYpgti8bOzntiU42RmC2C/ceBbPjY6PRnljA04Cqy/uznAgkD3izPri/9fSOh30L7g47EqrOFJEwkcIvMQYkERQlC0VRWHawqeaFwiDWvDrB5EhYaSHPf6XFDtLQ1nXAvYAr0oZt2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IWMUDk1B29LOn60YW7dkrnq4Tu3150fXZJyXETxs0g=;
 b=QET60cJxqjQyKmYqU66ZH7Tya0UYonhuDYyuvLRv4Krkuc2D7vqMcOBftloMXqbF1Baw4YD8sijq7ZOE8OeArC8HWeKifB5AM4/ACub/TeJkhrvw8uU9K0yhpzMbHhlflAWg1jY+GMvNjM70ClzsFCpeX2L07e85shu8pQ/5P+5j/420tskQBQ1L6jc3OnUMkyfKPZ/cOz+KenZwW5LD20yFtPSNKAhvtzvBVFnDUEIZJn+nbyVaRkx4vlW8EdUenpmCeq2X7kWZI3fZfpFZtbAsyac5PFfAHFeRh1Fsi9EYsjmDIzMYm369BbWS2FXTaC8+XnJyYwjncwluKPwQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IWMUDk1B29LOn60YW7dkrnq4Tu3150fXZJyXETxs0g=;
 b=PcToAz9Lv2wQUk+Qqi/uwDz80/MozqmOVAz8mMwDq1Xc+v7YpFFTfrU2T2j7mUsNiHE9iSNigykLwzDvtUkF/VM0IXZ/AFhX+Oc/4CelRp3Ix8hvU33GrGOvSZkx38/5TBU+SIKmwFd5GwquVjUG4/yTz5LBoWncbpulo7qn1u8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH v3 08/14] xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
Date: Tue, 8 Mar 2022 11:46:58 -0800
Message-ID: <20220308194704.14061-9-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f23ba2e9-c30a-4b02-1b46-08da013c795f
X-MS-TrafficTypeDiagnostic: CH0PR02MB8092:EE_
X-Microsoft-Antispam-PRVS:
	<CH0PR02MB80928F1E679C2B3EF0355F54BC099@CH0PR02MB8092.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E+1kSDI9CKq/nGZUfoTRLeQhuupL5WeTD/y3gQgiiSqxIWwIiw3C+Zeog4HK7yDjLFYNGJTdQN9TJoCX9o41NLxnlfVWSs9Kq3BrDk63OJxynvmYXCFSA8EvFUyKHSBj6EdhdSPBvSL97zRsqMZ5lhVwj/nZyc2OqTcGkxMtILf6GFm6sxdVxwP8qwQS8kRakt/IsgmCy7MoljhM+By3dVmbT9YAaqWylMx62j2dEodshDDl50TdiyWsyYrY0/OjpLJakTwTTOt7JgFg3YCNkS2z/PxC2cEDuPvkJMlHZHAZ2/d+QiIYtdGWYi/iWEbSZcLOQKHYiBPH7/oTu6DGLAYJz7qFfqgEAmDrEHN1UDLNQpWCGThmZJi92sMhGV4Ba1UIvoWe6q0Q17jk5EoptQJEgYhhhqVm46lvUWm/yK2kVVDqv/MrT0zy4RoE6uZZzq13/GFz1Ojl2rtLVeX+BpXWjk0+JanMaxXSDBoqe8D+lDlPqzbee/5tVGAoPZ6YeqUcp/cwBatuJEQdQkBBt/DkypriP7rDNFlsps5aR2AVIIArdj/Uxuq3uZAElv7/29M54arAGo2h6sbncUDyfX5xoBuA17mi8pszG6Gk/EJoleO0/WZGkXwuSJVMxPlboL82l+XZXdUhMltOOWspwXc7SZviVLdAauytTkcdbVihq8cd/R8OyNgIc+uwapc//0sCxfJST8xHgIAbjuDJNA==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8676002)(508600001)(7696005)(6666004)(82310400004)(4326008)(6916009)(316002)(70206006)(70586007)(54906003)(47076005)(40460700003)(36860700001)(26005)(7636003)(83380400001)(336012)(356005)(2616005)(426003)(186003)(1076003)(107886003)(36756003)(5660300002)(2906002)(8936002)(9786002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:27.1350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f23ba2e9-c30a-4b02-1b46-08da013c795f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8092

Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access add.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/drivers/passthrough/device_tree.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index b3b04f8e03..776809a8f2 100644
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


