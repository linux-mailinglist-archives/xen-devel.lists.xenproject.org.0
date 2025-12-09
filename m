Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38644CB13AE
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 22:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182191.1505117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT5Yf-0003K9-25; Tue, 09 Dec 2025 21:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182191.1505117; Tue, 09 Dec 2025 21:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT5Ye-0003Hj-Ur; Tue, 09 Dec 2025 21:47:44 +0000
Received: by outflank-mailman (input) for mailman id 1182191;
 Tue, 09 Dec 2025 21:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snnK=6P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vT5Ye-00034H-5F
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 21:47:44 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0883b20-d548-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 22:47:43 +0100 (CET)
Received: from MN2PR20CA0039.namprd20.prod.outlook.com (2603:10b6:208:235::8)
 by DM4PR12MB6086.namprd12.prod.outlook.com (2603:10b6:8:b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 21:47:37 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:208:235:cafe::b7) by MN2PR20CA0039.outlook.office365.com
 (2603:10b6:208:235::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 21:47:37 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Tue, 9 Dec 2025 21:47:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 15:47:35 -0600
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 13:47:34 -0800
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
X-Inumbo-ID: b0883b20-d548-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rn1vKKb5ct+K5H1feRmzbeOUpmGnMnsCflXN/FIZYCYSIlpVSjS3Tt+WZhPcJexCXDqO5KIXLRCuDLTsZ7FKZDM2jX3MqAUj04pNIaME0YZDo3wvlOSIshwwG5DcjIllWTmnm+5tHm8HzmDl9AHvp6KMZaU3dJsG7gesM6qJF7eBe1Gg0jHChGQQ7VN7l1C6uEHCYdZpODkFC6rbyh0CK/3XofyrKFnMZOHGtoVTKEakYjNXX2mlcfXwK5MZh9sv5zlMx1LWZn0MYVQNcj0pV3+Qke7ShP5bVHikRFqbCO/rSixhgjnsxR43BWsf/IZyCwJx2OyCASVJM0GLtkaOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XCbSVFNzCjt7w3qMGM0qa3eYVALUm43b3M/D4sJmyw=;
 b=zVDgYFIrLhpK/4LkG42NtfBZ875segA6GXHWqH6rAYo10B+TyLdb/4HqPXNxfr+Bphf+ll3K38BWeNDkhZ89hkBP6lzM2owV+KjNU2tCwGlxXun79Ze0H+52GSwriWQxio3cjzqrjRtUV+ejg/oGzXG/lzf/CmR49C2WU4t6pDUhdbv0wrWt37OlByPfHr/YswLW+EQ/uELEO8DryfbljJuKCxNM9GHObud9NUSlI4xeetqe0fpRwLGTUs2XxnZzSiw+skanRKzI0Aa6rN7F3zp1ZGLPvXn3+SyI/7U3239PDM7Oa2kHCPePE1oLFGOTGEgaHVmTh/3l1zeSqMQpXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XCbSVFNzCjt7w3qMGM0qa3eYVALUm43b3M/D4sJmyw=;
 b=fuSFM+y7xtbN5EXF7P3uZH9m2FvZl+z5fnJRMyFhXTL0YZ4ouS4K7TwhsQm//I0ir154yNK7r6n+PONNTV61p/MW33UOtyg4roYZKy5LMuhe5+MhildJFRPZ5c4KoLdUkGw7lsA0pkkzcbynPUCL9R9FL321XWRK42d8/IWwib4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [PATCH 1/2] xen: Centralize scheduler linker definition
Date: Tue, 9 Dec 2025 16:47:27 -0500
Message-ID: <20251209214728.278949-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209214728.278949-1-jason.andryuk@amd.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|DM4PR12MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bcf85a5-61f0-47e4-1236-08de376c9164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?62LwAZ2tfp2uDTE+r/O8nAn7KYdFN0euN2EZSur4Dwt4uEujiAdC3dw2nP8H?=
 =?us-ascii?Q?sYRWmbF+TNHoEJhWnH9vAIZEoqdzjc3PpDm9vTnmNTgxWyRNg6qPWOVVabUx?=
 =?us-ascii?Q?YhTEKQJQNC+AGAoKeXtBHPN5u2CUynrJJxl2VFRMyOT7FqqwN3OBvgwGYdfr?=
 =?us-ascii?Q?cCY2EPTPl/Un6Qpeyb6TMpqb9fUWCf9T5VbJRrst2iIUqJvAnDSMqrChkeuc?=
 =?us-ascii?Q?4KdNqAeDuUA7sjxt7DEIx699WqXCrJb8UlcaUiWoaIaPc/kJ4kCA2RgXymtz?=
 =?us-ascii?Q?9e/OWWSZNxtBrJ32cjXc4D3KXd/0LER1bZsHwz7NhfGtQiVCcfNc7Xt04fQ6?=
 =?us-ascii?Q?G30MdWqlLh05c8wutzN7i5meAeOok6K+ckTWTtp8XxotRhsc8V96ke3+kS6G?=
 =?us-ascii?Q?XODnRh/Iur0fghuHKC/M3+HAw0eF4ILT4kuqFt3GkWsZpWgsdty/XVwQID+m?=
 =?us-ascii?Q?c4mQkPOppPkqOixJz3MZSrv9ji29rY4pf6DcoHb4wchkGzCINxv2gMBSvdcr?=
 =?us-ascii?Q?bHyp6rQdg+Rm9AAk3ZkwNUdzjuSr/1/ua/+hdpxZrz2qYwOAiA3sVYC/A4fI?=
 =?us-ascii?Q?M6QlW6oimyY8MUBiiVQ394syyRXOZrgVCXMqFKJBYeQG+L+Yr+K67B3Ihv5m?=
 =?us-ascii?Q?wYiACo6zWYGJ1z1FyALUMi73Q4NT6qcfcqO2BjL2QBxopWphiKICj1o6GqLp?=
 =?us-ascii?Q?JhNkjaEXw3WypUvogodxELfN0irocS9W1GLjD9sw1xi70ZbEaywihhDO3Czw?=
 =?us-ascii?Q?fWc7nHt393I26rYw9J79YOyag/FNRGALRsO1kqhHrGJtKM0IIZSYVKkr1LoV?=
 =?us-ascii?Q?ZCzEhBmfSoaluHPIQZmpfvqvqapiO7Wsp+pTvNF1EDWfypoVtdgqH+9mnnH2?=
 =?us-ascii?Q?nVDFgLaetyIjeg/urWKKjuHeoo+c2ifA6mLS53GJEtW0flg62zMn+m8HQcmm?=
 =?us-ascii?Q?UR0xX/JbRzO7r7dvLY1GH1D0zXH08ioOikhwinLjEebtMrYSLfMy4sVAphtN?=
 =?us-ascii?Q?MFRcpUAKk2kpTJt0RauglH1E6/Va+6/1ujFQPp8WM4Zhon35670I6QR0A10F?=
 =?us-ascii?Q?Q/LTHXCMP7WNwmJ9EGblaAW6CeLNu9kWj4bvFsfZSDFUhjsGCno9Wyw2OPRP?=
 =?us-ascii?Q?9UewqAuHznmBCMa3yb/CuFlR9gzKXxh/ybnMmYRxFcvE5Tm8ibhfIYLmnyM/?=
 =?us-ascii?Q?zb5AD8mg5rRHBdsX8TtGB7SHjvE002KjCaA06+DmFQR6jodFq5+FljH8kzOR?=
 =?us-ascii?Q?a7Rhy2F+E6j68fGxGHQItJ5L2JCU3W4yW0horycgTG2JQZeFqgThod0frRCS?=
 =?us-ascii?Q?vC1UcmUEDltOZZxU/PBpE+eMnhMbM34GnnrjPiNg2hgEjlMMUs/ruCz/Q8Dv?=
 =?us-ascii?Q?t/9+CYPx3mGgQ74OTccnmUWuT0W474ornyLHdpe2AUN5KYoDouVFBjBAWTWe?=
 =?us-ascii?Q?7NFo6FcNo1UiT+n69ez8f7dXR15cDwbZ3Y9kk5X5BQ75Ogbk2G2nNVSKicRV?=
 =?us-ascii?Q?/vzVcrlPfxmHeksTfjEdleHvOvs+EhYsXNDGGJLSOEQGXB01YZTneFLtr3+e?=
 =?us-ascii?Q?HnPzpB1Y6upeAEDdfqw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:47:36.8001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcf85a5-61f0-47e4-1236-08de376c9164
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6086

Use a define to centralize the common scheduler data in the per-arch
linker scripts.  This is in preparation for marking it KEEP().

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/arm/xen.lds.S    | 5 +----
 xen/arch/ppc/xen.lds.S    | 5 +----
 xen/arch/riscv/xen.lds.S  | 5 +----
 xen/arch/x86/xen.lds.S    | 5 +----
 xen/include/xen/xen.lds.h | 6 ++++++
 5 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index db17ff1efa..2d5f1c516d 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -92,11 +92,8 @@ SECTIONS
   . = ALIGN(SMP_CACHE_BYTES);
   .data : {                    /* Data */
        *(.data.page_aligned)
-       . = ALIGN(8);
-       __start_schedulers_array = .;
-       *(.data.schedulers)
-       __end_schedulers_array = .;
 
+       SCHEDULER_ARRAY
        HYPFS_PARAM
 
        *(.data .data.*)
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 1de0b77fc6..d0f2ed43f1 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -83,11 +83,8 @@ SECTIONS
     . = ALIGN(PAGE_SIZE);
     DECL_SECTION(.data) {                    /* Data */
         *(.data.page_aligned)
-        . = ALIGN(8);
-        __start_schedulers_array = .;
-        *(.data.schedulers)
-        __end_schedulers_array = .;
 
+        SCHEDULER_ARRAY
         HYPFS_PARAM
 
         *(.data .data.*)
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index edcadff90b..45d2e053d0 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -78,11 +78,8 @@ SECTIONS
     . = ALIGN(PAGE_SIZE);
     .data : {                    /* Data */
         *(.data.page_aligned)
-        . = ALIGN(8);
-        __start_schedulers_array = .;
-        *(.data.schedulers)
-        __end_schedulers_array = .;
 
+        SCHEDULER_ARRAY
         HYPFS_PARAM
 
         *(.data .data.*)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 1ee08a3ea3..2aa41306ca 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -309,11 +309,8 @@ SECTIONS
   . = ALIGN(SMP_CACHE_BYTES);
   DECL_SECTION(.data.read_mostly) {
        *(.data.read_mostly)
-       . = ALIGN(8);
-       __start_schedulers_array = .;
-       *(.data.schedulers)
-       __end_schedulers_array = .;
 
+       SCHEDULER_ARRAY
        HYPFS_PARAM
   } PHDR(text)
 
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index f54fb2d152..2d66d618b3 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -173,6 +173,12 @@
        _edevice = .;        \
   } :text
 
+#define SCHEDULER_ARRAY              \
+       . = ALIGN(8);                 \
+       __start_schedulers_array = .; \
+       *(.data.schedulers)           \
+       __end_schedulers_array = .;
+
 #ifdef CONFIG_HYPFS
 #define HYPFS_PARAM              \
        . = ALIGN(POINTER_ALIGN); \
-- 
2.52.0


