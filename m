Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B789517E9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 11:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777025.1187234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seAXI-00046p-O0; Wed, 14 Aug 2024 09:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777025.1187234; Wed, 14 Aug 2024 09:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seAXI-00043V-Je; Wed, 14 Aug 2024 09:43:20 +0000
Received: by outflank-mailman (input) for mailman id 777025;
 Wed, 14 Aug 2024 09:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSq6=PN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1seAXH-0003ca-80
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 09:43:19 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2e36b3b-5a21-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 11:43:18 +0200 (CEST)
Received: from CH0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:610:b0::24)
 by DM4PR12MB6182.namprd12.prod.outlook.com (2603:10b6:8:a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 14 Aug
 2024 09:43:13 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::82) by CH0PR03CA0019.outlook.office365.com
 (2603:10b6:610:b0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Wed, 14 Aug 2024 09:43:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 09:43:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 04:43:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 04:43:12 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 14 Aug 2024 04:43:10 -0500
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
X-Inumbo-ID: a2e36b3b-5a21-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWOqeU1nAq+2cvtQX5tRnE/zITUXXT2NzSLWFyMqhBXe1GCrD5HZDgXPe4wjwPWMQlSwcV600B/NsNo7qsWtcW8PYujwpOX+Yo6eR0gK8SAdUm7r0eTVStzraLSZKMr8f69v/VtELxO3oaRXKwZKzkQ6IBMzFJjZ8c9hbMY/FJgGYBsy6n0B9L0LyNsWS5tdjkze7IhuvCYzKiyoOPvnRc86yMbomgH5iQeDbgqcC5nbT410hjBNU1h6Rmr/PqvodN9EsXivHpucLBFi+MKT6eqY0YlxB/vl7+Tovd7fBA/4ce+WrQZmOJqqPTcVU6SrinVPdlgLbVjfDz440dSfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KSw71JxdXit9FabNCWRoEsweJcGEQpXx+neZF5JHpw=;
 b=wk/BisZmXFd1rRG5KLiRA03+9ryeUeN6+mMudxeAqf4OxkW5GaWymoZAVbEGwwG6fi1eBaejCgSRXFf7267fRRqbyu6vmF/TwAMCIYBi1e1AYQ0wYNUmKe4vKN+7P/u/Ll8enuz1TWbYhIBjsxMRAtcBFMoM7tqQCadJg65LyypBejasgiLOhjMMmTxM/0h7jH0jUEMpEcQhtCFDjJ7ZUGvQYkB1EO8j8RnWVNsya7SuCQ5ZJhILND3Wp+W5JC1fQwYFD+giH3SEblReUMn2cQjbNCgBIte0YYDw7JH8SYDVlAG/Vhwu/jKYqshfIGQHmh2yLWmvAruRcQ5lUPZc6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KSw71JxdXit9FabNCWRoEsweJcGEQpXx+neZF5JHpw=;
 b=Fq/redV3mqWGjtlIjb1g+BSnJwgAZyZioPMZ0CrppCZzUb7a1fpLcZDlGOly8pMIgXXnMYJgYOCJzu7eNQIgzFqdiQHatPENQjgVotGJfULgrD9g4lrmP+ubwwW+kbabIeUWyRC6+RDmrbOD9wXlE/sabikN0c4JzY6G0SEzVYk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: head: Do not pass physical offset to start_xen
Date: Wed, 14 Aug 2024 11:43:03 +0200
Message-ID: <20240814094303.23611-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814094303.23611-1-michal.orzel@amd.com>
References: <20240814094303.23611-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DM4PR12MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0edfc1-42ce-494b-15ec-08dcbc4583d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jo4kmQBdWLqLq/OQ8nOBkZtPFo78CRZyRkahpHOnONZrd7jVaSBeG6uC/+M8?=
 =?us-ascii?Q?HhZkeO3FMzqUk0VPFXaaqA24ivELb/2pq1Wb0/mlynKg6HXiEIyciIMnJiPE?=
 =?us-ascii?Q?MWVTtFdx01NAYUI/PCpZHT6dAtDW2BUR1T+v9pUVG7ssk3gSokFtUWaMlhhi?=
 =?us-ascii?Q?hIAQDviejcPaAp8e4k8YYs5Ds5OeNl4Iev4B9ZE2rOQ0asawnX9MqPBmr7H/?=
 =?us-ascii?Q?lvy7w66c26deRJ21kSrW7wT+BU/2g3ZkkrVW6YPKwSXuaaqa44PUxc9e65QZ?=
 =?us-ascii?Q?GBfjZcWOcK2q3N8RT/LP4XVY1t1Xha9EpNA3GXvuxgMsRVMtb92r/yjG7cVO?=
 =?us-ascii?Q?s4OXzasRxoKslDBfKBEHnejlvM6YHnCUzC+GVB9Q+2/6/UeZDcujyQpj/fe5?=
 =?us-ascii?Q?Uft9yWhTRemnpHNmBCJ3gZGtf3B9mtSyeg5WBLN/cqonP/NFQftO1QE76u1p?=
 =?us-ascii?Q?AQ6se16GT6pL513INB+vKMUFge1cz3V22s3ENbRc0Unge8e7YV/1RhCcdkTt?=
 =?us-ascii?Q?ghDvx/vTYLwHx6lCcE2lbk65lT2x9GoUHoiEldYe7U6w5Wt8gYg7cJh03Exu?=
 =?us-ascii?Q?rzhGNO6r0QwDNQFLlxo5Y76o/SddqSWcZPnhp7UJPsJ6JtydnCY7Dwwc3NrB?=
 =?us-ascii?Q?+zPZjhijtIBVcoR5ST3yAF3pPysbUBJ0MtqH+YhMAmuPWhh/Nqy/3EQucaM1?=
 =?us-ascii?Q?RtgZB6KH8PntlBGK5VUC1mhtVcQsmqs8eEc3QlSAqNcqCzFC8Vhgam8dl+g5?=
 =?us-ascii?Q?7g9uL5MKkbJW7gfJNR9tTzRk2+4DdlrnpTkn+Cpp/LAKLl1Tl48iCpGt/QmZ?=
 =?us-ascii?Q?7QFknugGqKkjlZf/Jg7cRzMQiFMpyRvDClZBN2baqCrqFjoKtxpjdUxK3Z+K?=
 =?us-ascii?Q?M0RWyBKKijSYkYQziSjql1j/TtrxO5gWwyM8lLSBVYMMILman/HeLLK0rLFM?=
 =?us-ascii?Q?NdrZg/8mXDH5NyPXQ7aFpxBEl562tUqFfBHoZOEL3i1G4XL0IL6Vskpbvsut?=
 =?us-ascii?Q?n1F1lYDV5JC+WUXVkSP1an61nAcFh8dfU+yC3SPBGsCpE6+ufj6dJdtgBBW/?=
 =?us-ascii?Q?5f7nH8U4aGNgFT3/lTfnun/t5XA4//hdWQTdK8Pt0+er7MCYo4BSpfdqGoBT?=
 =?us-ascii?Q?ftAbkw4G0LLUoqPbukoSTxCByTmp8czrX0Pp/4nVeV1wGHUu04/W0xthZkLq?=
 =?us-ascii?Q?qaAtjsjK+2r+vUF7k9l8e7zbv9b2hg+0SEBf5fmRQdL4DFifTrk/vX93aUzZ?=
 =?us-ascii?Q?cAftUSKBA0foa1uJNh1jhQJO4lchljLj4Fh2m/l2TBLfRgqhrrr2fJx+8Cpd?=
 =?us-ascii?Q?e+CdK8uyqtI+9UJG+RKsV6mTtjSH47SZJGkV1do6DZFvWUUAWIDPrZkB4uFG?=
 =?us-ascii?Q?37BJ5Zqcg8TWo57Pr8JYxYYMveLxzzbxTRtN/BMEDeX2DVUMdfvzQ+j3lZqx?=
 =?us-ascii?Q?OGOMKZrRJr/OZ62mitz73su76EwmEM4w?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 09:43:12.9466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0edfc1-42ce-494b-15ec-08dcbc4583d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6182

Given no further use in C world of boot_phys_offset, drop it from the
argument list of start_xen() and do the necessary changes in the startup
code head.S (most notably modifying launch not to expect 2 arguments to
pass to C entry point).

Both on arm64 and arm32, phys offset (stored in x20 or r10 respectively)
is still needed, so that it can be used in e.g. create_table_entry,
therefore keep it on the list of common register usage.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm32/head.S | 12 +++++-------
 xen/arch/arm/arm64/head.S | 12 +++++-------
 xen/arch/arm/setup.c      |  3 +--
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index b488a21a71ba..a96d5d35038f 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -101,9 +101,8 @@ primary_switched:
         bl    zero_bss
         PRINT("- Ready -\r\n")
         /* Setup the arguments for start_xen and jump to C world */
-        mov   r0, r10                /* r0 := Physical offset */
-        mov   r1, r8                 /* r1 := paddr(FDT) */
-        mov_w r2, start_xen
+        mov   r0, r8                 /* r0 := paddr(FDT) */
+        mov_w r1, start_xen
         b     launch
 ENDPROC(start)
 
@@ -141,7 +140,7 @@ GLOBAL(init_secondary)
 secondary_switched:
         PRINT("- Ready -\r\n")
         /* Jump to C world */
-        mov_w r2, start_secondary
+        mov_w r1, start_secondary
         b     launch
 ENDPROC(init_secondary)
 
@@ -243,8 +242,7 @@ ENDPROC(cpu_init)
  *
  * Inputs:
  *   r0 : Argument 0 of the C function to call
- *   r1 : Argument 1 of the C function to call
- *   r2 : C entry point
+ *   r1 : C entry point
  *
  * Clobbers r3
  */
@@ -256,7 +254,7 @@ launch:
         sub   sp, #CPUINFO_sizeof    /* Make room for CPU save record */
 
         /* Jump to C world */
-       bx    r2
+       bx    r1
 ENDPROC(launch)
 
 /* Fail-stop */
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 2fa07dc3a04b..14c3720d80f8 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -260,9 +260,8 @@ primary_switched:
         bl    zero_bss
         PRINT("- Ready -\r\n")
         /* Setup the arguments for start_xen and jump to C world */
-        mov   x0, x20                /* x0 := Physical offset */
-        mov   x1, x21                /* x1 := paddr(FDT) */
-        ldr   x2, =start_xen
+        mov   x0, x21                /* x0 := paddr(FDT) */
+        ldr   x1, =start_xen
         b     launch
 END(real_start)
 
@@ -303,7 +302,7 @@ FUNC(init_secondary)
 secondary_switched:
         PRINT("- Ready -\r\n")
         /* Jump to C world */
-        ldr   x2, =start_secondary
+        ldr   x1, =start_secondary
         b     launch
 END(init_secondary)
 
@@ -407,8 +406,7 @@ END(cpu_init)
  *
  * Inputs:
  *   x0 : Argument 0 of the C function to call
- *   x1 : Argument 1 of the C function to call
- *   x2 : C entry point
+ *   x1 : C entry point
  *
  * Clobbers x3
  */
@@ -421,7 +419,7 @@ FUNC_LOCAL(launch)
         mov   sp, x3
 
         /* Jump to C world */
-        br    x2
+        br    x1
 END(launch)
 
 /* Fail-stop */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index cfe19e15b0be..961d3ea6700b 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -287,8 +287,7 @@ void __init init_pdx(void)
 size_t __read_mostly dcache_line_bytes;
 
 /* C entry point for boot CPU */
-void asmlinkage __init start_xen(unsigned long boot_phys_offset,
-                                 unsigned long fdt_paddr)
+void asmlinkage __init start_xen(unsigned long fdt_paddr)
 {
     size_t fdt_size;
     const char *cmdline;
-- 
2.25.1


