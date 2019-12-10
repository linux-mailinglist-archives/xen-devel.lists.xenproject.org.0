Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CCD118225
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 09:22:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieakg-0004We-FF; Tue, 10 Dec 2019 08:20:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ERUJ=2A=amazon.com=prvs=2402c4381=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieake-0004WW-N3
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 08:20:12 +0000
X-Inumbo-ID: e28f92ba-1b25-11ea-a1e1-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e28f92ba-1b25-11ea-a1e1-bc764e2007e4;
 Tue, 10 Dec 2019 08:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575966012; x=1607502012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NkmV7o3sicGLB03KPbSIeOCaDuIpc/KtPqXcUhohkR8=;
 b=vDl3UYCWWnVd5Q1gMFe+RiEnksydE8lusDYOHRVrViGWhGOeT56SOeuM
 R9XgXSKrUUi09L9DBtnKNeS5aDM1VEPba9UG6SkFBvufld0zFwD25ouX/
 t/gN8GBIJAnxW/pbeSmpHt0dQ0U2tNsvf8ajhwu9esVyvM21sqwRcvcUv E=;
IronPort-SDR: ztdY+vclsbI2yh0sYLZ3TIlMk48gsb586DffquoZ33vX6eguCiARg6RWpng+Sx74NC/0FvZkWM
 HarVQC+BqvAw==
X-IronPort-AV: E=Sophos;i="5.69,299,1571702400"; 
   d="scan'208";a="4197855"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 10 Dec 2019 08:19:50 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9B98EA2A89; Tue, 10 Dec 2019 08:19:47 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 08:19:46 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 08:19:46 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 10 Dec 2019 08:19:45 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>, "Tian, Kevin" <kevin.tian@intel.com>
Thread-Topic: [PATCH v2] x86 / iommu: set up a scratch page in the quarantine
 domain
Thread-Index: AQHVpUXA1ULHbXj+nkCH3fM7MDEQOaegcCkAgAAEYACAB7skgIAK2UEAgAANwYCAAAHeAIAAAU/Q
Date: Tue, 10 Dec 2019 08:19:45 +0000
Message-ID: <768c13653146496da997ae6632e30743@EX13D32EUC003.ant.amazon.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
 <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
 <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
 <4cf200a6-cccb-0bca-f2cb-b9f80956ae33@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D636C7C@SHSMSX104.ccr.corp.intel.com>
 <b6bae4cd-129c-6815-1331-00bca8acb4ae@suse.com>
 <920f4319-ed07-687c-a569-ab20faeda2a8@suse.com>
In-Reply-To: <920f4319-ed07-687c-a569-ab20faeda2a8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86 / iommu: set up a scratch page in
 the quarantine domain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDEwIERlY2VtYmVyIDIwMTkgMDg6MTINCj4gVG86IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFRpYW4sIEtldmluIDxrZXZpbi50aWFuQGludGVs
LmNvbT47DQo+IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZzsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSB4ODYg
LyBpb21tdTogc2V0IHVwIGEgc2NyYXRjaCBwYWdlIGluIHRoZQ0KPiBxdWFyYW50aW5lIGRvbWFp
bg0KPiANCj4gT24gMTAuMTIuMTkgMDk6MDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDEw
LjEyLjIwMTkgMDg6MTYsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+Pj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pj4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMywg
MjAxOSA1OjM2IFBNDQo+ID4+Pg0KPiA+Pj4gT24gMjguMTEuMjAxOSAxMjozMiwgSsO8cmdlbiBH
cm/DnyB3cm90ZToNCj4gPj4+PiBPbiAyOC4xMS4xOSAxMjoxNywgSmFuIEJldWxpY2ggd3JvdGU6
DQo+ID4+Pj4+IE9uIDI3LjExLjIwMTkgMTg6MTEsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4+
Pj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBpb21tdV9vcCB0byBmYWNpbGl0YXRlIGEg
cGVyLQ0KPiA+Pj4gaW1wbGVtZW50YXRpb24NCj4gPj4+Pj4+IHF1YXJhbnRpbmUgc2V0IHVwLCBh
bmQgdGhlbiBmdXJ0aGVyIGNvZGUgZm9yIHg4NiBpbXBsZW1lbnRhdGlvbnMNCj4gPj4+Pj4+IChh
bWQgYW5kIHZ0ZCkgdG8gc2V0IHVwIGEgcmVhZC1vbmx5IHNjcmF0Y2ggcGFnZSB0byBzZXJ2ZSBh
cyB0aGUNCj4gc291cmNlDQo+ID4+Pj4+PiBmb3IgRE1BIHJlYWRzIHdoaWxzdCBhIGRldmljZSBp
cyBhc3NpZ25lZCB0byBkb21faW8uIERNQSB3cml0ZXMNCj4gd2lsbA0KPiA+Pj4+Pj4gY29udGlu
dWUgdG8gZmF1bHQgYXMgYmVmb3JlLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFRoZSByZWFzb24gZm9y
IGRvaW5nIHRoaXMgaXMgdGhhdCBzb21lIGhhcmR3YXJlIG1heSBjb250aW51ZSB0byByZS0NCj4g
dHJ5DQo+ID4+Pj4+PiBETUEgKGRlc3BpdGUgRkxSKSBpbiB0aGUgZXZlbnQgb2YgYW4gZXJyb3Is
IG9yIGV2ZW4gQk1FIGJlaW5nDQo+IGNsZWFyZWQsDQo+ID4+PiBhbmQNCj4gPj4+Pj4+IHdpbGwg
ZmFpbCB0byBkZWFsIHdpdGggRE1BIHJlYWQgZmF1bHRzIGdyYWNlZnVsbHkuIEhhdmluZyBhIHNj
cmF0Y2gNCj4gcGFnZQ0KPiA+Pj4+Pj4gbWFwcGVkIHdpbGwgYWxsb3cgcGVuZGluZyBETUEgcmVh
ZHMgdG8gY29tcGxldGUgYW5kIHRodXMgc3VjaCBidWdneQ0KPiA+Pj4+Pj4gaGFyZHdhcmUgd2ls
bCBldmVudHVhbGx5IGJlIHF1aWVzY2VkLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IE5PVEU6IFRoZXNl
IG1vZGlmaWNhdGlvbnMgYXJlIHJlc3RyaWN0ZWQgdG8geDg2IGltcGxlbWVudGF0aW9ucw0KPiBv
bmx5IGFzDQo+ID4+Pj4+PiAgICAgICAgIHRoZSBidWdneSBoL3cgSSBhbSBhd2FyZSBvZiBpcyBv
bmx5IHVzZWQgd2l0aCBYZW4gaW4gYW4geDg2DQo+ID4+Pj4+PiAgICAgICAgIGVudmlyb25tZW50
LiBBUk0gbWF5IHJlcXVpcmUgc2ltaWxhciBjb2RlIGJ1dCwgc2luY2UgSSBhbQ0KPiBub3QNCj4g
Pj4+Pj4+ICAgICAgICAgYXdhcmUgb2YgdGhlIG5lZWQsIHRoaXMgcGF0Y2ggZG9lcyBub3QgbW9k
aWZ5IGFueSBBUk0NCj4gPj4+IGltcGxlbWVudGF0aW9uLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPj4+Pj4N
Cj4gPj4+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
Pj4+Pj4NCj4gPj4+Pj4+IFRoZXJlIGlzIHN0aWxsIHRoZSBvcGVuIHF1ZXN0aW9uIG9mIHdoZXRo
ZXIgdXNlIG9mIGEgc2NyYXRjaCBwYWdlDQo+IG91Z2h0DQo+ID4+Pj4+PiB0byBiZSBnYXRlZCBv
biBzb21ldGhpbmcsIGVpdGhlciBhcmUgcnVuLXRpbWUgb3IgY29tcGlsZS10aW1lLg0KPiA+Pj4+
Pg0KPiA+Pj4+PiBJIGhhdmUgbm8gY2xlYXIgb3BpbmlvbiBlaXRoZXIgd2F5IGhlcmUuIFRoZSB3
b3JrYXJvdW5kIHNlZW1zIGxvdw0KPiA+Pj4+PiBvdmVyaGVhZCBlbm91Z2ggdGhhdCB0aGVyZSBt
YXkgbm90IGJlIGEgbmVlZCB0byBoYXZlIGFuIGFkbWluIChvcg0KPiA+Pj4+PiBidWlsZCB0aW1l
KSBjb250cm9sIGZvciB0aGlzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBBcyB0byA0LjEzOiBUaGUgcXVh
cmFudGluaW5nIGFzIGEgd2hvbGUgaXMgcHJldHR5IGZyZXNoLiBXaGlsZSBpdA0KPiA+Pj4+PiBo
YXMgYmVlbiBiYWNrcG9ydGVkIHRvIHNlY3VyaXR5IG1haW50YWluZWQgdHJlZXMsIEknZCBzdGls
bCBjb25zaWRlcg0KPiA+Pj4+PiBpdCBhIG5ldyBmZWF0dXJlIGluIDQuMTMsIGFuZCBoZW5jZSB0
aGlzIHdvcmthcm91bmQgYXQgbGVhc3QNCj4gZWxpZ2libGUNCj4gPj4+Pj4gZm9yIGNvbnNpZGVy
YXRpb24uDQo+ID4+Pj4NCj4gPj4+PiBJIGFncmVlLg0KPiA+Pj4+DQo+ID4+Pj4gUmVsZWFzZS1h
Y2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiA+Pj4NCj4gPj4+IEkg
bm90aWNlIHRoaXMgaGFzIGJlZW4gY29tbWl0dGVkIG1lYW53aGlsZS4gSSBoYWQgc3BlY2lmaWNh
bGx5IG5vdA0KPiA+Pj4gZG9uZSBzbyBkdWUgdG8gdGhlIHN0aWxsIG1pc3NpbmcgVlQtZCBhY2ss
IHNlZWluZyB0aGF0IHRoaXMgd2Fzbid0DQo+ID4+PiBhbiBlbnRpcmVseSAidHJpdmlhbCIgY2hh
bmdlLg0KPiA+Pj4NCj4gPj4NCj4gPj4gV2hpbGUgdGhlIHF1YXJhbnRpbmUgaWRlYSBzb3VuZHMg
Z29vZCBvdmVyYWxsLCBJJ20gc3RpbGwgbm90IGNvbnZpbmNlZA0KPiA+PiB0byBoYXZlIGl0IHRo
ZSBvbmx5IHdheSBpbiBwbGFjZSBqdXN0IGZvciBoYW5kbGluZyBzb21lIGtub3duLWJ1Z2d5DQo+
ID4+IGRldmljZS4gSXQga2lsbHMgdGhlIHBvc3NpYmlsaXR5IG9mIGlkZW50aWZ5aW5nIGEgbmV3
IGJ1Z2d5IGRldmljZSBhbmQNCj4gdGhlbg0KPiA+PiBkZWNpZGluZyBub3QgdG8gdXNlIGl0IGlu
IHRoZSBmaXJzdCBzcGFjZS4uLiBJIHRob3VnaHQgYWJvdXQgd2hldGhlciBpdA0KPiA+PiB3aWxs
IGdldCBiZXR0ZXIgd2hlbiBmdXR1cmUgSU9NTVUgaW1wbGVtZW50cyBBL0QgYml0IC0gYnkgY2hl
Y2tpbmcNCj4gPj4gYWNjZXNzIGJpdCBiZWluZyBzZXQgdGhlbiB3ZSdsbCBrbm93IHNvbWUgYnVn
Z3kgZGV2aWNlIGV4aXN0cywgYnV0LA0KPiA+PiB0aGUgc2NyYXRjaCBwYWdlIGlzIHNoYXJlZCBi
eSBhbGwgZGV2aWNlcyB0aGVuIHdlIGNhbm5vdCByZWx5IG9uIHRoaXMNCj4gPj4gZmVhdHVyZSB0
byBmaW5kIG91dCB0aGUgYWN0dWFsIGJ1Z2d5IG9uZS4NCj4gPg0KPiA+IFRoaW5raW5nIGFib3V0
IGl0IC0geWVzLCBJIHRoaW5rIEkgYWdyZWUuIFRoaXMgKGFzIHdpdGggc28gbWFueQ0KPiA+IHdv
cmthcm91bmRzKSB3b3VsZCBiZXR0ZXIgYmUgYW4gb2ZmLWJ5LWRlZmF1bHQgb25lLiBUaGUgbWFp
biBpc3N1ZQ0KPiA+IEkgdW5kZXJzdGFuZCB0aGlzIHdvdWxkIGhhdmUgaXMgdGhhdCBidWdneSBz
eXN0ZW1zIHRoZW4gbWlnaHQgaGFuZw0KPiA+IHdpdGhvdXQgZXZlbiBoYXZpbmcgbWFuYWdlZCB0
byBnZXQgYSBsb2cgbWVzc2FnZSBvdXQgLSBQYXVsPw0KPiA+DQoNClllcywgdGhhdCdzIHRoZSBj
b25jZXJuLiBTb21lIHN5c3RlbXMgd2lsbCB3ZWRnZSBoYXJkIG9uIHRoZSBmaXJzdCBmYXVsdCB3
aXRoIG5vIGxvZ2dpbmcuIEkgaGF2ZSBubyBvYmplY3Rpb24gdG8gYSBjb21tYW5kIGxpbmUgcGFy
YW1ldGVyIGJ1dCBJTU8gaXQgb3VnaHQgdG8gZGVmYXVsdCBvbiwgYXQgbGVhc3QgaW4gbm9uLWRl
YnVnIG1vZGUuDQoNCiAgUGF1bA0KDQoNCj4gPiBKw7xyZ2VuIC0gd291bGQgeW91IGJlIGFtZW5h
YmxlIHRvIGFuIGFsbW9zdCBsYXN0IG1pbnV0ZSByZWZpbmVtZW50DQo+ID4gaGVyZSAod291bGQg
dGhlbiBhbHNvIG5lZWQgdG8gc3RpbGwgYmUgYmFja3BvcnRlZCB0byA0LjEyLjIsIG9yDQo+ID4g
dGhlIG9yaWdpbmFsIGJhY2twb3J0IHJldmVydGVkLCB0byBhdm9pZCBnaXZpbmcgdGhlIGltcHJl
c3Npb24gb2YNCj4gPiBhIHJlZ3Jlc3Npb24pPw0KPiANCj4gU28gd2hhdCBpcyB5b3VyIHN1Z2dl
c3Rpb24gaGVyZT8gVG8gaGF2ZSBhIGJvb3Qgb3B0aW9uIChkZWZhdWx0aW5nIHRvDQo+IG9mZikg
Zm9yIGVuYWJsaW5nIHRoZSBzY3JhdGNoIHBhZ2U/DQo+IA0KPiANCj4gSnVlcmdlbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
