Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DC2A5BB97
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907437.1314685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvXL-00013t-FT; Tue, 11 Mar 2025 09:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907437.1314685; Tue, 11 Mar 2025 09:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvXL-00011y-Bh; Tue, 11 Mar 2025 09:04:31 +0000
Received: by outflank-mailman (input) for mailman id 907437;
 Tue, 11 Mar 2025 09:04:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FZT=V6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1trvXJ-0000na-Pp
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:04:29 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2406::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5b43dfa-fe57-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 10:04:28 +0100 (CET)
Received: from SN6PR08CA0035.namprd08.prod.outlook.com (2603:10b6:805:66::48)
 by CH3PR12MB8073.namprd12.prod.outlook.com (2603:10b6:610:126::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Tue, 11 Mar
 2025 09:04:21 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:805:66:cafe::fa) by SN6PR08CA0035.outlook.office365.com
 (2603:10b6:805:66::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Tue,
 11 Mar 2025 09:04:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 09:04:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 04:04:20 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 11 Mar 2025 04:04:18 -0500
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
X-Inumbo-ID: d5b43dfa-fe57-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3lmWCBI1SfwzKnPhDhYbys+TwSBiZBEvoEWI7Nzl8s8AVSJzY1ZEl4D2Q2tpt1lEQ2lRuM5AHf17lFwXakfeQq8GbpWtXuCjIZRs8VC3JpANkombCoApGLLbGc7GlsdY6jtA+aqontJimmZG9i7mGHILvfP+vfIIUXdOdn4jx+0/NcKgXkf6b9sH9Zuxtr8/SpqgxG6W8h8UZO22jKGwF4Y5A9Lc1YRdaeLKEOt0wsrUiA8iDObRIaEYDucgNmZ/ajhAAaGPPjxKHYdSv+nhMZfPso5d8cv237ade78dxNbMN7uAtHudC9/9hcuAhxMcFqYGTyfsLgodNu2su3Fuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80brAO46bmDac1yCYoJVXqrH6nv3qcWOTeS80rNdmTU=;
 b=ajwZdNd4WmkXInHzTKoDYRN7hGVJdpyCCindVlAZJxtoVgEp0WZ0hyX3Fg1eDrxyVinKd/ortq95PdJbvh2fcdk3zYLRZuybIkA6U8MNC+YUwqQNjWqYKOMJFp984NCnlbCYaZORfk0tZbVA/XnLf5hW9MI3PSXSVh+jkyhXWtJ3pZkH8Z0GqD/TUhkK+kWmWQCaQScUZKO/vFxRqDbTaJVz1Z6lWJ88ezqFyFQJKge36hhmlGP3maNVKeLKNS4xeqQyDsoSzR2CpABlFVWFkcAm+F/ym1CWPtGfBizCBfeMzy91cMBjg5HIgAVvRjxrrXEF1K0CUVXqweVc2YYyNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80brAO46bmDac1yCYoJVXqrH6nv3qcWOTeS80rNdmTU=;
 b=hbk75kEkMLj54z4Hx8m793xM0kWOih85m8BKgM1OLXlPLtvei+D1CPpYZ8GzzkWXuHUFGditEb1vUPQFyYExCYajZ9ua29K0rGGNufhYe3MYmP2sz9YqcYk8+OFvPbq4/A1BEYcvR5Clm57VXuWC85BXsCw4oKKO0pw5xFf64IM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>
Subject: [PATCH 2/2] tools/arm: Reject configuration with incorrect nr_spis value
Date: Tue, 11 Mar 2025 10:04:09 +0100
Message-ID: <20250311090409.122577-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311090409.122577-1-michal.orzel@amd.com>
References: <20250311090409.122577-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CH3PR12MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: a40a0a1f-a7ff-42cd-292c-08dd607bb632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KQ/+PtggQAdTEuhWmxhbXx5iO6Dojx/XPEHrVsv8K4qfVuPWANMzG+c+BuI5?=
 =?us-ascii?Q?W7TLHDqimEwQoSyAFHWK6tnopcmz3xBZXN+C3f9FE0yIr6BM8FdO2efIt08Q?=
 =?us-ascii?Q?MJPDDV2SKRmlpJViNVeUEKBMWGnwEC/7pC/29GCPgzhI85kgsiOZCBS/Id/4?=
 =?us-ascii?Q?bukVAgdXiB+kG5ZhbuJLIMpGT8UxiQO7KAWrnStlB9suFv3I0bmKk1Glq0Nt?=
 =?us-ascii?Q?KpULsMPEK9Zqg80rYSX/9GngNyG3RMghFAxBNsQ/mE5XSWPegLlriQ9kyB86?=
 =?us-ascii?Q?j1P2mggxSRkNEG8uRNkfhpNjVhql5e7SngxrYjD5PCIr4NrshEl1HIhQ7TsE?=
 =?us-ascii?Q?HQzVlyvItcPcKvPu/pEFhvhgIdOyAOLG6JQ6iV6h+Cg34M2a0twPlAkapc/O?=
 =?us-ascii?Q?Zu6NwjP+q2qaNBqK4NOupy1303XMHfIYPrye7fit/tJ996SahnFbyJbSdpbR?=
 =?us-ascii?Q?oIQFiEjBzY3ND9CQlUE12ELLK9rPlxDtSMIBbqjPnXw6tMkDj1RCdC2FBm2f?=
 =?us-ascii?Q?s8hVfEGalFWtcApR5SJvaI7NfMFFLa1gXRhsDlEtEy0FKGalSsedi2uqfjQA?=
 =?us-ascii?Q?H4+2xEpW8cHmFd7818qCrOUvLiZpnRpj05HFNqOMfC0u3agOaMRMDade1gfJ?=
 =?us-ascii?Q?a8zwCzFTk4TvPheQ8Dr8glSlQ8S8HH3RfukZxKXH8boL9j/uNKFtkPql9469?=
 =?us-ascii?Q?OlgDRFXjjBGpiu+7mfqp3Q6suNidAxlrImAcWkslY1+UYfxgynhllCJVq8fe?=
 =?us-ascii?Q?M3bH/a/7IIDwHF9si5Rh1qitMH+NqY/DRPmYBL3tFe8wUiYCV2I6QGwpgew4?=
 =?us-ascii?Q?fL/HISPDsjlv/y10M6j0nrD/Ae6SXkd0NxtBYKHA1hRs7OCfZdU3l33oQVpc?=
 =?us-ascii?Q?lVzvsGc27sRRb4Sz5BLN3XqFScA1+y34xoobJ2b9UtVn1VvUp2CTlGR24GuE?=
 =?us-ascii?Q?/VYQPepN0RGiE2t3dwhucQuJLe2VZaPfFglJA+eBF8ee3NEBJkaHaIrkp3bB?=
 =?us-ascii?Q?zJrezpMGtggfZI14ocDFptFISFwjJC0aEODzoKTdWQkq34EhNU340eDuM4V2?=
 =?us-ascii?Q?RFF1wWa/Ogm3UC7icDYR1Gq44q+8/QN/e9jIClfu4bkoXtSqPG3rUtXnF7pz?=
 =?us-ascii?Q?7NHguBzQqQafCCV6EAgSnBtCkZpBtXxblIBsv9bV5SnrmSmm/uYE9IH0WiQi?=
 =?us-ascii?Q?zJTuPFMSI8RkMW25cxgBefASneDXUxWD4n8Le8n2e00osrHcUlHjbAdVSfbT?=
 =?us-ascii?Q?yZlT+awUaACAe944y8aZK6/1hiFRSuXgT1LG2Y9DbWsDDlnYZ/cUQmFOaOZf?=
 =?us-ascii?Q?zzzPMqlUhL+HVJv5FwlTmyKPusJbVSlQuqUax6aI3cfuJFeqmAZ1wU2vXs54?=
 =?us-ascii?Q?Awsu1ddIx6lipSt1tJzZZOlKqHMiim3G5Uz/HsxdOoic+XffQUpJvB//I1sT?=
 =?us-ascii?Q?jwVfVReuq2Z6VfhkavwM3ZXjKfv2H6uHDCE9z6TOahwuQyWSnUkxNYX/lYiE?=
 =?us-ascii?Q?IvMEmrWggWT2wik=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 09:04:20.9369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a40a0a1f-a7ff-42cd-292c-08dd607bb632
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8073

If the calculated value for nr_spis by the toolstack is bigger than the
value provided by the user, we silently ignore the latter. This is not
consistent with the approach we have in Xen on Arm when we try to reject
incorrect configuration. Also, the documentation for nr_spis is
incorrect as it mentions 991 as the number of max SPIs, where it should
be 960 i.e. (1020 - 32) rounded down to the nearest multiple of 32.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/man/xl.cfg.5.pod.in     | 13 +++++--------
 tools/libs/light/libxl_arm.c |  6 ++++++
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8e1422104e50..7339c44efd54 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3083,14 +3083,11 @@ interval of colors (such as "0-4").
 =item B<nr_spis="NR_SPIS">
 
 An optional integer parameter specifying the number of SPIs (Shared
-Peripheral Interrupts) to allocate for the domain. Max is 991 SPIs. If
-the value specified by the `nr_spis` parameter is smaller than the
-number of SPIs calculated by the toolstack based on the devices
-allocated for the domain, or the `nr_spis` parameter is not specified,
-the value calculated by the toolstack will be used for the domain.
-Otherwise, the value specified by the `nr_spis` parameter will be used.
-The number of SPIs should match the highest interrupt ID that will be
-assigned to the domain.
+Peripheral Interrupts) to allocate for the domain. Max is 960 SPIs. If
+the `nr_spis` parameter is not specified, the value calculated by the toolstack
+will be used for the domain. Otherwise, the value specified by the `nr_spis`
+parameter will be used. The number of SPIs should match the highest interrupt
+ID that will be assigned to the domain.
 
 =back
 
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 5a9db5e85f6f..ee9154298f2a 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -181,6 +181,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 
     LOG(DEBUG, "Configure the domain");
 
+    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
+        LOG(ERROR, "Provided nr_spis value is too small (required %u)\n",
+            nr_spis);
+        return ERROR_FAIL;
+    }
+
     config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
     LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
 
-- 
2.25.1


