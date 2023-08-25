Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E54788173
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590549.922900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmh-0008OU-0B; Fri, 25 Aug 2023 08:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590549.922900; Fri, 25 Aug 2023 08:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmg-0008Mi-SR; Fri, 25 Aug 2023 08:03:10 +0000
Received: by outflank-mailman (input) for mailman id 590549;
 Fri, 25 Aug 2023 08:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRme-0007GZ-DN
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:08 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e83::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2cb8fba-431d-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 10:03:07 +0200 (CEST)
Received: from MW4PR03CA0269.namprd03.prod.outlook.com (2603:10b6:303:b4::34)
 by IA0PR12MB8208.namprd12.prod.outlook.com (2603:10b6:208:409::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:03:04 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:b4:cafe::9a) by MW4PR03CA0269.outlook.office365.com
 (2603:10b6:303:b4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.2 via Frontend Transport; Fri, 25 Aug 2023 08:03:03 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 01:03:01 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:03:01 -0500
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
X-Inumbo-ID: d2cb8fba-431d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIK8AW8F5UrujvOMvLRRXkzlSpjoYFH9716GEBkNG8VPl56ms5Viv1bpJtrY19TsgIYxZW05g6YNDkqbkU5VkIiYiR5DWaDH1p6DLSW8YhQobAnlr1+gvGizEttiTmTsxtQl+YVZ/9KhXmh69RmL/Q9yv+SLVClq/gF5GM9WCw/arZyQeY6lqYrbw0fM9JiJESh+Q/Zi+4grBxaGSG0qooS6T+/hlDQlQM2WmeICBazdOW2kn/nvUHp4QSdSaKB3uU0twHo0iG/pQZy4ooUffXUs2wUsF4u2qTSShqbCpj3EBryaZatO2pleO/czm9+bPeIudid16XumCnrJcH3ljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPFr75nv1aBnnGpQw+siLMDm3xpzWwYvMbfH1Hl8l3c=;
 b=PoHkyuAF8IYl6YQiFkJGGIPtdTJOPtLfJ2DcFtlXzSmqy4PrJ+8SIu3A4bLINk+GouyjhsZt0P5CmxNBhRjXKc7wRHGkuLwEmvm1caEPptfbMopAQ1P/sv4TWcIFQWYD21JqJ7eustrS38t3VxcJ056L7OUR0zqCdDA/qSwu18JyoSdV2p96lr6VPXOE1Ex/OTQPtLxHNhYV5jJKgWFfMVbpPNRDClprchlNpRfFJimI4UIKHESQqssUuI57p/F1/j/DKQEKkhr559IkzXE/NvYPOttNSrxLeFyvVela1BY9zh79KfTyt4Whqum11AhzPrA7Q7WmYwKhp0ZWnt24cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPFr75nv1aBnnGpQw+siLMDm3xpzWwYvMbfH1Hl8l3c=;
 b=fmWniqkPSZ2zRJjMXdt4YrMm5zuirBGKoKS3VYkEEq9nYAdctMlJTpiMiXDZEGga2GKrkITI5Yu+C8p/25/H9dqyvEtG2vWon8YwF1u7RD+e5aaheQL6EEfrIbtAgmafFR6vY28MsWVsEvrl0nHZ/CuzILoKANNTSSokZORLpmU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>
Subject: [XEN][PATCH v10 08/20] xen/device-tree: Add device_tree_find_node_by_path() to find nodes in device tree
Date: Fri, 25 Aug 2023 01:02:10 -0700
Message-ID: <20230825080222.14247-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|IA0PR12MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dcc3098-e987-4c11-5176-08dba541b566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gf3wjCDMmpXWahX+UJC54kkPGRLzFolOGP7SOnzlE+Ace2x5Es1//zvTxMVVUrjVO10lZb4qRCkkhVGsUgflRNfBgzZkounRNs0+bwRfmObnf7TNhp3Oa5h2EQh1FJHmGu7v4wFhxvTIZy7oqAHbN6a7UPfL+eVEynqKaFiT2QlLIAFft1XyM8YqmqIi55oPsBvDJAgFyn/PHwNI8aH6pc9YfBqrIqJDLk5O13XPEbl5tQ+D4+mvaCWQ1FA4aqhg2GASgb5dfm0s/MSpz6McwRmL12DFfrXmw9NiCjOSM/q0zwEi/20jeGsTDdl7VB30mQ2RyhvBn0bCl/ceVlpBK570qo+8LXsr8zQTbhBcfFs3MDtRRN5EBbnC1JLVbqY1hkZ4BcY9cHwEdHO3w7DCvIgpru9bik6Lz5F1UHv3PxbDtbZ1KwFFQLkdioXkAce6N8VL8IlnmJLQpQQAjnKC6iqxlS44Txq0Slyms6byWCwJKRTPerqx3Sf0o7ZD+Y9EJLomuE0Pqk9Zog/IQwFx10Re0NUSauJv2QJYd0UOFYNbvL8/f1EEf5A55gIcWUVXKoRJ5Sv5aN3vR/UDWPx+rHOFukJTqc2PKcuvlw/xBOEbQsIBEijDMMn9QN+pMtjUB/qwEcCuz8FcmVVpmOfMU8fit7v/EiF6dpamahJOQk7sgvSgyFgnTlzxEH9dnyVBAG9t1Vsotbg7XpqQQmOm7EE2+wS3V8m96esLLfLzR5Honw0vaZ+EOdArIRY4c5uQVyOCOi8nsItLPU4L1EME1ZO304jhZxabjGE699NHh/0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(186009)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(336012)(426003)(83380400001)(1076003)(2616005)(47076005)(36860700001)(41300700001)(26005)(316002)(70206006)(6916009)(70586007)(5660300002)(4326008)(44832011)(8936002)(8676002)(6666004)(478600001)(54906003)(40480700001)(86362001)(82740400003)(356005)(81166007)(36756003)(37363002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:03.6333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcc3098-e987-4c11-5176-08dba541b566
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8208

Add device_tree_find_node_by_path() to find a matching node with path for a
dt_device_node.

Reason behind this function:
    Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
    device_tree_flattened) is created and updated with overlay nodes. This
    updated fdt is further unflattened to a dt_host_new. Next, we need to find
    the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
    and add the nodes as child under their parent in the dt_host. Thus we need
    this function to search for node in different unflattened device trees.

Also, make dt_find_node_by_path() static inline.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v9:
    Fix indentation issues.

Changes from v7:
    Rename device_tree_find_node_by_path() to dt_find_node_by_path_from().
    Fix indentation.
---
---
 xen/common/device_tree.c      |  5 +++--
 xen/include/xen/device_tree.h | 17 +++++++++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index b8ef1c7ae2..f38f51ec0b 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -358,11 +358,12 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
     return np;
 }
 
-struct dt_device_node *dt_find_node_by_path(const char *path)
+struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
+                                                 const char *path)
 {
     struct dt_device_node *np;
 
-    dt_for_each_device_node(dt_host, np)
+    dt_for_each_device_node(from, np)
         if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
             break;
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index a518310a62..44d315c8ba 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -570,13 +570,26 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
 struct dt_device_node *dt_find_node_by_alias(const char *alias);
 
 /**
- * dt_find_node_by_path - Find a node matching a full DT path
+ * dt_find_node_by_path_from - Generic function to find a node matching the
+ * full DT path for any given unflatten device tree
+ * @from: The device tree node to start searching from
  * @path: The full path to match
  *
  * Returns a node pointer.
  */
-struct dt_device_node *dt_find_node_by_path(const char *path);
+struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
+                                                 const char *path);
 
+/**
+ * dt_find_node_by_path - Find a node matching a full DT path in dt_host
+ * @path: The full path to match
+ *
+ * Returns a node pointer.
+ */
+static inline struct dt_device_node *dt_find_node_by_path(const char *path)
+{
+    return dt_find_node_by_path_from(dt_host, path);
+}
 
 /**
  * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
-- 
2.17.1


