Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE16A8187
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 13:53:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5ToX-0000cP-9F; Wed, 04 Sep 2019 11:51:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MQog=W7=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1i5ToW-0000cK-8Z
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 11:51:04 +0000
X-Inumbo-ID: 45200756-cf0a-11e9-b299-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.106]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45200756-cf0a-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 11:51:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTir0uVXXnTjsjqSQ5A4b6T8FGJNjmLnhz2NUph/JYRbx9GVZK0AuE7OKq7S25yqDjPE21ejKHZDGfpeYHNBfxS3UY+7e+9/by5OB975VnJltOo21r8kCnbCVqnWqGSzcJJWQBmLJOJ82K7Mb30p7jvNwe0hn6k1pykhIVeEnJB9/qmrErXbDgoLyfTHu38sVOuOx78cTOGtYKrsg3FWO/5JPdGBdQpzQYvHvg5sdUW+bYeUU//QQqr1ajEW3vNylC1OTBWdbRA9GEwtVsbxnCM5m3B3NZqBuotR/lytgRqJWWjbncysWxLxsHbfwebU5dlaSNQZQO6uGvv5K21o9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiyEYHT9pCpNOfPZRxJKv/fou6QWRGB1LF1/tVyJVNQ=;
 b=S3DQ96tuREFMy1Pk7w4h41FLR1oXlTgIisRTEVy3ojJnEjX+bn5m6qSUeK7cII5HWFVjgPzYumWE2xnlIBQWqCUsPkEHzzWyLRr7lK0boCRcZNjuEhmpqM1M/RaTalFOYcwMJGEB0OeWGto6ejnN+x8UeMhWtjquxuO2VUxISl3U/RAnwOneSZtZYq7bayWyjgf5hB8AnCmD01Z4392/X8SiGJ+wlExhkoKG2EMI/oG72ym25R8Xx1gyXrtckTJedpSdfFNz9bppZg6sHb8s4I1dp6AMQZy8xE3NXzPTB45l2qod/pHnmc/v762R+ZRZ96mruzkOZAHF3c+rbjiiqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiyEYHT9pCpNOfPZRxJKv/fou6QWRGB1LF1/tVyJVNQ=;
 b=ElrQVAWRe+OzaDxv7TgNbS+AVVB0vgNgk77QP85NmbO6OR0AcnGYVBr73tpfovTxCUZouzM/BH7pK22FmeFL59MuVdm6WjKurVUteM66yYfzVLf+IrcCxbWlQ/Il1SlrEwYmfUBSz/+2KM941PBu/n+Jkx8lWtHCVvaHB+9wwf0=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5943.eurprd02.prod.outlook.com (10.141.175.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Wed, 4 Sep 2019 11:51:01 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74%4]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 11:51:01 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v1] x86/altp2m: Add hypercall to create a new view and
 set sve bits
Thread-Index: AQHVYWYIdb/r2yKq9kGUPnrK2APIqqcaHHgAgAFOwwA=
Date: Wed, 4 Sep 2019 11:51:01 +0000
Message-ID: <4ba2503f-20b2-3670-ba16-8b03e69f3937@bitdefender.com>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
 <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
In-Reply-To: <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0049.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::13) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6675cfa6-e96d-4dfa-4ae1-08d7312e2865
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5943; 
x-ms-traffictypediagnostic: AM7PR02MB5943:|AM7PR02MB5943:|AM7PR02MB5943:
x-microsoft-antispam-prvs: <AM7PR02MB59438D68B5939486B9A4D3A8ABB80@AM7PR02MB5943.eurprd02.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(376002)(346002)(39860400002)(366004)(396003)(136003)(189003)(199004)(476003)(2616005)(486006)(186003)(6246003)(14454004)(26005)(36756003)(66066001)(6512007)(446003)(31696002)(7416002)(102836004)(54906003)(53936002)(316002)(86362001)(11346002)(71190400001)(71200400001)(66476007)(66556008)(66946007)(66446008)(64756008)(5660300002)(256004)(14444005)(478600001)(3846002)(386003)(6506007)(99286004)(53546011)(76176011)(52116002)(6436002)(6916009)(2906002)(6486002)(7736002)(229853002)(8676002)(8936002)(4326008)(81156014)(305945005)(81166006)(31686004)(6116002)(25786009)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5943;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kblSgMQ0YF9Hzmq96HA9nxjyF56C3dZ84OpIzyqtwLj0CzWVwqLNWrJKmdDa/DADPCdWnrvDEZbE5+hE4cu1IU74oiaiBLEhU2703+C/2D3dCB2UjcXETrdlJikq80Xll6/oybikQkbZMKr82ufSFFCxLqJvQVfhT4W+MllPV+OfaK9W0+5LZN+H89n46DBByMIqj2RbdVjA/TrFuvWR4i1HiDu5xKAgJ5in4WeOZ+Mu02K2H+6Z+FXxRMAlxcJoWX5Enerv9CvgQV16FQIn9JXWz6MVmfgptnTeQS4uXRJMqRk27WX2JWs6r64X4zPotypaNhzm5mzAqzw5jY74txQLeDtiEVxaD+kCUxSZAckHwB8Yf4xiAhS6wvbmDENQ6I3dJ4NQgFLa7nUjmF+Biog/a3qfFSyvWeHPgRsaO+M=
Content-ID: <D28B833984667F459491FDD982C5845C@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6675cfa6-e96d-4dfa-4ae1-08d7312e2865
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 11:51:01.3288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mEOpov8r/uOp2/YcRK4YF/E7Yn+oxJtImqhdTSvpyKxf9ZlThMkSd3r8I/UUu8thg4bB/uh5YSrzycENTe4luwXfJG2DnlDyUen7cHE5FwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5943
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a
 new view and set sve bits
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDAzLjA5LjIwMTkgMTg6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4wOS4y
MDE5IDEwOjExLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEBAIC0xMzU1LDYg
KzEzNTUsMjMgQEAgdm9pZCBwMm1faW5pdF9hbHRwMm1fZXB0KHN0cnVjdCBkb21haW4gKmQsIHVu
c2lnbmVkIGludCBpKQ0KPj4gICAgICAgZXB0ID0gJnAybS0+ZXB0Ow0KPj4gICAgICAgZXB0LT5t
Zm4gPSBwYWdldGFibGVfZ2V0X3BmbihwMm1fZ2V0X3BhZ2V0YWJsZShwMm0pKTsNCj4+ICAgICAg
IGQtPmFyY2guYWx0cDJtX2VwdHBbaV0gPSBlcHQtPmVwdHA7DQo+PiArDQo+PiArICAgIGlmICgg
c2V0X3N2ZSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuID0gMCwg
bWF4X2dwZm4gPSBkb21haW5fZ2V0X21heGltdW1fZ3BmbihkKTsNCj4+ICsNCj4+ICsgICAgICAg
IGZvciggOyBnZm4gPCBtYXhfZ3BmbjsgKytnZm4gKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAg
ICAgICAgIG1mbl90IG1mbjsNCj4+ICsgICAgICAgICAgICBwMm1fYWNjZXNzX3QgYTsNCj4+ICsg
ICAgICAgICAgICBwMm1fdHlwZV90IHQ7DQo+PiArDQo+PiArICAgICAgICAgICAgYWx0cDJtX2dl
dF9lZmZlY3RpdmVfZW50cnkocDJtLCBfZ2ZuKGdmbiksICZtZm4sICZ0LCAmYSwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUDJNR0VUX3F1ZXJ5KTsNCj4+ICsg
ICAgICAgICAgICBwMm0tPnNldF9lbnRyeShwMm0sIF9nZm4oZ2ZuKSwgbWZuLCBQQUdFX09SREVS
XzRLLCB0LCBhLCB0cnVlKTsNCj4+ICsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPj4gICB9
DQo+IA0KPiBIb3cgbG9uZyBpcyB0aGlzIGxvb3AgZ29pbmcgdG8gdGFrZSBmb3IgYSBodWdlIGd1
ZXN0PyBJT1cgaG93DQo+IGNvbWUgdGhlcmUncyBubyBwcmVlbXB0aW9uIGluIGhlcmUsIG9yIHNv
bWUgb3RoZXIgbWVjaGFuaXNtDQo+IHRvIGJvdW5kIGV4ZWN1dGlvbiB0aW1lPw0KDQpCZWNhdXNl
IHRoaXMgaXMgZG9uZSBmb3IgdGhlIGluaXRpYWxpemF0aW9uIG9mIGEgbmV3IHZpZXcgYW5kIHRo
ZSBwMm0gaXMgDQpsb2NrZWQuDQoNCkFsZXgNCg0KPiANCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1
YmxpYy9odm0vaHZtX29wLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29w
LmgNCj4+IEBAIC0yNDQsNiArMjQ0LDcgQEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3ZpZXcgew0K
Pj4gICAgICAgLyogQ3JlYXRlIHZpZXcgb25seTogZGVmYXVsdCBhY2Nlc3MgdHlwZQ0KPj4gICAg
ICAgICogTk9URTogY3VycmVudGx5IGlnbm9yZWQgKi8NCj4+ICAgICAgIHVpbnQxNl90IGh2bW1l
bV9kZWZhdWx0X2FjY2VzczsgLyogeGVubWVtX2FjY2Vzc190ICovDQo+PiArICAgIHVpbnQ4X3Qg
c2V0X3N2ZTsgLyogYm9vbCB2YWx1ZSAqLw0KPj4gICB9Ow0KPiANCj4gVGhpcyBpbnRlcmZhY2Ug
aXMsIGdpdmVuIHRoZSByaWdodCBjb25maWd1cmF0aW9uLCBhdmFpbGFibGUgdG8NCj4gZ3Vlc3Rz
LiBIZW5jZSB5b3UgY2FuJ3Qgc2ltcGx5IGFkZCBhIGZpZWxkIGhlcmUuIEp1c3QgY29uc2lkZXIN
Cj4gd2hhdCBoYXBwZW5zIGZvciBhbiBleGlzdGluZyBjYWxsZXIgd2hlbiB0aGVyZSBpcyByYW5k
b20gZGF0YQ0KPiBpbiB0aGUgZmllbGQgeW91IG5vdyBhc3NpZ24gYSBtZWFuaW5nLg0KPiANCj4g
RnVydGhlcm1vcmUsIGFjY29yZGluZyB0byBjb21tb24gcHJhY3RpY2UgZWxzZXdoZXJlLCB0aGUg
bmV3DQo+IHRyYWlsaW5nIHBhZGRpbmcgZmllbGQgc2hvdWxkIGJlIG1hZGUgZXhwbGljaXQsIGFu
ZCBjaGVja2VkIHRvDQo+IGhvbGQgemVybyBvbiBpbnB1dC4NCj4gDQo+IEphbg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
