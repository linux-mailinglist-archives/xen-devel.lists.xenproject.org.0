Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAC95BE19D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 11:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409253.652274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJV-0005Rk-Og; Tue, 20 Sep 2022 09:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409253.652274; Tue, 20 Sep 2022 09:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJV-0005Nh-JH; Tue, 20 Sep 2022 09:13:09 +0000
Received: by outflank-mailman (input) for mailman id 409253;
 Tue, 20 Sep 2022 09:13:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UnT0=ZX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oaZJU-0003bZ-05
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 09:13:08 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20058.outbound.protection.outlook.com [40.107.2.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 703d27ef-38c4-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 11:13:07 +0200 (CEST)
Received: from AS8P189CA0017.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::12)
 by AS4PR08MB8118.eurprd08.prod.outlook.com (2603:10a6:20b:58a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 09:13:05 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::8c) by AS8P189CA0017.outlook.office365.com
 (2603:10a6:20b:31f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Tue, 20 Sep 2022 09:13:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:13:04 +0000
Received: ("Tessian outbound 3c27ae03f5ec:v124");
 Tue, 20 Sep 2022 09:13:04 +0000
Received: from 9b23682e8610.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C12A616-0F5E-4193-8A50-022FD27B38D1.1; 
 Tue, 20 Sep 2022 09:12:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b23682e8610.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Sep 2022 09:12:58 +0000
Received: from FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::7) by
 DU0PR08MB9439.eurprd08.prod.outlook.com (2603:10a6:10:42d::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.21; Tue, 20 Sep 2022 09:12:54 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::12) by FR3P281CA0154.outlook.office365.com
 (2603:10a6:d10:a2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:54 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:53 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 20 Sep
 2022 09:12:50 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:47 +0000
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
X-Inumbo-ID: 703d27ef-38c4-11ed-9647-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BNAqS+oVdu6cKeoZSlV0ev5QJJPBOOzuuYtfg/iAIXORGv4Caxl0qzeUpBWqL5X+QuYFJHsscj7iE6aMbSvaqsVtZ1I3FEs7AM9vICPASp+ddOeVTO2rTxhtqglYORCHhJcJ2uXDfsDwCGZa1Wfp1A7yTva65EMZ6UR5TeiELtqjtEWAvByNilCzrjlxNicPKs0jV70ZIJUIjBj6qTjFFawL4SUIkDJ9P1QTb1eqU5FEnShqYhgwjrWzR2Ppi1VIzK6IaPzaNo6NjbOzVsV8h5bamDATMstrdYUMlXIvus8ennpySrsMEj98EXvTmebOjuKT1CZD2jMLbZfrRNs4Mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFQSEiC1wVF3SghW0Tlnd8Ag25n68oQY6R+gL/4gByY=;
 b=lFU8WavDFj7DZPhiOBdIoEnZqRDHyM00lJDROrZT0wKIv/dAEpr+SwhItINLS/c9QjcLbgJHtgh/XwzloJi+9gQbQvi5bl/oCRfoSykd5zJeTLqMMYDaOn9e7pnQmovUuNzUWIxqYWRsSySHjMlmYPotQVlEAa97MtdCedFUyg9Gi8t9LXf+DD+7A5e00LnePLoWRAtVopTQpkTzZ5CRxXf/3MrA7s4dL7qGKk7AIchHW1AQMkffsx/Aoh9ZMMfgdRDJwqpNLw2uFQELZ5BBROW8hBbF9RIOWAGbFcGuFXHEjnUM3cr0a3mPrtbu0i3FfVAu66BTJEC4VLQnuzkC8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFQSEiC1wVF3SghW0Tlnd8Ag25n68oQY6R+gL/4gByY=;
 b=f9CjWTpSqa1JJoD1N8w8Pw8tJw3p+GTXZWczW1UjKo48HiJikHvyfzjR4YAklu+18Pc0iAY8GiyZ8skDUgD88uaLPC1XJxaHMV1SfKVUA76993T9I5UFaReqFtwxhh+PAaf0n7Jgxcit53VXku2Zl9qtXRoMqZDqF8j8ReJY1ew=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0269bc582c795a1c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFuMSDp0e4D0vJVbEaW/Bj9Nun2dIXHsz8bOeNQ5qX1KlBCWi57+zSfZLVLvH+iFCYgZQUbmdMzjc5ji3ceCTuuIHnxfl6gi2y+p67MlA2yEaFXpkduskRCWCC84RnfqsSm24j7SCRCd25Y/wZkId98/7CnP0KI17kSJbeix5IXfIPnDviajeDKChKe+xQKmcXK5UKeePWe/sW+eRqVNenBk5j7cVjKDokXeXx0Smjr+obDkYbuRRgmfzVsRkZjhbGNv6Hsu6+E+EkjdtMfjpD5Vuw0Dew5R4P1+z18KVZiIA6tuE7II2NXVH0mbuuv3D5qOYieuMYprv9jZLGt9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFQSEiC1wVF3SghW0Tlnd8Ag25n68oQY6R+gL/4gByY=;
 b=ThRUpxkIZfzjMmehywjqtyiJGo+Y7B84n1n++CeSOx0jfHQw0XiQyCkeA+n4/HazMKv8WSEe/S2kUG7xTvENVp21it1sjsZaojsUQfSg2GuBjRPgztcg27GPRYjr9kEx7KbEb5jroH0/VQ3ttHb1YkMwzRYHT6ARin+OXmP/0dJS3EQwRBazpxxkoxcUJ0yU6ts3a6Zt7R6azMqYk0x3dG4AMLh2UQ6zuuIRhZ3pNmPrFZOBl4UPo0S+Y3XG1LPAmNI+1U7kGpw9oA45GHmxKZgl33HFcKWSN9VcKQLONR1MQTeA8uShZBF9E+Js7Y2dlefKov+Vq/5zcVCY+/47AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFQSEiC1wVF3SghW0Tlnd8Ag25n68oQY6R+gL/4gByY=;
 b=f9CjWTpSqa1JJoD1N8w8Pw8tJw3p+GTXZWczW1UjKo48HiJikHvyfzjR4YAklu+18Pc0iAY8GiyZ8skDUgD88uaLPC1XJxaHMV1SfKVUA76993T9I5UFaReqFtwxhh+PAaf0n7Jgxcit53VXku2Zl9qtXRoMqZDqF8j8ReJY1ew=
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
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 6/6] xen: introduce a Kconfig option to configure NUMA nodes number
Date: Tue, 20 Sep 2022 17:12:18 +0800
Message-ID: <20220920091218.1208658-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920091218.1208658-1-wei.chen@arm.com>
References: <20220920091218.1208658-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT028:EE_|DU0PR08MB9439:EE_|AM7EUR03FT047:EE_|AS4PR08MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 2212cf38-3720-46a0-b347-08da9ae85324
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 urH7mDjAbkrn4EL4iEgbWWoPyvPsknma3r3jsqIuZM4k7OAnMvPT/cYnqec1OHsxdZgNlNglVtu53nR4WR/pH45MtcsLzMh/DlAmhvIfvrUkDjgAKDmrH2ZsP+WtxFN4BJzWn//c3b0kACjmINBtFrC3uNPKe60MFpmsyiQhpufhjNOSEGIL+O42uIzqLAYoNtDvr9x8czwBZXy92vboTspNe2u5pDm7aPpkWbCNIDZVgqO4UAxuO19n2tYlM5Rg4KBS55F0G5gJdqd78CJY3q+2dlA0fIiizvnBVU0hV0dOGtGfNGFAiyU3LoRzRpHPqfnMNCJJR7EdXVdSFFWTh867kxt959zcxKwMQ7sVrovDtaFYWgFnFkg7SfXV88r3k+2uAqdGCmLQtloO7yLitIc1GqA72HouqV7nn399jMkmCzZBz4w/Bl9+PR9cRqWXg8kxc4LYKWM+IOVSWm0T/aoB6Al+Hcu8VL99RgKBQZmaNJ+nxFnlvXugv3QYt7A+vsd/4Ehm/lSS6tplrx6AQDAVz2fcLlg4uJZ0vxjUJitos0jKHgjiZtwl67drYuQZ9BtpxmMAvMoxpxEDyXMQ99Ak7/xK30n87gEasGfXEfCtrx57H7oEpb0ws7cNnpFu5gdCNmRyPNgqTq1/B4Oy8YCclhXAWQd1d8moDieRpJXdR1wGj9l1IDeL8CpEqUT9+mYgD6CUEZ5vtlX/pglHwNaoX8t/G7v1cjgqLlnxuFtfKnJZphI2RZx1ivqRw/kft2yz1kkQzalhgpoWXnOa+BGaxAAT1jVByI5Qun9fXLw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(1076003)(5660300002)(40460700003)(336012)(82310400005)(2616005)(186003)(316002)(44832011)(47076005)(54906003)(6916009)(356005)(8936002)(86362001)(26005)(40480700001)(4326008)(7696005)(36756003)(2906002)(36860700001)(82740400003)(478600001)(426003)(83380400001)(70206006)(8676002)(70586007)(41300700001)(6666004)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9439
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	166e9532-e357-4c16-e3a4-08da9ae84d28
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d/q6MHh2HoE0qNw7J+F5cedxpbNMcuAPvqoyshO8DK3FJQ65g+MSDgg1ZNwcYhDh12eeWsvtQalV7I7FTElvrgFYoKkgMM4rfUklFTU5YbkgAvcMc8I+vM50R+BTyU2yHVjObBEkvZlLAXOSLK2txWBPsHz8Um68/OtNC4y/JX5IEjgtBYbLe9zi4DqNrxQYn5jF24Mt2nIL3zsJfgNz/1o7ftsQG6FAtkfRgBnKDiISQ1l6b25PEzZWh1SqFiS+MIMJPQ7nn1PbBECI0kf+YSrmSoHsag3YJ0kijnUJIVm3BlAxPcRXJzCRk8f2Oz4TIimJhDIgbSCDIFmtCcSywsjNms5CkcbpGqACNozo04p8NIx6R8Oy1TcG/7is+10S6quJ3DdVaGIKS+Jj+1QxZ+LcCEX4Tmeln/i54E1PcUpmLi+pnZGD5UfiNqsidq0rQqUMY3y8SXcqMtQR2nthDDlGF85lf1OeYAPVJJKCigY5HnfPcGM0jtFqWuy1eiQHbQmU6WKK+2bamYnGhLahnmiyvYh1cQaToL9p0/EqN3PyCt6CVfL/hfAgeWFV/tHMu2OIs3A+c/07QEg+G0yFBpHjBrZRORr7ryeG7uQVPZos5tZea1gYtklQ7dfFEhTAA1lUlEy6kBQbIQbSn38nnXi3g3jU1gAd1yb5EG7+Ilp9ecPje4wVpKTuNSj+ROg2lHLEcpZ9nzaOzRr+dxK+hWF4cw39ysFJWs0MNy0w0FtBFb/oiMqxEsOb5EojpvMsKDhNxtABI1EQlpFbGcm0Sw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(81166007)(86362001)(82740400003)(336012)(47076005)(426003)(83380400001)(44832011)(5660300002)(8936002)(2906002)(186003)(2616005)(36860700001)(107886003)(7696005)(1076003)(40460700003)(6666004)(26005)(70206006)(41300700001)(316002)(8676002)(4326008)(70586007)(40480700001)(82310400005)(54906003)(6916009)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 09:13:04.3725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2212cf38-3720-46a0-b347-08da9ae85324
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8118

Currently the maximum number of NUMA nodes is a hardcoded value.
This provides little flexibility unless changing the code.

Introduce a new Kconfig option to change the maximum number of
NUMA nodes conveniently. Also considering that not all
architectures support NUMA, this Kconfig option is only visible
on NUMA enabled architectures. Architectures not supporting NUMA
still use 1 for MAX_NUMNODES.

As NODES_SHIFT is currently unused, we're taking this
opportunity to remove it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v4 -> v5:
1. No change.
v3 -> v4:
1. Update the commit log to follow Jan's suggestion.
2. Add Ack-by.
v2 -> v3:
1. Fix indent.
2. Use 2-64 for node range.
v1 -> v2:
1. Add NODES_SHIFT remove message in commit log
2. Change NR_NUMA_NODES upper bound from 4095 to 255.
---
 xen/arch/Kconfig                | 11 +++++++++++
 xen/arch/x86/include/asm/numa.h |  2 --
 xen/include/xen/numa.h          | 11 ++++++-----
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f16eb0df43..7028f7b74f 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -17,3 +17,14 @@ config NR_CPUS
 	  For CPU cores which support Simultaneous Multi-Threading or similar
 	  technologies, this the number of logical threads which Xen will
 	  support.
+
+config NR_NUMA_NODES
+	int "Maximum number of NUMA nodes supported"
+	range 2 64
+	default "64"
+	depends on NUMA
+	help
+	  Controls the build-time size of various arrays and bitmaps
+	  associated with multiple-nodes management. It is the upper bound of
+	  the number of NUMA nodes that the scheduler, memory allocation and
+	  other NUMA-aware components can handle.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 2ca3475271..7866afa408 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -3,8 +3,6 @@
 
 #include <xen/cpumask.h>
 
-#define NODES_SHIFT 6
-
 typedef u8 nodeid_t;
 
 extern int srat_rev;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index a87cdc45b4..cabe8571b3 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -3,14 +3,15 @@
 
 #include <asm/numa.h>
 
-#ifndef NODES_SHIFT
-#define NODES_SHIFT     0
-#endif
-
 #define NUMA_NO_NODE     0xFF
 #define NUMA_NO_DISTANCE 0xFF
 
-#define MAX_NUMNODES    (1 << NODES_SHIFT)
+#ifdef CONFIG_NR_NUMA_NODES
+#define MAX_NUMNODES CONFIG_NR_NUMA_NODES
+#else
+#define MAX_NUMNODES 1
+#endif
+
 #define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
-- 
2.25.1


