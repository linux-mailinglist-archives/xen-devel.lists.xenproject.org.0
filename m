Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F39A42F8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 17:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822039.1236042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1pGo-0002Si-Eq; Fri, 18 Oct 2024 15:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822039.1236042; Fri, 18 Oct 2024 15:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1pGo-0002Qp-Bi; Fri, 18 Oct 2024 15:52:06 +0000
Received: by outflank-mailman (input) for mailman id 822039;
 Fri, 18 Oct 2024 15:52:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/a1N=RO=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t1pGm-0002Qh-G5
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 15:52:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2413::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e97ba24e-8d68-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 17:52:01 +0200 (CEST)
Received: from DS7PR06CA0047.namprd06.prod.outlook.com (2603:10b6:8:54::27) by
 DM6PR12MB4140.namprd12.prod.outlook.com (2603:10b6:5:221::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.24; Fri, 18 Oct 2024 15:51:55 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::2a) by DS7PR06CA0047.outlook.office365.com
 (2603:10b6:8:54::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23 via Frontend
 Transport; Fri, 18 Oct 2024 15:51:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 15:51:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 10:51:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 10:51:52 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 18 Oct 2024 10:51:52 -0500
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
X-Inumbo-ID: e97ba24e-8d68-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmGg/bz/f6CKetYS2hTpT2b6o+ijqNGHH89bD/XLQwbDLCJDc2JeKBz4PGfRboBsm2GLAQGyIjPom/bfS/Ti1/XzInt5PG4jbQBv5Eh7KXLWq+1ZR/MyWOmJkAiwxjdSSrTijJQqtS62ykA175GGlQ3055cOgFl9wQT3whfNqahXS34rdQ4tAWcEFvvZycNfP4BHui0r/pEbAzKqMDUVCoU7YOIylCrS9fAx02X06M0TjAFDQxGd3bvAxDeM0XjhGJY5hE8ziLmhnj4QFzM0Twiygse/VUFmLybm9b48UC7By/f+00Nr6BTXHfWuuRvkHfFhindIJB1nUJUtUCy8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDQCIMfLR/FEIw0hQ9HyHhSu1V2kRxDHrtTYGAA4uws=;
 b=oU8XSmym2o1cAytx5u7ERzyzoGPOq24rqZwtjzgB/uh/Mx4N4PLu423Faga/9/ooY1mTR9L6gqgPd6O9pqQgtdYyv9JuM52xfAcTgu8W04nUufiJLlC13OKUehZMrEfEOIzcEyWWcL5Ieh0tPcwnUlr0fcFzIHvB0RWFc0PbWHHcZsE/nCmuAdsUeBJvhi0nOzlKj26/k37nPovNTjUTpaPb+gCy6sXcyi+5RpOnU1+P0/hBtCUKIObIQrIChJAvh0JsT37jwl4+SVUOtNwa8zFtFHorzgKH4/jm3LLDn+cZt+tA4sCYk8I5d2bvF+8V6VG/K92iwOrYSLhzsgsE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDQCIMfLR/FEIw0hQ9HyHhSu1V2kRxDHrtTYGAA4uws=;
 b=tgdbIajgOSqIam3i92m4JOiWK5sNTfjtuFLm6Koz1ccAUWIvLGzIPoPv4r1obq1Ukjo/S+qUD+MwNcliFs55nTJWVDxw8YgdZ4qC6mw4sFP6Lq0HbnbA7WNqQW2zzOEmuh9tctBd6jSEaww6yy9thT96Of9acjAoE+XVKjjCqdA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Munakata Hisao <hisao.munakata.vt@renesas.com>
Subject: [PATCH] docs: fusa: Add dom0less domain configuration requirements
Date: Fri, 18 Oct 2024 16:51:44 +0100
Message-ID: <20241018155144.3433395-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|DM6PR12MB4140:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c57ee7-38db-4585-2e68-08dcef8ccac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YpPFmH+/Gmq/oR0Gl2iCjom5K3YYOL6/fi11WGFGNCJO6ONIwJ4MCrEj3W9J?=
 =?us-ascii?Q?jG2zIgHu/E5mrjXlS6l6d1maSwTjb14E865fXwdIrLxBZMZ0/HT57P0HqAKH?=
 =?us-ascii?Q?37QkByRLMhfRVWHf/ykQfObqEN/PJKsAajzNj2Ya6SOUpIGwamjL8ySRNaQb?=
 =?us-ascii?Q?RFBGLXHr0QtB16m58LdUOvu7bbH8nSdTnDs+tvAvRTIN31GdP5HwpSVwX5lY?=
 =?us-ascii?Q?akC7QDm0sBAh5aEgLGL/PWZ5L3A4rfXsVBOLZjBhrobKwxvETugFg/IDiafU?=
 =?us-ascii?Q?MLyNNuS+zJVf20IC9AIp2fDFKM3Lm+B8RUxMJZTAd6EeYIaokhxU4N3ENrtt?=
 =?us-ascii?Q?tDdY1sn8VmTd6uXyIp0SNZC/66Cj+bn8/VUOKfjQD+zxtAjkX+yZCXUmJRAg?=
 =?us-ascii?Q?gSe8fu+Tp30gfQ3PfbraGQOZAaB1pRAuFCUYeNrrebe4LevSAhpWOrmz14xw?=
 =?us-ascii?Q?L7ks/8pKkrYCnAyNEreA2sxSq+m5Y4AwgZ9btXTsLKgVRbOpMP1lDf+2VENe?=
 =?us-ascii?Q?2UAfrjHYvDQ2SnjMA0fgJU8r8CBFkPc2HsoCTyS3+wDOkN9PhxHt1VZ5rQWq?=
 =?us-ascii?Q?iALbCVHg0Xa9B4cM10/iy9Qb0uNuALM+oD0r/LhvQg9WGPkOfh1E9POD3WAC?=
 =?us-ascii?Q?jW+0owtWZjNnaN5NlqFm8cawewbN8yGMh2sOo3WNLRf8y53RWo3VneMfLY1W?=
 =?us-ascii?Q?fq+N4gSp6FpxSWQ3Ol12c4Kl58WYCLnajmugdqRBT2IMJqFOgrG62/Ixy3zC?=
 =?us-ascii?Q?J+65TFfmJtVBkdg3vurxFfQLr6kI1qevFV/yNH8e0HNdPhqBPX3ObcP5qbQc?=
 =?us-ascii?Q?iqrAM5ZoSSsrsUidpke66uMu7Tj3BcLkKUDrmrkc/W+EmX0myNERNKD+ZBWc?=
 =?us-ascii?Q?FidsxKbvtRog6tgLwlU11uo5EXA/yCOvAmp5/5wRJx0zznolspt2C2lvnWwq?=
 =?us-ascii?Q?pSiQXy0cnALRdGQ1gfmAMoMdT3FDIgLI+F/kE+5VAO2D2pKqaJ5F9czrDp4P?=
 =?us-ascii?Q?h1xqry3RYdnkJKt+8Txx1isIayVLKAXafUsVY4WVgTE00tNVEx5FboeX05gD?=
 =?us-ascii?Q?pug9JG6LmFwJG6D8NpB6rj7xaYIuoLEGwycg044vFYUNZglQs7UV+H7tLQKc?=
 =?us-ascii?Q?Ocx+PDpu2F4DoaUROBrhkaoim/2B6fIKXnKWOorgn/sCh3wPu1vam1jQMvM8?=
 =?us-ascii?Q?pKSwauyEsyCpMbH0+Q+n2RCfU4iEmul2B6Xb+fQv7UHuPGFZlkuSX/+OIHq5?=
 =?us-ascii?Q?jqOPh37felNkUAqJFs1ANEAwEfbdvvV4uno96+9WjlR45PgAsy9/skdXLp+/?=
 =?us-ascii?Q?5fV28RS86Sbm6LF9HDN9Y8f5Xf+QdBe52ZMuyjBD609GOkNGyFJZZZEs+JMo?=
 =?us-ascii?Q?tlX2n3Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 15:51:55.5054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c57ee7-38db-4585-2e68-08dcef8ccac5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4140

From: Michal Orzel <michal.orzel@amd.com>

Add requirements for dom0less domain creation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 .../arm64/dom0less_domain_config.rst          | 267 ++++++++++++++++++
 docs/fusa/reqs/market-reqs/reqs.rst           |  15 +
 docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  20 ++
 3 files changed, 302 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst b/docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst
new file mode 100644
index 0000000000..17b5f8962c
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst
@@ -0,0 +1,267 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Dom0less Domain configuration requirements
+==========================================
+
+The following are the requirements related to dom0less domain configuration for
+Arm64 domains.
+
+Specify Arm64 Linux kernel image
+----------------------------------
+
+`XenSwdgn~arm64_specify_kernel_linux_image~1`
+
+Description:
+Xen shall create a domain with a Arm64 Linux kernel image.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify Arm64 Gzip Linux kernel image
+---------------------------------------
+
+`XenSwdgn~arm64_specify_kernel_gzip_image~1`
+
+Description:
+Xen shall create a domain with a Arm64 Gzip compressed Linux kernel image.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify kernel with uImage header
+---------------------------------
+
+`XenSwdgn~arm64_specify_kernel_uimage~1`
+
+Description:
+Xen shall create a domain with a kernel containing uImage header.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify Gzip kernel with uImage header
+--------------------------------------
+
+`XenSwdgn~arm64_specify_gzip_kernel_uimage~1`
+
+Description:
+Xen shall create a domain with a Gzip compressed kernel containing uImage
+header.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify passthrough device tree
+-------------------------------
+
+`XenSwdgn~arm64_specify_passthrough_dt~1`
+
+Description:
+Xen shall support direct assignment of devices to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify kernel command line arguments
+-------------------------------------
+
+`XenSwdgn~arm64_specify_kernel_cmd_line_args~1`
+
+Description:
+Xen shall pass kernel command line arguments to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify initial ramdisk
+-----------------------
+
+`XenSwdgn~arm64_specify_initial_ramdisk~1`
+
+Description:
+Xen shall provide initial ramdisk to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify amount of memory
+------------------------
+
+`XenSwdgn~arm64_specify_memory~1`
+
+Description:
+Xen shall create a domain with specified amount of memory.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Assign a single vCPU
+--------------------
+
+`XenSwdgn~arm64_assign_single_vcpu~1`
+
+Description:
+Xen shall assign a single vCPU to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Assign multiple vCPUs
+---------------------
+
+`XenSwdgn~arm64_assign_multiple_vcpus~1`
+
+Description:
+Xen shall assign multiple vCPUs to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Assign vCPUs from CPU pool
+--------------------------
+
+`XenSwdgn~arm64_assign_vcpus_cpu_pool~1`
+
+Description:
+Xen shall assign vCPUs to a domain from a CPU pool.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify CPU pool scheduler
+--------------------------
+
+`XenSwdgn~arm64_specify_cpu_pool_scheduler~1`
+
+Description:
+Xen shall assign a CPU pool scheduler to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Assign virtual UART
+-------------------
+
+`XenSwdgn~arm64_assign_virtual_uart~1`
+
+Description:
+Xen shall assign a virtual UART to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify number of SPIs
+----------------------
+
+`XenSwdgn~arm64_specify_num_spis~1`
+
+Description:
+Xen shall allocate a specified number of shared peripheral interrupts for a
+domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify grant table version for a domain
+----------------------------------------
+
+`XenSwdgn~arm64_specify_grant_table_version~1`
+
+Description:
+Xen shall create a domain with a specified version of grant table structure
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify number of grant table frames for a domain
+-------------------------------------------------
+
+`XenSwdgn~arm64_specify_num_grant_table_frames~1`
+
+Description:
+Xen shall create a domain with a specified number of grant table frames.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+Specify number of grant maptrack frames for a domain
+----------------------------------------------------
+
+`XenSwdgn~arm64_specify_num_grant_maptrack_frames~1`
+
+Description:
+Xen shall create a domain with a specified number of grant maptrack frames.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~static_domains_configuration~1`
+
+| [1] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/booting.txt
+| [2] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/cpupools.txt
diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
index f456788d96..ca020f9a33 100644
--- a/docs/fusa/reqs/market-reqs/reqs.rst
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -47,3 +47,18 @@ Comments:
 
 Needs:
  - XenProd
+
+Static VM definition
+--------------------
+
+`XenMkt~static_vm_definition~1`
+
+Description:
+Xen shall support specifying resources for a domain.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
\ No newline at end of file
diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
index db91c47a02..0453dbb862 100644
--- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
+++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
@@ -40,3 +40,23 @@ Covers:
 
 Needs:
  - XenSwdgn
+
+Configure static domains
+------------------------
+
+`XenProd~static_domains_configuration~1`
+
+Description:
+Xen shall support specifying the resources required for a domain.
+
+Rationale:
+
+Comments:
+
+Rationale:
+
+Covers:
+ - `XenMkt~static_vm_definition~1`
+
+Needs:
+ - XenSwdgn
\ No newline at end of file
-- 
2.25.1


