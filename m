Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0330295D38C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 18:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782449.1191938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXCO-0003jS-IG; Fri, 23 Aug 2024 16:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782449.1191938; Fri, 23 Aug 2024 16:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXCO-0003gV-Fc; Fri, 23 Aug 2024 16:31:40 +0000
Received: by outflank-mailman (input) for mailman id 782449;
 Fri, 23 Aug 2024 16:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4lC7=PW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1shXCN-0003gP-EA
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 16:31:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2416::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29f774ce-616d-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 18:31:37 +0200 (CEST)
Received: from SJ0PR13CA0172.namprd13.prod.outlook.com (2603:10b6:a03:2c7::27)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 16:31:32 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::54) by SJ0PR13CA0172.outlook.office365.com
 (2603:10b6:a03:2c7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.11 via Frontend
 Transport; Fri, 23 Aug 2024 16:31:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 16:31:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 11:31:30 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 23 Aug 2024 11:31:29 -0500
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
X-Inumbo-ID: 29f774ce-616d-11ef-a50a-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVo8lj69fUcl17XENm9h4wHg3tTFKaE7fim5G+yN9O6ndomFamv2ohiA9SGV2ss8CZDIwvujguZHfSbrRHnaT6yblvJAIPyxcZK+ZaTS/mw5TAp9GZISaLzwB1YYXWZ6Dr0QuxTeoYYoYOUWVw5BfVQuPqkCD6wSjvfHSQySP+p84RrpnixOsBY1hYYLavbmBRUy9temmySwKof6dQE2UThlU3uunlTUTG4IAGprKeeq5ei4JvBVQgiMWFfl9AQRa6LqjQrUUvOf6dHVY4aKkznEz+rN7KtSjEzXCIU9BnvXWmwrsYtJmiUlkagtbun4MePO8DR8sdsNOZW22J1yGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpDB0Wsw0MyL0N2tth1H16X6gmYFTdsxV1NglD4KSYs=;
 b=xG8zQq3s6dE5sM9EIHfbc6YLcOmMapCjKsbBqjaihQXqFpSBRCrCa24kp8GXR+aSNsYiu105o8m99vDJQv8vg2GzL2FPwXQAA5wIK0/F/5oaCZum0MMLabhXkuK0UG5zeU4EISvvk8biRhc0DOLBXDxJjIPdLkgXJ6AWsPE6QibA5Ktcfb3S5kXpETghId5Akpo3DVquLztK0U7BNi9gmDzwoOxFZZJKc90DzhpeqKBnZpLSXEqyX6Q8FDdNTLZ7lOutmHIadxm5Kl3RM6MQZPaaI2hpbSACUgY8M4GWR2SctZCvVOwlP+QE6R8DPFQMHmxzhSBnYI1wmLs3+rBtSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpDB0Wsw0MyL0N2tth1H16X6gmYFTdsxV1NglD4KSYs=;
 b=y81DuIRtlcHrmqMu+flLBictH4KotlFjEKMTHa5zpHtMPkFkrQfevcNmJ6zvwa6JW8ENEsBLk1BxubLH34BkQ/BMtsg8pi86RbK9k3bAn/kJgQV/YSTCh3FpaZKQIz5yYiphGEhCeylZibUYStxtmQSol1lUeywQI+yc3NSUA7A=
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
Subject: [PATCH v1 0/4] Enable early bootup of AArch64 MPU systems.
Date: Fri, 23 Aug 2024 17:31:23 +0100
Message-ID: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f8ec65-1f40-4b90-36b8-08dcc3910ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O8HbWbo+V2swiiYZqGc1pkgfzaHN3fHym+li2/AeiX17iGkgiQNEANwU0WT0?=
 =?us-ascii?Q?5OYHtnr3BygIuu9hFI3A0Edx/5uwIixiQ7uLsapw/Lar/Piq0CYANOIPYqD1?=
 =?us-ascii?Q?+KS/AjQJyjI781ihxAUFzHf6byYl3+v3II/2BrlG4DO6Zk+wGJBVw1gH3q+F?=
 =?us-ascii?Q?aDox65885hwckyuAB5QYwA5fi++sR+pP7UwqSwKwpI7nuxzDxB+W3eeEyN07?=
 =?us-ascii?Q?6bsN8cN2neXhFOd25wfYDXlp+yWX/iyptV210fqQJUBxQoLHhxMxzPHPE1ER?=
 =?us-ascii?Q?TRkYdm2qHYbQj8kR5RuSUr1bpH3Pwqzr8ax6ZWQqxQUtKLEspp9GkhLZvG1m?=
 =?us-ascii?Q?BrbOczHWWVZga7ENU0jTX6O9TDTcX0MlbZtuWdSNwCNHSI43qShbSE1/vngZ?=
 =?us-ascii?Q?nFKnRWGdf1U9NXR7X/6uwRg76EqTlQFdfjmTwZ6M4nkXeR3/ATOp7FYrWGAC?=
 =?us-ascii?Q?/6SWrNZshSz1MXHsfqBHRHeFGcHAJoU1njDq7W+m1rBO9kripDkMuEHQYTrJ?=
 =?us-ascii?Q?RaQBh2cLnJsNzPrv4dqX0JlsfQC7U9e9fkVEM79E4gd9Fr0L3rw81XoUi9jt?=
 =?us-ascii?Q?WH+Syqn3JJIn+VOLn6bsDB8fFR/SApr/ogp/r+aR3xcPzMNd4nIrSR4jEU/0?=
 =?us-ascii?Q?wuyfBwSlTFcmO/qeIHbBCZmN0pezSW+KSNr1NJQ5LZzsr+Wy5UAJYxWfv4pq?=
 =?us-ascii?Q?qqW0dktanktdMJeANO32KGJLNj4TYWGB0RwsiPOH0hDp+bdIvqhK86cMLdLT?=
 =?us-ascii?Q?G9FvuMZzu9i8sZLLNZ99WHS1zUR01Bhd7NFOA5v23ySABawhn7bbQ3s96rOJ?=
 =?us-ascii?Q?PXwY60auYgQ6umLEvSi8oK7/sN1hQiA5G4n8slp20ueNdApX3XdLFRJKTp4L?=
 =?us-ascii?Q?aBrpHgJ5GRjjI4fqPzk6C7Y6mX31v8r0F4ChrzBARMyJYoHOhVCJY5p0dsrT?=
 =?us-ascii?Q?uggs4V9ZAsmGOoXZFFC/J+YpfoOeh9sZGaIoWBsQxBEOrhenI7sD/V14t7/K?=
 =?us-ascii?Q?VEXCftiwWzRVyvuDOMUtKQhXWhEkoWkcbUeyD95gGUFzaTCFc7RbCoOsjJgx?=
 =?us-ascii?Q?oRdNeCEkqAwWBBbh+nn19rnstfmSjurAzRXVXKL06DRpZIhj0lsfjgtpqlza?=
 =?us-ascii?Q?jng9NoyEWWMjVw3o2PyMpfJshTc8B+ogUSYf9x+PBd5ah1gezf8U91ZQ2Nd+?=
 =?us-ascii?Q?4Mis9qrZ1+GtM/0xKVDW5t9L01Azh58sukm4/KyBNmQs1ZxkwjxDN0rmS/in?=
 =?us-ascii?Q?UCBFS33gPkpSTPLmaP4FATim6Lylj0P1UPIz8qWt8NkYQqpB2B3J/DFKr5gF?=
 =?us-ascii?Q?XojSoKtJe4o05YF7nJH1/5DlOYz5Y0eQ/42rmM/L0JdhDT4nzLDzNOUtmiE5?=
 =?us-ascii?Q?zjGCwxZca0VgB3nWQWQo3kOrDdTl9zQmS6p2ZUuQt6uCwHxzcg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 16:31:31.1609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f8ec65-1f40-4b90-36b8-08dcc3910ba8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523

These patches are based on https://lore.kernel.org/all/6d065949-dfae-41f8-b030-c7d09516846b@amd.com/T/
"[PATCH v4 0/4] xen: arm: Split MMU code in preparation for MPU work (part 2)"

We have enabled early booting of R82.

Ayan Kumar Halder (4):
  xen/arm: mpu: Introduce choice between MMU and MPU
  xen/arm: mpu: Define Xen start address for MPU systems
  xen/arm: mpu: Create boot-time MPU protection regions
  xen/arm: mpu: Disable secondary cpu bringup

 xen/arch/arm/Kconfig                     | 28 ++++++++-
 xen/arch/arm/Makefile                    |  1 +
 xen/arch/arm/arm64/mpu/Makefile          |  1 +
 xen/arch/arm/arm64/mpu/head.S            | 79 ++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/sysregs.h | 50 +++++++++++++++
 xen/arch/arm/include/asm/mpu/arm64/mm.h  | 13 ++++
 xen/arch/arm/include/asm/mpu/layout.h    | 25 ++++++++
 xen/arch/arm/include/asm/mpu/mm.h        | 18 ++++++
 xen/arch/arm/platforms/Kconfig           |  2 +-
 9 files changed, 215 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mpu/Makefile
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
 create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h

-- 
2.25.1


