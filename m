Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1129A65D3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 13:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823343.1237324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qDe-0008IC-OJ; Mon, 21 Oct 2024 11:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823343.1237324; Mon, 21 Oct 2024 11:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qDe-0008FD-LY; Mon, 21 Oct 2024 11:05:02 +0000
Received: by outflank-mailman (input) for mailman id 823343;
 Mon, 21 Oct 2024 11:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xEjj=RR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1t2qDd-0008F3-0P
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 11:05:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:200a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ecf4de6-8f9c-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 13:04:58 +0200 (CEST)
Received: from SN4PR0501CA0118.namprd05.prod.outlook.com
 (2603:10b6:803:42::35) by SJ0PR12MB5662.namprd12.prod.outlook.com
 (2603:10b6:a03:429::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Mon, 21 Oct
 2024 11:04:52 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:803:42:cafe::f3) by SN4PR0501CA0118.outlook.office365.com
 (2603:10b6:803:42::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.8 via Frontend
 Transport; Mon, 21 Oct 2024 11:04:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 11:04:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:04:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:04:50 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 21 Oct 2024 06:04:49 -0500
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
X-Inumbo-ID: 4ecf4de6-8f9c-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slqEaA8m9bFlzq4ia3DLzvWvqPoVykdu5wAHTzabC8EhDxLK462NJSX2sa7vki24SB+XoOuK8EU27GiiN9DC5Jj2g0sPXz0quZMXBuLx1VvZngwTOVYe98s1nRl13Ek8H2Qo9Nplew0XG/xau0X+ObuZSyriiwCU/F3+c8Bb413j/xK3PUAYAOPV/n/udPPfrY5d0mfd2YVUIXEa1dMM0w7zpHYY9OV2Ra+kurx8sDQOpa4q5QrY8U/EEzX8R7pWPVz3hPDS0UlHEDT4t+1GIonZLLIjxyZgFG4YQpdWIq1pfrEob/6zTW9bWutp087YI2UrpMDkqiu3Q5YqCkKETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/y+1fO09HSxr0gr6oFKsCoLLbaVbP4p7XDQyh3mR+Bw=;
 b=pDww5FuAkyhGHQFDFzPOsGWaYsP3A3muQ2DZiV0hlB9DYkQ0yyfNlLSw7hX9Ggr/Y0dx8JgrVlWJrsmrEDpQJsOtbf/uGFTfefFyzll/Uei+CrtORsYNOXPbTUV+XX9QiWFvc4eZbY7KfHeEFXkcmTmby5K9pIeNm2W5NS8drpn3MyF1Cpqz58i2QfUeohKdsuDQ16C14isuR3rIJ5MqmT3CeJAVjlNRbKGQ3bZMGb+pUkbJ/sNw5E673Rg4q4o2iOp1fceMymDGw8TcqT4ZRuCRQAH7G1rp7gttWB7WCeiFa5uvEpi4I3XyGUkoS82ctieoyfGKQ3CEu6kr+TBgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/y+1fO09HSxr0gr6oFKsCoLLbaVbP4p7XDQyh3mR+Bw=;
 b=oyOqlr0i5WxAYMCSGLVHhWT9ZfJsWBEHQ2jzmicL4QjajH6DI8bgrJ73QxNu6Eka1qdZbU+FYpODUOFDPrkDJbddg0yZTtrM01ccSd92v1eZ6zzBaHwuUA49ophUhJJsjGRH0y3Ta8w2SSRSp2d6M4c/eGEdu0CYKt7GGEKntqs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder] Fix device tree node naming
Date: Mon, 21 Oct 2024 13:04:46 +0200
Message-ID: <20241021110446.8633-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|SJ0PR12MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c6cb4e-68e9-457b-d11a-08dcf1c03013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?36wJ3dMmZJdKwgYWCxpgIcAASs5M1HwBSQS4DV8unz7xlL5RKAOYrb492rMk?=
 =?us-ascii?Q?htDP8iFSE1FboDGnKqUOTFMVH1+V+gKDS7Hqb/8DbI+Z+Tqn3pf9F3+lO+9B?=
 =?us-ascii?Q?EtJx3sGdae/0ff/CRMZxl2ZS8GCQ7xjLeMZV3JDf9qHYL82ovMZ7If22+YXE?=
 =?us-ascii?Q?zzfIQ+lmSlwY0/AhLIj0MguZrJYBUrDm9Rh6GsW+V4rSpPoz2sBQawe1yTbn?=
 =?us-ascii?Q?J/JqDIlTDtgly61fZ1flOmBcGtEg3R45jbtT7NNCHcdupOmAsc4sx9ozQQKt?=
 =?us-ascii?Q?ac1lXOKc5Dp/Gzd8KnxUEHPx7jSrnJIcuZB0HDyjGvlOqtCRbgv1JRZ0b0Fz?=
 =?us-ascii?Q?/9SU3uRf+Aw/N83vZ615m3pnoBQS4cpX/MtwRDzg/jhGNTOkJC9x0o3L16PW?=
 =?us-ascii?Q?yLcr9k9MPckpMIDJLKETDHpc0hG/w4uBURdajlTSGTLcERgaepHCvAVAAcqp?=
 =?us-ascii?Q?XvXig+MVfsODPkmeGllJKc1bQL1OU693dmnZCFt2yCDN2SfXPcsEpnH+C5Ha?=
 =?us-ascii?Q?vt4zQQNCNpGfblFQPS+ftaSm5jupZKVy3E33AizRCShrQbn/85uixuyKkbWf?=
 =?us-ascii?Q?ve3TG0l5HZ1JurnPfu93DSSRbZxtZob+Lym/jE0O87QetXr2m6NUzCKhcwAT?=
 =?us-ascii?Q?EggXZ09C4BSwhFO/b33wUob1igzl5nGOJD1vV7+ECgODXibJmlkTtDCL7chS?=
 =?us-ascii?Q?VmCbedgUjJ5eINJIRpKB0njU6UVLGoXbyjiYST4nZg9gyzZ1DxWIVJP9y9CC?=
 =?us-ascii?Q?ay1/zJ1iKn6ysF6YUQzDmm1w8DQPrv266gm9g0aRWc7UghPyqjnU8rkN/WlV?=
 =?us-ascii?Q?Z5Fob9riVjD62OHf5iPTu/i48k9f+Y1f6qPFjk9SDFlLkIBH4TwvTVt5b/P/?=
 =?us-ascii?Q?OaSsOYqOKumZX1+JlQDZTymNNzdEspbgWmHNQlAtg2tnCeYPrbZ56kFUl8+I?=
 =?us-ascii?Q?aReb0mtZ8UBiLwonVd/TwG19O1dcIb+bbWLmCmGUfeX6RzBNapOWK1GjEyrs?=
 =?us-ascii?Q?KwfdSZY9I31NMIRn/Ul8ZDZ/+T7RA+bIOH8q++Cbf2PCeefZ0NZy4poKsLqq?=
 =?us-ascii?Q?Hs25lqwG7pHEnIiocC7LsubhtWSCRo002+9IV8XfzbCE+IRDKrCNwgTMW2gM?=
 =?us-ascii?Q?421FoDyQTu8h/auKlevvEerUSGNAgh0QcQO3hhHdVeUcbwpqv9V9LJ6hEgrU?=
 =?us-ascii?Q?lAn5TlVoVCP9DFDGMPnZi6eV1Te+o2mvHzm3btMqmrJHd9fbovj5LjG7W/IJ?=
 =?us-ascii?Q?+Axi5VM94r6CAWB6cWuw60+5aFvnKSMLPCejqu0WIKjGEpUlIuRhhlIFzvY2?=
 =?us-ascii?Q?Dso26ohqzKcYfItVsVESXjncUmXaDVhQZd/Z6DvL/xFPRGHf3BIhPxIeVPR7?=
 =?us-ascii?Q?31wZnikmiSeCFdX1cYg/QgBwQCL9GVUS5u3jOpTcSdWV9GO53g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:04:52.1606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c6cb4e-68e9-457b-d11a-08dcf1c03013
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5662

A device tree node is named as follows: node-name@unit-address. The
unit-address must match the first address specified in the reg property
or be omitted if there's no reg property.

Fix the following issues:
1) domU modules are named as: node-name0xunit-address. Fix the naming to
   follow the device tree spec.
2) dom0 kernel and ramdisk, despite having the reg property do not have
   unit addresses specified. Fix it.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 scripts/uboot-script-gen | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index f8a087b881ce..f10e5f4a49bf 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -106,11 +106,12 @@ function add_device_tree_kernel()
     local addr=$2
     local size=$3
     local bootargs=$4
+    local node_name="module@${addr#0x}"
 
-    dt_mknode "$path" "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,kernel multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "$(split_addr_size $addr $size)"
-    dt_set "$path/module$addr" "bootargs" "str" "$bootargs"
+    dt_mknode "$path" "$node_name"
+    dt_set "$path/$node_name" "compatible" "str_a" "multiboot,kernel multiboot,module"
+    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
+    dt_set "$path/$node_name" "bootargs" "str" "$bootargs"
 }
 
 
@@ -119,10 +120,11 @@ function add_device_tree_ramdisk()
     local path=$1
     local addr=$2
     local size=$3
+    local node_name="module@${addr#0x}"
 
-    dt_mknode "$path"  "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "$(split_addr_size $addr $size)"
+    dt_mknode "$path"  "$node_name"
+    dt_set "$path/$node_name" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
+    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
 }
 
 
@@ -131,10 +133,11 @@ function add_device_tree_passthrough()
     local path=$1
     local addr=$2
     local size=$3
+    local node_name="module@${addr#0x}"
 
-    dt_mknode "$path"  "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,device-tree multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "$(split_addr_size $addr $size)"
+    dt_mknode "$path"  "$node_name"
+    dt_set "$path/$node_name" "compatible" "str_a" "multiboot,device-tree multiboot,module"
+    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
 }
 
 function add_device_tree_mem()
@@ -314,17 +317,21 @@ function xen_device_tree_editing()
 
     if test "$DOM0_KERNEL"
     then
-        dt_mknode "/chosen" "dom0"
-        dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
-        dt_set "/chosen/dom0" "reg" "hex" "$(split_addr_size $dom0_kernel_addr $dom0_kernel_size)"
+        local node_name="dom0@${dom0_kernel_addr#0x}"
+
+        dt_mknode "/chosen" "$node_name"
+        dt_set "/chosen/$node_name" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
+        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $dom0_kernel_addr $dom0_kernel_size)"
         dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
     fi
 
     if test "$DOM0_RAMDISK" && test $ramdisk_addr != "-"
     then
-        dt_mknode "/chosen" "dom0-ramdisk"
-        dt_set "/chosen/dom0-ramdisk" "compatible" "str_a" "xen,linux-initrd xen,multiboot-module multiboot,module"
-        dt_set "/chosen/dom0-ramdisk" "reg" "hex" "$(split_addr_size $ramdisk_addr $ramdisk_size)"
+        local node_name="dom0-ramdisk@${ramdisk_addr#0x}"
+
+        dt_mknode "/chosen" "$node_name"
+        dt_set "/chosen/$node_name" "compatible" "str_a" "xen,linux-initrd xen,multiboot-module multiboot,module"
+        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $ramdisk_addr $ramdisk_size)"
     fi
 
     i=0
-- 
2.25.1


