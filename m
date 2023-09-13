Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B079EAC1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 16:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601395.937395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQcr-00029x-1S; Wed, 13 Sep 2023 14:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601395.937395; Wed, 13 Sep 2023 14:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQcq-00027s-UU; Wed, 13 Sep 2023 14:13:52 +0000
Received: by outflank-mailman (input) for mailman id 601395;
 Wed, 13 Sep 2023 14:13:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUH4=E5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qgQcp-00027m-Nt
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 14:13:51 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c090815d-523f-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 16:13:47 +0200 (CEST)
Received: from MW4PR03CA0102.namprd03.prod.outlook.com (2603:10b6:303:b7::17)
 by SN7PR12MB6983.namprd12.prod.outlook.com (2603:10b6:806:261::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 14:13:43 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:b7:cafe::66) by MW4PR03CA0102.outlook.office365.com
 (2603:10b6:303:b7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20 via Frontend
 Transport; Wed, 13 Sep 2023 14:13:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Wed, 13 Sep 2023 14:13:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 09:13:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 09:13:32 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 13 Sep 2023 09:13:31 -0500
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
X-Inumbo-ID: c090815d-523f-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpx0JlWkJZ/rw/WGiIFUzHP7GnHN15ITjAReHIxZHMWRjmLllTfKGMil2QLlMDZlP8zfI05g+jdID0Ns/eXDdwkb+q1enzGfcJM6BHiUoWiFYPwjocONg9FDx8sAVGAvpOCkbyuMpqz/Zla5lCxtHkznehKUAwPJWr0MBX4ij/w5awEkx/Rj+pvP/KrPdH1WTNYcXjSweuwhi+XFwihZZQt72NsECD1U4A2qrzQas0FiGzroz+KuHLmnzLWwkpSSmeLkTOb/BWnms7wklH1SqRLTV5Ck2DxLZL+0rEYDpuLbJjEeeqjh49DhhOPF5lmFtw8ctdFTuq2CqlApSeouhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmwDyZb8YRQkjeT/5fhlCcDSgiRc55DW8fgXBndKQZ4=;
 b=DgAxe3U5QWCNvy6ePp1SqchB132hRF3t9+RgJCYAYgGq7Xo39yWFm2bSvGPT+DH/EgooFhW8ZxVXqotgg1Ng86qfw25ctLoekDPWH/MyaOnVBahzy7T/j6kpI9tf4NleTI/mNN5QdG9Xfaq46jI/LmGtBTGUpTsW6XL7qJshNPDAETLMI1oMwPKDPUFbpo/huuqKTlkojlub9sMLLj/bxM/MOmJR5NZg+WLRhVdePIc5qaztyWtG1pryVKFwg/uKc08kO2mZ1210U7taUcH8kA7GFkCOM6ofYy4UcdmTFySGf+9sElG0Nq+n782/AmagMB0XltdVeHbb+2eD0MKwoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmwDyZb8YRQkjeT/5fhlCcDSgiRc55DW8fgXBndKQZ4=;
 b=FCMv3hKRVOD3UB381/03GU1jG39kWwItdFMOiR3Wl80kaJePwOXeasDB0uCEVhVT0W7Ruw+gFDZXEFyTQdImEBAUukUFx6nCcCbZemgIntWHxbiSoqdSZFLfZVM8xDvolwr1S6v8YjsqqhWCoI5CuudjDLAOfypyAOdAhZ6dasc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder PATCH v3] uboot-script-gen: use size from arm64 Image header
Date: Wed, 13 Sep 2023 10:13:10 -0400
Message-ID: <20230913141311.13714-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|SN7PR12MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e557d5-fdd4-4540-7e74-08dbb463a2aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2saho+SaLE5Y+QKBPnGa/s3iP8FogrUqjz/Uj7oE4kGDieZVHKhQ7xAByux07Omrv+MDwrfbtt09lY5KJChiFI8z7y6WCZtAyBqlvy0FDO8eTOVFXhi1t/EqVYdst7RYNG2LyVT34/mV0lnx9tcxfqv18RiHiwC60JIhHpvl+g8IlulErb8Gkig4IR9Z05Hb+q9zV/sqn5z+JeUuT+iUBXUZRreSz4OitYGjbCCdpmdgi+7Ck5gctZzExYuIScQwNaN7mDjMOuWS5AufLM2T3IRuYPxsaTOrjNelAQ2E5N8v7DlcBiVQP6QDGfmGjLdYG2KUsmT4EX7vrSVS56cdT6evygWIXrZMCZRsZe3ZWQDmlWrH1LqWqOYzU07eN4ud11U/ulL5FBhUuBJCE4QOskBVtHsbylhSIOZ0MSOtpY1Urd5O0sBUvYLL0q06G13iwfcag0YA5I8ifH1eiugBN5ZxYnmlBltWv2sPL1DlBwHsR71ptD1KLRl0rMWw8pL5c2VPrcO4DxcoAlHnJwr2lJw0Kqh7XuxEh+/7lgyGFMrmtTeQA5Z3oZF/boeqYNxvI7WBORWrxJ8pPOUw6DNp/ExQq0qnyyxMXRHcgtTwCw7asaFPn+gMWw6AtPDBwXx3NflnUIoIXD1jSOe2RFJNBBay+Cz2eyIBnpsegmVjedHyEME4t+B0M7FYhdH+W55w81ldBTabACSXK88pcJyNCqZtJa+luhaGJ2rsi72OQq+SmQbANROXOfn5OFnPkAlLOx0wqOt8ysfD3Eb1xx0MgQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(82310400011)(186009)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(40460700003)(6666004)(83380400001)(86362001)(36756003)(81166007)(82740400003)(356005)(47076005)(36860700001)(2616005)(426003)(26005)(40480700001)(1076003)(70206006)(2906002)(6916009)(41300700001)(316002)(8676002)(4326008)(54906003)(70586007)(336012)(44832011)(478600001)(5660300002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 14:13:42.5182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e557d5-fdd4-4540-7e74-08dbb463a2aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6983

There is a corner case where the filesizes of the xen and Linux kernel images
are not sufficient. These binaries likely contain NOLOAD sections (e.g. bss),
which are not accounted in the filesize.

Check for the presence of an arm64 kernel image header, and get the effective
image size from the header. Use the effective image size for calculating the
next load address and for populating the size in the /chosen/dom*/reg property.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v2->v3:
* simplify awk parsing
* add R-b

v1->v2:
* add in-code comments
* use variables more
---
 scripts/uboot-script-gen | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 9656a458ac00..b284887f065e 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -2,7 +2,7 @@
 
 offset=$((2*1024*1024))
 filesize=0
-prog_req=(mkimage file fdtput mktemp awk)
+prog_req=(mkimage file fdtput mktemp awk od)
 
 function cleanup_and_return_err()
 {
@@ -435,6 +435,21 @@ function add_size()
 {
     local filename=$1
     local size=`stat -L --printf="%s" $filename`
+    # Read arm64 header magic (https://www.kernel.org/doc/Documentation/arm64/booting.txt)
+    local arm64_header_magic=$(od -j 56 -N 4 -t x4 ${filename} | awk 'NR==1 {print $2}')
+
+    # Check for valid arm64 header magic value 0x644d5241
+    if [ "${arm64_header_magic}" = "644d5241" ]
+    then
+        # Read effective size, which may be larger than the filesize due to noload sections, e.g. bss
+        local arm64_header_size=$(od -j 16 -N 8 -t u8 ${filename} | awk 'NR==1 {print $2}')
+
+        if [ "${arm64_header_size}" -gt "${size}" ]
+        then
+            size=${arm64_header_size}
+        fi
+    fi
+
     memaddr=$(( $memaddr + $size + $offset - 1))
     memaddr=$(( $memaddr & ~($offset - 1) ))
     memaddr=`printf "0x%X\n" $memaddr`
-- 
2.42.0


