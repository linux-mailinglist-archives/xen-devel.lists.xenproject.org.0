Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F369A5760
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 15:10:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4m2j-0004OV-3L; Mon, 02 Sep 2019 13:06:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R1Xd=W5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i4m2i-0004OI-1i
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:06:48 +0000
X-Inumbo-ID: 84b91dd2-cd82-11e9-8980-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84b91dd2-cd82-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567429607;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zLkPW9vjR8MOwHoO6iCOqPBBgdyx7ENxr8iaIw6dkEc=;
 b=GllSB+NNZ63RfvLf2Br3S8bKN79mJbjVEC5u2ZffweKO8ZQNd//jTb6C
 tRBSuU3Wh2Ip2EcELydJX2aEDD4k3RcRbWOs8fJ8LTAqzR/7F5gOhycDr
 wNe4FgUf8vGgSObF0gBkPx6Ed3VeWTIvzrOXQYjcW/H3k3JRq4WHKgVUN o=;
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
IronPort-SDR: 65FKReP/KXAJgJSOGugqNISAm9l37zripptA/MRH4Cu2gRUDBPsPpDd+x9v6PuILV38fCFMs1+
 bKD8xnNeQH/oeyPmR+erTkb7gEU7mkH4UiYuqT7Qr7m4D/KQWYiYE4lVrVZeKms7kjeIckywha
 d25uBNs7nuoWfYh6hWAJPxxyXsRZjWPs1MBaKCAI3tBX+DDn5u7mbIoOUvX8Cd8/SgKIt5iskZ
 Ci+1MV6SXcXFxsc7FXSQQr7yIBAOJp+qVEdxqDn/dPA+eHMRt67bnhXhh/a6vPWgxm1oiCGDQi
 JOA=
X-SBRS: 2.7
X-MesageID: 5283912
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5283912"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v7 1/6] x86/domain: remove the 'oos_off' flag
Thread-Index: AQHVXw0b+0WFjb3WC0C8fMKn7++tpqcYNaWAgAApv5A=
Date: Mon, 2 Sep 2019 13:06:42 +0000
Message-ID: <6178c787fecf4d8e80967e2681937b0d@AMSPEX02CL03.citrite.net>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-2-paul.durrant@citrix.com>
 <38900772-c8ce-bbfd-6d92-fbfe7abc7558@suse.com>
In-Reply-To: <38900772-c8ce-bbfd-6d92-fbfe7abc7558@suse.com>
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
Cc: Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDEzOjM0DQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgUm9nZXIgUGF1IE1vbm5lDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5s
YXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3Jn
PjsgV2VpIExpdQ0KPiA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyAxLzZd
IHg4Ni9kb21haW46IHJlbW92ZSB0aGUgJ29vc19vZmYnIGZsYWcNCj4gDQo+IE9uIDMwLjA4LjIw
MTkgMTA6MjksIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBUaGUgZmxhZyBpcyBub3QgbmVlZGVk
IHNpbmNlIHRoZSBkb21haW4gJ29wdGlvbnMnIGNhbiBub3cgYmUgdGVzdGVkDQo+ID4gZGlyZWN0
bHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPg0KPiA+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+ID4gLS0tDQo+ID4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPg0KPiA+IENjOiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+DQo+ID4gQ2M6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+ID4gQ2M6IFdlaSBMaXUgPHds
QHhlbi5vcmc+DQo+ID4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5j
b20+DQo+ID4NCj4gPiB2MzoNCj4gPiAgLSBGb3JjZSAnb29zX29mZicgdG8gYmUgc2V0IGZvciBQ
ViBndWVzdHMgKHRvIGF2b2lkIGNhbGwgdG8NCj4gPiAgICBpc19odm1fZG9tYWluKCkgZXhjZXB0
IGluIEFTU0VSVCkNCj4gPiAgLSBEcm9wcGVkIFRpbSdzIEEtYiBiZWNhdXNlIG9mIHRoZSBjaGFu
Z2UNCj4gDQo+IEkndmUgYmVlbiBkZWJhdGluZyB3aXRoIG15c2VsZiB3aGV0aGVyIHRvIG5vdCB3
YWl0IGFueSBsb25nZXIgZm9yDQo+IFRpbSB0byByZS1pbnN0YXRlIGhpcyBhY2ssIGJ1dCBub3cg
dGhhdCBJJ3ZlIGxvb2tlZCBhZ2FpbiAuLi4NCj4gDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9kb21h
aW4uYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4gPiBAQCAtMzEzLDExICszMTMs
MTkgQEAgc3RhdGljIGludCBzYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3Rs
X2NyZWF0ZWRvbWFpbiAqY29uZmlnKQ0KPiA+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+
ICAgICAgfQ0KPiA+DQo+ID4gLSAgICBpZiAoICEoY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExf
Q0RGX2h2bV9ndWVzdCkgJiYNCj4gPiAtICAgICAgICAgKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9N
Q1RMX0NERl9oYXApICkNCj4gPiArICAgIGlmICggIShjb25maWctPmZsYWdzICYgWEVOX0RPTUNU
TF9DREZfaHZtX2d1ZXN0KSApDQo+ID4gICAgICB7DQo+ID4gLSAgICAgICAgZHByaW50ayhYRU5M
T0dfSU5GTywgIkhBUCByZXF1ZXN0ZWQgZm9yIG5vbi1IVk0gZ3Vlc3RcbiIpOw0KPiA+IC0gICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgICAgIGlmICggY29uZmlnLT5mbGFncyAmIFhF
Tl9ET01DVExfQ0RGX2hhcCApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBkcHJp
bnRrKFhFTkxPR19JTkZPLCAiSEFQIHJlcXVlc3RlZCBmb3Igbm9uLUhWTSBndWVzdFxuIik7DQo+
ID4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgICAgIH0NCj4gPiArDQo+
ID4gKyAgICAgICAgLyoNCj4gPiArICAgICAgICAgKiBJdCBpcyBvbmx5IG1lYW5pbmdmdWwgZm9y
IFhFTl9ET01DVExfQ0RGX29vc19vZmYgdG8gYmUgY2xlYXINCj4gPiArICAgICAgICAgKiBmb3Ig
SFZNIGd1ZXN0cy4NCj4gPiArICAgICAgICAgKi8NCj4gPiArICAgICAgICBjb25maWctPmZsYWdz
IHw9IFhFTl9ET01DVExfQ0RGX29vc19vZmY7DQo+IA0KPiAuLi4gSSB3b25kZXIgd2hldGhlciB0
aGlzIGxhc3QgcGFydCB3b3VsZG4ndCBiZXR0ZXIgYmVsb25nIGludG8NCj4geDg2J3MgYXJjaF9z
YW5pdGlzZV9kb21haW5fY29uZmlnKCkuIEFybSwgdG8gdGhlIGNvbnRyYXJ5LCBzaG91bGQNCj4g
Zm9yY2UvcmVxdWlyZSB0aGUgYml0IHRvIGJlIHVuaWZvcm1seSBvZmYuDQo+IA0KDQpJJ20gc3Vy
ZSBJIGhhZCBhIHJlYXNvbiBmb3IgZG9pbmcgaXQgbGlrZSB0aGlzIGJ1dCBpdCdzIHN1ZmZpY2ll
bnRseSBsb25nIGFnbyBub3cgdGhhdCBJJ3ZlIGZvcmdvdHRlbiB3aGF0IGl0IHdhcyouIFdvdWxk
IGl0IGJlIG9rIHRvIHRha2UgdGhlIGNvZGUgYXMtaXMgYW5kIEknbGwgaW52ZXN0aWdhdGUgd2hl
dGhlciB0aGlzIGNhbiBiZSB0aWRpZWQgdXA/DQoNClsgKiBJIHN1c3BlY3QgaXQgd2FzIGNvbmNl
cm4gb3ZlciBicmVha2luZyBleGlzdGluZyB0b29sLXN0YWNrcyBieSByZXF1aXJpbmcgdGhlbSB0
byBzZXQgYSBmbGFnIHRoYXQgcHJldmlvdXNseSB0aGV5IGRpZCBub3QgbmVlZCB0bywgYnV0IEkn
bSBub3Qgc3VyZSB0aGF0IHdhcyB0aGUgb25seSByZWFzb24gXQ0KDQogIFBhdWwNCg0KDQoNCg0K
PiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
