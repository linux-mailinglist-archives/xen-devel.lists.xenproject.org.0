Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124EE7ABEC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 17:05:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsTeF-0003wj-VK; Tue, 30 Jul 2019 15:02:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsTeE-0003wU-Dq
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 15:02:42 +0000
X-Inumbo-ID: fc0864e6-b2da-11e9-911f-9f043edb10f3
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc0864e6-b2da-11e9-911f-9f043edb10f3;
 Tue, 30 Jul 2019 15:02:38 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 15:02:04 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 14:54:59 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 14:54:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YV2K0QkWrbHJxaKNtnsxC+X0wk7j+tpMOjHIvdplE4IwMQhnDYIb5ba+F0CBl4jH8CErdclXCJ6AyM7s9wl/bGew5LOHW5xdIBO+nU0+2BgOn7MkE10FPGH0ptodVbW6xlAr44OIRJjRUAIZj0urKIpss9UTh8oltdvy/w0g+GkwXcJbbJfR0yFmWxnlCHnvkJ6CMgaV5bp8trDIpRlsbJfefBfbnoiDisOBnB4EnJlJ44sNJ3tBSqs1+NWopM10VfA3reFJRvBfPQCZs9VgljdwOPDaF/cHBosiOoeg3DgmArNw421ahvAD4Sj3LnKXycg6wnfjsN7Boo/rbuBl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K8DKZPctgyRQba08v3kidZ2l0iNLQBGQkyynhGr4A0=;
 b=ePaMTQtBbMEMRO8MMu+rM/Epqyk/i4EkXTVdTDWFd4kmO/NEeXTmKNC/aCYgf2cJXdUwDIlWfe/F2eFX2ZVIZ9JmJkTuP1dknNajN72cvj5O7pw7gRxY/PRAlww2SCnwMF3Ky/Cpw1vI5YK/z1EuGZtYVt+lKfN/TXhy+Gbg/5+/ip/YhYa0LuW5YHKsGNvq/l7x/OE316VPcu244YpFb5nxxsTnnTwbmg2vMq8y7sb58Lhb5EsppRUgmZgro+Ksr4NjAfivWLCs5faU3vI+XuAUiLkwoJz87FqSEfPQt5JsuI3vfS+vLdZVivEW/rZUDNzdmHppb4XKoUu0GRRfxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3300.namprd18.prod.outlook.com (10.255.137.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 30 Jul 2019 14:54:56 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 14:54:56 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbQbceAgAG+GQD//9nvgIAEjgaAgAzeDYD//9/xAIAADJ4AgAAL7AA=
Date: Tue, 30 Jul 2019 14:54:56 +0000
Message-ID: <b7c16027-2f50-4011-3866-0b4904596249@suse.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <23cebb01-38fc-ba49-5a71-e6129152e488@bitdefender.com>
 <1bdaee7b-a01f-7be8-426f-fe6c678c2859@bitdefender.com>
 <60651ad5-f0bd-caad-77f6-5f8fb71a8319@suse.com>
 <c7060d91-851a-ba04-56c3-90f1aed65913@bitdefender.com>
In-Reply-To: <c7060d91-851a-ba04-56c3-90f1aed65913@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0601CA0031.eurprd06.prod.outlook.com
 (2603:10a6:4:17::17) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 528b35ab-e97a-4837-d1d9-08d714fde311
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3300; 
x-ms-traffictypediagnostic: BY5PR18MB3300:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BY5PR18MB33003691A956E6D12A71134AB3DC0@BY5PR18MB3300.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(189003)(199004)(966005)(7416002)(25786009)(5660300002)(6116002)(6512007)(14454004)(3846002)(52116002)(6486002)(53936002)(68736007)(2616005)(2501003)(110136005)(6246003)(36756003)(66066001)(66446008)(305945005)(31686004)(7736002)(76176011)(54906003)(186003)(86362001)(14444005)(6436002)(386003)(71200400001)(31696002)(102836004)(4326008)(99286004)(80792005)(478600001)(8936002)(6506007)(256004)(53546011)(71190400001)(476003)(81166006)(66556008)(66946007)(81156014)(229853002)(6306002)(316002)(486006)(2906002)(64756008)(66476007)(11346002)(8676002)(26005)(446003)(309714004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3300;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wUPW3WDDX5jd2yFtwrQey8TPlI6rJfP31kSvYx3eMWRxHQuzbxM+OP7apiVgEIKuzQcYTbK0/BK0vK+Kl6LgFDQ+SOcICAz8tR6Uh+w/XB8Ci6e1tljp0/Yf8vxPUPPx3/L4axXYzJm9cUz0iNxJ7l4n3wANLRgAC3OcZYnN83mFFJmI4avDiotiioe2Ez7TnCYO1y0/d5jpUYUgqVrrQOhGHfTAm01RELfVstyyB6Wwb31x+2Cds5/OQbvGLngSgmLjwdRdlhAm3KdgCYxUqyq8gkmOEwbSZeC+a3pYbKuEeoGH0nB+w3Ht01hu31kto1jKKBJJ3DHbeR2wJQO4t1jm376h3+vgLRztT5+72w9Xzw2yp+jWuzhaf76w2NlbjQYlf1GH2u4zq9K3HycyGNRwbTYr04aF8FlfPjXd5GQ=
Content-ID: <8EB4CE6E2DFA1143935766F2A3D2E557@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 528b35ab-e97a-4837-d1d9-08d714fde311
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 14:54:56.7110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3300
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxNjoxMiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IA0K
PiANCj4gT24gMzAuMDcuMjAxOSAxNjoyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAzMC4w
Ny4yMDE5IDE0OjIxLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+Pg0KPj4+Pj4+
Pj4gQEAgLTYyOSw2ICs2OTcsMTQgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9h
ZGRyKA0KPj4+Pj4+Pj4gICAgICAgICAgDQo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICBB
U1NFUlQocDJtdCA9PSBwMm1fcmFtX2xvZ2RpcnR5IHx8ICFwMm1faXNfcmVhZG9ubHkocDJtdCkp
Ow0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICB9DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAg
ICAgICBpZiAoIGN1cnItPmFyY2gudm1fZXZlbnQgJiYNCj4+Pj4+Pj4+ICsgICAgICAgICAgICBj
dXJyLT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50ICYmDQo+Pj4+Pj4+PiArICAgICAgICAgICAg
aHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudChhZGRyLCBnZm4sIHBmZWMpICkNCj4+Pj4+Pj4+ICsg
ICAgICAgIHsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICBlcnIgPSBFUlJfUFRSKH5YODZFTVVMX1JF
VFJZKTsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4+Pj4+Pj4+ICsgICAgICAg
IH0NCj4+Pj4+Pj4NCj4+Pj4+Pj4gRGlkIHlvdSBub3RpY2UgdGhhdCB0aGVyZSdzIGFuIGltbWVk
aWF0ZSBleGl0IGZyb20gdGhlIGxvb3Agb25seQ0KPj4+Pj4+PiBpbiBjYXNlIHRoZSBsaW5lYXIg
LT4gcGh5c2ljYWwgdHJhbnNsYXRpb24gZmFpbHM/IFRoaXMgaXMNCj4+Pj4+Pj4gcmVsZXZhbnQg
Zm9yIHBhZ2UgZmF1bHQgZGVsaXZlcnkgY29ycmVjdG5lc3MgZm9yIGFjY2Vzc2VzDQo+Pj4+Pj4+
IGNyb3NzaW5nIHBhZ2UgYm91bmRhcmllcy4gSSB0aGluayB5b3Ugd2FudCB0byB1c2UNCj4+Pj4+
Pj4gdXBkYXRlX21hcF9lcnIoKSBhbmQgZHJvcCB0aGUgImdvdG8gb3V0Ii4gSSBjYW4ndCByZWFs
bHkgbWFrZSB1cA0KPj4+Pj4+DQo+Pj4+Pj4gQnkgdXBkYXRlX21hcF9lcnIoKSBhcmUgeW91IHNh
eWluZyB0byBoYXZlIHRoZSBlcnIgdmFyIGFzc2lnbmVkIGFuZCB0aGVuDQo+Pj4+Pj4gZHJvcCAi
Z290byBvdXQiPyBJZiBzbyBob3cgZG8gSSBrZWVwIHRoZSBlcnIgZnJvbSBteSBhY2Nlc3Mgdmlv
bGF0aW9uDQo+Pj4+Pj4gd2l0aG91dCBleGl0aW5nIGZyb20gdGhlIGxvb3A/DQo+Pj4+Pg0KPj4+
Pj4gQ291bnRlciBxdWVzdGlvbjogV2h5IGRvIHlvdSBfbmVlZF8gdG8ga2VlcCAieW91ciIgdmFs
dWUgb2YgZXJyPw0KPj4+Pj4gSWYsIGp1c3QgYXMgYW4gZXhhbXBsZSwgdGhlcmUncyBnb2luZyB0
byBiZSBhICNQRiBvbiB0aGUgb3RoZXINCj4+Pj4+IGhhbGYgb2YgdGhlIGFjY2VzcywgdGhlbiAi
eW91ciIgYWNjZXNzIHZpb2xhdGlvbiBpcyBvZiBubyBpbnRlcmVzdA0KPj4+Pj4gYXQgYWxsLg0K
Pj4+Pg0KPj4+PiBZb3UgYXJlIHJpZ2h0LCB0aGVyZSBpcyBubyBuZWVkIHRvIGtlZXAgdGhlICJn
b3RvIG91dCIgaGVyZS4gSXQgd2FzIGp1c3QNCj4+Pj4gZm9yIG9wdGltaXphdGlvbiBpbiB0aGUg
aWRlYSB0aGF0IHRoZXJlIGlzIG5vIG5lZWQgdG8gZG8gZnVydGhlciBzdGVwcw0KPj4+PiBidXQg
SSBjYW4gZHJvcCB0aGUgImdvdG8gb3V0IiBhbmQgdGhlIGNvZGUgd2lsbCB3b3JrIHRoZSBzYW1l
Lg0KPj4+Pg0KPj4+DQo+Pj4gVGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggZHJvcHBpbmcgdGhlICJn
b3RvIG91dCIuIElmIGV2ZXJ5dGhpbmcgZ29lcyBmaW5lDQo+Pj4gdGhlbiBpdCB3aWxsIHJldHVy
biB0aGUgbWFwcGluZyBhbmQgSSBkb24ndCB3YW50IHRoYXQuIFRoaXMgY2FuIGJlDQo+Pj4gc3Rv
cHBlZCBieSBjaGVja2luZyBpZiAoIGVyciApIGFmdGVyIHRoZSBsb29wIGFuZCBpdCBpcyBub3Qg
bnVsbCB0aGVuDQo+Pj4gZ290byBvdXQuIEFuZCBnb2luZyB3aXRoIHRoaXMgaWRlYSBJIGNhbiBp
bml0ICplcnIgPSBOVUxMIGFuZCBkcm9wIHRoZQ0KPj4+IGVyciA9IE5VTEwgZnJvbSBodm1lbXVs
X21hcF9saW5lYXJfYWRkcigpLiBJcyB0aGlzIG9rIGZvciB0aGUgbmV4dCB2ZXJzaW9uPw0KPj4N
Cj4+IEknZCBwcmVmZXIgdG8gc2VlIHRoZSBjb2RlIHRvIGRlY2lkZS4gSWYgeW91IHdhbnQgdGhp
cyBzZXR0bGVkIGJlZm9yZQ0KPj4gc2VuZGluZyB0aGUgbmV4dCBmdWxsIHZlcnNpb24sIHRoZW4g
cGxlYXNlIHNlbmQgYXQgbGVhc3QgdGhlIHJlc3VsdGluZw0KPj4gcGF0Y2ggaHVuayhzKS4NCj4+
DQo+IA0KPiBIZXJlIGlzIGEgZGlmZiBmb3IgaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoKToNCj4g
DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vZW11bGF0ZS5jDQo+IEBAIC01NDMsMTAgKzU0MywxMSBAQCBzdGF0aWMgdm9pZCAqaHZt
ZW11bF9tYXBfbGluZWFyX2FkZHIoDQo+ICAgICAgICBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCAq
aHZtZW11bF9jdHh0KQ0KPiAgICB7DQo+ICAgICAgICBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJl
bnQ7DQo+IC0gICAgdm9pZCAqZXJyLCAqbWFwcGluZzsNCj4gKyAgICB2b2lkICplcnIgPSBOVUxM
LCAqbWFwcGluZzsNCj4gICAgICAgIHVuc2lnbmVkIGludCBucl9mcmFtZXMgPSAoKGxpbmVhciAr
IGJ5dGVzIC0gISFieXRlcykgPj4gUEFHRV9TSElGVCkgLQ0KPiAgICAgICAgICAgIChsaW5lYXIg
Pj4gUEFHRV9TSElGVCkgKyAxOw0KPiAgICAgICAgdW5zaWduZWQgaW50IGk7DQo+ICsgICAgZ2Zu
X3QgZ2ZuOw0KPiANCj4gICAgICAgIC8qDQo+ICAgICAgICAgKiBtZm4gcG9pbnRzIHRvIHRoZSBu
ZXh0IGZyZWUgc2xvdC4gIEFsbCB1c2VkIHNsb3RzIGhhdmUgYSBwYWdlDQo+IHJlZmVyZW5jZQ0K
PiBAQCAtNTg1LDcgKzU4Niw3IEBAIHN0YXRpYyB2b2lkICpodm1lbXVsX21hcF9saW5lYXJfYWRk
cigNCj4gICAgICAgICAgICBBU1NFUlQobWZuX3goKm1mbikgPT0gMCk7DQo+IA0KPiAgICAgICAg
ICAgIHJlcyA9IGh2bV90cmFuc2xhdGVfZ2V0X3BhZ2UoY3VyciwgYWRkciwgdHJ1ZSwgcGZlYywN
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcGZpbmZvLCAmcGFnZSwg
TlVMTCwgJnAybXQpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZw
ZmluZm8sICZwYWdlLCBnZm4sICZwMm10KTsNCj4gDQo+ICAgICAgICAgICAgc3dpdGNoICggcmVz
ICkNCj4gICAgICAgICAgICB7DQo+IEBAIC01OTksNyArNjAwLDYgQEAgc3RhdGljIHZvaWQgKmh2
bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KPiAgICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gDQo+
ICAgICAgICAgICAgY2FzZSBIVk1UUkFOU19iYWRfZ2ZuX3RvX21mbjoNCj4gLSAgICAgICAgICAg
IGVyciA9IE5VTEw7DQo+ICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiANCj4gICAgICAgICAg
ICBjYXNlIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQ6DQo+IEBAIC02MjIsMTQgKzYyMiwyMiBAQCBz
dGF0aWMgdm9pZCAqaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoDQo+ICAgICAgICAgICAgICAgIH0N
Cj4gDQo+ICAgICAgICAgICAgICAgIGlmICggcDJtdCA9PSBwMm1faW9yZXFfc2VydmVyICkNCj4g
LSAgICAgICAgICAgIHsNCj4gLSAgICAgICAgICAgICAgICBlcnIgPSBOVUxMOw0KPiAgICAgICAg
ICAgICAgICAgICAgZ290byBvdXQ7DQo+IC0gICAgICAgICAgICB9DQo+IA0KPiAgICAgICAgICAg
ICAgICBBU1NFUlQocDJtdCA9PSBwMm1fcmFtX2xvZ2RpcnR5IHx8ICFwMm1faXNfcmVhZG9ubHko
cDJtdCkpOw0KPiArDQo+ICsgICAgICAgICAgICBpZiAoIGN1cnItPmFyY2gudm1fZXZlbnQgJiYN
Cj4gKyAgICAgICAgICAgICAgICAgY3Vyci0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCAmJg0K
PiArICAgICAgICAgICAgICAgICBodm1fZW11bGF0ZV9zZW5kX3ZtX2V2ZW50KGFkZHIsIGdmbiwg
cGZlYykgKQ0KPiArICAgICAgICAgICAgICAgIGVyciA9IEVSUl9QVFIoflg4NkVNVUxfUkVUUlkp
Ow0KPiAgICAgICAgICAgIH0NCj4gICAgICAgIH0NCj4gKyAgICAvKiBDaGVjayBpZiBhbnkgdm1f
ZXZlbnQgd2FzIHNlbnQgKi8NCj4gKyAgICBpZiAoIGVyciApDQo+ICsgICAgICAgIGdvdG8gb3V0
Ow0KPiANCj4gICAgICAgIC8qIEVudGlyZSBhY2Nlc3Mgd2l0aGluIGEgc2luZ2xlIGZyYW1lPyAq
Lw0KPiAgICAgICAgaWYgKCBucl9mcmFtZXMgPT0gMSApDQoNCkZpcnN0IG9mIGFsbCBJIGhhdmUg
dG8gYXBvbG9naXplOiBJbiBlYXJsaWVyIHJlcGxpZXMgSSByZWZlcnJlZA0KdG8gdXBkYXRlX21h
cF9lcnIoKS4gSSBub3RpY2Ugb25seSBub3cgdGhhdCB0aGlzIGlzIGEgc3RpbGwNCnBlbmRpbmcg
Y2hhbmdlIG9mIG1pbmUsIHdoaWNoIEFuZHJldyBjb250aW51ZXMgdG8gb2JqZWN0IHRvLA0Kd2hp
bGUgSSBjb250aW51ZSB0byB0aGluayBpdCAoaW4gb25lIGZvcm0gb3IgYW5vdGhlcikgaXMgbmVl
ZGVkOg0KaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDE4LTA5L21zZzAxMjUwLmh0bWwNCg0KR2l2ZW4gdGhlIHVucGF0Y2hlZCBjb2RlLCBJIHRo
aW5rIHlvdXIgY2hhbmdlIGlzIGNvcnJlY3QsIGJ1dA0KcXVpdGUgcG9zc2libHkgeW91ciBlYXJs
aWVyIHZhcmlhbnQgd2FzLCB0b28uIEJ1dCBzaW5jZSB0aGUNCnVucGF0Y2hlZCBjb2RlIGlzIGlt
byB3cm9uZywgSSdkIHByZWZlciBpZiB0aGUgVk0gZXZlbnQgc2lkZQ0KY2hhbmdlIHdhcyBwdXQg
b24gdG9wIG9mIHRoZSBmaXhlZCBjb2RlLCBpbiBvcmRlciB0byBub3QgZnVydGhlcg0KY29tcGxp
Y2F0ZSB0aGUgYWN0dWFsIGZpeCAod2hpY2ggd2UgbWF5IGFsc28gd2FudCB0byBiYWNrcG9ydCku
DQoNCkFuZHJldywgYXMgdG8gdGhhdCBvbGQgcGVuZGluZyBwYXRjaCwgSSdtIGFmcmFpZCBJIGhh
dmVuJ3QgYmVlbg0KY29udmluY2VkIGluIHRoZSBzbGlnaHRlc3QgYnkgeW91ciBhcmd1bWVudGF0
aW9uLCByZWdhcmRsZXNzIG9mDQp0aGUgYWN0dWFsIGJlaGF2aW9yIG9mIHRoZSBYVEYgdGVzdCB5
b3UndmUgY3JlYXRlZC4gVGhlcmUgYXJlDQp0d28gZnVuZGFtZW50YWwgcG9pbnRzIHlvdSd2ZSBu
b3QgYWRkcmVzc2VkIGR1cmluZyB0aGUgZWFybGllcg0KZGlzY3Vzc2lvbjoNCjEpIEZvciBhIGd1
ZXN0IGJlaGF2aW9yIHNob3VsZCBiZSBlbnRpcmVseSB0cmFuc3BhcmVudCBhcyBmYXIgYXMNCjJu
ZCBsZXZlbCB0cmFuc2xhdGlvbiBnb2VzLCB1bmxlc3MgdGhlIF9vbmx5XyBpc3N1ZSByZXN1bHRz
IGZyb20NCml0LiBUaGF0J3MgYmVjYXVzZSBvbiBiYXJlIGhhcmR3YXJlIHRoZXJlIHNpbXBseSBp
cyBubyAybmQgbGV2ZWwNCnRyYW5zbGF0aW9uLg0KMikgU29tZXdoYXQgcmVsYXRlZCwgY29uc2lk
ZXIgdGhlIGNhc2Ugb2YgdGhlIGd1ZXN0IGhhbmRsaW5nIHRoZQ0KI1BGIG9uIHRoZSBzZWNvbmQg
aGFsZiBvZiB0aGUgYWNjZXNzIGJ5IGEgbWVhbnMgd2hpY2ggbWFrZXMgdGhlDQpyZWFzb24gZm9y
IHRoZSAybmQgc3RhZ2UgImZhdWx0IiBnbyBhd2F5LCBvciBub3QgcmVjdXIuIEluIHRoYXQNCmNh
c2Ugd2UndmUgd3JvbmdseSAoaS5lLiBhdCBsZWFzdCBuZWVkbGVzc2x5KSBkZWFsdCB3aXRoIHRo
ZSAybmQNCnN0YWdlICJmYXVsdCIuDQoNCkkgYW0sIGJ0dywgbm90IGNvbnZpbmNlZCB0aGF0IHRo
ZSBiZWhhdmlvciBhcyB5b3UndmUgb2JzZXJ2ZWQgaXQNCmlzIGFjdHVhbGx5ICJjb3JyZWN0IiBp
biB0aGUgc2Vuc2Ugb2YgInNlbnNpYmxlIi4gQnV0IHRoZSBzdWItDQp0aHJlYWQgd2hlcmUgSSd2
ZSBicm91Z2h0IHVwIHRoZSBiZWhhdmlvciBvZiBMT0NLZWQgYWNjZXNzZXMgaGFzDQpiZWVuIGxl
ZnQgZGFuZ2xpbmcsIGFzIG11Y2ggYXMgdGhlIG90aGVyIG9uZSwgZW5kaW5nIHdpdGggbWUNCnN0
YXRpbmcgdGhhdCB3aXRoIHRoZSBwYXRjaCBpbiBwbGFjZSB3ZSdsbCBoYXZlIGxlc3MgInN1cnBy
aXNpbmciDQpiZWhhdmlvci4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
