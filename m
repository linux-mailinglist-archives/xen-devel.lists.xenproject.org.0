Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C1B6DE4A6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519813.806907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWI-00061g-Gz; Tue, 11 Apr 2023 19:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519813.806907; Tue, 11 Apr 2023 19:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWI-0005x2-DI; Tue, 11 Apr 2023 19:19:10 +0000
Received: by outflank-mailman (input) for mailman id 519813;
 Tue, 11 Apr 2023 19:19:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUf-0004DR-BP
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:29 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eab::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e5a69a4-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:26 +0200 (CEST)
Received: from BN8PR04CA0032.namprd04.prod.outlook.com (2603:10b6:408:70::45)
 by BY1PR12MB8446.namprd12.prod.outlook.com (2603:10b6:a03:52d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:18 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::84) by BN8PR04CA0032.outlook.office365.com
 (2603:10b6:408:70::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:17 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:17 -0500
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
X-Inumbo-ID: 7e5a69a4-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F51bULKW9b+g2uxlrVXvYKaoRY/BibCkb2SPb5ObheoJoI53wTk2aDI9+YohJii69KmGma19PCO3tW4tMnTXwVRBluuokfqiZBvHbDix5pAxbJkCPdGIZks3izhxcCg/FRDhnDNJ3UXX/IOp/0QeQ3BXuKu/SZr5c/FTmVDulC6JFE3uw6eUf7SOgl7lQpI/HoxiwWGC6RHH2eBjYOLKf1bYGiBhb3Fh6EJvskGhjE56TCzyHpQFn6ti2rK4E/vW7JD/RPalmCsxNhe8kw6+k7G/itVKHq8vFCxCqUMXg8eOk7jPmHah208vRKPqp4AoWBNBSnT/oWo9SYFr8TIcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd0QFdZvzHUGWrw0BfIrEu3cWkp8jWSV4vPT9FURuHE=;
 b=GVHkLjWTfBaR1e9+F+dbVMwK2uPs8b88ZM46uVIzIjudv3ZNg96WWLSa45UoP0/uNAJuubbd04wbbqWC6cwzCsQOBwsVxaMBD51h4I2wWjJAca+nC56si7I1vHpQCn2CLfRof8p9kzafAbAKIl2fh6trQu5fSolcjQmEgVIIVwVK8CfDMLkLaRDZE9ooGA/Nziwh5MSwBbJes2JFzfHHstxsIuTrLDLAh99xsCijJiRte6+1KsyBLwCx3tTzppZz7Ki7Q+PzcUF7dmzdCnBAWBXsO4FfKq+pdP2F2FoZh/KFFM7eemF3P6yTRltC+HwNwejPVGZSSpkdSRy0XDiYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd0QFdZvzHUGWrw0BfIrEu3cWkp8jWSV4vPT9FURuHE=;
 b=UeV9rIjPsBcg+PwgcsDBTnzu7kPN8nOMhtQyadhmsSoW+nUgdraiApOXwmBYNc5z+TyS1KVrqcIj6Cw4BABNtfalpWqlmSOPwib3dFZ/lfKYtoGlgu2/tHWkNtX4WKoNmaUoLhzGDoycrB0cG3HCUXiHeQoyuq4WuEQ7pAphK6s=
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
Subject: [XEN][PATCH v5 09/17] xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
Date: Tue, 11 Apr 2023 12:16:28 -0700
Message-ID: <20230411191636.26926-28-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|BY1PR12MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ccc8d77-ac1a-43f3-f466-08db3ac15dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	87wQgUV/Rs/rhMoHDyAXQevmpXRLXB2USDKIB2K94zIe7mzQF4qIHmhhubJj04rWW2nT2FatrLn3Kt8TGmgFjqK8f+qmX2eM0pKIu79MzkElNpmXfWbrUaoiCeOaVjOVtpMTxwVQ/TVBMRz9BCMSQNuQD7Yggd5Mo+h21Ax/tfIZ+YiZBBX+9fdtphasJMnj3JRIzmTExGeWivt1ezYxPXs4F4xWL0+X5Yj9dWPCGKw+h3sHRw7bAPByNK58TZLfzTgYWIgW8luPcTV/oAwPC9JiFuoC777ounPNB5yFl5DJCz9C+JKqlYkaoedAk88jGQSLo8CW3pBpxb5am0CHJA80bu2hS4PZqD8NLGcxlKMCaJ+N0a5ddFyndjGV7vP5bWWVMGBJU8Hv25YMfG6TfRLhBGE0QnJkQfch2iPUPwmhw6Sn/hbNxmxJTrmk+636iDCuR22Iut9OGQHXPnzwZrKS7E3zemncGSI9VQ9Xs2DefUg0nQOVAKEM1MeuZ8yjZCO6OFasSOW47C3+i8oRpXXPQgLNzA3CxXZy5WpPWMC5y/2+lo0O6MVsOvvW2cLK61qnya3zCk204VPco9hwJ4jdelqsO1Dd7FvswYqso3rvOkQBKMVXIBwwf0X5IR0xnCtzvo8Uc+9JvpjbyurI9BjfqmKp6TrYNniNUyM0JMLWW3MpsYSijbeV0MgLrq2QriGdg3+sbqYIospL1ZsJLywJOiUaDKK+1yovMUWyhRw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(82740400003)(356005)(54906003)(36860700001)(81166007)(70206006)(70586007)(8676002)(86362001)(6916009)(478600001)(4326008)(336012)(47076005)(426003)(186003)(2616005)(26005)(316002)(41300700001)(36756003)(2906002)(1076003)(83380400001)(44832011)(40460700003)(40480700001)(8936002)(6666004)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:18.2324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccc8d77-ac1a-43f3-f466-08db3ac15dfb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8446

Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access add.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/drivers/passthrough/device_tree.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index bb4cf7784d..457df333a0 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -146,6 +146,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( dev_iommu_fwspec_get(dev) )
         return 0;
 
+    spin_lock(&dtdevs_lock);
+
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
      * from Linux.
@@ -158,7 +160,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
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
@@ -189,6 +194,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( rc < 0 )
         iommu_fwspec_free(dev);
 
+fail:
+    spin_unlock(&dtdevs_lock);
     return rc;
 }
 
-- 
2.17.1


