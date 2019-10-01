Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774CDC30E2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:06:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFF0Y-0001WP-5P; Tue, 01 Oct 2019 10:03:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFF0W-0001WG-8S
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:03:48 +0000
X-Inumbo-ID: c165ccd2-e432-11e9-bf31-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id c165ccd2-e432-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 10:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569924227;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FUG8NwH+kcGjH/Uk9yDR8ha2q1HlbIYaXNEKGskom1Y=;
 b=WBM7wY1ot4dfQp/hjPPFqwy+A31hx5ugO2gtvnIqKuehk183KRimkEa0
 sZ6FT3GGnV9WjRQnAXC3TJdEZ2eHuS73CYXoC1cnCMDasXZp16rEuFYUF
 IKmi9GFYge6vhAaHEuHVorqilsyfG6GD6iM32Bxtq7ZYtnB+8SCTdrv7w k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /qcYqvo2VOv/roQ2X2rgimkhhKzKPj13+d71PniWcSwaQ4vH2X3udS8gTNOSqYhRLokCQAtHEp
 1dmnl6y6Xm4MDEN9phoaszO94nC3xwLrqNZhP0dgYnOygaUu42wZfSik3FBVZqS82Js/UfR6Gc
 oKCCU3BJRiZwMwyGi31DfMb1sGP+6eUZ2+dtI1R4288ywtz5kJ/cMyib3/ef2xK8X3kZGPMLb0
 b9StvvOxnBeUedDNnCinLxzVt6990YMJp9j1gQDVRTMWRKPzRDdOBA68Ew164NbcT08tkp/EQP
 gU8=
X-SBRS: 2.7
X-MesageID: 6297244
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6297244"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v3 06/10] ioreq: allow registering internal
 ioreq server handler
Thread-Index: AQHVd5PALJwd5KqRWEW462Gx4eC3cKdFj6gg
Date: Tue, 1 Oct 2019 10:03:41 +0000
Message-ID: <2f6a9623449643d9be259d141017133e@AMSPEX02CL03.citrite.net>
References: <20190930133238.49868-1-roger.pau@citrix.com>
 <20190930133238.49868-7-roger.pau@citrix.com>
In-Reply-To: <20190930133238.49868-7-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 06/10] ioreq: allow registering internal
 ioreq server handler
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUm9nZXIgUGF1IE1v
bm5lDQo+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDE0OjMzDQo+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5v
cmc+OyBKYW4NCj4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggdjMg
MDYvMTBdIGlvcmVxOiBhbGxvdyByZWdpc3RlcmluZyBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXIgaGFu
ZGxlcg0KPiANCj4gUHJvdmlkZSBhIHJvdXRpbmUgdG8gcmVnaXN0ZXIgdGhlIGhhbmRsZXIgZm9y
IGFuIGludGVybmFsIGlvcmVxDQo+IHNlcnZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogUGF1bCBE
dXJyYW50IDxwYXVsQHhlbi5vcmc+DQoNCj4gLS0tDQo+IENoYW5nZXMgc2luY2UgdjI6DQo+ICAt
IHMvaHZtX2FkZF9pb3JlcV9oYW5kbGVyL2h2bV9zZXRfaW9yZXFfaGFuZGxlci4NCj4gIC0gRG8g
bm90IGdvdG8gdGhlIG91dCBsYWJlbCBpZiBpb3JlcSBpcyBub3QgaW50ZXJuYWwuDQo+IA0KPiBD
aGFuZ2VzIHNpbmNlIHYxOg0KPiAgLSBBbGxvdyB0byBwcm92aWRlIGFuIG9wYXF1ZSBkYXRhIHBh
cmFtZXRlciB0byBwYXNzIHRvIHRoZSBoYW5kbGVyLg0KPiAgLSBBbGxvdyBjaGFuZ2luZyB0aGUg
aGFuZGxlciBhcyBsb25nIGFzIHRoZSBzZXJ2ZXIgaXMgbm90IGVuYWJsZWQuDQo+IC0tLQ0KPiAg
eGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jICAgICAgICB8IDMyICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5oIHwgIDQgKysr
Kw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jDQo+
IGluZGV4IDA2NDliN2UwMmQuLjU3NzE5YzYwN2MgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vaW9yZXEuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMNCj4gQEAgLTQ4
NSw2ICs0ODUsMzggQEAgc3RhdGljIGludCBodm1fYWRkX2lvcmVxX2dmbihzdHJ1Y3QgaHZtX2lv
cmVxX3NlcnZlciAqcywgYm9vbCBidWYpDQo+ICAgICAgcmV0dXJuIHJjOw0KPiAgfQ0KPiANCj4g
K2ludCBodm1fc2V0X2lvcmVxX2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBp
ZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICgqaGFuZGxlcikoaW9yZXFfdCAq
LCB2b2lkICopLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQ0KPiAr
ew0KPiArICAgIHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpzOw0KPiArICAgIGludCByYyA9IDA7
DQo+ICsNCj4gKyAgICBpZiAoICFodm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpICkNCj4gKyAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKyAgICBzcGluX2xvY2tfcmVjdXJzaXZlKCZkLT5h
cmNoLmh2bS5pb3JlcV9zZXJ2ZXIubG9jayk7DQo+ICsgICAgcyA9IGdldF9pb3JlcV9zZXJ2ZXIo
ZCwgaWQpOw0KPiArICAgIGlmICggIXMgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgcmMgPSAtRU5P
RU5UOw0KPiArICAgICAgICBnb3RvIG91dDsNCj4gKyAgICB9DQo+ICsgICAgaWYgKCBzLT5lbmFi
bGVkICkNCj4gKyAgICB7DQo+ICsgICAgICAgIHJjID0gLUVCVVNZOw0KPiArICAgICAgICBnb3Rv
IG91dDsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICBzLT5oYW5kbGVyID0gaGFuZGxlcjsNCj4gKyAg
ICBzLT5kYXRhID0gZGF0YTsNCj4gKw0KPiArIG91dDoNCj4gKyAgICBzcGluX3VubG9ja19yZWN1
cnNpdmUoJmQtPmFyY2guaHZtLmlvcmVxX3NlcnZlci5sb2NrKTsNCj4gKw0KPiArICAgIHJldHVy
biByYzsNCj4gK30NCj4gKw0KPiAgc3RhdGljIHZvaWQgaHZtX3VwZGF0ZV9pb3JlcV9ldnRjaG4o
c3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKnMsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgaHZtX2lvcmVxX3ZjcHUgKnN2KQ0KPiAgew0KPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaW9yZXEuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL2lvcmVxLmgNCj4gaW5kZXggYzM5MTdhYTc0ZC4uYmZkMmI5OTI1ZSAxMDA2NDQNCj4gLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaW9yZXEuaA0KPiArKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS9pb3JlcS5oDQo+IEBAIC01NCw2ICs1NCwxMCBAQCB1bnNpZ25lZCBpbnQgaHZt
X2Jyb2FkY2FzdF9pb3JlcShpb3JlcV90ICpwLCBib29sIGJ1ZmZlcmVkKTsNCj4gDQo+ICB2b2lk
IGh2bV9pb3JlcV9pbml0KHN0cnVjdCBkb21haW4gKmQpOw0KPiANCj4gK2ludCBodm1fc2V0X2lv
cmVxX2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW50ICgqaGFuZGxlcikoaW9yZXFfdCAqLCB2b2lkICopLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKTsNCj4gKw0KPiAgc3RhdGljIGlu
bGluZSBib29sIGh2bV9pb3JlcV9pc19pbnRlcm5hbCh1bnNpZ25lZCBpbnQgaWQpDQo+ICB7DQo+
ICAgICAgQVNTRVJUKGlkIDwgTUFYX05SX0lPUkVRX1NFUlZFUlMpOw0KPiAtLQ0KPiAyLjIzLjAN
Cj4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
