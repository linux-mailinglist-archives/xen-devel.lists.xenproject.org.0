Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7C4C30A8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:52:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEnk-0000HT-4K; Tue, 01 Oct 2019 09:50:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFEni-0000HK-Rh
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:50:34 +0000
X-Inumbo-ID: e93e8322-e430-11e9-96f7-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id e93e8322-e430-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569923434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NqfRa/+6NsTqXPXglAfucEmQt3k7DP5yoJ2O8ouoePo=;
 b=dssb1sGajEjOD34KDbK4mDqn72rJ7f32J+SBIEAnjTQfsxJrbM7WgA/u
 XdUZ87CuwJECcrghhnkVzbXZV9JOYTdonu8EV02YEql1jxEy7mzZJZ7p4
 jsv3rOaQzgRNBcds9jTpyI1otqDa89HHNb+kFrRKaLP3dC3rc+5aohtGT M=;
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
IronPort-SDR: 3rSRu+cUnmaSWcWMDTtqWKPwYvu8/gpui57WpiUxZ51qG2LvswN8+ZX8Q9V4VkvD8Rw9QMXlcb
 p8lWuEVKSAfxOnKyMC14pZPOOHVxu4xjk45gNcIu5VCC4TKD/AouicJeTHqw0y1EiyletaVhv+
 wQyyfXjdd12tF8GADx7pACH9mborZxAm7sXzgJ4dmb3YrVMzbDebkWzesS0/H+DsumGyZTtdFe
 NNtJpmACrcZa390wKc/JU52lSEF+n705oDEUfPpuelBCi0RLTBRD8Ym5/CCa3ryVmTcgOzMw9h
 SIE=
X-SBRS: 2.7
X-MesageID: 6296815
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6296815"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v3 01/10] ioreq: terminate cf8 handling at
 hypervisor level
Thread-Index: AQHVd5PfvyXNIouWgE6/OSE+gMMEIKdFjAsw
Date: Tue, 1 Oct 2019 09:50:30 +0000
Message-ID: <ae3c5e20530a4014800b6968cd701220@AMSPEX02CL03.citrite.net>
References: <20190930133238.49868-1-roger.pau@citrix.com>
 <20190930133238.49868-2-roger.pau@citrix.com>
In-Reply-To: <20190930133238.49868-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 01/10] ioreq: terminate cf8 handling at
 hypervisor level
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
 Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUm9nZXIgUGF1IE1v
bm5lDQo+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDE0OjMyDQo+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5v
cmc+OyBKYW4NCj4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggdjMg
MDEvMTBdIGlvcmVxOiB0ZXJtaW5hdGUgY2Y4IGhhbmRsaW5nIGF0IGh5cGVydmlzb3IgbGV2ZWwN
Cj4gDQo+IERvIG5vdCBmb3J3YXJkIGFjY2Vzc2VzIHRvIGNmOCB0byBleHRlcm5hbCBlbXVsYXRv
cnMsIGRlY29kaW5nIG9mIFBDSQ0KPiBhY2Nlc3NlcyBpcyBoYW5kbGVkIGJ5IFhlbiwgYW5kIGVt
dWxhdG9ycyBjYW4gcmVxdWVzdCBoYW5kbGluZyBvZg0KPiBjb25maWcgc3BhY2UgYWNjZXNzZXMg
b2YgZGV2aWNlcyB1c2luZyB0aGUgcHJvdmlkZWQgaW9yZXEgaW50ZXJmYWNlLg0KPiANCj4gRnVs
bHkgdGVybWluYXRlIGNmOCBhY2Nlc3NlcyBhdCB0aGUgaHlwZXJ2aXNvciBsZXZlbCwgYnkgaW1w
cm92aW5nIHRoZQ0KPiBleGlzdGluZyBodm1fYWNjZXNzX2NmOCBoZWxwZXIgdG8gYWxzbyBoYW5k
bGUgcmVnaXN0ZXIgcmVhZHMsIGFuZA0KPiBhbHdheXMgcmV0dXJuIFg4NkVNVUxfT0tBWSBpbiBv
cmRlciB0byB0ZXJtaW5hdGUgdGhlIGVtdWxhdGlvbi4NCj4gDQo+IE5vdGUgdGhhdCB3aXRob3V0
IHRoaXMgY2hhbmdlIGluIHRoZSBhYnNlbmNlIG9mIHNvbWUgZXh0ZXJuYWwgZW11bGF0b3INCj4g
dGhhdCBjYXRjaGVzIGFjY2Vzc2VzIHRvIGNmOCByZWFkIHJlcXVlc3RzIHRvIHRoZSByZWdpc3Rl
ciB3b3VsZA0KPiBtaXNiZWhhdmUsIGFzIHRoZSBpb3JlcSBpbnRlcm5hbCBoYW5kbGVyIGRpZCBu
b3QgaGFuZGxlIHRob3NlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxA
eGVuLm9yZz4NCg0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4gIC0gQWxsb3cgaW9yZXEg
c2VydmVycyB0byBtYXAgMHhjZjggYW5kIDB4Y2ZjLCBldmVuIGlmIHRob3NlIGFyZQ0KPiAgICBo
YW5kbGVkIGJ5IHRoZSBoeXBlcnZpc29yLg0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gIC0g
TmV3IGluIHRoaXMgdmVyc2lvbi4NCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMg
fCAxMCArKysrKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyBi
L3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYw0KPiBpbmRleCBkMzQ3MTQ0MDk2Li41ZTUwM2NlNDk4
IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMNCj4gKysrIGIveGVuL2Fy
Y2gveDg2L2h2bS9pb3JlcS5jDQo+IEBAIC0xNTE4LDExICsxNTE4LDE1IEBAIHN0YXRpYyBpbnQg
aHZtX2FjY2Vzc19jZjgoDQo+ICB7DQo+ICAgICAgc3RydWN0IGRvbWFpbiAqZCA9IGN1cnJlbnQt
PmRvbWFpbjsNCj4gDQo+IC0gICAgaWYgKCBkaXIgPT0gSU9SRVFfV1JJVEUgJiYgYnl0ZXMgPT0g
NCApDQo+ICsgICAgaWYgKCBieXRlcyAhPSA0ICkNCj4gKyAgICAgICAgcmV0dXJuIFg4NkVNVUxf
T0tBWTsNCj4gKw0KPiArICAgIGlmICggZGlyID09IElPUkVRX1dSSVRFICkNCj4gICAgICAgICAg
ZC0+YXJjaC5odm0ucGNpX2NmOCA9ICp2YWw7DQo+ICsgICAgZWxzZQ0KPiArICAgICAgICAqdmFs
ID0gZC0+YXJjaC5odm0ucGNpX2NmODsNCj4gDQo+IC0gICAgLyogV2UgYWx3YXlzIG5lZWQgdG8g
ZmFsbCB0aHJvdWdoIHRvIHRoZSBjYXRjaCBhbGwgZW11bGF0b3IgKi8NCj4gLSAgICByZXR1cm4g
WDg2RU1VTF9VTkhBTkRMRUFCTEU7DQo+ICsgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsNCj4gIH0N
Cj4gDQo+ICB2b2lkIGh2bV9pb3JlcV9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+IC0tDQo+IDIu
MjMuMA0KPiANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
