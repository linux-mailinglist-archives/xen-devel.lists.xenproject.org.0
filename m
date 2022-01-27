Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC2949DBEF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:51:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261221.452095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYd-0002EW-Pv; Thu, 27 Jan 2022 07:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261221.452095; Thu, 27 Jan 2022 07:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYd-0002CP-Ii; Thu, 27 Jan 2022 07:51:03 +0000
Received: by outflank-mailman (input) for mailman id 261221;
 Thu, 27 Jan 2022 07:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYb-0000Xj-DZ
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:51:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddff6367-7f45-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 08:51:00 +0100 (CET)
Received: from DB6PR0301CA0079.eurprd03.prod.outlook.com (2603:10a6:6:30::26)
 by DBAPR08MB5672.eurprd08.prod.outlook.com (2603:10a6:10:1ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:50:54 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::68) by DB6PR0301CA0079.outlook.office365.com
 (2603:10a6:6:30::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:54 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Thu, 27 Jan 2022 07:50:54 +0000
Received: from 1d318a173880.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5EF2D08F-F751-4B8F-B3F8-AB26A3B854F7.1; 
 Thu, 27 Jan 2022 07:50:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1d318a173880.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:50:47 +0000
Received: from AS9PR06CA0406.eurprd06.prod.outlook.com (2603:10a6:20b:461::16)
 by VI1PR08MB2973.eurprd08.prod.outlook.com (2603:10a6:803:4d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 07:50:41 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::cd) by AS9PR06CA0406.outlook.office365.com
 (2603:10a6:20b:461::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:41 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:40 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:38 +0000
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
X-Inumbo-ID: ddff6367-7f45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92c4thxXtm2R15izEYnn+8igZY9iFkc7Fk+R9NtSz44=;
 b=ucYr5ThdxMW4w6n1FZ4ZNboL1NZNo5AjIZF8bbU/LaxyWETDTyy82/9sDgkIWezcjJdEujDHmxssAhlKOE0QytCK5n4aJMtu49hM3ugDG5v8NaVyswfC/JE/IM41zwX7t73swbfkDKK40ArwzvzCF7P3FGUgzBgyENTKkxfp2uc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b91a6021e0fab8e2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPiwNwHhPVs8Xke09dN2hh1lZhyQ+O43EHePUjxJWpyfeG4xOpY8Zo2aeOWk1pU5LS17R6W6PhAMtpOeGWTWp0YsM5aJ7FjpHkDwY5dhPLqrB044A5pLBSlmacdUu/klMPW6FDCjMyYE4BX/icbUSyD5F5jHhQhxmA5Jpcv5FrBOCXx2MnIQXG+HyHG6wz4E+JU909T2iLZMK7fwYGFYtcIcQQgrmh5J46Q0uOk8mmPYjh3uQr0DeCvYas08qTLRbKNc6tpwXgLMDS/LXmrYN1e13PR/XaiREOtSD4dL7MakDJbAjKWkJ3hagicWzpJcceBKHnRIX9/Rj359fyn2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92c4thxXtm2R15izEYnn+8igZY9iFkc7Fk+R9NtSz44=;
 b=NH4gKpne+VjEh/RCto+oQ38bGOodF7cCLiDvzccDRF1EVVCe5HEcCnAWHOuvW2+78x/xDGFcSJsQo3pL8bTFjIPuaKw6AgvRwxtuVcS03b20kuswRddTY6mZiaNdyT0aVniDEyTP3SeU8rWg20pACL1s4bLu/M9uxLsyuILs1dsC4jCd+xzOBHGWqAIBWmy16d1zk2/nQkQMi6RLXxA/XnaeoPohoxdp4BTQI/MR+EP9vrTIq4p3Y4AwtIYLNFTuS2QG3dIVqRp4yW5X/aLxktSnKaGOC6BN1p8sJ6hEa81D6rNVnrSK6CbDvAv+Rme9+5cAoXM4u4A6qQ9jpJM7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92c4thxXtm2R15izEYnn+8igZY9iFkc7Fk+R9NtSz44=;
 b=ucYr5ThdxMW4w6n1FZ4ZNboL1NZNo5AjIZF8bbU/LaxyWETDTyy82/9sDgkIWezcjJdEujDHmxssAhlKOE0QytCK5n4aJMtu49hM3ugDG5v8NaVyswfC/JE/IM41zwX7t73swbfkDKK40ArwzvzCF7P3FGUgzBgyENTKkxfp2uc=
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
Subject: [PATCH v5 07/11] xen/arm: if direct-map domain use native addresses for GICv2
Date: Thu, 27 Jan 2022 07:49:25 +0000
Message-ID: <20220127074929.502885-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127074929.502885-1-penny.zheng@arm.com>
References: <20220127074929.502885-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 0634c7f6-cb23-43d0-eac3-08d9e169bf18
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB2973:EE_|DB5EUR03FT049:EE_|DBAPR08MB5672:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB56720E6053873A94A625AA18F7219@DBAPR08MB5672.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bsTBQiZBPJw7Vh9hHaUPZGlr11VdhvUroyKLq1Ui8orAUT2XEUe6Z/nsEtbd7uGxvGWg5dzRAP6P3876Oy8FU1oDW9UP0D001g8SNYIr5hmDx3uHCWyPPUei8QcRAlDl2Qcj5J0vVzyq6QDx3aVFLIeZ7pJ8NTWyPTZTfbjTXQi5stBUz1V+hCWV/91UvvnodbRjYPB9MZT2EUmksixlVmunBXVhMpKvtWzkfCqUFIYN3ETk1mVaQ/ml3YIQxhZv716Ff0fO4CMoIKfaps53QkBj8tSQUEJUtT1EBPRwm8+cbZWwk3hHBVYzmwgdz8d0f6nWNNyVnCxo+KgabLA1m6ucgYiUVQui1FmpsOddnF3m0xdhG8LqBLGWoCO5gItGtCPi4ReLmjwjaU6anx9LLC0R3aSUOz+qEdWXrdN7rAqQgKllqnyhi55x6MmQFYoiMlmoeFWQuob5dSTllk82Khw4tSKn1E9hjKN1gOo0GXA+z6Vfr4KlE6YaWAA5BR3QAgX6093BrR5uDmx6VObYUmYhCi08W91V+UsyjBNHKHahthHU2kVe4OUfH8l3xJBv7lBq3Arww++5DkIWyYJNJlwo1itvpGwv/dJClaRb5ddstEEoPq2MTGYjgOFFJuQZ7l3nTKjqBXbNAkQp+HjzC0W0FyhcxsHyUK7grYdS1sQBP7zU0XycMzf7+u/kd4cZMGZTl+RSmFZNFtIEVfrBmA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70206006)(70586007)(336012)(426003)(8676002)(8936002)(86362001)(4326008)(83380400001)(82310400004)(44832011)(5660300002)(356005)(47076005)(81166007)(54906003)(6666004)(36860700001)(2906002)(40460700003)(36756003)(110136005)(2616005)(508600001)(316002)(7696005)(186003)(26005)(1076003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2973
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c634ab6-6b37-42a8-8455-08d9e169b74f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WRSJHTXCd0yr3GYIyqd4mnnjLTIe6rONgv5Yv1EPxNLZKGH2+fdJb/26XT54EzJ5Nund0nOV2tFRp4Yzm12kYUoAkSoCkfMoPxoEUT2Fptjx70ZNiTEnoG5w2DS5FC2O/e5oABh7qv/r/C6ZKSB8sRjFUFGFeW/olHhuiMLIJM/zmPnhazWmePOcuNRx/WCSSe5FS5YV6B6j+uDuBqWYrBlsFPhV31axQCOtUNzaJUlpcxUrRYKWjsriehMczW0x1Xy13fk14yYr1yKBMkJ3q2U+7xbBHv9xPdhLGFKtNNfhzcgXvts8XwH3D2w0gWWaicHaS3+mtte+3HzQdrPWXk//eRsn8EAizK4grrzv6UYQoyFZJ2ixNtZsAMFdnfcetIqXZhUTuWQeeGSeFGk+5WobWktAZIOG3wM+mi1gDZ4T0fxP/ec7F2YOAiofvwJ89UJF8cyQGumb2MbkuR8o26ZpLaBy6yVdLx5BSUvTIPpmBlShsiXCJIEMAzlG6mNhD4ofvpRxb5W/sTaq/qlL9LBr+WlciMKsKPjBpZ5ejwkdXaRGz2eJo5JKTFOAlPa2ty9PNcZDlgbABQxG8POYLHCDxq4NbolGztyF5rMZbTLp3Q0ZCjuuibJ9qB4p5u4kVmrXxmMA5sAOgcQJKKTEptXUJ6l1rB17oHH0wqPJ0Jf1EHT+MKR0RWibA12TaNs+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70206006)(70586007)(110136005)(5660300002)(8936002)(8676002)(36756003)(44832011)(82310400004)(54906003)(2906002)(316002)(4326008)(81166007)(7696005)(40460700003)(2616005)(36860700001)(6666004)(47076005)(26005)(83380400001)(426003)(336012)(1076003)(508600001)(186003)(86362001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:50:54.3532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0634c7f6-cb23-43d0-eac3-08d9e169bf18
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5672

From: Stefano Stabellini <sstabellini@kernel.org>

Today we use native addresses to map the GICv2 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all domains that are direct-mapped.

NEW VGIC has different naming schemes, like referring distributor base
address as vgic_dist_base, other than the dbase. So this patch also introduces
vgic_dist_base/vgic_cpu_base accessor to access correct distributor base
address/cpu interface base address on varied scenarios,

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 changes
- combine all changes in patch 4-6 here
---
v3 changes
- refine comment message
- add a comment explaining how the 38 was found of "char buf[38]"
- simply map the CPU interface at the GPA vgic_v2_hw.cbase
- remove a spurious change
---
v4 changes:
- refine comment to let it be a summary of the if/else if/else.
---
v5 changes:
- nothing changed
---
 xen/arch/arm/domain_build.c         | 11 +++++++---
 xen/arch/arm/include/asm/new_vgic.h | 10 +++++++++
 xen/arch/arm/include/asm/vgic.h     | 11 ++++++++++
 xen/arch/arm/vgic-v2.c              | 34 +++++++++++++++++++++++------
 xen/arch/arm/vgic/vgic-v2.c         | 34 +++++++++++++++++++++++------
 5 files changed, 83 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 52f256de9c..87391adde6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2273,8 +2273,13 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     int res = 0;
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
+    const struct domain *d = kinfo->d;
+    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
+    char buf[38];
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICD_BASE));
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             vgic_dist_base(&d->arch.vgic));
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2296,9 +2301,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICD_BASE, GUEST_GICD_SIZE);
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICD_SIZE);
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICC_BASE, GUEST_GICC_SIZE);
+                       vgic_cpu_base(&d->arch.vgic), GUEST_GICC_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if (res)
diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
index 97d622bff6..ab57fcd91d 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -186,6 +186,16 @@ struct vgic_cpu {
     uint32_t num_id_bits;
 };
 
+static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
+{
+    return vgic->vgic_cpu_base;
+}
+
+static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
+{
+    return vgic->vgic_dist_base;
+}
+
 #endif /* __ASM_ARM_NEW_VGIC_H */
 
 /*
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index ade427a808..d2a9fc7d83 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -152,6 +152,7 @@ struct vgic_dist {
     struct pending_irq *pending_irqs;
     /* Base address for guest GIC */
     paddr_t dbase; /* Distributor base address */
+    paddr_t cbase; /* CPU interface base address */
 #ifdef CONFIG_GICV3
     /* GIC V3 addressing */
     /* List of contiguous occupied by the redistributors */
@@ -271,6 +272,16 @@ static inline int REG_RANK_NR(int b, uint32_t n)
 
 enum gic_sgi_mode;
 
+static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
+{
+    return vgic->cbase;
+}
+
+static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
+{
+    return vgic->dbase;
+}
+
 /*
  * Offset of GICD_<FOO><n> with its rank, for GICD_<FOO> size <s> with
  * <b>-bits-per-interrupt.
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 589c033eda..b1bd7a46ad 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -654,12 +654,16 @@ static int vgic_v2_vcpu_init(struct vcpu *v)
 static int vgic_v2_domain_init(struct domain *d)
 {
     int ret;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
 
     /*
-     * The hardware domain gets the hardware address.
-     * Guests get the virtual platform layout.
+     * The hardware domain and direct-mapped domain both get the hardware
+     * address.
+     * We have to handle them separately because the hwdom is re-using the
+     * same Device-Tree as the host (see more details below).
+     *
+     * Other domains get the virtual platform layout.
      */
     if ( is_hardware_domain(d) )
     {
@@ -671,10 +675,26 @@ static int vgic_v2_domain_init(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = vgic_v2_hw.cbase;
+        d->arch.vgic.cbase = vgic_v2_hw.cbase;
         csize = vgic_v2_hw.csize;
         vbase = vgic_v2_hw.vbase;
     }
+    else if ( is_domain_direct_mapped(d) )
+    {
+        /*
+         * For all the direct-mapped domain other than the hardware domain,
+         * we only map a 8kB CPU interface but we make sure it is at a
+         * location occupied by the physical GIC in the host device tree.
+         *
+         * We need to add an offset to the virtual CPU interface base
+         * address when the GIC is aliased to get a 8kB contiguous
+         * region.
+         */
+        d->arch.vgic.dbase = vgic_v2_hw.dbase;
+        d->arch.vgic.cbase = vgic_v2_hw.cbase;
+        csize = GUEST_GICC_SIZE;
+        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
+    }
     else
     {
         d->arch.vgic.dbase = GUEST_GICD_BASE;
@@ -685,7 +705,7 @@ static int vgic_v2_domain_init(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.cbase = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
     }
@@ -694,8 +714,8 @@ static int vgic_v2_domain_init(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
         return ret;
 
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index b5ba4ace87..1a99d3a8b4 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -258,13 +258,17 @@ void vgic_v2_enable(struct vcpu *vcpu)
 int vgic_v2_map_resources(struct domain *d)
 {
     struct vgic_dist *dist = &d->arch.vgic;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
     int ret;
 
     /*
-     * The hardware domain gets the hardware address.
-     * Guests get the virtual platform layout.
+     * The hardware domain and direct-mapped domain both get the hardware
+     * address.
+     * We have to handle them separately because the hwdom is re-using the
+     * same Device-Tree as the host (see more details below).
+     *
+     * Other domains get the virtual platform layout.
      */
     if ( is_hardware_domain(d) )
     {
@@ -276,10 +280,26 @@ int vgic_v2_map_resources(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = gic_v2_hw_data.cbase;
+        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
         csize = gic_v2_hw_data.csize;
         vbase = gic_v2_hw_data.vbase;
     }
+    else if ( is_domain_direct_mapped(d) )
+    {
+        d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
+        /*
+         * For all the direct-mapped domain other than the hardware domain,
+         * we only map a 8kB CPU interface but we make sure it is at a location
+         * occupied by the physical GIC in the host device tree.
+         *
+         * We need to add an offset to the virtual CPU interface base
+         * address when the GIC is aliased to get a 8kB contiguous
+         * region.
+         */
+        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
+        csize = GUEST_GICC_SIZE;
+        vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
+    }
     else
     {
         d->arch.vgic.vgic_dist_base = GUEST_GICD_BASE;
@@ -290,7 +310,7 @@ int vgic_v2_map_resources(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.vgic_cpu_base = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
     }
@@ -308,8 +328,8 @@ int vgic_v2_map_resources(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.vgic_cpu_base),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
     {
         gdprintk(XENLOG_ERR, "Unable to remap VGIC CPU to VCPU\n");
-- 
2.25.1


