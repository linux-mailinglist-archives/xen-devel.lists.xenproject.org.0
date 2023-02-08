Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371FB68EE7C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 13:06:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491728.761056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDR-00083H-Qb; Wed, 08 Feb 2023 12:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491728.761056; Wed, 08 Feb 2023 12:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDR-0007u2-Ge; Wed, 08 Feb 2023 12:06:21 +0000
Received: by outflank-mailman (input) for mailman id 491728;
 Wed, 08 Feb 2023 12:06:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPjDP-0005Yt-Dw
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 12:06:19 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e89::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdd108c8-a7a8-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 13:06:17 +0100 (CET)
Received: from MW4P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::31)
 by DS7PR12MB6336.namprd12.prod.outlook.com (2603:10b6:8:93::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.32; Wed, 8 Feb 2023 12:06:14 +0000
Received: from CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::b9) by MW4P223CA0026.outlook.office365.com
 (2603:10b6:303:80::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 12:06:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT103.mail.protection.outlook.com (10.13.174.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.16 via Frontend Transport; Wed, 8 Feb 2023 12:06:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:06:12 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:06:12 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 8 Feb 2023 06:06:10 -0600
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
X-Inumbo-ID: fdd108c8-a7a8-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcoBNrkCfME6utYB3/h5MFkU5pCEihv5tvxvsDn4P8z/EHI0SdPKHa+kUCFOXAw9I7Mm/HgPdysWRJNBYJwfO3qZMfkQ1HMjd/22vPD+kqOBYShXYhVHIaNqxAsreyWXpXX8ugSMDi8nc3/v+2qWY1W70XEN52P7mRNTkiHKDBHKyvDjASCYqmzhfaAR12cQ+XZL/0D1SLf58qtgQX+z6ukGX6hKYVHQis4RbV2ToPfPNex0l3EQHE6NcxPwmp3aH4BUyvSGSuYx5uWYRQmrQyP4zqf2cjes13PeQnr2fqsgjGpqRsyv4lGdVRQbpnaLMgV5qgCmqkTHTM08D0Eanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7Yzg+nNX8nU4svwG9G763956tzSeXgDroKQZsR7IaM=;
 b=O81tc0a4pMeLGWa3YV89ZrO6Ut1aVcexYyAHZVOBLUid2dh9idKUpX/H5zJnxpLanyswSKSp/qcNHbkPQfM0yx7BQXZm5cPkWaKIkx+7Wp6QKfmOoQRZkwe/BswEhXRQ0pofkxsclBsW+hfWD0aug52zdUyGkGrKX3U9fOxXHWvOdnUHU80ZMO9ICbViRyMVtqKtPp8P0Rhut/lLAza+KKtuzDOwCuKzb7ZC9MJenqWHvYaEMy+qBfI42/O5aHpBHvGEEfwcEetGJskakokO71YQueeGu4qUWj+DieDvv1NxzV9ZJobVfGvkxYER/C6WzMFu291IugUCYP1PkMQDRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7Yzg+nNX8nU4svwG9G763956tzSeXgDroKQZsR7IaM=;
 b=shkauWBL2Ey7IlA3ds08VPngv1oOP+GgtplCC6auZfftJdqvxBpMuGzpi7lqcxWVHtCODNIe+B9UYxn8J3xjauxxhyfpGHxpwTk7wMYRE6hrwDdXdPGb06u3n3doCMTwPileAAT81RuMF5jTL9kbmhnv63utWAW45oDdtSzGNl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v3 8/9] xen/arm: Restrict zeroeth_table_offset for ARM_64
Date: Wed, 8 Feb 2023 12:05:28 +0000
Message-ID: <20230208120529.22313-9-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT103:EE_|DS7PR12MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 289f0d9c-ef7e-4d17-1278-08db09cce01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m+wsuPBT2ynBY3SpbZ7rDQe7N/lgtsWD3lZ3NFPxnMIcQrQu0SeJ9bfkXm+0Q07AHNf8ulR+zaM8qGg9hDST+D+tfHIgknLtelv2yy3Gh9pDr8VRzm1yi0Jz/MZfxBG/ZWTmdcO2E3p4PnwyVzxsSjzR1+AZg2GQO4epUPJFeZ3L0CMccU3DkiU2893PEEvJJZO7XOGajtbAYbbi01ticxmaNd1FWjJ8glMM/YSkz1g3nLbnsc5ZW1kkKigOj05VBAOWBdyLm6nFKKg16tWpDRfO1Q4hS34RAC1JIlxH+xdALdzNXp9wNK1aXsYSdSj0oag7h9qso7Whbq23VH5Ziaolsx3z1rpDBtVNdxezNWzad9kSRr/Ro1f3ZX+mPkx6ffyDzS1CLERTKEvUt+XI1gT3wYJDaAmXR23YkQMS1LxjrEO81Fs+ALduTmnRylQLm6mTzTUxx2SfRJFljr0CS+kumWLM5yDvbFR3hu2anjpJSiaU0oNFyK6HaGFaso/bradBb4E/YtB/Toq8yF8FmoMQZjrwDT7YUXuJUBzypajpJVPnA1yYNltU2/hofp8cbn3F/I+G/dBjxSDJq7JB0Sn4o457bPWAvbG51jg+fEWUBMGOFnjrcyF1GQ4cBiyFTWIpbIjqCNHVVskQpHmCPzNeOv9GhHinTOkZXT26xgCMfL9vM1VXGMRbLFvs1fa2nVDE0MlmabbSFMJV626R5b+YGsZGARxHH/QUAzggX/M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199018)(36840700001)(40470700004)(46966006)(40460700003)(478600001)(36860700001)(8936002)(5660300002)(7416002)(82740400003)(81166007)(356005)(2906002)(40480700001)(36756003)(336012)(47076005)(426003)(2616005)(70586007)(70206006)(8676002)(4326008)(86362001)(82310400005)(316002)(54906003)(103116003)(83380400001)(26005)(6666004)(6916009)(186003)(41300700001)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:06:13.9409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 289f0d9c-ef7e-4d17-1278-08db09cce01c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6336

When 32 bit physical addresses are used (ie ARM_PA_32=y),
"va >> ZEROETH_SHIFT" causes an overflow.
Also, there is no zeroeth level page table on Arm 32-bit.

Also took the opportunity to clean up dump_pt_walk(). One could use
DECLARE_OFFSETS() macro instead of declaring the declaring an array
of page table offsets.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - Removed the duplicate declaration for DECLARE_OFFSETS.

v2 - 1. Reworded the commit message. 
2. Use CONFIG_ARM_PA_32 to restrict zeroeth_table_offset.

 xen/arch/arm/include/asm/lpae.h | 4 ++++
 xen/arch/arm/mm.c               | 7 +------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 3fdd5d0de2..998edeed6e 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -259,7 +259,11 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
 #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
 #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
 #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
+#ifdef CONFIG_ARM_PA_32
+#define zeroeth_table_offset(va)  0
+#else
 #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
+#endif
 
 /*
  * Macros to define page-tables:
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b99806af99..44942c6a4f 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -221,12 +221,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
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


