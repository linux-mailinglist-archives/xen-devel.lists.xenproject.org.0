Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB956B12327
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 19:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058319.1425961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMUq-0001K0-OK; Fri, 25 Jul 2025 17:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058319.1425961; Fri, 25 Jul 2025 17:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMUq-0001HQ-JN; Fri, 25 Jul 2025 17:46:16 +0000
Received: by outflank-mailman (input) for mailman id 1058319;
 Fri, 25 Jul 2025 17:46:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22Yz=2G=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ufMUo-0001GE-O5
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 17:46:14 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:200a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3232c7-697f-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 19:46:10 +0200 (CEST)
Received: from MN2PR06CA0010.namprd06.prod.outlook.com (2603:10b6:208:23d::15)
 by SJ5PPF0529573EF.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::987) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 17:46:06 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::1a) by MN2PR06CA0010.outlook.office365.com
 (2603:10b6:208:23d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.24 via Frontend Transport; Fri,
 25 Jul 2025 17:46:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 17:46:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 12:46:02 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 12:46:02 -0500
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
X-Inumbo-ID: 3f3232c7-697f-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DO2XoOLepif8npNG1okleX46IAAhsESjFZuLe5Zz9EMQJsayYXKNzxP7RKw+W4RCW1AmgJQFHPyFdzRnQUWihyjVRlaYhOn8cvYgu3Im40zbyhLj549i22Z0+c6wBICT9v1GqBiHAfFdVY7aAigMTZVk5E4SuqDqzGaElIqi7V+nOHEhSxt+0F9Co3WaqH5w0CLlo4YtIMQNQMUDsvpl6yApT9LsaBB+OA/kb2unWJWS9dWHzogqqu+EUy45zFOEjwZRI26DfyQhfm+8D8k2usZu7d1rooYqQyLzcb0WNSHigfY3Jf6V/INhm+MJH+13C6qGQSJP8QoZBhwQAGesBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtJVGoCCDiGIX2Ur810mgMZOl0UP4MONen2Bnm/KhZU=;
 b=GvCMTvf3xHoRbaNzH4IDxFwtdLMkHYODQ1urC8UOirpvVTBnY92LoxCAELAAkc5cemN5j4IxLZWQwXtFWp1617Ka1QbhAonTDzSbn218Y57fzePhoEGr8XYnzuQsjw5nMK1kKpy0QrDKvd9A2tv1iMg1i19CPCHVl/Jhi9/uQR4ahPomjNueDSj5QCJoyfhf6jOI6otV9silCpxwygUNjnilZkZXaowtf/vf4wBQ5l0hcVNhHucrl5vO86FvRlYeFVVYMueDbjwao8aoJ4ZaxijGOyzAkq6wtx63AAWZ7PtZcCpVxBNq0s3zHbjJP44nZFKG/v4pj4pZoEV6OFYqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtJVGoCCDiGIX2Ur810mgMZOl0UP4MONen2Bnm/KhZU=;
 b=VljoDxMckR+5B/9KSoOpiHye+DMGoQL1I32h/BOYn0f7QEbclt+Jq6bbMXZphjbjHPIBKxPvrw2LfxEFJUm8mmk/2badIKOqOIeOV+LPOTE4ZRPJ2fjNiTwiUskuL72gNJuXJB/zz76DOaXi3av2bDxZpgjey8fS+Uu8/QBJubY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/2] xen/arm: smmuv3: fix xl pci-assignable-remove
Date: Fri, 25 Jul 2025 13:45:51 -0400
Message-ID: <20250725174553.15322-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725174553.15322-1-stewart.hildebrand@amd.com>
References: <20250725174553.15322-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|SJ5PPF0529573EF:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d940508-8689-4db7-24b6-08ddcba32136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7BYEUmXFhHLRydPl0LTNvWnPaY/XC0XWAXtsocIHq8e5cQravn/N7BOjJ+Y1?=
 =?us-ascii?Q?0ebWrmtRfCTknchGWY+L0uDP9nu8+CX5a/oiqbOpOVKeriI3folyq5bHI/ZS?=
 =?us-ascii?Q?2vy49JOvulhkjBbkm0AkRBOt33RK09iPbmtRkTvqJV2oqdpCwz9VlHR5vljT?=
 =?us-ascii?Q?Q4sbOG+24tgeUVHx9+aRcpRW2OwzOAltFPchtu23li6EvvGUhUseGnY5At1G?=
 =?us-ascii?Q?jJV+8WkeBCQ6fU1bVKgFBqaSQYWcMXXFPFUcL6zINmy5fVPUKfZEEwBhjWMz?=
 =?us-ascii?Q?kC6ObZChnWLOwBQAE1L/KBwBf0PIZ/HDCJVO4X7UFPCIpuhu6nOQRnOduQyG?=
 =?us-ascii?Q?0pXKaM0wFiJck2wIZZuLHFndQkEOO6dXyWpYVXotaNQB/XZPBzmVzRg4A/ak?=
 =?us-ascii?Q?i/nO/+eb1FD7mYAfLm6aiDzI6/pUtd6b/KTv55hbY3qouX2qYCHv5RFd6fJn?=
 =?us-ascii?Q?oV9U0o1HmWjF1YMlqMGdQV14bRbjhSgldDDgsxNbNPrp1eNA+7TAMXcQacrK?=
 =?us-ascii?Q?7YcruWfsaTzhig5kN+R5YiqqMEPJY41eLeJ3yi1djJ136KBNpaKtJsXy2fBH?=
 =?us-ascii?Q?BAXDYQFgeho8VA7V6/whJRTN68GZJE9eVWeJNW16EhOqAsEI7LlYbeD7wtyE?=
 =?us-ascii?Q?w1Y6hyStrEtvfKCL9MpIyIYNO78ka4ohkJ37pl9Wek3X5WhOwhBkcagJvJ6d?=
 =?us-ascii?Q?SXYI5V6HrEevftPT6YeAiSR2ehicq3BTt1oJ3Ou7qIJznmoNn/sPqK1322g5?=
 =?us-ascii?Q?QXIyM6fHsY487RRV6QpM4LNqA6FLaIWsQBSAf3ZDMzvePP9nLCbgp4OgGPgN?=
 =?us-ascii?Q?gx8cQqLOUS0TCbo7cewmnvMICMZ1p1Q1esoJ4Ier8uFpA8fbM+gQVvQitozl?=
 =?us-ascii?Q?/otR8Zz/d7o5xKZuMmekCKRjcfHUQiCEI0ZuN2HbhczVz0O7P1R+3+wIed27?=
 =?us-ascii?Q?Q+T+f/4K29u9uw247QmeD4CqE5c5Kp6AI6Uwn0UlgW25Xdunwdf1yRiuSwy0?=
 =?us-ascii?Q?xhCkpoXL91BZCVSepTQxbMRP6agyVIuDz/aRvgn8Ms8F/z4YOyLM11eYzwoN?=
 =?us-ascii?Q?s5Iszpb+1WeS+b4fgM8l8612kj+xJbzSouYXbIETAOBz3BcomNtm2JgMHw8n?=
 =?us-ascii?Q?0iJfTtugmpXTQasFVFrN0xFz0iY45x5E84rNyDee4bJ8QpiKJsPu60XyjcCL?=
 =?us-ascii?Q?Mwj7jYDYQgQSZlSJHVFmtjmuhpQH0d1WoyRGY7/mTJFVcq8usrrp0Ab0yqmy?=
 =?us-ascii?Q?CMHEl3XSY7V31PYkSJ/2PphQCcd8osCATlyKnr4KijZUemjwFBE27xWuuEHb?=
 =?us-ascii?Q?zKuP5TGxWWnS+Y2e6OWJ1ZlnbPjPKq/FL83QnSReDNqmUACrCKPpbn8Lu6sE?=
 =?us-ascii?Q?RlhCUk9BfbcSi05n+MDTXOSk8pQ8IV+uLQJ3Hz+S4NYOl1mX6O6vzOA1i0dY?=
 =?us-ascii?Q?rnq2K0wy9uxViQbicTvSCaxN2wQlcI1JxhC/F6v/TijzSLkDaJXsPviiJJhy?=
 =?us-ascii?Q?FYcGZ2Z8P9rY08Tfi5FqUN1qSI00z0ES25hM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 17:46:05.3329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d940508-8689-4db7-24b6-08ddcba32136
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0529573EF

When attempting to xl pci-assignable-remove a PCI device, we encounter:

$ xl pci-assignable-remove 00:01.0
(XEN) SMMUv3: <no-node>:  not attached to domain 32753
(XEN) d[IO]: deassign (0000:00:01.0) failed (-3)
libxl: error: libxl_pci.c:910:libxl__device_pci_assignable_remove: failed to de-quarantine 0000:00:01.0

When a PCI device is being deassigned from domIO,
arm_smmu_deassign_dev() should return before checking the smmu domain.

Fixes: 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices support for SMMUv3")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
v1->v2:
* use %pd in print format
* add Bertrand's A-b
---
 xen/drivers/passthrough/arm/smmu-v3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index db08d3c04269..5e9e3e048e34 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2747,11 +2747,6 @@ static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(io_domain);
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 
-	if (!smmu_domain || smmu_domain->d != d) {
-		dev_err(dev, " not attached to domain %d\n", d->domain_id);
-		return -ESRCH;
-	}
-
 #ifdef CONFIG_HAS_PCI
 	if ( dev_is_pci(dev) )
 	{
@@ -2767,6 +2762,11 @@ static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device
 	}
 #endif
 
+	if (!smmu_domain || smmu_domain->d != d) {
+		dev_err(dev, " not attached to %pd\n", d);
+		return -ESRCH;
+	}
+
 	spin_lock(&xen_domain->lock);
 
 	arm_smmu_detach_dev(master);
-- 
2.50.1


