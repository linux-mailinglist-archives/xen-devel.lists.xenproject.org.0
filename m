Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1C583DA4E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 13:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671981.1045553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTLgS-0003yu-PW; Fri, 26 Jan 2024 12:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671981.1045553; Fri, 26 Jan 2024 12:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTLgS-0003xJ-MW; Fri, 26 Jan 2024 12:51:48 +0000
Received: by outflank-mailman (input) for mailman id 671981;
 Fri, 26 Jan 2024 12:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E2Z=JE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rTLgQ-0003xD-Ut
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 12:51:47 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8b6b6e6-bc49-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 13:51:45 +0100 (CET)
Received: from BY3PR05CA0034.namprd05.prod.outlook.com (2603:10b6:a03:39b::9)
 by CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 12:51:42 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::78) by BY3PR05CA0034.outlook.office365.com
 (2603:10b6:a03:39b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.21 via Frontend
 Transport; Fri, 26 Jan 2024 12:51:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 26 Jan 2024 12:51:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 06:51:37 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Fri, 26 Jan 2024 06:51:36 -0600
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
X-Inumbo-ID: a8b6b6e6-bc49-11ee-8a43-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4Uiw/2wIjm/v2AeZGvAynD468jTvKytnXUjbYqWmIFOGMMgMHUso1FOaCxuGZ6MHR1+3kd9+/19dcdfW58V+qyxh+ajUlh8KgLPVepJFh3Fz00Gsu8dvXtL5BymYNaqFHVBMuBQApiXkNJyvekvpcp7/Vf9UHzogA6Fc52NNacfpsDRYZXjfqS7yqfRw5VfV6txWUuCs8MhkudVnHpW9S4dy+0nUCjLh8V/ZjxD4usHDH94uo3wAd78JJVLQT89KnHN4FYbUxalBNq6+cFYUQTFJ7hcuZo8YlyQHvENxzNg07nRltU51fFBo31nDj9K4ArcZDmpu7ApwdmU0aGu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4Rpw5pncYCvunyAOoAL6/OC9jz6oJupOd8JCuf5T4E=;
 b=asQfjimoHxoBRbzb0OvjG1aJuKvdQ9Gmz8mUz5tq9nTx/B13YVfcNCWej+mDEZfCFTn0cZyW6HdIogabD8ck5yCcHfCnBh+vn1tqNeqvMoBR0SCML7vpRcxM7wL4KdFJLTjm5hJFcOhFfNp0eSw9pRMgYTdoicY9cwGdgD49ax/CFT3p8lZ7ESnMaLSInvy6lJ9iJemIGxrQ+3SFlu9lOA2Lk4AHU26q0YSttcWxS0J5QV7vfHh5QDwdYunfTzCWwZper9UeuvzUA3LkKg07nzsQ1UZQoFJTAgB/lC7IbF7RoMfy+lcxFDaWiDetdfkGmqCTJkRG2eyN8pJqJkzksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4Rpw5pncYCvunyAOoAL6/OC9jz6oJupOd8JCuf5T4E=;
 b=Fa15+bRtwPEWot8SjQPUF7H3Gd7+2fqtchnHDEL1IkH2EY/SB36i/GCGu6cALdG4vxQsdEPNSSXFATP8FRgg6EPHWcQdtNdGwiLr7rmhPZyyGtaTIS0ilbdO+WUje2HnOb5G1a9925pUV9mj0OsyMK9dHeRfAs2AgKLRligtHu4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder][PATCH] Fix Xen boot-time cpupools handling
Date: Fri, 26 Jan 2024 13:51:28 +0100
Message-ID: <20240126125128.18275-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 283e9640-ff5e-4a65-ad68-08dc1e6d8b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GI073R6Y/THkuPgsUTrkRZ0Mvu0847ByEq6tyb1xyvvH9ohp9IzzfqyvIPvNFgnHM/J5JmA6StselLy+0WdYHFGf1eU3Bsti2zTe/ViHw8VRZab6WnZ3BHjTM1VZUa5VCAxNIV9MvABe0rEBfIZShDUnUuaaggVCrqPGG+1ElVLotRNLHOcuWNz+ddnHg7OQiuGz3hYkYh8wUPLAib58xQCqLIJwTef/8pkVCCU6TEWhGt/z5v5YhqbadSh92IkEfrJ3BkBkY7UI7wKFEy7mpnFh8l/8jbVt71Sv13g6bh1NxKznDWUyOaK80yfHIdu4RdyGXyurzHDICpxB/BVvfTUI36JCad874j0uRBIprc4jxMdDeVn/1MUU+bGeBwUH+2OzguGz8NypdvNjlWknfeM8nTyiVOnAXaPNLuIlIIYx3TmJ2NZGbObSR2q7ZhIWdgfNbAQlrXPzc3vFU4Bt7tT0B8E6sJDNjNrDV+VshhKRccfYSfuZjxz8PMl+GJ86aWfQZOZoKPHBorXxxTpqbuPpKW+boI2wz543JRAON9ZWf+ph80FKfZA3I1MTVgxi7FUxyPWa/W6AIJv5jtvG5bP/9IDScavhsdMU3S2Ue56jHl5WnKyFwiFoJtSzKfHymAbPOLfKehWXUDKTqRxkrRG6bILlrjxwRJItZg/crtM0QEfAdzuh6ZlSR9sEP6aq5ISuhB0ljBIbWf6d7yIDhYPYmWIL2/KxSR+U93p4sQbF6K2K78xHBzRvWt7UrRro+yXt5dxpVKXOqgLXBIlmFQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(83380400001)(41300700001)(86362001)(36756003)(81166007)(36860700001)(8936002)(26005)(2616005)(47076005)(1076003)(426003)(336012)(356005)(2906002)(6666004)(6916009)(70206006)(70586007)(316002)(54906003)(8676002)(5660300002)(4326008)(44832011)(82740400003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 12:51:41.6146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 283e9640-ff5e-4a65-ad68-08dc1e6d8b53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315

When retrieving a phandle for a CPU node using "fdtget -t x", the
resulting hex number (in case the phandle exists) lacks the '0x' prefix.
This value is subsequently used to construct the cpupool-cpus property.
This results in an incorrect property generation that leads to Xen
failure (example: cpupool-cpus < a> instead of < 0xa>). Address the
issue by adding 0x prefix to the result from fdtget.

Additionally, avoid unnecessary regeneration of the phandle if it already
exists.

Fixes: b687773b5046 ("Add support for Xen boot-time cpupools")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This only worked if phandle did not exist or if its value did not contain a-f
and was regenerated anyway.
---
 scripts/uboot-script-gen | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 078a667c61ab..3cc6b47c7c62 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -262,12 +262,12 @@ function add_device_tree_cpupools()
             fi
 
             # set phandle for a cpu if there is none
-            if ! phandle=$(fdtget -t x "${DEVICE_TREE}" "$cpu" "phandle" 2> /dev/null)
+            if ! phandle="0x$(fdtget -t x "${DEVICE_TREE}" "$cpu" "phandle" 2> /dev/null)"
             then
                 get_next_phandle phandle
+                dt_set "$cpu" "phandle" "hex" "$phandle"
             fi
 
-            dt_set "$cpu" "phandle" "hex" "$phandle"
             cpu_phandles="$cpu_phandles $phandle"
             cpu_list="$cpu_list $cpu"
         done
-- 
2.25.1


