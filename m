Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B8D2AB256
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 09:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22094.48441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc2R2-0002mp-P6; Mon, 09 Nov 2020 08:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22094.48441; Mon, 09 Nov 2020 08:21:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc2R2-0002mQ-Lp; Mon, 09 Nov 2020 08:21:56 +0000
Received: by outflank-mailman (input) for mailman id 22094;
 Mon, 09 Nov 2020 08:21:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+9y=EP=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1kc2R0-0002mL-KU
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 08:21:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec57454a-4f65-4bf1-8f4e-a04d2adc5431;
 Mon, 09 Nov 2020 08:21:51 +0000 (UTC)
Received: from AS8PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:20b:310::32)
 by VI1PR08MB3600.eurprd08.prod.outlook.com (2603:10a6:803:85::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Mon, 9 Nov
 2020 08:21:49 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::6b) by AS8PR04CA0027.outlook.office365.com
 (2603:10a6:20b:310::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 08:21:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Mon, 9 Nov 2020 08:21:44 +0000
Received: ("Tessian outbound 39167997cde8:v71");
 Mon, 09 Nov 2020 08:21:40 +0000
Received: from bf27f0ca01c8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 674DD738-A1F7-46C4-83A4-2FA19E6A3CFB.1; 
 Mon, 09 Nov 2020 08:21:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf27f0ca01c8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Nov 2020 08:21:35 +0000
Received: from AM5PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:203:69::23) by VE1PR08MB4957.eurprd08.prod.outlook.com
 (2603:10a6:803:109::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 08:21:34 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::30) by AM5PR0202CA0013.outlook.office365.com
 (2603:10a6:203:69::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 08:21:34 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3541.17 via Frontend Transport; Mon, 9 Nov 2020 08:21:32 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 9 Nov 2020
 08:21:20 +0000
Received: from entos-d05.shanghai.arm.com (10.169.212.212) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Mon, 9 Nov 2020 08:21:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=U+9y=EP=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
	id 1kc2R0-0002mL-KU
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 08:21:54 +0000
X-Inumbo-ID: ec57454a-4f65-4bf1-8f4e-a04d2adc5431
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.85])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ec57454a-4f65-4bf1-8f4e-a04d2adc5431;
	Mon, 09 Nov 2020 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YR7dvGtRyqou2OvC4N1znnpIeQY3jFZ7NUMIJKjRUZY=;
 b=n5naFCVBj0dB66s2ywJoomCc3CMTR5CqD8ljFFKBQt6kdMa8iVdzw5dH7xHMeltgeRmRA5zk/9Raq2FwgPf0gmydOR4p6stmy18i1wMXvJCKaVzCK9N22gpcmPfanUKrVz0ZhSs2KhWiss0k0nbXNokEMBnWMQUXl9xmaZg0S1s=
Received: from AS8PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:20b:310::32)
 by VI1PR08MB3600.eurprd08.prod.outlook.com (2603:10a6:803:85::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Mon, 9 Nov
 2020 08:21:49 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::6b) by AS8PR04CA0027.outlook.office365.com
 (2603:10a6:20b:310::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 08:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Mon, 9 Nov 2020 08:21:44 +0000
Received: ("Tessian outbound 39167997cde8:v71"); Mon, 09 Nov 2020 08:21:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 513a9a58bd1043bf
X-CR-MTA-TID: 64aa7808
Received: from bf27f0ca01c8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 674DD738-A1F7-46C4-83A4-2FA19E6A3CFB.1;
	Mon, 09 Nov 2020 08:21:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf27f0ca01c8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 Nov 2020 08:21:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTIP7M9y7OWZgU3aByN6KgVxSHQPAyc75pi+J2CA76ybBUL41XEDedg5H5CMLlipZ25SXeH+AO/hXx1e/qPdHQo9HDr+5EfMSqqpp0XOT58aSDxbCV0ERSUJVYH/cpgZRExV194i2HFGjVNZpti0nUMgPOyHPQcGPMyf5wdiLJNjQGXtvatOCW7USOrDKbBCnGaQ1Z41KwRwt0byvYxHgAywmt13Zbgo9bEZc69QS6v2ER7+QwXG/rtmNGU75SOuYI2r/4q8xvd53Mc8RIUZ7hVK9pMD6z32jMWbmVUFNOg2++9E/4lVURNXQYXX03jLBgii/WEttU/hXFdb8LZiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YR7dvGtRyqou2OvC4N1znnpIeQY3jFZ7NUMIJKjRUZY=;
 b=aNgYvTE4q5E68L+x21cblCWWmkZr1q6ILkEowd9kP2SUstqhrwUCRCXaWN0/qRzXuS5HRBSC4KGjzMssOx3JJPkaczZE0hoeQZENhtqhsvzHvSK7xw7JVIIaOc0p/3FAkOlmoY3X/u8XowXtjWptH5EHJPbwTkPKjncd6wacHypYfnSQnywmXEBG8RiSp0jSoeazImofUmwqOKGOxKb0HO9QibOAF/z7Rnl/SlNR4LnDjngl8efpZaIyHHb/9Awo7GgBfYd5XfpgKkI7aXyyPCL7DTo48fROGIlIMtuYeZu1H+ncDggU+UXAT/BYlxO+xQfH9niMBNoaGJT9lz+erg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YR7dvGtRyqou2OvC4N1znnpIeQY3jFZ7NUMIJKjRUZY=;
 b=n5naFCVBj0dB66s2ywJoomCc3CMTR5CqD8ljFFKBQt6kdMa8iVdzw5dH7xHMeltgeRmRA5zk/9Raq2FwgPf0gmydOR4p6stmy18i1wMXvJCKaVzCK9N22gpcmPfanUKrVz0ZhSs2KhWiss0k0nbXNokEMBnWMQUXl9xmaZg0S1s=
Received: from AM5PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:203:69::23) by VE1PR08MB4957.eurprd08.prod.outlook.com
 (2603:10a6:803:109::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 08:21:34 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::30) by AM5PR0202CA0013.outlook.office365.com
 (2603:10a6:203:69::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 08:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3541.17 via Frontend Transport; Mon, 9 Nov 2020 08:21:32 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 9 Nov 2020
 08:21:20 +0000
Received: from entos-d05.shanghai.arm.com (10.169.212.212) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Mon, 9 Nov 2020 08:21:17 +0000
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>,
	<Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Date: Mon, 9 Nov 2020 16:21:10 +0800
Message-ID: <20201109082110.1133996-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46b081bf-663e-413f-7376-08d884887fb1
X-MS-TrafficTypeDiagnostic: VE1PR08MB4957:|VI1PR08MB3600:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB360056F4DC207F891191F1ECF7EA0@VI1PR08MB3600.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Pvpi18BA+cwFFpAzixI6DERkVouNmeMQTxoRyyQf8S0Cs8gHPJFtloZwvJKfrijtC7+oqldbaVwzsYAz0ALInCuGs/WKpxuMnwZCcW2k677qR/K0049WPnMWeXMbJr+eQD0oHg+zgU7STwrlWpf7VqOk8P9QoHveK7uMcEP5QkYjK83e5YeADm5dE3zxKQr8C9zCGuqti5TXjMTDwWZo3+tYAPPpfgZlXV+RKpsCj/BhgzgkubLOH0y/h+qwB8HJRqjGUD15MFwzB0oX3DtVW1yTYv9jCRCjh+0AqFZHE6gPDNmpRtGkKGLT5n+QJqOXLg+oa7lYgBScswC7h29pWPUG/w79cw3Vzsef5AShfxQnRt8uJ2cOUdpwbwR63SlVysD9KUCqK1y7BABGDZ8BVw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966005)(86362001)(7696005)(82310400003)(5660300002)(26005)(110136005)(54906003)(47076004)(1076003)(82740400003)(36756003)(186003)(81166007)(356005)(336012)(8936002)(426003)(70586007)(83380400001)(2616005)(8676002)(6666004)(478600001)(4326008)(44832011)(2906002)(70206006)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4957
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e11b6a38-896f-4d4d-8a3a-08d88488775f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+prsIyIW4biMCgYAKJelNIEboGje4QSkOp9LrxNrDrWbqHryk+IRjBADHFl/RyLzzM/mMCPqEaD0JKwk1mlqNBG60C0hlTu3leHOh/w0AlyrS6As+Z0MY7i1Llo2uHa8OTOBFhU25C+K5857i9yELHYxITGBt1yrcdfxYGfHjdbcKSR4euH9hX/18jO4aciq+JGH26KPM3qxEoYvcWcdfrsnhCSJKjskqeTNFe/K9PCVAwTnGdDswIwOqSR2opBQHd6esIlCVqBguCQfbKDMDyQhka0m8XdZgFqMUJ6SZVBetxcOPcMUJDleD0ESbMLxIA+rw8vAtDFV1TpDOHPvuWpQ5HzMkfHS8m9+fj3wnWA5mNWVM1R8lpE44bprK/+SaiTMbTU7ec43OM55qKl89w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966005)(8676002)(86362001)(54906003)(4326008)(336012)(83380400001)(110136005)(36906005)(70206006)(2906002)(7696005)(316002)(1076003)(478600001)(186003)(2616005)(26005)(70586007)(82310400003)(82740400003)(81166007)(47076004)(36756003)(8936002)(6666004)(44832011)(5660300002)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 08:21:44.8188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b081bf-663e-413f-7376-08d884887fb1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3600

CNTVCT_EL0 or CNTPCT_EL0 counter read in Cortex-A73 (all versions)
might return a wrong value when the counter crosses a 32bit boundary.

Until now, there is no case for Xen itself to access CNTVCT_EL0,
and it also should be the Guest OS's responsibility to deal with
this part.

But for CNTPCT, there exists several cases in Xen involving reading
CNTPCT, so a possible workaround is that performing the read twice,
and to return one or the other depending on whether a transition has
taken place.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 docs/misc/arm/silicon-errata.txt |  1 +
 xen/arch/arm/Kconfig             | 18 ++++++++++++++++++
 xen/arch/arm/cpuerrata.c         |  8 ++++++++
 xen/arch/arm/vtimer.c            |  2 +-
 xen/include/asm-arm/cpuerrata.h  |  2 ++
 xen/include/asm-arm/cpufeature.h |  3 ++-
 xen/include/asm-arm/time.h       | 22 +++++++++++++++++++++-
 7 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
index 1f18a9df58..552c4151d3 100644
--- a/docs/misc/arm/silicon-errata.txt
+++ b/docs/misc/arm/silicon-errata.txt
@@ -51,6 +51,7 @@ stable hypervisors.
 | ARM            | Cortex-A57      | #1319537        | N/A                     |
 | ARM            | Cortex-A72      | #1319367        | N/A                     |
 | ARM            | Cortex-A72      | #853709         | N/A                     |
+| ARM            | Cortex-A73      | #858921         | ARM_ERRATUM_858921      |
 | ARM            | Cortex-A76      | #1165522        | N/A                     |
 | ARM            | Neoverse-N1     | #1165522        | N/A
 | ARM            | MMU-500         | #842869         | N/A                     |
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2777388265..f938dd21bd 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -226,6 +226,24 @@ config ARM64_ERRATUM_834220
 
 	  If unsure, say Y.
 
+config ARM_ERRATUM_858921
+	bool "Cortex-A73: 858921: Possible wrong read value for CNTVCT or CNTPCT"
+	default y
+	help
+	  This option adds an alternative code sequence to work around ARM
+	  erratum 858921 on Cortex-A73 (all versions).
+
+	  Affected Cortex-A73 might return wrong read value for CNTVCT or CNTPCT
+	  when the counter crosses a 32bit boundary.
+
+	  The workaround involves performing the read twice, and to return
+	  one or the other value depending on whether a transition has taken place.
+	  Please note that this does not necessarily enable the workaround,
+	  as it depends on the alternative framework, which will only patch
+	  the kernel if an affected CPU is detected.
+
+	  If unsure, say Y.
+
 endmenu
 
 config ARM64_HARDEN_BRANCH_PREDICTOR
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 6731d873e8..567911d380 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -469,6 +469,14 @@ static const struct arm_cpu_capabilities arm_errata[] = {
         .capability = ARM_SSBD,
         .matches = has_ssbd_mitigation,
     },
+#endif
+#ifdef CONFIG_ARM_ERRATUM_858921
+    {
+        /* Cortex-A73 (all versions) */
+        .desc = "ARM erratum 858921",
+        .capability = ARM_WORKAROUND_858921,
+        MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
+    },
 #endif
     {
         /* Neoverse r0p0 - r2p0 */
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index 6d39fc944f..c2b27915c6 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -62,7 +62,7 @@ static void virt_timer_expired(void *data)
 
 int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
 {
-    d->arch.virt_timer_base.offset = READ_SYSREG64(CNTPCT_EL0);
+    d->arch.virt_timer_base.offset = get_cycles();
     d->time_offset.seconds = ticks_to_ns(d->arch.virt_timer_base.offset - boot_count);
     do_div(d->time_offset.seconds, 1000000000);
 
diff --git a/xen/include/asm-arm/cpuerrata.h b/xen/include/asm-arm/cpuerrata.h
index 88ef3ca934..8d7e7b9375 100644
--- a/xen/include/asm-arm/cpuerrata.h
+++ b/xen/include/asm-arm/cpuerrata.h
@@ -28,6 +28,8 @@ static inline bool check_workaround_##erratum(void)             \
 CHECK_WORKAROUND_HELPER(766422, ARM32_WORKAROUND_766422, CONFIG_ARM_32)
 CHECK_WORKAROUND_HELPER(834220, ARM64_WORKAROUND_834220, CONFIG_ARM_64)
 CHECK_WORKAROUND_HELPER(ssbd, ARM_SSBD, CONFIG_ARM_SSBD)
+CHECK_WORKAROUND_HELPER(858921, ARM_WORKAROUND_858921,
+                        CONFIG_ARM_ERRATUM_858921)
 
 #undef CHECK_WORKAROUND_HELPER
 
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 10878ead8a..016a9fe203 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -45,8 +45,9 @@
 #define ARM_SSBD 7
 #define ARM_SMCCC_1_1 8
 #define ARM64_WORKAROUND_AT_SPECULATE 9
+#define ARM_WORKAROUND_858921 10
 
-#define ARM_NCAPS           10
+#define ARM_NCAPS           11
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
index 9cb6f9b0b4..1b2c13614b 100644
--- a/xen/include/asm-arm/time.h
+++ b/xen/include/asm-arm/time.h
@@ -3,6 +3,7 @@
 
 #include <asm/sysregs.h>
 #include <asm/system.h>
+#include <asm/cpuerrata.h>
 
 #define DT_MATCH_TIMER                      \
     DT_MATCH_COMPATIBLE("arm,armv7-timer"), \
@@ -13,7 +14,26 @@ typedef uint64_t cycles_t;
 static inline cycles_t get_cycles (void)
 {
         isb();
-        return READ_SYSREG64(CNTPCT_EL0);
+        /*
+         * ARM_WORKAROUND_858921: Cortex-A73 (all versions) counter read
+         * can return a wrong value when the counter crosses a 32bit boundary.
+         */
+        if ( !check_workaround_858921() )
+            return READ_SYSREG64(CNTPCT_EL0);
+        else
+        {
+            /*
+             * A recommended workaround for erratum 858921 is to:
+             *  1- Read twice CNTPCT.
+             *  2- Compare bit[32] of the two read values.
+             *      - If bit[32] is different, keep the old value.
+             *      - If bit[32] is the same, keep the new value.
+             */
+            cycles_t old, new;
+            old = READ_SYSREG64(CNTPCT_EL0);
+            new = READ_SYSREG64(CNTPCT_EL0);
+            return (((old ^ new) >> 32) & 1) ? old : new;
+        }
 }
 
 /* List of timer's IRQ */
-- 
2.25.1


