Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688FA4BA02
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 09:57:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899953.1307898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1bl-0003hx-Vs; Mon, 03 Mar 2025 08:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899953.1307898; Mon, 03 Mar 2025 08:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1bl-0003g2-Rz; Mon, 03 Mar 2025 08:57:05 +0000
Received: by outflank-mailman (input) for mailman id 899953;
 Mon, 03 Mar 2025 08:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv9T=VW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tp1bj-0003Dc-Lr
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 08:57:03 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2414::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78df5126-f80d-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 09:57:03 +0100 (CET)
Received: from MN0P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::23)
 by DM4PR12MB5817.namprd12.prod.outlook.com (2603:10b6:8:60::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.24; Mon, 3 Mar
 2025 08:56:59 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:52a:cafe::7c) by MN0P221CA0010.outlook.office365.com
 (2603:10b6:208:52a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Mon,
 3 Mar 2025 08:56:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Mon, 3 Mar 2025 08:56:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Mar
 2025 02:56:57 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 3 Mar 2025 02:56:56 -0600
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
X-Inumbo-ID: 78df5126-f80d-11ef-9ab2-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVeYnvzewCGbDnShfsZytjwi3dG7GNDBUwZgVCWXgni8NKbdjHgNg6xAmUZZewDYNjEnlkbkcTzpFTdBtsKNFfHZh8rJCTu2w27e+hY+cLUS0frDiDjk2bK4vzUZLuCpKMEtK/MIkeU6uw8rC8v3blCkzhuILXpKW0lpSvYVM31i9YM9on4KkLX8vGwFq3Y50+t4os95QnwqZZPxZ31Ul6nQaCbfxx+WzA1LyMQbSCCC73ZY2LgE2UIF3nfk6FVmlW7GEizLG2V62IbJcFtwiSiXiv5Pshl4ALCc7voEPiMvWWI5AEIkzLNYWnFVat3TTd6VthhEyMx8oIiQ6354Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQmOEy7gXJx+DP+I6vy84CUACXTTBew/gftEYl44aIE=;
 b=qsJMYM3qp4NfI22CWqJTd3z15VU2m5OKXWPAE7wh+XFi5gv2ehGIddrgi/M9fTlrU+cJ/gO88skqbnhJwRqB3Tqoo3zNPpFVpsNqLCFh0AmTlAYEjIzsHKHVw0VI+9wG8+opkaCAV6WmpYxMweIChU59VhZ2K9uQOQhLy2xyOiCXILuFtagGzaC0GoFv3uRzwATaIP9YbphdZ+++PKA8XdJy5XhX28K2qfkPqdHWiO3ypnM8RmaLBqr/N34gJhdM3hy8u95+sTpHoDWIPvCAk88JDSGdvmF1CuvqBfXV3CssjcDvv5v1eQM6GhGgdczvUjiU2Zg7V5IDHvwEXHCVQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQmOEy7gXJx+DP+I6vy84CUACXTTBew/gftEYl44aIE=;
 b=ArIFeSMh+v+GLQJduuw5/HcihjeTRL22zqWvYJ1gX3NLi7V8FMHxezCbIxptCkDnv7dpwJpfKk9joF1DBtDqri1MaxJPh2a0tfZTi+TH5BjX+QdyMZ201kw0p2EFRIGMd1wc/0X4oFlrIyg+Xqvvnhx3O6VI+6Rp6Xx9scvyc2Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/4] xen/arm: static-shmem: Drop unused size_cells
Date: Mon, 3 Mar 2025 09:56:49 +0100
Message-ID: <20250303085650.74098-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250303085650.74098-1-michal.orzel@amd.com>
References: <20250303085650.74098-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|DM4PR12MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 22eb8960-63a2-4a9a-e0b0-08dd5a315b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SGqCdXH1UqBB/Qwtjk8ysa3bd6STpxF4sMRjT2HZ6HrqIZnqWDKSzX5tUET0?=
 =?us-ascii?Q?vlJrnUAvp3sPy4LWUTHB6T8CoDIAmn/b/Nu3nTcLKEYP1LR1ppAe83pa7LWb?=
 =?us-ascii?Q?DBXCgogiFoy3gFAHWO9jlfmX8aqQfn8q7qyL9lIwiojoRp8LsVgFkHftt+XU?=
 =?us-ascii?Q?X5H6whBIsjL7SsbNZjXnUWAIhg5VM3llmDSYW3Aw9Na6BQHW7bxUiQ5FyI3u?=
 =?us-ascii?Q?yhtjAFCc3shWMq5QT3S3KavZCUqeHsmn5w2j+4ySCSyNp3cpNeuLI+DfEsHE?=
 =?us-ascii?Q?MDvHSs6/k8pYiXz9viAAtlmu2XNnOAIh/1LRSPHhwleoOyvlS6F4l0kUv+Wv?=
 =?us-ascii?Q?LV0QEP9errSOvXrHorzmJ8p+fyPwiyQ1bWy4/UJohLvOchcWHv2GeSMfn83E?=
 =?us-ascii?Q?81i9DcXqFjVX7IA2mTAV66mZT+CuSnMpJrdFj/apKntZjPkw04tzuoJYSkAc?=
 =?us-ascii?Q?5v2/f5GCKAWXP+Gqv7Z7d6Zx7El+MU1g8IIyb65x8mg7Qd0uh95Ag1NY2Nm9?=
 =?us-ascii?Q?Ck+SFkLpE8zrw62tADghvvIACEr6beTa6qsqEMtOe1FQSvx3LcwYKtKx+N5y?=
 =?us-ascii?Q?2pqWFsAS2lUfqWLybwouuRI5E2WtQdRQzwRrgXcGWYkkLYy2CzMCE/iS9OT1?=
 =?us-ascii?Q?gfSE922JjbQaNagvDi+5nCQk1bWC8ixstV5eJUp+pPYTk/Y5FyCH1+tQHmUr?=
 =?us-ascii?Q?1kN1OxedYhrQq6+JdiJ+PPnV390c29rDPbVDrbJO3ov3eeGPcC9uu1nZ5TsB?=
 =?us-ascii?Q?XsQa4szxfqq1AaCnx7FG/sx+PEhkDNOW2g0UQ4vfKcpCRDrAADkA3Plv992g?=
 =?us-ascii?Q?Q/wcFDTA3ePWuGiLMwlxXSY5sVV69GPfjyBm4Ak2iI6jLptIpv2jOr+GBDT5?=
 =?us-ascii?Q?aC65qdOMREW+pZmyHp2JurtvI4En3SsEoQRc+CCgIhOPjkuAglKqkNQ9hG7Q?=
 =?us-ascii?Q?7XnnODr561pFDn3hwQqv9UKXuUqUbVHeLx6oAoXln1SJzr631tpKu8JtFUWh?=
 =?us-ascii?Q?vOdkxKaoIEhEOtumpfFHv6pqXtaKhONst+KA6JwiTY7S0/53WLH944Scu0Wg?=
 =?us-ascii?Q?eRTMW0AG02NekDPnfLDTLlsV8Kbs2Da2kiQ8GE10IcL7B17BvbarxeDBsZkX?=
 =?us-ascii?Q?IQU3uNWj2gB4ZS9bsgnJ/IhloLQasZowSZ4nXW3lgqRvJ62xTuAePirAhv5l?=
 =?us-ascii?Q?NfvLCTQAOeqNalv93THJ39qf9M1W0OETY0Yr2ddAgXm9S0gTXNg2aQNfASpF?=
 =?us-ascii?Q?oysIuDvRzpvMTWsiQ5tIDoeEeukBsxjXbkBI+lsI2zfzi3hM+MkxUOs1Mqv1?=
 =?us-ascii?Q?mO1aRzBruqIr96u2/pIyyiZL7K4SqM66SFL2EzzEowyxeJCJMW1AW0Pnz2OY?=
 =?us-ascii?Q?2DNAyz9II+9lDtqHy/qvSe0RAyW1Frc4QA5TthzLeZWJCEIO8eughHBOSQuH?=
 =?us-ascii?Q?hGfuZhJW/LuoBiz1pxgGYtythEK/ogJI4QI2Odc8WxcSzUuts43IKtIAMq04?=
 =?us-ascii?Q?YxGDgALGzgGe0ko=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 08:56:58.2953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22eb8960-63a2-4a9a-e0b0-08dd5a315b04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5817

Value stored in size_cells is never read because we're only interested
in retrieving gbase address of shmem region for which we only need
address cells.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/static-shmem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 8f87154c3587..c74fa13d4847 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -302,7 +302,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         const struct membank *boot_shm_bank;
         const struct dt_property *prop;
         const __be32 *cells;
-        uint32_t addr_cells, size_cells;
+        uint32_t addr_cells;
         paddr_t gbase, pbase, psize;
         int ret = 0;
         unsigned int i;
@@ -338,7 +338,6 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
          * pbase is optional.
          */
         addr_cells = dt_n_addr_cells(shm_node);
-        size_cells = dt_n_size_cells(shm_node);
         prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
         BUG_ON(!prop);
         cells = (const __be32 *)prop->value;
-- 
2.25.1


