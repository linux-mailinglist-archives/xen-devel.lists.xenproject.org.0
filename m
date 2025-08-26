Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE406B3743E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 23:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095134.1450296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0ut-0007pS-49; Tue, 26 Aug 2025 21:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095134.1450296; Tue, 26 Aug 2025 21:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0us-0007n1-Vd; Tue, 26 Aug 2025 21:09:18 +0000
Received: by outflank-mailman (input) for mailman id 1095134;
 Tue, 26 Aug 2025 21:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ur0ur-0006z4-96
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 21:09:17 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20619.outbound.protection.outlook.com
 [2a01:111:f403:2406::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e23995-82c0-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 23:09:09 +0200 (CEST)
Received: from BY3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:254::22)
 by PH7PR12MB7330.namprd12.prod.outlook.com (2603:10b6:510:20d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 26 Aug
 2025 21:09:06 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::c) by BY3PR05CA0017.outlook.office365.com
 (2603:10b6:a03:254::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.12 via Frontend Transport; Tue,
 26 Aug 2025 21:09:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 21:09:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 16:09:05 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 16:09:05 -0500
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
X-Inumbo-ID: e7e23995-82c0-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrmole8tNjK5U2NTpcnCCBcoVgfG9yQAj1ennxuw9MT/+Bv1iceWuzeWailhyMN9hP1z49Jhp9JUeu6+UBEugFySD1HNNaTzjEcGhzFKC0YcPbu1pMfpTN3jiYDmkHFWekwcUDlSIMhJuEBkdZFZccmoniIpOZGOvT8l3L+KoN0We+bPRvjQcabWumJLMNgXIvfXUiZ6Li+JehlHo5S+WK0XBaKsue7Cblc1MhY7Iblr292eXVnXl6HENwQd/PwGUpMsk5g3qcPVelAc3gjy+YyAkLlqX9gWGzYDzjknDPtTow4g4gzOd60XKcFUD18TOiCVICAb/yZRLqtzgbLDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzDGiHAVkJNpJC5uvjQt5odWyjWh55jkKFPNsbwPekg=;
 b=ndekwmTYHOg/DI7VZ+4Zk8etT6nJpanzWfiQ4TaFZ7UIghxNrTX7u2gsVhnTzYlxF50+Glx+tAQfkEgNEIIOq9jNtaa5bTTRVCf2LLJDYkbYe6p8852dL+Z+XdyIphb0WX64sJq3oSU74QoYgWzwb8imsDuim+WhsmjMb8Tfh+xmum1gOhLzL62nTLpUFlsLXKIm/KhXyxYoy4Ug+Q9ZvfoveHz74VVfC98wbBJk8A44T6fLBoQ25m7YocGd9sihQlT9VLaA9NaGGpmT6WahiVbcqZEwHDMyz6W8WgfvSf7pwl36852cj3dXNBgAiJjl33iXMDtnGm03jho0ZGIOHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzDGiHAVkJNpJC5uvjQt5odWyjWh55jkKFPNsbwPekg=;
 b=l2IdRh75+bx1DRyVZYAVSxQ6GYvxG349Ml1rMXGN4rPLf+fHGwQuGMr1KIxx2siUrmd4B3GcsQr4jvyV8/UdEWMvSsi30N9pkocdX/OaGr2hgSrrbibsNPdWiDtZGk9p4SPNeOsSlMy80UsZFc9Vu6mQ4WKwytI5W8PmPBH0Yso=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v3 4/8] tools/init-dom0less: Switch domain_exists to check xenstore name
Date: Tue, 26 Aug 2025 17:08:43 -0400
Message-ID: <20250826210847.126015-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826210847.126015-1-jason.andryuk@amd.com>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|PH7PR12MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7660a6-6657-4480-26ed-08dde4e4cad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aaKThxY3Ik79VNrV5Wk77Kpm09H5RGFhe/J5eJCs/uZWiLE79b9fOYtPdH4i?=
 =?us-ascii?Q?Tgi/6d3gTeA2cb3Y36bbFXlLtQphzqgiry+wuyGnnSCZaRmXd+iFGQKGw98q?=
 =?us-ascii?Q?lH/5RteXsSzBvHC7DCIk6fAP+0dyRBD4pEfChqpwEipmNe1maiJS+KWmTNPq?=
 =?us-ascii?Q?m77rt4hD2y+/JeG6qqVnjGnNdcekGe6gLG7EcguB/IPdGiQuN56hDgSsJkFL?=
 =?us-ascii?Q?4/3lPQLrAZ69gnX8bxA5aSP0EqkscDdQ0QTAChuQwp4e165emoUmO1VUJm4Y?=
 =?us-ascii?Q?DRpyDSSf/cDqbWzPcxJhx+k29jql7bY82euH+7Hx/6ZXwuSPe1ZsEI6K2daZ?=
 =?us-ascii?Q?WjRlMKU/57DqG1EVBMg9l6WFtf5ec3JuwzzGwHAXuf1Zr/HS4ZJXvnXTcs5v?=
 =?us-ascii?Q?tqrCAzyzfcCLz8PSn5CKvA4xUoFi29XUNxOWLLEkWFy7bPB192Rgxdqd2Jfn?=
 =?us-ascii?Q?clvPO1RVVFhXUbxDxCydAY0zINTxG/l3mDnMK6NDBnKNI41ilScxxDDFaG7J?=
 =?us-ascii?Q?djUniZOgaW+gBHdRpIpun8buldIAFMLVa9vASCqthpQQYnU2L84giXGOIgNB?=
 =?us-ascii?Q?BhlWmi2IWVFlnqer91AFxq8MxqBdn8t+LUkoMXyO+X2hh7S0fwFMM8xZx+hl?=
 =?us-ascii?Q?C4+S4UDHCPyIGdCR5dh2kJmGA/lWyXrN18un/6VHemd4QgqY5xdCtedm7SMz?=
 =?us-ascii?Q?lXRy/0K8VR10IU8JhmDqoM8Q5wLsSrMvFt2D/wIq2jTh1LVXJvZr5ZwETe2X?=
 =?us-ascii?Q?44xNcZYrohU2XUOw5rR2IkZCMlslPFVqMTcPCTKvosEsI+bUcsgGuXmk79jB?=
 =?us-ascii?Q?42WbSG3ZRHUrEzcAyp071VNNJr3NchGOZ5wU5BLng168IfCzbuSTaGTx4r65?=
 =?us-ascii?Q?e6fqs1XKl/Ye63XOJvBx3Ex4VoW/gcfMApxy3BJ16vQACDiGzaSWVW3B2fFq?=
 =?us-ascii?Q?zomXl0Iq8Qa84nzTp3Sk8vMsKwZEsoJxVBGNOxuhNibao8wACzhHhiizHd2C?=
 =?us-ascii?Q?pw75E05TSsatoBvmLZz5ggBk5TirEP2oFM4ZKtYVKVrO8W1lLnSiL3cfZEud?=
 =?us-ascii?Q?XpyPqjI1WPVPib8q7vXIXTQOJWsBa11R24C3StcfoPKl6ESp5pNgwVPQ+DrH?=
 =?us-ascii?Q?OLwWSYmt4u0O7KNyaQnBXLeIfQbfb+BzS+XgvomesFUecc4HGBOFimS+ZjYe?=
 =?us-ascii?Q?Kc6H49NUTx8IakI42oGm4h5q8n/sQDCFotLhOjCJy2ySwAUtFFwol/uokjxL?=
 =?us-ascii?Q?Bklibt5a36sA3ryFEKzHyLnsVWWLkH4NFIZjMaCJUGaRjw6fDyEiuFKiPj5J?=
 =?us-ascii?Q?SJHA3gCuiXbq9wh6JjI9tlLwmcoItVNlr5ApLhY4yd/4m8O2hUSo5yl9YpDs?=
 =?us-ascii?Q?SxhwfwEaH+UieKWndQtPLdNF0R40oqYzGrcw01lxDjS3SUYguWj254t57aTa?=
 =?us-ascii?Q?V7I4o+B4bVGUbJUE9GDUVbGp6T4IBCXnFCZ1/14ZKYcJD58UsTku4cGLu/RZ?=
 =?us-ascii?Q?QNsROHHyznwpCXdKY7Q6ch/9hH6LZ5wKJVp/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:09:06.1491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7660a6-6657-4480-26ed-08dde4e4cad1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7330

Previously, the xenstore "introduced" state was used to avoid running
init-dom0less twice on the same domain.  With xenstored
auto-introduction, that can no longer be used.  Instead check of the
domain's name has been set and use that to determine whether or not to
bail out.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
Move xenstore reading into domain_exists()
Reorder
---
 tools/helpers/init-dom0less.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 3906c4b61a..eb793c7aab 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -60,6 +60,19 @@ static int get_xs_page(libxl_dominfo *info, uint64_t *xenstore_pfn)
     return 0;
 }
 
+static char *do_xs_read_dom(struct xs_handle *xsh, xs_transaction_t t,
+                            domid_t domid, char *path)
+{
+    char full_path[STR_MAX_LENGTH];
+    int rc;
+
+    rc = snprintf(full_path, STR_MAX_LENGTH,
+                  "/local/domain/%u/%s", domid, path);
+    if (rc < 0 || rc >= STR_MAX_LENGTH)
+        return NULL;
+    return xs_read(xsh, t, full_path, NULL);
+}
+
 static bool do_xs_write_dom(struct xs_handle *xsh, xs_transaction_t t,
                             domid_t domid, char *path, char *val)
 {
@@ -332,7 +345,13 @@ static int init_domain(libxl_dominfo *info)
 /* Check if domain has been configured in XS */
 static bool domain_exists(int domid)
 {
-    return xs_is_domain_introduced(xsh, domid);
+    char *name = do_xs_read_dom(xsh, XBT_NULL, domid, "name");
+    if (name) {
+        free(name);
+        return true;
+    }
+
+    return false;
 }
 
 int main(int argc, char **argv)
-- 
2.50.1


