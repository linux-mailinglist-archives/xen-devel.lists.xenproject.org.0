Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF4605D8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 14:21:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjNAi-0006BX-Vk; Fri, 05 Jul 2019 12:18:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LVWj=VC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hjNAh-0006BS-Af
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 12:18:35 +0000
X-Inumbo-ID: 0051ac1c-9f1f-11e9-a1eb-6f4c94685d4f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0051ac1c-9f1f-11e9-a1eb-6f4c94685d4f;
 Fri, 05 Jul 2019 12:18:31 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ns9Y/t7+N94zUhqnIDjbnr58NEECcDNF2pwLwYT5FkXTMspaGoccM4G2nl8Di/Srt5ZapJ3if7
 kPGf5rXJZHxfDa+hb1/FDPujnEvWfGm+KFzGBPPQ4u6HgrRuhT2GeJwQpItkuvRQJOi4umUPh0
 lzXQkIYR9UOOMaxpbKXmuLJ6aSLWfXriiY3aClNoH3AJulOovotgrSh5lAG94IO2C16Jl7I0kE
 iP7Gj2Mu2KKj8xlZdg/53phEekLv6wMfeFXcqvhpfa/lxZtU+ho34g9dBfui6n5skWeNwqNkYA
 e2s=
X-SBRS: 2.7
X-MesageID: 2643340
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,455,1557201600"; 
   d="scan'208";a="2643340"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v2 1/2] xmalloc: remove struct xmem_pool init_region
Thread-Index: AQHVMxBvsCy98hithUSg+ptDBmyO7Ka7zhSAgAAiFIA=
Date: Fri, 5 Jul 2019 12:18:12 +0000
Message-ID: <c25c88d8a3ea43cc8d232a52494233c6@AMSPEX02CL03.citrite.net>
References: <20190705090249.1935-1-paul.durrant@citrix.com>
 <20190705090249.1935-2-paul.durrant@citrix.com>
 <3f8e7d14-e0b7-6d4b-6fd4-aabffc644257@suse.com>
In-Reply-To: <3f8e7d14-e0b7-6d4b-6fd4-aabffc644257@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/2] xmalloc: remove struct xmem_pool
 init_region
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
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA1IEp1bHkgMjAxOSAxMzoxMg0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBD
b29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJh
ZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9y
ZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAxLzJdIHhtYWxsb2M6IHJlbW92ZSBzdHJ1Y3QgeG1lbV9wb29sIGluaXRfcmVnaW9u
DQo+IA0KPiBPbiAwNS4wNy4yMDE5IDExOjAyLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gVGhp
cyBwYXRjaCBkaXNwZW5zZXMgd2l0aCB0aGUgaW5pdF9yZWdpb24uIEl0J3Mgc2ltcGx5IG5vdCBu
ZWNlc3NhcnkNCj4gPiAocG9vbHMgd2lsbCBzdGlsbCBoYXBwaWx5IGdyb3cgYW5kIHNocmluayBv
biBkZW1hbmQgaW4gaXRzIGFic2VuY2UpIGFuZCB0aGUNCj4gPiBjb2RlIGNhbiBiZSBzaG9ydGVu
ZGVkIGJ5IHJlbW92aW5nIGl0LiBJdCBhbHNvIGF2b2lkcyB0aGUgc29sZSBldmFsdWF0aW9uDQo+
ID4gb2YgQUREX1JFR0lPTiB3aXRob3V0IGhvbGRpbmcgdGhlIHBvb2wgbG9jayAod2hpY2ggaXMg
dW5zYWZlKS4NCj4gDQo+IE9oLCBzbyB5b3UndmUgZmlndXJlZCB0aGVyZSBjYW4gYmUgZXZlbiBt
b3JlIGNvZGUgcmVtb3ZlZCB0aGFuDQo+IHdlIGZpcnN0IHRob3VnaHQuIE5pY2UuDQo+IA0KPiA+
IEBAIC0zNTIsMTMgKzM0Myw2IEBAIHZvaWQgeG1lbV9wb29sX2Rlc3Ryb3koc3RydWN0IHhtZW1f
cG9vbCAqcG9vbCkNCj4gPiAgICAgICBpZiAoIHBvb2wgPT0gTlVMTCApDQo+ID4gICAgICAgICAg
IHJldHVybjsNCj4gPg0KPiA+IC0gICAgLyogVXNlciBpcyBkZXN0cm95aW5nIHdpdGhvdXQgZXZl
ciBhbGxvY2F0aW5nIGZyb20gdGhpcyBwb29sICovDQo+ID4gLSAgICBpZiAoIHhtZW1fcG9vbF9n
ZXRfdXNlZF9zaXplKHBvb2wpID09IEJIRFJfT1ZFUkhFQUQgKQ0KPiA+IC0gICAgew0KPiA+IC0g
ICAgICAgIEFTU0VSVCghcG9vbC0+aW5pdF9yZWdpb24pOw0KPiA+IC0gICAgICAgIHBvb2wtPnVz
ZWRfc2l6ZSAtPSBCSERSX09WRVJIRUFEOw0KPiA+IC0gICAgfQ0KPiANCj4gSSBjYW4gc2VlIHRo
YXQgdGhlIEFTU0VSVCgpIGNhbiAoYW5kIG5lZWRzIHRvKSBnbyBhd2F5LiBCdXQgSQ0KPiBkb24n
dCB0aGluayB5b3UndmUgY2hhbmdlZCBhbnl0aGluZyBlbHNld2hlcmUgdGhhdCB3b3VsZCBhbHNv
DQo+IGFsbG93IHRoZSBlbnRpcmUgaWYoKSB0byBnbyBhd2F5Lg0KDQpJIHRoaW5rIHNvLiBBRkFJ
Q1QgdGhlIHNpemUgY2hlY2sgYWdhaW5zdCBCSERSX09WRVJIRUFEIGlzIGVudGlyZWx5IHRvIGF2
b2lkIHJlcG9ydGluZyBwcmVzZW5jZSBvZiB0aGUgaW5pdF9yZWdpb24gYXMgYSBsZWFrLiBJLmUu
IGluIHRoZSBwcmVzZW5jZSBvZiBhbiBpbml0X3JlZ2lvbiwgdGhlIHVzZWRfc2l6ZSB3b3VsZCBu
ZXZlciBkcm9wIGJlbG93IEJIRFJfT1ZFUkhFQUQuIFdpdGhvdXQgYW4gaW5pdF9yZWdpb24sIHVz
ZWRfc2l6ZSBzaG91bGQgZHJvcCBhbGwgdGhlIHdheSAoYmFjaykgdG8gMCB3aGVuIHRoZSBsYXN0
IHhmcmVlKCkgaXMgZG9uZS4NCg0KPiANCj4gPiBAQCAtMzgwLDE0ICszNjQsNiBAQCB2b2lkICp4
bWVtX3Bvb2xfYWxsb2ModW5zaWduZWQgbG9uZyBzaXplLCBzdHJ1Y3QgeG1lbV9wb29sICpwb29s
KQ0KPiA+ICAgICAgIGludCBmbCwgc2w7DQo+ID4gICAgICAgdW5zaWduZWQgbG9uZyB0bXBfc2l6
ZTsNCj4gPg0KPiA+IC0gICAgaWYgKCBwb29sLT5pbml0X3JlZ2lvbiA9PSBOVUxMICkNCj4gPiAt
ICAgIHsNCj4gPiAtICAgICAgICBpZiAoIChyZWdpb24gPSBwb29sLT5nZXRfbWVtKHBvb2wtPmlu
aXRfc2l6ZSkpID09IE5VTEwgKQ0KPiA+IC0gICAgICAgICAgICBnb3RvIG91dDsNCj4gPiAtICAg
ICAgICBBRERfUkVHSU9OKHJlZ2lvbiwgcG9vbC0+aW5pdF9zaXplLCBwb29sKTsNCj4gPiAtICAg
ICAgICBwb29sLT5pbml0X3JlZ2lvbiA9IHJlZ2lvbjsNCj4gPiAtICAgIH0NCj4gDQo+IEkuZS4g
dGhlIGNvZGUgZnVydGhlciBkb3duIGluIHRoaXMgZnVuY3Rpb24gdHVybmVkIG91dCB0byBub3QN
Cj4gZGVwZW5kIG9uIHRoZXJlIGJlaW5nIGF0IGxlYXN0IG9uZSByZWdpb24gaW4gdGhlIHBvb2ws
IG90aGVyDQo+IHRoYW4gSSB3YXMgYWZyYWlkIGl0IHdvdWxkLiBHb29kIC0gZXZlbiBtb3JlIHBy
ZXR0eSBhIGNoYW5nZS4NCg0KTm9wZS4gQWxsIHRoZSBsaXN0cyBjYW4gc3RhcnQgZW1wdHkgOi0p
DQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
