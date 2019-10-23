Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1CFE157E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 11:14:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNCgT-00080S-OG; Wed, 23 Oct 2019 09:12:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R3lc=YQ=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iNCgS-00080L-Er
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 09:12:00 +0000
X-Inumbo-ID: 2a1562e4-f575-11e9-9478-12813bfff9fa
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.96]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a1562e4-f575-11e9-9478-12813bfff9fa;
 Wed, 23 Oct 2019 09:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNGoXPddw/RhNrGUKrI3UiESz15vCKTQimZqrgvMe5S1DPfVo9CdvQyoj3h26JoWg5c8oK9dqx1T/vXk9GE/WUXNpfNDjSrf7KhDFP6FaY0DxnruCxJZYI8yLyjIaWsKXQAQXehMguZyfuJQgVBzA3CZzIYQwzKvzemjebyA7gFTISwXbBRqEoPUBzgTS1uXeMEkty95uEiFU4G08EQ5MMA8cyTPNQ8j7q39sVNBwZq7r3KXFzktAM4BJh3pUC7T4879eNzx5P7d7MainXQh3abOExOo6dkdt5fxNAqa3C0W41yTVMV6QTA2dEWoP3WkZpCu+RSH7gmC8jz85KAPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJ2dgEemwZciZ0dQYAULTeXPXDnGVAbaq1X7w8tYVzY=;
 b=lf5hIdzjvc9mreXXTgI5DDqncZTo0RApsMav7jUzEDJH0TUC7SH5+bL4fcvJl3rX/fgF7JYfeVa9RbAxQvckUac2WuZUetBKjoQLYUxkkoerV8eTsTQ3Y8uJ4+FmezwTRV7QIZjj0f90Zt6k1qpjVzUxEjdN+y7XefwTtAumNv/RslLwiOExQuZ/vaCSj1J0WhqQRoocq4V+vtB9I2VRE0u6K0SH6bBqPvNEQKjkZgIey2TnQJ3jJk/MDB1o4GM7FDHJZbE4FpAGRnmfUVREfWjSxHRUfyWUUfnNFu+NFkq/JGZQWkjwlsqG5ztr5/TdmZxQRDBG6PgktHAIs5McUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJ2dgEemwZciZ0dQYAULTeXPXDnGVAbaq1X7w8tYVzY=;
 b=MAp5d4oYsSw/ZFzfcRbGl1h96ojQP3Kp0alijX2/QX+kMlQRjRXMkaHLFyo6ywZkqFNZGlZISpQZXxqC+yJOQNVRX+0n2Cl9M1xJRAaxMPfrMse9S7d2knccPVZ4Bckwv2+ZlGj9w+vwKVYAIMYzbcvr1I2lKVCv9yw9/cMCkog=
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com (52.133.30.28) by
 AM6PR0202MB3365.eurprd02.prod.outlook.com (52.133.27.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Wed, 23 Oct 2019 09:11:54 +0000
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::11d5:8b36:702b:29a3]) by AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::11d5:8b36:702b:29a3%4]) with mapi id 15.20.2347.030; Wed, 23 Oct 2019
 09:11:54 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a new
 view and set sve bits
Thread-Index: AQHVYWYIdb/r2yKq9kGUPnrK2APIqqcaHHgAgAAZmgCATgryAA==
Date: Wed, 23 Oct 2019 09:11:54 +0000
Message-ID: <41a47abf-ec6f-1b19-8803-099b7d54b5bd@bitdefender.com>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
 <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
 <CABfawhmYs4SBJZ6u4b7+ymdrTtLzLC+VMQwHovSVDNtw3c7vHg@mail.gmail.com>
In-Reply-To: <CABfawhmYs4SBJZ6u4b7+ymdrTtLzLC+VMQwHovSVDNtw3c7vHg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0111.eurprd05.prod.outlook.com
 (2603:10a6:207:2::13) To AM6PR0202MB3413.eurprd02.prod.outlook.com
 (2603:10a6:209:1c::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d4a5c38-e349-413d-f9bc-08d757990c4b
x-ms-traffictypediagnostic: AM6PR0202MB3365:|AM6PR0202MB3365:|AM6PR0202MB3365:
x-microsoft-antispam-prvs: <AM6PR0202MB3365563EC97F6D6BE0E6945CAB6B0@AM6PR0202MB3365.eurprd02.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(478600001)(256004)(14444005)(25786009)(6246003)(446003)(71200400001)(476003)(5660300002)(2616005)(486006)(8676002)(81166006)(81156014)(11346002)(14454004)(66066001)(8936002)(71190400001)(64756008)(66446008)(66476007)(4326008)(3846002)(66556008)(66946007)(110136005)(316002)(229853002)(186003)(6116002)(52116002)(26005)(102836004)(99286004)(386003)(2906002)(6506007)(76176011)(53546011)(6512007)(305945005)(31696002)(7736002)(6486002)(86362001)(7416002)(54906003)(31686004)(36756003)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0202MB3365;
 H:AM6PR0202MB3413.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RDRMpmAgtpGidN02KlaXKI3CYz3J01n/zd0ABigu314LIczZFJHvUXQGSOxk/mQHbBjMCd9qOCQIEb9UH/t1iNZpe7iXvLN4NNaF6Svyke009dgPgkD2ajsWBb46vnbYFMAX5BanW8Ukn08ZrS2KEie30UcfUdeiQlQU40Ar1S2AO90R4xhdr2CbU+cx8DQkWgVvOkFPlJT5LWbtUYNvK66xAS1cFk9QS896KoG0CVwVf84yggiiu5+tTfi0T2viYLeB8hMDWQGifQoYkDnbwzlNPnlxupYDUYUPliANkeR9yfp2QknI6Cqh/U0Ily9UhWNmw8f81zznAoDhm/HdtOBBLEud3eFnOgmf5pocYnHBI3Con4GVlN63pAbJj+CNG1/FT2yoKW9X5IHTYcFvf5sXXnkfe9kL59SsFXxqJRku7QNKISjXihQK4iTBP7sj
Content-ID: <B767E12BB4EF0645A2E72D2FE9DB7D16@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4a5c38-e349-413d-f9bc-08d757990c4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 09:11:54.5442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rCnguR19iuaUaOcMLQldEoLnzdP3Md2XluWq5wLpZebDdAlgZAwUOpMe3dqNCk63M49ge1eoXgCnSsT+hl6QVQsshUhJqk3zmIdju/xX7B8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3365
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

DQoNCk9uIDAzLjA5LjIwMTkgMjA6MjQsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gT24gVHVl
LCBTZXAgMywgMjAxOSBhdCA5OjUzIEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gT24gMDIuMDkuMjAxOSAxMDoxMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJ
TEEgd3JvdGU6DQo+Pj4gQEAgLTEzNTUsNiArMTM1NSwyMyBAQCB2b2lkIHAybV9pbml0X2FsdHAy
bV9lcHQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGkpDQo+Pj4gICAgICAgZXB0ID0g
JnAybS0+ZXB0Ow0KPj4+ICAgICAgIGVwdC0+bWZuID0gcGFnZXRhYmxlX2dldF9wZm4ocDJtX2dl
dF9wYWdldGFibGUocDJtKSk7DQo+Pj4gICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFtpXSA9IGVw
dC0+ZXB0cDsNCj4+PiArDQo+Pj4gKyAgICBpZiAoIHNldF9zdmUgKQ0KPj4+ICsgICAgew0KPj4+
ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuID0gMCwgbWF4X2dwZm4gPSBkb21haW5fZ2V0X21h
eGltdW1fZ3BmbihkKTsNCj4+PiArDQo+Pj4gKyAgICAgICAgZm9yKCA7IGdmbiA8IG1heF9ncGZu
OyArK2dmbiApDQo+Pj4gKyAgICAgICAgew0KPj4+ICsgICAgICAgICAgICBtZm5fdCBtZm47DQo+
Pj4gKyAgICAgICAgICAgIHAybV9hY2Nlc3NfdCBhOw0KPj4+ICsgICAgICAgICAgICBwMm1fdHlw
ZV90IHQ7DQo+Pj4gKw0KPj4+ICsgICAgICAgICAgICBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRy
eShwMm0sIF9nZm4oZ2ZuKSwgJm1mbiwgJnQsICZhLA0KPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBBUDJNR0VUX3F1ZXJ5KTsNCj4+PiArICAgICAgICAgICAgcDJt
LT5zZXRfZW50cnkocDJtLCBfZ2ZuKGdmbiksIG1mbiwgUEFHRV9PUkRFUl80SywgdCwgYSwgdHJ1
ZSk7DQo+Pj4gKw0KPj4+ICsgICAgICAgIH0NCj4+PiArICAgIH0NCj4+PiAgIH0NCj4+DQo+PiBI
b3cgbG9uZyBpcyB0aGlzIGxvb3AgZ29pbmcgdG8gdGFrZSBmb3IgYSBodWdlIGd1ZXN0PyBJT1cg
aG93DQo+PiBjb21lIHRoZXJlJ3Mgbm8gcHJlZW1wdGlvbiBpbiBoZXJlLCBvciBzb21lIG90aGVy
IG1lY2hhbmlzbQ0KPj4gdG8gYm91bmQgZXhlY3V0aW9uIHRpbWU/DQo+IA0KPiBBbHNvLCBsb29r
cyB0byBtZSB5b3Ugc2hvdWxkIGNoZWNrIHdoZXRoZXIgdGhlIG1mbiBpcyB2YWxpZCBiZWZvcmUN
Cj4gY2FsbGluZyBwMm0tPnNldF9lbnRyeS4NCg0KSSBhZ3JlZSwgSSB3aWxsIGNoZWNrIHRoZSBt
Zm4gaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KPiANCj4+DQo+Pj4gLS0tIGEveGVuL2luY2x1ZGUv
cHVibGljL2h2bS9odm1fb3AuaA0KPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZt
X29wLmgNCj4+PiBAQCAtMjQ0LDYgKzI0NCw3IEBAIHN0cnVjdCB4ZW5faHZtX2FsdHAybV92aWV3
IHsNCj4+PiAgICAgICAvKiBDcmVhdGUgdmlldyBvbmx5OiBkZWZhdWx0IGFjY2VzcyB0eXBlDQo+
Pj4gICAgICAgICogTk9URTogY3VycmVudGx5IGlnbm9yZWQgKi8NCj4+PiAgICAgICB1aW50MTZf
dCBodm1tZW1fZGVmYXVsdF9hY2Nlc3M7IC8qIHhlbm1lbV9hY2Nlc3NfdCAqLw0KPj4+ICsgICAg
dWludDhfdCBzZXRfc3ZlOyAvKiBib29sIHZhbHVlICovDQo+Pj4gICB9Ow0KPj4NCj4+IFRoaXMg
aW50ZXJmYWNlIGlzLCBnaXZlbiB0aGUgcmlnaHQgY29uZmlndXJhdGlvbiwgYXZhaWxhYmxlIHRv
DQo+PiBndWVzdHMuIEhlbmNlIHlvdSBjYW4ndCBzaW1wbHkgYWRkIGEgZmllbGQgaGVyZS4gSnVz
dCBjb25zaWRlcg0KPj4gd2hhdCBoYXBwZW5zIGZvciBhbiBleGlzdGluZyBjYWxsZXIgd2hlbiB0
aGVyZSBpcyByYW5kb20gZGF0YQ0KPj4gaW4gdGhlIGZpZWxkIHlvdSBub3cgYXNzaWduIGEgbWVh
bmluZy4NCj4gDQo+IFBlcmhhcHMgaW5zdGVhZCBvZiBleHRlbmRpbmcgdGhlIEhWTU9QIGl0IHdv
dWxkIG1ha2UgbW9yZSBzZW5zZSB0bw0KPiBqdXN0IGFkZCBhIHhsIGNvbmZpZyBvcHRpb24gdGhh
dCBkZWZpbmVzIHRoZSAiZGVmYXVsdCIgc3ZlIGJpdCBmb3INCj4gYWx0cDJtIHZpZXdzIGluIHRo
ZSBkb21haW4/DQo+IA0KDQpBZGRpbmcgYSB4bCBjb25maWcgb3B0aW9uIHdpbGwgbm90IHdvcmsg
Zm9yIHN5c3RlbXMgdGhhdCBkbyB1c2UgeGwuIA0KVGhlcmUgaXMgYSBuZWVkIHRoYXQgdGhpcyB3
aWxsIHdvcmsgaW4gYWxsIGNhc2VzLg0KDQpUaGFua3MgYW5kIHNvcnJ5IGZvciByZXBseWluZyBz
byBsYXRlLA0KDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
