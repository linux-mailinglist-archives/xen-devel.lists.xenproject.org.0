Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F4178ECA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:12:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs7Gq-0005iQ-LE; Mon, 29 Jul 2019 15:09:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs7Gp-0005iJ-4j
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:09:03 +0000
X-Inumbo-ID: bee85031-b212-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bee85031-b212-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:09:02 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 15:08:42 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 14:47:57 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 14:47:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F76swHluKHKXlcTc3wM70xQhV86MGd/QCRosTDzHdQWPf+Abnh27ZYXoegZRiMg0GqeXtFsBv1ZdCpi4sfouV0kaHfdb3PB0aTRozRBuNZ7s4BKHDOsneZL2v86vJRnj/VpjQY9MlClcA/yhPMPhMu7XJjGOA/XDtj3J9WP1Z+9FWKWBZARZ0c570ZJzgVcnDpBpextvCp8W/+b+WrRh2zhXrnTK4u2zISLFT6VRjD+xNVXGaN3PqqcN/otD7ztG/lKFQMj2YHflDPX7+iBo99C6W6riFsndC2YpsirZkyEQzJwCT0NRNWQv6HaWcAkAqhHKriRkIDUDL2pcDNSpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rufo48DdoblI1GrXyUK2qmKAwYPBL2MSekAtK2+2dg=;
 b=gZl2EEYnhO82xEvw+q6ZLdATJaPdbul7kmZiWMxrUxStF4TU9oz1uuEQ3NBCHQlgvcbU9giE3gtHSbvD/0hoLrsAtr1mJETVHGWCUxt383QskI74ocUUFNsz/dbERiQragE8njN60tOLJVRfXTV5+0I53yVwtLhA+GMctT5Kh+Wv50oEhjHX0xnsXTDE/0rM5d5qV0unoKXV8XkQ+ykzKBx/x4ek3+FGCF6bCL1N4a3wqX/SAW8YQoOAxbaz/arvvQmCmeQcrxhr3vbHmtiDoh7p18FF37b2+K/NWs3+b1/5gNygGJySlS9G30AXjcAW1JjMl3zEfMHPw2dsIuud/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3330.namprd18.prod.outlook.com (10.255.138.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Mon, 29 Jul 2019 14:47:56 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 14:47:56 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 1/3] xen: move debugtrace coding to common/debugtrace.c
Thread-Index: AQHVRSA2vhgAAF6AnUuE4HJXiRUWH6bhjJWAgAAM8DaAAAgJgIAAB+6RgAAFb4A=
Date: Mon, 29 Jul 2019 14:47:56 +0000
Message-ID: <12c50335-6e8e-40a8-1304-e185b054af85@suse.com>
References: <20190728084100.13071-1-jgross@suse.com>
 <20190728084100.13071-2-jgross@suse.com>
 <014a658d-c2d5-0497-a2b3-793997f952ad@suse.com>
 <1895d2d8-db34-8c93-09c2-56f11b890cd6@suse.com>
 <58a04e6c-8dbc-198c-cfb2-16a5b626bfb8@suse.com>
 <954eb28c-1aeb-8072-aa17-5e4e4f0bba52@suse.com>
In-Reply-To: <954eb28c-1aeb-8072-aa17-5e4e4f0bba52@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8P191CA0019.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::29) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0db1baf7-144e-4253-54e9-08d71433be36
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3330; 
x-ms-traffictypediagnostic: BY5PR18MB3330:
x-microsoft-antispam-prvs: <BY5PR18MB333086FE3FE5BDE8AACF3916B3DD0@BY5PR18MB3330.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(199004)(189003)(6862004)(102836004)(66066001)(186003)(80792005)(5660300002)(2906002)(99286004)(6506007)(11346002)(36756003)(53546011)(37006003)(26005)(54906003)(4326008)(25786009)(316002)(6512007)(386003)(81166006)(76176011)(256004)(478600001)(81156014)(486006)(3846002)(6116002)(8676002)(52116002)(86362001)(6636002)(66446008)(64756008)(71200400001)(71190400001)(31696002)(66556008)(66476007)(66946007)(8936002)(31686004)(68736007)(14454004)(6246003)(476003)(2616005)(446003)(53936002)(229853002)(6486002)(305945005)(6436002)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3330;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bfHobe6a7crIl/kFvQr2lD0IG6rk7ADqSvWPT469mxdl3BWNbpegQPdn3kF1REac7NR6CtX89FEwK5S4l7bugXnKjJruGDSRC3kQE9bvntBO4EQMG08VujaoqQ5GcND5j0VgvFh7H8XCB2sLHWaLtAZxhAlJZnbtkTz2jdD5ZObSSBp1b//a1iVXY+1/K7683Szelg/llqysZPU3bCri1LRpet1T4Un2CezmLFzWtnTeSSmHw371uEl5a3xctZLeLBunxP8n/EluVrKBugSd40tF7jimDa7ZP2XNi11q61W1F/NMUHj9WwKDQa6YMJWQEUqbIFHMiv3CXFWF41wMGaEqdune0Ixtaf3Knp2dNMGbxHIBAhs5pY+ztImvctAwdh70qRbqGZ2YQOUKbIXv3kZkUpKqUaUCA6m/omekwRQ=
Content-ID: <D464FC07879B56458BE9318D10F0FA2B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db1baf7-144e-4253-54e9-08d71433be36
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 14:47:56.6222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3330
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/3] xen: move debugtrace coding to
 common/debugtrace.c
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

T24gMjkuMDcuMjAxOSAxNjoyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjkuMDcuMTkg
MTY6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjkuMDcuMjAxOSAxNTozMCwgSnVlcmdl
biBHcm9zcyB3cm90ZToNCj4+PiBPbiAyOS4wNy4xOSAxNDo0NSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+IE9uIDI4LjA3LjIwMTkgMTA6NDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+PiAt
I2VuZGlmIC8qICFDT05GSUdfREVCVUdfVFJBQ0UgKi8NCj4+Pj4+IC0NCj4+Pj4+IC0NCj4+Pj4+
IMKgwqDCoCAvKg0KPj4+Pj4gwqDCoMKgwqAgKiAqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPj4+Pj4gwqDCoMKgwqAgKiAqKioq
KioqKioqKioqKiogRGVidWdnaW5nL3RyYWNpbmcvZXJyb3ItcmVwb3J0ICoqKioqKioqKioqKioq
Kg0KPj4+Pg0KPj4+PiAuLi4gd2hhdCBhYm91dCB0aGlzIG9uZT8gVGhlcmUncyBvbmx5IHBhbmlj
KCkgYmV0d2VlbiBpdCBhbmQgdGhlIG5leHQNCj4+Pj4gc3VjaCBjb21tZW50LCBhbmQgSSBkb24n
dCB0aGluayB0aGUgIkRlYnVnZ2luZy90cmFjaW5nIiBwYXJ0IG9mIGl0DQo+Pj4+IGFyZSBhcHBs
aWNhYmxlIChhbnltb3JlKS4NCj4+Pg0KPj4+IFRydWUuIEknbGwgcmVtb3ZlIHRoZSAiRGVidWdn
aW5nL3RyYWNpbmciIHBhcnQuDQo+Pj4NCj4+Pj4NCj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9jb25zb2xlLmgNCj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9jb25zb2xlLmgNCj4+Pj4+
IEBAIC00OCw0ICs0OCw4IEBAIGludCBjb25zb2xlX3Jlc3VtZSh2b2lkKTsNCj4+Pj4+IMKgwqDC
oCBleHRlcm4gaW50OF90IG9wdF9jb25zb2xlX3hlbjsNCj4+Pj4+ICsvKiBJc3N1ZSBzdHJpbmcg
dmlhIHNlcmlhbCBsaW5lLiAqLw0KPj4+Pj4gK2V4dGVybiBpbnQgc2VyY29uX2hhbmRsZTsNCj4+
Pj4+ICt2b2lkIHNlcmNvbl9wdXRzKGNvbnN0IGNoYXIgKnMpOw0KPj4+Pg0KPj4+PiBJIGd1ZXNz
IGF2b2lkaW5nIHRoZWlyIGV4cG9zdXJlIHdhcyBvbmUgb2YgdGhlIHJlYXNvbnMgdGhlIGRlYnVn
IHRyYWNlDQo+Pj4+IGNvZGUgbGl2ZWQgaW4gdGhlIHBsYWNlIHlvdSBtb3ZlIGl0IGZyb20uIEkn
bSB1bmNvbnZpbmNlZCBub24tY29uc29sZQ0KPj4+PiBjb2RlIGlzIGFjdHVhbGx5IHN1cHBvc2Vk
IHRvIG1ha2UgdXNlIG9mIGVpdGhlciwgYnV0IEknbSBub3Qgb3Bwb3NlZA0KPj4+PiBlbm91Z2gg
dG8gbmFrIHRoZSBjaGFuZ2UuIEkgZG9uJ3QgdGhpbmsgdGhvdWdoIHRoZSBjb21tZW50IGZpdHMg
d2VsbA0KPj4+PiB3aXRoIHRoZSB2YXJpYWJsZSBkZWNsYXJhdGlvbi4NCj4+Pg0KPj4+IHNlcmNv
bl9oYW5kbGUgaXMgdXNlZCBmb3IgY2FsbGluZyBzZXJpYWxfcHV0cygpLCBzbyBtYXliZSBpbnN0
ZWFkIG9mDQo+Pj4gZGlyZWN0bHkgdXNpbmcgc2VyaWFsX3B1dHMoKSB3aXRoIHNlcmNvbl9oYW5k
bGUgSSBzaG91bGQgYWRkIGEgd3JhcHBlcg0KPj4+IHRvIGNvbnNvbGUuYyAoZS5nLiBjb25zb2xl
X3NlcmlhbF9wdXRzKCkpPyBJdCBzaG91bGQgYmUgbm90ZWQgdGhhdA0KPj4+IHNlcmlhbF9wdXRz
KCkgaXMgY2FsbGVkIG9ubHkgaW4gY2FzZSBvZiBkZWJ1Z3RyYWNlIG91dHB1dCB0b2dnbGVkIHRv
IGdvDQo+Pj4gdG8gdGhlIGNvbnNvbGUuIEkgZ3Vlc3MgdXNpbmcgc2VyaWFsX3B1dHMoKSBpbiB0
aGF0IGNhc2UgaXMgbWVhbnQgdG8NCj4+PiBhdm9pZCB0b28gbWFueSBzb2Z0d2FyZSBsYXllcnMg
d2hlbiBkb2luZyB0aGUgb3V0cHV0Lg0KPj4NCj4+IEhtbSwgSSdkIHJhdGhlciBleHBlY3QgdGhp
cyB0byBiZSB1c2VkIHRvIGF2b2lkIGRvaW5nIGFueXRoaW5nIGVsc2UNCj4+IHNlcmNvbl9wdXRz
KCkgZG9lcyBiZXNpZGVzIGNhbGxpbmcgc2VyaWFsX3B1dHMoKS4gVGhlc2Ugb3RoZXIgc3RlcHMN
Cj4+IGFyZSBhbHNvIHdoeSBJIHRoaW5rIHRoaXMgaXMgdG8gcmVtYWluIGEgY29uc29sZSBpbnRl
cm5hbCBpbnRlcmZhY2UuDQo+IA0KPiBUbyBtZSBpdCBzZWVtcyBhIGxpdHRsZSBiaXQgc3RyYW5n
ZSB0byBoYXZlIHRoZSBidWZmZXIgZHVtcGluZyB1c2luZw0KPiBzZXJjb25fcHV0cygpIHdoaWxl
IGlzc3VpbmcgdGhlIGFjdHVhbCB0cmFjZSBlbnRyaWVzIHRvIGNvbnNvbGUgaXNuJ3QNCj4gdXNp
bmcgaXQuDQoNCkkgZ3Vlc3MgSSBhZ3JlZS4NCg0KPj4+IEl0IHdvdWxkIGJlDQo+Pj4gcG9zc2li
bGUgdG8gdXNlIHNlcmNvbl9wdXRzKCkgZm9yIHRoYXQgY2FzZSwgdG9vLCByZXN1bHRpbmcgaW4g
dGhlDQo+Pj4gaW5hYmlsaXR5IHRvIHVzZSBkZWJ1Z3RyYWNlX3ByaW50aygpIGluIHRoZSB0aGVu
IGFkZGl0aW9uYWxseSBuZWVkZWQNCj4+PiBwYXRocyAob3IgYmV0dGVyOiB0byB1c2UgaXQgd2l0
aCBvdXRwdXQgcmVkaXJlY3RlZCB0byBjb25zb2xlKS4NCj4+Pg0KPj4+IHNlcmNvbl9wdXRzKCkg
Y291bGQgdXNlIGFub3RoZXIgd3JhcHBlciwgZS5nLiBjb25zb2xlX2RlYnVnX3B1dHMoKS4NCj4+
Pg0KPj4+IFdvdWxkIHlvdSBsaWtlIHRoYXQgYmV0dGVyPw0KPj4NCj4+IFByb2JhYmx5IG5vdC4g
SSB3b25kZXIgd2hldGhlciBzcGxpdHRpbmcgb3V0IHRoaXMgY29kZSBpcyByZWFsbHkgYQ0KPj4g
Z29vZCBzdGVwLg0KPiANCj4gSSdtIG5vdCBmaWdodGluZyBmb3IgaXQsIEkganVzdCB0aG91Z2h0
IGl0IHdvdWxkIGJldHRlciBiZSBwdXQgaW50byBhDQo+IGZpbGUgb2YgaXRzIG93bi4NCj4gDQo+
IEluIGNhc2UgeW91IGRpc2FncmVlIGFuZCBvdGhlcnMgYXJlIG5vdCBwdXNoaW5nIGZvciBzZXBh
cmF0aW9uIEknbSBmaW5lDQo+IHRvIGRyb3AgdGhpcyBwYXRjaC4NCg0KV2VsbCwgSSBkb24ndCBt
aW5kIHRoZSBzZXBhcmF0aW9uIGFzIGxvbmcgYXMgaXQncyBpbmRlZWQgcHJvcGVybHkNCnNlcGFy
YXRlZCBpbiB0aGUgZW5kLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
