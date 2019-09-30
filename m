Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ABBC20E8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 14:50:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEv5l-0001GO-Ei; Mon, 30 Sep 2019 12:47:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uEAI=XZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iEv5j-0001GJ-Pz
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 12:47:51 +0000
X-Inumbo-ID: 82af94b2-e380-11e9-96d0-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 82af94b2-e380-11e9-96d0-12813bfff9fa;
 Mon, 30 Sep 2019 12:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569847671;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9FNQXdIlZqhq2tey9zhDqxaQuSN3A4bfi1kEqV7qxI4=;
 b=TQGqbk7D6H/p6Ty0/QK+h40UzzSAQi+D6xc/07LauHSf0AeY4rqKdO+Q
 CZU7F0IN+dRvpCoI7fWxa25yOGdYc/rvcya04UmUSG4kOC7c1e4+WhrZE
 6j2xFNV9da8IoSR1QeWI0UHrxkQu2F3/jb8q1NqCWJZs80VNyoGPtucZw Q=;
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
IronPort-SDR: 6cc9v3FlfLh/N3FDoyG3Q4PmPjo9+mrHMmTnjnHMqcI6AiNdoQXSTet/5JjBt9YlU8mLMIE7NI
 ISqYleJ4nPTU1cZPOMcObZSWbz+uk5A4JVQPPPrUwEyNok2qeRMDdt5CilRXZXFF5J4bi5Q2cp
 hZ8xrmDzWs+I0JTKO8XkV8sLtntQUuk4OrB0Jy7dXvQEIxhApSf0oLpH1bku72oifx2t7XdKQV
 LyHSUBrnWeKz6hweJabyJdMcQ5J4miVOW80p/I/ASjjzF7ARYchBi5aGFYg99ob0XOdP2UHBww
 CG8=
X-SBRS: 2.7
X-MesageID: 6253799
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6253799"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: =?utf-8?B?J0rDvHJnZW4gR3Jvw58n?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
Thread-Index: AQHVd253+PVNwkOIxkSNk0siYotC/adD8JHw///iaACAAFc60A==
Date: Mon, 30 Sep 2019 12:47:46 +0000
Message-ID: <10fc2d8cfaac40d5a02840ba84ae3419@AMSPEX02CL03.citrite.net>
References: <osstest-141990-mainreport@xen.org>
 <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
 <ea74b1b6-438a-b78e-be42-187aa432cfe2@suse.com>
 <3b225ecdc2d44cd89a996b2478d72788@AMSPEX02CL03.citrite.net>
 <3cbd0dba5a5d4b3e921b4fe247ca32a7@AMSPEX02CL03.citrite.net>
 <cc6e90c1-8f15-e2d3-144a-6a16c11e911f@suse.com>
 <4ddb83bbceeb4c858f500976da9a73f2@AMSPEX02CL03.citrite.net>
 <67da0b6a-bf6f-ab2a-b875-031eaf8a6f33@suse.com>
In-Reply-To: <67da0b6a-bf6f-ab2a-b875-031eaf8a6f33@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDEwOjMwDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBvc3N0ZXN0
IHNlcnZpY2Ugb3duZXIgPG9zc3Rlc3QtYWRtaW5AeGVucHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6
IFJlOiBbWGVuLWRldmVsXSBbeGVuLXVuc3RhYmxlIHRlc3RdIDE0MTk5MDogcmVncmVzc2lvbnMg
LSBGQUlMDQo+IA0KPiBPbiAzMC4wOS4xOSAxMToxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDEwOjA3DQo+ID4+
IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiA+PiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+OyBvc3N0ZXN0IHNlcnZpY2Ugb3duZXINCj4gPG9zc3Rlc3QtDQo+ID4+IGFkbWluQHhlbnBy
b2plY3Qub3JnPg0KPiA+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW3hlbi11bnN0YWJsZSB0
ZXN0XSAxNDE5OTA6IHJlZ3Jlc3Npb25zIC0gRkFJTA0KPiA+Pg0KPiA+PiBPbiAzMC4wOS4yMDE5
IDEwOjE1LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+PiBJIGNhbid0IGZpbmQgYW55dGhpbmcg
Y29uY2x1c2l2ZSBpbiB0aGUgbG9ncywgYnV0IGl0IGxvb2tzIGxpa2UgaXQncyBtYWlubHkgQU1E
IGgvdyB0aGF0J3MgdGhlDQo+ID4+IHByb2JsZW0gYW5kIG9uIGF0IGxlYXN0IG9uZSBvZiB0aGUg
dGVzdCBmYWlsdXJlcyBJIHNlZSBsb3RzIG9mIHRoaXMga2luZCBvZiB0aGluZyBpbiB0aGUgc2Vy
aWFsDQo+IGxvZzoNCj4gPj4+DQo+ID4+PiBTZXAgMjkgMTc6MzM6NTUuMzE2NDIyIFsgIDE2OS44
Mjg1NjNdIEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtbICAxNjkuODMxNzk4XSBJT19QQUdFX0ZBVUxU
DQo+ID4+IGRldmljZT0wMDoxMy4xIGRvbWFpbj0weDAwMDYgYWRkcmVzcz0weDAwMDAwMDAwMDAw
MDAwODAgZmxhZ3M9MHgwMDIwXQ0KPiA+Pj4gU2VwIDI5IDE3OjMzOjU1LjM3NjU5NSBbICAxNjku
ODQwNDgxXSBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbWyAgMTY5Ljg0MzcxNl0gSU9fUEFHRV9GQVVM
VA0KPiA+PiBkZXZpY2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAw
MDAwMDgwIGZsYWdzPTB4MDAyMF0NCj4gPj4+IFNlcCAyOSAxNzozMzo1NS4zODg0NjkgWyAgMTY5
Ljg1MjM5OF0gQU1ELVZpOiBFdmVudCBsb2dnZWQgW1sgIDE2OS44NTU2MjddIElPX1BBR0VfRkFV
TFQNCj4gPj4gZGV2aWNlPTAwOjEzLjEgZG9tYWluPTB4MDAwNiBhZGRyZXNzPTB4MDAwMDAwMDAw
MDAwMDA4MCBmbGFncz0weDAwMjBdDQo+ID4+PiBTZXAgMjkgMTc6MzM6NTUuNDAwNDg2IFsgIDE2
OS44NjQzMTFdIEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtbICAxNjkuODY3NTQwXSBJT19QQUdFX0ZB
VUxUDQo+ID4+IGRldmljZT0wMDoxMy4xIGRvbWFpbj0weDAwMDYgYWRkcmVzcz0weDAwMDAwMDAw
MDAwMDAwODAgZmxhZ3M9MHgwMDIwXQ0KPiA+Pj4gU2VwIDI5IDE3OjMzOjU1LjQxMjU1OSBbICAx
NjkuODc2MjI0XSBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbWyAgMTY5Ljg3OTQ1OF0gSU9fUEFHRV9G
QVVMVA0KPiA+PiBkZXZpY2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAw
MDAwMDAwMDgwIGZsYWdzPTB4MDAyMF0NCj4gPj4NCj4gPg0KPiA+IEFoIHllcywgdGhleSBtaWdo
dCBiZS4gU3RpbGwgbm90IGZvdW5kIGFueXRoaW5nIHVzZWZ1bCBpbiBvdGhlciBsb2dzLg0KPiAN
Cj4gT25lIGNhc2Ugd2FzIGZvciBzdHViLWRtLCBhbm90aGVyIG9uZSBmb3IgbWlncmF0aW9uLg0K
PiANCj4gSSBjb3VsZCBpbWFnaW5lIGluZm8tPnBhc3N0aHJvdWdoIGlzbid0IGluaXRpYWxpemVk
IHByb3Blcmx5IGZvciB0aGUNCj4gc3R1YmRvbSBjYXNlLCBhbmQgbWF5YmUgdGhlIGluZm9ybWF0
aW9uIGlzIG1pc3NpbmcgaW4gdGhlIG1pZ3JhdGlvbg0KPiBzdHJlYW0sIHRvbz8NCg0KT2ssIEkn
dmUgdmVyaWZpZWQgbWlncmF0aW9uIG9uIG15IEludGVsIHRlc3QgcmlnLiBJdCBpcyBmaW5lIHdp
dGggcGFzc3Rocm91Z2g9ZGlzYWJsZWQgKG9yIG5vbi1leGlzdGVudCBpbiB0aGUgeGwuY2ZnKSBh
bmQgZmFpbHMgKGFzIGV4cGVjdGVkIGR1ZSB0byBnbG9iYWwgbG9nZGlydHkgcmVmdXNpbmcgdG8g
YWN0aXZhdGUgd2hlbiBJT01NVSBtYXBwaW5ncyBhcmUgcHJlc2VudCkgd2hlbiBzZXQgdG8gYW55
dGhpbmcgZWxzZS4gVGh1cyB0aGUgYWRkaXRpb24gb2YgdGhlIHBhc3N0aHJvdWdoIHNldHRpbmcg
c2hvdWxkIGFjdHVhbGx5IGZpeCBmYWlsdXJlcyBjYXVzZWQgYnkgYW4gZWFybGllciBwYXRjaCAo
d2hlbiBvbmx5IGEgZ2xvYmFsIGRpc2FibGUgY291bGQgdHVybiBvZmYgSU9NTVUgbWFwcGluZ3Mp
Lg0KSSBoYXZlIG5vdCBjaGVja2VkIHN0dWJkb21zIHlldCBhbmQgSSBhbSBjdXJyZW50bHkgYnVp
bGRpbmcgYW4gQU1EIHN5c3RlbS4NCg0KICBQYXVsDQoNCj4gDQo+IA0KPiBKdWVyZ2VuDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
