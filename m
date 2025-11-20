Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60680C74BAB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 16:03:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167568.1493855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM6BC-0000Xk-6F; Thu, 20 Nov 2025 15:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167568.1493855; Thu, 20 Nov 2025 15:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM6BC-0000Vq-3K; Thu, 20 Nov 2025 15:02:38 +0000
Received: by outflank-mailman (input) for mailman id 1167568;
 Thu, 20 Nov 2025 15:02:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WvbT=54=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vM6BA-0000UU-P2
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 15:02:36 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef34f3b2-c621-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 16:02:30 +0100 (CET)
Received: from BN1PR12CA0003.namprd12.prod.outlook.com (2603:10b6:408:e1::8)
 by CY1PR12MB9559.namprd12.prod.outlook.com (2603:10b6:930:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:02:26 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:e1:cafe::84) by BN1PR12CA0003.outlook.office365.com
 (2603:10b6:408:e1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 15:02:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Thu, 20 Nov 2025 15:02:24 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 07:02:24 -0800
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Thu, 20 Nov 2025 07:02:22 -0800
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
X-Inumbo-ID: ef34f3b2-c621-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAQdPzKWrQAPkxZv6ezu6OimihO5pfvpz3Qu2ww3vK1f7GDGbH/YDdOBh7rivG3diDsDSJRdiq0eO0yA+rJnIN7Dq2l7JEesu5V9yn5CQ5+/yX6PMN7iYhyR2xGDEEnlu/PeqH1hzEGRphLCoGD3Lb18yEWrS6ExJ+lfr17SqExJf1sTMzwuQKECIjL+gvXXRx2Wzp1eGrY6ZIQpDmT9TPWthoy571CfuHfWrcYihj2mnCQut+qhZo4kaGIkgotD+YcWxDUnjArGOi6swDPGFZck0iTRwnZkHyiFO5UGaBYQIloxSMEDDWXznvy4+A+Y5m2HMVLSr0+N5+5CuftyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2nLiTpDSSUZfehX+bKGX5VdwvyGuO43/9Ugiz6aIg4=;
 b=kD383Ne5WuQq67VPij5lb+DgLjfTQDpE2VVs6J968fjJf7M0DnDR4UwDeRh/HUGJlHENQYao3LMEOP4NgFktU/lrg05NyRM5oFavWBff0FhGWj4DCmPEcAGbm8Dhg/gbNTi6H5IMRSaA6DrdED+jzKIX1f+7s87tiobdamtLrRB68xr6RsWGkftyOJxTXA5xqu26ISrdJr6JHAhydG4ywdLD4/betKTvvU11mjznX22eopVSLUF4hkuh6TA0Fc3lcYtRkVoW0FjG/C/r+9yKmn4L62UCTN8qBLPLNSzdCnSo7LNox12Jy9lqm8xNTXDC/OTFbx47bHlMmmgfMGJSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2nLiTpDSSUZfehX+bKGX5VdwvyGuO43/9Ugiz6aIg4=;
 b=dW+SGoq+0qXFJh7s+pt00p3b5G1WVRbl9mjSC6+jZaS5k1gDYLX70Xa2fzYVUkKcbtDWUGHO0uoBo2D2p8dI3NShdKj6+OgM4W3+Dm/QoLhG1ErPskOqqjA5XS186L/x9klkmSMXK6gBbbtr2Vss8rfGA0VPRR9EsOfhcsrTRo4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Yann Sionneau <yann.sionneau@vates.tech>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH 0/2] xenbus: Fix PV devices in s3/s2idle
Date: Thu, 20 Nov 2025 10:03:37 -0500
Message-ID: <20251120150337.3887-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|CY1PR12MB9559:EE_
X-MS-Office365-Filtering-Correlation-Id: 794202f6-a750-40d3-283a-08de2845d047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?06gyXChjiveeY1KjN0uM8T8AGiCEPqn+EvC9SwQ+OH4obWuYzd1BOhsNZ36o?=
 =?us-ascii?Q?c4it6aa8anmUM+uW/XtCv12gYZqejfE68rDGwbzYUU/yr2WHVnpgp93erg3O?=
 =?us-ascii?Q?aNYsEXwjm+7ScIcBgfyifa3QM4MAASO4BIRTO3YTkXXx7qbKpNx3vtre1nyh?=
 =?us-ascii?Q?ldHGNSH4GhanWuvBCj4aFw1+Nee/Kwn31T8zbz2bsbISvbSlApWOCldHfT8O?=
 =?us-ascii?Q?y+BVbeMxa6Oc3L9B46vFUZKQ4fgmV/2s+6T7rJLLIsmo4C8CxzqbuB//BibU?=
 =?us-ascii?Q?TUh3FIGj3Mjg1+WRR2hPue6zzzXSJcp7yA+0ptOGD03TydaFg7T4gOoul38a?=
 =?us-ascii?Q?up7PSk9M4uqtYUYsb2MBoJgmZIjJWH3cM/8+kbHYTG7ZuL+JtwuTkAX1E/Lf?=
 =?us-ascii?Q?alUZFnDJErpLkerJlwBGh964Z2I7gE3e55w6ENbdq4ceyt403ouDFU+E+iWe?=
 =?us-ascii?Q?+IOTCR3AlSQzuG9eWN9MrooZ1f6LWar2m1CucRJLNqwLWgfrk7LyGHBvsHf4?=
 =?us-ascii?Q?NOvEyTLUyBfztT8Jer5kUdj1xf7d9XEg8R1mN/lDEiSDYw6mhKKrVFDTfA+g?=
 =?us-ascii?Q?hcV7O7KfAAW6/UtKrTvLkZEIOt71yFqzdY8Yq4pMtshpbbqfS3zQ9Gftl5kp?=
 =?us-ascii?Q?wqmM7HuslZNS8PWJdJOnUWkg+EuEmhHgXlRDHTWawo0JHWVLeviYlq7cEGup?=
 =?us-ascii?Q?pQUtbnpHZlGw5w8Ih5Db/mnDzpGG4SzegMj5zfcs1gG++Ed3VrZBUt0uFi+j?=
 =?us-ascii?Q?+oA0V3IRA+/vhyu33OY6V1EmOs6FAGHPIwq9DZVezkLbACZD+aZ19CZ8Ss8d?=
 =?us-ascii?Q?S2kU19FMtGdwU6ArNecQ7q+PysZQ2qDBpzrVMI4zySoGs3Ei2cEPSOzoNK4S?=
 =?us-ascii?Q?kr8/3HC7+xeu69aLqcRai8r3im3613vLdKlnxhOeTPvAI6hCyVjIYeOZdaFz?=
 =?us-ascii?Q?Cubyiac78uOnIxY6hZhL9qtloqGq11lOoRHTnKlctFbwlDcb7NzG2/2Kwtxd?=
 =?us-ascii?Q?lz7sjTWixDKkxntGSeSlwoRab9Nqq54Bqk5JwE6pANPL6fxqk2aEnWtGP6QC?=
 =?us-ascii?Q?3Se4gvPinx7kQOSt5l3lsBPqW3rADqIu5SDPSuk5Xtul7ZVSRNQ6ylJ25ubF?=
 =?us-ascii?Q?w2QxuTp55sSWxS4uWUQoeuZcPUdID/fwxEfCtxKhYiyWK9IAys/NnlRoojHa?=
 =?us-ascii?Q?pIt306rlRJlddKBlvI3MsOqlX5/FQlpLHzUqdL83SA+JW2h5CXb5JzrOgiwB?=
 =?us-ascii?Q?6Rnhb9u93RktwTB9XbN+xCIeYgGvootcUi6uy7PtFwDqSudAQHs2ZjyAtCjl?=
 =?us-ascii?Q?Y3EPFG9jJJSV7mRmUrXn4YexkI3+UCUVNFtaEQFU2Dm8tB86+LAOa+a7kyP7?=
 =?us-ascii?Q?cWanngMk51a34tZyASE/Gvsz6//zlgyKabViArhtSsu3EkUuYajM4/oiBise?=
 =?us-ascii?Q?xRd6HleR8qNEWuB2M/OQLoqHWK9y85+ho+8mQODBJ48TmxziyVFNe+uWP8yS?=
 =?us-ascii?Q?fVNCfoeqqDUdff5IGLZgUJ70FjfcnRfHn0sujyjeim58YQw/coWOOvuvczHw?=
 =?us-ascii?Q?Ch3XHFPHEvkTaWswkvM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:02:24.4944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 794202f6-a750-40d3-283a-08de2845d047
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9559

The first patch fixes the issue, and the second renames some items to
match.

This was tested with s2idle in PVH and HVM guests.  Also xl save/restore
of a PVH guest.

Jason Andryuk (2):
  xenbus: Use .freeze/.thaw to handle xenbus devices
  xenbus: Rename helpers to freeze/thaw/restore

 drivers/xen/xenbus/xenbus.h                |  6 +++---
 drivers/xen/xenbus/xenbus_probe.c          | 22 +++++++++++-----------
 drivers/xen/xenbus/xenbus_probe_frontend.c | 18 ++++++++----------
 3 files changed, 22 insertions(+), 24 deletions(-)

-- 
2.34.1


