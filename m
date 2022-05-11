Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CF2522922
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 03:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326067.548923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRc-0005Q3-Gq; Wed, 11 May 2022 01:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326067.548923; Wed, 11 May 2022 01:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRc-0005K8-9j; Wed, 11 May 2022 01:47:16 +0000
Received: by outflank-mailman (input) for mailman id 326067;
 Wed, 11 May 2022 01:47:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMk+=VT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nobRa-0004GM-Me
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 01:47:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47807436-d0cc-11ec-a406-831a346695d4;
 Wed, 11 May 2022 03:47:13 +0200 (CEST)
Received: from AS9P194CA0014.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::25)
 by AS8PR08MB6168.eurprd08.prod.outlook.com (2603:10a6:20b:294::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Wed, 11 May
 2022 01:47:12 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::c5) by AS9P194CA0014.outlook.office365.com
 (2603:10a6:20b:46d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 01:47:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 11 May 2022 01:47:11 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Wed, 11 May 2022 01:47:11 +0000
Received: from 9348a7c0bace.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 29CEBCAD-1E22-41EB-8331-B78B95476B4B.1; 
 Wed, 11 May 2022 01:47:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9348a7c0bace.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 01:47:04 +0000
Received: from DB6P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::19) by
 AS8PR08MB6168.eurprd08.prod.outlook.com (2603:10a6:20b:294::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.18; Wed, 11 May 2022 01:47:02 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::ab) by DB6P191CA0009.outlook.office365.com
 (2603:10a6:6:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 01:47:02 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:02 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 11 May
 2022 01:47:06 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 11 May 2022 01:47:03 +0000
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
X-Inumbo-ID: 47807436-d0cc-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YiKQ1FZZNHv/Je8IQtgbwbBMH6wuLh1BNvcKBiy5P1LnlHeepHb9mmuPLV4/bQwHKyMLpfrgYPDfszkrK09YShYng9hQVumYJOO7VUKL144d6F5QGHLFLOUBTQObi60zzyjTAFERkwDcMxf1fONHi3tOoUeI56V/tpKcNk8/onBSzUxPpAHJafv9YcZKox29G6bXUxCUZHdnK7mosZor7jdSz6gurWgzi+qv82T4Qom41hllbStutthAw85GvFZSDt4wBsONJiYJzfC05j18xBLbVVFK51p8+JY37QVHj2gAr+0w7TUaD8eBvBnVNvxSUyo9fBdl8yLavpOlfkhnEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPSfIwEjnBcSkjkYn/EHN2y2ss0WA2Wo+7fHC3m1wHA=;
 b=aHtTsncjJ/3fqjcEOoVPaJ+vVbHWwfsHwztj5HYVVQSFV3WZIbQTAehm7Ct8PRpGnKpG1ct8Fw+zPfaSyQfQZqTDk4oQVw0GksMK4ghE9cN93mrfzCWYVEw6TP2ByUTVQHBpMI3jw7i5ECrWAbG7fVJPELKHlFpLjexQEh0nD4zy++rItVVIKgsxJ0tz8WgPpYQbKVKJ7uQiDNB0YMrL6plY+z7U02/NhGoa6cPBJ85RLED9Ax5OdCZSZUujuyOcwH8zS3vGiEKARuC22XAgsvk57ecMky1yuYwVmVXmPXcg+WAVQa5mBq0GKpWALo8QRp4D+cLOlbg/F5kdD6Kh2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPSfIwEjnBcSkjkYn/EHN2y2ss0WA2Wo+7fHC3m1wHA=;
 b=eIvg2mMPDb19hnd2tZmD3Es495OepNSHX1ZbYsIQbURCzz1cz7Q3ZqpAOS3vQ6H+FxAHZAE6pRZCIBL+suT6/SqxIHzKlG66xEGGAJt56lLccJkEPZCSz8a2sbvltLnj++25CfqumFKqGJ02G226DvczgBD5AmPnMNSnTAcfNMg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7112f9e97c08240c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOw4vk8d6PaxtAWqKBSPAcuG1Wt0ABsIDKk6C6hd8d7pJyC/Z1/7KkERwbqNLfwA0DZDP0fSBX6tUgyepyEu7n+ZStSqFumIxmNB3nOXBiTOv6/ysDPsUHmc5s6Gl6+FRQBz5x6N3eFnvWHa7OM4LDvoZvSkmZI2r3BARzhuCKzyTaeHCRuh7Phzk9ZEVZXLMRviTpDiV+qEUJhjI2GB8cj2MhfTZwHVr++W9TyN4H9s59ammJHO/ak2Vet3lNKzQY1DkdXavH8R5uAYL6xxuhdLdASvFHLy+0fIWRi3xNRGcWf0o/pEXgl/IbLTl482Atd1zGN2IJOa6eSOdjjLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPSfIwEjnBcSkjkYn/EHN2y2ss0WA2Wo+7fHC3m1wHA=;
 b=eKvr/qiqMTxDc98TEiuYzexaz8pnjdORcXsQGlgrQGq2JIRgrgq72VSKQYec5yb8Y86w+D2yeJjAe1xgfYJQl1uWdTpQVb+JnWYAjs/eu4fl2CYJHoGxGdFihD7AkN96hPTdTWRsd/KkwoZKPUp/qJERBcTmN8C+lzrDfYDVkBIbT7sA8BC+ZaAOPRHt5oJcN3YknozfnswQRpRR6avSDx8V0irkf5VL1RvMmXNEsPObdsl1Lp8kuIqgjfMtSNXx8JFxZzXcsyG7+VZ5sWZjuyolT94XeBZccR2EsZIAzeegFW92mkBtWsjaz2hm4zNUDaW6gDr+NlICYKXOgPYFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPSfIwEjnBcSkjkYn/EHN2y2ss0WA2Wo+7fHC3m1wHA=;
 b=eIvg2mMPDb19hnd2tZmD3Es495OepNSHX1ZbYsIQbURCzz1cz7Q3ZqpAOS3vQ6H+FxAHZAE6pRZCIBL+suT6/SqxIHzKlG66xEGGAJt56lLccJkEPZCSz8a2sbvltLnj++25CfqumFKqGJ02G226DvczgBD5AmPnMNSnTAcfNMg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v3 4/9] xen: introduce an arch helper for default dma zone status
Date: Wed, 11 May 2022 09:46:34 +0800
Message-ID: <20220511014639.197825-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511014639.197825-1-wei.chen@arm.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 27ae987c-8635-4643-8295-08da32f02a8c
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB6168:EE_|AM5EUR03FT011:EE_|AS8PR08MB6168:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB61680AA66E4F272C01C002319EC89@AS8PR08MB6168.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9D5dSl+IHqFCQous1oWgTfK7nYLLX93Sr3N+K6lMtiRLttQrY5G+kpto9tDGfmKD0yeFaWCZZzaxqmxLYsv4J7PQKGYfqep7AOktq38hGy97w9/J+dkf/acbjUz29AM/+ngKdG+wMOMwOOiTfx6aQDrkFjNrUyPk9z2pxQ1HdxIIxoDYwM79Sj2m+61kfCJ2X75eAUXVEmqPb3EDGYKtlEJ0Pi/9Z/sC/Cx7ZlXc6V1niBl7o2J7VKpIqXEGnok6gKMN3pPS5fqhkuwY76a7ztIUr0A6/7z2bSqFHbiSQ5NoYMJPeDygJBg5bSp55PhRQpwQlFzObX2WZVIWP8CO9lfOanjYrH11TkLKpYjogp96iZDX1630wkjqZTq9dRlO0Tb91H1D0MGueDjx98C/sZLwJWiI4xlrCHiHngS68ws5L2s6iXU5HLP2Q4lFi2epFm8Zi3gKxHQZCx5/bhe4fWw7ZRPtejADgZIisy2UAEett8uOZzi53FXYu3YHkId4uuvmtoxs6IWAgTMBow3q9W8mlo45nfgP3a0Nji4L1Gw+f0juNKq/cJBmmBtfBk+vJ9GddZbFlrrjUy2BeG6G5CVby2xCQNAXxawA/oPj/6JzdaA376lwLmnUDunQgGoNJz21w53RWhoYq3lSz6+uWs+whpUxJwouVwKxG+7c8ZLJ8088bcGT3kpVhj1gxmPRLHNCk1Mb/HdOvQYPJuxQ/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(40460700003)(6666004)(47076005)(26005)(7696005)(508600001)(356005)(36860700001)(81166007)(186003)(82310400005)(54906003)(6916009)(83380400001)(86362001)(336012)(426003)(1076003)(2616005)(5660300002)(8936002)(36756003)(316002)(70206006)(2906002)(44832011)(70586007)(8676002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6168
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f40f497-3e9a-4aa8-725d-08da32f024fc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fX5LGqlgenMDnYIvR31pbUkZK+tsyJWTtxJR4cxfQ3PKWuz/IjD1tK8H8rUDUS8BUjtd2mdlJ28WSLIvMNq3wODTBLT18kiAx9oq2tOSAIhG0ZlZOOonichqx2CHkjNl1qC97/We27HMMbqiQsJ9bsolhZOs86rpgen48wVX337YMSIkHyAKJXTtmYmheMawn9lk08aY9IOxwYHHq5Lago3mxanB7l09sqyuH+eXPGpmK+xg/JxRdn4dwbi5wll9gNNk7Qsx2RAe2sWFFvHztjQ1IKlYGiFfwT1RkqO+pYcOTeMZJOl5NQnazr60WwSmwksLK1uNVd0zdxN8psTDi27rA6wpKGMM58A29eoDPuLSEU4cdF6LpiiHHH7LnhH+Kxbppkg3Uhl5ezZ/D1ec3GnZGdeEavr8LaBPV5miHXdWhfdQB5eaUY2KalDfBZPoBx4hP1yRIpWTkj27QA8Ncriqb0D05ARLvj45kFCyMgQOtPQkIX5+KuQQnDzgoJB05+EouAX2Nj+XUcVgWLPTSKUkg0Gv6I9mmrSxOyqgTM99lCFFYH8gnrYl1KDVgIOEON3ya/EuJsvWobW5bG+rAoJVnlZbrlfKLU0HXzvkULVLnIN6jOCjUirVZhWfTmf1YWKKWAlc93GwMgaeusJ+wBKtS6Wz+HC4+viOFf3jpOdn9XaFlkJhzQi/zJwtQtxQ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(40460700003)(6666004)(47076005)(26005)(7696005)(508600001)(36860700001)(81166007)(186003)(82310400005)(54906003)(6916009)(83380400001)(86362001)(336012)(426003)(1076003)(2616005)(5660300002)(8936002)(36756003)(316002)(70206006)(2906002)(44832011)(70586007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 01:47:11.3163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ae987c-8635-4643-8295-08da32f02a8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6168

In current code, when Xen is running in a multiple nodes
NUMA system, it will set dma_bitsize in end_boot_allocator
to reserve some low address memory as DMA zone.

There are some x86 implications in the implementation.
Because on x86, memory starts from 0. On a multiple-nodes
NUMA system, if a single node contains the majority or all
of the DMA memory, x86 prefers to give out memory from
non-local allocations rather than exhausting the DMA memory
ranges. Hence x86 uses dma_bitsize to set aside some largely
arbitrary amount of memory for DMA zone. The allocations
from DMA zone would happen only after exhausting all other
nodes' memory.

But the implications are not shared across all architectures.
For example, Arm cannot guarantee the availability of memory
below a certain boundary for DMA limited-capability devices
either. But currently, Arm doesn't need a reserved DMA zone
in Xen. Because there is no DMA device in Xen. And for guests,
Xen Arm only allows Dom0 to have DMA operations without IOMMU.
Xen will try to allocate memory under 4GB or memory range that
is limited by dma_bitsize for Dom0 in boot time. For DomU, even
Xen can passthrough devices to DomU without IOMMU, but Xen Arm
doesn't guarantee their DMA operations. So, Xen Arm doesn't
need a reserved DMA zone to provide DMA memory for guests.

In this patch, we introduce an arch_want_default_dmazone helper
for different architectures to determine whether they need to
set dma_bitsize for DMA zone reservation or not.

At the same time, when x86 Xen is built with CONFIG_PV=n could
probably leverage this new helper to actually not trigger DMA
zone reservation.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
---
v2 -> v3:
1. Add Tb.
2. Rename arch_have_default_dmazone to arch_want_default_dmazone.
v1 -> v2:
1. Extend the description of Arm's workaround for reserve DMA
   allocations to avoid the same discussion every time.
2. Use a macro to define arch_have_default_dmazone, because
   it's little hard to make x86 version to static inline.
   Use a macro will also avoid add __init for this function.
3. Change arch_have_default_dmazone return value from
   unsigned int to bool.
4. Un-addressed comment: make arch_have_default_dmazone
   of x86 to be static inline. Because, if we move
   arch_have_default_dmazone to x86/asm/numa.h, it depends
   on nodemask.h to provide num_online_nodes. But nodemask.h
   needs numa.h to provide MAX_NUMANODES. This will cause a
   loop dependency. And this function can only be used in
   end_boot_allocator, in Xen initialization. So I think,
   compared to the changes introduced by inline, it doesn't
   mean much.
---
 xen/arch/arm/include/asm/numa.h | 1 +
 xen/arch/x86/include/asm/numa.h | 1 +
 xen/common/page_alloc.c         | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 31a6de4e23..e4c4d89192 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -24,6 +24,7 @@ extern mfn_t first_valid_mfn;
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
+#define arch_want_default_dmazone() (false)
 
 #endif /* __ARCH_ARM_NUMA_H */
 /*
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index bada2c0bb9..5d8385f2e1 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -74,6 +74,7 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
 				 NODE_DATA(nid)->node_spanned_pages)
+#define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 319029140f..b3bddc719b 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
     }
     nr_bootmem_regions = 0;
 
-    if ( !dma_bitsize && (num_online_nodes() > 1) )
+    if ( !dma_bitsize && arch_want_default_dmazone() )
         dma_bitsize = arch_get_dma_bitsize();
 
     printk("Domain heap initialised");
-- 
2.25.1


