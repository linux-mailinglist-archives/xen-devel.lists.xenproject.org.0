Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9609AA27B1A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 20:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881796.1291971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOWz-00054a-8z; Tue, 04 Feb 2025 19:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881796.1291971; Tue, 04 Feb 2025 19:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOWz-00052O-65; Tue, 04 Feb 2025 19:24:21 +0000
Received: by outflank-mailman (input) for mailman id 881796;
 Tue, 04 Feb 2025 19:24:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZU+7=U3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tfOWx-00051v-RD
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 19:24:19 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2417::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fe03c76-e32d-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 20:24:18 +0100 (CET)
Received: from SJ0PR13CA0214.namprd13.prod.outlook.com (2603:10b6:a03:2c1::9)
 by SJ2PR12MB7895.namprd12.prod.outlook.com (2603:10b6:a03:4c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 19:24:11 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::49) by SJ0PR13CA0214.outlook.office365.com
 (2603:10b6:a03:2c1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.13 via Frontend Transport; Tue,
 4 Feb 2025 19:24:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 19:24:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 13:24:09 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 4 Feb 2025 13:24:08 -0600
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
X-Inumbo-ID: 9fe03c76-e32d-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3FYZ5/1vPER+8lA56j6wwtMQDq98QxLM8FgLPxjtgQiO/z7cHs0AiFqRW4CQ72Vlcu0FjLyFP+Ce1iD7Lx91ffJzx9J8P/2z+HyBpHrWRirV1w4jgGyHF0QlQVgUmbULkqHXLuQIOt63dSf5B5lUdz5pD5j7FcvTCEYu5nX4MfQJ9ObXqo7ybwdXw6MSJ5wOSQvYNHA0VkbipM6oTlrwxNMh3y6d+vog2JpzvVdgZMu+q5QEdvIZN108P/U5HUQTfRB6mQDmsNb1UCPqj4gokmEiozxjHmbZ8NOkDV91LGKTsmXWz5KY95/CbknrrX+bw+Nod6YbXqm7VDEoRm/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oO+GghfFL4JgTxoRWMrv1S6PLgVtgiVvBOKgB4uNX/M=;
 b=OIyjyisM1Rwjog7sj8o+2nkXc0ICKcQu8141MyGv64nbUlS8OaFbIxalBQdXpXwBSMH5oP0rV8y8T/w5Bi6GQQLKOdY3/1VP25l+rlTAD6lVgI5KPnj+Q8SqsYOoa57lZhV2qpvVBrdZQcneBQ/KeZ1jxGTARB5XG9+k5Klc3rAhS7nKLuHPYLBLcDkrD51NbJYlAD7ZTgicguR52JU+Dk1ay2LaAkYuhgOReQn3vL0evegm8sMjOR0oZiiGWGpRBURks8TqJlDp2jzFlrAhg3KxvU/g/5qRFoir01eq3n+lbdovOCfpqXGBAy7tbi63J/2xr7w8J2gJ6BgzydcEdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO+GghfFL4JgTxoRWMrv1S6PLgVtgiVvBOKgB4uNX/M=;
 b=3T6GYIck51xgb4cU5ytPCi1YW/0/kg3bizGdfDJCbGbXYr0j79l23TeMF6QrUkD6w8lRYf7GrWmrINjeCk+tHjJH5jpmK9J4+2jbzMiBruL7xbh6oIpJf5qpsTqayYLDGx3c3/8//YSsiSfk5YLn4JwT6YcCcv0AxaicZPxcdOM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/5] xen/arm: mpu: Ensure that the page size is 4KB (arm32)
Date: Tue, 4 Feb 2025 19:23:53 +0000
Message-ID: <20250204192357.1862264-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|SJ2PR12MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8470cf-33a0-4c0c-f6ed-08dd45518024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+b44YURIBvIJuArbvq0Bk5BK4QnMZ6bjulVClRoYXZKhENfL71KH6IfDyvqT?=
 =?us-ascii?Q?SwCiDk163+PJyL99NY+PIXlui5QIwJCtBZsZsIZiwpRlKIYXfGyHIhHTfR+U?=
 =?us-ascii?Q?cxFDjuQTsqYHmDp0NBD5RB3TfloM2gYiLfTBPeMidstxDYz+hQFVVs+54gLs?=
 =?us-ascii?Q?MPlngeYfwGCHmeHNBhp04x4os0jUYREunQqmjGtHdshhbq6MijAyXaBPRitV?=
 =?us-ascii?Q?5s93NCiG1ICz5SBUe5R/0R435iA1aFV8lm/8IJKkPMW9eCwCu73uL/b8gj6F?=
 =?us-ascii?Q?WSrAk/JPiz365veVcBIsQ5ruqMEnLa98ow9Z9Az5uSWTNaqJpis5Sw6dkfLU?=
 =?us-ascii?Q?8A71t4eSkJfhPsdncrsV7K/wJmtpj+YvsV3DJgvZtTh/BAp1Pp6l9zJwck7R?=
 =?us-ascii?Q?nUYvwmk0/MWJK1SytUA/bs0cv0fRZdtZ2sRZbH4ZjdZPuiFQ1JmCG9ToHvOw?=
 =?us-ascii?Q?76A8MrYnG4SO478eO94sMBvxKh5/3xveN6RfDc7dVAXKKXPEQlvGzyr7viX7?=
 =?us-ascii?Q?vSqhx0QxmvdH6xA85Twf4s/DBEhyeQ83ctDJFV8WzGoPskdMy7DNCRocQFIr?=
 =?us-ascii?Q?cJKRus9EO7I/Eo5fJO1cIjPO5mhpjlQrBvTgMdPkvzLTvoPuZU1MObTRWyjM?=
 =?us-ascii?Q?ien4cz6b6NR0IiPmUNiiYGZ8ausjHHaKxHlD0oJEKuP58+3eePDlukrSIIb4?=
 =?us-ascii?Q?IyjqKa3Ud4SEatQjVXyLUn5GE9GUVuN47J2XhA7aL7wMGL2OQFM8RDQGplQq?=
 =?us-ascii?Q?/mTUw5apXJ9yzVOvD4V/tYOUShJ65G7iabW0QKFgpnjsr3HSRBomeYRwhddu?=
 =?us-ascii?Q?sIz2DVcCGfUtK8N47epX55XE+zXSzGvWWVu0s2rUK7Q4OMg65qgyNxKO1BaD?=
 =?us-ascii?Q?qo93gVi+l+xzadAZW40Hj1wJ0FzfJ00BPf53KbP5/9g1XsXcyFDMTSTL1jwQ?=
 =?us-ascii?Q?qWcgQmpX0Hb8qBoeeKkKwS2AgJej4E5MkOl8zuglWdRHPAXvUNAsjld7MB63?=
 =?us-ascii?Q?Bmlxf20IJzpNBJZMJMtm66r8fBT0kdMGOzLLmoYmcGx3yvnvjcn9mlb4JJRg?=
 =?us-ascii?Q?zvd3eAFbGoVLE6uneTZgq0lBQOjtTSe9sJoOUhIlW4Iu6gwbQBFVsAtk5WHz?=
 =?us-ascii?Q?ARr7q7W6avRpKqfLfNa+QwagvhNjRWFI1V8R/x7zw2RZWashFN0YxDh34PEN?=
 =?us-ascii?Q?WKFRX5S764TcG23p8l72RdCoZkkUDgHPudWZVmhG020O4hnfPI7rIrqrMKsf?=
 =?us-ascii?Q?w2fW6QDpT2t8J7vUzn+mSUagTr2Hn7ez5DjTjIaqOG76igxTkbhwehurpR8a?=
 =?us-ascii?Q?3zjiYCsfU30zEM1XmlTJZeWqENe4Getd7O6kEm7BSSfUWPukkiAtNI4qcRMF?=
 =?us-ascii?Q?oPmIXctelCKflsEiqVNLKqIl2dxssVsXe+qzHiygGQG7564QDtR5OaM7PR8b?=
 =?us-ascii?Q?jNF+5D6kil/OrMyoyaU+x2hMTDeoxW2BYuHxfOODH8tCrhe+/lxWJxPQ4H0X?=
 =?us-ascii?Q?+znVAxyyKCS3tVs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 19:24:09.9489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8470cf-33a0-4c0c-f6ed-08dd45518024
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7895

Similar to "xen/arm: mpu: Define Xen start address for MPU systems", added
a build assertion to ensure that the page size is 4KB.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/arm32/Makefile     |  1 +
 xen/arch/arm/arm32/mpu/Makefile |  1 +
 xen/arch/arm/arm32/mpu/mm.c     | 15 +++++++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 xen/arch/arm/arm32/mpu/Makefile
 create mode 100644 xen/arch/arm/arm32/mpu/mm.c

diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 40a2b4803f..537969d753 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -1,5 +1,6 @@
 obj-y += lib/
 obj-$(CONFIG_MMU) += mmu/
+obj-$(CONFIG_MPU) += mpu/
 
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
new file mode 100644
index 0000000000..b18cec4836
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/Makefile
@@ -0,0 +1 @@
+obj-y += mm.o
diff --git a/xen/arch/arm/arm32/mpu/mm.c b/xen/arch/arm/arm32/mpu/mm.c
new file mode 100644
index 0000000000..0b8748e575
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/mm.c
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/lib.h>
+#include <xen/init.h>
+#include <xen/sizes.h>
+
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * Unlike MMU, MPU does not use pages for translation. However, we continue
+     * to use PAGE_SIZE to denote 4KB. This is so that the existing memory
+     * management based on pages, continue to work for now.
+     */
+    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
+}
-- 
2.25.1


