Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71979255312
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 04:35:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBUDl-0001bQ-Dn; Fri, 28 Aug 2020 02:34:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UB2A=CG=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kBUDk-0001bI-5r
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 02:34:28 +0000
X-Inumbo-ID: 5a2cba83-40f4-4efa-8196-127814677db1
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a2cba83-40f4-4efa-8196-127814677db1;
 Fri, 28 Aug 2020 02:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxjuW76QYQnnm39E3PPg+txyPyA7XTzDaE5mmk/F3KI=;
 b=GfIzIq+Nk/jTvnX5PbmbosW8hkQaBPOn016q9FdFDkVHb9TmDRlogV7QrfmQRvLw6iH6HoMHR8Kz0kfCa+rD90PAZopMANszDo7adpqdh9C+VY+TiOn4n8tFRWlniGrCfLVlywdCF0TTo5AVfdu4EezdlHyUXQBnZ5OlogHQNbg=
Received: from AM0PR04CA0088.eurprd04.prod.outlook.com (2603:10a6:208:be::29)
 by DB6PR0801MB2023.eurprd08.prod.outlook.com (2603:10a6:4:75::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 02:34:23 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:be:cafe::77) by AM0PR04CA0088.outlook.office365.com
 (2603:10a6:208:be::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Fri, 28 Aug 2020 02:34:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 02:34:23 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Fri, 28 Aug 2020 02:34:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a31e6e63080ee1a
X-CR-MTA-TID: 64aa7808
Received: from f21969c25d27.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 37D74C88-39BE-494E-A396-B0F0495491DB.1; 
 Fri, 28 Aug 2020 02:34:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f21969c25d27.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Aug 2020 02:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RL5V301u6+pCoJr7dyDL1kz4o26WE/O4DUrDmXafHOz0Kz7qHgps2As5tul2pA+1hTai4CrzkcXkKyNHOPHQO3iUa/JBNAKMx3+juevBlzi5SFnBYCqbG655gzUOSLwcoF6epd/BhShBOuITJG47nC68kggZjYvgwwNzovJF7kzP5fHKGkZ3zU+1iqCgPU0Wg5m8n+j9GCgZ9NMozfqNJV6wm9+16xNaMCyO91r7gzSy4z5M3eVobPEGFpGebWcINNoYcb30T2EK6pyr92wDzmPpmCQWzJi/zall09JpitEXOJ8JCOxY/y5+ZSUx+GjtPxF6pSGzZJ587b001EpqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxjuW76QYQnnm39E3PPg+txyPyA7XTzDaE5mmk/F3KI=;
 b=MrmGYKhxBFl3RYYCfq6o191APdm3bXcH2784OagsceHIW1KRyxTDkkmqnEGvPG6qhIZpMv1SoU7itLHKyJLR6PjiAO8Dhhc19WWDSy9VQoYyb8yT98O41ocaoL/Y9axfmG36X+aKqbHsdjxXy4yWmSzTbHx6Y9EDhM4TFcmJxBljOf7NphTwD2Tq02CTOn/mjieEtkA/G3/6d4kbuziKoa/3DxICmlQ/Zd/EPVPI5wN6CH+6i6FJtarfCajQyjnv8VMl0ade4jv2xH0ZDcKF2qKHwj8H7rnmJeKZbO6Lkho+gkD9xtI5vqj+/t9aM1z54JYMMzS2sqwThKgX2VtFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxjuW76QYQnnm39E3PPg+txyPyA7XTzDaE5mmk/F3KI=;
 b=GfIzIq+Nk/jTvnX5PbmbosW8hkQaBPOn016q9FdFDkVHb9TmDRlogV7QrfmQRvLw6iH6HoMHR8Kz0kfCa+rD90PAZopMANszDo7adpqdh9C+VY+TiOn4n8tFRWlniGrCfLVlywdCF0TTo5AVfdu4EezdlHyUXQBnZ5OlogHQNbg=
Received: from DB8PR06CA0048.eurprd06.prod.outlook.com (2603:10a6:10:120::22)
 by DBAPR08MB5767.eurprd08.prod.outlook.com (2603:10a6:10:1a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 28 Aug
 2020 02:34:16 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::74) by DB8PR06CA0048.outlook.office365.com
 (2603:10a6:10:120::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend
 Transport; Fri, 28 Aug 2020 02:34:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 02:34:15 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 28 Aug
 2020 02:34:14 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Fri, 28 Aug 2020 02:34:12 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v5 1/2] xen/arm: Missing N1/A76/A75 FP registers in vCPU
 context switch
Date: Fri, 28 Aug 2020 02:34:03 +0000
Message-ID: <20200828023404.28638-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828023404.28638-1-wei.chen@arm.com>
References: <20200828023404.28638-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aef9998c-2f75-4bbd-aaeb-08d84afae00e
X-MS-TrafficTypeDiagnostic: DBAPR08MB5767:|DB6PR0801MB2023:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB202391177092AAB0F1DB37C89E520@DB6PR0801MB2023.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fVDdI1NKyWuQ8PexL9jUMWjcvkF/v7nz7Yi1u8YcQGDYK8o/vASXUTRt6lBwh50w0AYVAw2tl5ybntP43cAEbqNbh0ZQNrpafA+JEASs6d4euiOrq2q5QhAwSnKcRLKaAxl2OUYE3Il3j4a7kFPLuvWSRDNgUa1zgYn/kfc7GX7DY9fcbNg/WULMuCqpefxKlBxGrVZu+NzYJ+XgfF+DL2efHNZFQd6vC2UrAxLm06Z7W2j3W6Jci4LmpLOrVgZvClxKHeNFlkpjeDqxsFgJ5bFWr/ZxQABUlUpnIBlCr9mXbxwn8LdUDrTvGXVm1titKyLKMg0fYzSDuSirFERFmV9C3mUVXFG5oNgJr/2HeDPJ4vvtlEPLCSMiNLUGaRjANr3mEttLAa658uRM4S7ltw==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(316002)(186003)(8676002)(8936002)(82310400002)(82740400003)(1076003)(83380400001)(70586007)(70206006)(5660300002)(478600001)(26005)(356005)(81166007)(44832011)(2616005)(86362001)(110136005)(54906003)(36756003)(2906002)(6666004)(336012)(426003)(47076004)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5767
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2c504478-22c2-4cb7-e0e3-08d84afadb97
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fCXsnipZyWdl3pS2sU/xAFJ3PNG1N3ZN9p62ne8iD2MtsuGdqz12dNqsdw/UXjHgwTtADw2U4IhW3s66TzZXGwoZkJ79WJoc3AK2mQ5jALyfNahtlisWb7VpZ86cjdfd+X1rdpMThtLQpLc/VpP9w0P8atJ9dQE7wTpUdfAur1njd33yLVdUMmC8r65Tph0xfQldCmYDvn1XSetaoZUWsdGpIIoflgg50qB26kD/gO/DSXTeBeBjjap8UhoQqkpN/EwTPid+ZA/hbDOwVftlzxNQTZ5VCoAWf5XWaXK6GNEqLhShHGnCReLNZhq+SzZG+L1m5+HGqyNaldHACj17I9hwbFJofZNseXREf9MHLGFfe92FFdHZfbLmNbwySThYoqRHQwgyf1ask/J6e7R3DA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(83380400001)(81166007)(70586007)(316002)(336012)(426003)(2616005)(6666004)(4326008)(82740400003)(86362001)(82310400002)(36906005)(54906003)(110136005)(478600001)(2906002)(186003)(1076003)(70206006)(36756003)(5660300002)(8936002)(47076004)(8676002)(44832011)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 02:34:23.3712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aef9998c-2f75-4bbd-aaeb-08d84afae00e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2023
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

Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
FP/SIMD or not. But currently, these two MACROs only consider value 0
of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
that support FP/SIMD and half-precision floating-point arithmetic, the
ID_AA64PFR0_EL1.FP/SIMD are 1 (see Arm ARM DDI0487F.b, D13.2.64).
For these CPUs, xen will treat them as no FP/SIMD support, the
vfp_save/restore_state will not take effect.

From the TRM documents of Cortex-A75/A76/N1, we know these CPUs support
basic Advanced SIMD/FP and half-precision floating-point arithmetic. In
this case, on N1/A76/A75 platforms, Xen will always miss the floating
pointer registers save/restore. If different vCPUs are running on the
same pCPU, the floating pointer registers will be corrupted randomly.

This patch fixes Xen on these new cores.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/asm-arm/cpufeature.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 674beb0353..10878ead8a 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -13,8 +13,8 @@
 #define cpu_has_el2_64    (boot_cpu_feature64(el2) >= 1)
 #define cpu_has_el3_32    (boot_cpu_feature64(el3) == 2)
 #define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
-#define cpu_has_fp        (boot_cpu_feature64(fp) == 0)
-#define cpu_has_simd      (boot_cpu_feature64(simd) == 0)
+#define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
+#define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
 #define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
 #endif
 
-- 
2.17.1


