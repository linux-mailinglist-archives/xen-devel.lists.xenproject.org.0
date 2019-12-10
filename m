Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C1211813A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 08:19:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieZl7-0005uj-87; Tue, 10 Dec 2019 07:16:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LnxH=2A=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1ieZl5-0005uY-81
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 07:16:35 +0000
X-Inumbo-ID: fe5edca2-1b1c-11ea-88e7-bc764e2007e4
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe5edca2-1b1c-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 07:16:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 23:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,298,1571727600"; d="scan'208";a="363179232"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga004.jf.intel.com with ESMTP; 09 Dec 2019 23:16:31 -0800
Received: from fmsmsx124.amr.corp.intel.com (10.18.125.39) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 9 Dec 2019 23:16:31 -0800
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx124.amr.corp.intel.com (10.18.125.39) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 9 Dec 2019 23:16:30 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.90]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.72]) with mapi id 14.03.0439.000;
 Tue, 10 Dec 2019 15:16:29 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v2] x86 / iommu: set up a scratch page in the
 quarantine domain
Thread-Index: AQHVpUXJ7xQJ1xUhKkKdoTekALKeJaef6gwAgAAEYQCAB7skgIALXWig
Date: Tue, 10 Dec 2019 07:16:28 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D636C7C@SHSMSX104.ccr.corp.intel.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
 <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
 <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
 <4cf200a6-cccb-0bca-f2cb-b9f80956ae33@suse.com>
In-Reply-To: <4cf200a6-cccb-0bca-f2cb-b9f80956ae33@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjIwMjQyNGYtYjM5ZC00NzBkLTgzMmItNmQzODA0MmU1OWEyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiajlaR3dJOUJcL25veWoyMlZCdGd5NnhQK3NLTTZjMHN5SGtKVFBPdTVJempuTlNRR1RyMlVnZ0ZkaTZza1VDXC9jIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] x86 / iommu: set up a scratch page in
 the quarantine domain
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
 Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IERlY2VtYmVyIDMsIDIwMTkgNTozNiBQTQ0KPiANCj4gT24gMjguMTEuMjAxOSAxMjozMiwgSsO8
cmdlbiBHcm/DnyB3cm90ZToNCj4gPiBPbiAyOC4xMS4xOSAxMjoxNywgSmFuIEJldWxpY2ggd3Jv
dGU6DQo+ID4+IE9uIDI3LjExLjIwMTkgMTg6MTEsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4+
IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBpb21tdV9vcCB0byBmYWNpbGl0YXRlIGEgcGVy
LQ0KPiBpbXBsZW1lbnRhdGlvbg0KPiA+Pj4gcXVhcmFudGluZSBzZXQgdXAsIGFuZCB0aGVuIGZ1
cnRoZXIgY29kZSBmb3IgeDg2IGltcGxlbWVudGF0aW9ucw0KPiA+Pj4gKGFtZCBhbmQgdnRkKSB0
byBzZXQgdXAgYSByZWFkLW9ubHkgc2NyYXRjaCBwYWdlIHRvIHNlcnZlIGFzIHRoZSBzb3VyY2UN
Cj4gPj4+IGZvciBETUEgcmVhZHMgd2hpbHN0IGEgZGV2aWNlIGlzIGFzc2lnbmVkIHRvIGRvbV9p
by4gRE1BIHdyaXRlcyB3aWxsDQo+ID4+PiBjb250aW51ZSB0byBmYXVsdCBhcyBiZWZvcmUuDQo+
ID4+Pg0KPiA+Pj4gVGhlIHJlYXNvbiBmb3IgZG9pbmcgdGhpcyBpcyB0aGF0IHNvbWUgaGFyZHdh
cmUgbWF5IGNvbnRpbnVlIHRvIHJlLXRyeQ0KPiA+Pj4gRE1BIChkZXNwaXRlIEZMUikgaW4gdGhl
IGV2ZW50IG9mIGFuIGVycm9yLCBvciBldmVuIEJNRSBiZWluZyBjbGVhcmVkLA0KPiBhbmQNCj4g
Pj4+IHdpbGwgZmFpbCB0byBkZWFsIHdpdGggRE1BIHJlYWQgZmF1bHRzIGdyYWNlZnVsbHkuIEhh
dmluZyBhIHNjcmF0Y2ggcGFnZQ0KPiA+Pj4gbWFwcGVkIHdpbGwgYWxsb3cgcGVuZGluZyBETUEg
cmVhZHMgdG8gY29tcGxldGUgYW5kIHRodXMgc3VjaCBidWdneQ0KPiA+Pj4gaGFyZHdhcmUgd2ls
bCBldmVudHVhbGx5IGJlIHF1aWVzY2VkLg0KPiA+Pj4NCj4gPj4+IE5PVEU6IFRoZXNlIG1vZGlm
aWNhdGlvbnMgYXJlIHJlc3RyaWN0ZWQgdG8geDg2IGltcGxlbWVudGF0aW9ucyBvbmx5IGFzDQo+
ID4+PiAgICAgICAgdGhlIGJ1Z2d5IGgvdyBJIGFtIGF3YXJlIG9mIGlzIG9ubHkgdXNlZCB3aXRo
IFhlbiBpbiBhbiB4ODYNCj4gPj4+ICAgICAgICBlbnZpcm9ubWVudC4gQVJNIG1heSByZXF1aXJl
IHNpbWlsYXIgY29kZSBidXQsIHNpbmNlIEkgYW0gbm90DQo+ID4+PiAgICAgICAgYXdhcmUgb2Yg
dGhlIG5lZWQsIHRoaXMgcGF0Y2ggZG9lcyBub3QgbW9kaWZ5IGFueSBBUk0NCj4gaW1wbGVtZW50
YXRpb24uDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFu
dEBhbWF6b24uY29tPg0KPiA+Pg0KPiA+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiA+Pg0KPiA+Pj4gVGhlcmUgaXMgc3RpbGwgdGhlIG9wZW4gcXVlc3Rp
b24gb2Ygd2hldGhlciB1c2Ugb2YgYSBzY3JhdGNoIHBhZ2Ugb3VnaHQNCj4gPj4+IHRvIGJlIGdh
dGVkIG9uIHNvbWV0aGluZywgZWl0aGVyIGFyZSBydW4tdGltZSBvciBjb21waWxlLXRpbWUuDQo+
ID4+DQo+ID4+IEkgaGF2ZSBubyBjbGVhciBvcGluaW9uIGVpdGhlciB3YXkgaGVyZS4gVGhlIHdv
cmthcm91bmQgc2VlbXMgbG93DQo+ID4+IG92ZXJoZWFkIGVub3VnaCB0aGF0IHRoZXJlIG1heSBu
b3QgYmUgYSBuZWVkIHRvIGhhdmUgYW4gYWRtaW4gKG9yDQo+ID4+IGJ1aWxkIHRpbWUpIGNvbnRy
b2wgZm9yIHRoaXMuDQo+ID4+DQo+ID4+IEFzIHRvIDQuMTM6IFRoZSBxdWFyYW50aW5pbmcgYXMg
YSB3aG9sZSBpcyBwcmV0dHkgZnJlc2guIFdoaWxlIGl0DQo+ID4+IGhhcyBiZWVuIGJhY2twb3J0
ZWQgdG8gc2VjdXJpdHkgbWFpbnRhaW5lZCB0cmVlcywgSSdkIHN0aWxsIGNvbnNpZGVyDQo+ID4+
IGl0IGEgbmV3IGZlYXR1cmUgaW4gNC4xMywgYW5kIGhlbmNlIHRoaXMgd29ya2Fyb3VuZCBhdCBs
ZWFzdCBlbGlnaWJsZQ0KPiA+PiBmb3IgY29uc2lkZXJhdGlvbi4NCj4gPg0KPiA+IEkgYWdyZWUu
DQo+ID4NCj4gPiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQo+IA0KPiBJIG5vdGljZSB0aGlzIGhhcyBiZWVuIGNvbW1pdHRlZCBtZWFud2hpbGUuIEkg
aGFkIHNwZWNpZmljYWxseSBub3QNCj4gZG9uZSBzbyBkdWUgdG8gdGhlIHN0aWxsIG1pc3Npbmcg
VlQtZCBhY2ssIHNlZWluZyB0aGF0IHRoaXMgd2Fzbid0DQo+IGFuIGVudGlyZWx5ICJ0cml2aWFs
IiBjaGFuZ2UuDQo+IA0KDQpXaGlsZSB0aGUgcXVhcmFudGluZSBpZGVhIHNvdW5kcyBnb29kIG92
ZXJhbGwsIEknbSBzdGlsbCBub3QgY29udmluY2VkDQp0byBoYXZlIGl0IHRoZSBvbmx5IHdheSBp
biBwbGFjZSBqdXN0IGZvciBoYW5kbGluZyBzb21lIGtub3duLWJ1Z2d5DQpkZXZpY2UuIEl0IGtp
bGxzIHRoZSBwb3NzaWJpbGl0eSBvZiBpZGVudGlmeWluZyBhIG5ldyBidWdneSBkZXZpY2UgYW5k
IHRoZW4gDQpkZWNpZGluZyBub3QgdG8gdXNlIGl0IGluIHRoZSBmaXJzdCBzcGFjZS4uLiBJIHRo
b3VnaHQgYWJvdXQgd2hldGhlciBpdA0Kd2lsbCBnZXQgYmV0dGVyIHdoZW4gZnV0dXJlIElPTU1V
IGltcGxlbWVudHMgQS9EIGJpdCAtIGJ5IGNoZWNraW5nDQphY2Nlc3MgYml0IGJlaW5nIHNldCB0
aGVuIHdlJ2xsIGtub3cgc29tZSBidWdneSBkZXZpY2UgZXhpc3RzLCBidXQsIA0KdGhlIHNjcmF0
Y2ggcGFnZSBpcyBzaGFyZWQgYnkgYWxsIGRldmljZXMgdGhlbiB3ZSBjYW5ub3QgcmVseSBvbiB0
aGlzIA0KZmVhdHVyZSB0byBmaW5kIG91dCB0aGUgYWN0dWFsIGJ1Z2d5IG9uZS4NCg0KVGhhbmtz
DQpLZXZpbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
