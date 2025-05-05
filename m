Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06614AA8B2E
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 04:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975740.1363080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm15-0000pI-RW; Mon, 05 May 2025 02:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975740.1363080; Mon, 05 May 2025 02:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm15-0000mm-NX; Mon, 05 May 2025 02:57:15 +0000
Received: by outflank-mailman (input) for mailman id 975740;
 Mon, 05 May 2025 02:57:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LKXI=XV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uBm14-0000Iv-Vu
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 02:57:14 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20621.outbound.protection.outlook.com
 [2a01:111:f403:2408::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5217d05-295c-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 04:57:14 +0200 (CEST)
Received: from SN1PR12CA0054.namprd12.prod.outlook.com (2603:10b6:802:20::25)
 by SA1PR12MB9245.namprd12.prod.outlook.com (2603:10b6:806:3a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 02:57:08 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:802:20:cafe::f4) by SN1PR12CA0054.outlook.office365.com
 (2603:10b6:802:20::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.26 via Frontend Transport; Mon,
 5 May 2025 02:57:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 02:57:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 4 May
 2025 21:57:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 4 May
 2025 21:56:44 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 4 May 2025 21:56:43 -0500
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
X-Inumbo-ID: a5217d05-295c-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXCThR/1vhbz5eXZFiHV5S3u2jN8mnNGdu7L1AvPtaufzBc2Gp0TKOyM1Kl7PSeJKXvlbmxuLoxMPruEmYuCmv9LeC3ZDNbhf+MQJ8tR1nvGVS9Lfj+2KQIQi4zVT+2k81WJi88AfM0p9lHJChy60Gezx3frSYGcYUjX9AF6Slvx84Mraf7WCoxyhHLjRRvk24SXL49Y4vJNsF5J2mAotp3hajGViAMaKcJMSJWp/PBFsU/Sya0NTrUJ4bu1NxAqOI0BaVcGbUQlT5kMpxZgZLtwRd/QIbPaTuiAlIu8+Wrco3wuRIOcpPoQ/KzPYxIiWbhP9zwuzighJ3NSeBUmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8Ric0W30oVUy1JBURC09V+g0enK44KOZUfYMZtclAQ=;
 b=XXYnZQ0Jhxl+pWWgs2mZexMAPR1+uxj1//b2LPDOnsfXmviGCE+RmWTLWWDGhv47UScXDtZefhrnwV0OvSy3YRyUmsI5ztEtOD+x/Din+KXmH5Z+Ka/QwbDD5UUq9QgyhCcqqJ95BPw+xb13uzeV61Gl15yMhzoeiUltD8CazV93C1/MUsFm8RsId/wbG5rM1Ghj45NbK5iB8yOC4SSv57maS4GOS+laFWHBkthIbgbs5qCnDWJeZ+FUOjLikRjQJGbc/HY9ON1i3XTIuJTcfRK0Pw1HXzyqbplRC7K90rFNjkKgqckYUlXs+5LWsCKrPdUwRgLvJ3fE68Z/KbS/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8Ric0W30oVUy1JBURC09V+g0enK44KOZUfYMZtclAQ=;
 b=zZ85HJ7M1y3lLt5y8PW2NJjj3cRvjiicgIPSvOcFhJoeEzykdHPefHjkyL7mW3CUf5aHvpF2tLf8LWvAmiNZKVd692ym/Nr+U7i2hrySlqwAHwVPkNvhWibPq5N5E3qGGWqqeaxWQ8VfZ8POfKNVRd0u1fLMh1m7F8Q0Q5WKdo8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [PATCH 1/6] xen/arm: fix math in add_ext_regions
Date: Sun, 4 May 2025 22:56:24 -0400
Message-ID: <20250505025631.207529-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505025631.207529-1-stewart.hildebrand@amd.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|SA1PR12MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b3dd7a7-0580-4440-7b3e-08dd8b808630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lBHwNmRKT/24ex0mqx7wfy5/oqLvAJEu6D3VgjNQGgU7GmaH8Sbbw/dNEAZQ?=
 =?us-ascii?Q?8vE+4ICy+eIvCN+pD1BRXUWG1sKQvgnAO6u3QE2SMXWzRlYArzopvi2TSjFX?=
 =?us-ascii?Q?07awlh/lBaW/dpoM0TbW+5+tZC0a6DBTkk3mYzUrFsu50MtTW0OsYAGQM+w1?=
 =?us-ascii?Q?76TGUKJmr4Fyk7P9bTPt2EhIa9Tp+GNMdrhCVeItXZfVhOInICOYNYoODRBL?=
 =?us-ascii?Q?MXKYRlQ8p30SNnblmY3B907CXAUcuuPXEQY638vWwvA81/QdhtjhoA6NthGt?=
 =?us-ascii?Q?3DeaftbCValvPrfsgSjSvVdmjdKWLMS7UTGrQGFX/d6xVlmurT7W47T0f0ne?=
 =?us-ascii?Q?7npOa1gtI6MkxWDl8KQRH7BNzlyPpnHkuRkAssEbARVDiQZQiOoNniROw626?=
 =?us-ascii?Q?KJ5KLj2v4JZN1C9oNfQR8DzvqHjvqsSvy9b8/E3eOMXmfQpfzZysaLrx3qOt?=
 =?us-ascii?Q?mzfh2Cgjgg65qfykvavKOQ2RdhULZnuNq/oddm/eHOF8sqzVz1qhGp56NowU?=
 =?us-ascii?Q?PjRdmK+yLJQaHs2pHraIirUdhMRUbOqRh0+DRxGKi0zpd/8OVbPGAajo5KB3?=
 =?us-ascii?Q?7YAu4VDFoFNQ0E4unwiA9C6tZec7QLAAA7doJSYMY22JAOzO4vcMyu8p4c4y?=
 =?us-ascii?Q?li2Tjx74LsevWBt6OM2vUP7fYLeuYTNLY1DWUtkQjFZ/yVnYut5Z4EubElyj?=
 =?us-ascii?Q?5FXD5sOHeOc6exaTkURn4Ev308pSEDRSUDn0njk48o3YLTPv2rYF1ExiSZxi?=
 =?us-ascii?Q?FbFgxaibvJZkcQiRjkhdTLRSxpXbCST0cc0iPxqhjpPwGYW7Se0aAj5IWCSS?=
 =?us-ascii?Q?G7aKISv3lBy63q3IYtY6hR8HV9msNkG8mYFhcKnPpLaeUzrt4guUeXVnUQPn?=
 =?us-ascii?Q?3bJce7+aZIq27TCMf4YWtZYA/wK6yeExu6xF6ZMk5d9SSmyYW0ajamYKomVF?=
 =?us-ascii?Q?C1q2MIhpVPvrovx0ZkucFm7u+WQGYvw6v+SF9s2sf8WGXg7LQXu8IKVlpzrz?=
 =?us-ascii?Q?TooIByYsv6h5XMAn2i1KBv1xNkU9S/5F+B08dr5sC0As4cosepoUD2rmpMRI?=
 =?us-ascii?Q?DWYccRFp4TkwhdMpeiu/r+Eh7FBgZGc87vUIp43IN9akUuwZxNc1z2FzRyIz?=
 =?us-ascii?Q?Ov+5i7f9YP1oniBAuQVsDWoE4LOMQNe7zgIXgjGsS9xKSUvUy/GZ1Rpw5KAd?=
 =?us-ascii?Q?ph55IyN+UlSv4PDq1O6H2qzsRrZlYnNTEapOXI67FoFtUxOEek1urjJvTApp?=
 =?us-ascii?Q?N+Qet+EQWW/Qx7Lk52Toqn1RBFDVgcPKmcM1uBexac2Pu9uOicNX3INysclX?=
 =?us-ascii?Q?z8gV5O0RpIorp18zq3d4neE5zFa5S1aV0BF0l0lcuylu/oVdm8x9JGHbMW7o?=
 =?us-ascii?Q?1UaGovktcp6lSWYvtjeL8aKjeZfINjLuaC6Ueh9bQbmx9zyWv2OyPal2Tf2L?=
 =?us-ascii?Q?cayQknhbJ5KmVEPgYDOxaRVYlQ4OW6H2zHGtvnyCFOJxhwcUBG+EW5b/CLng?=
 =?us-ascii?Q?lQatdNVec6xmDxb9ALBriyLhwTrbopiZP558?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 02:57:07.9152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3dd7a7-0580-4440-7b3e-08dd8b808630
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9245

In commit f37a59813979, the arguments to add_ext_regions() were switched
from addresses to frame numbers. add_ext_regions() converts the frame
numbers back to addresses, but the end address (e) is rounded down to
page size alignment. The logic to calculate the size assumes e points to
the last address, not page, effectively leading to the region size being
erroneously calculated to be 2M smaller than the actual size of the
region.

Fix by adding 1 to the frame number before converting back to address.

Fixes: f37a59813979 ("xen/arm: domain_build: Track unallocated pages using the frame number")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/domain_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 270a6b97e42c..2f655bcc2237 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -864,7 +864,7 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
     struct membanks *ext_regions = data;
     paddr_t start, size;
     paddr_t s = pfn_to_paddr(s_gfn);
-    paddr_t e = pfn_to_paddr(e_gfn);
+    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
 
     if ( ext_regions->nr_banks >= ext_regions->max_banks )
         return 0;
-- 
2.49.0


