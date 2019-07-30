Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E537A418
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:27:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOMp-000762-Uv; Tue, 30 Jul 2019 09:24:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sDM=V3=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hsOMo-00075t-C2
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:24:22 +0000
X-Inumbo-ID: d029b59a-b2ab-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d029b59a-b2ab-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 09:24:21 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +2ceGqmpejnNlOYpJUfhRyzmEtJeKNb+hmzZn/LfcxBBkFZu8Ps73LIeMjci0CSbbwYVEpN2hG
 4ri/OoFmLwqWgsbwaTkxPGi5p+KDYNVHuZxyim0yU7PwSda9Nb0DsvK7hos05dhCZGqGUIi4P8
 veeC6fSt14XjBG/WaAGiWxspBS+8sluvtvUw/58eUiVrFa3HTPtML3Qyozy9ifrdavsRG11V0q
 yzgbJWy6DtngQymixwZc4CeBny56XgkM50U+oB4v95vl/2zMdHGEW7ygJfKkEjvl9pGbi6AxXK
 xG8=
X-SBRS: 2.7
X-MesageID: 3709986
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3709986"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/6] domain: stash xen_domctl_createdomain
 flags in struct domain
Thread-Index: AQHVQu5f9Cm4BI8UYkuwivtzr2jeyKbix8wAgAAjPPA=
Date: Tue, 30 Jul 2019 09:24:17 +0000
Message-ID: <2e251f176fe44833a2d8f6b915955459@AMSPEX02CL03.citrite.net>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-2-paul.durrant@citrix.com>
 <f1afdb08-b40d-99a7-1938-5a0ad8a66bc4@suse.com>
In-Reply-To: <f1afdb08-b40d-99a7-1938-5a0ad8a66bc4@suse.com>
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
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIEp1bHkgMjAxOSAxMDoxNw0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBD
b29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJh
ZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9y
ZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtY
ZW4tZGV2ZWxdIFtQQVRDSCB2MiAxLzZdIGRvbWFpbjogc3Rhc2ggeGVuX2RvbWN0bF9jcmVhdGVk
b21haW4gZmxhZ3MgaW4gc3RydWN0IGRvbWFpbg0KPiANCj4gT24gMjUuMDcuMjAxOSAxNTozOSwg
UGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+
ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4gPiBAQCAtMzA2LDYgKzMwNiw3IEBA
IGVudW0gZ3Vlc3RfdHlwZSB7DQo+ID4NCj4gPiAgIHN0cnVjdCBkb21haW4NCj4gPiAgIHsNCj4g
PiArICAgIHVuc2lnbmVkIGludCAgICAgb3B0aW9uczsgICAgICAgICAvKiBjb3B5IG9mIGNyZWF0
ZWRvbWFpbiBmbGFncyAqLw0KPiA+ICAgICAgZG9taWRfdCAgICAgICAgICBkb21haW5faWQ7DQo+
ID4NCj4gPiAgICAgIHVuc2lnbmVkIGludCAgICAgbWF4X3ZjcHVzOw0KPiANCj4gSSB3YXMgYWJv
dXQgdG8gY29tbWl0IHRoaXMgd2hlbiBJIG5vdGljZWQgdGhlIHBsYWNlbWVudCBoZXJlOg0KPiBJ
IHRoaW5rIGl0IHdvdWxkIGJlIHByZXR0eSBnb29kIHRvIHJldGFpbiBkb21haW5faWQgYXMgdGhl
DQo+IGZpcnN0IGZpZWxkLiBJJ2xsIGJlIGhhcHB5IHRvIG1ha2UgdGhhdCBhZGp1c3RtZW50IHdo
aWxlDQo+IGNvbW1pdHRpbmcsIGFzIGxvbmcgYXMgeW91IGFyZSBmaW5lIHdpdGggbWUgZG9pbmcg
c28uDQoNClllcywgc3VyZS4gSSBndWVzcyBwdXQgaXQganVzdCBiZWxvdyBkb21pZCBpbnN0ZWFk
Lg0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
