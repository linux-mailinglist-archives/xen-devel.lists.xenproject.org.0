Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA703177A39
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 16:19:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j99HO-0003Ix-TW; Tue, 03 Mar 2020 15:16:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x433=4U=amazon.co.uk=prvs=32428865a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j99HN-0003Is-GQ
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 15:16:17 +0000
X-Inumbo-ID: ed6d3bdc-5d61-11ea-8adc-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed6d3bdc-5d61-11ea-8adc-bc764e2007e4;
 Tue, 03 Mar 2020 15:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583248577; x=1614784577;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=rqKLUbXRDvCXtrqFeUWyHGutcOXUXYBxZI9pI/XHK08=;
 b=kdzDOc+VJR/GsMSJeiGIEmK0TT/xHOibDjuqzsQo6wTSFP9+sbuuKRr4
 1saxJA5OkDPaXbWDz2awSTIr9yNaqnCSRvxsNtkWPo5aC0KbSGxqFqCM7
 z+ahYpwlZCt3GiSS1EceUAQ3d4VlbJk1V3Xj+Z7RIpJOecIPYlgT0GU/6 E=;
IronPort-SDR: rXruhwt4T/X2yGkvh15RWTlxDqZxCtZPw9x3wjY6y5zoFsqGiZWjDe+ffL0gvswfLjpATQjGr6
 4t75CDjw/DwQ==
X-IronPort-AV: E=Sophos;i="5.70,511,1574121600"; d="scan'208";a="20734460"
Thread-Topic: [Xen-devel] [PATCH v5 2/4] x86/HVM: implement memory read
 caching for insn emulation
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 03 Mar 2020 15:16:03 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 483E7A24A4; Tue,  3 Mar 2020 15:16:02 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 3 Mar 2020 15:16:01 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Mar 2020 15:16:00 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 3 Mar 2020 15:16:00 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHV8UUsu+n4fTpqxE+JAsPLBc8Ukag2860w
Date: Tue, 3 Mar 2020 15:16:00 +0000
Message-ID: <aadbe8745d334ca8bece2d7e9ef1cd4e@EX13D32EUC003.ant.amazon.com>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <b9aa8053-b35b-1d0f-8303-abc39e1ae17d@suse.com>
In-Reply-To: <b9aa8053-b35b-1d0f-8303-abc39e1ae17d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.151]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 2/4] x86/HVM: implement memory read
 caching for insn emulation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gN
Cj4gU2VudDogMDMgTWFyY2ggMjAyMCAxMDoxNw0KPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47IFdlaSBM
aXUgPHdsQHhlbi5vcmc+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz47IEFuZHJldw0KPiBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBKdW4gTmFrYWppbWEgPGp1bi5uYWth
amltYUBpbnRlbC5jb20+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dlci5wYXVAY2l0cml4LmNv
bT4NCj4gU3ViamVjdDogW0VYVEVSTkFMXVtYZW4tZGV2ZWxdIFtQQVRDSCB2NSAyLzRdIHg4Ni9I
Vk06IGltcGxlbWVudCBtZW1vcnkgcmVhZCBjYWNoaW5nIGZvciBpbnNuDQo+IGVtdWxhdGlvbg0K
PiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUg
b3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMg
c2FmZS4NCj4gDQo+IA0KPiANCj4gRW11bGF0aW9uIHJlcXVpcmluZyBkZXZpY2UgbW9kZWwgYXNz
aXN0YW5jZSB1c2VzIGEgZm9ybSBvZiBpbnN0cnVjdGlvbg0KPiByZS1leGVjdXRpb24sIGFzc3Vt
aW5nIHRoYXQgdGhlIHNlY29uZCAoYW5kIGFueSBmdXJ0aGVyKSBwYXNzIHRha2VzDQo+IGV4YWN0
bHkgdGhlIHNhbWUgcGF0aC4gVGhpcyBpcyBhIHZhbGlkIGFzc3VtcHRpb24gYXMgZmFyIGFzIHVz
ZSBvZiBDUFUNCj4gcmVnaXN0ZXJzIGdvZXMgKGFzIHRob3NlIGNhbid0IGNoYW5nZSB3aXRob3V0
IGFueSBvdGhlciBpbnN0cnVjdGlvbg0KPiBleGVjdXRpbmcgaW4gYmV0d2VlbiBbMV0pLCBidXQg
aXMgd3JvbmcgZm9yIG1lbW9yeSBhY2Nlc3Nlcy4gSW4NCj4gcGFydGljdWxhciBpdCBoYXMgYmVl
biBvYnNlcnZlZCB0aGF0IFdpbmRvd3MgbWlnaHQgcGFnZSBvdXQgYnVmZmVycw0KPiB1bmRlcm5l
YXRoIGFuIGluc3RydWN0aW9uIGN1cnJlbnRseSB1bmRlciBlbXVsYXRpb24gKGhpdHRpbmcgYmV0
d2VlbiB0d28NCj4gcGFzc2VzKS4gSWYgdGhlIGZpcnN0IHBhc3MgcmVhZCBhIG1lbW9yeSBvcGVy
YW5kIHN1Y2Nlc3NmdWxseSwgYW55DQo+IHN1YnNlcXVlbnQgcGFzcyBuZWVkcyB0byBnZXQgdG8g
c2VlIHRoZSBleGFjdCBzYW1lIHZhbHVlLg0KPiANCj4gSW50cm9kdWNlIGEgY2FjaGUgdG8gbWFr
ZSBzdXJlIGFib3ZlIGRlc2NyaWJlZCBhc3N1bXB0aW9uIGhvbGRzLiBUaGlzDQo+IGlzIGEgdmVy
eSBzaW1wbGlzdGljIGltcGxlbWVudGF0aW9uIGZvciBub3c6IE9ubHkgZXhhY3QgbWF0Y2hlcyBh
cmUNCj4gc2F0aXNmaWVkIChubyBvdmVybGFwcyBvciBwYXJ0aWFsIHJlYWRzIG9yIGFueXRoaW5n
KTsgdGhpcyBpcyBzdWZmaWNpZW50DQo+IGZvciB0aGUgaW1tZWRpYXRlIHB1cnBvc2Ugb2YgbWFr
aW5nIHJlLWV4ZWN1dGlvbiBhbiBleGFjdCByZXBsYXkuIFRoZQ0KPiBjYWNoZSBhbHNvIHdvbid0
IGJlIHVzZWQganVzdCB5ZXQgZm9yIGd1ZXN0IHBhZ2Ugd2Fsa3M7IHRoYXQnbGwgYmUgdGhlDQo+
IHN1YmplY3Qgb2YgYSBzdWJzZXF1ZW50IGNoYW5nZS4NCj4gDQo+IFdpdGggdGhlIGNhY2hlIGJl
aW5nIGdlbmVyYWxseSB0cmFuc3BhcmVudCB0byB1cHBlciBsYXllcnMsIGJ1dCB3aXRoIGl0DQo+
IGhhdmluZyBsaW1pdGVkIGNhcGFjaXR5IHlldCBiZWluZyByZXF1aXJlZCBmb3IgY29ycmVjdG5l
c3MsIGNlcnRhaW4NCj4gdXNlcnMgb2YgaHZtX2NvcHlfZnJvbV9ndWVzdF8qKCkgbmVlZCB0byBk
aXNhYmxlIGNhY2hpbmcgdGVtcG9yYXJpbHksDQo+IHdpdGhvdXQgaW52YWxpZGF0aW5nIHRoZSBj
YWNoZS4gTm90ZSB0aGF0IHRoZSBhZGp1c3RtZW50cyBoZXJlIHRvDQo+IGh2bV9oeXBlcmNhbGwo
KSBhbmQgaHZtX3Rhc2tfc3dpdGNoKCkgYXJlIGJlbmlnbiBhdCB0aGlzIHBvaW50OyB0aGV5J2xs
DQo+IGJlY29tZSByZWxldmFudCBvbmNlIHdlIHN0YXJ0IHRvIGJlIGFibGUgdG8gZW11bGF0ZSBy
ZXNwZWN0aXZlIGluc25zDQo+IHRocm91Z2ggdGhlIG1haW4gZW11bGF0b3IgKGFuZCBtb3JlIGNo
YW5nZXMgd2lsbCB0aGVuIGxpa2VseSBiZSBuZWVkZWQNCj4gdG8gbmVzdGVkIGNvZGUpLg0KPiAN
Cj4gQXMgdG8gdGhlIGFjdHVhbCBkYXRhIHBhZ2UgaW4gYSBwcm9ibGFtdGljIHNjZW5hcmlvLCB0
aGVyZSBhcmUgYSBjb3VwbGUNCj4gb2YgYXNwZWN0cyB0byB0YWtlIGludG8gY29uc2lkZXJhdGlv
bjoNCj4gLSBXZSBtdXN0IGJlIHRhbGtpbmcgYWJvdXQgYW4gaW5zbiBhY2Nlc3NpbmcgdHdvIGxv
Y2F0aW9ucyAodHdvIG1lbW9yeQ0KPiAgIG9uZXMsIG9uZSBvZiB3aGljaCBpcyBNTUlPLCBvciBh
IG1lbW9yeSBhbmQgYW4gSS9PIG9uZSkuDQo+IC0gSWYgdGhlIG5vbiBJL08gLyBNTUlPIHNpZGUg
aXMgYmVpbmcgcmVhZCwgdGhlIHJlLXJlYWQgKGlmIGl0IG9jY3VycyBhdA0KPiAgIGFsbCkgaXMg
aGF2aW5nIGl0cyByZXN1bHQgZGlzY2FyZGVkLCBieSB0YWtpbmcgdGhlIHNob3J0Y3V0IHRocm91
Z2gNCj4gICB0aGUgZmlyc3Qgc3dpdGNoKCkncyBTVEFURV9JT1JFU1BfUkVBRFkgY2FzZSBpbiBo
dm1lbXVsX2RvX2lvKCkuIE5vdGUNCj4gICBob3csIGFtb25nIGFsbCB0aGUgcmUtaXNzdWUgc2Fu
aXR5IGNoZWNrcyB0aGVyZSwgd2UgYXZvaWQgY29tcGFyaW5nDQo+ICAgdGhlIGFjdHVhbCBkYXRh
Lg0KPiAtIElmIHRoZSBub24gSS9PIC8gTU1JTyBzaWRlIGlzIGJlaW5nIHdyaXR0ZW4sIGl0IGlz
IHRoZSBPU2VzDQo+ICAgcmVzcG9uc2liaWxpdHkgdG8gYXZvaWQgYWN0dWFsbHkgbW92aW5nIHBh
Z2UgY29udGVudHMgdG8gZGlzayB3aGlsZQ0KPiAgIHRoZXJlIG1pZ2h0IHN0aWxsIGJlIGEgd3Jp
dGUgYWNjZXNzIGluIGZsaWdodCAtIHRoaXMgaXMgbm8gZGlmZmVyZW50DQo+ICAgaW4gYmVoYXZp
b3IgZnJvbSBiYXJlIGhhcmR3YXJlLg0KPiAtIFJlYWQtbW9kaWZ5LXdyaXRlIGFjY2Vzc2VzIGFy
ZSwgYXMgYWx3YXlzLCBjb21wbGljYXRlZCwgYW5kIHdoaWxlIHdlDQo+ICAgZGVhbCB3aXRoIHRo
ZW0gYmV0dGVyIG5vd2FkYXlzIHRoYW4gd2UgZGlkIGluIHRoZSBwYXN0LCB3ZSdyZSBzdGlsbA0K
PiAgIG5vdCBxdWl0ZSB0aGVyZSB0byBndWFyYW50ZWUgaGFyZHdhcmUgbGlrZSBiZWhhdmlvciBp
biBhbGwgY2FzZXMNCj4gICBhbnl3YXkuIE5vdGhpbmcgaXMgZ2V0dGluZyB3b3JzZSBieSB0aGUg
Y2hhbmdlcyBtYWRlIGhlcmUsIGFmYWljdC4NCj4gDQo+IEluIF9faHZtX2NvcHkoKSBhbHNvIHJl
ZHVjZSBwJ3Mgc2NvcGUgYW5kIGNoYW5nZSBpdHMgdHlwZSB0byB2b2lkICouDQo+IA0KPiBbMV0g
T3RoZXIgdGhhbiBvbiBhY3R1YWwgaGFyZHdhcmUsIGFjdGlvbnMgbGlrZQ0KPiAgICAgWEVOX0RP
TUNUTF9zZXRodm1jb250ZXh0LCBYRU5fRE9NQ1RMX3NldHZjcHVjb250ZXh0LA0KPiAgICAgVkNQ
VU9QX2luaXRpYWxpc2UsIElOSVQsIG9yIFNJUEkgaXNzdWVkIGFnYWluc3QgdGhlIHZDUFUgY2Fu
IG9jY3VyDQo+ICAgICB3aGlsZSB0aGUgdkNQVSBpcyBibG9ja2VkIHdhaXRpbmcgZm9yIGEgZGV2
aWNlIG1vZGVsIHRvIHJldHVybiBkYXRhLg0KPiAgICAgSW4gc3VjaCBjYXNlcyBlbXVsYXRpb24g
bm93IGdldHMgY2FuY2VsZWQsIHRob3VnaCwgYW5kIGhlbmNlIHJlLQ0KPiAgICAgZXhlY3V0aW9u
IGNvcnJlY3RuZXNzIGlzIHVuYWZmZWN0ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBUQkQ6IEluIHByaW5jaXBsZSB0aGUg
Y2FjaGluZyBoZXJlIHlpZWxkcyB1bm5lY2Vzc2FyeSB0aGUgb25lIHVzZWQgZm9yDQo+ICAgICAg
aW5zbiBieXRlcyAodmlvLT5tbWlvX2luc257LF9ieXRlc30uIEhvd2V2ZXIsIHRvIHNlZWQgdGhl
IGNhY2hlDQo+ICAgICAgd2l0aCB0aGUgZGF0YSBTVk0gbWF5IGhhdmUgbWFkZSBhdmFpbGFibGUs
IHdlJ2QgaGF2ZSB0byBhbHNvIGtub3cNCj4gICAgICB0aGUgY29ycmVzcG9uZGluZyBHUEEuIEl0
J3Mgbm90IHNhZmUsIGhvd2V2ZXIsIHRvIHJlLXdhbGsgdGhlIHBhZ2UNCj4gICAgICB0YWJsZXMg
dG8gZmluZCBvdXQsIGFzIHRoZSBwYWdlIHRhYmxlcyBtYXkgaGF2ZSBjaGFuZ2VkIGluIHRoZQ0K
PiAgICAgIG1lYW50aW1lLiBUaGVyZWZvcmUgSSBndWVzcyB3ZSBuZWVkIHRvIGtlZXAgdGhlIGR1
cGxpY2F0ZQ0KPiAgICAgIGZ1bmN0aW9uYWxpdHkgZm9yIG5vdy4gQSBwb3NzaWJsZSBzb2x1dGlv
biB0byB0aGlzIGNvdWxkIGJlIHRvIHVzZQ0KPiAgICAgIGEgcGh5c2ljYWwtYWRkcmVzcy1iYXNl
ZCBjYWNoZSBmb3IgcGFnZSB0YWJsZSBhY2Nlc3NlcyAoYW5kIGxvb2tpbmcNCj4gICAgICBmb3J3
YXJkIGFsc28gZS5nLiBTVk0vVk1YIGluc24gZW11bGF0aW9uKSwgYW5kIGEgbGluZWFyLWFkZHJl
c3MtDQo+ICAgICAgYmFzZWQgb25lIGZvciBhbGwgb3RoZXIgcmVhZHMuDQo+IC0tLQ0KPiB2NTog
UmUtYXJyYW5nZSBiaXRmaWVsZC4gVXNlIGRvbWFpbl9jcmFzaCgpIGluIGh2bWVtdWxfd3JpdGVf
Y2FjaGUoKS4NCj4gICAgIE1vdmUgaHZtZW11bF97cmVhZCx3cml0ZX1fY2FjaGUoKSBzdHVicyB0
byBsYXRlciBwYXRjaC4gQWxzbyBhZGp1c3QNCj4gICAgIGh2bWVtdWxfY2FuY2VsKCkuIEFkZCAv
IGV4dGVuZCBjb21tZW50cy4gUmUtYmFzZS4NCj4gdjQ6IFJlLXdyaXRlIGZvciBjYWNoZSB0byBi
ZWNvbWUgdHJhbnNwYXJlbnQgdG8gY2FsbGVycy4NCj4gdjM6IEFkZCB0ZXh0IGFib3V0IHRoZSBh
Y3R1YWwgZGF0YSBwYWdlIHRvIHRoZSBkZXNjcmlwdGlvbi4NCj4gdjI6IFJlLWJhc2UuDQo+IA0K
DQpHZW5lcmFsbHkgTEdUTSwganVzdCBhIGNvdXBsZSBvZiBwb2ludHMgYmVsb3cuLi4NCg0KPiAt
LS0gYS94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L2VtdWxhdGUuYw0KPiBAQCAtMjgsNiArMjgsMTkgQEANCj4gICNpbmNsdWRlIDxhc20vaW9jYXAu
aD4NCj4gICNpbmNsdWRlIDxhc20vdm1fZXZlbnQuaD4NCj4gDQo+ICtzdHJ1Y3QgaHZtZW11bF9j
YWNoZQ0KPiArew0KPiArICAgIC8qIFRoZSBjYWNoZSBpcyBkaXNhYmxlZCBhcyBsb25nIGFzIG51
bV9lbnRzID4gbWF4X2VudHMuICovDQo+ICsgICAgdW5zaWduZWQgaW50IG51bV9lbnRzOw0KPiAr
ICAgIHVuc2lnbmVkIGludCBtYXhfZW50czsNCj4gKyAgICBzdHJ1Y3Qgew0KPiArICAgICAgICBw
YWRkcl90IGdwYTpQQUREUl9CSVRTOw0KPiArICAgICAgICB1bnNpZ25lZCBpbnQgOkJJVFNfUEVS
X0xPTkcgLSBQQUREUl9CSVRTIC0gODsNCg0KSXMgY2xhbmcgb2sgd2l0aCB1bm5hbWVkIGZpZWxk
cz8NCg0KPiArICAgICAgICB1bnNpZ25lZCBpbnQgc2l6ZTo4Ow0KPiArICAgICAgICB1bnNpZ25l
ZCBsb25nIGRhdGE7DQo+ICsgICAgfSBlbnRzW107DQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgdm9p
ZCBodm10cmFjZV9pb19hc3Npc3QoY29uc3QgaW9yZXFfdCAqcCkNCj4gIHsNCj4gICAgICB1bnNp
Z25lZCBpbnQgc2l6ZSwgZXZlbnQ7DQo+IEBAIC0xMzYsNiArMTQ5LDggQEAgdm9pZCBodm1lbXVs
X2NhbmNlbChzdHJ1Y3QgdmNwdSAqdikNCj4gICAgICB2aW8tPm1taW9fYWNjZXNzID0gKHN0cnVj
dCBucGZlYyl7fTsNCj4gICAgICB2aW8tPm1taW9fcmV0cnkgPSBmYWxzZTsNCj4gICAgICB2aW8t
PmcybV9pb3BvcnQgPSBOVUxMOw0KPiArDQo+ICsgICAgaHZtZW11bF9jYWNoZV9kaXNhYmxlKHYp
Ow0KPiAgfQ0KPiANCj4gIHN0YXRpYyBpbnQgaHZtZW11bF9kb19pbygNCj4gQEAgLTE4ODMsMTIg
KzE4OTgsMTcgQEAgc3RhdGljIGludCBodm1lbXVsX3JlcF9tb3ZzKA0KPiAgICAgICAgICByYyA9
IEhWTVRSQU5TX29rYXk7DQo+ICAgICAgfQ0KPiAgICAgIGVsc2UNCj4gKyAgICB7DQo+ICsgICAg
ICAgIHVuc2lnbmVkIGludCB0b2tlbiA9IGh2bWVtdWxfY2FjaGVfZGlzYWJsZShjdXJyKTsNCj4g
Kw0KPiAgICAgICAgICAvKg0KPiAgICAgICAgICAgKiBXZSBkbyBhIG1vZGljdW0gb2YgY2hlY2tp
bmcgaGVyZSwganVzdCBmb3IgcGFyYW5vaWEncyBzYWtlIGFuZCB0bw0KPiAgICAgICAgICAgKiBk
ZWZpbml0ZWx5IGF2b2lkIGNvcHlpbmcgYW4gdW5pdGlhbGlzZWQgYnVmZmVyIGludG8gZ3Vlc3Qg
YWRkcmVzcw0KPiAgICAgICAgICAgKiBzcGFjZS4NCj4gICAgICAgICAgICovDQo+ICAgICAgICAg
IHJjID0gaHZtX2NvcHlfZnJvbV9ndWVzdF9waHlzKGJ1Ziwgc2dwYSwgYnl0ZXMpOw0KPiArICAg
ICAgICBodm1lbXVsX2NhY2hlX3Jlc3RvcmUoY3VyciwgdG9rZW4pOw0KPiArICAgIH0NCj4gDQo+
ICAgICAgaWYgKCByYyA9PSBIVk1UUkFOU19va2F5ICkNCj4gICAgICAgICAgcmMgPSBodm1fY29w
eV90b19ndWVzdF9waHlzKGRncGEsIGJ1ZiwgYnl0ZXMsIGN1cnIpOw0KPiBAQCAtMjU1MSw2ICsy
NTcxLDE5IEBAIHN0YXRpYyBpbnQgX2h2bV9lbXVsYXRlX29uZShzdHJ1Y3QgaHZtX2UNCj4gICAg
ICBzdHJ1Y3QgaHZtX3ZjcHVfaW8gKnZpbyA9ICZjdXJyLT5hcmNoLmh2bS5odm1faW87DQo+ICAg
ICAgaW50IHJjOw0KPiANCj4gKyAgICAvKg0KPiArICAgICAqIEVuYWJsZSBjYWNoaW5nIGlmIGl0
J3MgY3VycmVudGx5IGRpc2FibGVkLCBidXQgbGVhdmUgdGhlIGNhY2hlDQo+ICsgICAgICogdW50
b3VjaGVkIGlmIGl0J3MgYWxyZWFkeSBlbmFibGVkLCBmb3IgcmUtZXhlY3V0aW9uIHRvIGNvbnN1
bWUNCj4gKyAgICAgKiBlbnRyaWVzIHBvcHVsYXRlZCBieSBhbiBlYXJsaWVyIHBhc3MuDQo+ICsg
ICAgICovDQo+ICsgICAgaWYgKCB2aW8tPmNhY2hlLT5udW1fZW50cyA+IHZpby0+Y2FjaGUtPm1h
eF9lbnRzICkNCj4gKyAgICB7DQo+ICsgICAgICAgIEFTU0VSVCh2aW8tPmlvX3JlcS5zdGF0ZSA9
PSBTVEFURV9JT1JFUV9OT05FKTsNCj4gKyAgICAgICAgdmlvLT5jYWNoZS0+bnVtX2VudHMgPSAw
Ow0KPiArICAgIH0NCj4gKyAgICBlbHNlDQo+ICsgICAgICAgIEFTU0VSVCh2aW8tPmlvX3JlcS5z
dGF0ZSA9PSBTVEFURV9JT1JFU1BfUkVBRFkpOw0KPiArDQo+ICAgICAgaHZtX2VtdWxhdGVfaW5p
dF9wZXJfaW5zbihodm1lbXVsX2N0eHQsIHZpby0+bW1pb19pbnNuLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdmlvLT5tbWlvX2luc25fYnl0ZXMpOw0KPiANCj4gQEAgLTI1NjQs
NiArMjU5Nyw3IEBAIHN0YXRpYyBpbnQgX2h2bV9lbXVsYXRlX29uZShzdHJ1Y3QgaHZtX2UNCj4g
ICAgICB7DQo+ICAgICAgICAgIHZpby0+bW1pb19jYWNoZV9jb3VudCA9IDA7DQo+ICAgICAgICAg
IHZpby0+bW1pb19pbnNuX2J5dGVzID0gMDsNCj4gKyAgICAgICAgaHZtZW11bF9jYWNoZV9kaXNh
YmxlKGN1cnIpOw0KPiAgICAgIH0NCj4gICAgICBlbHNlDQo+ICAgICAgew0KPiBAQCAtMjg1Niw2
ICsyODkwLDEyMyBAQCB2b2lkIGh2bV9kdW1wX2VtdWxhdGlvbl9zdGF0ZShjb25zdCBjaGFyDQo+
ICAgICAgICAgICAgIGh2bWVtdWxfY3R4dC0+aW5zbl9idWYpOw0KPiAgfQ0KPiANCj4gK2ludCBo
dm1lbXVsX2NhY2hlX2luaXQoc3RydWN0IHZjcHUgKnYpDQo+ICt7DQo+ICsgICAgLyoNCj4gKyAg
ICAgKiBObyBpbnNuIGNhbiBhY2Nlc3MgbW9yZSB0aGFuIDE2IGluZGVwZW5kZW50IGxpbmVhciBh
ZGRyZXNzZXMgKEFWWDUxMkYNCj4gKyAgICAgKiBzY2F0dGVycy9nYXRoZXJzIGJlaW5nIHRoZSB3
b3JzdCkuIEVhY2ggc3VjaCBsaW5lYXIgcmFuZ2UgY2FuIHNwYW4gYQ0KPiArICAgICAqIHBhZ2Ug
Ym91bmRhcnksIGkuZS4gbWF5IHJlcXVpcmUgdHdvIHBhZ2Ugd2Fsa3MuIEFjY291bnQgZm9yIGVh
Y2ggaW5zbg0KPiArICAgICAqIGJ5dGUgaW5kaXZpZHVhbGx5LCBmb3Igc2ltcGxpY2l0eS4NCj4g
KyAgICAgKi8NCj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgbmVudHMgPSAoQ09ORklHX1BBR0lO
R19MRVZFTFMgKyAxKSAqDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKE1BWF9J
TlNUX0xFTiArIDE2ICogMik7DQo+ICsgICAgc3RydWN0IGh2bWVtdWxfY2FjaGUgKmNhY2hlID0g
eG1hbGxvY19mbGV4X3N0cnVjdChzdHJ1Y3QgaHZtZW11bF9jYWNoZSwNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudHMsIG5lbnRzKTsN
Cj4gKw0KPiArICAgIGlmICggIWNhY2hlICkNCj4gKyAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+
ICsNCj4gKyAgICAvKiBDYWNoZSBpcyBkaXNhYmxlZCBpbml0aWFsbHkuICovDQo+ICsgICAgY2Fj
aGUtPm51bV9lbnRzID0gbmVudHMgKyAxOw0KPiArICAgIGNhY2hlLT5tYXhfZW50cyA9IG5lbnRz
Ow0KPiArDQo+ICsgICAgdi0+YXJjaC5odm0uaHZtX2lvLmNhY2hlID0gY2FjaGU7DQo+ICsNCj4g
KyAgICByZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArdW5zaWduZWQgaW50IGh2bWVtdWxfY2FjaGVf
ZGlzYWJsZShzdHJ1Y3QgdmNwdSAqdikNCj4gK3sNCj4gKyAgICBzdHJ1Y3QgaHZtZW11bF9jYWNo
ZSAqY2FjaGUgPSB2LT5hcmNoLmh2bS5odm1faW8uY2FjaGU7DQo+ICsgICAgdW5zaWduZWQgaW50
IHRva2VuID0gY2FjaGUtPm51bV9lbnRzOw0KPiArDQo+ICsgICAgY2FjaGUtPm51bV9lbnRzID0g
Y2FjaGUtPm1heF9lbnRzICsgMTsNCj4gKw0KPiArICAgIHJldHVybiB0b2tlbjsNCj4gK30NCj4g
Kw0KPiArdm9pZCBodm1lbXVsX2NhY2hlX3Jlc3RvcmUoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVk
IGludCB0b2tlbikNCj4gK3sNCj4gKyAgICBzdHJ1Y3QgaHZtZW11bF9jYWNoZSAqY2FjaGUgPSB2
LT5hcmNoLmh2bS5odm1faW8uY2FjaGU7DQo+ICsNCj4gKyAgICBBU1NFUlQoY2FjaGUtPm51bV9l
bnRzID4gY2FjaGUtPm1heF9lbnRzKTsNCj4gKyAgICBjYWNoZS0+bnVtX2VudHMgPSB0b2tlbjsN
Cg0KQVNTRVJUKHRva2VuIDw9IGNhY2hlLT5tYXhfZW50cykgaGVyZT8NCg0KICBQYXVsDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
