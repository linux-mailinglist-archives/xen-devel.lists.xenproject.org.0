Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69981AB37C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 09:52:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i690z-00058C-Cp; Fri, 06 Sep 2019 07:50:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gwiz=XB=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i690y-000585-K9
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 07:50:40 +0000
X-Inumbo-ID: 04b5a80c-d07b-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04b5a80c-d07b-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567756240;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jIhr4BHZI/Tb3l/JGP4MkCDW6vT1g8rjdmDBpgJSjEc=;
 b=FO4obM/wU8rbbraCP+gD40SHqQCjlfe1ZVt76qFYNHWKA65+huTJq6iA
 x3p+bDdtSU2P8/mZB8iALbmKlYYz0StnN4IY+nBtozRyYwrb3xhYsPW5d
 CnQZs2q/m3ReMPcBxdrj9rRwitRhGEbQIrpfaU5+ty8/YZ8KUdZvWMFhn Q=;
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
IronPort-SDR: gZUY8271aJOtRWk+llWr00JtZaseANYnXHFOzNmow/mXYvovkFID3jfuSokTwgkQUF2pyBK1jz
 GLt02h5d3agESYJimF9OelmJ2hvmvb6N/s9x1vTEb/qLM6Cy1fm0it/TWqoE21/dSe7v7dxNpC
 ZeGbVZgxrBW1Yd23amzCzU0/Rt7WnC4OzK/T4xu124x1EOp8dIWxT5WnurhwUpWPrMkj8mN8fk
 YeBUbO8LCbFGVNjp2GmH3qfaY8fqF9SB1mxJ83THbUWBlTTtB2paJz4bqEZIFBNx6ykfU+H2z3
 CKo=
X-SBRS: 2.7
X-MesageID: 5273418
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5273418"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v8 2/6] domain: introduce XEN_DOMCTL_CDF_iommu flag
Thread-Index: AQHVYZ29/ty2sHXS4UupARoJKuaUUKcdZcyAgADmHFA=
Date: Fri, 6 Sep 2019 07:50:34 +0000
Message-ID: <9e0c16373b894f9f96872b75ae42bc29@AMSPEX02CL03.citrite.net>
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-3-paul.durrant@citrix.com>
 <61a56674-207f-9c63-dd7f-cb2cd9c2e1cd@arm.com>
In-Reply-To: <61a56674-207f-9c63-dd7f-cb2cd9c2e1cd@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 2/6] domain: introduce
 XEN_DOMCTL_CDF_iommu flag
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
 George Dunlap <George.Dunlap@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPg0KPiBTZW50OiAwNSBTZXB0ZW1iZXIgMjAxOSAyMTowNg0KPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBDYzogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNv
bT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IENocmlzdGlhbiBMaW5kaWcNCj4g
PGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT47IERhdmlkIFNjb3R0IDxkYXZlQHJlY29pbC5v
cmc+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47DQo+IFdlaSBMaXUgPHds
QHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgR2Vv
cmdlIER1bmxhcA0KPiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBWb2xv
ZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjggMi82XSBkb21haW46IGludHJvZHVjZSBYRU5fRE9NQ1RMX0NERl9pb21tdSBm
bGFnDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDkvMi8xOSAzOjUwIFBNLCBQYXVsIER1cnJhbnQgd3Jv
dGU6DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2Rv
bWFpbi5jDQo+ID4gaW5kZXggZTlkMmM2MTNlMC4uN2RmYjI1N2M1MCAxMDA2NDQNCj4gPiAtLS0g
YS94ZW4vY29tbW9uL2RvbWFpbi5jDQo+ID4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPiA+
IEBAIC0zMDEsNyArMzAxLDggQEAgc3RhdGljIGludCBzYW5pdGlzZV9kb21haW5fY29uZmlnKHN0
cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmlnKQ0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9DREZfaGFwIHwNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFhFTl9ET01DVExfQ0RGX3MzX2ludGVncml0eSB8DQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX0NERl9vb3Nfb2ZmIHwNCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9DREZfeHNfZG9tYWluKSApDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9ET01DVExfQ0RGX3hzX2RvbWFpbiB8DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9ET01DVExfQ0RGX2lvbW11KSApDQo+ID4g
ICAgICAgew0KPiA+ICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLCAiVW5rbm93biBDREYg
ZmxhZ3MgJSN4XG4iLCBjb25maWctPmZsYWdzKTsNCj4gPiAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+ID4gQEAgLTMyMCw2ICszMjEsMTIgQEAgc3RhdGljIGludCBzYW5pdGlzZV9kb21haW5f
Y29uZmlnKHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmlnKQ0KPiA+ICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAgICAgICB9DQo+ID4NCj4gPiArICAgIGlmICggKGNv
bmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9pb21tdSkgJiYgIWlvbW11X2VuYWJsZWQgKQ0K
PiA+ICsgICAgew0KPiA+ICsgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJJT01NVSBpcyBu
b3QgZW5hYmxlZFxuIik7DQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICB9
DQo+ID4gKw0KPiANCj4gTG9va2luZyBhdCB0aGlzIHBhdGNoIGFnYWluLCB0aGUgaW1wbGVtZW50
YXRpb24gb2YNCj4gYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKCkgZm9yIEFybSB3aWxsIG9u
bHkgYWNjZXB0cyBjb25maWctPmZsYWdzIHRvDQo+IGJlIGVxdWFsIHRvIENERl9odm1fZ3Vlc3Qg
fCBDREZfaGFwLg0KPiANCj4gU28gYWZ0ZXIgdGhpcyBwYXRjaCwgaXQgd2lsbCBub3QgYmUgcG9z
c2libGUgdG8gY3JlYXRlIGFueSBkb21haW4gd2hlbg0KPiBDREZfaW9tbXUgaXMgc2V0Lg0KDQpZ
b3UncmUgcmlnaHQsIEknbSBub3Qgc3VyZSBob3cgSSBtaXNzZWQgdGhhdC4gSSB0aGluayBJIGhh
ZCBjaGFuZ2VkIGl0IGluIGRldmVsb3BtZW50IHRoZW4gbWFuYWdlZCB0byBsb3NlIHRoZSBodW5r
LiBDbGVhcmx5IEFSTSBuZWVkcyB0byBhY2NlcHQgdGhlIGZsYWcgdG9vLg0KDQogIFBhdWwNCg0K
PiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
