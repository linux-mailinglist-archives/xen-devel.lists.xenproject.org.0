Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9D1C2552
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 18:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEygn-00073U-AJ; Mon, 30 Sep 2019 16:38:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uEAI=XZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iEygl-00073P-VS
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 16:38:20 +0000
X-Inumbo-ID: b4bb8e32-e3a0-11e9-8628-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id b4bb8e32-e3a0-11e9-8628-bc764e2007e4;
 Mon, 30 Sep 2019 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569861498;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WLewbSqk0onpRXQCO9hOg6eihMU0WqqSr2Vf0gv8fA0=;
 b=b1bapsxcNvVX0Cvj1dH4FELpFgiYoTBPO6CtAfsZt033wzhvWpkBuf1v
 0evJSxeHJRezhyCxg8IFT+Q0C9ll5ujxqosLNuA/GO/B2Oi1a+a6WoDeU
 n7VHhYKkQGhsFbuYV19PVb93v7z+cPkl+LODYRZaI26qSe/PXIfkUeFaY 4=;
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
IronPort-SDR: IgcT/QhSnzxkfOaDbnc69VIJ5fFpEBEKnU8FkcDaKx99ft2DaHHDRoLfmuHH/G0YzMVPweQRcq
 GChJAWFSSyW6J66bwU8kCJEMPIvbCkiPHc1+zt8QZ6TdikGXjCVpdbjkVY5qC9zkZxqPI3Pxn1
 qPEP58Xg4il1D+0DNa++TlpD9hgBI0IhFY2ZGh74/xd5jFokyiP46XfyjiMe2hZL7miFv1MTiw
 BhTPfQTMKBfozKgaXUHsn2IZO5HOJ11HMkl7GzmdlsKPae3YFeUvQ4EJtU3W9Htrb18OJons2X
 Rbg=
X-SBRS: 2.7
X-MesageID: 6615044
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6615044"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: =?utf-8?B?J0rDvHJnZW4gR3Jvw58n?= <jgross@suse.com>, 'Jan Beulich'
 <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
Thread-Index: AQHVd253+PVNwkOIxkSNk0siYotC/adD8JHw///iaACAAFc60IAAN4CA
Date: Mon, 30 Sep 2019 16:38:14 +0000
Message-ID: <f8e413977ec14918bfec06a0c307ad08@AMSPEX02CL03.citrite.net>
References: <osstest-141990-mainreport@xen.org>
 <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
 <ea74b1b6-438a-b78e-be42-187aa432cfe2@suse.com>
 <3b225ecdc2d44cd89a996b2478d72788@AMSPEX02CL03.citrite.net>
 <3cbd0dba5a5d4b3e921b4fe247ca32a7@AMSPEX02CL03.citrite.net>
 <cc6e90c1-8f15-e2d3-144a-6a16c11e911f@suse.com>
 <4ddb83bbceeb4c858f500976da9a73f2@AMSPEX02CL03.citrite.net>
 <67da0b6a-bf6f-ab2a-b875-031eaf8a6f33@suse.com>
 <10fc2d8cfaac40d5a02840ba84ae3419@AMSPEX02CL03.citrite.net>
In-Reply-To: <10fc2d8cfaac40d5a02840ba84ae3419@AMSPEX02CL03.citrite.net>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIER1cnJhbnQNCj4gU2Vu
dDogMzAgU2VwdGVtYmVyIDIwMTkgMTM6NDgNCj4gVG86ICdKw7xyZ2VuIEdyb8OfJyA8amdyb3Nz
QHN1c2UuY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDYzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgPG9zc3Rlc3Qt
YWRtaW5AeGVucHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6IFJFOiBbWGVuLWRldmVsXSBbeGVuLXVu
c3RhYmxlIHRlc3RdIDE0MTk5MDogcmVncmVzc2lvbnMgLSBGQUlMDQo+IA0KPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2Uu
Y29tPg0KPiA+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDEwOjMwDQo+ID4gVG86IFBhdWwgRHVy
cmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQo+ID4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgb3NzdGVzdCBz
ZXJ2aWNlIG93bmVyIDxvc3N0ZXN0LWFkbWluQHhlbnByb2plY3Qub3JnPg0KPiA+IFN1YmplY3Q6
IFJlOiBbWGVuLWRldmVsXSBbeGVuLXVuc3RhYmxlIHRlc3RdIDE0MTk5MDogcmVncmVzc2lvbnMg
LSBGQUlMDQo+ID4NCj4gPiBPbiAzMC4wOS4xOSAxMToxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0K
PiA+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+ID4+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDEw
OjA3DQo+ID4gPj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+DQo+
ID4gPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPjsgb3NzdGVzdCBzZXJ2aWNlIG93bmVyDQo+ID4gPG9zc3Rlc3QtDQo+
ID4gPj4gYWRtaW5AeGVucHJvamVjdC5vcmc+DQo+ID4gPj4gU3ViamVjdDogUmU6IFtYZW4tZGV2
ZWxdIFt4ZW4tdW5zdGFibGUgdGVzdF0gMTQxOTkwOiByZWdyZXNzaW9ucyAtIEZBSUwNCj4gPiA+
Pg0KPiA+ID4+IE9uIDMwLjA5LjIwMTkgMTA6MTUsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiA+
Pj4gSSBjYW4ndCBmaW5kIGFueXRoaW5nIGNvbmNsdXNpdmUgaW4gdGhlIGxvZ3MsIGJ1dCBpdCBs
b29rcyBsaWtlIGl0J3MgbWFpbmx5IEFNRCBoL3cgdGhhdCdzIHRoZQ0KPiA+ID4+IHByb2JsZW0g
YW5kIG9uIGF0IGxlYXN0IG9uZSBvZiB0aGUgdGVzdCBmYWlsdXJlcyBJIHNlZSBsb3RzIG9mIHRo
aXMga2luZCBvZiB0aGluZyBpbiB0aGUgc2VyaWFsDQo+ID4gbG9nOg0KPiA+ID4+Pg0KPiA+ID4+
PiBTZXAgMjkgMTc6MzM6NTUuMzE2NDIyIFsgIDE2OS44Mjg1NjNdIEFNRC1WaTogRXZlbnQgbG9n
Z2VkIFtbICAxNjkuODMxNzk4XSBJT19QQUdFX0ZBVUxUDQo+ID4gPj4gZGV2aWNlPTAwOjEzLjEg
ZG9tYWluPTB4MDAwNiBhZGRyZXNzPTB4MDAwMDAwMDAwMDAwMDA4MCBmbGFncz0weDAwMjBdDQo+
ID4gPj4+IFNlcCAyOSAxNzozMzo1NS4zNzY1OTUgWyAgMTY5Ljg0MDQ4MV0gQU1ELVZpOiBFdmVu
dCBsb2dnZWQgW1sgIDE2OS44NDM3MTZdIElPX1BBR0VfRkFVTFQNCj4gPiA+PiBkZXZpY2U9MDA6
MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAwMDAwMDgwIGZsYWdzPTB4MDAy
MF0NCj4gPiA+Pj4gU2VwIDI5IDE3OjMzOjU1LjM4ODQ2OSBbICAxNjkuODUyMzk4XSBBTUQtVmk6
IEV2ZW50IGxvZ2dlZCBbWyAgMTY5Ljg1NTYyN10gSU9fUEFHRV9GQVVMVA0KPiA+ID4+IGRldmlj
ZT0wMDoxMy4xIGRvbWFpbj0weDAwMDYgYWRkcmVzcz0weDAwMDAwMDAwMDAwMDAwODAgZmxhZ3M9
MHgwMDIwXQ0KPiA+ID4+PiBTZXAgMjkgMTc6MzM6NTUuNDAwNDg2IFsgIDE2OS44NjQzMTFdIEFN
RC1WaTogRXZlbnQgbG9nZ2VkIFtbICAxNjkuODY3NTQwXSBJT19QQUdFX0ZBVUxUDQo+ID4gPj4g
ZGV2aWNlPTAwOjEzLjEgZG9tYWluPTB4MDAwNiBhZGRyZXNzPTB4MDAwMDAwMDAwMDAwMDA4MCBm
bGFncz0weDAwMjBdDQo+ID4gPj4+IFNlcCAyOSAxNzozMzo1NS40MTI1NTkgWyAgMTY5Ljg3NjIy
NF0gQU1ELVZpOiBFdmVudCBsb2dnZWQgW1sgIDE2OS44Nzk0NThdIElPX1BBR0VfRkFVTFQNCj4g
PiA+PiBkZXZpY2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAwMDAw
MDgwIGZsYWdzPTB4MDAyMF0NCj4gPiA+Pg0KPiA+ID4NCj4gPiA+IEFoIHllcywgdGhleSBtaWdo
dCBiZS4gU3RpbGwgbm90IGZvdW5kIGFueXRoaW5nIHVzZWZ1bCBpbiBvdGhlciBsb2dzLg0KPiA+
DQo+ID4gT25lIGNhc2Ugd2FzIGZvciBzdHViLWRtLCBhbm90aGVyIG9uZSBmb3IgbWlncmF0aW9u
Lg0KPiA+DQo+ID4gSSBjb3VsZCBpbWFnaW5lIGluZm8tPnBhc3N0aHJvdWdoIGlzbid0IGluaXRp
YWxpemVkIHByb3Blcmx5IGZvciB0aGUNCj4gPiBzdHViZG9tIGNhc2UsIGFuZCBtYXliZSB0aGUg
aW5mb3JtYXRpb24gaXMgbWlzc2luZyBpbiB0aGUgbWlncmF0aW9uDQo+ID4gc3RyZWFtLCB0b28/
DQo+IA0KPiBPaywgSSd2ZSB2ZXJpZmllZCBtaWdyYXRpb24gb24gbXkgSW50ZWwgdGVzdCByaWcu
IEl0IGlzIGZpbmUgd2l0aCBwYXNzdGhyb3VnaD1kaXNhYmxlZCAob3Igbm9uLQ0KPiBleGlzdGVu
dCBpbiB0aGUgeGwuY2ZnKSBhbmQgZmFpbHMgKGFzIGV4cGVjdGVkIGR1ZSB0byBnbG9iYWwgbG9n
ZGlydHkgcmVmdXNpbmcgdG8gYWN0aXZhdGUgd2hlbiBJT01NVQ0KPiBtYXBwaW5ncyBhcmUgcHJl
c2VudCkgd2hlbiBzZXQgdG8gYW55dGhpbmcgZWxzZS4gVGh1cyB0aGUgYWRkaXRpb24gb2YgdGhl
IHBhc3N0aHJvdWdoIHNldHRpbmcgc2hvdWxkDQo+IGFjdHVhbGx5IGZpeCBmYWlsdXJlcyBjYXVz
ZWQgYnkgYW4gZWFybGllciBwYXRjaCAod2hlbiBvbmx5IGEgZ2xvYmFsIGRpc2FibGUgY291bGQg
dHVybiBvZmYgSU9NTVUNCj4gbWFwcGluZ3MpLg0KPiBJIGhhdmUgbm90IGNoZWNrZWQgc3R1YmRv
bXMgeWV0IGFuZCBJIGFtIGN1cnJlbnRseSBidWlsZGluZyBhbiBBTUQgc3lzdGVtLg0KPiANCg0K
c3R1YmRvbSBzZWVtcyB0byB3b3JrIChhbHRob3VnaCBpdCdzIGJyb2tlbiwgcG9zc2libHkgZm9y
IGEgbG9uZyB0aW1lLCBpZiB5b3UgdHJ5IHRvIHVzZSBhIHFjb3cyIHN5c3RlbSBkaXNrIGltYWdl
KSBhbmQgQU1EIHNlZW1zIG9rIHRvby4gU28sIHN0aWxsIG5vIGlkZWEgd2hhdCBicmVha2FnZSBv
c3N0ZXN0IGhhcyBmb3VuZC4NCg0KPiAgIFBhdWwNCj4gDQo+ID4NCj4gPg0KPiA+IEp1ZXJnZW4N
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
