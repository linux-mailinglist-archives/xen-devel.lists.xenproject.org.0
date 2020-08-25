Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF7D251648
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 12:09:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAVtX-0001eB-9l; Tue, 25 Aug 2020 10:09:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BGsN=CD=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kAVtV-0001dt-Sw
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 10:09:33 +0000
X-Inumbo-ID: dbbdd7bd-e0d3-4ca1-9b38-30e9d55da82b
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.61]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbbdd7bd-e0d3-4ca1-9b38-30e9d55da82b;
 Tue, 25 Aug 2020 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2/X1lxOqtNOoaoNqkOIqK3fV/KCVSJ8dBxu2KBfPFQ=;
 b=W88BlXob1pBoJSUcZgF2t9nuz6aW1XiychpUiMtHpDaTa5ZAfqIY3D8tOYHlIkf7wZN4k8i6juoTP+3u4TpBjxRp0eMxHHTwieFi/jCR3mKHDK8vq9s1ZdsIxkg2JQbAPBIiITUef+f0AI/kYdDDJKFQ0T9qpwNgxGst9oR1iuM=
Received: from DB6PR0301CA0008.eurprd03.prod.outlook.com (2603:10a6:4:3e::18)
 by AM5PR0801MB1985.eurprd08.prod.outlook.com (2603:10a6:203:4b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 25 Aug
 2020 10:09:29 +0000
Received: from DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::9a) by DB6PR0301CA0008.outlook.office365.com
 (2603:10a6:4:3e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 25 Aug 2020 10:09:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT063.mail.protection.outlook.com (10.152.20.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 10:09:28 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Tue, 25 Aug 2020 10:09:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4892738f9bc7c9f1
X-CR-MTA-TID: 64aa7808
Received: from 6f3eabee282e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF79E2F0-4405-4FB8-B210-24DE6C410DA9.1; 
 Tue, 25 Aug 2020 10:09:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f3eabee282e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 10:09:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiBVjyYRsfYl81A3dFIoGZRoMCoCu/pQBE0Fxt2iswRd+92uMUJsHn77rmnAN1/0jV+5dcEt/WHQJ2xVnFbAGfeRzjJ5QyJQxL2UFu6c3L2G2e9Xcf48Q+N+WHT40iK2pjYFs+HMvukQKvjUgoiyxoMLpy8A1nN3k+lz6tLBGu1+/17IG7YtsinVgMkrmo2Yt97MO2vG51d47D5/ZKKi/mQBuZsHXDILzPIINaK2MGkQhP75RfFRcrWCRijjVGiJoqVMrhOVWOMVOghxIRreVn2kHugilQc2S57oiyxbhGfHNw0+k0YDTNfmGhaqucqJywNizoFgevvEfSls0DfOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2/X1lxOqtNOoaoNqkOIqK3fV/KCVSJ8dBxu2KBfPFQ=;
 b=SyqouUFC0lcNAImEr8SJOI0M94/SAAw+R3C0DGcZFdQeVQ2FPv09N2IGNrURHXqu0FhY0ktixUwirZrmto7ILYld2a8YUQLhDMtPue9cPYD0rFYrvzkiGlZWWslANuZj6QY5ZlXa8+jjkUlz2iquwbEaiEt7HXglppsfNsmHUI1FOhGC3/mBUjQoSRPRUrYx1ugo7rIjNiXG/qFiLopqpQtoNLxZ219HhtCnZ8otXvjytM3UCb+YawIP6NyjYCPNkwawZeH2+nwWlSaWlbbVtddDkY76CzshpVaTvCyrjb+juN/YiskeLFCRWdb1cKjr6Q4Fv51K2spgmlGDDVPH3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2/X1lxOqtNOoaoNqkOIqK3fV/KCVSJ8dBxu2KBfPFQ=;
 b=W88BlXob1pBoJSUcZgF2t9nuz6aW1XiychpUiMtHpDaTa5ZAfqIY3D8tOYHlIkf7wZN4k8i6juoTP+3u4TpBjxRp0eMxHHTwieFi/jCR3mKHDK8vq9s1ZdsIxkg2JQbAPBIiITUef+f0AI/kYdDDJKFQ0T9qpwNgxGst9oR1iuM=
Received: from MR2P264CA0105.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::21)
 by PR3PR08MB5804.eurprd08.prod.outlook.com (2603:10a6:102:83::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 10:09:21 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::58) by MR2P264CA0105.outlook.office365.com
 (2603:10a6:500:33::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 25 Aug 2020 10:09:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 10:09:20 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 10:09:11 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Tue, 25
 Aug 2020 10:09:11 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Tue, 25 Aug 2020 10:09:06 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v3 2/2] xen/arm: Throw messages for unknown FP/SIMD implement
 ID
Date: Tue, 25 Aug 2020 10:08:47 +0000
Message-ID: <20200825100847.27988-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825100847.27988-1-wei.chen@arm.com>
References: <20200825100847.27988-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ba8c812-c575-4d4d-8746-08d848def3c4
X-MS-TrafficTypeDiagnostic: PR3PR08MB5804:|AM5PR0801MB1985:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1985E3D23C888D4D5ECB59609E570@AM5PR0801MB1985.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: N6tawul2ZwRrBAN1EAou4pTE4zLJ63PkNEF1HAPg1oipTEymKC3wjx6UVYAX53zFjSryXDBbFlwnpjTKvekYYfLZoKUw/v+4f+XfJFSyQ1cTQtSbvwkl8Bx/+NgM70OCk8iTjhQlB8/A3obuDErssHATDkIYE59sUa8xXW/LpoxrVLbz/LxX2vRbx+Q8wg4D2t4LP39CkDP3MBe/s0uIVxinoydC9Oyw2ybjmWwdKbqdbIPUMt7Tx2hpjf4qd1TiTBZvOaH22WuQhz6wn2y920FLnfiTQNK6V6agscFScXHJzRgWWBKhQnaBbpl4BwhQXsrDm8rwUKIUJQk8D5wYSb0u4ZjAD5vDfDZvyHglUT4YGo+kihDlY6J6XqxrRju0qJCHgMMkRgWyRMF/TDfYYQ==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(83380400001)(26005)(2616005)(186003)(44832011)(336012)(81166007)(82740400003)(15650500001)(5660300002)(426003)(47076004)(356005)(54906003)(1076003)(4326008)(70206006)(110136005)(36756003)(316002)(478600001)(6666004)(82310400002)(86362001)(8676002)(2906002)(8936002)(70586007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5804
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1c0eb9e5-b1f6-4673-94b3-08d848deef60
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZrvFk/DUI1rx3gCt95Fvm3uD1lcLoXq9kWYQq6OrJM4wQVUa/DhSZanTerGwdGSIol8e4bVWZYPNg/dkC454GVaT6RT4Oamdwrc1dldx/6OnTEr2xnn6Z7BCQKvgSjjnxERTuc+Lhb8O/kSWpCLGEYZ/BQPXFhBDnyfDaZku8ZkES+BsKCTwRXuHeaYmXlEKXFupOQ/E0iNpkQoD/SGsFzUc8A1l9JlQEvbGMWji7L2L7fFuUM3kl844GINqU5V9DCOq54aQj+txP5E4dZuPuIlwaF7FiBKDKl5gedK4Gfdm5zZdcSa9t2d7UcYAsnPB+TUFMlCe6LTXBJvXHZAT+hnT+mwqXyYGhpoUkk+pBcDX3LI9tYouAQgZ4N2kzzv1KwnbIxC69DKsbYD28gELQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(54906003)(44832011)(2906002)(336012)(186003)(26005)(2616005)(5660300002)(426003)(316002)(110136005)(81166007)(82740400003)(47076004)(36756003)(70206006)(15650500001)(70586007)(478600001)(4326008)(83380400001)(1076003)(8676002)(8936002)(6666004)(82310400002)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 10:09:28.2537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba8c812-c575-4d4d-8746-08d848def3c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1985
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
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/setup.c             | 12 ++++++++++++
 xen/include/asm-arm/cpufeature.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7968cee47d..ef39ce1ec6 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -133,6 +133,18 @@ static void __init processor_id(void)
            cpu_has_simd ? " AdvancedSIMD" : "",
            cpu_has_gicv3 ? " GICv3-SysReg" : "");
 
+    /* Warn user if we find unknown floating-point features */
+    if ( cpu_has_unknown_fp )
+        printk(XENLOG_WARNING "WARNING: Unknown Floating-point ID:%d, "
+               "this may result to corruption on the platform\n",
+               boot_cpu_feature64(fp));
+
+    /* Warn user if we find unknown AdvancedSIMD features */
+    if ( cpu_has_unknown_simd )
+        printk(XENLOG_WARNING "WARNING: Unknown AdvancedSIMD ID:%d, "
+               "this may result to corruption on the platform\n",
+               boot_cpu_feature64(simd));
+
     printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
            boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
     printk("  Auxiliary Features: %016"PRIx64" %016"PRIx64"\n",
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 10878ead8a..a32309986e 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -16,6 +16,8 @@
 #define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
 #define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
 #define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
+#define cpu_has_unknown_fp   (cpu_has_fp && (boot_cpu_feature64(fp) >= 2))
+#define cpu_has_unknown_simd (cpu_has_simd && (boot_cpu_feature64(simd) >= 2))
 #endif
 
 #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
-- 
2.17.1


