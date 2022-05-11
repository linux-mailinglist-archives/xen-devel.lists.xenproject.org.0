Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6B2522923
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 03:47:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326068.548934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRh-0005rU-Qh; Wed, 11 May 2022 01:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326068.548934; Wed, 11 May 2022 01:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRh-0005oB-LG; Wed, 11 May 2022 01:47:21 +0000
Received: by outflank-mailman (input) for mailman id 326068;
 Wed, 11 May 2022 01:47:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMk+=VT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nobRf-0004GU-7z
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 01:47:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a501202-d0cc-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 03:47:18 +0200 (CEST)
Received: from AS9PR06CA0375.eurprd06.prod.outlook.com (2603:10a6:20b:460::19)
 by VE1PR08MB5264.eurprd08.prod.outlook.com (2603:10a6:803:105::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 01:47:14 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::5a) by AS9PR06CA0375.outlook.office365.com
 (2603:10a6:20b:460::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21 via Frontend
 Transport; Wed, 11 May 2022 01:47:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:14 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Wed, 11 May 2022 01:47:13 +0000
Received: from 3b6bc433268b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F93D4BF4-9DEB-48C4-BE26-2F28D527AB6A.1; 
 Wed, 11 May 2022 01:47:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3b6bc433268b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 01:47:07 +0000
Received: from DB6PR1001CA0036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::22)
 by AS8PR08MB7251.eurprd08.prod.outlook.com (2603:10a6:20b:342::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Wed, 11 May
 2022 01:47:06 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::3b) by DB6PR1001CA0036.outlook.office365.com
 (2603:10a6:4:55::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Wed, 11 May 2022 01:47:06 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:05 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 11 May
 2022 01:47:10 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 11 May 2022 01:47:07 +0000
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
X-Inumbo-ID: 4a501202-d0cc-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Zv6yxqphhkd4vUjA6nkIjAcyKgGJqsrzoh9voTxuhGaxCj2z8InpHLpuOM2IX2nc4UZKH0hT8X0Kz1wwe6pm/Y3MG9ZueisoJEEDtg8vPObO6PLk1az7Ex386Knk9xPUB9FeNIXucARsyj4RFQQDMo/2JAhfLLxWMkCy8vfVXE/YlgjZ217W0Yt8oBcjP/Lrwt6LmijigueULZpFZm20mue+6awisia36WHWSmW1zmuJZc00Khzj2oOB6BIvp0P/I9UUOS3m5oaT8gegyAE6hcFWPgWQu2+tNaSAcYZ+i2KUSzdzMqNLVyZ/ilqCwYf6dH2P8fb83I4s7nB14YKVZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSt+Pu4jp4HTh5s3fyvo/zwavoKA0tqqNX8BCNWb2go=;
 b=iFcYnhgZ2r8yNgJvzsQGJlX+GfoRaT7zpSni2ieh2QP+eYFqCLOwRVVoJ2v+fqBYNdFf7BEdfmOMfYBaFZNKxCMLHbO2rSQ57VBTfdyi68K+9lxl/y8G5Zqr0wrWz26H7iWJE68OOMZvB+4D0SjEBIk5EdQkRLOniZH3vpzKPwWPGLxzohCLRNVqkFI3xyS5Eyg1560dOgBk80v20sx2hrjghjwylcj8IGFtfcL8Zxo4j2txLKzB1wxnyLHaY6RnCYHYy6V2/VM+8/DDe9WzCF4PPq47ev/jjYRWoOVTAl4Ibb0C+fEWtBdEfBdCBFXc5L/DEm/dIR81UcXcPTxp1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSt+Pu4jp4HTh5s3fyvo/zwavoKA0tqqNX8BCNWb2go=;
 b=bD9h99M2vQqHgxpnEefeD2D/TOb603Vy/aXfcsXVb/2flQzfwaCSdklxRDRCXtpzU7w4FSxEN/1SAJHjR4OqBTjjcFXq02BeaWYSYKzxv2kyFFZyJA7TVENXd1BAD6KnUoxkgepao6woK0Opaj+NrdLaI6BT779zGlEWGD2egpk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 139e08af208393d2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgkw1cPl6yGs945bQP4admDEBa+5+piGSUdm+VP5U+/dqGKyJVPT3PMP1jaMZb29DSKbBNpEGEqkh52+Wy31rQH+PqFzZOtQsgYt0ym3zXhzeQ2OP3i1SU8CIzp54rpaNCI+LtrrEyLCTfz7JFU45aZV62Bc1Laha6qlljfXiE9RVUqYFNH4+ZCs+ml6EY1nD6R+jH/DCDoRc84Ubh7xgizRdyO3TzKqUEBkEmJX7CSxAJnT+KG52mwBW1K+47HOEcMCIJkCePdn9AXwXzVvN+4Gq6TDdlheJ58PUpctwbq3cvxDiv63u3kqXeNRuOpDLg6NF++2Fw5odFp7gsiaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSt+Pu4jp4HTh5s3fyvo/zwavoKA0tqqNX8BCNWb2go=;
 b=cJQR/jg4c/mqT5N5fTBF1LEwXIDOrVF0/Ws8biiLi5d9/UzZO3RRDLqnJaw3qpfu2Nudf1hu4FjftYy9vs5VAwVQ1BQwb5xWUq6J06UX4MRskeVNGRtQZvaQq2ORHCNxyq32IKmTciGtekCVLyb3iZIIU1EgL0g1ILqR5kbh4D9A0ctNeVkA+ky24q3KrZNEp0BBN0kAq2utOP9LIoTNNvUu04cQQLKWCla7F2ItdOyieYhI3Mla7IYIiqYXhR9SHq4afkULcSBzhjn3RG3/bg9ccKF8wuG9fJtjIOlH1Cx3+MfQWa0bqKroxqN/5bbmZFj9neGKj/KYceHeJm8IGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSt+Pu4jp4HTh5s3fyvo/zwavoKA0tqqNX8BCNWb2go=;
 b=bD9h99M2vQqHgxpnEefeD2D/TOb603Vy/aXfcsXVb/2flQzfwaCSdklxRDRCXtpzU7w4FSxEN/1SAJHjR4OqBTjjcFXq02BeaWYSYKzxv2kyFFZyJA7TVENXd1BAD6KnUoxkgepao6woK0Opaj+NrdLaI6BT779zGlEWGD2egpk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jiamei Xie
	<jiamei.xie@arm.com>
Subject: [PATCH v3 5/9] xen: decouple NUMA from ACPI in Kconfig
Date: Wed, 11 May 2022 09:46:35 +0800
Message-ID: <20220511014639.197825-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511014639.197825-1-wei.chen@arm.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 71c6684c-5dd5-42ec-347f-08da32f02c33
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB7251:EE_|AM5EUR03FT013:EE_|VE1PR08MB5264:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5264BAF6C75DD5C94C86DCDE9EC89@VE1PR08MB5264.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f7qsmuAIAJZoOYhxrd3UhfQlQghtUZwF1/RvJlGmUp7xmzOX7vzceUYDSA9EoY4xsM9YPG7pPkRB3hjcfvI+bDvLd/Z+B7SFHIPyf8DCYrWiLBCNp+r22rbFrnWskGhhYQ92hVVsCkQyszzPKNdJNUE+pckd5f0yQ2Lwo+RGNOXNQ/ZKf6Y+giHK0R98+K1BzTMv1Ehn3CedFhd6Tz+feghHmhwF8/n7qZhd1W/P/neQFt/qayTlZRQEKUD2J1/4gGHl1IGR/1Ajp5wTi7c3ld8/IIbwrxH4NjA7p98zek4FU0pibKw8sL6fPrMlXiJDp0sdqAlZIUja2Oaoh5QoMfcKnSys9811D73tqW54lq0CychfQ1dYeWE7SZiwSQD16bdXWrUb7BtaQ39TM3j7n+cIjw3Rp+r2EInN+RpyLcZ1mZqMYi4S50ci+NT46JsdHYkxvPWKVHMJyIysQzcX3J9dPFRJWCEYls3a0THFg15xPTKRxJpkpN1wXb3FZFqj0SOgUts79LR3wKqiTFnCoOfYhyYd/dLW/jc2b2iUObWjR3csXBS77g8wY7N9GODeiFbRdmq80mfpFmJG8KJFEpKlBjtvGUyl9oP/RUDcErhSS7SWCT1ZK04arPNCwjvQ+a7P2361cOXu78gG6zdjp1X3zwKSCEcA/EQQMraVCNxkRQo6Gn0O7NJA2RKbHDKV7sRIQmT3z1yRMaF01/D2jg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(26005)(54906003)(7696005)(6916009)(5660300002)(6666004)(36756003)(8936002)(47076005)(336012)(426003)(186003)(2906002)(1076003)(44832011)(83380400001)(82310400005)(508600001)(36860700001)(86362001)(4326008)(70206006)(70586007)(316002)(2616005)(81166007)(8676002)(40460700003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7251
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f4fdfb8e-723b-4365-5eb7-08da32f02729
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U346wT5spcNvTnCNkWKjwYy9V18tvjyoqtYRG8rOVswdTLoDEJOSIrxNA3EZSOF6p8b4IDdKVV98A9WihX/wnpNzP0ts41F4K9Ahf+1Ugw42tyvOmhOd58fNsqik1ppJelKw5adz30ipQiW75+n97URs2QW6kMcY9VyE95f6+lhmFcNVnS06+GvtYGecR93zsSaBXHMyCkP2/2mdmvgtvpszuIPAmlfos3ZmcLVau/qYFMrDGFQ/NDwXw/ZST1TgQ9EzbcHbyMSU7ktuEreDR6duVw1wo82SPTB15QEJfVT/UC1qjD19Uum5IZbjkFWnt9kW2hedG0w+2RjoVw+vfPoGWqJqKiZU2SXsNCGH71e3MbSkIdkwso9RFbvLdJNWrkfPfJc6u+7JDiZBRnBZVz4hBMC5ZcnSDkWDplQ6hMoAGML+Kk1QZlX5HVXmx/4nBO0xAfT2fgDoEVVpY+oRmc8Fa4yWYJIceW9Gb6Lbk2BIaMJgkErTAd/nQej/ZDns0AVRmq0EhKwWqEjcCV4sC+bgj9pK4wKZ6iKmgvVYCzJAUIUoX4Q2oev9Mbwg4YIdUPUaREc/g8NjmwMBsNRHWA/DsSZrvy/LOpQuPu3KdWpyV3JEy3emJ4Fvf3JlD5AQVU7awpgWjtlZVWPl6qGqzTct1b8u7k3TuNEy2TnUHSgr8OzsEs3Ga5Pe2bj/ySFn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2616005)(5660300002)(36860700001)(26005)(40460700003)(6916009)(82310400005)(36756003)(4326008)(8676002)(336012)(426003)(1076003)(47076005)(70206006)(186003)(316002)(70586007)(54906003)(508600001)(6666004)(86362001)(2906002)(7696005)(8936002)(81166007)(83380400001)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 01:47:14.0840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c6684c-5dd5-42ec-347f-08da32f02c33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5264

In current Xen code only implements x86 ACPI-based NUMA support.
So in Xen Kconfig system, NUMA equals to ACPI_NUMA. x86 selects
NUMA by default, and CONFIG_ACPI_NUMA is hardcode in config.h.

In a follow-up patch, we will introduce support for NUMA using
the device tree. That means we will have two NUMA implementations,
so in this patch we decouple NUMA from ACPI based NUMA in Kconfig.
Make NUMA as a common feature, that device tree based NUMA also
can select it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v2 -> v3:
Add Tb.
v1 -> v2:
No change.
---
 xen/arch/x86/Kconfig              | 2 +-
 xen/arch/x86/include/asm/config.h | 1 -
 xen/common/Kconfig                | 3 +++
 xen/drivers/acpi/Kconfig          | 3 ++-
 xen/drivers/acpi/Makefile         | 2 +-
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 06d6fbc864..1e31edc99f 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -6,6 +6,7 @@ config X86
 	def_bool y
 	select ACPI
 	select ACPI_LEGACY_TABLES_LOOKUP
+	select ACPI_NUMA
 	select ALTERNATIVE_CALL
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
@@ -26,7 +27,6 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
-	select NUMA
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index de20642524..07bcd15831 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -31,7 +31,6 @@
 /* Intel P4 currently has largest cache line (L2 line size is 128 bytes). */
 #define CONFIG_X86_L1_CACHE_SHIFT 7
 
-#define CONFIG_ACPI_NUMA 1
 #define CONFIG_ACPI_SRAT 1
 #define CONFIG_ACPI_CSTATE 1
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d921c74d61..d65add3fc6 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -70,6 +70,9 @@ config MEM_ACCESS
 config NEEDS_LIBELF
 	bool
 
+config NUMA
+	bool
+
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM
diff --git a/xen/drivers/acpi/Kconfig b/xen/drivers/acpi/Kconfig
index b64d3731fb..e3f3d8f4b1 100644
--- a/xen/drivers/acpi/Kconfig
+++ b/xen/drivers/acpi/Kconfig
@@ -5,5 +5,6 @@ config ACPI
 config ACPI_LEGACY_TABLES_LOOKUP
 	bool
 
-config NUMA
+config ACPI_NUMA
 	bool
+	select NUMA
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 4f8e97228e..2fc5230253 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -3,7 +3,7 @@ obj-y += utilities/
 obj-$(CONFIG_X86) += apei/
 
 obj-bin-y += tables.init.o
-obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
 obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
 
-- 
2.25.1


