Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C902872524D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 05:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544302.849993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jVE-0003dG-PQ; Wed, 07 Jun 2023 03:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544302.849993; Wed, 07 Jun 2023 03:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jVE-0003bb-MB; Wed, 07 Jun 2023 03:06:28 +0000
Received: by outflank-mailman (input) for mailman id 544302;
 Wed, 07 Jun 2023 03:06:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfoE=B3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6jVD-0002sk-7Q
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 03:06:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48f07ddc-04e0-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 05:06:25 +0200 (CEST)
Received: from BN9PR03CA0116.namprd03.prod.outlook.com (2603:10b6:408:fd::31)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 03:06:21 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::e9) by BN9PR03CA0116.outlook.office365.com
 (2603:10b6:408:fd::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 03:06:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Wed, 7 Jun 2023 03:06:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 22:06:20 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 22:06:19 -0500
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
X-Inumbo-ID: 48f07ddc-04e0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xxow2M9MOd3Z2b8h5M5Axcohjie9xXdjE+JYfBRq51g1p14lgqA3zEB5p7w/vfnd3OIZw04/I0qGjCVTHUGK9hDwHl81Ex62qYNceYz70CV+xnan+ZzAlUg7soHBSt6iVz4091JpiOD0k+U7dHX48N6dJbbnC31VvJwPV66sZKtMfLEzH5wfu+xYxibKn64BStrSVfQzQ6fThRR3PDAvUG1a3/0a2w4VhZj5gsV92IUSxbbsZOYQi7be5O2/xVYeOsSfF4EyruWP2mUxxTKVMHIDgMCn/u5OEkQ4ZmNCLfj+gQKWp7r+lT8/Na1yux6N5cOUKHUB2XPwZXI1X2cMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCjhvhQeWLTKE7ucXbp+AwYN9GScAyicPVw/L8OSrEY=;
 b=JKHoGJLD8HUkdDIBldahwyia1XJetPhUU9GmPkMCx18RfIV+pvS+URABHzl3gfXjY0IVz1m8FX3nHOi1rjxXxJqZt7kxUZTURdjCaF1fK1BC+VBsBFj6cWO5hVP33FykUjYED2ZxdVJgUO+GZgFA8+h+grtSY2yyC/B2Sg4YWaPZhmZX4se5KZuNLzcMijK48oGZwl5ILOwVLfZ55fEMHeDku4xorW1gXDIIpu1dJHDr/yFbuZ/5LozhuQdlk1NytPTHCue3x1UEIMN/XtImSx0VX4xZXiMUf+jXeGqPYchke6Q1Oo8vOxrmtvQWYgyPh1FwvC3mVM44jjYPnZPbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCjhvhQeWLTKE7ucXbp+AwYN9GScAyicPVw/L8OSrEY=;
 b=nSleHD2ycFd4+mL2Ff66xWgt7wvSf9ZhaC/nWE+Hp/mwu0OjXbwDvkeJBGM2dlIQpwJbvrtRxBPFJXv1k4yhVOnYerR4SXEeWU2go1Ed9suiasw33tQKe99ivz8XpBSYrgok1HlHqsYof8NBPBRQfYjR6CdjX+14vg/hZEl/up8=
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
Subject: [PATCH v4 3/7] iommu/arm: Add iommu_dt_xlate()
Date: Tue, 6 Jun 2023 23:02:16 -0400
Message-ID: <20230607030220.22698-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607030220.22698-1-stewart.hildebrand@amd.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT066:EE_|SA1PR12MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a031bd7-e07a-435a-f8a6-08db67042ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kTYd6IvCdjHxaL/hRo+VRTS28aPrqQ6MplLR5RlMMlUNqk1nA7mocbSXE7U45BDn4gZ3iNACdqyg0dxJAGmOG6ET64TcKmU8ItaUvy/VHOuGdtopc0sjlsGmUUSnF9HknbA3uhCasoBJkq3xCXI8EAfr/qefevZZgBC2DrAnGuAmU2cr6AEGdYyc11HSg6LLO5h/NmQVpGDKnDRo2v3ue7rIgHMV+fR9G19iQjx9UpnuWGwrlQdWkerDoqPy76OuZgmtLkwywqDQhb6u8s6N9F0TRQB/yw+VZfYYxG9dxw2gPLyy0HFGG1fOyZwwcMC+E5fwf0HtHl8EODlEEFpsNcEQ7mNjQvV+arHLyp3YLgXYZ8TUSaruAVfxrS9ujeWyKbUrSDxJJHEDKaymxId1KU/Fisr80F2nOTWGtziFQ5tx+sglExPj+SFzrOJ3nMkPnLLBK95woqO4xDl5Lhi3AMV+0lpAJBotRYCe4oMHiaEhfo4ftR8rSY3QTwacE8CHGAsBpJ+GKSOXXSFg2Vqd69io+2jaiHzWck9QF+pjXXz2ElNW0Uv9CuXX5SESu5IJgyTY+pmfd/+l/j7Xym2MJgnGyNLjrw5bWWOlsLM5rWxwgaHqMd7PkG6ongTi5jyq6INXqaiLxmsd+JJ0Homo7VyvpMthBOZs/FcDKndPzf1dytI6U2gjbL7NrmySZsPTATfDW+0eBIvkBbot1NA8xYEtUH6CPrMbr31FBGw4pkf485TFUjIuzQN9Nb7Vvl7F
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(36756003)(54906003)(82310400005)(2906002)(40460700003)(478600001)(8936002)(86362001)(41300700001)(5660300002)(8676002)(82740400003)(316002)(44832011)(81166007)(356005)(4326008)(70206006)(6916009)(70586007)(83380400001)(40480700001)(47076005)(1076003)(26005)(2616005)(186003)(36860700001)(426003)(336012)(966005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 03:06:21.2153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a031bd7-e07a-435a-f8a6-08db67042ba1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Move code for processing DT IOMMU specifier to a separate helper.
This helper will be re-used for adding PCI devices by the subsequent
patches as we will need exact the same actions for processing
DT PCI-IOMMU specifier.

While at it introduce NO_IOMMU to avoid magic "1".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* make dt_phandle_args *iommu_spec const
* move !ops->add_device check to helper

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
 xen/drivers/passthrough/device_tree.c | 47 ++++++++++++++++++---------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index c60e78eaf556..ff9e66ebf92a 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -127,15 +127,42 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+/* This correlation must not be altered */
+#define NO_IOMMU    1
+
+static int iommu_dt_xlate(struct device *dev,
+                          const struct dt_phandle_args *iommu_spec)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    int rc;
+
+    if ( !ops->dt_xlate )
+        return -EINVAL;
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
@@ -163,22 +190,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
          * The driver which supports generic IOMMU DT bindings must have
          * these callback implemented.
          */
-        if ( !ops->add_device || !ops->dt_xlate )
+        if ( !ops->add_device )
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


