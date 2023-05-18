Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B5708A25
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:08:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536549.834981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkrK-0004pc-CZ; Thu, 18 May 2023 21:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536549.834981; Thu, 18 May 2023 21:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkrK-0004mr-9E; Thu, 18 May 2023 21:08:26 +0000
Received: by outflank-mailman (input) for mailman id 536549;
 Thu, 18 May 2023 21:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yK0N=BH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pzkrI-000492-8T
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:08:24 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f5db55d-f5c0-11ed-b22d-6b7b168915f2;
 Thu, 18 May 2023 23:08:23 +0200 (CEST)
Received: from DM6PR02CA0110.namprd02.prod.outlook.com (2603:10b6:5:1b4::12)
 by SJ2PR12MB7847.namprd12.prod.outlook.com (2603:10b6:a03:4d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 21:08:17 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::70) by DM6PR02CA0110.outlook.office365.com
 (2603:10b6:5:1b4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 21:08:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Thu, 18 May 2023 21:08:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 16:08:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 16:08:15 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 May 2023 16:08:14 -0500
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
X-Inumbo-ID: 1f5db55d-f5c0-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0n8mSjsCLUvzwpfnyCjNOt/w0ECvPc9Mjz9ALSPVMuoZ1rT42YALSixsSPPWiA5MwxsdHjF4WlN9G3SoVQdK1hJ+NZ4d6jmz08t0OePvckvQe+K5WdkcHKNPmTDEsg7AqDvipP/1MBH1APYoCETssrJIkV8KGhCSR968hC9hyK+awCvnDRNtK7ItrdOWDGXb11tuLsgQwH4duUDwSsiXG3oR8mg4Gx/Nq7t27X2Uzli1pbytsDDWTdeFXAPKyzKiXspZp0D3/TBKYDCnQ/elZuMkDw0excAJxmL6FMvrRuGgFYSdvAOqHUS7qoyQawJnAfDej1EhavcrYAdRVpA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Hf5r04d2nEr/v6wVdo3KW9S2VJ/PyaIu7QWgQPgol4=;
 b=BhWtmRAA6/iGrPOtItTym1v/QeD4LUbXVzGpmDgnbd1BcfDRPbofQ08yUjpBXUWP2RkkZJ1EMQ8JshiFD4j67vPPnCgR6wh4vnZH9+xkapTcLcqGo19PqQyNeCYY9uqVUksMWwYYtfq3SWazUuU/ms1rwWFZ7bx1N/f4tyjFEQQFK6VBkFwxYAEtJRkFMXrf+QO02fEk8XoLwkIhsyMKI5jxiGss3/W3BOyIawFGvnP5BWnIpvWSNja5XpxykEWpEuKYsKAELPel1+ELaG/zCc7kR8WXatFl75phu/dKrOaiW9YF1jFyzbU707F3v3nSDGFjGtscFLAnK+7K9OWdpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Hf5r04d2nEr/v6wVdo3KW9S2VJ/PyaIu7QWgQPgol4=;
 b=SQgIyjPyX/tBGZydXeEvDUluTeRuN7o9s3VyH964otcm3peO7NfK5q8/0TDI8wArk0pfY3GiidqaXkPYwciHKKxE/onzFLifWrPvYXR1uGUYjYK8XiA9tFtKcSgcuydhz/YxmF2ZD5C1qlj1kJFYw1iHle1AKYlvXa3W8oVHelI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: [PATCH v3 2/6] iommu/arm: Add iommu_dt_xlate()
Date: Thu, 18 May 2023 17:06:54 -0400
Message-ID: <20230518210658.66156-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518210658.66156-1-stewart.hildebrand@amd.com>
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT029:EE_|SJ2PR12MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b74e7f2-c0f4-4465-27e6-08db57e3fffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9/9Dp4fyGn3rTnBq0fmg46tqP5tFLB3/f3krMVWGnpGB1GTRnk0kqvFpRzTadh2KvSNaGkM7+lSP894fkillaISxw/zSnFOnduiWw5C04UXDQJhJap02nQ0qJMYTS3ri31OM1hE5h7ePA1Z6F2Bk14cDzS+HA+Z3IBz+uOC86zdWlAEZYaF2MLPYgvM+TRARXEkl7ly4rV0U9CjF2YjHvESA/IRB9g3FtRSm1sDkXwtpN2+tukJYhJo/Lk8OTH/03rqUvmSUpJPceua3zpdSL1UF7rl1CEFhpzs6BqdOcECu+R0q+zJI2LKnBa0I+ItuVZucukbCD4Z4t+m0CyjMSmXpEkb0Cpq/Njpw5zfbA2bLIwnaSX5mcMXz4h+bbnpJwGShRedONr2/LAWhBtCX6SEAlYEE/iLQ4UqjR1Q0f69qkYjeeXYTAcgnCBtweSGu8rupyD4Dpl+bDCqg3uRn5sTTUI8WmrhVsbmWs+H1wcwFoRJkTk8YVWQulZlLqNYdwt3uvEh+Dq/PwV7h2lHrgJPZNvg0jSsFr9umLg+jNvKruqAxT2o5wh013008rneGZDiDnLCBgMrdOZOH0Sz391TpO/+AFH9t7FePOPOZXpZ1csS+OzbnZE0PCDC+BA+04eFMRIqzmmoSD2R5j8YMwo0bTTxLMX8s83sj3OR25v3aKvNShVnvO4QpMS77y8WX4/5QqIVIS1W3py0F2dUkPIvhi5iJLqjhMPCV0t680fEwzMAwhkq1X79w+aBCN4u5
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(70586007)(316002)(966005)(36756003)(478600001)(70206006)(4326008)(54906003)(426003)(6916009)(86362001)(47076005)(83380400001)(36860700001)(1076003)(26005)(186003)(41300700001)(2616005)(8676002)(8936002)(5660300002)(336012)(44832011)(6666004)(82310400005)(40480700001)(2906002)(81166007)(356005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 21:08:16.6249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b74e7f2-c0f4-4465-27e6-08db57e3fffd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7847

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Move code for processing DT IOMMU specifier to a separate helper.
This helper will be re-used for adding PCI devices by the subsequent
patches as we will need exact the same actions for processing
DT PCI-IOMMU specifier.

While at it introduce NO_IOMMU to avoid magic "1".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com> # rename
---
v2->v3:
* no change

v1->v2:
* no change

downstream->v1:
* trivial rebase
* s/dt_iommu_xlate/iommu_dt_xlate/

(cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/device_tree.c | 42 +++++++++++++++++----------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index b5bd13393b56..1b50f4670944 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -127,15 +127,39 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+/* This correlation must not be altered */
+#define NO_IOMMU    1
+
+static int iommu_dt_xlate(struct device *dev,
+                          struct dt_phandle_args *iommu_spec)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    int rc;
+
+    if ( !dt_device_is_available(iommu_spec->np) )
+        return NO_IOMMU;
+
+    rc = iommu_fwspec_init(dev, &iommu_spec->np->dev);
+    if ( rc )
+        return rc;
+
+    /*
+     * Provide DT IOMMU specifier which describes the IOMMU master
+     * interfaces of that device (device IDs, etc) to the driver.
+     * The driver is responsible to decide how to interpret them.
+     */
+    return ops->dt_xlate(dev, iommu_spec);
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
     struct dt_phandle_args iommu_spec;
     struct device *dev = dt_to_dev(np);
-    int rc = 1, index = 0;
+    int rc = NO_IOMMU, index = 0;
 
     if ( !iommu_enabled )
-        return 1;
+        return NO_IOMMU;
 
     if ( !ops )
         return -EINVAL;
@@ -164,19 +188,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
         if ( !ops->add_device || !ops->dt_xlate )
             return -EINVAL;
 
-        if ( !dt_device_is_available(iommu_spec.np) )
-            break;
-
-        rc = iommu_fwspec_init(dev, &iommu_spec.np->dev);
-        if ( rc )
-            break;
-
-        /*
-         * Provide DT IOMMU specifier which describes the IOMMU master
-         * interfaces of that device (device IDs, etc) to the driver.
-         * The driver is responsible to decide how to interpret them.
-         */
-        rc = ops->dt_xlate(dev, &iommu_spec);
+        rc = iommu_dt_xlate(dev, &iommu_spec);
         if ( rc )
             break;
 
-- 
2.40.1


