Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF12C91DE5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 12:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174765.1499714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOwyf-0002qq-LD; Fri, 28 Nov 2025 11:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174765.1499714; Fri, 28 Nov 2025 11:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOwyf-0002nI-Ht; Fri, 28 Nov 2025 11:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1174765;
 Fri, 28 Nov 2025 11:49:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V56+=6E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vOwye-0002nC-5L
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 11:49:28 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 491285d6-cc50-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 12:49:25 +0100 (CET)
Received: from MN2PR14CA0005.namprd14.prod.outlook.com (2603:10b6:208:23e::10)
 by DS0PR12MB6535.namprd12.prod.outlook.com (2603:10b6:8:c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 11:49:21 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::49) by MN2PR14CA0005.outlook.office365.com
 (2603:10b6:208:23e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.16 via Frontend Transport; Fri,
 28 Nov 2025 11:49:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Fri, 28 Nov 2025 11:49:21 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 28 Nov
 2025 05:49:21 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 28 Nov
 2025 03:49:20 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Fri, 28 Nov 2025 03:49:19 -0800
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
X-Inumbo-ID: 491285d6-cc50-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hf+7d+TvEN0eSvg6UpIS5sYE3a07VtZzRF7Cg+C8eVoh1/nlc2LblnqJAINxfGdXicB6Fw0NP7TT3iUTIqD61Zlbar6fvG3C/CoDvrFLdDsbrHynY1dBs1iqAVqvJGfFYSSRDnNYpKizBRVPUPr/Od5F3v+93Ea0cWMi+rWNw6/+9fqeB9Yjk9GgNRV94Y0PQq2HEmKM/LG1cMjS7e78HKCdbVIx3GfvsudUa7YIfN53yMTlNMLMIP9TuOd7XEhar61AAmmpMKFMN5Jl2F0YT+1WJdXk7Yf1VbxbDokw3q+6g6w4RcaTVzS70tPbrCtg7lAcvmE5lIN6y7yuHuzOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7T5H5Uw0hjRawz8UVBaPi04epuA6iAg/M0PYTneaK7c=;
 b=Ra6DtEKFJRPes6wS+GL5fXXrTCuUgH2+BN8LsL9MtYK+ZNwO6D1movwsh8kn4jGSn5h3UB18dDiij68Jq8bDgUylVZ7bGPFE7L8wnkAdLreYKl3hR5Q4zUNOWWP6j21/AvVHPk/lg0mx3i8+B5H88173XlCbZ+f5ZQlqJ7Dfk5Uv9mzjPfXy0kWVgtLnQpwL/Dk/Ik+rbQCTdCSa3grQ3sVVH3hOWEEUvF5TT3AmPRbKnf9XG3iwpTvbu7AOkj+eIxqHA7MDYqb2gJ4mrkNHgDEFpJL6FnkiHUj6aUGBU0dX4Ut0ady/GCN3MAZiNKqfJchNhgtH3hqJoTvafmCfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T5H5Uw0hjRawz8UVBaPi04epuA6iAg/M0PYTneaK7c=;
 b=U3texBAun8mJyceGowQdA8i99+KNI7Dvj6hQzsTUSQ472OW1Gcib7U0VxeRics5R0qQhqVMUP4AMi12WBDYEmqPPWZPFklj5szzcetxgh1G4TpYWsZ7Un9+QUJ8jO0LgozGBReVSMyWXYYBqeQCC3lX/YYg4PIU6DGvvAjmtzA0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] vgic-v3: Ignore writes to ISACTIVER{nE}N when eSPI is not used
Date: Fri, 28 Nov 2025 12:49:13 +0100
Message-ID: <20251128114913.36244-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|DS0PR12MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed3700e-27f2-4374-7b63-08de2e742b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G0wuOYE+uJqazraKMr/xlvVw0RMxqTDJPzCkExC9BRiG9pS9qfU7ca8sqz0g?=
 =?us-ascii?Q?BDNoS4O7jjyV88sYG6od9L+p8Yvm3aIdCsGrqQ3eelY1W8gsckH/3KskfiPD?=
 =?us-ascii?Q?Uuf+GHn2GgRZU8VwPdtZ8eP9Uzk9aIvmliR3ybUYrp6r++LO5WN2msRE2tAi?=
 =?us-ascii?Q?eiM9qN0MO8D1CfH2GVOu3oBPmTtwlThJ5CcAVjPwW/Stp319Hb6JG/YmFJO7?=
 =?us-ascii?Q?291MleFEov5VFJ35Uv8fIV+RWXNYblNIUIu5TaRYwjie6JmyQxV6o3tlnnoj?=
 =?us-ascii?Q?2FMl92v+mEbv3QVzzPrtYSBSXiNMUuKIFALCOsu6/821kbU69jKmKPU3GC2n?=
 =?us-ascii?Q?MEPsjP0WEyd5k7MxrrIiyGsJUpWbRePuJ868iC9obKPiAw9y1VA1Yyqx7/EW?=
 =?us-ascii?Q?uUtlZZrDxYNSM/44Rci0sH1bfr643sEGQICGGHgG28PnrP355XvXnQmu0Pnq?=
 =?us-ascii?Q?AxjbM0GouG2ptH4YHH+GO3Hewucw8Ubc8gfpB6Xt7gg0MDBEK1YnIyWRPUkm?=
 =?us-ascii?Q?BTm5fPgJVNkAdzMIzNypHlPsqxxSHJKf4Dxtcq2SsjkW26jIAc/oejyojdTF?=
 =?us-ascii?Q?vF/h+eFdUYtaUbKFigGG72rTCzaKLdBHCWefbkZDMdISs/a3JB/55Ocxibtz?=
 =?us-ascii?Q?s50J6yY92KpTF7nT9pfdUNsUJ2wonJFek6dhvKtzMz2TOOlor0xdbeCgh8NF?=
 =?us-ascii?Q?AOPvgySWhObi+x2bqO31+92H090bBnGK9VlzQ4UNvAoH+wTDYYJH9YvJ+2rh?=
 =?us-ascii?Q?30Q9juwZyOCNF4cs+yOXCXH5xNr8LpVNqsYI4EU4kuYpvUYHhxC1kaA6yvsE?=
 =?us-ascii?Q?5vKYoonB6E6XH8uMlppfSRFE14argqXtvP/amD7sD6PeZNzkbiLkgHHJ6k+b?=
 =?us-ascii?Q?NxtmP5ZDEIJ/5ymojWDT1SWxIeJbvW8IOlEmov4AyDjo4kkp+LAa9CmdOkD0?=
 =?us-ascii?Q?ndcCbbQiTahPQEGAOOT0rq8A56hFRA5ua4c6KBzwkNq+wrFt/prsLsozAlaM?=
 =?us-ascii?Q?kIHcw/Oz83XQtntggFw86bKKrvGO+t8ckIRW08zzUOoa0CwtiR8Akmu8zn41?=
 =?us-ascii?Q?7huvykNO16Wguj+z1e5y0T0VSo1rCPAe9Ake7W1+/zgNTRfzRwKRF9NnEiZc?=
 =?us-ascii?Q?vbsEfRAh+D78/4d4+l3J8DfhgkQ7yay4DO7zGeZFNM/kmbf24rgU3NR96EaA?=
 =?us-ascii?Q?15zVrwk5m3C7VSailKgkj510zO0fSli5uq0KVxzQq0snUADzb/coNrA5eVaq?=
 =?us-ascii?Q?3ssWkDxxlQ3ccUb1Mye5MpoUW4ebSz23uOh0kvYvWv21Be2qmgyFQaN9FDGW?=
 =?us-ascii?Q?i8dsM2ADDayG7MTJcKcMJJ4iuFJwiEdlPYegYVrqNQn53HmUynb2SllLtapC?=
 =?us-ascii?Q?YIcM3rLAgOOh3DChm5QAQQud/mgb9rzUFjRMqCfPT1UMiFf3hqMEPwwErpjc?=
 =?us-ascii?Q?ndXRq7bixr1Jm9w0356Qqgmb9qePg67pVsX82wIGfHo2nmse/2u2zx3Jq20s?=
 =?us-ascii?Q?1anBdLpvavyoE0zOdRioHnnwIYY7dOlNl2ltH1FxafCH5dKELeUAOBSCcw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 11:49:21.3929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed3700e-27f2-4374-7b63-08de2e742b84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6535

Prior to introducing GICv3 eSPI support, writes to these registers were
ignored. Now the behavior is changed and we inject fault to the guests.
According to documentation, eSPI registers are treated as RES0, when
GICD_TYPER.ESPI is 0 (this would be the case when CONFIG_GICV3_ESPI=n or
nr_espis is 0). Restore the previous behavior by checking whether eSPI
is in use or not.

Fixes: 93eecb2c4b88 ("xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - only ignore when eSPI is not in use
---
 xen/arch/arm/vgic-v3.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 8b1c8eef8024..77aab5c3c293 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -884,9 +884,18 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
                    "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER%d\n",
                    v, name, r, reg - GICD_ISACTIVER);
         else
+        {
+#ifdef CONFIG_GICV3_ESPI
+            if ( !v->domain->arch.vgic.nr_espis )
+                goto write_ignore;
+
             printk(XENLOG_G_ERR
                    "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER%dE\n",
                    v, name, r, reg - GICD_ISACTIVERnE);
+#else
+            goto write_ignore;
+#endif
+        }
         return 0;
 
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
-- 
2.43.0


