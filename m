Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1812F5E131
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 11:43:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hibk6-00023y-Bv; Wed, 03 Jul 2019 09:39:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hibk5-00023t-CZ
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 09:39:57 +0000
X-Inumbo-ID: 7750e4f0-9d76-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7750e4f0-9d76-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 09:39:55 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 09:39:27 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 09:38:36 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 09:38:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=G0WG6YnyIfp4nWMrqeJcvUw3x30pREeYpqzRFPrCKUFLjltojKuFBR6erAaESBkY+nkWf0Dxov0Ry7VnmoWui19vYen4mF+sUEu+iIiWpActxlGimaC8DJMF6lwgxkfIxCy++0MgDKBunhL6r3vR7AIgnoRXISTxqgxdg+L7Y1E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIPrJAowB1UWBuKHvcrONveCxB4aSute50DGObSYoxY=;
 b=Bqmk+zn4wVxIhXb2sViYe/E7WinBZav+7i0PWWtlHl23574dlOaeM3tExzr7goAkT7DxM3XVfDbzasrQ3RXe3SoLrCihww+6ylLjloDCLY3snwL+LIRJAHFRSem822ic6CuO/+tlKrLhvSU1bc4Q8JmDlWfd3SodOVY5OABgWvs=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3364.namprd18.prod.outlook.com (10.255.139.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 3 Jul 2019 09:38:34 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 09:38:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/3] xmalloc: stop using a magic '1' in alignment padding
Thread-Index: AQHVMPSreQmX7EFeR0yZKSNJq3JVRaa4pDkA
Date: Wed, 3 Jul 2019 09:38:34 +0000
Message-ID: <05c68140-caec-1b95-0c4d-e30e55a8acaf@suse.com>
References: <20190702163840.2107-1-paul.durrant@citrix.com>
 <20190702163840.2107-2-paul.durrant@citrix.com>
In-Reply-To: <20190702163840.2107-2-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:2e::29)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a26c744-6f83-4d50-67b3-08d6ff9a37aa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3364; 
x-ms-traffictypediagnostic: BY5PR18MB3364:
x-microsoft-antispam-prvs: <BY5PR18MB3364C820ADDC3D4AADB4A436B3FB0@BY5PR18MB3364.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(199004)(189003)(486006)(71190400001)(11346002)(6512007)(3846002)(71200400001)(73956011)(5660300002)(6436002)(66066001)(2616005)(68736007)(31696002)(54906003)(64756008)(66446008)(476003)(110136005)(4326008)(446003)(186003)(86362001)(6116002)(478600001)(53936002)(66946007)(66556008)(6486002)(7416002)(229853002)(53546011)(8676002)(80792005)(305945005)(386003)(8936002)(2906002)(81156014)(76176011)(6506007)(99286004)(26005)(102836004)(316002)(25786009)(72206003)(81166006)(36756003)(52116002)(256004)(31686004)(14454004)(66476007)(7736002)(6246003)(2501003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3364;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Dh1jl7gpeEoGD3kbb3fmOt3p1k4WbssYD0eSZlapbypZHU7H/SleCrMqvNR7fPMZ+cGsZfSYNrO9nPHdjmwsyNN22qo/GrCfWQqjkz3SjAf1I15Q9KyNywdTPcqS+S2gR8KCqIOIgGBGPnG4DapUtxIgH1UdKJnwCIyUiz/x5QbrD2PK200vR0ZGOoFzcZbjUjU3qWL6BiNFkDiezDyarp7TPEdntUvVXUbyqTntUWMKVxmcav6EFBRUB37Q1kK64K3wGUKJ4gmKjT+js51O4ZI0X8XXzgBYlPmaIfK8Z8wRJyKd11RUTEvOWp5hXHqFt1QpgCRcZpRxxarySFLKuFTz2YnzoHNCb0OnD+eHnt3SVt6slDBcJw2VztOItgzLO5nuY0OpLhNta/BoiqlRHJodjJJp/1SzOhpewq88Lhs=
Content-ID: <82C5A060DE3FA8408B537600EEDC04D2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a26c744-6f83-4d50-67b3-08d6ff9a37aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 09:38:34.7012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3364
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/3] xmalloc: stop using a magic '1' in
 alignment padding
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxODozOCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBBbGlnbm1lbnQgcGFk
ZGluZyBpbnNlcnRzIGEgcHNldWRvIGJsb2NrIGhlYWRlciBpbiBmcm9udCBvZiB0aGUgYWxsb2Nh
dGlvbiwNCj4gc2V0cyBpdHMgc2l6ZSBmaWVsZCB0byB0aGUgcGFkIHNpemUgYW5kIHRoZW4gT1Jz
IGluIDEsIHdoaWNoIGlzIGVxdWl2YWxlbnQNCj4gdG8gbWFya2luZyBpdCBhcyBhIGZyZWUgYmxv
Y2ssIHNvIHRoYXQgeGZyZWUoKSBjYW4gZGlzdGluZ3Vpc2ggaXQgZnJvbSBhDQo+IHJlYWwgYmxv
Y2sgaGVhZGVyLg0KPiANCj4gVGhpcyBwYXRjaCBzaW1wbHkgcmVwbGFjZXMgdGhlIG1hZ2ljICcx
JyB3aXRoIHRoZSBkZWZpbmVkICdGUkVFX0JMT0NLJyB0bw0KPiBtYWtlIGl0IG1vcmUgb2J2aW91
cyB3aGF0J3MgZ29pbmcgb24uDQoNCkhtbSwgdGhhdCdzIHN0aWxsIGFuIGFidXNlIG9mIHNvbWUg
c29ydCwgSSB0aGluay4gRlJFRV9CTE9DSw0KKHRvZ2V0aGVyIHdpdGggVVNFRF9CTE9DSywgUFJF
Vl9GUkVFLCBhbmQgUFJFVl9VU0VEKSBzZXJ2ZQ0KYmxvY2sgc3BsaXR0aW5nIGFuZCByZS1jb21i
aW5hdGlvbiwgd2hpY2ggaXNuJ3Qgc3RyaWN0bHkgdGhlDQpjYXNlIGhlcmUuIEJ1dCB5ZXMsIEkg
Z3Vlc3MgKGFiKXVzaW5nIHRoZSBtYW5pZmVzdCBjb25zdGFudHMgaXMNCnN0aWxsIGJldHRlciB0
aGFuIChhYil1c2luZyB0aGUgbGl0ZXJhbCBudW1iZXJzLg0KDQo+IEFsc28sIHdoaWxzdCBpbiB0
aGUgbmVpZ2hib3VyaG9vZCwgaXQgcmVtb3ZlcyBhIHN0cmF5IHNwYWNlIGFmdGVyIGEgY2FzdC4N
Cg0KQW4gb3B0aW9uIHdvdWxkIGhhdmUgYmVlbiB0byBkcm9wIHRoZSBjYXN0IGFsdG9nZXRoZXIu
IFRoZSBjb2RlDQpoZXJlIGFwcGVhcnMgdG8gYXNzdW1lIHRoYXQgdm9pZCBwb2ludGVyIGFyaXRo
bWV0aWMgaXMgbm90DQphbGxvd2VkIChhcyBpcyBpbmRlZWQgdGhlIGNhc2UgaW4gcGxhaW4gQyku
DQoNCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCndpdGgg
b25lIGZ1cnRoZXIgYWRqdXN0bWVudDoNCg0KPiBAQCAtNjM4LDEyICs2MzgsMTIgQEAgdm9pZCB4
ZnJlZSh2b2lkICpwKQ0KPiAgICAgICB9DQo+ICAgDQo+ICAgICAgIC8qIFN0cmlwIGFsaWdubWVu
dCBwYWRkaW5nLiAqLw0KPiAtICAgIGIgPSAoc3RydWN0IGJoZHIgKikoKGNoYXIgKikgcCAtIEJI
RFJfT1ZFUkhFQUQpOw0KPiAtICAgIGlmICggYi0+c2l6ZSAmIDEgKQ0KPiArICAgIGIgPSAoc3Ry
dWN0IGJoZHIgKikoKGNoYXIgKilwIC0gQkhEUl9PVkVSSEVBRCk7DQo+ICsgICAgaWYgKCBiLT5z
aXplICYgRlJFRV9CTE9DSyApDQo+ICAgICAgIHsNCj4gICAgICAgICAgIHAgPSAoY2hhciAqKXAg
LSAoYi0+c2l6ZSAmIH4xdSk7DQoNClRoaXMgfjF1IGFsc28gd2FudHMgdG8gYmVjb21lIH5GUkVF
X0JMT0NLIHRoZW4uIEkgZ3Vlc3MgdGhlDQpjaGFuZ2UgaXMgZWFzeSBlbm91Z2ggdG8gbWFrZSB3
aGlsZSBjb21taXR0aW5nOyBJIGRvbid0DQpleHBlY3QgdGhlIGxvc3Mgb2YgdGhlIHUgc3VmZml4
IHRvIGFjdHVhbGx5IGNhdXNlIGFueQ0KcHJvYmxlbXMuIEluIGZhY3QgaXRzIHByZXNlbmNlIHdh
cyBub3QgYSBwcm9ibGVtIG9ubHkNCmJlY2F1c2UgLT5zaXplIGNhbid0IGdldCB2ZXJ5IGxhcmdl
IGFuZCBpcyBvZiB1MzIgdHlwZS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
