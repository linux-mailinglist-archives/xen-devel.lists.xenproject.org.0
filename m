Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941EE6453F1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455912.713581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nod-0000Pn-2l; Wed, 07 Dec 2022 06:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455912.713581; Wed, 07 Dec 2022 06:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2noc-0000Ma-W7; Wed, 07 Dec 2022 06:21:58 +0000
Received: by outflank-mailman (input) for mailman id 455912;
 Wed, 07 Dec 2022 06:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2njr-0007Hl-7e
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:17:03 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2e756e5-75f6-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 07:17:02 +0100 (CET)
Received: from DS7PR03CA0289.namprd03.prod.outlook.com (2603:10b6:5:3ad::24)
 by DM4PR12MB5216.namprd12.prod.outlook.com (2603:10b6:5:398::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Wed, 7 Dec
 2022 06:16:59 +0000
Received: from DS1PEPF0000E654.namprd02.prod.outlook.com
 (2603:10b6:5:3ad:cafe::71) by DS7PR03CA0289.outlook.office365.com
 (2603:10b6:5:3ad::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:16:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E654.mail.protection.outlook.com (10.167.18.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Wed, 7 Dec 2022 06:16:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:16:57 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:16:45 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:16:45 -0600
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
X-Inumbo-ID: c2e756e5-75f6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpy825VLUYfE4H2lD6b/aQbb32tWiSlUvcJakqRcQOAqQ3Q3AAibepNS38zp9iob2pkpjaDohtZi0EVKcQ5wg5QO69RYpQEpY9TwxXbZH15WR8kz8Q8tF0uNb/FQrfAD4Np8tTmG9L/ki+1RaaQ5LCaZJvYdmOVlURrjyeDUzrxh5bmsdsdjZfyfhsUhWZ7yaCYOwOscqHbX7YS9q4nFBCXUhC4gyy2eDfkd/MjZuviofeqcY+bZaC74Ic+0P9iiJYzQr9c9cVg+H0C9fIQTOa2x+jcJToFoiJTewsms/p+U9cgSNRzE/OBjAOjrng1Wqk8LcGVlRNLU2fCgUW0fmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLhSLOJ5pm1JyR9SwI48LW3Gv+ml3wGq6nn4glAMwVw=;
 b=mZdyUSw+gduU+S4Bmklwp/3OCIq7d1m3l+82Ct/ZJ7QQfyCdyq4uXPytuv5iXdTY4kYsygJVyM+/z8cNRnxsKW//bj/b1Onj9HKTZdGIkrEKO1lkD87El76izF2csDpHZelOE+lSw4vxxHmGx8JOqIljB4hJNjQN82ReTrX1TlieZjvkMWXnWZomciUFGmBVyrMY4t93Z5+O5Q1wfiEGghSpcF69u8RqbozTcP6qPdUayAGhXTsFuvxww4/Tn9WmRDHyEatx9UVmn0WBnIo/zxjLSb6k0hO2WgEkwZUA36tTGvkTweEm45PNnSgmsiwTrxmyY25X2QxmiHdxQmdGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLhSLOJ5pm1JyR9SwI48LW3Gv+ml3wGq6nn4glAMwVw=;
 b=48DgmdHw/fs9ymW0IwuKa93kAS655+wM/S2taaiOWOQmDvH2JvvTVOomumVONakYO5UrVqblD0q5x6WtROOa2zDs7/Hg9N9LCydJbionWQd0BMHKOMxN0cmG+U/q77XyvxSyDZC8JPxJXKGYwH8u5h4FtVPzSBm22ycP8wRa3Ek=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>
Subject: [XEN][RFC PATCH v4 05/16] xen/device-tree: Add _dt_find_node_by_path() to find nodes in device tree
Date: Tue, 6 Dec 2022 22:15:26 -0800
Message-ID: <20221207061537.7266-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061537.7266-1-vikram.garhwal@amd.com>
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E654:EE_|DM4PR12MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b5055bc-cb43-4343-a874-08dad81aa5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MshKseY3RAeYO9mGzT4vjUU/v2dV7DarewLsM++3JkgY60D2EMjI0aZvl6kZlEWkVbyanuozXyiJtBogz8hmFoVgAQYNgcoVvwt0RjY7TNk6SbUZy+GOmfqnMf2Z/6hi30PLacuEO7AQgeWLIlhw4PgZjr17qavT4UHIRdbNWMR2som63cEnqoyEHL4UIRljQLtR90QMqD6YgGXIQs4o151PmJAr3aGCjvGL4scWLdtD9GLbXMZvhRjLjsA/O5fJtEx7/KWga6JiRKKOzrXttTVyy0iNMQwia1DyrsFUwcBNVVenGHGu/N9XmIxM6BKL14ns/s1dTFk5BnKQkBZ0KsWTOob0OMMcG8gSYHqaX8UWTzc3xXtApgdOCPSiRGvdTpU9w4k+OvkYRHVy5GA4Ik6MOMNzBdvSAL/AHDIvrfGa9nLn+UxYWaYYb/YpQCdjyoPBwJDH2PDX8pz59NqxcU1gjyTG68j9CUJzP78JTmKQO5rO5mSwYXLRXX6hgwfhKSGLechjJVIu5HOe/fVbKfIli3Tv8vpb/+jEDaqLdjtflBm0s/60mt6q0XQFVsfis5q91SIx2oSdDBxaRI3ziqe7O3ro+C7yogSo1l72t+Do5KSEaYtboFXyXEWlSlA74ybeBBpFjoeINGMbzdb2ydFFUk9AXmTKzyyXCQLnuY1VtNGFDXIAmL+eWJxUXh66iIbjYW3UEFbZZ5u0YNrrohqEOsqGdKnN2AQ0HCO/Eibr0O8xEEgVB4W0aUSxB9MdSV1MPqO0sQUpRrZ0HMLqMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(8936002)(4326008)(356005)(82310400005)(8676002)(5660300002)(41300700001)(82740400003)(81166007)(44832011)(6916009)(36756003)(316002)(36860700001)(2906002)(26005)(83380400001)(70586007)(70206006)(40460700003)(6666004)(1076003)(54906003)(40480700001)(478600001)(186003)(2616005)(336012)(47076005)(426003)(86362001)(37363002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:16:58.9777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5055bc-cb43-4343-a874-08dad81aa5ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E654.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5216

Add _dt_find_by_path() to find a matching node with path for a dt_device_node.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/device_tree.c      |  5 +++--
 xen/include/xen/device_tree.h | 16 ++++++++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 6518eff9b0..acf26a411d 100644
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
index bde46d7120..51e251b0b4 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -537,13 +537,25 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
 struct dt_device_node *dt_find_node_by_alias(const char *alias);
 
 /**
- * dt_find_node_by_path - Find a node matching a full DT path
+ * device_tree_find_node_by_path - Find a node matching a full DT path
+ * @dt_node: The device tree to search
  * @path: The full path to match
  *
  * Returns a node pointer.
  */
-struct dt_device_node *dt_find_node_by_path(const char *path);
+struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
+                                                     const char *path);
 
+/**
+ * dt_find_node_by_path - Find a node matching a full DT path
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


