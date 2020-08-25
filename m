Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579A0250FCA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 05:03:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAPEO-0004fD-M7; Tue, 25 Aug 2020 03:02:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BGsN=CD=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kAPEM-0004f8-Ro
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 03:02:38 +0000
X-Inumbo-ID: 27cb5b38-f89c-4b98-8200-92220abd8df4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.62]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27cb5b38-f89c-4b98-8200-92220abd8df4;
 Tue, 25 Aug 2020 03:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjEC9zD4gsEWULYC9Uy3pMMzDdWQVE7GbjE9PEW1WjM=;
 b=ryCz9d6R49A2+ra7RhY9IuvwCkCw7HOd7Wh/dTDRYNd20Alyolr8vPU3BIX2UitYDYviDfgi2V5EW78f8bGUwIChdI+KN0u0/5GTSA4FMAoFfKHq+bRfZPN/AFAG4Pe1xhixfYdEQif1cxj0pYXCIMywnqBA5EjNGaUZlHhHmeI=
Received: from AM5PR0601CA0029.eurprd06.prod.outlook.com
 (2603:10a6:203:68::15) by DB6PR0802MB2183.eurprd08.prod.outlook.com
 (2603:10a6:4:84::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 03:02:33 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::5) by AM5PR0601CA0029.outlook.office365.com
 (2603:10a6:203:68::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 03:02:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 03:02:31 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Tue, 25 Aug 2020 03:02:30 +0000
X-CR-MTA-TID: 64aa7808
Received: from 16052c0286ef.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 911205CA-A895-447F-B699-54433EA6B32D.1; 
 Tue, 25 Aug 2020 03:02:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 16052c0286ef.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 03:02:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gI3cm7LiRHzvIvh18lJwTBeQvQLE77vlKOtqIVLN4GJ1oad74Du/IWSLaYkTUPS3bwEbxbWLwYsKaumPAGolNs5lX/N6Qk9MpYz4DI3nwZm+WIJKWrvojuNO8bKZbox2Re0IIlga6l19r7H6Mej1aNB00q5x6jupQqj3IDeLvjn44Nw4PctHp61GonzZdBRu/tZ/kpkAgtD+9G+2sn9+eOLjN/pcvsiU1RgxiwPbjXj5vOXALS26NwjTUqHZhYN2O3sE4RtBqplNeVw7f0PU0oUcbLN7VIGNsQTaqJs0+XT3ZuGoXD1xh5ifozH4wTsSdgCuzvNeZOawcQ3rqUnOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjEC9zD4gsEWULYC9Uy3pMMzDdWQVE7GbjE9PEW1WjM=;
 b=QoVBCubvsdxoE/gzmf761v1pGIUYPk0fQF0Id/cFuZpnRr3jlnVpTbcxe2CSam0Cz7dKQ4+ri7ic/MORwABJIW+BTOUpV4CpJf0LQKiMYYzs6vHDx6OMJddzSk4Nm8lbFuQvyX1RhWGZ7GbeTZKGtogIy99GcJZ+Xyt6Y1gXerVCAfbG4xaQjCnLqNW4P7jFvQxUlcCydmoXlF+eAAfAd7vFQVtf6yjiqf4Ji6uh6vavKTL//i5TR9IneEIRuQ7UWmsFH3DZTwTcsD657I3URDzgsPyErtezCAFaO8QuScz9tF0GAAbQDzYIwSZukxZ+ibWO97H9Gj/jg2xGzQBCWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjEC9zD4gsEWULYC9Uy3pMMzDdWQVE7GbjE9PEW1WjM=;
 b=ryCz9d6R49A2+ra7RhY9IuvwCkCw7HOd7Wh/dTDRYNd20Alyolr8vPU3BIX2UitYDYviDfgi2V5EW78f8bGUwIChdI+KN0u0/5GTSA4FMAoFfKHq+bRfZPN/AFAG4Pe1xhixfYdEQif1cxj0pYXCIMywnqBA5EjNGaUZlHhHmeI=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM4PR0802MB2292.eurprd08.prod.outlook.com (2603:10a6:200:5f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 03:02:23 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::60e0:726f:fcef:2be6]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::60e0:726f:fcef:2be6%4]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 03:02:23 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, Andre Przywara <Andre.Przywara@arm.com>, Penny
 Zheng <Penny.Zheng@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH v2 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Topic: [PATCH v2 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Index: AQHWecbScdmV/bD+7kSe7MLLwOsneKlHQwyAgAA4roCAAAcFAIAAmjyw
Date: Tue, 25 Aug 2020 03:02:22 +0000
Message-ID: <AM0PR08MB374767BD9D9EDA9C199B44629E570@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20200824032825.18368-1-wei.chen@arm.com>
 <20200824032825.18368-3-wei.chen@arm.com>
 <9667769d-e938-0dbc-c2f5-84880435c932@xen.org>
 <4CEBEFBA-6AEB-4CFC-B569-79056AAE0E3D@arm.com>
 <76da7a94-d53c-804d-54c6-b7ca52ffe61e@xen.org>
In-Reply-To: <76da7a94-d53c-804d-54c6-b7ca52ffe61e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 59E02DDCBAEC1D41B379AD1C4624432A.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b094412d-9af9-42c5-9179-08d848a34ef6
x-ms-traffictypediagnostic: AM4PR0802MB2292:|DB6PR0802MB2183:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2183FA3FD69C0CB45326DCE39E570@DB6PR0802MB2183.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zvV15cR3PxOB7uBsYv14GNON6dTwByh9jKqctf0yh4VNVmig3x+opNKnhu8wctZ2dfZFGiKst3SjV4mfSqwiT2TJKfyHuoFU9tEOsP5Z8ohCiJPtBxjbt0CR9Ry3cZo6gJqXKieBKyOuqWMTBkoHmmCEMMh6t2bn6x9ByOyFLrv00OP+aseZNGDpsv3mQRWfholK1NIWw4w//IkiPGuOH32d6ygXINyOXKk5cVopw0QyXgfBtYhP5UaJlgpdc6q1ICWsBi+ko34b8reyCH9JapdLvj64wJBHKGGRkMgK0jHXrpGZPrjoUkWs0G4zOqUxauO5+cxgU4L13yKjRuGjjg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3747.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(6636002)(66446008)(66556008)(66476007)(64756008)(66946007)(83380400001)(8676002)(15650500001)(8936002)(6506007)(53546011)(86362001)(478600001)(76116006)(5660300002)(52536014)(33656002)(186003)(26005)(55016002)(316002)(54906003)(110136005)(4326008)(2906002)(71200400001)(7696005)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: AsLidUfpuJWLKn6qYQynlRkP3D6Iirqc+yvOvVTEQWMUwfBofXa8+Nrh83Jwb8FRy3IJE2/aWm+JiBkZaiydg8H7WeeBoeWF+N2/U9W/gsZB8Fg+rfub5GUW8GWDgHEAZhEGXF0cVDyCTrAz8e0n4TqxVEL4Vz4Evhci6uvRhMh4GJ0lYSJ+m+TrTfsEW1W1SlvasIfJ+NyLs+PQnvJc6elGBaPE2xroPvT5yZn02IFZC1VM+rB7FvZRLCvdQ07WK5YF53ESEDxP0wi4AkmdZmoWHtifmHpP4BD4hFgoM21iXEl2MjDln0DYD4GSb13ZStuEWKrC+OTq4HcFwxuIU0WcfZcQToJWxtAqjPAS0x2GHTQ8bUMzyWyjxXzKqR4nkZjWFhpy3EEVRMCdDMWHaatBjSigbGmavSTxvHfvQdHyKGiH9siGf5fToG1sq2/63hp6nN+uXD2LfOahtnvnjd+tIE/fumDnBZ/7KHGW/bzTWjt71p4wL3/hY/v6H4FERM0hBsCc1tGRRn7cy4j4WsGzK0sqrQwPcLR1i7niZ/F40xzt+Mxv6aQIh43S3kV2aJhjMMOrGjziPzDB02AK66h9GCZQaf790tT9MHx98o5U6spT35lEjbKm+zaOQW/xQb+A7ZDrJllPO71pq2Wkog==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2292
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d79d7834-4f62-495b-a350-08d848a34a1e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhgti6T7+Xe0QBmL+BmCSxhCc5/M615cJQ4asPtZloHtRMCO2m31kwzk0ImA4WHN2sVpWFb1Nv66J2HqRC4EkXeCIf5HaN3YJ6FUvNZtlvrTVpFaaCfZhKTuiLWfTu30zRrh842HU1geM7fgJ6IRekRvKG3fKbFV+fjkb2dVpg+kH7jAG1NCp5EBtcdqWkmvE/Z9yyotZ/2mNAziX1M1T6ZyGa2QzZCsQvQfhCiWbMKulxPs7z2WyeNIRlJWWOCb2Fx6gGEmGTbPERuvSDLVVr0ais2AN5rLMLrszBKpQXgQZW/o+h2oLtfz86BUu88wHsfLu2B4noa4+vbWdpSwHQcSpeZz9Qriok2vPNMhhe+eAxzJelp/AN0Sx/Li6C5XP1JGl5Xy9tAcXxyZlPt1TQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966005)(54906003)(7696005)(8676002)(81166007)(82310400002)(86362001)(9686003)(336012)(356005)(6636002)(186003)(110136005)(8936002)(55016002)(6506007)(478600001)(83380400001)(33656002)(316002)(15650500001)(53546011)(70206006)(70586007)(4326008)(26005)(52536014)(5660300002)(47076004)(82740400003)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 03:02:31.3426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b094412d-9af9-42c5-9179-08d848a34ef6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2183
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLCBCZXJ0cmFuZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBTZW50OiAyMDIw5bm0OOaciDI1
5pelIDE6MjMNCj4gVG86IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNv
bT4NCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgWGVuLWRldmVsIDx4ZW4tDQo+
IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgQW5k
cmUgUHJ6eXdhcmENCj4gPEFuZHJlLlByenl3YXJhQGFybS5jb20+OyBQZW5ueSBaaGVuZyA8UGVu
bnkuWmhlbmdAYXJtLmNvbT47IEthbHkNCj4gWGluIDxLYWx5LlhpbkBhcm0uY29tPjsgbmQgPG5k
QGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8yXSB4ZW4vYXJtOiBUaHJvdyBt
ZXNzYWdlcyBmb3IgdW5rbm93bg0KPiBGUC9TSU1EIGltcGxlbWVudCBJRA0KPiANCj4gDQo+IA0K
PiBPbiAyNC8wOC8yMDIwIDE3OjU3LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPiA+IEhpIEp1
bGllbiwNCj4gDQo+IEhpLA0KPiANCj4gPg0KPiA+PiBPbiAyNCBBdWcgMjAyMCwgYXQgMTQ6MzQs
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiA+Pg0KPiA+PiBIaSBXZWks
DQo+ID4+DQo+ID4+IE9uIDI0LzA4LzIwMjAgMDQ6MjgsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4g
QXJtIElEX0FBNjRQRlIwX0VMMSByZWdpc3RlciBwcm92aWRlcyB0d28gZmllbGRzIHRvIGRlc2Ny
aWJlIENQVQ0KPiA+Pj4gRlAvU0lNRCBpbXBsZW1lbnRhdGlvbnMuIEN1cnJlbnRseSwgd2UgZXhh
Y3RseSBrbm93IHRoZSBtZWFuaW5nIG9mDQo+ID4+PiAweDAsIDB4MSBhbmQgMHhmIG9mIHRoZXNl
IGZpZWxkcy4gWGVuIHRyZWF0cyB2YWx1ZSA8IDggYXMgRlAvU0lNRA0KPiA+Pj4gZmVhdHVyZXMg
cHJlc2VudGVkLiBJZiB0aGVyZSBpcyBhIHZhbHVlIDB4MiBidW1wZWQgaW4gdGhlIGZ1dHVyZSwN
Cj4gPj4+IFhlbiBiZWhhdmlvcnMgZm9yIHZhbHVlIDw9IDB4MSBjYW4gYWxzbyB0YWtlIGVmZmVj
dC4gQnV0IHdoYXQgWGVuDQo+ID4+PiBkb25lIGZvciB2YWx1ZSA8PSAweDEgbWF5IG5vdCBhbHdh
eXMgY292ZXIgbmV3IHZhbHVlIDB4MiByZXF1aXJlZC4NCj4gPj4NCj4gPj4gUmlnaHQsIGJ1dCB0
aGlzIHdpbGwgYWxzbyBoYXBwZW4gd2l0aCBhbGwgdGhlIG90aGVyIGZlYXR1cmVzLiBUaGlzIG1h
eQ0KPiBhY3R1YWxseSBjb25mdXNlIHRoZSB1c2VycyBhcyB0aGV5IG1heSB0aGluayB0aGUgcmVz
dCBvZiB0aGUgZmVhdHVyZXMgYXJlIGZ1bGx5DQo+IHN1cHBvcnRlZCB3aGljaCBpcyBub3QgY29y
cmVjdC4gRm9yIGluc3RhbmNlLCBkb20wIHdpbGwgY3Jhc2ggaWYgeW91IGJvb3QgWGVuDQo+IG9u
IGEgU1ZFLWNhcGFibGUgaGFyZHdhcmUuDQo+ID4NCj4gPiBJIHdvdWxkIHNlZSB0aGlzIGFzIGFu
IGltcHJvdmVtZW50IGFscmVhZHkuDQo+IA0KPiBUQkgsIEkgb25seSB2aWV3IHRoaXMgcGF0Y2gg
YXMgYSBiYW5kLWFpZC4gSSBhbSBPSyB3aXRoIHRoZW0gYnV0IHRoZXkNCj4gbmVlZCB0byBiZSB1
c2VmdWwuDQo+IA0KPiBXaGVuIEkgcmVhZCAidW5rbm93biB2YWx1ZS4uLiIsIEkgaGF2ZSBubyBj
bHVlIHdoZXRoZXIgdGhlIG1lc3NhZ2UgaXMNCj4gZ29vZCBvciBiYWQuIEl0IHdvdWxkIGJlIGJl
dHRlciB0byBleHRlbmQgdGhlIG1lc3NhZ2Ugd2l0aCB3aGF0IGNvdWxkIGdvDQo+IHdyb25nLiBF
LmcgIlVua25vd24gdmFsdWUgWCwgdGhpcyBtYXkgcmVzdWx0IHRvIGNvcnJ1cHRpb24gb24gdGhl
IHBsYXRmb3JtIi4NCj4gDQoNCj4gSSB3b3VsZCBhbHNvIGNvbnNpZGVyIHRvIHRhaW50IFhlbiBh
cyBpdCBtYXkgYmVjb21lIHVuc3RhYmxlIHdpdGggdGhpcw0KPiBvcHRpb24gc2V0Lg0KPiAgDQoN
CkhtbSwgeWVzLCBpdCBzZWVtcyBjdXJyZW50IG1lc3NhZ2VzIGFyZSBwYWxlLiBUaGUgdXNlciBj
b3VsZCBub3QgdW5kZXJzdGFuZA0Kd2hhdCB3ZSB3YW50IHRoZSBtZXNzYWdlIGV4cHJlc3NlZCB3
aGVuIGhlIGdvdCBvbmUgc3VjaCBtZXNzYWdlLiBJIHdpbGwgaW1wcm92ZQ0KdGhlbSB0byBnaXZl
IHVzZXIgYSBjbGVhciBtZWFuaW5nLiBBbmQgSSB0aGluayBhIFhFTkxPR19XQVJOSU5HIHdvdWxk
IGJlIGJldHRlcg0KdG8gbm90aWNlIHVzZXIuIEkgd2lsbCBkbyB0aGVtIGluIHYzLg0KDQo+ID4g
TW9yZSBjb3VsZCBiZSBkb25lIGZvciBTVkUgKGFuZCBvdGhlciBiaXRzKSBidXQgdGhpcyBzaG91
bGQgYmUgaW4gYW5vdGhlcg0KPiBwYXRjaCBzZXQuDQo+ID4NCj4gPj4NCj4gPj4+IFdlIHRocm93
IHRoZXNlIG1lc3NhZ2VzIHRvIGJyZWFrIHRoZSBzaWxlbmNlIHdoZW4gWGVuIGRldGVjdGVkDQo+
ID4+PiB1bmtub3duIEZQL1NJTUQgSURzIHRvIG5vdGljZSB1c2VyIHRvIGNoZWNrLg0KPiA+Pg0K
PiA+PiBJdCBmZWVscyBhIGJpdCBvZGQgdG8gbWUgdG8gcHJpbnQgdW5rbm93biBmb3IgdGhlIEZQ
L1NJTUQgZmVhdHVyZSBidXQgbm90DQo+IGZvciBhbGwgdGhlIHJlc3QuDQo+ID4+DQo+ID4+IElN
SE8sIHRoZSByaWdodCBhcHByb2FjaCBpcyB0byBzYW5pdGl6ZSBJRCByZWdpc3RlcnMgZXhwb3Nl
ZCB0byBkb21haW5zDQo+IGFuZCBvbmx5IGV4cG9zZSBmZWF0dXJlcyB3ZSBrbm93IGFyZSBjb3Jy
ZWN0bHkgaGFuZGxlZC4NCj4gPg0KPiA+IEkgYWN0dWFsbHkgc3RhcnRlZCB0byBsb29rIGludG8g
dGhpcyBsYXN0IHdlZWsgYmVjYXVzZSBJIGNhbWUgdG8gYW4gaXNzdWUNCj4gY29tcGFyYWJsZSB0
byBTVkUgd2l0aCBwb2ludGVyIGF1dGhlbnRpY2F0aW9uLg0KPiA+IE1heWJlIHdlIHNob3VsZCBk
aXNjdXNzIHRoaXMgc3ViamVjdCBzZXBhcmF0ZWx5IGFzIGNsZWFyaW5nIFRJRDMgYml0IGluIEhD
Ug0KPiBhbmQgZW11bGF0aW5nIGFsbCBJRCByZWdpc3RlcnMgaXMgcG9zc2libGUNCj4gPiBidXQg
SSB3YW50IHRvIGNoZWNrIGZpcnN0IGlmIHRoaXMgY291bGQgaGF2ZSBiaWcgaW1wYWN0cyBvbiBw
ZXJmb3JtYW5jZXMNCj4gDQo+IEkgZG9uJ3QgZXhwZWN0IGFueSBwZXJmb3JtYW5jZSBkcm9wLiBJ
biBMaW51eCwgdGhleSB3aWxsIGNhY2hlIGFsbCB0aGUNCj4gdmFsdWVzIGFuZCB1c2UgYWx0ZXJu
YXRpdmUgdG8gYXZvaWQgcnVudGltZSBjaGVjay4NCj4gDQo+IEkgYWxzbyBkb24ndCBleHBlY3Qg
YW55IE9TIHRvIHVzZSB0aGVtIGF0IHJ1bnRpbWUgaW4gaG90cGF0aC4NCj4gDQoNCkkgdGhpbmsg
dGhpcyB3b3VsZCBub3QgYmUgYSBwcm9ibGVtLiBNb3N0IElEIGNoZWNrIG9wZXJhdGlvbnMgd291
bGQgYmUgZG9uZQ0KaW4gc3lzdGVtL2FwcGxpY2F0aW9uIGluaXRpYWxpemF0aW9uIHN0YWdlLg0K
DQo+ID4gYW5kIHNlZSBkaXNjdXNzIGhvdyB0byBkZXNpZ24gdGhpcyBhcyB0aGVyZQ0KPiA+IGNv
dWxkIGJlIGEgaHVnZSBhbW91bnQgb2YgY2FzZXMgZm9yIGV4YW1wbGUgaWYgd2Ugd2FudCB0byBh
bGxvdyBkaWZmZXJlbnQNCj4gcGFyYW1ldGVycyBmb3IgZGlmZmVyZW50IGRvbWFpbnMuDQo+IA0K
PiBJIHdvdWxkIHN1Z2dlc3QgdG8gZmlyc3QgY29uc2lkZXIgYSBzaW1wbGUgYXBwcm9hY2ggd2hl
cmUgd2UgZXhwb3NlIHRoZQ0KPiBzYW1lIHZpZXcgb2YgdGhlIElEIHJlZ2lzdGVycyB0byBhbGwg
dGhlIGd1ZXN0cyBidXQgaXQgaXMgc2FuaXRpemVkLg0KPiANCg0KQ2FuIEkgYXNrIHRoZSByZWFz
b24gd2h5IHdlIGRvbid0IGV4cG9zZSBuYXRpdmUgSUQgcmVnaXN0ZXJzIHRvIGd1ZXN0PyBJcyBp
dCBiZWNhdXNlDQp3ZSB3YW50IHRvIGF2b2lkIGd1ZXN0IHVzaW5nIHNvbWUgdW5hd2FyZSBmZWF0
dXJlcyBvZiBYZW4/DQoNCj4gV2UgY2FuIHRoZW4gZGlzY3VzcyB3aGV0aGVyIHdlIHdhbnQgdG8g
aGF2ZSBhIHBlci1ndWVzdCB2aWV3IG9mIHRoZSBJRA0KPiByZWdpc3RlcnMgYW5kIGhvdyB0byBj
b25maWd1cmUgaXQuDQo+IA0KPiBSZWdhcmRpbmcgdGhlIGltcGxlbWVudGF0aW9uLCBJIHBlcnNv
bmFsbHkgcXVpdGUgbGlrZSB0aGUgTGludXgNCj4gY3B1ZmVhdHVyZSBmcmFtZXdvcmsuIEl0IGlz
IHF1aXRlIHBvd2VyZnVsIGFuZCBJIGJlbGlldmUgd291bGQgc3VpdA0KPiBxdWl0ZSB3ZWxsIFhl
bi4NCj4gDQoNCkkgYWdyZWUgd2l0aCB5b3UuIEJ1dCBJIHRoaW5rIGlzIHF1aXRlIGh1Z2UsIGFu
ZCBvdXQgb2YgdGhpcyBwYXRjaCBzZXQncyBzY29wZS4NCldlIG5lZWQgYSBzZXBhcmF0ZSB0aHJl
YWQgdG8gZGlzY3VzcyB0aGUgZGVzaWduIGFuZCBpbXBsZW1lbnQuDQoNCg0KPiBDaGVlcnMsDQo+
IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

