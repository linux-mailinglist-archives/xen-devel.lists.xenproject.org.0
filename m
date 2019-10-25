Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8D9E4340
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 08:10:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNskp-0000bt-L8; Fri, 25 Oct 2019 06:07:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNsko-0000bo-0g
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 06:07:18 +0000
X-Inumbo-ID: aa7d4a54-f6ed-11e9-beca-bc764e2007e4
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa7d4a54-f6ed-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 06:07:15 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 25 Oct 2019 06:06:32 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 25 Oct 2019 06:06:51 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 25 Oct 2019 06:06:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5PXvipugNs+hs5zWgkFL6PCyBOoYy1LMP5iyjj4bk3Ft7cukXozO6e0LR1VLi+rf0mEodtnH9fX28vVhCdjRhfN0e11mUUzCq+dp5hOdWq5yBPVl+rqcbOowbY8foXn6SU6UBIjuK21Le9K+B1yi828qFv8fZQ/3XXuB32PcW+YLXq9JYgP2ElNsSaTSLb6owl7C8GpaH09qv3I914lDTW431flAleA6fqm/32vFZ9AsgiPH6Nt69uvOdzKLAa8j7J6wKPji1erVyVa8k5SFwJmmUVaopufB/RRb0MJNd3JtIk3/PyWG6CAFAn39j9QOl5og/yTeT4XdBQCahGUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMX7lGvxSPdl5PzLWk+IbRvPBnLgh6FmclVNkqC+qs4=;
 b=WG+PfaAdmrSPDiFYsTo8j1NNJVIh1HKYswvEgqfkozFh8WKcJprDSPAa0TdTwaZnWAfnTiOA+jdXIlx5Ix+48fPnT5im0Cl8lloSLymDWy01ExaK/7s7zDWnLQ+qpdbuw6Qc18vsZnuSookXy1ZZysa8PoYX0Azf49UosT0vT1LtXZ+Hdgz7101cDKdhuv6SiUjiSI6E5zD+EvMM60ceELFah/EukAN4bdUtma2U3nRt3/9nkcoM2EElWDKSZRXthfmV20RE8JkAS3sxuxhWcvRGB+l4wtFaYvhRzHJpZXSC/9uKt6fzKMu4bLiuns9kLUQguvBrLHF3LBTbTQyeeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.237.86) by
 MN2PR18MB3183.namprd18.prod.outlook.com (10.255.237.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Fri, 25 Oct 2019 06:06:50 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::381d:ee13:dd74:e67]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::381d:ee13:dd74:e67%5]) with mapi id 15.20.2387.023; Fri, 25 Oct 2019
 06:06:50 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andy Lutomirski <luto@kernel.org>
Thread-Topic: [PATCH] x86/stackframe/32: repair 32-bit Xen PV
Thread-Index: AQHVfPvP/Yo6NHBnMEyqZH3h0nrNOKdqEYeAgADpQIA=
Date: Fri, 25 Oct 2019 06:06:50 +0000
Message-ID: <4c4b0cdf-55e5-7be5-bf49-08fe8fd18dca@suse.com>
References: <ef1c9381-dfc7-7150-feca-581f4d798513@suse.com>
 <CALCETrWAALF7EgxHGs-rtZwk1Fxttr56QKXeB6QssXbyXDs+kA@mail.gmail.com>
In-Reply-To: <CALCETrWAALF7EgxHGs-rtZwk1Fxttr56QKXeB6QssXbyXDs+kA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0128.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::33) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:166::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2003:ca:b710:a31c:85e3:75ec:13a9:ea6b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbfc0e81-6cd7-492c-afc9-08d759118651
x-ms-traffictypediagnostic: MN2PR18MB3183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR18MB3183FE3140246D4F010DE860B3650@MN2PR18MB3183.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(199004)(189003)(64756008)(66556008)(14454004)(478600001)(66476007)(31686004)(6512007)(46003)(66946007)(66446008)(2906002)(52116002)(6116002)(14444005)(71190400001)(36756003)(256004)(76176011)(386003)(25786009)(71200400001)(53546011)(99286004)(6436002)(102836004)(6486002)(86362001)(316002)(31696002)(6506007)(229853002)(66574012)(8936002)(6916009)(81166006)(81156014)(8676002)(107886003)(476003)(5660300002)(2616005)(4326008)(54906003)(11346002)(486006)(6246003)(446003)(7736002)(186003)(305945005)(80792005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3183;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aZ3m5kyy+8pzrQB0dk18s0AQwMQUCLavSucGamgUiGDltj3slcGYSbnFCAwMXpNjiQb1pghqfXcXeiqBGZk5i2xJsVRLnTSgCTyv5RnyxjK5fGg9fxNkZbcWJg2Efq4WnRKghjZaIstwCGqUtenTWhxchv88YuBtXJYAdMo+l0J1ZaY0iROZmerGcpOvPGdSP7j9FQhW90MYL4D+1ONb1iiobm3vGrSg5i3/93ImxwJ4wRFldD8eLO/YeWxmYmheGV5wDTSn+SunC8WVykbENXRLz2qgpx85w0J11VtLHpnzAKp7fFCadV2sv2bA7csA6b5ZmgL2TP0RdsmEx0+AvD+R70dA2WBKDNrU2PKu7TzCXNAQTXfz9+ecOVPQaA3fXeNp3g+SZRjgQ8YrqaaF5/bdY4SzH5Z65r33hsiCyDrZ5xLz9lKWehNemrE/OUZA
Content-ID: <3BE09709F1143B49AB4B746BF752F78A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfc0e81-6cd7-492c-afc9-08d759118651
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 06:06:50.0440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /QUZYE8IeG2RHF+ZQbBe9zQe52FCAFUl3xJ2WUPg0JvS4NdoAzPrsMGH+Gt4/mTRlnh7KVLRtVnJpkwlRF8rhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3183
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/stackframe/32: repair 32-bit Xen PV
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 X86 ML <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Juergen Gross <JGross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMjAxOSAxODoxMSwgQW5keSBMdXRvbWlyc2tpIHdyb3RlOg0KPiBPbiBNb24sIE9j
dCA3LCAyMDE5IGF0IDM6NDEgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToNCj4+DQo+PiBPbmNlIGFnYWluIFJQTCBjaGVja3MgaGF2ZSBiZWVuIGludHJvZHVjZWQgd2hp
Y2ggZG9uJ3QgYWNjb3VudCBmb3IgYQ0KPj4gMzItYml0IGtlcm5lbCBsaXZpbmcgaW4gcmluZyAx
IHdoZW4gcnVubmluZyBpbiBhIFBWIFhlbiBkb21haW4uIFRoZQ0KPj4gY2FzZSBpbiBGSVhVUF9G
UkFNRSBoYXMgYmVlbiBwcmV2ZW50aW5nIGJvb3Q7IGFkanVzdCBCVUdfSUZfV1JPTkdfQ1IzDQo+
PiBhcyB3ZWxsIGp1c3QgaW4gY2FzZS4NCj4gDQo+IEknbSBva2F5IHdpdGggdGhlIGdlbmVyYXRl
ZCBjb2RlLCBidXQgSU1PIHRoZSBtYWNybyBpcyB0b28gaW5kaXJlY3QNCj4gZm9yIHNvbWV0aGlu
ZyB0aGF0J3MgdHJpdmlhbC4NCj4gDQo+Pg0KPj4gRml4ZXM6IDNjODhjNjkyYzI4NyAoIng4Ni9z
dGFja2ZyYW1lLzMyOiBQcm92aWRlIGNvbnNpc3RlbnQgcHRfcmVncyIpDQo+PiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pg0KPj4gLS0tIGEvYXJjaC94
ODYvZW50cnkvZW50cnlfMzIuUw0KPj4gKysrIGIvYXJjaC94ODYvZW50cnkvZW50cnlfMzIuUw0K
Pj4gQEAgLTQ4LDYgKzQ4LDE3IEBADQo+Pg0KPj4gICAjaW5jbHVkZSAiY2FsbGluZy5oIg0KPj4N
Cj4+ICsjaWZuZGVmIENPTkZJR19YRU5fUFYNCj4+ICsjIGRlZmluZSBVU0VSX1NFR01FTlRfUlBM
X01BU0sgU0VHTUVOVF9SUExfTUFTSw0KPj4gKyNlbHNlDQo+PiArLyoNCj4+ICsgKiBXaGVuIHJ1
bm5pbmcgcGFyYXZpcnR1YWxpemVkIG9uIFhlbiB0aGUga2VybmVsIHJ1bnMgaW4gcmluZyAxLCBh
bmQgaGVuY2UNCj4+ICsgKiBzaW1wbGUgbWFzayBiYXNlZCB0ZXN0cyAoaS5lLiBvbmVzIG5vdCBj
b21wYXJpbmcgYWdhaW5zdCBVU0VSX1JQTCkgaGF2ZSB0bw0KPj4gKyAqIGlnbm9yZSBiaXQgMC4g
U2VlIGFsc28gdGhlIEMtbGV2ZWwgZ2V0X2tlcm5lbF9ycGwoKS4NCj4+ICsgKi8NCj4gDQo+IEhv
dyBhYm91dDoNCj4gDQo+IC8qDQo+ICAgKiBXaGVuIHJ1bm5pbmcgb24gWGVuIFBWLCB0aGUgYWN0
dWFsICVjcyByZWdpc3RlciBpbiB0aGUga2VybmVsIGlzIDEsIG5vdCAwLg0KPiAgICogSWYgd2Ug
bmVlZCB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIGEgJWNzIGZyb20ga2VybmVsIG1vZGUgYW5kIGEg
JWNzIGZyb20NCj4gICAqIHVzZXIgbW9kZSwgd2UgY2FuIGRvIHRlc3QgJDIgaW5zdGVhZCBvZiB0
ZXN0ICQzLg0KPiAgICovDQo+ICNkZWZpbmUgVVNFUl9TRUdNRU5UX1JQTF9NQVNLIDINCg0KSS5l
LiB5b3UncmUgZmluZSB1c2luZyBqdXN0IHRoZSBzaW5nbGUgYml0IGluIGFsbCBjb25maWd1cmF0
aW9ucz8NCg0KPj4gKyMgZGVmaW5lIFVTRVJfU0VHTUVOVF9SUExfTUFTSyAoU0VHTUVOVF9SUExf
TUFTSyAmIH4xKQ0KPj4gKyNlbmRpZg0KPj4gKw0KPj4gICAgICAgICAgLnNlY3Rpb24gLmVudHJ5
LnRleHQsICJheCINCj4+DQo+PiAgIC8qDQo+PiBAQCAtMTcyLDcgKzE4Myw3IEBADQo+PiAgICAg
ICAgICBBTFRFUk5BVElWRSAiam1wIC5MZW5kX1xAIiwgIiIsIFg4Nl9GRUFUVVJFX1BUSQ0KPj4g
ICAgICAgICAgLmlmIFxub191c2VyX2NoZWNrID09IDANCj4+ICAgICAgICAgIC8qIGNvbWluZyBm
cm9tIHVzZXJtb2RlPyAqLw0KPj4gLSAgICAgICB0ZXN0bCAgICRTRUdNRU5UX1JQTF9NQVNLLCBQ
VF9DUyglZXNwKQ0KPj4gKyAgICAgICB0ZXN0bCAgICRVU0VSX1NFR01FTlRfUlBMX01BU0ssIFBU
X0NTKCVlc3ApDQo+IA0KPiBTaG91bGRuJ3QgUFRfQ1MoJWVzcCkgYmUgMCBpZiB3ZSBjYW1lIGZy
b20gdGhlIGtlcm5lbD8gIEknbSBndWVzc2luZw0KPiB0aGUgYWN0dWFsIGJ1ZyBpcyBpbiB3aGF0
ZXZlciBjb2RlIHB1dCAxIGluIGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiANCj4gSW4gb3Ro
ZXIgd29yZHMsIEknbSBoYXZpbmcgdHJvdWJsZSB1bmRlcnN0YW5kaW5nIHdoeSB0aGVyZSBpcyBh
bnkNCj4gY29udGV4dCBpbiB3aGljaCBzb21lIHZhbHVlIHdvdWxkIGJlIDMgZm9yIHVzZXIgbW9k
ZSBhbmQgMSBmb3Iga2VybmVsDQo+IG1vZGUuICBPYnZpb3VzbHkgaWYgd2UncmUgbWFudWFsbHkg
SVJFVGluZyB0byBrZXJuZWwgbW9kZSwgd2UgbmVlZCB0bw0KPiBzZXQgQ1MgdG8gMSwgYnV0IGlm
IHdlJ3JlIGZpbGxpbmcgaW4gb3VyIG93biBQVF9DUywgd2Ugc2hvdWxkIGp1c3QNCj4gd3JpdGUg
MC4NCj4gDQo+IFRoZSBzdXBwb3NlZGx5IG9mZmVuZGluZyBjb21taXQgKCIieDg2L3N0YWNrZnJh
bWUvMzI6IFByb3ZpZGUNCj4gY29uc2lzdGVudCBwdF9yZWdzIikgbG9va3MgY29ycmVjdCB0byBt
ZSwgc28gSSBzdXNwZWN0IHRoYXQgdGhlDQo+IHByb2JsZW0gaXMgZWxzZXdoZXJlLiAgT3IgaXMg
aXQgaW50ZW50aW9uYWwgdGhhdCBYZW4gUFYncyBhc20NCj4gKGFyY2gveDg2L3hlbi93aGF0ZXZl
cikgc3RpY2tzIDEgaW50byB0aGUgQ1MgZmllbGQgb24gdGhlIHN0YWNrPw0KDQpNYW51YWxseSBj
cmVhdGVkIC8gdXBkYXRlZCBmcmFtZXMgX2NvdWxkXyBpbiBwcmluY2lwbGUgbW9kaWZ5IHRoZQ0K
UlBMLCBidXQgb25lcyBjb21pbmcgZnJvbSBoYXJkd2FyZSAob2xkIDMyLWJpdCBoeXBlcnZpc29y
cykgb3IgWGVuDQooNjQtYml0IGh5cGVydmlzb3JzKSB3aWxsIGhhdmUgYW4gUlBMIG9mIDEsIGFz
IGFscmVhZHkgc2FpZCBieQ0KQW5kcmV3LiBXZSBjb3VsZCBpbiBwcmluY2lwbGUgYWxzbyBhZGQg
YSBWTSBhc3Npc3QgZm9yIHRoZQ0KaHlwZXJ2aXNvciB0byBzdG9yZSBhbiBSUEwgb2YgMCwgYnV0
IEknZCBleHBlY3QgdGhpcyB0byByZXF1aXJlDQpmdXJ0aGVyIGtlcm5lbCBjaGFuZ2VzLCBhbmQg
dG9nZXRoZXIgd2l0aCB0aGUgb2xkIGJlaGF2aW9yIHN0aWxsDQpiZWluZyByZXF1aXJlZCB0byBz
dXBwb3J0IEknbSB1bmNvbnZpbmNlZCB0aGlzIHdvdWxkIGJlIHdvcnRoIGl0Lg0KDQo+IEFsc28s
IHdoeSBhcmUgd2Ugc3VwcG9ydGluZyAzMi1iaXQgTGludXggUFYgZ3Vlc3RzIGF0IGFsbD8gIENh
biB3ZQ0KPiBqdXN0IGRlbGV0ZSB0aGlzIGNvZGUgaW5zdGVhZD8NCg0KVGhpcyB3YXMgYWxyZWFk
eSBzdWdnZXN0ZWQgYnkgSsO8cmdlbiAobm93IGFsc28gQ0MtZWQpLCBidXQgaW4gcmVwbHkNCml0
IHdhcyBwb2ludGVkIG91dCB0aGF0IHRoZSBwcm9jZXNzIHdvdWxkIGJlIHRvIGZpcnN0IGRlcHJl
Y2F0ZSB0aGUNCmNvZGUsIGFuZCByZW1vdmUgaXQgb25seSBhIGNvdXBsZSBvZiByZWxlYXNlcyBs
YXRlciBpZiBuby1vbmUgY29tZXMNCnVwIHdpdGggYSByZWFzb24gdG8gcmV0YWluIGl0Lg0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
