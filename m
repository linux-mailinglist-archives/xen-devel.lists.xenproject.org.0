Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A9111849C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:14:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecUr-0006ta-KC; Tue, 10 Dec 2019 10:12:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5HtB=2A=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1iecUp-0006tP-9j
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:11:59 +0000
X-Inumbo-ID: 7f9dccf2-1b35-11ea-8914-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.111]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f9dccf2-1b35-11ea-8914-12813bfff9fa;
 Tue, 10 Dec 2019 10:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoimojqFuFD5JYu7uETR4G+NqcAXZ7fLPqI8qSYMmH9KlP1m9shNa7H3aT1hiMow86yRu+dTuMu6hecru2OBQL+SB8Y503TWxEZOR/s+I2LxSnAydXp8k/a39lymJLgTzBS8Dh3CgeYZFbiCdCyHrlYz33LrtVob6K/e5ZmHMYmWRYKa/RrmwVhN4BJvRYWCrN0YPzaqSmmhik18OE3KImRNnBgFBrftGIqtmI7Ds27DYiBf8AibFO2/rJ23SqMPiA49JyWJJPz3ffE8ggqLBuY9MTDOt5BvVX4IB4LwH2AcpaOqf8KLjW7Q7PWqdUlmDM8eEN+OSeTD+G/SEEW34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKPpcaJu0V3vL3MSHlXLdXnTOy6kijPVhXpC/sOQsR8=;
 b=l/6f/N3iR4f/bnTbL6+CUnvgCECy63yyMrhE75hmjhfsQMKCMq9usQ4+G/eKTd8txWUQU9yzhMZ1ytMPIcd5lIXdbdVpVYCvEFuBfBBQotAYNmZnf8/1aqhqlo1DqMABAi+JlH7YZBv4kHsBtJyiv+J+7jIpyLc35oc26+0iPNRFS3No5DJiQxs/1iqXslmT2JPqGGDS/ZiprfTzL35X/fUXNGdFlDivI0Ql4An5wbCT+KlLx1keH0QnoweZy0xNqlHpjdW5/Xdo0mG48Dav5KRuC2o1nshY33EjdaCg5VSkBtmWHSudP/VxOVxvnwaIFhQrcc6mMZyXUQ0hxrqNrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKPpcaJu0V3vL3MSHlXLdXnTOy6kijPVhXpC/sOQsR8=;
 b=skqziPcxWpeSjYDc/xY93ZffyqMejxLjs5XLZ89OgKKNaQVuLz4ZIe1+YARdQArmDhXEkIzrrMab/9TfeNiZaP0fz15TXhP8sCBljIdrrWjnHaVRfMeU/LuY7hOJuiR0wkPSGMvPRBtBmLFqhdlyTBIUFM+0xfvnHfGD2urPi1Q=
Received: from AM0PR02MB4241.eurprd02.prod.outlook.com (20.177.109.15) by
 AM0PR02MB5268.eurprd02.prod.outlook.com (20.178.83.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Tue, 10 Dec 2019 10:11:56 +0000
Received: from AM0PR02MB4241.eurprd02.prod.outlook.com
 ([fe80::142d:c2ae:c5f8:d19b]) by AM0PR02MB4241.eurprd02.prod.outlook.com
 ([fe80::142d:c2ae:c5f8:d19b%6]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 10:11:56 +0000
From: Razvan COJOCARU <rcojocaru@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH] Remove myself as vm_event maintainer
Thread-Index: AQHVra9cTkT5LKWZc0i3jdPosKltVaezJR2AgAAEAYA=
Date: Tue, 10 Dec 2019 10:11:56 +0000
Message-ID: <25f34a47-3728-5640-b11b-20783f7b9e26@bitdefender.com>
References: <20191208100713.19559-1-rcojocaru@bitdefender.com>
 <99188936-c5d5-de5c-2f2b-650170944f2b@suse.com>
In-Reply-To: <99188936-c5d5-de5c-2f2b-650170944f2b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:205::39)
 To AM0PR02MB4241.eurprd02.prod.outlook.com
 (2603:10a6:208:db::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=rcojocaru@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 924cacb1-8440-4825-5cf8-08d77d5962f9
x-ms-traffictypediagnostic: AM0PR02MB5268:|AM0PR02MB5268:|AM0PR02MB5268:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB52685853B471478D2A0ADFF6AB5B0@AM0PR02MB5268.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(396003)(39860400002)(366004)(189003)(199004)(71200400001)(2616005)(31686004)(186003)(66556008)(8676002)(66476007)(71190400001)(316002)(64756008)(6512007)(26005)(478600001)(66946007)(8936002)(81156014)(81166006)(6486002)(4326008)(66446008)(2906002)(53546011)(6506007)(107886003)(86362001)(305945005)(31696002)(54906003)(52116002)(229853002)(4744005)(7416002)(6916009)(36756003)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5268;
 H:AM0PR02MB4241.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5nqVJ3/TxXki9TKKw94Ry/E7Ltj/22lwhmP/9u1eIOMweX+XSXbOYk8R+LrYZd5XyJvkhxw6ihH0iMWKfGEKlI0YiL6nkeq8lLyprDghb3h2p0bkirXAvcTP9vPNtZuqGwYDBhEZ2xkGvNZiERQlmdIvT+Us1FKQR2jEJKQoVjaBxH9n8pmOkRj2wc+UPUsUVvrNKqIRxvQnJiQhG6Z8LtSj4P4MWwM6XV8FyB/rOiviy+vyb+Fi3OQ3QZkUpb6EOWoGnHpbnEuLl2SasZVqeNAA9GVsRGnPB6E8GLNaBXWaXSzXo3dZBlATx7ad+dWfVdLGhw3TOJnm0kav40NZq22Su5mCYpFIYQpTX/IlwtGDPbCiSMUR8/3o8lF78YmX/6zTSTZCLQfNoLkJZsWV0x2oEcjAsXa/EH6uUsVa5za9Rz0DtdKi1T5CbyylU2Gs
Content-ID: <F897797DDBF4334B92E35FAE776CE3B7@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924cacb1-8440-4825-5cf8-08d77d5962f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 10:11:56.3534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MX4ZfUCnT5y2THgWK0B60wVBlhZqn4/TmK6rx+OzMgr/HTfiGim57NgEh8QGCqrTbyJNXxUKbJllV14hpal77jWtzCV/kdzMWyw6iZSPqj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5268
Subject: Re: [Xen-devel] [PATCH] Remove myself as vm_event maintainer
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "mdontu@bitdefender.com" <mdontu@bitdefender.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDEyLzEwLzE5IDExOjU3IEFNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMTIu
MjAxOSAxMTowNywgUmF6dmFuIENvam9jYXJ1IHdyb3RlOg0KPj4gLS0tDQo+PiAgIE1BSU5UQUlO
RVJTIHwgMSAtDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4+IGluZGV4IDljODI3YWQ3NTku
LjAxMmM4NDdlYmQgMTAwNjQ0DQo+PiAtLS0gYS9NQUlOVEFJTkVSUw0KPj4gKysrIGIvTUFJTlRB
SU5FUlMNCj4+IEBAIC00MjgsNyArNDI4LDYgQEAgTDoJeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+PiAgIEY6CXVubW9kaWZpZWRfZHJpdmVycy9saW51eC0yLjYvDQo+PiAgIA0KPj4g
ICBWTSBFVkVOVCwgTUVNIEFDQ0VTUyBhbmQgTU9OSVRPUg0KPj4gLU06CVJhenZhbiBDb2pvY2Fy
dSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4+ICAgTToJVGFtYXMgSyBMZW5neWVsIDx0
YW1hc0B0a2xlbmd5ZWwuY29tPg0KPj4gICBSOglBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJp
dGRlZmVuZGVyLmNvbT4NCj4+ICAgUjoJUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRl
ZmVuZGVyLmNvbT4NCj4gDQo+IE5vIG1hdHRlciB0aGUgY29udGVudHMsIEkgZ3Vlc3MgdGhpcyBz
dGlsbCBuZWVkcyBhbiBTLW8tYiBvZiB5b3Vycy4NCg0KUmUtc2VudCwgc29ycnkgZm9yIHRoZSBp
bmNvbnZlbmllbmNlLg0KDQoNClRoYW5rcywNClJhenZhbg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
