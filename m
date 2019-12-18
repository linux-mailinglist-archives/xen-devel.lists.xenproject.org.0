Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00785124492
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 11:30:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihWXk-00033l-DP; Wed, 18 Dec 2019 10:27:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BItc=2I=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ihWXi-00033g-Bl
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 10:26:58 +0000
X-Inumbo-ID: eaa1ab4e-2180-11ea-9051-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.118]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eaa1ab4e-2180-11ea-9051-12813bfff9fa;
 Wed, 18 Dec 2019 10:26:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDXs5HVDo3CDQ1HZiQtiJ7ZybgMotjrSPPKGb7d5M2KUEFQlzCOc1pTqkO0KTsaZyiwBSGqt9EK8fOuqFbVNlmfIu9Chj1ex+tWJaiqD4TXsnUlatG+YRyln1hWUuhzTlRhJwXFg3Tp05ehERPuuSlL9/9RuY9F56R4Cp3ZsPid07wZk9ojqQOJb1TdTEgJZXXHmPS4bXHxoDs65+gI4mw5JNPZ6A7OVwz/Zwn0rHnfKqdk8DmASDeUZkzXKmFrpTSXf+ZvY9yJ3ySa4l2XNTNWOeYUkqiOprP84ZXKOJNP3EWiD9WZBkoevBXn59h3UIcHBnT+0/GAiFGTvBApKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcZdUf6PvZUS1rDCzAgPi14N+tHtihC2vJOjwKqrW6M=;
 b=BHN8+z05ZPGpscBOkl2mTJrGiQu/CUm1RjgzLImIYVWpMd1EOW81Q3clazW3qFLpSXcZUv8tUAH7fWDebP2+QLIkkPCU5EkaeuGqnVuKbbHlz4zgLZrotQi2LltBCC5fVyqiMKyB5HOzyLaE3YrPitIoJTyd9kM8ve1d3ILeZgr2GYYQoA6xvKZijAKVkTh0grtcJ4ZuoT516X6uX+7iJBlfbvYmjqqB08mWKmtmINLjwyiF5Wwi9xvavahz7VWEPaA8Ms4iTp5yJu11/S5LkrlYk1jHvDJZbG0hkJkxW8ibhzluIY09TVT4tVKMgkrUirZoQmKhvMTEcE9J1346sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcZdUf6PvZUS1rDCzAgPi14N+tHtihC2vJOjwKqrW6M=;
 b=BenCpBaI3nZ0ZGORO+gjQIzP7RrXfvpMM/8lQbEO/si3yQl8GXi1HeccPMAEKYpclfphfa6Mk2YTlEhVkkQFxEK4h56l6hwVR1u5JF8Qqtn5e/ND9Mc6gNTTIjd61NMzNBOWvoJzi2OaLuTw+eLqrnbXNH77Jd3oseI5WeupZiI=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5426.eurprd02.prod.outlook.com (20.179.39.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Wed, 18 Dec 2019 10:26:55 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 10:26:55 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V4 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVtYrbSmopSnkCGEy51VygQoGWEqe/sD6A
Date: Wed, 18 Dec 2019 10:26:55 +0000
Message-ID: <ded6905f-3df5-b991-3997-9f3d2aed5696@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <9012ab5f-4a3b-d469-6c03-20aa59773c2a@suse.com>
 <20fedb38-ac6e-772b-1859-eebd03c92989@bitdefender.com>
 <131f196c-e149-3cec-765b-be7bf36bf19b@bitdefender.com>
 <75e8fff3-79fc-1363-a212-fb33dc8776bc@suse.com>
In-Reply-To: <75e8fff3-79fc-1363-a212-fb33dc8776bc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0033.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::46) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b4d18b2-4051-4620-7363-08d783a4ce0b
x-ms-traffictypediagnostic: AM0PR02MB5426:|AM0PR02MB5426:|AM0PR02MB5426:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB5426E8E3DCEF7677A36D6143AB530@AM0PR02MB5426.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(396003)(376002)(136003)(39860400002)(189003)(199004)(54906003)(71200400001)(316002)(2906002)(36756003)(6512007)(86362001)(5660300002)(52116002)(8936002)(26005)(81166006)(81156014)(6506007)(8676002)(6916009)(31696002)(2616005)(53546011)(66446008)(64756008)(4326008)(66476007)(66556008)(478600001)(6486002)(66946007)(31686004)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5426;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lpc10Gu1RgY96jwLEBKTGtI26+/HrIaLJk3MA18vYA7qqI8YIWUw6TvhK+H/hySwVFXw9pDSrGSxOivPjvQ4pakPDUsJ/NOmBCWD0bwVJbLW98dcpHDsAyBxvcMIWb3JiPuzxtG8cTU0Amw2MVn/KaWEQdV84QNHbfzM7oIdss9RGxupvcNRJlclDKR0Bs6/FrILxMT/hBGhjDrOUe3G09BrPN+Y9i2aY00EObKzMCZQrcn09IJYZxkIRl46cB7Uj7cokmxOLU4enAaetSk2stpuMALo4Q0/6uNE2f7MIp5n0+UyeVg8Icd+XoMoE/0wbfRgoRfkat9iCXPZyIPrLcnDx4Xl5VjOq7JXdZt+D49UYVl1+DcSIYCvtHFkHRYJz5S4O0pCC5/xOrkgxs42XMlwEZMCW5h2dcYXbe6PnV1mdRJkQMjoqSQMhG2vU8oj
Content-ID: <3D033A4088EF7B41B0004491CF6346FB@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4d18b2-4051-4620-7363-08d783a4ce0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 10:26:55.2315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aig2erBL6w9LqPopbdJIvg7jR/3JbPxGw7+EZOvgaOfm7ymMw5RL1o+mlnLbJ2w6PsazMRZZr0DLTDQlRmRVbyFd/f1AfHjkTyLbPp0HanU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5426
Subject: Re: [Xen-devel] [PATCH V4 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE4LjEyLjIwMTkgMTI6MDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOC4xMi4y
MDE5IDEwOjU3LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDE4LjEyLjIw
MTkgMTA6MDYsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+IE9uIDE3LjEyLjIw
MTkgMTg6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxNy4xMi4yMDE5IDE2OjEyLCBB
bGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS9wMm0tZXB0LmMNCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMNCj4+Pj4+
IEBAIC0xMzUzLDcgKzEzNTMsOCBAQCB2b2lkIHNldHVwX2VwdF9kdW1wKHZvaWQpDQo+Pj4+PiAg
ICAgDQo+Pj4+PiAgICAgdm9pZCBwMm1faW5pdF9hbHRwMm1fZXB0KHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGludCBpKQ0KPj4+Pj4gICAgIHsNCj4+Pj4+IC0gICAgc3RydWN0IHAybV9kb21h
aW4gKnAybSA9IGQtPmFyY2guYWx0cDJtX3AybVtpXTsNCj4+Pj4+ICsgICAgc3RydWN0IHAybV9k
b21haW4gKnAybSA9DQo+Pj4+PiArICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlf
aW5kZXhfbm9zcGVjKGksIE1BWF9BTFRQMk0pXTsNCj4+Pj4+ICAgICAgICAgc3RydWN0IHAybV9k
b21haW4gKmhvc3RwMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7DQo+Pj4+PiAgICAgICAgIHN0cnVj
dCBlcHRfZGF0YSAqZXB0Ow0KPj4+Pj4gICAgIA0KPj4+Pj4gQEAgLTEzNjYsNyArMTM2Nyw3IEBA
IHZvaWQgcDJtX2luaXRfYWx0cDJtX2VwdChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQg
aSkNCj4+Pj4+ICAgICAgICAgcDJtLT5tYXhfbWFwcGVkX3BmbiA9IHAybS0+bWF4X3JlbWFwcGVk
X2dmbiA9IDA7DQo+Pj4+PiAgICAgICAgIGVwdCA9ICZwMm0tPmVwdDsNCj4+Pj4+ICAgICAgICAg
ZXB0LT5tZm4gPSBwYWdldGFibGVfZ2V0X3BmbihwMm1fZ2V0X3BhZ2V0YWJsZShwMm0pKTsNCj4+
Pj4+IC0gICAgZC0+YXJjaC5hbHRwMm1fZXB0cFtpXSA9IGVwdC0+ZXB0cDsNCj4+Pj4+ICsgICAg
ZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMoaSwgTUFYX0VQVFApXSA9IGVw
dC0+ZXB0cDsNCj4+Pj4+ICAgICB9DQo+Pj4+PiAgICAgDQo+Pj4+PiAgICAgdW5zaWduZWQgaW50
IHAybV9maW5kX2FsdHAybV9ieV9lcHRwKHN0cnVjdCBkb21haW4gKmQsIHVpbnQ2NF90IGVwdHAp
DQo+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9wMm0uYw0KPj4+Pj4gQEAgLTI0OTksNyArMjQ5OSw3IEBAIHN0YXRpYyB2b2lkIHAy
bV9yZXNldF9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCwNCj4+Pj4+
ICAgICAgICAgc3RydWN0IHAybV9kb21haW4gKnAybTsNCj4+Pj4+ICAgICANCj4+Pj4+ICAgICAg
ICAgQVNTRVJUKGlkeCA8IE1BWF9BTFRQMk0pOw0KPj4+Pj4gLSAgICBwMm0gPSBkLT5hcmNoLmFs
dHAybV9wMm1baWR4XTsNCj4+Pj4+ICsgICAgcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5
X2luZGV4X25vc3BlYyhpZHgsIE1BWF9BTFRQMk0pXTsNCj4+Pj4+ICAgICANCj4+Pj4+ICAgICAg
ICAgcDJtX2xvY2socDJtKTsNCj4+Pj4+ICAgICANCj4+Pj4+IEBAIC0yNTQwLDcgKzI1NDAsNyBA
QCBzdGF0aWMgaW50IHAybV9hY3RpdmF0ZV9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgaW50IGlkeCkNCj4+Pj4+ICAgICANCj4+Pj4+ICAgICAgICAgQVNTRVJUKGlkeCA8IE1BWF9B
TFRQMk0pOw0KPj4+Pj4gICAgIA0KPj4+Pj4gLSAgICBwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1b
aWR4XTsNCj4+Pj4+ICsgICAgcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25v
c3BlYyhpZHgsIE1BWF9BTFRQMk0pXTsNCj4+Pj4NCj4+Pj4gQWxsIG9mIHRoZSBhYm92ZSBoYXZl
IGEgbW9yZSBvciBsZXNzIHNpZ25pZmljYW50IGRpc2Nvbm5lY3QgYmV0d2Vlbg0KPj4+PiB0aGUg
Ym91bmRzIGNoZWNrIGFuZCB0aGUgdXNlIGFzIGFycmF5IGluZGV4LiBJIHRoaW5rIGl0IHdvdWxk
IGJlDQo+Pj4+IHF1aXRlIGhlbHBmdWwgaWYgdGhlc2UgY291bGQgbGl2ZSBjbG9zZSB0byBvbmUg
YW5vdGhlciwgc28gb25lIGNhbg0KPj4+PiAoc2VlIGZ1cnRoZXIgdXApIGVhc2lseSBwcm92ZSB0
aGF0IGJvdGggc3BlY2lmaWVkIGJvdW5kcyBhY3R1YWxseQ0KPj4+PiBtYXRjaCB1cC4NCj4+Pj4N
Cj4+Pg0KPj4+IFN1cmUsIEkgY2FuIG1vdmUgdGhlIGFycmF5IHVzZSBjbG9zZXIgdG9nZXRoZXIu
DQo+Pj4NCj4+DQo+PiBTb3JyeSB0byBjb21lIGJhY2sgb24gdGhpcyBidXQgSSB3YXMgbG9va2lu
ZyBpbiB0aGUgY29kZSBhbmQgSSBhbSBub3QNCj4+IHN1cmUgSSBmb2xsb3cgd2hlcmUgaXMgdGhl
IGRpc2Nvbm5lY3QuIElmIHlvdSBhcmUgdGFsa2luZyBhYm91dA0KPj4gcDJtX2luaXRfYWx0cDJt
X2VwdCgpIHRoZSBlcHRwIGNvZGUgd2lsbCBtb3ZlIHVwIGluIHBhdGNoIDMvNC4NCj4gDQo+IE15
IHJlbWFyayB3YXMgYWJvdXQgYWxsIGZvdXIgaHVua3MgbGVmdCBpbiBjb250ZXh0IChhbmQgdGhl
biBzdGlsbA0KPiBwb3NzaWJseSBleHRlbmRpbmcgdG8gb3RoZXIgb25lcykuIExldCdzIHRha2Ug
dGhlIGxhc3Qgb25lIGFib3ZlOg0KPiBwMm1fYWN0aXZhdGVfYWx0cDJtKCkgaGFzIHR3byBjYWxs
ZXJzLCBvbmUgb2Ygd2hpY2ggbG9vcHMgb3Zlcg0KPiBhbHRwMm0tcyAoYW5kIGhlbmNlIGRvZXNu
J3QgbmVlZCB0aGUgZ3VhcmQpLiBUaGUgb3RoZXIgb25lIGlzDQo+IHAybV9pbml0X2FsdHAybV9i
eV9pZCgpIHdoaWNoIGRvZXMgdGhlIHJhbmdlIGNoZWNrIEknbSB0YWxraW5nDQo+IGFib3V0IChB
U1NFUlQoKSBkb2Vzbid0IGNvdW50KSwgYW5kIHdoaWNoIHRoZXJlZm9yZSBpcyB0aGUgcGxhY2UN
Cj4gdG8gdXNlIGFycmF5X2luZGV4X25vc3BlYygpLiBPbmNlIHlvdSBsb29rIHRoZXJlIHlvdSds
bCBub3RpY2UNCj4gdGhhdCB0aGUgZnVuY3Rpb24gYWxzbyBoYXMgYW4gYXJyYXkgYWNjZXNzIGl0
c2VsZiB3aGljaCB5b3UndmUNCj4gbGVmdCB1bnRvdWNoZWQuDQo+IA0KDQpTbyBhZGQgYSAiaWR4
ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0FMVFAyTSkiIGluIHRoZSBjYWxsZXJzIA0K
d2hlcmUgdGhlcmUgaXMgYSBuZWVkIGZvciB0aGlzIGFuZCBkcm9wIGNoZWNrcyBpbiB0aGUgbG93
ZXIgZnVuY3Rpb25zLg0KDQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
