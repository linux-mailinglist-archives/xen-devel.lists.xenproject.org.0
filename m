Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B251449BE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 03:23:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu5bn-00078m-Ty; Wed, 22 Jan 2020 02:19:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ASrN=3L=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iu5bm-00078h-Ew
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:19:06 +0000
X-Inumbo-ID: 8f7c18aa-3cbd-11ea-bbcb-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f7c18aa-3cbd-11ea-bbcb-12813bfff9fa;
 Wed, 22 Jan 2020 02:19:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 18:19:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,347,1574150400"; d="scan'208";a="374784169"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga004.jf.intel.com with ESMTP; 21 Jan 2020 18:19:03 -0800
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 21 Jan 2020 18:19:02 -0800
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 21 Jan 2020 18:19:02 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.210]) with mapi id 14.03.0439.000;
 Wed, 22 Jan 2020 10:19:00 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH 1/2] nvmx: fix handling of interrupts
Thread-Index: AQHVxg/fbkeODa2AbkWncPoKamSpJafxcYCggAFyWwCAAZn1sIAAZNWAgAElmNA=
Date: Wed, 22 Jan 2020 02:18:59 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D740FBC@SHSMSX104.ccr.corp.intel.com>
References: <20200108103857.77236-1-roger.pau@citrix.com>
 <20200108103857.77236-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739C38@SHSMSX104.ccr.corp.intel.com>
 <20200120101906.GW11756@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D73E81C@SHSMSX104.ccr.corp.intel.com>
 <20200121164717.GJ11756@Air-de-Roger>
In-Reply-To: <20200121164717.GJ11756@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTJmMzk0MjYtNzU2Mi00OTJhLWE0ZjktYjQxYjQ4M2I0M2Q3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVlQ2aG1cL3BlNG9oUnJsM25xOEtOd3Y2ZDRcL09nZmFDeFQ4U1ZMRDdVOVp5YlwvZ09qNWljd1BmVHBXREdIXC9TZHEifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] nvmx: fix handling of interrupts
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
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBKYW51YXJ5IDIyLCAyMDIwIDEyOjQ3IEFNDQo+IA0KPiBPbiBUdWUsIEphbiAy
MSwgMjAyMCBhdCAwMzozNDoxM0FNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPiA+IEZy
b206IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+ID4gU2VudDog
TW9uZGF5LCBKYW51YXJ5IDIwLCAyMDIwIDY6MTkgUE0NCj4gPiA+DQo+ID4gPiBPbiBTdW4sIEph
biAxOSwgMjAyMCBhdCAwNDoxNTowNEFNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPiA+
ID4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+ID4g
PiA+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSA4LCAyMDIwIDY6MzkgUE0NCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IFdoZW4gZG9pbmcgYSB2aXJ0dWFsIHZtZXhpdCAoaWU6IGEgdm1leGl0IGhhbmRs
ZWQgYnkgdGhlIEwxIFZNTSkNCj4gPiA+ID4gPiBpbnRlcnJ1cHRzIHNob3VsZG4ndCBiZSBpbmpl
Y3RlZCB1c2luZyB0aGUgdmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnkNCj4gPiA+ID4gPiBtZWNo
YW5pc20sIGFuZCBpbnN0ZWFkIHNob3VsZCBiZSBzaWduYWxlZCBpbiB0aGUgdm1jcyB1c2luZyB0
aGUgZXhpdA0KPiA+ID4gPiA+IHJlYXNvbiBhbmQgdGhlIGludGVycnVwdGlvbi1pbmZvcm1hdGlv
biBmaWVsZCBpZiB0aGUgIkFja25vd2xlZGdlDQo+ID4gPiA+ID4gaW50ZXJydXB0IG9uIGV4aXQi
IHZtZXhpdCBjb250cm9sIGlzIHNldC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFJlbW92ZSB0aGUg
bnZteF91cGRhdGVfYXBpY3YgaGVscGVyOiBpdCdzIGJvZ3VzIHRvIGF0dGVtcHQgdG8gaW5qZWN0
DQo+ID4gPiA+ID4gaW50ZXJydXB0cyBvbiB2aXJ0dWFsIHZtZXhpdCB1c2luZyB0aGUgdmlydHVh
bCBpbnRlcnJ1cHQgZGVsaXZlcnkNCj4gPiA+ID4gPiBhc3Npc3RhbmNlLCBhbmQgaXQncyBhbHNv
IGJvZ3VzIHRvIGFjayBpbnRlcnJ1cHRzIHdpdGhvdXQgY2hlY2tpbmcgaWYNCj4gPiA+ID4gPiB0
aGUgdm1leGl0ICJBY2tub3dsZWRnZSBpbnRlcnJ1cHQgb24gZXhpdCIgdm1leGl0IGNvbnRyb2wg
aXMgc2V0Lg0KPiA+ID4gPiA+IG52bXhfaW50cl9pbnRlcmNlcHQgYWxyZWFkeSBoYW5kbGVzIGlu
dGVycnVwdHMgY29ycmVjdGx5IG9uIHZpcnR1YWwNCj4gPiA+ID4gPiB2bWV4aXQuDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBOb3RlIHRoYXQgdGhpcyBmaXhlcyB0aGUgdXNhZ2Ugb2YgeDJBUElDIGJ5
IHRoZSBMMSBWTU0sIGF0IGxlYXN0IHdoZW4NCj4gPiA+ID4gPiB0aGUgTDEgVk1NIGlzIFhlbi4N
Cj4gPiA+ID4NCj4gPiA+ID4gd2hpbGUgdGhpcyBmaXggbWFrZXMgc2Vuc2UgdG8gbWUsIGNhbiB5
b3UgYWxzbyB0ZXN0IG90aGVyIEwxIFZNTXMsDQo+ID4gPiA+IHNvIHdlIGRvbid0IG92ZXJsb29r
IHNvbWUgb3RoZXIgaW50ZW50aW9ucyBjb3ZlcmVkIG9yIGhpZGRlbiBieQ0KPiA+ID4gPiByZW1v
dmVkIGxvZ2ljPw0KPiA+ID4NCj4gPiA+IEkgY291bGQgdGVzdCBvdGhlciBoeXBlcnZpc29ycywg
YnV0IGRvIHdlIHJlYWxseSBleHBlY3QgYW55dGhpbmcNCj4gPiA+IHRoYXQncyBub3QgWGVuIG9u
IFhlbiB0byB3b3JrPw0KPiA+ID4NCj4gPiA+IEknbSBhc2tpbmcgYmVjYXVzZSB0aGF0J3MgdGhl
IG9ubHkgY29tYmluYXRpb24gdGhhdCdzIGFjdHVhbGx5IHRlc3RlZA0KPiA+ID4gYnkgb3NzdGVz
dC4NCj4gPiA+DQo+ID4gPiBUaGFua3MsIFJvZ2VyLg0KPiA+DQo+ID4gSWYgb3RoZXJzIGFyZSBP
SyB3aXRoIHlvdXIgYXNzdW1wdGlvbiwgdGhlbiBpdCdzIGZpbmUuIEkgZGlkbid0IHRpZ2h0bHkN
Cj4gPiBmb2xsb3cgdGhlIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiByZXF1aXJlbWVudHMgaW4gWGVu
Lg0KPiANCj4gSSBjYW4gdHJ5IEtWTSBvciBiaHl2ZSBvbiB0b3Agb2YgWGVuLCBidXQgSSdtIG5v
dCBzdXJlIHdoZXRoZXIgYW55b25lDQo+IGhhcyBhY3R1YWxseSB0ZXN0ZWQgdGhpcywgc28gSSBj
b3VsZCBiZSB0cmlnZ2VyaW5nIG90aGVyIGJ1Z3MgaW4gdGhlDQo+IG5lc3RlZCBjb2RlLg0KPiAN
Cj4gPiBPbiB0aGUgb3RoZXIgaGFuZCwgSSB0aGluayB0aGlzIHBhdGNoIG5lZWRzIGEgcmV2aXNp
b24uIEl0IGlzIG5vdCBib2d1cw0KPiA+IHRvIHVzZSB2aXJ0dWFsIGludGVycnVwdCBkZWxpdmVy
eSBvbiB2aXJ0dWFsIFZNZXhpdCwgaWYgIkFjayBpbnRlcnJ1cHQNCj4gPiBvbiBleGl0IiBpcyBv
ZmYuIEluIHN1Y2ggY2FzZSwgdGhlIGRlbGl2ZXJ5IGRvZXNuJ3QgaGFwcGVuIHVudGlsIEwxDQo+
ID4gaHlwZXJ2aXNvciBlbmFibGVzIGludGVycnVwdCB0byBjbGVhciBpbnRlcnJ1cHQgd2luZG93
LiBUaGVuIGl0IGRvZXMNCj4gPiBzYXZlIG9uZSBleGl0LiBUaGUgb25seSBib2d1cyBwb2ludCBp
cyB0aGF0IG52bXhfdWRwYXRlX2FwaWN2IGRvZXNuJ3QNCj4gPiBjaGVjayAiQWNrIGludGVycnVw
dCBvbiBleGl0Ii4gU28gSSBwcmVmZXIgdG8gYWRkIHN1Y2ggY2hlY2sgdGhlcmUNCj4gPiBpbnN0
ZWFkIG9mIGNvbXBsZXRlbHkgcmVtb3ZpbmcgdGhpcyBvcHRpbWl6YXRpb24uDQo+IA0KPiBSaWdo
dCwgaWYgIkFjayBpbnRlcnJ1cHQgb24gZXhpdCIgaXMgb2ZmIHRoZSBpbnRlcnJ1cHQgd2lsbCB0
cmlnZ2VyIGENCj4gdm1leGl0LCBidXQgaXQgd29uJ3QgYmUgYWNrZWQgYW5kIHRoZSB2bWV4aXQg
aW50ZXJydXB0IGluZm9ybWF0aW9uDQo+IHNob3VsZCBoYXZlIGJpdCAzMSBzZXQgdG8gMCwgd2hp
Y2ggSSB0aGluayB3ZSBkb24ndCBzZXQgY29ycmVjdGx5Lg0KPiANCj4gVGhlIEludGVsIFNETSBz
dGF0ZXM6DQo+IA0KPiAiRm9yIG90aGVyIFZNIGV4aXRzIChpbmNsdWRpbmcgdGhvc2UgZHVlIHRv
IGV4dGVybmFsIGludGVycnVwdHMgd2hlbg0KPiB0aGUg4oCcYWNrbm93bGVkZ2UgaW50ZXJydXB0
IG9uIGV4aXTigJ0gVk0tZXhpdCBjb250cm9sIGlzIDApLCB0aGUgZmllbGQNCj4gaXMgbWFya2Vk
IGludmFsaWQgKGJ5IGNsZWFyaW5nIGJpdCAzMSkgYW5kIHRoZSByZW1haW5kZXIgb2YgdGhlIGZp
ZWxkDQo+IGlzIHVuZGVmaW5lZC4iDQo+IA0KPiBBRkFJQ1Qgc3luY19leGNlcHRpb25fc3RhdGUg
YWxzbyBuZWVkcyB0byBjaGVjayBpZiBWTV9FWElUX0NPTlRST0xTDQo+IGhhcyBWTV9FWElUX0FD
S19JTlRSX09OX0VYSVQgc2V0LCBhbmQgb25seSBzZXQgVk1fRVhJVF9JTlRSX0lORk8gaW4NCj4g
dGhhdCBjYXNlLCBkbyB5b3UgYWdyZWU/DQo+IA0KDQpuaWNlIGNhdGNoLg0KDQpUaGFua3MNCktl
dmluDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
