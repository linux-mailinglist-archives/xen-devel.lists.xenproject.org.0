Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59825281019
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 11:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1776.5446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHfU-0007rE-MG; Fri, 02 Oct 2020 09:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1776.5446; Fri, 02 Oct 2020 09:48:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHfU-0007qn-Is; Fri, 02 Oct 2020 09:48:00 +0000
Received: by outflank-mailman (input) for mailman id 1776;
 Fri, 02 Oct 2020 09:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
 id 1kOHfT-0007qg-04
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:47:59 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::61c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b23dea5-3134-4dde-b83f-b6fbeed984eb;
 Fri, 02 Oct 2020 09:47:57 +0000 (UTC)
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Fri, 2 Oct
 2020 09:47:54 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 09:47:54 +0000
Received: from fsr-ub1864-101.ea.freescale.net (83.217.231.2) by
 AM0PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend
 Transport; Fri, 2 Oct 2020 09:47:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
	id 1kOHfT-0007qg-04
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:47:59 +0000
X-Inumbo-ID: 5b23dea5-3134-4dde-b83f-b6fbeed984eb
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe02::61c])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5b23dea5-3134-4dde-b83f-b6fbeed984eb;
	Fri, 02 Oct 2020 09:47:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkmYYkbuM/mO7NaxIBoMoPiavl8s89qmMEvNLN1/uTGlo5/QKpf/DXXFoIC9aY6TgDx4gWK7R8FJsyYWNghynOUKizIG8KuRaLFe+ZdVCTF03SA2PLSMhKkQogHwVnc2w1rskaQIeQUbecgWdkyi12QjZETphMh5osgUJijTfigbZqH29EI5g1GVqNkiJQfkwZMuJuR+I87EjFJvYK/AaSeGZsKb8Qs0fDN1weFzXSt7NO6jpCKtjnt3pQhmZlzxtxDwBrJnbGLI8xstl+hHF8cvAFwh9FIzxEH1CbBgbYG/rruueP24eAzawWd0r8Z7Faf5dql7kZKSVVHjusDgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jsiYolmuFMXOgRZZk1T4VfnT84ijQrqqp/hl7R8W0g=;
 b=CFU36d2Cg8mczxCZGAeNtfJGnAmbx0gOGbhYdfyrqEGJ2pfDA7C9+3wOgw0ovybyMOKj05s3HaTBy6rNHzsGL3eI4JIsovejmJsytXzlIhTt6fo3U5OagX1mLvfYjmCFVG/nJHvVz6fEQBN35PisIRuX7tkG31CevFY8nUEu7E9tyGpRdu1wNLxmCDxdSaDsKFt804J4iSOYFqeXc+/NwcLcqQSmz+kmtSuJF/MSbaqeMYyEfYen9cNLrFZE41uSj5hIFwpfeG5VcIBK0pjYm2kcZeDTiYmtQHkTUQBmly3tgSwxSwreJRjmrFdjEYPmzDxdDGSy30wAiOQDXvop4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jsiYolmuFMXOgRZZk1T4VfnT84ijQrqqp/hl7R8W0g=;
 b=f/Sziavxvc2IxBJokJNNxu5Asa4stV5q5mCbkwHuHBMAOAKw07Ugo3W1KfNINsoQyHD1z16wWaiilyd+OEa2iav7G8JJWOJc3o7nfdYeA6UMngQlYG8+dQi2k/T38p3/OP1T87HGAhgf0ms1M8VIBiicZybdcsdubEvsg5neD+E=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Fri, 2 Oct
 2020 09:47:54 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 09:47:54 +0000
From: laurentiu.tudor@nxp.com
To: sstabellini@kernel.org,
	julien@xen.org,
	xen-devel@lists.xenproject.org,
	Volodymyr_Babchuk@epam.com,
	will@kernel.org
Cc: diana.craciun@nxp.com,
	anda-alexandra.dorneanu@nxp.com,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [PATCH v2] arm,smmu: match start level of page table walk with P2M
Date: Fri,  2 Oct 2020 12:47:37 +0300
Message-Id: <20201002094737.9803-1-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="us-ascii"
X-ClientProxiedBy: AM0PR10CA0014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::24) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-101.ea.freescale.net (83.217.231.2) by AM0PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend Transport; Fri, 2 Oct 2020 09:47:53 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 30971ddc-5ab7-4ff8-c4ce-08d866b83bfb
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB34212E88C02DF023B0C5841FEC310@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aHPup5Z3muGIdXdWqOFemYAUoNiRaUXD6z+kXYuk3ETs4FJsqd5Ren+QCoh3TMzl3ntzYzP8FztWUlhznYwnDFMQQdL4hSMHLM3kp/UUtSAZ6iPugs9WHUx9N1p7p6lqBdS3koGIP7E9yCdJHkz8JikhiGa3by9d9qvCOvPit3v2cFQ8BAHjBsUG4++C71P1mjndHMgkeVK0m3w3FYj9kDNHGmPre7yNu1ZeYJc8ywkxXco31vrXcqWlVrJ6Q4hR1y06VjNtgkRktWTJSeKwWsj0qL/nMYdreCVyazfjeoesKLH5K9Bw7TwPJg5eePefUFY04GgD9pEPiBj28NnLmPhENfbOFUxt3+LIg7qQ88rtoMscOlLfmcjEGXJJq/QA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(66556008)(4326008)(66476007)(8676002)(83380400001)(186003)(8936002)(5660300002)(16526019)(52116002)(1076003)(6506007)(2616005)(9686003)(6512007)(6666004)(26005)(956004)(86362001)(6486002)(478600001)(316002)(36756003)(2906002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	KG7URN31fkVctx9yNQ3F35ncsN4tMSpAYdPtt3zbiH9yvIgIjhlKB/qA6Id861cxv8BKB5UCb0GQhTvepA7b4xVjbJyte2yn9dafdAA7hRzN4lEwP54Y6kguRw4uzgQ8OnmGhFb9FvHoOoaIQjTdgmUx/Y7IvfYSY7zftS3zFuKcB10ct6lbTCcY6YIHmM+1m8STm4VJKziJUONvw1zYoTRLnWGQkYiXXTr/YNW3W/TGcIrKCNDLEwmDTH9Rqi6T7eGUr3sZpKsBgJ9Y71hscKWwx/NUe+x+TOVhBhskXskJ5QP5FsJu78M8juDbh6Vdls7AQdxDRxR4fhF5noFRR7cqWSWOjbi1q+NvL9oVOrGw+Xq4r7NdVPoVlG7FLSziXzpR7yw1hrZVQGHKwKUsU1wielTY/6lHJ70bonrPvGD+ds3c5bUg52VGJYN0s01Kp8zzPwGIsklNN+MxKyZKDYPjbY6+tGD29oqtYJ0iaRoIfdtqBhnWpu/bl9aMWWwNWAaTzZN4XtoCk5UVyLjWhSMa2XjFa1vY1DmMJNSkVg2FjGx/slj1SAIw0fe+ngMm/BAdt3Q7cHp3GumCOZFilGUgjfBOxCC+sahQD+U7C67ioIbpZLr9uoBOEcjP8Nn9c1/MDDX8qn0Sp2d7dmnUeQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30971ddc-5ab7-4ff8-c4ce-08d866b83bfb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 09:47:54.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjwkujPM+HeEkGuVi6LcBE0fuYqoPZlX0LRo9STvMhEAHfWGFLyXx/XHKlU4NVeDGrL8OC1ePc+xZegQ4M4m9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Don't hardcode the lookup start level of the page table walk to 1
and instead match the one used in P2M. This should fix scenarios
involving SMMU where the start level is different than 1.
In order for the SMMU driver to also compile on arm32 move the
P2M_ROOT_LEVEL in the p2m header file (while at it, for
consistency also P2M_ROOT_ORDER) and use the macro in the smmu
driver.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
Changes in v2:
 - made smmu driver compile on arm32

 xen/arch/arm/p2m.c                 |  7 +------
 xen/drivers/passthrough/arm/smmu.c |  2 +-
 xen/include/asm-arm/p2m.h          | 10 ++++++++++
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index ce59f2b503..bb75f12486 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -18,16 +18,10 @@
 
 #ifdef CONFIG_ARM_64
 static unsigned int __read_mostly p2m_root_order;
-static unsigned int __read_mostly p2m_root_level;
-#define P2M_ROOT_ORDER    p2m_root_order
-#define P2M_ROOT_LEVEL p2m_root_level
 static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
 /* VMID is by default 8 bit width on AArch64 */
 #define MAX_VMID       max_vmid
 #else
-/* First level P2M is always 2 consecutive pages */
-#define P2M_ROOT_LEVEL 1
-#define P2M_ROOT_ORDER    1
 /* VMID is always 8 bit width on AArch32 */
 #define MAX_VMID        MAX_VMID_8_BIT
 #endif
@@ -39,6 +33,7 @@ static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
  * restricted by external entity (e.g. IOMMU).
  */
 unsigned int __read_mostly p2m_ipa_bits = 64;
+unsigned int __read_mostly p2m_root_level;
 
 /* Helpers to lookup the properties of each level */
 static const paddr_t level_masks[] =
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 94662a8501..4ba6d3ab94 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1152,7 +1152,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
 	      (TTBCR_RGN_WBWA << TTBCR_IRGN0_SHIFT);
 
 	if (!stage1)
-		reg |= (TTBCR_SL0_LVL_1 << TTBCR_SL0_SHIFT);
+		reg |= (2 - P2M_ROOT_LEVEL) << TTBCR_SL0_SHIFT;
 
 	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBCR);
 
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index 5fdb6e8183..ab02b36a03 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -12,6 +12,16 @@
 
 /* Holds the bit size of IPAs in p2m tables.  */
 extern unsigned int p2m_ipa_bits;
+extern unsigned int p2m_root_level;
+
+#ifdef CONFIG_ARM_64
+#define P2M_ROOT_ORDER    p2m_root_order
+#define P2M_ROOT_LEVEL p2m_root_level
+#else
+/* First level P2M is always 2 consecutive pages */
+#define P2M_ROOT_ORDER    1
+#define P2M_ROOT_LEVEL 1
+#endif
 
 struct domain;
 
-- 
2.17.1


