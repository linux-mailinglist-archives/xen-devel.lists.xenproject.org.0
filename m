Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849F06139BE
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433024.685853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUI-0000OT-0s; Mon, 31 Oct 2022 15:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433024.685853; Mon, 31 Oct 2022 15:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUH-0000Lo-TU; Mon, 31 Oct 2022 15:14:05 +0000
Received: by outflank-mailman (input) for mailman id 433024;
 Mon, 31 Oct 2022 15:14:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUG-0008Dn-NY
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:04 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a74af888-592e-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 16:14:03 +0100 (CET)
Received: from BN9PR03CA0586.namprd03.prod.outlook.com (2603:10b6:408:10d::21)
 by CH0PR12MB5172.namprd12.prod.outlook.com (2603:10b6:610:bb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 15:14:00 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::4c) by BN9PR03CA0586.outlook.office365.com
 (2603:10b6:408:10d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16 via Frontend
 Transport; Mon, 31 Oct 2022 15:14:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:13:59 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:13:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 08:13:59 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:13:58 -0500
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
X-Inumbo-ID: a74af888-592e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coLUsn+FnEhbZRtmCf0D6FaqiVG1/orZMiO9xvSKBsTlYe5eS+ZUtO9OpnKbHVXbbPJ8fsSxbTxlbT9j9wIkc8QFdLebT5AWegv4WpnySvwIJrF0rUvT9QqwFR/fCkjxq9RZgDlQv9WRSgcbaSDX48lb/MJSCUWkZ74ugM5oYuP+QS7rJCgkiJnW6yxX6g1q4YwutxTGt0mIdvfU/pfNAvuwr1Ih4w5H6vkdNPm50JqTE940ljO6AEk3mUSEOaVAVftjUYZ0Bwf5TOGl3HjmoNOA5CKBN0QlZaPd6RMVlUk1KZaMk6LN1TGrCskrv6NbK5HcySU12fY9QBTiQ6ksCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adYAdT9Zx/p/A9R392/UHvgvSHlcP+ELYd9uABjHU/Q=;
 b=A1JOzk5lDpl9/YEY7z1weMjhCfTFxGhrxclfPxQyVLpisQZcs/3LiD8sj+FIpv1VQh7VlQWVWBCyXZFOwhiI+o+Y/tE+rZpjCAKgztz7xRGQTyQ/71TaWfs+YiPYYKDdJQtdCyW23K8JF5/rRtK1WszcIO6RSvtlEhQ8sbiTtobWwnS7a2gmC5px+IgWrUcVoiNVAC3xt82UOMQrU73p37D6J+q+qW1p9nLKrfnSCWxcPiDm8ZuEWdkcyR5UgZ+VPflaUS7NQZE8sc4sQ2FnJlmKDrNyyg+X/fJqEHBosfHX7pUEu56ghdc5U8UIqtib/k3kGOlakF+l7A3HzJd/fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adYAdT9Zx/p/A9R392/UHvgvSHlcP+ELYd9uABjHU/Q=;
 b=MgGSYfk1aPwHePdl0kfrdyBprBVkO8RO2NnRhZSPAuzxbASH918wPpT8opGy8K1fMl5oBSCWubqAwVidQlLJ6QDyr5FSj0F6k+RnzIl/T+4Hlt8NEK8xxwN9x0tUlFTtar6iCDd5ewRDz+6B1nD4lE9tdS7BnDjDvMQXAoN13bE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2 02/12] xen/Arm: GICv3: Move the macros to compute the affnity level to arm64/arm32
Date: Mon, 31 Oct 2022 15:13:16 +0000
Message-ID: <20221031151326.22634-3-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT062:EE_|CH0PR12MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: 3810ea97-d708-4244-f7e8-08dabb5289de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mXatm7IFJ5qHFisGsuFJLLhHFwnaecEWyikHz1EFVtOose/YQ72RjaCW4nM+CXOhz0x2w/ysgztZL7V9s+7aRFylKW8tW629Txl0TNYrZCeAdnVR6Fn7phNM8RP3zy+cgsk+r3BcNQCWkFGw6lgtwcShcJ1I7/OZIyo6dAad7cm35J2Tv5RqzZB+35sixVLXazLQky/ggucVQNJE611X4WikNAuJIlJi8v6U/95T0KtLWThaOEO57lYbHxxcqiyL3Am35nc7ZEo9ERZN0otK3ABC5kNFTi+q/QsWWt2zuPROgcmOdNrgtybS/7ZT7EXRiPEDr0oVCjCpPa9itYXAIyzZdte2/LA+y9W+M8V7zqdGpKDuR06saiCVlNFT7iT+V1hlRIfeoYdXxjJWd7rx1h2yznqoGxd/a+2nJvzjD5moPBf3GAFDjvFzR3izCRp1daIoJVYx7ztEMjduGH/2uFKSLqDmjfGNOQSHlsS7AiHkqu+RG4MwuIACbnvoureDt3TQsj6M2M0DaiVkTyU4qzoC2dOnVfUjJhXvSjFCr5f8MTD+WCSHWm7cyW4d0MDpsC0AH+qoKCgbYX1PWaDXu2Yg9F/jbBUQk8lwtImSRy+E/6rKri+iS/ftYtcVaCkoVciBu5i3Lx/hB+4/k6Jkp/H++6pkSD3P4g8z/huyEXrvYGLQ9g/jtR/xO44OkmD9/2Fula/H9/lrQDYs/PFvXNTM5nOZIsdN1AbWHfWtBgpToX1p27kX6OZYqA8sS4IbFEES38GnUiY90AE3iktmDlcerhtPFp0aBd+bOmRZqCxY1L2g0SBJ0bjBaugtYqibrnTH8dja9VtQ/LsB6JHzfhAHtTbodiSDYiZ9Ef6s87yEi7p4NMFPj8DtQuNfHjuZ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(36756003)(8936002)(6666004)(70586007)(4326008)(316002)(8676002)(966005)(36860700001)(70206006)(41300700001)(54906003)(6916009)(5660300002)(40480700001)(2906002)(81166007)(356005)(426003)(83380400001)(186003)(478600001)(40460700003)(1076003)(82740400003)(26005)(2616005)(336012)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:13:59.9900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3810ea97-d708-4244-f7e8-08dabb5289de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5172

Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
include/asm/cputype.h#L14 , for the macros specific for arm64.

Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
asm/cputype.h#L54  , for the macros specific for arm32.

MPIDR_LEVEL_SHIFT() differs between 64 and 32 bit.
For 64 bit :-

 aff_lev3          aff_lev2 aff_lev1 aff_lev0
|________|________|________|________|________|
40       32       24       16       8        0

For 32 bit :-

 aff_lev3 aff_lev2 aff_lev1 aff_lev0
|________|________|________|________|
32       24       16       8        0

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changes from :-
v1 - 1. Rearranged the macro defines so that the common code (between arm32
and arm64) is placed in "arm/include/asm/processor.h".

 xen/arch/arm/include/asm/arm32/processor.h | 5 +++++
 xen/arch/arm/include/asm/arm64/processor.h | 8 ++++++++
 xen/arch/arm/include/asm/processor.h       | 6 ------
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/processor.h b/xen/arch/arm/include/asm/arm32/processor.h
index 4e679f3273..82aa7f8d9d 100644
--- a/xen/arch/arm/include/asm/arm32/processor.h
+++ b/xen/arch/arm/include/asm/arm32/processor.h
@@ -56,6 +56,11 @@ struct cpu_user_regs
     uint32_t pad1; /* Doubleword-align the user half of the frame */
 };
 
+/*
+ * Macros to extract affinity level. Picked from kernel
+ */
+#define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * (level))
+
 #endif
 
 #endif /* __ASM_ARM_ARM32_PROCESSOR_H */
diff --git a/xen/arch/arm/include/asm/arm64/processor.h b/xen/arch/arm/include/asm/arm64/processor.h
index c749f80ad9..295483a9dd 100644
--- a/xen/arch/arm/include/asm/arm64/processor.h
+++ b/xen/arch/arm/include/asm/arm64/processor.h
@@ -84,6 +84,14 @@ struct cpu_user_regs
     uint64_t sp_el1, elr_el1;
 };
 
+/*
+ * Macros to extract affinity level. picked from kernel
+ */
+#define MPIDR_LEVEL_BITS_SHIFT  3
+
+#define MPIDR_LEVEL_SHIFT(level) \
+         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
+
 #undef __DECL_REG
 
 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 1dd81d7d52..ecfb62bbbe 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -122,13 +122,7 @@
 /*
  * Macros to extract affinity level. picked from kernel
  */
-
-#define MPIDR_LEVEL_BITS_SHIFT  3
 #define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
-
-#define MPIDR_LEVEL_SHIFT(level) \
-         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
-
 #define MPIDR_AFFINITY_LEVEL(mpidr, level) \
          (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
 
-- 
2.17.1


