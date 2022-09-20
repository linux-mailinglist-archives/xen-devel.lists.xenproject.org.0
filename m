Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6FB5BE184
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 11:13:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409248.652240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJJ-0004D4-Gx; Tue, 20 Sep 2022 09:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409248.652240; Tue, 20 Sep 2022 09:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJJ-0004Aa-DH; Tue, 20 Sep 2022 09:12:57 +0000
Received: by outflank-mailman (input) for mailman id 409248;
 Tue, 20 Sep 2022 09:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UnT0=ZX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oaZJH-0003bf-Kc
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 09:12:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80071.outbound.protection.outlook.com [40.107.8.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68200bdd-38c4-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 11:12:53 +0200 (CEST)
Received: from AS9PR06CA0463.eurprd06.prod.outlook.com (2603:10a6:20b:49a::14)
 by DBBPR08MB6202.eurprd08.prod.outlook.com (2603:10a6:10:209::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 09:12:49 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::a) by AS9PR06CA0463.outlook.office365.com
 (2603:10a6:20b:49a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:49 +0000
Received: ("Tessian outbound 88978e6d60db:v124");
 Tue, 20 Sep 2022 09:12:49 +0000
Received: from 4f26d7b3c6dd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ABBB8001-29BB-4FE5-8F44-555F8579C02B.1; 
 Tue, 20 Sep 2022 09:12:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4f26d7b3c6dd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Sep 2022 09:12:42 +0000
Received: from FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a9::8) by
 DU0PR08MB8640.eurprd08.prod.outlook.com (2603:10a6:10:400::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.18; Tue, 20 Sep 2022 09:12:39 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a9:cafe::ef) by FR0P281CA0098.outlook.office365.com
 (2603:10a6:d10:a9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:39 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:38 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.9; Tue, 20 Sep
 2022 09:12:37 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.9; Tue, 20
 Sep 2022 09:12:36 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:33 +0000
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
X-Inumbo-ID: 68200bdd-38c4-11ed-bad8-01ff208a15ba
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WikNt3T2D+1c8HGdKuuF+lmtDrzW9iJUduWjkz8KIPExHtkA3fmMj5eZOBA4Kd1dCzniWyC/Gaz1jZP99m7udPIZJOPorkPkoWcg/LqskDR+IUkI5CtJrXNUWAVABXum4kFAFuLZmtEhTfEnwZjRsiCPZLLc/kI16wlsauWc2amZ02s597yhYnWYMpMAHpQI9q5JgmFE3r1fZhbV+0cmWojDsNjBztwXVGGfWCHUk3QvJ34AeeZGMajo1HIwlGhidBJzn2c1sfBNOS5uYs2QJRyUQQtFRJsR/3SAzpAqHdWb9QT0ameA2WuWotCqVIs1+XVaP1Lp5uzqIAWfygbMfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2r/TOMmMEno0c/Cxr26T3Lnpm0ZYT9VB9tKKopDfkc=;
 b=lNxjOeBrpikCkU2L9mots4Y1cx+xIIxL35Mq6ZjVvh0Kecs2UxhVAafBHyqxvo/pqU9Ym/68Pz5tOVuXmlJ0OmM6tdrgS0SKlcmGnSFLSA/iOMs8m4d2cuvmgvhjxnrC5w+FY/JO6AqOwCRgFjCurau8YR62BdTAmbNN9jtglSd38k92aHM0KXp9imU6+FopFEVCwNFXsRRV+NJnReZfulIFs3xNNWTMn1KB1htU+8xH8vyl9slrlEdxxC/zYTy4rRJBdR/g4N2dBvAwMX00IErz7oBgXtHuSYQ4G7/ml2/s9slgjFmD0ImNu4IbqxOnam3++Ngrs9+uij1oBlzRZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2r/TOMmMEno0c/Cxr26T3Lnpm0ZYT9VB9tKKopDfkc=;
 b=PFfNwME/EePSHDeHjiWngMG+GT9r+cpOjIPXu7RuckYYdtn0SbcLjAdpmFHR5ScDZH6iTCmaFc3566e3fyK9li2blSgY2SKXHdxCGwDFn18f2HpX4pMByLkrkr7X9JlvraMGu6gRVOMgR8LRmZjEDbDOhlywtuMyJnTNDWFkJnk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0105f0c541f1eeb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbJkBl5J9J98rNa/KPnZIzg4TBaSH6MoIKxzWaKDpqsXJdkq4UIn0FlSf1A9Y9OyuKLNQ24H/btnFNsKriStktTVGw8PhsF5wXclunKYItSNgzRQIFjkTPCW2T0b0eskfUyvxnT/gKaCqsDY1NIiqVFPMIaEFG9qUomrfj8vsbrWZ4S+H9APMxw43Gld2viKBTASrxALcqwLUDWyaAnNpooC25EISXv2u5DLToXzTyLBVcOh0SKl0sW+bpV+ma7kHstWrRFSS0DlvPZD7sfnpzwLrTdYgZ7N3gLPSuhWlstFpHHyTyx47egmuqPTEw+icvuI8v+agWsiQa4Q3hu3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2r/TOMmMEno0c/Cxr26T3Lnpm0ZYT9VB9tKKopDfkc=;
 b=CZZ4BvgIp4CpjLpx4a58VZuVXJoWLl0+tv+tMIYUFkH6Uh84oCyzpAEH0iYGpfMMInjX8zHP5MgAYij8aChshYilixW5zcpQ79aQ3rb65RgiBC394wBaMo5XYi4e5SFSzWVpUuwkNVamqRGsK0OTkrWn/hCIQFuvuigAA6pH5udb/2fwQBmJzMf9H6LXqASajfEtqveS0xo6Vz3EBpYFgxEcQWYfO1Z6yOoQyjHrUaNaGcVvr6lZ+9DlnXzTA01s+siHmfSnoXKUM2bmll00v3DUmETzvkOHfYFq00EDcTxNuosIXU9xcEBbLBwEe6zGIfgQVF8TcTRMt+VAXc8IzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2r/TOMmMEno0c/Cxr26T3Lnpm0ZYT9VB9tKKopDfkc=;
 b=PFfNwME/EePSHDeHjiWngMG+GT9r+cpOjIPXu7RuckYYdtn0SbcLjAdpmFHR5ScDZH6iTCmaFc3566e3fyK9li2blSgY2SKXHdxCGwDFn18f2HpX4pMByLkrkr7X9JlvraMGu6gRVOMgR8LRmZjEDbDOhlywtuMyJnTNDWFkJnk=
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
Subject: [PATCH v5 2/6] xen/x86: move generically usable NUMA code from x86 to common
Date: Tue, 20 Sep 2022 17:12:14 +0800
Message-ID: <20220920091218.1208658-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920091218.1208658-1-wei.chen@arm.com>
References: <20220920091218.1208658-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT016:EE_|DU0PR08MB8640:EE_|AM7EUR03FT030:EE_|DBBPR08MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7b261f-3faa-4888-7d82-08da9ae84a3c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9TVz0ldV5jwnOX5ZXjIUf6sfc6f7wPZIIXCUMGnr7W1klig85P20HuUy/RUwjexkdhO7/zBAciiDmocPF9zCFXhfvIViEPtSh65TxmoKOIGqDU+3X/wjtqlfyqa1mts9sSLlCxyWfPOIjvclZxvWZTPZBphNGZGa9c5bZfh4N7Lytn2J3t2orKxl3s2a5sQ2xpPgxjiz30sddmxy+UpNT2KK0ST/KYVIktP/ukxyy9DVFKYSIi5uxS0VC5P/QCY8RMHyYZBYKE84AuSr7PphuZPW9mWL2TfXgQS8wRvIDbwrkw6kLUzfod7Bb/dDa49DXPVduNjiOhoU9ZoVGuw0dLR0Yz8PHV+j8VPidGVieELl/itbwvO+HTRP/VD58iUCa+rgNMeEynNVliZIj4J6yjw/Wza8KN+LX8FJkegRhRKhkdhBR8aXob9fGv8HJmvJxEtja8GPTvLzypysU3N+xXZa49R3bcuemqLGdMYOoyt2jCGrV+QtxZ6X4TKYeqfL1nqy29JzuAwtM8aQSKsOww5pWh43NVCYY1tGZ5I2RoiYRtM8Z/iyRUw6YwOkg3rYzur9Mf2N56af4zdbi1WLJolJ61UHOdxr5kSjDB1SmOILIziBTwvfP4uuF9d3F0QFnv6a0L8+2n5jFFTcJdu7a/6AbeEBs4VAA+SuQeIExVfrJV3Y2x15ibQr7eZbIKYgGpYtgmgdMtxwZygxnVG0ASH+62R0xFX0YWYhg42Y948acPkh0s5Ao5bg3+5U6KpSQB4b4YGgLDVYHn2dGKXeJHGjYqfFF32rBcJLgeQ6qVso+TF63SnHtlIqnpS6Apxx3oBHuHdTxsS0jTF2Y9PncQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(186003)(336012)(1076003)(2616005)(426003)(356005)(6916009)(316002)(478600001)(82740400003)(5660300002)(54906003)(86362001)(40460700003)(36756003)(40480700001)(81166007)(82310400005)(6666004)(26005)(7696005)(83380400001)(41300700001)(36860700001)(47076005)(4326008)(30864003)(70206006)(8676002)(2906002)(8936002)(70586007)(44832011)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8640
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0236ca6f-382c-43e3-3dfc-08da9ae843dc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tzgUdJETwuROY2xjZkjAQFTsbwlHiJEG0ZfOPsVFomE2XKWd38CT0fmUBIS8N9UVm8b9zfFpXqCIRMi+CRnmbDCX9zkc5UK2uNGD2nfTMnRxoFll07UAiuBwi5gKrpA+3d1rai5DLyJJk4oYymiZA42yej6+yzWPiv1gTmliVtpCi+TQ6aSM/GhMbgp7iWnkzNZ9F9d+HHAcGOwiJYnq1uqv8dYH80mA0BrvrpVK7FQitPjl0qjdHlfIPVy/vYZdzK/MCg916YejuqlQctU9hNmq4/TaJPcOVy4yT0x5b57uYCs1Wb7GPMEvdTmLWDRwvwii3UkkpY0OxZBq74PVZHw2tVbhMgcTOaKlgM2VHVspb0dJT6syaOd0Rggb4DS3wkb6ux5pu+dD/71tQvxh9716oim7MqdMeL0S2s5DRUBy8B+OoyTAyyf0JaICLyz9fm2q/+cd1zz1pcPYN47+mcjtxnncv+WkTjYBKPLyUAuqbuwJocQTZPsxAavQCVpxbkRGrs/fPs5kSpTnZ/vbyMoaSvjbNnkPjh+rFcgT12ndeOINmwwbQJsw5wrfGUOGJoT0Id99Yf8Kz9VkEwqxQp0etMbTH8MED82cHSQkd1vRAXykd/ng7VJ0ZgYhj2l0xITdKMQiqTfbtXb1+jDygAMPOHC+LzBS5mCml/AvUD3xdN2X43RAqGmHJJhlOB+n7nWYs1zJAN0VtamvELO93tdw3nC4zZPzdTgSk0F7E8zSVWmuzR6Ik6E+7McnBsnIarkqPKqjFPeCI8tiEBU4NC3wDVqLrrEhWteK2C7L5m4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(30864003)(44832011)(82740400003)(6666004)(47076005)(426003)(336012)(41300700001)(8936002)(54906003)(107886003)(2616005)(8676002)(1076003)(2906002)(36756003)(83380400001)(82310400005)(70206006)(70586007)(4326008)(316002)(6916009)(26005)(5660300002)(40460700003)(478600001)(7696005)(186003)(40480700001)(81166007)(86362001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 09:12:49.4289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7b261f-3faa-4888-7d82-08da9ae84a3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6202

There are some codes in x86/numa.c can be shared by common
architectures to implememnt NUMA support. Just like some
variables and functions to check and store NUMA memory map.
And some variables and functions to do NUMA initialization.

In this patch, we move them to common/numa.c and xen/numa.h
and use the CONFIG_NUMA to gate them for non-NUMA supported
architectures. As the target header file is Xen-style, so
we trim some spaces and replace tabs for the codes that has
been moved to xen/numa.h at the same time.

As acpi_scan_nodes has been used in a common function, it
doesn't make sense to use acpi_xxx in common code, so we
rename it to numa_scan_nodes in this patch too. After that
if we still use CONFIG_ACPI_NUMA in to gate numa_scan_nodes
in numa_initmem_init, that doesn't make sense. As CONFIG_NUMA
will be selected by CONFIG_ACPI_NUMA for x86. So, we replace
CONFIG_ACPI_NUMA by CONFIG_NUMA to gate numa_scan_nodes.

As arch_numa_disabled has been implememnted for ACPI NUMA,
we can rename srat_disabled to numa_disabled and move it
to common code as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v4 -> v5:
 1. Use nodeid_t instead of uint8_t for memnodemap.
 2. Restore to use typeof(*memnodemap) for _memnodemap, this will avoid the
    further adjustments for _memnodemap's type.
 3. Use __ro_after_init for numa_off.
 4. Use pointer-to-const for proper function parameters.
 5. Use unsigned int for variables that are not realy used for node ID.
 6. Fix code comments code-style and adjust the length.
 7. Fix code-styles.
 8. Rename numa_scan_nodes to numa_process_nodes.
 9. Use a plain "int ret" to record compute_hash_shift return value.
v3 -> v4:
 1. Restore compute_hash_shift's return value to int.
 2. Remove unnecessary parentheses for macros.
 3. Use unsigned int for proper variables.
 4. Fix some code-style.
v2 -> v3:
 1. Remove acpi.h from common/numa.c.
 2. Rename acpi_scan_nodes to numa_scan_nodes.
 3. Replace u8 by uint8_t for memnodemap.
 4. Use unsigned int for memnode_shift and adjust related functions
    (compute_hash_shift, populate_memnodemap) to use correct types for
    return values or parameters.
 5. Use nodeid_t for nodeid and node numbers.
 6. Use __read_mostly and __ro_after_init for appropriate variables.
 7. Adjust the __read_mostly and __initdata location for some variables.
 8. convert from plain int to unsigned for cpuid and other proper variables.
 9. Use __attribute_pure__ instead of __attribute__((pure)).
10. Replace CONFIG_ACPI_NUMA by CONFIG_NUMA in numa_initmem_init.
11. Add const for some functions' parameters.
12. Move srat_disabled to common code with new name numa_disabled.
13. Fix some spaces code-style for numa_emulation.
14. Change from int to unsigned int for numa_fake.
v1 -> v2:
1. New patch in v2.
---
 xen/arch/x86/include/asm/acpi.h  |   1 -
 xen/arch/x86/include/asm/numa.h  |  57 +---
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/numa.c              | 430 +----------------------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              |  10 +-
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 460 +++++++++++++++++++++++++++++++
 xen/include/xen/numa.h           |  67 +++++
 9 files changed, 536 insertions(+), 493 deletions(-)
 create mode 100644 xen/common/numa.c

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 9a9cc4c240..5c2dd5da2d 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -102,7 +102,6 @@ extern unsigned long acpi_wakeup_address;
 #define ARCH_HAS_POWER_INIT	1
 
 extern s8 acpi_numa;
-extern int acpi_scan_nodes(u64 start, u64 end);
 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 529efadf93..6c87942d43 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -9,72 +9,17 @@ typedef u8 nodeid_t;
 
 extern int srat_rev;
 
-extern nodeid_t      cpu_to_node[NR_CPUS];
-extern cpumask_t     node_to_cpumask[];
-
-#define cpu_to_node(cpu)		(cpu_to_node[cpu])
-#define parent_node(node)		(node)
-#define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
-#define node_to_cpumask(node)    (node_to_cpumask[node])
-
-struct node { 
-	paddr_t start, end;
-};
-
-extern int compute_hash_shift(struct node *nodes, int numnodes,
-			      nodeid_t *nodeids);
 extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
-#define VIRTUAL_BUG_ON(x) 
 
-extern void numa_add_cpu(int cpu);
-extern void numa_init_array(void);
-extern bool numa_off;
-
-extern int arch_numa_setup(const char *opt);
-extern bool arch_numa_broken(void);
-extern bool srat_disabled(void);
-extern void numa_set_node(int cpu, nodeid_t node);
+extern bool numa_disabled(void);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
-static inline void clear_node_cpumask(int cpu)
-{
-	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-}
-
-/* Simple perfect hash to map pdx to node numbers */
-extern int memnode_shift; 
-extern unsigned long memnodemapsize;
-extern u8 *memnodemap;
-
-struct node_data {
-    unsigned long node_start_pfn;
-    unsigned long node_spanned_pages;
-};
-
-extern struct node_data node_data[];
-
-static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
-{ 
-	nodeid_t nid;
-	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
-	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift]; 
-	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]); 
-	return nid; 
-} 
-
-#define NODE_DATA(nid)		(&(node_data[nid]))
-
-#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
-#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
-#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
-				 NODE_DATA(nid)->node_spanned_pages)
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 21037b7f31..ae470ea12f 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -20,7 +20,6 @@ void early_time_init(void);
 
 void set_nr_cpu_ids(unsigned int max_cpus);
 
-void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 void arch_init_memory(void);
 void subarch_init_memory(void);
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 1ab37b9c19..21efb1b1b3 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -4,20 +4,11 @@
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */ 
 
-#include <xen/mm.h>
-#include <xen/string.h>
 #include <xen/init.h>
-#include <xen/ctype.h>
+#include <xen/mm.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
-#include <xen/keyhandler.h>
-#include <xen/param.h>
-#include <xen/time.h>
-#include <xen/smp.h>
-#include <xen/pfn.h>
 #include <asm/acpi.h>
-#include <xen/sched.h>
-#include <xen/softirq.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -26,28 +17,13 @@
 /* from proto.h */
 #define round_up(x,y) ((((x)+(y))-1) & (~((y)-1)))
 
-struct node_data node_data[MAX_NUMNODES];
-
-/* Mapping from pdx to node id */
-int memnode_shift;
-static typeof(*memnodemap) _memnodemap[64];
-unsigned long memnodemapsize;
-u8 *memnodemap;
-
-nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
-    [0 ... NR_CPUS-1] = NUMA_NO_NODE
-};
 /*
  * Keep BIOS's CPU2node information, should not be used for memory allocaion
  */
 nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {
     [0 ... MAX_LOCAL_APIC-1] = NUMA_NO_NODE
 };
-cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
 
-nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
-
-bool numa_off;
 s8 acpi_numa = 0;
 
 int __init arch_numa_setup(const char *opt)
@@ -69,267 +45,6 @@ bool arch_numa_broken(void)
     return acpi_numa < 0;
 }
 
-bool srat_disabled(void)
-{
-    return numa_off || arch_numa_broken();
-}
-
-/*
- * Given a shift value, try to populate memnodemap[]
- * Returns :
- * 1 if OK
- * 0 if memnodmap[] too small (of shift too small)
- * -1 if node overlap or lost ram (shift too big)
- */
-static int __init populate_memnodemap(const struct node *nodes,
-                                      int numnodes, int shift, nodeid_t *nodeids)
-{
-    unsigned long spdx, epdx;
-    int i, res = -1;
-
-    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        if ( (epdx >> shift) >= memnodemapsize )
-            return 0;
-        do {
-            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
-                return -1;
-
-            if ( !nodeids )
-                memnodemap[spdx >> shift] = i;
-            else
-                memnodemap[spdx >> shift] = nodeids[i];
-
-            spdx += (1UL << shift);
-        } while ( spdx < epdx );
-        res = 1;
-    }
-
-    return res;
-}
-
-static int __init allocate_cachealigned_memnodemap(void)
-{
-    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
-    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
-
-    memnodemap = mfn_to_virt(mfn);
-    mfn <<= PAGE_SHIFT;
-    size <<= PAGE_SHIFT;
-    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
-           mfn, mfn + size);
-    memnodemapsize = size / sizeof(*memnodemap);
-
-    return 0;
-}
-
-/*
- * The LSB of all start and end addresses in the node map is the value of the
- * maximum possible shift.
- */
-static int __init extract_lsb_from_nodes(const struct node *nodes,
-                                         int numnodes)
-{
-    int i, nodes_used = 0;
-    unsigned long spdx, epdx;
-    unsigned long bitfield = 0, memtop = 0;
-
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        bitfield |= spdx;
-        nodes_used++;
-        if ( epdx > memtop )
-            memtop = epdx;
-    }
-    if ( nodes_used <= 1 )
-        i = BITS_PER_LONG - 1;
-    else
-        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
-    memnodemapsize = (memtop >> i) + 1;
-    return i;
-}
-
-int __init compute_hash_shift(struct node *nodes, int numnodes,
-                              nodeid_t *nodeids)
-{
-    int shift;
-
-    shift = extract_lsb_from_nodes(nodes, numnodes);
-    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
-        memnodemap = _memnodemap;
-    else if ( allocate_cachealigned_memnodemap() )
-        return -1;
-    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
-
-    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
-    {
-        printk(KERN_INFO "Your memory is not aligned you need to "
-               "rebuild your hypervisor with a bigger NODEMAPSIZE "
-               "shift=%d\n", shift);
-        return -1;
-    }
-
-    return shift;
-}
-/* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
-{
-    unsigned long start_pfn = paddr_to_pfn(start);
-    unsigned long end_pfn = paddr_to_pfn(end);
-
-    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
-    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
-
-    node_set_online(nodeid);
-} 
-
-void __init numa_init_array(void)
-{
-    int rr, i;
-
-    /* There are unfortunately some poorly designed mainboards around
-       that only connect memory to a single CPU. This breaks the 1:1 cpu->node
-       mapping. To avoid this fill in the mapping for all possible
-       CPUs, as the number of CPUs is not known yet.
-       We round robin the existing nodes. */
-    rr = first_node(node_online_map);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-    {
-        if ( cpu_to_node[i] != NUMA_NO_NODE )
-            continue;
-        numa_set_node(i, rr);
-        rr = cycle_node(rr, node_online_map);
-    }
-}
-
-#ifdef CONFIG_NUMA_EMU
-static int numa_fake __initdata = 0;
-
-/* Numa emulation */
-static int __init numa_emulation(unsigned long start_pfn,
-                                 unsigned long end_pfn)
-{
-    int i;
-    struct node nodes[MAX_NUMNODES];
-    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
-
-    /* Kludge needed for the hash function */
-    if ( hweight64(sz) > 1 )
-    {
-        u64 x = 1;
-        while ( (x << 1) < sz )
-            x <<= 1;
-        if ( x < sz/2 )
-            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
-        sz = x;
-    }
-
-    memset(&nodes,0,sizeof(nodes));
-    for ( i = 0; i < numa_fake; i++ )
-    {
-        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
-        if ( i == numa_fake - 1 )
-            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
-        nodes[i].end = nodes[i].start + sz;
-        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
-               i,
-               nodes[i].start, nodes[i].end,
-               (nodes[i].end - nodes[i].start) >> 20);
-        node_set_online(i);
-    }
-    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
-    if ( memnode_shift < 0 )
-    {
-        memnode_shift = 0;
-        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
-        return -1;
-    }
-    for_each_online_node ( i )
-        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-    numa_init_array();
-
-    return 0;
-}
-#endif
-
-void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
-{ 
-    int i;
-    paddr_t start = pfn_to_paddr(start_pfn);
-    paddr_t end = pfn_to_paddr(end_pfn);
-
-#ifdef CONFIG_NUMA_EMU
-    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
-        return;
-#endif
-
-#ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes(start, end) )
-        return;
-#endif
-
-    printk(KERN_INFO "%s\n",
-           numa_off ? "NUMA turned off" : "No NUMA configuration found");
-
-    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
-           start, end);
-    /* setup dummy node covering all memory */
-    memnode_shift = BITS_PER_LONG - 1;
-    memnodemap = _memnodemap;
-    /* Dummy node only uses 1 slot in reality */
-    memnodemap[0] = 0;
-    memnodemapsize = 1;
-
-    nodes_clear(node_online_map);
-    node_set_online(0);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-        numa_set_node(i, 0);
-    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, start, end);
-}
-
-void numa_add_cpu(int cpu)
-{
-    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-} 
-
-void numa_set_node(int cpu, nodeid_t node)
-{
-    cpu_to_node[cpu] = node;
-}
-
-/* [numa=off] */
-static int __init cf_check numa_setup(const char *opt)
-{
-    if ( !strncmp(opt, "off", 3) )
-        numa_off = true;
-    else if ( !strncmp(opt, "on", 2) )
-        numa_off = false;
-#ifdef CONFIG_NUMA_EMU
-    else if ( !strncmp(opt, "fake=", 5) )
-    {
-        numa_off = false;
-        numa_fake = simple_strtoul(opt + 5, NULL, 0);
-        if ( numa_fake >= MAX_NUMNODES )
-            numa_fake = MAX_NUMNODES;
-    }
-#endif
-    else
-        return arch_numa_setup(opt);
-
-    return 0;
-} 
-custom_param("numa", numa_setup);
-
 /*
  * Setup early cpu_to_node.
  *
@@ -378,146 +93,3 @@ unsigned int __init arch_get_dma_bitsize(void)
                  flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
                  + PAGE_SHIFT, 32);
 }
-
-static void cf_check dump_numa(unsigned char key)
-{
-    s_time_t now = NOW();
-    unsigned int i, j, n;
-    struct domain *d;
-    struct page_info *page;
-    unsigned int page_num_node[MAX_NUMNODES];
-    const struct vnuma_info *vnuma;
-
-    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
-           now);
-
-    for_each_online_node ( i )
-    {
-        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
-
-        printk("NODE%u start->%lu size->%lu free->%lu\n",
-               i, node_start_pfn(i), node_spanned_pages(i),
-               avail_node_heap_pages(i));
-        /* sanity check phys_to_nid() */
-        if ( phys_to_nid(pa) != i )
-            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
-                   pa, phys_to_nid(pa), i);
-    }
-
-    j = cpumask_first(&cpu_online_map);
-    n = 0;
-    for_each_online_cpu ( i )
-    {
-        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
-        {
-            if ( n > 1 )
-                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-            else
-                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-            j = i;
-            n = 1;
-        }
-        else
-            ++n;
-    }
-    if ( n > 1 )
-        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-    else
-        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-
-    rcu_read_lock(&domlist_read_lock);
-
-    printk("Memory location of each domain:\n");
-    for_each_domain ( d )
-    {
-        process_pending_softirqs();
-
-        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
-
-        for_each_online_node ( i )
-            page_num_node[i] = 0;
-
-        spin_lock(&d->page_alloc_lock);
-        page_list_for_each(page, &d->page_list)
-        {
-            i = phys_to_nid(page_to_maddr(page));
-            page_num_node[i]++;
-        }
-        spin_unlock(&d->page_alloc_lock);
-
-        for_each_online_node ( i )
-            printk("    Node %u: %u\n", i, page_num_node[i]);
-
-        if ( !read_trylock(&d->vnuma_rwlock) )
-            continue;
-
-        if ( !d->vnuma )
-        {
-            read_unlock(&d->vnuma_rwlock);
-            continue;
-        }
-
-        vnuma = d->vnuma;
-        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
-               vnuma->nr_vnodes, d->max_vcpus);
-        for ( i = 0; i < vnuma->nr_vnodes; i++ )
-        {
-            unsigned int start_cpu = ~0U;
-
-            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
-                printk("       %3u: pnode ???,", i);
-            else
-                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
-
-            printk(" vcpus ");
-
-            for ( j = 0; j < d->max_vcpus; j++ )
-            {
-                if ( !(j & 0x3f) )
-                    process_pending_softirqs();
-
-                if ( vnuma->vcpu_to_vnode[j] == i )
-                {
-                    if ( start_cpu == ~0U )
-                    {
-                        printk("%d", j);
-                        start_cpu = j;
-                    }
-                }
-                else if ( start_cpu != ~0U )
-                {
-                    if ( j - 1 != start_cpu )
-                        printk("-%d ", j - 1);
-                    else
-                        printk(" ");
-                    start_cpu = ~0U;
-                }
-            }
-
-            if ( start_cpu != ~0U  && start_cpu != j - 1 )
-                printk("-%d", j - 1);
-
-            printk("\n");
-
-            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
-            {
-                if ( vnuma->vmemrange[j].nid == i )
-                    printk("           %016"PRIx64" - %016"PRIx64"\n",
-                           vnuma->vmemrange[j].start,
-                           vnuma->vmemrange[j].end);
-            }
-        }
-
-        read_unlock(&d->vnuma_rwlock);
-    }
-
-    rcu_read_unlock(&domlist_read_lock);
-}
-
-static int __init cf_check register_numa_trigger(void)
-{
-    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
-    return 0;
-}
-__initcall(register_numa_trigger);
-
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b46fd9ab18..9df08e9366 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1350,7 +1350,7 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm)
 
     x86_acpiid_to_apicid[acpi_id] = apic_id;
 
-    if ( !srat_disabled() )
+    if ( !numa_disabled() )
     {
         nodeid_t node = setup_node(pxm);
 
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index b62a152911..0d4f7cccb9 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -238,7 +238,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	unsigned pxm;
 	nodeid_t node;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (pa->header.length < sizeof(struct acpi_srat_x2apic_cpu_affinity)) {
 		bad_srat();
@@ -274,7 +274,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	unsigned pxm;
 	nodeid_t node;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (pa->header.length != sizeof(struct acpi_srat_cpu_affinity)) {
 		bad_srat();
@@ -313,7 +313,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 	nodeid_t node;
 	unsigned int i;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
 		bad_srat();
@@ -519,8 +519,8 @@ void __init srat_parse_regions(paddr_t addr)
 	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
-/* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(paddr_t start, paddr_t end)
+/* Use discovered information to actually set up the nodes. */
+int __init numa_process_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 3baf83d527..9a3a12b12d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
 obj-y += notifier.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-y += page_alloc.o
 obj-$(CONFIG_HAS_PDX) += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
diff --git a/xen/common/numa.c b/xen/common/numa.c
new file mode 100644
index 0000000000..83f4c8cc94
--- /dev/null
+++ b/xen/common/numa.c
@@ -0,0 +1,460 @@
+/*
+ * Generic VM initialization for NUMA setups.
+ * Copyright 2002,2003 Andi Kleen, SuSE Labs.
+ * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
+ */
+
+#include <xen/init.h>
+#include <xen/keyhandler.h>
+#include <xen/mm.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/softirq.h>
+
+struct node_data __ro_after_init node_data[MAX_NUMNODES];
+
+/* Mapping from pdx to node id */
+unsigned int __ro_after_init memnode_shift;
+unsigned long __ro_after_init memnodemapsize;
+nodeid_t *__ro_after_init memnodemap;
+static typeof(*memnodemap) __ro_after_init _memnodemap[64];
+
+nodeid_t __read_mostly cpu_to_node[NR_CPUS] = {
+    [0 ... NR_CPUS-1] = NUMA_NO_NODE
+};
+
+cpumask_t __read_mostly node_to_cpumask[MAX_NUMNODES];
+
+nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+
+bool __ro_after_init numa_off;
+
+bool numa_disabled(void)
+{
+    return numa_off || arch_numa_broken();
+}
+
+/*
+ * Given a shift value, try to populate memnodemap[]
+ * Returns :
+ * 1 if OK
+ * 0 if memnodmap[] too small (of shift too small)
+ * -1 if node overlap or lost ram (shift too big)
+ */
+static int __init populate_memnodemap(const struct node *nodes,
+                                      unsigned int numnodes, unsigned int shift,
+                                      const nodeid_t *nodeids)
+{
+    unsigned long spdx, epdx;
+    unsigned int i;
+    int res = -1;
+
+    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
+
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+
+        if ( spdx >= epdx )
+            continue;
+
+        if ( (epdx >> shift) >= memnodemapsize )
+            return 0;
+
+        do {
+            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
+                return -1;
+
+            if ( !nodeids )
+                memnodemap[spdx >> shift] = i;
+            else
+                memnodemap[spdx >> shift] = nodeids[i];
+
+            spdx += (1UL << shift);
+        } while ( spdx < epdx );
+
+        res = 1;
+    }
+
+    return res;
+}
+
+static int __init allocate_cachealigned_memnodemap(void)
+{
+    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
+    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
+
+    memnodemap = mfn_to_virt(mfn);
+    mfn <<= PAGE_SHIFT;
+    size <<= PAGE_SHIFT;
+    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
+           mfn, mfn + size);
+    memnodemapsize = size / sizeof(*memnodemap);
+
+    return 0;
+}
+
+/*
+ * The LSB of all start and end addresses in the node map is the value of the
+ * maximum possible shift.
+ */
+static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
+                                                  nodeid_t numnodes)
+{
+    unsigned int i, nodes_used = 0;
+    unsigned long spdx, epdx;
+    unsigned long bitfield = 0, memtop = 0;
+
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+
+        if ( spdx >= epdx )
+            continue;
+
+        bitfield |= spdx;
+        nodes_used++;
+        if ( epdx > memtop )
+            memtop = epdx;
+    }
+
+    if ( nodes_used <= 1 )
+        i = BITS_PER_LONG - 1;
+    else
+        i = find_first_bit(&bitfield, sizeof(unsigned long) * 8);
+
+    memnodemapsize = (memtop >> i) + 1;
+
+    return i;
+}
+
+int __init compute_hash_shift(const struct node *nodes,
+                              unsigned int numnodes, const nodeid_t *nodeids)
+{
+    unsigned int shift = extract_lsb_from_nodes(nodes, numnodes);
+
+    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
+        memnodemap = _memnodemap;
+    else if ( allocate_cachealigned_memnodemap() )
+        return -1;
+
+    printk(KERN_DEBUG "NUMA: Using %u for the hash shift\n", shift);
+
+    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
+    {
+        printk(KERN_INFO "Your memory is not aligned you need to "
+               "rebuild your hypervisor with a bigger NODEMAPSIZE "
+               "shift=%u\n", shift);
+        return -1;
+    }
+
+    return shift;
+}
+
+/* Initialize NODE_DATA given nodeid and start/end */
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
+    unsigned long start_pfn = paddr_to_pfn(start);
+    unsigned long end_pfn = paddr_to_pfn(end);
+
+    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
+    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
+
+    node_set_online(nodeid);
+}
+
+void __init numa_init_array(void)
+{
+    unsigned int i;
+    nodeid_t rr;
+
+    /*
+     * There are unfortunately some poorly designed mainboards
+     * around that only connect memory to a single CPU. This
+     * breaks the 1:1 cpu->node mapping. To avoid this fill in
+     * the mapping for all possible CPUs, as the number of CPUs
+     * is not known yet. We round robin the existing nodes.
+     */
+    rr = first_node(node_online_map);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] != NUMA_NO_NODE )
+            continue;
+        numa_set_node(i, rr);
+        rr = cycle_node(rr, node_online_map);
+    }
+}
+
+#ifdef CONFIG_NUMA_EMU
+static unsigned int __initdata numa_fake;
+
+/* Numa emulation */
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
+{
+    int ret;
+    unsigned int i;
+    struct node nodes[MAX_NUMNODES];
+    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
+
+    /* Kludge needed for the hash function */
+    if ( hweight64(sz) > 1 )
+    {
+        uint64_t x = 1;
+
+        while ( (x << 1) < sz )
+            x <<= 1;
+        if ( x < sz / 2 )
+            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
+        sz = x;
+    }
+
+    memset(&nodes, 0, sizeof(nodes));
+    for ( i = 0; i < numa_fake; i++ )
+    {
+        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
+
+        if ( i == numa_fake - 1 )
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
+
+        nodes[i].end = nodes[i].start + sz;
+        printk(KERN_INFO "Faking node %u at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
+               i, nodes[i].start, nodes[i].end,
+               (nodes[i].end - nodes[i].start) >> 20);
+        node_set_online(i);
+    }
+
+    ret = compute_hash_shift(nodes, numa_fake, NULL);
+    if ( ret < 0 )
+    {
+        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
+        return -1;
+    }
+    memnode_shift = ret;
+
+    for_each_online_node ( i )
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+
+    numa_init_array();
+
+    return 0;
+}
+#endif
+
+void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
+{
+    unsigned int i;
+    paddr_t start = pfn_to_paddr(start_pfn);
+    paddr_t end = pfn_to_paddr(end_pfn);
+
+#ifdef CONFIG_NUMA_EMU
+    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
+        return;
+#endif
+
+#ifdef CONFIG_NUMA
+    if ( !numa_off && !numa_process_nodes(start, end) )
+        return;
+#endif
+
+    printk(KERN_INFO "%s\n",
+           numa_off ? "NUMA turned off" : "No NUMA configuration found");
+
+    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
+           start, end);
+
+    /* Setup dummy node covering all memory */
+    memnode_shift = BITS_PER_LONG - 1;
+    memnodemap = _memnodemap;
+
+    /* Dummy node only uses 1 slot in reality */
+    memnodemap[0] = 0;
+    memnodemapsize = 1;
+
+    nodes_clear(node_online_map);
+    node_set_online(0);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+        numa_set_node(i, 0);
+
+    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
+    setup_node_bootmem(0, start, end);
+}
+
+void numa_add_cpu(unsigned int cpu)
+{
+    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+void numa_set_node(unsigned int cpu, nodeid_t node)
+{
+    cpu_to_node[cpu] = node;
+}
+
+/* [numa=off] */
+static int __init cf_check numa_setup(const char *opt)
+{
+    if ( !strncmp(opt, "off", 3) )
+        numa_off = true;
+    else if ( !strncmp(opt, "on", 2) )
+        numa_off = false;
+#ifdef CONFIG_NUMA_EMU
+    else if ( !strncmp(opt, "fake=", 5) )
+    {
+        numa_off = false;
+        numa_fake = simple_strtoul(opt + 5, NULL, 0);
+        if ( numa_fake >= MAX_NUMNODES )
+            numa_fake = MAX_NUMNODES;
+    }
+#endif
+    else
+        return arch_numa_setup(opt);
+
+    return 0;
+}
+custom_param("numa", numa_setup);
+
+static void cf_check dump_numa(unsigned char key)
+{
+    s_time_t now = NOW();
+    unsigned int i, j, n;
+    struct domain *d;
+    const struct page_info *page;
+    unsigned int page_num_node[MAX_NUMNODES];
+    const struct vnuma_info *vnuma;
+
+    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
+           now);
+
+    for_each_online_node ( i )
+    {
+        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
+
+        printk("NODE%u start->%lu size->%lu free->%lu\n",
+               i, node_start_pfn(i), node_spanned_pages(i),
+               avail_node_heap_pages(i));
+        /* Sanity check phys_to_nid() */
+        if ( phys_to_nid(pa) != i )
+            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
+                   pa, phys_to_nid(pa), i);
+    }
+
+    j = cpumask_first(&cpu_online_map);
+    n = 0;
+    for_each_online_cpu ( i )
+    {
+        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
+        {
+            if ( n > 1 )
+                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+            else
+                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+            j = i;
+            n = 1;
+        }
+        else
+            ++n;
+    }
+    if ( n > 1 )
+        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+    else
+        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    printk("Memory location of each domain:\n");
+    for_each_domain ( d )
+    {
+        process_pending_softirqs();
+
+        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
+
+        for_each_online_node ( i )
+            page_num_node[i] = 0;
+
+        spin_lock(&d->page_alloc_lock);
+        page_list_for_each ( page, &d->page_list )
+        {
+            i = phys_to_nid(page_to_maddr(page));
+            page_num_node[i]++;
+        }
+        spin_unlock(&d->page_alloc_lock);
+
+        for_each_online_node ( i )
+            printk("    Node %u: %u\n", i, page_num_node[i]);
+
+        if ( !read_trylock(&d->vnuma_rwlock) )
+            continue;
+
+        if ( !d->vnuma )
+        {
+            read_unlock(&d->vnuma_rwlock);
+            continue;
+        }
+
+        vnuma = d->vnuma;
+        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
+               vnuma->nr_vnodes, d->max_vcpus);
+        for ( i = 0; i < vnuma->nr_vnodes; i++ )
+        {
+            unsigned int start_cpu = ~0U;
+
+            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
+                printk("       %3u: pnode ???,", i);
+            else
+                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
+
+            printk(" vcpus ");
+
+            for ( j = 0; j < d->max_vcpus; j++ )
+            {
+                if ( !(j & 0x3f) )
+                    process_pending_softirqs();
+
+                if ( vnuma->vcpu_to_vnode[j] == i )
+                {
+                    if ( start_cpu == ~0U )
+                    {
+                        printk("%d", j);
+                        start_cpu = j;
+                    }
+                }
+                else if ( start_cpu != ~0U )
+                {
+                    if ( j - 1 != start_cpu )
+                        printk("-%d ", j - 1);
+                    else
+                        printk(" ");
+                    start_cpu = ~0U;
+                }
+            }
+
+            if ( start_cpu != ~0U  && start_cpu != j - 1 )
+                printk("-%d", j - 1);
+
+            printk("\n");
+
+            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
+            {
+                if ( vnuma->vmemrange[j].nid == i )
+                    printk("           %016"PRIx64" - %016"PRIx64"\n",
+                           vnuma->vmemrange[j].start,
+                           vnuma->vmemrange[j].end);
+            }
+        }
+
+        read_unlock(&d->vnuma_rwlock);
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
+static int __init cf_check register_numa_trigger(void)
+{
+    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
+    return 0;
+}
+__initcall(register_numa_trigger);
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 7aef1a88dc..d799078a7a 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -18,4 +18,71 @@
   (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
    ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
 
+/* The following content can be used when NUMA feature is enabled */
+#ifdef CONFIG_NUMA
+
+extern nodeid_t      cpu_to_node[NR_CPUS];
+extern cpumask_t     node_to_cpumask[];
+
+#define cpu_to_node(cpu)        cpu_to_node[cpu]
+#define parent_node(node)       (node)
+#define node_to_first_cpu(node) __ffs(node_to_cpumask[node])
+#define node_to_cpumask(node)   node_to_cpumask[node]
+
+struct node {
+    paddr_t start, end;
+};
+
+extern int compute_hash_shift(const struct node *nodes,
+                              unsigned int numnodes, const nodeid_t *nodeids);
+
+#define VIRTUAL_BUG_ON(x)
+
+extern bool numa_off;
+
+extern void numa_add_cpu(unsigned int cpu);
+extern void numa_init_array(void);
+extern void numa_set_node(unsigned int cpu, nodeid_t node);
+extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
+extern int numa_process_nodes(paddr_t start, paddr_t end);
+
+extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_broken(void);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
+
+static inline void clear_node_cpumask(unsigned int cpu)
+{
+    cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+/* Simple perfect hash to map pdx to node numbers */
+extern unsigned int memnode_shift;
+extern unsigned long memnodemapsize;
+extern uint8_t *memnodemap;
+
+struct node_data {
+    unsigned long node_start_pfn;
+    unsigned long node_spanned_pages;
+};
+
+extern struct node_data node_data[];
+
+static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
+{
+    nodeid_t nid;
+    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
+    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    return nid;
+}
+
+#define NODE_DATA(nid)          (&node_data[nid])
+
+#define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
+#define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
+#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
+                                 NODE_DATA(nid)->node_spanned_pages)
+
+#endif
+
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


