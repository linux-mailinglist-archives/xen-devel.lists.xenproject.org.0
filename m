Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EEE607AC6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427738.677106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0J-0000vK-Fh; Fri, 21 Oct 2022 15:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427738.677106; Fri, 21 Oct 2022 15:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0J-0000rA-Ck; Fri, 21 Oct 2022 15:32:11 +0000
Received: by outflank-mailman (input) for mailman id 427738;
 Fri, 21 Oct 2022 15:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0H-0000AU-Rs
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:09 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85ce2734-5155-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 17:32:08 +0200 (CEST)
Received: from BN9PR03CA0182.namprd03.prod.outlook.com (2603:10b6:408:f9::7)
 by CH3PR12MB7497.namprd12.prod.outlook.com (2603:10b6:610:153::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 15:32:05 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::4a) by BN9PR03CA0182.outlook.office365.com
 (2603:10b6:408:f9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 15:32:05 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:32:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 08:32:01 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:31:59 -0500
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
X-Inumbo-ID: 85ce2734-5155-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAPcqhL4ZQ5vW8bZHmPTeXLgEl6MsnCldQZYVvfmqu07YUu5xrMVQEu5GbW4Q8A6lG1EWlKorgaSeWcsJppin5Y7VjHr2gd4JFXRCDjABwETZVl6h2tYBD8DuU2wp61nDuXAtN96jNzk75YTgTkvQACwnArd8z3O/g+TYeQiZlyIOvZbIMR1UXUQeqHtUQTnONZA0hah2x9eJP5ZM8FCwJXBJW3tgxYEhzcbmZHk4Tr+r/pqfL80t+/S/AWS+dEl6AJy3QY6USRsao8Gp+u41Ty7ITUUyxr5vB1xt7pRzpfIhz+8pKgaCFoUhyKqy71Qy0WtvYdNnGgn3/Bz71YUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IcGxl8RRMIxH3os3XBZf6ggKOB0EWQZFW1lSNxYXBw=;
 b=g/BVc3AMrCTigM7m701cngmO8GDhMsv4tyvzH9bAfAV33muxvwhwDLuzy6UxaIekP1MVL05696KkoxoPLwpmzcScTEKxvuXlQXKc3EvtGjcfru/5e7scFBnCPprcdECqjiPVlqpTcVjRtUXcwWBsnqYem12Rs2HudpnwbIjHM/wF59cnhJRt2+1a3mSXqWbibAXD9LX35J3rFmh86JBQUfDbM8yfuCWechYykhko0842rzlssoQzF6JKoe6SZBVum6fFo1c05CA7Cc2kZRbn5T36Emwy4Hscj38ZgRPFsS0TG6Le43z9i+HF8N8ejN2mJ1JiemJo6iu+fht3r9A/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IcGxl8RRMIxH3os3XBZf6ggKOB0EWQZFW1lSNxYXBw=;
 b=eFNjPX7dqWpnRAcPMPFN8zsTkEIQ6xrCsIcJXgdtg8crIYtdMCOull1JIptSh0QGy9aFejeFcosSrQUW/wsqnD1aS8czyr37wuqjBH5wVQdorf+UwzFmA4kg1/1f6+qjyl8ZtlFFCyFL1AOiSnH5YEedpuayJUfcU7cfb2aFddM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [RFC PATCH v1 02/12] Arm: GICv3: Move the macros to compute the affnity level to arm64/arm32
Date: Fri, 21 Oct 2022 16:31:18 +0100
Message-ID: <20221021153128.44226-3-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT056:EE_|CH3PR12MB7497:EE_
X-MS-Office365-Filtering-Correlation-Id: 306a0c7a-cd74-45fc-b6b6-08dab379687f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xRAKep4aX+Wez7T1xQTkOI4t+8TrMrwbL0KKC70pc+keeJRcflLu41uNaDCeKMMzyopjn4HLDXVi5q92Ep53klYwibnGxap5D9+c8ifxq7BeYKkxuP/yDLP+eTJX1cmDBTArwsBLmX2YUgy5Uhi27vYLtjBx2rb/VvUEx1jLBZWGKeOQ8cLDfSBmuGt1EpIqIcF+hSWhPBAUduA5lMasrZiN+GyzEVvkTWsQYFy/Nipbor7QPX57FbnTH/0X0/XwyzYx4y7kAgw5UbQR+WsCp6h5+XxKjD66PhrV5vvXT+gy+ws22vrWZG+Vpwq6UOh9SThZD1CZVQvbWGELTe/L/ftN662nZaH0FTdk46dnRDFfxeV++hp0egAXFRfRfVbWpZJJIXjhNk3aXgj4mYN8erCAs0J3vjmWp/DsGMkBZ/OW9D9I7jXZHzRZMQEYm+8fO0UkQYvKUWfHKuA6y2oxaQld7mJ8ssGFwqBTAZewGYM8OgjJ4d24y6PZDc6SknXV8h98PgHIaRd18vPUB6e9PcRPx1DgPJBXMLSYQ04ynYqCNKL5ZFtVhanTWSAnfaXUO5KqUFU9j7uTgtAc791N1ogEqDXO2oyvt48iBGRJ/NyMpUU6Ukk/TpoLFi2adeNz65MRbnAHg8hpRN9HrfNllGwYWvHUL+Z8ljt3kP3+tPvfHk3q7uAuBkm6XrF0Gv5CtdneI3nx3Xi3q6bZg8Eq2hxBSJt/IdtixXxNbwpeQTzehvnMsldiBjF9maNvCD0fDZ2kdi/G3lSmExjkwLZS5t1VqUGZ+uRLm7yym5qbjkUs/zy3Es08z819zzScuLbdXWN7SsmOTqMvOPKEa/PYDUHTxayCI72H99/NCBki6rIyxBdlr9DqjfGWO/YnQpM4
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(316002)(6916009)(41300700001)(54906003)(186003)(8936002)(47076005)(426003)(40480700001)(2616005)(26005)(6666004)(2906002)(70586007)(336012)(1076003)(5660300002)(70206006)(83380400001)(36756003)(40460700003)(4326008)(8676002)(478600001)(82310400005)(81166007)(356005)(82740400003)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:05.1492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 306a0c7a-cd74-45fc-b6b6-08dab379687f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7497

Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
include/asm/cputype.h#L14 , these macros are specific for arm64.

When one computes MPIDR_LEVEL_SHIFT(3), it crosses the width of a 32
bit register.

Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
asm/cputype.h#L54  , these macros are specific for arm32.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/include/asm/arm32/processor.h | 10 ++++++++++
 xen/arch/arm/include/asm/arm64/processor.h | 13 +++++++++++++
 xen/arch/arm/include/asm/processor.h       | 14 --------------
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/processor.h b/xen/arch/arm/include/asm/arm32/processor.h
index 4e679f3273..3e03ce78dc 100644
--- a/xen/arch/arm/include/asm/arm32/processor.h
+++ b/xen/arch/arm/include/asm/arm32/processor.h
@@ -56,6 +56,16 @@ struct cpu_user_regs
     uint32_t pad1; /* Doubleword-align the user half of the frame */
 };
 
+/*
+ * Macros to extract affinity level. Picked from kernel
+ */
+
+#define MPIDR_LEVEL_MASK ((1 << MPIDR_LEVEL_BITS) - 1)
+#define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * level)
+
+#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
+    ((mpidr >> (MPIDR_LEVEL_BITS * level)) & MPIDR_LEVEL_MASK)
+
 #endif
 
 #endif /* __ASM_ARM_ARM32_PROCESSOR_H */
diff --git a/xen/arch/arm/include/asm/arm64/processor.h b/xen/arch/arm/include/asm/arm64/processor.h
index c749f80ad9..c026334eec 100644
--- a/xen/arch/arm/include/asm/arm64/processor.h
+++ b/xen/arch/arm/include/asm/arm64/processor.h
@@ -84,6 +84,19 @@ struct cpu_user_regs
     uint64_t sp_el1, elr_el1;
 };
 
+/*
+ * Macros to extract affinity level. picked from kernel
+ */
+
+#define MPIDR_LEVEL_BITS_SHIFT  3
+#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
+
+#define MPIDR_LEVEL_SHIFT(level) \
+         (((1 << level) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
+
+#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
+         ((mpidr >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
+
 #undef __DECL_REG
 
 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 1dd81d7d52..7d90c3b5f2 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -118,20 +118,6 @@
 #define MPIDR_INVALID       (~MPIDR_HWID_MASK)
 #define MPIDR_LEVEL_BITS    (8)
 
-
-/*
- * Macros to extract affinity level. picked from kernel
- */
-
-#define MPIDR_LEVEL_BITS_SHIFT  3
-#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
-
-#define MPIDR_LEVEL_SHIFT(level) \
-         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
-
-#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
-         (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
-
 #define AFFINITY_MASK(level)    ~((_AC(0x1,UL) << MPIDR_LEVEL_SHIFT(level)) - 1)
 
 /* TTBCR Translation Table Base Control Register */
-- 
2.17.1


