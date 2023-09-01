Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E0978F7D5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:11:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594260.927548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwR3-00019f-77; Fri, 01 Sep 2023 05:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594260.927548; Fri, 01 Sep 2023 05:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwR3-00016n-41; Fri, 01 Sep 2023 05:11:09 +0000
Received: by outflank-mailman (input) for mailman id 594260;
 Fri, 01 Sep 2023 05:11:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGY-0001Hn-6H
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:18 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eab::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7032be93-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:16 +0200 (CEST)
Received: from CY5PR15CA0006.namprd15.prod.outlook.com (2603:10b6:930:14::9)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 05:00:13 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:14:cafe::fb) by CY5PR15CA0006.outlook.office365.com
 (2603:10b6:930:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 05:00:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:09 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:09 -0500
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
X-Inumbo-ID: 7032be93-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K89iQoFiEFSf0bqsEWd6uzDbDH/mfon3zokUzk7FcE5tydUT7CV2KTJCCNIoRxdh+biJMEworTi+m6W8DMbAuPmvOqyzTu0dUFssyIDTseJEoxNXoOBNfj5N4KQaNnpWGRkl57bGjDR6EDUI94FHEw5xc4ZPyB9ZxQDz/mOLD4nF+tw596aYs+vOE0g8ufwuky6IMGkSPLco6pIrH+JQ0wkV3eVpoFESilzvVKf5L7a1AklSyk/1Zb4CaF8SXCRrcQIS665uj2TDW6JfpbZaeoVDAEeeErRs7xC7bIT0T0YYGs69HqLe4f/82bFxf6ykuLJdiqnvTJ5KZMMM+bPmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIgawtLTJDYclMTRziV6+ukrPXqF+ozH3iEpHoQmI6c=;
 b=Z/w6AMB1A8+3B8OzZy71juf5K2/KzMsJm9oYqLZ8O+L/oDZlG/7sShD2Wly+C+W7nuVyrJB3wAnVKTLGwTS++aETrA5w3qsgPV1/iRSEPpHX1u7kKXGxWmnyoAaNiREsnRaXNibnbvsYr9CjmQoItBgHvGD9O/DMvR6X4gGAdanfxCsAgmsULkopBmuhGAqBR4CgFtSkSZ1KSMGc7LLKN6Ink75Zni3RQt2gpptQs5dutGrgkX3nSfV3BINO1VmBhC6dDPvlcPrvFAIW05+lTJKyjNs1eI0zyT7WkzPNFYLGaqWfzve/0iQLLUM3Rd/kImKWRxAQyIFPfAYc99K1kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIgawtLTJDYclMTRziV6+ukrPXqF+ozH3iEpHoQmI6c=;
 b=27/PiAWhzMgPwauVdDVn7zfLiIo9Cv5Q9YNhIqBX4P8uZFZFKP7QtkREDNRvBidQewuifvZ8K75ZbhALEWJp0tQ8pw/n4s7SzIt6layvuNh6MxijnTSjGpjP6IBy5OedqvPGnSl2WBPQDdTiRhpDFgkiIuZY94Ns+0/OlkcpsYI=
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
Subject: [XEN][PATCH v11 08/20] xen/device-tree: Add dt_find_node_by_path_from() to find nodes in device tree
Date: Thu, 31 Aug 2023 21:59:35 -0700
Message-ID: <20230901045947.32351-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0c34c5-a605-4f58-26ca-08dbaaa85346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zc79sxi8OJuMpM/rX1j8GrYByhB1hj7WWoCMsp3RbOOX+bXhThN4pjrApz2IjjympqCdghaJxB0egtrbY71LAWbka010sSJXdvckhG3Fo+XMXUTeaUOJR4ukFPXRrlGR4Bzzb7WL+5cknsH1imujtNJZnQHZceqd9eoK1Yzg1+rw1Cppiw6FGYE/PTfDOvpeLFDNZimyDTmqbqDLjWQvyYqV01MEyhpAcmw16FwazGgcWWwrt314tp+MNhkaX1L0INyw5PVYV78QyOoyHJKvppO3JlND9pWsO3ISLg23ojUPlpkTIogTbct2apIMBaalntVxNa2YM2SJ/d4eAcbT5wcgDPpkZ73PkWXjcFfsoySxNBJfTsVXaJFXluk9Vt9QmptG+NTmzZ0PR+IsWicRnfrW1yf3wpYVhdkccPaIom2I8LQVJmJ7anaCJqy49jmB6BFX0P3WTBB61Mlgi5Kr5XvPHqXFgn1TYI+SPdyUeXa2QJ5gb+0d/yDprTN7fg6X9LJTQ9P27r60Sw4U0HGDnI7EfEKQYG4tMAN+3eiG4RSDkBdRG3LlaX7+SzjLwwV2OKcVSAMuJeye5SPp24o59TeWIqYjcOlmKCGgxGolzGfCUvM4F53Mkulri+3ufp44wpmAm4MpDCAuehb+FA5DGYcBr8mBv0vXam7F5gZ9Jt+jvyfkioKcvNZyr02k0S3aWSr3+naRLSrYW4ahcETsjlKUIzkzX/1jwMWINYHFtqu98+AjGafcVxwB+QFQQwmVVe37imDXkDI8vmp43vfPlvRhLOxUMVujO+YFm9TEkMk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(82310400011)(186009)(1800799009)(451199024)(40470700004)(46966006)(36840700001)(40480700001)(82740400003)(36756003)(41300700001)(336012)(426003)(26005)(1076003)(40460700003)(54906003)(356005)(70586007)(70206006)(81166007)(83380400001)(316002)(6916009)(478600001)(6666004)(2906002)(5660300002)(86362001)(44832011)(8936002)(2616005)(36860700001)(8676002)(47076005)(4326008)(37363002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:12.9672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0c34c5-a605-4f58-26ca-08dbaaa85346
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719

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


