Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC99F8DDA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 09:21:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861675.1273687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYEm-0005TI-IY; Fri, 20 Dec 2024 08:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861675.1273687; Fri, 20 Dec 2024 08:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYEm-0005Rr-Fp; Fri, 20 Dec 2024 08:19:56 +0000
Received: by outflank-mailman (input) for mailman id 861675;
 Fri, 20 Dec 2024 08:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djjC=TN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tOYEl-0005Rl-0L
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 08:19:55 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2416::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fa3e12f-beab-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 09:19:53 +0100 (CET)
Received: from CH2PR19CA0025.namprd19.prod.outlook.com (2603:10b6:610:4d::35)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 08:19:48 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::45) by CH2PR19CA0025.outlook.office365.com
 (2603:10b6:610:4d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 08:19:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 08:19:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 02:19:46 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 02:19:46 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 20 Dec 2024 02:19:45 -0600
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
X-Inumbo-ID: 2fa3e12f-beab-11ef-a0d8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFum/HCCOlr8MgfWgyTHRY9qJCFCOp6O6o2lWOcrjBQlMu7fn6k3wTg2mSX6rO+8I8MwR1o+gA4hp7Ag0lVCDwfgl5CBy0Kj+tnMApjNbacG5+F0BPw0EP8C71YQWo5u+I2ojQBgJy5kNF2MrSw/3DqsR1NvIy13UfavnWGZ7mOEEUumz4TFfE8x9CRPFSbISZhSxLwCpTeeY6QHWdxQ+okWS6lf00BIn2iu0A/yUuX3D/D9R1WA/K9IHsxgxxLFYNuoqaPaZC/qJOSnye7L7OKTjssAfU5dfy+S5d/YNIot47Y/3neA0ZhiNrEpFL3nvpZgIJUOxxoCuecHQVKlZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjFwPdlJKALonDUST0I3yiYbwt/LgZZy+CdxllRTzJo=;
 b=ZQ8dhbu7EkXCC59UOSemS2dAW6Bxd8lcdwNJBdKR73DTfKEegoxcvblrQiiJZf3nz6UDySBN8hDrFI3ASzIT19vl894nyHfMRZ9k6ZRSZC211IVY29INk/o5XajJyunbBMAZVbRR71hYw5UeZdITR/uKCSPT0VjWrC4aSTnSfh81urD0X5UQBMfKLoQSE985oICkV1oHKHE22900nUe5tiQSnED7/RSOXg/H+T6O+6Fr4sDN42LcBdCrRFZqVZ/6k5G3La5NiNvr3mbPUhKgcQrWpOJjVOET88LRZUzsXk7NThsq+yB43y+wDEXeOhGjFeSTWc0ALPsE25y/VXdjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjFwPdlJKALonDUST0I3yiYbwt/LgZZy+CdxllRTzJo=;
 b=2U3O2wgdcjVlQtEwnWyv6fog5VJPVd1ozFlZ6mYa32CIs5YKGYUw3JpsLmW023EehyKk/WRhNHO+ZcEwhSmCyqg9lTmZzOQrQmOmk/kWNWbFmMv+fJQjueN9ATdF6s2Y/TftD6+1vIjVfO/leOh3s4SH9vkhIWKZtqO0RZkcsLs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, <carlo.nonato@minervasys.tech>, "Community
 Manager" <community.manager@xenproject.org>
Subject: [PATCH] CHANGELOG: Mention LLC coloring feature on Arm
Date: Fri, 20 Dec 2024 09:19:40 +0100
Message-ID: <20241220081940.7954-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: e610a6b0-993c-44cd-1b25-08dd20cf1137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RFyu7mWm+YP7d7c2FUPzgkmAuFiBs2n7XTzYoptb5GsEgpp1hpj8A/mQa9GI?=
 =?us-ascii?Q?r6HR5V7xKygDY1L/c9uWNqVLw5nLdiQ8vMi7xvsdjNFY0t14zqfnDBqmeNu+?=
 =?us-ascii?Q?zOEtdlSs+IycLIvl02nH+G5kV17ykj852b7xBky4gtmoeTjIEJwioUvj6Fay?=
 =?us-ascii?Q?DGkaReurTMfANwn1Wt+gQOhXA4v+wyPy16rn4rW4p1cnOxwPigYQfaslzeYZ?=
 =?us-ascii?Q?DCBscQWkf5akx4v5Sdj0iTxDaeh5mEnc619/xBmBPM5qQXkpYgVXhwL86Kzx?=
 =?us-ascii?Q?vbOl587WozrOOMOYywdI7C/L0lZRHlKnSprfl3DIEvJxYXn56RStj6+p+I3B?=
 =?us-ascii?Q?UBl1UmChvMyZ1vVGZVIHAMEsq5M4jdxtDHnSqHS/WZSWRJx2XXvTnUzQwpcH?=
 =?us-ascii?Q?QZhhqc8500zGqlbaogOaCGRm2ChfhyRp1ezN5U2w3YPai0GMGE581QZ+b8PV?=
 =?us-ascii?Q?8P67wGpUZNUnVM2PXBFxz2FReQB4l0KdAyvYBNcj9Hv8YM/40ydlz//Ae/cR?=
 =?us-ascii?Q?Z2oiPOKS1XATI8TNmgk6cehj4IoL2OMBAUadxC0scemYJ1dfQ38gcVQCBQVS?=
 =?us-ascii?Q?/f6QqgfWywueQ3gN/ulK7DvlyafgsRtDwhZUb5mtvpRph2IxA1JAY2RhV94O?=
 =?us-ascii?Q?vTVDhPfDXeT0fNzIoITlu4F2Pj4HlnxZDOZyoYDV0Jpl+vcldgOHPKvOG0Sc?=
 =?us-ascii?Q?MI6SN3gXaxNYtyGreWyIF6iZ2rseTtft7WDjdRLzjMKUpTKrH/jv+aNaoiKb?=
 =?us-ascii?Q?9Jy8swEvzqi1BMl59D7ai/qLMWctuHJuovDUfY6rksbKIaH3lt4608ruLHuj?=
 =?us-ascii?Q?Fxa65muePT9ZQ8PLwAiW3f3R0nhjqONbNLx+hxLZOzIxi/nh7cm5hK/nG9/y?=
 =?us-ascii?Q?JHGpUvsRbA9MfDb2SfYMlCUH+8SEX0LWnL9Z/qIwCL6P8s3+KcN59zsW0qDf?=
 =?us-ascii?Q?gdSchB3FBEpu8ycbU5wciCsqMw2IWhxjg1Z+pz8WI9JdC8iGGRer+ZveeK5R?=
 =?us-ascii?Q?EYDoSzBDWM7c8huTWzpdIcYrhpfOJjktP8n2W77sU71PKzqbDO/1lyJiZkdD?=
 =?us-ascii?Q?fqJwBl5ZxI9deq3X5cn8xdZ//FKnNY4j1O4ZQ7m5rm2vVUARmTRnSPmj19Cd?=
 =?us-ascii?Q?jAqxa34jwDTyks5h0fftiiOKi9cEh0wMSOREpdQEWz4/VIYLaHEchM0vnn6h?=
 =?us-ascii?Q?24ps8BPTb785AjRJCdgd7AzfX2fapdCx/T6jkpHLWWbiov3N0yPXRwNGp83h?=
 =?us-ascii?Q?lHBcfeTQL+1rqdhh/ERXkZChujYJzjt8rmdA94EmIy9IfdgnN6N18nE+FPuK?=
 =?us-ascii?Q?qrJJpMX8s7XSK8Vd7dpC/K5H2tueOWhS+D4emgSWnpsQu3jk9m6kp9AoXPFw?=
 =?us-ascii?Q?T/WSAoio2S8/SSMacj4NDJ5DFATDdbx6OEYld9Dh4kN0Kz0UW6NjzWhJmG4Z?=
 =?us-ascii?Q?4GcNQoiBIyc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 08:19:47.4840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e610a6b0-993c-44cd-1b25-08dd20cf1137
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275

It's definitely worth mentioning as one of the most notable feature on
Arm this release.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index fe6c4cf9432e..8507e6556a56 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Support for NXP S32G3 Processors Family and NXP LINFlexD UART driver.
    - Basic handling for SCMI requests over SMC using Shared Memory, by allowing
      forwarding the calls to EL3 FW if coming from hwdom.
+   - Support for LLC (Last Level Cache) coloring.
  - On x86:
    - xl suspend/resume subcommands.
 
-- 
2.25.1


