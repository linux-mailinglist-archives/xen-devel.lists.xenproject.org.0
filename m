Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9DD6DE491
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519778.806814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUQ-0006lw-Ph; Tue, 11 Apr 2023 19:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519778.806814; Tue, 11 Apr 2023 19:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUQ-0006dJ-3r; Tue, 11 Apr 2023 19:17:14 +0000
Received: by outflank-mailman (input) for mailman id 519778;
 Tue, 11 Apr 2023 19:17:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUN-0004DR-58
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:11 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73919cc7-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:09 +0200 (CEST)
Received: from BN9PR03CA0142.namprd03.prod.outlook.com (2603:10b6:408:fe::27)
 by DM4PR12MB7526.namprd12.prod.outlook.com (2603:10b6:8:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Tue, 11 Apr
 2023 19:17:05 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::a2) by BN9PR03CA0142.outlook.office365.com
 (2603:10b6:408:fe::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.22 via Frontend Transport; Tue, 11 Apr 2023 19:17:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:02 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:01 -0500
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
X-Inumbo-ID: 73919cc7-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvRZFbWVxaHzD4dC4eg10s+JGeIh41RGjpq+bd3XY0t9hcciIFmAIf/xunvaYze63VcqaP8lDQIBoG0ArOGN3q0ezmZKBrhNS2VJPfRvLgWOtBxvXk3wP/Y5hb2gRua+HQqpFQyZBbhT3GPys5oZctzZiNmO07UsUtWReK6Cg2TnoZSShhAhjMNYMANyre5ctqTUhJ168r8N2bb4rLzUQpDH5ymPpE4a5xQlb6SGLgwEOJ48CAgd5flxzlaA7xH6uelUGpzk4lPdrhLlBwtJRfy529sag0IAv2JGcwAaMlK8rPanjPldyLK9auTZUvD4AY9kEDEfTcPAtisaOwrzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLWShZkghSoju5aCTSrHjPTktEFI3gdZrQ2ShX60hx0=;
 b=KxsI1IgHe4kyjJTYgsFZFWdpdnVOjddPLs48Hx2uUh+5zs2jS8/T0oe6xPIASt4IeeHSuiDMdecDtOM2c7WT0UFmNL2oWFvv3Ifeptc6jTvcwgO7xzganDpzZ3AKixd0P+QFPSA8SQ5lvbGx0E5bM3eQ6c5kZZvKd1mhKIdHtOp1utdCrQjJDiLbtRVo/tw8/cfAQAm9l7W+Nj+aiee3nWIK4QxyTi0SOcGq5aXtKKn3rjqDqpIrtT2tZECCubVI5sByrivWKtBTUXFTBWcJFerV0eQF8yZGMvGwmBdH3hx6kc80uQLYkaQp1XyV12Inde5nQdIAuMlDKkvw42GQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLWShZkghSoju5aCTSrHjPTktEFI3gdZrQ2ShX60hx0=;
 b=NWggMp+NbZSoS74+iEW/lnwNxS/0+U45dx/xyGra3jRZCZ/dfkfv8fv3DPfx3rxJ7FZc8iSwFmlouf7C98Zy+LTDNBg0U7IISXWuutersEy7dJTx5zPfo0BU9grO+Uy/1sa/8XNWxNOd/BoFskPRKMLnF063zd0vUd3Kc6RMoNs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH v5 10/17] xen/iommu: Introduce iommu_remove_dt_device()
Date: Tue, 11 Apr 2023 12:16:11 -0700
Message-ID: <20230411191636.26926-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|DM4PR12MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: e678d25e-8dd0-4fed-c468-08db3ac15646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4SMf3AeZxBcqMh+wCIuBWx4KpJmrSvC3Q6Fd/cdWCkn2sVjgyyZjynVpyRRCVplD4p7cX1bmJX8PzrHIYXpPfTZBmYKZFLRIbVNsdcPSiwHAsvtxVPdMUM3rYt0uBAwi3CbZQtanTiEDypOO3bHozVcvs9edN4GDqQayKQwrdlpZwqTUM7Dn3xGqLlQjth+k/NrdL3/fDAT75zeiPZn8Jrrw1aU29UNz+QImHUOTkkhEa2r0uyHUvWdT59Z1M/kyzQwOOJyqOGY4pbrxq6ZMYFAzX7k03In/TlaL+uXrLnDZnZ82Xxbw+g/mtEHlci2wm4JJNySUal8bPXdhEiLRZVDNqiA28f5E3FCAKaTbohv+nRaWhpKe8E3tTKFTC1KAFtngaI+KOaUHNdYMqtmeErZCaWnzMeWVTWhD81JubVi20aQviby1gBWMXZ/YVTAlSn2+ghFDMRKzziSt/jLbRI0sdUpQxNtpe6VHYWGTXv6FTuDmejueMdxSLoobwU01xwNiRaAgBSvoNF3kSyxmrWV3CX/sXLvkFqDPZ7g/uX4vjREiVIhb9XJb8XMnMNyWqNK+Zf4tCGCRxenOxYvbIlc/2jKxVc4sw/ojHVzauZE11kuFcpV1MVUZB7L8aigy5lElgLw7MIX696Bg9wmTK9ASSE9XBvuEaUsBOS8eGAgK1d6KhQJg2qzZqbpOVRPGpAsIA4UWS08+78bJnaCz4M6SNCLP5vfAGm5WdPlqAho=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199021)(40470700004)(36840700001)(46966006)(478600001)(40480700001)(47076005)(36756003)(83380400001)(86362001)(40460700003)(81166007)(356005)(82740400003)(426003)(2616005)(2906002)(316002)(1076003)(336012)(36860700001)(54906003)(44832011)(26005)(186003)(8676002)(8936002)(6666004)(6916009)(82310400005)(41300700001)(5660300002)(70586007)(4326008)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:05.3322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e678d25e-8dd0-4fed-c468-08db3ac15646
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7526

Remove master device from the IOMMU. This will be helpful when removing the
overlay nodes using dynamic programming during run time.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/drivers/passthrough/device_tree.c | 38 +++++++++++++++++++++++++++
 xen/include/xen/iommu.h               |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 457df333a0..a77a217f3d 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -126,6 +126,44 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+int iommu_remove_dt_device(struct dt_device_node *np)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct device *dev = dt_to_dev(np);
+    int rc;
+
+    if ( !ops )
+        return -EOPNOTSUPP;
+
+    spin_lock(&dtdevs_lock);
+
+    if ( iommu_dt_device_is_assigned_locked(np) )
+    {
+        rc = -EBUSY;
+        goto fail;
+    }
+
+    /*
+     * The driver which supports generic IOMMU DT bindings must have
+     * these callback implemented.
+     */
+    if ( !ops->remove_device )
+    {
+        rc = -EOPNOTSUPP;
+        goto fail;
+    }
+
+    /* Remove master device from the IOMMU if latter is present and available. */
+    rc = ops->remove_device(0, dev);
+
+    if ( !rc )
+        iommu_fwspec_free(dev);
+
+fail:
+    spin_unlock(&dtdevs_lock);
+    return rc;
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 405db59971..079c06321e 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -218,6 +218,8 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev);
 int iommu_dt_domain_init(struct domain *d);
 int iommu_release_dt_devices(struct domain *d);
 
+int iommu_remove_dt_device(struct dt_device_node *np);
+
 /*
  * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
  *
-- 
2.17.1


