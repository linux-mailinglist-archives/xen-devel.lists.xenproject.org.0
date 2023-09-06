Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B687F79333D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595998.929786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA3-0000cI-JC; Wed, 06 Sep 2023 01:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595998.929786; Wed, 06 Sep 2023 01:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA3-0000Ub-4J; Wed, 06 Sep 2023 01:16:51 +0000
Received: by outflank-mailman (input) for mailman id 595998;
 Wed, 06 Sep 2023 01:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhA1-0006tr-74
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:49 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c76908c-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:48 +0200 (CEST)
Received: from DM6PR02CA0047.namprd02.prod.outlook.com (2603:10b6:5:177::24)
 by PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 01:16:42 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com (2603:10b6:5:177::4)
 by DM6PR02CA0047.outlook.office365.com (2603:10b6:5:177::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.34 via Frontend Transport; Wed, 6 Sep 2023 01:16:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:40 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:40 -0500
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
X-Inumbo-ID: 0c76908c-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bma/VP8gAET5qymQzVqSBwBwPI2pCwhUDxs/W0zwksb/wIfp7NaBkIStIFkDT013HKHTkjOuXq6Z5bgcj+duTqgdDsTwxw1YryEEMIoV68BK2xaW58vGgZfuREVpj9TdmddXctkuoWQSo1n3nY/KO7Fw+waTtuI/awzuNYWtmdiZrtnN6/ujGPk+IchToQGE35e2rNBxbC/gZ1aQPiVfjp5UG7rQSu54VoOYblk3rqaZzjwhvU8xQ4HLhkIiK0kXDzIghcP+72lBRzW+CETAG9DpQFW3a87gPbFbGW8IVlcdkbIxjX2MCXgsuFL5RWBSqjWQPmigglYqg911VYA0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIgawtLTJDYclMTRziV6+ukrPXqF+ozH3iEpHoQmI6c=;
 b=dzTsvZc9PcP6ZIbBY8Oou2Y4Wdr1Nm5Nhmt6klWU0E50DCTbYcUn5RdrndOOY524q16g6NeJNZccW5RBypV4ZEk2WxWNdfYsFx15geAmgkAWQfbj9PdXziFl7lwVvqxEOeanTWWEWOjvpIGhJZSFNpWmx+1YOrm0EkXO+J78NM6OYYF8RPRdGdEztVJHoPJEHfjMmjpJkaSbm59qoAofGy/GoE0+FKDAhJXFtGj1L9x1bms4srnyOmzu9YD+YdyD6cg6KEIZULlxlK1Mr2KBXqdDbNd6+6Mt6CeRSVQOQBi4EoGiGRbcgoBviOgmQK+hs7RJyQPlTiyXgxrtB65uCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIgawtLTJDYclMTRziV6+ukrPXqF+ozH3iEpHoQmI6c=;
 b=xVPaTsQNoxjMoIYYP2l1jzMsJqXVymBNeiUHKtqIMm4h3TTiTy0VvrnrbfvwLAw/dj7Q9vMaJ+rSWrXS0Fzy+CE8OtlIJl+de2lPxpzQk1OB8jZYF4Jx/UKKVXbD0d9xOHuLn2ZZZlzIdVEgHiEMZRDfOYIY/M4F94374alq/Ks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v12 08/20] xen/device-tree: Add dt_find_node_by_path_from() to find nodes in device tree
Date: Tue, 5 Sep 2023 18:16:18 -0700
Message-ID: <20230906011631.30310-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|PH8PR12MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 34fcf7f5-4b5c-4d16-eae0-08dbae76ed9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V3Os/i7+i9psodDWzfHA4FGaduAWPW6D5+NjZ+AYzqZGdvPaG0XTP0cwbvUGywYLTUMFpsTcj6jdLdIrfyhjJluhDelyNnxKZAngnMnDokD+0A4SsWqLI7cQMOjUWS0KEX+PA1Cq9YL9hxACusGAX3C30UtrpEijAPrW2flZpOicQ6plTwspSPKrGyOfmQeTXzH9IwoK+f/Hpku9vPif+2IqG9HVBGZ6i5hNKyLyG0XoyrMEqUVGrJHPdbERMFPsJiwJ4/xUzSrx2TaTjOVeyOyBCnbmRvaq37IjuIIWhy1E20I2356yHIJgYQ/X0h/r3WonNE64fvWehQKkEXaPk0aLl9OjcLGkc0b2MWkup6DMCoEulyXcLddBCAL7hkkO0c0rjq8cdqXQMqhAbrBfaEnNxqLRntDlXMZoKWyKUdDZOWKXwif6N9NUNc5V/XIsHOaYsLhqMAnYJeP7RnSCPBFhvFjhqDhbtBExDZOneEJxhPs/N6Hzr36gE/qG2HWEb0cDl+I/GLJDCwxxdovmLH4AdTB/k/6KORHqOoI4Pvn+mhUWYupUgauxrSyrL8vDfWpfpyainD1P0lASDL+GRCSjqZqgxM2n74PYB464XeupmF6F7XjTHwQZaexT/VKpkrfA4VJD+HnZLmFwgy9osuMYlIUevMGflcERHt2oGT8RH38k/aTlJXb8r38RXl7LWxUVmLNHN6GEkhOfP28RkcxFQtbeFVoEWqo55m0fD9RACFJZUac7PjnagBo+NfKm/1Xk5boXjeieO0xaSeQOmJnHo8t+SrIT2+rcrKhjxQ8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199024)(82310400011)(186009)(1800799009)(40470700004)(46966006)(36840700001)(478600001)(6666004)(316002)(6916009)(8676002)(2616005)(4326008)(8936002)(44832011)(26005)(5660300002)(41300700001)(336012)(426003)(2906002)(83380400001)(36860700001)(1076003)(47076005)(356005)(82740400003)(81166007)(36756003)(54906003)(70586007)(70206006)(86362001)(40460700003)(40480700001)(37363002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:41.7690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fcf7f5-4b5c-4d16-eae0-08dbae76ed9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7326

Add dt_find_node_by_path_from() to find a matching node with path for a
dt_device_node.

Reason behind this function:
    Each time overlay nodes are added using .dtbo, a new fdt (memcpy of
    device_tree_flattened) is created and updated with overlay nodes. This
    updated fdt is further unflattened to a dt_host_new. Next, we need to find
    the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
    and add the nodes as child under their parent in the dt_host. Thus we need
    this function to search for node in different unflattened device trees.

Also, make dt_find_node_by_path() static inline.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

---
Changes from v10:
    Fix commit message with right function name.
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


