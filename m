Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3695528130A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 14:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2064.6189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOKQN-0004ui-Oe; Fri, 02 Oct 2020 12:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2064.6189; Fri, 02 Oct 2020 12:44:35 +0000
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
	id 1kOKQN-0004uL-Km; Fri, 02 Oct 2020 12:44:35 +0000
Received: by outflank-mailman (input) for mailman id 2064;
 Fri, 02 Oct 2020 12:44:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kOKQM-0004uG-3W
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:44:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.46]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fc1012e-f81c-458d-b320-73a8a7108e08;
 Fri, 02 Oct 2020 12:44:32 +0000 (UTC)
Received: from DB6PR1001CA0033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::19)
 by AM0PR08MB3555.eurprd08.prod.outlook.com (2603:10a6:208:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Fri, 2 Oct
 2020 12:44:26 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::23) by DB6PR1001CA0033.outlook.office365.com
 (2603:10a6:4:55::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Fri, 2 Oct 2020 12:44:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 12:44:26 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Fri, 02 Oct 2020 12:44:26 +0000
Received: from 490aa17f3f22.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77B0C950-E3B8-49DF-9A41-A2A999E50C8C.1; 
 Fri, 02 Oct 2020 12:44:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 490aa17f3f22.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Oct 2020 12:44:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5686.eurprd08.prod.outlook.com (2603:10a6:10:1a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 12:44:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 12:44:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kOKQM-0004uG-3W
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:44:34 +0000
X-Inumbo-ID: 9fc1012e-f81c-458d-b320-73a8a7108e08
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [40.107.6.46])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9fc1012e-f81c-458d-b320-73a8a7108e08;
	Fri, 02 Oct 2020 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpxC1hAnH3eF30dURg+E+4988ogzfy2wrQ97gpqhEH8=;
 b=zhKQb2bxNEUOiKSxK/5T0RiGXgTPTCkkEnEY5jwVGBFCgcvOYOBQSV+dckTGSQ+QJvqO8ZZACEZYv77QqyzN8zj1+6L8tI/5ErorV4Ps4xDwvBAKZFuWBslPcV0+cF7PnNjT1sFOVpxNot1IH9QVmGB14Ilai6gqklqTdCB1nzY=
Received: from DB6PR1001CA0033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::19)
 by AM0PR08MB3555.eurprd08.prod.outlook.com (2603:10a6:208:da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Fri, 2 Oct
 2020 12:44:26 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::23) by DB6PR1001CA0033.outlook.office365.com
 (2603:10a6:4:55::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Fri, 2 Oct 2020 12:44:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 12:44:26 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Fri, 02 Oct 2020 12:44:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1037fa3d5acd32ea
X-CR-MTA-TID: 64aa7808
Received: from 490aa17f3f22.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 77B0C950-E3B8-49DF-9A41-A2A999E50C8C.1;
	Fri, 02 Oct 2020 12:44:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 490aa17f3f22.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 12:44:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NltaIem2qVqcU+fRuF9rAjaTz/A8QZay6aq5PClzRkpGNyVrs0UucAAVJ1Ctd00tdQ5JSoZi2IXb6cSNUHTpvskDZisXA9FeLMrFiEdtWTItRHGdxfyc/G+4HhwCeSflIzHdKFnoxgiRWC25RDLVXij5CDh3zZxFtjB9ee+iONvGccbTcaOsXtU3MAEu1GzFKXXCvRNUKI4Vv7cxLm3B9JeJGSTKQk8yuVDtUc2g6KfXbqId0W5Knaxck3nyxc4/hXWsWyti2wx7uhQuyo4Lge4yriq/PbWS7u12S1IJd2xskE7tlS2I4Gg2luEiCmMVAj4K9bg2oDDg9EbjVHjq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpxC1hAnH3eF30dURg+E+4988ogzfy2wrQ97gpqhEH8=;
 b=IdSSY+hUipx5eNTIJW1FDbIeApNXGcF+ju7nopupe7W+Jb0yCQ9g+4O/to4SR0gs0KJSif1FQpA9Mmr8xk37G2MJXqaK9HF2knQvc+LO0zOAxVn/5KRbAa2qEjYVgopQYVI0q8RJS0CNtqmvKc+6Y3n1r2qsp2qRkRhu559EvOlR0A9krdg/gt1U3xSH7+FRWQoJJziWu9F302w5QMkQdPypCNleN2jJmITH9sXyrUTX/52azaRnqhNS6/NMGopNM+UAH8HfgstEZNQRt+1s2LkHh4kRVbojQjrZ61qrXwnoClAn+U1znce+jDJujRk6LcniVLATEeAPy5eQb+4k1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpxC1hAnH3eF30dURg+E+4988ogzfy2wrQ97gpqhEH8=;
 b=zhKQb2bxNEUOiKSxK/5T0RiGXgTPTCkkEnEY5jwVGBFCgcvOYOBQSV+dckTGSQ+QJvqO8ZZACEZYv77QqyzN8zj1+6L8tI/5ErorV4Ps4xDwvBAKZFuWBslPcV0+cF7PnNjT1sFOVpxNot1IH9QVmGB14Ilai6gqklqTdCB1nzY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5686.eurprd08.prod.outlook.com (2603:10a6:10:1a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 12:44:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 12:44:07 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] build: always use BASEDIR for xen sub-directory
Thread-Topic: [PATCH] build: always use BASEDIR for xen sub-directory
Thread-Index: AQHWmKjTj7VmlPYcLkSjqrrhNFG5S6mEOTwAgAAGTYCAAAEPgIAAAYQA
Date: Fri, 2 Oct 2020 12:44:07 +0000
Message-ID: <547D8B47-C521-4F43-976F-D1723470AD3C@arm.com>
References:
 <556f6327acea2d0343c93da28f1fc17591afd402.1601564274.git.bertrand.marquis@arm.com>
 <706afc44-a414-33ff-da94-b92f7a96f1fc@suse.com>
 <31FC9BB1-F4C4-4203-94C1-1134607E49C2@arm.com>
 <e5da46d7-07ee-84b8-fbd8-e2c246c014de@suse.com>
In-Reply-To: <e5da46d7-07ee-84b8-fbd8-e2c246c014de@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9c53bfb8-051e-416e-fed0-08d866d0e5b8
x-ms-traffictypediagnostic: DBAPR08MB5686:|AM0PR08MB3555:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3555551C8648BA6FCA13FD039D310@AM0PR08MB3555.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2657;OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w8x5BB6CYLRV2E/2Ovind4uNA+o/6Pm3bw9LFBJrOFk1CGni4d2kTcoBs+JAj1PrQqUL9wg2OtOTR3IXjXwdEM1Smtgf/YGXY0oY4ajxBMBBKg48mXbllZBr7Q08Y/rEk5z82pGorEzTHTwu2StfVeNbL+S3xS1p35x+NtCnXZqTxN94U0cYKBWmBuI0VwsdnJBg7pc7QOQu00k9um8G27/VJVSO0ziHZfOWjEUBdaATC7XclzeV7OeeR8pgU1qO87333NKkirx89CscVHZVFHx5crRMIoCrT5BEXoYHn/GornMmxayBi2iAMs2NdmgJ1fSJH+d6I/eOqLCEueOmQA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(376002)(136003)(366004)(8676002)(86362001)(91956017)(186003)(6916009)(316002)(478600001)(66446008)(76116006)(64756008)(5660300002)(66476007)(53546011)(66946007)(71200400001)(6506007)(33656002)(26005)(36756003)(66556008)(8936002)(4326008)(6512007)(2906002)(6486002)(83380400001)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 95RMjbv6O18+yuBOncLkLa7O+seDkBM2WHY6JsEKFb6CgmV2Wy7Gktm3iyXIPtqR51rfA+rr4J2y7BNcdBnRc16gqBWUKPCEMrYpFeWEzF7i7YEp3lEgC9SOV3eWwPl5MMZdFSZfU2dXAhg2ndxkAVQijX8nCu379rHFCKvFpAowhkz6fJUaofS4k32ISfwqsls+3aSCs5xdt1um+9Mqxb7cENBoVUCuhI4e6M7M1e1PGUEoA9tL50Fg1QVCPf/pV9octDNYXCWFKYsESgJ4rEUmJqqUh1qAf2lmtXKQl8UF13mUTXBMb1afD9jmjlZltw7bmpk0fWqIyirtoUubx8Uv2rRWGc52HLN6hOnbk14NOW6JdHE0KjN3i3/mQHoPiDKUkkBJxXWslD331Ad2kkcImDn1A3lAzy+TSY2ClGIy4a1ZyL1woQvcy/GIoLmWwwVSvaHrPobVpAZ1+k5l8FDPowiPWPywMmsh2C7KHyHxnyTV3vARKmEpJU2vvFYWBPF+24/GV2a6fCzsmQ/gCETNL3PXcqWxDkw1omgrHkbyeEf/P6jtklhQPlhrHn0q1OaUNEe8STAk+pbzhb4dIICfXd+BrX/gRqDwgp67JiBijUe3j8fgOVJu09R/tA2XVF5zeMaSUqCArlr7EMZAOg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FD8C7DF6B794D4EBBD8ACF4FE39FD04@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5686
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	535ec197-2f4b-4c38-ddb0-08d866d0da20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y4hJvNPfuW+NVUwhwzEr0Dq/IJWhCfNf7HWNSIrEwy3Dgx1Zp7Ur7LKMQHHLLllGy/P4/Gt4+KrYZ6X1hAyJoqJSNwSCTcjE8XeWYLJh/3l3sv/dUPZoOUnirLaFxtJ4ZFV84NSZUMOTQWArz7koWPbEZL7Fw9RCVCTW/wDB0p1jsXk3KfYwAIvLhyQRb3yc0m33HaKt8soLSM3Aw8I1q6BSjkjMRtqCNpdG/lOG4XTnCCWBaaxkhm2V8pWqRxEirIwdrCg4zsEmqa61lEEzV6fbLvt6B1h+ykcsy/RNELhSLLYEjSbE1nuKUl2Dbi4Cbc0p8SwJ+YDwTby55MKYxKfE9qg3VJIlgH98LGIPsja4aVkdd02yX5R4OF5sLInXmP6I8HRS6DqNIf58oUDFsw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(136003)(46966005)(356005)(316002)(86362001)(47076004)(83380400001)(336012)(26005)(82310400003)(82740400003)(478600001)(33656002)(81166007)(70206006)(6506007)(4326008)(6486002)(8936002)(2906002)(70586007)(6862004)(6512007)(5660300002)(8676002)(36756003)(53546011)(186003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 12:44:26.6192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c53bfb8-051e-416e-fed0-08d866d0e5b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3555

DQoNCj4gT24gMiBPY3QgMjAyMCwgYXQgMTM6MzgsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMi4xMC4yMDIwIDE0OjM0LCBCZXJ0cmFuZCBNYXJxdWlz
IHdyb3RlOg0KPj4+IE9uIDIgT2N0IDIwMjAsIGF0IDEzOjEyLCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDAyLjEwLjIwMjAgMTI6NDIsIEJlcnRy
YW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+IE1vZGlmeSBNYWtlZmlsZXMgdXNpbmcgJChYRU5fUk9P
VCkveGVuIHRvIHVzZSAkKEJBU0VESVIpIGluc3RlYWQuDQo+Pj4+IA0KPj4+PiBUaGlzIGlzIHJl
bW92aW5nIHRoZSBkZXBlbmRlbmN5IHRvIHhlbiBzdWJkaXJlY3RvcnkgcHJldmVudGluZyB1c2lu
ZyBhDQo+Pj4+IHdyb25nIGNvbmZpZ3VyYXRpb24gZmlsZSB3aGVuIHhlbiBzdWJkaXJlY3Rvcnkg
aXMgZHVwbGljYXRlZCBmb3INCj4+Pj4gY29tcGlsYXRpb24gdGVzdHMuDQo+Pj4+IA0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+
DQo+Pj4gDQo+Pj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+
IA0KPj4gVGhhbmtzIDotKQ0KPj4gDQo+Pj4gDQo+Pj4gKGJ1dCBtb3JlIGZvciB0aGUgc2xpZ2h0
IHRpZHlpbmcgdGhhbiB0aGUgcHVycG9zZSB5b3UgbmFtZSkNCj4+IA0KPj4gRmVlbCBmcmVlIHRv
IHJlbW92ZSB0aGUganVzdGlmaWNhdGlvbiBmcm9tIHRoZSBjb21taXQgbWVzc2FnZSBpZg0KPj4g
eW91IHRoaW5rIGl0IGlzIG5vdCB1c2VmdWxsLg0KPiANCj4gT2gsIG5vLCBpdCdzIG5vdCBsaWtl
IEkgY29uc2lkZXIgaXQgbm90IHVzZWZ1bC4gSXQgc2hvd3MgaG93IHlvdQ0KPiBhcnJpdmVkIGF0
IG1ha2luZyB0aGUgY2hhbmdlLiBJdCdzIGp1c3QgdGhhdCBJIGRpZG4ndCBjb25zaWRlcg0KPiBt
YWtpbmcgY29waWVzIG9mIHhlbi8gc29tZXRoaW5nIHdlIG1lYW4gdG8gYmUgc3VwcG9ydGVkLiBJ
IHdvdWxkbid0DQo+IGJlIHN1cnByaXNlZCBpZiBpdCBnb3QgYnJva2VuIGFnYWluIC4uLg0KDQpi
YXNpY2FsbHkgaSBkbyB0aGlzIGEg4oCcY3AgLXJz4oCdIG9mIHhlbiBzdWJkaXJlY3Rvcnkgc28g
dGhhdCBpIGNhbiBoYXZlIGRpcmVjdG9yaWVzDQppbiB3aGljaCB4ZW4gaXMgY29tcGlsZWQgZm9y
IHg4NiwgYXJtMzIgYW5kIGFybTY0IGFuZCByZWNvbXBpbGUgYWxsIG9mIHRoZW0NCnF1aWNrbHkg
d2l0aG91dCBoYXZpbmcgdG8gZ28gdGhyb3VnaCBkaXN0Y2xlYW4sIGNvbmZpZywgbWFrZSBlYWNo
IHRpbWUgb3IgbW9kaWZ5DQp0aGUgb3JpZ2luYWwgdHJlZS4NCg0KSWYgaXQgZ2V0cyBicm9rZW4g
aSB3aWxsIGZpeCBpdCA6LSkNCg0KSW4gdGhlIGxvbmcgdGVybSBpdCBpcyBhIHN0ZXAgdG93YXJk
IG91dCBvZiB0cmVlIGNvbXBpbGF0aW9uICh3aXRoIHNvbWUgb2YgdGhlDQpjaGFuZ2VzIGFscmVh
ZHkgc3RhcnRlZCBkZWFsaW5nIHdpdGggbGlua3MgYW5kIG90aGVyIHN0dWZmKS4NCg0KQmVydHJh
bmQNCg0K

