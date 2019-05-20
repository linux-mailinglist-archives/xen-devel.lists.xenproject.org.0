Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C9424353
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 00:02:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSqJl-0008WI-ID; Mon, 20 May 2019 21:59:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSqJj-0008WD-Ul
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 21:59:36 +0000
X-Inumbo-ID: 8c6369be-7b4a-11e9-a298-cbf58d9ef626
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c6369be-7b4a-11e9-a298-cbf58d9ef626;
 Mon, 20 May 2019 21:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSjHx9SY3KuW/HjP9+Bw4mWYWWH0pc8ncpES//2K80U=;
 b=FD268GP+1LKoSFFBnIl28VMbtKJiHLDamMmsieIMa/0TZpU0x7GlMhRPKV84/2ucNJvrIODKsq+kl78+l8zq45TeMBOcZdPjL/CAJjrbzmqyJweaamQOffIg1Z91+/5QqN4Hh1TZAu2EGyxrh/ybX2NIf0DjGJ0frmF02CyK/MY=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB4498.eurprd08.prod.outlook.com (20.179.33.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Mon, 20 May 2019 21:59:31 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 21:59:31 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs helpers name
Thread-Index: AQHVBbleI/E+c66c/k2S05mcqExj0KZjO/yAgAAV8ACAAAPygIABK2gAgAAnAoCAAAp3AIAP4DuAgAAQK4A=
Date: Mon, 20 May 2019 21:59:30 +0000
Message-ID: <471832b3-c328-2275-2abd-845371be819b@arm.com>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
 <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
 <cc1d2550-794c-842d-26db-178f614f81b3@arm.com>
 <4b1d9bf6-bf3b-a5ec-da06-534618bb34a8@arm.com>
 <alpine.DEB.2.21.1905101050260.25766@sstabellini-ThinkPad-T480s>
 <10c3ba27-c0df-a0d4-4033-530ec99291ac@arm.com>
 <alpine.DEB.2.21.1905201357570.16404@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1905201357570.16404@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::31) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d9dbc23-6fd7-4511-727f-08d6dd6e6f8d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4498; 
x-ms-traffictypediagnostic: AM0PR08MB4498:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB4498AC37F407E788153CA06C80060@AM0PR08MB4498.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(5660300002)(6486002)(99286004)(3846002)(72206003)(256004)(4744005)(76176011)(305945005)(14444005)(229853002)(14454004)(6506007)(386003)(53546011)(73956011)(66556008)(64756008)(6916009)(66946007)(66476007)(31686004)(66446008)(7736002)(6512007)(54906003)(66066001)(102836004)(52116002)(4326008)(6436002)(8676002)(446003)(186003)(478600001)(316002)(11346002)(36756003)(53936002)(2616005)(81166006)(68736007)(8936002)(71200400001)(26005)(6246003)(71190400001)(81156014)(86362001)(25786009)(486006)(6116002)(2906002)(476003)(31696002)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4498;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +uo/C9yh8S3cx2jbX257oORjYbIgjf9+rUNLfLjflQ3pjFzjrMkVUGtTsDyUFTn7FWSSkBrfp2kNHuRLoRKwNjyj5zkYFOsbJ2oH6ypl+pPd0ONQyQB03PAplQRXFowYqaoJF+kKWde+Y72udq3GNPseCWnV8mqpEgyIGxDV6YHBrFf5cqxGxt/eF0ne7ci4kcC/EjFLezx3PtPsKVjsjqL7Lj0KmKo1rCKgo9G5CNJSPCbLjfuFJzQfC/3x8C01k5SL7I8LFoUId2krQtaMnjEv1o3OoEy541H7X8y9XvXVpupkk/o2QwhDlBhTfOm4ksWCOHZzBbeHlWolK7peyC5VuVV14rQQXvu9HY7Y8/DNEvS6JqEAcGvx34KkgeEoYSo4Syz5AHY4JmL0ChWB1IngxPf8ShnOXHav8aF/MEI=
Content-ID: <443EAD24B6F089489D9990574F3D4E36@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9dbc23-6fd7-4511-727f-08d6dd6e6f8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 21:59:30.9744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4498
Subject: Re: [Xen-devel] [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIwLzA1LzIwMTkgMjI6MDEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24g
RnJpLCAxMCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gRmVlbCBmcmVlIHRvIHN1
Z2dlc3QgYW4gaW4tY29kZSBjb21tZW50IHNvIHdlIGNhbiBkaXNjdXNzIG9uIHRoZSB3b3J0aGlu
ZXNzLg0KPiANCj4gSSBzdWdnZXN0IHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmc6DQo+IA0K
PiAgIC8qDQo+ICAgICogRmx1c2ggYWxsIGh5cGVydmlzb3IgbWFwcGluZ3MgZnJvbSB0aGUgVExC
IG9mIHRoZSBsb2NhbCBwcm9jZXNzb3IuIE5vdGUNCj4gICAgKiB0aGF0IGluc3RydWN0aW9uIGNh
Y2hlIG1haW50ZW5hbmNlIG1pZ2h0IGFsc28gYmUgcmVxdWlyZWQgd2hlbiBzZWxmDQo+ICAgICog
bW9kaWZ5aW5nIFhlbiBjb2RlLCBzZWUgRDUtMjUyMiBpbiBBUk0gRERJIDA0ODdELmEgYW5kIEIz
LjExLjIgaW4gQVJNDQo+ICAgICogRERJIDA0MDZDLmMuDQo+ICAgICovDQoNClRoaXMgbG9va3Mg
cXVpdGUgb3V0LW9mLWNvbnRleHQsIHdoYXQgaXMgdGhlIHJlbGF0aW9uIGJldHdlZW4gDQpzZWxm
LW1vZGlmeWluZyBjb2RlIGFuZCBUTEIgZmx1c2g/DQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4g
R3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
