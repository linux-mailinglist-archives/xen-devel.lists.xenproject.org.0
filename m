Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4675B59C3
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 13:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405737.648175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXi6O-0003Ev-DL; Mon, 12 Sep 2022 11:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405737.648175; Mon, 12 Sep 2022 11:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXi6O-0003D4-9g; Mon, 12 Sep 2022 11:59:48 +0000
Received: by outflank-mailman (input) for mailman id 405737;
 Mon, 12 Sep 2022 11:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Y9l=ZP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oXi6M-0003B8-9S
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 11:59:46 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 634c3ef0-3292-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 13:59:44 +0200 (CEST)
Received: from DM5PR06CA0091.namprd06.prod.outlook.com (2603:10b6:3:4::29) by
 PH7PR12MB5880.namprd12.prod.outlook.com (2603:10b6:510:1d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Mon, 12 Sep
 2022 11:59:41 +0000
Received: from DS1PEPF0000B078.namprd05.prod.outlook.com
 (2603:10b6:3:4:cafe::12) by DM5PR06CA0091.outlook.office365.com
 (2603:10b6:3:4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Mon, 12 Sep 2022 11:59:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B078.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.11 via Frontend Transport; Mon, 12 Sep 2022 11:59:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 06:59:38 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 12 Sep 2022 06:59:37 -0500
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
X-Inumbo-ID: 634c3ef0-3292-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUPkoRI0/elMm/uy7BD8W0q3EU8kHumJ0Mx3nCOqbPDlmTISdHtgEr0sF4wFiMJkkHWgHvYYHa3jvlAtMkENBP+eppwyUKrhPFBMsjCxID7d+uGT8OVTL6728g4DJCLx8nWGljE2AUas+dGYLBv3c1Z5QB0jAj+vVHPUR3CEm8e3SbNwfmWgMX3YSgidzKv5VF2WvtXnF2lP7rw73EwnvkPgSCDgl1HCMLHWjCf0RfpGpGx17rjeCgLcdZPRvWmfE+f1QbwlBBHJtq/1GMNuF88AEqk8putHBZgaylM0br32IqHVwAwXRPQjTEKxrrxBh+gHY2zynLEmmPZmdgaGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Es1SbOkPTlR+DrVZyH6jYeYFx1nk2zGDWM3Y18G1Ths=;
 b=GNEMxXo4anOwFTpmUaRTR79W2ofzJg1yIg6IfUm6CT6KXu8kF5ew3vGBX6QKxpuLU3B88LjoPSWbz67sr/36hFOxrHNVlhzpNOjzCQEMIPj/6DnQzC9imkGgrwkavCblB7g+az25mDzFILFwXOv01Qyjd7cv++s3gFpw+X6Yl95OtI7DDLOy/MYQ+o1oAWFX0EItGJ+ijsTdY4QWXw9c1VvYp4jKuZ0wJngzS4X+0824CqVGWS/w4lI/lgBBF3pgm4cansSp1z2lWHG78eehR0oL6Da/8IOWiiSr2QeAhnzboWIStejg/2EFRL84PyWX2+s3rFgyS+oxCcvOVxbZJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Es1SbOkPTlR+DrVZyH6jYeYFx1nk2zGDWM3Y18G1Ths=;
 b=y2Y8srlpnzMe9Rlckx/oJpXdk61JZD+Xiw8+x9B09uET++LyTz4gr9ecHVi1Fj9f+qKZJH8JXmXq94EVNxbMk9nkxetlr1zmOe1QPoGi8uG1L0OaVEzmjnCuj+DOirtwV8yRqFoHYBJvSsQ/IUBLTlHt+ozou6mXfuJan81INDk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder 1/2] Refactor sanity_check_partial_dts
Date: Mon, 12 Sep 2022 13:59:33 +0200
Message-ID: <20220912115934.19552-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912115934.19552-1-michal.orzel@amd.com>
References: <20220912115934.19552-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B078:EE_|PH7PR12MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fa13c5-e663-4d8b-ae2b-08da94b64564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XpWSVIvm+D2rkON8A3Q1id9TzVdv+NMhHIqOZ6iqdv9tK8FgkoBEQ9wv77nEOdcpNu9KlK5G4sa7eVxcrSIeJg0iTpblPsueVek6IUiJAxwKffeRD4zVsilG6OB70UPiIS0rRBgYBON+qxLUD4aOvTL0mYFT5jXgbk/++hyZCIphFEcRozzcBUR9uRkTUsFjaMTMZLJ0xItar81Ub1gtHXXwLJBCSCZFD2OmI5t+bxkmBBc9CfyyLzjYinxZukdioxerTudOsVRMLJV1hj5fW4Aic1Ivdj7TE6MaYo0DJ+JJgeqQJCBOujeTX+P+SO4/UbdE2gmvXRIw3VLWNP/zbW2eXLKiR1WEALKAE6X1U2/FTT8zFg2Buw7R951qHhPTQiVzRXCI7yYeQVIneZP2RMrm+sht9xjJ3FNXzid+wXn6+hiflhxIf6w9QgnmQ50uQtCK9Xc+YThETXEsyHUnrbs0K8D2tGqzKxnsCWVbdmH95yqYdmunwIxh0J4ft7Amt4zOu3GOvMVK5tr//8CSRMYYiDAKyQodf7kbLteINbRHoHo5cQvVT84mZaLDUILXbFlxkNlI1j6SrUu7wbiDvNdMiwYiFODrA1yIMTh23S2MMcdsUk+kCRolj6LJfTUqsnr1CSzNXBYpr5pJt4CTEEaf4AduiHf8U2HcHfQe4bqm0u+jiqsPCD4/kGB3WHql3vwAZ4TEr3l/bIqRmpIOsAXf8MBulli8PZyjBfbSRWYuMGi2xr53PuiZNa7ZKejPCYor18S+I5GTP1YtFKa8p09Sr9px75WjFqQ2R6MDJAX2P1SlYCHXRtDF0RNFJsZp
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966006)(36840700001)(40470700004)(426003)(47076005)(83380400001)(1076003)(2616005)(336012)(36756003)(54906003)(5660300002)(6916009)(2906002)(70206006)(316002)(70586007)(8676002)(4326008)(8936002)(40480700001)(44832011)(6666004)(86362001)(81166007)(186003)(356005)(26005)(82310400005)(40460700003)(41300700001)(478600001)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:59:39.4437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fa13c5-e663-4d8b-ae2b-08da94b64564
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B078.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5880

Currently function sanity_check_partial_dts from scripts/common takes
three arguments where the last two (repo, dir) are used always in
conjuction to form a path to a directory storing partial dts. Modify the
function to take only two arguments where the second one is to be a path
to a directory storing partial dts. This will help reusing this function
in the future to perform sanity checks on partial dts that do not
originate from a repository.

Modify compile_merge_partial_dts to take this change into account.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 scripts/common | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/common b/scripts/common
index 25c041270c29..ccad03d82b30 100644
--- a/scripts/common
+++ b/scripts/common
@@ -40,8 +40,7 @@ function get_next_phandle()
 function sanity_check_partial_dts()
 {
     local domU_passthrough_path="$1"
-    local repo="$2"
-    local dir="$3"
+    local partial_dts_dir="$2"
     local address_cells_val
     local size_cells_val
     local tmpdtb
@@ -51,7 +50,7 @@ function sanity_check_partial_dts()
     for devpath in $domU_passthrough_path
     do
         file=${devpath##*/}
-        file="$repo"/"$dir"/"$file".dts
+        file="$partial_dts_dir"/"$file".dts
 
         if ! test -f "$file"
         then
@@ -96,6 +95,7 @@ function compile_merge_partial_dts()
     local dtb_dir=$1
     local repo=$(echo "$2" | awk '{print $1}')
     local dir=$(echo "$2" | awk '{print $2}')
+    local partial_dts_dir
     local tmp
     local tmpdts
     local file
@@ -123,6 +123,7 @@ function compile_merge_partial_dts()
         dir="."
     fi
 
+    partial_dts_dir="$repo"/"$dir"
     i=0
     while test $i -lt $NUM_DOMUS
     do
@@ -132,7 +133,7 @@ function compile_merge_partial_dts()
             return 1
         fi
 
-        sanity_check_partial_dts "${DOMU_PASSTHROUGH_PATHS[$i]}" "$repo" "$dir"
+        sanity_check_partial_dts "${DOMU_PASSTHROUGH_PATHS[$i]}" "$partial_dts_dir"
         if test $? -ne 0
         then
             return 1
@@ -146,7 +147,7 @@ function compile_merge_partial_dts()
         for devpath in ${DOMU_PASSTHROUGH_PATHS[$i]}
         do
             file=${devpath##*/}
-            file="$repo"/"$dir"/"$file".dts
+            file="$partial_dts_dir"/"$file".dts
 
             # All the subsequent dts files should not have dts version mentioned
             if test $j -gt 1
-- 
2.25.1


