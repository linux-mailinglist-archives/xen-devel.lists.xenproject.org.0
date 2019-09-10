Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB1FAEB2D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:11:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7frM-0005yn-6R; Tue, 10 Sep 2019 13:07:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M1KC=XF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i7frL-0005yi-56
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:07:03 +0000
X-Inumbo-ID: e0df0ca8-d3cb-11e9-ac1d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0df0ca8-d3cb-11e9-ac1d-12813bfff9fa;
 Tue, 10 Sep 2019 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568120822;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fzTd91GBzmAwahs0slbhtGZERjhCGnhN6tRl8MEzzZU=;
 b=cKDG6k6osm9cejDATgsDpzA1PnekbTned2eEXIqNPN2gVfC/3wv+QY8N
 4mTVbTJ/AEMciL+2bhrs6mVHIK0VqVj4+cOugynldgGUhH8skIzmRaGIO
 dscITiKZ95Sg/RjAYg+Z7WSWa5mUQPk0V3smk04tLy5LIl0xBW1y62zuw 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wxWGvVUo6GLRWGgdzV5XZgjvgwTsm0kDkPYUVHvlj6mCamYRnLtS0BTBX7Bzpg/hP4UDNjkxNR
 NNuqkeZ4InPjNXOyaAyGFN1VfqTFyzZEeLj//SDRCyaB8LyTKld957yp3I/Ujcmi529c5Uhbwc
 ddJquTveVU+KmdSXEk8Tn/NCZ30xxGy7N9T+2Jz0ughqlKGx1XXXC+SDj0uDNhcoceuBQqw9Gy
 011vOvaVrT5LyfnO+Yt9clKF+YNlgO2SLCDk5SC+bSH7XOICxRzGLFRNchSvV8doobHJRIKoz+
 HN0=
X-SBRS: 2.7
X-MesageID: 5607162
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5607162"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 06/11] ioreq: allow dispatching ioreqs to internal
 servers
Thread-Index: AQHVYnK3hVd65FGo0kCx8kLiNiHgV6ck6rNA
Date: Tue, 10 Sep 2019 13:06:57 +0000
Message-ID: <a34f295584404f3ea41994ae527783da@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-7-roger.pau@citrix.com>
In-Reply-To: <20190903161428.7159-7-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 06/11] ioreq: allow dispatching ioreqs to
 internal servers
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAwMyBTZXB0ZW1iZXIgMjAxOSAxNzoxNA0KPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4
LmNvbT47IEphbiBCZXVsaWNoDQo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggdjIgMDYvMTFdIGlvcmVxOiBhbGxvdyBkaXNwYXRjaGluZyBpb3JlcXMgdG8g
aW50ZXJuYWwgc2VydmVycw0KPiANCj4gSW50ZXJuYWwgaW9yZXEgc2VydmVycyBhcmUgYWx3YXlz
IHByb2Nlc3NlZCBmaXJzdCwgYW5kIGlvcmVxcyBhcmUNCj4gZGlzcGF0Y2hlZCBieSBjYWxsaW5n
IHRoZSBoYW5kbGVyIGZ1bmN0aW9uLiBOb3RlIHRoaXMgaXMgYWxyZWFkeSB0aGUNCj4gY2FzZSBk
dWUgdG8gdGhlIGltcGxlbWVudGF0aW9uIG9mIEZPUl9FQUNIX0lPUkVRX1NFUlZFUi4NCj4gDQoN
CkknZCByZS1qaWcgdGhpcyBhIGJpdC4gU29tZXRoaW5nIGxpa2UuLi4NCg0KIkludGVybmFsIGlv
cmVxIHNlcnZlcnMgd2lsbCBiZSBwcm9jZXNzZWQgZmlyc3QgZHVlIHRvIHRoZSBpbXBsZW1lbnRh
dGlvbg0KIG9mIEZPUl9FQUNIX0lPUkVRX1NFUlZFUiwgYW5kIGlvcmVxcyBhcmUgZGlzcGF0Y2hl
ZCBzaW1wbHkgYnkgY2FsbGluZw0KIHRoZSBoYW5kbGVyIGZ1bmN0aW9uLiINCg0KPiBOb3RlIHRo
YXQgaHZtX3NlbmRfaW9yZXEgZG9lc24ndCBnZXQgcGFzc2VkIHRoZSBpb3JlcSBzZXJ2ZXIgaWQs
IHNvDQo+IG9idGFpbiBpdCBmcm9tIHRoZSBpb3JlcSBzZXJ2ZXIgZGF0YSBieSBkb2luZyBwb2lu
dGVyIGFyaXRobWV0aWMuDQo+IA0KDQpJIHRoaW5rIHRoaXMgMm5kIHBhcmFncmFwaCBpcyBzdGFs
ZSBub3c/DQoNCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQoNCk90aGVyd2lzZSBMR1RNLCBzbyB3aXRoIHRob3NlIHRoaW5ncyBmaXhlZCB1
cC4uLg0KDQpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNv
bT4NCg0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gIC0gQXZvaWQgaGF2aW5nIHRvIGl0
ZXJhdGUgdHdpY2Ugb3ZlciB0aGUgbGlzdCBvZiBpb3JlcSBzZXJ2ZXJzIHNpbmNlDQo+ICAgIG5v
dyBpbnRlcm5hbCBzZXJ2ZXJzIGFyZSBhbHdheXMgcHJvY2Vzc2VkIGZpcnN0IGJ5DQo+ICAgIEZP
Ul9FQUNIX0lPUkVRX1NFUlZFUi4NCj4gIC0gT2J0YWluIGlvcmVxIHNlcnZlciBpZCB1c2luZyBw
b2ludGVyIGFyaXRobWV0aWMuDQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIHwg
OSArKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lv
cmVxLmMNCj4gaW5kZXggZGJjNWU2YjRjNS4uODMzMWE4OWVhZSAxMDA2NDQNCj4gLS0tIGEveGVu
L2FyY2gveDg2L2h2bS9pb3JlcS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYw0K
PiBAQCAtMTQ5Myw5ICsxNDkzLDE4IEBAIGludCBodm1fc2VuZF9pb3JlcShpb3NlcnZpZF90IGlk
LCBpb3JlcV90ICpwcm90b19wLCBib29sIGJ1ZmZlcmVkKQ0KPiANCj4gICAgICBBU1NFUlQocyk7
DQo+IA0KPiArICAgIGlmICggaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSAmJiBidWZmZXJlZCAp
DQo+ICsgICAgew0KPiArICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gKyAgICAgICAg
cmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOw0KPiArICAgIH0NCj4gKw0KPiAgICAgIGlmICgg
YnVmZmVyZWQgKQ0KPiAgICAgICAgICByZXR1cm4gaHZtX3NlbmRfYnVmZmVyZWRfaW9yZXEocywg
cHJvdG9fcCk7DQo+IA0KPiArICAgIGlmICggaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSApDQo+
ICsgICAgICAgIHJldHVybiBzLT5oYW5kbGVyKGN1cnIsIHByb3RvX3AsIHMtPmRhdGEpOw0KPiAr
DQo+ICAgICAgaWYgKCB1bmxpa2VseSghdmNwdV9zdGFydF9zaHV0ZG93bl9kZWZlcnJhbChjdXJy
KSkgKQ0KPiAgICAgICAgICByZXR1cm4gWDg2RU1VTF9SRVRSWTsNCj4gDQo+IC0tDQo+IDIuMjIu
MA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
