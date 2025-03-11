Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE67A5BEAB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907848.1315038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxac-000635-0P; Tue, 11 Mar 2025 11:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907848.1315038; Tue, 11 Mar 2025 11:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxab-00061a-Tf; Tue, 11 Mar 2025 11:16:01 +0000
Received: by outflank-mailman (input) for mailman id 907848;
 Tue, 11 Mar 2025 11:15:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72vt=V6=amd.com=Luca.Miccio@srs-se1.protection.inumbo.net>)
 id 1trxaZ-00061U-Pn
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:15:59 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2414::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3205fc32-fe6a-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 12:15:54 +0100 (CET)
Received: from BN9P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::29)
 by PH8PR12MB7232.namprd12.prod.outlook.com (2603:10b6:510:224::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 11:15:49 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:10a:cafe::d7) by BN9P221CA0030.outlook.office365.com
 (2603:10b6:408:10a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Tue,
 11 Mar 2025 11:15:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 11:15:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 06:15:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 06:15:48 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 11 Mar 2025 06:15:48 -0500
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
X-Inumbo-ID: 3205fc32-fe6a-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS+AfzYU7oSEqNYiW2DxmvY1hTOUqc9LXy3u7KT5W0kncGjlsMrBE+NdM1ZNH9Wi+AgueOwwsBypFQcPcRBrdcUoY6UvreQROzCgEhT/cNyI9jP+9/84JTHz7cL9D1b9xGL39guJOkGn2MBrisN/tGpUnpG9rT6G0cwCy5hjPQNhIYbwLmrS0Pv+uZVIlAyjUBuvvvzwWyl6KPADDJ/c+dvXlSy2PrNqpRMfy/K673KabS3d+NJiQeauEjcDVWOgRze3uVDL+6KKXxgSQtkAQgJ50D1G4W7aluOCcESzdyaH1JeqyrGr85UDmBg/mJRrpgcFX71PMlzQgLBxIMLJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bOrbxElBQUFEUmULX+wor0Ego3z9F5Xqr1SL2zMeko=;
 b=ls2+XuWCug2DwwqUtd+OEMFYZEuLGjQSBO39JSRoHsTjeHjm0ASO+OtbZaElJ5yO7osSlIodvP5Xj3HTZNm5mbiBjjzo+cLoZznyY6LjqJIbW/gQk153CQDkCWTvU9hfpXozgH9zBaXsFUzYu2iS4FPn+P8JZ3DEJMLT/+HpXMZzQH/WEAdNirSXOvIyvVvC6gWAASiRZgrgpjXuCqi8Shd/3entH2PBi5ZKBb6rkNi33Rn3hB2qCcqPKqNTxIa/wGw8jrgzOotB3cTs7zycIR3usoh5J0o+HCmYZaxrywyTN/xfpHRe4+IFdAx4IK901hUaqWzIE4gBZzHM9fXcOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bOrbxElBQUFEUmULX+wor0Ego3z9F5Xqr1SL2zMeko=;
 b=p0618K/w/m3Fy+dqZMrVfe0dhj6QN3RDdfzUnJaxzviMPLl4uCAdV0wzb4X0+ndMzWCJp+fPifTAbf0h0DQeVe2e3sr6WTj8DnDnp+KQzN8hOQ3Ytpgfn4o7WrsvjQTuX0SLr5/nnPb1e0uqrMrcu9nGh7gxoJD5wUWFgOrD3H0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Luca Miccio <luca.miccio@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>
Subject: [ImageBuilder][PATCH v2] uboot-script-gen: handle reserved memory regions
Date: Tue, 11 Mar 2025 04:15:48 -0700
Message-ID: <20250311111548.3696851-1-luca.miccio@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: luca.miccio@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|PH8PR12MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: fe29296a-0a91-4674-80eb-08dd608e13f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VshcLKHJhyrQlbNTFocgjyJwExa9euBceNqoilaRs7SHWXlcdHTvoWMFmx/n?=
 =?us-ascii?Q?eFwMpw5y1X2xkOWK/s9g/xlCsZC3+rx8mAzg8zo3jtTRnK9Me6TbfOIwWOeD?=
 =?us-ascii?Q?6XiflguidfQcQ5xc8OFc8zkC1S34KnuLyK1+FZBhSOVwZ4KydRrw0UJMRvOX?=
 =?us-ascii?Q?GwyUOVG+gUfiurkWccP+kOXcSQbraOSO803gyaiQ2V3hbGtXHhLZwJ8J0wOK?=
 =?us-ascii?Q?KAuvASGZSXxz78f4hcu3lUpR8l83QpeCxF7+Mb43Lzqib6rZyJGBvkZmJkKz?=
 =?us-ascii?Q?t6tB11BUqICDyNHpff16ed3m3wdfFblF1TGU2e+PEmfGMBRslCkjyCx3o3bL?=
 =?us-ascii?Q?6RH3kiOAvB490wwSO4AKGRQW/fHJ7dfMrL4oeG5FgVb3OvkltrxeIYwhb9sa?=
 =?us-ascii?Q?D5Gx6WuAxfpKvZVdun2v2nWw+75e8PlSMcG6UBzqyc2kmJynwwsEhCBgTNQd?=
 =?us-ascii?Q?un9b0WthjyhV1188WikmIF5hg+6BMXQVBopQdem9SdqDPT2A6qtrb5066etX?=
 =?us-ascii?Q?vL/ZwBcilcHA2z/DhogNRh75mm8XEEdSEvY9xaHM98bqDRlJ4mG8FGd3R6X/?=
 =?us-ascii?Q?yQexfeBqsRtKPoUNxJlM8c3CJ+D2+calhAb2ArrgCr3+5YMmhz6ez6AL80yX?=
 =?us-ascii?Q?vIiciuyRgkDsSNBHsP7ls4KvR0QwCy5iL28vyp3Wg/sOemeBzUL1uveBMsuP?=
 =?us-ascii?Q?W4lBFZsNVku8Ln4iaJ7id4RF0GKPZ8oKrXyVaPWvo0KDKTYRKzDkQqv0Io0k?=
 =?us-ascii?Q?3yW2Z2R8HMIpRLp5aaMdaY8hvCrYfTZIu9G7pC90WEdg4KsHIcYMsCD/YvI0?=
 =?us-ascii?Q?LLp3dRNWh0pboqAh2fugPXFdzsjO4ilpXXSgOGddT7WdSTY+HWav77o9B3LE?=
 =?us-ascii?Q?Rx/FKCImUvItOrHIJV1l7fZjD0/MOcro4bx+cJYBoiyEpYnFSlcBmbmTd3ut?=
 =?us-ascii?Q?3dexoFl8xpAvJ+v4fBOoJtGh3P+PMohOAL3kmo2L8U8Co8QMOSjhkEmucJTx?=
 =?us-ascii?Q?3knsBeUPo63vkGLcC2u0gnrzegJhkhpaWe42zfPgWoHUas3EQHkKuYf9DVZH?=
 =?us-ascii?Q?VBfRBFo23OSkjnhX+U81V6EpAafrOYycClsafzJTr76m2G7YlIlFKib4C7/W?=
 =?us-ascii?Q?wRvSHocIeKh3sGdCvLe/U19JAEmXXmwVisINlBzispiWPI8nu5S8orGCxzNf?=
 =?us-ascii?Q?XB1vViuwYhS7iEWGyvb0ZGRvWvVxxLQNO08tR9QVo+aj6J5gGiPwpK3SOh5j?=
 =?us-ascii?Q?Bh+Iffn/YCYiMkRBM2knRu0fe1Is6aCTGr+mOiWOI1G019CX7seIwZliX6st?=
 =?us-ascii?Q?Jr9fBN1FLl2ZmO0guvrU0eCaCSdVlLxAsnJ7ADfIytAFev27nXpkjLr+19lQ?=
 =?us-ascii?Q?qMEPUbpBUuzCG7taVcBoMWsJQmQ4l/++/+mo//WFKa3fPeKkb/TbWWGS5N+w?=
 =?us-ascii?Q?8F3KKdtfcOOtELiHdN4rkGJrttPlYxS+L0ZbiSc+Lr1QjViXJWTJvFk/ZTF/?=
 =?us-ascii?Q?LGdF+nmYiABLVmM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 11:15:49.2226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe29296a-0a91-4674-80eb-08dd608e13f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7232

Currently, the uboot-script-gen does not account for reserved memory
regions in the device tree. This oversight can lead to scenarios where
one or more boot modules overlap with a reserved region. As a result,
Xen will always crash upon detecting this overlap. However, the crash
will be silent (without output) if earlyprintk is not enabled, which is
the default setting at the moment.

To address this issue, add a function that iterates over the
reserved-memory nodes if any and populates an array. This array will
be used later to calculate the load address for any given file.

Signed-off-by: Luca Miccio <luca.miccio@amd.com>
---
v1->v2
 - added local
 - check if reserved node exists
 - handle fdtget errors
 - use numeric check for duplicates
---
 scripts/uboot-script-gen | 84 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index db2c011..edc6a4c 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -468,6 +468,67 @@ function device_tree_editing()
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
+    # Check if reserved-memory node exists
+    if ! fdtget -l $DEVICE_TREE /reserved-memory &> /dev/null
+    then
+        return
+    fi
+
+    local addr_cells=$(fdtget -t x $DEVICE_TREE /reserved-memory '#address-cells' 2> /dev/null\
+                    || fdtget -t x $DEVICE_TREE / '#address-cells' 2> /dev/null)
+    local size_cells=$(fdtget -t x $DEVICE_TREE /reserved-memory '#size-cells' 2> /dev/null\
+                    || fdtget -t x $DEVICE_TREE / '#size-cells' 2> /dev/null)
+
+    if [ -z "$addr_cells" ] || [ -z "$size_cells" ]; then
+        echo "Could not find #address-cells or #size-cells properties for reserved-memory node in $DEVICE_TREE"
+        cleanup_and_return_err
+    fi
+
+    for node in $(fdtget -l $DEVICE_TREE /reserved-memory); do
+        local reg_values=($(fdtget -t x $DEVICE_TREE /reserved-memory/$node reg))
+        local i=0
+        for ((i=0; i<${#reg_values[@]}; i+=addr_cells+size_cells)); do
+            local addr=0
+            local size=0
+            local j=0
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
+        local duplicate=0
+        for reserved_space in "${RESERVED_MEM_SPACES[@]}"; do
+            local reserved_start=${reserved_space%,*}
+            local reserved_size=${reserved_space#*,}
+
+            if [[ $addr -eq $reserved_start ]] && [[ $size -eq $reserved_size ]]; then
+                duplicate=1
+                break
+            fi
+        done
+        if [ $duplicate -eq 0 ]; then
+            RESERVED_MEM_SPACES+=("${addr},${size}")
+        fi
+    done
+}
+
 # Read effective image size from a header, which may be larger than the filesize
 # due to noload sections, e.g. bss.
 function get_image_size()
@@ -505,9 +566,24 @@ function add_size()
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
 
@@ -1373,6 +1449,8 @@ uboot_addr=$memaddr
 memaddr=$(( $memaddr + $offset ))
 memaddr=`printf "0x%X\n" $memaddr`
 
+fill_reserved_spaces_from_dtb
+
 if test "$os" = "xen"
 then
     xen_file_loading
-- 
2.25.1


