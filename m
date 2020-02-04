Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBAB15187A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 11:08:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyv5Z-0004dn-Gk; Tue, 04 Feb 2020 10:05:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Mmy=3Y=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iyv5Y-0004di-Gf
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 10:05:48 +0000
X-Inumbo-ID: e905166a-4735-11ea-a933-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e905166a-4735-11ea-a933-bc764e2007e4;
 Tue, 04 Feb 2020 10:05:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2020 02:05:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,401,1574150400"; d="scan'208";a="235097948"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga006.jf.intel.com with ESMTP; 04 Feb 2020 02:05:44 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 4 Feb 2020 02:05:44 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 4 Feb 2020 02:05:44 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 4 Feb 2020 02:05:43 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.196]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 18:05:41 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
 <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/4] x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used
Thread-Index: AQHV2ow0m3vws6ZOxk+RY5iEaGwdxagKQScw///9DYCAAAdwAIAAijcQ
Date: Tue, 4 Feb 2020 10:05:41 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D766E4C@SHSMSX104.ccr.corp.intel.com>
References: <20200203121919.15748-1-roger.pau@citrix.com>
 <20200203121919.15748-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7658FC@SHSMSX104.ccr.corp.intel.com>
 <20200204092305.GE4679@Air-de-Roger>
 <0f6fb83a-d7df-2dc7-9061-00d5814737fc@suse.com>
In-Reply-To: <0f6fb83a-d7df-2dc7-9061-00d5814737fc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGI3MzlkMzctYTEyNi00ZjNhLWEwZTUtYmQzYjMyNDNiMjYxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiS1wveU12RklNTFhYUys5elwvb1czQk00b0ltUDArR3ZWVFwvUVpDYTg3MGE0b01Sa2lkMFA3MXVtQTRCVm9YOEZFcyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used
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
 "Nakajima, Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaA0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSA0LCAyMDIwIDU6
NTAgUE0NCj4gDQo+IE9uIDA0LjAyLjIwMjAgMTA6MjMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
DQo+ID4gT24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDE6MzU6MDVBTSArMDAwMCwgVGlhbiwgS2V2
aW4gd3JvdGU6DQo+ID4+PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPg0KPiA+Pj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAzLCAyMDIwIDg6MTkgUE0NCj4gPj4+
DQo+ID4+PiBXaGVuIGRvaW5nIGEgdmlydHVhbCB2bWV4aXQgKGllOiBhIHZtZXhpdCBoYW5kbGVk
IGJ5IHRoZSBMMSBWTU0pDQo+ID4+PiBpbnRlcnJ1cHRzIHNob3VsZG4ndCBiZSBpbmplY3RlZCB1
c2luZyB0aGUgdmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnkNCj4gPj4+IG1lY2hhbmlzbSB1bmxl
c3MgdGhlIEFjayBvbiBleGl0IHZtZXhpdCBjb250cm9sIGJpdCBpc24ndCBzZXQgaW4gdGhlDQo+
ID4+PiBuZXN0ZWQgdm1jcy4NCj4gPj4+DQo+ID4+PiBHYXRlIHRoZSBjYWxsIHRvIG52bXhfdXBk
YXRlX2FwaWN2IGhlbHBlciBvbiB3aGV0aGVyIHRoZSBuZXN0ZWQgdm1jcw0KPiA+Pj4gaGFzIHRo
ZSBBY2sgb24gZXhpdCBiaXQgc2V0IGluIHRoZSB2bWV4aXQgY29udHJvbCBmaWVsZC4NCj4gPj4+
DQo+ID4+PiBOb3RlIHRoYXQgdGhpcyBmaXhlcyB0aGUgdXNhZ2Ugb2YgeDJBUElDIGJ5IHRoZSBM
MSBWTU0sIGF0IGxlYXN0IHdoZW4NCj4gPj4+IHRoZSBMMSBWTU0gaXMgWGVuLg0KPiA+Pj4NCj4g
Pj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pg0KPiA+Pg0KPiA+PiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5j
b20+LCB3aXRoIGEgc21hbGwgY29tbWVudDoNCj4gPj4NCj4gPj4+IC0tLQ0KPiA+Pj4gQ2hhbmdl
cyBzaW5jZSB2MToNCj4gPj4+ICAtIENhbGwgbnZteF91cGRhdGVfYXBpY3YgaWYgdGhlICJBY2sg
b24gZXhpdCIgdm1leGl0IGNvbnRyb2wgYml0DQo+ID4+PiAgICBpc24ndCBzZXQuDQo+ID4+PiAt
LS0NCj4gPj4+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCA3ICsrKysrKy0NCj4gPj4+
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+Pg0K
PiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYw0KPiBiL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3Z2bXguYw0KPiA+Pj4gaW5kZXggZDhhYjE2N2Q2Mi4uM2Q5N2EyOTNi
MiAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYw0KPiA+Pj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jDQo+ID4+PiBAQCAtMTM5Myw3ICsxMzkz
LDEyIEBAIHN0YXRpYyB2b2lkIHZpcnR1YWxfdm1leGl0KHN0cnVjdA0KPiBjcHVfdXNlcl9yZWdz
DQo+ID4+PiAqcmVncykNCj4gPj4+ICAgICAgLyogdXBkYXRpbmcgaG9zdCBjcjAgdG8gc3luYyBU
UyBiaXQgKi8NCj4gPj4+ICAgICAgX192bXdyaXRlKEhPU1RfQ1IwLCB2LT5hcmNoLmh2bS52bXgu
aG9zdF9jcjApOw0KPiA+Pj4NCj4gPj4+IC0gICAgaWYgKCBjcHVfaGFzX3ZteF92aXJ0dWFsX2lu
dHJfZGVsaXZlcnkgKQ0KPiA+Pj4gKyAgICBpZiAoIGNwdV9oYXNfdm14X3ZpcnR1YWxfaW50cl9k
ZWxpdmVyeSAmJg0KPiA+Pj4gKyAgICAgICAgIC8qDQo+ID4+PiArICAgICAgICAgICogT25seSBp
bmplY3QgdGhlIHZlY3RvciBpZiB0aGUgQWNrIG9uIGV4aXQgYml0IGlzIG5vdCBzZXQsIGVsc2Ug
dGhlDQo+ID4+PiArICAgICAgICAgICogaW50ZXJydXB0IHdpbGwgYmUgc2lnbmFsZWQgaW4gdGhl
IHZtY3MgVk1fRVhJVF9JTlRSX0lORk8gZmllbGQuDQo+ID4+PiArICAgICAgICAgICovDQo+ID4+
PiArICAgICAgICAgIShnZXRfdnZtY3ModiwgVk1fRVhJVF9DT05UUk9MUykgJg0KPiBWTV9FWElU
X0FDS19JTlRSX09OX0VYSVQpICkNCj4gPj4NCj4gPj4gSXQncyBhIGJpdCBvZGQgdG8gcHV0IGNv
bW1lbnQgYmV0d2VlbiBjb2RlIGxpbmVzLiBDYW4geW91IG1vdmUgaXQgdG8NCj4gPj4gdGhlIGxp
bmUgYmVmb3JlICdpZic/DQo+ID4NCj4gPiBJIHVzdWFsbHkgdHJ5IHRvIGtlZXAgdGhlIGNvbW1l
bnRzIGFzIGNsb3NlIHRvIHRoZSBjb2RlIGl0IHJlZmVyZW5jZXMNCj4gPiBhcyBwb3NzaWJsZSwg
ZXZlbiBpZiB0aGF0IG1lYW5zIGFkZGluZyB0aGVtIGluIHRoZSBtaWRkbGUgb2YgYW4gaWYNCj4g
PiBjb25kaXRpb24uDQo+ID4NCj4gPiBJIGRvbid0IG1pbmQgbW92aW5nIGl0LCBidXQgbWF5YmUg
dGhlIGNvbW1pdHRlciBjYW4gZG8gaXQgYXQgY29tbWl0DQo+ID4gdGltZT8NCj4gDQo+IFRoaXMg
c2hvdWxkIGJlIGVhc3kgZW5vdWdoLCBidXQgLSBLZXZpbiwgSSBhZ3JlZSB3aXRoIFJvZ2VyIHRo
YXQNCj4gdGhlIGNob3NlIHBsYWNlbWVudCBpcyBiZXR0ZXIgdGhhbiB3aGF0IHlvdSBzdWdnZXN0
LiBZb3UncmUgdGhlDQo+IG1haW50YWluZXIgb2YgdGhlIGZpbGUsIHNvIGlmIHlvdSByZWFsbHkg
dGhpbmsgdGhlIGNvbW1lbnQgc2hvdWxkDQo+IGJlIG1vdmVkIC0gc28gYmUgaXQuIEJ1dCBwbGVh
c2UgcmUtY29uZmlybSBvbmUgb3IgdGhlIG90aGVyIHdheS4NCj4gDQoNClRoZW4gbGVhdmUgaXQg
YXMgaXQgaXMuIEknbSBub3Qgc3Ryb25nIG9uIHRoaXMgcmVxdWVzdC4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
