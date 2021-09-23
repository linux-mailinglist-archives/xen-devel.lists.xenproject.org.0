Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C1C415DE0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193844.345402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVI-0004zO-FR; Thu, 23 Sep 2021 12:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193844.345402; Thu, 23 Sep 2021 12:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVI-0004ws-C9; Thu, 23 Sep 2021 12:07:04 +0000
Received: by outflank-mailman (input) for mailman id 193844;
 Thu, 23 Sep 2021 12:07:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNV9-0006xV-TT
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:06:55 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 730b2713-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:04:50 +0000 (UTC)
Received: from DB6PR0301CA0054.eurprd03.prod.outlook.com (2603:10a6:4:54::22)
 by AM6PR08MB4933.eurprd08.prod.outlook.com (2603:10a6:20b:e9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:04:48 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::53) by DB6PR0301CA0054.outlook.office365.com
 (2603:10a6:4:54::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:48 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Thu, 23 Sep 2021 12:04:48 +0000
Received: from 4960b0822148.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71862B50-7BB2-490E-89DE-0DCDD0B4EB35.1; 
 Thu, 23 Sep 2021 12:04:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4960b0822148.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:36 +0000
Received: from AM5PR0201CA0013.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::23) by AM9PR08MB6981.eurprd08.prod.outlook.com
 (2603:10a6:20b:414::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:04:35 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::65) by AM5PR0201CA0013.outlook.office365.com
 (2603:10a6:203:3d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:35 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:27 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:04:25 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:24 +0000
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
X-Inumbo-ID: 730b2713-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBYQYm/pE+7ohJdCVC0uw11MJGdKCfmbO+hBvil1Eag=;
 b=rpVqVyZuBO29kZXODsd/4sEt5FNEPeNP7JyqAfWjH5etVBcQEETNMAU8HD/RYZpGY7wvhw3YlQoR/kaSucJvBdg0hyFGwzL3piATEu3TaZD8h/N8jCxiDip4GiJtDiltOuIjVZ5imUnlZTve9rS/w3BCsgKP69z9wBhiiLTF664=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 12b7cd9313eb12ab
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxmzv4vZ3Wo/M+nyvaghH+LMqBD6Spae6W87H77piFdNmP8ojXeERFHHBbdEmkh2/IWi9W5744C70g0YwzMme+YjsSIUdzm9fQj0McB4Hy0Ob9nK3vkGqxpOP1s0rFKAzCKeZ0zuqIpILL/elNVaMEDpTrZ6vsjLtl+5C1/Hr+Gdd/xZqiW/GGl/9mB2DhRG2/ziJhIi275xbQpuDCZ1hz7B7OsPr+gQtpq44HJfhQUPy/Jj7fz4AWl1MloPrwwFBQbzG1sv9ajPmeTulZ2CZjDyiB6E+g2lX66fI0HKQq/YQ+6p1LrKuh22zvFo99od1A8ZhgfDxUZ7dxjP7V1ghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OBYQYm/pE+7ohJdCVC0uw11MJGdKCfmbO+hBvil1Eag=;
 b=LhrpmwfiJ3xmDxN/rpfowx0FJexczaBxPSBA48XHWxa+YxWk3mR4C/+3Agj5+pSLZgU2xqQZhfvSW97sy46X+XHjwqEpFF3HLgHdrceiiDIHZLgYT1iB6DssrKHa1yheSSLHGcle+3fVEE7F/3YnXKaCDaa117QVFGeJ5kRzp9ww8IS63igxp9lIu96rtlhHblTjTuTaboqvcrZYAj8cqA9J8cIa5apuFadnrEJdZBJEqytOhyiEko/8/w1l/TtWPTdvtmVpUbv7mTwy+nxyV8QxwRQBwGKfoa6JhTE9FotS2OzKNln3wRHB0eHAFr8JXPtCm2weYT91Gt6LMpATYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBYQYm/pE+7ohJdCVC0uw11MJGdKCfmbO+hBvil1Eag=;
 b=rpVqVyZuBO29kZXODsd/4sEt5FNEPeNP7JyqAfWjH5etVBcQEETNMAU8HD/RYZpGY7wvhw3YlQoR/kaSucJvBdg0hyFGwzL3piATEu3TaZD8h/N8jCxiDip4GiJtDiltOuIjVZ5imUnlZTve9rS/w3BCsgKP69z9wBhiiLTF664=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 35/37] xen/arm: use CONFIG_NUMA to gate node_online_map in smpboot
Date: Thu, 23 Sep 2021 20:02:34 +0800
Message-ID: <20210923120236.3692135-36-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3aa601d-397a-4a47-32d0-08d97e8a5747
X-MS-TrafficTypeDiagnostic: AM9PR08MB6981:|AM6PR08MB4933:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4933DA4231B8E5FE9594D7D09EA39@AM6PR08MB4933.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XILAatikNKG7Jx3du5S+YJSwp8CjhV3EaCa8GKFjUis5U37Wrt/wISUM9pRQoQEntVvWtb1EMl8tlOvCoFQUx66cj9BJriKt4zlOUInwg8ETOyraEZISxUAVbtP47X26V+9qpjcbSYD8OOi14Oz9aOr87SbV3MP+iQCoRUodlZN6K78UiXAiGsTE7Uv/BFZiPbnWNLBdapL99m3gibErOcLAjm4kF1CIefnbnaU1TUC7t53dR+/GFlqb+r+rSU0V7SjZD1x0EEAurYyXDGtwo4eLQhLll7FsDyuwhmtZkwjBzG4CkSQD90y1IisIeA0dMbe+A4C5ZdaufBjcK10MEMjM1c3WDFeO4MinL3ROiatkzDlhA8yfV+dshiOV61Uu5fIjIVeaMwttc5sZUiAkVfVeNYaptdauD9TGToM8ZYHthHwu1zppjMhj88SeiqUtmqPbG7yeF5DEP9QognPk2T4j1uxYsZY5KLbf1s3ixyx5EfukPK7VA7bsaEAFfqyfzD047URW4XSm3+dvvbQOeoj0G2sdx017bx5lNdRChL4jOkv+JpbqIXU9vR7Abd+v3+LNH3ERbQs+RosxE11gTyFUEmdaCSA7YgvxKYx4cVcqfrqtycl9S5zoIBSIMSrJ+3GyRgxPL8PE+7zHnl+M+B/VqEMyeR1rSKYymrko8E1VZIvsuT6YUjmr7+nEmf/y2w6FlRre+kATbb95TFgzsLlOhlFGEFQIrhUR6lzPqDU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(110136005)(316002)(7696005)(81166007)(70206006)(70586007)(47076005)(36860700001)(82310400003)(8936002)(5660300002)(356005)(4744005)(186003)(2616005)(83380400001)(426003)(8676002)(26005)(4326008)(508600001)(336012)(44832011)(2906002)(6666004)(1076003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6981
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c7dfaaf2-46fe-46f3-cbc9-08d97e8a4f94
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yRwMWa8HdFxAD+5Ms7cLrYXBpn2By4Eqa269XVT96x5UL8Yv9TuUNIIc6l+Iq3MrHkJJzyqH3cdwDv40rw8rh8ceQGo1Rvo+HU2/xcTHIxqavTCr8RP1OKx9APjrqMMkz76P0MY8eqDjhwlwfSZ4tYBCMQ/sxRznHElFJpiC+9kJoFnQcAc0gzVGcJpnlG9TURI45LG74w3LTbSOnna0EwJtsTKq7r6k4cLxW4jVHtsNHs4Rh8Hgr3K2SdgzniyMkR/4wKHUKW2UlrmtSEdXLWrK5enNRqauVYtJpKZE873vFhBmGBBVMpR6WSvtLJ83ym1c+4BQKzAAd5KU0s0CVVgzxsI7+yvigigxMlZVrZIUN32zTtWJlGPT2Lh8p6zIDHc3F2YiwgX+lxe3oLyP+ZpU1oCrVjFA5LCmovbmfkQKnwOoXb73BgF79MJgkfwYpvZoDd2ilQbGarZz7MKqDX+AcrpPjGn9pDewzu8Q2iCkHUH7IY5/KYEkv2UgSNaYiOCSRwXzH27GtrH/q/SUia3tToX52JNyzhfLt5OXH+WuiThfpl9zmGmShd9aEevNN5sqwgL8d3B54M+JDTQ1nEcHuYfyfYRZ1IHw9dd/kIKRzHLGsc+1CBvNa67gzp2mxjqh2Se0Fcq5WgB2CAofItuKaZR5j75CrIm44L0JnOjmuQ4pms4844l4tOW2DXoaDi/NFq2Mmqu1b79XQam0Fw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(83380400001)(508600001)(8936002)(2616005)(5660300002)(70206006)(336012)(47076005)(36860700001)(70586007)(426003)(8676002)(110136005)(86362001)(4744005)(6666004)(44832011)(2906002)(36756003)(26005)(4326008)(186003)(316002)(82310400003)(7696005)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:48.4426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3aa601d-397a-4a47-32d0-08d97e8a5747
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4933

node_online_map in smpboot still need for Arm when NUMA is turn
off by Kconfig.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/smpboot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 6e3cc8d3cc..216c8144b4 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -46,8 +46,10 @@ struct cpuinfo_arm cpu_data[NR_CPUS];
 /* CPU logical map: map xen cpuid to an MPIDR */
 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
+#ifndef CONFIG_NUMA
 /* Fake one node for now. See also include/asm-arm/numa.h */
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+#endif
 
 /* Xen stack for bringing up the first CPU. */
 static unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
-- 
2.25.1


