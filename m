Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3EEA4EA2E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 18:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901398.1309362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWWE-0002PB-DK; Tue, 04 Mar 2025 17:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901398.1309362; Tue, 04 Mar 2025 17:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWWE-0002MG-Ad; Tue, 04 Mar 2025 17:57:26 +0000
Received: by outflank-mailman (input) for mailman id 901398;
 Tue, 04 Mar 2025 17:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6XUS=VX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tpWWC-00028H-GV
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 17:57:24 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:200a::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c78b2e4-f922-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 18:57:18 +0100 (CET)
Received: from CH0PR13CA0031.namprd13.prod.outlook.com (2603:10b6:610:b2::6)
 by CH0PR12MB8531.namprd12.prod.outlook.com (2603:10b6:610:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 17:57:14 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::d0) by CH0PR13CA0031.outlook.office365.com
 (2603:10b6:610:b2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.14 via Frontend Transport; Tue,
 4 Mar 2025 17:57:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Tue, 4 Mar 2025 17:57:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 11:57:13 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 11:57:13 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 4 Mar 2025 11:57:12 -0600
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
X-Inumbo-ID: 1c78b2e4-f922-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsHbKtatHJZUFSa54gKTti6h/Oz3bAOHZqs6UOwhdmv4pHaLvB7oTWsqNJy1/kOCVvTJplBTR1Jq/1GYx92mr+OW38RJmjNC88ctX1jIemYbkqCEYI6Bd4/CSr8x4BWPBlwMUMZgbqaQdNU36dygOMKW+HtasihuqTM6dpuM0h6ghAdHlEg8SqOHySIdebork5cjmAJEzwY6xtrh6DLYOyOiO7aas/324FF26dM+WoiZEHW/e/4ONLn4W7pA2cyE5U4NyFE+kp0zIlJr1Qaz0OUzeMcUw+2F6HMVKATXDnAe2qfp/E37umXoIgSbTWGpBM7UwBXKgEoWgfWL7EjJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnP6PvQTVzPQzi5YFHPZy9roBOOD71m/koKCQNOHA1k=;
 b=bftjDXN4mUAtNh9rfg6moqyq/WzfP/FPHQEIrSn/EhjE09NiJBYHVL9Xoj/CQGw4uM7XBx8a9hzdbZ8ogpPT8nBR6VaTXkqy9fMABHl47OqdXdNmOC42Nu1iLNEsDYYxUbsBORZzFxyJLUfv0tOTVQdz0Xrlijsd60JZt0HumkYzRENUKZwPeFX0cxvXJXOhNqah7bg3N0R2rtfqcsG2Za2d043mqZONKEcXJ2TvwN3U0/AM5qbRjGEDEzC9HIASzaC57nSCqa/CSqZTp9QtCWStlP7BYQ4o/rmYik4sgrJ5z8cUrAnr8WIP8/4uucXV1uEXREjU6VBIcpSaS0b2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnP6PvQTVzPQzi5YFHPZy9roBOOD71m/koKCQNOHA1k=;
 b=I2qaSl7Ffe89kmDYSiSAaMILvCYeNiFOE6gNEpgX/odhtDyhM/x6OMpWFUjj2AhNzV/F3MQG0/SusbpzPW5sUEBe38o3bj2+i+rSSyu1tsjA6aDdLpK58VuVCKUCqMYGRllrrcO3XqR4bVQm1waq5sNkKQ7nQQ6A2/K8pGRrJhs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/2] Enable early bootup of AArch32 MPU systems (pre-requisite patches)
Date: Tue, 4 Mar 2025 17:57:06 +0000
Message-ID: <20250304175708.2434519-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: 59947812-fd1e-4628-8bde-08dd5b45fea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rlkdj3yDQ09FSo7FQy9UDWf3YunbyaxRkjyZ0Hcj5x1NtkhjsYZZBoYZ/0i0?=
 =?us-ascii?Q?ra0haK9DeTJZiRht8LJMUP1utvWjfmoK4QH+GQb8edUweLbHqK9O90ZUhzw+?=
 =?us-ascii?Q?aRuBQZCj2R23o6YEI1/vSigte4l95BbxQEvgdeqjAGTtiq+9xIryvdKYueYu?=
 =?us-ascii?Q?argxDmsu1xV4lSBPjublfCQnl3TH6kQ0gv/o5TUJi7TbzNlkZKxK74cH/sLj?=
 =?us-ascii?Q?hHex9KLLhYb+AYzETtV2vEXoD9RZROCxr2EOhyagva1tKgMFO0UmjAxNu9tW?=
 =?us-ascii?Q?6JhUmMzPOXSainWWv2ngMilgYRY3xwjIfk5fS+fDSyo5Kd4Nd2D1j/mpViWN?=
 =?us-ascii?Q?4OrFJT/KBgbVR3XPrWBQz9FFOGccg+9eE9vaW7ROgVkMpBbxyaCkCyT6WpHT?=
 =?us-ascii?Q?gsTIzDTAfGKVWGUvzvBBOZ+T7iL1ZW0R5KLuiLNlHljGHWW4dHjlgW9TvH/9?=
 =?us-ascii?Q?eW7tqyDOK0MdP+iWtGg2Y3b6D54dKvVLVXpXj+SFc73ptQ6JxEX2I7fXNMYG?=
 =?us-ascii?Q?vHc7PpFrm9L3g13ywTF0nY6CkTbroGyqtvemCHkcHDvzjT/OLbPytxb5jB9z?=
 =?us-ascii?Q?rWji/FTEnpO3R5Lt+MYfHpCqjiPa1VcwPhsf5gpCC8X6fMQxU9dHWiEsg4+0?=
 =?us-ascii?Q?LZINZpKO2KLZYym4r1nBRQj1V91wLpc0TlO8tHQiMWVC1nbkdXfhHgAaWfUO?=
 =?us-ascii?Q?LRAQHsnC6/ee+RKmr7xi7MTvUsyoNJd98TrNp2R3GmpFw0z72mq5m940lbir?=
 =?us-ascii?Q?w13y8K6Fx0W2oj4p5Ou7xd/XrsE+lmFaHCgDbLSNEM/nQWKOh1cFmezG3Ztl?=
 =?us-ascii?Q?yRfiyNOOm5jJPQSITs2sgmRKbB9fo3BuKJfKFNZ0r8wGFdOw83DbRtD/F9mh?=
 =?us-ascii?Q?TjScHD1IQ7Ff8QQJJfdfNvwWKxAVrZlstc9dL3GsE1O3TVpMulDzuIBd6sq0?=
 =?us-ascii?Q?9RCBwRywyFK/d8lDLKob2WVKsO1HX+lsQ8yTnL8LeZL0TSeSdgsY/D26ZfsD?=
 =?us-ascii?Q?upShe7Q6YdAsSPE9LVA7XV1VIPkc0WCaj/eK8vNCWnCG5WUEoCLPmkj+Lmj8?=
 =?us-ascii?Q?jARqO6UDuhAaSpI5t1nPuAp56x8QqU2WMEIZ7HcM603SjlKYuSLNfjB+CCNN?=
 =?us-ascii?Q?B4Vr0RDMCFQt29WQNubPkH2s7oM21N2pCMI8QF7uDjYhoTlj8Sqdv6Qm7+lI?=
 =?us-ascii?Q?vhYr/0ZL6AeLf1l57zvuvBjRmFOvqqgmxLjgXUFIJr1h0Ent3H15DXJF1CiK?=
 =?us-ascii?Q?YvNf/MeRgetHSa9bQrSJ3u1mLMIW3b0QcQrDQ2jseHKcgakqDbg37/UHkgrK?=
 =?us-ascii?Q?lmqZf/URHRMX4XSeGK/VcE1AGTx1189PrVtvfTCqJwZEbGxYvQqY0xdGahtD?=
 =?us-ascii?Q?/K5z1YwVuuOscM2JIES8jW5IHO5tMFVhHc0b+e8ZearJ+x1oEfqhFc/tpfTO?=
 =?us-ascii?Q?p2+yjLrnSNk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 17:57:13.8764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59947812-fd1e-4628-8bde-08dd5b45fea4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531

Hi,

I have extracted patches 1, 2 from
"https://patchew.org/Xen/20250204192357.1862264-1-ayan.kumar.halder@amd.com/"
as it will introduce the common files on which the following can be based :-
1. "[PATCH 0/9] First chunk for Arm R82 and MPU support"
2. "Enable early bootup of AArch32 MPU systems" (patches 3-5)

Ayan Kumar Halder (2):
  xen/arm: mpu: Move some of the definitions to common file
  xen/arm: mpu: Ensure that the page size is 4KB

 xen/arch/arm/Makefile                      | 1 +
 xen/arch/arm/arm64/mpu/Makefile            | 1 -
 xen/arch/arm/arm64/mpu/head.S              | 2 +-
 xen/arch/arm/include/asm/early_printk.h    | 2 +-
 xen/arch/arm/include/asm/{arm64 => }/mpu.h | 6 +++---
 xen/arch/arm/mpu/Makefile                  | 1 +
 xen/arch/arm/{arm64 => }/mpu/mm.c          | 0
 7 files changed, 7 insertions(+), 6 deletions(-)
 rename xen/arch/arm/include/asm/{arm64 => }/mpu.h (87%)
 create mode 100644 xen/arch/arm/mpu/Makefile
 rename xen/arch/arm/{arm64 => }/mpu/mm.c (100%)

-- 
2.25.1


