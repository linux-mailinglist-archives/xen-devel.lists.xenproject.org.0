Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BD178E9B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:03:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs78B-0005Fy-M3; Mon, 29 Jul 2019 15:00:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0i5a=V2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hs78A-0005Cn-Qp
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:00:06 +0000
X-Inumbo-ID: 8c6af9f5-b211-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8c6af9f5-b211-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:00:05 +0000 (UTC)
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
IronPort-SDR: po4EXSdwEis55Yn3gQjLPKWVTuXTTy7goFgS6vwwKNPW6TXFIDBR/aUO4JW692JWGp8SrSXj/P
 Z0Bk9+R2hAhPdO81koCE9ooPCw9P5qRAb5NNmx06Tbroz78EORLN9SQAh7/rAyP858wprPPabF
 Vet4zIsXHXDDdAAoR7N16iPD1/cQ1+/b8oMcR8CyNZViODEPsJaVrcORtkXa4aQDz23OjskHv3
 yWbGwvTrJPF7nR27eTq5BTv57ykhTeDJ1qeQwwAfHsPmHcdiYIMN9HFmSdZnl/XR+OvfFu71os
 xuw=
X-SBRS: 2.7
X-MesageID: 3561685
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3561685"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v2 3/6] x86/hvm/domain: remove the 'hap_enabled' flag
Thread-Index: AQHVQu5gfwtOlcu510C1AHboj8iXe6bhjm0AgAAoDUA=
Date: Mon, 29 Jul 2019 15:00:00 +0000
Message-ID: <7d9812f69f48402fb9fb444779162cb2@AMSPEX02CL03.citrite.net>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-4-paul.durrant@citrix.com>
 <4e5f66f9-3315-30ff-68e5-6f11cb0862ba@suse.com>
In-Reply-To: <4e5f66f9-3315-30ff-68e5-6f11cb0862ba@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 3/6] x86/hvm/domain: remove the
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
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEp1bHkgMjAxOSAxNTozNg0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uZQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDMvNl0geDg2L2h2bS9kb21haW46IHJlbW92
ZSB0aGUgJ2hhcF9lbmFibGVkJyBmbGFnDQo+IA0KPiBPbiAyNS4wNy4yMDE5IDE1OjM5LCBQYXVs
IER1cnJhbnQgd3JvdGU6DQo+ID4gQEAgLTE5NSwxMSArMTk0LDkgQEAgc3RydWN0IGh2bV9kb21h
aW4gew0KPiA+ICAgICAgIH07DQo+ID4gICB9Ow0KPiA+DQo+ID4gLSNpZmRlZiBDT05GSUdfSFZN
DQo+ID4gLSNkZWZpbmUgaGFwX2VuYWJsZWQoZCkgIChpc19odm1fZG9tYWluKGQpICYmIChkKS0+
YXJjaC5odm0uaGFwX2VuYWJsZWQpDQo+ID4gLSNlbHNlDQo+ID4gLSNkZWZpbmUgaGFwX2VuYWJs
ZWQoZCkgICh7KHZvaWQpKGQpOyBmYWxzZTt9KQ0KPiA+IC0jZW5kaWYNCj4gPiArI2RlZmluZSBo
YXBfZW5hYmxlZChkKSBcDQo+ID4gKyAgICAoaHZtX2hhcF9zdXBwb3J0ZWQoKSAmJiBpc19odm1f
ZG9tYWluKGQpICYmIFwNCj4gPiArICAgICBldmFsdWF0ZV9ub3NwZWMoZC0+b3B0aW9ucyAmIFhF
Tl9ET01DVExfQ0RGX2hhcCkpDQo+IA0KPiBSYXRoZXIgdGhhbiBhZGRpbmcgeWV0IGFub3RoZXIg
JiYgaGVyZSBJIHRoaW5rIHlvdSB3YW50IHRvDQo+IHJlamVjdCBYRU5fRE9NQ1RMX0NERl9oYXAg
aW4gYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKCkNCj4gd2hlbiAhaHZtX2hhcF9zdXBwb3J0
ZWQoKS4gU2ltaWxhcmx5IHRoZSBpc19odm1fZG9tYWluKCkNCj4gY291bGQgdGhlbiBhbHNvIGJl
IGVsaW1pbmF0ZWQgYnkgY2hlY2tpbmcgdGhhdCBDREZfaGFwIGlzDQo+IHNldCBvbmx5IHRvZ2V0
aGVyIHdpdGggQ0RGX2h2bSAob3IgYnkgY2xlYXJpbmcgQ0RGX2hhcCBpZg0KPiBDREZfaHZtIGlz
IGNsZWFyIC0gZGVwZW5kcyBvbiB3aGF0IGNvbXBhdGliaWxpdHkgbmVlZHMNCj4gdGhlcmUgYXJl
Lg0KPiANCj4gVGhpcyB3b3VsZCB0aGVuIGFsc28gZWxpbWluYXRlIHRoZSBkb3VibGUgZXZhbHVh
dGlvbiBvZg0KPiAiZCIuDQoNCk9oIHllcywgdGhhdCdzIG5lYXRlci4gSSdsbCBkbyB0aGF0LCBh
bmQgYWxzbyBmaXggdXAgcGF0Y2ggIzIuDQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
