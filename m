Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168AD5B59C6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 14:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405738.648183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXi6O-0003NN-TH; Mon, 12 Sep 2022 11:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405738.648183; Mon, 12 Sep 2022 11:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXi6O-0003FL-N3; Mon, 12 Sep 2022 11:59:48 +0000
Received: by outflank-mailman (input) for mailman id 405738;
 Mon, 12 Sep 2022 11:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Y9l=ZP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oXi6N-0002ar-2i
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 11:59:47 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e83f237-3292-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 13:59:36 +0200 (CEST)
Received: from DM5PR06CA0096.namprd06.prod.outlook.com (2603:10b6:3:4::34) by
 CY8PR12MB7338.namprd12.prod.outlook.com (2603:10b6:930:52::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Mon, 12 Sep 2022 11:59:43 +0000
Received: from DS1PEPF0000B078.namprd05.prod.outlook.com
 (2603:10b6:3:4:cafe::4e) by DM5PR06CA0096.outlook.office365.com
 (2603:10b6:3:4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Mon, 12 Sep 2022 11:59:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B078.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.11 via Frontend Transport; Mon, 12 Sep 2022 11:59:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 06:59:40 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 12 Sep 2022 06:59:39 -0500
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
X-Inumbo-ID: 5e83f237-3292-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXaEVgL21XHy7oWPxo6GYOBSedTAlByjoCy8jT89HRLooAInga7DsXYD+EMuyCCFhfy6paksAvY8mqvpEve+k5MfBPDcEetxMqi0pqPQOA7OUKr/CuQKe7QTRXf0vpAyTCRzm+DcYxbNMaZx0EAvslt9pNUkBZD3xomzXM7C7HHSk66R5I2tgKK4l/KakFbfM897jaiIKUvaOSJC3IHmgjsCUxvpMJHWGuXjgXhdblD0fY4DDNFvyNrb0guqKvHEcELhwRL5W3SZE3DRiPcpxHHdxJktCLUPRaq+nDw9PhhXhpHHvJdEsiTgysXGvUcWDunJA51GJzve9+/ZVBzzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLbr++EqGjibrAPyhyuMy+UbwTlyjwezISmhm+i7DKs=;
 b=UHbhJyjsrKGAGPsedd07Bek7D+tAIhFLFlRUVKgdTSkNjqGSyHO56PqVyWs1OR992GP3s3GrUdEAYyijLRci2qDMFdJdSW9i6nWO6akF0zUC4B3sDo7WHpOZx/JNpc3rz3CmcOdyYnO2DspHVGCOdyO0tsqEsySm6wUmJ88JBKUkMvb9KeWbtw/8PtqklL24XZaR2tENHeaTQKj9hKREs/woPpckapj55wqpdcsnEXQVV2bGuHlhny3Lsei8EiMnP2ic7mCuKFK56KgERQ5NTuljoClnmcyXy4IlHpOMNZd2Uvn5VIzPtpKXG3q9OQAizHf4ZdVZFVzdjSe88FG0TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLbr++EqGjibrAPyhyuMy+UbwTlyjwezISmhm+i7DKs=;
 b=2JaU4JXH27HDQiGl/pX4TTYhetKIzCn2imy53x0hDUnRweE5Qcxv4g2MSJflTZ6sJm3q6+pZXblIuBHvFGfseAF07AZTgBZIAyXDo9y4HeXXuWSb+hMNgOlOSiVobfsOJnyUkNDI2fWyk9RVDnp0DgSJweh7twHhgriF3D6+NS4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder 2/2] Add support for lopper to generate partial dts
Date: Mon, 12 Sep 2022 13:59:34 +0200
Message-ID: <20220912115934.19552-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912115934.19552-1-michal.orzel@amd.com>
References: <20220912115934.19552-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B078:EE_|CY8PR12MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 0799d4c0-4501-48d2-15ed-08da94b646b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a7/8FeqDj3P94UbIw4aD2FsW6sipC0rOHH8JHmZ9lYWq1ExbAq+VFSyeMf76LfaD4YpabXMhSp/X5GA7b35wv7EBX0oRPOsk3A/ToJCVR9qBZ4M7E8OSL3/61JyYaSQuDTLT3yDU7ZDuggdqOUkShhCyDCWm741y4iEfRZn3xexDwa6kFVdIbzTC7aM1ZhOThwNhv/3W3WfBgbiphjJKrbyKUoWrRGWm2ivSTv5Xeou6a5hf69d0EFSvKbmfjKQ9twWjXvjkrrlP8fwIJCVRI9+V+ET1tRM4LdUX2CBNCBXQpj0vdEO/1J7Nygp5ccCKTKHGJV389JVO9LJs6R2XnLDyu0Nnja3wWMPsSmoSuT8KnIsos40cYCxMLJOk/EMaAvrknQ8cbt8zYwWc5XRtPUgLcsoRrciMMxYJJpAj3XL45O0FpcNV0NdFjAAeJG0bXqGOvxazEe96Ud8pEzMpaOsG4qgD8OB6o3WsFy8dfSGNjv+xmepQwQkk8xfqO1rF8nLYmlw25vNTtWuUmKza0h/WjkT1tN2Q7K4lmoUPn3g5m08kKES93+A9LFJlNIfM9iCeii27rOb8p7oVQaF3u9HF/t0j/PtiO9er6J86Yt9qu/DYELDE0HmYdquKTdliRFgz4+zWRLWAZyKFlsOFxvTH8FbtuC+c0c9lcltvgMshgcq8jC5ouQN2h1E6kI3/v1Mx5ZmlYoUipSHA5UV9N6fDtJ8PiDn1JThb8xIpmsWtr5iS2f4C7KUTzc70EmvElTawNQQiqhgiNnc+VZ1HOHTS40IOMwbuvzqLizxoxKWyKmdPSG7WxhUt7t/mETOADB/TvVxJFT+p8GKeRzNTQA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(376002)(40470700004)(36840700001)(46966006)(83380400001)(5660300002)(82740400003)(36860700001)(86362001)(47076005)(81166007)(356005)(1076003)(6666004)(426003)(186003)(2616005)(70206006)(41300700001)(26005)(478600001)(54906003)(8936002)(6916009)(70586007)(40480700001)(40460700003)(8676002)(82310400005)(316002)(4326008)(336012)(2906002)(36756003)(44832011)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:59:41.6156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0799d4c0-4501-48d2-15ed-08da94b646b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B078.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7338

Currently ImageBuilder can compile and merge partial dts obtained from
a repository specified using PASSTHROUGH_DTS_REPO. With the recent
changes done in the lopper, we can use it to generate partial dts
automatically (to some extent as this is still an early support).

Introduce LOPPER_PATH option to specify a path to a lopper.py script,
that if set, will invoke lopper to generate partial dts for the
passthrough devices specified in DOMU_PASSTHROUGH_PATHS.

Introduce LOPPER_CMD option to specify custom command line arguments
(if needed) for lopper's extract assist.

Example usage:
LOPPER_PATH="/home/user/lopper/lopper.py"
DOMU_PASSTHROUGH_PATHS[0]="/axi/spi@ff0f0000 /axi/serial@ff010000"

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 README.md                | 22 ++++++++++++--
 scripts/common           | 64 ++++++++++++++++++++++++++++++----------
 scripts/uboot-script-gen | 17 +++++++++--
 3 files changed, 83 insertions(+), 20 deletions(-)

diff --git a/README.md b/README.md
index da9ba788a3bf..aaee0939b589 100644
--- a/README.md
+++ b/README.md
@@ -128,6 +128,19 @@ Where:
 - DT_OVERLAY[number] specifies the path to the hosts device tree overlays
   to be added at boot time in u-boot
 
+- LOPPER_PATH specifies the path to lopper.py script. This is optional.
+  However, if this is specified, then DOMU_PASSTHROUGH_PATHS[number] need
+  to be specified. uboot-script-gen will invoke lopper to generate the partial
+  device trees which have been specified in DOMU_PASSTHROUGH_PATHS[number].
+  This option is currently in experimental state as the corresponding lopper
+  changes are still in an early support state.
+
+- LOPPER_CMD specifies the command line arguments for lopper's extract assist.
+  This is optional and only applicable when LOPPER_PATH is specified. Only to be
+  used to specify which nodes to include (using -i <node_name>) and which
+  nodes/properties to exclude (using -x <regex>). If not set at all, the default
+  one is used applicable for ZynqMP MPSoC boards.
+
 - NUM_DOMUS specifies how many Dom0-less DomUs to load
 
 - DOMU_KERNEL[number] specifies the DomU kernel to use.
@@ -140,7 +153,7 @@ Where:
 - DOMU_PASSTHROUGH_PATHS[number] specifies the passthrough devices (
   separated by spaces). It adds "xen,passthrough" to the corresponding
   dtb nodes in xen device tree blob.
-  This option is valid in the following two cases:
+  This option is valid in the following cases:
 
   1. When PASSTHROUGH_DTS_REPO is provided.
   With this option, the partial device trees (corresponding to the
@@ -149,7 +162,12 @@ Where:
   Note it assumes that the names of the partial device trees will match
   to the names of the devices specified here.
 
-  2. When DOMU_NOBOOT[number] is provided. In this case, it will only
+  2. When LOPPER_PATH is provided.
+  With this option, the partial device trees (corresponding to the
+  passthrough devices) are generated by the lopper and then compiled and merged
+  by ImageBuilder to be used as DOMU[number] device tree blob.
+
+  3. When DOMU_NOBOOT[number] is provided. In this case, it will only
   add "xen,passthrough" as mentioned before.
 
 - DOMU_PASSTHROUGH_DTB[number] specifies the passthrough device trees
diff --git a/scripts/common b/scripts/common
index ccad03d82b30..680c5090cd07 100644
--- a/scripts/common
+++ b/scripts/common
@@ -9,6 +9,9 @@
 # - NUM_DOMUS
 # - DOMU_PASSTHROUGH_PATHS
 # - DOMU_PASSTHROUGH_DTB
+# - LOPPER_PATH
+# - LOPPER_CMD
+# - DEVICE_TREE
 
 tmp_files=()
 tmp_dirs=()
@@ -99,31 +102,41 @@ function compile_merge_partial_dts()
     local tmp
     local tmpdts
     local file
+    local node
     local i
     local j
 
-    if [[ "$repo" =~ .*@.*:.* ]]
+    if test "$repo"
     then
-        tmp=`mktemp -d`
-        tmp_dirs+=($tmp)
-
-        echo "Cloning git repo \"$git_repo\""
-        git clone "$repo" $tmp
-        if test $? -ne 0
+        # Partial dts will be obtained from PASSTHROUGH_DTS_REPO
+        if [[ "$repo" =~ .*@.*:.* ]]
         then
-            echo "Error occurred while cloning \"$git_repo\""
-            return 1
-        fi
+            tmp=`mktemp -d`
+            tmp_dirs+=($tmp)
 
-        repo=$tmp
-    fi
+            echo "Cloning git repo \"$git_repo\""
+            git clone "$repo" $tmp
+            if test $? -ne 0
+            then
+                echo "Error occurred while cloning \"$git_repo\""
+                return 1
+            fi
 
-    if test -z "$dir"
-    then
-        dir="."
+            repo=$tmp
+        fi
+
+        if test -z "$dir"
+        then
+            dir="."
+        fi
+        partial_dts_dir="$repo"/"$dir"
+    else
+        # Partial dts will be generated by the lopper
+        tmp=`mktemp -d`
+        tmp_dirs+=($tmp)
+        partial_dts_dir="$tmp"
     fi
 
-    partial_dts_dir="$repo"/"$dir"
     i=0
     while test $i -lt $NUM_DOMUS
     do
@@ -133,6 +146,25 @@ function compile_merge_partial_dts()
             return 1
         fi
 
+        if test -z "$repo"
+        then
+            # Generate partial dts using lopper
+            for devpath in ${DOMU_PASSTHROUGH_PATHS[$i]}
+            do
+                node=${devpath##*/}
+                file="$partial_dts_dir"/"$node".dts
+
+                $LOPPER_PATH --permissive -f $DEVICE_TREE \
+                -- extract -t $devpath $LOPPER_CMD \
+                -- extract-xen -t $node -o $file
+
+                if test $? -ne 0
+                then
+                    return 1
+                fi
+            done
+        fi
+
         sanity_check_partial_dts "${DOMU_PASSTHROUGH_PATHS[$i]}" "$partial_dts_dir"
         if test $? -ne 0
         then
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 1f8ab5ffd193..84a68d6bd0b0 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -1138,10 +1138,23 @@ fi
 # tftp or move the files to a partition
 cd "$uboot_dir"
 
-if test "$PASSTHROUGH_DTS_REPO"
+# If both PASSTHROUGH_DTS_REPO and LOPPER_PATH options are specified,
+# the former takes precedence because the partial device trees are already
+# created (probably tested), hence the reliability is higher than using lopper.
+if test "$PASSTHROUGH_DTS_REPO" || test "$LOPPER_PATH"
 then
     output_dir=`mktemp -d "partial-dtbs-XXX"`
-    compile_merge_partial_dts $output_dir "$PASSTHROUGH_DTS_REPO"
+    if test "$PASSTHROUGH_DTS_REPO"
+    then
+        compile_merge_partial_dts $output_dir "$PASSTHROUGH_DTS_REPO"
+    else
+        if test -z "$LOPPER_CMD"
+        then
+            # Default for ZynqMP MPSoC
+            LOPPER_CMD="-i zynqmp-firmware -x interrupt-controller -x pinctrl -x power-domains -x resets -x current-speed"
+        fi
+        compile_merge_partial_dts $output_dir
+    fi
     if test $? -ne 0
     then
         # Remove the output dir holding the partial dtbs in case of any error
-- 
2.25.1


