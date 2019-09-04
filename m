Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92B5A857F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:17:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5W3a-0007b5-5O; Wed, 04 Sep 2019 14:14:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MQog=W7=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1i5W3Y-0007ar-JT
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:14:44 +0000
X-Inumbo-ID: 573f7d0e-cf1e-11e9-abb6-12813bfff9fa
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.120]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 573f7d0e-cf1e-11e9-abb6-12813bfff9fa;
 Wed, 04 Sep 2019 14:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oxiv6A30QuPGKaUXLLFYmIBOWWs1ZgT8RkOuFcGRDQjYi4hgkn0qVLhSqUyaMwJhK6vww+oLCS7eDWBv88bnyZSezDkk+LJO45CzYOWCKeqclfQ3XNo3P0aIb6q50FVFCzcBqZQGueu7V9IOpR6TlYTqePWViYg1Q5Lx44h74cL8StezBKTy1SmWauUYeSCTYbPYQyl3pQWSvWFwIAOHKOAwD8+QuumXGwt2sjlC3AN2TvkRD56DhGEGnTjm7Lt6rYUQUKE7LOcW1RRA89pyaMbS+09ejmTkepndeqvTxbUNg2VSlV82wCVJnfxUJZQum6EdRpl7dpQrTAJJ8GvynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEN4WXdDZUV6Gml5orqmAxJYQPvgs+CNCz+vNMzcUQI=;
 b=ipi3DLH/dixgncXBQ+CJyFd5uJX0L2BZnO9XsfK3PaGCTt0+eciAkjchrJrEJPNO6/fRiAHUxlO+SDrhgnNNMZz0JM2nyFy5uOFPmBVSnTueCCrUNz2XWYU61sp0MRx4jREwqFjV9hG4MyBfVxHW/hcOTY8fK+T94fntvL6OQRZ47fXQpr/FCXh7Nu2hEYgaXhIQSK5SjZ8VklNkZ1ZRSwO4sXFyNxV/e+PpCPJpdHdG1zfq+ZHhKQZzuDLRhH52SBlKIr12MiL7QdujA5lVIbz6z+xawIeO1P2EGYMX0WoCaLjYeMhoAHgtAxyXvRhVKN96l9aU89AlyQz/Q+fhWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEN4WXdDZUV6Gml5orqmAxJYQPvgs+CNCz+vNMzcUQI=;
 b=NDXT7rQLcCB0UV/mWxdPgVfYHzIdS4lUzBOIH6oRCgJ0csSy7A3mRNDFIdDyCbLxzxw3iuBbJ/h4ddmx+xWXcUfp/PQKwI+SA9aY49qjeSxXb45kr5D1imm8bYasplb4sFo+B47xGFqS8zdqZqXhORSI4KmYQLrN3pc9XeZsUbQ=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5831.eurprd02.prod.outlook.com (10.141.173.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 14:14:42 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74%4]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 14:14:42 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a new
 view and set sve bits
Thread-Index: AQHVYWYIdb/r2yKq9kGUPnrK2APIqqcaHHgAgAGBDgD//9RLAIAAQEuA///RKwCAABAZgA==
Date: Wed, 4 Sep 2019 14:14:42 +0000
Message-ID: <bcc9f20f-eb65-83c2-7cb7-2fdc2f361d46@bitdefender.com>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
 <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
 <4ba2503f-20b2-3670-ba16-8b03e69f3937@bitdefender.com>
 <813b92ae-0f4a-22ec-db30-6c43be246708@suse.com>
 <f7034f7b-95a2-474a-913b-99665f1ddc2d@bitdefender.com>
 <5d7ad447-49a7-de5d-8fef-4d548b4c484c@suse.com>
In-Reply-To: <5d7ad447-49a7-de5d-8fef-4d548b4c484c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::19) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62a1aa76-579e-4739-e1d3-08d731423ae6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5831; 
x-ms-traffictypediagnostic: AM7PR02MB5831:|AM7PR02MB5831:|AM7PR02MB5831:
x-microsoft-antispam-prvs: <AM7PR02MB58317E3D97B232324F196773ABB80@AM7PR02MB5831.eurprd02.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(396003)(366004)(346002)(376002)(189003)(199004)(51444003)(11346002)(71200400001)(71190400001)(486006)(476003)(5660300002)(446003)(2616005)(66946007)(7736002)(31686004)(316002)(99286004)(66446008)(52116002)(86362001)(64756008)(66476007)(31696002)(14444005)(8936002)(25786009)(4326008)(8676002)(81156014)(66556008)(66066001)(256004)(81166006)(54906003)(6246003)(2906002)(14454004)(6116002)(3846002)(36756003)(6916009)(478600001)(6436002)(229853002)(53936002)(102836004)(186003)(305945005)(76176011)(26005)(386003)(53546011)(7416002)(6506007)(6486002)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5831;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MWF+3/tb93GfbzxJcOgNj/3ZT2nuyIns/iw18lJjZj2mtqNNyQPYubqw8FVuyUqVZVaI1lqYcSWjgJmG0+sTNt6z9iDysIcA/uR+ZVcfLonSt3gGTAlvWOE1em5Ht197HTiRQT+ZSuFKZRSp6XDjBRee0TgVamPz6vmVtKoqdQPxeORSm4R/Yw6WgAXIIy1bFvmlKr/NLlSpwQWXt5xgIcP4sSU17pz5woXw9b3ay5zqfUBAC3VCm9MUD3bjnrwube6zA3jeHD2eYm7lNxe3YBexB2HZnuzP7LsCgvq6oNriZfZyZeYVfXrtAgLNUPpU4bL110jN0pzev7QpGaFWQYCi6eBa7OhVHtkFalTkWAZPf8W5t5pk53tHMs6VpoGJA8o5HC5ICwMpVGxvxsCWJdYqiolO7NgfIcsBoLMhlVs=
Content-ID: <2A07B8965B64EC458CAEFF068386F7AD@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a1aa76-579e-4739-e1d3-08d731423ae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 14:14:42.4048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5TLnnw1uKk3PYgQAfBx4eWbot8r6CDId/4STK/8PYSXIrSKjaeCT6N6PJmGsvkElEKJ3GBdFSn0x1880LQgCp30QdaikjbIfuoFmXlgso1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5831
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

DQoNCk9uIDA0LjA5LjIwMTkgMTY6MTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wOS4y
MDE5IDE1OjA0LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+DQo+Pg0KPj4gT24g
MDQuMDkuMjAxOSAxNToxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDQuMDkuMjAxOSAx
Mzo1MSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+DQo+Pj4+DQo+Pj4+IE9u
IDAzLjA5LjIwMTkgMTg6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMDIuMDkuMjAx
OSAxMDoxMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+Pj4gQEAgLTEzNTUs
NiArMTM1NSwyMyBAQCB2b2lkIHAybV9pbml0X2FsdHAybV9lcHQoc3RydWN0IGRvbWFpbiAqZCwg
dW5zaWduZWQgaW50IGkpDQo+Pj4+Pj4gICAgICAgICBlcHQgPSAmcDJtLT5lcHQ7DQo+Pj4+Pj4g
ICAgICAgICBlcHQtPm1mbiA9IHBhZ2V0YWJsZV9nZXRfcGZuKHAybV9nZXRfcGFnZXRhYmxlKHAy
bSkpOw0KPj4+Pj4+ICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFtpXSA9IGVwdC0+ZXB0cDsN
Cj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICBpZiAoIHNldF9zdmUgKQ0KPj4+Pj4+ICsgICAgew0KPj4+
Pj4+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuID0gMCwgbWF4X2dwZm4gPSBkb21haW5fZ2V0
X21heGltdW1fZ3BmbihkKTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICAgICAgZm9yKCA7IGdmbiA8
IG1heF9ncGZuOyArK2dmbiApDQo+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+ICsgICAgICAgICAg
ICBtZm5fdCBtZm47DQo+Pj4+Pj4gKyAgICAgICAgICAgIHAybV9hY2Nlc3NfdCBhOw0KPj4+Pj4+
ICsgICAgICAgICAgICBwMm1fdHlwZV90IHQ7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgICAgICAg
ICBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeShwMm0sIF9nZm4oZ2ZuKSwgJm1mbiwgJnQsICZh
LA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUDJNR0VU
X3F1ZXJ5KTsNCj4+Pj4+PiArICAgICAgICAgICAgcDJtLT5zZXRfZW50cnkocDJtLCBfZ2ZuKGdm
biksIG1mbiwgUEFHRV9PUkRFUl80SywgdCwgYSwgdHJ1ZSk7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsg
ICAgICAgIH0NCj4+Pj4+PiArICAgIH0NCj4+Pj4+PiAgICAgfQ0KPj4+Pj4NCj4+Pj4+IEhvdyBs
b25nIGlzIHRoaXMgbG9vcCBnb2luZyB0byB0YWtlIGZvciBhIGh1Z2UgZ3Vlc3Q/IElPVyBob3cN
Cj4+Pj4+IGNvbWUgdGhlcmUncyBubyBwcmVlbXB0aW9uIGluIGhlcmUsIG9yIHNvbWUgb3RoZXIg
bWVjaGFuaXNtDQo+Pj4+PiB0byBib3VuZCBleGVjdXRpb24gdGltZT8NCj4+Pj4NCj4+Pj4gQmVj
YXVzZSB0aGlzIGlzIGRvbmUgZm9yIHRoZSBpbml0aWFsaXphdGlvbiBvZiBhIG5ldyB2aWV3IGFu
ZCB0aGUgcDJtIGlzDQo+Pj4+IGxvY2tlZC4NCj4+Pg0KPj4+IFdlbGwsIHRoaXMgbWFrZXMgaGFu
ZGxpbmcgdGhpcyB0aGUgd2F5IHlvdSB3YW50IGl0IGNsb3NlIHRvDQo+Pj4gaW1wb3NzaWJsZSwg
YnV0IGlzIG5vdCBhbiBhcmd1bWVudCBhZ2FpbnN0IHRoZSBuZWVkIGZvciBwcmVlbXB0aW9uDQo+
Pj4gaGVyZS4gSnVzdCBsaWtlIGl0IGhhZCB0dXJuZWQgb3V0IHRvIGJlIHVucmVhc29uYWJsZSB0
bw0KPj4+IHByZWVtcHRpdmVseSBoYW5kbGUgb3RoZXIgUDJNIGFkanVzdG1lbnRzICh3aGljaCBp
cyB3aHkNCj4+PiBwMm0tZXB0LmM6cmVzb2x2ZV9taXNjb25maWcoKSBhbmQgcDJtLXB0LmM6ZG9f
cmVjYWxjKCkgZ290DQo+Pj4gaW50cm9kdWNlZCksIEknbSBhZnJhaWQgeW91J2xsIGhhdmUgdG8g
dXNlIHNvbWUgb3RoZXIgdGVjaG5pcXVlDQo+Pj4gaGVyZSAocG9zc2libHkgYnVpbGRpbmcgb24g
dG9wIG9mIHRoZSBtZW50aW9uZWQgZnVuY3Rpb25zKS4NCj4+Pg0KPj4NCj4+IEkgdGhpbmsgdGhh
dCB0aGUgbWVjaGFuaXNtIGZyb20gcDJtX3NldF9tZW1fYWNjZXNzX211bHRpKCkgY2FuIHN1aXQg
dGhpcw0KPj4gY2FzZSwgc3RhcnQgdGhlIGxvb3AsIHNldCAsaWYoaHlwZXJjYWxsX3ByZWVtcHRf
Y2hlY2soKSkgcmMgPQ0KPj4gbmV4dF91bnNldF9nZm47DQo+Pg0KPj4gQW5kIGZvciB0aGlzIHRv
IHdvcmsgaXQgc2hvdWxkIGhhdmUgYSBuZXcgInN0YXJ0X2dmbiIgcGFyYW1ldGVyIHNvIHRoZQ0K
Pj4gY2FsbGVyIGNhbiBpc3N1ZSBtdWx0aXBsZSBoeXBlcmNhbGxzIHVudGlsIGdmbiA9PSBtYXhf
Z2ZuLg0KPiANCj4gSG1tLCBwb3NzaWJsZS4gSSB0b29rIHlvdXIgcHJldmlvdXMgcmVwbHkgdG8g
bWVhbiB0aGF0IGl0IGlzDQo+IGltcG9ydGFudCBmb3IgdGhlIHAybSB0byBub3QgZ2V0IHVubG9j
a2VkIGluIHRoZSBtaWRkbGUgb2YgdGhpcw0KPiBwcm9jZXNzLiBJZiB0aGlzIHdhcyBhIHdyb25n
IHVuZGVyc3RhbmRpbmcgb2YgbWluZSwgdGhlbiB5ZXMsDQo+ICJjb252ZW50aW9uYWwiIHByZWVt
cHRpb24gbGlrZSB5b3Ugb3V0bGluZSBpdCBvdWdodCB0byB3b3JrLg0KPiANCg0KVGhlcmUgYXJl
IHR3byBwb3NzaWJsZSB3YXlzIHRvIHNvbHZlIHRoaXM6DQoxLiB0aGUgY29udmVudGlvbmFsIHBy
ZWVtcHRpb24gd2F5IGFuZCB3aXRoIHRoaXMgSSBkbyBub3QgcmV0dXJuIG9rIG9uIA0KdGhlIGlu
aXQgZnVuY3Rpb24gdW50aWwgdGhlIGZpbmFsIGdmbiBoYXMgdGhlIGJpdCBzZXQgKGNvZGUgd2ls
bCBoYXZlIHRvIA0KY2hhbmdlIHRvIGFjY29tbW9kYXRlIHRoaXMgbmV3IG9wdGlvbi9wcmVlbXB0
aW9uKS4NCg0KMi4gYXMgeW91IGRlc2NyaWJlZCBhbmQgd29yayB3aXRoIHAybS0+cmVjYWxjKCkg
KEkgd2lsbCBoYXZlIHRvIGNoZWNrIA0KdGhpcyBvdXQgdG8gaGF2ZSBhIGNvcnJlY3QgaWRlYSBv
ZiB3aGF0IGlzIHRvIGJlIGRvbmUpLg0KDQpXaGF0IGRvIHlvdSB0aGluayBpcyB0aGUgcHJlZmVy
cmVkIHdheSB0byBjb250aW51ZSB3aXRoIHRoaXM/DQoNClRoYW5rcywNCkFsZXgNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
