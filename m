Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3712A49CCE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 16:08:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898800.1307291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to1xu-0002Ji-0i; Fri, 28 Feb 2025 15:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898800.1307291; Fri, 28 Feb 2025 15:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to1xt-0002HG-TP; Fri, 28 Feb 2025 15:07:49 +0000
Received: by outflank-mailman (input) for mailman id 898800;
 Fri, 28 Feb 2025 15:07:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sW/2=VT=amd.com=Luca.Miccio@srs-se1.protection.inumbo.net>)
 id 1to1xs-0002HA-KS
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 15:07:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2009::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c15aa4c0-f5e5-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 16:07:43 +0100 (CET)
Received: from BN0PR02CA0023.namprd02.prod.outlook.com (2603:10b6:408:e4::28)
 by DS0PR12MB8574.namprd12.prod.outlook.com (2603:10b6:8:166::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 15:07:35 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:e4:cafe::fd) by BN0PR02CA0023.outlook.office365.com
 (2603:10b6:408:e4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Fri,
 28 Feb 2025 15:07:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.0 via Frontend Transport; Fri, 28 Feb 2025 15:07:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Feb
 2025 09:07:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Feb
 2025 09:07:33 -0600
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 28 Feb 2025 09:07:33 -0600
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
X-Inumbo-ID: c15aa4c0-f5e5-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyip8UwbSo5cZSar9NzSalYHlH5kgLTnjY3OjLQvCpRZKaZSoaXGXtHMA0G/cvlHkyleSCXPf8h7P2ANBTM1mp4MODrjS2VvPKalHyf0NavhbClM8l1mJhSwZV7HdpzErQ7AqUSht+Hnf4clfDhYf2xPan11yxJnXhKAsbM835a092wFMxuqaFJNMTjclmswi0ybixoel540wFh54lHXsZpTWtSFWUQqpJZENm2VLqqdc+XnG3Fy1KgjwaupziyBTZvui3nC5vvsauXQcJcix6TiCBl3IrQ4h8yt0t+aeWQHDbntYSkKGb52U5jFaIq5CN1TDAj5tAdS4d7AszePTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nq9eER0l5bHBv8+rIqj6HYS/ouR2RHweNjgCQC5WmQE=;
 b=dDr3l87Ym0ml4MytF4cNw/0tqB/EAJUAo349uLYgyPI087vUxPQR3aSeCZ8HhodiWN8GGLBSdQDs+v44+RyR47VX7LEBerS2guEFcwQrocRbDXSPpZc/lyV7o3CtkssV3JC6AB/hRC6vACRl/A8CNDKsKWk9Pccp7Bgois07wpyJFABazYk/VlOIWM9SRbsApdJ+yUfDoD/mBDEukDqitoJn4C5oRukhprTiL0T1xTEESxzrnM1zj5HUhdYTSt4oKIKKu/icuIws85ocdThlIKDMj496ZSdQqN9/ppHRm/4NQRBqnxPios57rv/QtQEMwNx5vraO4VjgWl3XncIjfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nq9eER0l5bHBv8+rIqj6HYS/ouR2RHweNjgCQC5WmQE=;
 b=iQszEoKbH/HQ3UuUjIdFtCM8FrCpGrOEak+tjUUNzWjBgxBYd6V2NiDF09RQ7jjwUAqAjtFJFyt1Cz8Hnr5M217jSxKpcjKJ8wCgEV08oib2Gfv56TiZSil8tbLZCry5GVa3k9uhY8k+UHrHMXJhWUxmjEXiuxE1yHonbFqGe2E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Luca Miccio <luca.miccio@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>
Subject: [ImageBuilder] uboot-script-gen: handle reserved memory regions
Date: Fri, 28 Feb 2025 07:07:33 -0800
Message-ID: <20250228150733.3945774-1-luca.miccio@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|DS0PR12MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 7343034a-4df2-492b-9825-08dd5809a184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uDPUlNehy6jasvdfFRlBdC4wGXEsTgnqngkKLOI1GLATQ4idmeOUtOxthUCP?=
 =?us-ascii?Q?4ZlTAmjOcaNYNDssjJ+tX2AwY/ym0E3Ni1mGkTmeA3X6Ube8mudzAmirSgvj?=
 =?us-ascii?Q?aT89ib40RRWFitj1g2nqBTX3VzXoXP+IZJuLx713Im4Kv0j2UlxDP9uRRkzU?=
 =?us-ascii?Q?LDTluUwAxeZBTEsEnVhVKytgKOMPgtVJeT4ODisK8ASqc0I94a2UeqJsaTZa?=
 =?us-ascii?Q?uk3hoxUPmGz6f5HVcg5LqV1ejFD6vBJ9c/MpoIxTiMrxqJv7G6ih9eUNsHlp?=
 =?us-ascii?Q?3oxp0j+yT8+HDqlGot3YEzSDfeRbMN1OVIbcq3QaIvarrtClf72JR5ev54CP?=
 =?us-ascii?Q?OmNz++PVP5A6C7L+qtcrz8yxhIo1DEdNF2p3nRnVWKHF9XoQpp2/P/uVV/FL?=
 =?us-ascii?Q?sBGCWHhWv+2ygOsuC0VlaitkClp1VPTnFgnlmV2xHiSxYp1TR0Q7yimRbhxF?=
 =?us-ascii?Q?STUGAmTI04fRPFKPlPgzLXBoCeXwNRoeyFGHqamAjwjzpODnhJpOTAsaqggY?=
 =?us-ascii?Q?T5+ZfznMFVk8pii6RdwjTD/F3MnJUYWzcxeGlSPgbYLNaqB/UvAiwUl1AXAy?=
 =?us-ascii?Q?AEVarJdyqHi2fENG3pFnzcrDFMPnIBo9griTFTDou9iSbuh9BJvnOlwCcqs8?=
 =?us-ascii?Q?5LcL7e11rxC3Rde9fCz46t9HKTnxbXpyJwqHrEB7HkEnI0Ml9yW8m3FH1hHl?=
 =?us-ascii?Q?oahU4VK6jCPsYmndJra8GXC6huaN7v6pmUqOtufGCVpdTBFPpe1A0o7rp+Y7?=
 =?us-ascii?Q?wkqiO0Tsjpk8p1OqaD69P/z1XFwdkARm6MLQDwAYUziLrhi5VDONJsxSiVgA?=
 =?us-ascii?Q?p81imcMrt4LTxTgbJGbus2oeRGrAERBaEJpwk/FIH4/BDu6i/IFjubPFDR4w?=
 =?us-ascii?Q?X7pmeXCNu1jjYQ/zHCeq2kfmk41F1nI05YkTTIOYNiE8WHsbvaU7c5KMW65r?=
 =?us-ascii?Q?W9DGd9sBlkoOcznLlxklypNh8ExV4XcdGcpJu3SQvzYGxjc3qgJemM/4F1KB?=
 =?us-ascii?Q?Dj6K9SAvWMdDh1YEj3JhCvZSK0alwz7ozXuE+R+SM+s5cqf4tB4PUP2ws3QM?=
 =?us-ascii?Q?zeM27BLG75jvuqN1/qZQDw8DZyYdHjMZ4nOv/iZedUnq0Yb+OvqZ6bc/ruxG?=
 =?us-ascii?Q?fa0IkBUNaKhGnZD1pfiKVSBEcruXmoMkmVntvL6UVlTf6r3tUAatrv/tGxq2?=
 =?us-ascii?Q?l7RBt/DXqThukPBShgjHzc7S44TW33W9TVWVipT3iy3d9BctC1CWKH2ZKnrP?=
 =?us-ascii?Q?LpjBO09DJX4IpxNNwLwjvN0YTtiNrD5LOiFew1v7rV6eO1VOqmLMkFCJa/hp?=
 =?us-ascii?Q?yxIYp5iJSjF53fie681ycRP/7g0wiJEdnVT7aNaa6yZDp84d+PTb/8VWmuqK?=
 =?us-ascii?Q?cRSjJTkPmvKnV18zV/SkodcSJBypcy1EXjkfWgqbtcUzMID7P8xxs/MIPj7F?=
 =?us-ascii?Q?0BbLZ/uQkk4muW1JbY83Ki+6PRFLD5nh3m2K03nw7+bfNMRqTK20OlIt6CZ7?=
 =?us-ascii?Q?xLdg2Hj3VCNdqCk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 15:07:34.3781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7343034a-4df2-492b-9825-08dd5809a184
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8574

Currently, the uboot-script-gen does not account for reserved memory
regions in the device tree. This oversight can lead to scenarios where
one or more boot modules overlap with a reserved region. As a result,
Xen will always crash upon detecting this overlap. However, the crash
will be silent (without output) if earlyprintk is not enabled, which is
the default setting at the moment.

To address this issue, add a function that iterates over the
reserved-memory nodes and populates an array. This array will be used
later to calculate the load address for any given file.

Signed-off-by: Luca Miccio <luca.miccio@amd.com>
---
 scripts/uboot-script-gen | 59 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index db2c011..cd0d202 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -468,6 +468,42 @@ function device_tree_editing()
     fi
 }
 
+function fill_reserved_spaces_from_dtb()
+{
+    if [ ! -f $DEVICE_TREE ]
+    then
+        echo "File $DEVICE_TREE doesn't exist, exiting";
+        cleanup_and_return_err
+    fi
+
+    addr_cells=$(fdtget -t x $DEVICE_TREE /reserved-memory '#address-cells')
+    size_cells=$(fdtget -t x $DEVICE_TREE /reserved-memory '#size-cells')
+    for node in $(fdtget -l $DEVICE_TREE /reserved-memory); do
+        reg_values=($(fdtget -t x $DEVICE_TREE /reserved-memory/$node reg))
+    
+        for ((i=0; i<${#reg_values[@]}; i+=addr_cells+size_cells)); do
+            addr=0
+            size=0
+            
+            for ((j=0; j<addr_cells; j++)); do
+                addr=$((addr << 32 | 0x${reg_values[i+j]}))
+            done
+            
+            for ((j=0; j<size_cells; j++)); do
+                size=$((size << 32 | 0x${reg_values[i+addr_cells+j]}))
+            done
+            
+            addr=$(printf "0x%X" $addr)
+            size=$(printf "0x%X" $size)
+        done
+
+        # Add the reserved space to the list and avoid duplicates
+        if [[ ! " ${RESERVED_MEM_SPACES[@]} " =~ " ${addr},${size} " ]]; then
+            RESERVED_MEM_SPACES+=("${addr},${size}")
+        fi
+    done
+}
+
 # Read effective image size from a header, which may be larger than the filesize
 # due to noload sections, e.g. bss.
 function get_image_size()
@@ -505,9 +541,24 @@ function add_size()
         size=${image_size}
     fi
 
-    memaddr=$(( $memaddr + $size + $offset - 1))
-    memaddr=$(( $memaddr & ~($offset - 1) ))
-    memaddr=`printf "0x%X\n" $memaddr`
+    # Try to place the file at the first available space...
+    local new_memaddr=$(( (memaddr + size + offset - 1) & ~(offset - 1) ))
+
+    # ...then check if it overlaps with any reserved space
+    for reserved_space in "${RESERVED_MEM_SPACES[@]}"; do
+        local reserved_start=${reserved_space%,*}
+        local reserved_size=${reserved_space#*,}
+        local reserved_end=$((reserved_start + reserved_size))
+
+        if [[ $new_memaddr -le $reserved_end ]] && \
+           [[ $((new_memaddr + size)) -ge $reserved_start ]]; then
+            # In that case, place the file at the next available space
+            # after the reserved one
+            new_memaddr=$(( (reserved_end + offset) & ~(offset - 1) ))
+        fi
+    done
+
+    memaddr=$(printf "0x%X\n" $new_memaddr)
     filesize=$size
 }
 
@@ -1373,6 +1424,8 @@ uboot_addr=$memaddr
 memaddr=$(( $memaddr + $offset ))
 memaddr=`printf "0x%X\n" $memaddr`
 
+fill_reserved_spaces_from_dtb
+
 if test "$os" = "xen"
 then
     xen_file_loading
-- 
2.25.1


