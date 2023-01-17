Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089C366E575
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479711.743756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHqD6-0007fr-9E; Tue, 17 Jan 2023 17:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479711.743756; Tue, 17 Jan 2023 17:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHqD6-0007di-6P; Tue, 17 Jan 2023 17:57:24 +0000
Received: by outflank-mailman (input) for mailman id 479711;
 Tue, 17 Jan 2023 17:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8eG=5O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pHq1W-0000oY-Tu
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:45:27 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8235567-968e-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 18:45:24 +0100 (CET)
Received: from BL1PR13CA0293.namprd13.prod.outlook.com (2603:10b6:208:2bc::28)
 by BL1PR12MB5192.namprd12.prod.outlook.com (2603:10b6:208:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 17:45:21 +0000
Received: from BL02EPF000108EA.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::6e) by BL1PR13CA0293.outlook.office365.com
 (2603:10b6:208:2bc::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Tue, 17 Jan 2023 17:45:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108EA.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Tue, 17 Jan 2023 17:45:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:20 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 11:45:19 -0600
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
X-Inumbo-ID: b8235567-968e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKX77pi5LhWWRRzUe8sPU9yYuuPG/bH5pkOAhg0ccaB0JRBzbH1dud0UiQ7M99W+wAjSnT9riXDwenhECcOai+QeLuZcimALY84XpMLhvEdVeKvncJPdsuwX1MeybWmLypFwpGDu6rXXbK9Ch1ALdFchv9dnM/f5eq3ZAi07kzgCKn4Dnfg6TkLw1L77Gsh4CTPbDefVVfUzUdprvhTAepLw06HyAgcgwWPd1OurJuWKVqkQBtOZMJOoeokSlSsg2IANRMjtoSM+WA2Je5Q4HtTIrF2KFHgENkUv6fjHSJEt+owzMT2vPWFEM0cXwHJeg6dIg5AC7EA1HBnrm+CJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUKkPNjs40zSymEmFxi8ADEbz2aWFS1vKYbBMcQpOKo=;
 b=efteD46leLWOXOsHEaPnwIF8mFD9+QdIkLMxKuZFOVc1jAvK4lytVYUuxLYoQ9TMRqvOo+qGKIGDXPYeZo3F9hO1eZ09Mkg9DwPi13/B5BC2NxjsYBTI+gTHhJYD8GkX9mLa3D9OeivWq/8Q5OSByGjEbhR7gBFg2gOvgHi47eXG3Md8zjT6dcpznKQ/iU6s1LIfz01lMxFhGBSQ1y4FV5s7afifAgdqsSUIqo/uCxEkVSjl0fKtlJ4yN8xWGgxLWlYO6vx6FckRRTP0e8ukIjZF197k91OS01rOdCg1g53WbJbocFfrrF503T2e3gTpinEjh1aoFEirpQyNN2wlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUKkPNjs40zSymEmFxi8ADEbz2aWFS1vKYbBMcQpOKo=;
 b=CaiMpMoM/FndhFVnbQSjERMc8hrBAiWkzp8Drs4KUv0EfrbWDSQEDRiouoXtIxLY5bZO4P0W4B6LiNsQN/xbU6ppP8ZO/8V5pTyO4c0y6rEOEo3/0uhotdJKz4uWADEwBPFoa58Ipq/6S5b8fCzdR/SooYlriUXqYXhupURsEPU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v2 10/11] xen/arm: Restrict zeroeth_table_offset for ARM_64
Date: Tue, 17 Jan 2023 17:43:57 +0000
Message-ID: <20230117174358.15344-11-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EA:EE_|BL1PR12MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: 912192a8-fd13-4b16-0a2b-08daf8b29b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NrnV0HM/yiIGDqCOfLcrWsMZDJpcA5DkX+OvzhersBZx/ZKarMkHPr6M/EdxLRrqDsYvv+npmG5+08I9sCdEtEcZ7Wgsaoj1ftNXdW5sM6D2ykUOQosnI3hVj4ZcaSIQIPFjiKCnfW7Ao6Eo3MW1ND+KeJjNTEw3HEmGRxK33oGzkBxcx8aLzcOQjnsmj5YZHLp2f2VrtYqSEdhO2jDvS/32c0xhuIOBzCGniTp+ucUMuf3/dAfEsslunSuK9W3BZFXzYvYz+eJv8JDIyXyzTDqi2vS7WJVSNteOxHg92Cv9Vx5Gn9Ra2gy+ZwK6BkEpLzZS+snc/RH3ciL82gIYOOCM0dpbGmXQiWVcsuii9HvS9ZdSzSEJrJ+tU5Td3u/BNWGIlHAG8Dtha8bbfbvR8RDRS8oXmNjsfg19yC8mMlauL4wpCqKlRIejORplrYsUOvRBzd2kyKvxiYDQv1h99u4p2c2C6yFSAND/IrxFG+YGLOKusbn0DCCRlXMz2qKMezPC/2Ae/kXxlotjuVu/X7jT+dc64v2p3Ymq2F/T3bvkEFuSnb8I3qjck0SSIRE/+1woxZRbaZY4hP6fDO6+0E4ab7nAjsbDyBRMuMM+NSEl9rDoJ3AIYzN/GciOsMll8Lpdia5cCIjVmY1WuKoHd5UvPIbLmguwqclk6lk7WDRuxFcco5yfEIixeV/c+eNpV3TvRqJ7NoUb+bfBCykPJ2QwZdl8FHgv4r+/X4f/3HE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(86362001)(356005)(8936002)(6916009)(8676002)(70206006)(70586007)(5660300002)(2906002)(4326008)(36860700001)(82740400003)(81166007)(83380400001)(103116003)(478600001)(40460700003)(6666004)(54906003)(316002)(40480700001)(82310400005)(41300700001)(47076005)(336012)(426003)(1076003)(2616005)(26005)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:45:21.1746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 912192a8-fd13-4b16-0a2b-08daf8b29b29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000108EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5192

zeroeth_table_offset is not accessed by ARM_32.
Also, when 32 bit physical addresses are used (ie ARM_PA_32=y), this
causes an overflow.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - Removed the duplicate declaration for DECLARE_OFFSETS.

 xen/arch/arm/include/asm/lpae.h | 4 ++++
 xen/arch/arm/mm.c               | 7 +------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 3fdd5d0de2..2744e0eebf 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -259,7 +259,11 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
 #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
 #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
 #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
+#ifdef CONFIG_ARM_64
 #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
+#else
+#define zeroeth_table_offset(va)  0
+#endif
 
 /*
  * Macros to define page-tables:
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index fab54618ab..95784e0c59 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -207,12 +207,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 {
     static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
     const mfn_t root_mfn = maddr_to_mfn(ttbr);
-    const unsigned int offsets[4] = {
-        zeroeth_table_offset(addr),
-        first_table_offset(addr),
-        second_table_offset(addr),
-        third_table_offset(addr)
-    };
+    DECLARE_OFFSETS(offsets, addr);
     lpae_t pte, *mapping;
     unsigned int level, root_table;
 
-- 
2.17.1


