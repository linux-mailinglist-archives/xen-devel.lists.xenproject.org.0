Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD1464E1D7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:33:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463772.722101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyt-0001D6-Ls; Thu, 15 Dec 2022 19:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463772.722101; Thu, 15 Dec 2022 19:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyt-00016m-F7; Thu, 15 Dec 2022 19:33:23 +0000
Received: by outflank-mailman (input) for mailman id 463772;
 Thu, 15 Dec 2022 19:33:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWk7=4N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p5tyr-0006KU-Tw
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:33:22 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5433116f-7caf-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 20:33:20 +0100 (CET)
Received: from DM6PR13CA0070.namprd13.prod.outlook.com (2603:10b6:5:134::47)
 by MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 19:33:17 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::e2) by DM6PR13CA0070.outlook.office365.com
 (2603:10b6:5:134::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.14 via Frontend
 Transport; Thu, 15 Dec 2022 19:33:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 19:33:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:33:16 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:33:15 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 13:33:14 -0600
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
X-Inumbo-ID: 5433116f-7caf-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VO2Jz4urcfcPoETJvbY7uxfQc7XoTDgHMGVaN6fvrWIEjE//iVFsj2BGtoup6YpHFtDOmuF8g6Zy47ffmaRJnUqP8BeEx3OGQaA0msjVmXFJmPJfow7ZOalhKtpMAQVXlFc9IO2XsQuwpATzkBBh7SotRYOfzVwCuv7PM1tpNmUJ2am2//3PNfi0nzbio95FaK2CT9hHboKIxGUg1U31bkS1F7yIjHrghhv9R4lo8B+l0S6MUUVHcJR5QqbqT+vaqDs5Ol3mx2b9SP9gCyph+sDQxSdk/4E9HyqQSL3URxKs+GtB1m92RJXrFhrph/bAC5zIu4x6BIamXunj0ASc6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3BqTHje9hBwSDwZvyLDpmFskXeeCNNsKZktZznSD4Y=;
 b=F1WVlpnaJuODN/YZZK/ix9R5mEFShw5NZN21h5rSxHNsEbh77rEhjG6Pu7NAl2BSqzzSLrEcVoT1rigKdtHg9fFIng+ZuQ3tu3t7Vn6MxpusxoZ6HxwKR5cdH5fw3xdd9d9lA+kDwI1ZC7TpX9OPg4E4vKb3rUOH0enO7WnlyAZ5XIaZdaBDKIVN+zKl/S+uVcoG9yDqfnj/utRw+jH47uAaXAz4V6ld6GRQC/ji8k2YxknAZnISmWeuAUBbgvcl6dUCo5zI5DWB4RYsllf6qN4vdEzlRNqqh5jolZG/8059yqgG0H+W5LQXePP6EYrFPwokKBhSbdD3UIbDFHDAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3BqTHje9hBwSDwZvyLDpmFskXeeCNNsKZktZznSD4Y=;
 b=49L99oWmO4asKf1o374DBqdOnvqDVT1Tvw5Z9ZQdZS9LpL5OPF9BqeEMz+UxIAx3ERUQIQivAwUC1xNA7VO1V2herdvW9UTtNS1pbHmrTe470nDwXtCq2hGlOE0QAcg2zTtNDGaYoOccyomVbCC3jIosuR0jxVVVmvqWB2ghSFE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1 9/9] xen/arm: Introduce ARM_PA_32 to support 32 bit physical address
Date: Thu, 15 Dec 2022 19:32:45 +0000
Message-ID: <20221215193245.48314-10-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|MN2PR12MB4375:EE_
X-MS-Office365-Filtering-Correlation-Id: def075e1-9b99-4987-1f62-08daded3372e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fs6f+1wUO93V5W1aAvxJBPIvS0u+5XT6xQE57/Z7Iya8/T46mETqO09cXWusAI6x2w7/Uirgy8x5WHJWZ+230IPxOIMcAvkmatQErzpXlgZxL+d/AFFCtLfLGApGb4DW2cEqTAksMo5Cjw345io7V3g21Xk+EzyT0ZrWjPT7ustE2y0IF5Ag3UD3oAg2rgj2qDDrAAVQF5m0n3g5MrDTRu2K5+UCUklP6LB6UYPU+s55xoQycobIf69wyQ1XVQBvp4X0ADJyxpFXbnPwTsTxu/x/9MGkKU8MRXzhgJn2l6w2bbxjN7U4BlvKYXVbDit0yK7BdAgzVPyXITfFGjNk8pcWREINxJ2wCcw3v1/g47M/htJ+jEjGYYLTg1nwYZ+lIAnpfo9hVmHe6yRolAo3Cn5KFdpSMH6HIQ/4oi4HqiamEgy34bTjdou4/PYaETN9J55L0xWwdMO58qiEORP2EuHqi4Bk0Et7XDiaYJ5O635EB3ePMreowiOqTwumvSnLdGI61vEtg1yteqm+WkCB9QTG8qDhPHp4+XoBN2/O6znC7kEvFhO5r1tndaSCsvJYT4EGvLIExgV4d8dkJ6wcoObshHDmUDPYg4U6FrMoLfqS2tpf++KtyeqVa8WIvDtAEkmfH01KLhp+vopcJoFdYqK/PoC6cYCy9CbiHMZ2QiZLQ/VmBV1KEfzAGSPVpN4evc8DnqvMA3Bxa2MYZaWERRausFdN/XfH/BZ0ezsCbto=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(103116003)(356005)(2906002)(82740400003)(81166007)(40480700001)(82310400005)(8936002)(5660300002)(41300700001)(6916009)(40460700003)(47076005)(36860700001)(426003)(83380400001)(86362001)(478600001)(54906003)(4326008)(6666004)(1076003)(316002)(70586007)(2616005)(8676002)(26005)(186003)(336012)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 19:33:17.0800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: def075e1-9b99-4987-1f62-08daded3372e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375

We have introduced a new config option to support 32 bit physical address.
By default, it is disabled.
ARM_PA_32 cannot be enabled on ARM_64 as the memory management unit works
on 48bit physical addresses.
On ARM_32, it can be used on systems where large page address extension is
not supported.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/Kconfig                 | 9 +++++++++
 xen/arch/arm/include/asm/page-bits.h | 2 ++
 xen/arch/arm/include/asm/types.h     | 7 +++++++
 3 files changed, 18 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..aeb0f7252e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -39,6 +39,15 @@ config ACPI
 config ARM_EFI
 	bool
 
+config ARM_PA_32
+	bool "32 bit Physical Address"
+	depends on ARM_32
+	default n
+	---help---
+
+	  Support 32 bit physical addresses.
+	  If unsure, say N
+
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
diff --git a/xen/arch/arm/include/asm/page-bits.h b/xen/arch/arm/include/asm/page-bits.h
index 5d6477e599..8f4dcebcfd 100644
--- a/xen/arch/arm/include/asm/page-bits.h
+++ b/xen/arch/arm/include/asm/page-bits.h
@@ -5,6 +5,8 @@
 
 #ifdef CONFIG_ARM_64
 #define PADDR_BITS              48
+#elif CONFIG_ARM_PA_32
+#define PADDR_BITS              32
 #else
 #define PADDR_BITS              40
 #endif
diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
index 083acbd151..f9595b9098 100644
--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -37,9 +37,16 @@ typedef signed long long s64;
 typedef unsigned long long u64;
 typedef u32 vaddr_t;
 #define PRIvaddr PRIx32
+#if defined(CONFIG_ARM_PA_32)
+typedef u32 paddr_t;
+#define INVALID_PADDR (~0UL)
+#define PADDR_SHIFT BITS_PER_LONG
+#define PRIpaddr PRIx32
+#else
 typedef u64 paddr_t;
 #define INVALID_PADDR (~0ULL)
 #define PRIpaddr "016llx"
+#endif
 typedef u32 register_t;
 #define PRIregister "08x"
 #elif defined (CONFIG_ARM_64)
-- 
2.17.1


