Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AFCB40D61
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 20:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107293.1457779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utW81-00078U-SU; Tue, 02 Sep 2025 18:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107293.1457779; Tue, 02 Sep 2025 18:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utW81-00076e-PW; Tue, 02 Sep 2025 18:53:13 +0000
Received: by outflank-mailman (input) for mailman id 1107293;
 Tue, 02 Sep 2025 18:53:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrvT=3N=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1utW80-0006sm-7F
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 18:53:12 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 122ebfdd-882e-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 20:53:11 +0200 (CEST)
Received: from CYXPR03CA0016.namprd03.prod.outlook.com (2603:10b6:930:d0::24)
 by MW6PR12MB8836.namprd12.prod.outlook.com (2603:10b6:303:241::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 18:53:07 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:d0:cafe::56) by CYXPR03CA0016.outlook.office365.com
 (2603:10b6:930:d0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 18:53:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 18:53:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 13:53:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 2 Sep
 2025 11:53:02 -0700
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 13:53:01 -0500
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
X-Inumbo-ID: 122ebfdd-882e-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=br0eaAFscp7noKkmjN0mjv3Bc/BGcmgsKo9+eEi8GqP29uf0Qe6hzLaSU2sePR6u7zGFHP1P23ilXbaGppu70+LCMpkLsDBRWIH4u9R5eM1x3bkkLkynLWAOSX5Lm4SxxV1M2H1sMOJ7PQQsuYTj47b6vZLp0ky/686mNWJinGGPhIHAiAf0gVk80WI1Fr0B1RY3EMa3l/p7AgFnxsCcpKXh2x1ZXFwft6205TMeY3KNE9hRrINoEeig6ePGqp0RbGf2fJgUGYQ9Uh05eh/I1YLaGGcHbcPEghuk2r8QvohJFEEF2997GRmz/0pokbma+OzjD3K/SrzQws4Y95Exxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6yCb7W2Cm2FwrxRUKS4GH+23hZoJ5wJ30wTXxrEdLA=;
 b=ict2SfU6Le/Ow0d2Mc9Z/gI3vCKcapBXSDZtHa1iOpZaZd6tmZIjl2kQBbiJI013ax2f/OtMmvIRndAvLbryVBt7OpXtK6TDwy475q8KsN4x+Sa5hR8IZlWcjtUMbA5MGSfJHTq9sbMp/KNK6FZn8F4c/JA6u84bIYdikN1/MIxaVx3B/p+QKOAzy1CuBtX46Gdbrxzeal0k4iBQxWISwPJimIHcfY3o39AnzRKCDvADec6MhQfzp3YgJZV5x/hK88GnbemBApoRA17mggnO9t5IV6NqArh8XzzlQuBxJ3Zvg6yrzffJnRQXF+S97n/+pshjU6qrseScDQXv9nLI3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6yCb7W2Cm2FwrxRUKS4GH+23hZoJ5wJ30wTXxrEdLA=;
 b=Q1hZ8T/JzZtUObUD6ycGlzOvZOeV7h7OQSifkNN673ZIFVfPCjJJqHDg/j2llw28hMt29ePe+x+lDJql2iNRGjI6ViuNf3e8JEx6hwkJs2oFRlMTF8BzNa9M772MCNW/S8OYsXk7IKaZnCj+LToIOXGbmPTH3HanBBoKihMIIQk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/2] automation: edit expect script to separate error message lines
Date: Tue, 2 Sep 2025 11:52:35 -0700
Message-ID: <be9b59f220f4ad1735e660fa89b96726dc504416.1756834803.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.50.GIT
In-Reply-To: <729708b7e6c1815e7ba9b712f6c847e0a0374fd9.1756834803.git.victorm.lira@amd.com>
References: <729708b7e6c1815e7ba9b712f6c847e0a0374fd9.1756834803.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|MW6PR12MB8836:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad6e037-cd66-4601-bf92-08ddea51f3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xoQHesoGw7cSA6WBj6NC/WsQFVSN3nWJsjb8cXitsVQlSVQrbAMv2201+sMP?=
 =?us-ascii?Q?3DTDcr4RUV46O6ezRrOM3dIHtcSgEin5OGNJgp7ofEVaDa6+A7PjxHDxoOgW?=
 =?us-ascii?Q?HVrJaCW9QCYmuKUmPw1sti+k1RrlJuMi30Gz3jt9s3vuS+n8kYYU+U/vNqxK?=
 =?us-ascii?Q?VdBYL9IeEzzIgOqmvRu7KT3D8BUQafpP+vdSS3pleKenhNrCf+nELUP2v/an?=
 =?us-ascii?Q?tvWxtdzYg8h0o8pVhEeOY7vJmdl1Ir1p0Ydc+Tw9VeJHGFW1SHf8pErJLNT3?=
 =?us-ascii?Q?e6Wc2T7UMO1GTBMMVN2HOu4YsgAs1q06n0ohn6UUHc/jgYsttxh+SQcv3d2r?=
 =?us-ascii?Q?mqTxj1rDMAEemGdxrVCWXCNwb07Pef43QL6CMJUIL9RdrRntsrNgK/6xJOG2?=
 =?us-ascii?Q?z725CY7J8pKinoloVv6N1tUC54BppuXvvp30vwbAOUsQMeVVFUV/LpLQvtIW?=
 =?us-ascii?Q?f+MVlMeYwxluqqqGq4avxnkOnjv93Oxqq+khyL9PTIX8vIvXX7jhK3SukDIb?=
 =?us-ascii?Q?wbrD8wITqCaI3h8OcTIroEIMXqKp5szPEi9D0A4hPUrI1ZObenK1UITik2A5?=
 =?us-ascii?Q?xBcBkZC14jo2FqFF7WmxldYGPvowu9zAux/ci1BkUkCvb5P1vdOi2UG2N4/L?=
 =?us-ascii?Q?HyJgoALR/I05mRgLOTG9cnAoEKSdphnZW2NiSz2DeUgMFJv1OqXfRPPku8zE?=
 =?us-ascii?Q?fSoUchcIC65F3FKJ5IDOFZ/K6gugzNXhChvEFiLuD3FaQF9/pXjtaYuZt2Lh?=
 =?us-ascii?Q?HI8wMv4TL+FZHwlk+Sv4mDlhq/TlmOQLTqt3uaWy0zHG9oWUrHn2oLAlB6Mi?=
 =?us-ascii?Q?BcdTri0YBVkJbgNJlN+Pa/qkMIMrzmKO4qkab/tcoS/hyHTcCtk3OZVMnu1J?=
 =?us-ascii?Q?w6GnLB+NzrujlMi3+Q05RsGPmJo9DR2hvRT9ZaJcE8ZWZTzSP7GSVNmS4gXa?=
 =?us-ascii?Q?vP7YQ25TNOEcqQT6Z2v/J0eZmDYZddV3iT8UtdvVUxUxdalKxTFL2QdNfydu?=
 =?us-ascii?Q?pCghVwmXT6WRG4896u9O2Zw9wX7ULFzbmI8cZaHslSwzecbB5Pi/ChrevDK6?=
 =?us-ascii?Q?uSg4p5ebODfdCsmQH8zW5i+gm/vkedYBwK6+PaIOY9L2SKGrkliSL25QBn4i?=
 =?us-ascii?Q?rTX+1KdsuCbramEouuOMNJDy1tyY4sghy+LNMxHNjPJ6cwYbcWxWTz0fRnQv?=
 =?us-ascii?Q?KozTu9slFqN3+VuHzYNe6QKBZdwdB93ngWQRzFBIbPc8adWxNn5fybReHWJy?=
 =?us-ascii?Q?Oqfzd9ch2JOzl70uFfjGMvg39RGj1OmsA6Uyws94WtMmLcvGwKTo3gCWQwTW?=
 =?us-ascii?Q?Jb/pjfxUIGfpXwgP75ixJx6OUO0N2cUHfnCrsCshFinDhL3URjXHz5RIlmU3?=
 =?us-ascii?Q?tRy5xKWGY66Q0LuJn8DN/5zRlsaPy5s0qGwlsWRA4k/azs7eyGNelIcXq7kV?=
 =?us-ascii?Q?p2CqVj8nTP066YgE24wXyGCotIHHcIJYqj7MaSzpYqZMEbVYFJ1UzA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 18:53:06.1864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad6e037-cd66-4601-bf92-08ddea51f3f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8836

From: Victor Lira <victorm.lira@amd.com>

The errors can happen in the middle of a console line which causes the message
to appear at the end of the current line.

Prepend a newline to clearly separate the error line.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
example of the problem:
 - https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/11220478458
 - line 652
---
pipeline:
 - https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2017775449
---
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 automation/scripts/console.exp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
index fc80513dfb..e27886bbef 100755
--- a/automation/scripts/console.exp
+++ b/automation/scripts/console.exp
@@ -35,8 +35,8 @@ expect_after {
     -re "(.*)\r" {
         exp_continue -continue_timer
     }
-    timeout {send_error "ERROR-Timeout!\n"; exit 1}
-    eof {send_error "ERROR-EOF!\n"; exit 1}
+    timeout {send_error "\nERROR-Timeout!\n"; exit 1}
+    eof {send_error "\nERROR-EOF!\n"; exit 1}
 }

 if {[info exists env(UBOOT_CMD)]} {
--
2.50.GIT

