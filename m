Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA95A138F44
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 11:36:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqx1G-0007Ig-Iz; Mon, 13 Jan 2020 10:32:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4RDD=3C=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iqx1F-0007Ib-42
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 10:32:25 +0000
X-Inumbo-ID: fc56d426-35ef-11ea-b89f-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::71f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc56d426-35ef-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 10:32:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6M5fSMoo6SPzCdX63dt0Scel7K/s9+BBxjzXLXxc5j5Nhzs64wZg+AR0YEKrhKThIs5mTIOi0wOjyktMWf3pbOaOjQVAqf5fwWrkWgtXmAr2knBvwQlB1fg84yLuydIuNqkJs3zeqPx9LSzG61yx2gXphNx2IY02WHOi8EAO6abRu05Tu0Cd05rqz2NapFMHxbQaWycQTwLdtC9nEN61nT8QUzkNWcR+sOXcWVBhYRiAzYqe1Vi29siFxT0WdpEanKNCfa7eB8+IdK7f0eLjz13MJA2Dhh71Z5Hc4NsumPq/1NMi25poTjJtjZCsx5uIol7c4LixStHmnYpMbiOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOCi+kCgUpjGyNYkjzdExNJfeMKHt9wT8uNMjcM56z8=;
 b=OeD2G5YCXNHjlvplU/i095pQKlAK39f7h2bw6+lvMFT5fja+G/R82GPwtzxAR6dMfbbVgJ8bb7a4QDQEbmCNDqKPL9wQ/QtGpY7jaHkS3GBRu/poqwFnZRy+ETlajWQlIPw+IflZjA9OTDPGgMErJpa0rAqSPRQMfDBwrfG4Wa0rwhE+veK4uIAK9QC54CNzy9asHLS/E0wQuAqxchBAyyxk60nx0yF2rMfg2QDf61QYDXeUmA5Tn57oarZRLs9rp6zaven+B9ETuYpZwv/iXiBEfVAN8e6ywemguEFsoifH219FbgXPYDEivTzluLJyZCXCgjexI1zUPrr7EKlSPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOCi+kCgUpjGyNYkjzdExNJfeMKHt9wT8uNMjcM56z8=;
 b=Y7YgAGZ0EzNf23e0Ni875dq0tEQ4tyUhXxS1nkvRuIrHwTP+StHTt7ExQz+pmgifIKdBHiMFNyr9hel6R46J7+Xs63JBxagKCfuGiB72QetyRmZn8V0xzMzACBjHhON2bm7ZzKvdxHjpnEBGvD+KXw8Dk4157XCFaYFlFbhb6KI=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3016.eurprd02.prod.outlook.com (10.175.234.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.12; Mon, 13 Jan 2020 10:32:22 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 10:32:22 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM3PR07CA0142.eurprd07.prod.outlook.com (2603:10a6:207:8::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.11 via Frontend Transport; Mon, 13 Jan 2020 10:31:53 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH V7 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
Thread-Index: AQHVxi0eW7mND/zIzUWDdK2ePPvUVqfkF1AAgARVogA=
Date: Mon, 13 Jan 2020 10:32:22 +0000
Message-ID: <d283e08f-161d-5d22-ed02-5068eca0d61e@bitdefender.com>
References: <20200108140810.6528-1-aisaila@bitdefender.com>
 <20200108140810.6528-2-aisaila@bitdefender.com>
 <0a73cce3-1c10-dd4a-9380-aa3e9f8a061b@suse.com>
In-Reply-To: <0a73cce3-1c10-dd4a-9380-aa3e9f8a061b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0142.eurprd07.prod.outlook.com
 (2603:10a6:207:8::28) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 834df9ad-4893-4b75-c3fd-08d79813cf5f
x-ms-traffictypediagnostic: DB6PR02MB3016:|DB6PR02MB3016:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR02MB3016082FB623F638A3BFE7D5AB350@DB6PR02MB3016.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(81166006)(7416002)(36756003)(956004)(71200400001)(16526019)(186003)(54906003)(316002)(16576012)(52116002)(6486002)(2906002)(53546011)(26005)(81156014)(8676002)(6916009)(2616005)(6666004)(66556008)(64756008)(66446008)(66476007)(66946007)(5660300002)(86362001)(31696002)(31686004)(8936002)(4326008)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3016;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zW+kFvpcNfpiYdi9umOcDAe+l4LSgNy6t+fy02YHxU1Yh7fzzwk29oz4b/c2BhgzQUc8TJKvuCd0jQQSro5PeVoXBEKIy7wK3bwmHIfwd/bnxojGkCs4tecL1XhksVt7H0uX6XLkRqEpBPT9mLN14NEZdgy2oJjF5ZHp51cBoLE8nFZ4C39QTe5UW6ep1J3/cEPwW69VNs+R+LZLtWkxtzHKB/kadzYMPWB9eTmxsF+ZxtLK21WVAnaeXHl/MpRMCzlWD3inj9YhJrov1nLrU0xcP6o7jlNGgvc4uqa5kX9dV1L+d0Wn4Lssp+67mLccijJ1ft68PVG55lrOgL7z6fkp2GzW9M+PT1lFmkoh0EzAhoUG/eCxe1xTtWG9h2kwuaROWMgA5nxoh894zqRIML9Sbx+VZ1VVb2Monru1DeyipW2EQxR4Gxy2F5akHLW5
Content-ID: <F384353A682B77449660954DB18ECEC4@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 834df9ad-4893-4b75-c3fd-08d79813cf5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 10:32:22.1515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VT8jf4pd0maDH2XppL2Po+7iaE3nOAeOR59pCl/K4m6xlZ21jLiBKOet9C/CBkQD00klSF8u4v4C6NZC/QN0I01joX+L226vsVav0y26Qy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3016
Subject: Re: [Xen-devel] [PATCH V7 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDEwLjAxLjIwMjAgMTg6MjAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4wMS4y
MDIwIDE1OjA4LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEJ5IGRlZmF1bHQg
dGhlIHN2ZSBiaXRzIGFyZSBub3Qgc2V0Lg0KPj4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IGh5cGVy
Y2FsbCwgeGNfYWx0cDJtX3NldF9zdXByZXNzX3ZlX211bHRpKCksDQo+PiB0byBzZXQgYSByYW5n
ZSBvZiBzdmUgYml0cy4NCj4+IFRoZSBjb3JlIGZ1bmN0aW9uLCBwMm1fc2V0X3N1cHByZXNzX3Zl
X211bHRpKCksIGRvZXMgbm90IGJyZWFrIGluIGNhc2UNCj4+IG9mIGEgZXJyb3IgYW5kIGl0IGlz
IGRvaW5nIGEgYmVzdCBlZmZvcnQgZm9yIHNldHRpbmcgdGhlIGJpdHMgaW4gdGhlDQo+PiBnaXZl
biByYW5nZS4gQSBjaGVjayBmb3IgY29udGludWF0aW9uIGlzIG1hZGUgaW4gb3JkZXIgdG8gaGF2
ZQ0KPj4gcHJlZW1wdGlvbiBvbiBsYXJnZSByYW5nZXMuDQo+PiBUaGUgZ2ZuIG9mIHRoZSBmaXJz
dCBlcnJvciBpcyBzdG9yZWQgaW4NCj4+IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211bHRp
LmZpcnN0X2Vycm9yIGFuZCB0aGUgZXJyb3IgY29kZSBpcw0KPj4gc3RvcmVkIGluIHhlbl9odm1f
YWx0cDJtX3N1cHByZXNzX3ZlX211bHRpLmZpcnN0X2Vycm9yX2NvZGUuDQo+PiBJZiBubyBlcnJv
ciBvY2N1cnJlZCB0aGUgdmFsdWVzIHdpbGwgYmUgMC4NCj4gDQo+IFRoZXNlIGxhc3QgdHdvIHNl
bnRlbmNlcyBtdXN0IGhhdmUgYmVlbiBzdGFsZSBmb3IgYSB3aGlsZS4gSU9XIC4uLg0KDQpJIGp1
c3Qgc2F3IHRoYXQgbm93LCB5ZXMgeW91IGFyZSByaWdodCwgZnJvbSB3aGVuIEkgY2hhbmdlZCB0
aGUgZmllbGQgbmFtZXMuDQoNCj4gDQo+PiBDaGFuZ2VzIHNpbmNlIFY2Og0KPj4gCS0gRml4IGNv
bW1pdCBtZXNzYWdlDQo+IA0KPiAuLi4gaGFzIHRoaXMgcmVhbGx5IGhhcHBlbmVkPw0KDQpUaGlz
IHdhcyBkb25lIGZvciB0aGUgImJyYWVrIiB0eXBvIGFuZCBmb3IgbGFyZ2UvYmlnIHJhbmdlcyBi
dXQgSSB3aWxsIA0KZml4IHRoZSBmaWVsZCBuYW1lcyBhcyB3ZWxsLCB0aGFua3MgZm9yIHBvaW50
aW5nIHRoYXQgb3V0Lg0KDQo+IA0KPj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jDQo+PiAr
KysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4+IEBAIC0zMDMwLDQ1ICszMDMwLDg3IEBAIG91
dDoNCj4+ICAgICovDQo+PiAgIGludCBwMm1fc2V0X3N1cHByZXNzX3ZlKHN0cnVjdCBkb21haW4g
KmQsIGdmbl90IGdmbiwgYm9vbCBzdXBwcmVzc192ZSwNCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGFsdHAybV9pZHgpDQo+PiArew0KPj4gKyAgICBpbnQgcmM7DQo+
PiArICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9tdWx0aSBzdmUgPSB7MH07
DQo+PiArDQo+PiArICAgIHN2ZS52aWV3ID0gYWx0cDJtX2lkeDsNCj4+ICsgICAgc3ZlLnN1cHBy
ZXNzX3ZlID0gc3VwcHJlc3NfdmU7DQo+PiArICAgIHN2ZS5maXJzdF9nZm4gPSBnZm5feChnZm4p
Ow0KPj4gKyAgICBzdmUubGFzdF9nZm4gPSBnZm5feChnZm4pOw0KPiANCj4gQ2FuJ3QgYWxsIG9m
IHRoZXNlIG1vdmUgaW50byB0aGUgaW5pdGlhbGl6ZXIsIGluc3RlYWQgb2YgdGhlDQo+IHNvbWV3
aGF0IG9kZCAwPw0KDQpTdXJlLCBpdCdzIG5vIHRyb3VibGUuDQoNCj4gDQo+PiArICAgIGlmICgg
IShyYyA9IHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoZCwgJnN2ZSkpICYmIHN2ZS5maXJzdF9l
cnJvciApDQo+PiArICAgICAgICByYyA9IHN2ZS5maXJzdF9lcnJvcjsNCj4gDQo+IFdoeSB0aGUg
cmlnaHQgc2lkZSBvZiB0aGUgJiYgPw0KDQpUaGlzIGlzIGludGVuZGVkIHRvIGhhdmUgcDJtX3Nl
dF9zdXBwcmVzc192ZSgpIGNhbGwgDQpwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKCkuIFNvIGhl
cmUgZmlyc3QgSSBjYWxsIHRoZSBfbXVsdGkgdmVyc2lvbiBhbmQgDQp0aGUgY2hlY2sgaWYgdGhl
cmUgd2FzIGFueSBlcnJvciBmcm9tIHRoZSBzZXQvZ2V0ICh0aGF0IGlzIHdoYXQgDQpwMm1fc2V0
X3N1cHByZXNzX3ZlIGRpZCBiZWZvcmUpLiBJIGRvbid0IGtub3cgd2h5IGdpdCBtYWRlIHRoZSBw
YXRjaCBzbyANCnVnbHkuDQoNCj4gDQo+PiArLyoNCj4+ICsgKiBTZXQvY2xlYXIgdGhlICNWRSBz
dXBwcmVzcyBiaXQgZm9yIG11bHRpcGxlIHBhZ2VzLiAgT25seSBhdmFpbGFibGUgb24gVk1YLg0K
Pj4gKyAqLw0KPj4gK2ludCBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKHN0cnVjdCBkb21haW4g
KmQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0
cDJtX3N1cHByZXNzX3ZlX211bHRpICpzdmUpDQo+PiAgIHsNCj4+ICAgICAgIHN0cnVjdCBwMm1f
ZG9tYWluICpob3N0X3AybSA9IHAybV9nZXRfaG9zdHAybShkKTsNCj4+ICAgICAgIHN0cnVjdCBw
Mm1fZG9tYWluICphcDJtID0gTlVMTDsNCj4+IC0gICAgc3RydWN0IHAybV9kb21haW4gKnAybTsN
Cj4+IC0gICAgbWZuX3QgbWZuOw0KPj4gLSAgICBwMm1fYWNjZXNzX3QgYTsNCj4+IC0gICAgcDJt
X3R5cGVfdCB0Ow0KPj4gLSAgICBpbnQgcmM7DQo+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpw
Mm0gPSBob3N0X3AybTsNCj4+ICsgICAgdWludDY0X3Qgc3RhcnQgPSBzdmUtPmZpcnN0X2dmbjsN
Cj4+ICsgICAgaW50IHJjID0gMDsNCj4+ICAgDQo+PiAtICAgIGlmICggYWx0cDJtX2lkeCA+IDAg
KQ0KPj4gKyAgICBpZiAoIHN2ZS0+dmlldyA+IDAgKQ0KPj4gICAgICAgew0KPj4gLSAgICAgICAg
aWYgKCBhbHRwMm1faWR4ID49IG1pbihBUlJBWV9TSVpFKGQtPmFyY2guYWx0cDJtX3AybSksIE1B
WF9FUFRQKSB8fA0KPj4gLSAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FycmF5X2lu
ZGV4X25vc3BlYyhhbHRwMm1faWR4LCBNQVhfRVBUUCldID09DQo+PiArICAgICAgICBpZiAoIHN2
ZS0+dmlldyA+PSBtaW4oQVJSQVlfU0laRShkLT5hcmNoLmFsdHAybV9wMm0pLCBNQVhfRVBUUCkg
fHwNCj4+ICsgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3Nw
ZWMoc3ZlLT52aWV3LCBNQVhfRVBUUCldID09DQo+PiAgICAgICAgICAgICAgICBtZm5feChJTlZB
TElEX01GTikgKQ0KPj4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICAgDQo+PiAt
ICAgICAgICBwMm0gPSBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3Bl
YyhhbHRwMm1faWR4LA0KPj4gKyAgICAgICAgcDJtID0gYXAybSA9IGQtPmFyY2guYWx0cDJtX3Ay
bVthcnJheV9pbmRleF9ub3NwZWMoc3ZlLT52aWV3LA0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQVJSQVlfU0laRShkLT5hcmNoLmFsdHAybV9wMm0pKV07DQo+
PiAgICAgICB9DQo+PiAtICAgIGVsc2UNCj4+IC0gICAgICAgIHAybSA9IGhvc3RfcDJtOw0KPj4g
ICANCj4+IC0gICAgZ2ZuX2xvY2soaG9zdF9wMm0sIGdmbiwgMCk7DQo+PiArICAgIHAybV9sb2Nr
KGhvc3RfcDJtKTsNCj4+ICAgDQo+PiAgICAgICBpZiAoIGFwMm0gKQ0KPj4gICAgICAgICAgIHAy
bV9sb2NrKGFwMm0pOw0KPj4gICANCj4+IC0gICAgcmMgPSBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9l
bnRyeShwMm0sIGdmbiwgJm1mbiwgJnQsICZhLCBBUDJNR0VUX3F1ZXJ5KTsNCj4+ICsgICAgd2hp
bGUgKCBzdmUtPmxhc3RfZ2ZuID49IHN0YXJ0ICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcDJt
X2FjY2Vzc190IGE7DQo+PiArICAgICAgICBwMm1fdHlwZV90IHQ7DQo+PiArICAgICAgICBtZm5f
dCBtZm47DQo+PiArICAgICAgICBpbnQgZXJyID0gMDsNCj4+ICAgDQo+PiAtICAgIGlmICggcmMg
KQ0KPj4gLSAgICAgICAgZ290byBvdXQ7DQo+PiArICAgICAgICBpZiAoIChlcnIgPSBhbHRwMm1f
Z2V0X2VmZmVjdGl2ZV9lbnRyeShwMm0sIF9nZm4oc3RhcnQpLCAmbWZuLCAmdCwgJmEsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUDJNR0VUX3F1
ZXJ5KSkgJiYNCj4+ICsgICAgICAgICAgICAgIXN2ZS0+Zmlyc3RfZXJyb3IgKQ0KPj4gKyAgICAg
ICAgew0KPj4gKyAgICAgICAgICAgIHN2ZS0+Zmlyc3RfZXJyb3JfZ2ZuID0gc3RhcnQ7IC8qIFNh
dmUgdGhlIGdmbiBvZiB0aGUgZmlyc3QgZXJyb3IgKi8NCj4+ICsgICAgICAgICAgICBzdmUtPmZp
cnN0X2Vycm9yID0gZXJyOyAvKiBTYXZlIHRoZSBmaXJzdCBlcnJvciBjb2RlICovDQo+PiArICAg
ICAgICB9DQo+PiAgIA0KPj4gLSAgICByYyA9IHAybS0+c2V0X2VudHJ5KHAybSwgZ2ZuLCBtZm4s
IFBBR0VfT1JERVJfNEssIHQsIGEsIHN1cHByZXNzX3ZlKTsNCj4+ICsgICAgICAgIGlmICggIWVy
ciAmJiAoZXJyID0gcDJtLT5zZXRfZW50cnkocDJtLCBfZ2ZuKHN0YXJ0KSwgbWZuLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX09SREVSXzRLLCB0
LCBhLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdmUt
PnN1cHByZXNzX3ZlKSkgJiYNCj4+ICsgICAgICAgICAgICAgIXN2ZS0+Zmlyc3RfZXJyb3IgKQ0K
Pj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHN2ZS0+Zmlyc3RfZXJyb3JfZ2ZuID0gc3Rh
cnQ7IC8qIFNhdmUgdGhlIGdmbiBvZiB0aGUgZmlyc3QgZXJyb3IgKi8NCj4+ICsgICAgICAgICAg
ICBzdmUtPmZpcnN0X2Vycm9yID0gZXJyOyAvKiBTYXZlIHRoZSBmaXJzdCBlcnJvciBjb2RlICov
DQo+PiArICAgICAgICB9DQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGhlbHAgcmVhZGFiaWxpdHkg
aWYgeW91IGRpZG4ndCBkbyB0aGlzIGVycm9yDQo+IHNhdmluZyB0d2ljZS4NCj4gDQoNCg0KR2Vv
cmdlIHJlcXVlc3RlZCB0aGlzIGFzIHdlbGwgYXMgaGF2aW5nIHRoZSBzaW5nbGUgdmVyc2lvbiBj
YWxsIHRoZSANCl9tdWx0aSB2ZXJzaW9uLg0KDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
