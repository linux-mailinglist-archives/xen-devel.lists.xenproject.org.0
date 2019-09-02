Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2CA593C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 16:25:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4nDE-0003oM-Gn; Mon, 02 Sep 2019 14:21:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R1Xd=W5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i4nDD-0003oH-9g
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 14:21:43 +0000
X-Inumbo-ID: fc1dbb3a-cd8c-11e9-ac23-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc1dbb3a-cd8c-11e9-ac23-bc764e2007e4;
 Mon, 02 Sep 2019 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567434103;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TUs+KdnCdq4LqqvtFD/6eLtEE4poZqbuVZSyVPpzO9Q=;
 b=f4/XDagaL/72PslwsNLHQ36YrUv5vfRMY3GBoloXH6BMeYDY2QpWWU/1
 4HBDvpnlwzYFTV8V1HrRdzbhuTRlDoehSQEhmkvtmx0GsIxC28dbsFFJ+
 xImSP4uu4AEkwXr0/CzIWFtwSQLNcLye3GY1aeh9lw9ChmraKRFPrxAw4 k=;
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
IronPort-SDR: NNe2ATWpJGuvE8fdkrJWRROCE/fylJzys3HH4sifPGAYeF2qteluwrAyeGccd3p1lVx78JqqTj
 fQqUrvyMsgRyDRS/l5FFzkGji+niY4fNrnY8koC/htgELjMLVcR/GA7b85623RGJOLQmTlIGIP
 u3f7RTn4eLQuflqVzM/Hw7tvPOiYEXKi1d3hmu3mL2w28n/kPi2KdjJZFEZ80S448uDBHcxHm0
 Q2B44sCZlQOuiqfxK+niDO3dWQuYXyYHptFDn1xopdADgN9vZmGz19hC/KVayaolJozjHhpady
 Mew=
X-SBRS: 2.7
X-MesageID: 5068512
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5068512"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v7 1/6] x86/domain: remove the 'oos_off' flag
Thread-Index: AQHVXw0b+0WFjb3WC0C8fMKn7++tpqcYNaWAgAApv5D//+psAIAAJTyQ///h/4CAACPBEA==
Date: Mon, 2 Sep 2019 14:21:38 +0000
Message-ID: <f8078a1de8d54ff5801a679182bfc03e@AMSPEX02CL03.citrite.net>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-2-paul.durrant@citrix.com>
 <38900772-c8ce-bbfd-6d92-fbfe7abc7558@suse.com>
 <6178c787fecf4d8e80967e2681937b0d@AMSPEX02CL03.citrite.net>
 <0b37db94-2051-4ea0-e518-6222346a82c1@suse.com>
 <4dc00c06cae742fdaf13a2d62ed73877@AMSPEX02CL03.citrite.net>
 <f0aa7c7e-82a9-4b94-4c00-d9faa763d505@suse.com>
In-Reply-To: <f0aa7c7e-82a9-4b94-4c00-d9faa763d505@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v7 1/6] x86/domain: remove the 'oos_off' flag
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
Cc: WeiLiu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDE1OjEyDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogQW5kcmV3IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
Y2l0cml4LmNvbT47IFJvZ2VyIFBhdQ0KPiBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3Jn
PjsgV2VpTGl1DQo+IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDEvNl0g
eDg2L2RvbWFpbjogcmVtb3ZlIHRoZSAnb29zX29mZicgZmxhZw0KPiANCj4gT24gMDIuMDkuMjAx
OSAxNTo1OSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNl
bnQ6IDAyIFNlcHRlbWJlciAyMDE5IDE0OjQ2DQo+ID4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwu
RHVycmFudEBjaXRyaXguY29tPg0KPiA+PiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3Bl
cjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47
IFJvZ2VyIFBhdQ0KPiA+PiBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpTGl1
DQo+ID4+IDx3bEB4ZW4ub3JnPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDEvNl0geDg2
L2RvbWFpbjogcmVtb3ZlIHRoZSAnb29zX29mZicgZmxhZw0KPiA+Pg0KPiA+PiBPbiAwMi4wOS4y
MDE5IDE1OjA2LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+Pj4gRnJvbTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pj4+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDEzOjM0
DQo+ID4+Pj4NCj4gPj4+PiBPbiAzMC4wOC4yMDE5IDEwOjI5LCBQYXVsIER1cnJhbnQgd3JvdGU6
DQo+ID4+Pj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4gPj4+Pj4gKysrIGIveGVuL2Nv
bW1vbi9kb21haW4uYw0KPiA+Pj4+PiBAQCAtMzEzLDExICszMTMsMTkgQEAgc3RhdGljIGludCBz
YW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29u
ZmlnKQ0KPiA+Pj4+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPj4+Pj4gICAgICB9DQo+
ID4+Pj4+DQo+ID4+Pj4+IC0gICAgaWYgKCAhKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NE
Rl9odm1fZ3Vlc3QpICYmDQo+ID4+Pj4+IC0gICAgICAgICAoY29uZmlnLT5mbGFncyAmIFhFTl9E
T01DVExfQ0RGX2hhcCkgKQ0KPiA+Pj4+PiArICAgIGlmICggIShjb25maWctPmZsYWdzICYgWEVO
X0RPTUNUTF9DREZfaHZtX2d1ZXN0KSApDQo+ID4+Pj4+ICAgICAgew0KPiA+Pj4+PiAtICAgICAg
ICBkcHJpbnRrKFhFTkxPR19JTkZPLCAiSEFQIHJlcXVlc3RlZCBmb3Igbm9uLUhWTSBndWVzdFxu
Iik7DQo+ID4+Pj4+IC0gICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+Pj4+PiArICAgICAgICBp
ZiAoIGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9oYXAgKQ0KPiA+Pj4+PiArICAgICAg
ICB7DQo+ID4+Pj4+ICsgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLCAiSEFQIHJlcXVl
c3RlZCBmb3Igbm9uLUhWTSBndWVzdFxuIik7DQo+ID4+Pj4+ICsgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCj4gPj4+Pj4gKyAgICAgICAgfQ0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgICAg
IC8qDQo+ID4+Pj4+ICsgICAgICAgICAqIEl0IGlzIG9ubHkgbWVhbmluZ2Z1bCBmb3IgWEVOX0RP
TUNUTF9DREZfb29zX29mZiB0byBiZSBjbGVhcg0KPiA+Pj4+PiArICAgICAgICAgKiBmb3IgSFZN
IGd1ZXN0cy4NCj4gPj4+Pj4gKyAgICAgICAgICovDQo+ID4+Pj4+ICsgICAgICAgIGNvbmZpZy0+
ZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfb29zX29mZjsNCj4gPj4+Pg0KPiA+Pj4+IC4uLiBJIHdv
bmRlciB3aGV0aGVyIHRoaXMgbGFzdCBwYXJ0IHdvdWxkbid0IGJldHRlciBiZWxvbmcgaW50bw0K
PiA+Pj4+IHg4NidzIGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZygpLiBBcm0sIHRvIHRoZSBj
b250cmFyeSwgc2hvdWxkDQo+ID4+Pj4gZm9yY2UvcmVxdWlyZSB0aGUgYml0IHRvIGJlIHVuaWZv
cm1seSBvZmYuDQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiBJJ20gc3VyZSBJIGhhZCBhIHJlYXNvbiBm
b3IgZG9pbmcgaXQgbGlrZSB0aGlzIGJ1dCBpdCdzIHN1ZmZpY2llbnRseSBsb25nDQo+ID4+PiBh
Z28gbm93IHRoYXQgSSd2ZSBmb3Jnb3R0ZW4gd2hhdCBpdCB3YXMqLiBXb3VsZCBpdCBiZSBvayB0
byB0YWtlIHRoZSBjb2RlDQo+ID4+PiBhcy1pcyBhbmQgSSdsbCBpbnZlc3RpZ2F0ZSB3aGV0aGVy
IHRoaXMgY2FuIGJlIHRpZGllZCB1cD8NCj4gPj4NCj4gPj4gV2VsbCwgd2l0aCB0aGlzIHBlbmRp
bmcgcXVlc3Rpb24gSSdtIGxlc3MgaW5jbGluZWQgdG8gc3RvcCB3YWl0aW5nIGZvcg0KPiA+PiB0
aGUgb3V0c3RhbmRpbmcgYWNrcy4NCj4gPj4NCj4gPj4+IFsgKiBJIHN1c3BlY3QgaXQgd2FzIGNv
bmNlcm4gb3ZlciBicmVha2luZyBleGlzdGluZyB0b29sLXN0YWNrcyBieQ0KPiA+Pj4gcmVxdWly
aW5nIHRoZW0gdG8gc2V0IGEgZmxhZyB0aGF0IHByZXZpb3VzbHkgdGhleSBkaWQgbm90IG5lZWQg
dG8sIGJ1dA0KPiA+Pj4gSSdtIG5vdCBzdXJlIHRoYXQgd2FzIHRoZSBvbmx5IHJlYXNvbiBdDQo+
ID4+DQo+ID4+IFNlZW1zIHJhdGhlciB1bmxpa2VseSB0byBtZSwgYXMgdGhlcmUgd291bGRuJ3Qg
YmUgYW55IGRpZmZlcmVuY2UgKGZyb20NCj4gPj4gdG9vbCBzdGFjayBwZXJzcGVjdGl2ZSkgaWYg
dGhlIGFkanVzdG1lbnQgd2FzIGRvbmUgYnkgcGVyLWFyY2ggY29kZS4NCj4gPg0KPiA+IE9rLCBp
ZiB5b3UgZmVlbCBzdHJvbmdseSBhYm91dCBpdCBJJ2xsIG1vdmUgdGhlIGh1bmsuDQo+IA0KPiBX
ZWxsLCB3YWl0IC0gbm90IHRoZSBodW5rLiBUaGUgSEFQIHBhcnQgc2hvdWxkIHJlbWFpbiBpbiBj
b21tb24gY29kZQ0KPiBpbW8uIFRoZSBPT1MgcGFydCB3YW50cyBkb2luZyBkaWZmZXJlbnRseSBp
biB4ODYgYW5kIEFybSBjb2RlLg0KPiANCg0KWWVzLCB0aGUgaGFwIHBhcnQgc3RheXMgcHV0LiBU
aGUgJ29vc19vZmYnIHBhcnQgbW92ZXMgdG8geDg2IGFuZCBhcm0gY2FuIGJlIGxlZnQgYWxvbmUg
YmVjYXVzZSBpdCBhbHJlYWR5IHJlamVjdHMgZmxhZ3MgIT0gKGh2bSB8IGhhcCkuDQoNCiAgUGF1
bA0KDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
