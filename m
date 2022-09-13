Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC8D5B6CCE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 14:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406346.648732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY4jO-0002Rg-SA; Tue, 13 Sep 2022 12:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406346.648732; Tue, 13 Sep 2022 12:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY4jO-0002JB-OF; Tue, 13 Sep 2022 12:09:34 +0000
Received: by outflank-mailman (input) for mailman id 406346;
 Tue, 13 Sep 2022 12:09:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWZA=ZQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oY4jN-0002Fj-OI
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 12:09:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec5b6bad-335c-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 14:09:32 +0200 (CEST)
Received: from BN0PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:e7::35)
 by LV2PR12MB5920.namprd12.prod.outlook.com (2603:10b6:408:172::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 12:09:29 +0000
Received: from BN8NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::df) by BN0PR03CA0060.outlook.office365.com
 (2603:10b6:408:e7::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Tue, 13 Sep 2022 12:09:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT110.mail.protection.outlook.com (10.13.176.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Tue, 13 Sep 2022 12:09:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 13 Sep
 2022 07:09:28 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 13 Sep 2022 07:09:27 -0500
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
X-Inumbo-ID: ec5b6bad-335c-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdTVpN6Cnl6mCo9qmBVSjK4vgNuKEKgycPzdr918sRDIOmKuNjHqa3wjoA0ntd8YeoP0qGaHdSlF6Eho3dDz0VH9yxggCQdLz9mXW0Ukgjy3+JKsbVqwkF79D5ZQJE5Idn9vVnd9PzzyR+j8hlLtR/UEzaawnZBs3rH6PG3aHZ+iiUpr8/sKWvGjCCQ9bMo2ppOmT0/2E2NWy4UDN4Ssg8i5bEgkI6sMtQv3izVVhDknGRp739reVAKwrIsc+jFI91/boz+bi5KmFheEDknu1eYyPooES/+fjTV8M1ElKzK4dP4IpiftJzN6TuonBDoP3B1S3kv/C6uaGXKzDM+g+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEXWX4yZaSQA0d1dChkxu1twPiiUlC11JnRmnwZf8V0=;
 b=Kab2njFk0k3r2FPF09olu7XxApf5K10OjQAryDGNldot/JZTnq87RPqCnxW4KfIZXXb/YYzNtRDITlXkitfugP4aYUnmDlgryLRXZy+FIBLiO7SJIYCyQnc0VcY1jxHwP1AGhzSeKtgcattcjWBQdvsttUC3DGtN8kfRNyxhf94hF9L/OCngCx7vReTggSHg7ROqsS8H1LJWO5eQ+XdQsC99EUUkDgYP7LaL34VJzpiU2wCO3s/B/NziG12tUt6Jn9tBBV0VofQB8D1Ku+6kw6mW2dDXYVaQm7TDtTyExOUA8dJ1UJgxMhBmbfOfqL5lGcnhPGXT+4b1zzk1nYiw4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEXWX4yZaSQA0d1dChkxu1twPiiUlC11JnRmnwZf8V0=;
 b=DVdK4G5Q1TB49+OfTgJJpuUBkwBPxG0tF+5Sq0On4aiQmRA9WIydIOYltiJI3jhjpfdERROx4AAyMus40QDcDTXfSwKwio+6VBFh9/fcQLM7IF/VG62lb753JwONNrHYYXB6+ormngar4U2uemMTSMp5+8BP+smIphEAO3SMnqU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayankuma@amd.com>
Subject: [ImageBuilder v2 1/2] Refactor sanity_check_partial_dts
Date: Tue, 13 Sep 2022 14:09:17 +0200
Message-ID: <20220913120918.31162-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913120918.31162-1-michal.orzel@amd.com>
References: <20220913120918.31162-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT110:EE_|LV2PR12MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 51cddbc5-53d7-47bf-c536-08da9580cef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6nHNiyaoQIW7lSrjHpPwLiG4m/jTuZpc67LyMZtZevljMbKDj4Uf125n4F+phYKkb/lZhHjENHyWgMglszbVC5vATNCvwtBUN4cQMxsBTvU1K1bG/TvchuVi6vXeIRec/hEvqg3jEhZyKd91A3Onmc/TL4MmTuL9n9Oy8A9YdGtEasQTofTg5gVyG0pZbemLrQbH/6dS96xh1jazms96tMzyuhKEuku1Zi3rdD2x0wxKRYlErLK+wNogJpz4qL1nayQ6F4+XpEliRurfS7xyzXtecMLT1+6gtHVsKaU3cpwFNaB5CF4WZmr577bHQDF1x6NL38GKwpFIHR8J//B9LkW3oht/2fwOEfMILait8Kkdjszo8WnkVBx9pnsHc6kkLXMz2PuvCM4mKeAgYuayqflpHyy9Mi/gGF/Qozblm+6j7vOFhjSd5tllt6/pLTrgt2xBxp9FG2oixb0VNb0LX7HJZQb9vhFyfFAY0NhPvIISxQJVU1In67ua4kcZhRQaasJiCPTLxySJM5+kavhinHnoKQtOmld9Kc6ahgAU0suiZKYD1AzwFBEbOOqQt5VKh1We1r8nttoba3U8rdkpj2M9NoI8QJxZ9ofCawnEpFkwDZHsLKXh56Z++vuWQ0JMhz8Ev0wnozacPZysDa2JbHsrsGLV2Mz2/St9iFMK4KROerybGaMN2u+Ve39YqpSTX16ztfPaJDfVBvCdHBl0rB7J6vewfXQ8ENpE1kRJxilxqFfcuj6z/I9adbEmuULf+ghCHPEwuNy6Uff1w/cY3EytXFgX9BWVGZu/02jTEChqT/IAZEWsAYrV2nIvAaUm
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(36840700001)(46966006)(40470700004)(36860700001)(316002)(356005)(83380400001)(8936002)(36756003)(41300700001)(186003)(2616005)(26005)(82740400003)(6916009)(336012)(81166007)(478600001)(44832011)(8676002)(82310400005)(1076003)(40480700001)(70206006)(4326008)(70586007)(6666004)(2906002)(5660300002)(40460700003)(426003)(86362001)(47076005)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 12:09:28.5959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51cddbc5-53d7-47bf-c536-08da9580cef0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5920

Currently function sanity_check_partial_dts from scripts/common takes
three arguments where the last two (repo, dir) are used always in
conjuction to form a path to a directory storing partial dts. Modify the
function to take only two arguments where the second one is to be a path
to a directory storing partial dts. This will help reusing this function
in the future to perform sanity checks on partial dts that do not
originate from a repository.

Modify compile_merge_partial_dts to take this change into account.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- none
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


