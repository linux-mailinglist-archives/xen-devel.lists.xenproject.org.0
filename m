Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B475B0284
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:09:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401272.643093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsw7-0007TM-9I; Wed, 07 Sep 2022 11:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401272.643093; Wed, 07 Sep 2022 11:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsw7-0007RM-4m; Wed, 07 Sep 2022 11:09:39 +0000
Received: by outflank-mailman (input) for mailman id 401272;
 Wed, 07 Sep 2022 11:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVsw5-0007R7-Iy
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:09:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e045844-2e9d-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 13:09:36 +0200 (CEST)
Received: from BN9PR03CA0719.namprd03.prod.outlook.com (2603:10b6:408:ef::34)
 by PH7PR12MB6860.namprd12.prod.outlook.com (2603:10b6:510:1b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 11:09:32 +0000
Received: from BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::b2) by BN9PR03CA0719.outlook.office365.com
 (2603:10b6:408:ef::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11 via Frontend
 Transport; Wed, 7 Sep 2022 11:09:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT081.mail.protection.outlook.com (10.13.177.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 11:09:32 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 06:09:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 04:09:08 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 7 Sep 2022 06:09:07 -0500
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
X-Inumbo-ID: 8e045844-2e9d-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIfasoA4HVCg6AlIBfmEbPry2okihsU3V8D7REGDUy6EUKZJDIIEX2m+ba7wtjlOGry6cX+BG1rCnupGSxMKhwDAz8ddNpNP/9Q3Z+b9nOp09O+GC19TlTTvcuCvMh9g0tErGxBginR/KKSyH/iZeXW10rStjTUVZgQ7En2SOOqRPcnwcOGPUhgfi08SakpaBEb8WMvtdM2+eMEymtKDAEhVhbmuFAeLBNO2b3V6yfxgkSlj19Z925y+BvaLANdEWByUmmXW53OBBN/szq1dcD5YHOXaHpzdkQQWWpEz2evXOKQQXx457GkZ5GwIHJmw5lLNDCyRcrmtAEfDQfGUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhTkd5miWMsVyal32k/nHZOTb3M3/0B2WCe0WVn4U0U=;
 b=bLm4H3S+7fC1+ZcIQb7gfdxfJzGbk56Mv4V0uAhosM/TCy1lSi6G2Qnh151ETEGDdRNN+6X/VsM4lkthK7kiX8DmUXTAyVWTonG5x0fwJ+LUWlPBm/643cg34hXi4U4Zx9av2jYbX0E+NsDqhjsH26+eMmxbtib0VuhccQBOSfwX6XkAU5vXJPxsWG8SWakl81cDmRCJosVJbTC+2LaLz4eCkdjjvLJhpLqO8jll8riP6mhZO2SVTpYO9gn/vs3Y9iK/F2QFp+W7Hvnmhw9nZfJNRM/AnnhsBoztmAOZg3kASECCDE7BjUyZmdvGscryh1ySDjt3Rbx5SNVS2p/GoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhTkd5miWMsVyal32k/nHZOTb3M3/0B2WCe0WVn4U0U=;
 b=Vn035xWxAfy1EdIZMf92568mJk2Jcg+HkUta6ajSeB1Mduyc1ou+xHxCS5XvoRP7EsPrDus7brY5yq/abFxGpol2DdDTeLzbfywbJVgW8wGvP0KrL9t4YzBT2GgDXSUdf5Eidf1xf00nnrKdJEswYQpt2TIn+x5lcjm7IdNsW+s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder v2 1/2] scripts/common: Introduce phandle_next and get_next_phandle()
Date: Wed, 7 Sep 2022 13:08:51 +0200
Message-ID: <20220907110852.5673-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT081:EE_|PH7PR12MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 1afb0e03-e8ef-4cd4-750e-08da90c170ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MABG/xCTZzcwgQWF2hpH8oMfplqEzpNCCwbP1zcD4LiCKhVSQRcqRELG9Tuoc2TYMBYjWoUS/xbAczS/MweHq1qOTGF2KqU8xySkYquPIK/gy4Y3qIea8NnLvoSnZDKkbeYZ3J8827sQ42g9N0uY3SwnL46RvMkwuEsvmrIBKAftnbouGX9soDAflHx2hpzGmI6anMlUybeC+s3RPJtZD6D+o8SAcjmCwzTgTA30fWmE1oBWp7UDBBiK+W4SPYO96RpczqsrdngrXdlZb8LYKE8ReiKpdEeDCrwUKijMy5x8tm2At3oeepYmbg/wt3mAEg2MApKdR3ZciTJwmpma8eBkqwLysi2iH1Ixh2ozI7zEB3Y3y3zdoJalfq8w4dMm02+Ky0pwzPICqj4Zi9liQWjDMfoMw9cTgjSt12JjpZCA/jdCeDQBK1py6qLEC0ffQwjXjbKUW9p6N3MSnKvVWswBICYqGGSMjf3+9EnuOeBYPstYjzdGNB/qI1x8BAZrfaVNClK+qbmDve/Fs5gkTeOYY1/peetAr2Cg2febsYgSPdAHysbZmjUVyXdY5jlo2+JGB/TUEGCndq0XgRqg3vKF+Ms/LQ0udRbehsFd66ymG8pU21/BqxdOiKIlpD/skV7YQtdaccya30nusNgqwzyO/XhMRBz8erVFj3UFnlhYX4Y/7x8Mb5oBIVCDoErf1z1QlPQ0oFwJyzAV+KtCsbd/2evaZpGkYPWrUDaWiMTWFGhrrwKPc/2f3B3gsc7rEDrHFBUVnZ8SpiUe1OXAWidEzhfECM4nzKdTT8+Vbn0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(40470700004)(36840700001)(46966006)(336012)(81166007)(186003)(47076005)(36756003)(426003)(356005)(2616005)(36860700001)(1076003)(86362001)(83380400001)(2906002)(54906003)(478600001)(26005)(316002)(6666004)(41300700001)(8676002)(40460700003)(82740400003)(5660300002)(40480700001)(44832011)(8936002)(82310400005)(6916009)(70586007)(70206006)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 11:09:32.1231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afb0e03-e8ef-4cd4-750e-08da90c170ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6860

When dealing with device trees, we need to have a solution to add
custom phandles to the nodes we create/modify. Add a global variable
phandle_next to act as a countdown counter starting with the highest
valid phandle value 0xfffffffe. Add a new function get_next_phandle
to get a value of the next available phandle and set it to a variable
whose name is passed as a first argument. The global counter will be
decremented with each call to this function.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
To make the interface to phandle_next as simple as possible, we just
need a single function that will get us the next phandle and update the
global counter. That is why we cannot use the following:
- "phandle=$(get_next_phandle)" as a subshell cannot modify the environment
  of its parent shell,
- making use of return statement as it only works with values up to 255

The current solution with passing a variable name to a function that
will modify its value using eval is the simplest one and serves our purpose.

Changes in v2:
- new patch
---
 scripts/common | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/common b/scripts/common
index 68938beb8557..25c041270c29 100644
--- a/scripts/common
+++ b/scripts/common
@@ -13,6 +13,9 @@
 tmp_files=()
 tmp_dirs=()
 
+# Highest valid phandle. Will be decremented with each call to get_next_phandle
+phandle_next="0xfffffffe"
+
 function remove_tmp_files()
 {
     for i in "${tmp_files[@]}"
@@ -26,6 +29,14 @@ function remove_tmp_files()
     done
 }
 
+# Get next phandle and set it as a value (in hex) of a variable whose name is
+# passed as a first argument. Decrement global counter phandle_next.
+function get_next_phandle()
+{
+    eval "$1=$(printf "0x%x" $phandle_next)"
+    phandle_next=$(( $phandle_next - 1 ))
+}
+
 function sanity_check_partial_dts()
 {
     local domU_passthrough_path="$1"
-- 
2.25.1


