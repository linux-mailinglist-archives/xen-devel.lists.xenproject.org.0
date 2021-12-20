Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C0D47A44A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:22:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249417.429913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7s-0002xs-5o; Mon, 20 Dec 2021 05:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249417.429913; Mon, 20 Dec 2021 05:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7r-0002um-VA; Mon, 20 Dec 2021 05:22:19 +0000
Received: by outflank-mailman (input) for mailman id 249417;
 Mon, 20 Dec 2021 05:22:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7q-0007eH-7r
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:22:18 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe09::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cad04c9b-6154-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 06:22:15 +0100 (CET)
Received: from DB8PR03CA0003.eurprd03.prod.outlook.com (2603:10a6:10:be::16)
 by DB9PR08MB6474.eurprd08.prod.outlook.com (2603:10a6:10:255::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 05:22:11 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::94) by DB8PR03CA0003.outlook.office365.com
 (2603:10a6:10:be::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Mon, 20 Dec 2021 05:22:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:22:11 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110");
 Mon, 20 Dec 2021 05:22:11 +0000
Received: from f12c4f60432a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E634AF5C-8CD2-4994-8058-C71DCFF15596.1; 
 Mon, 20 Dec 2021 05:22:05 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f12c4f60432a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:22:05 +0000
Received: from DB8PR09CA0030.eurprd09.prod.outlook.com (2603:10a6:10:a0::43)
 by AM0PR08MB3697.eurprd08.prod.outlook.com (2603:10a6:208:103::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 05:22:03 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::51) by DB8PR09CA0030.outlook.office365.com
 (2603:10a6:10:a0::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Mon, 20 Dec 2021 05:22:03 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:22:02 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:22:00 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:58 +0000
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
X-Inumbo-ID: cad04c9b-6154-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztI108Injf1XAV21Go3AKAH/1s8azeMVIu7K0T9uGCk=;
 b=LH2WgRmeRhpRFCJFTVGCG7EeTqDQLyd/Tz+F7V/PdcaKUGnjfnoqC6fSdER3MkXSTekWNwpDG9yH0DgbslMewCC13IC8xuMU9BPSxiFqG1XiJddEfjmN36IIPlV8utbY4b1AsGmDNhHOyH84oo9jRtsfo/jJpta5ZXzQOMOp0Ms=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95b085677d276f6f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXSEV/vuJPbgt0ovwSKpGpLJWwV2o7DNqV9Ca8Wp753KM31ETYVi5c+RXzPTNRG2zM/j8Her1t6bvWWb8XYN+jq5tsdZ9uVDVr54xOeRcQE8fw9dv+pG75foiwtA5UJ2CrGb1I9sus8FLhzLizzrUKCSyzbkJgnwE61WeypKMYafwZVHtZvv8nHSwgflS8Cz4CtUpEj06N6RbqH88pZ14n6UkI9qSWwWQ2aWrf4J/6UfKS9KUWG9mVQRMOHxRCJ4/NJrib+qW5qby8EgQQEH8r8g77L9NXqoxP8w9PhMJ9tWGIyHNWsKpFJSu7VXwP6kAayoCVaEh0Rz4lwU9sjVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztI108Injf1XAV21Go3AKAH/1s8azeMVIu7K0T9uGCk=;
 b=ELteTaD3LJgav+QzdYjWDDa5+EVyL3FyRLKWOEGaPdtZIi6H5b+swKmL/S/EaQrv+2HWjwTSOpm4OrVTBnqNyM8wRLLpHxtEg0rYHN4MRE6UxemrOozTIYFc+bd8WtYCma+DRwryalYS6qEeGUBBYmd/lYq38cE9A/hZtF74z50WS7hytcEle/eQ9znEyDMGAACr90yCbum9loKbgDOEH+gFT0IHwr/QmF/tb/rMCzyTY8TOBMuQzKcePVO1WsHyfNAthVL/p0ksAbd+jMi92FeVwRZ0RH9Pfe0ZdKTePMzmxWmeeCQTAmyDfYqJjVRem9fhK1CebYgeJDAg6hfTeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztI108Injf1XAV21Go3AKAH/1s8azeMVIu7K0T9uGCk=;
 b=LH2WgRmeRhpRFCJFTVGCG7EeTqDQLyd/Tz+F7V/PdcaKUGnjfnoqC6fSdER3MkXSTekWNwpDG9yH0DgbslMewCC13IC8xuMU9BPSxiFqG1XiJddEfjmN36IIPlV8utbY4b1AsGmDNhHOyH84oo9jRtsfo/jJpta5ZXzQOMOp0Ms=
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
Subject: [PATCH v4 10/11] xen/arm: if direct-map domain use native UART address and IRQ number for vPL011
Date: Mon, 20 Dec 2021 05:21:22 +0000
Message-ID: <20211220052123.969876-11-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 10d9e2d1-f2f8-4703-3510-08d9c378acee
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3697:EE_|DB5EUR03FT017:EE_|DB9PR08MB6474:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6474A891AAAFAAE48B033130F77B9@DB9PR08MB6474.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ozBGj7WK7zeVxW2xL1KiKYOgd8sY9qqGmcDn8JVnd0U0gUI4HsJ01c2N+2ykgNj/tKTkv+r+T9iwDByaLD4RoFt/pCzOfXp0HZPp60BGXYrh/8PfpZKPPQ7uurZmRMStYjAMH8yh1ItvnzHkEOLvO6+F97HH0bkr+FNMcfWaZGyA4y2c8kdlC71H4fB+OgtRW8Jd5gCe/UpolnPwmoG4T5IIRWICkFfIILgs8WW3S88jtwAAas+YrZPuLoVX3lDzPnFpnndlcNSNl+fXF7TBO9hSnf2Ca9oXFGABiuORXH5b7oXJUacCHBNx1dSAjfbBCv54keHosNW2HaXimYMLfIckEQ1/8Rau2wfltzUEgz5JU7BUxiEIzGFcV4BdouiYrH8mGerFfRSzwKm0uEwIIsdWXm/G+vGb4lRhCpHmLjHIjkzevrLRO6WyVw99K0Z2QcNlk3u8r7tGoZBe8e/j0CGJYykYYyZpuX+Bgbnp6kKmvhab6AQIKKtoUV3WjIDeS17AtkmAlaDNL1OlEJE15BiowjM+FBrUV99ldn9uEx3p5eF66J61lu7mWQJuHU+2qzD1f9MAIdmPDpYxS0EwBc+UjWUKM1gxy/MVp0KNB1vqDv9nk/zp4vYJIAKlrwHNwAvPvr5ASf4tBcEgUbw7nh2FfGigNAKrnMRfO/dC+89XUXWNDoMfpplyz+Hn/o4kOn30paxiHRPliSW17phfZb0pDUbfRjC6xhAqhie8jdsXOLQGx+Ic8c4iXTM8NKNldG9Q8JtVSfd6idiD55xIoIJQ7JU8ma1HhN+62GEIcFo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(70586007)(2906002)(110136005)(8936002)(47076005)(70206006)(7696005)(316002)(54906003)(36756003)(426003)(44832011)(6666004)(36860700001)(8676002)(26005)(81166007)(356005)(86362001)(82310400004)(336012)(83380400001)(4326008)(1076003)(2616005)(186003)(508600001)(40460700001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3697
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d824209-9343-4e5b-8c14-08d9c378a7c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mgur4cy9IrIg9hX2AiKJSwWoOe6Z20n76yKLqAdEix6fTJ+AgqwMUglbxTeZpwhlKSkW2jbq84TJmqhCPG+dpsUumgrfdKfchf73U4hie+CSOfqMa6rLfe/hBSdt2jmWue8gE7QjaiuFGEjEibAsE6PK57oL0SbJF1eanpVOTq+GDKGB7BPcydGUaLkKmvc9KgfoNmLdxNyZWndQpVaE7sfU4O2vcZyM86UjxmZUp538WEVwpPexAObN0skk739maw9Td0boI2jUDzceYhOS/EoIe0GapnSfb5fA3237bk/x3fm+jghZ2VejDSNGkYuUXH+ECO3YsFQVWzS9UXCxeIT319GQ88+34U5OUDvg8f7U9MzxNC87saANZ9oeB0iq1BAFKr4E9yjQzTW72l7TlCk/Tz8feAqbIdjIb1aGW3lXOAo/9zzoKLX6YaAugPYlqx/6Dp4XZUVO6wy/y7VqABOm9HAwa6benHD48IQdLLVJKb9xsDxlS8zPl6ZMEn68TpDpQQMcA5vuIwq6j8yYSxJDLAVct88NUkPSKSK1M9+OxAVh0IfE151h+mpt/tJUMLGkztRDI0QaJ3t7gCZChB972VVV0OgI7q3rluWoZHRXDLdJW++uaqvt1nugcLiUENovFEHWLKcQ6gv8Mrp0qXNdJudQAunw5hRuhmRGl2q1AopZDPaDdk7rPrlyQ01SNW4vvhgijzreW8ImAc/HHQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(54906003)(316002)(5660300002)(4326008)(8936002)(110136005)(70586007)(26005)(70206006)(44832011)(2906002)(36860700001)(7696005)(186003)(6666004)(508600001)(336012)(83380400001)(47076005)(86362001)(8676002)(81166007)(426003)(82310400004)(1076003)(2616005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:22:11.4263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d9e2d1-f2f8-4703-3510-08d9c378acee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6474

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

We always use a fix address to map the vPL011 to domains. The address
could be a problem for direct-map domains.

So, for domains that are directly mapped, reuse the address of the
physical UART on the platform to avoid potential clashes.

Do the same for the virtual IRQ number: instead of always using
GUEST_VPL011_SPI, try to reuse the physical SPI number if possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
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
v4 changes:
- refine comment message
---
 xen/arch/arm/domain_build.c       | 44 +++++++++++++++++++----
 xen/arch/arm/include/asm/vpl011.h |  2 ++
 xen/arch/arm/vpl011.c             | 60 +++++++++++++++++++++++++++----
 3 files changed, 92 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9a7145b3ee..a3196a4545 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -30,6 +30,7 @@
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
+#include <xen/serial.h>
 
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
@@ -2415,8 +2416,12 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
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
 
@@ -2426,14 +2431,14 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
 
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
@@ -3145,6 +3150,14 @@ static int __init construct_domU(struct domain *d,
     else
         assign_static_memory_11(d, &kinfo, node);
 
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
@@ -3153,9 +3166,6 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    if ( kinfo.vpl011 )
-        rc = domain_vpl011_init(d, NULL);
-
     return rc;
 }
 
@@ -3200,15 +3210,35 @@ void __init create_domUs(void)
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
         {
+            unsigned int vpl011_virq = GUEST_VPL011_SPI;
+
             d_cfg.arch.nr_spis = gic_number_lines() - 32;
 
+            /*
+             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
+             * set, in which case it'll match the hardware.
+             *
+             * Since the domain is not yet created, we can't use
+             * d->arch.vpl011.irq. So the logic to find the vIRQ has to
+             * be hardcoded.
+             * The logic here shall be consistent with the one in
+             * domain_vpl011_init().
+             */
+            if ( flags & CDF_directmap )
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
diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
index e6c7ab7381..c09abcd7a9 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -53,6 +53,8 @@ struct vpl011 {
     uint32_t    uarticr;        /* Interrupt clear register */
     uint32_t    uartris;        /* Raw interrupt status register */
     uint32_t    shadow_uartmis; /* shadow masked interrupt register */
+    paddr_t     base_addr;
+    unsigned int virq;
     spinlock_t  lock;
     evtchn_port_t evtchn;
 };
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 895f436cc4..43522d48fd 100644
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
+     * The logic here should stay in sync with the one in
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
-- 
2.25.1


