Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9CF6508F8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 09:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465919.724726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7BzY-0001RU-8P; Mon, 19 Dec 2022 08:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465919.724726; Mon, 19 Dec 2022 08:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7BzY-0001PI-5L; Mon, 19 Dec 2022 08:59:24 +0000
Received: by outflank-mailman (input) for mailman id 465919;
 Mon, 19 Dec 2022 08:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nnJy=4R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p7BzW-0001P7-HC
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 08:59:22 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ca048d9-7f7b-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 09:59:20 +0100 (CET)
Received: from MW2PR16CA0053.namprd16.prod.outlook.com (2603:10b6:907:1::30)
 by CH3PR12MB8257.namprd12.prod.outlook.com (2603:10b6:610:121::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 08:59:17 +0000
Received: from CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::f1) by MW2PR16CA0053.outlook.office365.com
 (2603:10b6:907:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.20 via Frontend
 Transport; Mon, 19 Dec 2022 08:59:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT107.mail.protection.outlook.com (10.13.175.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.16 via Frontend Transport; Mon, 19 Dec 2022 08:59:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Dec
 2022 02:59:15 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 19 Dec 2022 02:59:08 -0600
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
X-Inumbo-ID: 6ca048d9-7f7b-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmrnXGuFdWJLoicjEVBTCcJ0oDA977J0Txr9KKN7TyEwSjRxeQJBximqapGq9ConMJWowUE9sMtx0Sx0xukfQTOr506OPEFA/x4DgzB1tbfPxGkxsyRp84/Je0iWBJ4qT86+GkhuldbM0XIJVSZEcL4aAUS8mcpcHXUT12a8ZNZahC71u2BEL4Wyl9juf7Nahw56yk61PA4X85Lzbt81ASz4MpmWqBOkmijZsQJIlrb55vJ1/cRjxMVM3tPy7ldoAieCyTWMGNxExI+p6mlMOgqTbsy3505HFiNfRjqTIpqjHXlNNA/nZIw7Rb/nKXa7nFlzokhWQQqIwHBmL0L2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdF+NHUxK3hLr/G6yAsp1AVhb123r0pdbKXawuv6InA=;
 b=kuVJX5a3jNNvNN1jCIwpqyal+hUx4ocMCNarTJijU9QJd1jID0CjtRZlvdUM4inb/o+pIh+ZV29AF5UKB5unefJ5KNHG0gum30iZwmgL2GNzf0V8uytZkp19i5R4mUFOrS18/Ufkjq2gjs3fSPuYByME81aaU0fextjp6Vpm6/nog3rd845/a1fFOxKinpqQem2/aNtxMCeaJydU/eBABCoGwZV/uiV1q08nm3woE0c8mzmowqalfeklJGoOtcOWI/Agr0Ylm0D58joEeUkDk1cwiFUazvXd6AsyrxvtsbiceOW6P/O7h1RhqE0LHYKT/4Cg1QQGcktlN6Z3E+Cd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdF+NHUxK3hLr/G6yAsp1AVhb123r0pdbKXawuv6InA=;
 b=oMPDBcidqokJEFqq8PWDln8+khimz273KRcr1ODHdDLB+hFNmc+hel/jVELx68am/jlgXB6QB9VJQPduNdylPmqAKGh+C+jtDRPEM8X20ZTCg2it7pyK5TASs9CabMWFkQ86+HqMmZwOJSMiZVC/ld0Zn6Wi2lf/w1MXhE9yrew=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Allow to set grant table related limits for dom0less domUs
Date: Mon, 19 Dec 2022 09:59:08 +0100
Message-ID: <20221219085908.13479-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT107:EE_|CH3PR12MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 3381f664-5094-44ee-eb63-08dae19f4f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JYgv8P24l+/JCMxWADnnHTGdW64XSbC8AfoQ/rWQ2/YkeiW+v9Z3Z7IBPvMNnBKrVJwXgOG52EKpFCvW9eJdCMCf/EUSvcrzTPh+RwdWxZez44mzmM+TsVfENukSeJZ7CNwdOomPH1DgRTxBZ3v7tXcvAnGIdcYbyeNLjbx0Sj0EEWm3OBi5c6233h1aifgK7OI+VYSJyBkC91Bm43LLE+7t13QfOznCu1bZphM9vHPl1PFdH4wzpT8tBr56wK8qkDqwCHwGhZSzq/pbSOY7jW98zN/ZRG3tFmJvuBre2BJWKSGRk3FB5bhabJXViMB4+h9hqpJlSn8C0oT+a5DitzMH+Y7k8Vhukf8cfi+LqDhfSUZkTR7ku5mgQ0huqDGaO1PK74vZCOChn3zhF/Z7GGlra1MndePHyn0sgGJUmTAwrTJWqvcGJTCVwGntQXyTsVBeWRgUJEIskCrLzRa2gFzylc+BgVsi2c1MJQeFuEChUccouztb1dmnY4bvOKNpKNEKbSxEkGlar9NqRSzCErK0LuStG/iJ/yz6TDgOLQbMjruro40wMMP+dbAoAi/81i/d0m9oLO53GXXv7GrTLkrHkayl743+TQgpCWWb9NDmgblwAbTyM3VU+QmmHz+3iZkmeYPp4VmmuRd+rbhjPDhRwl2o/jKKdGRgK+h/SG5U5nj9uSQUvqaxyUI1Uryc5JpDJwX1o3m1SFQty/3sv87uK+Y1tfyqjLgyrdCAgKt1IcrACgs/Z6zH9tb1ghr068dGmbXfWzBHVIQx5rEWeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(186003)(26005)(2616005)(336012)(41300700001)(1076003)(47076005)(426003)(70586007)(83380400001)(36860700001)(5660300002)(44832011)(40480700001)(86362001)(70206006)(8676002)(82310400005)(81166007)(6916009)(54906003)(36756003)(478600001)(356005)(40460700003)(4326008)(8936002)(82740400003)(2906002)(316002)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 08:59:16.7423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3381f664-5094-44ee-eb63-08dae19f4f16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8257

At the moment, for dom0less domUs, we do not have a way to specify
per domain grant table related limits (unlike when using xl), namely
max version, max number of grant frames, max number of maptrack frames.
This means that such domains always use the values specified by the Xen
command line parameters or their default values if unspecified.

In order to have more control over dom0less domUs, introduce the
following device-tree properties that can be set under domUs nodes:
 - max_grant_version to set the maximum grant table version the domain
   is allowed to use,
 - max_grant_frames to set the maximum number of grant frames the domain
   is allowed to have,
 - max_maptrack_frames to set the maximum number of grant maptrack frames
   the domain is allowed to have.

Update documentation accordingly.

Note that the values obtained from device tree are of type uint32_t,
whereas the d_cfg.max_{grant_frames,maptrack_frames} are of type int32_t.
Call panic in case of overflow. Other sanity checks are already there in
grant_table_init() resulting in panic in case of errors, therefore no
need to repeat them in create_domUs().

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - call panic in case of int32_t overflow
---
 docs/misc/arm/device-tree/booting.txt | 21 +++++++++++++++++++++
 xen/arch/arm/domain_build.c           | 18 ++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 87eaa3e25491..3879340b5e0a 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -223,6 +223,27 @@ with the following properties:
     the default size of domain P2M pool, i.e. 1MB per guest vCPU plus 4KB
     per MB of guest RAM plus 512KB for guest extended regions.
 
+- max_grant_version
+
+    Optional. A 32-bit integer specifying the maximum grant table version
+    the domain is allowed to use (valid values are 1 or 2). If this property
+    is missing, the value specified by Xen command line parameter gnttab=max-ver
+    (or its default value if unspecified, i.e. 1) is used.
+
+- max_grant_frames
+
+    Optional. A 32-bit integer specifying the maximum number of grant frames
+    the domain is allowed to have. If this property is missing, the value
+    specified by Xen command line parameter gnttab_max_frames (or its default
+    value if unspecified, i.e. 64) is used.
+
+- max_maptrack_frames
+
+    Optional. A 32-bit integer specifying the maximum number of grant maptrack
+    frames the domain is allowed to have. If this property is missing, the
+    value specified by Xen command line parameter gnttab_max_maptrack_frames
+    (or its default value if unspecified, i.e. 1024) is used.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index bef5e905a73c..829cea8de84f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3872,6 +3872,7 @@ void __init create_domUs(void)
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
         };
         unsigned int flags = 0U;
+        uint32_t val;
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
@@ -3940,6 +3941,23 @@ void __init create_domUs(void)
             d_cfg.cpupool_id = pool_id;
         }
 
+        if ( dt_property_read_u32(node, "max_grant_version", &val) )
+            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
+
+        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
+        {
+            if ( val > INT32_MAX )
+                panic("max_grant_frames (%"PRIu32") overflow\n", val);
+            d_cfg.max_grant_frames = val;
+        }
+
+        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
+        {
+            if ( val > INT32_MAX )
+                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
+            d_cfg.max_maptrack_frames = val;
+        }
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
-- 
2.25.1


