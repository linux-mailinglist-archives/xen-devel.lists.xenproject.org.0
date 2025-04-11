Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEDBA85AF6
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 13:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947116.1344821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CC1-00074E-8q; Fri, 11 Apr 2025 11:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947116.1344821; Fri, 11 Apr 2025 11:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CC1-000729-6D; Fri, 11 Apr 2025 11:05:05 +0000
Received: by outflank-mailman (input) for mailman id 947116;
 Fri, 11 Apr 2025 11:05:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klsp=W5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u3CBz-000723-Mo
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 11:05:03 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2408::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d00bb013-16c4-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 13:05:02 +0200 (CEST)
Received: from MN2PR01CA0059.prod.exchangelabs.com (2603:10b6:208:23f::28) by
 SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Fri, 11 Apr
 2025 11:04:57 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:208:23f:cafe::ef) by MN2PR01CA0059.outlook.office365.com
 (2603:10b6:208:23f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 11:04:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 11:04:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 06:04:56 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 11 Apr 2025 06:04:56 -0500
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
X-Inumbo-ID: d00bb013-16c4-11f0-9ead-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ID7jKB3wTRI9+0re0J/VZA79zJpt2djKK3fp4gnPGrpKpudB+waSt9j1mco72eIN1glUycLFKfyJz+Ivu7+qr+nlo+r71IEU0Qv1w1F2+nVscFNDzHH92RZpYFSsmcyeEjPSgQsKeGK22joOEzWlOXJ3+Cuj/sfpZVDrrZrDt5EPtEfNo39doquUEtDwXeQla15R0NgVHlF3i1czbLbeUp/d0pucN0se/MtFQNADSfqXAs/cx79p22ov9tlhoGv9OWJ3snwEtLi+e1WyfhgM5b1yEO5gN+EfJDNCYU8o4Is5AWzcGIypnbYHCxNEfXXV3k9G8rtP5VgmVp3741Ovnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFIkJwYuwnWVubFR6mN69sqIH1vPnXPwpwqVmMm4Rbg=;
 b=Iq37tZWaHKSURQndZ8BeprrbO1+MsRzDWdVCAmCnGq6f4W38msqiFAr9f7cS2PROKKFrV3yaVg3hfw3kIlHQPRLL2Ux0X6gNR/liS8N4Oi60I4mvrRwQQSZtUWBjp43ayC6Z25LwUQKozykam48CyYltXfj5HIjDcgqZWg/SVD/OC09rmKPDw5MuwlzbdcKc6dHLDSRMfC9vcSZtNLdp67ebADOWid+S9inLhIFYuOyvGG/dotYdhdWPpY3ucRVYXJWxlzIGh0YlglzF4YSyjR7IvdecrK+Hf+x0Ac92j4rYvUOvekSvzolN14lU9JdaCs/qm5bKssJ2oRVhSQ9kBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFIkJwYuwnWVubFR6mN69sqIH1vPnXPwpwqVmMm4Rbg=;
 b=Fj/xRkHFKIfYH2EjCnh6upy1ARqlfXlBHzCOseXTBEL5m5UMiAWuCtK9vMfnZwM08lSbzwh9FKj4G193Ca3gl3ur43E40hcjlJs/tHgX56y6jmRB4grS/1woVZblu67mZaQH5euT06ieu367xMVTJHdUp1c88dsEmrul+dYb8mw=
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
Subject: [PATCH v6 0/3] Enable early bootup of Armv8-R AArch32 systems
Date: Fri, 11 Apr 2025 12:04:49 +0100
Message-ID: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|SJ0PR12MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 481061e5-5648-4350-73de-08dd78e8b22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sGBPchBAjSD7qzcd+7v+MD4Z31VbHF6rAlAtwWthJ8OotRu3okmhIRsYYUrs?=
 =?us-ascii?Q?iuuUQHMK7X2sZ5lRkf0nk5WDUr7VPMMrWGFSRy5nEvY4uxSSTQ8yS3f8GLWV?=
 =?us-ascii?Q?je/7JBheT4b7HSlEtY1QHBbYfKfOAvdiFXrmXWiH29dcObtuIRMXOwdTx4Re?=
 =?us-ascii?Q?FbyqCvK6pBGYnJc8V5SaHDqVua0Q3gU/+QIPBMsIdq26jmitIz9iMRiNR9Ho?=
 =?us-ascii?Q?h/NeoQU/LtBUpk2lTyZ8OYuKnvbuT1/XmEom0LU76Kucb3rv/HNGu7v492Hh?=
 =?us-ascii?Q?/DAXUzvnejGIZpg1VjXDAIA2+HHTQ5u2uy5sLS18XhCLOeExkXM/PJLdeV/a?=
 =?us-ascii?Q?eXIG8BEEfSAOD6IYEvm6zDNrG/QJ03g/QGT1qXrXsIT3q/yV2BZVsFuckVWz?=
 =?us-ascii?Q?jSzXxZyTk2SrymYPgnN4zZ7j3jQRAL7T7xdCUjq6S913oTxIkfYgVQrJoo6/?=
 =?us-ascii?Q?TYSCLUoQsfPF9eSkn51vkXDcVaJaGTgI6KDQFlWkykXmWOo1EU8AZJTmzDj5?=
 =?us-ascii?Q?8t1pPegQfxhe5fuyJ4qYcMyQBWFI1Gdnq47i0YUSHPBK/OYT4BOhHGlq3oZl?=
 =?us-ascii?Q?RViPaB2hT8MhHzI0OCJYyOrYiFz6UXMWtlQzeEVKZM/ofvVX4CkT++QrFhtG?=
 =?us-ascii?Q?7L7HT/3h7YA7O1/IbFtzGhQe/xIB+KVu01J93z1/naJmcH8m0L9/9HQHoUaA?=
 =?us-ascii?Q?KKtvMSvS2sJ1FgBlf+dzF3fzPxzxoTcVyHm0gdutUphRoPOoBEZwpcNObP+o?=
 =?us-ascii?Q?XeUIucwRQGhkdd8hLYbUTImearMcyd0PjLu+KVjFszSO/77Zg4nkBmhFdGz3?=
 =?us-ascii?Q?aJxMa6hb2cdw+fKcX6KMdMXunsQMlhcaRqM7R6ni3AeTiISYgaAfYXv8O7MF?=
 =?us-ascii?Q?lrJY1ufE2/V2Z9Hq19r5E0+FtNaszejVFPL/FktOx56X5yiH3LGHb7GdLeTb?=
 =?us-ascii?Q?ZCyLjLMz7eCX4ZavYakTKqDW0zApR7AHbCHa2zwY6XXTcjNWRoSijh+GRLr9?=
 =?us-ascii?Q?USR5kDKXqipE232syQdsTyRt7mP/ldicEa0UgV7E05oI1rppt151XCTZxf3E?=
 =?us-ascii?Q?3+ifMCzZKT0jyepKdzovR1jXJb0iDhHi7DMNPdkPfLWAfq8Pk1U2ZE9PZmiz?=
 =?us-ascii?Q?eJyvY89NIa+RWZ1A5b8dEVgrsPdQs6JzvT/1CarPxSwUnWXbtPjnTwrDink7?=
 =?us-ascii?Q?rxCcPTE2B/NF6PmH5yto4eTmVxNC1WQ9NYaNLUDO6HAbe1zayljVpFy5vocR?=
 =?us-ascii?Q?OLUI47D7o8hvXzArbfM07BXe5Y7HVE5tCR/CRcrVg3PyZAGpCS9XPWQRkOGF?=
 =?us-ascii?Q?5+A8BzGE/q9/U3C3bhNrtMywGkKO3MYM9Li25oat85P2sx24NILVrRQ/0A4d?=
 =?us-ascii?Q?WTtky3lgy2ybKIBwZUP0IBveQnyCd65DMODvCcMWZ91RSK8/MESfrqjW+ERk?=
 =?us-ascii?Q?YhrFNsaNWDdW9Y80FQjlHZXp0mUk0UikQ/AeHHmO1UCEjBnu15jzWhsGp8IP?=
 =?us-ascii?Q?ar4j94lmx8GKRKUHFulZqYhweJjLiAG3NIR8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 11:04:57.3013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 481061e5-5648-4350-73de-08dd78e8b22c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965

Enable early booting of Armv8-R AArch32 based systems.

Added Luca's R-b in all the patches.

Ayan Kumar Halder (3):
  xen/arm: Move some of the functions to common file
  xen/arm32: Create the same boot-time MPU regions as arm64
  xen/arm32: mpu: Stubs to build MPU for arm32

 xen/arch/arm/arm32/Makefile              |   1 +
 xen/arch/arm/arm32/mpu/Makefile          |   3 +
 xen/arch/arm/arm32/mpu/head.S            | 104 +++++++++++++++++++++++
 xen/arch/arm/arm32/mpu/p2m.c             |  19 +++++
 xen/arch/arm/arm32/mpu/smpboot.c         |  26 ++++++
 xen/arch/arm/arm64/mpu/head.S            |  78 +----------------
 xen/arch/arm/include/asm/arm32/sysregs.h |   9 ++
 xen/arch/arm/include/asm/arm64/sysregs.h |  13 +++
 xen/arch/arm/include/asm/cpregs.h        |   2 +
 xen/arch/arm/include/asm/mm.h            |   9 +-
 xen/arch/arm/include/asm/mmu/mm.h        |   7 ++
 xen/arch/arm/include/asm/mpu/cpregs.h    |  27 ++++++
 xen/arch/arm/include/asm/mpu/mm.h        |   5 ++
 xen/arch/arm/include/asm/mpu/regions.inc |  79 +++++++++++++++++
 xen/arch/arm/mpu/Makefile                |   1 +
 xen/arch/arm/mpu/domain_page.c           |  45 ++++++++++
 16 files changed, 343 insertions(+), 85 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mpu/Makefile
 create mode 100644 xen/arch/arm/arm32/mpu/head.S
 create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
 create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
 create mode 100644 xen/arch/arm/include/asm/mpu/regions.inc
 create mode 100644 xen/arch/arm/mpu/domain_page.c

-- 
2.25.1


