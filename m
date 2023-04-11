Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217856DE497
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519772.806767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUM-0005bO-5i; Tue, 11 Apr 2023 19:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519772.806767; Tue, 11 Apr 2023 19:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUL-0005Si-Mr; Tue, 11 Apr 2023 19:17:09 +0000
Received: by outflank-mailman (input) for mailman id 519772;
 Tue, 11 Apr 2023 19:17:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUJ-0004Ta-L8
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:07 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eab::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7205330f-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:06 +0200 (CEST)
Received: from MW3PR05CA0006.namprd05.prod.outlook.com (2603:10b6:303:2b::11)
 by DM4PR12MB5357.namprd12.prod.outlook.com (2603:10b6:5:39b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:03 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::94) by MW3PR05CA0006.outlook.office365.com
 (2603:10b6:303:2b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:02 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:16:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:16:58 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:16:58 -0500
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
X-Inumbo-ID: 7205330f-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSIe8IWtkogZDuJROEuyEa4L5qtz0r0ub7oLaSfO1oYNN6uZkXy/AYkEa3PeoOYonr9wYRQt+vHxHp+g/sYWlxHPL5FypP2L333pRjkvdOHBFru51nKqqPmtHjUq8o8GrG5y8yDBLzH8tnluod1ewfCDKM4wcoGOPGGStdCZjVWAwUNmZr5A9t2PuUIYrZjRaoSZUWNZTqyMP+OYSaGEH1hCgOgsJ3vJs2EyLcRAlUvGXsMRB0pozooPmglFCVbN34KWvZrvQUmwLSVu0nZ1ELhtlGW0nNHvKq6OCci9womzrMTovnYOKR2qZWd8RrqKtlTmvon+x8XhFJpGe+Fl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPRvr0PydrbevxDRuC5bBe8hAAj8BLWppbzz+G6AD20=;
 b=Q6QuNO/MJsxQ0Mfgmqv9Fc2TTQvDV0zliZG80oSqKGwzzpfT9J7UZ2FuPaiYfXU/qiOYHT7fHQP1t/QBxkf012+VIOerMfB3Dt6nDxwpI6myg11MXW+FBGeex1p/gIZzfUq33QTMvrNskEHqisXKNHnCX7jcmrseAw5RwEvaEafIOJ2EThr5w/RXlVXFLxiGBqOtb8NJBRHVXwuxBkFFg/2byl1vVO1ABs4TYzz0/3GqkGZZEFmVOoH2X8bA4bhzAOBAwZicx47pyOkjCng0OPhHTyoKK5D2zLgqyQj2e2lwqaorRkw+Gg9QI3UT3rfGtJroT25tHoWNkBIhp7696Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPRvr0PydrbevxDRuC5bBe8hAAj8BLWppbzz+G6AD20=;
 b=KDu9AlO4fQb4RnMxIBoAkLNp+pI1dLaayOR4hzEGfRdnkwnBMysAjR/rLTC3LnlSxfeTfOoBcgV7J2cmTTfYIMihNqqMdDt0ekAxFiY2Rvo00w9cwKWP85ONIYg9S2Q4lQM+yFt67X9yvcEUyhncpYclWgTkKAv6Gp/j6YjnUoc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>
Subject: [XEN][PATCH v5 06/17] xen/device-tree: Add device_tree_find_node_by_path() to find nodes in device tree
Date: Tue, 11 Apr 2023 12:16:07 -0700
Message-ID: <20230411191636.26926-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|DM4PR12MB5357:EE_
X-MS-Office365-Filtering-Correlation-Id: 92748e6e-4e36-4f2d-f5b0-08db3ac154cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	POXz1WG1hmvtmv5RRF+iVjz+L8Z++hE0T36YgoND+tvNfXU/Rd6SPUicT57Mcps7aDrp6/TmvJJRrlH6FadTG1hn4VFTdykLIM4JnRdvcd1mf/i1lRmcPBSrHMP+Im8G8qLaN7BXyrxnrrH/yOOwAzOpRDrG8IOa12/TZkyjJadsajlTtO4WDHpR8O+nVF+NkYSTWfDzv7AqcPsvh9r3KCDIzHfBFurWQ6Kz3waGiXRtZtGZ8BDRDJ+Ehde4oNdx/Jhh5iuIEPauPu6juAmCzj6Jw07AJ4Bo6qvTPRfHt7AM6yIxi7U6+vVNDzyVZGYtuxhRP/MyQKl5wdkGY3Y/U/dGmoxFNMyNVRvKaL69tpU+m9J7iGTxkbbs+O/EIboBocgQrs2YE6q3MMpNR0pAw3av7s45/S2QnBRJgvfcYOxuvoT31hUUewjypoQ2OI+Ce+RbA6xziFmiOaE0XOWv5buUBnwRohqZZkALRJRtuUKYsDDDKs539xqAA86hV2ihzXiQzSAkL7GWAaMm5RBxEH96prsa3Ha9XE4D67wF6GK6vkDkzuLGzurXbz4rw7Q2wMTZdaihTT04kxLSPbswtunugHmQQB/eKBcU1LZr2dwByFx+JEfIIXiRF3SOmnEwaDeqK6nwrGqe0tmJoYnQ+rsI+rCoLcosJVnzaOchF7EnmLYwRMMP9ENiQhoAfopd2dzm2C63Ud1EGkJKAnjkzZXwSKT5coSqN2lJ962XuiXWU7p/NRVEOg94z+CrKbPrKEUI1p+5Ot9Zk6tZkaCHLg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(4326008)(478600001)(6916009)(54906003)(8676002)(70206006)(41300700001)(70586007)(316002)(86362001)(36756003)(83380400001)(426003)(2616005)(336012)(26005)(1076003)(6666004)(2906002)(8936002)(44832011)(40480700001)(5660300002)(82310400005)(36860700001)(82740400003)(356005)(186003)(81166007)(47076005)(37363002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:02.7468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92748e6e-4e36-4f2d-f5b0-08db3ac154cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5357

Add device_tree_find_node_by_path() to find a matching node with path for a
dt_device_node.

Reason behind this function:
    Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
    device_tree_flattened) is created and updated with overlay nodes. This
    updated fdt is further unflattened to a dt_host_new. Next, we need to find
    the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
    and add the nodes as child under their parent in the dt_host. Thus we need
    this function to search for node in different unflattened device trees.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/device_tree.c      |  5 +++--
 xen/include/xen/device_tree.h | 17 +++++++++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index bf847b2584..507b4ac5b6 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -358,11 +358,12 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
     return np;
 }
 
-struct dt_device_node *dt_find_node_by_path(const char *path)
+struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
+                                                     const char *path)
 {
     struct dt_device_node *np;
 
-    dt_for_each_device_node(dt_host, np)
+    dt_for_each_device_node(dt, np)
         if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
             break;
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 58ac12abe3..998f972ebc 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -534,13 +534,26 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
 struct dt_device_node *dt_find_node_by_alias(const char *alias);
 
 /**
- * dt_find_node_by_path - Find a node matching a full DT path
+ * device_tree_find_node_by_path - Generic function to find a node matching the
+ * full DT path for any given unflatten device tree
+ * @dt_node: The device tree to search
  * @path: The full path to match
  *
  * Returns a node pointer.
  */
-struct dt_device_node *dt_find_node_by_path(const char *path);
+struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
+                                                     const char *path);
 
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


