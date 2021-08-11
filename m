Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642253E8EA0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165692.302791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVo-0001v5-8a; Wed, 11 Aug 2021 10:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165692.302791; Wed, 11 Aug 2021 10:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVo-0001t3-3J; Wed, 11 Aug 2021 10:31:04 +0000
Received: by outflank-mailman (input) for mailman id 165692;
 Wed, 11 Aug 2021 10:31:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlTh-0000BQ-JR
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:28:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f7f1dd3-f948-4aab-9215-dcab0ed4280c;
 Wed, 11 Aug 2021 10:26:13 +0000 (UTC)
Received: from AM6PR08CA0018.eurprd08.prod.outlook.com (2603:10a6:20b:b2::30)
 by HE1PR08MB2874.eurprd08.prod.outlook.com (2603:10a6:7:36::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:26:10 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::18) by AM6PR08CA0018.outlook.office365.com
 (2603:10a6:20b:b2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:26:10 +0000
Received: ("Tessian outbound efa8a7456a86:v101");
 Wed, 11 Aug 2021 10:26:10 +0000
Received: from b869a803357d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA0683DC-BB73-42FC-A830-F03369FC18CB.1; 
 Wed, 11 Aug 2021 10:26:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b869a803357d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:26:03 +0000
Received: from DB8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::21)
 by AM6PR08MB3413.eurprd08.prod.outlook.com (2603:10a6:20b:44::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:26:02 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::a) by DB8P191CA0011.outlook.office365.com
 (2603:10a6:10:130::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:02 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:02 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:57 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:55 +0000
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
X-Inumbo-ID: 6f7f1dd3-f948-4aab-9215-dcab0ed4280c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsD8ki2XzqZKPjUHzaCAttl8RBCBnbgfYIT2FllWBxQ=;
 b=6xBOv5P7c26RZjZnOVjJh8G/WQGaAOToUfrRfSlKC3NUKluW5NTvs7zO17ZbS0hFnsbrAoztAHYA9VDcrd0+e8P+0LVVYQvJ8XT9MPNTeyqUtzS8ydOsir5bdWGAAu9VhisGxsp0lWrSXhl/rK8HIGjPjZE0DIuhqO+1HAF2fHM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7ec1e1a1eaf4736
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcCoEePVsYUaGz/l08i3/Nzuh7kWAzVuGIzXwakiD3igD6i2pvFu3iUOFntkFpfGJLISUvgGQ45CMFR749SGmxHTf+Vi0YdyLDpjW+6R8MXaXplLcGwXj7nQaKKRzX9m/EIJR7Z3lha4GTGj1iyVZrCo4UpTDlHdWb2NN5q5J/x9tOMncQKaVyCHYyhT5oejYENE2dNdnia29uqoTXfmSk/V3Qw+W8Gu0e08Qwmr+ORzT+rv2gAweLlx8wGKD5By73k8nXTjOZ5X8ZldhdR4B1O59TDnxaYoM2zNi94vHpFYy57mvZZZJqjwEEIPC7u1dxqnY00e0SIF+zK1/Xs8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsD8ki2XzqZKPjUHzaCAttl8RBCBnbgfYIT2FllWBxQ=;
 b=Fpxl0fz3UPjutlk9A0pugHhvaOgUH8ZJyJH3e14cyvyk71PoLXQ2AjfMOL8GdXD8pjL1izK2ucbL6SbDgto5lqlfVxoKzJfuPGfqnGvo1I9e9JXVVCSvFXNEOahVQvf0Q+J46z3WV98+QtWl7rsdjXCPtLEwv89qftZIHPi69pzl6Nj9+qtpLAR8M/XG8dtJVYvZp1EssmD5AziBjW98naEELUL1omuGBPCIXljzmqRkkILmMEP+Q1LR75oPi0eHUcrHagvJlKkPfJ9PHlxkTjYifscQ1Wipdg6pwevaOUoE/E5NLzWfX9MfQI/Robc/Z0EsR/uRpAPGHwWFIfO/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsD8ki2XzqZKPjUHzaCAttl8RBCBnbgfYIT2FllWBxQ=;
 b=6xBOv5P7c26RZjZnOVjJh8G/WQGaAOToUfrRfSlKC3NUKluW5NTvs7zO17ZbS0hFnsbrAoztAHYA9VDcrd0+e8P+0LVVYQvJ8XT9MPNTeyqUtzS8ydOsir5bdWGAAu9VhisGxsp0lWrSXhl/rK8HIGjPjZE0DIuhqO+1HAF2fHM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 35/40] xen: enable numa_scan_nodes for device tree based NUMA
Date: Wed, 11 Aug 2021 18:24:18 +0800
Message-ID: <20210811102423.28908-36-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a7d66aa-b870-4415-8397-08d95cb26ffb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3413:|HE1PR08MB2874:
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB2874BFEFDD15D55FAF5352E99EF89@HE1PR08MB2874.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gD1Ytvzy07flHX46qnGws9AeMGIvh7TUnA9nQtnpYCAG/vATRwMRQ7NCe3ScMMLZJRR31f1ttRnqDae460uKVI+NdIFyKRk1NkhkdZ1XUQQIthVbnv7LQ1rDF/UdZ0gs7YrmWd1sVQEAI9JckBfKihfzOvFdZmsr+tXnnf77L7GeDzphVdwOo4i1v5h7acke2AJczZCaxiQO26Ywba4Yd8MWCkE7vav4iQeKBXrOjGpoe4hVyPCZw3zrUbOCJd5f5FNBV2EsaebvBSk6DXIGbzgTImVFF8aEV8yNx++6LbkAmB4ZWld9M+bftlr6Y2bM3+mpdri4Pn06qsSgh/1kFyUfs4gFWNIgUeOCuLCdyRgPtjAYJslaZ6VhhF4vFWvA+GfUc8fCUioIMNoDtJYGy8C4i0dl4XNTuyGOZ030lE4aW19K5YLUASUfzaddh1zI5dXjE5wHXv7+GKUR74SPpEwDBXVGiCVqfaO7EWNvVUfNIgXkr9V1IK2saFBTH5MpIke4J4p/BRmARCCEVntoZ82awBdm5nNQG1bqOyLAc6ygpCqr6vwHhk1WoIZxeQ3VfrQx88nNVRG937iUBkXwVJLKOHeh4zPnAqhkfpkAbZ58T7WQt6sb4ivUPXOP0pggx4NXppuEN42DJtG8Yt7V4VMrdOmixK+RISUYlkXaYYnCZUBrAnVJRiUTM9msQkH6RtYq7jPefUW1eHy35k+daZ5hBLAenOjaQ1khEWwpZv8w93fP9Pg2BF0DP5uY51SWijN/4hPQWqWqXz7SeATRQ39AIWhiysCJ9MFDQKtIWZU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(36840700001)(2616005)(26005)(186003)(5660300002)(36860700001)(8676002)(6666004)(478600001)(426003)(83380400001)(4744005)(34070700002)(70206006)(86362001)(70586007)(8936002)(316002)(110136005)(47076005)(82740400003)(4326008)(44832011)(356005)(36756003)(82310400003)(7696005)(336012)(1076003)(2906002)(81166007)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3413
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e0dd6e07-cfb2-4a98-5238-08d95cb26b6e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2DvGk5faxWDCBR3GCL+GePvhmWOLRgPlyWQXM9MO9W+knNnbGPZ5UsWmrpicEdlg86iRi8xxOqX8deT0QEnVSkDjgqQsa1XTaV4mDR6ykPtdldnuc4d6iBFflTj/bz5iQcLDmeFd219ybFrFz6PeArONI6ymca/C1lTNDO3T0kEL+QG3mmEDtRKFgjMaeUq6gOe+8J4rg0K0o75eS6GI12YRIEH4hUoIxEFb4hykmibr3k2rsNUrqsTb1V9jPTyOJYGAF999mXG4w/ASN8PkvQFSp+NgCJhZtrrYqMyqCNA5TvDriRIEz0IgUe2wMVna8NMlzlv1ArKXEJStV62jwJsEHDx6khjUVBewRc/GmUU6FPaVlgNu63Z+LCBCcSNKH3mmzY++HU59ecj9bU2EFzMI9MEv2H5AsQPSCvYIY2OUluSs2AWZVo+zEbTVbbkEujXcymIwVLaY3eHYLwHSiC1flBCOQV4Oj/D/XjYhBnMLEy+y9gI2mBr7GASkYgtJ33k6CvFUv8gMiUJuOCvEfqfDVVrSGZBU0wZp/ySwdTtLcBjsDFShMpUUqC/orBbzSB/I06vE7DoMX3gss99Gb3nWA8hKF3zh2h1L7mT0uaLXflwqv8N8ErxbTJSap9GA3p+zW75HU9emfgdwnhiySSXFMRl7h7+h3Tw/FNvIrKqKwOdz/mUOf+bEcPfVI1dtJ2oL/KLod+BemUQbXEhlqUDCu7P2N0XEfyYissnWPT8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4744005)(1076003)(70586007)(70206006)(86362001)(44832011)(36756003)(508600001)(4326008)(6666004)(2616005)(83380400001)(110136005)(82310400003)(316002)(186003)(81166007)(7696005)(47076005)(8936002)(426003)(336012)(26005)(2906002)(8676002)(5660300002)(36860700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:10.1734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7d66aa-b870-4415-8397-08d95cb26ffb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2874

Now, we can use the same function for ACPI and device tree based
NUMA to scan memory nodes.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/common/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/numa.c b/xen/common/numa.c
index 8ca13e27d1..d15c2fc311 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -381,7 +381,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
         return;
 #endif
 
-#ifdef CONFIG_ACPI_NUMA
+#if defined(CONFIG_ACPI_NUMA) || defined(CONFIG_DEVICE_TREE_NUMA)
     if ( !numa_off && !numa_scan_nodes((u64)start_pfn << PAGE_SHIFT,
          (u64)end_pfn << PAGE_SHIFT) )
         return;
-- 
2.25.1


