Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17390C2F58
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 10:55:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFDtS-0001zP-9S; Tue, 01 Oct 2019 08:52:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFDtP-0001zH-Ux
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 08:52:23 +0000
X-Inumbo-ID: c82f69d9-e428-11e9-96f6-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id c82f69d9-e428-11e9-96f6-12813bfff9fa;
 Tue, 01 Oct 2019 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569919943;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OQhmzHCjkuWPkRe8kSGktlNo6ufye2d5lJdXHLXfTCU=;
 b=OFSXK4D5ZIX1Xy32gmTfNoLkxmy31DoEPTkGn5dsl01uLsUge7gQV5QZ
 B7JX2nWECtLuw04bTMlDct0cblVunfxlJwJD7Bi/Zje1QdDoNbXcqM551
 WW9Md1iu01SDCCkQ/2Ifw5YTnHKQQn0LZA4Hs9/oYXxgEP3o7/RqOhIJh U=;
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
IronPort-SDR: Xesg8HyzZWwwblMUdsDajsYh8YJZzBNLTomMwNkQpHcOD85u2VctguBgynWj6zX1fV9fQ6C1k4
 PauEglgOswGPR7/S9TjCNZZN7XCk/jzd+38yiZWHU0vmm16ONnTyeME8pSFpmOk5Zv8gwzXvvH
 l3u+9F/wJwBm/4bw0Gk9Kr/ph5iT8ZrzAIgo3QAdWV+VV+VqQGVxEHObA7LP6YREpPI/HeWqXf
 ZCtDBuWuW9wXQM7RfRpr39fEW+Y7a+kIQBA0ucavV50ORikh9B2VWg0UfoY0hNvwkbZTKMrDR6
 txM=
X-SBRS: 2.7
X-MesageID: 6294871
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6294871"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
Thread-Index: AQHVeDIwRG0o+S2xK02nqNXtlOqU5KdFV3YAgAAisFA=
Date: Tue, 1 Oct 2019 08:52:18 +0000
Message-ID: <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
In-Reply-To: <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAxIE9jdG9iZXIgMjAxOSAwOTo0Ng0KPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47
IFJvZ2VyIFBhdSBNb25uZQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFw
IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0g
W1BBVENILWZvci00LjEzXSB4ODYvbW06IGRvbid0IG5lZWRsZXNzbHkgdmV0byBtaWdyYXRpb24N
Cj4gDQo+IE9uIDAxLjEwLjIwMTkgMTA6MjgsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBOb3cg
dGhhdCB4bC5jZmcgaGFzIGFuIG9wdGlvbiB0byBleHBsaWNpdGx5IGVuYWJsZSBJT01NVSBtYXBw
aW5ncyBmb3IgYQ0KPiA+IGRvbWFpbiwgbWlncmF0aW9uIG1heSBiZSBuZWVkbGVzc2x5IHZldG9l
ZCBkdWUgdG8gdGhlIGNoZWNrIG9mDQo+ID4gaXNfaW9tbXVfZW5hYmxlZCgpIGluIHBhZ2luZ19s
b2dfZGlydHlfZW5hYmxlKCkuDQo+ID4gVGhlcmUgaXMgYWN0dWFsbHkgbm8gbmVlZCB0byBwcmV2
ZW50IGxvZ2RpcnR5IGZyb20gYmVpbmcgZW5hYmxlZCB1bmxlc3MNCj4gPiBkZXZpY2VzIGFyZSBh
c3NpZ25lZCB0byBhIGRvbWFpbiBhbmQgdGhhdCBkb21haW4gaXMgc2hhcmluZyBIQVAgbWFwcGlu
Z3MNCj4gPiB3aXRoIHRoZSBJT01NVSAoaW4gd2hpY2ggY2FzZSBkaXNhYmxpbmcgd3JpdGUgcGVy
bWlzc2lvbnMgaW4gdGhlIFAyTSBtYXkNCj4gPiBjYXVzZSBETUEgZmF1bHRzKS4NCj4gDQo+IEJ1
dCB0aGF0J3MgdGFraW5nIGludG8gYWNjb3VudCBvbmx5IGhhbGYgb2YgdGhlIHJlYXNvbiBvZiB0
aGUNCj4gZXhjbHVzaW9uLiBUaGUgb3RoZXIgaGFsZiBpcyB0aGF0IGFzc2lnbmVkIGRldmljZXMg
bWF5IGNhdXNlIHBhZ2VzDQo+IHRvIGJlIGRpcnRpZWQgYmVoaW5kIHRoZSBiYWNrIG9mIHRoZSBs
b2ctZGlydHkgbG9naWMuDQoNCkJ1dCB0aGF0J3Mgbm8gcmVhc29uIHRvIHZldG8gbG9nZGlydHku
IFNvbWUgZGV2aWNlcyBoYXZlIGRyaXZlcnMgKGluIGRvbTApIHdoaWNoIGNhbiBleHRyYWN0IERN
QSBkaXJ0eWluZyBpbmZvcm1hdGlvbiBhbmQgc2V0IGRpcnR5IHRyYWNraW5nIGluZm9ybWF0aW9u
IGFwcHJvcHJpYXRlbHkuDQoNCiAgUGF1bA0KDQo+IFRoZXJlZm9yZSAuLi4NCj4gDQo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL3Bh
Z2luZy5jDQo+ID4gQEAgLTIwOSwxNSArMjA5LDE1IEBAIHN0YXRpYyBpbnQgcGFnaW5nX2ZyZWVf
bG9nX2RpcnR5X2JpdG1hcChzdHJ1Y3QgZG9tYWluICpkLCBpbnQgcmMpDQo+ID4gICAgICByZXR1
cm4gcmM7DQo+ID4gIH0NCj4gPg0KPiA+IC1pbnQgcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoc3Ry
dWN0IGRvbWFpbiAqZCwgYm9vbF90IGxvZ19nbG9iYWwpDQo+ID4gK2ludCBwYWdpbmdfbG9nX2Rp
cnR5X2VuYWJsZShzdHJ1Y3QgZG9tYWluICpkLCBib29sIGxvZ19nbG9iYWwpDQo+ID4gIHsNCj4g
PiAgICAgIGludCByZXQ7DQo+ID4NCj4gPiAtICAgIGlmICggaXNfaW9tbXVfZW5hYmxlZChkKSAm
JiBsb2dfZ2xvYmFsICkNCj4gPiArICAgIGlmICggaGFzX2FyY2hfcGRldnMoZCkgJiYgaW9tbXVf
dXNlX2hhcF9wdChkKSAmJiBsb2dfZ2xvYmFsICkNCj4gDQo+IC4uLiB0aGUgaW9tbXVfdXNlX2hh
cF9wdChkKSBuZWVkcyB0byBiZSBkcm9wcGVkIGFnYWluLCBJIHRoaW5rLg0KPiANCj4gPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPiA+ICsrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3BjaS5jDQo+ID4gQEAgLTE0ODYsMTEgKzE0ODYsMTUgQEAgc3RhdGljIGludCBh
c3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4s
IHUzMg0KPiBmbGFnKQ0KPiA+ICAgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApDQo+ID4g
ICAgICAgICAgcmV0dXJuIDA7DQo+ID4NCj4gPiAtICAgIC8qIFByZXZlbnQgZGV2aWNlIGFzc2ln
biBpZiBtZW0gcGFnaW5nIG9yIG1lbSBzaGFyaW5nIGhhdmUgYmVlbg0KPiA+IC0gICAgICogZW5h
YmxlZCBmb3IgdGhpcyBkb21haW4gKi8NCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBQcmV2ZW50
IGRldmljZSBhc3NpZ24gaWYgbWVtIHBhZ2luZyBvciBtZW0gc2hhcmluZyBoYXZlIGJlZW4NCj4g
PiArICAgICAqIGVuYWJsZWQgZm9yIHRoaXMgZG9tYWluLCBvciBsb2dkaXJ0eSBpcyBlbmFibGVk
IGFuZCB0aGUgUDJNIGlzDQo+ID4gKyAgICAgKiBzaGFyZWQgd2l0aCB0aGUgSU9NTVUuDQo+ID4g
KyAgICAgKi8NCj4gPiAgICAgIGlmICggdW5saWtlbHkoZC0+YXJjaC5odm0ubWVtX3NoYXJpbmdf
ZW5hYmxlZCB8fA0KPiA+ICAgICAgICAgICAgICAgICAgICB2bV9ldmVudF9jaGVja19yaW5nKGQt
PnZtX2V2ZW50X3BhZ2luZykgfHwNCj4gPiAtICAgICAgICAgICAgICAgICAgcDJtX2dldF9ob3N0
cDJtKGQpLT5nbG9iYWxfbG9nZGlydHkpICkNCj4gPiArICAgICAgICAgICAgICAgICAgKHAybV9n
ZXRfaG9zdHAybShkKS0+Z2xvYmFsX2xvZ2RpcnR5ICYmDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICBpb21tdV91c2VfaGFwX3B0KGQpKSkgKQ0KPiANCj4gVGhpcyBjaGFuZ2Ugd2FudHMgZHJvcHBp
bmcgYWx0b2dldGhlciB0aGVuLg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
