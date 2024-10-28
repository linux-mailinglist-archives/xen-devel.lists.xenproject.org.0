Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB3D9B30C4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826442.1240687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8N-0004TM-9p; Mon, 28 Oct 2024 12:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826442.1240687; Mon, 28 Oct 2024 12:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8N-0004Qz-76; Mon, 28 Oct 2024 12:46:11 +0000
Received: by outflank-mailman (input) for mailman id 826442;
 Mon, 28 Oct 2024 12:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXyF=RY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t5P8M-0004Qp-0i
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:46:10 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2413::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 992e300c-952a-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 13:46:07 +0100 (CET)
Received: from PH7P220CA0175.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::16)
 by SA1PR12MB5669.namprd12.prod.outlook.com (2603:10b6:806:237::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.22; Mon, 28 Oct
 2024 12:46:02 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::49) by PH7P220CA0175.outlook.office365.com
 (2603:10b6:510:33b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Mon, 28 Oct 2024 12:46:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 12:46:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 07:45:59 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 28 Oct 2024 07:45:57 -0500
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
X-Inumbo-ID: 992e300c-952a-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxmf8cdrjZuDf9cD9uwJlFWBHXOl6wHk807iDEkH56iQK/e701+Ez9HNjFhBZGioWgJUQIXwuMeKFmBvs8LSXCGxExE3m2whwUTQGZXslmQVKqh4OhJ6v7J8Ze+ZxmlHbAY97Iy5nNioy0gzZGNBeWbSFI3tBiS4X5s4tw7AX5la3dPBokTR9KBq/ZdvxaG8XqvM2fpTu0UWPAEROu0IoU0M58rntlDYWcBj33/C6c0/OseBXsE4sgBZyxcpFyvEUP8Txal5FCOKs17p6WEBD5FuJHJsLTueUEwtCAXF46TLwQZhjjlZUnaIIxiw2wKX7ddKzTa5YtwtBr+tdSYWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XydBGRHojGZoJqdkteJihbP8bo8mktcYFJ5/jPzGf9A=;
 b=TzaHGUCtiOl1EoQGRfQzFBATqYBmqaBqTsoQAQ18qdFAjairnO/GRzoMY7++/Tq7i/PL5Xn9IG8XqVKbpi5jixZTiYy81Rv7MnLP1EIQobZfjMrN1pkRT463LhdwTXrNb9SmlmRLXGWwsRHOttFlc37cO9v+yswatWb0VHauX49LPhQLmrp472WbEYN/168nPBSgsXIlYFjy+ZZU3qI+INryQBMSmCi9uk/nmoDSHg0IZLU2pt5h8Axyxn98iZInxRWUeTwRsPozzmO7XwaDbaBhStFT3GHQAfvnSoN8tjAabBJ65X6ROQUabIX7KeheuRWFfeSRWHaSuDftBio9Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XydBGRHojGZoJqdkteJihbP8bo8mktcYFJ5/jPzGf9A=;
 b=qAyODYtVMY1UzBxfN7yDD4lrw1sTqMUsZXyNWoFYVK9puMwG0FZyTBx5FspwlKcVym9I/NrX0jHBsLZeMU/P61pca1pfg+FEHbKoAYwIUaiBvfhxVMjBfLcnxFTaldL5D7u2UXz6L001CSp8S8Y+dvN1Usnasyn7U/6Iq2FDYww=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/6] Enable early bootup of AArch64 MPU systems
Date: Mon, 28 Oct 2024 12:45:41 +0000
Message-ID: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|SA1PR12MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 326036df-6dea-4e3e-1956-08dcf74e79cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?55XcKl0lElHQ4AP/urgSLK0X/AERYlaHiVkzX+kZrYhdGnWU+K7CADsFmXoB?=
 =?us-ascii?Q?OKUQ10ZxOpUDPyX/kebAqFbrynpTUgadFdu6IP3hqYAraOpZcf6aX3Nu3tMq?=
 =?us-ascii?Q?h0NkFspuNEpU567MHlE15JCc5+8iyjiXe02eOO4rsBxI0szKpQRaVY5EUR3f?=
 =?us-ascii?Q?p2fRInPj3UJpe7cpdYlrvu8x6FCkqcB3t4N0G4TPGTAPN+Nb3eseP/6aEfBN?=
 =?us-ascii?Q?4Qtl3ksFmzB1UHSbCJw5st1MSesl53W42AaNBSNqM7osbgkWendLtqrTG+Za?=
 =?us-ascii?Q?M1K7ZTixAiWTEXCrWnHfXO3xjamFCLhBGBrJUAlREwK2tD1fBBJEMdyUVPh7?=
 =?us-ascii?Q?og8H+8SNmXKi4GIU+D5fEVbNrcld6ERjfCQLQ0xgQj+BbV+upYgaG2CF3V0n?=
 =?us-ascii?Q?upJ8vg7xbB3rmlnyeOqXDCnOCpyTa9pqg+0k4z6/p7zX6Afa/uMrswDolB1+?=
 =?us-ascii?Q?kzOxQCbcDTdG+KNiDHWNxJ0bbomTl4c3Tuf0evOcJDh3Z962C8hqhdsVtXfy?=
 =?us-ascii?Q?ZAMf9NJ3QlnwyR+eMmqIhcfpmIICj+SKM4siaMWRH3Cw5NJzw78Wbd2ibu88?=
 =?us-ascii?Q?B+xUlnoX3/niZegF/2LxcTA9oZIdmLOF8I2Oll22WkiNQTLkDR53qwnsebey?=
 =?us-ascii?Q?YSOjeN3Pvo7gHPEzUOpWnR6FSxsCUtKCfGIkKRtULrPVgHRT6pchSPj2JuWC?=
 =?us-ascii?Q?AYct9m5NFsb7QkJvebBYqPdqLoYfsi8kx8L7eIaZqYYDVeUf0nZV6ORsu5Kf?=
 =?us-ascii?Q?8PGxqDOxHpI9UEyzUXkZmxhQ7MeqPQfKGwKhEkLxYlfuczpFQvQq1k4db2z0?=
 =?us-ascii?Q?J25n9AMCjT34DflNshnp18gY1468qYNI2S0FMzO0qWN/j71+DbYjq5SOe8rs?=
 =?us-ascii?Q?6fTZuQzqpz1KQ5A3hZej/eJ/fJmoaA1FztFPWMhaKlQkOqv03ypVaL3Z3WvR?=
 =?us-ascii?Q?6klqCPV1gI7OFjULs3fctgdIWZGY5+JjNIBC6UagvCjP3lBS5ydTPlLKfX6d?=
 =?us-ascii?Q?vKtQXXxMQpJsLSesv8bZv0qdiGVebls7D17PBzqQGWKFhT6P3TolOIOOKgN7?=
 =?us-ascii?Q?WXSZz1kw+swMyDYP/UMusPRQzDPGFVquZR2LGTDtJ7vLX54wlG7K1pOcC9K/?=
 =?us-ascii?Q?lTzxDmyRJ//7NT7MT9H/o3cVMIqG5dwUfLPzYbyJC0VEDAuYkeoocox8ny/J?=
 =?us-ascii?Q?1yXBHmXDKunHVG/FsavfZy1nsaJVOF8fEmb/RxaoFkvMUG957YmjfORkSTsc?=
 =?us-ascii?Q?lmdUytWfuSu86rjaROt2BXUbDpkAilNAm9bcvfK4qpcahFGvd5Itpzp1JQ9x?=
 =?us-ascii?Q?3QGC7Hs+l0nBNnp5pf6Jnk1e7zJL3guZxA5MnAtyqm4o411pQaRxRrUeg49T?=
 =?us-ascii?Q?AqbVPn0tDYPAKaVJ9q9JaYi4nX3Bcn56ISdAq7QPMyXNXH39yg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 12:46:00.0912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 326036df-6dea-4e3e-1956-08dcf74e79cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669

We have enabled early booting of R82.

Changes from v2 :-
1. Added a new patch "xen/arm: Skip initializing the BSS section when it is empty".
2. Split "xen/arm: mpu: Create boot-time MPU protection regions" into 2 patches.

Changes from v3 :-
1. Removed some of the R-b as the patches have been modified.

Ayan Kumar Halder (6):
  xen/arm: Skip initializing the BSS section when it is empty
  xen/arm: mpu: Introduce choice between MMU and MPU
  xen/arm: mpu: Define Xen start address for MPU systems
  xen/arm: mpu: Create boot-time MPU protection regions
  xen/arm: mpu: Enable MPU
  xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm

 CHANGELOG.md                                 |   2 +
 SUPPORT.md                                   |   1 +
 xen/arch/Kconfig                             |   2 +
 xen/arch/arm/Kconfig                         |  27 +++-
 xen/arch/arm/arm32/head.S                    |   3 +
 xen/arch/arm/arm64/Makefile                  |   1 +
 xen/arch/arm/arm64/head.S                    |   2 +
 xen/arch/arm/arm64/mpu/Makefile              |   2 +
 xen/arch/arm/arm64/mpu/head.S                | 158 +++++++++++++++++++
 xen/arch/arm/arm64/mpu/mm.c                  |  15 ++
 xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  30 ++++
 xen/arch/arm/include/asm/config.h            |   4 +-
 xen/arch/arm/include/asm/mm.h                |   2 +
 xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 +++
 xen/arch/arm/include/asm/mpu/layout.h        |  33 ++++
 xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
 xen/arch/arm/platforms/Kconfig               |   2 +-
 xen/arch/arm/smp.c                           |  11 ++
 xen/arch/arm/xen.lds.S                       |   8 +
 19 files changed, 342 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mpu/Makefile
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/arm64/mpu/mm.c
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
 create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
 create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h

-- 
2.25.1


