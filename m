Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58863530984
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335353.559541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WD-0000LN-H9; Mon, 23 May 2022 06:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335353.559541; Mon, 23 May 2022 06:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WD-0000Ga-B3; Mon, 23 May 2022 06:26:17 +0000
Received: by outflank-mailman (input) for mailman id 335353;
 Mon, 23 May 2022 06:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eb4B=V7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nt1WC-0008Q2-2c
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:26:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e95f427-da61-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 08:26:14 +0200 (CEST)
Received: from AM5PR0701CA0014.eurprd07.prod.outlook.com
 (2603:10a6:203:51::24) by AM0PR08MB3827.eurprd08.prod.outlook.com
 (2603:10a6:208:104::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 06:26:06 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::69) by AM5PR0701CA0014.outlook.office365.com
 (2603:10a6:203:51::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.12 via Frontend
 Transport; Mon, 23 May 2022 06:26:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:05 +0000
Received: ("Tessian outbound 6580ae46f51e:v119");
 Mon, 23 May 2022 06:26:05 +0000
Received: from da875ee8d977.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 21F0A427-C99C-43AC-8521-962A7984EE93.1; 
 Mon, 23 May 2022 06:25:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da875ee8d977.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 May 2022 06:25:58 +0000
Received: from AM6P193CA0110.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::15)
 by AM6PR08MB3336.eurprd08.prod.outlook.com (2603:10a6:209:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Mon, 23 May
 2022 06:25:56 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::f) by AM6P193CA0110.outlook.office365.com
 (2603:10a6:209:85::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Mon, 23 May 2022 06:25:56 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:25:55 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 23 May
 2022 06:25:54 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Mon, 23
 May 2022 06:25:53 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 23 May 2022 06:25:51 +0000
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
X-Inumbo-ID: 3e95f427-da61-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Y7m3nVdANowdvf2tVP9Es8exkjovarxVOk4cOG+cJN0dHqaNQ0yAT7bz7RtizrPAVo5YfiWa1suOvKV1EHOV+sQ35RnoAxWVGxhyX9nVsNMzSlAkkzpkERtCXeXDO88AihZxvuzWIP6h3FUR2ZOQuAJyraWo8a6AMQI85kKQyJtfjVRfwj3mTI8lSasNXXFOKYWaDRMMgKxMVhXcM/8Wnp6sJTUysc973ZJa6qgZflb6DMJZJiy0hDoGduK63h7tad1gj/9NDGLIf8UO+brzycTmseuVxsdB6ccYIVCpxBDUxXx06465Xs+nVVHHc5nR+Y/QQRRhDbFFUpm2Gm5OfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3Bvh2fxVQKbOjJTKRlirSTts06RHaeGkbdUGi12wmA=;
 b=Cpf1lZ1/0dK7htdifj13RRQ20fB8tNeVOoIdRL/XFuIHW0ryFgEyv8JlFOAMbJnCeIKofG3ZXuOKLgP08Jakt6K9GT9gf/xvsUSeMkvlE9oysQ4oPIuhUIEaKT/S4Tgiywct3DowTpxEOvy7bWXKn2NUNg9yGVUH+Kvklyp509VNXGT2nbAteObRZQl0jr0xn5PE0wlLsY8HqxpkaHSsInU8TjYE4EerqMsTkNoS5nvB9GZmjXhaLDoimQkObGFNTSljWE1UtpfK/+LRrkjSa1B2em2xLTKBRc//gb3bUXFRnui8szVQi5xKMJ8JIDEJ7sTh4yrPxbXeG+oA5MP0Wg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3Bvh2fxVQKbOjJTKRlirSTts06RHaeGkbdUGi12wmA=;
 b=xULc6Pedz5pXWao5FTyRojNZ+Hgs/001uB45mBEqr24NcvA6mgM2la3n0g5rj9zkszCOyV2leGK7UmFuDegi09hHznruI2Vg+2cHxmIJicE6X00I3N5xCqo4kmfA6gXv1t9tUny39AGa4YRTgrQ2/Ft3G6KXOxIQUxd4D8/1Vzg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 270bdc83925346d5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QP7UzN22hKthGQljDyM+tGb4qsuKWMnWw59lwAbVwIgO+XSB6BZktXkEloXC4dD9tHalNq0Xk0gYfBEGosCwW3WLbSWF+7ZffBRXqWZ5H1G5h9IQU/ktZVHmGOJLac6mUFUWeqC9n9HxsyRAm0bRi9Ebtm84dC+FZiNCmt4v5KhqFONRSgYv/O9ZBptDlfeQMqcZS0UiT9Y/BgiOuddIB2ZvqlwWDcRAfrDZR5NBG0S+91SpKjmIeVY2nWTkoSmQjHc4CMCKwIeqoTPI6PYddBbXOfsT3lwsJ4FTLfss8oSkupRuz441uYPBlJT/4+vu0oFnxmgiBh/pRceXrlkjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3Bvh2fxVQKbOjJTKRlirSTts06RHaeGkbdUGi12wmA=;
 b=XuJQ8gKFZppNJVytLZ13qHoeaPRFZpFkpMH5sb/UDuQc4J2Fkm/ofuamnB1ApHLKfXWPgeF0hdSuppieqXnfvAQYRENc0H+inQ4jLV872DoM9EgQFcTCOU7F19UAIXIjLssunTbMjORE/F3bzIud1RVdGydDTsIwO0K//hoV6WUBue/ECSY0v/NH3oycV0yikapFOE5WUPoTnQh/l7gV1vcWxvzINY2WipXLFmNVhx7+AhE2FKRv6UkjlJHWZc7/Ry7xjVigciDAkeP4HZ/A45aDRbm13outmgchP+olwQ+2IeiMJASbhygSYW8AwBIu4MsacdmcpPPa7C+SBQhAQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3Bvh2fxVQKbOjJTKRlirSTts06RHaeGkbdUGi12wmA=;
 b=xULc6Pedz5pXWao5FTyRojNZ+Hgs/001uB45mBEqr24NcvA6mgM2la3n0g5rj9zkszCOyV2leGK7UmFuDegi09hHznruI2Vg+2cHxmIJicE6X00I3N5xCqo4kmfA6gXv1t9tUny39AGa4YRTgrQ2/Ft3G6KXOxIQUxd4D8/1Vzg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v4 2/8] xen/arm: Keep memory nodes in device tree when Xen boots from EFI
Date: Mon, 23 May 2022 14:25:19 +0800
Message-ID: <20220523062525.2504290-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523062525.2504290-1-wei.chen@arm.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 5b99b23b-7e10-433b-8d7e-08da3c851e22
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB3336:EE_|VE1EUR03FT064:EE_|AM0PR08MB3827:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB382791A1A351E3425C671C839ED49@AM0PR08MB3827.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cf2B1NtiL6CTXvhKzZ9LIItc1aGkDmOatslT44HU/4DRyUijrLnX0nX2liXVFal5TLSJwFckhxrh6mycj1VzzZe+cGbJb1T/ZGiHkOii13CVcDBNgzo7RcwvppyI1qqsV7sidG0Lad5V9pymZUUVZpAFwT6eFLhfPQyR6tMnMojRpfClNdvcfB313CjZ1kSqXK0aZzINyHsva0vmBzXPGdkQC9vqHxLloki9vUSL9UiIiYGFmET7Jq5Q30dhviHyDuZMrof2DUnAWAUsVn1kMdslOOOG2KxSnJJD+n1xG2VMKmG3xTJhkUYJ2w6nsmB6SrO1W/BD6CF++Zyc2ukaWMndvegsdMFt+gVJ8Kf9Oh2SHWOaU3zsC+g8TSyp0h8Em5WfrQTN6Uth+ZCN1ajVS3LfSevIJpyC6JkaMJ13CVUBIjy7cHqSddO+sEAA81InmHvNRp2GyLOZIKhDDXgv4sbDMHRGcYHQmuG4CkvASqzORR+rjTtE1stW9dh0GB6j2b5Uhl0dtWpiI9/uq5SqRfxUp4eN7bP4jOTWRB2SUGQx8pUmgPTU9ylSexQdew4xaVv0oMVhcGp7/EjgCEyXyGzoK6KybHe3hnIa/mg6Xnpq8X2jQQz57Y723cQomgVg9UT4rWUuWUVKWpADNeiiphncaSrUyhU/39LYWQj28uP35MAftF1mRLh+TSn1pIa9Zw3i+m6Wqt2e106dJLw5Ig==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(44832011)(426003)(36860700001)(508600001)(6916009)(47076005)(336012)(54906003)(1076003)(40460700003)(83380400001)(2906002)(316002)(26005)(6666004)(70206006)(7696005)(86362001)(356005)(2616005)(82310400005)(5660300002)(8676002)(70586007)(36756003)(8936002)(186003)(81166007)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3336
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3545e596-d5a7-4818-057b-08da3c8517e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AB3k6r/Nx8px9orO3za25NCNhRjOJecfHwWOt/fxvC3W3p3vTI8tCVYSLcRFjUXL3DWYoEFwKQBOqnaKQeiwtzsX7lNnD45KjqT3fuYSQK4HwNKHWzn5/NRtDYZctIUyA0sNsH2Q+8Ts3GSnWM+NEjtj8O11MTVY6k7aAv4IwTN5lw6bd1EqPJWWLGV19Ow8mYdr26FEJy6hD3Twr/dyJCc8f4lQ8slhQpy2RuMgh374w6WsWpVmTjmuDO1kOBIeOk0+0gqt4v0Pgex9uVPgZTaXQodt2j0Ca9IHE1jynRPYgjMfToFc3n25wX6yNZKk6U3wsbmPX3JMjJ2eUDB0KpOGhNW2+iK4ZCXqTU1TGBZrCOarz0pUpkTwwuAfTaU8DrlzIArbLWrCrl5geHKAmmBNaFw4547b+Wqn7xQVafi6e2Y7Mk+Mk5bRpxTBW6qcndg7ETGJXZGdxvm921YLqijGUzWmPo0pI9BQEa/ZC6IOM08hojRUoJd2I4lgrV76TKFRoi4aGjnD6kMm9XmgSeHWJC56UZhCdauryh8lJVkvDQEZyNr3jvMsV/oWFQ0Tlczd9VI9/MlTnXbem98uqBpfVG64AmggKQ3CLomN4NRyYz6v0/zXMqHv8gGhIFl6xHmvFDhRsd1dvIJQCvr7REimEqSGRci1SPMSAEvMTJj8M9xhJwp42nH9YeFH8OJH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(5660300002)(70586007)(70206006)(8676002)(26005)(44832011)(86362001)(4326008)(8936002)(2906002)(40460700003)(81166007)(6666004)(54906003)(6916009)(508600001)(186003)(1076003)(336012)(7696005)(82310400005)(426003)(47076005)(36860700001)(2616005)(83380400001)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 06:26:05.9216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b99b23b-7e10-433b-8d7e-08da3c851e22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3827

In current code, when Xen is booting from EFI, it will delete
all memory nodes in device tree. This would work well in current
stage, because Xen can get memory map from EFI system table.
However, EFI system table cannot completely replace memory nodes
of device tree. EFI system table doesn't contain memory NUMA
information. Xen depends on ACPI SRAT or device tree memory nodes
to parse memory blocks' NUMA mapping. So in EFI + DTB boot, Xen
doesn't have any method to get numa-node-id for memory blocks any
more. This makes device tree based NUMA support become impossible
for Xen in EFI + DTB boot.

So in this patch, we will keep memory nodes in device tree for
NUMA code to parse memory numa-node-id later.

As a side effect, if we still parse boot memory information in
early_scan_node, bootmem.info will calculate memory ranges in
memory nodes twice. So we have to prevent early_scan_node to
parse memory nodes in EFI boot.

Change-Id: Ia1acab203887114c9f31cb3eeeb38794868efc9d
Issue-Id: SCM-2240
Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 -> v4:
1. No change.
v2 -> v3:
1. Add Rb.
v1 -> v2:
1. Move this patch from later to early of this series.
2. Refine commit message.
---
 xen/arch/arm/bootfdt.c      |  8 +++++++-
 xen/arch/arm/efi/efi-boot.h | 25 -------------------------
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 29671c8df0..ec81a45de9 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -11,6 +11,7 @@
 #include <xen/lib.h>
 #include <xen/kernel.h>
 #include <xen/init.h>
+#include <xen/efi.h>
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sort.h>
@@ -367,7 +368,12 @@ static int __init early_scan_node(const void *fdt,
 {
     int rc = 0;
 
-    if ( device_tree_node_matches(fdt, node, "memory") )
+    /*
+     * If Xen has been booted via UEFI, the memory banks are
+     * populated. So we should skip the parsing.
+     */
+    if ( !efi_enabled(EFI_BOOT) &&
+         device_tree_node_matches(fdt, node, "memory") )
         rc = process_memory_node(fdt, node, name, depth,
                                  address_cells, size_cells, &bootinfo.mem);
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index e452b687d8..59d93c24a1 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -231,33 +231,8 @@ EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
     int status;
     u32 fdt_val32;
     u64 fdt_val64;
-    int prev;
     int num_rsv;
 
-    /*
-     * Delete any memory nodes present.  The EFI memory map is the only
-     * memory description provided to Xen.
-     */
-    prev = 0;
-    for (;;)
-    {
-        const char *type;
-        int len;
-
-        node = fdt_next_node(fdt, prev, NULL);
-        if ( node < 0 )
-            break;
-
-        type = fdt_getprop(fdt, node, "device_type", &len);
-        if ( type && strncmp(type, "memory", len) == 0 )
-        {
-            fdt_del_node(fdt, node);
-            continue;
-        }
-
-        prev = node;
-    }
-
    /*
     * Delete all memory reserve map entries. When booting via UEFI,
     * kernel will use the UEFI memory map to find reserved regions.
-- 
2.25.1


