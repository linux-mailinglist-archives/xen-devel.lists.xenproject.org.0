Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE993BB994
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 18:28:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCRA5-0001sb-Rd; Mon, 23 Sep 2019 16:26:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cYas=XS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iCRA4-0001sW-38
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 16:26:04 +0000
X-Inumbo-ID: d54eda96-de1e-11e9-9604-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id d54eda96-de1e-11e9-9604-12813bfff9fa;
 Mon, 23 Sep 2019 16:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569255963;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ukWyOe+xk33U3k8xDfoNv9VrQbKPNbsZ7P6UHNIuKgQ=;
 b=NRJE4QsfIQVkjKjEiQdZk4M3cnB2FmrOoD7LMmuPga4PUIXZdgfrPwKX
 qQRIQDbClOwnfLTiKFw2QFbWmrbMGaqR1yIV0J9tRxG0HFsKHALWPHJEC
 ZqtYBD+/H+n5FiFDxDOi2m+DGPY0Q2CwYWx3XgyCD6DEBWZ/2zLRqBRTc g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CRg0HTh8T1AaoiTqAAqX5PA5i8cUJP0ETey0laEULGcPz5mgyryJc2Q7RiHFQ0yRL6yhFQEZOV
 6wERon+1zwlo/Z03caDtPVmY+qmFji/CimsZ8vtuVaIFcmofNtEAJDmpBLrckHseLJ/iRNEtNy
 OFIlHMmqKIi4qRjgolw907TS/IQsfpsHdF9qhCJUqdFj12ZqBh5J/1Uhxn1hHhh72bHRUG0qdi
 6Ojx/veFlRn57/IHFYGEsmuHTpvYvEA2Bam9Pd/N8JCjRMt3uttxAr7w4Vcc4ZWDOSFLxjtuhE
 iRQ=
X-SBRS: 2.7
X-MesageID: 5945495
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,541,1559534400"; 
   d="scan'208";a="5945495"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v6 6/8] AMD/IOMMU: tidy struct ivrs_mappings
Thread-Index: AQHVbu3E2x13CiTrgkyIxcLuJ2Ba16c5eODg
Date: Mon, 23 Sep 2019 16:25:58 +0000
Message-ID: <6b8b0d5e09c24b068ede852c4eab50dc@AMSPEX02CL03.citrite.net>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <6de11867-b872-a2a1-7c26-af004164bfea@suse.com>
In-Reply-To: <6de11867-b872-a2a1-7c26-af004164bfea@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 6/8] AMD/IOMMU: tidy struct ivrs_mappings
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
Cj4gU2VudDogMTkgU2VwdGVtYmVyIDIwMTkgMTQ6MjQNCj4gVG86IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4
LmNvbT47IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5j
b20+DQo+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NiA2LzhdIEFNRC9JT01NVTogdGlk
eSBzdHJ1Y3QgaXZyc19tYXBwaW5ncw0KPiANCj4gTW92ZSB0aGUgZGV2aWNlIGZsYWdzIGZpZWxk
IHVwIGludG8gYW4gdW51c2VkIGhvbGUsIHRodXMgc2hyaW5raW5nDQo+IG92ZXJhbGwgc3RydWN0
dXJlIHNpemUgYnkgOCBieXRlcy4gVXNlIGJvb2wgYW5kIHVpbnQ8Tj5fdCBhcw0KPiBhcHByb3By
aWF0ZS4gRHJvcCBwb2ludGxlc3MgKHJlZHVuZGFudCkgaW5pdGlhbGl6YXRpb25zLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdl
ZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCg0KLi4uYWx0aG91
Z2ggSSB3b25kZXIuLi4NCg0KPiAtLS0NCj4gdjY6IE5ldy4NCj4gDQo+IC0tLQ0KPiAgeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGkuYyB8ICAgIDYgKysrLS0tDQo+ICB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jIHwgICAgNiAtLS0tLS0NCj4gIHhl
bi9pbmNsdWRlL2FzbS14ODYvYW1kLWlvbW11LmggICAgICAgICAgfCAgIDE3ICsrKysrKysrKy0t
LS0tLS0tDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9u
cygtKQ0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGku
Yw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfYWNwaS5jDQo+IEBA
IC0xNjUsNyArMTY1LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHJlc2VydmVfdW5pdHlfbWFwX2Zv
cg0KPiAgICAgIC8qIGV4dGVuZCByL3cgcGVybWlzc2lvbXMgYW5kIGtlZXAgYWdncmVnYXRlICov
DQo+ICAgICAgaXZyc19tYXBwaW5nc1tiZGZdLndyaXRlX3Blcm1pc3Npb24gPSBpdzsNCj4gICAg
ICBpdnJzX21hcHBpbmdzW2JkZl0ucmVhZF9wZXJtaXNzaW9uID0gaXI7DQo+IC0gICAgaXZyc19t
YXBwaW5nc1tiZGZdLnVuaXR5X21hcF9lbmFibGUgPSBJT01NVV9DT05UUk9MX0VOQUJMRUQ7DQo+
ICsgICAgaXZyc19tYXBwaW5nc1tiZGZdLnVuaXR5X21hcF9lbmFibGUgPSB0cnVlOw0KPiAgICAg
IGl2cnNfbWFwcGluZ3NbYmRmXS5hZGRyX3JhbmdlX3N0YXJ0ID0gYmFzZTsNCj4gICAgICBpdnJz
X21hcHBpbmdzW2JkZl0uYWRkcl9yYW5nZV9sZW5ndGggPSBsZW5ndGg7DQo+ICB9DQo+IEBAIC0y
NDIsOCArMjQyLDggQEAgc3RhdGljIGludCBfX2luaXQgcmVnaXN0ZXJfZXhjbHVzaW9uX3Jhbg0K
PiAgICAgIGlmICggbGltaXQgPj0gaW9tbXVfdG9wICApDQo+ICAgICAgew0KPiAgICAgICAgICBy
ZXNlcnZlX2lvbW11X2V4Y2x1c2lvbl9yYW5nZShpb21tdSwgYmFzZSwgbGltaXQpOw0KPiAtICAg
ICAgICBpdnJzX21hcHBpbmdzW2JkZl0uZHRlX2FsbG93X2V4Y2x1c2lvbiA9IElPTU1VX0NPTlRS
T0xfRU5BQkxFRDsNCj4gLSAgICAgICAgaXZyc19tYXBwaW5nc1tyZXFdLmR0ZV9hbGxvd19leGNs
dXNpb24gPSBJT01NVV9DT05UUk9MX0VOQUJMRUQ7DQo+ICsgICAgICAgIGl2cnNfbWFwcGluZ3Nb
YmRmXS5kdGVfYWxsb3dfZXhjbHVzaW9uID0gdHJ1ZTsNCj4gKyAgICAgICAgaXZyc19tYXBwaW5n
c1tyZXFdLmR0ZV9hbGxvd19leGNsdXNpb24gPSB0cnVlOw0KPiAgICAgIH0NCj4gDQo+ICAgICAg
cmV0dXJuIDA7DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0
LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYw0KPiBA
QCAtMTIyMiwxMiArMTIyMiw2IEBAIHN0YXRpYyBpbnQgX19pbml0IGFsbG9jX2l2cnNfbWFwcGlu
Z3ModTENCj4gICAgICBmb3IgKCBiZGYgPSAwOyBiZGYgPCBpdnJzX2JkZl9lbnRyaWVzOyBiZGYr
KyApDQo+ICAgICAgew0KPiAgICAgICAgICBpdnJzX21hcHBpbmdzW2JkZl0uZHRlX3JlcXVlc3Rv
cl9pZCA9IGJkZjsNCj4gLSAgICAgICAgaXZyc19tYXBwaW5nc1tiZGZdLmR0ZV9hbGxvd19leGNs
dXNpb24gPSBJT01NVV9DT05UUk9MX0RJU0FCTEVEOw0KPiAtICAgICAgICBpdnJzX21hcHBpbmdz
W2JkZl0udW5pdHlfbWFwX2VuYWJsZSA9IElPTU1VX0NPTlRST0xfRElTQUJMRUQ7DQo+IC0gICAg
ICAgIGl2cnNfbWFwcGluZ3NbYmRmXS5pb21tdSA9IE5VTEw7DQo+IC0NCj4gLSAgICAgICAgaXZy
c19tYXBwaW5nc1tiZGZdLmludHJlbWFwX3RhYmxlID0gTlVMTDsNCj4gLSAgICAgICAgaXZyc19t
YXBwaW5nc1tiZGZdLmRldmljZV9mbGFncyA9IDA7DQo+IA0KPiAgICAgICAgICBpZiAoIGFtZF9p
b21tdV9wZXJkZXZfaW50cmVtYXAgKQ0KPiAgICAgICAgICAgICAgc3Bpbl9sb2NrX2luaXQoJml2
cnNfbWFwcGluZ3NbYmRmXS5pbnRyZW1hcF9sb2NrKTsNCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9hbWQtaW9tbXUuaA0KPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2FtZC1pb21tdS5o
DQo+IEBAIC0xMDYsMTIgKzEwNiwxNiBAQCBzdHJ1Y3QgYW1kX2lvbW11IHsNCj4gIH07DQo+IA0K
PiAgc3RydWN0IGl2cnNfbWFwcGluZ3Mgew0KPiAtICAgIHUxNiBkdGVfcmVxdWVzdG9yX2lkOw0K
PiAtICAgIHU4IGR0ZV9hbGxvd19leGNsdXNpb247DQo+IC0gICAgdTggdW5pdHlfbWFwX2VuYWJs
ZTsNCj4gLSAgICB1OCB3cml0ZV9wZXJtaXNzaW9uOw0KPiAtICAgIHU4IHJlYWRfcGVybWlzc2lv
bjsNCj4gKyAgICB1aW50MTZfdCBkdGVfcmVxdWVzdG9yX2lkOw0KPiAgICAgIGJvb2wgdmFsaWQ7
DQo+ICsgICAgYm9vbCBkdGVfYWxsb3dfZXhjbHVzaW9uOw0KPiArICAgIGJvb2wgdW5pdHlfbWFw
X2VuYWJsZTsNCj4gKyAgICBib29sIHdyaXRlX3Blcm1pc3Npb247DQo+ICsgICAgYm9vbCByZWFk
X3Blcm1pc3Npb247DQoNCkNvdWxkIHlvdSBzaHJpbmsgdGhpcyBldmVuIG1vcmUgYnkgdXNpbmcg
YSBiaXQtZmllbGQgaW5zdGVhZCBvZiB0aGlzIHNlcXVlbmNlIG9mIGJvb2xzPw0KDQo+ICsNCj4g
KyAgICAvKiBpdmhkIGRldmljZSBkYXRhIHNldHRpbmdzICovDQo+ICsgICAgdWludDhfdCBkZXZp
Y2VfZmxhZ3M7DQo+ICsNCj4gICAgICB1bnNpZ25lZCBsb25nIGFkZHJfcmFuZ2Vfc3RhcnQ7DQo+
ICAgICAgdW5zaWduZWQgbG9uZyBhZGRyX3JhbmdlX2xlbmd0aDsNCj4gICAgICBzdHJ1Y3QgYW1k
X2lvbW11ICppb21tdTsNCj4gQEAgLTEyMCw5ICsxMjQsNiBAQCBzdHJ1Y3QgaXZyc19tYXBwaW5n
cyB7DQo+ICAgICAgdm9pZCAqaW50cmVtYXBfdGFibGU7DQo+ICAgICAgdW5zaWduZWQgbG9uZyAq
aW50cmVtYXBfaW51c2U7DQo+ICAgICAgc3BpbmxvY2tfdCBpbnRyZW1hcF9sb2NrOw0KPiAtDQo+
IC0gICAgLyogaXZoZCBkZXZpY2UgZGF0YSBzZXR0aW5ncyAqLw0KPiAtICAgIHU4IGRldmljZV9m
bGFnczsNCj4gIH07DQo+IA0KPiAgZXh0ZXJuIHVuc2lnbmVkIGludCBpdnJzX2JkZl9lbnRyaWVz
Ow0KPiANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
