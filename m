Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7CFA5594B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904079.1312073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK8-0003Tf-Rw; Thu, 06 Mar 2025 22:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904079.1312073; Thu, 06 Mar 2025 22:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK8-0003Od-Cg; Thu, 06 Mar 2025 22:04:12 +0000
Received: by outflank-mailman (input) for mailman id 904079;
 Thu, 06 Mar 2025 22:04:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJK6-0000St-S8
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:10 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:200a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eccbd21d-fad6-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 23:04:09 +0100 (CET)
Received: from BN9PR03CA0081.namprd03.prod.outlook.com (2603:10b6:408:fc::26)
 by CY8PR12MB7609.namprd12.prod.outlook.com (2603:10b6:930:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 22:04:04 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::d8) by BN9PR03CA0081.outlook.office365.com
 (2603:10b6:408:fc::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:04:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:04:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:02 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:01 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:01 -0600
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
X-Inumbo-ID: eccbd21d-fad6-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igBb/rNrJJtTj1OVw/FAjL+qntAwp/wMHNGkLxU36W0poKfz8Li5/B3WvTJ2UnE/7zdUV9yViiewLHaf8Tds4oH0R5cKRy48SJhesxYe4dUir50kx5HEgjKZYmUFdU5lw28ptdChd37K3zcPbE/WlT0lpFGbtQn1qlvgCs+l/+GG1+uSc+e0OZ8jYiLJA+GdBeVd+NjIcrD1+KS0jrwODlGD7nAsUOcSrEiWDGhOMji8beJ1Xw6/nxfXS7tKuLzNZfKP8QTvZZx/4TAhlW1X+3r9tjVqBoLyaFhyKtQUmZ9olWApidzqPPO+XoU0nEjp1FekSy648/kA6JRx9ViC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5QzHpUS/M4+Ej+uoZdfWGBbOum8MFaCVgkFfNvjpZI=;
 b=O1RpEQEogXejU97OBOdMxGK9X+5NceV1ObfC/5N15vaOflLUInXfr2QjylM7ALrtlEL3LZpFQJgAtAy8aKURnoAAYs38bBQE2ZwbaD4MwUKUXRn4u4XpgAB9zu6CZZbo3KDzT5Y+Sxxb3XkKIHkUO1gd2l0WtNQpEGEiLwIXGn27FUsW73zG4IOWa8g9yHt+5MsBqo0eUsxY0jPbQz8OHK24Stok5NwRXUnnlO6CkkS83aBo23hXBBRHZ1o7633V5KNMT0LnZHQav993wUebvdtjc1sq38XIycXi2yHSSm2vBmmKRGvJoqZRqYMZHfDmz0s176DfVrj4zrT+Bb3tCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5QzHpUS/M4+Ej+uoZdfWGBbOum8MFaCVgkFfNvjpZI=;
 b=gMI8h3EsNOSj+TPbIOAB5KoSsQAQwF+0r4GecsOgoduHmWBU86zV+Sw05kXlQsJiEzmnIBqSc0Sa9a+2enqkLdiVyzSvq2Ptcy60uGMOKZ5wNU9yah3op/Zq1o02UVaeJ8upTyPajc8ncOQTCUkzgdd5qDkg+IrR6ZLbLJ/qzW8=
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
Subject: [PATCH 12/23] tools/xl: Print domain capabilities with verbose
Date: Thu, 6 Mar 2025 17:03:32 -0500
Message-ID: <20250306220343.203047-13-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|CY8PR12MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 570705b2-b948-4482-3561-08dd5cfaceab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XfepmS+/jEpYvu4lv01+myQGRIaYEXrXeSn6DzfUgwgMOZmhAS1B7bEUmELj?=
 =?us-ascii?Q?eczAH5/q4U/Z3Z195AzemLpIoi3eSJWSdeh/uT2tmXInX45qqNMWDgAs3Kd7?=
 =?us-ascii?Q?N1liIVB+8tsYKVkhidFnC3fe/5uGyEnK4B36tBYUEOMVAagWJ2lNN6y+pkFx?=
 =?us-ascii?Q?I9Taur4KaCgdfcaZRcsrKpieW2cvJvQb6rncUvq1VW2045bBZci5eAdvH0Cc?=
 =?us-ascii?Q?fOj3/j7fHLI9uynsEMiAF7mBeHLdP2QlrZv8wfHNtkVcz3J5vk8oDLRnixLP?=
 =?us-ascii?Q?S6zO0lQTQtwUqJ/2BFY7KuvCs0ap8Kuh/kYRYJeUxtsRG9tDTbiN2TM23B1r?=
 =?us-ascii?Q?aRnrHXlxrqfLypLZCXwdh3t9Ta3dzOZQbWgfY/My8mOc2px1X87k3iQ2nJsP?=
 =?us-ascii?Q?Uo2W8gEAOER4GEC2YlcLShvtRsdDRdTOcVtSKH/rsw5YYQn00/Xa7u4kZBFE?=
 =?us-ascii?Q?sNg+8ENFmfMTCWr5BSwEsdt4BAGmQpOC+FWwrDbrSnuG04V+Rh+mMDfQKHNN?=
 =?us-ascii?Q?ME1MMOq3/Z1k5RG9LL1heOB9Fud7vfirzKQxabC8/Yn7rQOo0tFpARZi81YP?=
 =?us-ascii?Q?9AAVs51C5euB7eAresIoyDajBIYXHMniuP0DwkS5Ut64jvePe22HpUCub338?=
 =?us-ascii?Q?1zmgGxfpEZ5aB19s/SaapY1d9CSK8LhhxtX3QN3ZhK8r3ADDYiScuB2jNoJp?=
 =?us-ascii?Q?KEhVddtE5/5kAMzo2EaeoHXs4NVNnhCgYmODpiO2elqWMiSFtLxA2xAcG7UX?=
 =?us-ascii?Q?0rrE6mgfStvggLSzeeV8rlGCBoFMiy6fN4iZbHSq2oMz75JVNajvqcWURfmW?=
 =?us-ascii?Q?JFJXE6CAaysSIrSslUxaRVFE2Ygmi0C7QLaUlq3uhNxkFJPxK2UXHTJhdJ7D?=
 =?us-ascii?Q?cTaDWdiXOSX1+CQbFs5b6LyO5aPU6BCJzwE5mBhVKA9PDx5+b+lWd7xVtUsj?=
 =?us-ascii?Q?hU/loW/+W7IAAnLyKKv4ijNaFXFvlPUL9d7zyVvFwurz9JKqPAlno5rQdX7l?=
 =?us-ascii?Q?os2UrZqw6zyX2iM8hN1Lcy4u2MC4mybwWHil/yAa+JqMxOKHMFMacjTo5eQz?=
 =?us-ascii?Q?FbXqH9qi6oSumjlakXB4mwkVph+sDFHxRPf2EF7sKNddHQ6BMAfs23ZrU2Kx?=
 =?us-ascii?Q?X4aGb2Q2hYXBQwA4w8iWum/F9qj8NxotHs4bZ9eahYXhX4zP5XitfGoe66Ab?=
 =?us-ascii?Q?+Pc6rATD8LFL19Qw/hBt1fghI7HFgZPPd8a2vz0Zvr/pH759uYJt91yUoaH9?=
 =?us-ascii?Q?2vzl39to1w8NxucE+ZLCX7fLWHoHAaO/Lv2814kqv2sK5WBJ2n0dsca7TzUD?=
 =?us-ascii?Q?giOVSwug4gwpXD5+QEd57Jy1Uagxc7E9ul6+LWmaXvu31Bh2htg95h/SWwFz?=
 =?us-ascii?Q?fBJVAXrePqV0nLR6IC/dNvRFCCiKoQqHfXAQQP7cuBWd/P9BNqGc/ONN5DQV?=
 =?us-ascii?Q?HLK5oTXRtgNK0knrrVhCwvOmR3aDmJZlib90sXM9VLkpwDdodv7Ycw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:03.4915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 570705b2-b948-4482-3561-08dd5cfaceab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7609

Capabilities are show like this (long lines trimmed):

xl list --verbose
Name          Security Label      Capabilities
Domain-0                   - hardware xenstore
dom0less-1                 -                 -
dom0less-2                 - privileged

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 docs/man/xl.1.pod.in |  3 ++-
 tools/xl/xl_info.c   | 24 +++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index fe38724b2b..8e253180a7 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -313,7 +313,8 @@ Also displays the security labels.
 
 =item B<-v>, B<--verbose>
 
-Also displays the domain UUIDs, the shutdown reason and security labels.
+Also displays the domain UUIDs, the shutdown reason, security labels,
+and capabilities.
 
 =item B<-c>, B<--cpupool>
 
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 72e87eac46..3e3a793e12 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -384,7 +384,7 @@ static void list_domains(bool verbose, bool context, bool claim, bool numa,
     libxl_physinfo_init(&physinfo);
 
     printf("Name                                        ID   Mem VCPUs\tState\tTime(s)");
-    if (verbose) printf("   UUID                            Reason-Code\tSecurity Label");
+    if (verbose) printf("   UUID                            Reason-Code\tSecurity Label      Capabilities");
     if (context && !verbose) printf("   Security Label");
     if (claim) printf("  Claimed");
     if (cpupool) printf("         Cpupool");
@@ -443,6 +443,28 @@ static void list_domains(bool verbose, bool context, bool claim, bool numa,
             putchar(' ');
             print_bitmap(nodemap.map, physinfo.nr_nodes, stdout);
         }
+        if (verbose) {
+            bool cap = false;
+
+            if ( info[i].privileged )
+            {
+                cap = true;
+                printf(" privileged");
+            }
+            if ( info[i].hardware )
+            {
+                cap = true;
+                printf(" hardware");
+            }
+            if ( info[i].never_stop )
+            {
+                cap = true;
+                printf(" xenstore");
+            }
+            if ( !cap )
+                printf(" %17s", "-");
+        }
+
         putchar('\n');
     }
 
-- 
2.48.1


