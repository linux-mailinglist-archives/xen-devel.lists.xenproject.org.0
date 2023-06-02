Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF16720129
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 14:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543115.847784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53ax-0005Qf-5k; Fri, 02 Jun 2023 12:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543115.847784; Fri, 02 Jun 2023 12:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53ax-0005OC-2a; Fri, 02 Jun 2023 12:09:27 +0000
Received: by outflank-mailman (input) for mailman id 543115;
 Fri, 02 Jun 2023 12:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jAO=BW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q53av-0003vL-9o
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 12:09:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fb464ad-013e-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 14:09:23 +0200 (CEST)
Received: from BN0PR04CA0043.namprd04.prod.outlook.com (2603:10b6:408:e8::18)
 by CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 12:09:19 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::40) by BN0PR04CA0043.outlook.office365.com
 (2603:10b6:408:e8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26 via Frontend
 Transport; Fri, 2 Jun 2023 12:09:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.26 via Frontend Transport; Fri, 2 Jun 2023 12:09:19 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 07:09:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 05:09:16 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 2 Jun 2023 07:09:14 -0500
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
X-Inumbo-ID: 4fb464ad-013e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVO5ROO0VnlSEa6RRklkmrEe0SDfW6mb/K/rMgySPtDCuxxHQUnZ6tw589SgxoRjREtUbYJQVl30OyPJLwDcvlBwVuEH7DI01n7w2Y20f97VpoBUJGlHGKKEV1vi1//RLtKrF8rjlayaf8b1/Lz2f5BjKUCs9+WjyiTQuzaxascFKQEFtgKUUkIET08I52oNA0a1/nEsUmqeDaceHKIzriOXUmFYYyEU5JbHn6bE9PYAiuUfz9i2Z7LGmUyCDnG9CTn6GGUr/LnfYHVcs8xp/kX9Con7JtKXyjbQ7gUSwFWd0EzDV3GxdkzDqZyZrh8i1EZK8bQ1rPu4C+6DDZ0bbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbSN1KzrxBtfNg1T90LwzY0QnI8vFdlODMDMDj2PcY8=;
 b=WGt7wzUN5WxpNuAzrXCEaeiDrEX0croZGmPYfgFrXZoOCueIfF4hTnt/Ci5GbPPydKpQx4i3s5E8nsjiYwS1Cr0cQPA/WDr83DllHHl9ggWMvttsHYVLS3OgFdOvYvZ0cPCZ1u1y6lcnzbZNSHaEMsoTs8aOITu4XAVrneIijePEJjqmSBD6bqTabpC4vTvcSJ3zBacU06RQMq4EdqKpqN2/PHO6xNNl+HjHA5EaTEUCF5IPcJnctmHjTg0NiueIeidyeIz7KtG6GM7IM28vBZxG4Ipwstn43sd2GiQrLPNgon2cj86AglzAQe7oMDDCz8hDCCsmN4LZbKimB/0/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbSN1KzrxBtfNg1T90LwzY0QnI8vFdlODMDMDj2PcY8=;
 b=d9wcxHJUksLlMQzuYnqcQXPVolGpus+6jPoPF4SKH+txC9W1FHafF9IpCcCVHZutZM0kpTAEuNU2TPiV5kEMO3mQ0Rzkv5GmuL8AF4sSCat057aNl1FZKsgFAIcyBKLSOZPmCUfai40cKfCbFSqF5gBfeO5Amam1CKav9xWhtQU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v8 3/5] xen/arm: guest_walk: LPAE specific bits should be enclosed within "ifndef CONFIG_PHYS_ADDR_T_32"
Date: Fri, 2 Jun 2023 13:07:52 +0100
Message-ID: <20230602120754.23817-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT013:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 7664218c-6fcd-4154-c92d-08db63623199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gR/sFpaMzdy2d/TlzBhEiMTbs7whgyxw4fKEGbaDjsx61T2ba58+JSss7iCaaYn3nNxcm8NrLmtCvVG40g7HqRGHncTV3eTlARuTD7AFa8Y/pKwBhzoDy2Bgknfki5K6tUz/QIVt6zeRjhThOkoLFrysYSviYJKx8wMnpSN3WSswprv4tYCjWr+HS9kvZgkmgVRmqpvNsLiBrY2QA+S6zqX4vRq0L+BhZ7PljlyObwXGpTqNGixVlFVAYoNbSAVG1k8VRWJNURouk2MDodHEjYoIPJDfxzMjiHRieoA5KsNaliMSNduqFp5dmywMf+WHyv+a6bRaju+nfhJ0Rp3tK+btPueh3dXRoy0rJh5QP+drcsVNceY9fe2+e/MaijMeL2NZZ+hF5COHQ+6ABYsDrb6ni1goOZGydM9xDBNGp0mXgVl3Q1mELRSrqyTfJtT87vECe7ym0lh6+8n9G4b9E4GNgpZn+MGbMRLilRvXtpHsdanA9b6kWAf+J1USnceE0EIZ3Kn+71RnaL1/aR5HjpQvRcI6VN1dXO5NO5K+db782HFBqOoXSv3cGS/AIh8EIbZhevyTNnLc+i1HHDch36EOzIn1mFtPTtdMT6YxDiD/On3UkOVCE8OznD2ucdFEcneESzfiDPrTjHE2kDvOJB9GZPqy696Z0nRmpW8xoTj3ARopwu9/+47YaOZtngJvL3ClfaQ0OLncOY9SQzT0OcB6JgsLgQj01aNqJeEwUgaNqq3N00Wmt0gIqQrySpGwtVzAofW6yANoYFy7AnCq7g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(426003)(336012)(83380400001)(2616005)(47076005)(186003)(2906002)(36860700001)(4326008)(6916009)(70586007)(316002)(6666004)(478600001)(8936002)(54906003)(70206006)(5660300002)(1076003)(26005)(8676002)(7416002)(40480700001)(41300700001)(356005)(82740400003)(36756003)(103116003)(82310400005)(86362001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 12:09:19.2695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7664218c-6fcd-4154-c92d-08db63623199
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665

As the previous patch introduces CONFIG_PHYS_ADDR_T_32 to support 32 bit
physical addresses, the code specific to "Large Physical Address Extension"
(ie LPAE) should be enclosed within "ifndef CONFIG_PHYS_ADDR_T_32".

Refer xen/arch/arm/include/asm/short-desc.h, "short_desc_l1_supersec_t"
unsigned int extbase1:4;    /* Extended base address, PA[35:32] */
unsigned int extbase2:4;    /* Extended base address, PA[39:36] */

Thus, extbase1 and extbase2 are not valid when 32 bit physical addresses
are supported.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from -
v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".

v2 - 1. Reordered this patch so that it appears after CONFIG_ARM_PA_32 is
introduced (in 6/9).

v3 - 1. Updated the commit message.
2. Added Ack.

v4 - 1. No changes.

v5 - 1. No changes.

v6 - 1. No changes.

v7 - 1. No changes.

 xen/arch/arm/guest_walk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 43d3215304..c80a0ce55b 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -154,8 +154,10 @@ static bool guest_walk_sd(const struct vcpu *v,
             mask = (1ULL << L1DESC_SUPERSECTION_SHIFT) - 1;
             *ipa = gva & mask;
             *ipa |= (paddr_t)(pte.supersec.base) << L1DESC_SUPERSECTION_SHIFT;
+#ifndef CONFIG_PHYS_ADDR_T_32
             *ipa |= (paddr_t)(pte.supersec.extbase1) << L1DESC_SUPERSECTION_EXT_BASE1_SHIFT;
             *ipa |= (paddr_t)(pte.supersec.extbase2) << L1DESC_SUPERSECTION_EXT_BASE2_SHIFT;
+#endif /* CONFIG_PHYS_ADDR_T_32 */
         }
 
         /* Set permissions so that the caller can check the flags by herself. */
-- 
2.17.1


