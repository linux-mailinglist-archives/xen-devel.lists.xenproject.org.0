Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CFB9E5F29
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 20:51:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849265.1263898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJHrz-0004wG-Rs; Thu, 05 Dec 2024 19:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849265.1263898; Thu, 05 Dec 2024 19:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJHrz-0004tV-OU; Thu, 05 Dec 2024 19:50:39 +0000
Received: by outflank-mailman (input) for mailman id 849265;
 Thu, 05 Dec 2024 19:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdkX=S6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tJHry-0004sc-J4
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 19:50:38 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061b.outbound.protection.outlook.com
 [2a01:111:f403:240a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31148944-b342-11ef-99a3-01e77a169b0f;
 Thu, 05 Dec 2024 20:50:36 +0100 (CET)
Received: from MW4P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::14)
 by BN5PR12MB9462.namprd12.prod.outlook.com (2603:10b6:408:2ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Thu, 5 Dec
 2024 19:50:28 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::75) by MW4P223CA0009.outlook.office365.com
 (2603:10b6:303:80::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Thu,
 5 Dec 2024 19:50:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Thu, 5 Dec 2024 19:50:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Dec
 2024 13:50:26 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 5 Dec 2024 13:50:25 -0600
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
X-Inumbo-ID: 31148944-b342-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWwDXXMBL5AtPcBTmN4WN4vmUBbSKkZsbwoY4MTOU+LSpNUs4GB/8NLXeQA6VAeS4xBVzrFbUzDNQpIkI/znMng8kNSszTT5Z70wwjrw7OAVkf7nkrZdzUVL4KR1x8c3yPvBqzMhiTTnbAeQicfT+Go0MoE4XWEgVA9RbPBmnUEPWctxiUyAZj3fi1lO5sAzQ8o82q54tiMI+CwadIkiKxr2oeZS1W4oq3i2okS97RS9e4Xycp6aP2JlTAwg/d5fHAWWjDyq1PE9atR1pqDN3Tqu4zD3yfZylPicQV6WeK65VAThHhqCImG3h2qI+HYjU6EypathwFUAaIQpI0XRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf0lRtSsJmnQ3IoBF+kWYK3/iAh21wGhB9n4z5P49Zk=;
 b=tsRWj72yzFJZeaB48Z72AkW0wJfzSLo/g/C4MwCzZe9qqgk5kv/t+SZ0hUM3GuGQ8pz1LQXAGMWBnMphUAYGFCcFI9L9By60jNW5R/p/32shlldEdxfTuljfW86dr5vSvLzCbc3t3kijEZXDS+MSOvQwuEZ9Qmzv7070hqmBxuxgq/viwN9DmFFIKUELJWVKpbqGB0CWgHjN8eS3Vf5mWgIJocsa7+7Fa/sS1l/BtDdIEAZPt3rdPgu/ZiBanO9iYxtqcqoF8hqd5NBJTj1mroTtvg45i+mIIg3GJYgNmuKtybOOMdgI+HxRAWkH6s9IyXVXQwXh+x6frmvoxrgchQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf0lRtSsJmnQ3IoBF+kWYK3/iAh21wGhB9n4z5P49Zk=;
 b=n466+tMySZ/DF3DadMLXyex4Sxif/L5Z3DdixEb43dr0jO/f0GsigMy/DaGLAZ84NRT+6B2884fRkQFWs8A7M21/YLf6NyPl8UyeU0GcDz58T9t/9RX62aUdobKhHOoCCISkypl9yIB/fFpv7gUGStkuY6K2JDQ04JJRxqDwxeM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH] CHANGELOG: Mention xl suspend/resume
Date: Thu, 5 Dec 2024 14:50:26 -0500
Message-ID: <20241205195026.3523-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|BN5PR12MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: e2125333-b0ca-4f32-9ec4-08dd15661105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tSQsOiu5+WYPXyxy+6iTDPshB/vyQgUHWjjQ2kfXMpX0XuoPnBSR30K7a/nr?=
 =?us-ascii?Q?4qAzjFV4naZXNSXyWepC3LRri48+GtbFY2qWypw/vPg3ZNyvlE9/lFsAagJt?=
 =?us-ascii?Q?0igmPsk+g+KThkbgEMWsifHOINlxxec3O49vXN+9TgDZZ34nCtbuOHtlBKeM?=
 =?us-ascii?Q?15lHpt5NGMmeZRVE3e86tv8mSd2EKcW1LVL6j8NFT0u5AciURS/psm/hihd9?=
 =?us-ascii?Q?2mNhlndutGSBu64+U3ZblCnlHeNbLqCokiVP6Uv+I/MOJERmVMw5a8++r43l?=
 =?us-ascii?Q?SShx3X4s005KFnl9SYITIOzry0vzn5sp0QnluqM4awI/JyRzP0KJwJ24Cass?=
 =?us-ascii?Q?T065b57IGP3Sjia4D29WnXu7LeTFwyQATSlPv/HiZGP07dOePzZxv0TLszBf?=
 =?us-ascii?Q?NR5iJ9jYRo3ncp+zU49+MmDc/qeDKqslUHtd4eT+jkEl4Tr5SV2UODbQuE7C?=
 =?us-ascii?Q?BOjFivjJtuI2PPTq4/MqVrfPgzv8CW/zNbpOdiEQZUNFY7u7LGZpcDxJ/vQX?=
 =?us-ascii?Q?vzWC7efIANIYTZPgTwikXyaRH3P+khnaGMpzzc7hXRBnH2ZYplPkpY/UCNff?=
 =?us-ascii?Q?E3ccE2lPI8cPvZsPPxWl96tOJYH9sc3nIBF2HFiq3I/IZ4DKlxpRLlf0uzKW?=
 =?us-ascii?Q?wXIhSLtl/P+TdF1z041lDH5bmwFQLs0Ct3cpTr1WQ/2ljLwXekHEbPk4NFdR?=
 =?us-ascii?Q?gHK4Hn9FW6IpChOHTwdw9dQZQWHIrUfpIkzt2ryJIzH1lvWmnwAQ61PJ2+bF?=
 =?us-ascii?Q?e+ciCbGbsen9bgZ1eH62A8+02PDIoTxIUM3FQS0e4ziiZoIqwWf63s0ytj+r?=
 =?us-ascii?Q?rY6A3/p6OWoLx/Pn264d6KMBmM1v2LbrvO50FHKNohYMMVc1jdXV0hfczpQz?=
 =?us-ascii?Q?cxC3VpGEJBy5zeliq3TmsT66x5UoGPDofnEqWsVyqRp6GX3zyllp4FEgThf+?=
 =?us-ascii?Q?wP9E475jwmtYtHGaJqWGZjev9MlY+aHqa25iMu+xh+aPPxEJWer+ZcHGkk4S?=
 =?us-ascii?Q?ogdl70dYD8lkt63pPlUJYADUU9fB4qacLJA0pwU6Yw2wJsulPdwv+OrSTp1a?=
 =?us-ascii?Q?Aij7LozA0LJMdlCtKGjx2IAoXwkZwhfpyiFKG6XTJ22drBufLRYrGYLqsHF9?=
 =?us-ascii?Q?skOPITD0sm7CT4R9J61jIk5/fJ4a4jBNY6UcWOZoL9H1GWpJQv6vP1UflZlV?=
 =?us-ascii?Q?YZlUj9FBvIHk7nekz951rjmBnDNVJ45Jx1DQNdq6BuT4ti1qmekT7sXCeZi9?=
 =?us-ascii?Q?5Ww1uSYIqYGqXAx+PFrMAjMXmgQptZgvYNTJ+3LmmrLWjGDOnhut1OdEcEje?=
 =?us-ascii?Q?dPEWk6wluVah8scM+b9Vvn9k7wgO/M5xb4ctUlXDBzY0EfRevqRVO84HqmLF?=
 =?us-ascii?Q?Iyu9r+E5hlCfrvVs1CBQEnKs0uz7glGjgQwUbQNWUgpFw+W6vA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 19:50:27.1344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2125333-b0ca-4f32-9ec4-08dd15661105
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9462

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
It only works for x86, but it isn't x86-specific.  I chose to add it as
a generic entry instead of listing it as x86.
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8553b2e451..5e912b3759 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Added
  - On Arm:
    - Experimental support for Armv8-R.
+ - xl suspend/resume subcommands.
 
 ### Removed
  - On x86:
-- 
2.34.1


