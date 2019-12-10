Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D41184E4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:22:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieccT-0007IX-08; Tue, 10 Dec 2019 10:19:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ERUJ=2A=amazon.com=prvs=2402c4381=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieccR-0007IP-H0
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:19:51 +0000
X-Inumbo-ID: 99bf6392-1b36-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99bf6392-1b36-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575973191; x=1607509191;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NyDoBB9QhG8gJGJIeqvlTipEy8r7Z2Cbxh9HGFV5gzM=;
 b=CDUM4We/lwM1a3eGMXvAwNkw0LiWcoTI4o/Mr6+pBMQCXZpls0oHsywp
 eTP2UygmS8qYw+PzvtAwyeMhZtInjGUvzpIdSNDkezxhgBtJlZQ4YgVtK
 s1Seqkp+lT25fZwQW36lr3el0dvH65Xhsq26G09o75oP1pODYCz2gPRBO Q=;
IronPort-SDR: /WrOpuK4DmLJIQc32kyRc9ZBwu1rZe9uYIvVxK14p+V7naGADnMt+VBikRYhG+FVvt1SZrUKKp
 +1EhoBL60nRQ==
X-IronPort-AV: E=Sophos;i="5.69,299,1571702400"; 
   d="scan'208";a="6955873"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 10 Dec 2019 10:19:49 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 346D5A20A0; Tue, 10 Dec 2019 10:19:48 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 10:19:47 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 10:19:47 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 10 Dec 2019 10:19:46 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v2] x86 / iommu: set up a scratch page in the quarantine
 domain
Thread-Index: AQHVpUXA1ULHbXj+nkCH3fM7MDEQOaegcCkAgAAEYACAB7skgIAK2UEAgAANwYCAAAHeAIAADJ2AgAACsgCAAAIWEIAACHgAgAAJjoA=
Date: Tue, 10 Dec 2019 10:19:46 +0000
Message-ID: <38b962d197b64d9b963ead796d6002b4@EX13D32EUC003.ant.amazon.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
 <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
 <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
 <4cf200a6-cccb-0bca-f2cb-b9f80956ae33@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D636C7C@SHSMSX104.ccr.corp.intel.com>
 <b6bae4cd-129c-6815-1331-00bca8acb4ae@suse.com>
 <920f4319-ed07-687c-a569-ab20faeda2a8@suse.com>
 <72311af3-e47a-c868-fa47-89a74b043a4c@suse.com>
 <5ac457ca-46cf-5de3-8bfa-92a754f298fd@suse.com>
 <3ec8e7be074d4846bef0104e5dacb653@EX13D32EUC003.ant.amazon.com>
 <a5a2199b-23c0-e9a1-44fb-3cdd1f2a8f0f@suse.com>
In-Reply-To: <a5a2199b-23c0-e9a1-44fb-3cdd1f2a8f0f@suse.com>
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDEwIERlY2VtYmVyIDIwMTkgMDk6NDUNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+OyBUaWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Ow0KPiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOw0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47
IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHg4NiAvIGlv
bW11OiBzZXQgdXAgYSBzY3JhdGNoIHBhZ2UgaW4gdGhlDQo+IHF1YXJhbnRpbmUgZG9tYWluDQo+
IA0KPiBPbiAxMC4xMi4yMDE5IDEwOjE2LCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NA
c3VzZS5jb20+DQo+ID4+IFNlbnQ6IDEwIERlY2VtYmVyIDIwMTkgMDk6MDcNCj4gPj4gVG86IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gQ2M6IFRpYW4sIEtldmluIDxrZXZp
bi50aWFuQGludGVsLmNvbT47IER1cnJhbnQsIFBhdWwNCj4gPj4gPHBkdXJyYW50QGFtYXpvbi5j
b20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgeGVuLQ0KPiA+
PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyBXZWkNCj4gPj4gTGl1IDx3bEB4ZW4ub3JnPg0KPiA+PiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyXSB4ODYgLyBpb21tdTogc2V0IHVwIGEgc2NyYXRjaCBwYWdlIGluIHRoZQ0K
PiA+PiBxdWFyYW50aW5lIGRvbWFpbg0KPiA+Pg0KPiA+PiBPbiAxMC4xMi4xOSAwOTo1NywgSmFu
IEJldWxpY2ggd3JvdGU6DQo+ID4+PiBPbiAxMC4xMi4yMDE5IDA5OjEyLCBKw7xyZ2VuIEdyb8Of
IHdyb3RlOg0KPiA+Pj4+IE9uIDEwLjEyLjE5IDA5OjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
Pj4+Pj4gT24gMTAuMTIuMjAxOSAwODoxNiwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4+Pj4+PiBX
aGlsZSB0aGUgcXVhcmFudGluZSBpZGVhIHNvdW5kcyBnb29kIG92ZXJhbGwsIEknbSBzdGlsbCBu
b3QNCj4gPj4gY29udmluY2VkDQo+ID4+Pj4+PiB0byBoYXZlIGl0IHRoZSBvbmx5IHdheSBpbiBw
bGFjZSBqdXN0IGZvciBoYW5kbGluZyBzb21lIGtub3duLWJ1Z2d5DQo+ID4+Pj4+PiBkZXZpY2Uu
IEl0IGtpbGxzIHRoZSBwb3NzaWJpbGl0eSBvZiBpZGVudGlmeWluZyBhIG5ldyBidWdneSBkZXZp
Y2UNCj4gPj4gYW5kIHRoZW4NCj4gPj4+Pj4+IGRlY2lkaW5nIG5vdCB0byB1c2UgaXQgaW4gdGhl
IGZpcnN0IHNwYWNlLi4uIEkgdGhvdWdodCBhYm91dA0KPiB3aGV0aGVyDQo+ID4+IGl0DQo+ID4+
Pj4+PiB3aWxsIGdldCBiZXR0ZXIgd2hlbiBmdXR1cmUgSU9NTVUgaW1wbGVtZW50cyBBL0QgYml0
IC0gYnkgY2hlY2tpbmcNCj4gPj4+Pj4+IGFjY2VzcyBiaXQgYmVpbmcgc2V0IHRoZW4gd2UnbGwg
a25vdyBzb21lIGJ1Z2d5IGRldmljZSBleGlzdHMsIGJ1dCwNCj4gPj4+Pj4+IHRoZSBzY3JhdGNo
IHBhZ2UgaXMgc2hhcmVkIGJ5IGFsbCBkZXZpY2VzIHRoZW4gd2UgY2Fubm90IHJlbHkgb24NCj4g
dGhpcw0KPiA+Pj4+Pj4gZmVhdHVyZSB0byBmaW5kIG91dCB0aGUgYWN0dWFsIGJ1Z2d5IG9uZS4N
Cj4gPj4+Pj4NCj4gPj4+Pj4gVGhpbmtpbmcgYWJvdXQgaXQgLSB5ZXMsIEkgdGhpbmsgSSBhZ3Jl
ZS4gVGhpcyAoYXMgd2l0aCBzbyBtYW55DQo+ID4+Pj4+IHdvcmthcm91bmRzKSB3b3VsZCBiZXR0
ZXIgYmUgYW4gb2ZmLWJ5LWRlZmF1bHQgb25lLiBUaGUgbWFpbiBpc3N1ZQ0KPiA+Pj4+PiBJIHVu
ZGVyc3RhbmQgdGhpcyB3b3VsZCBoYXZlIGlzIHRoYXQgYnVnZ3kgc3lzdGVtcyB0aGVuIG1pZ2h0
IGhhbmcNCj4gPj4+Pj4gd2l0aG91dCBldmVuIGhhdmluZyBtYW5hZ2VkIHRvIGdldCBhIGxvZyBt
ZXNzYWdlIG91dCAtIFBhdWw/DQo+ID4+Pj4+DQo+ID4+Pj4+IErDvHJnZW4gLSB3b3VsZCB5b3Ug
YmUgYW1lbmFibGUgdG8gYW4gYWxtb3N0IGxhc3QgbWludXRlIHJlZmluZW1lbnQNCj4gPj4+Pj4g
aGVyZSAod291bGQgdGhlbiBhbHNvIG5lZWQgdG8gc3RpbGwgYmUgYmFja3BvcnRlZCB0byA0LjEy
LjIsIG9yDQo+ID4+Pj4+IHRoZSBvcmlnaW5hbCBiYWNrcG9ydCByZXZlcnRlZCwgdG8gYXZvaWQg
Z2l2aW5nIHRoZSBpbXByZXNzaW9uIG9mDQo+ID4+Pj4+IGEgcmVncmVzc2lvbik/DQo+ID4+Pj4N
Cj4gPj4+PiBTbyB3aGF0IGlzIHlvdXIgc3VnZ2VzdGlvbiBoZXJlPyBUbyBoYXZlIGEgYm9vdCBv
cHRpb24gKGRlZmF1bHRpbmcgdG8NCj4gPj4+PiBvZmYpIGZvciBlbmFibGluZyB0aGUgc2NyYXRj
aCBwYWdlPw0KPiA+Pj4NCj4gPj4+IFllcyAoYW5kIGRlc3BpdGUgaGF2aW5nIHNlZW4gUGF1bCdz
IHJlcGx5KS4NCj4gPj4NCj4gPj4gSSdkIHJlbGVhc2UgYWNrIHN1Y2ggYSBwYXRjaCBpbiBjYXNl
IHlvdSBjb21lIHRvIGFuIGFncmVlbWVudCByZWdhcmRpbmcNCj4gPj4gdGhlIGRlZmF1bHQgc29v
bi4NCj4gPj4NCj4gPg0KPiA+IE9rLiBUaGUgZGVmYXVsdCBpcyBub3QgdGhhdCBjcnVjaWFsLiBQ
ZXJoYXBzIGl0J3MganVzdCBtZSB3aG8gdGhpbmtzDQo+ID4gZGVmYXVsdHMgc2hvdWxkIGJlIGNo
b3NlbiBvbiB0aGUgYmFzaXMgb2YgYmVpbmcgbW9zdCBsaWtlbHkgdG8gcmVzdWx0DQo+ID4gaW4g
YSB3b3JraW5nIHN5c3RlbS4NCj4gDQo+IElmIGl0IHdhc24ndCBmb3IgcXVpcmt5IGhhcmR3YXJl
IChvciBmaXJtd2FyZSB0byBjb3ZlciB0aGUgZ2VuZXJhbCBjYXNlLA0KPiBpbiBwYXJ0aWN1bGFy
IHRvIGF2b2lkIGdldHRpbmcgcXVvdGVkIG9uIHRoaXMgd3J0IG15IHBvc2l0aW9uIG9uIEVGSQ0K
PiB3b3JrYXJvdW5kcyksIEknZCBhZ3JlZS4gQnV0IHBlcnNvbmFsbHkgSSB0aGluayBLZXZpbidz
IHBvaW50IHRha2VzDQo+IHByaW9yaXR5IGhlcmU6IEFkbWlucyBzaG91bGQgYXQgbGVhc3QgYmUg
YXdhcmUgb2YgcnVubmluZyBxdWlya3kNCj4gaGFyZHdhcmUsIGFuZCBoZW5jZSBJJ2QgcHJlZmVy
IHRoZSBkZWZhdWx0IHRvIGJlIGxvZ2dpbmcgb2YgZmF1bHRzDQo+IHJhdGhlciB0aGFuIHRoZWly
IHNpbGVuY2luZy4gRG9jdW1lbnRhdGlvbiBvZiB0aGUgbmV3IChzdWItKW9wdGlvbiBtYXkNCj4g
Z2l2ZSBzdWl0YWJsZSBoaW50cywgYW5kIHdlIG1heSBldmVuIGdvIGFzIGZhciBhcyBwcm92aWRp
bmcgYSBLY29uZmlnDQo+IG9wdGlvbiBmb3IgdGhlIGRlZmF1bHQgdG8gYmUgY2hvc2VuIGF0IGJ1
aWxkIHRpbWUuDQo+IA0KPiBNYWluIHF1ZXN0aW9uIG5vdyBpcyAtIHdobydzIGdvaW5nIHRvIG1h
a2UgYSBwYXRjaD8gV2lsbCB5b3U/IFNob3VsZCBJPw0KPiANCg0KSSdtIGhhcHB5IHRvIGRvIGl0
LCBidXQgaXQgd291bGQgcHJvYmFibHkgYmUgbW9yZSBleHBlZGllbnQgaWYgeW91IGRpZC4NCg0K
ICBQYXVsDQoNCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
