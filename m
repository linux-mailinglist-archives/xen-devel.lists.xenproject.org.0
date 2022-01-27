Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EA649DBEE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261220.452085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYY-0001eW-Cv; Thu, 27 Jan 2022 07:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261220.452085; Thu, 27 Jan 2022 07:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYY-0001aa-7p; Thu, 27 Jan 2022 07:50:58 +0000
Received: by outflank-mailman (input) for mailman id 261220;
 Thu, 27 Jan 2022 07:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYW-0008Mi-Kd
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:50:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db55eb29-7f45-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 08:50:55 +0100 (CET)
Received: from AS9PR04CA0081.eurprd04.prod.outlook.com (2603:10a6:20b:48b::22)
 by HE1PR0801MB1996.eurprd08.prod.outlook.com (2603:10a6:3:54::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 27 Jan
 2022 07:50:52 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::b9) by AS9PR04CA0081.outlook.office365.com
 (2603:10a6:20b:48b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:51 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Thu, 27 Jan 2022 07:50:51 +0000
Received: from 0a577f82bb16.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4A52311-87C7-434D-8891-B9A20B23E059.1; 
 Thu, 27 Jan 2022 07:50:44 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a577f82bb16.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:50:44 +0000
Received: from AS9PR06CA0182.eurprd06.prod.outlook.com (2603:10a6:20b:45d::16)
 by DB9PR08MB6992.eurprd08.prod.outlook.com (2603:10a6:10:2c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:50:43 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::d) by AS9PR06CA0182.outlook.office365.com
 (2603:10a6:20b:45d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:43 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:43 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:42 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:41 +0000
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
X-Inumbo-ID: db55eb29-7f45-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zv99J/JvMfg/PNJtCHZ3IadhuqFRQ7hXXDxbc+rSdBs=;
 b=9iJxpoh4krPejyXqyHN8wXFT/M7Qlr39a2d3YbAriYnXCLY0rRRe1NH5nt3l/EhNSoGEOVEISKzPpH29hw94AYhBc/SvXs/Xp5sweEmmofNnG0hz6KSNL2F0EmeCoZTNLZ7fiXg+sfd+OT4wxwl3hjJbm5JXwzCoETwyOREX1Xg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7f6b200aa6f18af
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9eh1KFLRb3HJnzrr9pdBLVV9UbQ6HPV+76bKjsozv/0h59frKPiI/pGaX43UBAOx/rTkV/gZB8N0yZdk2aArCmUr0zcmjANX2jHAKwU63siM3hK7AHztw3KxlecZEdYfZ5fGxTPi0aereWYg0qeV8sDgWl95XZkl/6ovjBHvVCLdHv1K7gkq73Lq2M5qhIzpr3k5fmD0Y0/SIMD92KA/docukzo/gRhJAtX8mLcSEfCjPtO4DTLM2+ZR0rQqUmbHXecouQWC0yWjJ7+wVMJq7OW6gHK8dKUFggwdxARZgXsNewRlM3HB7N2pJXocsfosdJDgq1PdA9Exhmilc112A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zv99J/JvMfg/PNJtCHZ3IadhuqFRQ7hXXDxbc+rSdBs=;
 b=l2gSdUVV2vQ4fKKlAjveKMOuUdWQ/AGIRS0sjWUzfgZ90MdYamv/CsbG3VD7o86iUV6+3LpBlQmCvu5OFDNVhxVY/d0mBTt7rVdTSBhvl+0ZVO9rGjDzV8ZMqiU9tNPajh0X4wcWOtGXhG3VAdsvreSp3TAPPpHfssI0HDpj3E2y763Mr9iKUYglPMyZVecI3lC0YbB1rnHtLIBvNsG0kTq0RPQwj6XrMwZTc672ELjeTk/ikeRjiRBkMuVRL6WDpesCfqNDLe2NzQvjz+t0kXUcarxqceDMM0H5gC20BqQVNa7udXi9I+NVrPYYOEHE99NuU+XJeyYG64l1A8eIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zv99J/JvMfg/PNJtCHZ3IadhuqFRQ7hXXDxbc+rSdBs=;
 b=9iJxpoh4krPejyXqyHN8wXFT/M7Qlr39a2d3YbAriYnXCLY0rRRe1NH5nt3l/EhNSoGEOVEISKzPpH29hw94AYhBc/SvXs/Xp5sweEmmofNnG0hz6KSNL2F0EmeCoZTNLZ7fiXg+sfd+OT4wxwl3hjJbm5JXwzCoETwyOREX1Xg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v5 08/11] xen/arm: gate make_gicv3_domU_node with CONFIG_GICV3
Date: Thu, 27 Jan 2022 07:49:26 +0000
Message-ID: <20220127074929.502885-9-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127074929.502885-1-penny.zheng@arm.com>
References: <20220127074929.502885-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 1a472994-30e0-4646-67ee-08d9e169bdab
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB6992:EE_|VE1EUR03FT063:EE_|HE1PR0801MB1996:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1996B27683E37A4914FFA039F7219@HE1PR0801MB1996.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:78;OLM:78;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +gx5fE4vfaU+A55P9QNH16RXL1nfd07hbO1NJ1P2HOYZ0nQ4XqAY7ICb3iituL2i7Vgnd4MB2Yh74B/zDfCOZRNBPj7mhx5hDv0e12AGCpfbhxS1VxTfjVJXJnS/Yoqv23jkD5l9ZK25RC+IxNfZOJutxuSjcYZ6BBtIUaaHFYyFz035PwsrIjz8Vz3fHlQuNV41eL7EKyx88a7z5eT/Yhqkpdlk4mrgV0U8ODg+6O4DH4atogD0iKorAK9xohEPKgVLmLkaJWn1tbsx3UCDDw9u8rhVBZi/JZpkrHmCtL2K+BhMlm3crEDyE+mxzaS61Pa3EGICsmmyG1pNQD0pe/c4kxGza2OXp9VnaJZcNFoP2twMXaeE5zf3wvcZeMTTdMWMQW25azRnoVD1lro4XyIecVRqfDj5jPTNICz6r/HGU1hr0N1qOsIJ5u/fDpSEqDUMHRsLkaPn10jUV04GkhFyYE3vgBuDT/POuvALniO7JToCub71LzJyR8nSdT+9Fh/ADcV0IMYFI21TDzkrKVrp9pdKeMItdZBDTiTDEW8SbuKB3tnALo1F2j5epp6hmrWqiCl/iW9M/AOZ+Dd+yBTWyJcmznMXUoNl3yNTtbhicnuu0BYjguCKERKGu6J8Wr3AeWcEF3SB8OfcdXarTKq3Q8xI4SEVpkDpu7f2sPvrWn6eWPU8cvY0gtdGB8UsB12WLYEb/u2MCIU+/5MC0w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(40460700003)(2906002)(336012)(186003)(2616005)(1076003)(7696005)(6666004)(26005)(426003)(81166007)(82310400004)(36860700001)(44832011)(47076005)(5660300002)(508600001)(70586007)(70206006)(36756003)(8936002)(110136005)(54906003)(8676002)(4326008)(86362001)(316002)(356005)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6992
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45e28c0e-e5a6-420d-0a54-08d9e169b8a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JAGHGmMPZnl10LLid3q7UvBHjpfwko4HiHNbuO33Xm4rlS0eWl/V+dN9Uk8E78K0gBznQT/ZujQF+GSIyXPY31XImhAYI1hWFxg70FxCeopEvDB9hLxhA7UkIJ6oxp6/4Cd1XaMrjKW0QGtV4nVEJATd4Lo0GIsuQ8Ps4Zi6I7EBF6aLrU+d4tCFv6rUYh9fcDSfHjZn/7zB5jWXVUtwYylafdvBPiS8TTffzGXBtcaAJiIzYsbK/G//Ta+VRZr+ZCp7HvqMg2wNoM5F4XhB+t2W6qcM9I9TCOSAVMlc7R8b33IrPdzgHfrnDf+EB3wMtBDSzNDpwtqzFW13Ui+24iAJueh+qjtHh61i8BHdruo3H53HFazs372VMH/I/DfD+0izt907Fc2Vtiov+rlh4n7YLFJWDOh63YcbYS35SyPZBInWHnE7Xt5XXaKmms/8qp4LB5BOfxmTuFEEA+yva/jSossTnTEJGRaBhuYpcAtHACdU/kru8RIee7oFNRTOmOG9rA2z+H6psztJwhO0gBSxmpM7iJTI5D9yL4u+TkKwww279qtCFrhPQ0G7/RnVbXOUnCK+dvyy/uEGTOnEnTY35kBpmdh712qlJbPiKIqp9h/inAIHa3A03nFlJ7iL2ThWMTu2RqPj7354Pha2e5k+G41Dw8tpSv/8jwnBnB5r5teyzAqZePdbkgVWtTjk8VBFxgzYeSDaElzePmcH8Og+oCrS8iX+2b9dwcGJanFw89akxi5bEmoliz1It6N8/3IBS/1B430SQ8DXVAacYg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700004)(186003)(336012)(86362001)(26005)(82310400004)(2616005)(36756003)(70586007)(36860700001)(6666004)(8936002)(5660300002)(1076003)(81166007)(44832011)(316002)(426003)(8676002)(2906002)(47076005)(54906003)(70206006)(7696005)(40460700003)(4326008)(508600001)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:50:51.8484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a472994-30e0-4646-67ee-08d9e169bdab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1996

This commit gates function make_gicv3_domU_node with CONFIG_GICV3.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v4 changes:
- remove ASSERT_UNREACHABLE() to avoid breaking compilation on prod build with
CONFIG_GICV3=n
---
v5 changes:
- nothing changed
---
 xen/arch/arm/domain_build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 87391adde6..a01dc60b55 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2322,6 +2322,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     return res;
 }
 
+#ifdef CONFIG_GICV3
 static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
@@ -2371,13 +2372,16 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 
     return res;
 }
+#endif
 
 static int __init make_gic_domU_node(struct kernel_info *kinfo)
 {
     switch ( kinfo->d->arch.vgic.version )
     {
+#ifdef CONFIG_GICV3
     case GIC_V3:
         return make_gicv3_domU_node(kinfo);
+#endif
     case GIC_V2:
         return make_gicv2_domU_node(kinfo);
     default:
-- 
2.25.1


