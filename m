Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC11A55972
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:13:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904124.1312096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJT1-0008NN-8U; Thu, 06 Mar 2025 22:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904124.1312096; Thu, 06 Mar 2025 22:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJT1-0008Lu-5d; Thu, 06 Mar 2025 22:13:23 +0000
Received: by outflank-mailman (input) for mailman id 904124;
 Thu, 06 Mar 2025 22:13:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJT0-0008Lo-JF
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:13:22 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2413::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 359bc024-fad8-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 23:13:20 +0100 (CET)
Received: from BL1PR13CA0104.namprd13.prod.outlook.com (2603:10b6:208:2b9::19)
 by CYYPR12MB9014.namprd12.prod.outlook.com (2603:10b6:930:bf::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 22:13:13 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::5a) by BL1PR13CA0104.outlook.office365.com
 (2603:10b6:208:2b9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.11 via Frontend Transport; Thu,
 6 Mar 2025 22:13:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 22:13:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:13:12 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:13:12 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:13:12 -0600
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
X-Inumbo-ID: 359bc024-fad8-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxp0p9dOU+3BOeAvjM5QmSANGC0xDaghUTvzLeiQSCrRLawmtYvhOxx2mDPyv6R/KsnkU0+cvNSFMH8n+QOnE21q6z0I1IUkn8pl5/1LSjo2lBX51Lxr1yAJwc5G531osCZIdP7I1sL20ZGZR7XMk5qd9P8GpprEoU2lZzKdM8oteNBFUnTmnE1u47hFzkr8p2gtUw4WRi4CXw0NqVZqIFSrpzEGOr3fyPb6JV5oJC5zUpRLgCDU2Yt6JnZgg4J0gx0x5FS2wH88IdPyIdHnU/6ndR0cML7BSdwa00gGoshtRt+n8bW3REfR2MVGa2il/BouOHURxiN5a6+GNwNS2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaJNdntK/qgZ8HTPyL3RyCw3rWdNqE2r7A8d00ZRWjw=;
 b=kjKk4o+FLd889ZdP8LUjdnu503JYod2KLMynhPBHeHvhjeePuePiuIJdPNbMMBs94dG2sE1+Q7VtOTvFtrELrS7OVO/mXALIKc3FLp3ho6ACe6tfUSW+UWEXeQDO0GRzKAPPu0bqRDM8IHD2WudMROwiX5rWCNUFrnI6W+wMYp4J1LdvAKrfc360xK5oyco/a8Z8uAnyvdZoupHEdI951BfPd7pBwpaCM6AkN0d2ahqYk3z5EFf05zjp9hUO4CecDOVUm7UtMkHH9n63sVinEv3uMsYm8zx4N47TOMJvNyuvqQxKxHcseohXPQVJHs3cnkfwVzrqoWqVQpefbntqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaJNdntK/qgZ8HTPyL3RyCw3rWdNqE2r7A8d00ZRWjw=;
 b=dmL9czB37yVgk5CzEIXEfiuFxkIKez+NO0OpIENMIP4wbaWixlRYHBIDnToJSzIBVGRuCSR0zeKGeEpbUHKa9LTj+HP2L8gY2+YLfymegmYEtSEyXykYjs7rFrMKfAHX5nuDabYvTWSDlRH2rr1W0UvB0cCD33xUGgDKeS0T9VI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [IMAGEBUILDER PATCH] Add domain capabilities
Date: Thu, 6 Mar 2025 17:13:10 -0500
Message-ID: <20250306221310.203221-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|CYYPR12MB9014:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e7cdd9-9b92-4405-479a-08dd5cfc1666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tKg3Mp6O2AHCEGkPbejtEUQUKfOFiEwb18kWWhBCAfA2XzExs/CijzCchfF8?=
 =?us-ascii?Q?UFUtuIDrvEt9xikxrjW93OHhj3+6u6ItRZDx/c+4fcLE8i6rXqN3Egz8fwRG?=
 =?us-ascii?Q?ecZgAasVdM2TVzPQvTyVAjTFnBWap8zMd5xHjqfi9DWe0rpCEmqoSxEdG8ag?=
 =?us-ascii?Q?C9ItnrbM728bBPRMSO0wpSmK1iAALRxTRt4lr+N5D9N37rqHEZpIFyvEF1jD?=
 =?us-ascii?Q?YfOw+Hq8glLwcxfcXPFBaA2UcP9ie/7ftiKEIdsBP5H2I17g1Q/5tkGgqktF?=
 =?us-ascii?Q?cIKKQrw4GWEw7uUHUMkIpRoPgnth6JqHt+/gBglDCvGP/crfppxOjsTqCggU?=
 =?us-ascii?Q?AUtqwGlEkC1C4wTuEfzO028YhXjz3AJrbSDYvwh/qkiWUNLR1DTIQMR3f1bA?=
 =?us-ascii?Q?ohf/Rch5oOBqRWbICmOadUNIttTUE63POXanMlp0eJi4CGeXR5NZPbsIj4aU?=
 =?us-ascii?Q?2qSZB1cAMho00SPx7v/trqkJ9H1Co1H0NM/AbaBTW15GjYsOILvZa5R4fAvx?=
 =?us-ascii?Q?pRzXTxqOKVpE9Aod93AT1LvrThoGAY0KvMvvys+xEJLWtoD445aW+GP2RfGI?=
 =?us-ascii?Q?I/1aXM1vdR56b6sm1yV6jOKH/cYDa3a7qFrpH3n5JhFVe3dCb5YcTjx4PT3W?=
 =?us-ascii?Q?y4hZV2NFR450xWGhw1nsSlCEEufG0nP5tJlgwlXKxbD1yW5Z9yKiW6/9MBcR?=
 =?us-ascii?Q?7uGlgDT4DYqFnWHntSKIdsZon1o/ZIQNF1J0MmH3nSPVvOzIXu/9H0ZlI1d6?=
 =?us-ascii?Q?7yIOrGPrjjjx63fWJX8BXpDsofV5y+36JfFOsooWRKllETxU+r/sVv8tsqOU?=
 =?us-ascii?Q?CH5jW5Dku8wibijg11T5pX8+DLVO+/a4/NEdhVQQ/5aLC+hwL4CQGt0HUfpi?=
 =?us-ascii?Q?GOh5uACz1w/vXh6pZXpxiUtSGoKbWKOwLVTJ5jqDBjm9bbXwpH7MVd+qZNZf?=
 =?us-ascii?Q?4KvRC/gg7F5NLpKJRSQukTS/VfbAJcpHs8G3uqPVayfBWT4ByOf4lImbEYr3?=
 =?us-ascii?Q?hcgUGBUk/3/1+rQZeJUDBOAU1FriS7LuWuxF07//q9YTpNw6ul2IjR91ZOo4?=
 =?us-ascii?Q?Ss2rHaRgJBkvJXe46AUn0om2q3ftIpP5Jps/irPnpm0ozyuQhaQpFvLrOmfo?=
 =?us-ascii?Q?U7ilJqGod0y2SI5t2QKECbyd7yqt5zF+smLH3oa9EMnuw6qlK5wtwL5/2Mfc?=
 =?us-ascii?Q?aqIuEEusEoi28pknBeMLevMoV17Iq25oH6lPuoCaNSKR8Qwuju1On9tDgTmG?=
 =?us-ascii?Q?80R/f9vLhTmIbJt1BTRi1GfSKJT8uN7W90o133Wbhb46s5/kGhbAYDhRWJ7H?=
 =?us-ascii?Q?6ZfFUWyZ8IQymvHE3QpmOKJFHu7gp6q4ku89+Xq8z7cPxDTMsXNN+qYKdx3S?=
 =?us-ascii?Q?Orkwv50e1FV0qN+PSUwvTpUnWpqnYmVSfklpdwxzJqbnleYCIuTTYIviFFQx?=
 =?us-ascii?Q?CgHpzyGc1cEHwgG/YA8pbMsP5wBXjZ8m/zXYw6hBV0EcBhUNOdblXCoX027z?=
 =?us-ascii?Q?J156IDGNrLcq0UA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:13:13.3325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e7cdd9-9b92-4405-479a-08dd5cfc1666
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9014

Add domain capabilities to creating disaggregated systems.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 README.md                | 16 ++++++++++++++
 scripts/uboot-script-gen | 47 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/README.md b/README.md
index ae2fdfd..25c9b6e 100644
--- a/README.md
+++ b/README.md
@@ -250,6 +250,22 @@ Where:
   Set driver_domain in xl config file. This option is only available for
   the disk_image script.
 
+- DOMU_CAPS[number] = "string" or "hex" (optional)
+  A "|"-concatentated string of capabilities:
+    - control
+    - hardware
+    - xenstore
+    - dom0 (All of the above)
+    - none
+
+  e.g. "control|hardware"
+
+  Or a numeric bitwise flags to specify domain capabilities:
+  0: None
+  1: Control
+  2: Hardware
+  4: Xenstore
+
 - LINUX is optional but specifies the Linux kernel for when Xen is NOT
   used.  To enable this set any LINUX\_\* variables and do NOT set the
   XEN variable.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index db2c011..397d73b 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -309,6 +309,43 @@ function add_device_tree_cpupools()
     done
 }
 
+function parse_domain_caps()
+{
+    local caps_str="$1"
+    local caps=0
+
+    for x in $( echo $caps_str | sed 's/|/ /g' | tr '[:upper:]' '[:lower:]' )
+    do
+        case "$x" in
+        none)
+            caps=$(( caps | 0 ))
+            ;;
+        control)
+            caps=$(( caps | 0x1 ))
+            ;;
+        hardware)
+            caps=$(( caps | 0x2 ))
+            ;;
+        xenstore)
+            caps=$(( caps | 0x4 ))
+            ;;
+        dom0|domain0)
+            caps=$(( caps | 0x7 ))
+            ;;
+        [0-9]*|0x[0-9a-fA-f]*)
+            caps=$(( caps | $x ))
+            ;;
+        *)
+            return 1
+            ;;
+        esac
+    done
+
+    echo "$caps"
+
+    return 0
+}
+
 function xen_device_tree_editing()
 {
     dt_set "/chosen" "#address-cells" "hex" "0x2"
@@ -386,6 +423,16 @@ function xen_device_tree_editing()
         then
             dt_set "/chosen/domU$i" "max_maptrack_frames" "int" "${DOMU_MAPTRACK_FRAMES[i]}"
         fi
+        if test -n "${DOMU_CAPS[i]}"
+        then
+            local caps
+
+            if ! caps=$( parse_domain_caps ${DOMU_CAPS[i]} ) ; then
+                echo "Invalid DOMU_CAPS[$i] \"${DOMU_CAPS[i]}\""
+                cleanup_and_return_err
+            fi
+            dt_set "/chosen/domU$i" "capabilities" "int" "$caps"
+        fi
 
         if test -n "${DOMU_SHARED_MEM[i]}"
         then
-- 
2.48.1


