Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D36453E7
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:18:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455855.713516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlW-00031Y-1B; Wed, 07 Dec 2022 06:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455855.713516; Wed, 07 Dec 2022 06:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlV-0002yL-TG; Wed, 07 Dec 2022 06:18:45 +0000
Received: by outflank-mailman (input) for mailman id 455855;
 Wed, 07 Dec 2022 06:18:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nlU-0001rE-AA
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:18:44 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fefb935c-75f6-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 07:18:43 +0100 (CET)
Received: from DS7PR03CA0315.namprd03.prod.outlook.com (2603:10b6:8:2b::10) by
 LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:18:39 +0000
Received: from DS1PEPF0000E654.namprd02.prod.outlook.com
 (2603:10b6:8:2b:cafe::8c) by DS7PR03CA0315.outlook.office365.com
 (2603:10b6:8:2b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:18:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E654.mail.protection.outlook.com (10.167.18.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Wed, 7 Dec 2022 06:18:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:34 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:18:33 -0600
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
X-Inumbo-ID: fefb935c-75f6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jj0Lw93vBrmJv1JDJ/ATBpJAjMfpQBXXfYddtM+oTlePkqhEzM2P2P8vXKHweoVdNyPVrgl5HHpKIvE6oVRcdVdVsUgz75x+KK6yf6nF8IWJf0KUjaa0OeX2xRQfJpPilISnU9vu5XOSIGrUxwrKkHzua3XbyfQDAP6u994zMS4CJoAKMj2yhAR1y76utetYv2ofrQwd7f2vFc0OKqMTxYt3Ov0ovxIAJfPuIDYn7QRRSlPHM/1GIDsBHb8Bx/ap4urSz8WyS40Ve3lAz+L95a2q9+m4Krzm1HAig0ZXY9jMiNrWOCXzCl0oeE9pqCkb98iOrnOmAH71t2gOddXv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ti07e7HwAD9XqBya0RpIypdK+xP18bQKOLyxyXTyac=;
 b=U2rIoRkqre6KI2ht5G3fjCozSmiXPFkqEqy5Wr2f+/1kcXv/0UAZ6vh99PGoxmLfaVwog7ofstHnM71zyvUrTgJx3Re8OdKRX0/9ZbvlYfhnSYVQr9WvWqS4vUM5oDC4QLygJXcUNjdXokuguEbqmWofbZ1M3MBu8cfqFTS/JDVQ/CkL092GIrtAczQdjlj9UpCleLXIsMJPoGNBaJqgQ136AlCfcMeM1u//zuWX3QCrIEUefM6jMMIxyKIauaiuxIKmV8n/vyECsblLERIx20PJyMZPvd6Miehfnzn4J9POyzFLsKzsTZwAfEOQ/RFLGJEuoSRSSH2LqGWb6bMyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ti07e7HwAD9XqBya0RpIypdK+xP18bQKOLyxyXTyac=;
 b=ESSXY+RZ/KveE4VcWx/gEfYn3COpB7cOLPvWU+nkj0Q0unBH87gn19VZHvgUiO7+achjTCTKr4zj/w/zdSeHMb10Fmh5X5yiiarRutlceRCi6XKvnZe0D8YAplClYPO1DPNp9ak79cl7aG+mqorfgq8buXpHfgsLF2R8YYeS3Ug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	<Luca.Fancellu@arm.com>
Subject: [XEN][RFC PATCH v4 11/16] common/device_tree: Add rwlock for dt_host
Date: Tue, 6 Dec 2022 22:18:10 -0800
Message-ID: <20221207061815.7404-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061815.7404-1-vikram.garhwal@amd.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E654:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb2441c-a59f-48b6-12ab-08dad81ae15d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1qb/anIJYWohn+XfNoKDoVRNnlQcPeXjA2zS5G3QxmRoaWTm/YN+XLcFBgvPNvF6D2ejTzgy76aykf1V7md55uUN473tn/YhVthPHf+VS8Zbyej0wUjhLKX245DriJ+eBFwdS2npHckfcovSnbnYALElUIFxpYod/MiTwIwHSDAZzU9l6yona4I+URQh+q7/KL0oWfioD0KBrYGTm4kHg9mH0c0XkrS2INGzs6v6i5CphmWqgyQu8zRM/ljxWeQR6bU3CQm7gysq8YgSchkDCb3LRD+vweakIRwa0mdGJihRt/aU98P94P00zQCUZXMAf5mqtucKdGE2wm5pxkwrftNX45FLnGU+k8Kt/XccOkaMlGMz7nQBOoos5TyJTZ3D16I4iWgM6XVzCOLBoqKlpwgdbVFPqYolVT+yvn9Ji0656obdTAj36+XWjQdRHgr0OfjUKDwQfy4dJv7QJ4XMyrJkF8vbasXx4zKN5XDG1S1dQ48tah8UzCWlWrkXPLwrPXW16JfBrnKe+BL6UfXZ5CrvsS6rygSBZlv7WDtK8KJvWLAMxdZW4yjDN9hcwxeQDmXmY5/rUwS/AX08VU0Hw5stnUHRUWbsDZTiP3cs3TlE4G0XL5vLI7aR36+HaoZv87VNbrtV5psMijW1t8WAlks8SjeEHumghkHu2a8mVjbtlWmvCL9Ege4Nfk5Y+OmotlTvAgkMDxrMuOx6C7RJ1Vrqi35HjJ8Z/g5SU8o1s7c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(86362001)(356005)(81166007)(8676002)(2906002)(70586007)(44832011)(8936002)(36860700001)(83380400001)(70206006)(316002)(4326008)(478600001)(2616005)(40460700003)(47076005)(336012)(426003)(186003)(6916009)(54906003)(1076003)(40480700001)(41300700001)(82740400003)(26005)(6666004)(5660300002)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:18:38.7131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb2441c-a59f-48b6-12ab-08dad81ae15d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E654.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941

 Dynamic programming ops will modify the dt_host and there might be other
 function which are browsing the dt_host at the same time. To avoid the race
 conditions, adding rwlock for browsing the dt_host.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/device_tree.c      | 27 +++++++++++++++++++++++++++
 xen/include/xen/device_tree.h |  6 ++++++
 2 files changed, 33 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index acf26a411d..51ee2a5edf 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -140,6 +140,8 @@ const struct dt_property *dt_find_property(const struct dt_device_node *np,
     if ( !np )
         return NULL;
 
+    read_lock(&dt_host->lock);
+
     for ( pp = np->properties; pp; pp = pp->next )
     {
         if ( dt_prop_cmp(pp->name, name) == 0 )
@@ -150,6 +152,7 @@ const struct dt_property *dt_find_property(const struct dt_device_node *np,
         }
     }
 
+    read_unlock(&dt_host->lock);
     return pp;
 }
 
@@ -336,11 +339,14 @@ struct dt_device_node *dt_find_node_by_name(struct dt_device_node *from,
     struct dt_device_node *np;
     struct dt_device_node *dt;
 
+    read_lock(&dt_host->lock);
+
     dt = from ? from->allnext : dt_host;
     dt_for_each_device_node(dt, np)
         if ( np->name && (dt_node_cmp(np->name, name) == 0) )
             break;
 
+    read_unlock(&dt_host->lock);
     return np;
 }
 
@@ -350,11 +356,14 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
     struct dt_device_node *np;
     struct dt_device_node *dt;
 
+    read_lock(&dt_host->lock);
+
     dt = from ? from->allnext : dt_host;
     dt_for_each_device_node(dt, np)
         if ( np->type && (dt_node_cmp(np->type, type) == 0) )
             break;
 
+    read_unlock(&dt_host->lock);
     return np;
 }
 
@@ -363,10 +372,13 @@ struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
 {
     struct dt_device_node *np;
 
+    read_lock(&dt_host->lock);
+
     dt_for_each_device_node(dt, np)
         if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
             break;
 
+    read_unlock(&dt_host->lock);
     return np;
 }
 
@@ -450,6 +462,8 @@ dt_find_compatible_node(struct dt_device_node *from,
     struct dt_device_node *np;
     struct dt_device_node *dt;
 
+    read_lock(&dt_host->lock);
+
     dt = from ? from->allnext : dt_host;
     dt_for_each_device_node(dt, np)
     {
@@ -460,6 +474,7 @@ dt_find_compatible_node(struct dt_device_node *from,
             break;
     }
 
+    read_unlock(&dt_host->lock);
     return np;
 }
 
@@ -470,13 +485,19 @@ dt_find_matching_node(struct dt_device_node *from,
     struct dt_device_node *np;
     struct dt_device_node *dt;
 
+    read_lock(&dt_host->lock);
+
     dt = from ? from->allnext : dt_host;
     dt_for_each_device_node(dt, np)
     {
         if ( dt_match_node(matches, np) )
+        {
+            read_unlock(&dt_host->lock);
             return np;
+        }
     }
 
+    read_unlock(&dt_host->lock);
     return NULL;
 }
 
@@ -1052,10 +1073,13 @@ struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
 {
     struct dt_device_node *np;
 
+    read_lock(&dt_host->lock);
+
     dt_for_each_device_node(dt_host, np)
         if ( np->phandle == handle )
             break;
 
+    read_unlock(&dt_host->lock);
     return np;
 }
 
@@ -2102,6 +2126,9 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
 
     dt_dprintk(" <- unflatten_device_tree()\n");
 
+    /* Init r/w lock for host device tree. */
+    rwlock_init(&dt_host->lock);
+
     return 0;
 }
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 51e251b0b4..bafc898f1c 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -18,6 +18,7 @@
 #include <xen/string.h>
 #include <xen/types.h>
 #include <xen/list.h>
+#include <xen/rwlock.h>
 
 #define DEVICE_TREE_MAX_DEPTH 16
 
@@ -106,6 +107,11 @@ struct dt_device_node {
     struct list_head domain_list;
 
     struct device dev;
+
+    /*
+     * Lock that protects r/w updates to unflattened device tree i.e. dt_host.
+     */
+    rwlock_t lock;
 };
 
 #define dt_to_dev(dt_node)  (&(dt_node)->dev)
-- 
2.17.1


