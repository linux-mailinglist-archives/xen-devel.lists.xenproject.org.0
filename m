Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04437545BF0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 07:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345799.571529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXat-0000Am-1c; Fri, 10 Jun 2022 05:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345799.571529; Fri, 10 Jun 2022 05:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXas-0008WN-FV; Fri, 10 Jun 2022 05:54:02 +0000
Received: by outflank-mailman (input) for mailman id 345799;
 Fri, 10 Jun 2022 05:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4Vh=WR=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nzXaq-00078y-PR
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 05:54:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b86ad248-e881-11ec-8b38-e96605d6a9a5;
 Fri, 10 Jun 2022 07:53:58 +0200 (CEST)
Received: from AS9PR06CA0366.eurprd06.prod.outlook.com (2603:10a6:20b:460::6)
 by VI1PR08MB5422.eurprd08.prod.outlook.com (2603:10a6:803:12e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 05:53:54 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::6f) by AS9PR06CA0366.outlook.office365.com
 (2603:10a6:20b:460::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:53 +0000
Received: ("Tessian outbound 6f53897bcd4e:v120");
 Fri, 10 Jun 2022 05:53:53 +0000
Received: from 2aee9bf77758.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FF9551B2-4BA4-46DC-8346-2B400D2B4580.1; 
 Fri, 10 Jun 2022 05:53:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2aee9bf77758.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Jun 2022 05:53:47 +0000
Received: from AM7PR02CA0019.eurprd02.prod.outlook.com (2603:10a6:20b:100::29)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 10 Jun
 2022 05:53:44 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::30) by AM7PR02CA0019.outlook.office365.com
 (2603:10a6:20b:100::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:44 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:44 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 10 Jun
 2022 05:53:42 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:39 +0000
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
X-Inumbo-ID: b86ad248-e881-11ec-8b38-e96605d6a9a5
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NKIKsuhwg6NHQyPfd4H1aAMUNMkPpGJgXSyLolAjD7UD/cFaKUGuSX8X+nFxJ15GJIsGyhxVmuZ9/yr16yCaqY17xXlMpb6hR3mvv5BRRQjdRF/ByaBOC4pXDS/BII/A9pF7D64XlSSab64kFu0WOEQ8LAgOD0QYVpy5h4DqsKxYgyl/PZxHgxQm8sAafpqtNAgddzeCkU5EQtv+Bi+lknjiLPIJ08puo3kZbcbXf4JfO2lw3dRDQTYfY+XWd8gXHdfbpQjCNkWRa4gE54Ms25+ia8DPQ1rD8/OhWWuA9k7rA4S84LJxh5JLl58zbP+e2qUBQmlYee/bwHjJHkSQkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtTv1hIwjELwhmX84zR7R+LRlUkqarX1yb6jS7tn1R4=;
 b=VTBWJLjseepp3Ixtv0PBBS2+n19xx/0a88//HtySbawr38rSF2eHss+T1YoagMF8EE+QMKshPfJ7ABGP6Tsw9FcF86KEgYY+bEIBqNAjKbLQ8jMgwRds2wbMGmAfD7CRbLxkIEOdL+MUBGHZE75ED5irJkPvWl3klonf6x5/98Ma7VNF4ro+bufL9npyfG/wfLA6KE9YDDXiOMQWTRqyPb7kDcZAgcyYR53hsG0+NAgLyTzu0d9y4jloPbcT6xUBX7Vc9vJy4tjZhQvvyulT+wQPqvcQWkUOfn/8o9qO2KCIV40UXVnxDxNdAjlPWgaXwoTwO0LBzvw5467lv7cSjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtTv1hIwjELwhmX84zR7R+LRlUkqarX1yb6jS7tn1R4=;
 b=ERyGcs6zLVtmtlfUFnraYd+RnmZbeQcreQug1uJGVq/ZmmkMaC/n7OqGtI4UOwEyYbjHPRmr6PXn3MdLbl4nT6MODLjGuFpcFIpGc3isWfy5HNjpZIza15TPYu3YgEQy9xyOM/bswZ47O6qwHboqqjC4HLctcGPEzfqeIuy+3n4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90f9115dc96b2a2f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXtUBV30FTrjgt+2vmyRNVGDJ9boZ2xnuAlcGcYdSDWPUV1lLYerpeMMzz3202Omq5TswlcWfEuJ4YUIrApUs0qj/QuBWvp/31jrNJ4pBOXyn1p0TsQhVczxTl4LhHkewXgJxgpb2ZscUYp5c3X4avyL13PjgyrSOBKYudCu8RKqASNyKYC3JyPimsB14f3dTiCx0BjBs4GhIssuWVNGUwhW/rghN9ukB+j8QCzONaWpoQcSYU2QfDFkUr/+b4iAZhArgiQKuuK3s2g8SGTGHX7e/Hrotna1W71/q8yi8Q8cOhWpStE/u+3BdMAcobSTIg55nxpSJcreteM0t7+xog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtTv1hIwjELwhmX84zR7R+LRlUkqarX1yb6jS7tn1R4=;
 b=jiCbxPZPInsleCVWOtE3Wjum31vNC5YCKu8OZpzv1gNcNGf2gAJcH2fJXCepV315YvpPA29CrGrHMH0v4y/+tEAZsSeZ7KK/FpxpfAMfHkEYpQ3lSBZzfi/BXWLW6nD8IGKPC/8zbg+C2YbwA4tBs4E4/PZD9UBdeeEmRthpQUFZckyexiw4yhC3zFJBnSsdDlp0nRfexNlP9JzRjzMUQ5wQ8zQB/MOXj3JTMHpKvEVbyznekTaSKE2qdj5FpVcG+CUeAB2x5wjHMd1MUCpg2dywcJRMTTpVayxjYSPj0Fq0GnX2ki2N2d8Pz86x8TUc/3evgYY1djdb9LiP0b6MIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtTv1hIwjELwhmX84zR7R+LRlUkqarX1yb6jS7tn1R4=;
 b=ERyGcs6zLVtmtlfUFnraYd+RnmZbeQcreQug1uJGVq/ZmmkMaC/n7OqGtI4UOwEyYbjHPRmr6PXn3MdLbl4nT6MODLjGuFpcFIpGc3isWfy5HNjpZIza15TPYu3YgEQy9xyOM/bswZ47O6qwHboqqjC4HLctcGPEzfqeIuy+3n4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v6 6/8] xen/x86: use paddr_t for addresses in NUMA node structure
Date: Fri, 10 Jun 2022 13:53:14 +0800
Message-ID: <20220610055316.2197571-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610055316.2197571-1-wei.chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 0d80f136-8adc-4d32-46b7-08da4aa599ec
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB3864:EE_|VE1EUR03FT041:EE_|VI1PR08MB5422:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB54225928E0831DE193C75CB59EA69@VI1PR08MB5422.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 keccJe/YM9mtW1kZVaz/GVHp0cOMLOVwGXe0iUbMR8vTYch6V2NpidGo6mXg9Yob09r3nO5rRPPd4qPXR9XqCn3Z05PVrHeDwm76iI1Ae3ZcovWZVY4SeTG8HtiOZvc94iG9ixyMv1x/SdIwN+7koUirbsCLPmpCw+Ae7js6DZWChtBPsgSK1T+mZ3fFLWImUVO/yHre/68eycmz3Gf1lgGD/IoeWzd8KWebOXoboynfYiT0dOMntTXjG5Y6XnuFrj6WgyEJ+nPtr0ylPh9TV8eMTMNHGaEHXnI53f3qP65Ib527HB8GvPEpnkkAKBMAB/V+YdeDOXsUUw6lSA7by+Ggk+VBzElBanERyLjApR5H11vrpU6W+4BF6v24lSH2vSqEy7uZRNA6t1+FM+S69dK1Q51xBQbgOII4YiqvtOhfsghoM3EgoMczgQz8QsFMjQxmdr40qQgNrR2TupRtPQzCOjLBqWkCdboKhGaLxQIRTT5GJam2ti5CpSHSH5edX4DVKChDfJ53xEa/jTdSP9DD44f3YUs7QtYHJhQ4Ms0raOLIydx+6Wbyh3q0bLHuokg2mMy4PpqH+V08nrr6mFOtvvt7j2Uh4IfWok/E6fl3Nd0cmRiVK4tAxlErEE6IE+BlCDv7tMuYv6DhnNjkwIvXTYaIr8sprKuKVaegzaFnyAQcHmgX6B0DitdPrsg7Hg5WK5kz/SnvVdNNT4/AtA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36860700001)(40460700003)(508600001)(36756003)(83380400001)(47076005)(426003)(82310400005)(336012)(2906002)(44832011)(5660300002)(186003)(6916009)(70206006)(8676002)(54906003)(316002)(2616005)(1076003)(8936002)(70586007)(86362001)(4326008)(81166007)(6666004)(7696005)(356005)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3864
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	98df04af-478d-4930-b939-08da4aa59481
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EIbmVwp9cvP9KVpFDOfm6bbD6gOx0Un++wSivO4Issb4qiAJ10NR5SoCgrOgGA/7GI0noX5LPCODQyq47kCdR7o1r78RiCEM+T+n6pKRnyYsXkEkc0pnWvrsK3+Xrqgf7XMhpzsv1zhwVs0KieY4RAONo3zwLoSy0m9ZDbTTocp4CwuIMlFqIXRzoKShKT8SWRn1+8Fn/uXCRApq6wxRwhmG3Mh2YtcaCl09haBlK0dEkVo4njRW/92cRpU5MEh3QqhiLxYcnqiPPA6LEfMyTCr2EZW61N1C/9jrZp76XgjnbvxCfhyGsGTiowNz5w50GU+ncHTKhtci5zSsrVw7A9CzDNHAWi/rg48IZ/nhxXrg/n0zXrUMe9LzZU/zr4zHm9pN4BQCqtHXGSjSMmAXdgyux5TC1shPa8iB53IjY5+En5l1s/tI1Le5flMQ0UM6Wv8tux5Kqgcle2rPan6sXw4LtyS7r6Btr3gQeOn8/92+NZ2iUYyeUKFih11UM9YMUdztVcD6ll/8qY+cuEACR78Jfg6s/gEHsqo23XJsYBhlmFOeyQVKudemp/cDWJ742m0Bgj7ptI9EPGoBSvwIdtgq0ilQ2NT4mWke2jNokosFjw2eOCI3o8y9Azk0wd6Aip7p4zehc07i94oYsofNstma7hW7ixqWgxuSjJEySxRlZBJTNaczZY03nEDu3Y9o
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(47076005)(426003)(7696005)(186003)(336012)(1076003)(4326008)(36756003)(508600001)(26005)(2616005)(6916009)(54906003)(2906002)(6666004)(8676002)(36860700001)(8936002)(82310400005)(44832011)(316002)(5660300002)(40460700003)(83380400001)(81166007)(86362001)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 05:53:53.7252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d80f136-8adc-4d32-46b7-08da4aa599ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5422

NUMA node structure "struct node" is using u64 as node memory
range. In order to make other architectures can reuse this
NUMA node relative code, we replace the u64 to paddr_t. And
use pfn_to_paddr and paddr_to_pfn to replace explicit shift
operations. The relate PRIx64 in print messages have been
replaced by PRIpaddr at the same time. And some being-phased-out
types like u64 in the lines we have touched also have been
converted to uint64_t or unsigned long.

Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
1. Add Tb.
v2 -> v3:
1. Use uint64_t for size in acpi_scan_nodes, make it be
   consistent with numa_emulation.
2. Add Tb.
v1 -> v2:
1. Drop useless cast.
2. Use initializers of the variables.
3. Replace u64 by uint64_t.
4. Use unsigned long for start_pfn and end_pfn.
---
 xen/arch/x86/include/asm/numa.h |  8 ++++----
 xen/arch/x86/numa.c             | 32 +++++++++++++++-----------------
 xen/arch/x86/srat.c             | 25 +++++++++++++------------
 3 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 5d8385f2e1..c32ccffde3 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -18,7 +18,7 @@ extern cpumask_t     node_to_cpumask[];
 #define node_to_cpumask(node)    (node_to_cpumask[node])
 
 struct node { 
-	u64 start,end; 
+	paddr_t start, end;
 };
 
 extern int compute_hash_shift(struct node *nodes, int numnodes,
@@ -38,7 +38,7 @@ extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
@@ -76,9 +76,9 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 				 NODE_DATA(nid)->node_spanned_pages)
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
-extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
+extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
 
-void srat_parse_regions(u64 addr);
+void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 680b7d9002..627ae8aa95 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -162,12 +162,10 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
     return shift;
 }
 /* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
-{ 
-    unsigned long start_pfn, end_pfn;
-
-    start_pfn = start >> PAGE_SHIFT;
-    end_pfn = end >> PAGE_SHIFT;
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
+    unsigned long start_pfn = paddr_to_pfn(start);
+    unsigned long end_pfn = paddr_to_pfn(end);
 
     NODE_DATA(nodeid)->node_start_pfn = start_pfn;
     NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
@@ -198,11 +196,12 @@ void __init numa_init_array(void)
 static int numa_fake __initdata = 0;
 
 /* Numa emulation */
-static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
 {
     int i;
     struct node nodes[MAX_NUMNODES];
-    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
+    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
 
     /* Kludge needed for the hash function */
     if ( hweight64(sz) > 1 )
@@ -218,9 +217,9 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
     memset(&nodes,0,sizeof(nodes));
     for ( i = 0; i < numa_fake; i++ )
     {
-        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
+        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
         if ( i == numa_fake - 1 )
-            sz = (end_pfn<<PAGE_SHIFT) - nodes[i].start;
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
         nodes[i].end = nodes[i].start + sz;
         printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
                i,
@@ -246,6 +245,8 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
 void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 { 
     int i;
+    paddr_t start = pfn_to_paddr(start_pfn);
+    paddr_t end = pfn_to_paddr(end_pfn);
 
 #ifdef CONFIG_NUMA_EMU
     if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
@@ -253,17 +254,15 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 #endif
 
 #ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
-         (u64)end_pfn << PAGE_SHIFT) )
+    if ( !numa_off && !acpi_scan_nodes(start, end) )
         return;
 #endif
 
     printk(KERN_INFO "%s\n",
            numa_off ? "NUMA turned off" : "No NUMA configuration found");
 
-    printk(KERN_INFO "Faking a node at %016"PRIx64"-%016"PRIx64"\n",
-           (u64)start_pfn << PAGE_SHIFT,
-           (u64)end_pfn << PAGE_SHIFT);
+    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
+           start, end);
     /* setup dummy node covering all memory */
     memnode_shift = BITS_PER_LONG - 1;
     memnodemap = _memnodemap;
@@ -276,8 +275,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     for ( i = 0; i < nr_cpu_ids; i++ )
         numa_set_node(i, 0);
     cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
-                    (u64)end_pfn << PAGE_SHIFT);
+    setup_node_bootmem(0, start, end);
 }
 
 void numa_add_cpu(int cpu)
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index cfe24c7e78..8ffe43bdfe 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -104,7 +104,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-int valid_numa_range(u64 start, u64 end, nodeid_t node)
+int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 {
 	int i;
 
@@ -119,7 +119,7 @@ int valid_numa_range(u64 start, u64 end, nodeid_t node)
 	return 0;
 }
 
-static __init int conflicting_memblks(u64 start, u64 end)
+static __init int conflicting_memblks(paddr_t start, paddr_t end)
 {
 	int i;
 
@@ -135,7 +135,7 @@ static __init int conflicting_memblks(u64 start, u64 end)
 	return -1;
 }
 
-static __init void cutoff_node(int i, u64 start, u64 end)
+static __init void cutoff_node(int i, paddr_t start, paddr_t end)
 {
 	struct node *nd = &nodes[i];
 	if (nd->start < start) {
@@ -275,7 +275,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
-	u64 start, end;
+	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
 	int i;
@@ -318,7 +318,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
 		                !test_bit(i, memblk_hotplug);
 
-		printk("%sSRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with itself (%"PRIx64"-%"PRIx64")\n",
+		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
 		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		if (mismatch) {
@@ -327,7 +327,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		}
 	} else {
 		printk(KERN_ERR
-		       "SRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with PXM %u (%"PRIx64"-%"PRIx64")\n",
+		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
 		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		bad_srat();
@@ -346,7 +346,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 				nd->end = end;
 		}
 	}
-	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIx64"-%"PRIx64"%s\n",
+	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
 	       node, pxm, start, end,
 	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
 
@@ -369,7 +369,7 @@ static int __init nodes_cover_memory(void)
 
 	for (i = 0; i < e820.nr_map; i++) {
 		int j, found;
-		unsigned long long start, end;
+		paddr_t start, end;
 
 		if (e820.map[i].type != E820_RAM) {
 			continue;
@@ -396,7 +396,7 @@ static int __init nodes_cover_memory(void)
 
 		if (start < end) {
 			printk(KERN_ERR "SRAT: No PXM for e820 range: "
-				"%016Lx - %016Lx\n", start, end);
+				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
 			return 0;
 		}
 	}
@@ -432,7 +432,7 @@ static int __init cf_check srat_parse_region(
 	return 0;
 }
 
-void __init srat_parse_regions(u64 addr)
+void __init srat_parse_regions(paddr_t addr)
 {
 	u64 mask;
 	unsigned int i;
@@ -457,7 +457,7 @@ void __init srat_parse_regions(u64 addr)
 }
 
 /* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(u64 start, u64 end)
+int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
@@ -489,7 +489,8 @@ int __init acpi_scan_nodes(u64 start, u64 end)
 	/* Finally register nodes */
 	for_each_node_mask(i, all_nodes_parsed)
 	{
-		u64 size = nodes[i].end - nodes[i].start;
+		uint64_t size = nodes[i].end - nodes[i].start;
+
 		if ( size == 0 )
 			printk(KERN_WARNING "SRAT: Node %u has no memory. "
 			       "BIOS Bug or mis-configured hardware?\n", i);
-- 
2.25.1


