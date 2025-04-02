Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B12A78BC0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 12:10:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935556.1336936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzv3E-0004mi-Hk; Wed, 02 Apr 2025 10:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935556.1336936; Wed, 02 Apr 2025 10:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzv3E-0004kH-Du; Wed, 02 Apr 2025 10:10:28 +0000
Received: by outflank-mailman (input) for mailman id 935556;
 Wed, 02 Apr 2025 10:10:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=trQc=WU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tzv3C-0004kB-Ok
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 10:10:26 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20602.outbound.protection.outlook.com
 [2a01:111:f403:2408::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b09796ad-0faa-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 12:10:24 +0200 (CEST)
Received: from BN0PR10CA0014.namprd10.prod.outlook.com (2603:10b6:408:143::12)
 by PH8PR12MB7135.namprd12.prod.outlook.com (2603:10b6:510:22c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Wed, 2 Apr
 2025 10:10:18 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:143:cafe::13) by BN0PR10CA0014.outlook.office365.com
 (2603:10b6:408:143::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.42 via Frontend Transport; Wed,
 2 Apr 2025 10:10:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 10:10:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 05:10:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 05:10:16 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 2 Apr 2025 05:10:15 -0500
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
X-Inumbo-ID: b09796ad-0faa-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DN7x9ZwdmE8VQo4s+eBMvucxt34jYftdcOWgBQI02tY4mVj4graoHFoeI02VTNSMG5gLe1tFRS6gkNX2MzqvUuTJ2lkaFE6fJSrSGSqRSWehZX6XLBjNziZdInZ3FMUrSWm76GjA+NcZQpsy9sxXddTQxFiItpu/iP5B+HCAhvRHIL2xUR7O2f2RqapiGE9sxFL7HyKhwgL1/zORSHJHTzgb86PWunn+LYoopt2kpitlKJzqJLfNgzKZy0IIEnA7x5sSVw7iIFcYGpcK18d1LM4J3RJCEho5iPe1KlAxlJk111AOknSMtVt+oGJh3cI0OELNilEtvkAHE+zrBJkJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADuMDM8egoZu1uE9vHwAch9ISm9ET1plXZIxCkREhgg=;
 b=wAePgqMdFFC5HePyMgWAL3olx0U19nrzkmwFiIIlnKtNlsGth83jRClACbdOXYQnpB8lc1YHjD4/Q5T1EPvy8WpE0EYQDDHDhL/xnaMqfeMqLfD+/iMeW7+3Fyb2OI8/k4az4SPxKvwiQCtrV/vOf0y9Yt9130cFn2At0OFzRzr9cdG3kR2YRRaptvSauSu5O+d132Nhek5b3fLUm+fCd7nXh2eCpg6MlVgBSssKtKKwop4CkV3wu3rYvUCyWvTMGPFeqB6M9tbDImA6jrqZ8I6gWxKkcazbaqsDWajL5sjNy0ce6NqRM0DnMFA90uEBSVivd+KyOLsklMTeKqMmKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADuMDM8egoZu1uE9vHwAch9ISm9ET1plXZIxCkREhgg=;
 b=B1beDnPu+79g8uwcxYcL6aPjwNEIkUIPVARZ2Z6S+cKNUcGDC9Ev211H7i94QbyPsPzA8wOZ6A+BC2GkGSNc8pF64O+NzRzVTo/iTdjqOCDF2Eke4ufgzQsR0Fva/mI8wxsXv1U2u1zzCvu5d3HktErmGkRwpQqXKzVhdyQkWj4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Include xen/vmap.h in mm.c
Date: Wed, 2 Apr 2025 12:10:13 +0200
Message-ID: <20250402101013.220310-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|PH8PR12MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6c4eeb-e664-4a0b-f289-08dd71ce91dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jqTnUJSvb4Ymg0il3WxFbeffZ9C3bWHHZ/jzsjAZzgi6pN4ie96S66HnoHhP?=
 =?us-ascii?Q?PjFX5dAelVkoIxusdGedXyI4GyWjJlsvEcCrlJOG19sNBr9klbNp7Pq3g+qj?=
 =?us-ascii?Q?ugTUaoxKukIzA5JuX1mQhOdeQ+ZvesLcQPi7gS4UDYwRuufwo0pH6w0MonD3?=
 =?us-ascii?Q?lJmxKPViPr16TxqS2X1jb9OfGDiWwzmNNc+TrfqzAn9F4kwkiCGqVjVQ9PJn?=
 =?us-ascii?Q?1MoC6+ltRg69vE1x4QlAaQFu0M+buEvS79N+v+4kUg+gtqLL0DTpmvNkj3MJ?=
 =?us-ascii?Q?yXyk0xZ/89ixeyftpwN45VpsgHV3m+rFFSaWuqVunPFzsKobH3F985uRe/Sc?=
 =?us-ascii?Q?kjbjoOpCiyL7pkT+omVtcLKgeCX2Q//wbD2jASvajHKUHBS8EGyg+oe0qa9C?=
 =?us-ascii?Q?NEXp5BHH5EcFDV4/dvZb4s51OHj81qB/gbJlB2/ZisXMjDl/tVB3VZABiWpW?=
 =?us-ascii?Q?8f7gQR1CjgPfReIVLI4DWPoIFIcnC+sEKuLd+rQ86Tr3/O/PQdQAy0oxZG72?=
 =?us-ascii?Q?qaCvR6EJ5TemP03J80nU1xTw/BbYu6vSv3cj+G1aS+Of+DRHtXn8owQimkrP?=
 =?us-ascii?Q?g8s5JzO8eG4TlOreD334blsqbr3e5ws/NiEqEthZ/30ERnuVBSNYnydqFl13?=
 =?us-ascii?Q?2x4tPsRSTyBilXyhvEdVl7SrnTA1SzlAXifRl1dNtRv0NWf4qD17uVGRJ9gb?=
 =?us-ascii?Q?LE0lAtJwMBcZlO1ZYqEe+f8VMemqDFIdQm/5MMIwGRAmzWQdoRxPry8J8hiv?=
 =?us-ascii?Q?5lmwHyJb0tkdHK8fAx9dhq7q5tpU5ZGSy12KzdtvRcFm84B6kFPKGjn1kIAV?=
 =?us-ascii?Q?UNLrtTa7ryEhTEu9Xv2xmurEC1USVfKgV+/CaSf9iBWupcvLTjyDw9shMSnB?=
 =?us-ascii?Q?fPEpMuFYJm1sFRkgyMY2tFegX5EUI9NGGEKk0EVyOgRPwjcsKRz0uoWidCRv?=
 =?us-ascii?Q?/mEb+ksOTKCKNGdYK9WeqfPlOD0d2+L1nVsCSXYb0mT3Mcq3wWJuc7vFmYZL?=
 =?us-ascii?Q?nFnE4cj36It0uKPA+zqiBLImC7zwKYNVfEaoCu4CrHBcbSoQzil8taqF1cNg?=
 =?us-ascii?Q?zNUFL9pLZ+/4PMrcfKCgMsGORhHADlZAui9Romcjva5O9m/MQj2t1GmuN/uK?=
 =?us-ascii?Q?suDtvOTJy013eWyk9SJ49nQNS51OeRGSk/xoF+YW+gAX4qgmq/JdUtWZctqO?=
 =?us-ascii?Q?+EIuzmM8ZvkYxeQjyZQVb3U1CFtfrqx+hid+KZlVFUUseoBgqffQkX95LDii?=
 =?us-ascii?Q?jpho4c1fwW4uyoiMAji9vne4OCWGk9WfTCRI2isUGvZr1LJl/W/+gjt1LYAa?=
 =?us-ascii?Q?UE2OtofezXk7f3x3DsALqusWu54whqsspURBhCugCrIa9NKBjQ62xRHLvZn7?=
 =?us-ascii?Q?PiF8pmY456sI3Npmu0koTffQMnV1nuZz9Bh/N59t96FmHX8Gj7P6750w5NUF?=
 =?us-ascii?Q?S3L0yxGolen5Aw/0/Lv2jnrTn7BPfltr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:10:18.0495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6c4eeb-e664-4a0b-f289-08dd71ce91dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7135

As reported by ECLAIR scan, MISRA requires declaration to be visible
(R8.4). This is not the case for ioremap().

Fixes: 2cd02c27d327 ("arm/mpu: Implement stubs for ioremap_attr on MPU")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
https://gitlab.com/xen-project/hardware/xen/-/jobs/9599092510
as part of the most recent pipeline on staging:
https://gitlab.com/xen-project/hardware/xen/-/pipelines/1748174980
---
 xen/arch/arm/mm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 5a52f0c623e5..0613c1916936 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -12,6 +12,7 @@
 #include <xen/grant_table.h>
 #include <xen/guest_access.h>
 #include <xen/mm.h>
+#include <xen/vmap.h>
 
 #include <xsm/xsm.h>
 
-- 
2.25.1


