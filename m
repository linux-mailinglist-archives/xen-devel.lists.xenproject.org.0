Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E544C2F1D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 10:46:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFDkV-00010T-OE; Tue, 01 Oct 2019 08:43:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFDkU-00010O-VM
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 08:43:11 +0000
X-Inumbo-ID: 7e9c3da6-e427-11e9-96f5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 7e9c3da6-e427-11e9-96f5-12813bfff9fa;
 Tue, 01 Oct 2019 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569919389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L8dpmGb0QW8mCO4Fz1bslEcXyuBuMcAOdyO+KoFQ0Pc=;
 b=EIxNFqEpeFhii07HavcnMmULLFFgp/JwEyAd2oDtfCNaLusYDBdf7Z36
 SfkJ7/t4aS36zdqpyQVaoaIhflereTOsyBVcqd1JlyxDxlp3vjAla+rS4
 dGZHO7LURuQwKV79QMM20zSWN1a02TThxdcqgNauAxPmgirPoow7oguLE 0=;
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
IronPort-SDR: 7Glhz3tfNzGEHs6CiL1EIOoJ9nzHoo9hEqt64FXTa3DtrgeuYNxIa4wHa0NwaHCiB4lNBLZGlg
 sQJGfC8WiFJ2J4j1+LsHMm/+LC9fMnJJkCyDXurOLeYT/URfMAOAnBJpGQ/+tWaY+Wj6zf/YIS
 M64zGa/vf8ynl01qqaZLYPkec+gbW4xxwiyn06H+EyQNyk05+kXa4WMODIYqN+l43ZoUTWym7G
 Wjk9oqF8GWXARovswnySfA1hPT8DE7TioLyzvAnTvGzzZ5/pO5ZNQGW3Ve5NVVn3Fqe886PTbe
 9D8=
X-SBRS: 2.7
X-MesageID: 6583707
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6583707"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, =?utf-8?B?J0rDvHJnZW4gR3Jvw58n?=
 <jgross@suse.com>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
Thread-Index: AQHVd253+PVNwkOIxkSNk0siYotC/adD8JHw///iaACAAFc60IAAN4CAgAEXVEA=
Date: Tue, 1 Oct 2019 08:43:05 +0000
Message-ID: <db1d65179e9343baa59b1e1a132dfe21@AMSPEX02CL03.citrite.net>
References: <osstest-141990-mainreport@xen.org>
 <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
 <ea74b1b6-438a-b78e-be42-187aa432cfe2@suse.com>
 <3b225ecdc2d44cd89a996b2478d72788@AMSPEX02CL03.citrite.net>
 <3cbd0dba5a5d4b3e921b4fe247ca32a7@AMSPEX02CL03.citrite.net>
 <cc6e90c1-8f15-e2d3-144a-6a16c11e911f@suse.com>
 <4ddb83bbceeb4c858f500976da9a73f2@AMSPEX02CL03.citrite.net>
 <67da0b6a-bf6f-ab2a-b875-031eaf8a6f33@suse.com>
 <10fc2d8cfaac40d5a02840ba84ae3419@AMSPEX02CL03.citrite.net>
 <f8e413977ec14918bfec06a0c307ad08@AMSPEX02CL03.citrite.net>
In-Reply-To: <f8e413977ec14918bfec06a0c307ad08@AMSPEX02CL03.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
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
Cc: "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>,
 'osstest service owner' <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUGF1bCBEdXJyYW50
DQo+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDE3OjM4DQo+IFRvOiAnSsO8cmdlbiBHcm/Dnycg
PGpncm9zc0BzdXNlLmNvbT47ICdKYW4gQmV1bGljaCcgPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBD
YzogJ3hlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZycgPHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZz47ICdvc3N0ZXN0IHNlcnZpY2Ugb3duZXInDQo+IDxvc3N0ZXN0LWFkbWluQHhl
bnByb2plY3Qub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW3hlbi11bnN0YWJsZSB0
ZXN0XSAxNDE5OTA6IHJlZ3Jlc3Npb25zIC0gRkFJTA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+IEZyb206IFBhdWwgRHVycmFudA0KPiA+IFNlbnQ6IDMwIFNlcHRlbWJl
ciAyMDE5IDEzOjQ4DQo+ID4gVG86ICdKw7xyZ2VuIEdyb8OfJyA8amdyb3NzQHN1c2UuY29tPjsg
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IG9zc3Rlc3Qgc2VydmljZSBvd25lciA8b3NzdGVzdC1hZG1pbkB4ZW5w
cm9qZWN0Lm9yZz4NCj4gPiBTdWJqZWN0OiBSRTogW1hlbi1kZXZlbF0gW3hlbi11bnN0YWJsZSB0
ZXN0XSAxNDE5OTA6IHJlZ3Jlc3Npb25zIC0gRkFJTA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29t
Pg0KPiA+ID4gU2VudDogMzAgU2VwdGVtYmVyIDIwMTkgMTA6MzANCj4gPiA+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KPiA+ID4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgb3NzdGVz
dCBzZXJ2aWNlIG93bmVyIDxvc3N0ZXN0LWFkbWluQHhlbnByb2plY3Qub3JnPg0KPiA+ID4gU3Vi
amVjdDogUmU6IFtYZW4tZGV2ZWxdIFt4ZW4tdW5zdGFibGUgdGVzdF0gMTQxOTkwOiByZWdyZXNz
aW9ucyAtIEZBSUwNCj4gPiA+DQo+ID4gPiBPbiAzMC4wOS4xOSAxMToxNywgUGF1bCBEdXJyYW50
IHdyb3RlOg0KPiA+ID4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4+IEZy
b206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiA+ID4+IFNlbnQ6IDMwIFNl
cHRlbWJlciAyMDE5IDEwOjA3DQo+ID4gPiA+PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJh
bnRAY2l0cml4LmNvbT4NCj4gPiA+ID4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmc7IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IG9zc3Rlc3Qgc2VydmljZSBvd25l
cg0KPiA+ID4gPG9zc3Rlc3QtDQo+ID4gPiA+PiBhZG1pbkB4ZW5wcm9qZWN0Lm9yZz4NCj4gPiA+
ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbeGVuLXVuc3RhYmxlIHRlc3RdIDE0MTk5MDog
cmVncmVzc2lvbnMgLSBGQUlMDQo+ID4gPiA+Pg0KPiA+ID4gPj4gT24gMzAuMDkuMjAxOSAxMDox
NSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+ID4gPj4+IEkgY2FuJ3QgZmluZCBhbnl0aGluZyBj
b25jbHVzaXZlIGluIHRoZSBsb2dzLCBidXQgaXQgbG9va3MgbGlrZSBpdCdzIG1haW5seSBBTUQg
aC93IHRoYXQncyB0aGUNCj4gPiA+ID4+IHByb2JsZW0gYW5kIG9uIGF0IGxlYXN0IG9uZSBvZiB0
aGUgdGVzdCBmYWlsdXJlcyBJIHNlZSBsb3RzIG9mIHRoaXMga2luZCBvZiB0aGluZyBpbiB0aGUg
c2VyaWFsDQo+ID4gPiBsb2c6DQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiBTZXAgMjkgMTc6MzM6NTUu
MzE2NDIyIFsgIDE2OS44Mjg1NjNdIEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtbICAxNjkuODMxNzk4
XSBJT19QQUdFX0ZBVUxUDQo+ID4gPiA+PiBkZXZpY2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFk
ZHJlc3M9MHgwMDAwMDAwMDAwMDAwMDgwIGZsYWdzPTB4MDAyMF0NCj4gPiA+ID4+PiBTZXAgMjkg
MTc6MzM6NTUuMzc2NTk1IFsgIDE2OS44NDA0ODFdIEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtbICAx
NjkuODQzNzE2XSBJT19QQUdFX0ZBVUxUDQo+ID4gPiA+PiBkZXZpY2U9MDA6MTMuMSBkb21haW49
MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAwMDAwMDgwIGZsYWdzPTB4MDAyMF0NCj4gPiA+ID4+
PiBTZXAgMjkgMTc6MzM6NTUuMzg4NDY5IFsgIDE2OS44NTIzOThdIEFNRC1WaTogRXZlbnQgbG9n
Z2VkIFtbICAxNjkuODU1NjI3XSBJT19QQUdFX0ZBVUxUDQo+ID4gPiA+PiBkZXZpY2U9MDA6MTMu
MSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAwMDAwMDgwIGZsYWdzPTB4MDAyMF0N
Cj4gPiA+ID4+PiBTZXAgMjkgMTc6MzM6NTUuNDAwNDg2IFsgIDE2OS44NjQzMTFdIEFNRC1WaTog
RXZlbnQgbG9nZ2VkIFtbICAxNjkuODY3NTQwXSBJT19QQUdFX0ZBVUxUDQo+ID4gPiA+PiBkZXZp
Y2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAwMDAwMDgwIGZsYWdz
PTB4MDAyMF0NCj4gPiA+ID4+PiBTZXAgMjkgMTc6MzM6NTUuNDEyNTU5IFsgIDE2OS44NzYyMjRd
IEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtbICAxNjkuODc5NDU4XSBJT19QQUdFX0ZBVUxUDQo+ID4g
PiA+PiBkZXZpY2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAwMDAw
MDgwIGZsYWdzPTB4MDAyMF0NCj4gPiA+ID4+DQo+ID4gPiA+DQo+ID4gPiA+IEFoIHllcywgdGhl
eSBtaWdodCBiZS4gU3RpbGwgbm90IGZvdW5kIGFueXRoaW5nIHVzZWZ1bCBpbiBvdGhlciBsb2dz
Lg0KPiA+ID4NCj4gPiA+IE9uZSBjYXNlIHdhcyBmb3Igc3R1Yi1kbSwgYW5vdGhlciBvbmUgZm9y
IG1pZ3JhdGlvbi4NCj4gPiA+DQo+ID4gPiBJIGNvdWxkIGltYWdpbmUgaW5mby0+cGFzc3Rocm91
Z2ggaXNuJ3QgaW5pdGlhbGl6ZWQgcHJvcGVybHkgZm9yIHRoZQ0KPiA+ID4gc3R1YmRvbSBjYXNl
LCBhbmQgbWF5YmUgdGhlIGluZm9ybWF0aW9uIGlzIG1pc3NpbmcgaW4gdGhlIG1pZ3JhdGlvbg0K
PiA+ID4gc3RyZWFtLCB0b28/DQo+ID4NCj4gPiBPaywgSSd2ZSB2ZXJpZmllZCBtaWdyYXRpb24g
b24gbXkgSW50ZWwgdGVzdCByaWcuIEl0IGlzIGZpbmUgd2l0aCBwYXNzdGhyb3VnaD1kaXNhYmxl
ZCAob3Igbm9uLQ0KPiA+IGV4aXN0ZW50IGluIHRoZSB4bC5jZmcpIGFuZCBmYWlscyAoYXMgZXhw
ZWN0ZWQgZHVlIHRvIGdsb2JhbCBsb2dkaXJ0eSByZWZ1c2luZyB0byBhY3RpdmF0ZSB3aGVuDQo+
IElPTU1VDQo+ID4gbWFwcGluZ3MgYXJlIHByZXNlbnQpIHdoZW4gc2V0IHRvIGFueXRoaW5nIGVs
c2UuIFRodXMgdGhlIGFkZGl0aW9uIG9mIHRoZSBwYXNzdGhyb3VnaCBzZXR0aW5nIHNob3VsZA0K
PiA+IGFjdHVhbGx5IGZpeCBmYWlsdXJlcyBjYXVzZWQgYnkgYW4gZWFybGllciBwYXRjaCAod2hl
biBvbmx5IGEgZ2xvYmFsIGRpc2FibGUgY291bGQgdHVybiBvZmYgSU9NTVUNCj4gPiBtYXBwaW5n
cykuDQo+ID4gSSBoYXZlIG5vdCBjaGVja2VkIHN0dWJkb21zIHlldCBhbmQgSSBhbSBjdXJyZW50
bHkgYnVpbGRpbmcgYW4gQU1EIHN5c3RlbS4NCj4gPg0KPiANCj4gc3R1YmRvbSBzZWVtcyB0byB3
b3JrIChhbHRob3VnaCBpdCdzIGJyb2tlbiwgcG9zc2libHkgZm9yIGEgbG9uZyB0aW1lLCBpZiB5
b3UgdHJ5IHRvIHVzZSBhIHFjb3cyDQo+IHN5c3RlbSBkaXNrIGltYWdlKSBhbmQgQU1EIHNlZW1z
IG9rIHRvby4gU28sIHN0aWxsIG5vIGlkZWEgd2hhdCBicmVha2FnZSBvc3N0ZXN0IGhhcyBmb3Vu
ZC4NCj4gDQoNCk9rLCBJIHRoaW5rIEkndmUgZmlndXJlZCBvdXQgdGhlIHByb2JsZW0uIElmIHRo
ZSBoL3cgaXMgbm90ICdkaXJlY3RpbycgY2FwYWJsZSB0aGVuIGxpYnhsX19kb21haW5fY3JlYXRl
X2luZm9fc2V0ZGVmYXVsdCgpIHdpbGwgbGVhdmUgcGFzc3Rocm91Z2ggYWxvbmUsIG1lYW5pbmcg
aXQgaXMgc3RpbGwgc2V0IHRvIDAgPT0gTElCWExfUEFTU1RIUk9VR0hfRU5BQkxFRC4uLiBhbmQg
dGhlbiB0aGUgYXNzZXJ0aW9uIGlzIGhpdC4gSSdsbCBzZW5kIGEgcGF0Y2ggc2hvcnRseS4NCg0K
ICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
