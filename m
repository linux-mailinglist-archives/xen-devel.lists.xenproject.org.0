Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B8499362D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 20:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812317.1225044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxsR9-0000QJ-4Q; Mon, 07 Oct 2024 18:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812317.1225044; Mon, 07 Oct 2024 18:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxsR9-0000Nf-16; Mon, 07 Oct 2024 18:26:27 +0000
Received: by outflank-mailman (input) for mailman id 812317;
 Mon, 07 Oct 2024 18:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59Io=RD=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sxsR8-0008UV-5j
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 18:26:26 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2417::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5c87551-84d9-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 20:26:23 +0200 (CEST)
Received: from BN9PR03CA0586.namprd03.prod.outlook.com (2603:10b6:408:10d::21)
 by BY5PR12MB4260.namprd12.prod.outlook.com (2603:10b6:a03:206::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 18:26:08 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::f5) by BN9PR03CA0586.outlook.office365.com
 (2603:10b6:408:10d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 18:26:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 18:26:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 13:26:07 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 7 Oct 2024 13:26:06 -0500
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
X-Inumbo-ID: a5c87551-84d9-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hds3VkW6Ny1E8agi2EIasJT5mYbGqGsd3iy0c9U29DH3tUJjIPItzqcBuYioLdxmk8QJ0kqnMglgyl2evs5WJuUaad3UueIzryK4zIpni8C3kmgRNYJFMX3bnJ4dHHDApfxOhHGIYdgVOAtWK5Jm9qMym7sYt9coMJzFrh+Pfllm5JrEKIduvdx34yXajg0OWwdulgSjwnMc84KSBTgPGdcGCbRq0+aAPNBWlL1piER6uXbjsW3sbUADLLuGO7a+E+liI3BwFxlzIHOAI+ZkIbr6lo3py836bkfbLplXkIVBHbBAXyPBh1tTIpXzx0n8q0h83Y1UUjPKW7c7nMzUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2kJUBNkb3E+6TTcKbhCoBVt/6sNVP7REmYo5B8QLqs=;
 b=AzyDN75mzHFlelOJ67ZPAQnQzjA9oQvl+elFiU7s2yFr8oR4lFbc0EsrouPb9xEqUDQpFSwIOzOcfbJfKe2Jvy4K8CbNYRpjevRv4AXjuhKS86YRB/8bBzNmGBuIJ5fEArLdAF8nr2MSMZse1zG36fSL+Kh8Fo9X87wsDtVo6IHv6ieI8XABUfRflKwIqqYXIG0uGEhrnbY8hiCxJMS9+OfpSVHhxKkyud4tXu+NDppth4tZ3lFxD1gPEe5FIC3jCGefeCJaOS1JWUn9DJRE0kqFDT4siPgJcg/4yB5C8pe/b8w39qwFhj1gA0dYkd6daQHiNIJOVhZu8DQrGEo6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2kJUBNkb3E+6TTcKbhCoBVt/6sNVP7REmYo5B8QLqs=;
 b=T2OznKXWwkMTYmHaWHWD0T0Xq1JCz595Sgxof+arv9f00Ifm6wxUeSu8JM8FAPtSTxI0twkSzoZXijxt88riM6bsj7be6iTf21NO37N809YX8RXd/sW+x78J3+IRySyC5YGdxLRad4YRR2MCOu6L1EG4PQjdTBJevX2P4MwQz68=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, "Hisao Munakata" <hisao.munakata.vt@renesas.com>
Subject: [PATCH] docs: fusa: Replace VM with domain
Date: Mon, 7 Oct 2024 19:26:03 +0100
Message-ID: <20241007182603.826807-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|BY5PR12MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: a42fb8e3-1280-4d53-26fc-08dce6fd8310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GmEeCDn/c3SK0g74cRUAi5chkPmB3SXeGwbswQvc6fNUS0otHqrPUF+mPgGs?=
 =?us-ascii?Q?OUi6SrvohjfNYvaAV6CCnWEaCEFyGwPqNkO+c52JEwZyieljxRc5vJRe3G5b?=
 =?us-ascii?Q?OV1kikA614m4w8iHUXIG58V8KPjovrbz9hL6Kh4UCeosudijLjzptXLP9+Nh?=
 =?us-ascii?Q?+ucFS2SvIOv8FHfJsL9vIam15/pE89Lu+NJW33O0miO3bVufb5R+QBww6JwR?=
 =?us-ascii?Q?3F9pUw/g4ivmziQ9EF23icSHzfa5MQarugKzn+y5VZ4i+xIEI7eAoTbTouEg?=
 =?us-ascii?Q?00cSwx1MsR1VT+H5Q4ZNtoWyiwZS9ex5Ay1NlrB9ClwPBUgl3tC96y3TG5Ir?=
 =?us-ascii?Q?apsG33b+bOJutIcLof4Eb3x8C598EPOf5VS2bAvE2O7LxPHxM7orOEj9OMLs?=
 =?us-ascii?Q?3uf+6j3dD1DIr5jYmGmS/tPAQ3iX3Py6rWE/dWcVoCAsgbALfA/+9jfb4G8r?=
 =?us-ascii?Q?kYaGB2o5mVx6nD+tnJcpRFzL5DG9Q7AWS5EHGMbYViKcu6ws/c1rUmo3tCaO?=
 =?us-ascii?Q?xR/o2twhNzBKVPG7I4q+thGNbxln/uvFZ5ijXRDfKTXQ+Aefskn2p6lberkW?=
 =?us-ascii?Q?i49ZqNmzRP6F8m/bb5WHxmPryHIP0ZNe9Tn5axD7lKTgE2PoKAwJGLgNQWQe?=
 =?us-ascii?Q?dLEWGiefPX50jY5m3LxbwlFQArBD/PDsByViqv0xarchfj+4EIFMnI2GzVpm?=
 =?us-ascii?Q?vGz1is1+7gv+E6oufgtFY1j1EzyeI/jcaVRryFC1HuXysLt06xd2NRAyvCXF?=
 =?us-ascii?Q?md8VyuCB+9F3wBpm9YFNJpoDbYRSNyrbWqAvFIf65J6xY0T8XKQwCLVi1hAa?=
 =?us-ascii?Q?4BhCvPEiLmAedbtdZwsN4x2Ly5k8tBkX2u3xpHk38rvxco3/YWAM99kX+JuO?=
 =?us-ascii?Q?59xYRRz2MrE01ruGrmgusSrgnOB0TtQjJHv3esZt35WC1KUAEO8sFqAmL1B0?=
 =?us-ascii?Q?ribSv9axK5CWa7w1nw+vM+EN9OVPvsTuT1ucJ4WC1lITJcWUOfSlPIx0aoqo?=
 =?us-ascii?Q?vxtFl6q7tNsZWSOcCxHerwCtwxp5wdVNRfcFhZrZTpK/xNAs4W5x3Llco1ks?=
 =?us-ascii?Q?D2g6rgQzuuxzCJgF9MwgJfWruaygiUdYI2hrkKD53C1n4DFYPveA3B3D3vAh?=
 =?us-ascii?Q?/Qt1bjEpAsk7VvZvgjkXWGW6ga7ItrpEUzuKVDP5vJQe5XPLwtYra/CIDmtq?=
 =?us-ascii?Q?GPKV/V/TLYlBIq2M0LpQuVEPy+YQdWuRX0LiMphakcxtFi+NydLSX4uWO8Tz?=
 =?us-ascii?Q?uHmyLfjTGaSiqpe2S5WpWHGPHD0LqYWyc5TdxbEZN1rMDce7RSJpMQI02S+i?=
 =?us-ascii?Q?nlnP0XKhRnYaEWlMJ/gUrb5fgKRCzqxJrEpQo3i5OTiuSozxEe+H1cj82EAG?=
 =?us-ascii?Q?+BBQYHY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 18:26:07.9131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a42fb8e3-1280-4d53-26fc-08dce6fd8310
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4260

We should use the word domain everywhere (instead of VM or guest).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 docs/fusa/reqs/market-reqs/reqs.rst        | 26 +++++++++++-----------
 docs/fusa/reqs/product-reqs/arm64/reqs.rst | 10 ++++-----
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
index e98f348cf4..f456788d96 100644
--- a/docs/fusa/reqs/market-reqs/reqs.rst
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -3,13 +3,13 @@
 Functional Requirements
 =======================
 
-Run Arm64 VMs
--------------
+Run Arm64 domains
+-----------------
 
-`XenMkt~run_arm64_vms~1`
+`XenMkt~run_arm64_domains~1`
 
 Description:
-Xen shall run Arm64 VMs.
+Xen shall run Arm64 domains.
 
 Rationale:
 
@@ -18,13 +18,13 @@ Comments:
 Needs:
  - XenProd
 
-Provide timer to the VMs
-------------------------
+Provide timer to the domains
+----------------------------
 
-`XenMkt~provide_timer_vms~1`
+`XenMkt~provide_timer_domains~1`
 
 Description:
-Xen shall provide a timer to a VM.
+Xen shall provide a timer to a domain.
 
 Rationale:
 
@@ -33,17 +33,17 @@ Comments:
 Needs:
  - XenProd
 
-Provide console to the VMs
---------------------------
+Provide console to the domains
+------------------------------
 
-`XenMkt~provide_console_vms~1`
+`XenMkt~provide_console_domains~1`
 
 Description:
-Xen shall provide a console to a VM.
+Xen shall provide a console to a domain.
 
 Rationale:
 
 Comments:
 
 Needs:
- - XenProd
\ No newline at end of file
+ - XenProd
diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
index 97e90813ec..db91c47a02 100644
--- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
+++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
@@ -16,8 +16,8 @@ Rationale:
 Comments:
 
 Covers:
- - `XenMkt~run_arm64_vms~1`
- - `XenMkt~provide_timer_vms~1`
+ - `XenMkt~run_arm64_domains~1`
+ - `XenMkt~provide_timer_domains~1`
 
 Needs:
  - XenSwdgn
@@ -35,8 +35,8 @@ Rationale:
 Comments:
 
 Covers:
- - `XenMkt~run_arm64_vms~1`
- - `XenMkt~provide_console_vms~1`
+ - `XenMkt~run_arm64_domains~1`
+ - `XenMkt~provide_console_domains~1`
 
 Needs:
- - XenSwdgn
\ No newline at end of file
+ - XenSwdgn
-- 
2.25.1


