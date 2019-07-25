Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA0674E88
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 14:51:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdAt-0003Mc-9k; Thu, 25 Jul 2019 12:48:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqdAr-0003MT-93
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 12:48:45 +0000
X-Inumbo-ID: 892d9fc4-aeda-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 892d9fc4-aeda-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 12:48:44 +0000 (UTC)
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
IronPort-SDR: kSB89nXGN1xbVxJB/UcSjTLaRJXi4eCN9MpttPu+N6fH7GuPtt0XrIAtsUmtgXZvDJ9RP52eEV
 CefCmF1lA1dINMOHYifF92tP6VVN46fw6zAQUervNZJRmDDn8I3eoByHJClaNbsAOCY2Bq6B1t
 iRi5MzdoZLjhgV/0l9KoC/DAaRimmJZrVAyJX5kB6SsE0x4b6uSlRIy6X5UcRNrJaTBvgrROcA
 5dKPKka+ez9fl4CqnHD4LuYh9guAHIn/qOl3+pUxjaqpvZ21Ig/lZ+FWltmVKplymmsXbv/slI
 2tw=
X-SBRS: 2.7
X-MesageID: 3417396
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3417396"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, Roger Pau Monne
 <roger.pau@citrix.com>
Thread-Topic: [PATCH 3/6] x86/hvm/domain: remove the 'hap_enabled' flag
Thread-Index: AQHVQXCNXhv9G8acKEKtv9HbpWg4LKba9qgAgAAn+eCAACwE0A==
Date: Thu, 25 Jul 2019 12:48:40 +0000
Message-ID: <0cbac7035fd4489e9786acadfff6b257@AMSPEX02CL03.citrite.net>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-4-paul.durrant@citrix.com>
 <20190725094420.g2wv7cur7xfoat5t@Air-de-Roger>
 <6bed666c7c604fada293b3d650c8f643@AMSPEX02CL03.citrite.net>
In-Reply-To: <6bed666c7c604fada293b3d650c8f643@AMSPEX02CL03.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/6] x86/hvm/domain: remove the
 'hap_enabled' flag
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUGF1bCBEdXJyYW50
DQo+IFNlbnQ6IDI1IEp1bHkgMjAxOSAxMTowOA0KPiBUbzogUm9nZXIgUGF1IE1vbm5lIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
V2VpIExpdSA8d2xAeGVuLm9yZz47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFu
ZHJldw0KPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbWGVuLWRldmVsXSBbUEFUQ0ggMy82XSB4ODYvaHZtL2RvbWFpbjogcmVtb3ZlIHRoZSAnaGFw
X2VuYWJsZWQnIGZsYWcNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBG
cm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+IFNlbnQ6IDI1
IEp1bHkgMjAxOSAxMDo0NA0KPiA+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRy
aXguY29tPg0KPiA+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXINCj4gPiA8QW5kcmV3LkNvb3Bl
cjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSCAzLzZdIHg4Ni9odm0vZG9tYWluOiByZW1vdmUgdGhlICdoYXBfZW5hYmxlZCcgZmxhZw0K
PiA+DQo+ID4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDU6MDY6MDZQTSArMDEwMCwgUGF1bCBE
dXJyYW50IHdyb3RlOg0KPiA+ID4gLSNpZmRlZiBDT05GSUdfSFZNDQo+ID4gPiAtI2RlZmluZSBo
YXBfZW5hYmxlZChkKSAgKGlzX2h2bV9kb21haW4oZCkgJiYgKGQpLT5hcmNoLmh2bS5oYXBfZW5h
YmxlZCkNCj4gPiA+IC0jZWxzZQ0KPiA+ID4gLSNkZWZpbmUgaGFwX2VuYWJsZWQoZCkgICh7KHZv
aWQpKGQpOyBmYWxzZTt9KQ0KPiA+ID4gLSNlbmRpZg0KPiA+ID4gKyNkZWZpbmUgaGFwX2VuYWJs
ZWQoZCkgXA0KPiA+ID4gKyAgICAoaHZtX2hhcF9zdXBwb3J0ZWQoKSAmJiBpc19odm1fZG9tYWlu
KGQpICYmIFwNCj4gPiA+ICsgICAgIGV2YWx1YXRlX25vc3BlYyhkLT5jcmVhdGVmbGFncyAmIFhF
Tl9ET01DVExfQ0RGX2hhcCkpDQo+ID4NCj4gPiBZb3UgY291bGQgbWFrZSB0aGlzIGFuIGlubGlu
ZSBmdW5jdGlvbiB3aGlsZSBhdCBpdCBBRkFJQ1QuDQo+IA0KPiBZZWFoLCB0aGF0J3Mgbm90IGEg
YmFkIGlkZWEuDQo+IA0KDQpBbGFzIHRoaXMgdHVybnMgb3V0IHRvIGJlIGEgY2FuIG9mIHdvcm1z
LiBBcyBhbiBpbmxpbmUgZnVuY3Rpb24gSSBjYW5ub3QgY2FsbCBpc19odm1fZG9tYWluKCkgZnJv
bSBoZXJlIHdoaWNoLCBJIGd1ZXNzLCBpcyB3aHkgaXTigJlzIGEgbWFjcm8gYXQgdGhlIG1vbWVu
dC4gQWxzbyBJIGNhbm5vdCBkZXJlZmVyZW5jZSBkLT5jcmVhdGVmbGFncyAoYS5rLmEuIG9wdGlv
bnMpIGFzIHRoZSBkZWZpbml0aW9uIG9mIHN0cnVjdCBkb21haW4gaXMgbm90IGF2YWlsYWJsZS4N
Cg0KICBQYXVsDQoNCj4gICBQYXVsDQo+IA0KPiA+DQo+ID4gVGhhbmtzLCBSb2dlci4NCj4gDQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
