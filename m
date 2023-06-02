Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF5971F74B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542789.847086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syQ-0001Jp-Ft; Fri, 02 Jun 2023 00:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542789.847086; Fri, 02 Jun 2023 00:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syQ-0001HE-9O; Fri, 02 Jun 2023 00:48:58 +0000
Received: by outflank-mailman (input) for mailman id 542789;
 Fri, 02 Jun 2023 00:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syO-0000if-FO
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:48:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40386ace-00df-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 02:48:55 +0200 (CEST)
Received: from MW4PR04CA0053.namprd04.prod.outlook.com (2603:10b6:303:6a::28)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 00:48:52 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::69) by MW4PR04CA0053.outlook.office365.com
 (2603:10b6:303:6a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:52 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:51 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:51 -0500
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
X-Inumbo-ID: 40386ace-00df-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U11Fk2KsMWo+2lPhDY3uk8uCFVOius0ag6npTVCUO6xaQlpIMA16caiJetPB6TWUJW4QuMSRHD+JixfLjGkJ3P7l0keSvCEfC7HrJ3TEYgV/CsL+MlaT7vJnh/OULoeMxlhAucPDT151OT9lE1GfXbb1vt0HpTkliKVuw9N1NHqF4JL+M4x4MJLuKQG013wrO/N14IlVpAp9CK5WxQZug8LBYK0l5eX2sdXA9oMAm+ZgSRNehZSYqWmSWcStmEjv0JhtHsg8nvtM2c4fZzGnxVX7j4x43+280/wLJfEodtlT5ronu8Ff1jFoCxqBPzoGSWJbFi+MD2un+74mce5/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBFUC7bBO53GfeOJbg8EGgk2RkSd5j7Jb685AIjqUEE=;
 b=Rz8eoGSljynJbzelfqgzuA+n6xhqXDeeSYxNXAl43vLNBE19ZrHsPqnn1on7CtRoAAwGb9CDXsrBsPs1BVRArnxjelRbnWGHEcb0u0c0Xf0hhG7Sin+6I8HszWgUM81H7o5P6G4Iyw/1X7WSF9B85IOSXqjyCWi003++i+ftV6pn9QmJw4FZyTAZ8hIGOr8dXmwLZ3c0KIYhT1QQKY4bDnQ3CFo00h8jp1IbsC2DCkaROBq4wuCvaNFBJmC2TnpS/jzT5n6nJhDvU3lsU+EMzpvml6E9O4wz0wfq/zlYwifUE5wJdYS0+tEThIwtr3AM54GVnB6VRWiJ3pjJe3Bn9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBFUC7bBO53GfeOJbg8EGgk2RkSd5j7Jb685AIjqUEE=;
 b=lihDbixGeS3gsx7i09AqY2b5fcCJeEStvF9p+8oqaa1kWratGo//P8rPjRbx9UPcfBkpuuQLwFT5gndSrRGB5/L1eWijftnnomxnwTLDVp5+B6hMNcDfqJWj1HU1IZri1f97ywNIPTV33BBxRPTskVJDIMjIjWNfq647LGPorp4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v7 08/19] xen/device-tree: Add device_tree_find_node_by_path() to find nodes in device tree
Date: Thu, 1 Jun 2023 17:48:13 -0700
Message-ID: <20230602004824.20731-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|IA0PR12MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: bb67910d-c2c0-4766-9edc-08db63032312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Efkh05TJGh+0BR4M5S+17dbeAuR5r3XtOlHBXKsDvg2DvwMC8IvjkpjQk0wIu+vougJTc8/68n+2cc5QjJo7TElMae578b5LN0j1WYpqCAz6SrOlKERD9YFayQ9PJnu9NALcYuEJF4XJOKIHvw7pKeoeZ3v75WV6e2GNkY15xvorsELUJG4E4v21hNPnYTAtAqcJc3sPjK1GsCD69LeJUal3fjYjvQT0xZrQkgwUWB9CKoZCFsfEHVGaP4Xa4ITo6E/YCZESUdtrR5KPheOHWCnmIUdmSwmpdzSN9CNSS09Mw5y7AODrs3lNLotIyeS+q3EG1PhElf4TQN/YVv2OKO3r+zVViSdz82VDSSjmI1+v6GvzroBVIS1O0Ud7YaFSyUKm3L2jcB1cR2DOnkYMCcSyT58xPuwmdPiwF1nR+/tEfEBqdKeRTsrJdUwyJF9pSuU/XCb6LhBKwU7I0FC2jNprV/zpXdGVyzWOjb4iTv6TEoRU/ZFEK05A/Wr07yg3lEbsigH5wECdUqygymng3MU3KY8aC6y7A4LxlDRsy2l8Ui+bmkpUzFi8PWgjk2fctmAoGlfUd7SBqSUVV2ObpdcTwGH0qbrphk6Bh/wruZDy3RyjKqo9HIt6ILVRSCmYxeExu4ODooFfAFjGzMGORBPFSWkyX1YljI1L8muu73p4+KIZJfosrtmqc7/Y918v1eBYzc5p3Ev8yXgihprGMXWY3tE84S8T3HAUWPsu/LrdozJWzY0bOPz18o3mWZyAJPWSRAG0ZWh5+fGYxvP7eL2zgANC8IkF/9vEoLMJHVU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(1076003)(186003)(26005)(6666004)(47076005)(36860700001)(2616005)(83380400001)(41300700001)(336012)(426003)(316002)(2906002)(44832011)(5660300002)(8936002)(8676002)(478600001)(70206006)(70586007)(6916009)(54906003)(86362001)(40480700001)(36756003)(4326008)(82740400003)(81166007)(82310400005)(356005)(37363002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:52.5969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb67910d-c2c0-4766-9edc-08db63032312
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352

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
Changes from v6:
    Rename "dt_node" to "from"
---
 xen/common/device_tree.c      |  6 ++++--
 xen/include/xen/device_tree.h | 18 ++++++++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 16b4b4e946..c5250a1644 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -358,11 +358,13 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
     return np;
 }
 
-struct dt_device_node *dt_find_node_by_path(const char *path)
+struct dt_device_node *
+                    device_tree_find_node_by_path(struct dt_device_node *from,
+                                                  const char *path)
 {
     struct dt_device_node *np;
 
-    dt_for_each_device_node(dt_host, np)
+    dt_for_each_device_node(from, np)
         if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
             break;
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 2c35c0d391..e239f7de26 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -561,13 +561,27 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
 struct dt_device_node *dt_find_node_by_alias(const char *alias);
 
 /**
- * dt_find_node_by_path - Find a node matching a full DT path
+ * device_tree_find_node_by_path - Generic function to find a node matching the
+ * full DT path for any given unflatten device tree
+ * @from: The device tree node to start searching from
  * @path: The full path to match
  *
  * Returns a node pointer.
  */
-struct dt_device_node *dt_find_node_by_path(const char *path);
+struct dt_device_node *
+                    device_tree_find_node_by_path(struct dt_device_node *from,
+                                                  const char *path);
 
+/**
+ * dt_find_node_by_path - Find a node matching a full DT path in dt_host
+ * @path: The full path to match
+ *
+ * Returns a node pointer.
+ */
+static inline struct dt_device_node *dt_find_node_by_path(const char *path)
+{
+    return device_tree_find_node_by_path(dt_host, path);
+}
 
 /**
  * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
-- 
2.17.1


