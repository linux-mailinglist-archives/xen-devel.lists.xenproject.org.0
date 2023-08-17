Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA08077EE69
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584990.915958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR3x-0003wY-PM; Thu, 17 Aug 2023 00:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584990.915958; Thu, 17 Aug 2023 00:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR3x-0003uF-L0; Thu, 17 Aug 2023 00:40:33 +0000
Received: by outflank-mailman (input) for mailman id 584990;
 Thu, 17 Aug 2023 00:40:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR3w-000280-3N
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:32 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9f20774-3c96-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 02:40:30 +0200 (CEST)
Received: from SA1P222CA0186.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::18)
 by IA1PR12MB8407.namprd12.prod.outlook.com (2603:10b6:208:3d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 00:40:25 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::9) by SA1P222CA0186.outlook.office365.com
 (2603:10b6:806:3c4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:20 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:20 -0500
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
X-Inumbo-ID: a9f20774-3c96-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUgeQqtLKpqUMaKcUUVK/m5G0qLHdHb5hCyoh/MSPm7uOgRMx0dTjwIcoswZfOz6GknHbNXoWajTl7L4b9IIQGqdwoHS0UMMxYIjMburJnNc+YUd0iN5U58X6lMCE48pYXgpv7eZEHc46VX/00etPcuiaBK/iYs8ndnsfIvJPO2pO43aLhdiQmtc3+z8ucjeuCdAWhISNaAwKo7yFBEa7QPR3hjAq5WbiWQdWzjZ98QpO+7S/Dn8MTU36HYNS06se+qHUC3NumtUWuCagDv+YVKvj7petjtKdye6+NxzLzEB054ZqNTkf9Vqmti68ZAvtbrsINGxFBNQfPpoVlXBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07WMr1ZLM39ba2ZtlvUhJ2PaUuqZrZEmQIHsuGgAwEE=;
 b=YW59k8W/p75EAsT/UUQCpfugnj+/IRCXAnPGJR8DSJ8nEOqczccL3w67AYu0UP9OJlUNvT/e3wgbRcu5ZlAMvHCyi81JJxVJzCjSD6GElInAt0QeX570qt1ZSXM2K53WknFS96GymmTKlQo9pDwGeoS9LxRkLYlfaOZBioYev++iHxCGFYH9/kVTWMhtefNsE/m4BRVCTaPZOzrWAv0CQY122ONPntiMegjPG3aE0HtTi8+l+s2zBn1Ibt/3j/GepEZpCPCDAPw+pc/YI21bvoH7BEO6GmBNc12KFpHqTI2u753fs3Nk3Z+M0skcdU88FWqYlCdSvdqebDj/KnaIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07WMr1ZLM39ba2ZtlvUhJ2PaUuqZrZEmQIHsuGgAwEE=;
 b=mgIaYGgf0NJ4g7TM5j45oR1uKGumw0RjW/FpwPGE+u1115UTbo+jbRQF3IwQEgbM2FLhqQujkdTGx5JCpfXa4m6YBn6vki+We5cbb0n1pd9sgFS/YoF4MdL4u+RjSk9xgjgrv0xK6QLdFLGacaapWsa0sWP5fFkFOFO8AbaHd4k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v8 04/19] common/device_tree: Export __unflatten_device_tree()
Date: Wed, 16 Aug 2023 17:39:32 -0700
Message-ID: <20230817003947.3849-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|IA1PR12MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 90022943-74ea-4a2d-3de1-08db9eba8b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q2zIDsyaueX1fclWx8qy6u/491zXb3HMKtyyJUb7MsBawcu48J3EwlIT23QwV11OZ1M2VRICP1AGrFh0Z8jjgVA6XNR7D5zWDzxQj+daXWuFE7ZSjYff9sj3zuNR6pell1kgMqc/Rq541XYEW16KrYv/VnMwRi2w2Tw4peTDuCc0h3Ml3AHNGTkMStumcJ/bKDIud07ouyk3/hwaf1sDIvRm/+pIozFmQwIoW5SHF+Ag8enr3hcnrCYmvY7R2OwqKWuZ6IfDyr6m4DLQfVvtEAkH0gzWcetlEBEZqVESLIw+sCdj/+1VzEoZ7SbWlx2BsFyf50lhC2zUAhh60OrHdFGxHhCpgVmvev+USQrzYt71kV6YdDhFUtFThvj03MpGosA0iwsHuMVhYQ7zgacUQ3ctBa1RDY8V0eyPZBT/71u2Ew/WYFJY/GIgnnXqSSQrmeTJ17v+XXmwmNrrJR9fw9/6ngwM4t5VTa6dYOhjL1rxR3vGrx5ohUG/znvJ/vnJXERdxFLb1jxnD/dCmEaPT0Bwdt5mczcXddfnXs6lrpUyseCYJJMJQYr3Ccy/Tizty5ZtvR5jDYpsXVaI0yO6Nw9ELvYV9+tsXtuRH7pF8eoLGp9vaKsMhRemuBaEZ7ZxM2Zlbn3R9mvHliRqQKs5t4Xjf4/nIibvtVdB0loDkYpeXoS6UbDhmdWOn5ZnFOgIt1Nje/U7USfWkX9V4/LyFClz5rXq4gyCwWhmKQbpR4hvWiLopuoC4QLnkHRrAT1//NRnkUvJ6+riZbPxRYNCqw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(83380400001)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(6666004)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:24.1943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90022943-74ea-4a2d-3de1-08db9eba8b61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8407

Following changes are done to __unflatten_device_tree():
    1. __unflatten_device_tree() is renamed to unflatten_device_tree().
    2. Remove __init and static function type.

The changes are done to make this function useable for dynamic node programming
where new device tree overlay nodes are added to fdt and further unflattend to
update xen device tree during runtime.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v7:
    Update the commit with why unflatten_device_tree() is changed.
    Move function documentation to device_tree.h
---
---
 xen/common/device_tree.c      | 17 +++--------------
 xen/include/xen/device_tree.h | 12 ++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index d70b6a7ac9..67e9b6de3e 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2082,18 +2082,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
     return mem;
 }
 
-/**
- * __unflatten_device_tree - create tree of device_nodes from flat blob
- *
- * unflattens a device-tree, creating the
- * tree of struct device_node. It also fills the "name" and "type"
- * pointers of the nodes so the normal device-tree walking functions
- * can be used.
- * @fdt: The fdt to expand
- * @mynodes: The device_node tree created by the call
- */
-static int __init __unflatten_device_tree(const void *fdt,
-                                          struct dt_device_node **mynodes)
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2232,10 +2221,10 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
+    int error = unflatten_device_tree(device_tree_flattened, &dt_host);
 
     if ( error )
-        panic("__unflatten_device_tree failed with error %d\n", error);
+        panic("unflatten_device_tree failed with error %d\n", error);
 
     dt_alias_scan();
 }
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 1d79e23b28..5941599eff 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -178,6 +178,18 @@ int device_tree_for_each_node(const void *fdt, int node,
  */
 void dt_unflatten_host_device_tree(void);
 
+/**
+ * unflatten_device_tree - create tree of device_nodes from flat blob
+ *
+ * unflattens a device-tree, creating the
+ * tree of struct device_node. It also fills the "name" and "type"
+ * pointers of the nodes so the normal device-tree walking functions
+ * can be used.
+ * @fdt: The fdt to expand
+ * @mynodes: The device_node tree created by the call
+ */
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
+
 /**
  * IRQ translation callback
  * TODO: For the moment we assume that we only have ONE
-- 
2.17.1


