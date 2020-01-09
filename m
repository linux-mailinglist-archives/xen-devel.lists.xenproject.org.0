Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133A51353A5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 08:19:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipS3N-0008MY-3D; Thu, 09 Jan 2020 07:16:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LFIF=26=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1ipS3K-0008MT-OJ
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 07:16:22 +0000
X-Inumbo-ID: ef44ec84-32af-11ea-b96c-12813bfff9fa
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.64]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef44ec84-32af-11ea-b96c-12813bfff9fa;
 Thu, 09 Jan 2020 07:16:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ug6e7EU+AFWnHO+TGdA0sy0ZOeX2zu8oBK4CWnj6suq5NyKwn0ZYrZ4XlLE0Gd2SzmRMMZ1MpetwN2Eycgos+kq5k6jybifByOVA2HLuujfd8m0aZvaerPBVXU2x1jnjz6Q2qMxUZs0sCNRkp1g+paUhFExgFWtdVzGRRpD96ATiIkmpxN0m0PKE/qOJlivVMXP/i8KafxPZmFkJ43i31rX7qAMYOSTzd1CgZE1CEvXHsz40EjopXGdEIue3I/uPlcbxnmWMy6LGtryWBUM4auZuqqf5LtdO/7LkH49pXVwXuEzu7J0hx1KtTBgEWE/sNCOjCIe4BZDqeYxTFmEObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y028KifaICRZx+3w8F+dKjg6x21ZKhhGegYGnKpZnSs=;
 b=DXREEycV780P7eZC8l9J0F938Dc2A1Wgqbhvm8Ev04JjpZ0AqwLt6rkhCRzIYlPnFVa6lQEuh4uY35NPBAuBwqICtPIL9+ch9RMkGS88fPk6vX2am+plqd6Yrb7qq086o0eVwxvctFYDScFP82ie7KijH2cPDJVIm6/wyRjnL4ODtbcp87E9Nt2xQRHJBc2s6zJlQ269mQuNVsPiHCrIjhRbXNxzH8usOcAK1ATN8Xqf/uBf/KSYkqVcmQxBmdEXQW6oFPhu011BSEoVEU/U5chT1edsyecPa46xzvRGTt+lOuvGZV0gNmG288epJ8e4DhMmFLOKuJR/CC7E56to4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y028KifaICRZx+3w8F+dKjg6x21ZKhhGegYGnKpZnSs=;
 b=MpTbMBGbCzMNih0CMnCPjXwWwrK7sPHOg+G0DEMLbGM+0wZheMtIEJR2ygPblTHVTm8trhppCWJaiyuEO7QKsVlojgqhrLFYwREyeB7oLgLBgEw3Uerclzx91Rj4yhFIc8haD14JMNBMV+55VvEfkdwKF3O/5Lfyu/t+hXV/5Z8=
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com (20.177.41.82) by
 AM0PR03MB5827.eurprd03.prod.outlook.com (10.255.28.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 9 Jan 2020 07:16:19 +0000
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59]) by AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59%4]) with mapi id 15.20.2602.017; Thu, 9 Jan 2020
 07:16:19 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Santucco <santucco@mail.ru>
Thread-Topic: [Xen-devel] PV DRM doesn't work without auto_translated_physmap
 feature in Dom0
Thread-Index: AQHVxrywVTrv3eK/NkOfJsS91dUjcg==
Date: Thu, 9 Jan 2020 07:16:19 +0000
Message-ID: <37b9ee58-9fe6-30cd-cc26-383d13cfa5a5@epam.com>
References: <1578297407.255542354@f149.i.mail.ru>
 <9ead165f-440a-31b7-c587-c228b8692a7e@suse.com>
 <74664696-5e7e-8f01-e6c2-ca17f55d80e1@epam.com>
 <1578497907.395464209@f311.i.mail.ru>
In-Reply-To: <1578497907.395464209@f311.i.mail.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ad2a693-117b-4b27-9f54-08d794d3d2d9
x-ms-traffictypediagnostic: AM0PR03MB5827:
x-microsoft-antispam-prvs: <AM0PR03MB58273539B64F3B0D47C076B5E7390@AM0PR03MB5827.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(199004)(189003)(86362001)(76116006)(478600001)(31696002)(31686004)(66446008)(66476007)(66946007)(6506007)(55236004)(53546011)(64756008)(2616005)(66556008)(5660300002)(71200400001)(54906003)(4326008)(316002)(2906002)(8936002)(6486002)(186003)(966005)(6512007)(66574012)(8676002)(36756003)(81156014)(6916009)(81166006)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5827;
 H:AM0PR03MB4516.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cXDt4oZU2Cy/KmJjCetwiAX1rW434gjYdekCwcfa2TtKehvadw7PyJR5XK6G/eh7RCPeUuy9rMn+MCeuqtOQdaGn+JN6qC/FP1WvEGp27Ki5gMm632B79zqDKbRh8VkdcNQPoaV8aXNOMU4sedsszJr6HmPuH8Gb7MDA1bf6VVLiF5YuuAfH1aMn+XHSzZQy9bRMA/JeSwknQGzd7ZlTyu91zUwTeBstdz6JiQyGbEwCpMUp53XgM0HewlaF3Z+T6GITWFnpEdC2jOsyoJegydpC1LX0YE7xgW0khoywh+5f2jvbfhAOCLXXWgLZoZH+X+a8if7T5Fu64XPZHs8HIR9uV4r/tV38ZBHSWpQGhmjksSMmk4tjoS+efP+hMr11ZY1U6yHDakVxCIKtJkLzxf8zrgzXMj7PdovLnmzTadviO8GkygcocGZ1+iRNoCkAUOh+dTML9HrI37KHY2Uu8VfZEQyh00C8Me7ZLNh/qObeMAePEmeHgkv+86JjBhtnp4hylvbravneuT9Q2EoSxA==
x-ms-exchange-transport-forked: True
Content-ID: <0539D26130FF7A4D94C3CCAAA37638C8@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad2a693-117b-4b27-9f54-08d794d3d2d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 07:16:19.1772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c9qzJuhtbgnZLq3tf6PfAcTWxigndmBgUusmbWcLjVg1a4yg76PCkHMhUAvk+B9aj2ZLUVAWh6R9IERGxAe3PH8cNiK2ijuGW7nd/Z3MLG7kmL0hyEvBF6D6ZoyRG46v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5827
Subject: Re: [Xen-devel] PV DRM doesn't work without auto_translated_physmap
 feature in Dom0
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiAxLzgvMjAgNTozOCBQTSwgU2FudHVjY28gd3JvdGU6DQo+IFRoYW5rIHlvdSB2ZXJ5IG11
Y2ggZm9yIGFsbCB5b3VyIGFuc3dlcnMuDQo+DQo+ICAgICDQodGA0LXQtNCwLCA4INGP0L3QstCw
0YDRjyAyMDIwLCAxMDo1NCArMDM6MDAg0L7RgiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbw0KPiAg
ICAgPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tDQo+ICAgICA8L2NvbXBvc2U/VG89
b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+PjoNCj4gICAgIE9uIDEvNi8yMCAxMDoz
OCBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4gICAgID4gT24gMDYuMDEuMjAgMDg6NTYsIFNh
bnR1Y2NvIHdyb3RlOg0KPiAgICAgPj4gSGVsbG8sDQo+ICAgICA+Pg0KPiAgICAgPj4gSeKAmW0g
dHJ5aW5nIHRvIHVzZSB2ZGlzcGwgaW50ZXJmYWNlIGZyb20gUFYgT1MsIGl0IGRvZXNu4oCZdCB3
b3JrLg0KPiAgICAgPj4gQ29uZmlndXJhdGlvbiBkZXRhaWxzOg0KPiAgICAgPj4gwqDCoMKgwqAg
WGVuIDQuMTIuMQ0KPiAgICAgPj4gwqDCoMKgwqAgRG9tMDogTGludXggNC4yMC4xNy1nZW50b28g
IzEzIFNNUCBTYXQgRGVjIDI4IDExOjEyOjI0IE1TSw0KPiAgICAgMjAxOQ0KPiAgICAgPj4geDg2
XzY0IEludGVsKFIpIENlbGVyb24oUikgQ1BVIE4zMDUwIEAgMS42MEdIeiBHZW51aW5lSW50ZWwN
Cj4gICAgIEdOVS9MaW51eA0KPiAgICAgPj4gwqDCoMKgwqAgRG9tVTogeDg2wqBQbGFuOSwgUFYN
Cj4gICAgID4+IMKgwqDCoMKgIGRpc3BsX2JlIGFzIGEgYmFja2VuZCBmb3IgdmRpc3BsIGFuZCB2
a2INCj4gICAgID4+DQo+ICAgICA+PiB3aGVuIFZNIHN0YXJ0cywgZGlzcGxfYmUgcmVwb3J0cyBh
Ym91dCBhbiBlcnJvcjoNCj4gICAgID4+IGdudHRhYjogZXJyb3I6IGlvY3RsIERNQUJVRl9FWFBf
RlJPTV9SRUZTIGZhaWxlZDogSW52YWxpZCBhcmd1bWVudA0KPiAgICAgPj4gKGRpc3BsX2JlLmxv
ZzoyMjEpDQo+ICAgICA+Pg0KPiAgICAgPj4gcmVsYXRlZMKgRG9tMCBvdXRwdXQgaXM6DQo+ICAg
ICA+PiBbwqAgMTkxLjU3OTI3OF0gQ2Fubm90IHByb3ZpZGUgZG1hLWJ1ZjogdXNlX3B0ZW1vZGUg
MQ0KPiAgICAgPj4gKGRtZXNnLmNyZWF0ZS5sb2c6MTIzKQ0KPiAgICAgPg0KPiAgICAgPiBUaGlz
IHNlZW1zIHRvIGJlIGEgbGltaXRhdGlvbiBvZiB0aGUgeGVuIGRtYS1idWYgZHJpdmVyLiBJdCB3
YXMNCj4gICAgIHdyaXR0ZW4NCj4gICAgID4gZm9yIGJlaW5nIHVzZWQgb24gQVJNIGluaXRpYWxs
eSB3aGVyZSBQViBpcyBub3QgYXZhaWxhYmxlLg0KPiAgICAgVGhpcyBpcyB0cnVlIGFuZCB3ZSBu
ZXZlciB0cmllZC90YXJnZXRlZCBQViBkb21haW5zIHdpdGggdGhpcw0KPiAgICAgaW1wbGVtZW50
YXRpb24sDQo+ICAgICBzbyBpZiB0aGVyZSBpcyBhIG5lZWQgZm9yIHRoYXQgc29tZW9uZSBoYXMg
dG8gdGFrZSBhIGxvb2sgb24gdGhlDQo+ICAgICBwcm9wZXINCj4gICAgIGltcGxlbWVudGF0aW9u
IGZvciBQVuKApg0KPg0KPiBIYXZlIEkgZ290IHlvdXIgcmlnaHQgYW5kIHRoZXJlIGlzIG5vwqB0
aGUgcHJvcGVyIGltcGxlbWVudGF0aW9uIDotKT8NClRoZXJlIGlzIG5vDQo+DQo+ICAgICA+DQo+
ICAgICA+IENDLWluZyBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3aG8gaXMgdGhlIGF1dGhvciBv
ZiB0aGF0IGRyaXZlci4gSGUNCj4gICAgID4gc2hvdWxkIGJlIGFibGUgdG8gdGVsbCB1cyB3aGF0
IHdvdWxkIGJlIG5lZWRlZCB0byBlbmFibGUgUFYgZG9tMC4NCj4gICAgID4NCj4gICAgID4gRGVw
ZW5kaW5nIG9uIHlvdXIgdXNlIGNhc2UgaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gdXNlIFBWSCBk
b20wLCBidXQNCj4gICAgID4gc3VwcG9ydCBmb3IgdGhpcyBtb2RlIGlzICJleHBlcmltZW50YWwi
IG9ubHkgYW5kIHNvbWUgZmVhdHVyZXMNCj4gICAgIGFyZSBub3QNCj4gICAgID4geWV0IHdvcmtp
bmcuDQo+ICAgICA+DQo+ICAgICBXZWxsLCBvbmUgb2YgdGhlIHdvcmthcm91bmRzIHBvc3NpYmxl
IGlzIHRvIGRyb3AgemVyby1jb3B5aW5nIHVzZS1jYXNlDQo+ICAgICAodGhpcyBpcyB3aHkgZGlz
cGxheSBiYWNrZW5kIHRyaWVzIHRvIGNyZWF0ZSBkbXUtYnVmcyBmcm9tIGdyYW50cw0KPiAgICAg
cGFzc2VkDQo+ICAgICBieSB0aGUgZ3Vlc3QgZG9tYWluIGFuZCBmYWlscyBiZWNhdXNlIG9mICJD
YW5ub3QgcHJvdmlkZSBkbWEtYnVmOg0KPiAgICAgdXNlX3B0ZW1vZGUgMSIpDQo+ICAgICBTbywg
aW4gdGhpcyBjYXNlIGRpc3BsYXkgYmFja2VuZCB3aWxsIGRvIG1lbW9yeSBjb3B5aW5nIGZvciB0
aGUNCj4gICAgIGluY29taW5nDQo+ICAgICBmcmFtZXMNCj4gICAgIGFuZCB3b24ndCB0b3VjaCBE
TUFCVUZfRVhQX0ZST01fUkVGUyBpb2N0bC4NCj4gICAgIFRvIGRvIHNvIGp1c3QgZGlzYWJsZSB6
ZXJvLWNvcHlpbmcgd2hpbGUgYnVpbGRpbmcgdGhlIGJhY2tlbmQgWzFdDQo+DQo+IFRoYW5rcywg
SSBoYXZlIGp1c3TCoHRyaWVkwqB0aGUgd29ya2Fyb3VuZC7CoCBUaGUgYmFja2VuZCBoYXPCoGZh
aWxlZCANCj4gaW7CoGFuIG90aGVyIHBsYWNlwqBub3QgY29ycmVzcG9uZGluZyB3aXRoIGRtYV9i
dWYuDQo+IEFueXdhecKgaXQgaXMgZW5vdWdoIHRvIGNvbnRpbnVlwqBkZWJ1Z2dpbmfCoMKgbXkg
ZnJvbnRlbmTCoGltcGxlbWVudGF0aW9uLg0KPiBEbyB5b3XCoGtub3cgaG93IGJpZyBpcyBwZXJm
b3JtYW5jZSBwZW5hbHR5IGluIGNvbXBhcmlzb24gd2l0aCANCj4gdGhlwqB6ZXJvLWNvcHkgdmFy
aWFudD8NCldlbGwsIGl0IHNvbGVseSBkZXBlbmRzIG9uIHlvdXIgc2V0dXAsIHNvIEkgY2Fubm90
IHRlbGwgd2hhdA0Kd291bGQgdGhlIG51bWJlcnMgYmUgaW4geW91ciBjYXNlLiBDb21wYXJpbmcg
dG8gd2hhdCBJIGhhdmUgZG9lc24ndA0KbWFrZSBhbnkgc2Vuc2UgdG8gbWU6IG9uZSBzaG91bGQg
Y29tcGFyZSBhcHBsZXMgdG8gYXBwbGVzDQo+IERvZXMgaXQgbWFrZSBhwqBzZW5zZSBpZiBJIG1h
a2UgYcKgZGVkaWNhdGVkIEhWTSBkb21haW4gd2l0aCBsaW51eCBvbmx5IA0KPiBmb3IgdGhlIHB1
cnBvc2Ugb2bCoHZkaXNwbCBhbmQgdmtiZCBiYWNrZW5kcz/CoElzIHRoZXJlIGEgaG9wZcKgdGhp
cyANCj4gYXBwcm9hY2ggd2lsbCB3b3JrPw0KWW91IGNhbiB0cnkgaWYgdGhpcyBhcHByb2FjaCBm
aXRzIHlvdXIgZGVzaWduIGFuZCByZXF1aXJlbWVudHMNCj4NCj4gICAgID4NCj4gICAgID4gSnVl
cmdlbg0KPiAgICAgPg0KPiAgICAgWzFdDQo+ICAgICBodHRwczovL2dpdGh1Yi5jb20veGVuLXRy
b29wcy9kaXNwbF9iZS9ibG9iL21hc3Rlci9DTWFrZUxpc3RzLnR4dCNMMTINCj4gICAgIDxodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL3hlbi10cm9vcHMvZGlz
cGxfYmUvYmxvYi9tYXN0ZXIvQ01ha2VMaXN0cy50eHQqTDEyX187SXchIUdGXzI5ZGJjUUlVQlBB
IW16M2duMXdRTVgyRFhlTnVBVi0xX2RJN254RllZWk9nZFBpSk5TRk1lc0N6OWxBek9LbHdWUGxk
ZGJ4YmNMbVVPNDROT3kwVEZBJD4NCj4NCj4gQmVzdCByZWdhcmRzLA0KPiDCoCBBbGV4YW5kZXIg
U3ljaGV2DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
