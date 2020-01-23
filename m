Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39494146DAE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:59:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iueqr-0003W0-4a; Thu, 23 Jan 2020 15:57:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqmU=3M=amazon.co.uk=prvs=2848fc5af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iueqp-0003Vt-2S
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:56:59 +0000
X-Inumbo-ID: fc1cc3f7-3df8-11ea-be71-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc1cc3f7-3df8-11ea-be71-12813bfff9fa;
 Thu, 23 Jan 2020 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579795018; x=1611331018;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EKXwhkk1kdP+FvrPz5B1mI0RRURJywZiLj9Ikk0mZGs=;
 b=VtSmOr57AREjRrLN7ZVdGzn137rLaDpWgZCfwK3cLEU00pkYcDBj42wU
 Tbeuu1sIz8wHc1xj9txmgmHZvr4MS6UXi049itgSdqlmxhRxVP40ku4C1
 pFI8jef0fdCH2pZXQXo18bdlHirOTXzP73BM2nYCGKfqPlTB06kY07L74 g=;
IronPort-SDR: K11G3S4m4i1rCXvftZdUV8aw9VRI8qprDSteeekVpSUl50zM6tE7cXn+TuIAp0brVLvDlnkv+N
 7v15oOms4hnA==
X-IronPort-AV: E=Sophos;i="5.70,354,1574121600"; d="scan'208";a="12214616"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 23 Jan 2020 15:56:34 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id A8B19141607; Thu, 23 Jan 2020 15:56:30 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 23 Jan 2020 15:56:30 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 23 Jan 2020 15:56:29 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 23 Jan 2020 15:56:29 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v3 3/3] x86 / vmx: use a 'normal' domheap page for
 APIC_DEFAULT_PHYS_BASE
Thread-Index: AQHV0fXetmGz8ndNHkq9FYXzH0041Kf4YKyAgAAEgZA=
Date: Thu, 23 Jan 2020 15:56:28 +0000
Message-ID: <9e0f081c7daf4ade952bf60c60ccfe59@EX13D32EUC003.ant.amazon.com>
References: <20200123140305.21050-1-pdurrant@amazon.com>
 <20200123140305.21050-4-pdurrant@amazon.com>
 <4dde36de-ae8e-9fae-a84e-c5882ad396d0@suse.com>
In-Reply-To: <4dde36de-ae8e-9fae-a84e-c5882ad396d0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.87]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86 / vmx: use a 'normal' domheap
 page for APIC_DEFAULT_PHYS_BASE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIzIEphbnVhcnkgMjAyMCAxNTozMg0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsg
SWFuDQo+IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgS29ucmFkDQo+IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsgS2V2aW4NCj4gVGlhbiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMy8zXSB4ODYg
LyB2bXg6IHVzZSBhICdub3JtYWwnIGRvbWhlYXAgcGFnZSBmb3INCj4gQVBJQ19ERUZBVUxUX1BI
WVNfQkFTRQ0KPiANCj4gT24gMjMuMDEuMjAyMCAxNTowMywgUGF1bCBEdXJyYW50IHdyb3RlOg0K
PiA+IHZteF9hbGxvY192bGFwaWNfbWFwcGluZygpIGN1cnJlbnRseSBjb250YWlucyBzb21lIHZl
cnkgb2RkIGxvb2tpbmcgY29kZQ0KPiA+IHRoYXQgYWxsb2NhdGVzIGEgTUVNRl9ub19vd25lciBk
b21oZWFwIHBhZ2UgYW5kIHRoZW4gc2hhcmVzIHdpdGggdGhlDQo+IGd1ZXN0DQo+ID4gYXMgaWYg
aXQgd2VyZSBhIHhlbmhlYXAgcGFnZS4gVGhpcyB0aGVuIHJlcXVpcmVzDQo+IHZteF9mcmVlX3Zs
YXBpY19tYXBwaW5nKCkNCj4gPiB0byBjYWxsIGEgc3BlY2lhbCBmdW5jdGlvbiBpbiB0aGUgbW0g
Y29kZTogZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKCkuDQo+ID4NCj4gPiBCeSB1c2luZyBhICdu
b3JtYWwnIGRvbWhlYXAgcGFnZSAoaS5lLiBieSBub3QgcGFzc2luZyBNRU1GX25vX293bmVyIHRv
DQo+ID4gYWxsb2NfZG9taGVhcF9wYWdlKCkpLCB0aGUgb2RkIGxvb2tpbmcgY29kZSBpbg0KPiB2
bXhfYWxsb2NfdmxhcGljX21hcHBpbmcoKQ0KPiA+IGNhbiBzaW1wbHkgdXNlIGdldF9wYWdlX2Fu
ZF90eXBlKCkgdG8gc2V0IHVwIGEgd3JpdGFibGUgbWFwcGluZyBiZWZvcmUNCj4gPiBpbnNlcnRp
b24gaW4gdGhlIFAyTSBhbmQgdm14X2ZyZWVfdmxhcGljX21hcHBpbmcoKSBjYW4gc2ltcGx5IHJl
bGVhc2UNCj4gdGhlDQo+ID4gcGFnZSB1c2luZyBwdXRfcGFnZV9hbGxvY19yZWYoKSBmb2xsb3dl
ZCBieSBwdXRfcGFnZV9hbmRfdHlwZSgpLiBUaGlzDQo+ID4gdGhlbiBhbGxvd3MgZnJlZV9zaGFy
ZWRfZG9taGVhcF9wYWdlKCkgdG8gYmUgcHVyZ2VkLg0KPiA+DQo+ID4gVGhlcmUgaXMsIGhvd2V2
ZXIsIHNvbWUgZmFsbC1vdXQgZnJvbSB0aGlzIHNpbXBsaWZpY2F0aW9uOg0KPiA+DQo+ID4gLSBh
bGxvY19kb21oZWFwX3BhZ2UoKSB3aWxsIG5vdyBjYWxsIGFzc2lnbl9wYWdlcygpIGFuZCBydW4g
aW50byB0aGUNCj4gZmFjdA0KPiA+ICAgdGhhdCAnbWF4X3BhZ2VzJyBpcyBub3Qgc2V0IHVudGls
IHNvbWUgdGltZSBhZnRlciBkb21haW5fY3JlYXRlKCkuIFRvDQo+ID4gICBhdm9pZCBhbiBhbGxv
Y2F0aW9uIGZhaWx1cmUsIGRvbWFpbl9jcmVhdGUoKSBpcyBtb2RpZmllZCB0byBzZXQNCj4gPiAg
IG1heF9wYWdlcyB0byBhbiBpbml0aWFsIHZhbHVlLCBzdWZmaWNpZW50IHRvIGNvdmVyIGFueSBk
b21oZWFwDQo+ID4gICBhbGxvY2F0aW9ucyByZXF1aXJlZCB0byBjb21wbGV0ZSBkb21haW4gY3Jl
YXRpb24uIFRoZSB2YWx1ZSB3aWxsIGJlDQo+ID4gICBzZXQgdG8gdGhlICdyZWFsJyBtYXhfcGFn
ZXMgd2hlbiB0aGUgdG9vbC1zdGFjayBsYXRlciBwZXJmb3JtcyB0aGUNCj4gPiAgIFhFTl9ET01D
VExfbWF4X21lbSBvcGVyYXRpb24sIHRodXMgYWxsb3dpbmcgdGhlIHJlc3Qgb2YgdGhlIGRvbWFp
bidzDQo+ID4gICBtZW1vcnkgdG8gYmUgYWxsb2NhdGVkLg0KPiANCj4gSSBjb250aW51ZSB0byBk
aXNhZ3JlZSB3aXRoIHRoaXMgYXBwcm9hY2gsIGFuZCBJIGRvbid0IHRoaW5rIEkndmUNCj4gaGVh
cmQgYmFjayBvbiB0aGUgYWx0ZXJuYXRpdmUgc3VnZ2VzdGlvbiBvZiB1c2luZyBNRU1GX25vX3Jl
ZmNvdW50DQo+IGluc3RlYWQgb2YgTUVNRl9ub19vd25lci4NCg0KSSByZXNwb25kZWQgaW4gdjE6
DQoNCiINCj4gRGlkIHlvdSBjb25zaWRlciBwYXNzaW5nIE1FTUZfbm9fcmVmY291bnQgaGVyZSwg
dG8gYXZvaWQgdGhlDQo+IGZpZGRsaW5nIHdpdGggYXNzaWduX3BhZ2VzKCk/IFRoYXQnbGwgaW4g
cGFydGljdWxhciBhbHNvDQo+IGF2b2lkIC4uLg0KPiANCg0KWW91IHJlbWVtYmVyIHdoYXQgaGFw
cGVuZWQgbGFzdCB0aW1lIHdlIGRpZCB0aGF0ICh3aXRoIHRoZSBpb3JlcSBzZXJ2ZXIgcGFnZSks
IHJpZ2h0PyBUaGF0J3Mgd2h5IGFzc2lnbl9wYWdlcygpIHZldG9lcyBub24tcmVmY291bnRlZCBw
YWdlcy4NCiINCg0KPiBBcyBzYWlkIGJlZm9yZSwgdGhlIHBhZ2UgKGFuZCBhbnkgb3RoZXINCj4g
b25lcyB1cCB0byBET01BSU5fSU5JVF9QQUdFUywgd2hpY2ggSSBmaW5kIHJhdGhlciBmcmFnaWxl
IHRvIGJlDQo+IHNldCB0byAxKSB3aWxsIG5vdyBnZXQgYWNjb3VudGVkIGFnYWluc3QgdGhlIGFt
b3VudCBhbGxvd2VkIGZvcg0KPiB0aGUgZG9tYWluIHRvIGFsbG9jYXRlLg0KPiANCj4gSXQgYWxz
byBsb29rcyB0byBtZSBhcyBpZiB0aGlzIHdpbGwgYnJlYWsgZS5nLg0KPiBwMm1fcG9kX3NldF9t
ZW1fdGFyZ2V0KCksIHdoaWNoIGF0IHRoZSB2ZXJ5IHRvcCBoYXMNCj4gDQo+ICAgICAvKiBQID09
IEI6IE5vdGhpbmcgdG8gZG8gKHVubGVzcyB0aGUgZ3Vlc3QgaXMgYmVpbmcgY3JlYXRlZCkuICov
DQo+ICAgICBwb3B1bGF0ZWQgPSBkLT50b3RfcGFnZXMgLSBwMm0tPnBvZC5jb3VudDsNCj4gICAg
IGlmICggcG9wdWxhdGVkID4gMCAmJiBwMm0tPnBvZC5lbnRyeV9jb3VudCA9PSAwICkNCj4gICAg
ICAgICBnb3RvIG91dDsNCj4gDQo+IFRoaXMgY29kZSBhc3N1bWVzIHRoYXQgZHVyaW5nIGRvbWFp
biBjcmVhdGlvbiBhbGwgcGFnZXMgcmVjb3JkZWQNCj4gaW4gLT50b3RfcGFnZXMgaGF2ZSBhbHNv
IGJlZW4gcmVjb3JkZWQgaW4gLT5wb2QuY291bnQuDQo+IA0KPiBUaGVyZSBtYXkgYmUgb3RoZXIg
dXNlcyBvZiAtPnRvdF9wYWdlcyB3aGljaCB0aGlzIGNoYW5nZSBjb25mbGljdHMNCj4gd2l0aC4N
Cj4gDQo+ID4gLSBCZWNhdXNlIHRoZSBkb21oZWFwIHBhZ2UgaXMgbm8gbG9uZ2VyIGEgcHNldWRv
LXhlbmhlYXAgcGFnZSwgdGhlDQo+ID4gICByZWZlcmVuY2UgY291bnRpbmcgd2lsbCBwcmV2ZW50
IHRoZSBkb21haW4gZnJvbSBiZWluZyBkZXN0cm95ZWQuIFRodXMNCj4gPiAgIHRoZSBjYWxsIHRv
IHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKCkgaXMgbW92ZWQgZnJvbSB0aGUNCj4gPiAgIGRvbWFp
bl9kZXN0cm95KCkgbWV0aG9kIGludG8gdGhlIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygp
IG1ldGhvZC4NCj4gPiAgIFdoaWxzdCBpbiB0aGUgYXJlYSwgbWFrZSB0aGUgZG9tYWluX2Rlc3Ry
b3koKSBtZXRob2QgYW4gb3B0aW9uYWwNCj4gPiAgIGFsdGVybmF0aXZlX3ZjYWxsKCkgKHNpbmNl
IGl0IHdpbGwgbm8gbG9uZ2VyIHBlZm9ybSBhbnkgZnVuY3Rpb24gaW4NCj4gVk1YDQo+ID4gICBh
bmQgaXMgc3R1YmJlZCBpbiBTVk0gYW55d2F5KS4NCj4gDQo+IEFsbCBvZiB0aGlzIHdvdWxkLCBh
ZmFpY3QsIGJlY29tZSBpcnJlbGV2YW50IHdoZW4gdXNpbmcgTUVNRl9ub19yZWZjb3VudC4NCj4g
DQo+IFRoZXJlIGxvb2tzIHRvIGJlIG9uZSBpc3N1ZSAod2hpY2ggSSB0aGluayB3ZSBoYXZlIGJl
ZW4gZGlzY3Vzc2luZw0KPiBiZWZvcmUpOiBCeSBub3QgYnVtcGluZyAtPnRvdF9wYWdlcywgaXRz
IGRlY3JlbWVudGluZyB1cG9uIGZyZWVpbmcNCj4gdGhlIHBhZ2Ugd2lsbCBiZSBhIHByb2JsZW0u
DQoNClllcywgdGhhdCdzIGV4YWN0bHkgdGhlIHByb2JsZW0gd2l0aCBhc3NpZ25pbmcgTUVNRl9u
b19yZWZjb3VudCBwYWdlcywgd2hpY2ggaXMgd2F5IGl0IGlzIG91dGxhd2VkLg0KDQo+IEkgY2Fu
IHNlZSB0d28gcG9zc2libGUgc29sdXRpb25zIHRvIHRoaXM6DQo+IC0gSW50cm9kdWNlIGEgZmxh
ZyBpbmRpY2F0aW5nIHRoZXJlIHNob3VsZCBhbHNvIGJlIG5vIGFjY291bnRpbmcNCj4gICB1cG9u
IGZyZWVpbmcgb2YgdGhlIHBhZ2UuDQoNCldoYXQgc29ydCBvZiBmbGFnIGRpZCB5b3UgaGF2ZSBp
biBtaW5kPyBEbyB3ZSBoYXZlIHNwYWNlIGFueXdoZXJlIGluIHR5cGUtaW5mbyBvciBjb3VudC1p
bmZvIHRvIHB1dCBpdD8gSWYgd2UgY2FuIG1ha2UgYXNzaWduaW5nIG5vbi1yZWZjb3VudGVkIHBh
Z2VzIHNhZmUgdGhlbiBpdCdzIGNlcnRhaW5seSBhbiBhdHRyYWN0aXZlIG9wdGlvbi4NCg0KPiAt
IEluc3RlYWQgb2YgYXZvaWRpbmcgdG8gaW5jcmVtZW50IC0+dG90X3BhZ2VzLCBfYWxzb18gaW5j
cmVtZW50DQo+ICAgLT5tYXhfcGFnZXMuIFRoZSBpbnRlcmFjdGlvbiB3aXRoIFhFTl9ET01DVExf
bWF4X21lbSB3aWxsIHRoZW4gb2YNCj4gICBjb3Vyc2UgYmUsIHdlbGwsIGludGVyZXN0aW5nLg0K
PiANCg0KSW5kZWVkLCB3aGljaCBpcyB3aHkgSSBvcHRlZCBmb3IgdGhlIHNpbXBsZSBhcHByb2Fj
aC4gQXMgSSd2ZSBzYWlkIGluIG90aGVyIHJlc3BvbnNlcywgbWF4X3BhZ2VzIG91Z2h0IGJlIHNl
dCBieSB0aGUgdG9vbHN0YWNrIHdoZW4gdGhlIGRvbWFpbiBpcyBjcmVhdGVkIHNvIEkgd2FudGVk
IHRvIGNvbWUgdXAgd2l0aCBzb21ldGhpbmcgdGhhdCdzIG5vdCB0b28gaW52YXNpdmUgdW50aWwg
dGhhdCBjaGFuZ2UgaXMgbWFkZSBzbyBpZiB0aGUgcGFnZXMgZG8gbmVlZCB0byBiZSByZWYtY291
bnRlZCB0aGVuIEkgZ3Vlc3MgSSdsbCBoYXZlIHRvIGZpZ3VyZSBvdXQgaG93IHRvIG1ha2UgdGhl
IGluaXRpYWwgYWxsb2NhdGlvbiBjby1leGlzdCB3aXRoIFBvRC4NCg0KICBQYXVsIA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
