Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAB8A20787
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 10:40:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878309.1288474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tci4v-0000SR-D7; Tue, 28 Jan 2025 09:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878309.1288474; Tue, 28 Jan 2025 09:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tci4v-0000QY-AR; Tue, 28 Jan 2025 09:40:17 +0000
Received: by outflank-mailman (input) for mailman id 878309;
 Tue, 28 Jan 2025 09:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WhQb=UU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tci4u-0000QN-DX
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 09:40:16 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2405::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de76f5a8-dd5b-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 10:40:12 +0100 (CET)
Received: from SA9PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:20::11)
 by SA1PR12MB7409.namprd12.prod.outlook.com (2603:10b6:806:29c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 09:40:06 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:20:cafe::19) by SA9PR03CA0006.outlook.office365.com
 (2603:10b6:806:20::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Tue,
 28 Jan 2025 09:40:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 09:40:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jan
 2025 03:40:04 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 28 Jan 2025 03:40:03 -0600
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
X-Inumbo-ID: de76f5a8-dd5b-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/l9EMMOBzYSolzKXqDsn0hDnZ0AniXT0c74oxtwbeg609Q0kf+Qz119SyXFacohW5NjUL4a+l3F6RPVj2OKtCAu5tEAox5aU72oOzBV7uHf2F2EgmeDman81GXMkuz0IbvLT5iy4Qs2i+KQzq0WWoXL4fYgaaS+DVtbVnRvz1nF8q3k+Lrsvqevvxj3nXBv/BrvvjS0VoEXoXgh7vEkqanaViCHL4jgLTL9MWrd1RXUeir0w66OGCOxpy409C81IT8oClUYTqG5f8CR1b5l9U/1gF/VuqF040G+yB8CUAeCTcz3ohQ3wzGtUirKDJsfpvljMcUpchqu99+nW06iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w7NW5Tq9BQ4T5PXnzy3s3SW3uM9h9Kf76VWukGYyXA=;
 b=oNgfJShg8XxD9fpIQQkKzwu8V40cSmjmP+KVcIPKorbUQ4HVhtgGuDk8ZpBmIPwDenjTkICdd/EbbiUjphP5CrHS1zJbdlcYSCrGws/DNfj0IulOSKG+rdBsr+82NG0MjuuypzDRwO6F1ejifbS41TSpeQBdIJdYw1OzWy/oabVi16T2yxOmpX0I789Pn3XJ809CLnQSiQT8FV4l+3ZVAcAaa2cGlgPskUdcKRvBUKJgGqkxqWDBg8CPkuwagGZAPIVFghvCK4q4RGXUF7ggPzE2lL0RxWVwQNHFVnPijLHog1QIFZQS/m5yVI4VqKPFJiwZ6igKb/26dKQGKR0eqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w7NW5Tq9BQ4T5PXnzy3s3SW3uM9h9Kf76VWukGYyXA=;
 b=OgrviBkQuzAXlUTUfi2uKRTZ/jommb/SgU4zomRbwrbTuBfqtAV3wsIGmXcEm9TqY4rctNtBprMM2dDllprVrYllezzFJzIy4k4R38Kpw8HIaGEqzSx6lrMz+CRzGtnohv/Xi1QeGB1F4J0BZNpJOaCU0vXZZD4GUJoIIfi0kks=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<oleksii.kurochko@gmail.com>
Subject: [for-4.20][PATCH v2 0/2] xen/arm CONFIG_PHYS_ADDR_T_32=y fixes
Date: Tue, 28 Jan 2025 10:40:00 +0100
Message-ID: <20250128094002.145755-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|SA1PR12MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: d43b8445-3f09-440b-7131-08dd3f7fbf13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gVfC7os4e5q85qXyUoRoxDHNn7IQunBRAGuJRTtN/U0gAnA+tZEUepnD+Oxh?=
 =?us-ascii?Q?gyNoDOVT7bP/YMZ8f9RBtgIFIeCQSN4RQW+b/G+V9UPXtfcgpQFeuoedPBaw?=
 =?us-ascii?Q?F663Tawx98+ms1cifOgj2ZRQyAtM20woUbq8E0j54lc2wO7WyfoX3sNYb9lW?=
 =?us-ascii?Q?WRqhUWeDHvYsHQOb9MVtmX1xeUn3TBJ4JgB0lmVM1dHRlDs2yDaOHSiSJK7c?=
 =?us-ascii?Q?H0T6/QO1/c6YRvJ08zNQ738amV9bSvWwvipvUJxriRYbr/Hscs/j/TE+r6+7?=
 =?us-ascii?Q?+Zdew6WyGtGQ4v3UoIjNVnvw/DaH72skxmKyRIi31eOKilWATCvO/ChB2BQO?=
 =?us-ascii?Q?vrkoaNGmdwLgePwRDDW3IxckZyhEcAgCH2KFCuEgWHpIwGPnwklXS8mPdMa2?=
 =?us-ascii?Q?2AUtIryxv2O4Lhgsii0D7DXRvsNDRLq/wVzUV/BjcOg560nwx695LW5QQl99?=
 =?us-ascii?Q?BxZxB/AYkRwmMPiref4leWaDDOCUUu8h1DKk7x6Jib1lcPslrtWzJ97dkKnx?=
 =?us-ascii?Q?NSoyOlyRZ+gr1n+DDBWw5d86tltdOQAZlh+XorI94+wq8SNMpaj2y5nn8gbg?=
 =?us-ascii?Q?raYfsyERUclOqynJay1sIIeDu7ykejj2w/VrnnbS9Qs4RAdL2jtmHGFtAiux?=
 =?us-ascii?Q?T2TpoWan83CE7hjL4mGKCQ9cFqCHu07QxAISBpQAZ1vyntuMkyDJkZJqbSBF?=
 =?us-ascii?Q?WcVxd6PIipe0khGmBL5HWa8qvmqZ8cWnbZ9UuQ+eXDkk6wbHLTS1l1Fh+USC?=
 =?us-ascii?Q?krMMUKJ5vfI/VWQI2sj1+wxR1Zw/VDWFy0d9vihwyaJBFHfJpEajiwToN9vH?=
 =?us-ascii?Q?O1on5omWaZ/XJwBqfJo6gdUco3pb4GRbA0VN7YTkbKsGnPCr+uy7P/UARug8?=
 =?us-ascii?Q?Zx6lTF8JKVA+FWfUgpDYuq6HIhmlYvA6kc1HbyxsQM3inRQHw0X+of41zItY?=
 =?us-ascii?Q?flPlz24HrKuG7bYPd6L23lLKbIcjmsqkinocAEukzjeRonewzoDFNumi74Ji?=
 =?us-ascii?Q?R/xspEfeE0pP3BB64kfduL6+lEV4sEK2Z/SAgmjJRg+Oxg+yWL+SYm6Rkcmz?=
 =?us-ascii?Q?XCwIVhexfhXDWUcCDgK/ScBNh4i6ruwGCWKSdI+AkQ39ttWqY3JRWtOhBr1f?=
 =?us-ascii?Q?Mv/vj1fgyl3Y5DvktpVhVPPEfvEbU8reEdOXGfUJyKY8LoHEmk5MthyNWVtV?=
 =?us-ascii?Q?S2dyM8Cnca8XVlaciC1lOFtGAjJ3iy5f4NlYN1oDeW06eedOHzI/wWPS3wd0?=
 =?us-ascii?Q?b4hu3RS7LRBFYZ4nhSgU9vYD0lK4z5kDiwp6p3YbpZK2SuuRqJLB03KtQ5t4?=
 =?us-ascii?Q?zkfpAMCDVsLLpHNWjU26PoPR1AKOO1u5JdSdo5sgI6OiELhMdO9dLlaZdTH8?=
 =?us-ascii?Q?YZEyMKdWupun13cCNNmx5Bss4flXxtKtRlcPEIJqVrhcb6J0DXdiQM/Zv7Q7?=
 =?us-ascii?Q?8h19AZ3bhWtc0sIQctHY239dgr0yMn8wugTOZgmZNim7XTE9gi+UWm/UvvUE?=
 =?us-ascii?Q?wuZ+yLmLDZ1G/RI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 09:40:05.4659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d43b8445-3f09-440b-7131-08dd3f7fbf13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7409

This series contains build fixes when CONFIG_PHYS_ADDR_T_32=y.

@Oleksii:
This is a release blocker.

Michal Orzel (2):
  device-tree: bootfdt: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
  xen/arm: Fix build issue when CONFIG_PHYS_ADDR_T_32=y

 xen/arch/arm/include/asm/mm.h    | 2 +-
 xen/common/device-tree/bootfdt.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1


