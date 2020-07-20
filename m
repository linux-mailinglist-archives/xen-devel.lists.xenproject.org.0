Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B72F225D7E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 13:32:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxU1r-00087A-GS; Mon, 20 Jul 2020 11:32:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfNH=A7=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1jxU1p-000875-Kx
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 11:32:17 +0000
X-Inumbo-ID: a8d8e66f-ca7c-11ea-9f89-12813bfff9fa
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8d8e66f-ca7c-11ea-9f89-12813bfff9fa;
 Mon, 20 Jul 2020 11:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtK0mFLmn1WxwOxjjXutOXLAiAPq+X+utAToKjDl/eY=;
 b=k24rIdUTc7YmcsPY7KqmDDM/ewXK9i9bHD18yL3Z2Bhyga8INi23W9ROZbPz8HolqbK1Joz5vgYir+3Jt+3s5a1nxuqYF5sMBK2kHwzi5wlnF7wUF47ebd3ia2cNnYErx8h3ZPx8JhsbI9/2uTiXbLQZHJ/4/swqEldUqM4vyus=
Received: from DB6PR0801CA0048.eurprd08.prod.outlook.com (2603:10a6:4:2b::16)
 by VI1PR08MB4046.eurprd08.prod.outlook.com (2603:10a6:803:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Mon, 20 Jul
 2020 11:32:12 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::30) by DB6PR0801CA0048.outlook.office365.com
 (2603:10a6:4:2b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Mon, 20 Jul 2020 11:32:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Mon, 20 Jul 2020 11:32:12 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62");
 Mon, 20 Jul 2020 11:32:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 011a4ef4075f4727
X-CR-MTA-TID: 64aa7808
Received: from 7069426d3480.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 073052BB-6CCA-4126-8E75-6F4E0B1B887A.1; 
 Mon, 20 Jul 2020 11:32:07 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7069426d3480.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Jul 2020 11:32:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbOb7/vj4e941f2Nmt4U5g2hDae9v596cJwuWvQUeRHaGLx5APFrIkAYRzMrsT15W/Ozw3todP+puKsSwyQ5P3Vo8uMpWUTnCZZCxdbFNuTCnQtEzgUeJzAH/vwAYy4jCqyEV1yJ0pa3brmTRTNo0vZQzTCiwivXZ8odzBL7PBmT14Q9jfXyo6sR06UL3m4vnFJa5Lrf+zzJzMGIXymTDtnt2qdUfVi6o/xkxUtx2WViDcEeOT7/1fpY6TyeLaJIp/eEssJf8AajWB6gAPRwszYAEm5+a9bJ6QMtGXLBeaW0Qh9qQXfN8HeS3ROim961rA9Fe6Rqnw3fqGikG0MXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtK0mFLmn1WxwOxjjXutOXLAiAPq+X+utAToKjDl/eY=;
 b=Svww4EFHV/VVLmcBAp9dYuvqDgv9S6jXMYYkvQ7Tg7f8qneob5+KjlgwnMhIltbslk2b4WZJv83Eq/+KcwlhelIjFMT3GLECt67SCEolu4LwzNH3EfWwsMasGdJ8GFKzA64cuWgVcZeXGrTWM9+ytYAdAY/D4myIQzQui2AbCZRvUaly8AlWcd2IZQ+rC2K8hd+YznrJ8rVZ662XfF1mT5ov9vPLmPPS6GHglOkZ84MiZvWY+mG+UFePiNC8z/cSRygiT5LwZCUp2Vmw4DqpyZ8Z9Dk90zWsoLStLEqYNnCUYwkTUQEcHvU44uJYha1VgnJdLZCbwB5AjU3ZbCpwpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtK0mFLmn1WxwOxjjXutOXLAiAPq+X+utAToKjDl/eY=;
 b=k24rIdUTc7YmcsPY7KqmDDM/ewXK9i9bHD18yL3Z2Bhyga8INi23W9ROZbPz8HolqbK1Joz5vgYir+3Jt+3s5a1nxuqYF5sMBK2kHwzi5wlnF7wUF47ebd3ia2cNnYErx8h3ZPx8JhsbI9/2uTiXbLQZHJ/4/swqEldUqM4vyus=
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 by AM6PR08MB4086.eurprd08.prod.outlook.com (2603:10a6:20b:a8::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Mon, 20 Jul
 2020 11:32:05 +0000
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5]) by AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5%6]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 11:32:05 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: PCI devices passthrough on Arm design proposal
Thread-Topic: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAFEeACAAAehAIAAD+CAgAAK1YCAAAXWgIAABSYAgAEq6wCAABX4AIADKZ4A
Date: Mon, 20 Jul 2020 11:32:05 +0000
Message-ID: <D89E89FD-D7E4-4C1D-B3B9-21CA981881E5@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
 <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
 <865D5A77-85D4-4A88-A228-DDB70BDB3691@arm.com>
 <972c0c81-6595-7c41-baa5-8882f5d1c0ff@xen.org>
 <4E6B793C-2E0A-4999-9842-24CDCDE43903@arm.com>
 <20200717160550.GZ7191@Air-de-Roger>
 <C86FE34B-4587-4895-8001-D8CD3F9D44F0@arm.com>
 <f6a0da85-6d44-b0fa-abe6-6839d88c3578@xen.org>
In-Reply-To: <f6a0da85-6d44-b0fa-abe6-6839d88c3578@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fb426184-c19e-4223-13c5-08d82ca08bf2
x-ms-traffictypediagnostic: AM6PR08MB4086:|VI1PR08MB4046:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB40466B3CCD7B4B2DFC6348D6FC7B0@VI1PR08MB4046.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1N/+NIcHOuegqJJ+rhJIeowFCUK0wfa2RvD/GTdw1KIKkva6tpHop8kEFHg18HYjYuBP/PpjyjsQNjCN3RPo9aLwBCLuYIIc1gY4Z517FxHcdSVG8BKDoDAdygoSMLSf+j5oGHxY9ecO6uaXLM9ukLfoiVM1x7+asMFxW4xT3pDXzXIdoiEEslPP1fxuNhAOqar9eJguKhSL9qSNk0q/rKQ99bhezbqHw4M5Qnb518fL1vRpPRRGEbr7RHbOhJn5cymFsXNU4bmUk36HkjhPgmk63uwDFmC5QGRZmFGaaIMnOty65gBy4v9JsDbI3UZ/vIEdV2x1fC1XOc7iuUxBwg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(66446008)(66556008)(8936002)(66476007)(76116006)(64756008)(2906002)(5660300002)(33656002)(91956017)(4326008)(66946007)(186003)(316002)(6916009)(36756003)(71200400001)(26005)(2616005)(83380400001)(6506007)(53546011)(8676002)(54906003)(6512007)(6486002)(478600001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: NbXF0SlOvPTrn3nDOLuVvPnoBojC4/GzbGrFWzcmqM1ErCawfCnRleL5tHHQhvyIDayhQ36RbR/2PsaVMhBZkEoeUXA5/Z86FYQnawuNJfsHNdYQ2AKFy3t3J3q8ocDPoKs9rNIDSZPnz6y+e/xVKr4nrYj/gWkXXwDUIIDs9vVqwIEJ7wiVIwpeop19/Bzr7DCBZcsWSu+RwxOmPLhHEnC29M1DT01KoVys0qfX/MiVfJQBHynuSjRfixwq01Y6BL/ND1S4LsnYbssuqDjZqDzQKxOO3ou6DQBMuxLcOe1gkMXN5iFS5pXtFT7J1ENdmmYx8tqhLft3TtAbF/q3ySWCDu5kioFviFYR2iyyzeTol9siEAROlolOKMR8SXbjIqOgM7NxiSBLUVUcDIYn00M5PRzvNbeK5+A1QF65yYByRW8+lWaUwnjfHMODzARx9wUMiS1sHRmf19UNdws9IWX1IY6uHHygxI0DpJ1L5bbwC0VWJso8l+KnIHXmuXgX
Content-Type: text/plain; charset="utf-8"
Content-ID: <B29409658179B348ABC47F543F6A222F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4086
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(47076004)(70586007)(70206006)(6512007)(4326008)(356005)(83380400001)(8676002)(478600001)(33656002)(2616005)(5660300002)(81166007)(82310400002)(82740400003)(186003)(6506007)(6862004)(6486002)(36756003)(316002)(8936002)(26005)(336012)(53546011)(54906003)(107886003)(2906002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3c263cd5-6c9f-4153-0be3-08d82ca08781
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cw9pEVjf/jMZC7Ilz8w1ZcuhRi3X2pwkjDWhQxydnCL7tqI1YiBKTMrMsOh6g8rf3cE4i1jP25vif322YrC/0wbdMePi7ZI5tBZQ0vVKuAB3dzes+/JrwNNWfMcTluDYEpLRWBdFyXoupRRYxGG6l6GxdVzEcfJAa/X9KhIA6X6IrGLorru8IG9lhP3RYTkyx+ppGps52hpblEU6W6CsbPqoBD6ULWuD4xwwtfvCg65U+vCLfmZOwgHtHkEjwDI6KXgVOQN4mGmJxHk5WIblE0eDEz7QUI14Ro7ZlYNkdlo5iGXMaDnTBPPjOD4OVruPQNTYtPK8H0gMlEW3doc5Qf3nDSSYBa2MDMMajX3slgpdIQRMlEFUKoJlCOiiJbIPrQoV7dBgBk8v9OlLGDY4dA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 11:32:12.7142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb426184-c19e-4223-13c5-08d82ca08bf2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4046
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTggSnVsIDIwMjAsIGF0IDEyOjE0IHBtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTgvMDcvMjAyMCAxMDo1NSwgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4+PiBPbiAxNyBKdWwgMjAyMCwgYXQgMTg6MDUsIFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBGcmks
IEp1bCAxNywgMjAyMCBhdCAwMzo0NzoyNVBNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3Rl
Og0KPj4+Pj4gT24gMTcgSnVsIDIwMjAsIGF0IDE3OjI2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4+Pj4+IE9uIDE3LzA3LzIwMjAgMTU6NDcsIEJlcnRyYW5kIE1hcnF1
aXMgd3JvdGU6DQo+Pj4+Pj4+Pj4gKiBEb20wTGVzcyBpbXBsZW1lbnRhdGlvbiB3aWxsIHJlcXVp
cmUgdG8gaGF2ZSB0aGUgY2FwYWNpdHkgaW5zaWRlIFhlbiB0byBkaXNjb3ZlciB0aGUgUENJIGRl
dmljZXMgKHdpdGhvdXQgZGVwZW5kaW5nIG9uIERvbTAgdG8gZGVjbGFyZSB0aGVtIHRvIFhlbiku
DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gIyBFbmFibGUgdGhlIGV4aXN0aW5nIHg4NiB2aXJ0dWFs
IFBDSSBzdXBwb3J0IGZvciBBUk06DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gVGhlIGV4aXN0aW5n
IFZQQ0kgc3VwcG9ydCBhdmFpbGFibGUgZm9yIFg4NiBpcyBhZGFwdGVkIGZvciBBcm0uIFdoZW4g
dGhlIGRldmljZSBpcyBhZGRlZCB0byBYRU4gdmlhIHRoZSBoeXBlciBjYWxsIOKAnFBIWVNERVZP
UF9wY2lfZGV2aWNlX2FkZOKAnSwgVlBDSSBoYW5kbGVyIGZvciB0aGUgY29uZmlnIHNwYWNlIGFj
Y2VzcyBpcyBhZGRlZCB0byB0aGUgUENJIGRldmljZSB0byBlbXVsYXRlIHRoZSBQQ0kgZGV2aWNl
cy4NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBBIE1NSU8gdHJhcCBoYW5kbGVyIGZvciB0aGUgUENJ
IEVDQU0gc3BhY2UgaXMgcmVnaXN0ZXJlZCBpbiBYRU4gc28gdGhhdCB3aGVuIGd1ZXN0IGlzIHRy
eWluZyB0byBhY2Nlc3MgdGhlIFBDSSBjb25maWcgc3BhY2UsIFhFTiB3aWxsIHRyYXAgdGhlIGFj
Y2VzcyBhbmQgZW11bGF0ZSByZWFkL3dyaXRlIHVzaW5nIHRoZSBWUENJIGFuZCBub3QgdGhlIHJl
YWwgUENJIGhhcmR3YXJlLg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IExpbWl0YXRpb246DQo+Pj4+
Pj4+Pj4gKiBObyBoYW5kbGVyIGlzIHJlZ2lzdGVyIGZvciB0aGUgTVNJIGNvbmZpZ3VyYXRpb24u
DQo+Pj4+Pj4+Pj4gKiBPbmx5IGxlZ2FjeSBpbnRlcnJ1cHQgaXMgc3VwcG9ydGVkIGFuZCB0ZXN0
ZWQgYXMgb2Ygbm93LCBNU0kgaXMgbm90IGltcGxlbWVudGVkIGFuZCB0ZXN0ZWQuDQo+Pj4+Pj4+
PiBJSVJDLCBsZWdhY3kgaW50ZXJydXB0IG1heSBiZSBzaGFyZWQgYmV0d2VlbiB0d28gUENJIGRl
dmljZXMuIEhvdyBkbyB5b3UgcGxhbiB0byBoYW5kbGUgdGhpcyBvbiBBcm0/DQo+Pj4+Pj4gV2Ug
cGxhbiB0byBmaXggdGhpcyBieSBhZGRpbmcgcHJvcGVyIHN1cHBvcnQgZm9yIE1TSSBpbiB0aGUg
bG9uZyB0ZXJtLg0KPj4+Pj4+IEZvciB0aGUgdXNlIGNhc2Ugd2hlcmUgTVNJIGlzIG5vdCBzdXBw
b3J0ZWQgb3Igbm90IHdhbnRlZCB3ZSBtaWdodCBoYXZlIHRvIGZpbmQgYSB3YXkgdG8gZm9yd2Fy
ZCB0aGUgaGFyZHdhcmUgaW50ZXJydXB0IHRvIHNldmVyYWwgZ3Vlc3RzIHRvIGVtdWxhdGUgc29t
ZSBraW5kIG9mIHNoYXJlZCBpbnRlcnJ1cHQuDQo+Pj4+PiANCj4+Pj4+IFNoYXJpbmcgaW50ZXJy
dXB0cyBhcmUgYSBiaXQgcGFpbiBiZWNhdXNlIHlvdSBjb3VsZG4ndCB0YWtlIGFkdmFudGFnZSBv
ZiB0aGUgZGlyZWN0IEVPSSBpbiBIVyBhbmQgaGF2ZSB0byBiZSBjYXJlZnVsIGlmIG9uZSBndWVz
dCBkb2Vzbid0IEVPSSBpbiB0aW1lbHkgbWFuZWVyLg0KPj4+Pj4gDQo+Pj4+PiBUaGlzIGlzIHNv
bWV0aGluZyBJIHdvdWxkIHJhdGhlciBhdm9pZCB1bmxlc3MgdGhlcmUgaXMgYSByZWFsIHVzZSBj
YXNlIGZvciBpdC4NCj4+Pj4gDQo+Pj4+IEkgd291bGQgZXhwZWN0IHRoYXQgbW9zdCByZWNlbnQg
aGFyZHdhcmUgd2lsbCBzdXBwb3J0IE1TSSBhbmQgdGhpcw0KPj4+PiB3aWxsIG5vdCBiZSBuZWVk
ZWQuDQo+Pj4gDQo+Pj4gV2VsbCwgUENJIEV4cHJlc3MgbWFuZGF0ZXMgTVNJIHN1cHBvcnQsIHNv
IHdoaWxlIHRoaXMgaXMganVzdCBhIHNwZWMsDQo+Pj4gSSB3b3VsZCBleHBlY3QgbW9zdCAoaWYg
bm90IGFsbCkgZGV2aWNlcyB0byBzdXBwb3J0IE1TSSAob3IgTVNJLVgpLCBhcw0KPj4+IEFybSBw
bGF0Zm9ybXMgaGF2ZW4ndCBpbXBsZW1lbnRlZCBsZWdhY3kgUENJIGFueXdheS4NCj4+IFllcyB0
aGF04oCZcyBvdXIgYXNzdW1wdGlvbiB0by4gQnV0IHdlIGhhdmUgdG8gc3RhcnQgc29tZXdoZXJl
IHNvIE1TSSBpcw0KPj4gcGxhbm5lZCBidXQgaW4gYSBmdXR1cmUgc3RlcC4gSSB3b3VsZCB0aGlu
ayB0aGF0IHN1cHBvcnRpbmcgbm9uIE1TSSBpZiBub3QNCj4+IGltcG9zc2libGUgd2lsbCBiZSBh
IGxvdCBtb3JlIGNvbXBsZXggZHVlIHRvIHRoZSBpbnRlcnJ1cHQgc2hhcmluZy4NCj4+IEkgZG8g
dGhpbmsgdGhhdCBub3Qgc3VwcG9ydGluZyBub24gTVNJIHNob3VsZCBiZSBvayBvbiBBcm0uDQo+
Pj4gDQo+Pj4+IFdoZW4gTVNJIGlzIG5vdCB1c2VkLCB0aGUgb25seSBzb2x1dGlvbiB3b3VsZCBi
ZSB0byBlbmZvcmNlIHRoYXQNCj4+Pj4gZGV2aWNlcyBhc3NpZ25lZCB0byBkaWZmZXJlbnQgZ3Vl
c3QgYXJlIHVzaW5nIGRpZmZlcmVudCBpbnRlcnJ1cHRzDQo+Pj4+IHdoaWNoIHdvdWxkIGxpbWl0
IHRoZSBudW1iZXIgb2YgZG9tYWlucyBiZWluZyBhYmxlIHRvIHVzZSBQQ0kNCj4+Pj4gZGV2aWNl
cyBvbiBhIGJ1cyB0byA0IChpZiB0aGUgZW51bWVyYXRpb24gY2FuIGJlIG1vZGlmaWVkIGNvcnJl
Y3RseQ0KPj4+PiB0byBhc3NpZ24gdGhlIGludGVycnVwdHMgcHJvcGVybHkpLg0KPj4+PiANCj4+
Pj4gSWYgd2UgYWxsIGFncmVlIHRoYXQgdGhpcyBpcyBhbiBhY2NlcHRhYmxlIGxpbWl0YXRpb24g
dGhlbiB3ZSB3b3VsZA0KPj4+PiBub3QgbmVlZCB0aGUg4oCcaW50ZXJydXB0IHNoYXJpbmfigJ0u
DQo+Pj4gDQo+Pj4gSSBtaWdodCBiZSBlYXNpZXIgdG8gc3RhcnQgYnkganVzdCBzdXBwb3J0aW5n
IGRldmljZXMgdGhhdCBoYXZlIE1TSQ0KPj4+IChvciBNU0ktWCkgYW5kIHRoZW4gbW92ZSB0byBs
ZWdhY3kgaW50ZXJydXB0cyBpZiByZXF1aXJlZD8NCj4+IE1TSSBzdXBwb3J0IHJlcXVpcmVzIGFs
c28gc29tZSBzdXBwb3J0IGluIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBwYXJ0DQo+PiBvbiBh
cm0uIFNvIHRoZXJlIGlzIHNvbWUgd29yayB0byBhY2hpZXZlIHRoYXQuDQo+Pj4gDQo+Pj4gWW91
IHNob3VsZCBoYXZlIG1vc3Qgb2YgdGhlIHBpZWNlcyB5b3UgcmVxdWlyZSBhbHJlYWR5IGltcGxl
bWVudGVkDQo+Pj4gc2luY2UgdGhhdCdzIHdoYXQgeDg2IHVzZXMsIGFuZCBoZW5jZSBjb3VsZCBy
ZXVzZSBhbG1vc3QgYWxsIG9mIGl0Pw0KPj4gSW5zaWRlIFBDSSBwcm9iYWJseSBidXQgdGhlIEdJ
QyBwYXJ0IHdpbGwgcmVxdWlyZSBzb21lIHdvcmsuDQo+IA0KPiBXZSBhbHJlYWR5IGhhdmUgYW4g
SVRTIGltcGxlbWVudGF0aW9uIGluIFhlbi4gVGhpcyBpcyByZXF1aXJlZCBpbiBvcmRlciB0byB1
c2UgUENJIGRldmljZXMgaW4gRE9NMCBvbiB0aHVuZGVyLXggKHRoZXJlIGlzIG5vIGxlZ2FjeSBp
bnRlcnJ1cHRzIHN1cHBvcnRlZCkuDQo+IA0KPiBJdCB3YXNuJ3QgeWV0IGV4cG9zZWQgdG8gdGhl
IGd1ZXN0IGJlY2F1c2Ugd2UgZGlkbid0IGZ1bGx5IGludmVzdGlnYXRlIHRoZSBzZWN1cml0eSBh
c3BlY3Qgb2YgdGhlIGltcGxlbWVudGF0aW9uLiBIb3dldmVyLCBmb3IgYSB0ZWNoIHByZXZpZXcg
dGhpcyBzaG91bGQgYmUgc3VmZmljaWVudC4NCj4gDQoNCk9rIFdlIHdpbGwgaGF2ZSBhIGxvb2sg
Zm9yIHRoZSBJVFMgaW1wbGVtZW50YXRpb24gb25jZSB3ZSB3aWxsIHN0YXJ0IHdvcmtpbmcgb24g
dGhlIE1TSSBzdXBwb3J0LiBUaGFua3MgZm9yIHRoZSBwb2ludGVyLg0KPiANCj4gLS0gDQo+IEp1
bGllbiBHcmFsbA0KPiANCg0K

