Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905AC781606
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586698.918009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qE-0003hI-6C; Sat, 19 Aug 2023 00:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586698.918009; Sat, 19 Aug 2023 00:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qD-0003ZH-PF; Sat, 19 Aug 2023 00:29:21 +0000
Received: by outflank-mailman (input) for mailman id 586698;
 Sat, 19 Aug 2023 00:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9qA-0001hl-IK
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:18 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d907e7c-3e27-11ee-9b0c-b553b5be7939;
 Sat, 19 Aug 2023 02:29:16 +0200 (CEST)
Received: from DS7PR03CA0188.namprd03.prod.outlook.com (2603:10b6:5:3b6::13)
 by IA1PR12MB7542.namprd12.prod.outlook.com (2603:10b6:208:42e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Sat, 19 Aug
 2023 00:29:12 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::e4) by DS7PR03CA0188.outlook.office365.com
 (2603:10b6:5:3b6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:12 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 17:29:11 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:11 -0500
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
X-Inumbo-ID: 6d907e7c-3e27-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCoQ8wtHCHwHDrtwLz6Y+9J7/j7DVniT05wPorWsLHb5Q0FRLldPqFYYkngeNX4sc2wqY+TmykMGcIeF1a1gHKtw0EtWCHt/QIVvWf6AsaqhgeSZENbBR6bLGIJC7SOEhUIyfIKIW7/jKfK6fxpgqimZs+DC6r/NfBIgXGVnbViPo7D9grcxVImGLttq5Ydfa3iPS2DH/YTapJTK3Ag8leo+YEsVvid+rjRJyZEhgxMmzgc5aeDlRPGqG2GndZSmeWyVCcyyq5HWpX2mT4Q/qsBZh50FrtFXjulwCOLS19Hb6ILBikzkql0Tqxh7fV/w+BeSMgp5dqR5WD3E4Preng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKa7svLG+XqwpbOJFC3IlsmtdaRP7xcFFG8yBKHlK2o=;
 b=lYqbKxBkBS+DAixYE4eEHDruUCrR02Hm/uTQ05vT9FpQKqFAWB6GvHp7VS1oQ++JL81ix0spO+O3oPQQap5XTVM5HoUfD6nlj9bWs3U+tgW5oubWw1UPKcPrpvHze4vil/m0MOrnYS85hoHvf6SMV6V/S7knjc3bXLuNInjNIQPJ6l0CB4r4ZCJcIwNz92IXhZ3dnA9vM4RglcID9kbquswJZgMF0UTcOfF2klua3shcKVoJb1aGKsHVA9+MmlMrZTp5XaA1CsAk/7QE666M3oDMHDZihNyB3pa/PDNBE8aNKXwOaMn8GS13sl+iVC/vbWoCGHgba6goGQaeEsWXrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKa7svLG+XqwpbOJFC3IlsmtdaRP7xcFFG8yBKHlK2o=;
 b=U9NcNRMhl86OcEMA3RqVLMan6V+BtoR7UpMgM0HILXOir9puCbtwpApaiIScVrDkUv0y8BQPCBxXOLD/BJasfN+3TsPVlnv0PDRc+OWjGmBZQla29wEJL4L8TH+6Nx3CBJsoxmvK4lFqDW7fwTntKq/UiCmtNU3cMTox02epOK4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v9 10/19] xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
Date: Fri, 18 Aug 2023 17:28:41 -0700
Message-ID: <20230819002850.32349-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|IA1PR12MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c7d478-d756-4786-a1df-08dba04b4fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dIy40HH0PFF1pcle0LDbxiEmxIQAakVosjp4cYAzGPlPTJgg912CwJDHQuyFj2i04off41lEhDaG8bTdISQO5/BMbv0UsCnHB9k5hu8cAwdevw0mtXOEV0nKwtDemuFFE5PEuP4VFpTdfJYmhbKOe+RzFkysmgqN2Wh3saH2oMI6P+2FVwUjRW2HmZrU+RQt9uWF0ZZ0lH4yIZJeQNp20OBsSbeLRg5XctQ9HqIkv+mOq7hqKbQ1n6gHn0Wy2MFZP/tZ5gTtOS0EXMugSqwYOpx8pAbjcT3YACGvDpD6kgj/G4w0U5noyk/qeXLQEjUxxejwySVyLmc4rbC2M8hw1I1p/PqZ9fsYaUVcfs8Iuj2JoMq23/aOaO3sueSvJcE3ffNIGgzxXRT2DTQpDoRXqt10wJcggX4FIY1XTbeNGPVnHgU5fm/ZVe8q/ExJCnRorF0nl0j+pL/+mqfROGhj37q4w7qZlg9UJMd9D1XnnMY67OgbJPN14MVHI0+4RnL8qCFIYEqMICX/8LxHGLYWMYQVx7FYsVGUEKrdQzLNL9X9szljyEef5+7a/YUo5um5621Hqw75QCjOy8dOdw5Bm06ySMU/0YSX+Fn5b/pTQqu7bTgdGuc92k42yS9ZAf2TXBeHkKmbnO4Lk8ncX8PUNayHPJiiMEd0FaMsI/D8GCRut/2FWUrm/lyJBSIib7G5Xr8lBgTlce3CWRwwVKvWWTTcm0PUOBQuNLjssriSOZUPFX/K7K+lJzapCSkIHp88ECtgEwps0KoLj6PH+Ly+4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199024)(82310400011)(1800799009)(186009)(46966006)(40470700004)(36840700001)(86362001)(36756003)(82740400003)(81166007)(356005)(40480700001)(44832011)(2616005)(5660300002)(41300700001)(70586007)(6666004)(316002)(70206006)(6916009)(26005)(8676002)(8936002)(1076003)(54906003)(4326008)(40460700003)(83380400001)(478600001)(47076005)(426003)(336012)(36860700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:12.5232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c7d478-d756-4786-a1df-08dba04b4fe0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7542

Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access
to add/remove/assign/deassign.
With addition of dynamic programming feature(follow-up patches in this series),
this function can be concurrently access by pci device assign/deassign and also
by dynamic node add/remove using device tree overlays.

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
index 5796ee1f93..096ef2dd68 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -148,6 +148,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( dev_iommu_fwspec_get(dev) )
         return 0;
 
+    spin_lock(&dtdevs_lock);
+
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
      * from Linux.
@@ -160,7 +162,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
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
@@ -191,6 +196,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( rc < 0 )
         iommu_fwspec_free(dev);
 
+ fail:
+    spin_unlock(&dtdevs_lock);
     return rc;
 }
 
-- 
2.17.1


