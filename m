Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996AADC91E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 13:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018122.1395054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUFW-0006R3-D5; Tue, 17 Jun 2025 11:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018122.1395054; Tue, 17 Jun 2025 11:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUFW-0006Ll-7j; Tue, 17 Jun 2025 11:13:06 +0000
Received: by outflank-mailman (input) for mailman id 1018122;
 Tue, 17 Jun 2025 11:13:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcaV=ZA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uRUFU-0006Jw-W9
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 11:13:04 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2418::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08d2bcd5-4b6c-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 13:13:04 +0200 (CEST)
Received: from PH7PR10CA0011.namprd10.prod.outlook.com (2603:10b6:510:23d::12)
 by SJ0PR12MB6902.namprd12.prod.outlook.com (2603:10b6:a03:484::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 11:12:57 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:23d:cafe::a3) by PH7PR10CA0011.outlook.office365.com
 (2603:10b6:510:23d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Tue,
 17 Jun 2025 11:12:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 11:12:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:12:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:12:54 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 17 Jun 2025 06:12:53 -0500
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
X-Inumbo-ID: 08d2bcd5-4b6c-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThxhpZ4SDkM0Jk5OcwpOIKTNmtCMRkij5M49TEzwqrA3K+a8KAAuKYI1/dR6FnpR678QjMm7udPIV4K0aWT7dcHX3q/MY8mbI1zpppx4vkY6isBgRHgFeza+HS+AeARkm6wPx15oxzaC+iEU+20SzWk/+24DBtGdmnlX0mwIbEWB6Riys3zJI1JSyB/M68TMgwHttAUIo104VJZeKA2We3tQwe/jMaXDNNHUrtq9CigFsoFe3HjxAORCkIg2X8tmQ63BFivAPhXWKeB4Si/tNX+VcZ5JQsngCjE1jL6Vhl+ar4NzuVx34IwcXJkr7713alHrgMcDCUcEuJ6tycU4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1/wMALtMDqzv1qV3h0JNM+GXkFFx8YFBARFPB/TzdM=;
 b=vmfven9ay7BTZ0r+8E91gdNamFYfsEdV6KOn/PG/GGgXaoUqGqzymQwIhCtGkJJBfsdsUrcuPhJQd9BbklV2uysauzMTN9HaNmaPrlDQOBUMn9wrxc/cDMyTit/mn3pO8YiGsZYn5sBzWIYMTf+f28gm8qO8V7Z7/KVyppbTpI6h8ADT/bhyITS4krO1caJlGROi6NSaXod7pAZRE8K6aXVQS6jNt4XVoCz2vwqCQC7ars4rJbUmC3GwLWV7GcdXcCLY6W/aEBh3qCoqAMxGL3ZqZiQw0E7fSZs5Yvsrb1zV86Uvc71QMXotKnTji+EJ+8g58o9bGMVN4n9c5tgVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1/wMALtMDqzv1qV3h0JNM+GXkFFx8YFBARFPB/TzdM=;
 b=Tqg3HUhSKqAJ5Od5kvQH9C2Pybz0sYJuq6lzCBkc53JH7EdvOmBq2c7UO8er7iF5MLjKRvw+dNSC9z3ZCbroBed1v+2QBD0lqLPlEmVpW0UUDPLB5FOBMRKLNFhm1NEmW1QJMI4oof3b+q11xc5GKE6QLYZzRqGcncPJLPr8vBo=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>,
	Hari Limaye <hari.limaye@arm.com>
Subject: [PATCH v4 0/3] Enable R52 support for the first chunk of MPU support
Date: Tue, 17 Jun 2025 12:12:48 +0100
Message-ID: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SJ0PR12MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 860d46a1-9a56-4ac3-2b15-08ddad8fe932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EwGdOXJx5GF/N3WxEu0TfPM3c8td0Ji7shbPny8fWfFTYaMM+OJFeci8XhIG?=
 =?us-ascii?Q?JnkEa6fOzVcvo7fG0kINBX/AIB/3QFjBgeTLqnkTDYqq99xUMGH9GBLVT3rv?=
 =?us-ascii?Q?qDD8UoPoa3saKFY7AvPxpSPj0yLZXLN8fO8Bbxw9rJf8ZRiHm/uPoYs2QtW8?=
 =?us-ascii?Q?e7EmidEQiyUodhSMPxV30lUVuopU0+//AWZvufFLpvcqOHrK1BVqHA5z+gGO?=
 =?us-ascii?Q?W54TEH1qTBM0Swun4nm9WsNCbRvtJwZvRXisHU8Pb2Zx3Qfr1FyFhD/AlzNb?=
 =?us-ascii?Q?Uwq+jIcpRFMB0DUPfBi2T8QuX2Cae+H2syzfGMdNTQm7WtX01r8Kw63t4ThT?=
 =?us-ascii?Q?8Bv1rMfGvZ0nYylz4brpGOZbyuXYTEsuvurXtYYo8KgqanB6IyukEFwyf+wM?=
 =?us-ascii?Q?zX/tK9xN/J6Wy640mvF40TZ9IAxJTc+bmsULGPbLYJ/tbxI/afj8ZxgJb+G/?=
 =?us-ascii?Q?AajXykED6C8iFhEqzje67dwPVrvz8oMplnG9eD/1ITq6RqvKKIs+b2koSKA2?=
 =?us-ascii?Q?Y3Xs1ZGH/VDQl+EDLVhA2ijxRehBXnaPOb25JcDXieeY9n5oD+/dahjZ4W9B?=
 =?us-ascii?Q?C9Of3zfhg+EfkKJ+p9QuDIOkH8yDUfHYlA1kgOyZmUrZfIJ0LGzkDh36/DL3?=
 =?us-ascii?Q?Yr++nLrmzEgf/KWMAEjeFdwy78PMbN6Ki1SZtxc1zkcWuLos0G0QFMQH1QuC?=
 =?us-ascii?Q?GIuwFF+yyKfI4iOUna1WrjLBRRpt51BDgtAUZEEKq8vH6UQEjcFh75FVmuO8?=
 =?us-ascii?Q?NeKphZsTHcWFXe2M8DbmC7hOGtWAUozzvVvG7hlQq3sZR1mrDrhlC0I/zXdj?=
 =?us-ascii?Q?tcm9cxNlyzD+SG3HWFnp8HGXQwYmoYvDdIcMUCrDQ6P7N3szoI2vWGUsw+2J?=
 =?us-ascii?Q?UbOCwoV1OuFB9SUkEDmpIu6m+CL7awIXLaUCvVp+tyOJUqBXh/2I4F7JUahQ?=
 =?us-ascii?Q?rRAx4a1sezWyK2R/ESJu86O+DDdKl0XfvvmUr1A5bgNkUh6PgdTZsTLIwnW6?=
 =?us-ascii?Q?3v78JTHKkFmuNAppGDkO6rc18H2VF2KNwIeKCC6V1Pr2dyNoVY9PCBtdOnMR?=
 =?us-ascii?Q?1n3m4yTNu9xQvRvN3aa95YruMkNzJFCX6oD0cY8ZpTQen4dYH5Jc0pZQ5roU?=
 =?us-ascii?Q?Atq+kjD/1K1A84by5eqerqhTSLPnPNp/i8bkJn5H/ZaiKjBsYgZhBiXeXhY9?=
 =?us-ascii?Q?jwdywbJNIQI79gGmrehnxJahstlyA0sjYX+UtpAig5wZCa95ASaTKqhTkRb8?=
 =?us-ascii?Q?Z3TVqKenXqJIuz5yqQBC5luORXDksUX3iy8wvoI7jdE/LskZReLZuTI3mxDi?=
 =?us-ascii?Q?lIiU1kb7cGCFsCfX5fWXhqjeony/rY48jW1kWkMFxST1cEtS4hza07jYjBND?=
 =?us-ascii?Q?ZqHkmf9iTBNFBA/LsAH9z12tlDbVogz6NdtBuUY3/iUvmlVpFVSYVuQw9jo6?=
 =?us-ascii?Q?B9IpG1wq19tkk8xmugtA2Mnqs3KcGSOgkwyNM7aqerQEVS1VkfM9mrEgnz5n?=
 =?us-ascii?Q?5iRUovELjV6lLOoD1GIYCjaVbLOhDdsJhSgN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:12:55.9445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 860d46a1-9a56-4ac3-2b15-08ddad8fe932
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6902

Hi all,

This patch serie enables R52 support based on Luca's series.
"[PATCH v6 0/6] First chunk for Arm R82 and MPU support".

Changes from :-

v1 - Changes mentioned in individual patches

v2 - Split "arm/mpu: Provide access to the MPU region from the C code"
into 4 patches.

v3 - Patches 1,2 are merged. Patch 3 is dropped.

Ayan Kumar Halder (3):
  arm/mpu: Move the functions to arm64 specific files
  arm/mpu: Define arm32 system registers
  arm/mpu: Enable read/write to protection regions for arm32

 xen/arch/arm/include/asm/mpu.h        |   2 -
 xen/arch/arm/include/asm/mpu/cpregs.h |  68 ++++++++++-
 xen/arch/arm/mpu/Makefile             |   2 +
 xen/arch/arm/mpu/arm32/Makefile       |   1 +
 xen/arch/arm/mpu/arm32/mm.c           | 164 ++++++++++++++++++++++++++
 xen/arch/arm/mpu/arm64/Makefile       |   1 +
 xen/arch/arm/mpu/arm64/mm.c           | 130 ++++++++++++++++++++
 xen/arch/arm/mpu/mm.c                 | 119 -------------------
 8 files changed, 365 insertions(+), 122 deletions(-)
 create mode 100644 xen/arch/arm/mpu/arm32/Makefile
 create mode 100644 xen/arch/arm/mpu/arm32/mm.c
 create mode 100644 xen/arch/arm/mpu/arm64/Makefile
 create mode 100644 xen/arch/arm/mpu/arm64/mm.c

-- 
2.25.1


