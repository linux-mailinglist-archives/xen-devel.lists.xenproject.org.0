Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32657255311
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 04:35:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBUDr-0001c1-NJ; Fri, 28 Aug 2020 02:34:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UB2A=CG=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kBUDq-0001br-4q
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 02:34:34 +0000
X-Inumbo-ID: e20e1aba-7ec7-4812-8d4a-d23ffbdb3fa6
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e20e1aba-7ec7-4812-8d4a-d23ffbdb3fa6;
 Fri, 28 Aug 2020 02:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdFAtC7rHt5MGNEfHLJJ1iFsBoyoB1+S+Y6Ost9gnDc=;
 b=CmtxahZZzndOj+nImjFEc5rwrN+ZZ559o7ZXHklICbsyYvu0GW7+ORlgolMcFBmbfx1EdyoUwQqP/h3bXRaYvwJ69s/zzeg+AvQ/QaNJgfSI8cR/QGotAJW7Q2hf/qDbLMCsZ9Jfx/LN2Gvzn+8Bl/EmR3nn2Fdr7PNPyHDzr30=
Received: from AM6P193CA0064.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::41)
 by VE1PR08MB5149.eurprd08.prod.outlook.com (2603:10a6:803:107::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 28 Aug
 2020 02:34:29 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::44) by AM6P193CA0064.outlook.office365.com
 (2603:10a6:209:8e::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Fri, 28 Aug 2020 02:34:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 02:34:28 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Fri, 28 Aug 2020 02:34:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e22f6031dec2d77
X-CR-MTA-TID: 64aa7808
Received: from c647110cea99.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B19278C0-C7A9-4E16-9B17-658B346AC3B8.1; 
 Fri, 28 Aug 2020 02:34:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c647110cea99.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Aug 2020 02:34:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmURRurzN3fxymG5koNmNAOZYJeMOijodI8PWF7FnmK8oV2AKp0MOwhFKMuQCcg/I9TX5c0M2aM2979OpK3T+bcM6umu45oKSyl30VotgCBdKu15nSgqYvWjFEjIfF0lZ8sG1DpCB6WVWtS4D2wBYhoflzoUdC2rVgHYC725BVd2ZMmTnEGAwXLlblZnTnyEnW138oE5M9Cf+TaUGMqo3deru239pooZNUeylZuiI9uj3qWej1oIhG8Xka7oHVQLG4BuWioiI+1A7VoHWK2kUWljmVE5VnEO9xPcBFohvYoBXC1V6jcj2z2qYF/M5WLJSqMn3QpQrudYAO8/voXdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdFAtC7rHt5MGNEfHLJJ1iFsBoyoB1+S+Y6Ost9gnDc=;
 b=AMkCG5AOjW1jUocZInbf2vboM5vyy32dgGpRuq8ukqEIsi1YzMXV92Lplh6NlV/UxGFstwTcOGxAZe3AKFuYFhYC0Pt963YCtDHaiXbFKrrBUaUa/ILfWqZhGkWEqGCP/5xD9anECUQSI0pyqp37czStxGxBWnjJxLJ9m/AzVEBjWm+eK9Y7oq/N9EjtmFqt0mhuT+1qAa6stqaY7qhZNr/znvnZ57uvkAnGaP6HNkWdAOBeWRh3L5hKKvzq/C9MbbZXsPXDeDon830CSRaZA3DnKdS4J7XzNdxIXwz2VmTiGCH61JsLtGc/deNvJ+NRVKEN1VswihjQztlQkvjclw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdFAtC7rHt5MGNEfHLJJ1iFsBoyoB1+S+Y6Ost9gnDc=;
 b=CmtxahZZzndOj+nImjFEc5rwrN+ZZ559o7ZXHklICbsyYvu0GW7+ORlgolMcFBmbfx1EdyoUwQqP/h3bXRaYvwJ69s/zzeg+AvQ/QaNJgfSI8cR/QGotAJW7Q2hf/qDbLMCsZ9Jfx/LN2Gvzn+8Bl/EmR3nn2Fdr7PNPyHDzr30=
Received: from DB6PR07CA0170.eurprd07.prod.outlook.com (2603:10a6:6:43::24) by
 AM6PR08MB5142.eurprd08.prod.outlook.com (2603:10a6:20b:d4::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.26; Fri, 28 Aug 2020 02:34:21 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::8d) by DB6PR07CA0170.outlook.office365.com
 (2603:10a6:6:43::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.5 via Frontend
 Transport; Fri, 28 Aug 2020 02:34:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 02:34:20 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 28 Aug
 2020 02:34:18 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Fri, 28 Aug 2020 02:34:15 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v5 2/2] xen/arm: Throw messages for unknown FP/SIMD implement
 ID
Date: Fri, 28 Aug 2020 02:34:04 +0000
Message-ID: <20200828023404.28638-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828023404.28638-1-wei.chen@arm.com>
References: <20200828023404.28638-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88674923-cb4c-4611-279c-08d84afae358
X-MS-TrafficTypeDiagnostic: AM6PR08MB5142:|VE1PR08MB5149:
X-Microsoft-Antispam-PRVS: <VE1PR08MB51497A43CD93AF56997E78CB9E520@VE1PR08MB5149.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5vzVdR71D5tjK4wFllD2LHC9mGtnvzOjZcplPY0t2S0JE+myzjI8JkDznqjwm2ZThg95FTzUGTfRBhYEMREJLFqDBr6jUgvXdOZwZFEZXCjFE/NGD3YB5dC0IDLMmb03Jq+M8l3o2QHrHw9bDppv2gSbQWkEFU1PX45Kex98/s77WOAV/4HQlcdmTCCkSSg1BogEbzqg820HKxrCoqW2XT8/J7H10oCTEWO/UmGQ62N3kILTjvGm2smtnVWIHXd4YyCl31t0vxUszz5c3cZvGmIY546bfCZz+jE1ji2qi6dgu0JfYrMRhvBrlKg7GXV3OGGoF409X5gbVzheELIm+dJw26LZJyk+VRfJdezsw9VCdtD9zQJyHcaTMErYVDP/d7d2r4f4tw/WSHjb16+q/A==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(86362001)(36756003)(8676002)(336012)(6666004)(4326008)(2616005)(44832011)(1076003)(83380400001)(82310400002)(26005)(186003)(15650500001)(426003)(8936002)(81166007)(54906003)(478600001)(110136005)(5660300002)(82740400003)(70206006)(47076004)(316002)(356005)(70586007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5142
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 466dc1bd-1bea-4bda-d376-08d84afade93
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dMvuXO0UOOR4OBm1IX+BZevOnUWtJnwG8Gcz9Izjrxc2qBHQ3JE/ctSQWut8bU+TnD2cbYRpCupz4cjIWkj4JwccTwcKwWGQPvJsh1KmRMSl29UzFx5z8ByyvPE2Voqr13shtdZ3tzMLufhIPCWMpFffHCVKldXPClSoBRHRyrHKGefyGYw3oxioomDr9ZY97EEEQiQAI+ACQDJ//ZyGlRcl4PnBeAORodatXhs7xoOyIpPATxR+yrEocPj/Ac5tgrRECOETKcvTtCzR6KbWJPClnpRtPX3nCP2cAyTboJuXvvQu2JRbDibIGEOnRRL6wlbYvg46QQ8XacSilRTmqadZsmPm+ouaAA87VxZ/Qm1gGCfLeMVbCK0Ir1gbgOUj/bxympNQbIZR0m7sjnCMhg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(46966005)(70206006)(316002)(2906002)(82310400002)(83380400001)(82740400003)(36756003)(5660300002)(6666004)(81166007)(4326008)(426003)(70586007)(44832011)(2616005)(186003)(15650500001)(86362001)(26005)(8676002)(8936002)(110136005)(478600001)(36906005)(47076004)(54906003)(1076003)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 02:34:28.8260 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88674923-cb4c-4611-279c-08d84afae358
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5149
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
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/setup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7968cee47d..f16b33fa87 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -133,6 +133,18 @@ static void __init processor_id(void)
            cpu_has_simd ? " AdvancedSIMD" : "",
            cpu_has_gicv3 ? " GICv3-SysReg" : "");
 
+    /* Warn user if we find unknown floating-point features */
+    if ( cpu_has_fp && (boot_cpu_feature64(fp) >= 2) )
+        printk(XENLOG_WARNING "WARNING: Unknown Floating-point ID:%d, "
+               "this may result in corruption on the platform\n",
+               boot_cpu_feature64(fp));
+
+    /* Warn user if we find unknown AdvancedSIMD features */
+    if ( cpu_has_simd && (boot_cpu_feature64(simd) >= 2) )
+        printk(XENLOG_WARNING "WARNING: Unknown AdvancedSIMD ID:%d, "
+               "this may result in corruption on the platform\n",
+               boot_cpu_feature64(simd));
+
     printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
            boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
     printk("  Auxiliary Features: %016"PRIx64" %016"PRIx64"\n",
-- 
2.17.1


