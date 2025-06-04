Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B977ACE3D9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 19:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005793.1385194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMs9N-0006gO-EI; Wed, 04 Jun 2025 17:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005793.1385194; Wed, 04 Jun 2025 17:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMs9N-0006dS-9z; Wed, 04 Jun 2025 17:43:41 +0000
Received: by outflank-mailman (input) for mailman id 1005793;
 Wed, 04 Jun 2025 17:43:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eifV=YT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uMs9L-0006Ny-7b
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 17:43:39 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2414::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6be5fd18-416b-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 19:43:27 +0200 (CEST)
Received: from SJ0PR13CA0209.namprd13.prod.outlook.com (2603:10b6:a03:2c3::34)
 by MW6PR12MB8708.namprd12.prod.outlook.com (2603:10b6:303:242::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 17:43:23 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::65) by SJ0PR13CA0209.outlook.office365.com
 (2603:10b6:a03:2c3::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Wed,
 4 Jun 2025 17:43:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 17:43:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 12:43:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 12:43:22 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 4 Jun 2025 12:43:21 -0500
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
X-Inumbo-ID: 6be5fd18-416b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H68oeu/z6rAq4buWBsxOwqDPA98ZZwlpC8qxn2u4X7DfEBgJ8nAuaaJ1F3CsneUikm3GvzdnExGhTz9aDLinUO4eE09HutvPVWmgJRdsfTLVljrd5Raj9hvuTvR8phqK5Yb8hSm9RhodV78FeSA2EAUT66EbDPmWMuZNPMTK8edXEqw8sZgBVA1r0TXs8XUXClJiGRMsInK6qYaNtR4jJ0gOWgLFCK6WdjfXiANi/BSujWb/GNOFcpMi4pcr3lE5HRuMqwGktupAtX13bLFeJAoZ6HQUuUABHi/Sf1Qq3BXAOD2PZxpu/M8Ml70XIiUhJkz3u3rJl/fSc5Wiz7/DDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1sfToAZNlyRaxZJqcw3TzKgYq0CR67tXwv+x0v9c2w=;
 b=Og8QU7WNSsFtrBs+deiKcT4tjn1cE4HaU5q2drE935al9dh2+p/0PGohvULpeedLWGt6LyBef8C6Ff256iKqCGQXc49JOhEp19yb+V3ZT0e1BA09ZzDSanVZXrU3WI9Kg496h3vAJA5UXWrZXQotjGfEfsmuVO2HqVwIMo2xq+jBmL8WJne+NKKLHJQsin6F+h66bhdZ6+D2Bci3BUtYsEuTXhlDBKEPIuowwOHuU4sssujfL9jHUbRHK08XO1cFbiwGJGTEPiuN8WO6/WFaosHKqPQQxwVynXKlCaA/5Z5PBLXxKNA5h7arS7XvgjY/6JeK6kmUjq4If5fixS1vJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1sfToAZNlyRaxZJqcw3TzKgYq0CR67tXwv+x0v9c2w=;
 b=0wrG6Xy3AxfWsiuEnf80Jck58ao9NH3TJBXd4q+hRf8DeqbGokNa8XVkMwIfFJcICrxJQuuwcy2Ce3kk8WhJ1NctD1h0YXE+JGwGqCRU9ubBb4zanGGcYvZlZoA5cJbUMVGUWoati/Tm80EpZXk7nJ5kkV31ZsI/kLATLB7JTZw=
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
Subject: [PATCH v1 0/3] Enable R52 support for the first chunk of MPU support
Date: Wed, 4 Jun 2025 18:43:08 +0100
Message-ID: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|MW6PR12MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: cd44d750-94c4-4c39-ac69-08dda38f4d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BD/FhesnOJoL8sE0rBOTtfBrt1Y5TPpxq9KEZwNlQgghtF5gNsHh+Jr6xTgi?=
 =?us-ascii?Q?HlxmVKvHMoiOYzVfxhEvL9G9nV0U5sMZrPeywE3DKiN5uVp2vkq4pRhq9gzD?=
 =?us-ascii?Q?P3vh5OI7UPHfpj4UntuoZhImAmPlpPalPHIsMTVKF3LeAkEmeLwjbK8U5cL+?=
 =?us-ascii?Q?4/Y0fc/XxFdFGgdwBoFp6gpGcPdzXxH3RMFsH0N9t82DLns2ppcFw/Bscq6A?=
 =?us-ascii?Q?eO+bjrRIzuMVJo1jat/X0uavUjuT4Ju8cyrXPKcNX2C3TABDxEHkK9qJU35H?=
 =?us-ascii?Q?n6HfteZc2PYwPKh5YXmxPlqROGKxn/GP48CUTDQlkCyywvC6D2DTb15bpoSl?=
 =?us-ascii?Q?lknoKf8Kcu09nv7Bfmn4a8FhViOZ/idJiouHjnQ4dsJBjZeNF/kXvxOnfzfe?=
 =?us-ascii?Q?HLtlj6Y81TBZLJuRne728xDOmEa0grOfVka6u8agBI2Ez6anfA1+apRR/FxF?=
 =?us-ascii?Q?eL99XQPgJ7KyKVCnzmhy+Kyq0uMy0PcsnepP9HZLv0BO+yZZt/hSfz3RyiWu?=
 =?us-ascii?Q?k3XR22ySnAx5MAp2ad2E3b0ypBtA3DYbw4GOk7Zmx+Lvj3ikBQSKHsDnE4sQ?=
 =?us-ascii?Q?GwL/zee+4Onfuwh5m39n6YdyfpXFWfZujCjtUAc6dT3jMwVrSWyijLZfkp3b?=
 =?us-ascii?Q?c5IvOy6FzHKdw/1f4HS5usvIrSN9n+UR4y7e4dVeBzeMTWUEAEs3yAg29F3z?=
 =?us-ascii?Q?6txkeIoXqARf2DLn2PDb7f/WdLVWh42Up0k9aLPnfsbdAM9516L+X+BQbjFi?=
 =?us-ascii?Q?ym1LFlSF+hMrdOZoEVQUM7SyajMAAgXT5l4i8MrlHlArFsopzULn7UU/BvVA?=
 =?us-ascii?Q?94sNsIYwBGew2S69bAeAcplH6tD8/PypIVl3ioWL4G44sxP/5NiM+yx9YeHX?=
 =?us-ascii?Q?ThHOLjyijgEMzhID72KvQjk8lChoC43jTpiaFUUixGMHcupSRJr5nWHZSrof?=
 =?us-ascii?Q?co4osN+xGM7iR+oo8vgWesaFSL/g/F/i6tvfrwZ0QbuGtrEm5lf0Ynxfzb96?=
 =?us-ascii?Q?xUsK0B6pYPgHzA73GBA9hhYdhuidZYTNjUGdUaCiuKdNAsNBAZHaSZHwg+1L?=
 =?us-ascii?Q?0LQyDySp4MrtrmdxQEPAp+JrjPnqTXavoJu8pxGXQwEXCuCEW28DsxOKmQZF?=
 =?us-ascii?Q?UnuZx2WvCT6iH8sFdWNS8tLjCJp64nVP7c8DTwPAvZdwuix3tWaibzfXRlR5?=
 =?us-ascii?Q?elZyLEPpttDXghurS0UmTEIStkssnyq5plsQ4GyrdeBc/CkEgyb5gAZy601q?=
 =?us-ascii?Q?CdqmUW4pLBIi26U7gHW1n7gi4cvA9wMjQZ1STrNfp73/fvNgsOqbGx4E53sJ?=
 =?us-ascii?Q?eUVqSxw1QSh+LuBzb9SF3USToQ40NO05c3PISRTl2RjCgNRbsFGwXta3ntG7?=
 =?us-ascii?Q?I/TxplIh0YMnBLdnZiI4MAmdM21x8Y636KqPc8I/LjCP9rtLycwQ542KZ5/C?=
 =?us-ascii?Q?BaeBkuOOvO9UwCG2MFfNLyPO2qqbFCSWB8PZgyPFcqL0yeBy5uxxJBTVn2UO?=
 =?us-ascii?Q?pheOvXdlCsX8svhq7hQoniY7M7qFtRPLeami?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 17:43:23.1203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd44d750-94c4-4c39-ac69-08dda38f4d84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8708

Hi all,

This patch serie enables R52 support based on Luca's series.
"[PATCH v6 0/6] First chunk for Arm R82 and MPU support".

Ayan Kumar Halder (3):
  arm/mpu: Introduce MPU memory region map structure
  arm/mpu: Provide and populate MPU C data structures
  arm/mpu: Provide access to the MPU region from the C code

 xen/arch/arm/arm32/asm-offsets.c         |  6 ++
 xen/arch/arm/arm32/mpu/head.S            | 57 +++++++++++++++++++
 xen/arch/arm/include/asm/arm32/mpu.h     | 30 ++++++++--
 xen/arch/arm/include/asm/arm64/mpu.h     |  6 --
 xen/arch/arm/include/asm/mpu.h           |  8 ++-
 xen/arch/arm/include/asm/mpu/cpregs.h    | 72 +++++++++++++++++++++++-
 xen/arch/arm/include/asm/mpu/regions.inc |  8 ++-
 xen/arch/arm/mpu/mm.c                    | 33 +++++++++--
 8 files changed, 201 insertions(+), 19 deletions(-)

-- 
2.25.1


