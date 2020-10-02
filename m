Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161128109E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1855.5619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOINz-0005LZ-In; Fri, 02 Oct 2020 10:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1855.5619; Fri, 02 Oct 2020 10:33:59 +0000
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
	id 1kOINz-0005Kc-Er; Fri, 02 Oct 2020 10:33:59 +0000
Received: by outflank-mailman (input) for mailman id 1855;
 Fri, 02 Oct 2020 10:33:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
 id 1kOINx-0005Jg-Lh
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:33:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2171b041-8114-49b9-8d09-23d8c931f541;
 Fri, 02 Oct 2020 10:33:56 +0000 (UTC)
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB6992.eurprd04.prod.outlook.com (2603:10a6:803:139::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 10:33:54 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 10:33:54 +0000
Received: from fsr-ub1864-101.ea.freescale.net (83.217.231.2) by
 AM0PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:208:122::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Fri, 2 Oct 2020 10:33:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
	id 1kOINx-0005Jg-Lh
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:33:57 +0000
X-Inumbo-ID: 2171b041-8114-49b9-8d09-23d8c931f541
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.52])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2171b041-8114-49b9-8d09-23d8c931f541;
	Fri, 02 Oct 2020 10:33:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hx1FryxjXikEYLljl/xKorKEBzIt7Vt0CNmGY6ZPu60urMCTtIgGK3Rp7cIEnBzOVdUr5GNecbD+MZn+z4L52cyOlla0BTS4IM265c4BT0Pz9QxGkwMG/rD8FoSewt9wXYDDYV3Gm3YSFaakqzRwbS57qwQzUhrLZAokdQHuLDHlSH8jSVmECWBKf90MYOEFzBiIbSBaYJ8NXmZk+O6E+4nLdEnbdRDIX06oqdFffNVtZj7XDk99WRxrKQ7CoKPpkte1ldD7GEYp7XZMBO7cGMFFd10ajzayfJn8Ouu28J5cgiznouMRourYcPUWv8l+mXwlbbv4BNFkMZlyVADDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et3yJGNIONQ/i96PdAtaTJbBfeA0Mf6Odm6Mddf28Hc=;
 b=c+o5shtH1sZPV6NiIQrOaztVq9DLtJ+StnGHwdpvO+F2KzpbMZeashOvFSfa/UgAbFTcuocad/SnRsNm7Zk7I4E3hHX3oGS5koAmpb2VJ3XqHk/2mqR3OyYVbBGExBWckqK3SzbwNq/VmbGtkKYzj6kEGqaWFOPeLjeT9UakBBVC23RKG+4SSb0ER5Lkqyz7b6SNZ9ghApV9YCYZcGXJkTIpyDJG2VdAdgdgPqQIeGy2WrRt8QJuvWXfNforgn3lOKDZ23vFjUPMJmeq0+ghf+YhOeINBgsrxXFKbkcojM7nFC0j4knWEQthDY0mIb6Lw4EYVSml+aOE6WwLF8ZRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et3yJGNIONQ/i96PdAtaTJbBfeA0Mf6Odm6Mddf28Hc=;
 b=jkoXFilwMpwpqNFjnSM4Oywv/As7Vjz8C/OuwBqRiINiDRH0Go0POh3nGpX2pM2TGSPn/OKF2eWHiQXA2KSFFkJm0zFgnJWia22u34pCmEtsZOhaSmleafupUPxYYsxjm9qPjMwhDv98PtWTiYZ3pFeANqgkADv4DaKLC4+exjM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB6992.eurprd04.prod.outlook.com (2603:10a6:803:139::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 10:33:54 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 10:33:54 +0000
From: laurentiu.tudor@nxp.com
To: sstabellini@kernel.org,
	julien@xen.org,
	xen-devel@lists.xenproject.org,
	Volodymyr_Babchuk@epam.com,
	will@kernel.org
Cc: diana.craciun@nxp.com,
	anda-alexandra.dorneanu@nxp.com,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [PATCH v3] arm,smmu: match start level of page table walk with P2M
Date: Fri,  2 Oct 2020 13:33:44 +0300
Message-Id: <20201002103344.13015-1-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="us-ascii"
X-ClientProxiedBy: AM0PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:208:122::37) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-101.ea.freescale.net (83.217.231.2) by AM0PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:208:122::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 10:33:53 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 57cdb606-bb2e-4fb2-e7e2-08d866bea921
X-MS-TrafficTypeDiagnostic: VI1PR04MB6992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6992F8DEBCAC0483C3573912EC310@VI1PR04MB6992.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aGjuzOcRPkv1hyeedoIOEYhk+oDKl6UfeLKhSrA15xPGZ+fNxl4FUmmcSOZzzPeHoHW1zTv2sgk3KqN9MRyUVjKbnKpQWZOq1gBCL4x9RyL4hlpw+U553zP4v8xg8mzK/9KMRaN0Q4UE7vdX617IH5VynGvhPxQ28e11VVRrZC2ket7427byRvu6fokXSKnC0B9HvP54zNeu7g+j+MvdR6ap2HJDIGDwqvCuIh2D77FHjiPgeIXS4bKJW8N9noz7rh8+ov//dS0NLO8d2CMkn6E0UrvzIgYdxj1TtA0hSe51q5pSJzsZk62Zmzgr2AIzA0ukxUUx3yqzHzC3r5zhRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(2616005)(478600001)(4326008)(956004)(6666004)(83380400001)(86362001)(316002)(52116002)(66556008)(66946007)(6506007)(36756003)(1076003)(9686003)(186003)(6512007)(5660300002)(16526019)(6486002)(66476007)(8676002)(2906002)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	o6U+QrMq7DSy5RvfZJ5xjgmxD2pAvKN4AmYpfFe6yhLF1wHXTwPMbokyybuUNDs4VykSG9qEBHSrcucpuwVNY0ledbkf62QjRDPMB8AntxCgMpI6tgY+drR66GQKmine7wfSDUSMMzNlyOyxpd69/Qn4WWD/5n8CxVMA7FL2uDl28ahFVdfEq/NqDUUIznzgQ8JUxqq/godIntzJehEzLJq/eqYzIAYLqHesfnyTxEVi/4onQCCIrlYYcSjkGjnumSwQ5XaDIkRpClOnRkUUwhc9l/NQIPTknQxoG2YmHZskxxs6AAB1l0Lf/p+UYJ1Ata6TkwKQ7rJcX4zEL24EA1K4v2VM2e2wPZY2u3CLfgnx71IwcpDWoteecBkvFsVYbeOA2PhGUFw+VSK93uvRUc1j1a1SznniufrfK1S9h8QtIuE5BhTgbJKqQzf82pQMvaKb7NXiT5lLGvFXZnebp0I/4DiUMXB8iDB7IrME0VunsESsbxul63mF+URx/wXeUlUt8zI+LZIFTLhL635aRcUEgEXw3eWHdvCXNrIKIxLfW9wrjjVcs8feiTjPuUK46Vn8p4jutUDevMEwQS5R1jwRHoTNcH1yzM5Ancp9KkW1bdqhI/n9sTMxq/W7eJNZy1FZiDE8uvRBxb00if83+Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cdb606-bb2e-4fb2-e7e2-08d866bea921
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 10:33:54.3564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4dbFGq677PTnkKo2PESFpc2Tohk88/wEbQvA8IW9pTPe8MmvmsNocBZWUGct0SiYQy7MoB7hKCadIyqBRprcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6992

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
Changes in v3:
 - also export 'p2m_root_order'
 - moved variables in their rightful #ifdef block

Changes in v2:
 - made smmu driver compile on arm32

 xen/arch/arm/p2m.c                 |  9 ++-------
 xen/drivers/passthrough/arm/smmu.c |  2 +-
 xen/include/asm-arm/p2m.h          | 11 +++++++++++
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index ce59f2b503..4eeb867ca1 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -17,17 +17,12 @@
 #define INVALID_VMID 0 /* VMID 0 is reserved */
 
 #ifdef CONFIG_ARM_64
-static unsigned int __read_mostly p2m_root_order;
-static unsigned int __read_mostly p2m_root_level;
-#define P2M_ROOT_ORDER    p2m_root_order
-#define P2M_ROOT_LEVEL p2m_root_level
+unsigned int __read_mostly p2m_root_order;
+unsigned int __read_mostly p2m_root_level;
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
index 5fdb6e8183..28ca9a838e 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -13,6 +13,17 @@
 /* Holds the bit size of IPAs in p2m tables.  */
 extern unsigned int p2m_ipa_bits;
 
+#ifdef CONFIG_ARM_64
+extern unsigned int p2m_root_order;
+extern unsigned int p2m_root_level;
+#define P2M_ROOT_ORDER    p2m_root_order
+#define P2M_ROOT_LEVEL p2m_root_level
+#else
+/* First level P2M is always 2 consecutive pages */
+#define P2M_ROOT_ORDER    1
+#define P2M_ROOT_LEVEL 1
+#endif
+
 struct domain;
 
 extern void memory_type_changed(struct domain *);
-- 
2.17.1


