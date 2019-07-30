Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14707A925
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:03:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsRkB-0000Tn-Pr; Tue, 30 Jul 2019 13:00:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sDM=V3=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hsRkA-0000Tc-1f
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:00:42 +0000
X-Inumbo-ID: 07a0593c-b2ca-11e9-ac13-4be53d11a739
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07a0593c-b2ca-11e9-ac13-4be53d11a739;
 Tue, 30 Jul 2019 13:00:39 +0000 (UTC)
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
IronPort-SDR: XPolaznFkbPRPN4ejHeH2jFKcnC1utFrCK2GUmNfgKgYBRpTAisga+NQZzAK17CHMLsSZMHe1X
 7ziuSvuHM8m/d9QScedwgKlBn7xtfEi8/n5NK08Igl9wmnGLAScAEa5h3Fq8sAE8uTCRfFNwuO
 wVJlHstu6NZKUi9LA7PzGWH6+4m+Hg6GPk/NXkis8YaLWvsK1GDc21azWKRd3fMzFmHzsrPyZt
 JNOlmNRoUoWFCxhX8H29cuF8z6caV+2feRJ3uI0SCbmg2FEpBtesWgJN5MD5+BtZC4BHB99bwB
 Osg=
X-SBRS: 2.7
X-MesageID: 3650683
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3650683"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v3 5/5] x86/domain: remove the 's3_integrity'
 flag
Thread-Index: AQHVRrqj/StGDDdtjkGWw3vOZUh8Rqbi7lyAgAAxpLA=
Date: Tue, 30 Jul 2019 13:00:35 +0000
Message-ID: <2fd1c70854c44db9a48c20adde899100@AMSPEX02CL03.citrite.net>
References: <20190730093904.1794-1-paul.durrant@citrix.com>
 <20190730093904.1794-6-paul.durrant@citrix.com>
 <6a99c8af-3477-9387-135a-7386020df3c5@suse.com>
In-Reply-To: <6a99c8af-3477-9387-135a-7386020df3c5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 5/5] x86/domain: remove the
 's3_integrity' flag
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIEp1bHkgMjAxOSAxMzowMw0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uZQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYzIDUvNV0geDg2L2RvbWFp
bjogcmVtb3ZlIHRoZSAnczNfaW50ZWdyaXR5JyBmbGFnDQo+IA0KPiBPbiAzMC4wNy4yMDE5IDEx
OjM5LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5j
DQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jDQo+ID4gQEAgLTQ2Niw2ICs0NjYsMTMg
QEAgaW50IGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVh
dGVkb21haW4gKmNvbmZpZykNCj4gPiAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gICAg
ICAgfQ0KPiA+DQo+ID4gKyAgICBpZiAoIChjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZf
czNfaW50ZWdyaXR5KSAmJg0KPiA+ICsgICAgICAgICAhSVNfRU5BQkxFRChUQk9PVCkgKQ0KPiAN
Cj4gVGhpcyBsYWNrcyB0aGUgQ09ORklHXyBwcmVmaXguDQo+IA0KPiA+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9zZXR1cC5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMNCj4gPiBAQCAtNjg5
LDcgKzY4OSw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxv
bmcgbWJpX3ApDQo+ID4gICAgICAgICAgIC5zdG9wX2JpdHMgPSAxDQo+ID4gICAgICAgfTsNCj4g
PiAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gZG9tMF9jZmcgPSB7DQo+ID4g
LSAgICAgICAgLmZsYWdzID0gWEVOX0RPTUNUTF9DREZfczNfaW50ZWdyaXR5LA0KPiA+ICsgICAg
ICAgIC5mbGFncyA9IElTX0VOQUJMRUQoVEJPT1QpID8gWEVOX0RPTUNUTF9DREZfczNfaW50ZWdy
aXR5IDogMCwNCj4gDQo+IFNhbWUgaGVyZS4gV2l0aCB0aGlzIHRha2VuIGNhcmUgb2YgKGNvdWxk
IGJlIGRvbmUgd2hpbGUgY29tbWl0dGluZywNCj4gYnV0IEknbSBub3Qgc3VyZSB3aGV0aGVyIHRo
aXMgcGF0Y2ggaXMgaW5kZXBlbmRlbnQgb2YgdGhlIGVhcmxpZXINCj4gb25lcykNCj4gUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhbmtzLiBJJ2xsIGZp
eCBpdCBpbiB2NC4NCg0KICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
