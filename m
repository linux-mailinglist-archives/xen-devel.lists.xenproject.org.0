Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C256E251CE4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 18:07:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAbT7-00043j-9P; Tue, 25 Aug 2020 16:06:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BGsN=CD=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kAbT6-00043e-28
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 16:06:40 +0000
X-Inumbo-ID: 87713346-2cfa-49be-8575-1d6654c04978
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87713346-2cfa-49be-8575-1d6654c04978;
 Tue, 25 Aug 2020 16:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCjAyeO+A0m1bPfAQWavgSmS0fm4D7iWs1wOM2Rmzno=;
 b=K0Th03ax0qMnWI1ODBLtvRuXwEwXk/oiD3BO71vuJ3LPun5LPz6UO5ANzjySt8kVRRJPJ/AUlRPPTQ/Ruuc8+foEoCpkMGhrAuMYNsk79A82e9jUjgWBgpFsycnXj42WyYTMueJ5ayYHr2d6RQf25ONcEB4HrCJRt8rjaMpEFi0=
Received: from DBBPR09CA0015.eurprd09.prod.outlook.com (2603:10a6:10:c0::27)
 by VE1PR08MB4928.eurprd08.prod.outlook.com (2603:10a6:802:aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Tue, 25 Aug
 2020 16:06:36 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::1e) by DBBPR09CA0015.outlook.office365.com
 (2603:10a6:10:c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 25 Aug 2020 16:06:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 16:06:36 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Tue, 25 Aug 2020 16:06:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 319a6b4152799937
X-CR-MTA-TID: 64aa7808
Received: from 1e3c6d0327bb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 89073625-0FA7-49D8-988D-85A4C80EF3B1.1; 
 Tue, 25 Aug 2020 16:06:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1e3c6d0327bb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 16:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLn49CFaDW8eHvjfpEJ/YMeRgXOQAjt4jRbs02QUzhBv/76zYNrbcxMvAueECIntHPFvuNSj5PYOMOheAUOErEFJGlkcC1wSEuatSXVeUwCgywqACCfuqa88qlbpw1QKtBkB7AYVFPgtWLISo/hiq43kKtaXYihr29znk9JWakjRAHF/hac2uoHqyF8yaZmhecRABah+ZaUk6WE82Tmiithzw/1fRaUyNUuRr754Z2zgiNx3jZyncvosOjv9+NwhBRB8ZfukEiAg4ldDI/EuPL0xUE8zVr/5V/dOJcKcE67bunci7Em+hk16wENgWXdZZdXPQOnslAPYT49vaQUKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCjAyeO+A0m1bPfAQWavgSmS0fm4D7iWs1wOM2Rmzno=;
 b=b8wg/E0HyFXblY4Mxff+Y7PvLGzUN4v30vWLj9EdItyp+A4NP5SKH8kHnDIDEjP2wwrdlnNp2r3hKSJmWxq1BggrSfY3ERdG/J6EULPHTwKeoGwVqF0BarDxOS3Ww6Z4Kl1/INC2v8O/c69dHszUXEyazwDkXvg71LLJE5354wQ/EgJaEA/gVb9KIXenI8KmdxiuPlwJ592zhzaamLwecDqvzVfxEO1ZUOOwyJXIyElYRMPXO4TiLl8kMw/CVIKTuyHY8mW9nzwWl1IebYgf57hkJor6r5APu89E9511kplTzViph/SwYTlXEq/SqOui0KZFVSKcHFOZnRMvyYxI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCjAyeO+A0m1bPfAQWavgSmS0fm4D7iWs1wOM2Rmzno=;
 b=K0Th03ax0qMnWI1ODBLtvRuXwEwXk/oiD3BO71vuJ3LPun5LPz6UO5ANzjySt8kVRRJPJ/AUlRPPTQ/Ruuc8+foEoCpkMGhrAuMYNsk79A82e9jUjgWBgpFsycnXj42WyYTMueJ5ayYHr2d6RQf25ONcEB4HrCJRt8rjaMpEFi0=
Received: from AM7PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:20b:110::32)
 by PR3PR08MB5786.eurprd08.prod.outlook.com (2603:10a6:102:85::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 16:06:30 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::13) by AM7PR04CA0022.outlook.office365.com
 (2603:10a6:20b:110::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Tue, 25 Aug 2020 16:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 16:06:29 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:06:18 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Tue, 25 Aug 2020 16:06:15 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v4 2/2] xen/arm: Throw messages for unknown FP/SIMD implement
 ID
Date: Tue, 25 Aug 2020 16:06:03 +0000
Message-ID: <20200825160603.32388-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825160603.32388-1-wei.chen@arm.com>
References: <20200825160603.32388-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 026d899e-faf5-4516-244f-08d84910d80d
X-MS-TrafficTypeDiagnostic: PR3PR08MB5786:|VE1PR08MB4928:
X-Microsoft-Antispam-PRVS: <VE1PR08MB49285DA81EB2B827DC81DEF99E570@VE1PR08MB4928.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8XuaOSnvuNiVdu4lThM5VeXiBwp61ABM6nLkiJCx0fLJ6FfMcAzu9Gd9D2KSN171KDp8uXrY1VwZ43QT4/SXpO+QFpJ8gO7NwhQLRXYNemPkkFPraZq0IO76sAillmTpx/5w/1Xsm/YovASZe5IEtTbOsJXsli3hQm0TWjWnsQEYpC2ykL4gy7O3hT6eoS9ENkxTp6dB08sEfh9WRZzFcD+NkNFzhtIwdcTC+Tu6BMV79pWGG+DGKxryDht2zvnhbJXRzkr7UTHFj5ZNBghEOoBIAU/Qmc/we5eyqRAYOXRBBegy5KStIOPx2HklKFDPmVnTwnG0aMJSK4ExS/oE6ktegCnC4oohRbYzzdVuK5vmdChGiSRVaGZLdclq+bdAme7LDq0UgWiRB1/7fSccGQ==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(70586007)(356005)(82740400003)(47076004)(81166007)(426003)(478600001)(26005)(186003)(336012)(5660300002)(2906002)(82310400002)(15650500001)(83380400001)(8676002)(8936002)(4326008)(36756003)(316002)(110136005)(70206006)(54906003)(1076003)(6666004)(2616005)(44832011)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5786
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: b854f8ea-902f-4b66-a34f-08d84910d418
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dhJDy3PVxrQRY0am3VFrxYQp+t14+BWwcaqHC0AnRPeZL4vzNPhNoUEp6Ne+31yxZD13Tdxgov1xbubAhUxgE39ChFxfkuPb/kkZEw41AkVRjKZoCb/g/ZN2fDs61R2Y+0kzf0wRecfe0WNck0MX/ynd6/Dd7rsKr8jpi+yc5vTtLOvolObR7ryX5lejcs3RiT01kepnK0a+XgFgCrK9CLKh4W5Jyk6OZPVodPd4hOCG0gPsWK9/8XiO2iJ35Idw0YE3UFJLcBknqprj16sNtfP3d3/WPRnmzDtZs+pANmVpzUHOqmnGES35VdAZatKJ+QHDBkApOxYERNYfTIkAoQc31avxCNE8QxfaGpNMh3MGlcYImV4G6h7z2MqbOy2LUTkBiLCKLFjr7UlxqfO8kg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(5660300002)(6666004)(4326008)(15650500001)(110136005)(478600001)(8676002)(426003)(8936002)(86362001)(1076003)(83380400001)(82310400002)(47076004)(44832011)(186003)(82740400003)(70206006)(54906003)(2906002)(26005)(336012)(70586007)(36756003)(2616005)(81166007)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 16:06:36.5894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 026d899e-faf5-4516-244f-08d84910d80d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4928
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

Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
FP/SIMD implementations. Currently, we exactly know the meaning of
0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
features presented. If there is a value 0x2 bumped in the future,
Xen behaviors for value <= 0x1 can also take effect. But what Xen
done for value <= 0x1 may not always cover new value 0x2 required.
We throw these messages to break the silence when Xen detected
unknown FP/SIMD IDs to notice user to check.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/setup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7968cee47d..6a31eca984 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -133,6 +133,18 @@ static void __init processor_id(void)
            cpu_has_simd ? " AdvancedSIMD" : "",
            cpu_has_gicv3 ? " GICv3-SysReg" : "");
 
+    /* Warn user if we find unknown floating-point features */
+    if ( cpu_has_fp && (boot_cpu_feature64(fp) >= 2) )
+        printk(XENLOG_WARNING "WARNING: Unknown Floating-point ID:%d, "
+               "this may result to corruption on the platform\n",
+               boot_cpu_feature64(fp));
+
+    /* Warn user if we find unknown AdvancedSIMD features */
+    if ( cpu_has_simd && (boot_cpu_feature64(simd) >= 2) )
+        printk(XENLOG_WARNING "WARNING: Unknown AdvancedSIMD ID:%d, "
+               "this may result to corruption on the platform\n",
+               boot_cpu_feature64(simd));
+
     printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
            boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
     printk("  Auxiliary Features: %016"PRIx64" %016"PRIx64"\n",
-- 
2.17.1


