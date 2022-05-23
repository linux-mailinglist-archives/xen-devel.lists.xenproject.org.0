Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75227530987
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335350.559506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1W1-0007sH-A1; Mon, 23 May 2022 06:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335350.559506; Mon, 23 May 2022 06:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1W1-0007pu-6Z; Mon, 23 May 2022 06:26:05 +0000
Received: by outflank-mailman (input) for mailman id 335350;
 Mon, 23 May 2022 06:26:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eb4B=V7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nt1Vz-0007pn-Qo
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:26:04 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe06::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35e12dee-da61-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 08:25:59 +0200 (CEST)
Received: from DB6PR0601CA0003.eurprd06.prod.outlook.com (2603:10a6:4:7b::13)
 by AM0PR08MB5506.eurprd08.prod.outlook.com (2603:10a6:208:17e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 06:25:57 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::97) by DB6PR0601CA0003.outlook.office365.com
 (2603:10a6:4:7b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Mon, 23 May 2022 06:25:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:25:57 +0000
Received: ("Tessian outbound 9a0893f586e2:v119");
 Mon, 23 May 2022 06:25:56 +0000
Received: from 8a838bab2af6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 19D4D063-E5CC-4EA3-B283-728787C5AEF6.1; 
 Mon, 23 May 2022 06:25:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a838bab2af6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 May 2022 06:25:50 +0000
Received: from DB6PR0201CA0034.eurprd02.prod.outlook.com (2603:10a6:4:3f::44)
 by AM6PR08MB2999.eurprd08.prod.outlook.com (2603:10a6:209:44::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Mon, 23 May
 2022 06:25:48 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::d9) by DB6PR0201CA0034.outlook.office365.com
 (2603:10a6:4:3f::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Mon, 23 May 2022 06:25:47 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:25:47 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 23 May
 2022 06:25:46 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 23 May 2022 06:25:43 +0000
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
X-Inumbo-ID: 35e12dee-da61-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=R4qad5UlQypIBk30htOiHvSGaqgeFI66ggtEbzEWHUMXMCjyNTcd1JYUt14RenE/PqUUvQCMJwmwIy54WWQkHpbwmW1JtP/Hc+kRwEgCTow4FNrlzsOvI2m3k7OTbHjImNPBjOmpiwdGHkATeTgVx1teYXPlf5nFuICADSJw95G7Nj4vKja9n+J1QKqnj5R8oPuGhO0swUijxJNmDrYipjtFzl0ojIOIi59Kbrjatq/zgYw0W0DspSpFfcCvhxE2K0S04ztMQa+p18YgAUsQdMcu0C7jPC7ZOsS7AgWLax7GjGQpiRnW6bJitA1EmOv7qkF0A01kZSELgq8N4Vo0tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLQ2m7gOYNHgd1/212k4a11FnWgtoPLhxR6vTurlfYI=;
 b=NdP3nIpeMgLIsxs6kFyZqi+/SXkDcljwyl4yJttuzAU8ttDSzKUWPwg22EhjQK6SZ/Jngefqd9TTJ8s7zcghg/HnH2q/TMaxhCA9UZAB6Io9A92/2NeC2wd48rwtEKv5kncxDos7FdgOHgRqN2CpdJ6iVzvPP7+TDSa5/9ROAkcMzys9C0lHbhTplDjzUjj2IpmeLlLvZTJWo98iORRdz8A0j5EZeW6QYSwRHaE2QUpn5NjoNvXZpRvLnj0aYZgv6OspJA3v0R7JaWeyOT0jpqyrLhsy8ajK1lOpKmuwkSYFy6dcE2OpHUFA5kMCoILjooGkC1nDVNgSvXRz/15G4w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLQ2m7gOYNHgd1/212k4a11FnWgtoPLhxR6vTurlfYI=;
 b=CG2mbGYsFAIZPpziti86RiooqVr37U20bHZeIeTxgtBPvUB1vMMVocmi95PhrVOUKMkAjWYO9pLWB4h4RUechLexK2BkdhLPTaG2v7NhL+LXUl5XoEjBSBwkfuVlYfDermfoCeAgVZTJ/Vgudee8bFeqsT5jF0PJ9j8TXUD14JE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc9ddee32c642f3d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDhpa+lTL5L52+E4Hk52PUfM18pqdxt8VEEYU4gFvslXpbOBTWgh9d2rTvPQJr68xkHR0wn4+EMAda3IBykSH8Px4R5Zy4+c5GZMyvftKn1Aha2fI2b6N5bjbenjq5c6vQ+WSTKft0cYgdbEfTr7JD3gH7f92QAfBpPbgCZSG6S7NjBhYbmuoIkLMnWF4Wkd1YmVkao6vsJk1YMvr/NLbnMV3plc3aV9E2tPqAzgvMSpsR28nYdzhsg2a1znAA91pwCaxBne2RbD8ZlZN2IkLw+q0o6Hpt3nyK8WcnWsL/MqSndDWDmSwZOYpVjZfcjyel3lgpVePloIDrJnNRgnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLQ2m7gOYNHgd1/212k4a11FnWgtoPLhxR6vTurlfYI=;
 b=fKOQcp5THVvWIZcAMpKgNgSfDdgvDnPs61cTAKu1LUqgJj+/Tkt/YsQMcpTNz7CI5DCMS1Y+0JgQgP3IB0GjysrVYu2OiVxtcDGtC32ARWAeEC+JsQDZT3OgV7VLVVqAW4I487ATBfyX5nW6AZWEWr6o7sIQ6nJ/MqRinjsjNqPZqxrO4+5GwPwvoJm+LVUMrAZsIiUdLqT6e1Htyunj52kQR2K1l+w06aIOAZvJJn7EGY7nDFXJOoJd+t0wmFWlURj+XlvSfhB3Dj7aF9Kkd7CK2IxaVOodq+1z7QBW3jnJJc6OJQB3DXcxfEWyS7Bv3G8niRzHHvpm/BbQ7peNwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLQ2m7gOYNHgd1/212k4a11FnWgtoPLhxR6vTurlfYI=;
 b=CG2mbGYsFAIZPpziti86RiooqVr37U20bHZeIeTxgtBPvUB1vMMVocmi95PhrVOUKMkAjWYO9pLWB4h4RUechLexK2BkdhLPTaG2v7NhL+LXUl5XoEjBSBwkfuVlYfDermfoCeAgVZTJ/Vgudee8bFeqsT5jF0PJ9j8TXUD14JE=
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
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v4 0/8] Device tree based NUMA support for Arm - Part#1
Date: Mon, 23 May 2022 14:25:17 +0800
Message-ID: <20220523062525.2504290-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: bce4e0b0-f855-4ebb-b37b-08da3c8518c5
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB2999:EE_|DBAEUR03FT061:EE_|AM0PR08MB5506:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5506003B4AD5DEAE5EA2223E9ED49@AM0PR08MB5506.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a+xZXKUuYoMw7TuYbZcxeIuA4tc1MTcVReMKQIViGkJtN8IY2y15krwVZHNydYkVA5OkyJmbOKfK+on6emgCumx8ggzBXwACGbMA8B+8TGtBiqknF2dn55tfONg3BCKmk1mPo57f503reZ8JQGpblAPzzdh8gikD4Xn08gIg2OuwvvobNawHBMobP6b4FMWtgGQxpCTDJn7sE4CMRthwv8M6un4rcsHSBmpWSDU/2rmnwD16IE+mzx/Vz3Q/oSZRiifaSlugMh6twmYPilV4+365mAIIs8iI6Rm8bzoFZjdDjou8PWs8Mi+b5NbxSv4b7/TW2/ABo+RWpA+zUQwZ5l36aPuj7Rx3y7Pv7TtBVU0U9pHBHjkUkTh6faaqI9HAVBz1vBRqctfTGRE7hyLaV216JiRFGoupzPtxIr3xbIg+zQLYFpcegYBB/Oo8oloVVA/Ur1vaMrK9ORCD//CN2vsAObhSc81eECpzx9R6Xe/P67gtaU0yIhvMc+ydrecI9l3VaSoaqOGz/UYAgYKZmTjgl/1di0Jd/Ggdha+vijMjZILNEi6V4pSVXs9DrASBFdwHS4ATVXtZvazZSEr2Nx1/XCQ2M8oyqhBdrCucrFZaRIF4jOZwVk2L/lKMkI0VySMzzmcB2SGYeSW7AAqA/01tDki4C5hpFAPSxR8XVDjRSiVVhEYxDQ1BoKHngilnvYjbzIkiAnSp71yHoqblVUdFYwMRWRgRNRikTnOHoaTTLojSZom7F/fkXy+pgHSkCVwovh7TqOSsCP9QTEJ6Sg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(81166007)(83380400001)(82310400005)(86362001)(5660300002)(40460700003)(356005)(316002)(508600001)(6666004)(36756003)(36860700001)(7696005)(2906002)(47076005)(8676002)(1076003)(26005)(6916009)(426003)(336012)(70586007)(70206006)(8936002)(54906003)(44832011)(4326008)(186003)(2616005)(21314003)(17413003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2999
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c542f12-e9b2-40a3-aefa-08da3c851327
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kml9Suk3Gwps/8CTLYxHLlmKtI5OYMpqjMI4vFEKVaGvJItltjVinvWudbLkOS3cCG0vdbXmmd++8XfirEmU35rIj5Dk9JcdHJtew4TcEXCznfa8AK9IIlC7hJE0wb+JyEWyLgJEFU2TVamr1FwziokUvkLQXAp8LovYVkksX3HtPEZZMjLrtN2jiFQJ8IuBa+3ATlYJEqCeJ0u3nzexoT8d3k5UFt98cz+BTc1sZFAx+2pUkqme7aYwOqmWQtewV0QclJEVCCU3c2BCz4u8/f45HjdT/MVlLSybQv/Wc5LsuiV5neeHbjAxG25bolEI17ImJNIvYyo7DLBZLmJwGNuQsHam6ANxFuVPD4H6pX8FKv6ZY7erQ1q9/VFei5JkXyL+SwzvHNGs65gsUmYCurZz5GP5Q9tkVYCPGTMF7kOHQkwPOB/udEM9RIWlRdEt5nyICKN+Bpo8WLI5tiuBixPaIBFU60Fmh9+wt7jBrFtouw+QEizBU/vMrJsw3MvPLs7DnZykKoPwZ3DN6fI3YJeAIrS3Mw13L7r1AG0PREoQ+Q7aK35HOR5piVlAlLLgyuHGqIJkyUu0aZhTrDJ3RiIhU+PHDl8EfI1j/eRVNMYnCAYXEC+4jHaWjvxkka//+Wzx9yQP61SADCkEpmXIB67iHMNXGg9PJ/AzQlmgSibaMMlmNzHaMMNInFsX9nK7XyiAAELvPxP/8hGCWclB5JU5fpozhea8ieF4OYPE8iw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70206006)(6916009)(36756003)(316002)(40460700003)(107886003)(8676002)(54906003)(82310400005)(81166007)(4326008)(70586007)(8936002)(6666004)(44832011)(5660300002)(83380400001)(36860700001)(2906002)(86362001)(508600001)(186003)(336012)(426003)(7696005)(2616005)(26005)(1076003)(47076005)(21314003)(17413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 06:25:57.0116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bce4e0b0-f855-4ebb-b37b-08da3c8518c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5506

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series.
2. Move generically usable code from x86 to common.
3. Add new code to support Arm.

This series only contains the first part patches.)

Xen memory allocation and scheduler modules are NUMA aware.
But actually, on x86 has implemented the architecture APIs
to support NUMA. Arm was providing a set of fake architecture
APIs to make it compatible with NUMA awared memory allocation
and scheduler.

Arm system was working well as a single node NUMA system with
these fake APIs, because we didn't have multiple nodes NUMA
system on Arm. But in recent years, more and more Arm devices
support multiple nodes NUMA system.

So now we have a new problem. When Xen is running on these Arm
devices, Xen still treat them as single node SMP systems. The
NUMA affinity capability of Xen memory allocation and scheduler
becomes meaningless. Because they rely on input data that does
not reflect real NUMA layout.

Xen still think the access time for all of the memory is the
same for all CPUs. However, Xen may allocate memory to a VM
from different NUMA nodes with different access speeds. This
difference can be amplified in workloads inside VM, causing
performance instability and timeouts.

So in this patch series, we implement a set of NUMA API to use
device tree to describe the NUMA layout. We reuse most of the
code of x86 NUMA to create and maintain the mapping between
memory and CPU, create the matrix between any two NUMA nodes.
Except ACPI and some x86 specified code, we have moved other
code to common. In next stage, when we implement ACPI based
NUMA for Arm64, we may move the ACPI NUMA code to common too,
but in current stage, we keep it as x86 only.

This patch serires has been tested and booted well on one
Arm64 NUMA machine and one HPE x86 NUMA machine.

---
Part1 v3->v4:
1. Add indent to make ln and test to be aligned in EFI
   common makefile.
2. Drop "ERR" prefix for node conflict check enumeration,
   and remove init value.
3. Use "switch case" for enumeration, and add "default:"
4. Use "PXM" in log messages.
5. Use unsigned int for node memory block id.
6. Fix some code-style comments.
7. Use "nd->end" in node range expansion check.
Part1 v2->v3:
1. Rework EFI stub patch:
   1.1. Add existed file check, if exists a regular stub files,
        the common/stub files' links will be ignored.
   1.2. Keep stub.c in x86/efi to include common/efi/stub.c
   1.3. Restore efi_compat_xxx stub functions to x86/efi.c.
        Other architectures will not use efi_compat_xxx.
   1.4. Remove ARM_EFI dependency from ARM_64.
   1.5. Add comment for adding stub.o to EFIOBJ-y.
   1.6. Merge patch#2 and patch#3 to one patch.
2. Rename arch_have_default_dmazone to arch_want_default_dmazone
3. Use uint64_t for size in acpi_scan_nodes, make it be
   consistent with numa_emulation.
4. Merge the interleaves checking code from a separate function
   to conflicting_memblks.
5. Use INFO level for node's without memory log message.
6. Move "xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
   phys_to_nid" to part#2.
Part1 v1->v2:
1. Move independent patches from later to early of this series.
2. Drop the copy of EFI stub.c from Arm. Share common codes of
   x86 EFI stub for Arm.
3. Use CONFIG_ARM_EFI to replace CONFIG_EFI and remove help text
   and make CONFIG_ARM_EFI invisible.
4. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
5. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
6. Extend the description of Arm's workaround for reserve DMA
   allocations to avoid the same discussion every time for
   arch_have_default_dmazone.
7. Update commit messages.

Wei Chen (8):
  xen: reuse x86 EFI stub functions for Arm
  xen/arm: Keep memory nodes in device tree when Xen boots from EFI
  xen: introduce an arch helper for default dma zone status
  xen: decouple NUMA from ACPI in Kconfig
  xen/arm: use !CONFIG_NUMA to keep fake NUMA API
  xen/x86: use paddr_t for addresses in NUMA node structure
  xen/x86: add detection of memory interleaves for different nodes
  xen/x86: use INFO level for node's without memory log message

 xen/arch/arm/Kconfig              |   4 +
 xen/arch/arm/Makefile             |   2 +-
 xen/arch/arm/bootfdt.c            |   8 +-
 xen/arch/arm/efi/Makefile         |   8 ++
 xen/arch/arm/efi/efi-boot.h       |  25 -----
 xen/arch/arm/include/asm/numa.h   |   6 ++
 xen/arch/x86/Kconfig              |   2 +-
 xen/arch/x86/efi/stub.c           |  32 +------
 xen/arch/x86/include/asm/config.h |   1 -
 xen/arch/x86/include/asm/numa.h   |   9 +-
 xen/arch/x86/numa.c               |  32 +++----
 xen/arch/x86/srat.c               | 154 ++++++++++++++++++++++--------
 xen/common/Kconfig                |   3 +
 xen/common/efi/efi-common.mk      |   3 +-
 xen/common/efi/stub.c             |  32 +++++++
 xen/common/page_alloc.c           |   2 +-
 xen/drivers/acpi/Kconfig          |   3 +-
 xen/drivers/acpi/Makefile         |   2 +-
 18 files changed, 201 insertions(+), 127 deletions(-)
 create mode 100644 xen/common/efi/stub.c

-- 
2.25.1


