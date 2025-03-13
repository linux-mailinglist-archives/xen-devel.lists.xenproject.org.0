Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B89A5FF4D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 19:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913347.1319426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnMe-0004lD-UL; Thu, 13 Mar 2025 18:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913347.1319426; Thu, 13 Mar 2025 18:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnMe-0004ik-QH; Thu, 13 Mar 2025 18:33:04 +0000
Received: by outflank-mailman (input) for mailman id 913347;
 Thu, 13 Mar 2025 18:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eDg6=WA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tsnJR-0000C7-60
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 18:29:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [2a01:111:f403:2415::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22b4ff61-0039-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 19:29:44 +0100 (CET)
Received: from BYAPR01CA0012.prod.exchangelabs.com (2603:10b6:a02:80::25) by
 DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Thu, 13 Mar 2025 18:29:38 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::6) by BYAPR01CA0012.outlook.office365.com
 (2603:10b6:a02:80::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.27 via Frontend Transport; Thu,
 13 Mar 2025 18:29:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 18:29:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:29:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:29:36 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 13 Mar 2025 13:29:35 -0500
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
X-Inumbo-ID: 22b4ff61-0039-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LptdJAIaShhQV5XkImqow/lTlsRpcF0UqiNPK4p57uEwca5Qn7+lQIJW/n0ayff7Q7hNxHejnuyAeMY/5hEPH3R/3qjAbW3sJjaJLegZnAaK7ASoxi58YNnjsOFwqQPSOVQn3MUiWdcLtsrakBWRzLZBRk/6bBOXLaqEo6jtvdi347sqbyL09wkn1Znj7+mD3dVGb4dNSQFDHUY16C4Ci6jDSYscsuNm1l8vmFfkcbGI1jCi4nk9pN3JP8m01NbxG8mjHFby9drII8mBloqcoWMmHgpkerzuycNHb6/2e7ODtNYga0d7+mSX+Fdqh2zOGBTwQB5cAQUtiLSIUD8xEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIsMBIairwunP6LFA32m7d50YgQgrqBjWCm2v33/Nso=;
 b=Gy7dEoXmXxfOe8wiWZ6v1pOMTkaPbCeD86JdIvNAIjehwmf1gZ4Luz/Cbt3YtgOhikYsNqRoAYqj/f+6hIf15t3p1s2Fcxd8C3kUibqs1yDYQdHZNr7HXHAH5wFUAh0afUcpLNQkDCDOpAn2OLBTNA3RRc75fVcBqefRu5KILdpNHvasOvHRZUZMVtiHs+Eu7INZrh0FpKwu/msMgcG/JoYHkDdnUnTY0Wif5XvAYU04NKZZt31y3F19e5JBwHxbu3Iwm6Zgjt3Kptz2yJau5OomxDdUzIDTmG+USkNs9/gVtFxKS6P6FrtvKps+rSgfSURFLwNPSjxeF4aGqkW+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIsMBIairwunP6LFA32m7d50YgQgrqBjWCm2v33/Nso=;
 b=hiCgtFjdu2qL3nPEyAcRxmVKP9rNjD8nHuKnxEycZwHdbKFvtwQEfrWGzQsEyRZYCb4TOinuWOl/actbo0wDPFVLXGqXTgMTcaRC8MAYUn6Ca3S9glT4Iq4hjlpFULdXN4crjXX3EB6Yj7B3OJ6+JpwSqcZbuT3gzaQdlnzhlbg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v2 4/4] xen/arm32: Allow ARM_PA_BITS_40 only if !MPU
Date: Thu, 13 Mar 2025 18:28:50 +0000
Message-ID: <20250313182850.1527052-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
References: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|DS0PR12MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 19adf3b3-6ce8-4672-ff16-08dd625d0316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O6Jk0p5V9/ucH714PINyl5rGxLNZ6V1IKk9Ay1j8/ZRuHsFeo67iJibCKpCb?=
 =?us-ascii?Q?wGXBwyJve224PDVXskM013fYZYQ/yHBwvxI6kLdBlnKvP+jN0sLDVmJ2CS4S?=
 =?us-ascii?Q?EOVgVvmsTaecKpgeTNQ+c+qmhxXoXWy6EsG4wupbmmAEIHWc8sfOQfzNpcU8?=
 =?us-ascii?Q?hBknxbRK1S/fR4LU/oygRpryvaCIKrdcT0yX1YR3Wz1lwxMuP7fzoqMPMgTJ?=
 =?us-ascii?Q?0QsIRYX/CoM+Aj6kcccQ3juZZqz2hNR5pJnq7cXodFSZNsE/GM9MYLwi3d9g?=
 =?us-ascii?Q?Tl1gPmf6mtDT/c+96ImMBx7e7wqvMMKMZXl6rvjMha4ISlpYkTJc9adoSX6Y?=
 =?us-ascii?Q?WkKdHbYmad9Tn2DbtZpdtTIxzGo0Ox35AB+6e3+cByvtl7d33zc8NZVy3o97?=
 =?us-ascii?Q?HUVpPNaWla/bPavLYaCUcW4EA3pas76h7Fa8nBDoSqK0scNGsax6SRiElmNl?=
 =?us-ascii?Q?UZn7aRUPavQ3jqHTnbo1KraA/MThqQRFhumMyHZSa7u27VNPriRea7pPnPuL?=
 =?us-ascii?Q?chEM/Pq5EXechAA0v97ACjaJR8gc5B/2iKHYc4QJ0tn4K+wGznfJ9rTPrkYZ?=
 =?us-ascii?Q?ouEUaNlbDBwFz6vONcs27l4ojYRfDx2/9aV9ZCTjojIQzldiWgm6SL49yjEs?=
 =?us-ascii?Q?qQr7Gu+2D7E5j/r3l4wA5SEQRFasvjtl7qWQAi1QS5Y1DIewiqhNdXTvv/46?=
 =?us-ascii?Q?jWmefXXiaPrWJJdXZqe61pTVBK+2DXtXVHjnceCUGDoymexGy+5f/tXZOJOW?=
 =?us-ascii?Q?LOqF5IEdPen9tvCHvH6fTxZuu1bqnz0T2j67XUX86b0+4wjc6Br/4am5B25j?=
 =?us-ascii?Q?KBvuLhOrQRSLducfML9t8cpYrVHSPAG7wileW51T1/Ot6Y99AGrsnLti8ehc?=
 =?us-ascii?Q?Dfim7s3HqC7QHaEoBR6w6Gcqmf8dfaYu9pSZqG9/Lg8MCzHP9L28Squ4WqyP?=
 =?us-ascii?Q?opuPHYmeSTnDm2Ficzmo45aCN2XiPcVVAQU2WPCeFZvtLp9DilgJfauxkqH5?=
 =?us-ascii?Q?bpcQHQqNNoTs0jfk/jYFk9hgWibyBVrbnfTA/IScpvPI4qY4dqXcGGe4HKDG?=
 =?us-ascii?Q?+UzBWSHQfrqWPoZPJpaiZ4nHoPR+bn5B207lAtXGHgRJH1KiqKgfzlqGNqst?=
 =?us-ascii?Q?ZbElzn3jS2O103xB3QxQ/Wt7Khy3rwqVRVWunSviavCdMZSCkm9ULZP8+iSx?=
 =?us-ascii?Q?vr26UrMoSckWwDraK+P5xt4gIQS1eKJWzSfValyDuRwkPCSCMvZWCIQYdoio?=
 =?us-ascii?Q?pn8+V8dRMKyAGnu70LMtOFY+Xf3ZozprY5D5FKmrN2A9zLVlxgiSlsl5vnx7?=
 =?us-ascii?Q?eGZktqXQ+NpTE0Xjjlld25YHWlLoyVefaEVUqSqAS4kyZxUA5z2yeV/SLQsE?=
 =?us-ascii?Q?kPmcnaZLSbwR3M0skJfpKiDfoF5MneGVH8+RAfO1VJl0hPJbznWbnjMBW1NC?=
 =?us-ascii?Q?Kr96Y4qDsz5DnZ9ZbOf5CO8VvRN8eWFhSkcdRof2TmZ7tcCZwnCFvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 18:29:37.8391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19adf3b3-6ce8-4672-ff16-08dd625d0316
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7900

From: Michal Orzel <michal.orzel@amd.com>

ArmV8-R AArch32 does not support LPAE. The reason being PMSAv8-32
supports 32-bit physical address only.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from 

v1 - 1. New patch.

 xen/arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 89c099ff46..b413e8399b 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -58,7 +58,7 @@ config ARM_PA_BITS_32
 
 config ARM_PA_BITS_40
 	bool "40-bit"
-	depends on ARM_32
+	depends on ARM_32 && !MPU
 endchoice
 
 config PADDR_BITS
-- 
2.25.1


