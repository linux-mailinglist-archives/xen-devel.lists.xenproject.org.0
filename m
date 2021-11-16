Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B15452AFF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 07:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226081.390641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1M-0003rB-A5; Tue, 16 Nov 2021 06:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226081.390641; Tue, 16 Nov 2021 06:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1M-0003jb-1H; Tue, 16 Nov 2021 06:32:44 +0000
Received: by outflank-mailman (input) for mailman id 226081;
 Tue, 16 Nov 2021 06:32:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dk95=QD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mms1K-0001yg-TF
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 06:32:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0004bd5a-46a7-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 07:32:41 +0100 (CET)
Received: from DB8PR06CA0021.eurprd06.prod.outlook.com (2603:10a6:10:100::34)
 by DB9PR08MB6746.eurprd08.prod.outlook.com (2603:10a6:10:2a0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 16 Nov
 2021 06:32:40 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::8e) by DB8PR06CA0021.outlook.office365.com
 (2603:10a6:10:100::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 06:32:40 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Tue, 16 Nov 2021 06:32:40 +0000
Received: from 743cd50ae51c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C90EDCD3-16AC-4027-B213-8EE37810BA60.1; 
 Tue, 16 Nov 2021 06:32:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 743cd50ae51c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 06:32:33 +0000
Received: from AM6P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::18)
 by DB7PR08MB3563.eurprd08.prod.outlook.com (2603:10a6:10:4d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 06:32:26 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::13) by AM6P195CA0005.outlook.office365.com
 (2603:10a6:209:81::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:26 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:26 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 06:32:21 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Tue, 16
 Nov 2021 06:32:20 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:19 +0000
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
X-Inumbo-ID: 0004bd5a-46a7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMUL+ALtFabqyz4rrJ4C7dMs4QD0H7pMOoQ66/Urgd0=;
 b=Aa9wdbwcwcZuwik+f5DhDXyqT4fxmp509+keIFarA0KlP+75N2Xe09ICJYpkxcHPU0rb6rZi50FI20kwqRjX/8pBsLFNVyPSO4AB3CPKCALeNfWuGIot+lzNyVOHHG8GuL+TybJM2bAffG4u4Gu/BESS1iCCki+dliPe43VyhAw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b95e8080f31ce47
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exVQ4EP9fmFEaP2O1toJLosdbvUT495VNSEoNfBIHoguUwuGrbgNpOHuAU19nOvYHcY2zSkoabNc1bB0Yb3kFngtBSlQHZPaZqoqWTfj0qvEARZ5PXbLQa8GCuuH63l6BYrqiy6PJtKme7RtZ4Oa5ZxGlUhTJcZCpqkTVSesJQUb86iOIQXpOem9s6SAzq5y/9AwDRwY3UD0nGVzUj/i2nIp6s9vWt4UZ52Oj66lR9zyVeVdidI2N42nTN55CHOqGYi9eQUGaxBG4oCuav9zXlJgfpoCzuaK5Cb47qnXNnrgWlwUFC2Clu9/RBhpWKgP3sqkBz4M2+zFA6coMeuxvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMUL+ALtFabqyz4rrJ4C7dMs4QD0H7pMOoQ66/Urgd0=;
 b=oKqxmf+HVoLojtiNwvtZ1cTpqfVgwK3D9P4mMT0IWxbvi9IUJM0nAslShXwx86543OBNA3RTzGpnWvOLI3masXjfWkMiISblTJjsR4o7SgnX3VcqsoRSJiAaWWLCE/uYE05l8gqtL8byYpLkYPy1lddgDd3P1zm5jKJzgcslAatG65qZ0lfewyg4I/NDU/pJnk88BTrR2pCz0Q71mZayce5exTOB2J/ZLrm98gmActvoyykXSnYWrtLvQaP4kEP22y+iYAD33CpWLoIV6SuITNwx9b+q6tP2jtWGANU+QJyRBzkmTxCj0H2meAsTFuLlwK39yFksPFY8pGq3erlDSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMUL+ALtFabqyz4rrJ4C7dMs4QD0H7pMOoQ66/Urgd0=;
 b=Aa9wdbwcwcZuwik+f5DhDXyqT4fxmp509+keIFarA0KlP+75N2Xe09ICJYpkxcHPU0rb6rZi50FI20kwqRjX/8pBsLFNVyPSO4AB3CPKCALeNfWuGIot+lzNyVOHHG8GuL+TybJM2bAffG4u4Gu/BESS1iCCki+dliPe43VyhAw=
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
Subject: [PATCH v3 06/10] xen/arm: if direct-map domain use native addresses for GICv2
Date: Tue, 16 Nov 2021 06:31:51 +0000
Message-ID: <20211116063155.901183-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
References: <20211116063155.901183-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2be10cd5-4f48-4340-de28-08d9a8cae36d
X-MS-TrafficTypeDiagnostic: DB7PR08MB3563:|DB9PR08MB6746:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB674694A0F88CC9098BEF3E25F7999@DB9PR08MB6746.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SmEw+8oj5/BzPDlx9XKXM6s9KK3YV8y+kxAa+NVVpTN0WJr5eqlO8MLcLtKNkLJZe4slWqBLGLln5uxCKkHf8mwAOGCITmDYgy/0nbaO/UHRIAmV8oOx1X2rtuz99GOzNNaq57yypqGNjvosh6vqXnSrh6SIPuNlt9/2de2QscjJKGBqxpEesFu1cm7/75dbRFvXfrYcnPHGvsBBYiOLVKaLwEArV7V4eq5nHyM7eenqC5JqtmPV2sOHAe4WNaBzryr8zB3FQCT74XuIXmJtdav77ejiiahzC67H8bheqK9TKABnnqRUuEF2pYB62k9yPXI4Y7c/oO64sWeCb3Ts5kYph5xPKlm2vMbIxeP9zxnoRJ6vvuO0TBzfF5JKFnql95Ih88mi5KaVxyGZN3d1Ey6thz1TKEHvv/9pF7worVkz+Ztqa9DMAdOqvn8yhYmSTAeo0v5uph2LPWVI7KJPyJEN641NPPKsWxw4jcXuMqwdczVw7X85PhgbZlYMiyHtYK6LqMXDx/OFJqKJv4WHbLafEuRw7viyzXKx6lqTANo2uawIbdLiYznD07S9NRaqG/u+JTnMYSGeph+dDaTcGnLZ5f4iqyruDJbk3KeUKnKMkgdeBPM9qv0TQvKLz85Xp9KE0SGVATLAHcrWvHxkQMVKPqnTPMWJdOrvRXWmHoSIETRDMrPTQ/TKbTsV4gs845dok9uH61Bcq2vDJuP0sBTrSjDsQX5Cf1uqzxhNoTXxKQDMLGrrAMhjf9mykgln5GV5XQqU8mzqel+55E1z+Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(110136005)(356005)(5660300002)(2616005)(82310400003)(508600001)(8936002)(2906002)(83380400001)(44832011)(81166007)(86362001)(316002)(47076005)(6666004)(4326008)(1076003)(54906003)(36860700001)(7696005)(70586007)(426003)(8676002)(186003)(36756003)(336012)(70206006)(26005)(36900700001)(14943795004);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3563
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2e1a206c-64e3-4ede-942b-08d9a8cadb3c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZpZXmE8Bg/zBLJkh/co81nxekVFUfQtbY0dliTdCkCW0ony+VGdeUmbuOvdgztE696nHasIthxHCneHsTItgouH5Nwp5gWmBBQiq0e7/lqoHsgn8gwTsJdCSwfolbLMxDfsIo3qyZDyISEfvjdtO3b9w07E9RYEouJ8J4cmx+luvn1d//6o8UAvydczipQdoeXB42ywoa26Vj6+mmZZwXWymxiRWUf5+Hg86gnobl4q4L6YvqRtFmOiNIK7SF8x3XdFno0ZZhJ4VD3a0V3dTw1Gnxys3h2WYxTW/CUuFr0kfTOfHcgPnGauX4NTn2IPlkahzKjxnaqhgFUMnqP82kYjf59JZr0MvuOXa+7Y9sgECwIuvQ0Bq8MJ42h1efZpCeBkkoUVXqMYGRWJL2K1csgo5CV78vZNE+cbPuqTwNDidv75odzQk8qHoaQ1rjn9QneE0y/KCE55pPWoyx5Y0hhJtruHR9pea3nPwCQXTitdzHU1TZZJu6J65DR0AGK++jSAyWsGaf7PCDXpNYYXcf0eKFcwdOIWLZwPrINrbq2O4pF6yFr5d5yKjdF04gysFYbhmFxeWQn2+fDQSRRe/VgGRP8XQNWFYl5FoOzzFejPJGXX4+3MOva9VzjLfAr5/1lQgtES9EeWdPwHyIIcAxhgAu8RLL+Muu1gJVPXltCvoXBEdJjDFt6Q01ERu9ACQiEZ/oVg8m4IzNHWwRphmGDXWR3/8rzoEoN69T2CHO58=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(110136005)(1076003)(8936002)(26005)(426003)(316002)(2616005)(54906003)(336012)(2906002)(7696005)(8676002)(81166007)(36756003)(83380400001)(5660300002)(70586007)(47076005)(186003)(44832011)(82310400003)(70206006)(36860700001)(6666004)(4326008)(508600001)(14943795004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:32:40.2044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be10cd5-4f48-4340-de28-08d9a8cae36d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6746

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Today we use native addresses to map the GICv2 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all domains that are direct-mapped.

NEW VGIC has different naming schemes, like referring distributor base
address as vgic_dist_base, other than the dbase. So this patch also introduces
vgic_dist_base/vgic_cpu_base accessor to access correct distributor base
address/cpu interface base address on varied scenarios,

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
v2 changes
- combine all changes in patch 4-6 here
---
v3 changes
- refine comment message
- add a comment explaining how the 38 was found of "char buf[38]"
- simply map the CPU interface at the GPA vgic_v2_hw.cbase
- remove a spurious change
---
 xen/arch/arm/domain_build.c    | 11 ++++++++---
 xen/arch/arm/vgic-v2.c         | 31 ++++++++++++++++++++++---------
 xen/arch/arm/vgic/vgic-v2.c    | 31 ++++++++++++++++++++++---------
 xen/include/asm-arm/new_vgic.h | 10 ++++++++++
 xen/include/asm-arm/vgic.h     | 11 +++++++++++
 5 files changed, 73 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b6fde74d74..c419a4b2cc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2230,8 +2230,13 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     int res = 0;
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
+    const struct domain *d = kinfo->d;
+    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
+    char buf[38];
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICD_BASE));
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             vgic_dist_base(&d->arch.vgic));
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2253,9 +2258,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICD_BASE, GUEST_GICD_SIZE);
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICD_SIZE);
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICC_BASE, GUEST_GICC_SIZE);
+                       vgic_cpu_base(&d->arch.vgic), GUEST_GICC_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if (res)
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 589c033eda..6f5492e30e 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -654,13 +654,10 @@ static int vgic_v2_vcpu_init(struct vcpu *v)
 static int vgic_v2_domain_init(struct domain *d)
 {
     int ret;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
 
-    /*
-     * The hardware domain gets the hardware address.
-     * Guests get the virtual platform layout.
-     */
+    /* The hardware domain gets the hardware address. */
     if ( is_hardware_domain(d) )
     {
         d->arch.vgic.dbase = vgic_v2_hw.dbase;
@@ -671,10 +668,26 @@ static int vgic_v2_domain_init(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = vgic_v2_hw.cbase;
+        d->arch.vgic.cbase = vgic_v2_hw.cbase;
         csize = vgic_v2_hw.csize;
         vbase = vgic_v2_hw.vbase;
     }
+    else if ( is_domain_direct_mapped(d) )
+    {
+        /*
+         * For all the direct-mapped domain other than the hardware domain,
+         * we only map a 8kB CPU interface but we make sure it is at a
+         * location occupied by the physical GIC in the host device tree.
+         *
+         * We need to add an offset to the virtual CPU interface base
+         * address when the GIC is aliased to get a 8kB contiguous
+         * region.
+         */
+        d->arch.vgic.dbase = vgic_v2_hw.dbase;
+        d->arch.vgic.cbase = vgic_v2_hw.cbase;
+        csize = GUEST_GICC_SIZE;
+        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
+    }
     else
     {
         d->arch.vgic.dbase = GUEST_GICD_BASE;
@@ -685,7 +698,7 @@ static int vgic_v2_domain_init(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.cbase = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
     }
@@ -694,8 +707,8 @@ static int vgic_v2_domain_init(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
         return ret;
 
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index b5ba4ace87..63d0f03688 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -258,14 +258,11 @@ void vgic_v2_enable(struct vcpu *vcpu)
 int vgic_v2_map_resources(struct domain *d)
 {
     struct vgic_dist *dist = &d->arch.vgic;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
     int ret;
 
-    /*
-     * The hardware domain gets the hardware address.
-     * Guests get the virtual platform layout.
-     */
+    /* The hardware domain gets the hardware address. */
     if ( is_hardware_domain(d) )
     {
         d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
@@ -276,10 +273,26 @@ int vgic_v2_map_resources(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = gic_v2_hw_data.cbase;
+        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
         csize = gic_v2_hw_data.csize;
         vbase = gic_v2_hw_data.vbase;
     }
+    else if ( is_domain_direct_mapped(d) )
+    {
+        d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
+        /*
+         * For all the direct-mapped domain other than the hardware domain,
+         * we only map a 8kB CPU interface but we make sure it is at a location
+         * occupied by the physical GIC in the host device tree.
+         *
+         * We need to add an offset to the virtual CPU interface base
+         * address when the GIC is aliased to get a 8kB contiguous
+         * region.
+         */
+        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
+        csize = GUEST_GICC_SIZE;
+        vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
+    }
     else
     {
         d->arch.vgic.vgic_dist_base = GUEST_GICD_BASE;
@@ -290,7 +303,7 @@ int vgic_v2_map_resources(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.vgic_cpu_base = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
     }
@@ -308,8 +321,8 @@ int vgic_v2_map_resources(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.vgic_cpu_base),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
     {
         gdprintk(XENLOG_ERR, "Unable to remap VGIC CPU to VCPU\n");
diff --git a/xen/include/asm-arm/new_vgic.h b/xen/include/asm-arm/new_vgic.h
index 97d622bff6..ab57fcd91d 100644
--- a/xen/include/asm-arm/new_vgic.h
+++ b/xen/include/asm-arm/new_vgic.h
@@ -186,6 +186,16 @@ struct vgic_cpu {
     uint32_t num_id_bits;
 };
 
+static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
+{
+    return vgic->vgic_cpu_base;
+}
+
+static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
+{
+    return vgic->vgic_dist_base;
+}
+
 #endif /* __ASM_ARM_NEW_VGIC_H */
 
 /*
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index e69a59063a..a81a06c711 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -152,6 +152,7 @@ struct vgic_dist {
     struct pending_irq *pending_irqs;
     /* Base address for guest GIC */
     paddr_t dbase; /* Distributor base address */
+    paddr_t cbase; /* CPU interface base address */
 #ifdef CONFIG_GICV3
     /* GIC V3 addressing */
     /* List of contiguous occupied by the redistributors */
@@ -271,6 +272,16 @@ static inline int REG_RANK_NR(int b, uint32_t n)
 
 enum gic_sgi_mode;
 
+static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
+{
+    return vgic->cbase;
+}
+
+static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
+{
+    return vgic->dbase;
+}
+
 /*
  * Offset of GICD_<FOO><n> with its rank, for GICD_<FOO> size <s> with
  * <b>-bits-per-interrupt.
-- 
2.25.1


