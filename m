Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D776247C89
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 05:13:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7s28-0006Xj-Qy; Tue, 18 Aug 2020 03:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+cVS=B4=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1k7s27-0006Xe-33
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 03:11:31 +0000
X-Inumbo-ID: d258a4f8-6f05-40ea-82a6-b92e2c53f4e8
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d258a4f8-6f05-40ea-82a6-b92e2c53f4e8;
 Tue, 18 Aug 2020 03:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIgfXj+zbAOvVR84RCePLoTUejtcyhxbQHtWvDZRZ0Y=;
 b=j3Wyn6t5Aly+hWh3qDcqRgr3NJQwmakeY2d4ZgpGKb8wspGBNhLqdPFqSjW3BVqyOWSP+uhV4Y0qE8lXLE4C6wIHt3u7LRQTgc80XBgyP8UZx2ZfiCxejozuS2Zf5vGne8afqTt0I/PI+vXz5TakfPKvxD5w2Pr3SSnnS+FMAec=
Received: from AM6P191CA0105.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::46)
 by AM0PR08MB4481.eurprd08.prod.outlook.com (2603:10a6:208:148::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Tue, 18 Aug
 2020 03:11:25 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::4d) by AM6P191CA0105.outlook.office365.com
 (2603:10a6:209:8a::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Tue, 18 Aug 2020 03:11:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 03:11:25 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Tue, 18 Aug 2020 03:11:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 02f3247f4f6e3cc5
X-CR-MTA-TID: 64aa7808
Received: from 45ed22510b1c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 05B2EE15-533B-4A86-95A4-EFA5CBA0A491.1; 
 Tue, 18 Aug 2020 03:11:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 45ed22510b1c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 03:11:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ie7zVfLwlrAmmUK1bibrAn+iAAKAvwNf5TFUuh8OI4lwDVZvEj5CKKCg3fe5LIhjEYAdJXcerK2bmxJzRQCOAQoixFUhaNwx2hVvUwNW1FYC7kLSbbf4ZmWoS1WlwOkvQ3nZvF/pWUEebkOOv3qddFEWO/J03GjHCzDfe7lCVunUGKGEaYIupsocVzpIMB+X4CVjOQ2tYFwI94QwzOhmeU0KCncpHYH8TdnK9s8K1aKV9atglzIfwRFav3qItI12dkm6Hx5JH3vN0N/nSzZtwJ68dphOyXVx3iMo3ggD7XNPpItuGNkqtEd0uaS76fJow2n13g3JgJA0D7ZWt4/qHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIgfXj+zbAOvVR84RCePLoTUejtcyhxbQHtWvDZRZ0Y=;
 b=kkB57uAc5Ns2olrPaJ9FmeF45GpZSKFJwa4ebv6NVplNZVwQiO0rtkfW0TQomTArOj66Ylva4C72PbGuTQndGkxRe4Z+39fBL6fhXOAVIzhCnGAR0aMFaMilTbe9I2H5HxMEmeEevH/Bvhb2iIzrldEBGtET1uYuegQ/Gv2TgEg9xGpcOyoP8j9I9pTBheMHQLWrs4+YaOusvjk99/L31qi8EFE4cFHpnPZ3q6UhhHpHPsdhMynamoGCRZNkQgrWYnKXG+lRluBrSTsZqgyTCTbEUBtEo9pY+x6hMoWdn0/LhJrKp9b2D/AEXzO/XLo5lrqZl3+mRNuXXI7MhnNlLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIgfXj+zbAOvVR84RCePLoTUejtcyhxbQHtWvDZRZ0Y=;
 b=j3Wyn6t5Aly+hWh3qDcqRgr3NJQwmakeY2d4ZgpGKb8wspGBNhLqdPFqSjW3BVqyOWSP+uhV4Y0qE8lXLE4C6wIHt3u7LRQTgc80XBgyP8UZx2ZfiCxejozuS2Zf5vGne8afqTt0I/PI+vXz5TakfPKvxD5w2Pr3SSnnS+FMAec=
Received: from DB7PR05CA0061.eurprd05.prod.outlook.com (2603:10a6:10:2e::38)
 by AM0PR08MB4258.eurprd08.prod.outlook.com (2603:10a6:208:142::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Tue, 18 Aug
 2020 03:11:18 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::fd) by DB7PR05CA0061.outlook.office365.com
 (2603:10a6:10:2e::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Tue, 18 Aug 2020 03:11:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 03:11:17 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2044.4; Tue, 18 Aug
 2020 03:11:17 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Tue, 18
 Aug 2020 03:11:16 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Tue, 18 Aug 2020 03:11:13 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <steve.capper@arm.com>, <Kaly.Xin@arm.com>, <wei.chen@arm.com>
Subject: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
Date: Tue, 18 Aug 2020 03:11:12 +0000
Message-ID: <20200818031112.7038-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cb6a443-2df5-4a80-f47c-08d843246480
X-MS-TrafficTypeDiagnostic: AM0PR08MB4258:|AM0PR08MB4481:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4481A673BA07C74C81BA6FEC9E5C0@AM0PR08MB4481.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
Content-Transfer-Encoding: quoted-printable
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tvMXF7COruPNW8LGASbyJGeUWAGntN/Ns+kMuKLxAJRUJ5WU58vYfwd1OTljGst/1zQAq8B4JoYWJQ4ftD9ehG0/FN2er/cAwpbToXTqdJdZP4P0axMkw/B6aLPbdPeGunsJuuX80ut+pk/hGowwDumvCOR1cvit7MUE4U/nLJFwx6EdjoSeK5gXcJ5Yojd6sC6OvTqUlM6taJrChlB3Rm17PY+86dqSJ5v3/JkIReHqIlv9Sa0LAcFx7Gu98J8Mus0QOAlp9VNBaLmoGuzTTA/AEASuKQ8eSZkXnTu+WZpaRqXH0yIYpQqGvYenWnch4SPZqpNTWNOaQqZ20tRpscRQSCATLcEqEZjkauhucOgb4siK+t7oQEcD9OO+z7vayY5LXwf/hHqObyx2JoAeXg==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(70206006)(44832011)(26005)(2906002)(1076003)(8676002)(70586007)(316002)(4326008)(86362001)(336012)(2616005)(54906003)(426003)(186003)(478600001)(8936002)(110136005)(83380400001)(356005)(81166007)(82310400002)(5660300002)(36756003)(47076004)(82740400003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4258
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 678dc6a1-eaca-491a-ab80-08d843245fdf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yI5p9SSp7jeLhUdNTZReBBxZy3ZOOQR+uVrL0DFPb5pnhHVM4Zx9eaFdyq4RCWXRTNRBopbEGCucGM5/uzzfQt8ZmtEClPHQHRpI88V0qsrU8mwCgbl96BMyrC2gFOYWqH+A0LLe9l5zZ+x97o7b/2Nq670R6x2koQ/LTpLIp86pm0guw8+JSinZ8aGrwMjkr8f7pg0JajdtiX3KSWF6+pCEvlIzR6m9fCeCzrBxonCFVUN3bkiEnGpUCMGaX6nFWKY3l8VM4a6XmL7GMVUJGqHFFAXww+xNToHiIClSGGpz2gvk6XBUnB61nCDdYH616yUivY0N5OdfIMkq7EyB+2KpPgpWMTAMFPrH6BO2+WsXcWR519tda3Hq+cnQybG/gEOvzxvvDNfZEn8N+8z+9g==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966005)(36906005)(478600001)(47076004)(54906003)(2906002)(316002)(82740400003)(110136005)(26005)(5660300002)(186003)(86362001)(336012)(44832011)(1076003)(2616005)(426003)(8676002)(4326008)(8936002)(70206006)(81166007)(82310400002)(70586007)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 03:11:25.6202 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb6a443-2df5-4a80-f47c-08d843246480
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4481
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
FP/SIMD or not. But currently, this two MACROs only consider value 0
of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
that support FP/SIMD and half-precision floating-point features, the
ID_AA64PFR0_EL1.FP/SIMD are 1. For these CPUs, xen will treat them as
no FP/SIMD support. In this case, the vfp_save/restore_state will not
take effect.

Unfortunately, Cortex-N1/A76/A75 are the CPUs support FP/SIMD and
half-precision floatiing-point. Their ID_AA64PFR0_EL1.FP/SMID are 1
(see Arm ARM DDI0487F.b, D13.2.64). In this case, on N1/A76/A75
platforms, Xen will always miss the float pointer registers save/restore.
If different vCPUs are running on the same pCPU, the float pointer
registers will be corrupted randomly.

This patch fixes Xen on these new cores.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-arm/cpufeature.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeat=
ure.h
index 674beb0353..588089e5ae 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -13,8 +13,8 @@
 #define cpu_has_el2_64    (boot_cpu_feature64(el2) >=3D 1)
 #define cpu_has_el3_32    (boot_cpu_feature64(el3) =3D=3D 2)
 #define cpu_has_el3_64    (boot_cpu_feature64(el3) >=3D 1)
-#define cpu_has_fp        (boot_cpu_feature64(fp) =3D=3D 0)
-#define cpu_has_simd      (boot_cpu_feature64(simd) =3D=3D 0)
+#define cpu_has_fp        (boot_cpu_feature64(fp) <=3D 1)
+#define cpu_has_simd      (boot_cpu_feature64(simd) <=3D 1)
 #define cpu_has_gicv3     (boot_cpu_feature64(gic) =3D=3D 1)
 #endif

--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

