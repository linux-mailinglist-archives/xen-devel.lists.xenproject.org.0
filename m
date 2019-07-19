Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0E16E22B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 10:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoNkw-0007PR-7n; Fri, 19 Jul 2019 07:56:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3sa=VQ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hoNku-0007PM-KP
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 07:56:40 +0000
X-Inumbo-ID: babcbca0-a9fa-11e9-8388-9f62accc3b92
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id babcbca0-a9fa-11e9-8388-9f62accc3b92;
 Fri, 19 Jul 2019 07:56:35 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +uAN+0JfXFO7gvtLCYB3Mk/XGOb3bHGmb3rxb0eamnB1sTca5ZwIaTWbp10FWyvcWQic8qRJSF
 2FFYuNIQLkzux+wEXWG7E8FxXuEK2MTKG2CICQoJPbWI/pxzhrIu8UiKnpScHSDE+/DJMG5AFV
 j4086gpn5QlKiqLEh+mlKeApXw2ooH2kQf15OHoFOzI7GK/DZF5UyYZw8EICQ+KCYSW253ZOPT
 aTtFCUXQLSfhMW7KIZ0mY1KN27DvUQF77+PU7Y16mhUtdI9iaVjxP/QlWBE6f9y1kFAlOXSJlV
 5FQ=
X-SBRS: 2.7
X-MesageID: 3244319
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,281,1559534400"; 
   d="scan'208";a="3244319"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Petre Ovidiu PIRCALABU' <ppircalabu@bitdefender.com>, Jan Beulich
 <JBeulich@suse.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVPIeuvysw+S0SxESjjWmMYVkcbqbOwNgAgAAfJACAAWdVAIABTcoA
Date: Fri, 19 Jul 2019 07:56:30 +0000
Message-ID: <d73a2d9ba0b5407390ae9a635314f6d4@AMSPEX02CL03.citrite.net>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
In-Reply-To: <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRyZSBPdmlkaXUgUElSQ0FM
QUJVIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gU2VudDogMTggSnVseSAyMDE5IDE0
OjU5DQo+IFRvOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+OyBQYXVsIER1cnJhbnQg
PFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogSnVsaWVuR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPjsgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgPGFpc2FpbGFAYml0ZGVmZW5kZXIu
Y29tPjsgUmF6dmFuDQo+IENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPjsgQW5k
cmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZQ0K
PiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNp
dHJpeC5jb20+OyBJYW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsNCj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPjsgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgVGltIChYZW4u
b3JnKQ0KPiA8dGltQHhlbi5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyIDA3LzEwXSB2bV9ldmVudDogQWRkIHZtX2V2ZW50X25nIGludGVyZmFjZQ0K
PiANCj4gT24gV2VkLCAyMDE5LTA3LTE3IGF0IDE2OjMyICswMDAwLCBKYW4gQmV1bGljaCB3cm90
ZToNCj4gPiBPbiAxNy4wNy4yMDE5IDE2OjQxLCBQZXRyZSBPdmlkaXUgUElSQ0FMQUJVIHdyb3Rl
Og0KPiA+ID4gT24gV2VkLCAyMDE5LTA3LTE3IGF0IDEwOjA2ICswMDAwLCBKYW4gQmV1bGljaCB3
cm90ZToNCj4gPiA+ID4gT24gMTYuMDcuMjAxOSAxOTowNiwgUGV0cmUgUGlyY2FsYWJ1IHdyb3Rl
Og0KPiA+ID4gPiA+ICtzdGF0aWMgdm9pZCB2bV9ldmVudF9jaGFubmVsc19mcmVlX2J1ZmZlcihz
dHJ1Y3QNCj4gPiA+ID4gPiB2bV9ldmVudF9jaGFubmVsc19kb21haW4gKmltcGwpDQo+ID4gPiA+
ID4gICAgew0KPiA+ID4gPiA+IC0gICAgdm1fZXZlbnRfcmluZ19yZXN1bWUodG9fcmluZyh2LT5k
b21haW4tDQo+ID4gPiA+ID4gPnZtX2V2ZW50X21vbml0b3IpKTsNCj4gPiA+ID4gPiArICAgIGlu
dCBpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgIHZ1bm1hcChpbXBsLT5zbG90cyk7DQo+
ID4gPiA+ID4gKyAgICBpbXBsLT5zbG90cyA9IE5VTEw7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+
ICsgICAgZm9yICggaSA9IDA7IGkgPCBpbXBsLT5ucl9mcmFtZXM7IGkrKyApDQo+ID4gPiA+ID4g
KyAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2UobWZuX3RvX3BhZ2UoaW1wbC0+bWZuW2ldKSk7DQo+
ID4gPiA+ID4gICAgfQ0KPiA+ID4gPg0KPiA+ID4gPiBXaGF0IGd1YXJhbnRlZXMgdGhhdCB0aGVy
ZSBhcmUgbm8gbWFwcGluZ3MgbGVmdCBvZiB0aGUgcGFnZXMgeW91DQo+ID4gPiA+IGZyZWUNCj4g
PiA+ID4gaGVyZT8gU2hhcmluZyBwYWdlcyB3aXRoIGd1ZXN0cyBpcyAoc28gZmFyKSBhbiAoYWxt
b3N0KQ0KPiA+ID4gPiBpcnJldmVyc2libGUNCj4gPiA+ID4gYWN0aW9uLCBpLmUuIHRoZXkgbWF5
IGdlbmVyYWxseSBvbmx5IGJlIGZyZWVkIHVwb24gZG9tYWluDQo+ID4gPiA+IGRlc3RydWN0aW9u
Lg0KPiA+ID4gPiBTZWUgZ250dGFiX3VucG9wdWxhdGVfc3RhdHVzX2ZyYW1lcygpIGZvciBhIGNh
c2Ugd2hlcmUgd2UNCj4gPiA+ID4gYWN0dWFsbHkNCj4gPiA+ID4gbWFrZSBhbiBhdHRlbXB0IGF0
IGZyZWVpbmcgc3VjaCBwYWdlcyAoYnV0IHdoZXJlIHdlIGZhaWwgdGhlDQo+ID4gPiA+IHJlcXVl
c3QNCj4gPiA+ID4gaW4gY2FzZSByZWZlcmVuY2VzIGFyZSBsZWZ0IGluIHBsYWNlKS4NCj4gPiA+
ID4NCj4gPiA+DQo+ID4gPiBJJ3ZlIHRlc3RlZCBtYW51YWxseSAyIGNhc2VzIGFuZCB0aGV5IGJv
dGggd29yayAobm8gY3Jhc2hlcyk6DQo+ID4gPiAxOiBpbnRyb3NwZWN0ZWQgZG9tYWluIHN0YXJ0
cyAtPiBtb25pdG9yIHN0YXJ0cyAtPiBtb25pdG9yIHN0b3BzIC0+DQo+ID4gPiBkb21haW4gc3Rv
cHMNCj4gPiA+IDI6IGludHJvc3BlY3RlZCBkb21haW4gc3RhcnRzIC0+IG1vbml0b3Igc3RhcnRz
IC0+IGRvbWFpbiBzdG9wcyAtPg0KPiA+ID4gbW9uaXRvciBzdG9wcy4NCj4gPg0KPiA+IFdlbGws
IHRlc3RpbmcgaXMgaW1wb3J0YW50LCBidXQgZG9pbmcgdGVzdHMgbGlrZSB5b3UgZGVzY3JpYmUg
d29uJ3QNCj4gPiBjYXRjaCBhbnkgbWlzYmVoYXZpbmcgb3IgbWFsaWNpb3VzIG1vbml0b3IgZG9t
YWluLg0KPiA+DQo+ID4gPiBIb3dldmVyLCBJIHdpbGwgdGFrZSBhIGNsb3NlciBsb29rIGF0DQo+
ID4gPiBnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzDQo+ID4gPiBhbmQgcG9zdCBhIGZv
bGxvdyB1cCBlbWFpbC4NCj4gPg0KPiA+IFRoYW5rcy4NCj4gPg0KPiBIaSBKYW4sDQo+IA0KPiBD
b3VsZCB5b3UgaGVscCBtZSBjbGFyaWZ5IHNvbWUgdGhpbmdzPyBNYXliZSBhbSBhcHByb2FjaGlu
ZyB0aGUgd2hvbGUNCj4gcHJvYmxlbSBpbmNvcnJlY3RseS4NCj4gDQo+IFRvIGhlbHAgZXhwbGFp
bmluZyB0aGluZ3MgYSBsaXR0bGUgYmV0dGVyIEkgd2lsbCB1c2UgdGhlIGZvbGxvd2luZw0KPiBh
YmJyZXZpYXRpb25zOg0KPiBJRCAtIGludHJvc3BlY3RlZCBkb21haW4gKHRoZSBkb21haW4gZm9y
IHdoaWNoIHRoZSB2bV9ldmVudCByZXF1ZXN0cw0KPiBhcmUgZ2VuZXJhdGVkKQ0KPiBNRCAtIG1v
bml0b3IgZG9tYWluICh0aGUgZG9tYWluIHdoaWNoIGhhbmRsZXMgdGhlIHJlcXVlc3RzIGFuZCBw
b3N0cw0KPiB0aGUgcmVzcG9uc2VzKQ0KPiANCj4gVGhlIGxlZ2FjeSBhcHByb2FjaCAocmluZykg
aXMgdG8gaGF2ZSBhIGRlZGljYXRlZCBnZm4gaW4gSUQgKHJpbmcNCj4gcGFnZSksIHdoaWNoIGlz
IG1hcHBlZCBieSBYRU4gdXNpbmcgX19tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsIGFuZCB0aGVuDQo+
IE1EIHVzZSB4Y19tYXBfZm9yZWlnbl9wYWdlcyB0byBjcmVhdGUgdGhlIG1hcHBpbmcgYW5kDQo+
IHhjX2RvbWFpbl9kZWNyZWFzZV9yZXNlcnZhdGlvbl9leGFjdCB0byByZW1vdmUgdGhlIHBhZ2Ug
ZnJvbSBJRCdzDQo+IHBoeXNtYXAuDQo+IFRoZSBhcmUgYSBudW1iZXIgb2YgcHJvYmxlbXMgd2l0
aCB0aGlzIGFwcHJvYWNoLCB0aGUgbW9zdCBpbXBhY3RmdWxsDQo+IGJlaW5nIHRoYXQgZ3Vlc3Rz
IHdpdGggYSBoaWdoIG51bWJlciBvZiB2Y3B1cyB3aWxsIGZpbGxzLXVwIHRoZSByaW5nDQo+IHF1
aXRlIHF1aWNseS4gVGhpcyBhbmQgdGhlIGZhY3Qgdm1fZXZlbnRfcmVxdWVzdCBzaXplIGluY3Jl
YXNlcyBhcw0KPiBtb25pdG9yIGFwcGxpY2F0aW9ucyBiZWNvbWUgbW9yZSBjb21wbGV4IGluY3Vy
IGlkbGUgdGltZXMgZm9yIHZjcHVzDQo+IHdhaXRpbmcgdG8gcG9zdCBhIHJlcXVlc3QuDQo+IA0K
PiBUbyBhbGxldmlhdGUgdGhpcyBwcm9ibGVtIEkgbmVlZCB0byBoYXZlIGEgbnVtYmVyIG9mIGZy
YW1lcyBzaGFyZWQNCj4gYmV0d2VlbiB0aGUgaHlwZXJ2aXNvciBhbmQgTUQuIFRoZSBJRCBkb2Vz
bid0IG5lZWQgdG8ga25vdyBhYm91dCB0aG9zZQ0KPiBmcmFtZXMgYmVjYXVzZSBpdCB3aWxsIG5l
dmVyIGFjY2VzcyB0aGlzIG1lbW9yeSBhcmVhICh1bmxpa2UgaW9yZXEgd2hvDQo+IGludGVyY2Vw
dHMgdGhlIGFjY2VzcyB0byBjZXJ0YWluIGFkZHJlc3NlcykuDQo+IA0KPiBCZWZvcmUgdXNpbmcg
eGVuZm9yZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UgSSBpbnZlc3RpZ2F0ZWQgc2V2ZXJhbA0KPiBk
aWZmZXJlbnQgYXBwcm9hY2hlczoNCj4gLSBBbGxvY2F0ZSB0aGUgbWVtb3J5IGluIGh5cGVydmlz
b3IgYW5kIHhjX21hcF9mb3JlaWduX3BhZ2VzIChkb2Vzbid0DQo+IHdvcmsgYmVjYXVzZSB5b3Ug
Y2Fubm90ICJmb3JlaWdubWFwIiBwYWdlcyBvZiB5b3VyIG93biBkb21haW4uDQo+IC0gQWxsb2Nh
dGUgdGhlIG1lbW9yeSBpbiBndWVzdCwgYW5kIG1hcCB0aGUgYWxsb2NhdGVkIHBhZ2VzIGluIFhF
Ti4gVG8NCj4gbXkga25vd2xlZGdlIHRoZXJlIGlzIG5vIHN1Y2ggQVBJIGluIGxpbnV4IHRvIGRv
IHRoaXMgYW5kIHRoZSBtb25pdG9yDQo+IGFwcGxpY2F0aW9uLCBhcyBhbiB1c2Vyc3BhY2UgcHJv
Z3JhbSwgaXMgbm90IGF3YXJlIG9mIHRoZSBhY3R1YWwgZ2Zucw0KPiBmb3IgYW4gYWxsb2NhdGVk
IG1lbW9yeSBhcmVhLg0KPiANCj4gU28sIGF0IHRoaXMgcG9pbnQgdGhlIG1vc3QgcHJvbWlzaW5n
IHNvbHV0aW9uIGlzIGFsbG9jYXRpbmcgdGhlIG1lbW9yeQ0KPiBpbiBYRU4sIHNoYXJpbmcgaXQg
d2l0aCBJRCB1c2luZyBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0LCBhbmQgbWFwcGluZw0KPiBp
dCB3aXRoIHhlbmZvcmVpZ25tZW1vcnlfbWFwX3Jlc291cmNlICh3aXRoIHRoZSBmbGFnDQo+IFhF
Tk1FTV9yc3JjX2FjcV9jYWxsZXJfb3duZWQgc2V0KQ0KDQpJZiB0aGF0IHBhZ2UgaXMgc2hhcmVk
IHdpdGggdGhlIElEIHRoZW4gWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZCBzaG91bGQgKm5v
dCogYmUgc2V0LiBBbHNvLCB0aGF0IGZsYWcgaXMgYW4gJ291dCcgZmxhZy4uLiB0aGUgY2FsbGVy
IGRvZXNuJ3QgZGVjaWRlIHdobyBvd25zIHRoZSByZXNvdXJjZS4gVEJIIEkgcmVncmV0IGV2ZXIg
aW50cm9kdWNpbmcgdGhlIGZsYWc7IGl0IGNhdXNlZCBhIGxvdCBvZiBwcm9ibGVtcywgd2hpY2gg
aXMgd2h5IGl0IGlzIG5vIGxvbmdlciB1c2VkLg0KDQogIFBhdWwNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
