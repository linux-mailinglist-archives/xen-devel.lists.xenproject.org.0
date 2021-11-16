Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D017D452B04
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 07:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226093.390679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1d-0006K2-Jd; Tue, 16 Nov 2021 06:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226093.390679; Tue, 16 Nov 2021 06:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1d-0006Ey-DO; Tue, 16 Nov 2021 06:33:01 +0000
Received: by outflank-mailman (input) for mailman id 226093;
 Tue, 16 Nov 2021 06:32:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dk95=QD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mms1b-0001yg-Lw
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 06:32:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 098b26ab-46a7-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 07:32:57 +0100 (CET)
Received: from AM5PR0502CA0013.eurprd05.prod.outlook.com
 (2603:10a6:203:91::23) by PAXPR08MB7367.eurprd08.prod.outlook.com
 (2603:10a6:102:229::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 06:32:53 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::c7) by AM5PR0502CA0013.outlook.office365.com
 (2603:10a6:203:91::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:52 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110");
 Tue, 16 Nov 2021 06:32:51 +0000
Received: from d653011d021c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B96E7655-4492-4119-8BA8-FBA8819B07D6.1; 
 Tue, 16 Nov 2021 06:32:45 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d653011d021c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 06:32:45 +0000
Received: from AM5PR0101CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::42) by VI1PR08MB3661.eurprd08.prod.outlook.com
 (2603:10a6:803:79::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 06:32:42 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::f9) by AM5PR0101CA0029.outlook.office365.com
 (2603:10a6:206:16::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:42 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:42 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 06:32:27 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:25 +0000
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
X-Inumbo-ID: 098b26ab-46a7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRxZTJNNAqW5OBOnoR1AuMPnoAwFgFXtUolX3JoNjy8=;
 b=e9DuDf2aIvhgmmjfmG06VAwvTusD/mME3+n8mSXAuuLYpJEJQx4IYHxRuYEBF+rNqjaq5oIpXNkvgfeuqptdC0fxMC2h44yQl8j4zLSamm1ZkYO0kiXeATG0po5w4nJlNoUIvIw8mbckn4YoI7YGhKm8v63QaUo63hdi4ihrhW4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 986fbe51ccfa8879
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2CSDQINA+Bw1tlDDas4I7+8Ivoq0jU0ez2btLBFUtZXiZhDg9qpAZhv/PdRMFPFXmSfYLgjeGwk2ihQEEIDpUg73eJv1XVAwV9zsPmQhwrmT/PCdhOZwW1VeXyCcMmBbYb1kXj4gorKqOTXBfdMuEYIXDcuTXSFXLsYF7rJLSVW/hWuSLp/p75PG2IOsFd9fD1635az4IsigsGmBUXaykz5qSyHPiqW6BDm1HtoI6ohKxMifw8FIGFpIftGZxSpjUUMBdA9XgRk/qbQhdtrJKxZIDIO2IOF/8rnbnuuUQT1qt0FXNDOU6i4MLHJ59wWlgd5g/GlWKkKbQojeDs9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRxZTJNNAqW5OBOnoR1AuMPnoAwFgFXtUolX3JoNjy8=;
 b=NyBmeJ1TaY3kExXJHEamJd86fxT+1RJyq5XFTJzC7/g9NNpZw5RBcewP3Y3X9Ba2WSlrLLgj2pP+S/1qDVJaS3Dk8eJCzT7wK7iUuK8pEIGms7snSee4/5HsZNHfD/Nv3ASwUpN11e6Ma/jtZ5OiRKj/6qpBOTnxPUKTsDOTdyetLLlVDOiEa12iQHKAwWGDGi1daYpLuILDru3JswcYGtgvOTAxNgRjMOmdoyQhNpl9YSTXGOka6BZ2b7wBUyK/HPlOKl3KZ3PwU3om9ICWPKhezs4UczUasN06TmbbcZ9HzDPXcUcdNlgdtLrWBDsqBgognV70i1+5GeEMu7kyFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRxZTJNNAqW5OBOnoR1AuMPnoAwFgFXtUolX3JoNjy8=;
 b=e9DuDf2aIvhgmmjfmG06VAwvTusD/mME3+n8mSXAuuLYpJEJQx4IYHxRuYEBF+rNqjaq5oIpXNkvgfeuqptdC0fxMC2h44yQl8j4zLSamm1ZkYO0kiXeATG0po5w4nJlNoUIvIw8mbckn4YoI7YGhKm8v63QaUo63hdi4ihrhW4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v3 09/10] xen/arm: if direct-map domain use native UART address and IRQ number for vPL011
Date: Tue, 16 Nov 2021 06:31:54 +0000
Message-ID: <20211116063155.901183-10-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
References: <20211116063155.901183-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f44fcb65-c6bd-482f-cc4c-08d9a8caeabd
X-MS-TrafficTypeDiagnostic: VI1PR08MB3661:|PAXPR08MB7367:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB736749730C031C6A42D96239F7999@PAXPR08MB7367.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 600cfyFuATTHHTloJIjnnfdyCiBPSEuhLqnEFO1AvfDivZq54/E4AV3oXX1xMpe8PNkFPzNjiwROC+9M+mvCrQw+9l4fHJmeQe9/wJISPiIfMlk0qVgT3c8BySxx35rlYpjtX0UBKlSLYIXkBCWzuPqx6nojpwOPqO3bmfzIn0QZWtLO/SxCHaUpWA/vQ4eX4xS6TRuZXkpL1aXBoEJyoTgbAr8AYsOyyWQguvISap2zhzL6zkhDOQfcjycFJ0xyOev6i90TvtZAEXRmKEpsIVRfMnR9MrF+Z0W3l1AthoBQWzp5wR9oVpqI/4GLcvMdINzfX7MPPp42iuj4TrUrj5bYfJ+jPlM/v+XwclcKDPUkrClTfWRcu4FiNna0aPVpkZ5Orn/pnUmVOv0Rdq6MI8lPRncMKchcHFpzdvVakJQgo5Mv9PMMZi378FxYOrIG96gVL5qShfTWj3ecnAcnYfHYLTgzPyqdebn93EIlQ64QTSifMgJlqFS48ShzutNDsqZsh1NJqARQxMTXIKpG7K2jBNHjjnp0AqBHNHZ6LgxpohLho+n0K7NEAW3RQZoSxLPonHk/+SJrJMhceriUR2+SohJaJ9jePdbHbovkCmfWMwaY5oF55eB8Iz81Wy6f2bcagpn7XsemKffHVInprnm4puMehefrndce52OxWLRqnKAAamSrQUg+KgPAzE5DIy2K40YKbVM6vzTUAe7/YkA+56vpiXnX1XkTRApEMMQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(8936002)(47076005)(1076003)(70586007)(2906002)(36756003)(82310400003)(54906003)(356005)(2616005)(44832011)(7696005)(426003)(86362001)(508600001)(26005)(8676002)(5660300002)(336012)(6666004)(316002)(4326008)(186003)(36860700001)(83380400001)(70206006)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3661
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1fc28c6-384d-4796-2047-08d9a8cae4bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yZLkr4ZJiSEacC/uxDYHQ89P9E64+zNEYmF+EEdtWixN64Gw/V2c+QrcygAmCuI98tAs9oHA4xw7VlxP8YJLytQYNsGHuhDGlyY9zNbz18+gCuifd9OHRpt414fx/q8bBw7i5qUr2t3WqvRkSl2UoSHt/Tj65zTKzwh/U2foQwEBnqP+YPeyE0bUjCySWQ393pb2B/hiW5/rFf55Te2ZmZkw2Z1FYb5+H9ShxKvqeG3Rs00fTdu7miiQoiPbX6TO16x7TWKj3XdDtpdW6NcaHbZjbOHcG7Q3gEPRlpeU+5bZu2gDnWr7uuEy2IyR2OGD3XlPXWIdQAGoWYPkHdM2JMljNm81uySIxSwFFPfQ87kL3A+b4gLePMIpTFlC8o6khtkoo+o1hEl/pgtJwF6rXVSGDusKbP1resSa48CSoq6NKNx9sBkg4x6q8OTVmbSLgfI4cEOOvVXCW64NnhNvTVPOfGQgzHGEl5ud82nIUoxs+BRQzLXSED99peXtjakOHuJmxEvPPggMKunEpzfTQnGdyiOLu9rhvDc2s+SwkCAVlFnKDMuF8wChBOGQwAFtnR9lgY7aDkUCMvEIdF5b+uoK8oE4EnXih6BNeAIXZroW0Rom0YkJHP0ExNj9XpG0rrXYdLU0X0CeNfJxhx1niqmpByWbBqngQliyJUepYmgvp9CqeHq5RYlCUzBmrbCGEy+gVI/h+RDQHZ25qXjbjg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(36756003)(2906002)(1076003)(70206006)(70586007)(36860700001)(26005)(336012)(5660300002)(7696005)(4326008)(426003)(83380400001)(110136005)(8676002)(316002)(82310400003)(54906003)(6666004)(2616005)(47076005)(508600001)(8936002)(44832011)(86362001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:32:52.4053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f44fcb65-c6bd-482f-cc4c-08d9a8caeabd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7367

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

We always use a fix address to map the vPL011 to domains. The address
could be a problem for direct-map domains.

So, for domains that are directly mapped, reuse the address of the
physical UART on the platform to avoid potential clashes.

Do the same for the virtual IRQ number: instead of always using
GUEST_VPL011_SPI, try to reuse the physical SPI number if possible.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
v2 changes:
- explain why vpl011 initialization before creating its device tree node
- error out if the domain is direct-mapped and the IRQ is not found
- harden the code and add a check/comment when the hardware UART region
is smaller than GUEST_VPL011_SIZE.
---
v3 changes:
- explain how the '27' was found for 'buf'
- fix checking before dereferencing
- refine comment message
---
 xen/arch/arm/domain_build.c  | 42 ++++++++++++++++++++-----
 xen/arch/arm/vpl011.c        | 60 +++++++++++++++++++++++++++++++-----
 xen/include/asm-arm/vpl011.h |  2 ++
 3 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 61fd374c5d..871c7114ae 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -30,6 +30,7 @@
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
+#include <xen/serial.h>
 
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
@@ -2376,8 +2377,12 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     gic_interrupt_t intr;
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
+    char buf[27];
 
-    res = fdt_begin_node(fdt, "sbsa-uart@"__stringify(GUEST_PL011_BASE));
+    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2387,14 +2392,14 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
-                       GUEST_ROOT_SIZE_CELLS, GUEST_PL011_BASE,
+                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011.base_addr,
                        GUEST_PL011_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if ( res )
         return res;
 
-    set_interrupt(intr, GUEST_VPL011_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+    set_interrupt(intr, d->arch.vpl011.virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
 
     res = fdt_property(fdt, "interrupts", intr, sizeof (intr));
     if ( res )
@@ -3109,6 +3114,14 @@ static int __init construct_domU(struct domain *d,
             allocate_static_memory(d, &kinfo, node);
     }
 
+    /*
+     * Base address and irq number are needed when creating vpl011 device
+     * tree node in prepare_dtb_domU, so initialization on related variables
+     * shall be done first.
+     */
+    if ( kinfo.vpl011 )
+        rc = domain_vpl011_init(d, NULL);
+
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
         return rc;
@@ -3117,9 +3130,6 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    if ( kinfo.vpl011 )
-        rc = domain_vpl011_init(d, NULL);
-
     return rc;
 }
 
@@ -3161,15 +3171,33 @@ void __init create_domUs(void)
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
         {
+            unsigned int vpl011_virq = GUEST_VPL011_SPI;
+
             d_cfg.arch.nr_spis = gic_number_lines() - 32;
 
+            /*
+             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
+             * set, in which case it'll match the hardware.
+             *
+             * Since here the domain is not totally built, we need to
+             * open-code the logic to find the vIRQ. and the logic here
+             * is consistent with the ones in domain_vpl011_init().
+             */
+            if ( d_cfg.flags & XEN_DOMCTL_CDF_INTERNAL_directmap )
+            {
+                vpl011_virq = serial_irq(SERHND_DTUART);
+                if ( vpl011_virq < 0 )
+                    panic("Error getting IRQ number for this serial port %d\n",
+                          SERHND_DTUART);
+            }
+
             /*
              * vpl011 uses one emulated SPI. If vpl011 is requested, make
              * sure that we allocate enough SPIs for it.
              */
             if ( dt_property_read_bool(node, "vpl011") )
                 d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
-                                         GUEST_VPL011_SPI - 32 + 1);
+                                         vpl011_virq - 32 + 1);
         }
 
         /*
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 895f436cc4..65610bccaf 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -29,6 +29,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/console.h>
+#include <xen/serial.h>
 #include <public/domctl.h>
 #include <public/io/console.h>
 #include <asm/pl011-uart.h>
@@ -71,11 +72,11 @@ static void vpl011_update_interrupt_status(struct domain *d)
      * status bit has been set since the last time.
      */
     if ( uartmis & ~vpl011->shadow_uartmis )
-        vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, true);
+        vgic_inject_irq(d, NULL, vpl011->virq, true);
 
     vpl011->shadow_uartmis = uartmis;
 #else
-    vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, uartmis);
+    vgic_inject_irq(d, NULL, vpl011->virq, uartmis);
 #endif
 }
 
@@ -347,7 +348,8 @@ static int vpl011_mmio_read(struct vcpu *v,
                             void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa -
+                                     v->domain->arch.vpl011.base_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -430,7 +432,8 @@ static int vpl011_mmio_write(struct vcpu *v,
                              void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa -
+                                     v->domain->arch.vpl011.base_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -626,6 +629,49 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     if ( vpl011->backend.dom.ring_buf )
         return -EINVAL;
 
+    /*
+     * The VPL011 virq is GUEST_VPL011_SPI, except for direct-map domains
+     * where the hardware value shall be used.
+     * And the logic here should stay in sync with the one in
+     * create_domUs().
+     */
+    if ( is_domain_direct_mapped(d) )
+    {
+        const struct vuart_info *uart = serial_vuart_info(SERHND_DTUART);
+        int vpl011_irq = serial_irq(SERHND_DTUART);
+
+        if ( (uart != NULL) && (vpl011_irq > 0) )
+        {
+            vpl011->base_addr = uart->base_addr;
+            vpl011->virq = vpl011_irq;
+        }
+        else
+        {
+            printk(XENLOG_ERR
+                   "vpl011: Unable to re-use the Xen UART information.\n");
+            return -EINVAL;
+        }
+
+        /*
+         * Since the PL011 we emulate for the guest requires a 4KB region,
+         * and on some Hardware (e.g. on some sunxi SoC), the UART MMIO
+         * region is less than 4KB, in which case, there may exist multiple
+         * devices within the same 4KB region, here adds the following check to
+         * prevent potential known pitfalls
+         */
+        if ( uart->size < GUEST_PL011_SIZE )
+        {
+            printk(XENLOG_ERR
+                   "vpl011: Can't re-use the Xen UART MMIO region as it is too small.\n");
+            return -EINVAL;
+        }
+    }
+    else
+    {
+        vpl011->base_addr = GUEST_PL011_BASE;
+        vpl011->virq = GUEST_VPL011_SPI;
+    }
+
     /*
      * info is NULL when the backend is in Xen.
      * info is != NULL when the backend is in a domain.
@@ -661,7 +707,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         }
     }
 
-    rc = vgic_reserve_virq(d, GUEST_VPL011_SPI);
+    rc = vgic_reserve_virq(d, vpl011->virq);
     if ( !rc )
     {
         rc = -EINVAL;
@@ -673,12 +719,12 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     spin_lock_init(&vpl011->lock);
 
     register_mmio_handler(d, &vpl011_mmio_handler,
-                          GUEST_PL011_BASE, GUEST_PL011_SIZE, NULL);
+                          vpl011->base_addr, GUEST_PL011_SIZE, NULL);
 
     return 0;
 
 out2:
-    vgic_free_virq(d, GUEST_VPL011_SPI);
+    vgic_free_virq(d, vpl011->virq);
 
 out1:
     if ( vpl011->backend_in_domain )
diff --git a/xen/include/asm-arm/vpl011.h b/xen/include/asm-arm/vpl011.h
index e6c7ab7381..c09abcd7a9 100644
--- a/xen/include/asm-arm/vpl011.h
+++ b/xen/include/asm-arm/vpl011.h
@@ -53,6 +53,8 @@ struct vpl011 {
     uint32_t    uarticr;        /* Interrupt clear register */
     uint32_t    uartris;        /* Raw interrupt status register */
     uint32_t    shadow_uartmis; /* shadow masked interrupt register */
+    paddr_t     base_addr;
+    unsigned int virq;
     spinlock_t  lock;
     evtchn_port_t evtchn;
 };
-- 
2.25.1


