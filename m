Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F0BFE844
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 01:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148556.1480539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBi9M-0004R7-Iy; Wed, 22 Oct 2025 23:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148556.1480539; Wed, 22 Oct 2025 23:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBi9M-0004OT-GD; Wed, 22 Oct 2025 23:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1148556;
 Wed, 22 Oct 2025 23:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KROf=47=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vBi9K-0003eX-V3
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 23:21:46 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df2af161-af9d-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 01:21:45 +0200 (CEST)
Received: from BN9PR03CA0227.namprd03.prod.outlook.com (2603:10b6:408:f8::22)
 by DM4PR12MB6039.namprd12.prod.outlook.com (2603:10b6:8:aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 23:21:37 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::2a) by BN9PR03CA0227.outlook.office365.com
 (2603:10b6:408:f8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Wed,
 22 Oct 2025 23:21:37 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 22 Oct 2025 23:21:37 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Oct
 2025 16:21:36 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Oct
 2025 16:21:36 -0700
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Oct 2025 16:21:36 -0700
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
X-Inumbo-ID: df2af161-af9d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R82Jvr4ADWm8F9AoiYmh8OOr+RfIhpoDhs5rGO5aCfzZGfDMozDypwRdwAxmuE7zYi8BaM0VH6gj5OktmFpmSzNkMbOk+C6jvrlZFsGaiyzh+GzwadH3z9tsP/gGabMI74EbS5bvWCeWeVpzBEjU0zSdTnRtKi23PpU9QU89NMgAMk0yXF257CfMUgpEhcLCf6c+oW7URZqoZXOiXnVGE559akRxeG8BhlAZrdkc1jl3khyVfTNGLQcCaaqngDE7sSxRRztcdBvRMvyAGI+bk2WW9OqbmAq6MYHGpt2yz1kv7v2VVpFYFlamSsi38vWsC+oFlcr1a+v2dd92Yd9cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsHimIMTsp2/hUmFO7m0Fj6zDKoxkBYdLmVHK3uqdOE=;
 b=YCDqpuUvixq1usU+rvObcYBh2N9GAjosR55GLrZs1/iVdOBH8UrXdDxOELwkJvyYTmOpWgf499y4JsyQ+2N6C7A8Vo3scljVpaf23AtplPtEefKA+X+a0hilsZj1zOqb0t2BWC4tujOcBIoHmmLA2kuAjzFA89GdOpylnatqEYgWVnDtGog3ENOzSnBSmyqdldFNzK7KMcbaq+JP0QGPdo9wwOmEt8ZS7/KMFEnFSd7xplisBtTxHL0RdoCeJ66vq5TYRGOUywOhyeD3dMmbiQjjxYgCQwSQ0zefu0dDM0rcQ3m5jmFlg9QgHv6Ki6/fZKRrxQ3r45TDjdxjcDy4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsHimIMTsp2/hUmFO7m0Fj6zDKoxkBYdLmVHK3uqdOE=;
 b=Fcf8B4Uc1d6BH1NRUYacy53LVNrTI/O/rvDMMW54KupNypKwecoUN5qZuuHn3Jy2kERSHXB+g4zGRSDKHf9ruyk6mbYm3IUVNBANqzSWDtZcTz+A70z+dsNzOdgoXGjUh7Wi9TYcIeoAY1A3helcTPuVU2srJ0p0v7+hnF2mjeM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<oleksii.kurochko@gmail.com>, <Penny.Zheng@amd.com>
Subject: [PATCH 1/2] xen: fix randconfig build problems after introducing SYSCTL
Date: Wed, 22 Oct 2025 16:21:30 -0700
Message-ID: <20251022232131.1190867-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2510221616570.495094@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2510221616570.495094@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|DM4PR12MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d8e847-0aef-4b8c-b05b-08de11c1bf6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dsm3kjhgOvde5K1GgCjR9rouyfFdDXzeLMFOaoAMYYx7HY+j9T6/j8tCUuyA?=
 =?us-ascii?Q?gKAmuzKuVmI0ANpbqrM9jCd2RTbXcykyoYJcPZoueX/Guft8QJOkK7mxZ6Dv?=
 =?us-ascii?Q?4SJQTmQTwcrvtDsCUoX3WyeICf7KqlwrxQYSlEAmqe8wGOJhsiOxZmx8m/ze?=
 =?us-ascii?Q?yDfVo7alKy8WUCSQI6z/jLl0ZxbFSVRmVJmuKhjbfvkWmXNyWWdbVryv+re+?=
 =?us-ascii?Q?oxEkFuutvVdjl0bzhZ/hu3WTHi442/5k3QIkM/2QRxtAome2gSsMvwPsBDZo?=
 =?us-ascii?Q?l/1TVvcihPEZwbLka1QhkbGuXkUDxYBRwq9mtfVhwa2cdoMVEd0iNTSgR8nF?=
 =?us-ascii?Q?5OfMk/zUi6F4zOaUiyVfWY8nozechWW9JeKmdOvKTM/kWZY6RBGrIEczdtH1?=
 =?us-ascii?Q?Oz4PzzidjH0JCaLk3NOSRESFGOAO0JWSBu3uxhLJ1pzoTV2WqV+nlIySziXL?=
 =?us-ascii?Q?0HcYMZaHZYHdoMtRaUVZaApgDN2Tlm9OGf9QCC7Gn85LtgnA0WTzOEV9cq/A?=
 =?us-ascii?Q?N7pdjCXe7ER+TMLbheVvUB6btWGY2re5pua1cbKgnPZIYLpQArYEbOCBbwkD?=
 =?us-ascii?Q?IVrwfGoE3YmMdCIw5JqnV6Zho23OZukil6PQh/k3YtqF7lyI7OmF1hjqbZgw?=
 =?us-ascii?Q?Ibiuf8lRm0I8Atdl4sp6jbrMNZoln/XamIb5AC6BMssV4i6BHUuCLcGrhPzH?=
 =?us-ascii?Q?Te0INhh6021tKuDhYAJY62FcUcI9sZGR3gsRGVDjS/AI324ri+zHaVtRjT6l?=
 =?us-ascii?Q?cluDrgNOJRorwWMLJ7U1APCKz0NFLfZGx4m/Cik2mmDKp+npFNwjY7PZia5r?=
 =?us-ascii?Q?Zz/wRkR10xp8UtpGpfaJA8oMVigavcXnjNuL9ZCci0bvKrvWwurBQYUrBvru?=
 =?us-ascii?Q?r565IEPxLoCOwQ6064yhDTcnmwaIsZksQ9GPmRHZ3jFPl7crTZiz3aV/75na?=
 =?us-ascii?Q?do0akWkaLyCW28eJ+TQRSrErW/LP1uXsB56Pbqk7BticNWqwM+y9ygXCay7T?=
 =?us-ascii?Q?T1rnhY7MngiQfTR82IVvi350s9V9cKQru1WKZFkDtGrWmmFi51FrLMpxF03x?=
 =?us-ascii?Q?an3yhuguhmqhJpar2415cNG7YleNxcBS0Q4hzsR42fuV+J300uw0aLotZoXo?=
 =?us-ascii?Q?kNBt34gzmQbOTHzaSH1fvP73oAvtNI2pxl1EbMgaVorfp1nHbw7YmNwx0MSl?=
 =?us-ascii?Q?eGKjZvmgI3xTrL28J5OXose1nubvHbLLgurVVXNpyC2R7WgYRUsKQBNqU/fc?=
 =?us-ascii?Q?8kxk7O3X5gIpcaW1wC9ytMm9N8T/p224cJpe43jABIFpYT0KAb0RFEoH5Mo+?=
 =?us-ascii?Q?TOgZAN3MHKzG53yH9cNYBTPVA3U1FwndeRf/XaKfXtLbcjMZA2Iok9+dszH9?=
 =?us-ascii?Q?MeTSAPTpvA/OgavEQQbUhKBgUXhon/PHTzXF9Qh0g27kfO70qBDGx4O4MwBe?=
 =?us-ascii?Q?tUMSc5Z+68fdTne+8Z+VzBoN2NhUPe2u/ciRtUQEVUnYbmF4p5Pxgn2z6HUP?=
 =?us-ascii?Q?Fkf1E4DWSdPfPtacNRG/KAo9h15wxDHf79lpiRNx7cCLash5qBHIV94VasVo?=
 =?us-ascii?Q?ep9sfHb75M8dpXZq9TQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 23:21:37.0568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d8e847-0aef-4b8c-b05b-08de11c1bf6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6039

Fix a few randconfig build breakages that started appearing after the
SYSCTL patch series.

First, reintroduce depends on !PV_SHIM_EXCLUSIVE for HVM, as it was
before 568f806cba4c.

Also, add depends on !PV_SHIM_EXCLUSIVE for SYSCTL, that way the
behavior goes back to what it was before 34317c508294.

Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
Fixes: 34317c508294 ("xen/sysctl: wrap around sysctl hypercall")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
CC: jbeulich@suse.com
CC: andrew.cooper3@citrix.com
CC: roger.pau@citrix.com
CC: Penny.Zheng@amd.com
---
 xen/arch/x86/hvm/Kconfig | 1 +
 xen/common/Kconfig       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 5cb9f29042..f10a2b3744 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -1,5 +1,6 @@
 menuconfig HVM
 	bool "HVM support"
+	depends on !PV_SHIM_EXCLUSIVE
 	default !PV_SHIM
 	select COMPAT
 	select IOREQ_SERVER
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 76f9ce705f..53f681bbb2 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -653,6 +653,7 @@ menu "Supported hypercall interfaces"
 
 config SYSCTL
 	bool "Enable sysctl hypercall"
+	depends on !PV_SHIM_EXCLUSIVE
 	default y
 	help
 	  This option shall only be disabled on some dom0less systems, or
-- 
2.25.1


