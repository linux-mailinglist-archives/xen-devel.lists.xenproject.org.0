Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16677A76C90
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 19:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932874.1334939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzIx4-00036E-3o; Mon, 31 Mar 2025 17:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932874.1334939; Mon, 31 Mar 2025 17:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzIx4-00033B-17; Mon, 31 Mar 2025 17:29:34 +0000
Received: by outflank-mailman (input) for mailman id 932874;
 Mon, 31 Mar 2025 17:29:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLSd=WS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzIx1-000335-MI
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 17:29:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2418::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0c270b6-0e55-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 19:29:26 +0200 (CEST)
Received: from CH0P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::7)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 17:29:20 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::a4) by CH0P221CA0003.outlook.office365.com
 (2603:10b6:610:11c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.39 via Frontend Transport; Mon,
 31 Mar 2025 17:29:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 31 Mar 2025 17:29:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 12:29:19 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 31 Mar 2025 12:29:19 -0500
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
X-Inumbo-ID: b0c270b6-0e55-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qt+EufALWn6OX0zOVMkVFBCK4+bdqODBhGUKz9oFnRsAmQ8azv+NsMZ0u+LUVF6Hegc6Ui400J52HdRJL86WD9he6uDKNPAVMi8O7dgdUGwRBhzhibvleDMjxt06H7On0rnnI6YVSfNbSWAO/O56Qy4nhwJTZMky7qtAsljriyyYigMgmRyIm7ZzGsHvBCWwLWVPFDckS0c8oaCu4rCxje7iUzibPVnERQ9/hWd3dhGLHzir88eemgShQjL7sT2w/3YqStM1i8qRdeaDxKA7SbLcYQBWEWZBX1ji4iMc0zOKF1oivH63f1j/xQ9QsJmFFUQgSwrZ3PdiCdIQcGKzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lL0Jbs5VXhS7/v5txesVAgBEq43pyq8eEgFTJqznXk=;
 b=YnHbROAT65c4uoGz8JsF5Xvvd4zNgxawjaeRiTuNfK3RB4ufD0vqM5rnZ39lHIwb7hiUu/O18sgiXDPaMQnM6X/ZUzzTZBJt5k60n/7UYATPYumizTf1VdIfmwvUmaSUw5Ri2ENZlZWGb1m/7rDFJRitCpKzeNTVIRwV5GwMLG7kujNnG9Z1EvAPHnQ4ERdmSoxsdTLe7o6jw+vyhWF8UNST62MuqkfnoqbwJDaUsFfh4tnMMwFfz+4bfAnVIKEEPdo8XmIU5OQI6D7JCv7XAtDniEm7/uZ6hMFdKVGLQ52iPdAkcNQXevSCmARSmdv/ifqpBInujPOJ9EZkrvtn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lL0Jbs5VXhS7/v5txesVAgBEq43pyq8eEgFTJqznXk=;
 b=UA2hDYegSVYgyA+M9sWU+T80KLXKj0K1RoAjiQ9Og2GUbDVl4XAiJJpbEDbSVlDNDJFwM7s/yGTw5HOvx8DYIjlxU1W91X18KNnO/jzPH6DiP1pZ8xxz/zvn2qfm0a6kfUZzJelX7aRYKNNHMrM9b21BS18iSswlU13qndDeiCU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Penny Zheng <penny.zheng@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] xen: Change xen-acpi-processor dom0 dependency
Date: Mon, 31 Mar 2025 13:29:12 -0400
Message-ID: <20250331172913.51240-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b15ecf-d049-4bf8-535a-08dd7079920c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Blz5XQYtI0t6poep2IZ38dsMrZei/gWHtR+5lv6duuqxFrowys4sFiqDUfdR?=
 =?us-ascii?Q?SY28JWtv4JeQ+k9tsMprJfRIoVyKzvPV0OMkOMzMxeGTNn4m8Twdf9pl/E4Y?=
 =?us-ascii?Q?hbsUbEmMuP5xGM1B8PE0p6omLv1SNDTFhIbJmtWP49CPdpm3zbypZEAXF8j4?=
 =?us-ascii?Q?BpA5C87I1apq4Hb5lWWvCZMhSM5dpL7/V0oxclq3SKuehGrvhtctMrBRgaCb?=
 =?us-ascii?Q?qAUGK+e6fvuGD6982rTKw4JYSXUHf9iyIk4NPA/TXPG+lDf3N9YGbZIvEgZW?=
 =?us-ascii?Q?orMnzKqTVjVzxFoZ8gFiElQwEy0/Ktco/82E0WXl6br2J3eogGcB7D+UHtnx?=
 =?us-ascii?Q?0V/qwpcwrBT7SB+PNKdLQ0smTfMGig81uuqLxdxiDULIhtKS1W/PDrWgcgZu?=
 =?us-ascii?Q?ZYGAgiBOfQPyYo1IhlNtEJaZePQ8/wXOq/a/8ULyFP7VR+4t3HDx6Rg08POH?=
 =?us-ascii?Q?RV9mjjg8Q7UCrhSAuR1DYVrf7TVIeB9LmarBl71FMWJLUZ6ubww4jUaeW6j5?=
 =?us-ascii?Q?JRo3oqouOAu9e41H/7MOHYNBvZyTDvPUNdY8vm3oDRfBQ43Bx815BQpe7OeE?=
 =?us-ascii?Q?wx308yryAIHZwZLpS3Q9eeURSUP+hRlRYZxDwz0YSqu6wZP0Xb1ksr0gDGvI?=
 =?us-ascii?Q?3eWQo9H9eqxBvZfJ+HYo8QD8KXwpwp6/8ESRfKUzI21K0YkVY1FJqLMDRB9w?=
 =?us-ascii?Q?LttlyIe5/oK7cNjlS6NLWY+pixQddqBiDeG0yhYccYL8h/QfgxsRd6uu6d3z?=
 =?us-ascii?Q?6QZ9ZTsWjB+e/BXntZDb/7k4z1JvroITTwJgyV7lgjx2qJfWm3m1UMTcBNZZ?=
 =?us-ascii?Q?2L8d55LrYsVG1ziM5s7j+ajxyRS384Fe1ijksR0GrPwbNmamDK1r2BsqreL4?=
 =?us-ascii?Q?zYOdOFhn2VAb0gTkIrovaxTMPHPsKcR3rEiAT0DYk3O/cKuQ7CTgUHLOaVfg?=
 =?us-ascii?Q?cVIhu/yA+ccWieaHwyCwIQOq6i5kuYBo6Yil8G6levGa6f41vRYPo67t9VkC?=
 =?us-ascii?Q?PgAO+OC6/xi5GPR9B4Tru4WQg6dqBqapNEnL1VZZkmvs8c28iO3/xVNMEIIo?=
 =?us-ascii?Q?sakvqOTxkGMml3A95k1uZClKFBQx6SSb7evgwlDQ/VLZVSVFIFApgro1un6e?=
 =?us-ascii?Q?gTUigXFtWjep/rZcXejzyeljdm2qYFXSNzdo2ukcO2mj+kxnZX8FD32RLEvk?=
 =?us-ascii?Q?I+dmMFpg4wQRTK3idEotPk0vT6FjPWy3mw+LtQkfsAXCEjSQd6ZwJhxjBvl+?=
 =?us-ascii?Q?NonzGqLr8YnaA1CsYlU2De67f4KBapw7seTpp5hkQPDzZujrgxU7jZnmJudH?=
 =?us-ascii?Q?O+aiAwV0xEeTZ7f6Cm+xnAVqiXyHG+NcDYnmH8BdUAIvH/kHl5IRGk+9SVTX?=
 =?us-ascii?Q?GRV/diGaYdm9lDfMx/wDfTkGs1hOtEKKmE3+ZZTsv9oj2Ocq94FhVE0usv9h?=
 =?us-ascii?Q?z6JHQCeixDCTP5t2RHAKZHnY+TcL7ccr522uCjau5uDVPB23HPrMmSNHqYbR?=
 =?us-ascii?Q?o3ldW74iemjyFGQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 17:29:19.9488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b15ecf-d049-4bf8-535a-08dd7079920c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288

xen-acpi-processor functions under a PVH dom0 with only a
xen_initial_domain() runtime check.  Change the Kconfig dependency from
PV dom0 to generic dom0 to reflect that.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 drivers/xen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index f7d6f47971fd..24f485827e03 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -278,7 +278,7 @@ config XEN_PRIVCMD_EVENTFD
 
 config XEN_ACPI_PROCESSOR
 	tristate "Xen ACPI processor"
-	depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
+	depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
 	default m
 	help
 	  This ACPI processor uploads Power Management information to the Xen
-- 
2.49.0


