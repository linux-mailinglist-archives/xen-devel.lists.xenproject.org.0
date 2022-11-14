Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7789B6275FA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 07:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443090.697525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT3z-0001Kx-DE; Mon, 14 Nov 2022 06:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443090.697525; Mon, 14 Nov 2022 06:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT3z-0001Jg-9K; Mon, 14 Nov 2022 06:35:23 +0000
Received: by outflank-mailman (input) for mailman id 443090;
 Mon, 14 Nov 2022 06:35:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CFvb=3O=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ouT3x-0000je-Am
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 06:35:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60058.outbound.protection.outlook.com [40.107.6.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8283bc60-63e6-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 07:35:20 +0100 (CET)
Received: from AM6PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:20b:6e::39)
 by DBBPR08MB5900.eurprd08.prod.outlook.com (2603:10a6:10:200::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 06:35:18 +0000
Received: from VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::9f) by AM6PR02CA0026.outlook.office365.com
 (2603:10a6:20b:6e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT024.mail.protection.outlook.com (100.127.145.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:35:17 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Mon, 14 Nov 2022 06:35:17 +0000
Received: from f86e1ad6935a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 417D2173-24BE-462E-82A4-C024437D6604.1; 
 Mon, 14 Nov 2022 06:35:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f86e1ad6935a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 06:35:10 +0000
Received: from AM5PR0701CA0012.eurprd07.prod.outlook.com
 (2603:10a6:203:51::22) by AS8PR08MB9979.eurprd08.prod.outlook.com
 (2603:10a6:20b:633::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.5; Mon, 14 Nov
 2022 06:35:09 +0000
Received: from VI1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::ea) by AM5PR0701CA0012.outlook.office365.com
 (2603:10a6:203:51::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:09 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT037.mail.protection.outlook.com (100.127.145.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:35:08 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 14 Nov
 2022 06:35:06 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:03 +0000
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
X-Inumbo-ID: 8283bc60-63e6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hkjfLnulgTyObZoO0fVFr/lI4OKC+V2BhspmIrjXd4I9Rge3auZ1fGWZ3s7/WXm3aSQFvzRfX0PuTutvqgWHkYNeC729G73n661pL8hmTv6NAvcXiGbqIGAa4BM2Y+yiE1filgceD8mMeB7oH3TWLBqjA5Yj+tbAcVDVyXjSURLmNWuX5gsQnqQM27cM+DGYKZyDun2sROSCjjAvHSnRbRVYfXBhNXur7v++LiR5KEGdNFvoqs5mpRLpwHc44T//jYY4+MStmpYNmK2c48vJaFA/bc8iNK5TIPwbQY17dIhgdq4dAChE9miPRffvcXIBTZfjerE0PihuSjiajQ1NSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brakFrnKNMC9j4IFSknCbUCY2g1RemWkZGm8rewRdUM=;
 b=gb5f0qfqrkxxiW3u86t9SuQF44IzXw8FlSpxwep1wALPJGKtgTLLgYHWICyMA/1t/gelkrdSN7aeagGYLv3lhpIss56QhmGfCUbpMN4R80bdKtm8hWNHc0xUMvMz8qmO3+9CMvpI1XFlmOpAmE3+QMoDIchg40TDUPhsmcV8gHwHZ2KKuz20ZyBpI/CJhxs6n/iifWe/ejj95OV9HJ2KSLopxJPYcSJepiP7VI0pB5sniQN6XUVV1C4jpkb/0eBJ8Cyp/uv64CdFmLDXo9hBQKYgKilDWSm8GSeSRS87skZk6hg7z5V1V4ZgeT+fGwYhRxmAWluXPyD1C+qUy3RmgA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brakFrnKNMC9j4IFSknCbUCY2g1RemWkZGm8rewRdUM=;
 b=ZdAGfM7nVK5fPS8KGNjPSTPPbfeHOVV6uXyU5yn6AOnBhdRtvNqPB0JXhZktKUJIWXHhbp7WHlsoy5hr48Jr/B0CGiXMLIfbqbFMNqW7zGgNHauHSpncKzv4o0jV2WgPdhLZ/iZlbUaKcZIwELtjfqURPd56DSTxs3neMEEz6ZY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8357d9c9261fc323
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nY8DYQTFCyb3KF0OQNUSNeJ611n4utt+xJy3rRanE/R8QMLFYKpb0O92zFUtiMQvGz7v5T+8fRepNhIoCZmVm79GUfiCZdsKXE3mCmR1RnCeX3FuZTGF3WqmZSnK9GCxqgi9Q4S/NuHZ3fG0GQI9ovu+KaKYi3Mczc4Wokg3FjcMLWoQHLO8P4FC3zLDqbLCueBpX+jSHr+C0tU70WbLIvum+bq1JJo81p1jTbN+4iRcZYgpEAqB5Y9Wy/N4M0ZhBspDtS9zKuwEheZ5OFN3xmPlNWobYFYXhMb32YKgghHXwCgsTt3Jqwp9Qww0oyFUuBBzPESnb2n7gMw4GkRgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brakFrnKNMC9j4IFSknCbUCY2g1RemWkZGm8rewRdUM=;
 b=kcyEcThEJ3MYYT7RZxK4Ka5mTTWD7v9fUD+zhowLDgNr7nNWkSvFJTkZ0RhblHm3zW9Z/KWEUwP0e1VVVYE808C/f1dbVex96MJ+JNi2OYppTu+mkIChlX5fBAHF9oCRabawvd6RRJIkRLKKwZszFILxemUiQErj9sGqepwkfvmtjLLHzsaGmK/RMWgwF58Nut9bBPNkdMhMhHnOi7q1pzkgu0bJa1n6ffkhA6FMQsOptg+uPg5xsKylP2YAckzDZXyZBxop8mVqEkQD4ZjJul8mqm/fVElnCD4g4/P+yyJRMk8+oMiwtCKJsq+gsZfPJgyrO7qwCGfzjq4lBEOHmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brakFrnKNMC9j4IFSknCbUCY2g1RemWkZGm8rewRdUM=;
 b=ZdAGfM7nVK5fPS8KGNjPSTPPbfeHOVV6uXyU5yn6AOnBhdRtvNqPB0JXhZktKUJIWXHhbp7WHlsoy5hr48Jr/B0CGiXMLIfbqbFMNqW7zGgNHauHSpncKzv4o0jV2WgPdhLZ/iZlbUaKcZIwELtjfqURPd56DSTxs3neMEEz6ZY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Jiamei Xie
	<jiamei.xie@arm.com>
Subject: [PATCH v8 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
Date: Mon, 14 Nov 2022 14:34:48 +0800
Message-ID: <20221114063451.473711-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114063451.473711-1-wei.chen@arm.com>
References: <20221114063451.473711-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT037:EE_|AS8PR08MB9979:EE_|VI1EUR03FT024:EE_|DBBPR08MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: ad26973c-3d69-4d28-fabf-08dac60a654d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eIFhIPK0bOwOdjipffFndQNmendCHrvKAUjSAI6ZIZyMtIJ/u5FYJnnC5AxiSfQQGKRwvM3E99gHVjRHmblS7O6RVJ5WK7AyhLs+jYp6YxXzn86YKtXTJfGQ5CfJuD/n8KtGz/zzovKvoZigq0l7IwJRYJo09UJ9Hn8cHzU5LUAJ9oNIh2DYYSMe/iovPEr8jeeX701uymwlWUrzt7Yu/hj89LqWVlvFaLnHEZSgdH5wdT3b547q+bftigh3VEtHg6yFvutrcifz4X0OrmmRp/qMHcuXKJ9Y8XV05RKf7GuazTc72+tqIJ9xwA9n6gmTvtHkb5DhggN1D32whu38gci27brdXwRtob0CK7WAqfxYJF3gEgTWGOzAn++Lnv1l0RDim5wsSUy3jCDsq0o+Jc1QMhVuHrx2Nwvie48sc1Bzfg45f17gKNnG4hayIvD5/+66svQb69x4CdZ+c25Y/iUID9LcxrrtONoEIHYM3FyH6NSOKGmfOXxiKeNNKztBAkGMAVN/Dpnb7jVZbK0zTqybB2UHcfy9daWoZU+HYE0tvANs3L+vxSF+JPFYLw0/emWQupHthrFjCXjPupph9NEl6zfVGWWAtryJcqW1Qeqk4yyzujbr7SYcBeP9OmQId45ZQbBXINqU257YvJXcZpsLvrCfH5PLW55BtXDo/FUcWhv3PUUzBMtWqQyAl0TbwAllxVsK48SLgghPqfa/RrDHUT6gqZ0U4SI4cHhzDvTIZgK9liNzX/xT/mWNdzVxvqZWarmWSM31hsoJM9cyYv7cKEFFU/yjadOODMmlN7eZKNo5aoXPM2iDCwW05Ghb
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(8936002)(54906003)(2906002)(316002)(44832011)(4326008)(6916009)(5660300002)(70206006)(70586007)(8676002)(36756003)(40460700003)(40480700001)(82310400005)(86362001)(36860700001)(47076005)(1076003)(2616005)(83380400001)(81166007)(186003)(356005)(426003)(82740400003)(336012)(26005)(41300700001)(478600001)(6666004)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9979
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d13e506-fdb3-44f5-8523-08dac60a600d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lbodbcb2G15TOtRmXjnv5qMee54jl0uycfH2GWN3CerLx3Je/ZbUPJaNy75jcz6rZwbP50G3OFIJDkFzj5o4uF03z4vDHlAf/WOGFucm4YHlKCJkSaI5PeZc0LB/+UKpz2byU86gTsPCMNbWfr2TUGCI4jPuuYRT6aQnWmlS0yVmIG+FIyD16e9Zv0GzTs7oQv8J2iJrur15TSecOXsyWz6yW8JSopmu7cjIApPChQ/j/F8s8oAe8/uZB3PAYrGO13TTIJGFeD7oZchN67UBUYSi4tVu4LUpxij9syNP1508tLqYZZftVK8k2y/mHIlylgd4V1V+N6YTIaG6VSsGLvB1piGzjkd7ERnhipb1+rKwjiiE/bOHut6sRpp+pJUaSAgOcjhJuT+6RsEBE9pNCZ7aVwjXmFC/QRHnVYXSTBXoXLZykxwF3tstl+eVo65aQ7wpE7QWJl9S2YbTwKLCrkmTPURmka6qa2OhjsrOEFdPvlWsQFE0LxlmHmclYBw02P534U4BqxlKWMQ0gWmlkyrvxXd9mXGe4ig8ryHkgLRBp2drsEi5kULRElRkrQPdWARxjlnDzeoOzgJ249UsqzsJulbuGqP9+3Ez9SZ9PY8l4SAQgCAgCmgy+yoKYff6fZT2n15Xdek98mqYpy2sQN0bBfUtVzpbPkBbVo3Ts/J+4fFwEkRirigmPOSh7zkZ8SZzAizrMF0NJqG5XL3vCjshsbxf/B6JH1eTRGDrYW6R6VaS7kdONyO7rcTGZB4X2JYVVKztMBIiwEw2ejf6BA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(44832011)(8936002)(2906002)(82310400005)(5660300002)(36756003)(478600001)(8676002)(316002)(6916009)(54906003)(36860700001)(70586007)(70206006)(26005)(41300700001)(4326008)(7696005)(6666004)(40480700001)(86362001)(83380400001)(1076003)(2616005)(336012)(426003)(186003)(40460700003)(81166007)(47076005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 06:35:17.6834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad26973c-3d69-4d28-fabf-08dac60a654d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5900

VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
results in two lines of error-checking code in phys_to_nid
that is not actually working and causing two compilation
errors:
1. error: "MAX_NUMNODES" undeclared (first use in this function).
   This is because in the common header file, "MAX_NUMNODES" is
   defined after the common header file includes the ARCH header
   file, where phys_to_nid has attempted to use "MAX_NUMNODES".
   This error was resolved after we moved the phys_to_nid from
   x86 ARCH header file to common header file.
2. error: wrong type argument to unary exclamation mark.
   This is because, the error-checking code contains !node_data[nid].
   But node_data is a data structure variable, it's not a pointer.

So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
enable the two lines of error-checking code. And fix the left
compilation errors by replacing !node_data[nid] to
!node_data[nid].node_spanned_pages. Although NUMA allows one node
can only have CPUs but without any memory. And node with 0 bytes
of memory might have an entry in memnodemap[] theoretically. But
that doesn't mean phys_to_nid can find any valid address from a
node with 0 bytes memory.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v7 -> v8:
1. No change.
v6 -> v7:
1. No change.
v5 -> v6:
1. No change.
v4 -> v5:
1. No change.
v3 -> v4:
1. No change.
v2 -> v3:
1. Remove unnecessary change items in history.
2. Add Acked-by.
v1 -> v2:
1. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
2. Adjust the conditional express for ASSERT.
3. Refine the justification of using !node_data[nid].node_spanned_pages.
---
 xen/include/xen/numa.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 5b3877344b..04556f3a6f 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -35,8 +35,6 @@ struct node {
 extern int compute_hash_shift(const struct node *nodes,
                               unsigned int numnodes, const nodeid_t *nodeids);
 
-#define VIRTUAL_BUG_ON(x)
-
 extern bool numa_off;
 
 extern void numa_add_cpu(unsigned int cpu);
@@ -69,9 +67,9 @@ extern struct node_data node_data[];
 static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
 {
     nodeid_t nid;
-    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
     nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
-    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
     return nid;
 }
 
-- 
2.25.1


