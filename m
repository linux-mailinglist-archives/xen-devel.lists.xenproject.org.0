Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AE76C33CA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512708.792851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peckW-0003z6-07; Tue, 21 Mar 2023 14:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512708.792851; Tue, 21 Mar 2023 14:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peckV-0003wH-St; Tue, 21 Mar 2023 14:14:03 +0000
Received: by outflank-mailman (input) for mailman id 512708;
 Tue, 21 Mar 2023 14:14:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1peccK-0005Xe-IM
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:05:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7274bfca-c7f1-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 15:05:35 +0100 (CET)
Received: from DM5PR07CA0055.namprd07.prod.outlook.com (2603:10b6:4:ad::20) by
 PH8PR12MB7027.namprd12.prod.outlook.com (2603:10b6:510:1be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:05:32 +0000
Received: from DS1PEPF0000E653.namprd02.prod.outlook.com
 (2603:10b6:4:ad:cafe::e1) by DM5PR07CA0055.outlook.office365.com
 (2603:10b6:4:ad::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 14:05:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E653.mail.protection.outlook.com (10.167.18.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 14:05:31 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:05:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 07:05:31 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 09:05:29 -0500
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
X-Inumbo-ID: 7274bfca-c7f1-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLlNUz0q2HF7VaYmKOyaW48YpWAkzONTwJbMTAZnusmo1h/q7iYJotbJs6GVdAUPGprfpgUtc0Y4vfDmiyoQWYcaZba2X17WJM13uXOCl0E6Ojrr9D5Gi+VopEfMvVjcEPKLIvAkKdYw2HtSnbbq3wR+b3Pc+tXauiCQq7bbYqAZsiQCgQY2VWj/r67ahqKlkqs4Mr7UPSBMrniALKIWHi1Vr3U/EoMsn0ywvOoX7goBLaGUgD/9LPIcEFvOmYrKq4JQxYuQH0X1/KxLLImPs92lpCHirtJsXu4TMj/3ydQnOFZmfKOB1sEOTU4YQwP+g3jxtq0HaeLowhcv5OlmXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKVGGJrESWsLzoLGHnzYf6BFviRvh/CY/WThQ1yLYG8=;
 b=iBCFAqrxDr2vzZ28n356106xsJQiYS2byQNbYzkm0wgcCFGsargYmb4R5pSstphROvfxuMFY4dUKRqQNl4276ajLqFA/KnOQ4tHD8eD5q5tbyl+9OXSnPzbKw8Hczcj8CqRCm2CR82FuM7WItmG34bqvHveGdGVa4cjYssm/TPn4lwJc8JDwX3T5J8bsJojDq6c2krLm4ykoKiduJucsWpmAiK+gTqTjBZMMNBE13y4dNIFlVlWCHrTi7R3vlMxr/6zzAJ5i3gMEO4CSDzdIgX5hrQ+w8BhuYR0WnBu4CDR0wWxfUSL6ISvrszvWNgeFE8jW2amDlJpcaUEfqENMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKVGGJrESWsLzoLGHnzYf6BFviRvh/CY/WThQ1yLYG8=;
 b=j2FtKS7BjLjLwRpWnzBUMVTQDXNP9vJGYCUv0p6JrsakkaQ/2EP6SFu+rYw7kMMoXBmC6fgKdLiVEuawbd4hPdfwBrTyOAJ+5+6eS/pxFoBsKtKXhjVKUap63JVavFi5pP2srBo0FNGNw4AhigCcj/Ly8A3dVmMXH7hn7R8CCkA=
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
Subject: [XEN v4 09/11] xen/arm: Restrict zeroeth_table_offset for ARM_64
Date: Tue, 21 Mar 2023 14:03:55 +0000
Message-ID: <20230321140357.24094-10-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E653:EE_|PH8PR12MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a272155-57fc-44ff-ffbe-08db2a155570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RVpWBf5UMAPc3JtIylwptdldEDvP6JP5Fh4aDED56U4ShaWcROHsucl2ScnMgjMFSPC/7I1IEkTxF3BrbZWHJqNIuPPiW7niqCWyR6d4qdakBWFqe/98bu5dXNzy9AGunDvN8QUaUeG6Jv/YdMUNGSe6wsPtwa+fOkMWheU6APBYtXVLJZ4xA8uX4srzFz/dCBa5H/mi+LM3oTaaFkGdZOty6xZdrdLW08pwXAxlMMH8r2lLfcbsGv2GXhRU64d425VIYgpQOOf5FUebo410u4/jOz4Lk75os424jsU0qCvvKZfVT5o0u0V72asHtz2Pt37UAq8VX5JkuyBVpKwn7Ah3ehcoECFuns094EWpxlbqmu/29s1/+CVNR/8n2I+uyZPdt9vtTwoc8sdKNOzvMLtGDLpUcBWxBqerkZOUtw4vcA70mDXcueBpaX+yq1YODA5Ue5oh3hRLPzInoh+Arw8I8Fxsw5uvLjTXgSv5ojh4NeQdLlFMyQWevOx7yHjOIN1xxtqz8iA9KVg1JVvxu61MHDQmtgK5A8lUWIG7fO/7dkiqrlEO7+hzGPC2ZB6RgdKZrvWL4Dn9KNSN7U+BehixwJTamA39Vp+PSwy9kMXbhM/u9/ohLiXT9DKKzmZfOhHArMpOQWNZIyj+A+OEi5EzKAVc02VM0y0t5LX2OWXt98HRUsnopbQHovU6ywhLfMyZAyHZbZbU8XXoKiprvX+UzAUNicmYX6Ni/C0HrAGbVCPnI6wCTnFkBNwS2rNVGlF7uQA0GXIchJO/LpN5weHDwHNN4DtX/4V5d3/dq6E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199018)(46966006)(40470700004)(36840700001)(82310400005)(2616005)(426003)(47076005)(83380400001)(86362001)(336012)(81166007)(82740400003)(36860700001)(40460700003)(356005)(36756003)(8936002)(6916009)(4326008)(8676002)(2906002)(70206006)(70586007)(41300700001)(40480700001)(478600001)(26005)(5660300002)(186003)(103116003)(54906003)(1076003)(7416002)(6666004)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:05:31.8268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a272155-57fc-44ff-ffbe-08db2a155570
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E653.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7027

When 32 bit physical addresses are used (ie ARM_PA_32=y),
"va >> ZEROETH_SHIFT" causes an overflow.
Also, there is no zeroeth level page table on Arm 32-bit.

Also took the opportunity to clean up dump_pt_walk(). One could use
DECLARE_OFFSETS() macro instead of declaring the declaring an array
of page table offsets.

Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - Removed the duplicate declaration for DECLARE_OFFSETS.

v2 - 1. Reworded the commit message. 
2. Use CONFIG_ARM_PA_32 to restrict zeroeth_table_offset.

v3 - 1. Added R-b and Ack.

 xen/arch/arm/include/asm/lpae.h | 4 ++++
 xen/arch/arm/mm.c               | 7 +------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 3fdd5d0de2..0d40388f93 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -259,7 +259,11 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
 #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
 #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
 #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
+#ifdef CONFIG_ARM_PA_BITS_32
+#define zeroeth_table_offset(va)  0
+#else
 #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
+#endif
 
 /*
  * Macros to define page-tables:
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index d8b43ef38c..41e0896b0f 100644
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


