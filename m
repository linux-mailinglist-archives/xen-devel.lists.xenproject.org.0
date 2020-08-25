Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E89251649
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 12:09:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAVtj-0001gS-Kg; Tue, 25 Aug 2020 10:09:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BGsN=CD=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kAVti-0001gE-4u
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 10:09:46 +0000
X-Inumbo-ID: a973ef30-4ac3-483a-9fc1-fe0aef4acb1c
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a973ef30-4ac3-483a-9fc1-fe0aef4acb1c;
 Tue, 25 Aug 2020 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxjuW76QYQnnm39E3PPg+txyPyA7XTzDaE5mmk/F3KI=;
 b=YEoZqNxS3TQv6zi6fPu3EK5SAATiKSYv3Kad/zCOzZ+0EX/1lFH8TV2Im9MV5ZlkJ4nPJ4OAJCpT+lFuF0twUhGEIyG6mDV4FfOEtnsgS9W4wnlePDlvBODSIBrvM62nKg4dNsEm4y3PHcpyULBJf37wwcA+4+H9DaAi/5kb6KU=
Received: from AM7PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:20b:100::15)
 by DBBPR08MB4363.eurprd08.prod.outlook.com (2603:10a6:10:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 10:09:40 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::36) by AM7PR02CA0005.outlook.office365.com
 (2603:10a6:20b:100::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 25 Aug 2020 10:09:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 10:09:38 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Tue, 25 Aug 2020 10:09:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10f20ec28e4e27b8
X-CR-MTA-TID: 64aa7808
Received: from 0a8093308491.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 989A7C9B-B79C-40C5-9858-E5E6D649604F.1; 
 Tue, 25 Aug 2020 10:09:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a8093308491.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 10:09:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFqhG7GNGxZ96egT2V0d2I2JgPl22YmZIXYdr/f5U1gnF8DDoKHs14QMNu8ndFJ06kRldqsiqeOLPditMbrIgb6WUM8Fxz0X/N4qBtRlUFSN0LooQciMR5E38HMOWrf7qSMJmAROanxZbmSlzcy/d1e/IJ76CEPsap/ltY7Eso35z8M4ixDbJqBHqErAHnWnFTCfImAGdhoZkIzoX1JfmkI1n1i+x5d9iVuZQ/foT+7dPsLI4geyRvFdrcsd+Vy9n0XUf46biHtpJahRDOTnH/E5LB0cjet1r/UIA50IUdbCK1Lb/rmV7XYrvvPHwDDFy3wXZS/CJnkzbmZBIVir7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxjuW76QYQnnm39E3PPg+txyPyA7XTzDaE5mmk/F3KI=;
 b=Csc0nWR+0pBPBaA8+XFsHLuLyEG9661lvUiskxAq0Lve6BxC3OFkGJ6ASNc+PWhp7l0YDRT5KaYyNCFH9KXhFU/MW6qcjdSqoI2wyXhgqj1P8QoP6CTQFpxJFnnwnFsLk2OITmogEfXnbACK8ZXpFTfi535k8OSMgQnOiNA2Zro9NRMzm43DbzBJs13i+jR5L0OpTpvcKLT75mn6czWAc+oAY6bEhA7y1gmwWQpyuHKARYce4YP1MeeeO7O2sqyRHysOO7ONhfI+t94E76xrhupdWnonHcpF4QGB7RblN2g5f6JDthgU62+t3TrwRo8u17U5ENbZ05BUTByVBG178w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxjuW76QYQnnm39E3PPg+txyPyA7XTzDaE5mmk/F3KI=;
 b=YEoZqNxS3TQv6zi6fPu3EK5SAATiKSYv3Kad/zCOzZ+0EX/1lFH8TV2Im9MV5ZlkJ4nPJ4OAJCpT+lFuF0twUhGEIyG6mDV4FfOEtnsgS9W4wnlePDlvBODSIBrvM62nKg4dNsEm4y3PHcpyULBJf37wwcA+4+H9DaAi/5kb6KU=
Received: from AM6PR0202CA0064.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::41) by AM6PR08MB4327.eurprd08.prod.outlook.com
 (2603:10a6:20b:ba::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 10:09:12 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::55) by AM6PR0202CA0064.outlook.office365.com
 (2603:10a6:20b:3a::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 10:09:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 10:09:11 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 10:09:06 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Tue, 25 Aug 2020 10:09:03 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v3 1/2] xen/arm: Missing N1/A76/A75 FP registers in vCPU
 context switch
Date: Tue, 25 Aug 2020 10:08:46 +0000
Message-ID: <20200825100847.27988-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825100847.27988-1-wei.chen@arm.com>
References: <20200825100847.27988-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 813b3cc1-4f1f-4ce0-35b4-08d848defa22
X-MS-TrafficTypeDiagnostic: AM6PR08MB4327:|DBBPR08MB4363:
X-Microsoft-Antispam-PRVS: <DBBPR08MB436379EE3EC8228D8F72FB6A9E570@DBBPR08MB4363.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 9JsKiqe1qBsHSKO6DCaw4dUvl+Ldn+p3nBBr3WEkpAgyfBH6neaEVpzv7Psg38V7EpAo6HfyZW7eyL5a0zCqTgmrVGYtuumXbTFMhv8z+THwty936/OjJflUL0kFOSrsLGrfUqlUnG7fKRCF5uTmARKBPQfQk3KXS/VNYAUwh0ilQl9UNw4p8wdMFe0A7+JC+S1SpEQOKvdGnajJl75lUuwjGtbfTz78O1PySebDCyJCeOB8lx0UuafbOSp9BMz+W7WKsatZQdMw0MiqVWpBn+hu1A5dHjGyh/3ZxdDF6orTDXNeTwmQrFE3HQy4E+J+8SI261/iSA22CJspcVC42wF0D6/R08StjzTcKMIDwTn7UEUtal+4vcH4ZHJZhHRKHf3hko3f8lRX2utpU6GuPw==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966005)(336012)(8936002)(83380400001)(1076003)(44832011)(70206006)(6666004)(5660300002)(316002)(70586007)(26005)(186003)(82310400002)(426003)(36756003)(478600001)(54906003)(110136005)(47076004)(356005)(2906002)(81166007)(86362001)(82740400003)(8676002)(4326008)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4327
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 57cb4991-894a-4045-2560-08d848deea12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1CeOokTAH0/Ifgwqxnurfn5UDL8yp5bWiqP35USQs4ELpgcwO1WRiNqFoQiRFv2ffigkH6iSRCPtOi7AAabBern+JjZqS7Zp83skePQh/gK8CKhmqBvJTOCLkBENoQyWTM+tvGhjBH7LEUqvXsNEqIACz5ZKSOKWG/eWPxXEMu3+6D1T/hdcgiZt2STazozWVzh7H3auYS/AsdJmNYhiHEIzop+pY3uw+oFjjEgf7wDGteNBdiCv31B9Yb2kLZdLMOyNTM9Ju7aWXAvoTkWE2x6b1KQ2xOZQIiFwk9Vl3/TYHD/CsDa+uQO7oYrMrBwyB5IIqFtlszmNAKYp4LNyUqDxUCccbcYdhb9uXu6dWlOdkpPNAMWxzsp919dSxWfWrQQuNizWaCXiwCUXw7RPig==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(82740400003)(26005)(44832011)(81166007)(82310400002)(2616005)(47076004)(316002)(426003)(36906005)(8936002)(110136005)(4326008)(5660300002)(54906003)(186003)(478600001)(1076003)(86362001)(6666004)(8676002)(70206006)(36756003)(83380400001)(336012)(2906002)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 10:09:38.8391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 813b3cc1-4f1f-4ce0-35b4-08d848defa22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4363
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


