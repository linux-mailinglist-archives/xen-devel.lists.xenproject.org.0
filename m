Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1D75F99FC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 09:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419123.663859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohnEt-0006Ai-Io; Mon, 10 Oct 2022 07:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419123.663859; Mon, 10 Oct 2022 07:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohnEt-00067F-Ec; Mon, 10 Oct 2022 07:30:15 +0000
Received: by outflank-mailman (input) for mailman id 419123;
 Mon, 10 Oct 2022 07:30:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zpu8=2L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ohnEr-000679-9M
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 07:30:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ad569ea-486d-11ed-9377-c1cf23e5d27e;
 Mon, 10 Oct 2022 09:30:03 +0200 (CEST)
Received: from MWH0EPF00056D15.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:1e) by BL0PR12MB4899.namprd12.prod.outlook.com
 (2603:10b6:208:1cf::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 10 Oct
 2022 07:30:07 +0000
Received: from CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::205) by MWH0EPF00056D15.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.1 via Frontend
 Transport; Mon, 10 Oct 2022 07:30:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT107.mail.protection.outlook.com (10.13.175.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Mon, 10 Oct 2022 07:30:07 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 10 Oct
 2022 02:30:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 10 Oct
 2022 00:29:54 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 10 Oct 2022 02:29:54 -0500
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
X-Inumbo-ID: 5ad569ea-486d-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z67TUcNQKzIfbwKP5sQTnuLFlbqa7beqiafxZORXa7cF88nYhJJZVkwzBzLpnFfsrxqJuwMfGLQ4hGqoEqpMfzK+0VeoPzgTQh4GDzfJ++m2TcAUP10MILyOmFczegXEG2JRtjFV1XD8tIr1oCZILrujavc1Qxtq1ecr/gDtcaKjlTxshS2QjrugrdkD4Yrk+2MYdTY2wBzXTFynwcfSfk3VIepIuYO9uea9C+BUKVAtBu04f3L4D+aj6lrvN2kyAJibHSS1DWEY+0ddZqo4e0S2MzUyYeI2REUyTsI3oU6r7cPZDfwBzQIxDTVnjmQuk7ImIu5WEUehVCVqKB25Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RAfJpdwynmbz/rlQlWCjryMbpbTDFitdlWEPh1RlAQ=;
 b=cVN013k3gJGLmFgsh0AFgQZKCLC6W4A+N2Ow9oghoq6cntitoRj7sMb2xGcPtdcxNbcq6thZUC5op6/2kBySrIcbTIqdeubyEx1HWbBfkFM7ZK59/UF1CxBFT2iZBM3vampkHIVrA4QcMDpSO8WPeVsQ0F9hiDxcFLUk6XwU0ZJJotQ3kjH5moJqdL0JzxTAMB3tt9FYHe70tpq0H42J9lX3h5E1T+xnPQHuWP06+Cka2K44vjVVeo0QlwqEvAZdFdB9zFB4d9PcL1pHHmrR2+zHtAdIVxAHlS61y8JKYnh7xZITE+IVfvDuj/fmeuAgW9a9mCCWOr8PmZMkpXKj5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RAfJpdwynmbz/rlQlWCjryMbpbTDFitdlWEPh1RlAQ=;
 b=a1VaQXog0Tk6jLXmZx0LEIl8v7TbpxFY3Yv2X+xg/QZDRa7FI1FvS1DbnAgAChXg7CYhc0XvUT3U+GDBi4SCThyKysIJiNATjh73PJU61vKM6YmmHAF0SARwzd79LeJKfAy37PAnRnrrN+Xi9aoIrzLa7aLlNMHkyZNX4bedwe4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder v2] Add support for 64-bit addresses/sizes
Date: Mon, 10 Oct 2022 09:29:47 +0200
Message-ID: <20221010072947.8300-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT107:EE_|BL0PR12MB4899:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ad1132-65f8-4520-7a83-08daaa91417e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W2Oyzcp6M3St+DfQogNP101GTBXSmDrQP6W7aA8ESH0vONktP7mGJU/znaebQVPVYVM+a+jRHS+qBRShgNKeUlb/awlj+RDAOI3GHoQojyzDI96ttmlHljy+dH92Qmq8d2T3FbnS02eDd4enTXSUtQEz7rwAL76O/3B8rmC50vwXyG0hS8W2iRwlVTt7s21B6orHzUjBl8erYjjd0Ng2UGwZ+qSdh5bXj0qiE3E9XRatV9VAIMfhYvAvAfLipcEEp9gwJNHtWVp+d1qW6T/JQb2axRYV6lK3Hk3jzUZ/Ml3/j3p7puEBhhK35NWNwC9M7szREg4Es1MNwfsgyr2DK2dSNPl8NjuBS203HNL8g38/fPOp6mJHoKaBC8YGReIoOspos5zeQ0pHpM7NETG6WYrT25olw5pPqxCE+3V+vqmvgn8psmQ5fAV6OBSl4sP4XExM39Gl/UiGXbfonHCM+dKfvihGfK80OsOda2vCEewu29Vgj0RwPQ1MEjN8IWU/FjPtJasvGaSUOEm/YWhGMt/H18n9KbizB9SBQrVYYdJiPA2N2EJEXEuOhdLv7Xu6cxma8+TcDflZ92d9nS7vw4qvZ0TltLjjAhK3E+bTG4QuwMq1ZoFEnbujWqmO7iLvr0BzQncCoKnnAoX5CCsW99X9SYzaooqzFzWYAzGqnAhsAhwXTG7sKNyJGQ3h6yBe3sHkxwt+xpoe8HwLyb60tjM0ziYnnakav0OEERx+ZMpgSgqb0/SeVnDATEBPBE4fkelWnLHLGiEDWpysgrUGJPPXIyclf8wO+GohoQMvHH4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39850400004)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(26005)(40480700001)(6916009)(82740400003)(81166007)(4326008)(36756003)(40460700003)(478600001)(86362001)(36860700001)(70206006)(54906003)(6666004)(2616005)(83380400001)(316002)(8936002)(336012)(356005)(70586007)(5660300002)(82310400005)(8676002)(44832011)(186003)(47076005)(1076003)(426003)(2906002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 07:30:07.0415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ad1132-65f8-4520-7a83-08daaa91417e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899

At the moment, ImageBuilder assumes that all addresses/sizes are
32-bit max. It sets #{address,size}-cells to 0x2 and puts 0x0 as the
value for the first cell. Because of that, we cannot specify
MEMORY_START and MEMORY_END to be above 32-bits (e.g. to place the images
in the upper memory bank).

Add support to properly handle 64-bit addresses/sizes:
 - add function split_into_halves to split the value passed as a first
   argument into upper and lower halves. These are then set as values for
   variables passed respetively as the second and third argument,
 - add function split_addr_size to split address and size and form a
   string to be passed to dt_set as data argument for reg property.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- redesign a patch based on master-next instead of NXP dynamic assignment patch
---
 scripts/uboot-script-gen | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index b24dca2b7f7e..09d237d192c1 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -22,6 +22,29 @@ function dt_mknode()
     fi
 }
 
+# Usage:
+# split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
+function split_into_halves()
+{
+    local value=$1
+    local upper=$2
+    local lower=$3
+
+    eval "$upper=$(printf "0x%X\n" $(($value >> 32)))"
+    eval "$lower=$(printf "0x%X\n" $(($value & 0xFFFFFFFF)))"
+}
+
+function split_addr_size()
+{
+    local addr=$1
+    local size=$2
+
+    split_into_halves $addr addr_upper addr_lower
+    split_into_halves $size size_upper size_lower
+
+    echo "$addr_upper $addr_lower $size_upper $size_lower"
+}
+
 # data_type is either
 #   int
 #   hex
@@ -93,7 +116,7 @@ function add_device_tree_kernel()
 
     dt_mknode "$path" "module$addr"
     dt_set "$path/module$addr" "compatible" "str_a" "multiboot,kernel multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+    dt_set "$path/module$addr" "reg" "hex"  "$(split_addr_size $addr $size)"
     dt_set "$path/module$addr" "bootargs" "str" "$bootargs"
 }
 
@@ -106,7 +129,7 @@ function add_device_tree_ramdisk()
 
     dt_mknode "$path"  "module$addr"
     dt_set "$path/module$addr" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+    dt_set "$path/module$addr" "reg" "hex"  "$(split_addr_size $addr $size)"
 }
 
 
@@ -118,7 +141,7 @@ function add_device_tree_passthrough()
 
     dt_mknode "$path"  "module$addr"
     dt_set "$path/module$addr" "compatible" "str_a" "multiboot,device-tree multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+    dt_set "$path/module$addr" "reg" "hex"  "$(split_addr_size $addr $size)"
 }
 
 function add_device_tree_mem()
@@ -260,7 +283,7 @@ function xen_device_tree_editing()
     then
         dt_mknode "/chosen" "dom0"
         dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
-        dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 $(printf "0x%x" $dom0_kernel_size)"
+        dt_set "/chosen/dom0" "reg" "hex" "$(split_addr_size $dom0_kernel_addr $dom0_kernel_size)"
         dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
     fi
 
@@ -268,7 +291,7 @@ function xen_device_tree_editing()
     then
         dt_mknode "/chosen" "dom0-ramdisk"
         dt_set "/chosen/dom0-ramdisk" "compatible" "str_a" "xen,linux-initrd xen,multiboot-module multiboot,module"
-        dt_set "/chosen/dom0-ramdisk" "reg" "hex" "0x0 $ramdisk_addr 0x0 $(printf "0x%x" $ramdisk_size)"
+        dt_set "/chosen/dom0-ramdisk" "reg" "hex" "$(split_addr_size $ramdisk_addr $ramdisk_size)"
     fi
 
     i=0
-- 
2.25.1


