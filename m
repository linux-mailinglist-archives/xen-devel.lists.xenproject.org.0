Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70244EA15
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:01:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heK4I-0005M4-4X; Fri, 21 Jun 2019 13:59:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4J1g=UU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1heK4G-0005Lx-N5
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 13:59:04 +0000
X-Inumbo-ID: b8e3a940-942c-11e9-8623-efbda2fecc60
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8e3a940-942c-11e9-8623-efbda2fecc60;
 Fri, 21 Jun 2019 13:59:01 +0000 (UTC)
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
IronPort-SDR: IWy26hf/T03nrB5y8uQccih9JjVfWD217y2xtCEWGJGPPlrl6booJQMooScYOyshgS4nQtQSpx
 zAy5iVp8Jhd5SqDgKMZ26hnchzA7aIxAz/Xs8/YwdowWyfDR1lvZyUHlvBSyDwDSsWktyuCl8H
 Bn1dNT3fUSAl9g9B1QE49O9HbS9LrrGnsgXVx+qtOt8M6vIvYIXZ7pPxvZOFAxW3EWRy1OcgK9
 ppqJtUSNo8LsLWAKcbzpuS5pwnbOEQSGQzf/r1aNYp4pXjzWQTgJpnhpRpEPSCX/y4hxESktVG
 1xo=
X-SBRS: 2.7
X-MesageID: 2071469
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2071469"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Alexandru Stefan ISAILA' <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] viridian: unify time sources
Thread-Index: AQHVJOYEKpYlKKXKuECuo6GB2lf0qqamBPOAgAAim3A=
Date: Fri, 21 Jun 2019 13:58:57 +0000
Message-ID: <e4ec7405ea9b4c9bb94f903a51561582@AMSPEX02CL03.citrite.net>
References: <20190617082358.2734-1-paul.durrant@citrix.com>
 <a517fc98-cdd7-4bc4-e096-08826399ddf7@bitdefender.com>
In-Reply-To: <a517fc98-cdd7-4bc4-e096-08826399ddf7@bitdefender.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] viridian: unify time sources
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kcnUgU3RlZmFuIElT
QUlMQSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQo+IFNlbnQ6IDIxIEp1bmUgMjAxOSAxNDo0
OQ0KPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3Bl
cjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Ow0KPiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0K
PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYyXSB2aXJpZGlhbjogdW5pZnkgdGlt
ZSBzb3VyY2VzDQo+IA0KPiA+ICAgLyoNCj4gPiBAQCAtMTM2LDcgKzEwMCw3IEBAIHN0YXRpYyBp
bnQ2NF90IHRpbWVfcmVmX2NvdW50KGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQo+ID4gICAgKiAx
MjggYml0IG51bWJlciB3aGljaCBpcyB0aGVuIHNoaWZ0ZWQgNjQgdGltZXMgdG8gdGhlIHJpZ2h0
IHRvIG9idGFpbg0KPiA+ICAgICogdGhlIGhpZ2ggNjQgYml0cy4iDQo+ID4gICAgKi8NCj4gDQo+
IElzIHRoZXJlIGEgZ29vZCByZWFzb24gZm9yIHVzaW5nIHNpZ25lZCBvZmZzZXQgaGVyZT8gSWYg
c28gdGhlbiBtYXliZQ0KPiB5b3Ugc2hvdWxkIGNoYW5nZSB0aGUgcmV0dXJuIHR5cGUgb3IgY2hl
Y2sgZm9yIGJvdW5kcy4NCg0KVGhlIG9mZnNldCBpcyBhY3R1YWxseSBuZWdhdGl2ZSBtb3N0IG9m
IHRoZSB0aW1lIGJ1dCB0aGUgcmVzdWx0aW5nIHJlZmVyZW5jZSB0aW1lIHNob3VsZCBiZSB1bnNp
Z25lZCBzbyB0aGUgcmV0dXJuIHR5cGUgb2YgdGltZV9yZWZfY291bnQoKSBkb2VzIG5lZWQgZml4
aW5nLg0KDQogIFBhdWwNCg0KPg0KPiA+IC1zdGF0aWMgdWludDY0X3Qgc2NhbGVfdHNjKHVpbnQ2
NF90IHRzYywgdWludDY0X3Qgc2NhbGUsIHVpbnQ2NF90IG9mZnNldCkNCj4gPiArc3RhdGljIHVp
bnQ2NF90IHNjYWxlX3RzYyh1aW50NjRfdCB0c2MsIHVpbnQ2NF90IHNjYWxlLCBpbnQ2NF90IG9m
ZnNldCkNCj4gPiAgIHsNCj4gPiAgICAgICB1aW50NjRfdCByZXN1bHQ7DQo+ID4NCj4gPiBAQCAt
MTUzLDIyICsxMTcsNDYgQEAgc3RhdGljIHVpbnQ2NF90IHNjYWxlX3RzYyh1aW50NjRfdCB0c2Ms
IHVpbnQ2NF90IHNjYWxlLCB1aW50NjRfdCBvZmZzZXQpDQo+ID4gICAgICAgcmV0dXJuIHJlc3Vs
dCArIG9mZnNldDsNCj4gPiAgIH0NCj4gPg0KPiA+IC1zdGF0aWMgdWludDY0X3QgdGltZV9ub3co
c3RydWN0IGRvbWFpbiAqZCkNCj4gPiArc3RhdGljIHVpbnQ2NF90IHRyY192YWwoY29uc3Qgc3Ry
dWN0IGRvbWFpbiAqZCwgaW50NjRfdCBvZmZzZXQpDQo+ID4gICB7DQo+ID4gICAgICAgdWludDY0
X3QgdHNjLCBzY2FsZTsNCj4gPg0KPiA+IC0gICAgLyoNCj4gPiAtICAgICAqIElmIHRoZSByZWZl
cmVuY2UgVFNDIHBhZ2UgaXMgbm90IGVuYWJsZWQsIG9yIGhhcyBiZWVuIGludmFsaWRhdGVkDQo+
ID4gLSAgICAgKiBmYWxsIGJhY2sgdG8gdGhlIHBhcnRpdGlvbiByZWZlcmVuY2UgY291bnRlci4N
Cj4gPiAtICAgICAqLw0KPiA+IC0gICAgaWYgKCAhZC0+YXJjaC5odm0udmlyaWRpYW4tPnJlZmVy
ZW5jZV90c2NfdmFsaWQgKQ0KPiA+IC0gICAgICAgIHJldHVybiB0aW1lX3JlZl9jb3VudChkKTsN
Cj4gPiAtDQo+ID4gLSAgICAvKiBPdGhlcndpc2UgY29tcHV0ZSByZWZlcmVuY2UgdGltZSBpbiB0
aGUgc2FtZSB3YXkgdGhlIGd1ZXN0IHdvdWxkICovDQo+ID4gICAgICAgdHNjID0gaHZtX2dldF9n
dWVzdF90c2MocHRfZ2xvYmFsX3ZjcHVfdGFyZ2V0KGQpKTsNCj4gPiAgICAgICBzY2FsZSA9ICgo
MTAwMDB1bCA8PCAzMikgLyBkLT5hcmNoLnRzY19raHopIDw8IDMyOw0KPiA+DQo+ID4gLSAgICBy
ZXR1cm4gc2NhbGVfdHNjKHRzYywgc2NhbGUsIDApOw0KPiA+ICsgICAgcmV0dXJuIHNjYWxlX3Rz
Yyh0c2MsIHNjYWxlLCBvZmZzZXQpOw0KPiA+ICt9DQo+IA0KPiBBbGV4DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
