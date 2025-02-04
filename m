Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9915A27B1C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 20:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881795.1291962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOWu-0004pD-2R; Tue, 04 Feb 2025 19:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881795.1291962; Tue, 04 Feb 2025 19:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOWt-0004nV-VG; Tue, 04 Feb 2025 19:24:15 +0000
Received: by outflank-mailman (input) for mailman id 881795;
 Tue, 04 Feb 2025 19:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZU+7=U3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tfOWs-0004nP-M6
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 19:24:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2413::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c6ef9f2-e32d-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 20:24:12 +0100 (CET)
Received: from BYAPR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:40::35)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 19:24:07 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::9e) by BYAPR04CA0022.outlook.office365.com
 (2603:10b6:a03:40::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Tue,
 4 Feb 2025 19:24:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 19:24:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 13:24:05 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 4 Feb 2025 13:24:05 -0600
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
X-Inumbo-ID: 9c6ef9f2-e32d-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yx6YB9l25ZoG9XFSrWLv4efQwzGltD85OE/1Nos+ZcrC1PESzn5F4cyF+fuw7m/wM5r5x5VXxpiy79I5lMutQbsIMxZ2UMg8R8fWBZ8L2slL2VFCUwLv3Eb8bkeCJNJWB1qjcKgvzBi2Ubv8ugshsKlkfvXP9IIBci47HtEAm8G1Hp82fUVvWrcNO2NJqYN4jz/Fdt6AmbnNiOJtEdeML8kQfZG29bbvRGPnhsZAwF5/+erHhPZEO3G31V2btbMUu8ZUlzjYLMbXW5P5EDOJTpU/uJoPDo2YW1nUaL1VOU7pXXjIzWfJWY3+Xo3erDv1ldFhm9wz75HeQJZMRAmUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHG8ViCwCswuSP2yufgLGkM1w0E0EtH3Fn4Jyr3k5Ug=;
 b=oZCP1DxciyKsaRvE85wrune7kzILLHrfSm7Hlsl4+DUKnJRI56soyPen8l75St3GDS780M3UTjv5P5AhcdRHar46+x29oP8WpYDD/AWuFYMB0aK5T39QYjEHnL/1wdS6LDAFTuC5FJ26PeW9IoDb3Hrbzl2lra0QterFnUHkLCAunGtuA0ElVr1cf3jUG2KZVvhRPQCE1Hn2mp3L9OYWeUBl4Uc6yjF8ipYgWScDbx4MRHUar1kdD0CNt56+kLzovuHc7YId4LGXNPSWG1zViVmpIaB7MzzhoQZ/9z9sa74e0CpNGtExmBg/obEoqXtTaiJIXvY/vcQFQGp8e20fmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHG8ViCwCswuSP2yufgLGkM1w0E0EtH3Fn4Jyr3k5Ug=;
 b=V8xhMitNA1ugi7Z4Tt60IWuKMLqPqPX+JRDhzK82/KJMl/e0LUvKSEKr1GmpkyBru7wk9YO5Lrgdfnk1pMqFjao6oKSO4ARACAajUBPY/ONShciWipBf6nSIPVvhUeA6bdIfV9kGWtpq/L3O2u5Lj/FNdqplbmyW1WIVxvDc7X0=
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
Subject: [PATCH 0/5] Enable early bootup of AArch32 MPU systems
Date: Tue, 4 Feb 2025 19:23:52 +0000
Message-ID: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7e52bc-739a-47b2-615f-08dd45517e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zM2oIKoWV3cn98C+IR1hFtLPs5LPLtkjRrOlyK8ugsMXJg2nXN105oYfysoA?=
 =?us-ascii?Q?EY/hJw/rnPMBAnLVPSoLvvMJ6gr9HEQ0DlKn0moSrZnVj6S6GTcICUQ1a4YA?=
 =?us-ascii?Q?pV63zzfio4t8LdvvlA6mKjEb18hGTjQIIr3tflxu7GgmMwLqEJwpQjcja51d?=
 =?us-ascii?Q?fzQi840CMey/bHKiyRo1YqSSjrWlPyg9rqX6W78/YULhco0SklHr/sKBPxte?=
 =?us-ascii?Q?CyvMEbHA76VgX9ouNSeEzH+vjJrqftuVKNwQ/xWOvvvvnVJvelc3WdP3wgQX?=
 =?us-ascii?Q?laNtFr0RJl+xCClb9pbQFN5LVF8MiQoHE2FGIYMNAAQc3D3HbwbSrI4tntqC?=
 =?us-ascii?Q?x67iRRGJKAoIqqhCFTsCtbATlunBAMtZQFxOv0aSSGA68N3v8N1zrl+wToRL?=
 =?us-ascii?Q?MKlWHjsOv/KumNf2/wlDBz0TJTS+WXY/Sd6Gu8lXzzpjQWsKauKZGbIz+1fc?=
 =?us-ascii?Q?jHinQlbrRz7ZfQVB908/lDBvyNYJr8C5iHJ/S0VJ3+Ti6qhG0AxSutDGwiF1?=
 =?us-ascii?Q?r5jayI3w6qb4jd7zKqzj+/9xs3ufTQH/jOUC8LGcBV8Pn8wDiYs0mO9IX6W3?=
 =?us-ascii?Q?o+LKMPRIRtxh+q7NjXyY35OBHEaTzxb4ZU5cxDKnkBfsUCqRH42aTr2PlQCB?=
 =?us-ascii?Q?yg69FIUW+ct6DQG7o0GF2xTThoHTitTLz7Y6sxHqk0+SxzBzUukGeyk0v5oN?=
 =?us-ascii?Q?arT13u9XZabAdXhYy/0wMSclVz1WYI0Z0JEDVLuSmjM29vuJk49CNZxidRmE?=
 =?us-ascii?Q?11N1UsXTzdtaUE75NzdgbPKJUEhvOSJT0H2chhnXj/CBPpAuC8cnIdTCNsJ4?=
 =?us-ascii?Q?ofp8SPNp7Lm8S229nAMPVwsKvOBQva656dzaEgaiPXo8LALtQjUNeDGwxRko?=
 =?us-ascii?Q?h9Hxj+XpQqP3ulzXYSseJNSQ4qmX2uN9j6FmUhfbFJO555wnBSvRBDGvHeQp?=
 =?us-ascii?Q?jDrtxWS/sfzUfiR8WgWEQB8yVOATgg+ey79l8YY3T1yqDMtZnKbL4ThpSLsb?=
 =?us-ascii?Q?aXpIDDugEiM/OoVVi4u7PmhkHTxiaWnBSWx66xDtolRcqRYhWgEqQu2iEivD?=
 =?us-ascii?Q?FVUDC8R61IufjWhPeaMUfpaGT/kg1oVVCqZqpZTPgJJwspzm/yxKgmBLwcyS?=
 =?us-ascii?Q?BIvMApE3iFBU9+YDxKIop++v57YuNbbJk5Hd/B38BZMfwqjT2CfLXb0rhB00?=
 =?us-ascii?Q?d5XkUJBwSPIVC9fdjBLxqv+Zqm++7NNfIkU9LJ3KFYwGuMk1I4IzL6NezODK?=
 =?us-ascii?Q?1NE+cZVXdYh/bUfEgmLAUtAFLzrwnksiOLAUDJI7YDjDgnJ+i9npsYJY/FKU?=
 =?us-ascii?Q?6uhjgjUgwCX/D4prlbc3/GivzwZnA1So5XG6pRsyM4v0k2aC1KVBMvxj/f3F?=
 =?us-ascii?Q?7u/QNUsz3bvrUnN/An+RPIBhdpNZWmPF3v61kduuXkyEwu8s4w+PtpTvukvX?=
 =?us-ascii?Q?wCct5MIYb0qksyeXLLojx/9LJwHGt+jzNN6Xckgk/GlFphSaPoLcz5KkOoML?=
 =?us-ascii?Q?gF14yonNVM9Xx5Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 19:24:06.9435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7e52bc-739a-47b2-615f-08dd45517e5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330

Enabled early booting of R52.

Ayan Kumar Halder (5):
  xen/arm: mpu: Ensure that the page size is 4KB (arm32)
  xen/arm: mpu: Enclose access to MMU specific registers under
    CONFIG_MMU (arm32)
  xen/arm: mpu: Move some of the definitions to common file
  xen/arm: mpu: Create boot-time MPU protection regions (arm32)
  xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm (arm32)

 xen/arch/arm/arm32/Makefile                |   1 +
 xen/arch/arm/arm32/head.S                  |   2 +
 xen/arch/arm/arm32/mpu/Makefile            |   1 +
 xen/arch/arm/arm32/mpu/head.S              | 174 +++++++++++++++++++++
 xen/arch/arm/arm32/mpu/mm.c                |  15 ++
 xen/arch/arm/arm64/mpu/head.S              |   2 +-
 xen/arch/arm/include/asm/cpregs.h          |   4 +
 xen/arch/arm/include/asm/early_printk.h    |   2 +-
 xen/arch/arm/include/asm/{arm64 => }/mpu.h |   6 +-
 xen/arch/arm/include/asm/mpu/cpregs.h      |  21 +++
 10 files changed, 223 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mpu/Makefile
 create mode 100644 xen/arch/arm/arm32/mpu/head.S
 create mode 100644 xen/arch/arm/arm32/mpu/mm.c
 rename xen/arch/arm/include/asm/{arm64 => }/mpu.h (87%)
 create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h

-- 
2.25.1


