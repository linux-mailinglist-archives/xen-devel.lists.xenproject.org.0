Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CD6A772
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 13:28:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnLaZ-0004Uw-3l; Tue, 16 Jul 2019 11:25:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnLaX-0004Ur-Cv
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 11:25:41 +0000
X-Inumbo-ID: 6fe77fce-a7bc-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6fe77fce-a7bc-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 11:25:40 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 11:25:39 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 11:25:21 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 11:25:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvnaPns0qdDE3ORGsEni5vZB9TNWsRH6w8/1zPdWdYOe0yBynhLiekwK05islGL5LSs+Sf5Ge1ZEs06Uq6K+owoY+Wid16xypcw2rgD6wrdAmVS9H0gdM5xCdULcX9mXx1Kq6iMAWyvTpwffK+SfgCeZtX3zoHw6MQIM32JU1cfpAvaLA7d9WmKt4LUp9dVf0maRZsIiicWzlli4OyLmZHOYpGIdTztSMEoukkzIh+IuIQa0qGErocNSe4jET8mIFy62oRetMijtvu3fsSAwxnIpseiy8vnWy+YWVlXt5cVjE4qjtNV/xPOw21V21ypUOQaDGb4FvYuWDfVDr880Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9y8FRaeNGQyONBqoPFGgkXNtsDjahBP9mHbSVUj5R8=;
 b=g812yJ81KD3xDwdBY/VIDx5ILfzWm1ADbf0deACtxofUdvqwpIbDqboJamt2VjZuweiT9eb8oGt6j6BO8/YlcpgUPVdpVvwnOnI7snQYgoAWmXbIs1U9U6cfNdIq1xb/t/P81LBckQ64ZP2UA8bBp7ad9kslmmUVbFm/Lii2B1wg/kMKSS0qkaaf8ikVtTnJLd0PnKaxH14vDs5Rqob12WiXokew10P/mC1KcmmCs8LUID0EWYsl23ACxKu97QFrzQb7j7/+QNqp3ejzqoFeeB9gw0i0gAw9HgPBeGX0mbLV5hpg5LsaULx7QGKLxAoV4ZgquEXkhMZke4BnuGXp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2826.namprd18.prod.outlook.com (20.179.51.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 11:25:20 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 11:25:20 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/5] x86/cpuidle: switch to uniform
 meaning of "max_cstate="
Thread-Index: AQHVMZ8qQ6Jc8o6GrEKsOZ2R6D7BYabNIsVkgAAMQgA=
Date: Tue, 16 Jul 2019 11:25:20 +0000
Message-ID: <50828713-031f-58ee-c5bf-1e06e59ae5ce@suse.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <0f8bb5dd-718c-7226-db4c-b57ee7089735@suse.com>
 <20190716103944.vb4bnab7adcq2qu6@Air-de-Roger.citrite.net>
In-Reply-To: <20190716103944.vb4bnab7adcq2qu6@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:8:1::26) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a58f3a1-2481-424f-ca1c-08d709e04912
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2826; 
x-ms-traffictypediagnostic: DM6PR18MB2826:
x-microsoft-antispam-prvs: <DM6PR18MB282644E8BD4C8458BB07C1A7B3CE0@DM6PR18MB2826.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(199004)(189003)(8936002)(26005)(186003)(86362001)(53546011)(478600001)(386003)(316002)(102836004)(6506007)(76176011)(53936002)(486006)(256004)(52116002)(99286004)(14444005)(6512007)(31696002)(6116002)(476003)(3846002)(2616005)(11346002)(446003)(6486002)(6916009)(25786009)(5660300002)(6436002)(229853002)(7736002)(14454004)(6246003)(68736007)(305945005)(71190400001)(4326008)(54906003)(66066001)(36756003)(80792005)(66556008)(31686004)(66476007)(64756008)(8676002)(2906002)(66446008)(66946007)(71200400001)(81166006)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2826;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JcHZN6H1/DKea4TIGkQWITB37yHaBO2TZRN0Q+cjVobdBNCGmVhEjATUgpmufqhr4eP+3KOo5sdSQZuYOTyfrs2iubzW02uqdqtgl9J0TmFajk6ch6+LKdQG08clIxuMWdASD4UaRNeoyPaPsT/9nmx4w6YnnkiWXFe93X666oNh8jtgKoInkNam2HS2m5DSwA3Pf0kAgOWsfQWRQ5c4Ob3dHZfChQo6Ijfcdglr6Klg4znjiGPvUcbg/QwBwUU8rog6HcGdmeFpaWHaqwlVgRI5Oy2TpP3sjZY7GOA7HnI3WoC86h3I/S8QxhOY97aFayeKh4dUFS1Vc+V0R8MOd2j/qxunWDopzcMIrOtCWVrNQeok1SDCyq97Fk5nTHyFw4aMv12js2n/VK5dHwd4k9OS68uuKxjzpHN7VM6Sczg=
Content-ID: <2858F468B5B167459828E2C7F51FA8C5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a58f3a1-2481-424f-ca1c-08d709e04912
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 11:25:20.0646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2826
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/5] x86/cpuidle: switch to uniform
 meaning of "max_cstate="
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxMjozOSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFdlZCwg
SnVsIDAzLCAyMDE5IGF0IDEyOjU5OjM2UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
V2hpbGUgdGhlIE1XQUlUIGlkbGUgZHJpdmVyIGFscmVhZHkgdGFrZXMgaXQgdG8gbWVhbiBhbiBh
Y3R1YWwgQyBzdGF0ZSwNCj4+IHRoZSBBQ1BJIGlkbGUgZHJpdmVyIHNvIGZhciB1c2VkIGl0IGFz
IGEgbGlzdCBpbmRleC4gVGhlIGxpc3QgaW5kZXgsDQo+PiBob3dldmVyLCBpcyBhbiBpbXBsZW1l
bnRhdGlvbiBkZXRhaWwgb2YgWGVuIGFuZCBhZmZlY3RlZCBieSBmaXJtd2FyZQ0KPj4gc2V0dGlu
Z3MgKGkuZS4gbm90IG5lY2Vzc2FyaWx5IHVuaWZvcm0gZm9yIGEgcGFydGljdWxhciBzeXN0ZW0p
Lg0KPj4NCj4+IFdoaWxlIHRvdWNoaW5nIHRoaXMgY29kZSBhbHNvIGF2b2lkIGludm9raW5nIG1l
bnVfZ2V0X3RyYWNlX2RhdGEoKQ0KPj4gd2hlbiB0cmFjaW5nIGlzIG5vdCBhY3RpdmUuIEZvciBj
b25zaXN0ZW5jeSBkbyB0aGlzIGFsc28gZm9yIHRoZQ0KPj4gTVdBSVQgZHJpdmVyLg0KPj4NCj4+
IE5vdGUgdGhhdCBJJ20gaW50ZW50aW9uYWxseSBub3QgYWRkaW5nIGFueSBzb3J0aW5nIGxvZ2lj
IHRvIHNldF9jeCgpOg0KPj4gQmVmb3JlIGFuZCBhZnRlciB0aGlzIHBhdGNoIHdlIGFzc3VtZSBl
bnRyaWVzIHRvIGFycml2ZSBpbiBvcmRlciwgc28NCj4+IHRoaXMgd291bGQgYmUgYW4gb3J0aG9n
b25hbCBjaGFuZ2UuDQo+Pg0KPj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFkZCBtaW5pbWFs
IGRvY3VtZW50YXRpb24gZm9yIHRoZSBjb21tYW5kIGxpbmUNCj4+IG9wdGlvbi4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KPiBKdXN0
IG9uZSBjb21tZW50LCByZWdhcmRsZXNzIG9mIHdoaWNoOg0KPiANCj4gUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpUaGFua3MuDQoNCj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9h
Y3BpL2NwdV9pZGxlLmMNCj4+IEBAIC0xMDMsNyArMTAzLDcgQEAgYm9vbCBsYXBpY190aW1lcl9p
bml0KHZvaWQpDQo+PiAgICB9DQo+PiAgICANCj4+ICAgIHZvaWQgKCpfX3JlYWRfbW9zdGx5IHBt
X2lkbGVfc2F2ZSkodm9pZCk7DQo+PiAtdW5zaWduZWQgaW50IG1heF9jc3RhdGUgX19yZWFkX21v
c3RseSA9IEFDUElfUFJPQ0VTU09SX01BWF9QT1dFUiAtIDE7DQo+PiArdW5zaWduZWQgaW50IG1h
eF9jc3RhdGUgX19yZWFkX21vc3RseSA9IFVJTlRfTUFYOw0KPiANCj4gTm90IHN1cmUgd2hldGhl
ciBpdCB3b3VsZCBiZSBjbGVhcmVyIHRvIGp1c3QgdXNlDQo+IFhFTl9TWVNDVExfQ1hfVU5MSU1J
VEVEIGhlcmUgaW5zdGVhZCBvZiBVSU5UX01BWC4NCg0KV2VsbCwgdGhlIHBhdGNoIGFkZHMgYSBC
VUlMRF9CVUdfT04oKSB0byB2ZXJpZnkgYm90aCBtYXRjaC4gSWYNCnRoZXkgZGlkbid0LCB0cmFu
c2xhdGlvbiB3b3VsZCBiZSByZXF1aXJlZC4gVGhlIHZhcmlhYmxlIGFuZCBpdHMNCnVzZSBzdHJp
Y3RseSB3YW50IGl0IHRvIGJlIFVJTlRfTUFYLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
