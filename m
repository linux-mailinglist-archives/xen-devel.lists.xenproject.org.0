Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D8AAFB2E
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 15:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979383.1366010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1BZ-0005iI-Hl; Thu, 08 May 2025 13:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979383.1366010; Thu, 08 May 2025 13:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1BZ-0005gh-Cj; Thu, 08 May 2025 13:21:13 +0000
Received: by outflank-mailman (input) for mailman id 979383;
 Thu, 08 May 2025 13:21:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uD1BX-0005gY-C1
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 13:21:11 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2416::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d33e15d-2c0f-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 15:21:10 +0200 (CEST)
Received: from SJ0PR03CA0252.namprd03.prod.outlook.com (2603:10b6:a03:3a0::17)
 by CH3PR12MB7594.namprd12.prod.outlook.com (2603:10b6:610:140::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 13:21:01 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::ab) by SJ0PR03CA0252.outlook.office365.com
 (2603:10b6:a03:3a0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Thu,
 8 May 2025 13:21:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 13:20:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 08:20:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 08:20:58 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 08:20:56 -0500
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
X-Inumbo-ID: 4d33e15d-2c0f-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKzW80P4B1t+/bw5zbhVe8ZOQ5nPsTCRR4KxnZx1Q4L4Zo9EUTarEp6IZtkrUAD16lyD/OY6cUwCRuovFtMTZZAXLHIThsLrrWGrVDnIgiYRHulA3f8rETcueD4BXgV6nPsmJs4qu3r6+fNAttWIS6AncnH8i/A/ZS74mlRd67K+I25CfWkJCWnuIhgXea8SfnAVPKrxFAYUhVf1CG7e3RWEv9/Ln7l1a4oCWRCIMdoEGgupVKRi0qJX+2VQ4h7Mi4/z/9+wMJH7/2eASeF52b4FcYf/d4jA9/ITLV9Szw5et62waVOHx0wvI55TNptuQaVzoMEHjalhpeG/CmmeSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ebr89cmmGKzjaVd2xUcU9bNIqcI96l1VlD/ym5sCsJw=;
 b=R6GDDdgUUQZZnJyBnuYYj7av3BmETVPnV0mdqXvU7my/k0IEuBAt0TE8wyJ+eGWrnqTliySyamh7UgzBzEyfHHGI6qe09xkp0wwH1l8ZySbIatko3AgEC2rJStPugDVniZummKDmBpE7/lqiMMfiA4kE64YM+E0fZkaP5M813huCw44W4+G05/R8gonbVkQlNLZveKP0pmGEuRkwyDfnpF3CGktzNIDB3m519gqc2u+rDi8Uiy1B5L2OqxCD+ZAT6p8SHybNV7VfKDwLNp1/UwkhWAK8htjACOB7hGNDQQG5HQKxfyfxGbG8TbK8vwY1eQ8ZO08ywdN+O2v+rcgRdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebr89cmmGKzjaVd2xUcU9bNIqcI96l1VlD/ym5sCsJw=;
 b=oBV3KE3KVVW/omjVU8giP0DbYQXihp4KlZQrlbRt+I3p4BG7y3XeO5gwV8jhGBWhn4DlxZap1DyjAQggkscJsBgVfJYsa5Y0GtmeeIEQSTSaaEmO7s6zwpoAj6RcIst+o/+fqQ9oOVWLCNs3BtJFPQ7nsgDhGzWQlFtY8KdCd0I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [PATCH v2 1/6] xen/arm: fix math in add_ext_regions
Date: Thu, 8 May 2025 09:20:30 -0400
Message-ID: <20250508132040.532898-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508132040.532898-1-stewart.hildebrand@amd.com>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|CH3PR12MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c62be5e-7b55-4a63-004a-08dd8e332c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TBXwOH0TqOueMZ6yrTGaXj5XbCnOf32tbfE+4IBfNYhf4wzzY3J3uPmu3baZ?=
 =?us-ascii?Q?IKOEBH23ppCsAyfudXC7fGLc3eSyVJongVhHgcisrqNFGI67YMSwr2rIyNZJ?=
 =?us-ascii?Q?C6cn1tf6PhK/Hku610IsVI7jLrD8YNNqNpgaupcyXq15U7JlkugE2oMkC+Sh?=
 =?us-ascii?Q?Dc3JJk82eRf8H4/C3hpBXXVPaWr67XqjXb/pK6HJcGbHPjUC8H4CGm28zNww?=
 =?us-ascii?Q?QIVORKyKYfy8oqDt4I8lJj5unmSQOXNOfJBC+BLqTk35sALeVSXXd2Ej826M?=
 =?us-ascii?Q?EmTDZ4H9zYROJYvr5vtQuV71PetZrE5Q1jbJefIuo+SDMZHK6A39on5Qga3q?=
 =?us-ascii?Q?YSqR96p+SmmZxTvM2+Z1YlMrvbRxo8mHE610U4XFWBoU9o5LrAS2F+RHhJ1v?=
 =?us-ascii?Q?dbmzC0UvR1ex1chbIYDBwZeLM3rwwim5IR7clyY0QLdXdhoL5IPfVfFFxJt6?=
 =?us-ascii?Q?7nelyN/fxpvN1PiuTR71FQrf/9HUT/LmcZy3r/5fnuhXNaWK743xf2nd/Wcq?=
 =?us-ascii?Q?VoqhIB7OBC06aSZdovfGXFv0gH+wI73BQ4ameJZkP99182gFWF9oqtNRbMgq?=
 =?us-ascii?Q?wFc+6gMN/77CCUVnpxAtLvZTkLMYzH8lLu4RY+s4WZaHQZre1tnEGZCI6kQ2?=
 =?us-ascii?Q?bDNWqqba0m2dp+XNpuR86vEAZmxNaWPKC+5QUgrBvl4kzv3jDiXzlAZqjOn1?=
 =?us-ascii?Q?Qg/M3WWWfTHtcAnrw6NFlYQxmGawcm55o7FXJJ7pVtlSVbH8RRNoDESq83ci?=
 =?us-ascii?Q?ZLYC7eRzC5zmGlYW/INQ5U9VfRRrld9KVvAzSAYzB5uiBSmPqEE2WfeDWfeM?=
 =?us-ascii?Q?OQ84vPDGW0Qh7egJVrvD/AsBgMvkUfJlaxyrBW9SXAETStS2Xjiif57Ex1vl?=
 =?us-ascii?Q?zMey4roFmgQ+EpcNmAZ5oO3caltMcw2kJ1IuO93UPvDObejI+7KplOmCHLgD?=
 =?us-ascii?Q?93XUFW+pV+K8J5sghE6YUIgrgYIqgY5Fih5Nwd/sY3R1wiS5h0g1VIi/lm2d?=
 =?us-ascii?Q?HxEtRPyThXq3Ue28pLPqtUAWIQBJCWGIBUgpCz+w2t+s48yC6rsjgMM0V8vr?=
 =?us-ascii?Q?mx0EXKVO/B579RpSX2VFydvlBGZmCeTthZDC4FVeOyF1cCL/xmlbiFJAxzbs?=
 =?us-ascii?Q?feUhmqsGBwGplICB7oh58PEc/Bb2CIkW8koA5ReJKqxIMQyRO15fppreQIfk?=
 =?us-ascii?Q?u8uR4rK/tywk08VzeVjq1wEmUvzzb6nWZo6KkeqDRG5X9zHtGAjs5BVRIzor?=
 =?us-ascii?Q?onTqwWVbO3LNeaAVH8eC2vSGSFk0neosUyHnM78ARMCt2HT6tXPtyGWjVXJw?=
 =?us-ascii?Q?XQrI4cOqVtm92ScjCifdSu/meqCqE7+IQPhw/PODezfz/rJ8mWCZc3yDmu9F?=
 =?us-ascii?Q?aEMo3r42yV6mZEt0zQqiNRQLJAI/vYRBX3zpuyXswy2xgTLfEIa25mNMeNen?=
 =?us-ascii?Q?d3Acqmdol1kc75zfXVMUx7o4+6mj9Yin5VZjSFc6/72uK/3l85Xpkem64xDJ?=
 =?us-ascii?Q?SyDXGUdeYM9ocX1f1N/Oqy/Aa8cqQP0I5oVA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:20:59.5555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c62be5e-7b55-4a63-004a-08dd8e332c78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7594

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
Acked-by: Michal Orzel <michal.orzel@amd.com>
---
v1->v2:
* add Michal's A-b
---
 xen/arch/arm/domain_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index df29619c4007..2f2b021dec3e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -761,7 +761,7 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
     struct membanks *ext_regions = data;
     paddr_t start, size;
     paddr_t s = pfn_to_paddr(s_gfn);
-    paddr_t e = pfn_to_paddr(e_gfn);
+    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
 
     if ( ext_regions->nr_banks >= ext_regions->max_banks )
         return 0;
-- 
2.49.0


