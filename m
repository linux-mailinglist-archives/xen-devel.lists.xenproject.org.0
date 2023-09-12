Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F94179DA35
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 22:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600803.936589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgAEq-0005GE-6R; Tue, 12 Sep 2023 20:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600803.936589; Tue, 12 Sep 2023 20:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgAEq-0005E1-2P; Tue, 12 Sep 2023 20:44:00 +0000
Received: by outflank-mailman (input) for mailman id 600803;
 Tue, 12 Sep 2023 20:43:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jqqM=E4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qgAEo-0005Dv-F9
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 20:43:58 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e89::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1655c2a0-51ad-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 22:43:55 +0200 (CEST)
Received: from CY5PR04CA0017.namprd04.prod.outlook.com (2603:10b6:930:1e::16)
 by PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 20:43:50 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:1e:cafe::18) by CY5PR04CA0017.outlook.office365.com
 (2603:10b6:930:1e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Tue, 12 Sep 2023 20:43:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.17 via Frontend Transport; Tue, 12 Sep 2023 20:43:49 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 15:43:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 13:43:49 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 12 Sep 2023 15:43:47 -0500
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
X-Inumbo-ID: 1655c2a0-51ad-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0XXuVWa+EWHGxI9VdUVhjLHjh8RNtz7plZDqUgGYkWo5P6EayWb9DcpUNtlg6avuDShxpGJ2lhgVGF6UQN0nRBtWqUVNqj9tL8D520/JWJ2fjCGkDyQ4HOSMN0xR6wDXjr7CtI5PkP22NqeY1hhdvc7IADiLShDnZo+Sdj8KaU6FFfPpek0ltCrc0VRect4uvSZzQ+zCMKD8Czpk0ayEq2MpCUQPue5G7b8QXlwVopkqVGgsMCGR3BIW15HSWdmUfPTRwwYAAoK0bh3gfuHO3fyNqjRTj549erAEGydVMIuETYIY6SRj8jph/+W6OZGCCHKo74Ln0+rgUxy0p+yzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E65VnSANYBFDqkpFLBD79cPDJZqCboAo43zfwK5Jn18=;
 b=BGvOmAJVMGcYydUzMMi3jJ9SudK130NYYbSHtyClqDsxhkxsxy+47MPlZ80vYEadx9/cP1Z6AGLreexpJZyuMQ5XiMq7P4BB+1BaXzqHUoO4g3fmM7BOmtU1Daso18mR3vhSYeYuB5t3nyFZ75incwUVgV8Hxg9nOB2ndKz5XE7+QBqF1dBsqiHs9N5O6eoLjWvtYi4ax25fqwks7n/GFHqZZA+Q8ZYZ86g0U8GnLw7sfHAgOdUuwsVMTuR1+EuFVkW9R/girhFSLvSLOa6GYye9E99smKbmaWWXxlzXi+HT9ubYbOQmufJ4qMBOJ0hdJQL1tna/TgfxUXJnNujKyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E65VnSANYBFDqkpFLBD79cPDJZqCboAo43zfwK5Jn18=;
 b=2xSgEkwlyb/1OsMW5lDAZUk72Sl68V3rsriOhQhIXjuSTR+5GQiAPV7CIUwTnxfCMvSrjP4vhgqx9uQnHieWLh1GxU5UilROnvCEFgffIQffRe0WtgLKGcBrC6TuidpH2c/61Ov6zdfLDuykoL3JfyBoNCInAZnAGoYkR4PCG3I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder PATCH v2] uboot-script-gen: use size from arm64 Image header
Date: Tue, 12 Sep 2023 16:43:44 -0400
Message-ID: <20230912204345.7271-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|PH7PR12MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d774baf-8e33-4831-6c9e-08dbb3d0f824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KKYCTJ9XcwuNSOk8WTCTyq0WwCrCxQ4vY10P2s0mqCRVdNwKVUiVpIJbm1ip72pGrUzVPVOimOSN/98MBGqimRnMvMj92VM+1sZstdkiHpssRcChDGK67d0BHaRCrn+2MHIA+qayP8+pMXRhgHmAPR6anhy7WI8JDn1OrUN9Halcs4GM1p1iCOBaeSRbJzVQBsZwEPuKuw9cGVV3ImsOERorWiK39zBlYl3HEif3SP3dHu/7L0cG0gv6wgFTozJsBEdAlzAAftcGJIzkS56kE4nGUXhN7e1iOGJhKdEZru0bnLwhzB29ON4cJL3J8NBtXNkN1/Reb/vgdI9qN7+j6ie6gtlrjZ8VtlVgn42NV+MR81CeSzqiFKfR/YpE3lzktrw01jwVknjS+5Irb8Ow620H6Kxu5v2RKepen9YAC/GR8MkmGbgrnG52JSc5JRUlHXgWKJhysyK4bYqcYwMPAY4BStAOFI7yMfHkR4F6B/EpBtRhBWwaq6feOK5bKQAOvlh1bqsEW68SmMEBbNL+lvEbGw1w5mtNa9EibQbMPmzFA4Uyje7pW4AcxB2Jy2TnJ0VMryOh4PocTvzMX3RNk6W0FOA+O3ELKnEbOFIMFtNsXy2bb4Y4rEKCHbK/5i1nWNF2pSSmw+g8yscsKy5ydYzl4YntC+KCdhRK6hK0nXnT2cQ8pYT0NQePI+TR+G0pJXpP8Y01WtdLRWIdVLQXkTZytuNdgmqLcXjrLh2/DiQDSCnhwiwB+5BFV8QWo/2C
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199024)(82310400011)(1800799009)(186009)(36840700001)(46966006)(40470700004)(81166007)(82740400003)(356005)(40480700001)(86362001)(36756003)(40460700003)(478600001)(2906002)(316002)(6666004)(8936002)(6916009)(44832011)(5660300002)(41300700001)(54906003)(4326008)(70586007)(47076005)(8676002)(70206006)(36860700001)(83380400001)(1076003)(426003)(26005)(336012)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 20:43:49.9669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d774baf-8e33-4831-6c9e-08dbb3d0f824
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562

There is a corner case where the filesizes of the xen and Linux kernel images
are not sufficient. These binaries likely contain NOLOAD sections (e.g. bss),
which are not accounted in the filesize.

Check for the presence of an arm64 kernel image header, and get the effective
image size from the header. Use the effective image size for calculating the
next load address and for populating the size in the /chosen/dom*/reg property.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* add in-code comments
* use variables more
---
 scripts/uboot-script-gen | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 9656a458ac00..f0972d983017 100755
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
+    local arm64_header_magic=$(od -j 56 -N 4 -t x4 ${filename} | head -n 1 | awk -F' ' '{ print $2 }')
+
+    # Check for valid arm64 header magic value 0x644d5241
+    if [ "${arm64_header_magic}" = "644d5241" ]
+    then
+        # Read effective size, which may be larger than the filesize due to noload sections, e.g. bss
+        local arm64_header_size=$(od -j 16 -N 8 -t u8 ${filename} | head -n 1 | awk -F' ' '{ print $2 }')
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


