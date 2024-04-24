Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B778AFFC7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:36:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711027.1110677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQF-0004eR-Mu; Wed, 24 Apr 2024 03:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711027.1110677; Wed, 24 Apr 2024 03:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQF-0004bT-Jj; Wed, 24 Apr 2024 03:35:51 +0000
Received: by outflank-mailman (input) for mailman id 711027;
 Wed, 24 Apr 2024 03:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQE-0002In-MM
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:35:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd439ab8-01eb-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 05:35:49 +0200 (CEST)
Received: from MN2PR20CA0023.namprd20.prod.outlook.com (2603:10b6:208:e8::36)
 by DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 03:35:45 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::6f) by MN2PR20CA0023.outlook.office365.com
 (2603:10b6:208:e8::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Wed, 24 Apr 2024 03:35:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:35:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:35:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:35:44 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:35:42 -0500
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
X-Inumbo-ID: bd439ab8-01eb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7SEcH28VM54chhn+ZsVd9lyXDhMZSP3I32oAj+wbJyf2DTLyNT6Xg8xqd5J0N61cNaXYB5apZXmEW1RRzmMy7psGNJCHrFZ1NrGfSigFFJ0S7EkRQnaCvRZ7z57m9bM6hZAaIzk6bTp7pPlc0Pk4OzreyD5OzDwgIrLpIZT5nlJ+IS9rsdZLc/wA1hY6BGvL92OovlCDubUSpKEX/LRUMHYavPJTE1/aEL67pQwQ/5w5//VfTRWWCafwRC1UEh8LgV7MBeL7VVZEMblglNdXLjOw+9dsGzmeDK9CS5g4GpNMv03Fu1Rx1WZwrPw8WEovEMO7HaAZLDVBdM6HwboiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CXTiKjl6H23aWyq/JRcR1V9QG6E4fZMm3DFM6arH00=;
 b=lvTuWc7Lc86Uy4n6iQRWf/WUrROcZpwFxoGDQshC0lRv14nvYfCybpmEhMEygu1QsuLeviBV9rHQRvI29TwYwrpxuSZT2vezgqEfRZnpqkS4m/Y7rCBBEWsIYby1wdO4TkzpQUF2gDcUDnrvArSU+dpdIY5NqCJmImoMRmMg2JfoxCZDrUf6vOI33dZrHxrlDp2BiscP5Hiux1sEnNTlJ1rgC+WA8+ouCVKL+B4Zknj27iruBuM/obzpjgm+rlLBkqYezURtZ2jaBgMjnUYsXxHblbJ8LF5YLE41epEUkxMv/q49m7ha3YdvGWqAYI6i2+BiEeE1/lxnxg3C2uXkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CXTiKjl6H23aWyq/JRcR1V9QG6E4fZMm3DFM6arH00=;
 b=hsGHfvenorc/ZHnHvZ4b1z/NaDr1Kj4qYqxy2dZuhD9rBSBWgRT4vhbjz8CGXgGrBIDmBMUOkZm87PnZpfM8YrdgxQpXk90iJoYACWTydbDF8swcaYec7rUq19fmfEHnDOHU9UrZ73HfuSOO1e2vL6J6hLbClEace2/9Zu27KlY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH 05/15] tools/libs/light: Increase nr_spi to 160
Date: Wed, 24 Apr 2024 11:34:39 +0800
Message-ID: <20240424033449.168398-6-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|DM4PR12MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c0de3f-1c74-4541-3c8d-08dc640fa025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yFrNObRJOo0hw8J6RTQB8PnSnEsGOZf/E81yg9ertyGfByCuesthuFZUUzIx?=
 =?us-ascii?Q?xpkP74rYUdD+KcqtzVPKgbrYo6c1N7/qGgSMsCPLiNK88DBX00wqO0xX5BJ4?=
 =?us-ascii?Q?b4PWvIrnxls8z5mB/fhixSS83CTmCvEwgFugdeZhe709mhiFmV5Lyl3zwxTX?=
 =?us-ascii?Q?M5Rzrn8RFT2bShySZixcKpeRcXOAIn+j1QrOClXlEV1zQHwNioEZMxOTN1ZT?=
 =?us-ascii?Q?3vj5rVb7j/tVhCE3J2crTgxezqwCBtDbpWPnK8QVkho6C6saNMEDbj4yO8kp?=
 =?us-ascii?Q?wq7pZP8640d+kpmy964MTZsQKUn5SlpukNwDK4CiuEN19fVfq5fbNQEN7a20?=
 =?us-ascii?Q?EiniXv3dhRkeMz+mpyU9Gr1cHYFqPlgmDA1asZR6kpgdgQfRFNXMpHCZlAAe?=
 =?us-ascii?Q?7ujNY8sLIN1vpuWCxvtwb8lCPv+WHCVN9bDEnJRPIcJm32lG5G71xFoYQrB9?=
 =?us-ascii?Q?LAQP/YsyGzKa9lDzkZQzk01kJMlyA2GP5+TbcJd2oe457OmcPOpihfKiWwZ/?=
 =?us-ascii?Q?ufM0rEnBStrdAyb2V4kQ7GcgIMIAjFN4x5xkMpixN6/osHxuX7SnfM8bT11l?=
 =?us-ascii?Q?4S3gqeen/D6tkYaJdEjMD3Lg0exEUdCNJKSelUN4LgOF/8gax520kD09AOkO?=
 =?us-ascii?Q?XuD9jVSYxHxM45oR7KTsk1NUwtqpWK4aT78KOpjyEq/Fobg9jgewuNtpSDEP?=
 =?us-ascii?Q?gf8fT8CBcuPDoUhv3JEXohPZSqjnvE0WQ8Mp0CxJRNZgItCrpJjCiMTpcO71?=
 =?us-ascii?Q?of4LACvofRnvmd8metVBP8C7ab42Xk70SOHwMKmWjCq85bZXDUlW/Oa9DJFE?=
 =?us-ascii?Q?cgxaAZwQI131QsplAmesfZTWo5JWH+pTce8C+9gwWrDexT329axIiYp6S63K?=
 =?us-ascii?Q?onsnLZvovu+Sni+Oe5cB4Vw0r4wCTpZ+YCUzNO5TFZDKHFZr4Tyv92JTF0L3?=
 =?us-ascii?Q?V5i/t/Pw14Q+GGV7ZXpEWGHrzcSVlScHPC6gSEb4JJfRlrzzp8Y3mP3kStkb?=
 =?us-ascii?Q?IWCTo+Z/WfP76tqw24AJvEbmKgrLIyC62MY3j4f8O7vrBAdJFcm22fqcq6Rj?=
 =?us-ascii?Q?0BlUWv8czf+p1GYCVcTxmfPZYHHFVC5d1F5kr4oidgAj10zZCnlIyp6n/puy?=
 =?us-ascii?Q?Oogxjaqocn0eokZKHvNgHHdOyu1HyeqWRJaGGxKIRgMIUv2jSHz9Ix3v+Uvn?=
 =?us-ascii?Q?7d0dy+INRIzoc+ckOwJhfdRQgaR3TbzTCNXVFpw+EIFgf2zjaDEmquBxOZig?=
 =?us-ascii?Q?VSL6l8g6ZdtboRRRWozNGqSQg3wey6e6WClX7pzlACKctc+2HKffpX9zTtDV?=
 =?us-ascii?Q?DgpgE5xwHO/haexQ+mZuSc2c3QbTRiaUoQ6f5AzZ8brUxShccC9gyKYfYGXX?=
 =?us-ascii?Q?IENTlKZmOg384JCaD2Qn+t7nipBt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:35:45.3380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c0de3f-1c74-4541-3c8d-08dc640fa025
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Increase number of spi to 160 i.e. gic_number_lines() for Xilinx ZynqMP - 32.
This was done to allocate and assign IRQs to a running domain.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/libs/light/libxl_arm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index dd5c9f4917..50dbd0f2a9 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -181,7 +181,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 
     LOG(DEBUG, "Configure the domain");
 
-    config->arch.nr_spis = nr_spis;
+    /* gic_number_lines() is 192 for Xilinx ZynqMP. min nr_spis = 192 - 32. */
+    config->arch.nr_spis = MAX(nr_spis, 160);
     LOG(DEBUG, " - Allocate %u SPIs", nr_spis);
 
     switch (d_config->b_info.arch_arm.gic_version) {
-- 
2.34.1


