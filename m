Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C5889827B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 09:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700711.1094274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHt5-0006Xo-C5; Thu, 04 Apr 2024 07:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700711.1094274; Thu, 04 Apr 2024 07:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHt5-0006VF-9E; Thu, 04 Apr 2024 07:51:55 +0000
Received: by outflank-mailman (input) for mailman id 700711;
 Thu, 04 Apr 2024 07:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OVy+=LJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rsHt3-0006V3-AQ
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 07:51:53 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 321cd1e0-f258-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 09:51:51 +0200 (CEST)
Received: from BYAPR02CA0021.namprd02.prod.outlook.com (2603:10b6:a02:ee::34)
 by DS0PR12MB9445.namprd12.prod.outlook.com (2603:10b6:8:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 07:51:49 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::5d) by BYAPR02CA0021.outlook.office365.com
 (2603:10b6:a02:ee::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Thu, 4 Apr 2024 07:51:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 07:51:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 02:51:46 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Thu, 4 Apr 2024 02:51:45 -0500
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
X-Inumbo-ID: 321cd1e0-f258-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msn3Pun/oIN2pu5Se00HgQr7b1jpu7qYme348VuOgt9cJ81p4dJPDLIBiUhuuepLQcNTBzF7RaL0VaVomgkKS0TpsEpUe7pWOfqqGf9H16WF6bGYnWItDkVO+8W+W1WsIgTIMOV7e8lxrTCPnKquF+BVCvyQ/1xB1W6o1TtJgnyzg4N1/NAv8NYdCIRrjzqEY1RtlEV5mgiVwLehZU4wh74vpdRdGMcnLMu+ng4dZ5uD+65i8Ze2tci7jff6UhEvWe7/kNCNWyEtrRuIv0ZHxcYL3pX7msmwSQDTfnnoM/80WSwQaJBB8SyGnTB8PbEBGkcvoUh0RXaBoF5Ii0Zkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCGUISqWiE4nrahM7M5ZS2pyV0Kj5/WoCYx3/R6H/94=;
 b=XSWTfTWrD1Fkq5v1ZjyAD2/xcvK4iWzkOEHcef86Hq8BHi/fjyYb1ZD4MHmTDZnuPZW1xrCKnozhxxPnnmA3tPX/hQIKVhZuXoVi3p+j+/clGFn1gDd1DQdiJirhHtfqys0xgc6OdOcdAXlj7JMK73iJJkjHKEG8c0+xiK+6JeBCEp+TvruA6iMJp6Je2+SEXWSI7xW0ZSZnS0BohCpeH9jNXEulLXjOO+yqnTHg6sX/V6ohWc0qTk+5SKAyrz2pGpKKOSbUk5/zCGO7w/j1/kZQQJKAM3we0lJpMvZpaUpRc8TdOKtv/nxcfs0oEMlIL+BSXiA2sqc69dK5t8rfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCGUISqWiE4nrahM7M5ZS2pyV0Kj5/WoCYx3/R6H/94=;
 b=QMON3KPCveRC7qNHaUkhkCpxbZDtenygbGsj7ftHirjOL1x+Jk7u74QHwNJPjBs/hVkOKvSnt/uq7P8vKOeSgYtviQ4gWTsZ50wav87DyRYyiIyucDcU7G7+ZXj6Hmo0s7Ah8rA3e3BBENA3wF6QCBhPsk2uDFLw0BNdkqScTJY=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] drivers: char: simple cleanup
Date: Thu, 4 Apr 2024 09:51:41 +0200
Message-ID: <20240404075143.25304-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|DS0PR12MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f42d720-79db-4813-3d64-08dc547c14e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G5U6bUbBUgaauT5YNBou9qOjEswUAwaKg0CkuXG7jhXa8K55oyvBsEU9fsefwlKs93VtByj9a7Y60B8qHGkvdlHRw0fRAM1oW4Q46kuch/aqJHR++SUGB+iRHqgCCxYFKUm0FjTkyYjENXWNRC/0i/O2uO4V0QY5ujfI7k/d1iaLHwDVckutGm/jf4fmKcNw/Um1/G4B0JzmwvMT1zHfSYYFUHW7W7JVhQDntxoj9zc1lllB9HRO45hMh5Sm8/JTmOUj8sxqSK/PtD21e1H6abdmw0F9kGHP9S0cPLeFUB17bogxEjhVhFXrAxxepdkouUtnc6W+20MsjdyiSVssK/r3aat1pz89oUCBldPstxmGPNGrgMbMyPyt5niCbrNhCK6cpusCL7lX/IPyi5xP0XnxcRBl8JjnEv1J1NpkUTxt2kfwNyZwQt6oIjo7qQ8G+FTGWExtdVKiCvjxmtSe1XFbDpy0iJHan5JiXPc3IwpLytBQVSpSnqFMys7y0C+fQMcRdnwwL4fWBQf6kI17i00zQ4+IrQrQKHtIfFrBAHyg9g0hML9veVRJTYomCULTmWfcp1+zimYAQFQxlKXs9xSZDYdHFY4ZqHlEwVdbqD4N0WRkcY+UQdw5+Ng1vx21py55+uNSUY7SVTqGnhsry6wxdYGpo3HsRUT1oah3ybZQsV0hbkuv9ZUxPivlUbtIkKEucNtQpUXfG23oM3UhkxkAMiX3HsfcATvx0xkaDhDEMBadraoTWpHDqWlVzKvw
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 07:51:47.9757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f42d720-79db-4813-3d64-08dc547c14e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9445

Simple serial drivers cleanup. No functional change intended.

Michal Orzel (2):
  drivers: char: Drop useless suspend/resume stubs in Arm drivers
  char: lpuart: Drop useless variables from UART structure

 xen/drivers/char/cadence-uart.c    | 13 -------------
 xen/drivers/char/exynos4210-uart.c | 13 -------------
 xen/drivers/char/imx-lpuart.c      | 19 -------------------
 xen/drivers/char/meson-uart.c      | 13 -------------
 xen/drivers/char/mvebu-uart.c      | 13 -------------
 xen/drivers/char/omap-uart.c       | 13 -------------
 xen/drivers/char/pl011.c           | 13 -------------
 xen/drivers/char/scif-uart.c       | 13 -------------
 8 files changed, 110 deletions(-)

-- 
2.25.1


