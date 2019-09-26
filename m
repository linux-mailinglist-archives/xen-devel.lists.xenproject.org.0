Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D73BF1CC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 13:35:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDS1H-0002Go-Pl; Thu, 26 Sep 2019 11:33:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8zHT=XV=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iDS1G-0002Fy-LJ
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 11:33:10 +0000
X-Inumbo-ID: 6a55f2ee-e051-11e9-97fb-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 6a55f2ee-e051-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569497590;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kaTA8/QbqZ19X3gRQsNXXjM78wuhSN3ph+hpegXfHG4=;
 b=DELTy6KQ5ZgNA066k9vb/p/KwMGWTBK7QDt0T3O6W4dNa6sQRQPf7rr0
 tjcbYI4miXRzE+coNhUETCv7yAKoUsosDEqOGVUyE1XYx1SWbfmISj9dJ
 vRriK7NKQhOXrD61ip/JOvu3HGXRBhh6PkkDGVgzDY44nsI3jiS4T7FAI 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: J5F11KKFz2avv3Ex0StSSwkmerV9w4GUFQszWrOIg0yW8mR89BhV8QAcB8pJwC7C6s0aeVtVAj
 1msiKhoKo+N0/dveXeg5DbcYtbgg1bysZ+0uZ8e+YBxU5oqIS2SL/qnpD9+AmJCRZq3Up9aiR/
 RIG9ZiGmcDj3QNdYg0ouo5CYK2hO3Hr4KIB6AbnulzzgoQjajMkiwSTZPPZfBZCfeAD4u4pGxa
 AT5KBZKT1cpb2tcze4guEXnAhsTbGjbtTlP667blSkNsednrvycm+KbSfoRU0+iKwSa45sncVo
 D+0=
X-SBRS: 2.7
X-MesageID: 6114356
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,551,1559534400"; 
   d="scan'208";a="6114356"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] iommu: avoid triggering ASSERT_UNREACHABLE() on ARM...
Thread-Index: AQHVdFGaR/iXprL1FEud8/buov5ptqc9r7iAgAAj0VA=
Date: Thu, 26 Sep 2019 11:32:50 +0000
Message-ID: <cc5c1a0c09b04a1cb166b93a2fc06c83@AMSPEX02CL03.citrite.net>
References: <20190926100308.33936-1-paul.durrant@citrix.com>
 <64022609-fdd5-f9bd-4975-228213a2572a@arm.com>
In-Reply-To: <64022609-fdd5-f9bd-4975-228213a2572a@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] iommu: avoid triggering
 ASSERT_UNREACHABLE() on ARM...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Oleksandr <olekstysh@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPg0KPiBTZW50OiAyNiBTZXB0ZW1iZXIgMjAxOSAxMjoyNA0KPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBDYzogT2xla3NhbmRyIDxvbGVrc3R5c2hAZ21haWwuY29tPjsgQW5k
cmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXANCj4g
PEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRy
aXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsNCj4gS29ucmFkIFJ6ZXN6
dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsgVGltDQo+IChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBpb21tdTogYXZvaWQg
dHJpZ2dlcmluZyBBU1NFUlRfVU5SRUFDSEFCTEUoKSBvbiBBUk0uLi4NCj4gDQo+IEhpIFBhdWws
DQo+IA0KPiBPbiA5LzI2LzE5IDExOjAzIEFNLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gLi4u
d2hlbiB0aGUgSU9NTVUgaXMgbm90IGVuYWJsZWQuDQo+ID4NCj4gPiA4MGZmM2QzMzhkYzkgImlv
bW11OiB0aWR5IHVwIGlvbW11X3VzZV9oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkN
Cj4gPiBtYWNyb3MiIGludHJvZHVjZWQgQ09ORklHX0lPTU1VX0ZPUkNFX1BUX1NIQVJFLCB3aGlj
aCBjYXVzZXMgdGhlIGdsb2JhbA0KPiA+ICdpb21tdV9oYXBfcHRfc2hhcmUnIG9wdGlvbiB0byBi
ZSByZXBsYWNlZCB3aXRoIGEgI2RlZmluZS1kIHZhbHVlIG9mIHRydWUuDQo+ID4gSW4gdGhpcyBj
b25maWd1cmF0aW9uLCBjYWxsaW5nIGNsZWFyX2lvbW11X2hhcF9wdF9zaGFyZSgpIHdpbGwgcmVz
dWx0DQo+ID4gdHJpZ2dlciB0aGUgYWZvcmVtZW50aW9uZWQgQVNTRVJULg0KPiA+DQo+ID4gQ09O
RklHX0lPTU1VX0ZPUkNFX1BUX1NIQVJFIGlzIGFsd2F5cyBzZWxlY3RlZCBmb3IgQVJNIGJ1aWxk
cyBhbmQsDQo+ID4gYmVjYXVzZSBjbGVhcl9pb21tdV9oYXBfcHRfc2hhcmUoKSBpcyBjYWxsZWQg
YnkgdGhlIGNvbW1vbiBpb21tdV9zZXR1cCgpDQo+ID4gZnVuY3Rpb24gaWYgdGhlIElPTU1VIGlz
IG5vdCBlbmFibGVkLCBpdCBpcyBubyBsb25nZXIgc2FmZSB0byBkaXNhYmxlIHRoZQ0KPiA+IElP
TU1VIG9uIEFSTSBzeXN0ZW1zLg0KPiA+DQo+ID4gSG93ZXZlciwgcnVubmluZyB3aXRoIHRoZSBJ
T01NVSBkaXNhYmxlZCBpcyBhIHZhbGlkIGNvbmZpZ3VyYXRpb24gZm9yIEFSTQ0KPiA+IHN5c3Rl
bXMsIHNvIHRoaXMgcGF0Y2ggcmVjdGlmaWVzIHRoZSBwcm9ibGVtIGJ5IHJlbW92aW5nIHRoZSBj
YWxsIHRvDQo+ID4gY2xlYXJfaW9tbXVfaGFwX3B0X3NoYXJlKCkgZnJvbSBjb21tb24gY29kZS4g
QXMgYSBzaWRlIGVmZmVjdCBvZiB0aGlzLA0KPiA+IGhvd2V2ZXIsIGl0IGJlY29tZXMgcG9zc2li
bGUgb24geDg2IHN5c3RlbXMgZm9yIGlvbW11X2VuYWJsZWQgdG8gYmUgZmFsc2UNCj4gPiBidXQg
aW9tbXVfaGFwX3B0X3NoYXJlIHRvIGJlIHRydWUuIFRodXMgdGhlIGNvZGUgaW4gc3lzY3RsLmMN
Cj4gPiBuZWVkcyB0byBiZSBjaGFuZ2VkIHRvIG1ha2Ugc3VyZSB0aGF0IFhFTl9TWVNDVExfUEhZ
U0NBUF9pb21tdV9oYXBfcHRfc2hhcmUNCj4gPiBpcyBub3QgZXJyb25lb3VzbHkgYWR2ZXJ0aXNl
ZCB3aGVuIHRoZSBJT01NVSBoYXMgYmVlbiBkaXNhYmxlZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQo+ID4gUmVwb3J0ZWQt
Ynk6IE9sZWtzYW5kciA8b2xla3N0eXNoQGdtYWlsLmNvbT4NCj4gDQo+IFdpdGggb25lIE5JVCBi
ZWxvdzoNCj4gDQo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
Pg0KPiANCj4gPiAtLS0NCj4gPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4NCj4gPiBDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXgu
Y29tPg0KPiA+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4NCj4g
PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+IENjOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPiA+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsg
PGtvbnJhZC53aWxrQG9yYWNsZS5jb20+DQo+ID4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPiBDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+DQo+
ID4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+ID4gLS0tDQo+ID4gICB4ZW4vY29tbW9uL3N5
c2N0bC5jICAgICAgICAgICAgIHwgNiArKysrLS0NCj4gPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMgfCAxIC0NCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc3lzY3Rs
LmMgYi94ZW4vY29tbW9uL3N5c2N0bC5jDQo+ID4gaW5kZXggZTg3NjNjN2ZkZi4uZjg4YTI4NWU3
ZiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vY29tbW9uL3N5c2N0bC5jDQo+ID4gKysrIGIveGVuL2Nv
bW1vbi9zeXNjdGwuYw0KPiA+IEBAIC0yNjgsOSArMjY4LDExIEBAIGxvbmcgZG9fc3lzY3RsKFhF
Tl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX3N5c2N0bF90KSB1X3N5c2N0bCkNCj4gPiAgICAgICAg
ICAgcGktPm1heF9tZm4gPSBnZXRfdXBwZXJfbWZuX2JvdW5kKCk7DQo+ID4gICAgICAgICAgIGFy
Y2hfZG9fcGh5c2luZm8ocGkpOw0KPiA+ICAgICAgICAgICBpZiAoIGlvbW11X2VuYWJsZWQgKQ0K
PiA+ICsgICAgICAgIHsNCj4gPiAgICAgICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVO
X1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvOw0KPiA+IC0gICAgICAgIGlmICggaW9tbXVfaGFwX3B0
X3NoYXJlICkNCj4gPiAtICAgICAgICAgICAgcGktPmNhcGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RM
X1BIWVNDQVBfaW9tbXVfaGFwX3B0X3NoYXJlOw0KPiA+ICsgICAgICAgICAgICBpZiAoIGlvbW11
X2hhcF9wdF9zaGFyZSApDQo+ID4gKyAgICAgICAgICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9
IFhFTl9TWVNDVExfUEhZU0NBUF9pb21tdV9oYXBfcHRfc2hhcmU7DQo+ID4gKyAgICAgICAgfQ0K
PiA+DQo+ID4gICAgICAgICAgIGlmICggY29weV90b19ndWVzdCh1X3N5c2N0bCwgb3AsIDEpICkN
Cj4gPiAgICAgICAgICAgICAgIHJldCA9IC1FRkFVTFQ7DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21t
dS5jDQo+ID4gaW5kZXggZThmZGRjMmRjNy4uYzMzY2E3MGVjOSAxMDA2NDQNCj4gPiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvaW9tbXUuYw0KPiA+IEBAIC00NTYsNyArNDU2LDYgQEAgaW50IF9faW5pdCBpb21t
dV9zZXR1cCh2b2lkKQ0KPiA+ICAgICAgIGlmICggIWlvbW11X2VuYWJsZWQgKQ0KPiA+ICAgICAg
IHsNCj4gPiAgICAgICAgICAgaW9tbXVfaW50cmVtYXAgPSAwOw0KPiA+IC0gICAgICAgIGNsZWFy
X2lvbW11X2hhcF9wdF9zaGFyZSgpOw0KPiA+ICAgICAgIH0NCj4gDQo+IE5JVDogVGhlIHt9IGNh
biBub3cgYmUgcmVtb3ZlZC4NCj4gDQo+IEkgY2FuIGZpeCBpdCBvbiBjb21taXQuDQoNCkdvb2Qg
cG9pbnQuIFRoYW5rcywNCg0KICBQYXVsDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1
bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
