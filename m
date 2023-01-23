Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F0677C29
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 14:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482837.748570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJwb7-0000yk-8v; Mon, 23 Jan 2023 13:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482837.748570; Mon, 23 Jan 2023 13:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJwb7-0000x1-6C; Mon, 23 Jan 2023 13:10:53 +0000
Received: by outflank-mailman (input) for mailman id 482837;
 Mon, 23 Jan 2023 13:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StYb=5U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pJwb5-0000wv-Q0
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 13:10:51 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a5e65d9-9b1f-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 14:10:49 +0100 (CET)
Received: from MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::33)
 by CH3PR12MB8260.namprd12.prod.outlook.com (2603:10b6:610:12a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 13:10:46 +0000
Received: from CO1NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::3) by MW4P221CA0028.outlook.office365.com
 (2603:10b6:303:8b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 13:10:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT073.mail.protection.outlook.com (10.13.174.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 13:10:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 07:10:42 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 23 Jan 2023 07:10:41 -0600
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
X-Inumbo-ID: 5a5e65d9-9b1f-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaxQRjwEKlCKIYQSHei0VjDhCk87oT9CA2qD/R/ubt5m64r2zEK4+6Dq/3EGuF4tjwHy37ZbtB0IAdIR3znkZrAsKpvL5AObv0c5Cp4JSeMgaRpF0dYY8yb5IREWyvnaLfWdXgfNh6bTNDVGsSfJz+Hrc9PMb5K8ZFdpjcia3ZQjv5qz1V7qI0n9aH0TAZnKmew9DxSj8gyllwL7U8UABRwywCyXqqcfM4FtHi5TWgrq3D2oJmGv/WIumRC9jxoPbCctl5ocgVySBOSLNdOC/C0nYs45hzWBZHPn8Dy1Byj2/EwyvqTGnLyLpdW+SOoIAMa/10qdKKAZJm+wgR482A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1S9RGzAXZbvL+p2nKWN2tHznjQW89E7pjL+KiBsk+Tw=;
 b=gr2rEoa+oF01X5JHjJcBrgDi6xZ16bzHNomBRCinWcNTIY0UUMr4bMPP7T/3igT117yAS59+3xaasTOnS/jpH7ltmRsfvzXA8JZQWzeNUTy6mzzka7a657g6d6j3oDmhGR/5O4XJIwI/IWMrHIak2i65U/DBt26RHqCGrJ7mSxu2Q0SvHaZ+58bMjhD2AeOvSCCdeSwSUXnsZQ3fsI6akUqWc63JJ/tpv80UlRNE+fuxeuS6RDtvBqlEw3xHutCdPDp+ydSAfzk2QTlY1TDvsg289Ag7cM6S/LplUUZHMdG2vSppdUxdp2tPU0GfnZGwEZ3j8Eu77bWwd+7xqmx+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1S9RGzAXZbvL+p2nKWN2tHznjQW89E7pjL+KiBsk+Tw=;
 b=b3Ucyh5ZAyz6pn6dCkpASVKNhYR9j3f+d5obb+xi56jhK0l1bWO8XX4KTWLMAe9td4XfJE5T9tXUjTr/pknnmf0pTwqhW9Woo9aIbmBD+l0NVSv6lmFglmpRMliwQ8Vjuj0LjYC03L96ZdDHWL6rvoVxAGHUuy0JOOx76/EJgn8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, <julien@xen.org>,
	<ayankuma@amd.com>
Subject: [PATCH] automation: Modify static-mem check in qemu-smoke-dom0less-arm64.sh
Date: Mon, 23 Jan 2023 14:10:23 +0100
Message-ID: <20230123131023.9408-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT073:EE_|CH3PR12MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d13261-ea34-43a9-4a8e-08dafd433ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4ID1OK+19kbj+uP/F4R5D7MaVYC3DpcTiRKoc3UZJjMZ/xKxrvZx+cIjagXiRlkFzB9mUyRlZM6UZWRJnlFB/xM+n6oZh1+jxo7P6kNTr2+GYdKl9t6s81QELPNXHvfkd5D0xYLZtIkKZscfDnV1lFKDkEAfaWQr2i93HTn7XHWXAPxpQla7pzU3CcJk4VtNjCTAvsdYZb0lHaFoRSXqb70ZLAPLhCIJid6ptiSdByIk/UEFYPrTeW/B6jHx7FDYuggL4E4RvCRzkG7gNrZuzPZVcb6GR/p8eD6B3zkOl/ATTmO28HUvprNO7ql4OAKc5nrS+yRIXq50AjiPJ+QV3Ft267H6xJ9bWw4DIqtzO0JD2s6EoNOn9temOJ7k6DSHNPS3FeA8pqRirKMugF4seuEOVoFZAPL2IPpRC4RgEjq8/f80U1O1yTT6vWORZtPJsvDJtwiz+LFeuuIR/WSJJB9N84r1kcDco70wxm+YvtDOFCKtk0HltebtDodj3+NRUPF67N4wVqtUbG0IsPMmBoWsI1wbIWFNYelxGoLMFGuv8ThqqiyK/YjjZtXBmHT4dao4tydQM7678uhezhbQP4Q8fcAHJyrlqzTqd1gIDQ/1RDFSXTQxzX5tYVpmGJyT8i6yVBiqpmiMY2QBhOSyrEcJW9LMRyQ+s68C+0IUN1lZ3aI6wx1/cxUxa6d+EpYTvCFRSKrVdJcmL92MFoTaSvg8eYrwojZAV+f0DyDH+3vFT5b1D+8Kr4gBi3mxDV0KWzOi8s5k4R3AKJlL8TQqga42ue2LiDYKTMOJlUg5c/0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(36860700001)(81166007)(82740400003)(41300700001)(86362001)(356005)(44832011)(2906002)(8936002)(5660300002)(4326008)(82310400005)(40460700003)(40480700001)(6916009)(8676002)(26005)(186003)(1076003)(6666004)(426003)(47076005)(336012)(316002)(70586007)(70206006)(54906003)(2616005)(478600001)(966005)(36756003)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 13:10:44.6326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d13261-ea34-43a9-4a8e-08dafd433ca6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8260

At the moment, the static-mem check relies on the way Xen exposes the
memory banks in device tree. As this might change, the check should be
modified to be generic and not to rely on device tree. In this case,
let's use /proc/iomem which exposes the memory ranges in %08x format
as follows:
<start_addr>-<end_addr> : <description>

This way, we can grep in /proc/iomem for an entry containing memory
region defined by the static-mem configuration with "System RAM"
description. If it exists, mark the test as passed. Also, take the
opportunity to add 0x prefix to domu_{base,size} definition rather than
adding it in front of each occurence.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Patch made as part of the discussion:
https://lore.kernel.org/xen-devel/ba37ee02-c07c-2803-0867-149c779890b6@amd.com/

CC: Julien, Ayan
---
 automation/scripts/qemu-smoke-dom0less-arm64.sh | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 2b59346fdcfd..182a4b6c18fc 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -16,14 +16,13 @@ fi
 
 if [[ "${test_variant}" == "static-mem" ]]; then
     # Memory range that is statically allocated to DOM1
-    domu_base="50000000"
-    domu_size="10000000"
+    domu_base="0x50000000"
+    domu_size="0x10000000"
     passed="${test_variant} test passed"
     domU_check="
-current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
-expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
-if [[ \"\${expected}\" == \"\${current}\" ]]; then
-	echo \"${passed}\"
+mem_range=$(printf \"%08x-%08x\" ${domu_base} $(( ${domu_base} + ${domu_size} - 1 )))
+if grep -q -x \"\${mem_range} : System RAM\" /proc/iomem; then
+    echo \"${passed}\"
 fi
 "
 fi
@@ -126,7 +125,7 @@ UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > binaries/config
 
 if [[ "${test_variant}" == "static-mem" ]]; then
-    echo -e "\nDOMU_STATIC_MEM[0]=\"0x${domu_base} 0x${domu_size}\"" >> binaries/config
+    echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> binaries/config
 fi
 
 if [[ "${test_variant}" == "boot-cpupools" ]]; then
-- 
2.25.1


