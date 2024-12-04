Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165BD9E4151
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 18:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848682.1263514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIt5U-0005GX-Tt; Wed, 04 Dec 2024 17:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848682.1263514; Wed, 04 Dec 2024 17:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIt5U-0005ES-RG; Wed, 04 Dec 2024 17:22:56 +0000
Received: by outflank-mailman (input) for mailman id 848682;
 Wed, 04 Dec 2024 17:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Nih=S5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tIt5U-0005EK-4B
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 17:22:56 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20616.outbound.protection.outlook.com
 [2a01:111:f403:2409::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64aee8b5-b264-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 18:22:54 +0100 (CET)
Received: from MN0PR02CA0014.namprd02.prod.outlook.com (2603:10b6:208:530::19)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 17:22:49 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:530:cafe::fa) by MN0PR02CA0014.outlook.office365.com
 (2603:10b6:208:530::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Wed, 4
 Dec 2024 17:22:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 17:22:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 11:22:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 11:22:48 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 4 Dec 2024 11:22:47 -0600
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
X-Inumbo-ID: 64aee8b5-b264-11ef-a0d4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8zjalz6u8+zdHpnyTTJakOm7GQCoO+YGjFP1SeF5P7F26B8LCrdJyk+qEWfmXHx+6X+QztBXz+rwhGlLj/N7yxPvD5UIFCDv2ZEXH4fwE2DbwMaufeb0UXeHFLdlnAIgspTh+/wTXE3MwIE19ZFxEUaAqHsDDEoh7BRKrcNBwBy3YEGC7dPfcBR+SVAc2brAAZw75ndEqk90Cwl2Jc3m6ra/Oo1Eu0xBqkmCz3fHcIrgKdsAdK4SdB7BrmpL+0UsjzA/dibXIsTCwUC8CkAV8SOAtxfQeydC3AKeF+UzZ3Bymr1zxOEJdEgn/gO/zNw22D3QkuZo390wFNeFyfB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEQtjR1kGtdkm7vjc53mHIojUpBALYz8vbwOTtXYxN0=;
 b=Popg1oTQdvtOVmtcMGK8Or2hlq/wN5kyxe5ReM2Ee1jy0P29ZloPfeXZSxr6CNUaF8Tvj//qPjgim0SLI6aDOMAe3ZLRFTGQCb1j4Wh2+/zG5aDRLk2UurK2ujWVkDnUtBjZqHPvF6gMT99XtDDWHd4o6kc8u7SZ6D4z9F27xHYxdmwoNmjyLeLspelEyPc39QtMs9Hn78xaFDlVGsPTpzwpHFnlYSApy+l9CvTs7eSoy0SL+jNwZxrwkX52Q82mPzKIfWl+rwMarSxSApeHlFuhptpMTPzCfBE3KFWXpBm3XpFZGvCrzHA95GV9dRe+3QDSPpaH7vb0D1o+1Jp0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEQtjR1kGtdkm7vjc53mHIojUpBALYz8vbwOTtXYxN0=;
 b=4SIaEWNRSXHSfELSqwN1y5HWMpOOU6IPpLgoRCZ6X+m4JzrGEevKkLHPbIn7zTYJkl9C45cEfAqXjUtEe7bnpidsK9gcwZ/42RZeL3YHedRofnUwlDe/6ebWYYOwKIrJj2vS0citll3BKlG0qtGZKy1/DfjQTgNz/3sY3oHw13Y=
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
Subject: [PATCH v3 0/2] Enable early bootup of AArch64 MPU systems (Part 2)
Date: Wed, 4 Dec 2024 17:22:41 +0000
Message-ID: <20241204172243.1229942-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|DM4PR12MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 451c3543-2ba7-4047-676d-08dd148846d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NChCat2Q5NdeG7G19/Jqg2CU9YIEKymyw15+hKg6ILij1EBgXNWEdtcEnKjM?=
 =?us-ascii?Q?bExC7BfKz6CVC5Jkolenu7EEKj9wWdus9pH5s3w91lqURN5XylBjGCdgE0GU?=
 =?us-ascii?Q?qwybmXNlM1IliOBno8ycklC3CIyMhA3mPQBVvpjdi5Bjzy9r6iTySEGJSiZf?=
 =?us-ascii?Q?TV0zgh1Xz2dWTPKBu12MVLXQ/aNwcJsMOKOxMuBG63bXM9YMcyCg2FWf2o+r?=
 =?us-ascii?Q?VkzOh5kZqPRaE/TC5mAFQ3OiTJKTgtlwd5fxu5rH6+O72R0Buv+q3PMCINq2?=
 =?us-ascii?Q?Rh3tQkYY3TKnJXa8YcyZh1E1QvVhjQ4YOYB5JYq1kJ8MXsjEaDE/FLSgShhx?=
 =?us-ascii?Q?nanabX17ksy+PpRcjwUshfqcxGe/x4Cupl0KYoytIku0EzfcYd5XJcpMUTZ7?=
 =?us-ascii?Q?f9Bp/+nlmImZuNiRaEky4jl7SZTHB7qscz/nlV9e8xdqw8gGjyPHAxCWEi77?=
 =?us-ascii?Q?qXEtXWt9EA7p6UoqDj15r8LjD1o0mWb9iaSb4I6IKCOtka94GefxX+vSCu7e?=
 =?us-ascii?Q?x2Yst0UN3xVX/llIVEfzbdrzuf2k7Xcbtq7UjaVEgXArkzWCdR1ifoZpAx/t?=
 =?us-ascii?Q?zeYQqOugjAcyZdzOh/YDr0dMWRgBf8vDH86HwaZa7LZy9f0z0VqXXGtxPK1d?=
 =?us-ascii?Q?yKoN1S2FatpFaYGypueJbL5h6ReQK5LmNUvdM1x6iUIN1O18PEvXpEMKnZTx?=
 =?us-ascii?Q?FFIY3KfjcMLN3dPv35I+5hwdUTQqL5gduLLUrGLfFD2/jfBqpW3WbIhqEzSY?=
 =?us-ascii?Q?q3SzloIormR8NQ7BtiNs0b8qJKWY5sXPsVa40lX5BiZYySo1+aYChfG07PU2?=
 =?us-ascii?Q?LnV7ltul/14fEoKaMNP6YdXTnAjkO3d9MQes0pdTug/AUdxYnmDgQiGXRSG6?=
 =?us-ascii?Q?JjMbR3uKUD+zhqPWpO+k/RysuDcy6z4ekYUxvKXo/MSNk+d6seakOPUAtpQO?=
 =?us-ascii?Q?+kBul/VfAerYejnS2jFGYl+YnQMej5c5lCa4ni5SBVu+oR2NP4EGIbyJRZ9q?=
 =?us-ascii?Q?jBJqwcLn7mzhpuwjFs9gBGUill/pQK1ZLecEnUmezm9SzKdFBi4OA1Flg0kZ?=
 =?us-ascii?Q?RrqZIVRGhK/x+mjI9X6BmdA3IyxTzH7YyEAWXjj6y+ddEe6XCV2ZK7SHySOp?=
 =?us-ascii?Q?9b+0upgO7d95bN4Y/gq6eg08jIjSxO9lfM9Q2du3a/pKgEPa7xX4mN7JtE4l?=
 =?us-ascii?Q?lpeyAxlvg7vjLI5QW1s/AkUySaVGOBGNYeFoz/OBfsHJS0/ioHDRKd2zW8Oh?=
 =?us-ascii?Q?hD74zCTl/f5bake+K9asaA9xrIzl0yK7KqP9gGWoRnHkbKz8Lff57KQTt2e+?=
 =?us-ascii?Q?AyRx+yFVXLP0FyK3O29eBj16sWeem/zFkm++/xMZoLYDfvJLgCtDd8vpCEuK?=
 =?us-ascii?Q?DthC/1GHq2z2+EKXYxXJ1f0gmnyzvjTP7QqYd+NGuCCelSJmAf0oBoFqwaFe?=
 =?us-ascii?Q?RDxpfk/32OGarSrZSxz7wxJfC+/vAcpj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 17:22:49.1999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 451c3543-2ba7-4047-676d-08dd148846d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669

This patch serie concludes earlyboot support for Arm-v8R AArch64 MPU systems.

Ayan Kumar Halder (1):
  xen/mpu: Map early uart when earlyprintk on

Penny Zheng (1):
  xen/mmu: enable SMMU subsystem only in MMU

 xen/arch/arm/Kconfig                    |  4 ++--
 xen/arch/arm/Kconfig.debug              |  7 +++++++
 xen/arch/arm/arm64/mpu/head.S           | 10 +++++++++
 xen/arch/arm/include/asm/early_printk.h | 28 ++++++++++++++++++++++++-
 4 files changed, 46 insertions(+), 3 deletions(-)

-- 
2.25.1


