Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E578927B004
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 16:34:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMuEF-0003aP-2X; Mon, 28 Sep 2020 14:34:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0xBf=DF=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
 id 1kMtZm-0008Mt-Pa
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:52:22 +0000
X-Inumbo-ID: b393e128-7162-4ba5-b5a3-69424c0524ea
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b393e128-7162-4ba5-b5a3-69424c0524ea;
 Mon, 28 Sep 2020 13:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HD+WoFWOoIgQftR/O0jpMaa6RvBZ1xFkd1Q6ZaKKDqof3iwoRBwqrNKA/x3y0P/3oZgyiSS0TM0l9sJXU0RuuWwbiVIUcobRTwzUGwYQgHZ8kGlmEdDnizCd59ZMw3AVfIPpqZrX4MayEn8mwfHLpuRrs1rpajXwSwi8wArW/O1UTqAdfJlCtKoey5+N6Uf/sLkNkt03wdt3bUqDgsbl4cvFNC4TTPxV/CVoRrGxst3n8/1bro+eH6OwOP2L3/me4CHaScbE/1iWpIZBriWAfwrKDYJTyC9A7GQydX58NVKotODU1BzATKv1ILosAxC5dxoGeWtupVHa2ZfZnXqFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtrpiFAw8fryXVx09xzLaB7pzZ9QXT5keQDitNDChsM=;
 b=k12UOzFbYv6ZNo0f5QfLKqLO9FqLB8YpHUMFqj9o3W6f9luWgnMutLb4xenG6cb/wAeFiLW7GzL2YAwsfjd0kT/soS3TQRnbiC8CniiBqanV7eheIuN3TXdzHQ+dxGCuAevu8Hxmyy3iCx62DS7Q2kGsxmOH0+/nNhdioSf1u0w6lMQT3yxQEIwbWy2SNRadaJVHBoYGMXP5KRfRi3o8obmRYUeCSerZurokPglRR6rHKQ9Qv4gDqrUaBmxLTrcK4qssJPdGxosESBHpRzXJKTIRHtkwL5zcWrJtIKM9wE8SnBPF3i1vbNTtmnNsCmE4s9XG9Oj8nKOQ1N0BftTy/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtrpiFAw8fryXVx09xzLaB7pzZ9QXT5keQDitNDChsM=;
 b=hwlieODOhyysvzh4w4I/N8boy1TrvJMeahOOybvRFPEDFzr5IgeV6OBMDg97267wap3Eshem5eOaZAR1ffOBwDCcihIwC5LSVwMYyqtYLoy3DZvExLRuVMdWg2Pvb3/2pkjHZ/aj/8pXZoX7EcFsJXgL3DEFTSv/rtXexAOO7yM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Mon, 28 Sep
 2020 13:52:19 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 13:52:19 +0000
From: laurentiu.tudor@nxp.com
To: sstabellini@kernel.org, julien@xen.org, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com, will@kernel.org
Cc: diana.craciun@nxp.com, anda-alexandra.dorneanu@nxp.com,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [PATCH] arm,smmu: match start level of page table walk with P2M
Date: Mon, 28 Sep 2020 16:51:57 +0300
Message-Id: <20200928135157.3170-1-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="us-ascii"
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-101.ea.freescale.net (83.217.231.2) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.22 via Frontend Transport; Mon, 28 Sep 2020 13:52:17 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64d23ba9-eb35-4bee-b14d-08d863b5b733
X-MS-TrafficTypeDiagnostic: VI1PR04MB7117:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7117199A2DA109CEEFD15DB6EC350@VI1PR04MB7117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4GJn3vh3if4+fwRzNXxHBm/NyjPGq73c3pKKyZZ/rNRBcdKaCZbLG6pRIq0+zINvXxaMAuU6vYVzkIKXXtiFXSRtwYBuNZaI09Ji90b4p6a0PadOcBB9+xqdSaOA6eZ/2xZdRRo/8nrxwSluHD1Sl1nEIuelxqOxRRo5qvevGAZ7uAOxAyyyPsS9Owdvk/md1ACfeRVeUFsabomSJw1uA9jsOZuF9imOKeS2J+ipXysODbY3y2oztMnb3hYwBGzWmmvC6Bqz8QDeb+ZB2U+F+XGaDciWx5fpju9IXgpzxWAotzkxWFxqPKrh4PuiqAi5p+64RugTTRikZCGihtmPADtrzBVp6GmXs9Pvnt46YzVhOjutpoK2FiuGNVTrEmzP8Z9Fe/gCMWrZr3SG+gD9+PtRKKZdHD82tgtsjwmv/ig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3405.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(36756003)(9686003)(4326008)(6666004)(8676002)(66946007)(66556008)(66476007)(956004)(52116002)(2616005)(83380400001)(16526019)(6486002)(8936002)(1076003)(6512007)(316002)(478600001)(26005)(5660300002)(86362001)(186003)(6506007)(2906002)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: mlf1wd22nsQ6dG4PZpcN58L/0civc8+Nw4osNOkCDDfOWfdtJfGE57Eyy+zYTrWun+whMfU5fatUJOcvUUmLVtKP9JbXaQogj3OeBXrvtdeQtkRTiDJ6qKNcFJsuptz/xLlxfO/Hz4ApFS3rcITfloe9Eennfu52s6LmY3MyP+Y1kNbY/LSeafd//IJqR3s7xHWF0UJ/MkvDBysbWvbsB+rpHTnkMikSn/8OjODtqtz8O3zuQeApOJjG7pQlXVWuZpGEPQvEEWQRQdGzfsnbZADRjJWjjJwncoNSkCbdzi+11iNW802XnWoW8yRl9vewBSgJQSUob5AfZhL1xtBSVS4s49n/0EE9SyOf63hJq6BRAlCCnVeoCCh/zkejrCnRIBBaP+1OnpoPG46LTsXvMC8TVNi171pmVuOLga7kr2YG3xb+09nr8Hx0z0s2Cn/+5bFGWNJaAJL1gxDCpiswAnFfJpnXgosh6Ml/4FP0zwfINtF4QEoMETCt0dR6OuLYwBlIMJTzUu0HWDNDuUCbrb//HV65dFQ9OnYbk/VAB6iKBOPnlP6m8U8qfxm0NuEbdc+6gV85UyterVyWunJeAjX5Q+XOvkmsCvmnPJHSEeHrqXPR2GGqcCkDwrGR4iyCwZ0ZHRTqrDK1bqvSDY31ew==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d23ba9-eb35-4bee-b14d-08d863b5b733
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 13:52:18.9822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30B26wfz4EFwBad4GEJf8u1Wpn8HfuJtcct7vel8tvFR9lhO508wv1IRGSnf2r6tYYysEAfPLcUlBoWdmirWnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117
X-Mailman-Approved-At: Mon, 28 Sep 2020 14:34:09 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Don't hardcode the lookup start level of the page table walk to 1
and instead match the one used in P2M. This should fix scenarios
involving SMMU where the start level is different than 1.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 xen/arch/arm/p2m.c                 | 2 +-
 xen/drivers/passthrough/arm/smmu.c | 2 +-
 xen/include/asm-arm/p2m.h          | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index ce59f2b503..0181b09dc0 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -18,7 +18,6 @@
 
 #ifdef CONFIG_ARM_64
 static unsigned int __read_mostly p2m_root_order;
-static unsigned int __read_mostly p2m_root_level;
 #define P2M_ROOT_ORDER    p2m_root_order
 #define P2M_ROOT_LEVEL p2m_root_level
 static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
@@ -39,6 +38,7 @@ static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
  * restricted by external entity (e.g. IOMMU).
  */
 unsigned int __read_mostly p2m_ipa_bits = 64;
+unsigned int __read_mostly p2m_root_level;
 
 /* Helpers to lookup the properties of each level */
 static const paddr_t level_masks[] =
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 94662a8501..85709a136f 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1152,7 +1152,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
 	      (TTBCR_RGN_WBWA << TTBCR_IRGN0_SHIFT);
 
 	if (!stage1)
-		reg |= (TTBCR_SL0_LVL_1 << TTBCR_SL0_SHIFT);
+		reg |= (2 - p2m_root_level) << TTBCR_SL0_SHIFT;
 
 	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBCR);
 
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index 5fdb6e8183..97b5eada2b 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -12,6 +12,7 @@
 
 /* Holds the bit size of IPAs in p2m tables.  */
 extern unsigned int p2m_ipa_bits;
+extern unsigned int p2m_root_level;
 
 struct domain;
 
-- 
2.17.1


