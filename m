Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4424F188
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 05:29:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA3AN-0004fm-6S; Mon, 24 Aug 2020 03:29:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ot5I=CC=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kA3AL-0004eS-Dg
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 03:29:01 +0000
X-Inumbo-ID: db653abf-4213-4d15-be38-197771c511c4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db653abf-4213-4d15-be38-197771c511c4;
 Mon, 24 Aug 2020 03:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCRNMai18oICp1g78MOkm0i99zbDOHtAX7WyMRefru4=;
 b=Z/VYTaApnlrkJ9dEuR4TgyEDloj18fO+yBiqrmiG1C7tdA43HGMjSJENMxelkwVLWsCqfS+GhDiQMTh5K5F+W75hXh+6Th85Y1/ZkUryoTs33V/hIi6a3RqKgjPqrBAXfjMntVNRVrMuUqR7a9ZGcohQhDP2fGPXCDAMmd7z7KQ=
Received: from DB7PR05CA0052.eurprd05.prod.outlook.com (2603:10a6:10:2e::29)
 by AM7PR08MB5317.eurprd08.prod.outlook.com (2603:10a6:20b:101::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 03:28:54 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::2b) by DB7PR05CA0052.outlook.office365.com
 (2603:10a6:10:2e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Mon, 24 Aug 2020 03:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 03:28:54 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Mon, 24 Aug 2020 03:28:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9144900e4aa8f0e
X-CR-MTA-TID: 64aa7808
Received: from 55bd7e3e9c10.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 908F2E21-1BE4-4CB2-BE5B-ECCA4033C068.1; 
 Mon, 24 Aug 2020 03:28:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 55bd7e3e9c10.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Aug 2020 03:28:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mrtt4Uk+uc3P6Lg9tUAwWkOJJgA+20/ShJCsdB1tzA2zN9TAQSbx1/lnxBKlv1aWMpxLJ/5MWLc8araoNwH7/fnPDsBu11NMHM0o2d3keNyvMBJWWdqkPFkhkM4C0yDNg6HbJEV/srIAqSQy4M9v7Lv1hlz4AO72YNh5cqfFdC7EQzglm2VpuAbsWMAWwY9z33jqfhL8dvKpIsEox4CXxMXXCXattSGMVdW9B284kbgkAOV4Hi2syikMKsUv7yJMbhYNTsf9KhShZNzzhv+h/TDIxADAkBix6F1tr8YVrz4rBM+n8lr85jmWWb2D5oQqYFaktIIB/po/A8Tl7YgarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCRNMai18oICp1g78MOkm0i99zbDOHtAX7WyMRefru4=;
 b=j2V/2ZTz2JiSDou4owMmkZVYkUH8JPtcOvY0IwD6pWGS04Bg9iGdTFLE0aeNwXPwLJR+pRzXtezRaySG7MLg7+KjWo86yOhTHbVT44CjnOk99vI903eltTg4gDXsLNhPkXP+5P/ZrjLJ3GD8k6TWzuTbmBZZl4q63I90su4LVjGU1dN2n7J4g0017Kp/Ky7A6Rpk08Eax7rEDj6BBw5fgRWkFfWvqTTdT+F5iW37xg9pBETevfnxGP3hVlBJQjbTyJcqvFPkOyDKBKcLwKEobh4RNCUJCPfl4z1mOGNUaXcGS5Mfu/9+nI81ChGNcsE3l0TNJZe2mvHntWCiLSLNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCRNMai18oICp1g78MOkm0i99zbDOHtAX7WyMRefru4=;
 b=Z/VYTaApnlrkJ9dEuR4TgyEDloj18fO+yBiqrmiG1C7tdA43HGMjSJENMxelkwVLWsCqfS+GhDiQMTh5K5F+W75hXh+6Th85Y1/ZkUryoTs33V/hIi6a3RqKgjPqrBAXfjMntVNRVrMuUqR7a9ZGcohQhDP2fGPXCDAMmd7z7KQ=
Received: from AM6P195CA0059.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::36)
 by AM6PR08MB5237.eurprd08.prod.outlook.com (2603:10a6:20b:e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Mon, 24 Aug
 2020 03:28:47 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::b5) by AM6P195CA0059.outlook.office365.com
 (2603:10a6:209:87::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Mon, 24 Aug 2020 03:28:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 03:28:47 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2044.4; Mon, 24 Aug
 2020 03:28:46 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Mon, 24
 Aug 2020 03:28:45 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Mon, 24 Aug 2020 03:28:42 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v2 2/2] xen/arm: Throw messages for unknown FP/SIMD implement
 ID
Date: Mon, 24 Aug 2020 03:28:25 +0000
Message-ID: <20200824032825.18368-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824032825.18368-1-wei.chen@arm.com>
References: <20200824032825.18368-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca215c0f-ac23-4983-29b4-08d847ddd404
X-MS-TrafficTypeDiagnostic: AM6PR08MB5237:|AM7PR08MB5317:
X-Microsoft-Antispam-PRVS: <AM7PR08MB53175382EE40309FC8A14CFB9E560@AM7PR08MB5317.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:820;OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BloRpppD5GedbW79R4Ao7vY0VsT6bbIeQJgQe2Cxrj3Vartgh8PcuTOLurmzmpraNsQBiZJYeTs3E1tTRxvsJnXStU9cRspi3IIz5Vd1NL8PXdUKItNkzWP/MOuIFSdop6tV5Q2cmI1IYCyjWo2MIRgVtzcMlfpWulAKbI245vTqwp1SpZBg2HQbUfVKs8dFNm5ILHhMKdVhcwuSKBUvolhC9I3UkPavbVIimHRvYParco6Qd66VsfxzBJ7T7tFpRSv+BL+i4FWr9IRYf/yvQE8E5UcDpaeuJyQM5pYuqhrEEjlj1n8sX28hIClnG+oY3fHKBz3kDprPMYPgl0n1T+6vA/RjxF5M+/8ZbKuxQ+gaR41dYK8zxff9QRTdIvQHCyYD407wUfQwv6bwGTA1yw==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(376002)(136003)(346002)(46966005)(110136005)(5660300002)(4326008)(54906003)(36756003)(2906002)(44832011)(478600001)(1076003)(6666004)(70586007)(70206006)(86362001)(356005)(2616005)(47076004)(336012)(26005)(186003)(15650500001)(82310400002)(83380400001)(8936002)(82740400003)(316002)(426003)(8676002)(81166007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5237
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5792733a-f070-4ee9-88d0-08d847ddcfc8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OwcySJ8QeOxz3l6OyVLgdpWycLDMxl5MMq2W2bsdBXDjuo6/N9J7w8ElULiM/ySvzkX28Fhkt8QtEnYcFcUY0L/MFV/Qj/jHYJ7zipetncZs1Va1VP1cfnU0mNv/KlapHQ7pvfrzFsHVjAVi45wwCaECu1cn4rPF9xrqzzhX5OtuFv+EZG1cSFE2/nbhg98yZYq56N+JSxOkeVz6wr21c9T5T8f/YSJCP/1axifS7p8mrgBG9LuvrTCpWkUNtHNiBYq+GeGzDq+lXbqaUOrCbZIqJWdp8yCv5jQGFNCVYZ3yWGXraRrsJ6HCoNaEmopsU9OGmF/suBY4MOJRexKWFcktzOxa+rrFn44mBmoOpC42dYxqmtkjfradwuBHAjIL700Qvm7vUDWv34RJBvF0Ig==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(46966005)(4326008)(82740400003)(70586007)(82310400002)(2616005)(426003)(86362001)(6666004)(70206006)(83380400001)(44832011)(336012)(36756003)(5660300002)(8936002)(1076003)(8676002)(2906002)(186003)(316002)(81166007)(478600001)(26005)(47076004)(54906003)(110136005)(15650500001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 03:28:54.3242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca215c0f-ac23-4983-29b4-08d847ddd404
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5317
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
 xen/arch/arm/setup.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7968cee47d..c7802d0e49 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -99,6 +99,28 @@ static const char * __initdata processor_implementers[] = {
     ['i'] = "Intel Corporation",
 };
 
+static const char * __initdata fp_implements[] = {
+    "Floating-point",
+    "Floating-point + half-precision floating-point arithmetic",
+    "Floating-point Unknown ID 0x2",
+    "Floating-point Unknown ID 0x3",
+    "Floating-point Unknown ID 0x4",
+    "Floating-point Unknown ID 0x5",
+    "Floating-point Unknown ID 0x6",
+    "Floating-point Unknown ID 0x7",
+};
+
+static const char * __initdata advsimd_implements[] = {
+    "AdvancedSIMD",
+    "AdvancedSIMD + half-precision floating-point arithmetic",
+    "AdvancedSIMD Unknown ID 0x2",
+    "AdvancedSIMD Unknown ID 0x3",
+    "AdvancedSIMD Unknown ID 0x4",
+    "AdvancedSIMD Unknown ID 0x5",
+    "AdvancedSIMD Unknown ID 0x6",
+    "AdvancedSIMD Unknown ID 0x7",
+};
+
 static void __init processor_id(void)
 {
     const char *implementer = "Unknown";
@@ -129,8 +151,8 @@ static void __init processor_id(void)
            cpu_has_el1_32 ? "64+32" : cpu_has_el1_64 ? "64" : "No",
            cpu_has_el0_32 ? "64+32" : cpu_has_el0_64 ? "64" : "No");
     printk("    Extensions:%s%s%s\n",
-           cpu_has_fp ? " FloatingPoint" : "",
-           cpu_has_simd ? " AdvancedSIMD" : "",
+           cpu_has_fp ? fp_implements[boot_cpu_feature64(fp)] : "",
+           cpu_has_simd ? advsimd_implements[boot_cpu_feature64(simd)] : "",
            cpu_has_gicv3 ? " GICv3-SysReg" : "");
 
     printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
-- 
2.17.1


