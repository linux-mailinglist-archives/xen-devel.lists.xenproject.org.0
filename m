Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E0BBB9AA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 18:36:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCRGz-0002sH-Fv; Mon, 23 Sep 2019 16:33:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cYas=XS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iCRGx-0002s9-Ho
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 16:33:11 +0000
X-Inumbo-ID: d470992e-de1f-11e9-9604-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id d470992e-de1f-11e9-9604-12813bfff9fa;
 Mon, 23 Sep 2019 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569256391;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/2GYQDIZIhme7wGWrndb4pQ8bihfhpwV+OpooJ4jiXM=;
 b=T3Fxb9NT3JggEg0fTNk4lezk4vYEMzN+BZ/cLrN3XtUaUynR7Lck2J8K
 36D4j1QhyGb4f/9Rgr7lCsiuAzFGLn64UHAS3fLGPTM+ZUSDK1P5Q0xcF
 iA6m2T9tYRAb5kMB7mu/OE4hEf3q4UpfLAUTypw0OWwcDk2cipT+ynBpr o=;
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
IronPort-SDR: nEnO2xWQbvBvzPKLeOiWMpSglhO5I2AdHRcMZStlBdF3gHXP40OEbIemWeg4932ayOx4PGlixw
 o5fblEqYpC9Npod6IYf4Va2yuZD6LSpd4rMnG1tLgwrMbtKc8u5iwmKf2S3RFbDxXCgDHAlbQt
 U8uJA34hHtXwes7rPoc+v66YMmfaS88SBswYo3vgvSk/1+dHLPIzvDEic/kYg1H7lecIPXW/SY
 TKnuYGixfpYUROMvsdeDUj0guPfSGu0koQJtIEYUGbKLLlkxgJd0zka2ugbgSqQbvevODPxrUa
 nQc=
X-SBRS: 2.7
X-MesageID: 5939331
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,541,1559534400"; 
   d="scan'208";a="5939331"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v6 8/8] AMD/IOMMU: pre-fill all DTEs right
 after table allocation
Thread-Index: AQHVbu3pKkfSRfGwQke2gOhKxDIYDac5ezQQ
Date: Mon, 23 Sep 2019 16:33:06 +0000
Message-ID: <84ecb661c46944b2b4cb3031c373f328@AMSPEX02CL03.citrite.net>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <c5d2eaf3-77f6-f87e-6898-c4c475f607c1@suse.com>
In-Reply-To: <c5d2eaf3-77f6-f87e-6898-c4c475f607c1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 8/8] AMD/IOMMU: pre-fill all DTEs right
 after table allocation
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gN
Cj4gU2VudDogMTkgU2VwdGVtYmVyIDIwMTkgMTQ6MjUNCj4gVG86IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4
LmNvbT47IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5j
b20+DQo+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NiA4LzhdIEFNRC9JT01NVTogcHJl
LWZpbGwgYWxsIERURXMgcmlnaHQgYWZ0ZXIgdGFibGUgYWxsb2NhdGlvbg0KPiANCj4gTWFrZSBz
dXJlIHdlIGRvbid0IGxlYXZlIGFueSBEVEVzIHVuZXhwZWN0ZWQgcmVxdWVzdHMgdGhyb3VnaCB3
aGljaA0KPiB3b3VsZCBiZSBwYXNzZWQgdGhyb3VnaCB1bnRyYW5zbGF0ZWQuIFNldCBWIGFuZCBJ
ViByaWdodCBhd2F5ICh3aXRoDQo+IGFsbCBvdGhlciBmaWVsZHMgbGVmdCBhcyB6ZXJvKSwgcmVs
eWluZyBvbiB0aGUgViBhbmQvb3IgSVYgYml0cw0KPiBnZXR0aW5nIGNsZWFyZWQgb25seSBieSBh
bWRfaW9tbXVfc2V0X3Jvb3RfcGFnZV90YWJsZSgpIGFuZA0KPiBhbWRfaW9tbXVfc2V0X2ludHJl
bWFwX3RhYmxlKCkgdW5kZXIgc3BlY2lhbCBwYXNzLXRocm91Z2ggY2lyY3Vtc3RhbmNlcy4NCj4g
U3dpdGNoIGJhY2sgdG8gaW5pdGlhbCBzZXR0aW5ncyBpbiBhbWRfaW9tbXVfZGlzYWJsZV9kb21h
aW5fZGV2aWNlKCkuDQo+IA0KPiBUYWtlIHRoZSBsaWJlcnR5IGFuZCBhbHNvIG1ha2UgdGhlIGxh
dHRlciBmdW5jdGlvbiBzdGF0aWMsIGNvbnN0aWZ5aW5nDQo+IGl0cyBmaXJzdCBwYXJhbWV0ZXIg
YXQgdGhlIHNhbWUgdGltZSwgYXQgdGhpcyBvY2Nhc2lvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQoNCj4gLS0tDQo+IHY2OiBOZXcuDQo+IA0K
PiAtLS0NCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgICAgfCAg
IDIyICsrKysrKysrKysrKysrKysrKystLS0NCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9wY2lfYW1kX2lvbW11LmMgfCAgIDIwICsrKysrKysrKysrKysrKystLS0tDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jDQo+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMNCj4gQEAgLTEyNTUsMTIgKzEyNTUsMjgg
QEAgc3RhdGljIGludCBfX2luaXQgYW1kX2lvbW11X3NldHVwX2RldmljZQ0KPiANCj4gICAgICBp
ZiAoICFkdCApDQo+ICAgICAgew0KPiArICAgICAgICB1bnNpZ25lZCBpbnQgc2l6ZSA9IGR0X2Fs
bG9jX3NpemUoKTsNCj4gKw0KPiAgICAgICAgICAvKiBhbGxvY2F0ZSAnZGV2aWNlIHRhYmxlJyBv
biBhIDRLIGJvdW5kYXJ5ICovDQo+ICAgICAgICAgIGR0ID0gSVZSU19NQVBQSU5HU19ERVZUQUIo
aXZyc19tYXBwaW5ncykgPQ0KPiAtICAgICAgICAgICAgYWxsb2NhdGVfYnVmZmVyKGR0X2FsbG9j
X3NpemUoKSwgIkRldmljZSBUYWJsZSIpOw0KPiArICAgICAgICAgICAgYWxsb2NhdGVfYnVmZmVy
KHNpemUsICJEZXZpY2UgVGFibGUiKTsNCj4gKyAgICAgICAgaWYgKCAhZHQgKQ0KPiArICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICog
UHJlZmlsbCBldmVyeSBEVEUgc3VjaCB0aGF0IGFsbCBraW5kcyBvZiByZXF1ZXN0cyB3aWxsIGdl
dCBhYm9ydGVkLg0KPiArICAgICAgICAgKiBCZXNpZGVzIHRoZSB0d28gYml0cyBzZXQgdG8gdHJ1
ZSBiZWxvdyB0aGlzIGJ1aWxkcyB1cG9uDQo+ICsgICAgICAgICAqIElPTU1VX0RFVl9UQUJMRV9T
WVNfTUdUX0RNQV9BQk9SVEVELA0KPiArICAgICAgICAgKiBJT01NVV9ERVZfVEFCTEVfSU9fQ09O
VFJPTF9BQk9SVEVELCBhcyB3ZWxsIGFzDQo+ICsgICAgICAgICAqIElPTU1VX0RFVl9UQUJMRV9J
TlRfQ09OVFJPTF9BQk9SVEVEIGFsbCBiZWluZyB6ZXJvLCBhbmQgdXMgYWxzbw0KPiArICAgICAg
ICAgKiB3YW50aW5nIGF0IGxlYXN0IFRWLCBHViwgSSwgYW5kIEVYIHNldCB0byBmYWxzZS4NCj4g
KyAgICAgICAgICovDQo+ICsgICAgICAgIGZvciAoIGJkZiA9IDAsIHNpemUgLz0gc2l6ZW9mKCpk
dCk7IGJkZiA8IHNpemU7ICsrYmRmICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgZHRb
YmRmXS52ID0gdHJ1ZTsNCj4gKyAgICAgICAgICAgIGR0W2JkZl0uaXYgPSB0cnVlOw0KPiArICAg
ICAgICB9DQo+ICAgICAgfQ0KPiAtICAgIGlmICggIWR0ICkNCj4gLSAgICAgICAgcmV0dXJuIC1F
Tk9NRU07DQo+IA0KPiAgICAgIC8qIEFkZCBkZXZpY2UgdGFibGUgZW50cmllcyAqLw0KPiAgICAg
IGZvciAoIGJkZiA9IDA7IGJkZiA8IGl2cnNfYmRmX2VudHJpZXM7IGJkZisrICkNCj4gLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYw0KPiArKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jDQo+IEBAIC0yNjcsOSArMjY3
LDkgQEAgc3RhdGljIHZvaWQgX19od2RvbV9pbml0IGFtZF9pb21tdV9od2RvbQ0KPiAgICAgIHNl
dHVwX2h3ZG9tX3BjaV9kZXZpY2VzKGQsIGFtZF9pb21tdV9hZGRfZGV2aWNlKTsNCj4gIH0NCj4g
DQo+IC12b2lkIGFtZF9pb21tdV9kaXNhYmxlX2RvbWFpbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAq
ZG9tYWluLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBh
bWRfaW9tbXUgKmlvbW11LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHU4IGRldmZuLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4gK3N0YXRpYyB2b2lkIGFtZF9pb21t
dV9kaXNhYmxlX2RvbWFpbl9kZXZpY2UoY29uc3Qgc3RydWN0IGRvbWFpbiAqZG9tYWluLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYW1kX2lv
bW11ICppb21tdSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDhfdCBkZXZmbiwgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+ICB7DQo+ICAgICAgc3Ry
dWN0IGFtZF9pb21tdV9kdGUgKnRhYmxlLCAqZHRlOw0KPiAgICAgIHVuc2lnbmVkIGxvbmcgZmxh
Z3M7DQo+IEBAIC0yODQsOSArMjg0LDIxIEBAIHZvaWQgYW1kX2lvbW11X2Rpc2FibGVfZG9tYWlu
X2RldmljZShzdHINCj4gICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW9tbXUtPmxvY2ssIGZsYWdz
KTsNCj4gICAgICBpZiAoIGR0ZS0+dHYgfHwgZHRlLT52ICkNCj4gICAgICB7DQo+ICsgICAgICAg
IC8qIFNlZSB0aGUgY29tbWVudCBpbiBhbWRfaW9tbXVfc2V0dXBfZGV2aWNlX3RhYmxlKCkuICov
DQo+ICsgICAgICAgIGR0ZS0+aW50X2N0bCA9IElPTU1VX0RFVl9UQUJMRV9JTlRfQ09OVFJPTF9B
Qk9SVEVEOw0KPiArICAgICAgICBzbXBfd21iKCk7DQo+ICsgICAgICAgIGR0ZS0+aXYgPSB0cnVl
Ow0KPiAgICAgICAgICBkdGUtPnR2ID0gZmFsc2U7DQo+IC0gICAgICAgIGR0ZS0+diA9IGZhbHNl
Ow0KPiArICAgICAgICBkdGUtPmd2ID0gZmFsc2U7DQo+ICAgICAgICAgIGR0ZS0+aSA9IGZhbHNl
Ow0KPiArICAgICAgICBkdGUtPmV4ID0gZmFsc2U7DQo+ICsgICAgICAgIGR0ZS0+c2EgPSBmYWxz
ZTsNCj4gKyAgICAgICAgZHRlLT5zZSA9IGZhbHNlOw0KPiArICAgICAgICBkdGUtPnNkID0gZmFs
c2U7DQo+ICsgICAgICAgIGR0ZS0+c3lzX21ndCA9IElPTU1VX0RFVl9UQUJMRV9TWVNfTUdUX0RN
QV9BQk9SVEVEOw0KPiArICAgICAgICBkdGUtPmlvY3RsID0gSU9NTVVfREVWX1RBQkxFX0lPX0NP
TlRST0xfQUJPUlRFRDsNCj4gKyAgICAgICAgc21wX3dtYigpOw0KPiArICAgICAgICBkdGUtPnYg
PSB0cnVlOw0KPiANCj4gICAgICAgICAgYW1kX2lvbW11X2ZsdXNoX2RldmljZShpb21tdSwgcmVx
X2lkKTsNCj4gDQo+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
