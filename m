Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D45387132
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128618.241481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisBE-0002BY-20; Tue, 18 May 2021 05:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128618.241481; Tue, 18 May 2021 05:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisBD-000297-Rz; Tue, 18 May 2021 05:22:07 +0000
Received: by outflank-mailman (input) for mailman id 128618;
 Tue, 18 May 2021 05:22:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lisBC-00019F-6q
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:22:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::61f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 539c1e41-0f1d-4ab4-8353-6e8862bf21ca;
 Tue, 18 May 2021 05:22:00 +0000 (UTC)
Received: from AS8P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::6)
 by AM5PR0801MB2018.eurprd08.prod.outlook.com (2603:10a6:203:43::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 05:21:58 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2::4) by AS8P251CA0022.outlook.office365.com
 (2603:10a6:20b:2f2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27 via Frontend
 Transport; Tue, 18 May 2021 05:21:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:57 +0000
Received: ("Tessian outbound ea2c9a942a09:v92");
 Tue, 18 May 2021 05:21:57 +0000
Received: from 5236c737a9ab.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA7AF26D-EB39-43EE-87A6-756D2538B304.1; 
 Tue, 18 May 2021 05:21:50 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5236c737a9ab.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:21:50 +0000
Received: from AM6P194CA0032.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::45)
 by VI1PR08MB4015.eurprd08.prod.outlook.com (2603:10a6:803:e1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 05:21:48 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::10) by AM6P194CA0032.outlook.office365.com
 (2603:10a6:209:90::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.32 via Frontend
 Transport; Tue, 18 May 2021 05:21:48 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:48 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:21:35 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 18 May 2021 05:21:33 +0000
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
X-Inumbo-ID: 539c1e41-0f1d-4ab4-8353-6e8862bf21ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6ATApPmkJrCTf9a/bdU7n8KOS835CGS4AwJ5jf2OAQ=;
 b=FtAwzZyfqQX6TCwB96aAijXOtcr2L/e245WtP8F4vkcoCkanGYmwJHzqzAsvSu14CKU1FVs6IKbBF+wPpAx0067f+FiPz2azGpke+cMPOWUwZTa5HIRTuBMVYvLE82WZy7bjcbj/asGnm5aflWUsKwKs5R0g/RJuTYKC7hRGyH4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97192d34f5350264
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTHnQ07fRNS5BlvlqHDqyskc/9S0UEz6GUcdpGuapbw7glfOX5H7aGelZnGk6D4BSmAwMnFEivcUwz/YIQxATxATrZCj12JSkOflDxTLktQXWjg+GTeK4tDVX60nL7eoull+KpXL+lHF8LAwVRLgpLddxEdoMEsvYD5Uf5DSxwvnc03SZPWAZMnJfzuNB5Uksuwj7+6TsssAc4I+Csd5q6qO8RgJ6c6wg0OwdgTwxG9M96NgU8tM9dVnWASjLWSgtKym1RRvVlToNI6X4pAizb9e06o5uSgkpM1Un5m3Yfoon0+RE8t3gerc6k3zChtbxj9TmFcisDTBr32gimMkhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6ATApPmkJrCTf9a/bdU7n8KOS835CGS4AwJ5jf2OAQ=;
 b=lvDdsQKErF1AEelc10ZAdO00PEOqtgNwm9Vy05ZOLdEbdXsJQKTfgu1l8I3zXJ/uNQITuwmBpymin+TOQRmRwAQmLQH2uB6nAc7LxueFmip2NrFfhjKT4z7nsmhsS8X2sco/4juM3XDrr3ptOO1kuRBEsVgglRVzGln8+JLGRSbULlr7e/opHaXVqTDn0Cvwt7GOECQ8ytr6JcVWRTq3PKc7SpBDAyQtyffd1PKz7skVHtLzYqRzPAuGlZFef6mwPFFid6ViXhakHcFbP3abe6UnaAHYEpdQCyPk8YWuGccGAz886D1TnduWalPw+FP5cXG3gXkNox1vuRNTgmNTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6ATApPmkJrCTf9a/bdU7n8KOS835CGS4AwJ5jf2OAQ=;
 b=FtAwzZyfqQX6TCwB96aAijXOtcr2L/e245WtP8F4vkcoCkanGYmwJHzqzAsvSu14CKU1FVs6IKbBF+wPpAx0067f+FiPz2azGpke+cMPOWUwZTa5HIRTuBMVYvLE82WZy7bjcbj/asGnm5aflWUsKwKs5R0g/RJuTYKC7hRGyH4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>,
	<nd@arm.com>
Subject: [PATCH 02/10] xen/arm: handle static memory in dt_unreserved_regions
Date: Tue, 18 May 2021 05:21:05 +0000
Message-ID: <20210518052113.725808-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518052113.725808-1-penny.zheng@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4df65769-59d3-45fb-4aab-08d919bcdbac
X-MS-TrafficTypeDiagnostic: VI1PR08MB4015:|AM5PR0801MB2018:
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB201817FC5AD2ADFC828528DAF72C9@AM5PR0801MB2018.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:854;OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 odg6zEdrcvElYOsQxbaQWCT4gGB5zc8gDjzmdtmiwBoQz1tNER0qsUSurEMYNRtVrnjpGNyIDSVPs8dkuoFOdXTz/Pp+O7mUOR+1GCdbg70VHpPIehOwpEDEMWp6t7EPKqzfQNiuXITpflYE1ogrFqNk0nveaBtCIaN45QERjaSxAFSjL26cWFynti0HpJDYjr75cuX+UFbVkTRZ4jWM9x4ia+qyNiBbIqhmuPHpGMZysgUrUPEZhoqZjNuNe4CJ4hme4mft3dnd3Gk9KsbWVP59+rVCMww30AtGd2kMmncNM0EnIQ2Y41psqPL3aD2E23cFuT/OHpOm+FzuBCJ6xsWafmIzDRHjUCU0hWarJVZZtM6cNZ9mlf3+ntfLeRQ+WhfEGgMRSxtuvDLg7AhL7Y9ghV6kSPZwZAzunurUrhTWOUTdDGGLGLQml3TtiW31vGQB04qRDqn8qJdEV+6meTwJHk4WixRnnLnydLryXUWuVW8GbWhf2tAl3MdiurPA4/NwKoc6164F7+kvp7mMgK94ADga8Gj9DH42YeXTfoKfGSl9m01XpeOYfILLKnb+xb2I5VIRCGz5zKqM2QrRy418IvbUyq0sV8kMVHNQbs7s16rMqbcrGJSDbUAh3Cnn+BLBdRe3JD/85I4Q8U8yrwzGRixFMZkAg/O9gGc4Cmt45q1GBq0rvAmN0+cdNxKX
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(396003)(376002)(36840700001)(46966006)(2906002)(82740400003)(44832011)(81166007)(83380400001)(8936002)(8676002)(82310400003)(356005)(1076003)(86362001)(110136005)(70586007)(336012)(6666004)(54906003)(47076005)(316002)(2616005)(26005)(478600001)(426003)(36860700001)(70206006)(4326008)(5660300002)(7696005)(36756003)(186003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4015
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b83e22af-2083-44d1-af6a-08d919bcd5ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7vtvXyDQF++YL3xqJ+VVxUESCwPJY4FZfp0uq2OUrS5LQcz8vy4qvZJT42YXtORfN+3Sh7m4TSySFRJXR78LUGXA9GvnN3AJADewCjgQJl5kc46ECXSjpqAl+T7+S6pBe3aOrCDVVnvMUQ6NOsOElXFwzGIWHfJaWbsIgvwV2prF+g9sr0Vg/hgktjT+kZI1uuzjPqmUOzCGkjHpxlNzfeIt7ak3EMj5vsO+ZpI+xIXkRQfBVDeroU7pdIm0zRlF/W1GcwYXD8gGhCzKjbZCEBlcfCC9UjiNbI2hq4dai5aYBwXt/7fEYeaZCO61jBXD+kqTzb0PisYEOvc3W6k/si06lr+caI/JxUGJf7ko7oEBGtIOGaeygW44Jj+npG87gJj7m2OYgHmP2h3Pal9rcxhScJDuivdxOTASOaDGLjLGesGnDBu1UBMMHRITRbLJlqWhSrrrofB95R5tAhrCuGRMpFSIRhn+7p0GCAv/MYhTZDGBHnxIOWcfnDwiNoS2Fk6QF+pddMf4GbfjEIzn30KpDS6y5msOEdD/AXVgGxw19rdnoOi+09J06ahcogONBwRw331cqF/41zd3vW2LrAtB8XRyDbkSeXCesBRurSeRFu0qkZWTvk+ZkpfZfGQvq9estt2bxFC93KQYrFNpUAfr1q5eK5a+LP2XYpjMpmM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(36840700001)(46966006)(81166007)(36756003)(54906003)(5660300002)(1076003)(2906002)(316002)(82310400003)(4326008)(110136005)(86362001)(36860700001)(186003)(8676002)(7696005)(70206006)(26005)(2616005)(8936002)(6666004)(478600001)(47076005)(44832011)(70586007)(83380400001)(426003)(82740400003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:21:57.8415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df65769-59d3-45fb-4aab-08d919bcdbac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2018

static memory regions overlap with memory nodes. The
overlapping memory is reserved-memory and should be
handled accordingly:
dt_unreserved_regions should skip these regions the
same way they are already skipping mem-reserved regions.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/setup.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 00aad1c194..444dbbd676 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -201,7 +201,7 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
                                          void (*cb)(paddr_t, paddr_t),
                                          int first)
 {
-    int i, nr = fdt_num_mem_rsv(device_tree_flattened);
+    int i, nr_reserved, nr_static, nr = fdt_num_mem_rsv(device_tree_flattened);
 
     for ( i = first; i < nr ; i++ )
     {
@@ -222,18 +222,45 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
     }
 
     /*
-     * i is the current bootmodule we are evaluating across all possible
-     * kinds.
+     * i is the current reserved RAM banks we are evaluating across all
+     * possible kinds.
      *
      * When retrieving the corresponding reserved-memory addresses
      * below, we need to index the bootinfo.reserved_mem bank starting
      * from 0, and only counting the reserved-memory modules. Hence,
      * we need to use i - nr.
      */
-    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
+    i = i - nr;
+    nr_reserved = bootinfo.reserved_mem.nr_banks;
+    for ( ; i < nr_reserved; i++ )
     {
-        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
-        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
+        paddr_t r_s = bootinfo.reserved_mem.bank[i].start;
+        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i].size;
+
+        if ( s < r_e && r_s < e )
+        {
+            dt_unreserved_regions(r_e, e, cb, i + 1);
+            dt_unreserved_regions(s, r_s, cb, i + 1);
+            return;
+        }
+    }
+
+    /*
+     * i is the current reserved RAM banks we are evaluating across all
+     * possible kinds.
+     *
+     * When retrieving the corresponding static-memory bank address
+     * below, we need to index the bootinfo.static_mem starting
+     * from 0, and only counting the static-memory bank. Hence,
+     * we need to use i - nr_reserved.
+     */
+
+    i = i - nr_reserved;
+    nr_static = bootinfo.static_mem.nr_banks;
+    for ( ; i < nr_static; i++ )
+    {
+        paddr_t r_s = bootinfo.static_mem.bank[i].start;
+        paddr_t r_e = r_s + bootinfo.static_mem.bank[i].size;
 
         if ( s < r_e && r_s < e )
         {
-- 
2.25.1


