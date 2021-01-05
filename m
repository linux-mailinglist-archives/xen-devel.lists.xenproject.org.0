Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4212EA864
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 11:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61778.108816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwjQB-0005uk-HP; Tue, 05 Jan 2021 10:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61778.108816; Tue, 05 Jan 2021 10:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwjQB-0005uN-DY; Tue, 05 Jan 2021 10:18:35 +0000
Received: by outflank-mailman (input) for mailman id 61778;
 Tue, 05 Jan 2021 10:18:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PMne=GI=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kwjQ9-0005uI-Ng
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 10:18:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f3c7357-a38d-4ffe-b934-e20a8d9ebf27;
 Tue, 05 Jan 2021 10:18:26 +0000 (UTC)
Received: from AM5P194CA0007.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::17)
 by AM0PR08MB5172.eurprd08.prod.outlook.com (2603:10a6:208:164::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Tue, 5 Jan
 2021 10:18:24 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::2a) by AM5P194CA0007.outlook.office365.com
 (2603:10a6:203:8f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 5 Jan 2021 10:18:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21 via Frontend Transport; Tue, 5 Jan 2021 10:18:24 +0000
Received: ("Tessian outbound fc5cc0046d61:v71");
 Tue, 05 Jan 2021 10:18:23 +0000
Received: from f71a44af2b5e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EDF85507-3DFA-41EC-AE98-E1C489BDEB23.1; 
 Tue, 05 Jan 2021 10:18:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f71a44af2b5e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jan 2021 10:18:07 +0000
Received: from AM0PR04CA0088.eurprd04.prod.outlook.com (2603:10a6:208:be::29)
 by DB6PR0802MB2343.eurprd08.prod.outlook.com (2603:10a6:4:85::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 5 Jan
 2021 10:18:06 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:be:cafe::e6) by AM0PR04CA0088.outlook.office365.com
 (2603:10a6:208:be::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Tue, 5 Jan 2021 10:18:06 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3721.21 via Frontend Transport; Tue, 5 Jan 2021 10:18:04 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 5 Jan 2021
 10:17:57 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Tue, 5 Jan 2021 10:17:54 +0000
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
X-Inumbo-ID: 9f3c7357-a38d-4ffe-b934-e20a8d9ebf27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kerTqOHbzqxFsECrdTq4sDrkpoMONooxgQhy93r1HZ0=;
 b=tj+jWsPInBXwNJdev9MKl2FpueW6oH9mkTW0hy7I1dciTy1n/HRUO+P4BJk3oB8Ml36y+aLmxqr06mLbPOxTtjVh93zZQ6yP0wvXSUIcgXY41WSS7Nhj3N4lLfT/q4h6MliN4aSdaU7OaRw34cFudDrqeBO02Ch5g982Z2DYkds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b36634f9f4120fb6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kc79qP0wiXVERLSLS4lFVCesmrfmrn3FyQwyJQQBOBUqHj4o8AtZYpO1wjaqMfca3ruGhoaW6Lamf8yX2KhujXt8ZaeaMGPsDZd3Wjl454Wx4yESqCiJ0d/sizRJTDSer11AXaWrgysNdJ09X7MGynz49PcHh1IMSSzJPi3qaSPRCFW0vYKgwtTwJg6nU/1SnFxqbHx7/8uLU9RmQ5Zs1Pk44wpag8CZtu1KxmevEk+sGZW+vtJmQuMP7Zj0rsFYBl/b5lOFpbt48iiYRnImuEenhgtMThiRdGOjmEdqWkxJySqKeCvElE34E1x3RXFxbthUYmt6VDeeRAVAok2B6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kerTqOHbzqxFsECrdTq4sDrkpoMONooxgQhy93r1HZ0=;
 b=bC5FF/pw91ITRJjYJ0CxK90CD515ongBq8t08X1DQESjnir2iMBgcMlF02ChmL9FXF5NMgCE6VxIgFR/uhT5EAx/KDBqaqX/3+mXenehgTAiNofpZVOAQxQl4wVy6HA28sSb1CTETE+yHj4awx1vtpNk5hWefiUa/AEMWx7OzLgi3pe0bc2WD5UWUmxg4zGG5gt89dWrQB1F+XEvjFL69y/V0QIJlDilIlIaV14UXUrFFXHeZ7g2l4lZh7xiYWgmtDW9STG0sRf/IOKDdK7O5ZXD17sJS6snz6a9PTXf2EQV2Wd423hkCnXWLLmXi0Ai47XTMu87NLcwrFbM4ZF6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kerTqOHbzqxFsECrdTq4sDrkpoMONooxgQhy93r1HZ0=;
 b=tj+jWsPInBXwNJdev9MKl2FpueW6oH9mkTW0hy7I1dciTy1n/HRUO+P4BJk3oB8Ml36y+aLmxqr06mLbPOxTtjVh93zZQ6yP0wvXSUIcgXY41WSS7Nhj3N4lLfT/q4h6MliN4aSdaU7OaRw34cFudDrqeBO02Ch5g982Z2DYkds=
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
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Jiamei.Xie@arm.com>,
	<nd@arm.com>
Subject: [PATCH] xen/arm: Using unsigned long for arm64 MPIDR mask
Date: Tue, 5 Jan 2021 18:17:51 +0800
Message-ID: <20210105101751.1972883-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 702f284d-ea62-4947-5e23-08d8b1633c15
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2343:|AM0PR08MB5172:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB517204BCF173F4933C1DED179ED10@AM0PR08MB5172.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:538;OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9CRTnAxVbCjWVVN7xZMWcG29QApoBGv2uL36KZ2CUW8Qb3K3/9qmmR4JkiHqNnkKydhLCnBZtfLjuDMlrqVQEC2HGuWKUQFqMc8MZ6uMqoiYyKHTgvjukdl/T0+C4oxtDsg0TEMRfKPCoa7kKT9A9NX9ZwLY36o460ptEHJekF1V/0UM2hr3jnfWHLp4v9QJoNl8p3UyHtVSGmZdLRen7jsWz3snCgIjF0L2QvUkT+EInythGdxzBlPPl3q/J4wBmxrL+tn/D8JcKiuxdBUqf5un5TIKzY7NotYQUNaRgpZ3jyJJWv8YH4YDJP9grcQC5A+G24RyiTansfLsazpun0BMmHlY+/K/QB5U7VzvHMNf2SUKQWZBj+u2ZBmihuYpAcjAt0GuXPpPg6S0NV47jSxPJ9UyEA868zv5Kr18umZuWJfzdU8Z847/aMqVZfDjcc7XoY6CVd8QCVLj+UxU3Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(36756003)(86362001)(44832011)(110136005)(54906003)(7696005)(2616005)(426003)(5660300002)(336012)(478600001)(1076003)(8676002)(2906002)(8936002)(4326008)(26005)(316002)(186003)(70206006)(70586007)(47076005)(83380400001)(356005)(81166007)(82740400003)(82310400003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2343
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	130580c5-1424-4731-02ec-08d8b1633064
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0laPenHacVk6AulL00bY2hvcD9JGNgec97Y3ChUN993DXasNMC7Agpslb8d31JsA2zQ5wqWZQAkWF20XShvytVKaBLhfI9+ALPUd6h4yKC2nUDp87KgZoFCel8WD3BbMlC+yFDtYjSH7s/FYLiXWlFzzRN1Hopsv8JcNIsdC1FyGquW1vIqgYs1td34kn0exp11XU4y0dHg1YngwXmV3ZwF4wWdtucOWEORycR6LVzinixcHuj5sEO9suE9klulrmFfAw2jqfeeVwLjwFXD6LaZqRj0LzhssGOqqNSMnWb7rnmiOQLjXQxvB1NOJsiub7qO1Jh1aZDZgFZx9gra/3wOkeMlAGPKLgnC+x5tmwfXGZKFsWDH4T5CmU4GDh/17PNBGFS8jEx9nuGGvRlSozFQAxbY0rLQa26MnWE7EbdCErAxdvVA5Mav+eyYqDv2ilOR+JNc/w5eIHAzMYs+XXg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(44832011)(26005)(82740400003)(2616005)(82310400003)(2906002)(1076003)(8676002)(70586007)(8936002)(83380400001)(70206006)(86362001)(54906003)(7696005)(36756003)(316002)(81166007)(47076005)(5660300002)(186003)(110136005)(4326008)(426003)(336012)(6666004)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 10:18:24.0227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 702f284d-ea62-4947-5e23-08d8b1633c15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5172

Curretly, Xen is using UINT32 for MPIDR mask to retrieve
affinity[0,1,2,3] values for MPIDR_EL1 register. The value
of MPIDR_EL1 is 64-bit unsigned long. The operation of 64-bit
and 32-bit integers are compiler related. This means the value
is unpredictable.

For example, when we are using MPIDR_AFF0_MASK to get
cluster_id from a 64-bit integer in gic-v3 driver:
uint64_t cluster_id = cpu_logical_map(cpu) & ~MPIDR_AFF0_MASK;

When MPIDR_AFF0_MASK is UINT32, compiler output:
    f7c: 92785c16 and x22, x0, #0xffffff00
When MPIDR_AFF0_MASK is unsigned long, compiler output:
    f88: 9278dc75 and x21, x3, #0xffffffffffffff00

If we have a cpu_logical_map(cpu)= 0x1,00000000. We except
to get a cluster_id 1, but with UINT32 MPIDR_AFF0_MASK, we
will get 0.

So, in this patch, we force aarch64 to use unsigned long
as MPIDR mask to avoid such unpredictable operations.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-arm/processor.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
index 87c8136022..5c1768cdec 100644
--- a/xen/include/asm-arm/processor.h
+++ b/xen/include/asm-arm/processor.h
@@ -75,11 +75,11 @@
 
 /* MPIDR Multiprocessor Affinity Register */
 #define _MPIDR_UP           (30)
-#define MPIDR_UP            (_AC(1,U) << _MPIDR_UP)
+#define MPIDR_UP            (_AC(1,UL) << _MPIDR_UP)
 #define _MPIDR_SMP          (31)
-#define MPIDR_SMP           (_AC(1,U) << _MPIDR_SMP)
+#define MPIDR_SMP           (_AC(1,UL) << _MPIDR_SMP)
 #define MPIDR_AFF0_SHIFT    (0)
-#define MPIDR_AFF0_MASK     (_AC(0xff,U) << MPIDR_AFF0_SHIFT)
+#define MPIDR_AFF0_MASK     (_AC(0xff,UL) << MPIDR_AFF0_SHIFT)
 #ifdef CONFIG_ARM_64
 #define MPIDR_HWID_MASK     _AC(0xff00ffffff,UL)
 #else
-- 
2.25.1


