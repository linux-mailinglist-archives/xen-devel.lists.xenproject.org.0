Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEFFAD0703
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 18:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008670.1387895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNaFm-00052k-FQ; Fri, 06 Jun 2025 16:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008670.1387895; Fri, 06 Jun 2025 16:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNaFm-00050N-C3; Fri, 06 Jun 2025 16:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1008670;
 Fri, 06 Jun 2025 16:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=La23=YV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uNaFk-00050H-NJ
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 16:49:12 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2412::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a9805ae-42f6-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 18:49:10 +0200 (CEST)
Received: from CH2PR20CA0011.namprd20.prod.outlook.com (2603:10b6:610:58::21)
 by MW6PR12MB8868.namprd12.prod.outlook.com (2603:10b6:303:242::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 16:49:06 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::5b) by CH2PR20CA0011.outlook.office365.com
 (2603:10b6:610:58::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Fri,
 6 Jun 2025 16:49:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 16:49:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 11:49:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 11:49:04 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 6 Jun 2025 11:49:03 -0500
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
X-Inumbo-ID: 2a9805ae-42f6-11f0-a301-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alH14zjTbnbFDT0XXWzjQMtHET7kFvNMlVIWTLiqgrXSZWmG7KcxiFlIyZmlananl35dz5ivHctsJ0iHFr4BcA5wDMTXHS+5HSl9TO5oa/MC7rg2deShdHAv+PbqBHyVbCmQauYuIJcK3rslk++hAV3v2tZn/ID6MwuIHj8DVgez/ilG9DRamqKqUi8ivVk01WoS8gRnfkI60JaXPg43DCN/uY62sgVTi9L4CuqlBSr+/ApyEsefg2BtuVWgrsAEVUknRHL1Elmi27hKElkp06gaIjLEiEOdt1C/pR7KUYI0yVz3/e5rWBG1RfIkeyALHIgkvyWo9/teI6tipr0Qdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4q+6YmroSAhn3e6pTGRGz5dLRFnLkReiw0P2RtEIco=;
 b=x06X2dX/Q9GqyKxa5q56hZkkdrfrU3tGERE7y5GuSTE5fMGq+GkARI/BMFfXxYtXpnIPCDYFZgOHdOhN6G1tUnMoxv4Vxn7tf2imkncE/x7xC6LMZw64AaXM1ZjYYIUGXVKy7rO4yrB0h4uwdZT27VUtsd4TJ0wkN81dxi8owoGW8Is4FhDmbsKgk4fabM0UZ1Rhk2HbO4BXF5g8pKa5ndTlvSBgwwMQ+2jnJVLJgF3QKmSJ2k0wry7dCXW0/WvKjteMVZWGv9u2vj099vzUDqn5QaEKvjgWQSZPSPdMAsrglD/Ckglja8i0FFu7fAZYwclPZ8UdAk85zggbv1EiUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4q+6YmroSAhn3e6pTGRGz5dLRFnLkReiw0P2RtEIco=;
 b=dbxAvDwav4kZH8ykRJSu9etKczZO8hcCz46P4urRbtt9SVphHMf4vIFveabXZAI/HkdLstkCEBKklXcUq5/AHTADrqrx/FRdZd9qb8nHiWfcn6NDcJae38y8kU/pIYP4Wihz/6rP+kp8wo2Ix8rtTUo/tVRMznL+vfssrXzA1ME=
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
Subject: [PATCH v2 0/3] Enable R52 support for the first chunk of MPU support
Date: Fri, 6 Jun 2025 17:48:51 +0100
Message-ID: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|MW6PR12MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: c130fd62-d0ba-49c8-7dd2-08dda51a0c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wI0SCccucf6nI9ZVyvh5+675bai/KScPbNMBaEnvlqkZMotMKuw9PNVwIdZD?=
 =?us-ascii?Q?OiYbWoSVoXQl0L0LIoESFNLlHpmSGZN+mWg7bWjilLsX/D8eGoQtzhkjbwSs?=
 =?us-ascii?Q?Rrnf2oLc6ZkZYb0ItZGZK9RMp5BkNEUqAXx5YB29KlT0o5933v6W5yHOhXqj?=
 =?us-ascii?Q?6VGo1H83NiAm/+gWtgqQIoe9u/I0RTeV0js/uWmdmpQ5KhHLpi8J1V6HzMTm?=
 =?us-ascii?Q?NlhkPCtxzSygzRLbe5h1Fgo2LLn3RoPR6snRAHRqkNM2LZzs71Bc37zSl41G?=
 =?us-ascii?Q?19HYupT2oQsPXASviPJxP4xTDxF6BhWgxWGkSpGCiTKrBFTF4KZ4mLDLY3Bg?=
 =?us-ascii?Q?DCXwpVcGGp4l4QbuJLHClci9sSYjNa5mhrxc1PAOGwE1D2tNTcS/+cAi7+zY?=
 =?us-ascii?Q?g6WpaaQDR4TYIFXluSUq9N0oxAZ9HiOickj6n0y7IcXlGZbJ6TfDkipIVrBB?=
 =?us-ascii?Q?Gpg6T/LlK8/qVnT4jPSyXa1mi6LWyK+g/iQt9cWri8tgNg062vHKoy/OO5Qx?=
 =?us-ascii?Q?YdIetMvn6V6WyearooNLJcF1bUs82IPoZC6yhM765rHeRa1G3lHYFSSUraaE?=
 =?us-ascii?Q?6sKar9twFlJm9swQXro9J6IbaotqDVn+pMxub4/oo/E2S0PLPlDcB4z7HdHu?=
 =?us-ascii?Q?3yUCeV71EIpW49IdB5CmLJnKk44uvucoXtP+3tgg0EKvbUr2YxgCv4Y0Fs5A?=
 =?us-ascii?Q?M4Y4DOYzmdF4WwAcEYLRhupCztGx0Oaxx32PA2Rdnd5u8kpdZGjrE2lKStqu?=
 =?us-ascii?Q?aQfOWrcjEoH2b14Y01MB61xwP12Mry3cboo7VvNJ7WvU8m6tFXgEBJsrc/jB?=
 =?us-ascii?Q?tnj13X9m8i04NACwTd6Is2mKyd13cm2X7zWLtD01sTy1kUFSfxtzgM1noHgN?=
 =?us-ascii?Q?fEZhdaM6V0K7UomrY5AixabuW3hwaCHSrMJp3odFDKqVNGPWBYAj07ioNbXX?=
 =?us-ascii?Q?DrzsnUY9XJmr7PzAPSdUSolXh8a4xLkJag5FAXa2i90xehPMo8aFdopKVUwZ?=
 =?us-ascii?Q?3BCA8asea7PVSzMW0ir5g0SsS8HNLzhJQxRYsNXkIdVjTZDwYWVxTNewpeMS?=
 =?us-ascii?Q?854aD6eK7dnuwM4KGoC87KW+ygbP41OdISme2MClGvLp0B2GCcOdyWx/VU6L?=
 =?us-ascii?Q?Pk81jnwlctkQRQd/aGX4irwYMSMl4DNgrkT4oRG5JPizC1aG52or6lFR5YO6?=
 =?us-ascii?Q?B3FVblmWAjRr1vs5r+Z75FG5hNXNEo8Y/Iw7tOxNEj6722eZy0+YuGqCDgqH?=
 =?us-ascii?Q?Qiis2BGLutNio/P6KprAtrzTOi5tmP2qjq4uByc0KFG2jwgChNjTy+NCZOYt?=
 =?us-ascii?Q?cL4tpB9tCBtYZvVGbFaDYCX4+fi8pso5p1oL8fR2ztwsA0UHxUGJ0aWrFS/d?=
 =?us-ascii?Q?EkPy84javQ9kHJ58bkMezvQV56eMHSAGZjdTSL9Vr1GRyd/Xly+vO3MwPS6m?=
 =?us-ascii?Q?EdX5cul50eiycqLgmEwNPGbFNMNI9nusiaN1I9MdFQ4EaLQunZzym9vtuWUF?=
 =?us-ascii?Q?DIiClOYvHxDKrXkXySLyW27fHZ8a79EGfhtN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 16:49:05.3779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c130fd62-d0ba-49c8-7dd2-08dda51a0c86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8868

Hi all,

This patch serie enables R52 support based on Luca's series.
"[PATCH v6 0/6] First chunk for Arm R82 and MPU support".

Ayan Kumar Halder (3):
  arm/mpu: Introduce MPU memory region map structure
  arm/mpu: Provide and populate MPU C data structures
  arm/mpu: Provide access to the MPU region from the C code

 xen/arch/arm/arm32/Makefile              |  1 +
 xen/arch/arm/arm32/asm-offsets.c         |  6 ++
 xen/arch/arm/arm32/cache.S               | 41 ++++++++++++++
 xen/arch/arm/arm32/mpu/head.S            | 25 ++++++++
 xen/arch/arm/include/asm/arm32/mpu.h     | 34 ++++++++++-
 xen/arch/arm/include/asm/mpu.h           |  2 -
 xen/arch/arm/include/asm/mpu/cpregs.h    | 72 +++++++++++++++++++++++-
 xen/arch/arm/include/asm/mpu/regions.inc |  2 +-
 xen/arch/arm/mpu/mm.c                    | 51 +++++++++++++++--
 9 files changed, 224 insertions(+), 10 deletions(-)
 create mode 100644 xen/arch/arm/arm32/cache.S

-- 
2.25.1


