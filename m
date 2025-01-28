Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895E3A20785
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 10:40:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878311.1288490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tci4x-0000oa-3X; Tue, 28 Jan 2025 09:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878311.1288490; Tue, 28 Jan 2025 09:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tci4x-0000hK-0M; Tue, 28 Jan 2025 09:40:19 +0000
Received: by outflank-mailman (input) for mailman id 878311;
 Tue, 28 Jan 2025 09:40:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WhQb=UU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tci4v-0000QT-RJ
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 09:40:17 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2416::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfc1600e-dd5b-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 10:40:15 +0100 (CET)
Received: from SA9PR03CA0025.namprd03.prod.outlook.com (2603:10b6:806:20::30)
 by SA1PR12MB5639.namprd12.prod.outlook.com (2603:10b6:806:22b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 09:40:07 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:20:cafe::bb) by SA9PR03CA0025.outlook.office365.com
 (2603:10b6:806:20::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Tue,
 28 Jan 2025 09:40:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 09:40:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jan
 2025 03:40:06 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 28 Jan 2025 03:40:05 -0600
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
X-Inumbo-ID: dfc1600e-dd5b-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MByVBeI9/F7YL/5QXHWhPWnbbDH8wAPEkEZo5qV2i7aHrIuuNBSUfXobA93I3AwqU46cryE3bX8gwoGqCfLeQ+yDo8H4ZAvfCx1+VDJN0ihgY0uARELTJgLYgkJgbTiqWkjrD9u0LsyQQ92dzZd3DlhPrHjO5Vhu4bVxZVWLiPyM2JAgE4A5XWBjauHb/K91XCTcn1j5oHwvHRQqUpPrA0jS2e4kQmOepBQATAV1NsskoIDD9SVZehUJ2902aWaMAxTRBLWvEZsnnCUk2kY4dvbvfBY/cs1uBKFjpKYEoD/OfjWBQ9d277EEEC8UZ3E2CUpxxx/TdPvkSL5pz9ZruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdAIrJ/MqjNZfh4vApir3Fhdo53NdRh7/2IUDn+1cts=;
 b=XwHdJq9PY+g5NsAyZP+zPxyB5gPf8hMMWIlaw/S5MSumuz8KJL2m+/W/xO3xOC33d0zQqBhKqyCL+kVE7N7cAIwhVhOcs+LAeM/oWgcqhLueUG5U5FrsmN3/Iq7REm5B26X7kgU5gBSPwi1sVqn11qZ1aZUM9nVOQLgO2stz0iP5AAtjcIuIwDzx/fwro0kuUkgWLV2Tk7lQjYu4LRAA6Jb1FNTvcaAqUES77hdub9m38Quyrk6GSEzwboApBYKDJSFrEUGgvhLnQ84kN/VURJRacOAGsmIE6LmiN10StScK0KZ7TC08I/VnHfub28s2HBJEnZerUZIdj+ZoCikoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdAIrJ/MqjNZfh4vApir3Fhdo53NdRh7/2IUDn+1cts=;
 b=EmIu05WktGw2vo+LCVswYpsWYcSRLlE3AT8W1ELMc76sKd0WnLZepHHAtbIw0qtm0Sonnih1gkDHa5SUXSo4p8VBO3MGbKasb7KVBOwLxesTsk6ei4yUhvhBx/MM1ixJM2yA9hNlvC+F8ImSN/YVvgICliuSps9zLI29xDp4rwg=
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
	<bertrand.marquis@arm.com>, <oleksii.kurochko@gmail.com>
Subject: [for-4.20][PATCH v2 1/2] device-tree: bootfdt: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
Date: Tue, 28 Jan 2025 10:40:01 +0100
Message-ID: <20250128094002.145755-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250128094002.145755-1-michal.orzel@amd.com>
References: <20250128094002.145755-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|SA1PR12MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5daca5-b10e-4680-3af9-08dd3f7fc061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jLuw5yeT+DLcd05Gr29gO4hAlKcY7oqbLe29HZQIEz1qkp5PfJpz1TW2Gm+Y?=
 =?us-ascii?Q?GX2s3xV5jPvNtbpOfWSAwlcKuEeovBKVxNUptWXISbohhJkuNBYVnINOyIQb?=
 =?us-ascii?Q?chSfvblS83hdj9vkjp2LCuZJB7fD4pys5nJgTPlSVi6QfP14KLiGmQPtqi9U?=
 =?us-ascii?Q?tLHnHjdk1uHCMVqPZfXbzhxdBmO3Fyh9siRNuVOySUky4TIEMxAyw2YIPrzr?=
 =?us-ascii?Q?ughBsvd/mITaS8/rBIPbXAKhL5YJCBwogKngmYEaqpib2cLxkYkEUiV6+65P?=
 =?us-ascii?Q?ZUcUVPjckYMeN+e0k2knKDeHDhcg2UICudu0v6OuPNev47hWh+Zhdfrpp2GR?=
 =?us-ascii?Q?dnzDOqo02YQRh2nHpvUL9hO0ZBBR19+Ov0fqCMTISPmRLnY96nxuDSLQNXAk?=
 =?us-ascii?Q?O9KcxThqs3GxU6mMx3+CZI6WqDbwAZRItK1lJGvQb9beyW4OiNvJg2B5gZKV?=
 =?us-ascii?Q?WCTRyoTRWqXWcN+XfJ3Dk4fPgwbAkjVbLLU0XzwBEnX+CzfBHTU2EiOCPk4C?=
 =?us-ascii?Q?a4Wv0hXkS/yxABSrTzaP7oexzuRyyJHjRrzt2UMG5phDNNyHjN7aLpKkHKmp?=
 =?us-ascii?Q?maCVsXoedR6wELkX8ikVU/UCwn20jm9dapQBbioPMLtSNTNT6WwxPTIe7Dev?=
 =?us-ascii?Q?3umYavmd9Tx1uVNiFUsGaU0OtIU2o2/cTkUjC1Npj0NDplWbyh8gTy3QCY2T?=
 =?us-ascii?Q?D+E1HlxMEtDXF00RWCZHdF6muh4GDJvG6t5BSb/Lp88vp4jn6EKHZlRX/YCJ?=
 =?us-ascii?Q?Dxjp2wREXGmrtnGJtyKWxGd0GyMJg9xSaV2Q6FUFVnnwEuMX002GREG5zz7+?=
 =?us-ascii?Q?cV/jSL7ZJyXSnPc2ErRryQkZU/kABaGP3Sy0QHMNy3soSgmNpKWgtCTBR/Pl?=
 =?us-ascii?Q?ZnZYDLER0S5RQdD1P9lHpBC24ziQPfw0DsF/XsAUcaQYpSXTnDfnvqVyIRfn?=
 =?us-ascii?Q?t7oMK10kkWRZzIKoWn0yos9I1/JeNWEdOnt0F3SutJEbhmlb5I3a0EtkufTD?=
 =?us-ascii?Q?0ovkp2IOX+04ptvvVft0nvOLnzJ1+wsw1e9e3jK8KnXbrYw1hkioGCWUBlOP?=
 =?us-ascii?Q?U5f+Un7n6O+QX7rSzMYgStvWOcettOJutdkTT46MTnyhluH0u3GUZYWS0Cc7?=
 =?us-ascii?Q?IVr7CeZOedqju+DtBoFCGk1eQYJeSSTg4VxBQvLjuqE2IQDlOr0AUOzU5ELo?=
 =?us-ascii?Q?0l7MMjzw4S/KaIfRNN1vdBt1bOS1IMdYbuyDVYd+TF39jKnlVaL5wYTqmiSo?=
 =?us-ascii?Q?5VhtUMs8/UIN0qJbZZRveDW/k90Ae37WkjM1B67V9W3q8JDdCRz6Tf9INAXs?=
 =?us-ascii?Q?gd0E1i414Xfj8F2O5sL40y2TWdqAkNZtaYbaemY0x3ixH7agLJjoCg1YtxoM?=
 =?us-ascii?Q?0bR3RHa84GbyXA7IG8dVhIrFHJSJjQOaiMlj8qtZ53DBpYCMWMcUTEb6fbOw?=
 =?us-ascii?Q?G8gdkJK913dzGjw8Ih1WAGK4CvJVmv2VuOgofrjJJ3+Nem8/Nv3LkQ/Eber8?=
 =?us-ascii?Q?lYN4jKI4FyFzV5A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 09:40:07.6691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5daca5-b10e-4680-3af9-08dd3f7fc061
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5639

On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:
common/device-tree/bootfdt.c: In function 'build_assertions':
./include/xen/macros.h:47:31: error: static assertion failed: "!(alignof(struct membanks) != 8)"
   47 | #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
      |                               ^~~~~~~~~~~~~~
common/device-tree/bootfdt.c:31:5: note: in expansion of macro 'BUILD_BUG_ON'
   31 |     BUILD_BUG_ON(alignof(struct membanks) != 8);

When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long,
therefore the struct membanks alignment is 4B and not 8B. The check is
there to ensure the struct membanks and struct membank, which is a
member of the former, are equally aligned. Therefore modify the check to
compare alignments obtained via alignof not to rely on hardcoded
values.

Fixes: 2209c1e35b47 ("xen/arm: Introduce a generic way to access memory bank structures")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - modify the check to test against alignment of struct membank
---
 xen/common/device-tree/bootfdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 47386d4fffea..529c91e603ab 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -27,8 +27,8 @@ static void __init __maybe_unused build_assertions(void)
      */
     BUILD_BUG_ON((offsetof(struct membanks, bank) !=
                  offsetof(struct meminfo, bank)));
-    /* Ensure "struct membanks" is 8-byte aligned */
-    BUILD_BUG_ON(alignof(struct membanks) != 8);
+    /* Ensure "struct membanks" and "struct membank" are equally aligned */
+    BUILD_BUG_ON(alignof(struct membanks) != alignof(struct membank));
 }
 
 static bool __init device_tree_node_is_available(const void *fdt, int node)
-- 
2.25.1


