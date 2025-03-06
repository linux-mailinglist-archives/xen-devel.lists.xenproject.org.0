Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEE0A5594A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904072.1312042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK3-0002UL-TQ; Thu, 06 Mar 2025 22:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904072.1312042; Thu, 06 Mar 2025 22:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK3-0002OI-IF; Thu, 06 Mar 2025 22:04:07 +0000
Received: by outflank-mailman (input) for mailman id 904072;
 Thu, 06 Mar 2025 22:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJK1-0000Ss-Aj
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2414::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e93ab5b3-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:04:02 +0100 (CET)
Received: from IA1P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::15)
 by PH7PR12MB5760.namprd12.prod.outlook.com (2603:10b6:510:1d3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 22:03:59 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:461:cafe::35) by IA1P220CA0001.outlook.office365.com
 (2603:10b6:208:461::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:03:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:03:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:58 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:03:58 -0600
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
X-Inumbo-ID: e93ab5b3-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EV3DAIknSCgP+WWDAKPkYKyVWbeAinVltIoL0TLyxOtziNhzrGp56j40Ocgi6j5L6QSPyz96RG+uNoxl80bP1agFEyRpMC1/LvXzr0ysDyP0p/secFJk8q2xLN48l4ZEz92u2Tzzxo77qvm6qGTtLFfjh6lzm7/4xiLkGZDXUuYSNMoPW3uTTaHGSLfKBQd47BCyUCXw1aj+Ie6CBk0zcHWxqKZq1leOzincZas+JWFUuFfbLLfDPvUCjkBifs7w6oNYNSuPb/liToQ+A5UUZmLWImFYwuwxeLbh9o3yCU/kxgFzrH9xXznht7urrOfklFHAzgxhCKj+3DItIXf91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3tMNxxL+69wngCwofVJ/wGbA20D0gJe7GF8lfRxq1Y=;
 b=TgFfai0727G/lazIs4SVgYNtYCrn6bE21tVpmuRqYsxfiNeiHjIPyRu+3cive6Z7FzykDe6RrkFc2ihR3eezzVEQsLvLSu28YkeIeiODhZc0q4oxal3LGSVKq1ROPS6nkdndFwGzNa6snTCg85uPtxGHJN2A/YiiYmzTd5G5OPsB3/ayLy9s46dIize9CAjS6TrJ/YpKYcBT9O5WL/YbtgrutvgYosDeIBfsSJxx1XUVbmUgkkaLu2DYxJfIeECvAeMYLaFeb2dranl0YaOR1PnrklNKiKwq957vQbuvzMmeWCiZxSSoo63CYAWsirsT36DdScAZOv62Tg0dW8/ONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3tMNxxL+69wngCwofVJ/wGbA20D0gJe7GF8lfRxq1Y=;
 b=smkaHvpu03b8C94hFMRINJNG7yrbXRtnaEgpPtB3uZqg/+49hVqCXydlZkIhBsjnauer2x+eI6dXBOs3s/Ralv5WQO6WrPNbWTEh7epjnx67dKs64NdQ/C102o4ydcHPTVs8qtl40ql5YkS1LFv3azr1WMlaYgGUB5zmbWiGw4c=
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
Subject: [PATCH 09/23] tools/init-dom0less: Only seed legacy xenstore grants
Date: Thu, 6 Mar 2025 17:03:29 -0500
Message-ID: <20250306220343.203047-10-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|PH7PR12MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: 4830f4e5-5aa9-45d5-060d-08dd5cfacc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gNHPPqKJDgs6GwD36AszmwI7oqnKWwccyOupPOb5A0J6y6xOwhNqulb3ZlAS?=
 =?us-ascii?Q?joxjnGNFMKchlSflzjd3rg7Er6229s976CH+bOpz4XfQKNRmWx/VNhS2UxQZ?=
 =?us-ascii?Q?8WaWDNmPno6q89Km0pWBwrnUomJE76OY2a5/hFXSqBX81/2vJYpz3aWsJmsw?=
 =?us-ascii?Q?0EsYVSIda+l8oTsr9VW1zGkywqjbKDxml+x1J90ClcDiVXPFmPCTGUM5HmJp?=
 =?us-ascii?Q?xmDc1I5iIacFzKvB34IzVd/NVOWNev+mG8uzH3Ntop3BpCGL9ve1WS8a9ump?=
 =?us-ascii?Q?GbJ2SAt6tf1+nN9O2uweyNNgCU92X0bebq+bz1fU1DdJOAIMbuIVPw8vW9/P?=
 =?us-ascii?Q?y+a+a6858ywWjBg965/3hB7P48fum6oU8uQSbSNmlGF0HRM9yTfxfVp+ngtp?=
 =?us-ascii?Q?pv0d58cTEuylZEMo3OnRXOGjpVpp8xf1Jt6Ra6xPwm5rmZlSEH+fE9lpiCkj?=
 =?us-ascii?Q?RVW8o7NYCFdLdT7Vmwl4VelTVFw9P9+tSIaeBvYj+hOmcj4CIdowWKNhNgQo?=
 =?us-ascii?Q?IdxI0/gyOzk3BT7HUpHbIAmuD24kXwh6mfPJF58zta/9kb6/IVggx6CB5uqm?=
 =?us-ascii?Q?lbZFjp9iNvBRifKv6SbnFKrfOQI7lz81byL1rCuOT6yxR9G/S63rHwJnYam/?=
 =?us-ascii?Q?3ptg9mUEfbynqQ+joYstii/CIjEfkDoC66rQ2MD0D/nfS0ejvzcxDfHzFsaS?=
 =?us-ascii?Q?QrAdMOjrCG6qbgPrNcdZMQd8s1VhlQJ7BkAts62ssXQSd62kTQk+ElFAscc6?=
 =?us-ascii?Q?tOP1tg3bsUw+TJVUhAfCHfV+76QWfDYmhUp7JPf6/I/px7fJ78Pftc6vEPbM?=
 =?us-ascii?Q?5EHC7x88g7HzMCss1JBrYEbfn8C2SHI5VxMBYqrunAlRSR9HnY3U8mzsxO46?=
 =?us-ascii?Q?qEEdGpec3G3yvbBioNNpoaSL6QpToZ44qm2AQFT/DICUox+WRd9L8IzS4QAU?=
 =?us-ascii?Q?Xw5+QtzNoDUguc8SI9TZu3k9QNgcffdVsHwM3gl/nkPwXPPQqVrdULye1CIS?=
 =?us-ascii?Q?Dfdv+rycK9A6GmZVSqYWgDWDApYJYDqigyZUZfYaphpFuO8JBfGmRbFLMUDB?=
 =?us-ascii?Q?76Wlgg+VLwNt6fr5wZA5SagIhINCATxb8xeduylRLBgpngmaZ9LWbcFPJkPj?=
 =?us-ascii?Q?uhc0Pd25UDzVw+E2X2MNkexXhuUg6vGIMOJ5+9GqBjMDbwZ8O1LxhgrKn3mN?=
 =?us-ascii?Q?mc/a3vbRy/8Q5JR57qDfZonu5lZWqIJzB5bfZNp5NZQbU8Vw60mzdVsJMe49?=
 =?us-ascii?Q?bRgTQ1TPVg0TVQUGCfcTvlph21fqPfewVg5vLXEUCl4zYVJhy9bWm/Omzd8f?=
 =?us-ascii?Q?0170RusmwHAQXrLrNnJ4azrSjJBxgpk3b02L/HJATLDlLLyg1e9YH7qtN/86?=
 =?us-ascii?Q?G7XhKR34UHzWUi/+KcV/kUL4zN3P1m+mkYTFlrS7f3feqtvIoN+nFVSUz9Cz?=
 =?us-ascii?Q?SdI0Efwa1UZdeYglC8ns0KlhjiEdNaRjmx5ViFHBAV9uwNZxTEmJwwAZbRs1?=
 =?us-ascii?Q?Gy0hvNh7c/oNRpQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:03:59.1060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4830f4e5-5aa9-45d5-060d-08dd5cfacc0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5760

The hardware domain is unable to seed a control domain, but we want the
control domain to use xenstore.  Rely on the hypervisor to seed dom0less
grant table entries for Xenstore, so this seeding is unnecessary.

However, that only works for the new xenstore late init.  The legacy
protocol which uses init-dom0less to populate the page still needs to
seed the grant.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/helpers/init-dom0less.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 17579fe2e8..91edf17b6c 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -286,12 +286,12 @@ static int init_domain(struct xs_handle *xsh,
                 xenstore_pfn);
         if (rc < 0)
             return rc;
-    }
 
-    rc = xc_dom_gnttab_seed(xch, info->domid, true,
-                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
-    if (rc)
-        err(1, "xc_dom_gnttab_seed");
+        rc = xc_dom_gnttab_seed(xch, info->domid, true,
+                                (xen_pfn_t)-1, xenstore_pfn, 0, 0);
+        if (rc)
+               err(1, "xc_dom_gnttab_seed");
+    }
 
     libxl_uuid_generate(&uuid);
     xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
-- 
2.48.1


