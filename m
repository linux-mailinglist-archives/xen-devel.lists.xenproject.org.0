Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CAB71F751
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542795.847141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syV-0002f3-5j; Fri, 02 Jun 2023 00:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542795.847141; Fri, 02 Jun 2023 00:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syU-0002SL-Nh; Fri, 02 Jun 2023 00:49:02 +0000
Received: by outflank-mailman (input) for mailman id 542795;
 Fri, 02 Jun 2023 00:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syR-0000if-Vm
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:48:59 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42a065cc-00df-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 02:48:59 +0200 (CEST)
Received: from MW4PR04CA0100.namprd04.prod.outlook.com (2603:10b6:303:83::15)
 by CY5PR12MB6348.namprd12.prod.outlook.com (2603:10b6:930:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Fri, 2 Jun
 2023 00:48:55 +0000
Received: from CO1NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::18) by MW4PR04CA0100.outlook.office365.com
 (2603:10b6:303:83::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT112.mail.protection.outlook.com (10.13.174.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:54 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:53 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:52 -0500
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
X-Inumbo-ID: 42a065cc-00df-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4cBnT6q+KCIPafdlLM5CP4yDXsWNCLlnwOUHQi838ItqG4KKEXYEfgUwxiQOg4ncgn+82spxRpBw1a52c0+815CHq6MzPswm541Ue5BY+tBhuHQwte0o/xWeGleIBxx/AAjsO0fKkJxE2ekt5Xugst+uuymCivEbsLOWhxKeI05lPBiZmujsWUkmN2LEkgQ4vOmupnPh1VsycMA7QZzYk9bArRqodbWtKpuHoJIUQvq5+4ahRAtor/wcA5kutsiBnD7y+scQpn1xwORAC2qYkrIFaVscx3aP8DZmpzLVzZm0gq7CrVAqghdDCfc38bx8IQXSjirxYs1KyUU05IUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBHXZIlMJGJe8+ipovZgPxAdAwa+jzzdQSk6DYH6FhU=;
 b=GUO4jqSsFNN/hMrXISeoCBViXMnlvRDzIBg54qDYOJbbWGY6jPwZpXX+g2ZWCf9wGg4zfzLok8jsvQe9ownirPa7yUS9Z95GzupKXz21UvSXYxXQA6q7wN9R2fuUHCFdyNMqtGZeooZ+0Jtf4aghHTww1/EkbUA6U33t/zq0I4JIQ153s2G64PJgUTMAggCa21ptExsOj88kRzbYLeXTMedH6mgbj86Qs9xuGAIfSTiKazFBzztO1QOSjqv9xZmI0VVW5z4x2e/Qnde/8KRp3/16rJ1wU6MaCmZqdakMAIaTR5X/7LHYLKDZ3vjQMBLfDs+8C5LuAPWO6Wsl+Fo6yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBHXZIlMJGJe8+ipovZgPxAdAwa+jzzdQSk6DYH6FhU=;
 b=PFFvMVYnFBE+piBZe+QnuwfdMwW910NdGfoo1Mbo/yiuqYe5lCNG25zkZ94j9C9WD1a8OA2TxYMQSQXXeiAeILwl1kNWa13Uc0AEsJzcA7Bz3kou4fqb2XQJv6jKH7s7NfWibGrGok/Y35YbCyWI/4WRTjyZHoLLVhmStkYo62E=
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
Subject: [XEN][PATCH v7 10/19] xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
Date: Thu, 1 Jun 2023 17:48:15 -0700
Message-ID: <20230602004824.20731-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT112:EE_|CY5PR12MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e6cfb0-1bda-4842-c504-08db6303240f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eIH0Ww/uRi8IVsPEDXrW4RM+t/vLeRT/ogEO/LQTmYuCZqt0zuW2METsp8k5sTNcmDW9Pj3qmCVKFRfxapzsc2/bbqnXLl7i9q2n9ao3mdB6Qg2o79+zH4/L7NalXqgF8OzezalyAjN+Z94K8gEBDoIy/Hhy53XFkuFaoNkYI8KtuHtc26gStAU4bLEd8UTcEl1KXFnS2dthZcg/fGmbbRGLr9J5ibS004Po9mDjimET35CZSy4hIBxycH1zq1GJAm/f+LUblJVQ2I3UTHT/KobLYpn2X38ZyvF5zN/ZdkbRrQ2+HctZCvobF+w5VcU7UzHWzbRuV545M4QM1WyeK1iCXdMrLviBAFuUY38DKnMQPeOBL8SCfwjQ2wiIBUypX9ArFXecnyeua+OPYssowo1F5fHLvWbj9ulbEclZ8xytoi9kHb0S+4fZhf9x2wF6y8uHEjLEXNQnzPI+T23k2+wDtzB1d8vamVYxuCG2p0b3k3v7KXNjKvHXg7FQpzT8bhokrbg8BVEyjOv2xqT3KcTr9Ov6nDFFEPetf9yf4rWclTWL+J5UcVmYBnuG2eWhKumns8TtmrZP+28eK/bx0cOI4V8TaXkBhvEegm51zNNdWcCx3O8uCpjher3O3GhtMyy2P9e/Lapv5CzBTygFZ6mxNVjoluxrOey5f2Ga0JkxoSsZM/KqdeCazjyRejjvAogzy9wy1EoAQ54QWj/2GDZWch4tHytbCGahfGE3FTOA6O0BUa91VH3QQeMyKtou0vUzwtlCntUGFXbEeGtHEg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199021)(40470700004)(36840700001)(46966006)(83380400001)(186003)(41300700001)(336012)(426003)(6666004)(36860700001)(2616005)(47076005)(1076003)(26005)(40460700003)(478600001)(54906003)(6916009)(70586007)(81166007)(356005)(70206006)(4326008)(40480700001)(82310400005)(82740400003)(316002)(44832011)(8676002)(8936002)(5660300002)(86362001)(2906002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:54.2715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e6cfb0-1bda-4842-c504-08db6303240f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6348

Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access add.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/passthrough/device_tree.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 52e370db01..8cc413f867 100644
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


