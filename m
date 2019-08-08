Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32AC86190
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 14:25:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvhQv-0003TB-OS; Thu, 08 Aug 2019 12:22:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvhQt-0003T6-RD
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 12:22:15 +0000
X-Inumbo-ID: 1dee9136-b9d7-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1dee9136-b9d7-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 12:22:14 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 12:21:47 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 12:18:08 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 12:18:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNXBrHkFiunIYbd8tBfDXpP9gP+z2xPX9kbqlRWvGc5JpsKYnAnl7Duub6+uaXPnmlNbLiy+SZ8NaTgViD0HUFQxfQ62h5uqH884ai0ih5PW8/bp9ObbQfFGu7FpaqBtxwOJIxx+nGf0ZlBkqOWFAZTrrOK2LDVERV3ZbbcvCBY1ZKru0bKaD1hfZRqFDBq0BQeZzHcGtZ7cKGxlOMBNSE4+1P+6FRwOkELUiNYyf+ZbMxrCovrgzXaxIXzWiWqtwSxC7v76oRgjCjiKpjc9pdlq/LLCjPavwoYFxnbhqtfacTFhPxq2d9+ZcsMBYTlP58gPV9HBFgdA1Wro+vBmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnYQmOb4uWqqVpgCMhNJbZiy5TMGunhqoBd6rVg9J2s=;
 b=YNwtCIxpEAuOWw31zrPPVbRjaVgrmLbJI5KM2EiDtXnPj0ofkvE63z/DJwHAnNvF1QxL6jDm64Hqv54zIOvYWFKms92M4HjQg+w7M/uJRXEydL1E/5Lv86Oz9sm2MWT4bKDV8TuYEXVAjVoTB+RZyDy9QcU44H2Vfj80Dz8ic6BuYSYMCYGgKcNul8QNnQom0nUVIrY/UkCNIX3JJKDGfwqMn/fqX6MmX9Rnjf58kGYc2RszS83CMxOfIOcl9ApndMt7/aryYhLKAV9gSIo9OPcUjVoocwDNADS4fXuRF1imPnZdzSBydunveSCxgHQn0Y7zzg8h7k8X62L7a/TN7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2878.namprd18.prod.outlook.com (20.179.22.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Thu, 8 Aug 2019 12:18:06 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 12:18:06 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 1/4] xen/spinlocks: in debug builds store cpu holding the
 lock
Thread-Index: AQHVTSzXlrQ8kurvmUW1rudnDuQmCKbw9GCA///tid6AACvj3YAAF72XgAAGxIA=
Date: Thu, 8 Aug 2019 12:18:06 +0000
Message-ID: <7bcbb3ac-3df0-d53b-67f0-6e644b6ff076@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-2-jgross@suse.com>
 <60000ee4-7d2d-097e-dad6-584155c08ade@suse.com>
 <7220f9b0-92e8-033f-e22d-e369f797c80f@suse.com>
 <65da8b20-716d-34f2-945f-2dbc6abd2ef9@arm.com>
 <3a17204b-c569-11d3-ad4b-52e6f6214c65@suse.com>
In-Reply-To: <3a17204b-c569-11d3-ad4b-52e6f6214c65@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0202CA0028.eurprd02.prod.outlook.com
 (2603:10a6:208:1::41) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f38cb02-f878-444a-0d20-08d71bfa7803
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2878; 
x-ms-traffictypediagnostic: MN2PR18MB2878:
x-microsoft-antispam-prvs: <MN2PR18MB2878527B4D6F699F41CC4D12B3D70@MN2PR18MB2878.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(199004)(189003)(76176011)(66556008)(478600001)(66446008)(25786009)(316002)(37006003)(2906002)(54906003)(66946007)(305945005)(6636002)(53936002)(66476007)(64756008)(6512007)(6486002)(229853002)(36756003)(6436002)(2616005)(71190400001)(71200400001)(31696002)(11346002)(446003)(14454004)(102836004)(6116002)(3846002)(53546011)(6506007)(5660300002)(386003)(99286004)(52116002)(8676002)(6862004)(81166006)(4326008)(80792005)(8936002)(7736002)(66066001)(31686004)(86362001)(256004)(26005)(476003)(81156014)(186003)(486006)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2878;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 33bXWk3Amyx755/CY5wbnLRgcnhhlEDafPuX6gjxkFfne9DhxIhbaBTlJomiNB5pZABy9qvJBOf0iAEh/zPG9erEB73phaTK4hj3Vabsmxoq6FQF+1Vs9UeLbWL0HB+n/WG5eOFioTRJr6YBkO3aDqwCRvqQpOyBJnxB6/VwSCulJ3d4z96pcJhj2irTeSXkOw0wFITUtlOF5YNU3r+DDy5Au1qlHlUfDC3k6QTcKwD2kVA5QhZktZV3Wn1wN9X2hxXyVzo2GRTWgFAiUZfG9PrIxN9mkw7HFNWiOzOtwrRoXYaPDQvzbbVLw+OaAdyrp9YuwFeUNjhtaSy7Puxwp3QHnRQXq99fwiHp3aHPY8qSTJwG9TPN9jjfSSsNtSnOr2bmiIhDO/K4JD2X1hNBk9VsmW4WsvOeacqDhLLRFis=
Content-ID: <341DEEB84AE1944882120D189E956D1F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f38cb02-f878-444a-0d20-08d71bfa7803
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 12:18:06.8063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vmpyUkGLwN3c7mN44nDYDL1qYpGr/CfviK2zESDpFMMW8UAQsWojUaexze0OLWyWum8v1R3PVZfkNydbQEbn4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2878
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/4] xen/spinlocks: in debug builds store
 cpu holding the lock
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxMzo1MywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMDguMDguMTkg
MTI6MjgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IE9uIDA4LzA4LzIwMTkgMDg6NTEsIEp1ZXJn
ZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gT24gMDguMDguMTkgMDg6NTgsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+PiBPbiAwNy4wOC4yMDE5IDE2OjMxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+PiBE
byB3ZSBoYXZlIGFuIGltcGxpZWQgYXNzdW1wdGlvbiBzb21ld2hlcmUgdGhhdCB1bnNpZ25lZCBz
aG9ydCBpcw0KPj4+PiBleGFjdGx5IDE2IGJpdHMgd2lkZT8gSSB0aGluayAidmFsIiB3YW50cyB0
byBiZSB1aW50MTZfdCBoZXJlIChhcw0KPj4+PiB5b3UgcmVhbGx5IG1lYW4gImV4YWN0bHkgMTYg
Yml0cyIpLCB0aGUgdHdvIGJvb2xlYW4gZmllbGRzIHdhbnQNCj4+Pj4gdG8gYmUgYm9vbCwgYW5k
IHRoZSByZW1haW5pbmcgdHdvIG9uZXMgdW5zaWduZWQgaW50Lg0KPj4+DQo+Pj4gQnV0IHRoYXQg
d291bGQgaW5jcmVhc2UgdGhlIHNpemUgb2YgdGhlIHVuaW9uIHRvIDQgYnl0ZXMgaW5zdGVhZCBv
ZiAyLg0KPj4+IFNvIGF0IGxlYXN0IHBhZCBhbmQgY3B1IG11c3QgYmUgdW5zaWduZWQgc2hvcnQg
b3IgKGJldHRlcikgdWludDE2X3QuDQo+Pg0KPj4gSG93IGFib3V0IGJvb2wgaXJxX3NhZmU6MT8N
Cj4gDQo+IEkgZGlkbid0IHF1ZXN0aW9uIHRoYXQsIGJ1dCBPVE9IIEknbSBub3Qgc3VyZSBkb2lu
ZyBzb21ldGhpbmcgbGlrZToNCj4gDQo+IHN0cnVjdCB7DQo+ICDCoCBib29swqDCoMKgwqAgdW5z
ZWVuOjE7DQo+ICDCoCBib29swqDCoMKgwqAgaXJxX3NhZmU6MTsNCj4gIMKgIHVpbnQxNl90IHBh
ZDoyOw0KPiAgwqAgdWludDE2X3QgY3B1OjEyOw0KPiB9DQo+IA0KPiBpcyBndWFyYW50ZWVkIHRv
IGJlIDIgYnl0ZXMgbG9uZy4gSSB0aGluayBwYWQgd2lsbCBiZSBzdGlsbCBwdXQgaW50byB0aGUN
Cj4gZmlyc3QgYnl0ZSwgYnV0IHRoZSBjb21waWxlciBtaWdodCBkZWNpZGUgdGhhdCB0aGUgNCBi
aXRzIGxlZnQgd29uJ3QgYmUNCj4gYWJsZSB0byBob2xkIHRoZSBuZXh0IDEyIGJpdHMgc28gaXQg
Y291bGQgc3RhcnQgYSBuZXcgdWludDE2X3QgYXQgb2Zmc2V0DQo+IDIuDQo+IA0KPiBNb3Zpbmcg
dGhlIGJvb2wgdHlwZXMgdG8gdGhlIGVuZCBvZiB0aGUgc3RydWN0IHdvdWxkIGF2b2lkIHRoYXQg
SU1ITy4NCg0KTW92aW5nIHRoZSB0d28gYm9vbC1zIGZ1cnRoZXIgZG93biB3aWxsIGFsc28gc2lt
cGxpZnkgZXh0cmFjdGlvbiBhbmQNCmluc2VydGlvbiBvZiB0aGUgImNwdSIgZmllbGQuDQoNCkph
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
