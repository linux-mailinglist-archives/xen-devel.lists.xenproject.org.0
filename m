Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65496B25E98
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081020.1441158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTCC-0004YJ-4T; Thu, 14 Aug 2025 08:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081020.1441158; Thu, 14 Aug 2025 08:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTCC-0004Wm-0p; Thu, 14 Aug 2025 08:20:24 +0000
Received: by outflank-mailman (input) for mailman id 1081020;
 Thu, 14 Aug 2025 08:20:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1VE=22=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1umTCA-0004J0-6n
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:20:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2415::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82bc8842-78e7-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 10:20:19 +0200 (CEST)
Received: from SA0PR13CA0009.namprd13.prod.outlook.com (2603:10b6:806:130::14)
 by IA1PR12MB8237.namprd12.prod.outlook.com (2603:10b6:208:3f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 08:20:13 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::e7) by SA0PR13CA0009.outlook.office365.com
 (2603:10b6:806:130::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.4 via Frontend Transport; Thu,
 14 Aug 2025 08:20:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 08:20:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 03:20:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 03:20:06 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 14 Aug 2025 03:20:06 -0500
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
X-Inumbo-ID: 82bc8842-78e7-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+PKR9niMwjCf60uqQkAxNURm6a9QL49sRt1ooye5AI+wikhWXZ0F8W3U2oykbUnXH83Zq0dRpOKTC/md3u9dEA8mX0FJ2cAwutaGZ2ZDUPjE8+meYrhHuJv8CQ6bul+dfEvrIevOg3chXczSgThFdI0T0CRdW+44rnErEUWYUlHS7u30VsVUCPrdfKM0uzVOsOadZly52diUSoX/4s564Sos+EcFpYMJpbGyhsd5HrGZov2nrZ09mAiCd5VCeaM7P5088SP8/RP7ONYQWkrtkVgidbrOzY4D/cAP9qmOxGpBonktwgWu7MJ87iyp/mdGWa0xdDTnQNiNfqtq0a5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmJ6+vdHYgowTVTBApXvjSDH5MRfDYQrN1q9jEV0aQw=;
 b=vEu02IwMbLCTlS/a6rhQa7OSLGUN99fz1C6O+Oz87XwjWVUceOQtdUe11dOKXX1u/TrnRWsZH78cRfXmysorrcpJWW10zS+ZjLeq+Qy6GXTuM7VlNkbYBrtnFyLOuv37Xg2OjrmqSXf7pqF9gLZD4pY9GQE+bq0wUnJzLt+pCIpp5NK2LSTOg7IbBgf+XW3DEe/XG5N2Ul6S4l4w8kIe2C/3oP+m+cl3VQ1LJVdh9U7P5Tqf7XGSOGfbZRURHI9cRCxTd5AxdkR16/HvgLWHtuGABwSkxGLcsizFw8KM9i+r1DqL5UXAYWtB8E9O9m2al9hHCr2C05VLUj5Y9J1JTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmJ6+vdHYgowTVTBApXvjSDH5MRfDYQrN1q9jEV0aQw=;
 b=NkYZlWHcR4sJcNY+0/8xl4AE5e6SpX0udTz/KoisHV0mzUSuA/ywysmyfZbqr/Ti6RczdKzkFhtY2VoK8To0toyCRE5HYf3KG9mCOvkdu6zNifPy20shwlCYbfCXTuXOuq0mWwK5+egMI1pmaULAXWAXdBIC6Q9Cbx3WUxImXQg=
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
Subject: [PATCH v2 0/2] R52 MPU support (for "Third series for R82 MPU")
Date: Thu, 14 Aug 2025 09:19:57 +0100
Message-ID: <20250814081959.3504145-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|IA1PR12MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: 0198acca-1fa8-42c7-4b50-08dddb0b63fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ekGZv6taioPcVvnGav0k3bbu0NwPktQjyBty5H6dW67OLed2qCU5z8FwxK1c?=
 =?us-ascii?Q?Y8QTDjX3Ws/JEIsLRSTN6YdIjtYfyHcxNDEf9o5XzfNPGvTo3wEeBjc0kis7?=
 =?us-ascii?Q?iLQcWEzQi+LJmGIbbIS6jynB1of6dA/5yagnAnSw3BHvzePaJ9py+80OJdlK?=
 =?us-ascii?Q?QinL9N/D9EgHAUHvRJzuLry4v6Fv8s22HhWhhU8160QrgIDDJz6Bb8SPIJ5y?=
 =?us-ascii?Q?o7oaYBK0+vHnwVd/F6QVTcWAY9I9Cl5IFcouvAYlXqXdsicQPD96BXXOn15Y?=
 =?us-ascii?Q?87SpcRc5je27++BE0rvaiHxBro3lgQ3VKANWzxWR8jLEVl2P/FX7+ZZOpAM0?=
 =?us-ascii?Q?ql9cR1/68ep836xpflA4LkV2449s/Nv6sTEAzxOi3JR8ltLAdVJJcLRunsb2?=
 =?us-ascii?Q?+p0t575hQT1dkxlCypmm1XBvCoK8sevaOayBhdmRtAqrv/WpfBjCKV4bcckt?=
 =?us-ascii?Q?FI0oWeIzzeNid6qMKb4xnhH2QtWriUHZCV08+t3GjY2fjQqzQQnILuzNCieZ?=
 =?us-ascii?Q?9df6PGEink13gU5jtI19vrcbkRbXexuvRziPO1Pd0jBk1E4XuRqIeeOTmJkk?=
 =?us-ascii?Q?GvwSKCwZbHKhBK5RMT8qvolOvTr6pwx0Xce2KYlpolp7czRU15hUARpluxyU?=
 =?us-ascii?Q?b1yVPaN9bFZv2O/Tq3sIMUfJ8PN6BMRE9jCYRyUW3ZUEgqKdLFhJexIriRR3?=
 =?us-ascii?Q?PtJ9GrcRSf1qG/2LtNwxKL2Ri1gY30hrFugPFCueRNhs2VW5DvycEjEmuP4H?=
 =?us-ascii?Q?iYXG5w69GlfmLglAKQbNAfaf+va+DlCyHM14jVRQ9PdwM6pFj87mFBl8HBIe?=
 =?us-ascii?Q?jg80WFjcm1LDEhXt//z6gKomFs8rV+NWduemln40LZsApfW8406quWZi1s28?=
 =?us-ascii?Q?be6ivBe/Ti+IFSeKWghR4ca4KDhUm6ZiQ6/82K/OSQx8JOo/InzzUcwAjnuP?=
 =?us-ascii?Q?cFVOOdojDKqEq8C3uryvkUEDVe76wt3Mz2vStAghJOJ+gpol0kXFR7dKELLP?=
 =?us-ascii?Q?1n0pE2o9OiQnw8TWY3IkbSjhSP4rQ9a6glPZT2vNQD0DsMEEFz8RgavHTnt1?=
 =?us-ascii?Q?atpPTuzxmuTZhV8nHA/5414HmaOGkqZmPNud43pm0etRzi5g5QQYLMcBO/kr?=
 =?us-ascii?Q?zf6mHYPd5Oj7jjEvThPR0vufbZX6dUbgjcwboVGRHtCcusmR4vPwN2ruTDw6?=
 =?us-ascii?Q?Q0ORP+M0Vx7SLm6Jz4UdN4K7ZovvKvDvi2SLbU+OqLceXIKct5b43iD7Hb3B?=
 =?us-ascii?Q?oy5WY7odbkZH8szBWLu46pWptwZMOOMD2OPn2yXBgr9syEQthp7t6wy1PyDo?=
 =?us-ascii?Q?ZlmEb+Gi/D44FsxqpZZCmaelagCp0zUkZexFLT9nZVPhIJCxkXtRRFtA2W6V?=
 =?us-ascii?Q?ugvdLRwxvlexpKlQTO1Hw2q7snGkjsxnln7Vmskc6zeKtSnUyiWyE8HVy+2p?=
 =?us-ascii?Q?4Bg6tC2HxPH6DnyzKqn08TQzv76+GpZSGksF6xh+2Xpa4HqZ7hRWoiW3wZBN?=
 =?us-ascii?Q?WUZf144RXyMnzAKO0Rl/Z2vaaqlV71QB/wuk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 08:20:12.4250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0198acca-1fa8-42c7-4b50-08dddb0b63fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8237

Hi all,

This series is related to
"[PATCH 0/5] Third series for R82 MPU support". There is no build dependency
between the two series.

At the end of these 2 series, R82 and R52 boot till the same point
(approximately).

Kind regards,
Ayan

Ayan Kumar Halder (2):
  arm/mpu: Enable is_xen_heap_page and is_xen_heap_mfn for ARM_32
  arm/mpu: Disable map_domain_page for MPU

 xen/arch/arm/Kconfig              |  2 +-
 xen/arch/arm/include/asm/mm.h     |  2 +-
 xen/arch/arm/include/asm/mpu/mm.h |  5 ----
 xen/arch/arm/mpu/Makefile         |  1 -
 xen/arch/arm/mpu/domain-page.c    | 45 -------------------------------
 5 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 xen/arch/arm/mpu/domain-page.c

-- 
2.25.1


