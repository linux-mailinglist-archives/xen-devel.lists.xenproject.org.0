Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFA372F984
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548631.856651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9N0t-0005HN-2z; Wed, 14 Jun 2023 09:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548631.856651; Wed, 14 Jun 2023 09:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9N0s-0005FR-VL; Wed, 14 Jun 2023 09:42:02 +0000
Received: by outflank-mailman (input) for mailman id 548631;
 Wed, 14 Jun 2023 09:42:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nJe=CC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q9N0r-0005FL-Qm
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:42:01 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b55d72bc-0a97-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 11:42:00 +0200 (CEST)
Received: from BN8PR03CA0020.namprd03.prod.outlook.com (2603:10b6:408:94::33)
 by IA1PR12MB8238.namprd12.prod.outlook.com (2603:10b6:208:3f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 09:41:55 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::f9) by BN8PR03CA0020.outlook.office365.com
 (2603:10b6:408:94::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37 via Frontend
 Transport; Wed, 14 Jun 2023 09:41:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.25 via Frontend Transport; Wed, 14 Jun 2023 09:41:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 04:41:53 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Wed, 14 Jun 2023 04:41:52 -0500
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
X-Inumbo-ID: b55d72bc-0a97-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilboJ2YFvkF02hZHtohrwZ3K+7tD645Fwt5H5ifJmA/91Sa1+DjlXG8K68eRQy7e24IYXNNTHXO9dE5AnbDWRu7XHywXgzjnKh0owJfNXRo3f3IPxuBEXzmYT8gDiADlyHlyFegzr2hteNkokxGtWbd/DaGgIeCWyN6M9Tf+Q8mOBr+5d9o8hhEENifneYN5H7M+A1YIe5hpSdKqX0Yl3k4Iq64GdeD/gklBLsrpFzG/2JD+hz6H/E/LJUX6meE+07zguqjaJQg0L+ukoxDe4OZ3WHLMFb5srGJLgPJEyexNUKdPnuXtPdC1Kq3FB30UP5GC3myc0HWm3SCHTOZDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Crafoo9/Nm8L4EYypZqARlLJBQsdUK+S4879SL0mCl4=;
 b=ogp5EAUNF5Bd9nqB0nMjQz+UNX/N20hLahiFu3fDR+G0v3uoht9LbZgJd9l+aMHFofb+maYJ6pjpFzuw5gmUAQp4FQo3wV5FgmdhMW0iyDOrjdsH8HeAd8puVJsycOLUEpOvPAB3EkTTE8EbLUy76Pjpa0VavfICwjXDnx7Owe5i+l6kwp1fSA5BMf8Ej1ZaToE9H37mrZtmBVuomXECZjY/IZn+azOCQL3RUKVaUxuRHhKJjeKqpP1TtxpG2ySmThOppHkeTghLQyBOyif2L3w3mwUpSg3nmvIIiH++Et+pU83fmvEPYSOE+phctnGFQO9dLK9Ru4PuPx3eC6fzfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Crafoo9/Nm8L4EYypZqARlLJBQsdUK+S4879SL0mCl4=;
 b=w8Alfb5dObF5LqeHFJzNjTHwAEYOCSl7DB8tOaeY5D9TJ5eaBgSPGsowuEgZqEJUHivQhGhjn2nd9OCr39tlGVm6v9TqBH1PrPb+ze4vY4ewYXmH1QvGLKhWxHDj65XqbgDIFnmI4giwpwVuEc1ZWlCoS1SM9l9TQNBU1R2ZYRg=
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
Subject: [PATCH] xen/arm: Remove stray semicolon at VREG_REG_HELPERS/TLB_HELPER* callers
Date: Wed, 14 Jun 2023 11:41:44 +0200
Message-ID: <20230614094144.9533-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT047:EE_|IA1PR12MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: fede023e-63ac-4851-3bd9-08db6cbb9735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B6H5y5RmNpqTTe06B2zF9I+RUvLJzj+ZE3m7kiCRXoz5L0nheJnF0uLbIQmVPBP1aJxOEnzIKXgj/4qeu+terq3K59UIiDOz+PqARCIcnY5VBQyS/1VSF6rAFuKI+NjVKTU0qEoVpGflOpLUCkN38+I64d9VuZ+wHcEB31zjdrOyPZVBUNxaOUKHTsVH3tVCqBW8T+h8DX/AF08bbqyrjSYITQC2UUGiqTchhBnEA2tIWhG7aUIXADwPrp6QDOZxX9nlqlGyV6lyrusSTeR1HZMObA0Lt8hvhtpvQL3MlyZdOffZnTiNCPUTFwV7EfkFhUDSlfZXPPxpXNlsscVbwI1uQY4+Ut2eWtDaaevuAYIyWTES8a62xTAQSvpkrj6VXsnqmI1XWcXGOmyUTMHTpi/zJMyLoRn48VAN8hk+7d4IE5WbGGRvSqqvgnuLokVUk2yheCQdSpMFtdQ1ZTNlOosJyex6+mFKdSbGo2MzdZEwmpTz8wdedoTYt/MCJHdheOJNdLJdE9j0pwx6UEfsPckEhIBUS/U8dZspJ3pCrVZhHK3nbKoDHhFSAVNbBMT96chp6tReCD+GmEILrHc9Qc5XfJZA73PzggI1/Lo6fXJYUVM6Y5/3Y9eYaapHB+V1bGtKbENeEifscbWOm1DqROXw0oodvQMQKQ6HoZjOVT3mbHEoa2etEejg/TBXklu6pA9hCzbuPR/1oaPUY3cNY0e10g8CrMiTgkor9HFAT3jtL2TTxLpFfhd+cbiPKSCmGgGujOEaKdbEW2wpQupzsBB0pwz+NG3Z2NohPRMqdTA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(36840700001)(40470700004)(46966006)(41300700001)(40460700003)(8936002)(8676002)(6666004)(82310400005)(478600001)(82740400003)(81166007)(356005)(2616005)(83380400001)(426003)(336012)(26005)(186003)(1076003)(36860700001)(966005)(47076005)(54906003)(86362001)(36756003)(316002)(40480700001)(4326008)(6916009)(70206006)(70586007)(44832011)(5660300002)(2906002)(36900700001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 09:41:55.4120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fede023e-63ac-4851-3bd9-08db6cbb9735
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8238

This is inconsistent with the rest of the code where macros are used
to define functions, as it results in an empty declaration (i.e.
semicolon with nothing before it) after function definition. This is also
not allowed by C99.

Take the opportunity to undefine TLB_HELPER* macros after last use.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Discussion:
https://lore.kernel.org/xen-devel/17C59D5C-795E-4591-A7C9-A4C5179BF373@arm.com/

Other empty declarations appear at callers of TYPE_SAFE and Linux module
macros like EXPORT_SYMBOL for which we need some sort of agreement.
---
 xen/arch/arm/include/asm/arm32/flushtlb.h | 12 +++++++-----
 xen/arch/arm/include/asm/arm64/flushtlb.h | 17 ++++++++++-------
 xen/arch/arm/include/asm/vreg.h           |  4 ++--
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 7ae6a12f8155..22ee3b317b4d 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -29,19 +29,21 @@ static inline void name(void)       \
 }
 
 /* Flush local TLBs, current VMID only */
-TLB_HELPER(flush_guest_tlb_local, TLBIALL, nsh);
+TLB_HELPER(flush_guest_tlb_local, TLBIALL, nsh)
 
 /* Flush inner shareable TLBs, current VMID only */
-TLB_HELPER(flush_guest_tlb, TLBIALLIS, ish);
+TLB_HELPER(flush_guest_tlb, TLBIALLIS, ish)
 
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
-TLB_HELPER(flush_all_guests_tlb_local, TLBIALLNSNH, nsh);
+TLB_HELPER(flush_all_guests_tlb_local, TLBIALLNSNH, nsh)
 
 /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
-TLB_HELPER(flush_all_guests_tlb, TLBIALLNSNHIS, ish);
+TLB_HELPER(flush_all_guests_tlb, TLBIALLNSNHIS, ish)
 
 /* Flush all hypervisor mappings from the TLB of the local processor. */
-TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh);
+TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh)
+
+#undef TLB_HELPER
 
 /* Flush TLB of local processor for address va. */
 static inline void __flush_xen_tlb_one_local(vaddr_t va)
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 3a9092b814a9..56c6fc763b56 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -67,25 +67,28 @@ static inline void name(vaddr_t va)              \
 }
 
 /* Flush local TLBs, current VMID only. */
-TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh);
+TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh)
 
 /* Flush innershareable TLBs, current VMID only */
-TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish);
+TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish)
 
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
-TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh);
+TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh)
 
 /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
-TLB_HELPER(flush_all_guests_tlb, alle1is, ish);
+TLB_HELPER(flush_all_guests_tlb, alle1is, ish)
 
 /* Flush all hypervisor mappings from the TLB of the local processor. */
-TLB_HELPER(flush_xen_tlb_local, alle2, nsh);
+TLB_HELPER(flush_xen_tlb_local, alle2, nsh)
 
 /* Flush TLB of local processor for address va. */
-TLB_HELPER_VA(__flush_xen_tlb_one_local, vae2);
+TLB_HELPER_VA(__flush_xen_tlb_one_local, vae2)
 
 /* Flush TLB of all processors in the inner-shareable domain for address va. */
-TLB_HELPER_VA(__flush_xen_tlb_one, vae2is);
+TLB_HELPER_VA(__flush_xen_tlb_one, vae2is)
+
+#undef TLB_HELPER
+#undef TLB_HELPER_VA
 
 #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
 /*
diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
index d92450017bc4..bf945eebbde4 100644
--- a/xen/arch/arm/include/asm/vreg.h
+++ b/xen/arch/arm/include/asm/vreg.h
@@ -140,8 +140,8 @@ static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
     *reg &= ~(((uint##sz##_t)bits & mask) << shift);                    \
 }
 
-VREG_REG_HELPERS(64, 0x7);
-VREG_REG_HELPERS(32, 0x3);
+VREG_REG_HELPERS(64, 0x7)
+VREG_REG_HELPERS(32, 0x3)
 
 #undef VREG_REG_HELPERS
 

base-commit: 2f69ef96801f0d2b9646abf6396e60f99c56e3a0
-- 
2.25.1


