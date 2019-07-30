Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027AE7A548
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:56:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOpK-0001yc-Nc; Tue, 30 Jul 2019 09:53:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sDM=V3=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hsOpI-0001yX-Ib
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:53:48 +0000
X-Inumbo-ID: ea979f2c-b2af-11e9-8bf0-fbf5acbe6d21
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea979f2c-b2af-11e9-8bf0-fbf5acbe6d21;
 Tue, 30 Jul 2019 09:53:44 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6BfyXuUFRraHFQvnlxXqCPNJu95eV5jWr+XpSQpaLx8QQnlYJWDofmU8CvIJumCeQX70QgQgNm
 a8Ee8nhlIEEwGSu6Gbxb1nKqlp60D2IOjX02tfFfLYTnVuyEPxLCsqO24fg5EtM9VghcBNICdN
 0vXYB7LoyO5/rO8y9DvJu6EcvveVLOdOxp/bnPuQVAsrp0oLeizhj/czXLmdctlRiCwCX0CS9U
 cZ97PKkoHdQhpJMVQenMomxQe8H2vvDHnsSka8JfPzENRDq2U0Q4XNsuxN5jjbJAHBa8o3tLii
 Qwk=
X-SBRS: 2.7
X-MesageID: 3749159
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3749159"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/6] domain: stash xen_domctl_createdomain
 flags in struct domain
Thread-Index: AQHVQu5f9Cm4BI8UYkuwivtzr2jeyKbix8wAgAACVACAACkwYA==
Date: Tue, 30 Jul 2019 09:53:39 +0000
Message-ID: <680c55eef9724b24bdc8492e54315176@AMSPEX02CL03.citrite.net>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-2-paul.durrant@citrix.com>
 <f1afdb08-b40d-99a7-1938-5a0ad8a66bc4@suse.com>
 <42eab6c8-0e11-e44a-5aa0-32c3c4244249@suse.com>
In-Reply-To: <42eab6c8-0e11-e44a-5aa0-32c3c4244249@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/6] domain: stash
 xen_domctl_createdomain flags in struct domain
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIEp1bHkgMjAxOSAxMDoyNg0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IEp1bGllbkdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+
OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nv
biA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgS29ucmFk
IFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGltIChYZW4ub3Jn
KSA8dGltQHhlbi5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hl
bi1kZXZlbF0gW1BBVENIIHYyIDEvNl0gZG9tYWluOiBzdGFzaCB4ZW5fZG9tY3RsX2NyZWF0ZWRv
bWFpbiBmbGFncyBpbiBzdHJ1Y3QgZG9tYWluDQo+IA0KPiBPbiAzMC4wNy4yMDE5IDExOjE3LCBK
YW4gQmV1bGljaCB3cm90ZToNCj4gPiBPbiAyNS4wNy4yMDE5IDE1OjM5LCBQYXVsIER1cnJhbnQg
d3JvdGU6DQo+ID4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+ID4+ICsrKyBiL3hl
bi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+ID4+IEBAIC0zMDYsNiArMzA2LDcgQEAgZW51bSBndWVz
dF90eXBlIHsNCj4gPj4NCj4gPj4gICAgc3RydWN0IGRvbWFpbg0KPiA+PiAgICB7DQo+ID4+ICsg
ICAgdW5zaWduZWQgaW50ICAgICBvcHRpb25zOyAgICAgICAgIC8qIGNvcHkgb2YgY3JlYXRlZG9t
YWluIGZsYWdzICovDQo+ID4+ICAgICAgIGRvbWlkX3QgICAgICAgICAgZG9tYWluX2lkOw0KPiA+
Pg0KPiA+PiAgICAgICB1bnNpZ25lZCBpbnQgICAgIG1heF92Y3B1czsNCj4gPg0KPiA+IEkgd2Fz
IGFib3V0IHRvIGNvbW1pdCB0aGlzIHdoZW4gSSBub3RpY2VkIHRoZSBwbGFjZW1lbnQgaGVyZToN
Cj4gPiBJIHRoaW5rIGl0IHdvdWxkIGJlIHByZXR0eSBnb29kIHRvIHJldGFpbiBkb21haW5faWQg
YXMgdGhlDQo+ID4gZmlyc3QgZmllbGQuIEknbGwgYmUgaGFwcHkgdG8gbWFrZSB0aGF0IGFkanVz
dG1lbnQgd2hpbGUNCj4gPiBjb21taXR0aW5nLCBhcyBsb25nIGFzIHlvdSBhcmUgZmluZSB3aXRo
IG1lIGRvaW5nIHNvLg0KPiANCj4gQW5kIEkgcmVhbGl6ZSBJIHNob3VsZCBoYXZlIHNhaWQgd2hl
cmUgSSdkIHdhbnQgdG8gcHV0IGl0OiBJDQo+IHRoaW5rIGl0IHdhbnRzIHRvIGdvIG5leHQgdG8g
Z3Vlc3RfdHlwZSwgc28gdGhhdCBvbmNlIHRoYXQNCj4gZmllbGQgZ29lcyBhd2F5IHN0cnVjdHVy
ZSBsYXlvdXQgKGkuZS4gaG9sZXMgYW5kIG92ZXJhbGwgc2l6ZSkNCj4gaXMgdGhlIHNhbWUgYWdh
aW4uDQoNCk9rLCBJIGRvbid0IHJlYWxseSBtaW5kLg0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
