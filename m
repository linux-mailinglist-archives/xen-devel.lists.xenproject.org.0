Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C104C5CD99
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 12:34:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiG4x-0003WL-By; Tue, 02 Jul 2019 10:32:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/Ug=U7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hiG4v-0003WF-K0
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 10:32:01 +0000
X-Inumbo-ID: 9f7de458-9cb4-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9f7de458-9cb4-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 10:31:59 +0000 (UTC)
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
IronPort-SDR: iOkXTVYeEFv03XJpywgtiy6iboW+XOT5UPD5s4nMHBR5dmsSbu0dH0wt2WJZ8sINU3uBHHiZ3i
 HVqARyOCdXikZl9QEI0MgsLGDqiVX0+PqZdm0SPVnpWRfBls36PT+jvze8ju+ATx2f/OOmRrBz
 RdDuBzj0Gbf4Qy7sKUxLHgZI2gn5vMheYdTqHHIOtivMDyqqR22e1wS1jce4+Vy7bhi911jLl/
 qloYI976W4ctB3+fMH2TW/8d9oZjv3BDfM2WS4tP5IhbPMNhE/5LizCQRC0LRFAlsXxS6lWHnm
 al4=
X-SBRS: 2.7
X-MesageID: 2492939
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2492939"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] x86/msi: fix loop termination condition in
 pci_msi_conf_write_intercept()
Thread-Index: AQHVMLlSQz9LQ3Qz2ke/jYQTUf67MKa283QAgAALZgCAACHP4A==
Date: Tue, 2 Jul 2019 10:31:56 +0000
Message-ID: <6c2fb9337c9f4fbbb68c31055337e81e@AMSPEX02CL03.citrite.net>
References: <20190702093414.27798-1-paul.durrant@citrix.com>
 <dea713b0-41ca-ea87-9ebe-4586357dbba6@citrix.com>
 <2cbdcf94-f759-9c0a-6142-9ca01cb51314@citrix.com>
In-Reply-To: <2cbdcf94-f759-9c0a-6142-9ca01cb51314@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/msi: fix loop termination condition in
 pci_msi_conf_write_intercept()
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAwMiBKdWx5IDIwMTkgMTE6MjkNCj4gVG86
IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRy
aXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT47DQo+IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIHg4Ni9tc2k6IGZpeCBsb29wIHRlcm1pbmF0aW9u
IGNvbmRpdGlvbiBpbg0KPiBwY2lfbXNpX2NvbmZfd3JpdGVfaW50ZXJjZXB0KCkNCj4gDQo+IE9u
IDAyLzA3LzIwMTkgMTA6NDcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+ID4gT24gMDIvMDcvMjAx
OSAxMDozNCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiBUaGUgZm9yIGxvb3AgdGhhdCBkZWFs
cyB3aXRoIE1TSSBtYXNraW5nIGlzIGNvZGVkIGFzIGZvbGxvd3M6DQo+ID4+DQo+ID4+IGZvciAo
IHBvcyA9IDA7IHBvcyA8IGVudHJ5LT5tc2kubnZlYzsgKytwb3MsICsrZW50cnkgKQ0KPiA+Pg0K
PiA+PiBUaHVzIHRoZSBsb29wIHRlcm1pbmF0aW9uIGNvbmRpdGlvbiBpcyBkZXJlZmVyZW5jaW5n
IGEgc3RydWN0IHBvaW50ZXIgdGhhdA0KPiA+PiBpcyBiZWluZyBpbmNyZW1lbnRlZCBieSB0aGUg
bG9vcC4gSG93ZXZlciwgaXQgaXMgY2xlYXIgZnJvbSBmb2xsb3dpbmcgY29kZQ0KPiA+PiBwYXRo
cyBpbiBtc2lfY2FwYWJpbGl0eV9pbml0KCkgdGhhdCB0aGlzIGlzIHVuc2FmZSBhcyBmb3IgaW5z
dGFuY2UsIGluIHRoZQ0KPiA+PiBjYXNlIG9mIG52ZWMgPT0gMSwgZW50cnkgd2lsbCBwb2ludCBh
dCBhIHNpbmdsZSBzdHJ1Y3QgbXNpX2Rlc2MgYWxsb2NhdGlvbg0KPiA+PiBhbmQgdGh1cyB0aGUg
bG9vcCB3aWxsIHdhbGsgYmV5b25kIHRoZSBib3VuZHMgb2YgdGhlIGFsbG9jYXRpb24gYmVmb3Jl
DQo+ID4+IGRlcmVmZXJlbmNpbmcgdGhlIG1lbW9yeSB0byBkZXRlcm1pbmUgd2hldGhlciB0aGUg
bG9vcCBzaG91bGQgdGVybWluYXRlLg0KPiA+IE1vcmUgc3BlY2lmaWNhbGx5LCBvbmx5IGVudHJ5
WzBdLm1zaS5udmVjIGlzIGNvcnJlY3QuwqAgQWxsIHN1YnNlcXVlbnQNCj4gPiBudmVjIGZpZWxk
cyBhcmUgMCBpbiBhIGJsb2NrIG9mIGVudHJpZXMuDQo+ID4NCj4gPj4gQWxzbywgYmVjYXVzZSB0
aGUgYm9keSBvZiB0aGUgbG9vcCB3cml0ZXMgdmlhIHRoZSBlbnRyeSBwb2ludGVyLCB0aGlzIGNh
bg0KPiA+PiB0aGVuIGxlYWQgdG8gaGVhcCBtZW1vcnkgY29ycnVwdGlvbiwgb3IgaW5kZWVkIGNv
cnJ1cHRpb24gb2YgYW55dGhpbmcgaW4NCj4gPj4gdGhlIGRpcmVjdCBtYXAuDQo+ID4+DQo+ID4+
IFRoaXMgcGF0Y2ggc2ltcGx5IGluaXRpYWxpemVzIGEgc3RhY2sgdmFyaWFibGUgdG8gdGhlIHZh
bHVlIG9mDQo+ID4+IGVudHJ5LT5tc2kubnZlYyBiZWZvcmUgc3RhcnRpbmcgdGhlIGxvb3AgYW5k
IHRoZW4gdXNlcyB0aGF0IGluIHRoZQ0KPiA+PiB0ZXJtaW5hdGlvbiBjb25kaXRpb24gaW5zdGVh
ZC4NCj4gDQo+IFRoZXJlIGlzIGFjdHVhbGx5IGEgc2Vjb25kIGJ1ZyBoZXJlIHdoaWNoIGlzIGJl
aW5nIGZpeGVkLsKgIEhvdyBhYm91dA0KPiB0aGlzIGZvciB0aGUgY29tbWl0IG1lc3NhZ2U/DQo+
IA0KDQpBcGFydCBmcm9tIGV4Y2hhbmdlL291dGxvb2sgdGVybWluYWxseSBtYW5nbGluZyBpdCAo
YXMgeW91IGNhbiBwcm9iYWJseSBzZWUgYmVsb3cuLi4gdW5sZXNzIGl0IG1pcmFjdWxvdXNseSB1
bm1hbmdsZXMgdGhpcyByZXBseSksIGl0IGxvb2tzIG9rIHRvIG1lLiBJIGFzc3VtZSB5b3UgYXJl
IGhhcHB5IHRvIGZpeCBvbiBjb21taXQ/DQoNCiAgUGF1bA0KDQo+IHg4Ni9tc2k6IGZpeCBsb29w
IHRlcm1pbmF0aW9uIGNvbmRpdGlvbiBpbg0KPiBwY2lfbXNpX2NvbmZfd3JpdGVfaW50ZXJjZXB0
KCkNCj4gDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gVGhlIGZvciBsb29wIHRoYXQgZGVhbHMgd2l0
aCBNU0kgbWFza2luZyBpcyBjb2RlZCBhcw0KPiBmb2xsb3dzOg0KPiANCj4gDQo+IA0KPiANCj4g
DQo+IA0KPiBmb3IgKCBwb3MgPSAwOyBwb3MgPCBlbnRyeS0+bXNpLm52ZWM7ICsrcG9zLCArK2Vu
dHJ5DQo+ICkNCj4gDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gVGh1cyB0aGUgbG9vcCB0ZXJtaW5h
dGlvbiBjb25kaXRpb24gaXMgZGVyZWZlcmVuY2luZyBhIHN0cnVjdCBwb2ludGVyDQo+IHRoYXQN
Cj4gDQo+IA0KPiBpcyBiZWluZyBpbmNyZW1lbnRlZCBieSB0aGUNCj4gbG9vcC4NCj4gDQo+IA0K
PiANCj4gDQo+IA0KPiANCj4gQSBibG9jayBvZiBNU0kgZW50cmllcyBzdG9yZXMgdGhlIG51bWJl
ciBvZiB2ZWN0b3JzIGluDQo+IGVudHJ5WzBdLm1zaS5udmVjLA0KPiANCj4gDQo+IHdpdGggYWxs
IHN1YnNlcXVlbnQgZW50cmllcyB1c2luZyBhIHZhbHVlIG9mIDAuwqAgVGhlcmVmb3JlLCBmb3Ig
YSBibG9jaw0KPiBvZg0KPiANCj4gDQo+IHR3byBvciBtb3JlIE1TSXMgd2lsbCB0ZXJtaW5hdGUg
dGhlIGxvb3AgZWFybHksIGFzIGVudHJ5WzFdLm1zaS5udmVjIGlzDQo+IDAuDQo+IA0KPiANCj4g
DQo+IA0KPiANCj4gDQo+IEhvd2V2ZXIsIGZvciBhIHNpbmdsZSBNU0ksICsrZW50cnkgbW92ZXMg
dGhlIHBvaW50ZXIgb3V0IG9mIGJvdW5kcywgYW5kDQo+IGENCj4gDQo+IA0KPiBib2d1cyByZWFk
IGlzIHVzZWQgZm9yIHRoZSB0ZXJtaW5hdGlvbiBjb25kaXRpb24uwqAgSW4gdGhlIGNhc2UgdGhh
dA0KPiB0aGUNCj4gDQo+IA0KPiBsb29wIGJvZHkgZ2V0cyBlbnRlcmVkLCB0aGVyZSBhcmUgc3Vi
c2VxdWVudCBPb0Igd3JpdGVzIHdoaWNoDQo+IGNsb2JiZXINCj4gDQo+IA0KPiBhZGphY2VudCBt
ZW1vcnkgaW4gdGhlDQo+IGhlYXAuDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gDQo+IFRoaXMgcGF0
Y2ggc2ltcGx5IGluaXRpYWxpemVzIGEgc3RhY2sgdmFyaWFibGUgdG8gdGhlIHZhbHVlDQo+IG9m
DQo+IA0KPiANCj4gZW50cnktPm1zaS5udmVjIGJlZm9yZSBzdGFydGluZyB0aGUgbG9vcCBhbmQg
dGhlbiB1c2VzIHRoYXQgaW4NCj4gdGhlDQo+IA0KPiANCj4gdGVybWluYXRpb24gY29uZGl0aW9u
IGluc3RlYWQuDQo+IA0KPiB+QW5kcmV3DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
