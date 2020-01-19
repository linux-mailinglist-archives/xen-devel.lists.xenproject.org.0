Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14766141BF3
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2020 05:17:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1it1zd-0004IK-Jp; Sun, 19 Jan 2020 04:15:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxl7=3I=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1it1zc-0004Hn-7S
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2020 04:15:20 +0000
X-Inumbo-ID: 4770a58c-3a72-11ea-9fd7-bc764e2007e4
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4770a58c-3a72-11ea-9fd7-bc764e2007e4;
 Sun, 19 Jan 2020 04:15:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2020 20:15:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; d="scan'208";a="426412905"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jan 2020 20:15:08 -0800
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 20:15:07 -0800
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 20:15:07 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.202]) with mapi id 14.03.0439.000;
 Sun, 19 Jan 2020 12:15:05 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/2] nvmx: fix handling of interrupts
Thread-Index: AQHVxg/fbkeODa2AbkWncPoKamSpJafxcYCg
Date: Sun, 19 Jan 2020 04:15:04 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D739C38@SHSMSX104.ccr.corp.intel.com>
References: <20200108103857.77236-1-roger.pau@citrix.com>
 <20200108103857.77236-2-roger.pau@citrix.com>
In-Reply-To: <20200108103857.77236-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTExZWE2ZGUtNzhmYS00MWQ1LWFmYTUtNGE5YWUyNjY0ZGFmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR1hzcnJNUnAwd0o3dDJSKzhRODVZcFhjdkpEQmFabTVaWWpRUTR2RTJDalNaZjRhUlBhXC9GalVXbzgxOVlWXC9oIn0=
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIEphbnVhcnkgOCwgMjAyMCA2OjM5IFBNDQo+IA0KPiBXaGVuIGRvaW5nIGEgdmly
dHVhbCB2bWV4aXQgKGllOiBhIHZtZXhpdCBoYW5kbGVkIGJ5IHRoZSBMMSBWTU0pDQo+IGludGVy
cnVwdHMgc2hvdWxkbid0IGJlIGluamVjdGVkIHVzaW5nIHRoZSB2aXJ0dWFsIGludGVycnVwdCBk
ZWxpdmVyeQ0KPiBtZWNoYW5pc20sIGFuZCBpbnN0ZWFkIHNob3VsZCBiZSBzaWduYWxlZCBpbiB0
aGUgdm1jcyB1c2luZyB0aGUgZXhpdA0KPiByZWFzb24gYW5kIHRoZSBpbnRlcnJ1cHRpb24taW5m
b3JtYXRpb24gZmllbGQgaWYgdGhlICJBY2tub3dsZWRnZQ0KPiBpbnRlcnJ1cHQgb24gZXhpdCIg
dm1leGl0IGNvbnRyb2wgaXMgc2V0Lg0KPiANCj4gUmVtb3ZlIHRoZSBudm14X3VwZGF0ZV9hcGlj
diBoZWxwZXI6IGl0J3MgYm9ndXMgdG8gYXR0ZW1wdCB0byBpbmplY3QNCj4gaW50ZXJydXB0cyBv
biB2aXJ0dWFsIHZtZXhpdCB1c2luZyB0aGUgdmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnkNCj4g
YXNzaXN0YW5jZSwgYW5kIGl0J3MgYWxzbyBib2d1cyB0byBhY2sgaW50ZXJydXB0cyB3aXRob3V0
IGNoZWNraW5nIGlmDQo+IHRoZSB2bWV4aXQgIkFja25vd2xlZGdlIGludGVycnVwdCBvbiBleGl0
IiB2bWV4aXQgY29udHJvbCBpcyBzZXQuDQo+IG52bXhfaW50cl9pbnRlcmNlcHQgYWxyZWFkeSBo
YW5kbGVzIGludGVycnVwdHMgY29ycmVjdGx5IG9uIHZpcnR1YWwNCj4gdm1leGl0Lg0KPiANCj4g
Tm90ZSB0aGF0IHRoaXMgZml4ZXMgdGhlIHVzYWdlIG9mIHgyQVBJQyBieSB0aGUgTDEgVk1NLCBh
dCBsZWFzdCB3aGVuDQo+IHRoZSBMMSBWTU0gaXMgWGVuLg0KDQp3aGlsZSB0aGlzIGZpeCBtYWtl
cyBzZW5zZSB0byBtZSwgY2FuIHlvdSBhbHNvIHRlc3Qgb3RoZXIgTDEgVk1NcywNCnNvIHdlIGRv
bid0IG92ZXJsb29rIHNvbWUgb3RoZXIgaW50ZW50aW9ucyBjb3ZlcmVkIG9yIGhpZGRlbiBieQ0K
cmVtb3ZlZCBsb2dpYz8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jIHwgMzIgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZt
L3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMNCj4gaW5kZXggZDhhYjE2
N2Q2Mi4uYWY0OGIwYmVlZiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYw0KPiBAQCAtMTMxNiwzNSAr
MTMxNiw2IEBAIHN0YXRpYyB2b2lkIHN5bmNfZXhjZXB0aW9uX3N0YXRlKHN0cnVjdCB2Y3B1ICp2
KQ0KPiAgICAgIH0NCj4gIH0NCj4gDQo+IC1zdGF0aWMgdm9pZCBudm14X3VwZGF0ZV9hcGljdihz
dHJ1Y3QgdmNwdSAqdikNCj4gLXsNCj4gLSAgICBzdHJ1Y3QgbmVzdGVkdm14ICpudm14ID0gJnZj
cHVfMl9udm14KHYpOw0KPiAtICAgIHVuc2lnbmVkIGxvbmcgcmVhc29uID0gZ2V0X3Z2bWNzKHYs
IFZNX0VYSVRfUkVBU09OKTsNCj4gLSAgICB1aW50MzJfdCBpbnRyX2luZm8gPSBnZXRfdnZtY3Mo
diwgVk1fRVhJVF9JTlRSX0lORk8pOw0KPiAtDQo+IC0gICAgaWYgKCByZWFzb24gPT0gRVhJVF9S
RUFTT05fRVhURVJOQUxfSU5URVJSVVBUICYmDQo+IC0gICAgICAgICBudm14LT5pbnRyLnNvdXJj
ZSA9PSBodm1faW50c3JjX2xhcGljICYmDQo+IC0gICAgICAgICAoaW50cl9pbmZvICYgSU5UUl9J
TkZPX1ZBTElEX01BU0spICkNCj4gLSAgICB7DQo+IC0gICAgICAgIHVpbnQxNl90IHN0YXR1czsN
Cj4gLSAgICAgICAgdWludDMyX3QgcnZpLCBwcHI7DQo+IC0gICAgICAgIHVpbnQzMl90IHZlY3Rv
ciA9IGludHJfaW5mbyAmIDB4ZmY7DQo+IC0gICAgICAgIHN0cnVjdCB2bGFwaWMgKnZsYXBpYyA9
IHZjcHVfdmxhcGljKHYpOw0KPiAtDQo+IC0gICAgICAgIHZsYXBpY19hY2tfcGVuZGluZ19pcnEo
diwgdmVjdG9yLCAxKTsNCj4gLQ0KPiAtICAgICAgICBwcHIgPSB2bGFwaWNfc2V0X3Bwcih2bGFw
aWMpOw0KPiAtICAgICAgICBXQVJOX09OKChwcHIgJiAweGYwKSAhPSAodmVjdG9yICYgMHhmMCkp
Ow0KPiAtDQo+IC0gICAgICAgIHN0YXR1cyA9IHZlY3RvciA8PCBWTVhfR1VFU1RfSU5UUl9TVEFU
VVNfU1ZJX09GRlNFVDsNCj4gLSAgICAgICAgcnZpID0gdmxhcGljX2hhc19wZW5kaW5nX2lycSh2
KTsNCj4gLSAgICAgICAgaWYgKCBydmkgIT0gLTEgKQ0KPiAtICAgICAgICAgICAgc3RhdHVzIHw9
IHJ2aSAmIFZNWF9HVUVTVF9JTlRSX1NUQVRVU19TVUJGSUVMRF9CSVRNQVNLOw0KPiAtDQo+IC0g
ICAgICAgIF9fdm13cml0ZShHVUVTVF9JTlRSX1NUQVRVUywgc3RhdHVzKTsNCj4gLSAgICB9DQo+
IC19DQo+IC0NCj4gIHN0YXRpYyB2b2lkIHZpcnR1YWxfdm1leGl0KHN0cnVjdCBjcHVfdXNlcl9y
ZWdzICpyZWdzKQ0KPiAgew0KPiAgICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsNCj4gQEAg
LTEzOTMsOSArMTM2NCw2IEBAIHN0YXRpYyB2b2lkIHZpcnR1YWxfdm1leGl0KHN0cnVjdCBjcHVf
dXNlcl9yZWdzDQo+ICpyZWdzKQ0KPiAgICAgIC8qIHVwZGF0aW5nIGhvc3QgY3IwIHRvIHN5bmMg
VFMgYml0ICovDQo+ICAgICAgX192bXdyaXRlKEhPU1RfQ1IwLCB2LT5hcmNoLmh2bS52bXguaG9z
dF9jcjApOw0KPiANCj4gLSAgICBpZiAoIGNwdV9oYXNfdm14X3ZpcnR1YWxfaW50cl9kZWxpdmVy
eSApDQo+IC0gICAgICAgIG52bXhfdXBkYXRlX2FwaWN2KHYpOw0KPiAtDQo+ICAgICAgbnZjcHUt
Pm52X3Ztc3dpdGNoX2luX3Byb2dyZXNzID0gMDsNCj4gIH0NCj4gDQo+IC0tDQo+IDIuMjQuMQ0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
