Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398DDA6EE58
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 12:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926312.1329181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx21b-0007f3-0w; Tue, 25 Mar 2025 11:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926312.1329181; Tue, 25 Mar 2025 11:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx21a-0007ap-Tx; Tue, 25 Mar 2025 11:00:50 +0000
Received: by outflank-mailman (input) for mailman id 926312;
 Tue, 25 Mar 2025 11:00:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDid=WM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tx21Y-0007NY-Ur
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 11:00:49 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2413::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66d6164f-0968-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 12:00:46 +0100 (CET)
Received: from BL1PR13CA0144.namprd13.prod.outlook.com (2603:10b6:208:2bb::29)
 by SN7PR12MB8604.namprd12.prod.outlook.com (2603:10b6:806:273::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 11:00:43 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::19) by BL1PR13CA0144.outlook.office365.com
 (2603:10b6:208:2bb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 11:00:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 11:00:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 06:00:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 06:00:41 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 25 Mar 2025 06:00:40 -0500
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
X-Inumbo-ID: 66d6164f-0968-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYMa+zE4CUhzlmc3VpbljfbifS5HZN1rjmT6xYYNZkpL49f804lM1Fm8IKVwP5TBklhfScS+Becx6DzBU67UJ7KaivLATej8hRxFF5VL5VQf+eKBO7qpGRHQLLoItj3pIj2aM4qo3HtM9gpkXQzsHKwhY4045EUJgxSlUVBfcAghk78Y60ZHBgANBmf1O7dJakTssIKpmu4IEaKmy/EtFXXoc+APLR4Yu2KtrsZDi8TKOMxAqMlDGEhsLKa0E2GOGGftsw/Gl/rbXH3zoltxq/fdHlph1Gv+CFVxmSxJl4dBmjdvgMUirc8JvaRiaUUjwF04wHf5KgGNpm0iWpf7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86S5Z+WAqe5zgxdXS9u7+1K2h9JvUw/muS+IXA2VOH0=;
 b=Fzy4hodzC8rtooELvmXgEecNtqvG6FMA03yvyKeM9rTsjqwJ1BwEDvG/D1DO4ssVpNgprONY/qawflZ0OMPf7MpXf7Fpxkk9PqiczZJKnzeu7dmDvptOm0IMwQjyMCBhtJhXMxqPsP8pb4WSNIjKbh8TCRD0EVmZbkoi4WvGZgr0aLnYT+izJDrSIni/10+xUWhAIyR1kfPxSIrIQWeBJP+izAVB8Ryi4AGWzTs0I+JgbMl8hHxpYaaD1BGlg4VZWFNL68gLKYtTiHCi7ufJ2LhYt416kyi3bGFGQl+9Ef2LDxWFt6ZUrsAlRdLmHh8LB7ltGXNzyWm/igAcz33ouQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86S5Z+WAqe5zgxdXS9u7+1K2h9JvUw/muS+IXA2VOH0=;
 b=mCL5iWt+//tg2p1BUIJpKv70eEYYokAw7uzpue3QOXjbo8QGuzVaTS3+IZPfyeM69sQ14zfsFJesdg3OnohLyZNiQbGzlVqIDhQSow7lhvkUXtqgG51+6pi/VaOuFcb1ByG7GORbSDexM4VcNG1x2r2PnwzAfqY7e39IS7DOi0g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v2] tools/arm: Fix nr_spis handling v2
Date: Tue, 25 Mar 2025 12:00:29 +0100
Message-ID: <20250325110029.399838-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|SN7PR12MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: 14128406-9bdf-4250-aff5-08dd6b8c494d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gZHdd4psI0vNwMMhWLiTn92QUN2FizeFrCwNfiY2y/JO3p4Sqslo5g57EWf4?=
 =?us-ascii?Q?Yylhm8a/iBcwwyNINtqg6V5T8Kj5kQ2PuLMqJ5l8nY1lS36pI2HJiFdPiZR4?=
 =?us-ascii?Q?mJeJM31b5f4Lis4ysNAtCf1CDiGJYZI3okDJzBdiLewDv6QDE4ahee+qwlMD?=
 =?us-ascii?Q?PWQsukBaYDJPxCHmyNHtAi/Ri225U4zQO7XTbuEati1pp23b8tcycP33CCzQ?=
 =?us-ascii?Q?cnnxII4zdPtMCvIMhTkvToZo5q+CqsLWNbtffzcQ5I+Rfb0i/TRQnkZRyzv/?=
 =?us-ascii?Q?ZbwCyd6WqugGWUiZ6cOHF9+3D0eOUssF3USm5ejVA/LO4W0x6cWPPn/eGkfc?=
 =?us-ascii?Q?qfro4Isd8Y2NL3tXaj71Ns4FlAeXq1Ofdg5EaK6dX2b9wKg5ALnHbubdPNqe?=
 =?us-ascii?Q?iXvlLDoucBvegYDpqhvtTMDcUmNXvzDCscamOvOJT4I+QcNF3dJkUFiF3of7?=
 =?us-ascii?Q?dPgB6m+4oWd9gAvkKXj3FMNO1WEoHbDrGDD6sSL/SmkXViBNERSVpchR8VG1?=
 =?us-ascii?Q?FKP9ZW5zChDMxHKlGYGgL4QQB+5Y/cx3JHunKb4M5gyLmiFd8x2ehFWb1wad?=
 =?us-ascii?Q?BkypUBdgZlkbgz47je6qLaCurmE+4Evu4ZV8bAUVA6dGeLJtqufKlMqfPFLh?=
 =?us-ascii?Q?N1l3anJadhPu+Nrg2IWndLI76OAZKqDH+fXWOfHAn7aeyjAS5GPHjyCoTOOU?=
 =?us-ascii?Q?sf/Ytp0614++FjKmBPbx6+INzAOJ+mR4gjeyXFVwqDAraJd0Psfok6rCxY+m?=
 =?us-ascii?Q?k2BCbJMWdtqLSv6xn/XjK9cHSdWgmbw/xAp702PcFfPsAh2VrhZTzXm0792r?=
 =?us-ascii?Q?ZFub/iAiy4BNi+Z8Mt+bply9JHff51q0+FobJ7/qKR1HJdnNtKW67S+kDdwz?=
 =?us-ascii?Q?ngWR07pDF7gatU1ixTejmNWzF8N/LY5YYSSs6AVNTLX423MrfMECA5HGQlc4?=
 =?us-ascii?Q?T22B7NCw+6JyW3ElniJbTJ/jG4c7QuHLlIIHH6BkGlPdbTceSEwWpEeSY4Pv?=
 =?us-ascii?Q?7l/ya2R1P+jIPYnatkO3Gt63xN6GXCPKSdt8y8dyceVkY3TCDzTdTsnStOGQ?=
 =?us-ascii?Q?AwYM5+743Ob1F4Fr8PZy/8zecz7fYAFIkPyleKcUGGtLpO2ADiQ/k/Op9U5F?=
 =?us-ascii?Q?CF5tMq/6/+GMdT/ZwkjxG+Sno6xuBvMFL8+9Cdw9/0Rw4AeozokSSRb27rF9?=
 =?us-ascii?Q?NHB5oH/xso0Z3YiZYRtgbb51OhGT8NnLfpknDeM7/I2LoUKCd1I+jSv5obv2?=
 =?us-ascii?Q?Dr+uVwoLpg05yhM3iQDwhmG3w66s2ed6rqPLRK8pbfIsBB0wzx8418n0eoM1?=
 =?us-ascii?Q?1twEQ9DqFXuK0eW/Pg1nVMbfgDvpPyx8BG8HxSHORqfmifXrq6VIrPQKS8V1?=
 =?us-ascii?Q?yi50/0XcSjrqDMNoJy4jE4utDiUt5wPOcKtkrmYM2v6fbKsgGRHqpeOH9ja2?=
 =?us-ascii?Q?M0JDJA73YYgijBTRX4ZIfP2UpqO46oUsc5yWUfh13eeDXEvSkMlZnpahPC+a?=
 =?us-ascii?Q?cvSmShjOJmiNJLo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 11:00:42.5587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14128406-9bdf-4250-aff5-08dd6b8c494d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8604

We are missing a way to detect whether a user provided a value for
nr_spis equal to 0 or did not provide any value (default is also 0) which
can cause issues when calculated nr_spis is > 0 and the value from domain
config is 0. Fix it by setting default value for nr_spis to newly added
LIBXL_NR_SPIS_DEFAULT i.e. UINT32_MAX (max supported nr of SPIs is 960
anyway).

Fixes: 55d62b8d4636 ("tools/arm: Reject configuration with incorrect nr_spis value")
Reported-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - add LIBXL_NR_SPIS_DEFAULT, rearrange checks
---
 tools/include/libxl.h            |  1 +
 tools/libs/light/libxl_arm.c     | 17 +++++++++++------
 tools/libs/light/libxl_types.idl |  2 +-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index f8fe4afd7dca..b7ad7735ca4c 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1579,6 +1579,7 @@ bool libxl_defbool_val(libxl_defbool db);
 
 const char *libxl_defbool_to_string(libxl_defbool b);
 
+#define LIBXL_NR_SPIS_DEFAULT (~(uint32_t)0)
 #define LIBXL_TIMER_MODE_DEFAULT -1
 #define LIBXL_MEMKB_DEFAULT ~0ULL
 
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 2d895408cac3..0adcaa373b54 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -84,7 +84,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
                                       struct xen_domctl_createdomain *config)
 {
-    uint32_t nr_spis = 0;
+    uint32_t nr_spis = 0, cfg_nr_spis = d_config->b_info.arch_arm.nr_spis;
     unsigned int i;
     uint32_t vuart_irq, virtio_irq = 0;
     bool vuart_enabled = false, virtio_enabled = false;
@@ -181,13 +181,18 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 
     LOG(DEBUG, "Configure the domain");
 
-    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
-        LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
-            nr_spis);
-        return ERROR_FAIL;
+    /* Check if a user provided a value or not */
+    if (cfg_nr_spis != LIBXL_NR_SPIS_DEFAULT) {
+        if (nr_spis > cfg_nr_spis) {
+            LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
+                nr_spis);
+            return ERROR_FAIL;
+        }
+        config->arch.nr_spis = cfg_nr_spis;
     }
+    else
+        config->arch.nr_spis = nr_spis;
 
-    config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
     LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
 
     switch (d_config->b_info.arch_arm.gic_version) {
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index bd4b8721ff19..9bb296993199 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -723,7 +723,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
                                ("sve_vl", libxl_sve_type),
-                               ("nr_spis", uint32),
+                               ("nr_spis", uint32, {'init_val': 'LIBXL_NR_SPIS_DEFAULT'}),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
-- 
2.25.1


