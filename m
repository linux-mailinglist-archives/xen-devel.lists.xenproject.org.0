Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF57A29E3B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 02:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882386.1292512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqNd-00073v-9M; Thu, 06 Feb 2025 01:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882386.1292512; Thu, 06 Feb 2025 01:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqNd-00072R-6I; Thu, 06 Feb 2025 01:08:33 +0000
Received: by outflank-mailman (input) for mailman id 882386;
 Thu, 06 Feb 2025 01:08:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EC/=U5=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tfqNb-00072L-3u
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 01:08:31 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20611.outbound.protection.outlook.com
 [2a01:111:f403:2409::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e023fab7-e426-11ef-a0e7-8be0dac302b0;
 Thu, 06 Feb 2025 02:08:29 +0100 (CET)
Received: from SJ0PR05CA0179.namprd05.prod.outlook.com (2603:10b6:a03:339::34)
 by CYXPR12MB9388.namprd12.prod.outlook.com (2603:10b6:930:e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 01:08:23 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::1a) by SJ0PR05CA0179.outlook.office365.com
 (2603:10b6:a03:339::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Thu,
 6 Feb 2025 01:08:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 01:08:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:21 -0600
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Feb 2025 19:08:21 -0600
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
X-Inumbo-ID: e023fab7-e426-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jfch4K4V/5grpH0B55ixmc1kqXzAdWn1TFZ/jixCAKOtOVeVxgb6WFNPiuhPV5P61TKqmzrmw/MuQZfRLeZh6j1FAPuJPsZrog5xVyiCEescJTQ0s2j+0S+k0+fFtQG+bLpjXp+8hTdxYqKnI+izYFIWwMFx0pxyN28wJFoKKElUOJ8hHhunAzAvQLNuEmdJ1khq3bwsEMtpBrr4FQ9uxT0vTVcZ/RivEZ2N9FTZleOdDfaNrhztdke4/tLGWOTlhcH2MVcj5uom259n9ZygaWRJ2NmrHLedWGkE2WZy2gXuraJx2V5nZw5PIkLUxBPAdDoWCucxcGSow6IV2jEb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfagGAkh+z5TQtDCQgKkfqb3Paz7pzZhAkBvWpAkYPo=;
 b=gs+lFoUUkBWnxi7oS8bHZIlI+7IslBP04hio88iEzmrRIsgxOoYyO0wtUF0xoh9YVPdsBB8HkEE19NpTg2A2++4/Gxs5gE0XvBjOsuMM/ZQjFYAtGxV4YPWEYcmpaShPb0/OILUSCj2PBJmknV/k/XADi1NbDvXBeI0RXlOlXH1DUo96Uj1meEWWZMJjH3aENCe89JUASlMXsLRjfHHF0+aHeUdjEgypDjY7MgUCxdQwsvYs6fHFaANyiR8QAWT+R0We1sTzoZbb6dZ1hGMoXfphVS7Dv2MADd/zkwJAokBRG3kLCOYz12ao7gyYqNBs+LTrRHFICXhwrMK0/M/1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfagGAkh+z5TQtDCQgKkfqb3Paz7pzZhAkBvWpAkYPo=;
 b=x7H7ROhFiVukhhReuXaeimptSkm4M9LhGHijnfVoQOWJXG6SUO6cFRLD9DvtjTnzIakKIDvbAdvmW6Q6IRjRxjfJApcd2QHtn3e4apBL/m0ESzfkjJR0O7E+pB65ywDN4Kqcxp5qARfsWYR82tzzQBeMCLCL8IzRmIL84o5DcXU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Wed, 5 Feb 2025 17:08:20 -0800
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 0/9] Guest XenStore page allocation for 11 Dom0less
 domUs
Message-ID: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|CYXPR12MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d75a70-db8c-49fb-a2d7-08dd464ac08c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RowSDH9Fvr2FrqjzvrDYWppr+RTQ2uSC2rRhtdyQP40gaWEotruEcNQYES2X?=
 =?us-ascii?Q?5JPRBxuDNhlxKf8jSUMuUK6kyUB/TKpoGnqN4EBvUPcjSF+Y/CFCh+AKKVnl?=
 =?us-ascii?Q?3I1SOCufL3uqr9aRvuBma6+FYS4Bo0jSuuJ4CQxNUX47XcYcaEcQM8tEq8sz?=
 =?us-ascii?Q?BtHIn+dxET7Yeva3bXpWCmuJPKpzWebuxEllqUYVM2GeJrubE+Zztd/sHtEb?=
 =?us-ascii?Q?LNpC2yCrZp4IFQRmWYBO25GOfA5dK5yaVwe233SlSMcb2iLMI4SNd+UJ7QOk?=
 =?us-ascii?Q?Jx5ElJ5sMs9MNy1EiqiE5d4rDGOcyysP4Z5IKcE5GON3VtInHvfj2cj/aUEt?=
 =?us-ascii?Q?3UXEk1utHECZmvX8HhNnw42W6NcrQ3zVCGBq1O79XuFdIHfV2eigbeVtiUaf?=
 =?us-ascii?Q?dBETaQ0eww/AmOaVfVBmKijqtrg5WxgaRJEwzudBTV64YnP3NyqzHEaHVJyD?=
 =?us-ascii?Q?8toK2OiVeuKDdwlD4H1Q7+eL158gIY1xqyA2i2oJY7SL1HoNuAo7quqZu1fw?=
 =?us-ascii?Q?uIWKwDt0WgC0U2csLFp8XAbXRn9+pn6OmK1x+/kv33gbAnyjwrMt5L+6cNKB?=
 =?us-ascii?Q?AkQEb2arR5Yx3KdrJSGinDTWewoE+4az4VzQ5hkTu94Kh269SwWY8Zjox0Vf?=
 =?us-ascii?Q?NxQGKmNtcdz7rxQzIVH6lDms5O+GhbdgoVwSjPNDYeS+qP33Ak/SgJm74dRE?=
 =?us-ascii?Q?jIJ9087iOdW8sio2/giBG+DES8jpt7S4vMOlP0s++j0nGwggv+uDJElJLEzr?=
 =?us-ascii?Q?zl2ELkf6/9vCwo1DBfHPLdl6VX8TaNavN3yGgV9ND4qDl8YA659S2s8V+HXn?=
 =?us-ascii?Q?s2UEGuSMwQCIImlEO6TJNFXIM9Q6+1cS2CiXF7aNBazXq5ppHGu7z207iiFS?=
 =?us-ascii?Q?LzIw6D76D4E0DYn1X8/pDJUAYvuKSLG3bil8R0OkaKadF7zVGSx8uSnfRn4X?=
 =?us-ascii?Q?m2mAIdv+rH9KuIfBOmHa0IwoQ5TxKa0NewX4iR/KdQ78SkD2EsNbh2f/uCv0?=
 =?us-ascii?Q?h/5LW+gKH+7QC0Z0+Z52BmpQ7V15PKhlss+6dGe2DBkR6w+h74cXzdGmA/WB?=
 =?us-ascii?Q?nm2Zqjai+PiKPZS/Mro5RlYUObPIn0vFYWBdXtekSUPXsYiVBq99wbM4mxZ2?=
 =?us-ascii?Q?HPBoVWryVJjW6q35NW4Md/eG/rVynUD3GR0vcxaRyVQCbcNsgO1do6nJ2z/b?=
 =?us-ascii?Q?RkOs5s2LSh/SrwBlojLbzwYdoFJsRm230B7S8zxcTENon2y4FJQgIUJ7p825?=
 =?us-ascii?Q?gEA/lQSPAcDspIsrkQG3FnRZ/UmpT8aSmAr9B0BT5XWaZSELcb2Snv8QEoA0?=
 =?us-ascii?Q?e9PEAuNCaoHWj2aL2BwANLtRgjiyU6SQPHZxA5UE2dLW7dDD7wG5UKZMniJB?=
 =?us-ascii?Q?BcwgIr63e1VRp9VDgTZXsgJmbKxsJAHLXZ8GFS4v7tn3su+YQDMJGBQfAqvk?=
 =?us-ascii?Q?KtRHtAR80mA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:08:22.6726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d75a70-db8c-49fb-a2d7-08dd464ac08c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9388

Hi all,

The last version (v4) of this patch series [1] was fully acked and
committed. However, we later discovered that it caused regressions with
older Linux kernels without a fix [2], so we reverted the patch series
from Xen.

In the meantime, Linux backported the fix [2] to all kernels, so at
present there are no regressions any longer.

This update on the patch series contains the original v4 patches
unmodified. It also updates our automation testing infrastructure to use
a newer kernel. It adds a test to validate the feature introduced by
this patch series (PV drivers together with 11 mapped guests).

Finally, this patch series introduces a new dom0less option to retain
the old behavior in case users want to run older unpatched Linux kernel
versions.

To verify that the legacy option works and retains compatibility with
older unpatched kernels, I added a test at the end of the series using
the older unpatched Linux kernel and the newly introduced "legacy"
dom0less option. I don't suggest we commit this last test but if you
think otherwise, please let me know and I can clean it up and also add
the ImageBuilder part of it (a way to set the legacy option in the
ImageBuilder config file).

Cheers,

Stefano


[1] https://marc.info/?l=xen-devel&m=171659112108921
[2] a3607581cd49 "drivers/xen: Improve the late XenStore init protocol"
[3] https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1656094397

