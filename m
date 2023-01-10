Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F5663BE8
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474443.735677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOo-0008OD-Um; Tue, 10 Jan 2023 08:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474443.735677; Tue, 10 Jan 2023 08:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOo-0008Ll-Qp; Tue, 10 Jan 2023 08:54:26 +0000
Received: by outflank-mailman (input) for mailman id 474443;
 Tue, 10 Jan 2023 08:54:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOn-0005oC-LN
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2074.outbound.protection.outlook.com [40.107.7.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 610301df-90c4-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:54:23 +0100 (CET)
Received: from AS9P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::14)
 by AS8PR08MB6023.eurprd08.prod.outlook.com (2603:10a6:20b:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:21 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::a0) by AS9P251CA0012.outlook.office365.com
 (2603:10a6:20b:50f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:20 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Tue, 10 Jan 2023 08:54:20 +0000
Received: from 6c9be4230c91.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B72E062C-9E7F-45B2-933D-CA866276CC5D.1; 
 Tue, 10 Jan 2023 08:54:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c9be4230c91.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:13 +0000
Received: from AM6PR01CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::40) by GV2PR08MB7956.eurprd08.prod.outlook.com
 (2603:10a6:150:a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:09 +0000
Received: from VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::f4) by AM6PR01CA0063.outlook.office365.com
 (2603:10a6:20b:e0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT017.mail.protection.outlook.com (100.127.145.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:08 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:00 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:58 +0000
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
X-Inumbo-ID: 610301df-90c4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DetB4lMCYSGFHbQ+S23R1nmvP6AkNk5bezLoeuNo2NQ=;
 b=CjYW9OA5MiITfPRLeAQJdBtRhIIzXkoXUeLTsylRqosW0eZ5fT1/96spS8RcdECNGzla6LAu1pnAvPEJws6jZTKutIQh25/plhP6g5Q+g2qq6lLH30tl6Z2xbjAY2McqQ7OhYemVvH39LQAyf05iqCUlnd9hdLqPZ2TydNKt76c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 138f2759a09173da
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/UZejh/sDhmr1GIIVrikmdsspgU0j0oko0y7Pq0nmGe9UN8Uju5V0Y3Fr0TF7F9NAoQGYHx+b9EO7YznfB0lyAKduICwGn+nyydzUSSeEOtlEW7KTjN/s3SbqpAzCI8Mka+g0jAOePvva6uok91EkDqRIkdO/LFo3u4tSK4G05vq2GdhABgAMGDvMRDpGDXwLV4tTda2s5fiRvbxGKES6BeJhD22w500pY64ERUjqjAIgeYU5Rv1ynzVjP58WlCOGOPo2f9W3dbAHymnBTheeMQHF+Vp48S9S8aeTU2NVHLa5ZrmirPaGOUaX4mLRf5zObTfw9Ll0xDlhK7DY1lWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DetB4lMCYSGFHbQ+S23R1nmvP6AkNk5bezLoeuNo2NQ=;
 b=h81WCsFZthOa9TZtRLQfeHFDvD/QJEonb5RqdioAp6nVhSMKyWiatu3BlTi/uQvSvnT1EbG9ce9uFGuHFZzbby4gHzIOXEkez4g2lnCmH7DO6YiNkd4caR9mDBDpNqaOKKaxzihBqrcEbIw6udJdjl7AM65kkHtHiTZxscFMUAgnfmgSlJTaP8axt49B7MhvErq/L4TakHSXMcxo3K2pHkzs1YYSHh0mlY5Dv6PijnnubTp2WyXAIm9d4jtIt9TQA5tgHPSLzzVl4Fg2ucDC9ECMbPIUfM8mmEH3+qIwWyD2iJK9NVtZBCt9cpwhBGoVJVatuEbVGdQdlbS9x63lVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DetB4lMCYSGFHbQ+S23R1nmvP6AkNk5bezLoeuNo2NQ=;
 b=CjYW9OA5MiITfPRLeAQJdBtRhIIzXkoXUeLTsylRqosW0eZ5fT1/96spS8RcdECNGzla6LAu1pnAvPEJws6jZTKutIQh25/plhP6g5Q+g2qq6lLH30tl6Z2xbjAY2McqQ7OhYemVvH39LQAyf05iqCUlnd9hdLqPZ2TydNKt76c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 06/17] xen/arm: Add boot and secondary CPU to NUMA system
Date: Tue, 10 Jan 2023 16:49:19 +0800
Message-ID: <20230110084930.1095203-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT017:EE_|GV2PR08MB7956:EE_|AM7EUR03FT020:EE_|AS8PR08MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6f6376-5ef1-4973-1930-08daf2e84397
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aS+J3UKHWPXZoOTlJwyBHwOsVJ8zE3h4K0qY36ZEiw2IY+Pf0ED6kCVnVdrfC3unMz2KM62mpTtbZGeTF2tO844Xu5iSI77dqUiNvIcDSksnfQm4W5a54jG2UWxMUqRhN/8y2cbCOO7KzZgxsUYw2OTODNt2KxKSW1GL/dd8BXbVfeWLfkBaYRx1GsyTx3fRSnP0vliGuhPOfm6Uj90dzBoK5WXhM6jK8xHkNp6I/3GkF8FBT2+8LVWzT6V5L7/BdWt5tgkT+NF8lO/XqMsMCzGAcYHBulTSI9sMpTL1WlJq8vq21WNnH6O382DhiAxKjDms9TEI0cVbHKYvAlMXgw5xZKE0MhfvYAB0ehXEJEf+kGwocVHSKRmC+JmALb7HgclQc0zOpr0Y4wK7Z6J47zig7oH9BNc6za4jUITLZS80c41auYKQGMM+hz6vsVPrATH3uWlTn6jSBXUQLEKlneWG/RfUcBmQ42/wumqIqFcQFIxdN3LkROU3Ia/Hm/wOrXTE9n/5MXq17US2Z/fSvC8enSE8W8TaehuJZwu+GH1HHGFGxFFRDer+1e27bxQk3VCzf0xW1TuXpMUUcHKFMzhgAzCss6iuLiwryEdEQxcaENeVT+T6JW7P32ihYAWTNNRO/XJwrbD5IiiQ9jEjesuG9BujlpUW0yoiy0Dd/XrNI23Qro0pJgJD75sZ7dZ0HCEw+/Gtz1XSyi6IeH8GzQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(46966006)(36840700001)(83380400001)(426003)(82310400005)(47076005)(316002)(86362001)(54906003)(6916009)(40480700001)(36756003)(7696005)(356005)(81166007)(82740400003)(186003)(336012)(26005)(2616005)(1076003)(2906002)(44832011)(478600001)(6666004)(5660300002)(8936002)(36860700001)(70206006)(41300700001)(4326008)(70586007)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7956
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa82329a-87e4-4135-0f00-08daf2e83c93
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GVNyi/5bICXOl0fQBUzMg1x3cmPpCFtJw1r5zASEgFs6re1mKVZzDYlPhnlISFnO20hcGGp9WdGRpt8cBiN5mqbxMTbnibjBg5+A3doKjH7phhCZUAN3EMUTHCGLeiGa37yCYgz9jVIADZHeNS/mCWtZHXV9DcsN220hgGwBG1PbJfvJ6YoUwG5NSZU7JAT4dRQQmENeYUCTtyubhYZ86YOuA4vv68LL+suzLAuLLQzt2SrpTPzWUJKxqlsUOvDEJzxgjkIkiilEHW+DM+PR7vS0e37UGHU2qTL3uL3Mr0cadlgJUqntvn2Xfr/m3CQgzRBh9pfsh/JmwIkRmzMltqFAWablQ2BECaoWBfd7Mtf9BKPm3JCCGJIhbtKC4Jykh/b2j1I+0Xt9pdehD5hNrOzZJl3Rz/NyJcdcUKg/YmSvV5TmVBnwHPum+RE6+FJncXSSfi2yZPej0K685FI3AWGBX+TUSllKkBKvOQ45FV7jp76hiDRQozKq0iTOcRDTSF9/OSN8RvSy1g06dNvf7mGqll1QYiFWXRZAVJNf7zwc8MMEmcWeh8499mhp/Gb2nHCQ+QmtoDIe9CSpROXuRytyWUbhHBZDtSg+CrHT4ITNGbzjlVFUirAgpVRE8VpAVHpVIBobu39YZear4q+wcuzpyfcTqO8AxPdYFNvqxdJRSdfV4KBPN2SPMtcEo74pSs+ya6tk1yQxao1DJwwhYw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(5660300002)(44832011)(8936002)(41300700001)(2906002)(36756003)(54906003)(83380400001)(8676002)(70586007)(70206006)(4326008)(316002)(6916009)(7696005)(26005)(81166007)(186003)(6666004)(86362001)(478600001)(107886003)(336012)(1076003)(2616005)(40480700001)(47076005)(82740400003)(426003)(82310400005)(36860700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:20.6031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6f6376-5ef1-4973-1930-08daf2e84397
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6023

In this patch, we make NUMA node online and add cpu to
its NUMA node. This will make NUMA-aware components
have NUMA affinity data to support their work.

To keep the mostly the same behavior of x86, we use
numa_detect_cpu_node to online node. The difference is that,
we have prepared cpu_to_node in dt_smp_init_cpus, so we don't
need to setup cpu_to_node in numa_detect_cpu_node.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v2 -> v3:
1. Use unsigned int instead of int for cpu id.
2. Use static inline for stub to do type check.
v1 -> v2:
1. Use numa_detect_cpu_node to online node.
2. Use macros instead of static inline functions to stub
   numa_detect_cpu_node.
---
 xen/arch/arm/include/asm/numa.h |  9 +++++++++
 xen/arch/arm/numa.c             | 10 ++++++++++
 xen/arch/arm/setup.c            |  5 +++++
 3 files changed, 24 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 3bc28416b4..e0c909cbb7 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -41,6 +41,7 @@ enum dt_numa_status {
 
 extern void numa_set_distance(nodeid_t from, nodeid_t to,
                               unsigned int distance);
+extern void numa_detect_cpu_node(unsigned int cpu);
 
 #else
 
@@ -74,6 +75,14 @@ static inline void numa_set_node(unsigned int cpu, nodeid_t node)
 {
 }
 
+static inline void numa_add_cpu(unsigned int cpu)
+{
+}
+
+static inline void numa_detect_cpu_node(unsigned int cpu)
+{
+}
+
 #endif
 
 #define arch_want_default_dmazone() (false)
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index dcfcd85fcf..4dd7cf10ba 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -74,6 +74,16 @@ void __init numa_set_distance(nodeid_t from, nodeid_t to,
     node_distance_map[from][to] = distance;
 }
 
+void numa_detect_cpu_node(unsigned int cpu)
+{
+    nodeid_t node = cpu_to_node[cpu];
+
+    if ( node == NUMA_NO_NODE )
+        node = 0;
+
+    node_set_online(node);
+}
+
 unsigned char __node_distance(nodeid_t from, nodeid_t to)
 {
     /* When NUMA is off, any distance will be treated as remote. */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 1f26f67b90..8c02cf6cd4 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1115,6 +1115,11 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     for_each_present_cpu ( i )
     {
+        /* Detect and online node based on cpu_to_node[]. */
+        numa_detect_cpu_node(i);
+        /* Set up node_to_cpumask based on cpu_to_node[]. */
+        numa_add_cpu(i);
+
         if ( (num_online_cpus() < nr_cpu_ids) && !cpu_online(i) )
         {
             int ret = cpu_up(i);
-- 
2.25.1


