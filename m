Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760E4A0623A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 17:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867690.1279262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVZ7E-0007RJ-D6; Wed, 08 Jan 2025 16:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867690.1279262; Wed, 08 Jan 2025 16:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVZ7E-0007P7-AU; Wed, 08 Jan 2025 16:41:08 +0000
Received: by outflank-mailman (input) for mailman id 867690;
 Wed, 08 Jan 2025 16:41:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XghG=UA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tVZ7C-0007P1-QD
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 16:41:06 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2009::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5961e3be-cddf-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 17:41:04 +0100 (CET)
Received: from BN8PR03CA0021.namprd03.prod.outlook.com (2603:10b6:408:94::34)
 by DS0PR12MB6415.namprd12.prod.outlook.com (2603:10b6:8:cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 16:40:59 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:408:94:cafe::60) by BN8PR03CA0021.outlook.office365.com
 (2603:10b6:408:94::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Wed,
 8 Jan 2025 16:40:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 16:40:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 10:40:58 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 10:40:57 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 8 Jan 2025 10:40:56 -0600
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
X-Inumbo-ID: 5961e3be-cddf-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXrOTdmLQc21PbKADIEOxf7iPEvttXhKbebtqzy5df4ue6TrQSpSLLOHcK06+rKXT7SDFQ4DVQkAlPu0e7Ycvag+cprbSaYNZhwTJ2IbhTfK0B7a+LSOcVsnty6KVjuW7isHf/BEZ14uQzYXncyBs3+FswdeI81Ja/w+7pQyDLeGw+TPmVI8DwuuVexCh8SvrI4MtWNt0eyIuss9y92h0CGRuYkNqm1RZ0490bPW5gJ4piC5dGmqstDq7KkHuNOBBYSu4PYfbDdMedMe1KoxPuyF7LMp0/iJrMAwfB/vIcY8iKfgNoMmliAufuYer1OsaagSnYjUqkVEecqSdrhKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1J462nUP7/zF0Y8aeTwKy9th83yPn5qJrCNSuQK7Kv8=;
 b=wfPN4x5FvzBKi4mY22uYn2pi4+mqDT1oudNSPrE1mEnH5iHgHO3lHTFd8HGMvmC9yO6Tjr/7odOZ3aQmb7l0MjLz028q4u6NVjRwj2Ow/C203kgvR5F7KNpOFtemH7vgIxFsx3gVpGzLNdiHejPrB6vDxZC9Oi4ymt+5tNVv2Fmc0Wc4T2am8MxzRIXTI+BMFIDYpfquxRa7U66b4m5tMmE35I5DiBFeYDLq/kxZGgOg42v3NEt8u7QUbY3C3aHf0Lzmqykhdgz/r7KpApxKYy5jK1SfPpmZk+tbPKc75yzIwbf+kwZia4iJo6OAdalpf99NMgNczmS9/1iqayxbIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1J462nUP7/zF0Y8aeTwKy9th83yPn5qJrCNSuQK7Kv8=;
 b=Dtm1nqNTDqOM6rwPixmlRDIEznZKIGgPEGigXEz/pC6TEf+yxc7wbCrnIYJ8xK2BrDZ1bp/NtdRTtt7yStz1cHFVX6djsJCT/Oa6RNXZTOr9JWTcokO0sFQO+TgkWIidkeocfBlZNeCNQm+qSdkpqL6zuIdj9ZAVepHaBtzRTcI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: [PATCH v2] xen/arm: ffa: fix build with clang
Date: Wed, 8 Jan 2025 11:40:53 -0500
Message-ID: <20250108164054.338799-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|DS0PR12MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0a30ba-380f-4324-2765-08dd30033aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BzIFQ9cWPK9D8JQfujZ3Ryp/5GqsMi05HUQI6rOx8uYAaTNB7JllLJYZ4xrv?=
 =?us-ascii?Q?N+2KoGGdhbN3ML4hZr2aR6sjxxzINgBs0IO7CmYMVdViWXVOCwXeqZNH5E+N?=
 =?us-ascii?Q?8WtuwBMjZ3NImU2Yw+LvSFf8sSTM5qlpvDuKM8IQBT3zT7FQaJXHaPxg5Pc4?=
 =?us-ascii?Q?WlJrbfBe0C4UZbFbuqsScZV4xmK64YPozaG23XOpmQ9WbB74jfsdz/Z2o7oc?=
 =?us-ascii?Q?KI77rV34DQySsSrqZpwm7ds75cyjXWIbTKYzGlAstNcJGw02VLzUPYrYdUS0?=
 =?us-ascii?Q?K/EDzBuJRYoQ60UrQHJSNfu+cnwToexvJ8n9yx0qzP2CGXIZP/w6Ow26Kadg?=
 =?us-ascii?Q?G7RK0eZk/ZbjY/4CamQebpnpE6YbOv1FE+Snp33NbIzKHHGnyAqrRrWa4CjM?=
 =?us-ascii?Q?ZhhRHjeSArevKwBXgIlkcHpd3OAOV4sUtv3He0PuCe312Gz4AA0w2uRhk8mf?=
 =?us-ascii?Q?NDHyQXMMew/Z+tHA2jCuxMFaFG+C/z3/uB5+JF3WZkZON8siB23KkkTWPPWj?=
 =?us-ascii?Q?rV7aq6MM0uXK2DUuE6fGWSpMBFPdd7Pu77X5S/w7TH6EU/sZwQOHUrAB0Odh?=
 =?us-ascii?Q?PVmAgHWFSGavSaG2t0jiAbIQfBvjVKny6YbNWn476SvY4SQupfElLrgwTqjr?=
 =?us-ascii?Q?bElY0U4gvXgMvZdw7VFRlkNNO8LT2liScabA6lVQD9hX6inQ/l9D4z5wPkwc?=
 =?us-ascii?Q?g0nW6Mt2yNomdNNUvHGt66mxFRjC5GW74gGZK3bgX7rc0pOivPrApgY3efBj?=
 =?us-ascii?Q?pyRHj6eYpTUxXS71Dyu6PNB8pPr8BB+pIPD8rIyxFo3APdwf//6SeGDOXPRX?=
 =?us-ascii?Q?alpLoklvDdKLYFRJnJyeIw8+I2gga6wS8zw+ox0pFe4Ft//hHWBOjZDKKJGQ?=
 =?us-ascii?Q?QNrgUCrAtQAEc5RZ7cAJgyq1uEgVdUzl8gEHsukjZD83RZD9544qleVuRBGq?=
 =?us-ascii?Q?67I8wPksbfPpQFHGkhry5G7PcokMYe/hQ5J5sLdVX1mmXgXcNDX34D6sDISl?=
 =?us-ascii?Q?KCi5IAmeyQMKhv6llulyvqdy6xR8nl3iUuznnFkWvPXfQgsMMo6QLkROwvN7?=
 =?us-ascii?Q?3DTx+3bqLIpvFrb3rIzydEkYOnIuWWekx6jkr0ztL4Q8r5TbWvxV6gUBxi++?=
 =?us-ascii?Q?vLtPRmPG3fTLKcatnFWJTlR8oqYp1ARfKBLQ6L5y/DXx6gClYKqgcdYf1neJ?=
 =?us-ascii?Q?1/olsgFXvY4tsvOKMKsfhfPRdX31IKk56TPCwwIHP3BXgGJHo7pqj2M4Hr4D?=
 =?us-ascii?Q?O7/Qk8yyQAqeRUtIntAGXqUA1Z+OY4DAwKNL25m4edHXl269n+7HVoFZjxUD?=
 =?us-ascii?Q?HvUHYtuIpUeS0zz4Y+BmEbjWnUXrrwAwAKPS+ejfWMx9m6ESrBWs+SS0cfgb?=
 =?us-ascii?Q?WwMzTZCOTnzk84aAMtuLC7oK0Ffm01xklgN3cZN/Fa42hzkTxYsdSUTmy+1Z?=
 =?us-ascii?Q?wemw9e37FXzxtmHThwgind0GYych9EXHQzrBlz1VbJrNOVeLEM64UcqZd298?=
 =?us-ascii?Q?BwPytI0n+sm/niM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 16:40:58.7221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0a30ba-380f-4324-2765-08dd30033aeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6415

Clang 16 reports:

In file included from arch/arm/tee/ffa.c:72:
arch/arm/tee/ffa_private.h:329:17: error: 'used' attribute ignored on a non-definition declaration [-Werror,-Wignored-attributes]
extern uint32_t __ro_after_init ffa_fw_version;
                ^

The variable ffa_fw_version is only used in ffa.c. Remove the
declaration in the header and make the definition in ffa.c static.

Fixes: 2f9f240a5e87 ("xen/arm: ffa: Fine granular call support")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* remove declaration and make definition static
---
 xen/arch/arm/tee/ffa.c         | 2 +-
 xen/arch/arm/tee/ffa_private.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 87775ed88ffd..3bbdd7168a6b 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -72,7 +72,7 @@
 #include "ffa_private.h"
 
 /* Negotiated FF-A version to use with the SPMC, 0 if not there or supported */
-uint32_t __ro_after_init ffa_fw_version;
+static uint32_t __ro_after_init ffa_fw_version;
 
 /* Features supported by the SPMC or secure world when present */
 DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index d441c0ca5598..c4cd65538908 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -326,7 +326,6 @@ extern void *ffa_rx;
 extern void *ffa_tx;
 extern spinlock_t ffa_rx_buffer_lock;
 extern spinlock_t ffa_tx_buffer_lock;
-extern uint32_t __ro_after_init ffa_fw_version;
 extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
 
 bool ffa_shm_domain_destroy(struct domain *d);

base-commit: 70f5a875becc9444a959830b10a361982c31a366
-- 
2.47.1


