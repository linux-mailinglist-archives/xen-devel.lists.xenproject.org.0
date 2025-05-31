Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C242AC9B15
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 14:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002020.1382045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLjD-0008LN-3n; Sat, 31 May 2025 12:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002020.1382045; Sat, 31 May 2025 12:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLjD-0008Ia-0I; Sat, 31 May 2025 12:54:23 +0000
Received: by outflank-mailman (input) for mailman id 1002020;
 Sat, 31 May 2025 12:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L58R=YP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uLLjB-0008IU-CE
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 12:54:22 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2416::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d14deaf-3e1e-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 14:54:19 +0200 (CEST)
Received: from BN7PR02CA0032.namprd02.prod.outlook.com (2603:10b6:408:20::45)
 by PH8PR12MB7280.namprd12.prod.outlook.com (2603:10b6:510:220::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Sat, 31 May
 2025 12:54:13 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:20:cafe::66) by BN7PR02CA0032.outlook.office365.com
 (2603:10b6:408:20::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Sat,
 31 May 2025 12:54:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 12:54:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 31 May
 2025 07:54:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 31 May
 2025 07:54:11 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 31 May 2025 07:54:10 -0500
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
X-Inumbo-ID: 5d14deaf-3e1e-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ntq6QnSGaM1rh7z44O2dvulKcTpdCPSm61npkA3cA4wixPvoI9Nc4TvHhquEqcU3VT3p00aetp+sPK9QaPxiIe4f9HqZNKEefAngW2JK9EqYOa+dgCb8nlvDPDikGVlUxD/YUXD6YXYJV/8zaBfkIbQeiDooS3BAdjUxdxVrOVwVtTblMqaKvJaVLDIJplMo8SdGuXW4XuV0LA97Ru5IixqcP5h+JCB6AJCAEzhbondQTLCdqcQyBcm+D4SD49UTwHR6XcrdPaSH76GMcSSXLXQIaG1op8L7vhfGfsr+Ix5HuOCKl4Hio7S5NYMgENp8eh/UwvQGKSvEb/YuJ6cm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFy7btpEmF4KXga9FWdbj+/uivjqM8/1W1b/KcQpMbk=;
 b=VxoRf778zj10/PbcSgXLjBjB7K1ghLAE1VLkRSgs++eaR84+B5GAAS2SUWunQCnOcelutIeMqd7/pxbRhz3eqVmtXtOuZh0tP2cfPDk4uqXwqqgfWKx9ud83NnT7bWh/IgVkcxAIQvFlbSR5qnbHFqcbXXFCqxRXiFrNkHmrNjApwxZkO5/weWH/mFQ1/gTIPWnmWhZhPJPBwFWYGAaZc1PlN9tv/2w7ozOtxL46h6RUa52jhKZ+dNPRJH+lICf9JGdPf8Kdwtod7I7THsyw7opoiVrR/Ai/MfCNe5gNw1Ip7I61Yp5ZTGSGK9l1K7OAGMq1NAnjxswDOC3LiFlmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFy7btpEmF4KXga9FWdbj+/uivjqM8/1W1b/KcQpMbk=;
 b=V72TKCCiS9kU0aZ+24VNeSaG9kC7gw8bRM4XNFiFxBMXCiSKNLk06JKHNfyO+eBWvrnIZAxAlHvvMQbR+1XhNTqdRAZB3WH5HriOtuoYUvIazEDGoyNm5SdnOZZ2M4gQqH7PB7SW06neIFEtufP6JZsgClwjHGNkEwsTjNVE0ok=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 0/5] vpci: allow 32-bit BAR writes with memory decoding enabled
Date: Sat, 31 May 2025 08:53:58 -0400
Message-ID: <20250531125405.268984-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|PH8PR12MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e78f709-61bb-414f-dd6d-08dda0423dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+zTDH5gdhuQ2hVhfuh92CX6Q5ILWn3QnITslN8JyFa7hAeZBGC9v/zbHFVm8?=
 =?us-ascii?Q?hpRSvrYAuEc0EgOuMche2TnkoGZHGOkvB6lwkTczESLBKHlZjgCwr/FGbgWw?=
 =?us-ascii?Q?+Q7DoXDkIVCZp5PN2LjDwavOr8Bj/ODbM2oNzGdaQuBYqIxAQcqmFfEJ2cSQ?=
 =?us-ascii?Q?kWpvhsRBvVAQzNKdciDrA4obE+2NyxoQZ1KPi1xlyT0aCZCupL5ttbYkIor9?=
 =?us-ascii?Q?hjFjlHS7va0I9jYUJdPVO++0HpC9Qlo/GtzRZvjJmRHaD4myo8Mm+yFR459e?=
 =?us-ascii?Q?tYpcfOeoRwsx5UmKydtidMkufmS+KM+SpctW0YYn4KnFDzKgn3T9OeSFWCbR?=
 =?us-ascii?Q?T85duIl6zl6+d2AALSEl1TVDopjjM5hNkpgAmuQkmclZiTItbyaSrm6gwbxG?=
 =?us-ascii?Q?FciaIkYVRroxZ/h7O31hKZkSbDPDOixr4q3w4Or8c4Dn5RR8KP/n834jXuE2?=
 =?us-ascii?Q?UqnqtR9pMYmPJdwliSm+hMnd9O35tRsJMWzK6LJJSki/uqpEkOxJQF9fK3Zc?=
 =?us-ascii?Q?qKZxJUtgPZfMIdmxxbNCjJPHkGYQKucoXVYvyyiM818nkj9PJM1p0rYJHOeo?=
 =?us-ascii?Q?nsX1QpiCjAfu9heeINGSdtV3pUaV/75rru/6Zn7RLNTV9auZRGXCLh2QduUU?=
 =?us-ascii?Q?kZv6uJ+MyRQFm4cAedB/lacWZUXtpMeBYtoftEximhUGK89nOb9eGSi34iPb?=
 =?us-ascii?Q?dri2ua2ZeN/795PMCsp7tHaOw/E3bTrMDj2TUxXKXgSRC1TwEBA2aousnAwM?=
 =?us-ascii?Q?fHloQ7O9xca5DvbnIDXR0YT69ygU8zNOtr06q4MC5NeW1qxtNr7C3kheE8GT?=
 =?us-ascii?Q?tAkmwAHYrakhDmRrLytgV8F8vuuMcCjU7RYbjlKnLk2MvlTAcLyQB5vlUbGE?=
 =?us-ascii?Q?R61vnKJwEIIloeVu5MfUx24wUSpteeX5QdVmgCS5u+PAjL/tapB9hHap4fOO?=
 =?us-ascii?Q?k3gYGuScCBAiMjShoJrtf4zxDwRdxAlmC5LJG0eX8MAMYunyWrbYWG1p+jjm?=
 =?us-ascii?Q?pSadzv423GuPEAG3qHyM+2yBqRNTlm/FDz2vkLCKpi8DiEAr2D3sizux8p9S?=
 =?us-ascii?Q?9cSRXV1qsNXK0mK0ZxCIlpH7gF+C03MJMWoUumQya8B86n2c7wqeeGKSLz8Z?=
 =?us-ascii?Q?8NP4s1qudb+AIIIsFtGRX+ymf1hdLwNgrdxXcSmXHcWr0tf/1yIBO8k7ttyU?=
 =?us-ascii?Q?Q9+jwANEvgPOu9CVltRTcndMPBcfX7eBRDmzu/X6Mj0lcQnh1F9cAjJ3tWun?=
 =?us-ascii?Q?mGiy0eE6ClW5h/rMUvdUfFlJ7a/tQ56GStIY07StDAt/sJxJmbdQd5AFwOZ1?=
 =?us-ascii?Q?S0X8MxkrRC1k76thpLkXlq93SQws37p24qTV23A7MSFt6w4JsA9A8I6N8RoJ?=
 =?us-ascii?Q?KN+NauASzF2yQkekC3sViWB5Ws/2XiNe7VSP2P8o132DLAXYyAuNmg7wabOd?=
 =?us-ascii?Q?SWE+2LArtqFCcgLHtla6+cl3Q7wdqpA6Fe9Tpwrb+y3I2ix7WconVA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 12:54:12.0393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e78f709-61bb-414f-dd6d-08dda0423dc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7280

Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/1845628953

RFC->v1:
* rework BAR mapping machinery to support unmap-then-map operation

RFC: https://lore.kernel.org/xen-devel/20250312195019.382926-1-stewart.hildebrand@amd.com/T/#t

Stewart Hildebrand (5):
  vpci: const-ify some pdev instances
  vpci: rework error path in vpci_process_pending()
  vpci: introduce map_bars()
  vpci: use separate rangeset for BAR unmapping
  vpci: allow 32-bit BAR writes with memory decoding enabled

 xen/drivers/vpci/header.c | 220 ++++++++++++++++++++++++++------------
 xen/drivers/vpci/vpci.c   |   5 +-
 xen/include/xen/vpci.h    |  10 +-
 3 files changed, 162 insertions(+), 73 deletions(-)


base-commit: 96a587a057363e519ca74498882fac42d72670b6
-- 
2.49.0


