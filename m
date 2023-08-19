Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAFE78160C
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586696.917995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qC-0003QX-S7; Sat, 19 Aug 2023 00:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586696.917995; Sat, 19 Aug 2023 00:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qC-0003OC-Ls; Sat, 19 Aug 2023 00:29:20 +0000
Received: by outflank-mailman (input) for mailman id 586696;
 Sat, 19 Aug 2023 00:29:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9q8-0001hl-UU
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:16 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d0657cd-3e27-11ee-9b0c-b553b5be7939;
 Sat, 19 Aug 2023 02:29:15 +0200 (CEST)
Received: from DM6PR13CA0060.namprd13.prod.outlook.com (2603:10b6:5:134::37)
 by DM4PR12MB5309.namprd12.prod.outlook.com (2603:10b6:5:390::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sat, 19 Aug
 2023 00:29:11 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:5:134:cafe::42) by DM6PR13CA0060.outlook.office365.com
 (2603:10b6:5:134::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:10 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 17:29:09 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:09 -0500
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
X-Inumbo-ID: 6d0657cd-3e27-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oo4HcIUXF+TaquVh8VxBPbRKxYU7FFR5iQM1GDufFU22UHyQIUazIwsmSks4tW9PoKYLHoqgJI3uO9ayf5eo9iYxlk0UwTv+wp5Dy7B0DpRKYMKK50lo6q/BHNxg97cs6V+XEFTJH/K0dRYLtkONfRCAxAiVzJJQuYcOa4xpacHWe3hoPLJ36TlT+2WeL2CEmPNCjMDsFgA+bAxMi7awu2UKLEzl/j2gL/woR8tMlK+TSe1vuP3u8dPyDyxgPCDlXJhFYtn0wHx8V7lugjlZPHDgSDFHHeCluP076wwNLN0vjSnoOHPwJfZYIBQMuK8aiuJ5Erzi0UG6p1qb1FwFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xHkFrH8SopbUhm47gT/XcnanhxswGsDSx0kdqePZ4A=;
 b=S7kSc7AkXGRu3zboOXJuXnY8zXz9XvjcQwVqbauTDN34RJWZcXxKxb3nt9QnkyWg15SRjXDeuB3DuuXRTAMg9Fk1IroP4T+/sqwFQQMX2epF66O4RGll8JuDx7JWrxmmcPGTXnftjcWUtD+0y95mAQrIW9fBIjx0IiqiKVdAeS2UNhIc10yqwc08FrGdeVYBCROSRjtgc9UgToDPOvm4DWgJJiFewrRlYh1ZSxrw2DPoezJ1v1cUc8l45XAIDMKcIJLZfYDoZXPCmngxSQ5SyvjFpVkeW2F2zHcmNI3T3+MStum9uhFrWRi0vCtHMbFk8UooZM4HpOOIxjgDWnpaKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xHkFrH8SopbUhm47gT/XcnanhxswGsDSx0kdqePZ4A=;
 b=tbzc7hREMNnwzpS+kz/+e7f7DvW/LWsZHh90rz37Hf4ua+Fn7TKq9BOOl0s8HCz/xHR4kizoum8LhqQpteeN9AO+9QTbae3VEIJ/4dyNksby4Ouk8BSIWiYFLVfKdpldh482LFlnx7STcDEtJUbZ5Hz5FeuK/r8m0OMMrmS+nOo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v9 08/19] xen/device-tree: Add device_tree_find_node_by_path() to find nodes in device tree
Date: Fri, 18 Aug 2023 17:28:39 -0700
Message-ID: <20230819002850.32349-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|DM4PR12MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: f3039e27-d511-4e7d-6017-08dba04b4ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PQq/d55qwhy762VdxqtL3NgfXmZAb+cQWi958KinuveXgOqNEByqr/BZtTegQQBljC2cQCwKIQmZOWFZPPSX83nLenjWsb0SAytptHXBXAcNNMvTG0G7xDUekSit6GpdCuBaCMj50oJaL8tjzoUq6EIg2t5A0CjsqQxfF6HuilWruRoeKg46w/hbeR6VZ6uNqNbVgjaqQGas6OTUgbzSg26HW2HRJCfq2SjqiYXcOvBZy01d3zeXt7R/vVcc4ZoSUVjKyzcuFZ6fxGRCF5ddDtHJo8xlmhMkOB0sGlfZAP1nrpVriwESmgi+JqiMZxXAhewntR5HTMOWdEQFUH69hNXEULj+gsZG9/6zsyUYmpboGQxdC5g0sVlUO2FZIhXVOyMF1EAbOe7QvxIZVrBiDKb+2p4TMwQMSa/rci5Ey5rv8C2IBRuIo0wyB1o8IhD6HPavZ3vuBvBUMIqC5ACxREbtqk6mFvPSWN7RhjUTbHNCjv0wpchlkObziXsw6mtYkLE99cKxztEdt4vrELuvmzpRwmF/GCCOhAu4E7OhYWusCkFkSE5Ci3tiHzNTgysxVXh3nR6zjCahl6+BUzaxH/wyiS1szdl+j5zkbbIKzJyTcVR5a3IO2QpSzBmS1C/Qg101Yn6uy7KhNsnXmd20qF07nrNkMXWNs/NPJtmLQSZ4l4UcSMLtanG2RDI150C5xqGttnYK5ghbUvnDKJB4v850T6erR73dGq7ki96gt3XnfLI80+6tckbJJIdZQbmJDoXWQNBh8y1QYg8EIjaJxFB3qxYj3VTIbiWoKW45oPk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(6666004)(40460700003)(36860700001)(426003)(336012)(40480700001)(1076003)(83380400001)(36756003)(47076005)(81166007)(356005)(82740400003)(26005)(2616005)(316002)(2906002)(6916009)(54906003)(41300700001)(70206006)(70586007)(86362001)(5660300002)(44832011)(8676002)(8936002)(4326008)(478600001)(37363002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:10.7717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3039e27-d511-4e7d-6017-08dba04b4ed5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5309

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
Changes from v7:
    Rename device_tree_find_node_by_path() to dt_find_node_by_path_from().
    Fix indentation.
---
---
 xen/common/device_tree.c      |  5 +++--
 xen/include/xen/device_tree.h | 18 ++++++++++++++++--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 67e9b6de3e..0f10037745 100644
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
index 5941599eff..e507658b23 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -568,13 +568,27 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
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
+struct dt_device_node *
+                    dt_find_node_by_path_from(struct dt_device_node *from,
+                                                  const char *path);
 
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


