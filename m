Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AD0CA7752
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 12:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178803.1502507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRULL-00052r-0O; Fri, 05 Dec 2025 11:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178803.1502507; Fri, 05 Dec 2025 11:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRULK-000514-Te; Fri, 05 Dec 2025 11:51:22 +0000
Received: by outflank-mailman (input) for mailman id 1178803;
 Fri, 05 Dec 2025 11:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=itKe=6L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vRULJ-00050w-NF
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 11:51:21 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b44ea6c3-d1d0-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 12:51:16 +0100 (CET)
Received: from SN7PR04CA0153.namprd04.prod.outlook.com (2603:10b6:806:125::8)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 11:51:11 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:125:cafe::2d) by SN7PR04CA0153.outlook.office365.com
 (2603:10b6:806:125::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 11:51:09 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 11:51:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 5 Dec
 2025 05:51:10 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Dec
 2025 05:51:09 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Fri, 5 Dec 2025 03:51:07 -0800
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
X-Inumbo-ID: b44ea6c3-d1d0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzU5DeyjDu+9Zo/OvSuxnmuhBeJkt5z9qPjUAgGvGXUycxBdh0okGWkZo6cGts/nwMn/FlkXsDbg5GA6pVQfCo/5B3Oaahgz2enM7AlyJJFpIa3fM9NHptBkIzAToUYF6WKKRvxuMgUHfO05PDI3EQ14PoH3TPQMvsnXhWNhObndIj5t7rZ29do393rWJC1/7xpFdLt4LMvnEdpMEEbkvp/21xMyqZuvfLOlZLIolhKZJe6zgOWYBjiBwMpO2BV71HQlfYKSGnzWW7idpStMc3G95172Ypju+tTfScOW25l6ZgMXIPq3yzkXMTWC9Mzte4mwYUuESk5h/KdZ4u36IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FK2bZMBQlhCWiZa9gKDZ4owkYdKRJrCn+oEKrBYzqsM=;
 b=ty9yWkXqqUf8Sg5sEhB4XoxBkhPE82ZFdiCXuRY3Jl34qGXwrTb48fAlhqJMZ3cvMV5fGK6+ByC0frdKJJLhvnwse+SHRFnYt7jbwnT8VpPy44ZoH/opmRYiOIvKETglV8yhKk4Qlvdf4Z2tqefoWV1MYuh9xBIcXYOAh43TMmHhD/dhc/q6sXPWJxwsSYcHnzg9R6mILZwypFhKfy5BmDFEB6HtvnS94KUIPIgjxHGSBYGPBoztGzRYwzB0z1AqNm0MF+Mmfn1YybLf9G22cRv7TZqTjXigPFPjSxLmW8N3gd6pnqfmVYFKpFoWnOvVRj6oOHIHV0WWQsFTKCU5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK2bZMBQlhCWiZa9gKDZ4owkYdKRJrCn+oEKrBYzqsM=;
 b=YVOwqrBT0sQYk5//EHfqwxqaWqO6cdhO76BLuJ3Vru/ZSmR9JnBK1ko5+YOArEIsqtjRsb4GsvrvMDKUHusbE4nFQPUM0SIS99tkEES+4cpHmFtfJczzsmDlmwAHq4fcXcBjE/8Xskb4n64d1EYbgS1y+4i/5wp4H8SizYiE42E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH 1/3] public/trace: Add U suffix to TRC_PV_HYPERCALL_V2_ARG_MASK
Date: Fri, 5 Dec 2025 12:49:58 +0100
Message-ID: <20251205115000.49568-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205115000.49568-1-michal.orzel@amd.com>
References: <20251205115000.49568-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa0c3a9-7115-4699-a6e0-08de33f4959a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ffggycQr1NdJHUwQZm5E/R+j4lk5HmQjB6cjqt1XG43l8GUU5cdDNpqxiGXY?=
 =?us-ascii?Q?/hcBSNtUxu/2IS5rdbN3qoPLtlrhOxHD/031u/HmwWgN8QMsZxQ5ZcChi1w7?=
 =?us-ascii?Q?LlAOkLFTEggTLxPKlFqpA47L/V/YekqesPCVMWdeMgrB0HtR3pqdSPzWhCtR?=
 =?us-ascii?Q?T54w2se4FxigsIV2huNZXAucryGSKnmQQGQ6h3YomXHDxNurYt4QkxFPsnYF?=
 =?us-ascii?Q?SXAlAw6DeCtsCQGYP/zJKvW8WaItHQsJr3O8cvR/mXw6axgOAeA7leD3/q2h?=
 =?us-ascii?Q?ziKamGUhw/Pihe78JB3JCMakiIMNIYNSp3xZQ0vtXEAdriayHpEmNiW0bVbs?=
 =?us-ascii?Q?gVizvYlfw9XCwof954pA8uicVljSQnfkUnwJazuPqGDz/3QQ66pfZyIw3pMx?=
 =?us-ascii?Q?cbGoGxsR/xIh/RSwVNI0CeHNuLQ/Rxo9WMuEbxe2SkaPV8z0zJvUDgS9v3Y5?=
 =?us-ascii?Q?y3W1TNxt7hL0XcCy+GzTZu0Hoxh2Wo6+S1/FOo2WSlZq8cRMCTwqJ04Ea0+d?=
 =?us-ascii?Q?eeDQUmBiBhzDusjP2aWXZwNKD+vqRg/LGjDw66Tl47E/zV4kx5F0QBvmhfRR?=
 =?us-ascii?Q?unppJJljOm1UuyZS067GaJlQ7/l+7y/MPaIR8rBP5WtpMmF0jQn7ClqpkfFa?=
 =?us-ascii?Q?lTmkmGSqebynXMPpyKix45Umfoh6YPzm7ohIbwtReB86KkYkzZvJF7ulpokQ?=
 =?us-ascii?Q?a+FMIrkuhoFZo5RXugFEFhkF7GTu5PmxCZHOStvexQee8Tn2sfk1IvkSR/14?=
 =?us-ascii?Q?OVVcRHgzaGMY7UBCyHRIim21n0fr9gJk6YpFzB21zsLFxtvNm1Yu7sBDTwYC?=
 =?us-ascii?Q?mP+MnD6MXMYqOnEMIvEQZdbJ5G36sIoqeaC1qkRvwvXXY2Q1dkcYWFHyER1H?=
 =?us-ascii?Q?kZglLZI/QwpUM57N8cyD8hsftOrW5bmuJLh47bIP7/mHmDulB7aVoJV90ajX?=
 =?us-ascii?Q?51ttEeZPe9GGtvfNwVxJGs83ecXVdFRvUjF0sgrJr5dvtMPwe2tVlqYoJ4uN?=
 =?us-ascii?Q?bj2gdStBBQ6Xfou2NghfP3zSXBh5uWNvAI48IZdx97E2MOVFtWBNUM5mE5fU?=
 =?us-ascii?Q?ABTW1bLzPMy+jZ/D8rjRkq7UX2vKfbfHWAOnyMJeuzsDz+bU269bRnwEmy/z?=
 =?us-ascii?Q?xjeUjsnh/7QtCw8wOFuyIsUuGrAxTWf8LT7ybjmKeJCm0ZnzwRSAG+c5KN85?=
 =?us-ascii?Q?16eOiKiK/CpMOYghFzeT/VLW08JO74SI2nUPzX8qa4738isAr/4AvXx0U9kW?=
 =?us-ascii?Q?7yAADcRecU4YMX7U+A//Ajii7qBo7nXYvvMOETNnAt3WH97UVQtABrhypUg9?=
 =?us-ascii?Q?3Ncc91thUpgxIfShj2aqBSHdmT1qxWUTMcD2XL0n89Ux2AvBboRhXR0tcHEM?=
 =?us-ascii?Q?uExRXN24QmxkFihGpbofWrrnx+ZAaXIgqg4ugJsNQUvd2TdWzB2b77PbxuVa?=
 =?us-ascii?Q?u5JM7DXJQMbQQ2e4VdfYAnwoPdoreysgo7AZHLjgvU/fHqzmlQAneKOOUVZh?=
 =?us-ascii?Q?Omdgtzr17QHd7KnaBSEYAMoqahaj/4PVHOuhM8DTSBFoEm+2+F5tvHA16Pf4?=
 =?us-ascii?Q?J4KofX7TS0t7huDRlUU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 11:51:10.7551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa0c3a9-7115-4699-a6e0-08de33f4959a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044

TRC_PV_HYPERCALL_V2_ARG_MASK represents unsigned type, so according to
MISRA C R7.2. U suffix should be applied. Fix the violation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/include/public/trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/trace.h b/xen/include/public/trace.h
index 141efa0ea7b9..a7d7fb8c507f 100644
--- a/xen/include/public/trace.h
+++ b/xen/include/public/trace.h
@@ -157,7 +157,7 @@
  */
 #define TRC_PV_HYPERCALL_V2_ARG_32(i) (0x1 << (20 + 2*(i)))
 #define TRC_PV_HYPERCALL_V2_ARG_64(i) (0x2 << (20 + 2*(i)))
-#define TRC_PV_HYPERCALL_V2_ARG_MASK  (0xfff00000)
+#define TRC_PV_HYPERCALL_V2_ARG_MASK  (0xfff00000U)
 
 #define TRC_SHADOW_NOT_SHADOW                 (TRC_SHADOW +  1)
 #define TRC_SHADOW_FAST_PROPAGATE             (TRC_SHADOW +  2)
-- 
2.43.0


