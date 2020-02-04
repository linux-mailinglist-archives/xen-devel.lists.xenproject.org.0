Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911351513FB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 02:36:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyn4l-0002ZW-2N; Tue, 04 Feb 2020 01:32:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Mmy=3Y=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iyn4j-0002ZR-Jo
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 01:32:25 +0000
X-Inumbo-ID: 313ca530-46ee-11ea-8eb4-12813bfff9fa
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 313ca530-46ee-11ea-8eb4-12813bfff9fa;
 Tue, 04 Feb 2020 01:32:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 17:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="254257092"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga004.fm.intel.com with ESMTP; 03 Feb 2020 17:32:21 -0800
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 17:32:21 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.97]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 09:31:57 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH 1/2] nvmx: fix handling of interrupts
Thread-Index: AQHVxg/fbkeODa2AbkWncPoKamSpJafxcYCggAFyWwCAAZn1sIADQiQAgBFcS5D//+NFgIABafAw
Date: Tue, 4 Feb 2020 01:31:57 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7658C7@SHSMSX104.ccr.corp.intel.com>
References: <20200108103857.77236-1-roger.pau@citrix.com>
 <20200108103857.77236-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739C38@SHSMSX104.ccr.corp.intel.com>
 <20200120101906.GW11756@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D73E81C@SHSMSX104.ccr.corp.intel.com>
 <20200123123154.GC57924@desktop-tdan49n.eng.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D75F802@SHSMSX104.ccr.corp.intel.com>
 <20200203115549.GT4679@Air-de-Roger>
In-Reply-To: <20200203115549.GT4679@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjU4NjM3YWYtYWE5MS00YTMyLTliYmEtYThiMGEyMDM1YWY2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiN1wvM0dLWGtrMzZCRDFUQ1wvQmZhbTNLdVNMeDJuZWxsVkRaeFJGa0RGd0l5QnBObk5jKzhJRXNEK2NHWG1ER0ZsIn0=
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
TW9uZGF5LCBGZWJydWFyeSAzLCAyMDIwIDc6NTYgUE0NCj4gDQo+IE9uIE1vbiwgRmViIDAzLCAy
MDIwIGF0IDA3OjI0OjA0QU0gKzAwMDAsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+ID4gRnJvbTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4gPiBTZW50OiBUaHVy
c2RheSwgSmFudWFyeSAyMywgMjAyMCA4OjMyIFBNDQo+ID4gPg0KPiA+ID4gT24gVHVlLCBKYW4g
MjEsIDIwMjAgYXQgMDM6MzQ6MTNBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4gPiA+
ID4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4gPiA+
ID4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDIwLCAyMDIwIDY6MTkgUE0NCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IE9uIFN1biwgSmFuIDE5LCAyMDIwIGF0IDA0OjE1OjA0QU0gKzAwMDAsIFRpYW4sIEtl
dmluIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPg0KPiA+ID4gPiA+ID4gPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgOCwg
MjAyMCA2OjM5IFBNDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFdoZW4gZG9pbmcgYSB2
aXJ0dWFsIHZtZXhpdCAoaWU6IGEgdm1leGl0IGhhbmRsZWQgYnkgdGhlIEwxIFZNTSkNCj4gPiA+
ID4gPiA+ID4gaW50ZXJydXB0cyBzaG91bGRuJ3QgYmUgaW5qZWN0ZWQgdXNpbmcgdGhlIHZpcnR1
YWwgaW50ZXJydXB0IGRlbGl2ZXJ5DQo+ID4gPiA+ID4gPiA+IG1lY2hhbmlzbSwgYW5kIGluc3Rl
YWQgc2hvdWxkIGJlIHNpZ25hbGVkIGluIHRoZSB2bWNzIHVzaW5nIHRoZQ0KPiBleGl0DQo+ID4g
PiA+ID4gPiA+IHJlYXNvbiBhbmQgdGhlIGludGVycnVwdGlvbi1pbmZvcm1hdGlvbiBmaWVsZCBp
ZiB0aGUgIkFja25vd2xlZGdlDQo+ID4gPiA+ID4gPiA+IGludGVycnVwdCBvbiBleGl0IiB2bWV4
aXQgY29udHJvbCBpcyBzZXQuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFJlbW92ZSB0
aGUgbnZteF91cGRhdGVfYXBpY3YgaGVscGVyOiBpdCdzIGJvZ3VzIHRvIGF0dGVtcHQgdG8NCj4g
aW5qZWN0DQo+ID4gPiA+ID4gPiA+IGludGVycnVwdHMgb24gdmlydHVhbCB2bWV4aXQgdXNpbmcg
dGhlIHZpcnR1YWwgaW50ZXJydXB0IGRlbGl2ZXJ5DQo+ID4gPiA+ID4gPiA+IGFzc2lzdGFuY2Us
IGFuZCBpdCdzIGFsc28gYm9ndXMgdG8gYWNrIGludGVycnVwdHMgd2l0aG91dCBjaGVja2luZyBp
Zg0KPiA+ID4gPiA+ID4gPiB0aGUgdm1leGl0ICJBY2tub3dsZWRnZSBpbnRlcnJ1cHQgb24gZXhp
dCIgdm1leGl0IGNvbnRyb2wgaXMgc2V0Lg0KPiA+ID4gPiA+ID4gPiBudm14X2ludHJfaW50ZXJj
ZXB0IGFscmVhZHkgaGFuZGxlcyBpbnRlcnJ1cHRzIGNvcnJlY3RseSBvbiB2aXJ0dWFsDQo+ID4g
PiA+ID4gPiA+IHZtZXhpdC4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gTm90ZSB0aGF0
IHRoaXMgZml4ZXMgdGhlIHVzYWdlIG9mIHgyQVBJQyBieSB0aGUgTDEgVk1NLCBhdCBsZWFzdA0K
PiB3aGVuDQo+ID4gPiA+ID4gPiA+IHRoZSBMMSBWTU0gaXMgWGVuLg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IHdoaWxlIHRoaXMgZml4IG1ha2VzIHNlbnNlIHRvIG1lLCBjYW4geW91IGFsc28g
dGVzdCBvdGhlciBMMSBWTU1zLA0KPiA+ID4gPiA+ID4gc28gd2UgZG9uJ3Qgb3Zlcmxvb2sgc29t
ZSBvdGhlciBpbnRlbnRpb25zIGNvdmVyZWQgb3IgaGlkZGVuIGJ5DQo+ID4gPiA+ID4gPiByZW1v
dmVkIGxvZ2ljPw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSBjb3VsZCB0ZXN0IG90aGVyIGh5cGVy
dmlzb3JzLCBidXQgZG8gd2UgcmVhbGx5IGV4cGVjdCBhbnl0aGluZw0KPiA+ID4gPiA+IHRoYXQn
cyBub3QgWGVuIG9uIFhlbiB0byB3b3JrPw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSdtIGFza2lu
ZyBiZWNhdXNlIHRoYXQncyB0aGUgb25seSBjb21iaW5hdGlvbiB0aGF0J3MgYWN0dWFsbHkgdGVz
dGVkDQo+ID4gPiA+ID4gYnkgb3NzdGVzdC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoYW5rcywg
Um9nZXIuDQo+ID4gPiA+DQo+ID4gPiA+IElmIG90aGVycyBhcmUgT0sgd2l0aCB5b3VyIGFzc3Vt
cHRpb24sIHRoZW4gaXQncyBmaW5lLiBJIGRpZG4ndCB0aWdodGx5DQo+ID4gPiA+IGZvbGxvdyB0
aGUgbmVzdGVkIHZpcnR1YWxpemF0aW9uIHJlcXVpcmVtZW50cyBpbiBYZW4uDQo+ID4gPiA+DQo+
ID4gPiA+IE9uIHRoZSBvdGhlciBoYW5kLCBJIHRoaW5rIHRoaXMgcGF0Y2ggbmVlZHMgYSByZXZp
c2lvbi4gSXQgaXMgbm90IGJvZ3VzDQo+ID4gPiA+IHRvIHVzZSB2aXJ0dWFsIGludGVycnVwdCBk
ZWxpdmVyeSBvbiB2aXJ0dWFsIFZNZXhpdCwgaWYgIkFjayBpbnRlcnJ1cHQNCj4gPiA+ID4gb24g
ZXhpdCIgaXMgb2ZmLiBJbiBzdWNoIGNhc2UsIHRoZSBkZWxpdmVyeSBkb2Vzbid0IGhhcHBlbiB1
bnRpbCBMMQ0KPiA+ID4gPiBoeXBlcnZpc29yIGVuYWJsZXMgaW50ZXJydXB0IHRvIGNsZWFyIGlu
dGVycnVwdCB3aW5kb3cuIFRoZW4gaXQgZG9lcw0KPiA+ID4gPiBzYXZlIG9uZSBleGl0LiBUaGUg
b25seSBib2d1cyBwb2ludCBpcyB0aGF0IG52bXhfdWRwYXRlX2FwaWN2IGRvZXNuJ3QNCj4gPiA+
ID4gY2hlY2sgIkFjayBpbnRlcnJ1cHQgb24gZXhpdCIuIFNvIEkgcHJlZmVyIHRvIGFkZCBzdWNo
IGNoZWNrIHRoZXJlDQo+ID4gPiA+IGluc3RlYWQgb2YgY29tcGxldGVseSByZW1vdmluZyB0aGlz
IG9wdGltaXphdGlvbi4NCj4gPiA+DQo+ID4gPiBJIHdlbnQgYmFjayBvdmVyIHRoaXMsIGFuZCBJ
J20gc3RpbGwgbm90IHN1cmUgY2FsbGluZw0KPiA+ID4gbnZteF91cGRhdGVfYXBpY3YgaXMgYWN0
dWFsbHkgcmVxdWlyZWQ6IEFGQUlDVCB2bXhfaW50cl9hc3Npc3Qgd2lsbA0KPiA+ID4gYWxyZWFk
eSBpbmplY3QgdGhlIGludGVycnVwdCBjb3JyZWN0bHkgdXNpbmcgdmlydHVhbCBpbnRlcnJ1cHQN
Cj4gPiA+IGRlbGl2ZXJ5IGlmIGxlZnQgcGVuZGluZyBvbiB0aGUgdmxhcGljLiBJIGd1ZXNzIHRo
ZSBjb2RlIGluDQo+ID4gPiBudm14X3VwZGF0ZV9hcGljdiBkb2Vzbid0IGh1cnQgYXMgbG9uZyBh
cyBpdCdzIGdhdGVkIG9uICJBY2sgb24gZXhpdCINCj4gPiA+IG5vdCBiZWluZyBlbmFibGVkLCBi
dXQgaXQncyBsaWtlbHkgcmVkdW5kYW50Lg0KPiA+DQo+ID4gSXQncyBub3QgcmVkdW5kYW50LiBJ
ZiB5b3UgbG9vayBhdCB0aGUgY29kZSBzZXF1ZW5jZSwgdm14X2ludHJfYXNzaXN0DQo+ID4gaXMg
aW52b2tlZCBiZWZvcmUgbnZteF9zd2l0Y2hfZ3Vlc3QuIEF0IHRoYXQgdGltZSwgdGhlIEwxIHZD
UFUgaXMgc3RpbGwNCj4gPiBpbiBuZXN0ZWQgZ3Vlc3QgbW9kZSwgdGhlcmVieSBudm14X2ludHJf
aW50ZXJjZXB0IHRha2VzIGVmZmVjdCB3aGljaA0KPiA+IGluamVjdHMgdGhlIHBlbmRpbmcgdmVj
dG9yIGludG8gdm1jczAyIGFuZCBieXBhc3NlcyB0aGUgcmVtYWluaW5nDQo+ID4gdmlydHVhbCBp
bnRlcnJ1cHQgZGVsaXZlcnkgbG9naWMgZm9yIHZtY3MwMS4gVGhhdCBpcyB0aGUgbWFpbiByZWFz
b24sIGltbywNCj4gPiB3aHkgbnZteF91cGRhdGVfYXBpY3YgaXMgaW50cm9kdWNlZC4NCj4gPg0K
PiA+IGlpdWMsIG52bXhfaW50cl9pbnRlcmNlcHQgYW5kIG52bXhfdXBkYXRlX2FwaWN2IHdvcmsg
dG9nZXRoZXIgdG8NCj4gPiBjb21wbGV0ZSBuZXN0ZWQgaW50ZXJydXB0IGluamVjdGlvbjoNCj4g
Pg0KPiA+ICgxKSBJZiAiQWNrIGludGVycnVwdCBvbiBleGl0IiBpcyBvbiwgdGhlIHBlbmRpbmcg
dmVjdG9yIGlzIGFja2VkIGJ5DQo+ID4gdGhlIGZvcm1lciBhbmQgZGVsaXZlcmVkIGluIHZ2bWV4
aXQgaW5mb3JtYXRpb24gZmllbGQuDQo+ID4gKDIpIElmICJBY2sgaW50ZXJydXB0IG9uIGV4aXQi
IGlzIG9mZiBhbmQgbm8gdmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnksDQo+ID4gbm8gYWNrIGFu
ZCBpbnRlcnJ1cHQgd2luZG93IGlzIGVuYWJsZWQgYnkgdGhlIGZvcm1lci4NCj4gPiAoMykgT3Ro
ZXJ3aXNlLCB0aGUgdmVjdG9yIGlzIGFja2VkIGJ5IHRoZSBsYXR0ZXIgYW5kIGRlbGl2ZXJlZCB0
aHJvdWdoDQo+ID4gdmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnkgKHdoZXJlIHZtY3MwMSBoYXMg
YmVlbiBzd2l0Y2hlZCBpbikuDQo+ID4NCj4gPiBIb3dldmVyLCB0aGVyZSBhcmUgdHdvIGlzc3Vl
cyBpbiBjdXJyZW50IGNvZGUuIE9uZSBpcyBhYm91dCAoMyksIGkuZS4sDQo+ID4gYXMgeW91IGlk
ZW50aWZpZWQgbnZteF91cGRhdGVfYXBpY3Ygc2hvdWxkbid0IGJsaW5kbHkgZW5hYmxlIHRoZQ0K
PiA+IG9wdGltaXphdGlvbiB3aXRob3V0IGNoZWNraW5nIHRoZSBBY2sgc2V0dGluZy4gdGhlIG90
aGVyIGlzIG5ldw0KPiA+IGFib3V0ICgyKSAtIGN1cnJlbnRseSBudm14X2ludHJfaW50ZXJydXB0
IGFsd2F5cyBlbmFibGVzIGludGVycnVwdA0KPiA+IHdpbmRvdyB3aGVuIHRoZSBBY2sgc2V0dGlu
ZyBpcyBvZmYsIHdoaWNoIGFjdHVhbGx5IG5lZ2F0ZXMgdGhlDQo+ID4gb3B0aW1pemF0aW9uIG9m
IG52bXhfdXBkYXRlX2FwaWN2LiBCb3RoIHNob3VsZCBiZSBmaXhlZC4NCj4gDQo+IE9LLCBJIHRo
aW5rIEkgZ290IGl0LiBJdCdzIGxpa2VseSBob3dldmVyIHRoYXQgdm14X2ludHJfYXNzaXN0IGlz
IGFsc28NCj4gY2FsbGVkIHdpdGggdGhlIHZtY3MgYWxyZWFkeSBzd2l0Y2hlZCB0byB2bWNzMDEg
KGlmIHRoZXJlJ3MgYSBwZW5kaW5nDQo+IHNvZnRpcnEgZm9yIGV4YW1wbGUpLCBJIGd1ZXNzIHZt
eF9pbnRyX2Fzc2lzdCBhbHNvIGNvcGVzIGNvcnJlY3RseQ0KPiB3aGVuIGNhbGxlZCB3aXRoIHRo
ZSB2bWNzIGFscmVhZHkgc3dpdGNoZWQ/DQo+IA0KDQpZZXMuIFdoYXQgSSBkZXNjcmliZWQgaXMg
Zm9yIHRoZSBjYXNlIHdpdGhvdXQgcGVuZGluZyBzb2Z0aXJxcy4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
