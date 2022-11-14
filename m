Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B46275FD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 07:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443095.697559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT4D-0002eS-FY; Mon, 14 Nov 2022 06:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443095.697559; Mon, 14 Nov 2022 06:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT4D-0002aU-BM; Mon, 14 Nov 2022 06:35:37 +0000
Received: by outflank-mailman (input) for mailman id 443095;
 Mon, 14 Nov 2022 06:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CFvb=3O=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ouT4B-0000je-K3
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 06:35:36 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2049.outbound.protection.outlook.com [40.107.103.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a393815-63e6-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 07:35:33 +0100 (CET)
Received: from FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::6) by
 AS2PR08MB9987.eurprd08.prod.outlook.com (2603:10a6:20b:645::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.6; Mon, 14 Nov 2022 06:35:31 +0000
Received: from VI1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1d:cafe::cc) by FR3P281CA0007.outlook.office365.com
 (2603:10a6:d10:1d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT023.mail.protection.outlook.com (100.127.144.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:35:30 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Mon, 14 Nov 2022 06:35:30 +0000
Received: from 59c246908d72.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4AB303AF-8B90-4C1B-8973-E335F49EF59B.1; 
 Mon, 14 Nov 2022 06:35:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 59c246908d72.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 06:35:23 +0000
Received: from AM5PR0201CA0003.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::13) by PAVPR08MB9817.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 06:35:15 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::7c) by AM5PR0201CA0003.outlook.office365.com
 (2603:10a6:203:3d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:15 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:35:14 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 14 Nov
 2022 06:35:13 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:10 +0000
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
X-Inumbo-ID: 8a393815-63e6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PIwa0Xb9Oy0MR4jE6xCXLnMNfSmtOPft9gAxQn7GrIH97Y+OR9j5tH1TJ/3nUFqL2V4zfx6jDIKgDl5MmZLZdilRj3OwzWWNwg+IbWCbqLYPpm+vGohra24H6NS+yfwYtrQdWe2NEMYauHmsKztefSWkk/IvjVZTHDnpwSGneTRmTWe8RabQ/kqRaAm8aFOg9dUa97yw255sfFDe4r2CJ84ifK4Ni0J10luUnbplYKbxWwI9DyTNPzv0wO3FeNWlA4BVgGJLqVlo2hqsWJO3dB6pHiEe9Ydul+Q4f8BZOO/YkOSxwnPi4TfTW8CJ/Mwypmwyy7Pma5cebHldXYL+gw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEGNLm+cLEOdzsuwBLr9kWs4a8FoN0EWcOOLw22Cn0s=;
 b=JjrM1eMgRvGsHUAxtHxjb88ce4F/F8e4eDwTCwbt/ZmTGzs6lZSzC3sWa/Nb6UVY78PEE4DdhlR617FxXFWhm2hRL2tNNOHSeD76gMlZ3ojS3esgrkhdoUwt4WvbL+cafuLI+9SHcnhjo0V1RmM1lFk2Ctl+9/6KKz+4nxKSv3vEqt98s+mwd3aA8ZnCTQhXs7Njqgf+o/LqMJm3fKlbq96sR3JDB+2i1gTFU/MeB+SJhsP01e2lp2TgY9ElrJXPUZfE7x5UqOs/8SYIsZIehXdU3+HB/eFPevnzEYKZ4DHOmRxu56HfdzXxmcNUFcJzENWcBwWblRS2nZZLnSYHww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEGNLm+cLEOdzsuwBLr9kWs4a8FoN0EWcOOLw22Cn0s=;
 b=iIMcERX60YovyG9/fE58G+N7ShpXKCI4SpC355gm1FWPpeZJWITR7/MjVaJctkBhFjx0urGclMxauq+s21GHz3gEedF/YHQhaGYPE9w55+aNk58ONCxZIVuU2G33Wj5XAOSbKcF+ZeQIB2bziYx2fz98auvvF4BdxCvFElCdsF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2499bbdfd8a5776c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFBfYZkOcXLFtJFL8wBPDgUsz/zts7Vw5QULuTu7OdZvEDLg6FOdFV9GDpouBfbo3D4uzM3lNC7nTkyCOQhjAgBOIxMhJUweLOASiM3qyDrNVuDA3LXvQgw1U0qoMgrLhe7w4C7sQlW7YsQTsh9JatyNWTczk8e4Gbt8Kx8STTWZOLiWzdOSFT6WSX2Uc60zKTNpJr1vDQki5TWfcRfeSLSPGwO5UAxXOnxnFNFWqQGwZsTXbSCjn890+G2Zq9yofuSdPMbIInGY2RU1lzvL5Fi4LjzpcqlW7Md2GWgekT+/f7o+9u2H7yr+0SIIyHLVmCK6NhBqPGqgRs9j8t58og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEGNLm+cLEOdzsuwBLr9kWs4a8FoN0EWcOOLw22Cn0s=;
 b=JEGBaVuhYaj6h2SPW3poSK7ep7HZgkGaraARX1otQN9V2YQxOFc2mPaoorvHRaegS6kJ8a12r2/ZGK+/80Y9rVM4HrYDyV37iNUTsW9t+woqUlu9dJibOaqBfZZ4y8doacOkW4PyVVV85Al9V+XsyPC//Pf4dQRjn+UDzxkgrXIIiJLxTFwjE2+BN30XuDWuXkCwWDfQLYVn6LeWO2Guly5OiI0ievQBXHF4SPpZnd/ZHFXimQ7t8EZEc4/Vm17P9t0Pf9SkRfBHRnq4rSJbuQ5DvEZi1rBQSdX13SwMTvZrKm/Vl/wO13HwkYnyz/AB/N52myMwm241yFBMeHNmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEGNLm+cLEOdzsuwBLr9kWs4a8FoN0EWcOOLw22Cn0s=;
 b=iIMcERX60YovyG9/fE58G+N7ShpXKCI4SpC355gm1FWPpeZJWITR7/MjVaJctkBhFjx0urGclMxauq+s21GHz3gEedF/YHQhaGYPE9w55+aNk58ONCxZIVuU2G33Wj5XAOSbKcF+ZeQIB2bziYx2fz98auvvF4BdxCvFElCdsF8=
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
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 5/6] xen/x86: move NUMA process nodes nodes code from x86 to common
Date: Mon, 14 Nov 2022 14:34:50 +0800
Message-ID: <20221114063451.473711-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114063451.473711-1-wei.chen@arm.com>
References: <20221114063451.473711-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT025:EE_|PAVPR08MB9817:EE_|VI1EUR03FT023:EE_|AS2PR08MB9987:EE_
X-MS-Office365-Filtering-Correlation-Id: f1499b65-223f-4e19-6187-08dac60a6d09
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0ucUNO36BaxkBx9HGwgcjUAoP38Hv2Ud19Ls3MPF0BZr5Gi5Bdblbo9OgDRhlqt0KwYgNgojDuHVVjK6ZaVUWpbHmDBEshOJzWqLMLEvB0c69hBpbKxZHwdKSq1bKynxcggtUjcj8wu++iHmiUrHE16P5K2aBkIs5cI1utBxddjV3kOOM2S8UAIUaAkUEg0CDQFd5g2GYVzyFPA4BilH7chKdk/3aIbGWg+PG6FXAsTr9jtZcmA3dHJWW9l9yrUPd6/sQBz9XlzpagiY+4Gj5r0t+LbqZN5O2oG4JON7CrSY4vSCLKM6ZnxLMXB8iLqr1raLeFCFXP/qvYQsElKO1/3AkS3vs0FYzSVNcTF5HbprbJFzejeF6S339V5k4FJ/jIk9Car5bHNXjAvstx5Uh5/IbtKdeve1ad1CFj3c/POe/HFyRwI2KkGwu/FKOmWk8XHtQndyrHlI1yApuurEfeghQFfIHh8Df9UmPPPLikwJKy1v2mfOeO3MY/DZ5dgPfKOHzSCCBKFZ91fEdiO/YCgWC7oK4kNGh7gGi+OIFZeFzGI4+s73LTnYZqd44bNHyTE7N+/0q9RzAq9NzijaBRqP4ekyXOkFKHXS3cOhem5/7a1RIulUHs6CSLEhgg8/H6o8IFeprdhd22ZBbqeFVQm/UpnmDdWCQ/PJUBHIoGXPAG3n/H2+R/FiBqzJL7GsfxzpA7ImtYZqmmrcZe71nCxDzbXb+y0oqWjdXlYg/TCU6l8uMXiCcDKy/12psFbfW51OxBIam2nAwIB7c/YBkUNlMfTrZxeYqcSGHl2hy1mLbPM0tD4lywJdysyGyMrA
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(6916009)(54906003)(316002)(44832011)(4326008)(8676002)(30864003)(5660300002)(8936002)(86362001)(41300700001)(70206006)(70586007)(2616005)(1076003)(47076005)(36756003)(82740400003)(40480700001)(336012)(186003)(426003)(36860700001)(83380400001)(478600001)(81166007)(6666004)(40460700003)(7696005)(356005)(26005)(82310400005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9817
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2387f042-cb03-456a-65de-08dac60a6382
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bOcvoiOLg0rNZxzVnpR6Ox2tgja1IcafFXFp3a9OXVKCMwxp0uFlC/1MNa1hj2FdjMmIE15rW0S/7gcgoTcZEcUqa2l5qkhRn85Mn0eI/T4zSFNoT/37/JTHUrbjfhUwGuufYwfjLm9vwDAj8NVRyinROgLu4GTNCi5HxDYN+ybR56l7Lshk9Zgo/DRzGnG03JXuXApWwm+cML3YgVGJZJjFPrTkwQ0GWVMuf1R9PW+KDFMxGHfQ/x3Rs6E+puOkZk7xx63pX7Gt/UHrDdFek/GnLcx5leCkD27s2KCCjysvz8G0OMb/wsxSvDy4+26K/OM13QJEIQTmR7dXVJxtXMA6u5JfUAI7A+LIFPN23/fw+mrk8XcKHGLtrDveSLopj77TIIxllzt9ovyqn/fI9SfMImtYxQvDsDGCFUBXjKPGZwpWDSRA5O4bjmlnJEqkOMBZYJPupy+3Pdz/IuBOdEhXBLeX22ixzCRy1Kd762dZxuAml/wo7aDs/rQ5nWYpz8amrYMs3wFZkV1yrTGbWBL+JrmK0Nc+/k+fBH0lgSB1do+r3ETl8LE1eMSeyJHJfzgYtJznVAUuo0pz56ArBS8ijLbPALW+T7QOLAtn8hZ2PcueQcIV5cFixg80xMkca9g+ld/UF8Cc1hfg1ZfklqbvU/QWBzTwmG2c9gJDNz6bbPCPcGUF8GnCQglbl2kYzzYzQC5MCV1cb+fMcvB61otvKi7yxYeSstosHbPvrhmLkORjnRJ6zDkhODdP0D99tMBt69hAvGoh8Oa+QDJKUw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(478600001)(81166007)(36756003)(40460700003)(54906003)(316002)(2906002)(4326008)(107886003)(6666004)(70586007)(70206006)(6916009)(8676002)(86362001)(40480700001)(7696005)(82310400005)(8936002)(41300700001)(26005)(82740400003)(44832011)(47076005)(426003)(5660300002)(2616005)(36860700001)(336012)(83380400001)(186003)(30864003)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 06:35:30.6244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1499b65-223f-4e19-6187-08dac60a6d09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9987

x86 has implemented a set of codes to process NUMA nodes. These
codes will parse NUMA memory and processor information from
ACPI SRAT table. But except some ACPI specific codes, most
of the process code like memory blocks validation, node memory
range updates and some sanity check can be reused by other
NUMA implementation.

So in this patch, we move some variables and related functions
for NUMA memory and processor to common as library. At the
same time, numa_set_processor_nodes_parsed has been introduced
for ACPI specific code to update processor parsing results.
With this helper, we can reuse most of NUMA memory affinity init
code from ACPI. As bad_srat and node_to_pxm functions have been
used in common code to do architectural fallback and node to
architectural node info translation. But it doesn't make sense
to reuse the functions names in common code, we have rename them
to neutral names as well.

PXM is an ACPI specific item, we can't use it in common code
directly. As an alternative, we extend the parameters of
numa_update_node_memblks. The caller can pass the PXM as print
messages' prefix or as architectural node id. And we introduced
an numa_fw_nid_name for each NUMA implementation to set their
specific firmware NUMA node name. In this case, we do not need
to retain a lot of per-arch code but still can print architectural
log messages for different NUMA implementations. A default value
"???" will be set to indicate an unset numa_fw_nid_name.

mem_hotplug is accessed by common code if memory hotplug is
activated. Even if this is only supported by x86, export the
variable so that other architectures could support it in the future.

As asm/acpi.h has been removed from common/numa.c, we have to
move NR_NODE_MEMBLKS from asm/acpi.h to xen/numa.h in this patch
as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v7 -> v8:
 1. Add numa_fw_nid_name setting in srat_parse_regions after
    acpi_table_parse succeeded.
v6 -> v7:
 1. Add __init for arch_numa_unavailable.
 2. Use __ro_after_init for mem_hotplug.
 3. Use "???" instead of "NONAME" for unset numa_fw_nid_name.
 4. Fix code-style.
v5 -> v6:
 1. Fix code-style.
 2. Use arch_numa_unavailable to replace arch_numa_disabled for
    acpi_numa <= 0.
 3. Remove Kconfig for HAS_NUMA_NODE_FWID.
 4. Use numa_fw_nid_name for NUMA implementation to set their fw
    NUMA node name for print messages.
v4 -> v5:
 1. Introduce arch_numa_disabled for acpi_numa <= 0 in this patch.
 2. Remove the paramter init_as_disable of arch_numa_disabled.
 3. Fix typo "expandsion".
 4. Add const to proper varibales.
 5. Fix Indentation for l1tf_safe_maddr.
 6. Remove double blank lines.
 7. Add a space between for_each_node_mask and '('.
    Add a space page_list_for_each and '('.
 8. Use bool for nodes_cover_memory return value.
 9. Use a plain "int ret" to record compute_hash_shift return value.
10. Add a blank line before the function's main "return".
11. Add new Kconfig option HAS_NUMA_NODE_FWID to common/Kconfig.
v3 -> v4:
1. Use bool as return value for functions that only return
   0/1 or 0/-EINVAL.
2. Move mem_hotplug to a proper place in mm.h
3. Remove useless "size" in numa_scan_nodes.
4. Use unsigned int or const for proper variables.
5. Fix code-style.
6. Add init_as_disable as arch_numa_disabled parameter.
7. Add CONFIG_HAS_NUMA_NODE_FWID to gate print the mapping
   between node id and architectural node id (fw node id).
v2 -> v3:
1. Add __ro_after_init to proper variables.
2. Rename bad_srat to numa_fw_bad.
3. Rename node_to_pxm to numa_node_to_arch_nid.
4. Merge patch#7 and #8 into this patch.
5. Correct int to unsigned int in proper places.
6. Move NR_NODE_MEMBLKS from x86/acpi.h to common/numa.h
7. Drop helpers to access mem_hotplug, we export mem_hotplug
   from x86/mm.c to common/page_alloc.c
v1 -> v2:
1. Add code comment for numa_update_node_memblks to explain:
   Assumes all memory regions belonging to a single node
   are in one chunk. Holes between them will be included
   in the node.
2. Merge this single patch instead of serval patches to move
   x86 SRAT code to common.
3. Export node_to_pxm to keep pxm information in NUMA scan
   nodes error messages.
4. Change the code style to target file's Xen code-style.
5. Adjust some __init and __initdata for some functions and
   variables.
6. Merge two patches into this patch:
   1. replace CONFIG_ACPI_NUMA by CONFIG_NUMA.
   2. replace "SRAT" texts.
7. Turn numa_scan_nodes to static.
---
 xen/arch/x86/include/asm/acpi.h |   1 -
 xen/arch/x86/include/asm/mm.h   |   2 -
 xen/arch/x86/include/asm/numa.h |   3 +-
 xen/arch/x86/mm.c               |   2 -
 xen/arch/x86/numa.c             |   5 +
 xen/arch/x86/srat.c             | 336 +++----------------------------
 xen/common/numa.c               | 341 +++++++++++++++++++++++++++++++-
 xen/common/page_alloc.c         |   2 +
 xen/include/xen/mm.h            |   2 +
 xen/include/xen/numa.h          |  10 +-
 10 files changed, 383 insertions(+), 321 deletions(-)

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 5c2dd5da2d..c453450a74 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -102,7 +102,6 @@ extern unsigned long acpi_wakeup_address;
 #define ARCH_HAS_POWER_INIT	1
 
 extern s8 acpi_numa;
-#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
 #define acpi_video_flags bootsym(video_flags)
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index d723c7c38f..2c5f856067 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -456,8 +456,6 @@ static inline int get_page_and_type(struct page_info *page,
     ASSERT(((_p)->count_info & PGC_count_mask) != 0);          \
     ASSERT(page_get_owner(_p) == (_d))
 
-extern paddr_t mem_hotplug;
-
 /******************************************************************************
  * With shadow pagetables, the different kinds of address start
  * to get get confusing.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 6c87942d43..2ca3475271 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -10,6 +10,7 @@ typedef u8 nodeid_t;
 extern int srat_rev;
 
 extern nodeid_t pxm_to_node(unsigned int pxm);
+extern unsigned int numa_node_to_arch_nid(nodeid_t n);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
 
@@ -22,8 +23,6 @@ extern void init_cpu_to_node(void);
 
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
-extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
-
 void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index db1817b691..68f9989e1f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -157,8 +157,6 @@ l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap_x[L1_PAGETABLE_ENTRIES];
 
-paddr_t __read_mostly mem_hotplug;
-
 /* Frame table size in pages. */
 unsigned long max_page;
 unsigned long total_pages;
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index fa8caaa084..4b0b297c7e 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -46,6 +46,11 @@ bool arch_numa_disabled(void)
     return acpi_numa < 0;
 }
 
+bool __init arch_numa_unavailable(void)
+{
+    return acpi_numa <= 0;
+}
+
 /*
  * Setup early cpu_to_node.
  *
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 1a108a34c6..7944723d2d 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -24,10 +24,6 @@
 
 static struct acpi_table_slit *__read_mostly acpi_slit;
 
-static nodemask_t memory_nodes_parsed __initdata;
-static nodemask_t processor_nodes_parsed __initdata;
-static struct node nodes[MAX_NUMNODES] __initdata;
-
 struct pxm2node {
 	unsigned pxm;
 	nodeid_t node;
@@ -35,19 +31,6 @@ struct pxm2node {
 static struct pxm2node __read_mostly pxm2node[MAX_NUMNODES] =
 	{ [0 ... MAX_NUMNODES - 1] = {.node = NUMA_NO_NODE} };
 
-static unsigned node_to_pxm(nodeid_t n);
-
-static int num_node_memblks;
-static struct node node_memblk_range[NR_NODE_MEMBLKS];
-static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
-static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
-
-enum conflicts {
-	NO_CONFLICT,
-	OVERLAP,
-	INTERLEAVE,
-};
-
 static inline bool node_found(unsigned idx, unsigned pxm)
 {
 	return ((pxm2node[idx].pxm == pxm) &&
@@ -110,78 +93,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
-{
-	int i;
-
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-
-		if (nd->start <= start && nd->end >= end &&
-			memblk_nodeid[i] == node)
-			return 1;
-	}
-
-	return 0;
-}
-
-static
-enum conflicts __init conflicting_memblks(nodeid_t nid, paddr_t start,
-					  paddr_t end, paddr_t nd_start,
-					  paddr_t nd_end, unsigned int *mblkid)
-{
-	unsigned int i;
-
-	/*
-	 * Scan all recorded nodes' memory blocks to check conflicts:
-	 * Overlap or interleave.
-	 */
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-
-		*mblkid = i;
-
-		/* Skip 0 bytes node memory block. */
-		if (nd->start == nd->end)
-			continue;
-		/*
-		 * Use memblk range to check memblk overlaps, include the
-		 * self-overlap case. As nd's range is non-empty, the special
-		 * case "nd->end == end && nd->start == start" also can be covered.
-		 */
-		if (nd->end > start && nd->start < end)
-			return OVERLAP;
-
-		/*
-		 * Use node memory range to check whether new range contains
-		 * memory from other nodes - interleave check. We just need
-		 * to check full contains situation. Because overlaps have
-		 * been checked above.
-		 */
-	        if (nid != memblk_nodeid[i] &&
-		    nd->start >= nd_start && nd->end <= nd_end)
-			return INTERLEAVE;
-	}
-
-	return NO_CONFLICT;
-}
-
-static __init void cutoff_node(int i, paddr_t start, paddr_t end)
-{
-	struct node *nd = &nodes[i];
-	if (nd->start < start) {
-		nd->start = start;
-		if (nd->end < nd->start)
-			nd->start = nd->end;
-	}
-	if (nd->end > end) {
-		nd->end = end;
-		if (nd->start > nd->end)
-			nd->start = nd->end;
-	}
-}
-
-static __init void bad_srat(void)
+void __init numa_fw_bad(void)
 {
 	int i;
 	printk(KERN_ERR "SRAT: SRAT not used.\n");
@@ -241,7 +153,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	if (numa_disabled())
 		return;
 	if (pa->header.length < sizeof(struct acpi_srat_x2apic_cpu_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(pa->flags & ACPI_SRAT_CPU_ENABLED))
@@ -254,12 +166,12 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	pxm = pa->proximity_domain;
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	acpi_numa = 1;
 
 	if (opt_acpi_verbose)
@@ -277,7 +189,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	if (numa_disabled())
 		return;
 	if (pa->header.length != sizeof(struct acpi_srat_cpu_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(pa->flags & ACPI_SRAT_CPU_ENABLED))
@@ -290,11 +202,11 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	}
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	acpi_numa = 1;
 
 	if (opt_acpi_verbose)
@@ -306,33 +218,27 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
-	struct node *nd;
-	paddr_t nd_start, nd_end;
-	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
-	unsigned int i;
-	bool next = false;
 
 	if (numa_disabled())
 		return;
 	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
 		return;
 
-	start = ma->base_address;
-	end = start + ma->length;
 	/* Supplement the heuristics in l1tf_calculations(). */
-	l1tf_safe_maddr = max(l1tf_safe_maddr, ROUNDUP(end, PAGE_SIZE));
+	l1tf_safe_maddr = max(l1tf_safe_maddr,
+			      ROUNDUP(ma->base_address + ma->length,
+				      PAGE_SIZE));
 
-	if (num_node_memblks >= NR_NODE_MEMBLKS)
-	{
+	if (!numa_memblks_available()) {
 		dprintk(XENLOG_WARNING,
-                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
-		bad_srat();
+			"Too many numa entries, try bigger NR_NODE_MEMBLKS!\n");
+		numa_fw_bad();
 		return;
 	}
 
@@ -341,159 +247,14 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		pxm &= 0xff;
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 
-	/*
-	 * For the node that already has some memory blocks, we will
-	 * expand the node memory range temporarily to check memory
-	 * interleaves with other nodes. We will not use this node
-	 * temp memory range to check overlaps, because it will mask
-	 * the overlaps in same node.
-	 *
-	 * Node with 0 bytes memory doesn't need this expandsion.
-	 */
-	nd_start = start;
-	nd_end = end;
-	nd = &nodes[node];
-	if (nd->start != nd->end) {
-		if (nd_start > nd->start)
-			nd_start = nd->start;
-
-		if (nd_end < nd->end)
-			nd_end = nd->end;
-	}
-
-	/* It is fine to add this area to the nodes data it will be used later*/
-	switch (conflicting_memblks(node, start, end, nd_start, nd_end, &i)) {
-	case OVERLAP:
-		if (memblk_nodeid[i] == node) {
-			bool mismatch = !(ma->flags &
-					  ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
-			                !test_bit(i, memblk_hotplug);
-
-			printk("%sSRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
-			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
-			       end - 1, node_memblk_range[i].start,
-			       node_memblk_range[i].end - 1);
-			if (mismatch) {
-				bad_srat();
-				return;
-			}
-			break;
-		}
-
-		printk(KERN_ERR
-		       "SRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with PXM %u [%"PRIpaddr", %"PRIpaddr"]\n",
-		       pxm, start, end - 1, node_to_pxm(memblk_nodeid[i]),
-		       node_memblk_range[i].start,
-		       node_memblk_range[i].end - 1);
-		bad_srat();
-		return;
-
-	case INTERLEAVE:
-		printk(KERN_ERR
-		       "SRAT： PXM %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with PXM %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
-		       pxm, nd_start, nd_end - 1, node_to_pxm(memblk_nodeid[i]),
-		       node_memblk_range[i].start, node_memblk_range[i].end - 1);
-		bad_srat();
-		return;
-
-	case NO_CONFLICT:
-		break;
-	}
-
-	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
-		node_set(node, memory_nodes_parsed);
-		nd->start = nd_start;
-		nd->end = nd_end;
-	}
-
-	printk(KERN_INFO "SRAT: Node %u PXM %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
-	       node, pxm, start, end - 1,
-	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
-
-	/* Keep node_memblk_range[] sorted by address. */
-	for (i = 0; i < num_node_memblks; ++i)
-		if (node_memblk_range[i].start > start ||
-		    (node_memblk_range[i].start == start &&
-		     node_memblk_range[i].end > end))
-			break;
-
-	memmove(&node_memblk_range[i + 1], &node_memblk_range[i],
-	        (num_node_memblks - i) * sizeof(*node_memblk_range));
-	node_memblk_range[i].start = start;
-	node_memblk_range[i].end = end;
-
-	memmove(&memblk_nodeid[i + 1], &memblk_nodeid[i],
-	        (num_node_memblks - i) * sizeof(*memblk_nodeid));
-	memblk_nodeid[i] = node;
-
-	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
-		next = true;
-		if (end > mem_hotplug)
-			mem_hotplug = end;
-	}
-	for (; i <= num_node_memblks; ++i) {
-		bool prev = next;
-
-		next = test_bit(i, memblk_hotplug);
-		if (prev)
-			__set_bit(i, memblk_hotplug);
-		else
-			__clear_bit(i, memblk_hotplug);
-	}
-
-	num_node_memblks++;
-}
-
-/* Sanity check to catch more bad SRATs (they are amazingly common).
-   Make sure the PXMs cover all memory. */
-static int __init nodes_cover_memory(void)
-{
-	unsigned int i;
-
-	for (i = 0; ; i++) {
-		int err;
-		unsigned int j;
-		bool found;
-		paddr_t start, end;
-
-		/* Try to loop memory map from index 0 to end to get RAM ranges. */
-		err = arch_get_ram_range(i, &start, &end);
-
-		/* Reached the end of the memory map? */
-		if (err == -ENOENT)
-			break;
-
-		/* Skip non-RAM entries. */
-		if (err)
-			continue;
-
-		do {
-			found = false;
-			for_each_node_mask(j, memory_nodes_parsed)
-				if (start < nodes[j].end
-				    && end > nodes[j].start) {
-					if (start >= nodes[j].start) {
-						start = nodes[j].end;
-						found = true;
-					}
-					if (end <= nodes[j].end) {
-						end = nodes[j].start;
-						found = true;
-					}
-				}
-		} while (found && start < end);
-
-		if (start < end) {
-			printk(KERN_ERR "NUMA: No NODE for RAM range: "
-				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
-			return 0;
-		}
-	}
-	return 1;
+	numa_fw_nid_name = "PXM";
+	if (!numa_update_node_memblks(node, pxm, ma->base_address, ma->length,
+				      ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE))
+		numa_fw_bad();
 }
 
 void __init acpi_numa_arch_fixup(void) {}
@@ -534,6 +295,7 @@ void __init srat_parse_regions(paddr_t addr)
 	    acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat))
 		return;
 
+	numa_fw_nid_name = "PXM";
 	srat_region_mask = pdx_init_mask(addr);
 	acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
 			      srat_parse_region, 0);
@@ -549,59 +311,9 @@ void __init srat_parse_regions(paddr_t addr)
 	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
-/* Use discovered information to actually set up the nodes. */
-int __init numa_process_nodes(paddr_t start, paddr_t end)
+unsigned int numa_node_to_arch_nid(nodeid_t n)
 {
-	int i;
-	nodemask_t all_nodes_parsed;
-
-	/* First clean up the node list */
-	for (i = 0; i < MAX_NUMNODES; i++)
-		cutoff_node(i, start, end);
-
-	if (acpi_numa <= 0)
-		return -1;
-
-	if (!nodes_cover_memory()) {
-		bad_srat();
-		return -1;
-	}
-
-	memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
-				memblk_nodeid);
-
-	if (memnode_shift < 0) {
-		printk(KERN_ERR
-		     "SRAT: No NUMA node hash function found. Contact maintainer\n");
-		bad_srat();
-		return -1;
-	}
-
-	nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
-
-	/* Finally register nodes */
-	for_each_node_mask(i, all_nodes_parsed)
-	{
-		uint64_t size = nodes[i].end - nodes[i].start;
-
-		if ( size == 0 )
-			printk(KERN_INFO "SRAT: node %u has no memory\n", i);
-
-		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-	}
-	for (i = 0; i < nr_cpu_ids; i++) {
-		if (cpu_to_node[i] == NUMA_NO_NODE)
-			continue;
-		if (!nodemask_test(cpu_to_node[i], &processor_nodes_parsed))
-			numa_set_node(i, NUMA_NO_NODE);
-	}
-	numa_init_array();
-	return 0;
-}
-
-static unsigned node_to_pxm(nodeid_t n)
-{
-	unsigned i;
+	unsigned int i;
 
 	if ((n < ARRAY_SIZE(pxm2node)) && (pxm2node[n].node == n))
 		return pxm2node[n].pxm;
@@ -618,8 +330,8 @@ u8 __node_distance(nodeid_t a, nodeid_t b)
 
 	if (!acpi_slit)
 		return a == b ? 10 : 20;
-	index = acpi_slit->locality_count * node_to_pxm(a);
-	slit_val = acpi_slit->entry[index + node_to_pxm(b)];
+	index = acpi_slit->locality_count * numa_node_to_arch_nid(a);
+	slit_val = acpi_slit->entry[index + numa_node_to_arch_nid(b)];
 
 	/* ACPI defines 0xff as an unreachable node and 0-9 are undefined */
 	if ((slit_val == 0xff) || (slit_val <= 9))
diff --git a/xen/common/numa.c b/xen/common/numa.c
index a135154c3e..4948b21fbe 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -13,6 +13,21 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
+static nodemask_t __initdata processor_nodes_parsed;
+static nodemask_t __initdata memory_nodes_parsed;
+static struct node __initdata nodes[MAX_NUMNODES];
+
+static unsigned int __ro_after_init num_node_memblks;
+static struct node __ro_after_init node_memblk_range[NR_NODE_MEMBLKS];
+static nodeid_t __ro_after_init memblk_nodeid[NR_NODE_MEMBLKS];
+static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
+
+enum conflicts {
+    NO_CONFLICT,
+    OVERLAP,
+    INTERLEAVE,
+};
+
 struct node_data __ro_after_init node_data[MAX_NUMNODES];
 
 /* Mapping from pdx to node id */
@@ -31,11 +46,335 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 bool __ro_after_init numa_off;
 
+const char *__ro_after_init numa_fw_nid_name = "???";
+
 bool numa_disabled(void)
 {
     return numa_off || arch_numa_disabled();
 }
 
+void __init numa_set_processor_nodes_parsed(nodeid_t node)
+{
+    node_set(node, processor_nodes_parsed);
+}
+
+bool valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
+{
+    unsigned int i;
+
+    for ( i = 0; i < num_node_memblks; i++ )
+    {
+        const struct node *nd = &node_memblk_range[i];
+
+        if ( nd->start <= start && nd->end >= end &&
+             memblk_nodeid[i] == node )
+            return true;
+    }
+
+    return false;
+}
+
+static enum conflicts __init conflicting_memblks(
+    nodeid_t nid, paddr_t start, paddr_t end, paddr_t nd_start,
+    paddr_t nd_end, unsigned int *mblkid)
+{
+    unsigned int i;
+
+    /*
+     * Scan all recorded nodes' memory blocks to check conflicts:
+     * Overlap or interleave.
+     */
+    for ( i = 0; i < num_node_memblks; i++ )
+    {
+        const struct node *nd = &node_memblk_range[i];
+
+        *mblkid = i;
+
+        /* Skip 0 bytes node memory block. */
+        if ( nd->start == nd->end )
+            continue;
+        /*
+         * Use memblk range to check memblk overlaps, include the
+         * self-overlap case. As nd's range is non-empty, the special
+         * case "nd->end == end && nd->start == start" also can be covered.
+         */
+        if ( nd->end > start && nd->start < end )
+            return OVERLAP;
+
+        /*
+         * Use node memory range to check whether new range contains
+         * memory from other nodes - interleave check. We just need
+         * to check full contains situation. Because overlaps have
+         * been checked above.
+         */
+        if ( nid != memblk_nodeid[i] &&
+             nd->start >= nd_start && nd->end <= nd_end )
+            return INTERLEAVE;
+    }
+
+    return NO_CONFLICT;
+}
+
+static void __init cutoff_node(nodeid_t i, paddr_t start, paddr_t end)
+{
+    struct node *nd = &nodes[i];
+
+    if ( nd->start < start )
+    {
+        nd->start = start;
+        if ( nd->end < nd->start )
+            nd->start = nd->end;
+    }
+
+    if ( nd->end > end )
+    {
+        nd->end = end;
+        if ( nd->start > nd->end )
+            nd->start = nd->end;
+    }
+}
+
+bool __init numa_memblks_available(void)
+{
+    return num_node_memblks < NR_NODE_MEMBLKS;
+}
+
+/*
+ * This function will be called by NUMA memory affinity initialization to
+ * update NUMA node's memory range. In this function, we assume all memory
+ * regions belonging to a single node are in one chunk. Holes (or MMIO
+ * ranges) between them will be included in the node.
+ *
+ * So in numa_update_node_memblks, if there are multiple banks for each
+ * node, start and end are stretched to cover the holes between them, and
+ * it works as long as memory banks of different NUMA nodes don't interleave.
+ */
+bool __init numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
+                                     paddr_t start, paddr_t size, bool hotplug)
+{
+    unsigned int i;
+    bool next = false;
+    paddr_t end = start + size;
+    paddr_t nd_start = start;
+    paddr_t nd_end = end;
+    struct node *nd = &nodes[node];
+
+    /*
+     * For the node that already has some memory blocks, we will
+     * expand the node memory range temporarily to check memory
+     * interleaves with other nodes. We will not use this node
+     * temp memory range to check overlaps, because it will mask
+     * the overlaps in same node.
+     *
+     * Node with 0 bytes memory doesn't need this expansion.
+     */
+    if ( nd->start != nd->end )
+    {
+        if ( nd_start > nd->start )
+            nd_start = nd->start;
+
+        if ( nd_end < nd->end )
+            nd_end = nd->end;
+    }
+
+    /* It is fine to add this area to the nodes data it will be used later */
+    switch ( conflicting_memblks(node, start, end, nd_start, nd_end, &i) )
+    {
+    case OVERLAP:
+        if ( memblk_nodeid[i] == node )
+        {
+            bool mismatch = !hotplug != !test_bit(i, memblk_hotplug);
+
+            printk("%sNUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
+                   mismatch ? KERN_ERR : KERN_WARNING, numa_fw_nid_name,
+                   arch_nid, start, end - 1,
+                   node_memblk_range[i].start, node_memblk_range[i].end - 1);
+            if ( mismatch )
+                return false;
+            break;
+        }
+
+        printk(KERN_ERR
+               "NUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with %s %u [%"PRIpaddr", %"PRIpaddr"]\n",
+               numa_fw_nid_name, arch_nid, start, end - 1, numa_fw_nid_name,
+               numa_node_to_arch_nid(memblk_nodeid[i]),
+               node_memblk_range[i].start, node_memblk_range[i].end - 1);
+        return false;
+
+    case INTERLEAVE:
+        printk(KERN_ERR
+               "NUMA： %s %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with %s %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
+               numa_fw_nid_name, arch_nid, nd_start, nd_end - 1,
+               numa_fw_nid_name, numa_node_to_arch_nid(memblk_nodeid[i]),
+               node_memblk_range[i].start, node_memblk_range[i].end - 1);
+        return false;
+
+    case NO_CONFLICT:
+        break;
+    }
+
+    if ( !hotplug )
+    {
+        node_set(node, memory_nodes_parsed);
+        nd->start = nd_start;
+        nd->end = nd_end;
+    }
+
+    printk(KERN_INFO "NUMA: Node %u %s %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
+           node, numa_fw_nid_name, arch_nid, start, end - 1,
+           hotplug ? " (hotplug)" : "");
+
+    /* Keep node_memblk_range[] sorted by address. */
+    for ( i = 0; i < num_node_memblks; ++i )
+        if ( node_memblk_range[i].start > start ||
+             (node_memblk_range[i].start == start &&
+             node_memblk_range[i].end > end) )
+            break;
+
+    memmove(&node_memblk_range[i + 1], &node_memblk_range[i],
+            (num_node_memblks - i) * sizeof(*node_memblk_range));
+    node_memblk_range[i].start = start;
+    node_memblk_range[i].end = end;
+
+    memmove(&memblk_nodeid[i + 1], &memblk_nodeid[i],
+            (num_node_memblks - i) * sizeof(*memblk_nodeid));
+    memblk_nodeid[i] = node;
+
+    if ( hotplug )
+    {
+        next = true;
+        if ( end > mem_hotplug )
+            mem_hotplug = end;
+    }
+
+    for ( ; i <= num_node_memblks; ++i )
+    {
+        bool prev = next;
+
+        next = test_bit(i, memblk_hotplug);
+        if ( prev )
+            __set_bit(i, memblk_hotplug);
+        else
+            __clear_bit(i, memblk_hotplug);
+    }
+
+    num_node_memblks++;
+
+    return true;
+}
+
+/*
+ * Sanity check to catch more bad SRATs (they are amazingly common).
+ * Make sure the PXMs cover all memory.
+ */
+static bool __init nodes_cover_memory(void)
+{
+    unsigned int i;
+
+    for ( i = 0; ; i++ )
+    {
+        int err;
+        unsigned int j;
+        bool found;
+        paddr_t start, end;
+
+        /* Try to loop memory map from index 0 to end to get RAM ranges. */
+        err = arch_get_ram_range(i, &start, &end);
+
+        /* Reached the end of the memory map? */
+        if ( err == -ENOENT )
+            break;
+
+        /* Skip non-RAM entries. */
+        if ( err )
+            continue;
+
+        do {
+            found = false;
+            for_each_node_mask ( j, memory_nodes_parsed )
+                if ( start < nodes[j].end && end > nodes[j].start )
+                {
+                    if ( start >= nodes[j].start )
+                    {
+                        start = nodes[j].end;
+                        found = true;
+                    }
+
+                    if ( end <= nodes[j].end )
+                    {
+                        end = nodes[j].start;
+                        found = true;
+                    }
+                }
+        } while ( found && start < end );
+
+        if ( start < end )
+        {
+            printk(KERN_ERR "NUMA: No node for RAM range: "
+                   "[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
+            return false;
+        }
+    }
+
+    return true;
+}
+
+/* Use discovered information to actually set up the nodes. */
+static bool __init numa_process_nodes(paddr_t start, paddr_t end)
+{
+    int ret;
+    unsigned int i;
+    nodemask_t all_nodes_parsed;
+
+    /* First clean up the node list */
+    for ( i = 0; i < MAX_NUMNODES; i++ )
+        cutoff_node(i, start, end);
+
+    /* When numa is on and has data, we can start to process numa nodes. */
+    if ( arch_numa_unavailable() )
+        return false;
+
+    if ( !nodes_cover_memory() )
+    {
+        numa_fw_bad();
+        return false;
+    }
+
+    ret = compute_hash_shift(node_memblk_range, num_node_memblks,
+                             memblk_nodeid);
+    if ( ret < 0 )
+    {
+        printk(KERN_ERR
+               "NUMA: No NUMA node hash function found. Contact maintainer\n");
+        numa_fw_bad();
+        return false;
+    }
+    memnode_shift = ret;
+
+    nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
+
+    /* Finally register nodes */
+    for_each_node_mask ( i, all_nodes_parsed )
+    {
+        if ( nodes[i].end == nodes[i].start )
+            printk(KERN_INFO "NUMA: node %u has no memory\n", i);
+
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+    }
+
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] == NUMA_NO_NODE )
+            continue;
+        if ( !nodemask_test(cpu_to_node[i], &processor_nodes_parsed) )
+            numa_set_node(i, NUMA_NO_NODE);
+    }
+
+    numa_init_array();
+
+    return true;
+}
+
 /*
  * Given a shift value, try to populate memnodemap[]
  * Returns :
@@ -261,7 +600,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 #endif
 
 #ifdef CONFIG_NUMA
-    if ( !numa_off && !numa_process_nodes(start, end) )
+    if ( !numa_off && numa_process_nodes(start, end) )
         return;
 #endif
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 62afb07bc6..07df36d475 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -159,6 +159,8 @@
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
 
+paddr_t __ro_after_init mem_hotplug;
+
 /*
  * Comma-separated list of hexadecimal page numbers containing bad bytes.
  * e.g. 'badpage=0x3f45,0x8a321'.
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index a925028ab3..9d14aed74b 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -147,6 +147,8 @@ int assign_page(
 /* Dump info to serial console */
 void arch_dump_shared_mem_info(void);
 
+extern paddr_t mem_hotplug;
+
 /*
  * Extra fault info types which are used to further describe
  * the source of an access violation.
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 9da0e7d555..04ecaf7769 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -11,6 +11,7 @@
 #define NUMA_NO_DISTANCE 0xFF
 
 #define MAX_NUMNODES    (1 << NODES_SHIFT)
+#define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
@@ -36,14 +37,16 @@ extern int compute_hash_shift(const struct node *nodes,
                               unsigned int numnodes, const nodeid_t *nodeids);
 
 extern bool numa_off;
+extern const char *numa_fw_nid_name;
 
 extern void numa_add_cpu(unsigned int cpu);
 extern void numa_init_array(void);
 extern void numa_set_node(unsigned int cpu, nodeid_t node);
 extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
-extern int numa_process_nodes(paddr_t start, paddr_t end);
+extern void numa_fw_bad(void);
 
 extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_unavailable(void);
 extern bool arch_numa_disabled(void);
 extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 
@@ -92,6 +95,11 @@ static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
  */
 extern int arch_get_ram_range(unsigned int idx,
                               paddr_t *start, paddr_t *end);
+extern bool valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
+extern bool numa_memblks_available(void);
+extern bool numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
+                                     paddr_t start, paddr_t size, bool hotplug);
+extern void numa_set_processor_nodes_parsed(nodeid_t node);
 
 #endif
 
-- 
2.25.1


