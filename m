Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E6F8BDD15
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 10:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717919.1120435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4G7Z-0004Hr-II; Tue, 07 May 2024 08:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717919.1120435; Tue, 07 May 2024 08:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4G7Z-0004G2-FO; Tue, 07 May 2024 08:24:21 +0000
Received: by outflank-mailman (input) for mailman id 717919;
 Tue, 07 May 2024 08:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dSAm=MK=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s4G7X-0003kv-A7
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 08:24:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 316d029e-0c4b-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 10:24:17 +0200 (CEST)
Received: from BY5PR17CA0010.namprd17.prod.outlook.com (2603:10b6:a03:1b8::23)
 by SA3PR12MB7877.namprd12.prod.outlook.com (2603:10b6:806:31b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 08:24:12 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::dc) by BY5PR17CA0010.outlook.office365.com
 (2603:10b6:a03:1b8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39 via Frontend
 Transport; Tue, 7 May 2024 08:24:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 08:24:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 03:24:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 03:24:10 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 03:24:08 -0500
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
X-Inumbo-ID: 316d029e-0c4b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cir1bWtVTDDZiusjo6Y2irTyEaA96THmEn15TBtAcvuTY5AfHv3ZGPbf57uoqAQLfYlMmFNty8QLU3WKyHDiiR+JLk1ElMELPnigFFx62AWMfbgBKO8pL0mUdZujAekwLMDz7PFKN8JaHE3igiPsOEKSQD8j3+pVbx2To8j9MAtZkJgzEqmc8a+WadKj1DoiZCJrSWFZXLrGPC0MMov4GbJdTLi81pQj7BbtSnR9OpDwfXl9Ka4DRiT3rrZJXBO7x5mH0icVXmnkwnuzoRtE0Mrnli5aeEbuNU6Oh4J3Ib5bG5UV8NrpheRPJcOzluAyvaPSrENtgH+2m+onDSsZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCoREhGdiGdJh4nqENuQ2tKLWDW2JKQq7+BvW87Gh/k=;
 b=fP0JsAyw9MdF+mZ3W/l+XokiHx7jTAavRMKbmi3KZSfcaoOhTp4+Gbr1T+XTSSEv1g94XIkndLag7PKwuibueaUERgL6SMgealrD2ptsdU+/uvUfrU4y2+NB9coIScQ7VeCW/IZkUpxqGmOa/8014q2ilC6aktMF2cgAd/d6NhibUdwRSNgkPdn5YPz2XuTQn3b6vSYbsi+IgwguIuYsV2gAJYYj0gZRtGFOpHm9fd4U6lXApK7beE2KWFV0BRbsGRZjcbxCp3iOT/x1qZt8zOwdpA9MZE107+nHkRdas3cGWk1A8FWgxXSFLbpRsFRSn/TgrXgZG2yR1/63JeaR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCoREhGdiGdJh4nqENuQ2tKLWDW2JKQq7+BvW87Gh/k=;
 b=lBmaY/qh33tdt1A44CaQYAPcL5ZpldxmpbgxVLzChrlM322DIA3OlZUI3SS9mPUX84B02i07J0wAVDzwUypaOxdgK3N4X4RrPukpRHQF+jSQSEglwPT51VKIC7MiHBxTfEbBTqt4a/hTxjfyWl0BF0E8JMKrZ+gJcnf9kaNozuM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD <anthony@xenproject.org>,
	Anthony PERARD <anthony.perard@cloud.com>
Subject: [PATCH v2 2/2] tools/xl: Correct the help information and exit code of the dt-overlay command
Date: Tue, 7 May 2024 16:24:00 +0800
Message-ID: <20240507082400.25146-3-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507082400.25146-1-xin.wang2@amd.com>
References: <20240507082400.25146-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|SA3PR12MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 1814a71d-a3d2-44dc-f6f5-08dc6e6f12b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ir3m0+WSeaR40l1L9cgqXPwAMqnGeCluPMNwBDXUx1E6V4qHocQAdjFzquYn?=
 =?us-ascii?Q?rQmjIKKGA1gt3eDZudDOqdElOIIVSqSalcKL8I5cLMJxeNes0mdm4w7ZkTFk?=
 =?us-ascii?Q?CZgen6rxde14AbC1lMYIT+uE3oCu13Q2KwsfwUU3rWBgELJH37olUoCcENT+?=
 =?us-ascii?Q?NxyVO3YqV+sX0ane9qFp4G55yo+8WOup9A4Olxi9vquZLAqPHpZOx3IG38JW?=
 =?us-ascii?Q?FtaeESnzUvjVvajOHIXCBZaaEEQGKswFfFh0/Xstkzr723kT1X3DnPb+Q6eo?=
 =?us-ascii?Q?ugC0e8SRMLwFJ5qt2d9KxSpJpkRGSQqKSTH4+mdyTRrUBnGkRc9ypI1fkdHQ?=
 =?us-ascii?Q?fXmz1nmApLStVJnGS8rLnAkxxswkjuDJUelWCSwKlk/N2tQIb15gUJLiNPXv?=
 =?us-ascii?Q?51iAl5BF8zm808KzF+IVV1xpv9R6dHwPQOWxh3hi6uYTVfIhxLu9jUOeQy7m?=
 =?us-ascii?Q?Atrl0/nlEAFAAtWNaY/4yC9GitFLzhOf2eAglGbUHIC/uaPhXahfAYCONYxP?=
 =?us-ascii?Q?b2fwU+BeBbv2BaGeuk5zr5AirtBpO1dkgwpp9LQE6lsyZrhQr5m585PagGru?=
 =?us-ascii?Q?m8vDDswuIryfK+uyEVI3hSpGu9Cyyg8KzgmDaKVAMmTPnpumFKcZ2y9mXcDR?=
 =?us-ascii?Q?1kvbYKqslbHEqAA7p8wIJ3itXnR8F/wpi2c+Th193eCG+3Jfgn1fIuRZUYon?=
 =?us-ascii?Q?7Tr51Q1EaKtiIQfkm7ZP1qvlxqGZ9CcDPphcqFhWxAhzoslbiCFx9vRMMQxk?=
 =?us-ascii?Q?mG7AbQvADZ1bEF4hC/C33EaJ93o3ZhdiQLts5UC5gR7ZH9NnIELHX14ydPeK?=
 =?us-ascii?Q?rihqApX6vU80EIQm8IPvpZay+6iIXt8MWFLK0WXy8ZytEwe+9XCAImcBeQH8?=
 =?us-ascii?Q?qmi6KEcbR2ud9+ZUKh/hi7BblFqe9lYz7H5Av/1YrSYXwX3SFIA1y+UhyCWx?=
 =?us-ascii?Q?QhMI2ZQZH5L1Fx0orKeXsQ8hEVvvZXVWreJpgtR23vUkBMVq6b/6HskLD8Se?=
 =?us-ascii?Q?SZAgduGbmBpPbVUKg/3Op1Lp+oPNEFPXKv4RP4GMDHVQf8HnYnqc7GXSzsdT?=
 =?us-ascii?Q?i3xrY5DU8JkTp7JbLNAVAabEKjOZ9H1RF+QwT1QdRKzVvU5BUqOUpREmob0O?=
 =?us-ascii?Q?NEEQg1Xzy3IjEB/8ptvivE0Y+2mRHyqQZF0Drw6keAHiIAJoWOYrTqNpExRa?=
 =?us-ascii?Q?Dfgkc3rGKRrb+WWggzyotFtoeugwtaejTOBrpuSoE7EonlwrRRS9lY7sHC+N?=
 =?us-ascii?Q?JmuyW+eAXTVZckXdfaxXo1hI3puiKW/Qi4ORQRg1g7JIASmke9Kzxhnihpnj?=
 =?us-ascii?Q?C0/M4brDdXTWPH6/bzHCOcMJ1MBUKooih+OBM0TLPPaVvZXWm6MPbLPwtzvd?=
 =?us-ascii?Q?IewL1dM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 08:24:11.2414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1814a71d-a3d2-44dc-f6f5-08dc6e6f12b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7877

Fix the name mismatch in the xl dt-overlay command, the
command name should be "dt-overlay" instead of "dt_overlay".

Fix the exit code of the dt-overlay command, use EXIT_FAILURE
instead of ERROR_FAIL.

Fixes: 61765a07e3d8 ("tools/xl: Add new xl command overlay for device tree overlay support")
Suggested-by: Anthony PERARD <anthony.perard@cloud.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- New patch
---
 tools/xl/xl_vmcontrol.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 98f6bd2e76..02575d5d36 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1278,7 +1278,7 @@ int main_dt_overlay(int argc, char **argv)
     const int overlay_remove_op = 2;
 
     if (argc < 2) {
-        help("dt_overlay");
+        help("dt-overlay");
         return EXIT_FAILURE;
     }
 
@@ -1302,11 +1302,11 @@ int main_dt_overlay(int argc, char **argv)
             fprintf(stderr, "failed to read the overlay device tree file %s\n",
                     overlay_config_file);
             free(overlay_dtb);
-            return ERROR_FAIL;
+            return EXIT_FAILURE;
         }
     } else {
         fprintf(stderr, "overlay dtbo file not provided\n");
-        return ERROR_FAIL;
+        return EXIT_FAILURE;
     }
 
     rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
-- 
2.34.1


