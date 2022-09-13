Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20D5B6CCF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 14:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406347.648745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY4jR-0002ml-3X; Tue, 13 Sep 2022 12:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406347.648745; Tue, 13 Sep 2022 12:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY4jQ-0002kp-W7; Tue, 13 Sep 2022 12:09:36 +0000
Received: by outflank-mailman (input) for mailman id 406347;
 Tue, 13 Sep 2022 12:09:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWZA=ZQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oY4jP-0002YT-EM
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 12:09:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fe82052-335c-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 14:06:57 +0200 (CEST)
Received: from BN0PR04CA0201.namprd04.prod.outlook.com (2603:10b6:408:e9::26)
 by BL0PR12MB4882.namprd12.prod.outlook.com (2603:10b6:208:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 12:09:30 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::7) by BN0PR04CA0201.outlook.office365.com
 (2603:10b6:408:e9::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 13 Sep 2022 12:09:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Tue, 13 Sep 2022 12:09:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 13 Sep
 2022 07:09:29 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 13 Sep 2022 07:09:29 -0500
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
X-Inumbo-ID: 8fe82052-335c-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt0++xon76TvOybOQqq/c4KzXztwyfdAcweGxFeFCGhFZYp25wu+H0n/AR3xzPRLbJdNdKE8Njsr4bvQEodd6pEeqmq0baC2hPvJxoxsBkweCFcOkEgLXjRkA/edIN+X4gQCO7JrhzOPXLjv2x1OqsCH96rrAKrRUPSWtvnQ1x8gvJloHf/1ljlFNBgEdeZfTlp4OVkreQx0P4JXJKg/re+oSh8vK3E6B03FDCgq6AAlSLSS785UYPCAf5g6Yn5Y5TZ7YILGOEaGai9xwgQUa146iqAdSRKD8f4BgNaj4hqfUtcbbYDxsrc+COadvOTdb+qNF8/p/JILLllBcoAc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wTHJSvUWZwgvn3QOmXdODSY/f3JRBIovaGHJFdJ4Dw=;
 b=oMBr9gi0FeLnoPBFt/YdtB3ZusjycvSg+pXnlWhPUzjOjPhvOJzNJ3TkC+6ZeRjpdEkg3TBE6QixIN4UUuWXjZvp4fk9mNIjujilEUX/sluL+oeIoDf38Oloflxl+tts4fuOWp558jwzBRFCSkmSKOteysdS4qf+55ZjY4udy9UQ+GN6ocdm/DnMqzwgga8pI461KGjFQkIWqnMCTi26hnXqUjpm6B8ce+I1kv94nBtt0zGgWtYxuo4HmmizFx6Wh9D/q1fGq/zCfKRnSiaOL63biXsUEKSRn1Kc9o39HLC3hkk21P0dcN17bTjnKkP9f+A2TRYSzgP0yeTvQFppgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wTHJSvUWZwgvn3QOmXdODSY/f3JRBIovaGHJFdJ4Dw=;
 b=rlnPAy1+BizH05ain82NQKcwyK9QEoXK1oyRAgnu1+po5/J9ZvvKlIpBU8OLR4Sak9dLvOWnFPRKvFs80rj1iiQKAFzPa8l8A3QrE/Sn7mRjltTeAIxEIu9KZnR9Y1doxsnkAwhpMUoJADJEZZ9BuUPGjClVpl2kClEfLrgJQ94=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder v2 2/2] Add support for lopper to generate partial dts
Date: Tue, 13 Sep 2022 14:09:18 +0200
Message-ID: <20220913120918.31162-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913120918.31162-1-michal.orzel@amd.com>
References: <20220913120918.31162-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT066:EE_|BL0PR12MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c64088-6f41-417e-dc2b-08da9580d00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+3dO/v/KiIgL/hIZ7aTCyDK/j6m+JssOY3t6040uJb4JN6tZMjXdCaBGei6t1ahbuWMXEVQV6WmvMEn6SCSfqctMXgl22sCV98DYZgOvmQzRKyEXQ0Cacw7OWNd9lh8pe4x9ab0o+xLPiRN00VHDxZ4Ybcr47Usdk5YBpZdFHQzWAie0EVY8iKBYGCcwZc3wxan8mp6XeBT3Py8xJFwFurFkfNJCqYh8s4owHyz49sswthkQnQrC55Svc8yU4bEvvpWPM3bh8mpOtY2vxiaLauLbYezM0SGcLnp/eRi/iH9STQJy3UzsAi613mQ+EA+yovbNWlDFpvAIt1VvrmweSDuiYmjAtpmZniVKWP+D6Tz9Uj19O87Hf3tmYnFLQ45A6SUbVo6fJ0G31tYYKV3JzoXJNv3rAHKRgTj2LPru9d5eec/FQrgtC1jsv0cTkg8SwL9TafQqPPTSAfKHEVxXVT3Uozcpfwx5uUIMJhzRDcwqMdaI5HDJBKTTZ7/gp3dHdnLfIqytcshAJQYbzo+TiE7H/jBPVKM1asM4bn5f0mMcihi5auxNJTR6Rz8q621lIHdHb66dH4Wi3MO1Jas18Iz7LYjuh2lmtb2zjb3ESe5iR0pMP8Ryk83ymleA82hNQO88zlotBRBi4Vpbo1IL1qjN3UUJYO+Etcr7Mydrjkifuf/x+yexiIjZYyWBxPyQc3yT5G3BligARknMGvg5/bMj3rHRVhoI/iKGp/5IwOByhoIX+XcwUMcIeTFZTpFMbdpzAfRVEpoRjBQAcINUR91dxCTv9DzcGl5ivk2D47woQIBChK3DeyFfrZf+T4Y00e5FmGiM5KbrU9R+UgbitA2c34WuzAKxzvLnrPRhaL4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(26005)(81166007)(4326008)(316002)(40460700003)(356005)(54906003)(6666004)(426003)(5660300002)(86362001)(478600001)(8676002)(82310400005)(336012)(36756003)(36860700001)(2616005)(70206006)(44832011)(1076003)(82740400003)(40480700001)(186003)(70586007)(47076005)(83380400001)(41300700001)(8936002)(6916009)(2906002)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 12:09:30.4487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c64088-6f41-417e-dc2b-08da9580d00d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4882

Currently ImageBuilder can compile and merge partial dts obtained from
a repository specified using PASSTHROUGH_DTS_REPO. With the recent
changes done in the lopper, we can use it to generate partial dts
automatically (to some extent as this is still an early support).

Introduce LOPPER_PATH option to specify a path to a lopper.py script,
the main script in the Lopper repository, that if set, will invoke lopper
to generate partial dts for the passthrough devices specified in
DOMU_PASSTHROUGH_PATHS.

Introduce LOPPER_CMD option to specify custom command line arguments
(if needed) for lopper's extract assist.

Example usage:
LOPPER_PATH="/home/user/lopper/lopper.py"
DOMU_PASSTHROUGH_PATHS[0]="/axi/spi@ff0f0000 /axi/serial@ff010000"

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- improve documentation
- update commit msg
- use node=${devpath##*/} instead of file=${devpath##*/}
---
 README.md                | 23 ++++++++++--
 scripts/common           | 77 ++++++++++++++++++++++++++++++----------
 scripts/uboot-script-gen | 22 ++++++++++--
 3 files changed, 100 insertions(+), 22 deletions(-)

diff --git a/README.md b/README.md
index da9ba788a3bf..f4213d570033 100644
--- a/README.md
+++ b/README.md
@@ -128,6 +128,20 @@ Where:
 - DT_OVERLAY[number] specifies the path to the hosts device tree overlays
   to be added at boot time in u-boot
 
+- LOPPER_PATH specifies the path to lopper.py script, the main script in the
+  Lopper repository (https://github.com/devicetree-org/lopper). This is
+  optional. However, if this is specified, then DOMU_PASSTHROUGH_PATHS[number]
+  needs to be specified. uboot-script-gen will invoke lopper to generate the
+  partial device trees for devices which have been listed in
+  DOMU_PASSTHROUGH_PATHS[number]. This option is currently in experimental state
+  as the corresponding lopper changes are still in an early support state.
+
+- LOPPER_CMD specifies the command line arguments for lopper's extract assist.
+  This is optional and only applicable when LOPPER_PATH is specified. Only to be
+  used to specify which nodes to include (using -i <node_name>) and which
+  nodes/properties to exclude (using -x <regex>). If not set at all, the default
+  one is used applicable for ZynqMP MPSoC boards.
+
 - NUM_DOMUS specifies how many Dom0-less DomUs to load
 
 - DOMU_KERNEL[number] specifies the DomU kernel to use.
@@ -140,7 +154,7 @@ Where:
 - DOMU_PASSTHROUGH_PATHS[number] specifies the passthrough devices (
   separated by spaces). It adds "xen,passthrough" to the corresponding
   dtb nodes in xen device tree blob.
-  This option is valid in the following two cases:
+  This option is valid in the following cases:
 
   1. When PASSTHROUGH_DTS_REPO is provided.
   With this option, the partial device trees (corresponding to the
@@ -149,7 +163,12 @@ Where:
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
index ccad03d82b30..2dd98fb94d3e 100644
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
@@ -133,6 +146,34 @@ function compile_merge_partial_dts()
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
+                # Execute lopper with the following assists:
+                # - extract: used to take the target node, extract it from the
+                #   system device tree, chase the phandle references and place
+                #   it in a new extracted tree structure,
+                # - extract-xen: used to perform Xen specific modifications
+                #   on the extracted tree structure e.g. adding "xen,path",
+                #   "xen,reg", interrupt-parent properties.
+                # For additional information, please see the lopper's README
+                # file as well as usage of the mentioned assists.
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
@@ -146,8 +187,8 @@ function compile_merge_partial_dts()
 
         for devpath in ${DOMU_PASSTHROUGH_PATHS[$i]}
         do
-            file=${devpath##*/}
-            file="$partial_dts_dir"/"$file".dts
+            node=${devpath##*/}
+            file="$partial_dts_dir"/"$node".dts
 
             # All the subsequent dts files should not have dts version mentioned
             if test $j -gt 1
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 1f8ab5ffd193..b24dca2b7f7e 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -1138,10 +1138,28 @@ fi
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
+            # Default for ZynqMP MPSoC.
+            # The following command instructs lopper's extract assist to always
+            # include zynqmp-firmware node (as it contains e.g. clock-controller
+            # required by most of the devices) in the extracted tree structure
+            # and to drop nodes/properties during the extraction process that
+            # are not needed.
+            LOPPER_CMD="-i zynqmp-firmware -x interrupt-controller -x pinctrl -x power-domains -x resets -x current-speed"
+        fi
+        compile_merge_partial_dts $output_dir
+    fi
     if test $? -ne 0
     then
         # Remove the output dir holding the partial dtbs in case of any error
-- 
2.25.1


