Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 453A7225D61
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 13:27:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxTwT-00075n-9v; Mon, 20 Jul 2020 11:26:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfNH=A7=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1jxTwS-00075g-3a
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 11:26:44 +0000
X-Inumbo-ID: e203a902-ca7b-11ea-848b-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e203a902-ca7b-11ea-848b-bc764e2007e4;
 Mon, 20 Jul 2020 11:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xPcbbCTlUA8K7vBRakfxZyiXhrnH5soaXfyZJi+64k=;
 b=Anl1w0Cs7aYBJRgO7vEcTdasZGletEEAcKzE9jIhXbd21hFzlchupOhO3pgUXnBIMYBuaEMpKjrM6jPSmJfE4Giexoav59dQmE+/Appx3mKbAv+9KW35HWrSy/3RSNrN8uK7OmJGCEKqb32Xy4R6hXPiQCerTzk2Cp+R2sf6Yj0=
Received: from AM7PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:20b:130::28)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Mon, 20 Jul
 2020 11:26:39 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::4d) by AM7PR03CA0018.outlook.office365.com
 (2603:10a6:20b:130::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Mon, 20 Jul 2020 11:26:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Mon, 20 Jul 2020 11:26:38 +0000
Received: ("Tessian outbound 7de93d801f24:v62");
 Mon, 20 Jul 2020 11:26:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 726e1fb8b60ae5ac
X-CR-MTA-TID: 64aa7808
Received: from dbc2a88e0618.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC1CDCF4-CF91-446B-A171-D97E9786923C.1; 
 Mon, 20 Jul 2020 11:26:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dbc2a88e0618.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Jul 2020 11:26:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnIMQIe/2l/xgsrHS3cdunRlZH9BXUrbMGt47ZCyAamlqMaeVuwFpVYYjCSoQ0tY87vMmTqkh/aay372rM7hn+5mM0EpExhdyTVlHF9NUJGuimB/Jp8zGrFH3kYmLKe8IAuojFTaffvIBNlmGkZXiWeuZ5odI6qzkcpVOuU6pdEj2EFsPVFDl5bZt/uCo0W4wOjrj5dIOU22wKNfk4zdkgW9XNt2NOg1JRAS9bb5By69tNWDn/JTvIENe8fkXDMz/QWbBzXULJNprEHIJdEooZs1m6IdsAFM49IOclgIde7YN5IF3OS9Y227qnNc0RUIUn6Z5eNQUwnTr9xUbMTi5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xPcbbCTlUA8K7vBRakfxZyiXhrnH5soaXfyZJi+64k=;
 b=LQ/9y6kd4PJonS02w60bep+d6YzEHVvf7lm30rCJI2ILCVAyrrt+QEbJg8JW5n0PT0I7BD6oFJEgY+D0ttddc3xsEOOwywInT8tqsQbuS7chz++2fTjOLFBReweKQDeLmUn9DsgsUGKTB24EShI/eHSNxT4FEw7ZuYooRzDGXIfePfEgndizgJhxXd17anyFJY0/rvJiqrsZD9I4/onZNzm5x4kd94NtoWpr3G/Jtf8JDfrUp9gpPwn6IU1dR1UuvhFhSDmo7mnAV9chHIoyaYOP0dnv1watR41+/loy0oi5zV2PwQmMcNinJfaxsYZww3uRLC1GBP7mp7Uy9ekihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xPcbbCTlUA8K7vBRakfxZyiXhrnH5soaXfyZJi+64k=;
 b=Anl1w0Cs7aYBJRgO7vEcTdasZGletEEAcKzE9jIhXbd21hFzlchupOhO3pgUXnBIMYBuaEMpKjrM6jPSmJfE4Giexoav59dQmE+/Appx3mKbAv+9KW35HWrSy/3RSNrN8uK7OmJGCEKqb32Xy4R6hXPiQCerTzk2Cp+R2sf6Yj0=
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 by AM6PR08MB4086.eurprd08.prod.outlook.com (2603:10a6:20b:a8::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Mon, 20 Jul
 2020 11:26:32 +0000
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5]) by AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5%6]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 11:26:32 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: PCI devices passthrough on Arm design proposal
Thread-Topic: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAFEeACAAAehAIAAD+CAgAAK1YCAAAXWgIABRE+AgAMpy4A=
Date: Mon, 20 Jul 2020 11:26:31 +0000
Message-ID: <9C341B21-6D11-428D-9C73-272DB8674998@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
 <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
 <865D5A77-85D4-4A88-A228-DDB70BDB3691@arm.com>
 <972c0c81-6595-7c41-baa5-8882f5d1c0ff@xen.org>
 <4E6B793C-2E0A-4999-9842-24CDCDE43903@arm.com>
 <22df2406-c4d3-1d06-0736-51ebea5581ea@xen.org>
In-Reply-To: <22df2406-c4d3-1d06-0736-51ebea5581ea@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49a45f0a-ced2-4ad3-cb12-08d82c9fc4f3
x-ms-traffictypediagnostic: AM6PR08MB4086:|AM5PR0801MB1713:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1713C9BFF79FF374C98F4204FC7B0@AM5PR0801MB1713.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5x3BZyGQ7236Dd0BxOGq0EY6vdPoCX1BrX3CB7gVu8cpRCDKwuzpVa7UaVLLphudc+oJ00ojxYzWdWZTWUE8qibiPEZ4bdelbr9X0StdL3A8O3kWOsPGQzHgigseFTMrXZMEH3i/fAGTiArHXT2cXoqjahXnqUHxxiL40hKK6ravZuMHFK1/tMYlsAVCpOcJMBJ+Rjhih9hptaR6r/rh0nVcrHADsno3nyUFfPfCrxbQEp/MMV75tK3dqdyFHttyp5/hCWmnIwariurjJp9bbw5OXZMaoIVeFn/6yTxZI1mrJabGiRqJioJdlFyKkTmAD6APiZnW2H5F5o4yRINrYg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(66446008)(66556008)(8936002)(66476007)(76116006)(64756008)(2906002)(5660300002)(33656002)(91956017)(4326008)(66946007)(186003)(316002)(6916009)(36756003)(71200400001)(26005)(2616005)(83380400001)(6506007)(53546011)(55236004)(8676002)(54906003)(6512007)(6486002)(478600001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Lzpio+/VZOdqJh19Z59o78424JzbrgKgvQsq+VfmRIO7tBcnpzI5xvTwqj73LNQ9PHmt7SLol/ElaPsuYRzXf7GvB9iQGHaKWT2k1mGFeVhh1otz5fCiz5T2cxBjEPpLgpvtCBMzsKrfXgJ49/ARVCsujqrk/ga80RObqGj5Yo8b5jpqL1x31gO4wlQm8jTLDJw1GESd4RT2tH3jOrrhdoIu94DQzAPCXC1QOfeVpTOpqLGtyKoj1QQmTjfk1T0jPaEv8y8Htf/PBG6IpKB8swcK3SWT2vhpa5/Cyyykg4vKxcPiZl99YTYOtX+NaesUOD8B3tCdA02bUoE4gxexlAMfIpe6zF2yOMX77TySWJTmu1Aeod2oaBVy86hyWKcr/dUFCu6j8x54ljfRfaDZgg569stnCz1fKPLOEvCu9WeN+lTf+1tPralrevt2Ki2Ime6/1wP+NrT4LO0tYq3YUx4Hh0giGNMn8Shp9WrLAEw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCFBDAA2CE113C42B527D65BC38FFE12@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4086
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(26005)(33656002)(8936002)(6486002)(70586007)(70206006)(316002)(107886003)(356005)(6512007)(6862004)(2616005)(8676002)(54906003)(82310400002)(82740400003)(83380400001)(4326008)(36906005)(5660300002)(86362001)(6506007)(47076004)(53546011)(336012)(186003)(36756003)(2906002)(81166007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e7d5edda-c3bf-4a7f-7d28-08d82c9fc0e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUfSHRa2a2iaq0imulGpdRuzih3WKiAgFAkaicUq8LjEsYKZDc3rdyrppYCpaIYL5Y98vgnlMLDaSPYxvzDoZEQFcRo8kxDHoL6JKYKkMft7mibH65ivD+PLCoNrpt5Fok5ySHTnM5Z+VFOE9GwghT3gspT/j7xZjZ9SQo68MmgBSI/IewR3CTKrPuQSORxDl0TeS8iGNTd6cSokku16L0YC4tMxzBJMeGVUuigYAJidUFYKQ9iadjVvnjO8iUC/eYACavLQTCr72jLqdZO/2oYb7S9lLO5hoqYcRXT/9Hpb3oOR4DXxaojfyGy2a9cwMdlRtGu25ropEDg859HippDykUb0/EwxHWu1Q9w8ridjrmt9a/igqqZWYhgFf0sY3D6iFxAVXbiHU6pVSrR0RQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 11:26:38.7535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a45f0a-ced2-4ad3-cb12-08d82c9fc4f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
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

DQoNCj4gT24gMTggSnVsIDIwMjAsIGF0IDEyOjA4IHBtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMTcvMDcvMjAyMCAxNjo0NywgQmVy
dHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBPbiAxNyBKdWwgMjAyMCwgYXQgMTc6MjYsIEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IE9uIDE3LzA3LzIwMjAgMTU6NDcs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4+ICAgICBwY2k9WyAiUENJX1NQRUNfU1RS
SU5HIiwgIlBDSV9TUEVDX1NUUklORyIsIC4uLl0NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEd1ZXN0IHdp
bGwgYmUgb25seSBhYmxlIHRvIGFjY2VzcyB0aGUgYXNzaWduZWQgZGV2aWNlcyBhbmQgc2VlIHRo
ZSBicmlkZ2VzLiBHdWVzdCB3aWxsIG5vdCBiZSBhYmxlIHRvIGFjY2VzcyBvciBzZWUgdGhlIGRl
dmljZXMgdGhhdCBhcmUgbm8gYXNzaWduZWQgdG8gaGltLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gTGlt
aXRhdGlvbjoNCj4+Pj4+Pj4gKiBBcyBvZiBub3cgYWxsIHRoZSBicmlkZ2VzIGluIHRoZSBQQ0kg
YnVzIGFyZSBzZWVuIGJ5IHRoZSBndWVzdCBvbiB0aGUgVlBDSSBidXMuDQo+Pj4+Pj4gV2h5IGRv
IHlvdSB3YW50IHRvIGV4cG9zZSBhbGwgdGhlIGJyaWRnZXMgdG8gYSBndWVzdD8gRG9lcyB0aGlz
IG1lYW4gdGhhdCB0aGUgQkRGIHNob3VsZCBhbHdheXMgbWF0Y2ggYmV0d2VlbiB0aGUgaG9zdCBh
bmQgdGhlIGd1ZXN0Pw0KPj4+PiBUaGF04oCZcyBub3QgcmVhbGx5IHNvbWV0aGluZyB0aGF0IHdl
IHdhbnRlZCBidXQgdGhpcyB3YXMgdGhlIGVhc2llc3Qgd2F5IHRvIGdvLg0KPj4+PiBBcyBzYWlk
IGluIGEgcHJldmlvdXMgbWFpbCB3ZSBjb3VsZCBidWlsZCBhIFZQQ0kgYnVzIHdpdGggYSBjb21w
bGV0ZWx5IGRpZmZlcmVudCB0b3BvbG9neSBidXQgSSBhbSBub3Qgc3VyZSBvZiB0aGUgYWR2YW50
YWdlcyB0aGlzIHdvdWxkIGhhdmUuDQo+Pj4+IERvIHlvdSBzZWUgc29tZSByZWFzb24gdG8gZG8g
dGhpcyA/DQo+Pj4gDQo+Pj4gWWVzIDopOg0KPj4+ICAxKSBJZiBhIHBsYXRmb3JtIGhhcyB0d28g
aG9zdCBjb250cm9sbGVycyAoSUlSQyBUaHVuZGVyLVggaGFzIGl0KSB0aGVuIHlvdSB3b3VsZCBu
ZWVkIHRvIGV4cG9zZSB0d28gaG9zdCBjb250cm9sbGVycyB0byB5b3VyIGd1ZXN0LiBJIHRoaW5r
IHRoaXMgaXMgdW5kZXNpcmFibGUgaWYgeW91ciBndWVzdCBpcyBvbmx5IHVzaW5nIGEgY291cGxl
IG9mIFBDSSBkZXZpY2VzIG9uIGVhY2ggaG9zdCBjb250cm9sbGVycy4NCj4+PiAgMikgSW4gdGhl
IGNhc2Ugb2YgbWlncmF0aW9uIChsaXZlIG9yIG5vdCksIHlvdSBtYXkgd2FudCB0byB1c2UgYSBk
aWZmZXJlbmNlIFBDSSBjYXJkIG9uIHRoZSB0YXJnZXQgcGxhdGZvcm0uIFNvIHlvdXIgQkRGIGFu
ZCBicmlkZ2VzIG1heSBiZSBkaWZmZXJlbnQuDQo+Pj4gDQo+Pj4gVGhlcmVmb3JlIEkgdGhpbmsg
dGhlIHZpcnR1YWwgdG9wb2xvZ3kgY2FuIGJlIGJlbmVmaWNpYWwuDQo+PiBJIHdvdWxkIHNlZSBh
IGJpZyBhZHZhbnRhZ2UgZGVmaW5pdGVseSB0byBoYXZlIG9ubHkgb25lIFZQQ0kgYnVzIHBlciBn
dWVzdCBhbmQgcHV0IGFsbCBkZXZpY2VzIGluIHRoZWlyIGluZGVwZW5kZW50bHkgb2YgdGhlIGhh
cmR3YXJlIGRvbWFpbiB0aGUgZGV2aWNlIGlzIG9uLg0KPj4gQnV0IHRoaXMgd2lsbCBwcm9iYWJs
eSBtYWtlIHRoZSBWUENJIEJBUnMgdmFsdWUgY29tcHV0YXRpb24gYSBiaXQgbW9yZSBjb21wbGV4
IGFzIHdlIG1pZ2h0IGVuZCB1cCB3aXRoIG5vIHNwYWNlIG9uIHRoZSBndWVzdCBwaHlzaWNhbCBt
YXAgZm9yIGl0Lg0KPj4gVGhpcyBtaWdodCBtYWtlIHRoZSBpbXBsZW1lbnRhdGlvbiBhIGxvdCBt
b3JlIGNvbXBsZXguDQo+IA0KPiBJIGFtIG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQgeW91ciBhcmd1
bWVudCBhYm91dCB0aGUgc3BhY2UuLi4gWW91IHNob3VsZCBiZSBhYmxlIHRvIGZpbmQgb3V0IHRo
ZSBzaXplIG9mIGVhY2ggQkFScywgc28geW91IGNhbiBzaXplIHRoZSBNTUlPIHdpbmRvdyBjb3Jy
ZWN0bHkuIFRoaXMgc2hvdWxkbid0IGFkZCBhIGxvdCBvZiBjb21wbGV4aXR5Lg0KPiANCj4gSSBh
bSBub3QgYXNraW5nIGFueSBpbXBsZW1lbnRhdGlvbiBmb3IgdGhpcywgYnV0IHdlIG5lZWQgdG8g
bWFrZSBzdXJlIHRoZSBkZXNpZ24gY2FuIGVhc2lseSBiZSBleHRlbmRlZCBmb3Igb3RoZXIgdXNl
IGNhc2VzLiBJbiB0aGUgY2FzZSBvZiBzZXJ2ZXIsIHdlIHdpbGwgbGlrZWx5IHdhbnQgdG8gZXhw
b3NlIGEgc2luZ2xlIHZQQ0kgdG8gdGhlIGd1ZXN0Lg0KDQpUaGlzIGlzIHNvbWV0aGluZyB3ZSBo
YXZlIHRvIHdvcmsgb24gaG93IHRvIGltcGxlbWVudCB0aGUgdmlydHVhbCB0b3BvbG9neSBmb3Ig
dGhlIGd1ZXN0LiANCg0KPiANCj4+PiANCj4+Pj4+PiAgICAtIElzIHRoZXJlIGFueSBtZW1vcnkg
YWNjZXNzIHRoYXQgY2FuIGJ5cGFzc2VkIHRoZSBJT01NVSAoZS5nIGRvb3JiZWxsKT8NCj4+Pj4g
VGhpcyBpcyBzdGlsbCBzb21ldGhpbmcgdG8gYmUgaW52ZXN0aWdhdGVkIGFzIHBhcnQgb2YgdGhl
IE1TSSBpbXBsZW1lbnRhdGlvbi4NCj4+Pj4gSWYgeW91IGhhdmUgYW55IGlkZWEgaGVyZSwgZmVl
bCBmcmVlIHRvIHRlbGwgdXMuDQo+Pj4gDQo+Pj4gTXkgbWVtb3J5IGlzIGEgYml0IGZ1enp5IGhl
cmUuIEkgYW0gc3VyZSB0aGF0IHRoZSBkb29yYmVsbCBjYW4gYnlwYXNzIHRoZSBJT01NVSBvbiBz
b21lIHBsYXRmb3JtLCBidXQgSSBhbHNvIHZhZ3VlbHkgcmVtZW1iZXIgdGhhdCBhY2Nlc3NlcyB0
byB0aGUgUENJIGhvc3QgY29udHJvbGxlciBtZW1vcnkgd2luZG93IG1heSBhbHNvIGJ5cGFzcyB0
aGUgSU9NTVUuIEEgZ29vZCByZWFkaW5nIG1pZ2h0IGJlIFsyXS4NCj4+PiANCj4+PiBJSVJDLCBJ
IGNhbWUgdG8gdGhlIGNvbmNsdXNpb24gdGhhdCB3ZSBtYXkgd2FudCB0byB1c2UgdGhlIGhvc3Qg
bWVtb3J5IG1hcCBpbiB0aGUgZ3Vlc3Qgd2hlbiB1c2luZyB0aGUgUENJIHBhc3N0aHJvdWdoLiBC
dXQgbWF5YmUgbm90IG9uIGFsbCB0aGUgcGxhdGZvcm1zLg0KPj4gRGVmaW5pdGVseSBhIGxvdCBv
ZiB0aGlzIHdvdWxkIGJlIGVhc2llciBpZiBjb3VsZCB1c2UgMToxIG1hcHBpbmcuDQo+PiBXZSB3
aWxsIGtlZXAgdGhhdCBpbiBtaW5kIHdoZW4gd2Ugd2lsbCBzdGFydCB0byBpbnZlc3RpZ2F0ZSBv
biB0aGUgTVNJIHBhcnQuDQo+IA0KPiBIbW1tLi4uIE1heWJlIEkgd2Fzbid0IGNsZWFyIGVub3Vn
aCBidXQgdGhlIHByb2JsZW0gaXMgbm90IG9ubHkgaGFwcGVuaW5nIHdpdGggTVNJcyBkb29yYmVs
bHMuIEl0IGlzIGFsc28gd2l0aCB0aGUgUDJQIHRyYW5zYWN0aW9ucy4NCj4gDQo+IEFnYWluLCBJ
IGFtIG5vdCBhc2tpbmcgdG8gaW1wbGVtZW50IGl0IGF0IHRoZSBiZWdpbm5pbmcuIEhvd2V2ZXIs
IGl0IHdvdWxkIGJlIGdvb2QgdG8gb3V0bGluZSB0aGUgcG90ZW50aWFsIGxpbWl0YXRpb25zIG9m
IHRoZSBhcHByb2FjaCBpbiB5b3VyIGRlc2lnbi4NCg0KQXMgQmVydHJhbmQgbWVudGlvbiBvbmNl
IHdlIHN0YXJ0IGludmVzdGlnYXRpbmcgb24gdGhlIE1TSSBzdXBwb3J0IHdlIHdpbGwgaGF2ZSB0
aGlzIGluIG1pbmQgdG8gcHJvY2VlZC4NCj4gDQo+IENoZWVycywNCj4gDQo+IA0KPiAtLSANCj4g
SnVsaWVuIEdyYWxsDQoNCg==

