Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6488C5814
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721588.1125144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tFH-0006Se-0y; Tue, 14 May 2024 14:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721588.1125144; Tue, 14 May 2024 14:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tFG-0006Qr-Tb; Tue, 14 May 2024 14:35:10 +0000
Received: by outflank-mailman (input) for mailman id 721588;
 Tue, 14 May 2024 14:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loUn=MR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s6tFF-0004xK-Pe
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:35:09 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 295e54c2-11ff-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 16:35:09 +0200 (CEST)
Received: from DM6PR06CA0074.namprd06.prod.outlook.com (2603:10b6:5:336::7) by
 CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.52; Tue, 14 May 2024 14:35:04 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::3c) by DM6PR06CA0074.outlook.office365.com
 (2603:10b6:5:336::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 14 May 2024 14:35:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 14:35:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 09:35:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 09:35:03 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 09:34:56 -0500
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
X-Inumbo-ID: 295e54c2-11ff-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcftE2FfCPHS65k20P2jyZcy626YJ3HQ3xqs0aSFk9K9qBttw7Y0pKxHVyGfP1uCaZYF6rdbg9JE+PHPSCfn17e0kRTBy/rUbIJTWboGcSG7yMEJ7A+XxbVZqZkxDy9Og5DqzHwm198fxDEpx2tVgF2x8YZOLG9VXm/sDKr2ZSzDmw1oiH9WXk3Tw0Aupm5xaVbJPwi5g5Om/XejX4G2x1GY4ND82YO2yrTeymkgDoDzFc6CNd1p2ZGhfo0kmWRKqfaPG7ykSD7+WsS0WMhXz6SB8CfovpJ6FuqX1xGlQhyw7I0/pCLDYDg3vjBobUIfDQ6vZ/if1y+4TBUnrr65mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSDIS7u8FBArnwQtMGorD6BVCk5kKDuvtvaxFhhABr0=;
 b=kUGTCcx+SNxWuYZ4AKNqHLogxzCOGNc0KD0WltYihxdUzkLF0kNxPgHQEHNYuePI5C9l1H5PlF+McPBHTIR3xYzXjARpavkhDtrw1Y/tDoyCmvmdbMtJigo7QkYGlyIHhq0/m8NIoW6peRzr5XHkK24YFMiC37baVLV++tJvpl1/4u25NuGFuJX5fR1rNXUfskRjQZeQ/0sjF1T8blC8K8wkRHjvVR3OXG7afSakmkirpPzUvAyz71eLhQFefB/hBCtuvH1qMEjHdRlzYMNGFCLL2WxyheDUzZfRdoU5YA0F9REPC3M8UIj5ok3dCag2M58GJn5GqMvCK235RehJWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSDIS7u8FBArnwQtMGorD6BVCk5kKDuvtvaxFhhABr0=;
 b=chB9KdJWptuT+nuuJb1FQmOKU/98g3cPsIAfwqYSJcJvJW3gmkq3YjucMELJsyg9TJJ6gew9wjxILp2pliuLOYXOwMyLxTKk0u1rehgjrEJsBtIDfgySn+LM3OSxjfYISfAiDTtKLlzbup+HaXjRAZDbH/BX9DHMnk2hBt4/UXA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v14 4/5] xen/arm: account IO handlers for emulated PCI MSI-X
Date: Tue, 14 May 2024 10:33:56 -0400
Message-ID: <20240514143400.152280-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240514143400.152280-1-stewart.hildebrand@amd.com>
References: <20240514143400.152280-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 054dbf8b-0e00-4edc-a5e0-08dc74230b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lqUVDnFTdJhmX13chB8ahkNu+P3fLDVWZ3mcOm7ftOGSTPQ8BgJXUJd/G8+8?=
 =?us-ascii?Q?/+tsUSTJJVtiQpfURGSMaN2Tg0HfxyQO8SDPSmNZoI62djYolbftaz8TTKXM?=
 =?us-ascii?Q?qvIOXZ3ADZaPjBCukC6exT9YHxxwNQRPmGHWhnYtlFwyWNYCGFR9zoeO+Q7a?=
 =?us-ascii?Q?6qgflUzj0bcgROQjNU4+bAC/rsADv1qHTMIiDblMRmF9M56h50nICIzFZsdY?=
 =?us-ascii?Q?GsooMFaaY7dK5UNVlXNMGSJPtjRKcxEOho9YiUNQHHgkkv7Hk1eS3+SZaIjS?=
 =?us-ascii?Q?ov+Bgd7zMozN+qAR10Lr+r4g/Nh3tPJf/eR3hWLFrLoaVKIVVEZjjdxbEuhL?=
 =?us-ascii?Q?ER1Mpdsxz3XSs2aV5HWyY7pO/QdmjNwVfIj5X57dcfPpEdzY7wg9p58U33SS?=
 =?us-ascii?Q?8fSK8Ct6XnRv2Ii5N8zB4E41eoNKDUucH9bImNJwuhgMKY+LakowOciFZBig?=
 =?us-ascii?Q?9jprNAQPZFpbgpcOlxC6yIOLlUUu+6xmrUhZcGRjv8yH3rjCLebNEEV7S3mc?=
 =?us-ascii?Q?Tw+dG/RWCH8Q138w5jdAyGDOaCMbRjl6QmEv2lJoXWWVc1AdsF+HsrNpN4qA?=
 =?us-ascii?Q?59ixPbjaNrEVAZoblqd4N+wNqbTku1Rgh9K4TkzhtMhjUmL6Dp2kgV/bf9nW?=
 =?us-ascii?Q?rXn4a/ggVgHu3W/+yfkP1dzTjsiqc94akNK32DWCSvQT0UD9alpxtKGdfbj/?=
 =?us-ascii?Q?8re3dmp+YHRGDJnO1p24WDINEMD7duEf3JIjsqfWGbMZrMLX0Rm5B7i5Wcbs?=
 =?us-ascii?Q?pqHW8kP2ya7L2s+YZ1DJWsTJyFXMluS66VJDANg/UifPVY7Vp5s/gktEpMlP?=
 =?us-ascii?Q?/XL8XhnULgIeU2Qg5Rv6yPlcScCS/umth/qAC+2YRUkmFKfZdPR4geu+IQnI?=
 =?us-ascii?Q?7xl762tB6X0DqlI/FEfSZGLaUGp/hrHH1pLNBiEW5nrTaBKwQnU2aoa7Iybp?=
 =?us-ascii?Q?7k4jt0i6rIUg4KU50vwMvGYJ9xxr9G6o6x9bhaq0kNwcnDCMPyVLwHi+zh+E?=
 =?us-ascii?Q?444RAosHkAGdQOJJeYp/im9olnbTwNficeWf/0UxG8MAy8IjAox6YP1jM31z?=
 =?us-ascii?Q?IZeLBCLhUcID1tdEwHLSpfICisPg/MbPYTu6fX+wAtBuoA+nkjHxrYyTw9Ek?=
 =?us-ascii?Q?/eU3HR0bvcv3CRIuANTXlldemxRZCcNPxBDCnWfVrdrWWtdnYyBxb1yECd9b?=
 =?us-ascii?Q?T4ZJ4HslTuw6/NVc9SJKa596T7i3Yon8mNahrlFcdvzq15COsslCoOglTjZR?=
 =?us-ascii?Q?/rmGKX8Rsq6gSYMFNT4nAgHsV3h28Z1druvxPRoW85uFi/4GXRvwFd+wD5Pb?=
 =?us-ascii?Q?NY1TUhrLWa2LeKbD4YMI3FErgl86i/0+DsU1fbQIOHbG9deYkUWFtSuj1l+4?=
 =?us-ascii?Q?9+74Jf0Pkr/oshYy7IrKnx93J+PT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 14:35:04.0384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 054dbf8b-0e00-4edc-a5e0-08dc74230b3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
MSI-X registers we need to explicitly tell that we have additional IO
handlers, so those are accounted.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This actually moved here from the part 2 of the prep work for PCI
passthrough on Arm as it seems to be the proper place for it.

Since v5:
- optimize with IS_ENABLED(CONFIG_HAS_PCI_MSI) since VPCI_MAX_VIRT_DEV is
  defined unconditionally
New in v5
---
 xen/arch/arm/vpci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 7a6a0017d132..348ba0fbc860 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -130,6 +130,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
 
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
 
@@ -150,7 +152,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
      * For guests each host bridge requires one region to cover the
      * configuration space. At the moment, we only expose a single host bridge.
      */
-    return 1;
+    count = 1;
+
+    /*
+     * There's a single MSI-X MMIO handler that deals with both PBA
+     * and MSI-X tables per each PCI device being passed through.
+     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
+     */
+    if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        count += VPCI_MAX_VIRT_DEV;
+
+    return count;
 }
 
 /*
-- 
2.43.2


