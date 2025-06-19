Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628EBAE038C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019927.1396356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDV0-00080f-8r; Thu, 19 Jun 2025 11:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019927.1396356; Thu, 19 Jun 2025 11:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDV0-0007zE-4r; Thu, 19 Jun 2025 11:32:06 +0000
Received: by outflank-mailman (input) for mailman id 1019927;
 Thu, 19 Jun 2025 11:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SlwS=ZC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uSDUx-0007Mw-Mf
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:32:03 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2414::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0474bbbb-4d01-11f0-a30c-13f23c93f187;
 Thu, 19 Jun 2025 13:32:02 +0200 (CEST)
Received: from MW4PR04CA0122.namprd04.prod.outlook.com (2603:10b6:303:84::7)
 by IA1PR12MB8189.namprd12.prod.outlook.com (2603:10b6:208:3f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 11:31:57 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::30) by MW4PR04CA0122.outlook.office365.com
 (2603:10b6:303:84::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Thu,
 19 Jun 2025 11:31:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 11:31:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 06:31:55 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 19 Jun 2025 06:31:54 -0500
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
X-Inumbo-ID: 0474bbbb-4d01-11f0-a30c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0UZHZf2gAPbF96u4ixmErxzCZ45bh0YEyHASc1j5hOym2RjGuIU1lZY1sRI2iFYROPaBOF/MIjdurnJI5v+EJI+sPsG2wB/clYYjAelBEKsjywjLoLUB3MslUgE9epGBE3yOvwAHz12O7xRWV1Ks7oCyeB4HpTcRJG8qAwmRtmjCZNLiD9C7hlYq+DeqgigAhg/DknxDssYjB2hfp7s4FS69rkaYg9CV0LOJcuTEPu9zVMAjyiholNn1aPYeqiHgmmMtMKCl1oVceUhYPY5Q9IKvslYuwgj4QnM03ogQ16aq2X20X34w+M+g5kqjxOIZJQBcYWwUz7JrM8176kmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HooSTqeLCbJkoAt7mZmcyMQ5aEtx66wS1a/XY63qipo=;
 b=dWSzOC+Dv1xXi93ESJZjD9wWZp7MFpq2iclRwo2O9sDuK0nz6rroHuiLdFa5PGK7JJig5zvFp7Tu+2OdssRbC/0NQ4VULIhAf/17icvH2rZ30MsJs2dtiYFHIT3ujU8MUgOs6636+Kw04BHHXhNzT0c8XZhQhD1HmR5yDBEQU6Dnse64UZW3OLgTH24AQZjNhLC9rZQ76NjocOlMSMtu3fgPK9642IQdU6dhH3bqPPj/jP9WS4WpdgqtCWMyh+ezeLzM55305yllObTI3HUBfBgcez/Z4MBfF72weRnOhpdNLEkZhPgw9707a2nsP38/7sLKM+fGvkPq9mjZ+NHQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HooSTqeLCbJkoAt7mZmcyMQ5aEtx66wS1a/XY63qipo=;
 b=Q/fLnGG0rrpH1LskHYjEUq2A0lRZX58XcrgR7z42fJkJeC9RDarWFn+EkiN+VSb0kjShN4Ps2a0I/Z+xtyWaCwwDfXFzs7z3AdV6x1sax6AKnXnA0Q2FM3daoNi1tZWkWZjATBIbhN6OfHOGBv83oBslTOzRkSmNxq1OcT5IePY=
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
Subject: [PATCH v5 0/3] Enable R52 support for the first chunk of MPU support
Date: Thu, 19 Jun 2025 12:31:49 +0100
Message-ID: <20250619113152.2723066-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|IA1PR12MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f16f029-e071-485d-caf6-08ddaf24e5c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ws0WRsV+YAjTav9Pvmon2o/lj2DsMoipFHCS2l8j9NaKHoDWkK4C/acv9+Yj?=
 =?us-ascii?Q?r+pfIGOcK/LMhtZCunmz3LfluIHklUiI1MMOHZuP2JPpQw/HzZNDiGlHeW8E?=
 =?us-ascii?Q?sPc7pGz/5184FoXROgwjL/MzLZfG87S0Kz4svSxxhONkJdXI6oDtUMWXQsLE?=
 =?us-ascii?Q?qJfvvtJgns5uAK5ojFgfRu1t40fEi0rrjZUCjy+Bo2twCItiiCx00899M0s7?=
 =?us-ascii?Q?oL4KKiraDVc97eYv7eJK6xMMLejHZOFo7jy3JwvaZXiH+J+YqY3MQBrqDYED?=
 =?us-ascii?Q?oJ9gxfVGuZ0QFQh7CqmdLpz+hWCc1xSVHoXoiVH/yiEiP4ad2BR75bgQhKkb?=
 =?us-ascii?Q?S0pwejjNVenw7Ng0O72bUemmLiBXTaoDrutoxvZ+X7zDdL08YUcQUHeR0lpj?=
 =?us-ascii?Q?lWg7XR3cCd9pxIg8beVFyLDpiObdHnvLMXVR6hDng7AknG3DZ/QLs82o/1S6?=
 =?us-ascii?Q?ekiANm/+IFnifLiU1SKCFdau4uNDHZ7G637Lutb4JDMdbXSYaVMZVTwgsgOv?=
 =?us-ascii?Q?cAsQ4ccx7LbUXHyOhI2mYzOul2J8fYjDMpMMHyVatoiU+jGcmENKvqxn0Qg8?=
 =?us-ascii?Q?zaHaLFYvckoITbowAjMKkUjsNb/kZd8rHxbRb88/62NslDUxxSkljkkD/jqV?=
 =?us-ascii?Q?eNza5zCkbRu08BStY/+JiNjK9mcV3sAHPuwl/RggJWyzJW1GwDO0Mvyy8zMC?=
 =?us-ascii?Q?ILC3Qe+262ybyrPRqrR2QJW8Un9eefvFTfy1qGEakcqZYBwfji8hkbJtxD+u?=
 =?us-ascii?Q?DIoVoG7kpErUlKDM29M+yXcdaBGmnrbqwF2dX1hWTtDQm7g+W9jUkjmP2/ff?=
 =?us-ascii?Q?4EJTiTrktjOtuq2+bdKtZ+8/ctR+Eka1vEWkUQjXz4SPByTkgPBDO4jHTvvJ?=
 =?us-ascii?Q?mdLKOIA9h1IKhd11s7TNFy3aNJZR0L0YkLwuiAuMfehqYBtmx9JN+t8DkCsr?=
 =?us-ascii?Q?mRVbhioMyY6Yrf/M3iSGQaHZGvjXM7Eh+MMe7FOfWWUdQmSllw+wmwruBau7?=
 =?us-ascii?Q?LtfTltUaF/MmHsqlb64FOWoYi2QIgCdGsub/DzxeAOErr/wFcd0dVuYe1UJo?=
 =?us-ascii?Q?UYl5kkiU1PlCNi4sbhm3DL33Ra1o0XeytDCkQQxcbeRIVZlMOTULMJfGZEa9?=
 =?us-ascii?Q?Xe0KJ24yk6RmNhknDvBjlxY9ozlfgUJXOsvcgnhIiz9qhUak581bGZcmlRSj?=
 =?us-ascii?Q?m8d7/cIeEwEXNar5barq5eqLHowJWOd3SrYGbkPqHqOFLNZD8Uo+KgHbUG8n?=
 =?us-ascii?Q?3BfZgM1sziMgoWcYFNs2QM5mt3n1gv7hmWW0TxXMe6hZOIVtWbQHB+vWFFQ6?=
 =?us-ascii?Q?5RgPKOC+rTtq1RmHLKMuNbzV9obuxrH6OJAthqN72Y2n6tZSNU2wYFiyfkRa?=
 =?us-ascii?Q?Tdc7o+34t9junrLjIJ8bAP+f40S3VpFpxx55Mb2hlPumVjJ1ikKcFQbnqV4Y?=
 =?us-ascii?Q?lxCb1Q6U9TQBDsLzWb0AMpnCd2BPhBgu66RW7Q23oSvzpDWopIOszB4+EYMH?=
 =?us-ascii?Q?r5zZHLI95bpajF+88etSCTf/ce/h1RR7AA2o?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:31:56.3674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f16f029-e071-485d-caf6-08ddaf24e5c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8189

Hi all,

This patch serie enables R52 support based on Luca's series.
"[PATCH v6 0/6] First chunk for Arm R82 and MPU support".

Changes from :-

v1 - Changes mentioned in individual patches

v2 - Split "arm/mpu: Provide access to the MPU region from the C code"
into 4 patches.

v3 - Patches 1,2 are merged. Patch 3 is dropped.

v4 - Add R-b, A-b, T-b tags to the individual patches.

Ayan Kumar Halder (3):
  arm/mpu: Move the functions to arm64 specific files
  arm/mpu: Define arm32 system registers
  arm/mpu: Enable read/write to protection regions for arm32

 xen/arch/arm/include/asm/mpu.h        |   2 -
 xen/arch/arm/include/asm/mpu/cpregs.h |  68 ++++++++++-
 xen/arch/arm/mpu/Makefile             |   2 +
 xen/arch/arm/mpu/arm32/Makefile       |   1 +
 xen/arch/arm/mpu/arm32/mm.c           | 164 ++++++++++++++++++++++++++
 xen/arch/arm/mpu/arm64/Makefile       |   1 +
 xen/arch/arm/mpu/arm64/mm.c           | 130 ++++++++++++++++++++
 xen/arch/arm/mpu/mm.c                 | 119 -------------------
 8 files changed, 365 insertions(+), 122 deletions(-)
 create mode 100644 xen/arch/arm/mpu/arm32/Makefile
 create mode 100644 xen/arch/arm/mpu/arm32/mm.c
 create mode 100644 xen/arch/arm/mpu/arm64/Makefile
 create mode 100644 xen/arch/arm/mpu/arm64/mm.c

-- 
2.25.1


