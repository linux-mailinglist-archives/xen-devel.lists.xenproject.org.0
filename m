Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6D5193BCF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:27:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOlB-0007Dh-L9; Thu, 26 Mar 2020 09:25:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ASzm=5L=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jHOl9-0007DZ-Ni
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:25:07 +0000
X-Inumbo-ID: abe3782c-6f43-11ea-a6c1-bc764e2007e4
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abe3782c-6f43-11ea-a6c1-bc764e2007e4;
 Thu, 26 Mar 2020 09:25:03 +0000 (UTC)
IronPort-SDR: 1A/ZHYHn1MroRDhwA3LMhgeAiEuM+lMiPhmQXaIcEYD7/phKc5sQ3ZxxOslGll/fTUG/Hv6sIu
 XYMJfWKGb99Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 02:25:02 -0700
IronPort-SDR: WmorfI8Ruc2T2ORAaHl+gebTBt/G2FCTHFQXN5HjYcASEsd+xdANQTLZjM4MM8MqpHkFIZEdps
 H2j2omrTibYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; d="scan'208";a="240628055"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga008.fm.intel.com with ESMTP; 26 Mar 2020 02:25:01 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 02:25:01 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 02:25:01 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.145]) with mapi id 14.03.0439.000;
 Thu, 26 Mar 2020 17:24:58 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 3/4] x86/nvmx: split updating RVI from SVI in
 nvmx_update_apicv
Thread-Index: AQHWAo7qr8KzyVer30G5VQBBtNVu16haLRfQ///nBACAAIbHcA==
Date: Thu, 26 Mar 2020 09:24:57 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EADB1@SHSMSX104.ccr.corp.intel.com>
References: <20200325101910.29168-1-roger.pau@citrix.com>
 <20200325101910.29168-4-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7EA780@SHSMSX104.ccr.corp.intel.com>
 <20200326091936.GJ28601@Air-de-Roger>
In-Reply-To: <20200326091936.GJ28601@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 3/4] x86/nvmx: split updating RVI from
 SVI in nvmx_update_apicv
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
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
VGh1cnNkYXksIE1hcmNoIDI2LCAyMDIwIDU6MjAgUE0NCj4gDQo+IE9uIFRodSwgTWFyIDI2LCAy
MDIwIGF0IDAzOjEzOjU2QU0gKzAwMDAsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+ID4gRnJvbTog
Um9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPiA+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMjUsIDIwMjAgNjoxOSBQTQ0KPiA+ID4NCj4gPiA+IFVwZGF0aW5nIFNWSSBp
cyByZXF1aXJlZCB3aGVuIGFuIGludGVycnVwdCBoYXMgYmVlbiBpbmplY3RlZCB1c2luZyB0aGUN
Cj4gPiA+IEFjayBvbiBleGl0IFZNRVhJVCBmZWF0dXJlLCBzbyB0aGF0IHRoZSBpbiBzZXJ2aWNl
IGludGVycnVwdCBpbiB0aGUNCj4gPiA+IEdVRVNUX0lOVFJfU1RBVFVTIG1hdGNoZXMgdGhlIHZl
Y3RvciB0aGF0IGlzIHNpZ25hbGVkIGluDQo+ID4gPiBWTV9FWElUX0lOVFJfSU5GTy4NCj4gPiA+
DQo+ID4gPiBVcGRhdGluZyBSVkkgaG93ZXZlciBpcyBub3QgdGllZCB0byB0aGUgQWNrIG9uIGV4
aXQgZmVhdHVyZSwgYXMgaXQNCj4gPiA+IHNpZ25hbHMgdGhlIG5leHQgdmVjdG9yIHRvIGJlIGlu
amVjdGVkLCBhbmQgaGVuY2Ugc2hvdWxkIGFsd2F5cyBiZQ0KPiA+ID4gdXBkYXRlZCB0byB0aGUg
bmV4dCBwZW5kaW5nIHZlY3RvciwgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIEFjayBvbiBleGl0DQo+
ID4gPiBpcyBlbmFibGVkLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgeGVuL2FyY2gv
eDg2L2h2bS92bXgvdnZteC5jIHwgMjIgKysrKysrKysrKysrKysrKystLS0tLQ0KPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4g
PiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMNCj4gYi94ZW4vYXJj
aC94ODYvaHZtL3ZteC92dm14LmMNCj4gPiA+IGluZGV4IDE3NTMwMDVjOTEuLjg0MzFjOTEyYTEg
MTAwNjQ0DQo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMNCj4gPiA+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYw0KPiA+ID4gQEAgLTEzODQsMjYgKzEzODQs
MzggQEAgc3RhdGljIHZvaWQgbnZteF91cGRhdGVfYXBpY3Yoc3RydWN0IHZjcHUNCj4gKnYpDQo+
ID4gPiAgICAgIHN0cnVjdCBuZXN0ZWR2bXggKm52bXggPSAmdmNwdV8yX252bXgodik7DQo+ID4g
PiAgICAgIHVuc2lnbmVkIGxvbmcgcmVhc29uID0gZ2V0X3Z2bWNzKHYsIFZNX0VYSVRfUkVBU09O
KTsNCj4gPiA+ICAgICAgdW5zaWduZWQgbG9uZyBpbnRyX2luZm8gPSBnZXRfdnZtY3ModiwgVk1f
RVhJVF9JTlRSX0lORk8pOw0KPiA+ID4gKyAgICBpbnQgcnZpOw0KPiA+ID4NCj4gPiA+ICAgICAg
aWYgKCByZWFzb24gPT0gRVhJVF9SRUFTT05fRVhURVJOQUxfSU5URVJSVVBUICYmDQo+ID4gPiAg
ICAgICAgICAgbnZteC0+aW50ci5zb3VyY2UgPT0gaHZtX2ludHNyY19sYXBpYyAmJg0KPiA+ID4g
ICAgICAgICAgIChpbnRyX2luZm8gJiBJTlRSX0lORk9fVkFMSURfTUFTSykgKQ0KPiA+ID4gICAg
ICB7DQo+ID4gPiAgICAgICAgICB1aW50MTZfdCBzdGF0dXM7DQo+ID4gPiAtICAgICAgICB1aW50
MzJfdCBydmksIHBwcjsNCj4gPiA+IC0gICAgICAgIHVpbnQzMl90IHZlY3RvciA9IGludHJfaW5m
byAmIDB4ZmY7DQo+ID4gPiArICAgICAgICB1aW50MzJfdCBwcHI7DQo+ID4gPiArICAgICAgICB1
bnNpZ25lZCBpbnQgdmVjdG9yID0gaW50cl9pbmZvICYgSU5UUl9JTkZPX1ZFQ1RPUl9NQVNLOw0K
PiA+ID4gICAgICAgICAgc3RydWN0IHZsYXBpYyAqdmxhcGljID0gdmNwdV92bGFwaWModik7DQo+
ID4gPg0KPiA+ID4gKyAgICAgICAgLyoNCj4gPiA+ICsgICAgICAgICAqIFVwZGF0ZSBTVkkgdG8g
cmVjb3JkIHRoZSBjdXJyZW50bHkgaW4gc2VydmljZSBpbnRlcnJ1cHQgdGhhdCdzDQo+ID4gPiAr
ICAgICAgICAgKiBzaWduYWxlZCBpbiBFWElUX0lOVFJfSU5GTy4NCj4gPiA+ICsgICAgICAgICAq
Lw0KPiA+ID4gICAgICAgICAgdmxhcGljX2Fja19wZW5kaW5nX2lycSh2LCB2ZWN0b3IsIDEpOw0K
PiA+ID4NCj4gPiA+ICAgICAgICAgIHBwciA9IHZsYXBpY19zZXRfcHByKHZsYXBpYyk7DQo+ID4g
PiAgICAgICAgICBXQVJOX09OKChwcHIgJiAweGYwKSAhPSAodmVjdG9yICYgMHhmMCkpOw0KPiA+
ID4NCj4gPiA+ICAgICAgICAgIHN0YXR1cyA9IHZlY3RvciA8PCBWTVhfR1VFU1RfSU5UUl9TVEFU
VVNfU1ZJX09GRlNFVDsNCj4gPiA+IC0gICAgICAgIHJ2aSA9IHZsYXBpY19oYXNfcGVuZGluZ19p
cnEodik7DQo+ID4gPiAtICAgICAgICBpZiAoIHJ2aSAhPSAtMSApDQo+ID4gPiAtICAgICAgICAg
ICAgc3RhdHVzIHw9IHJ2aSAmIFZNWF9HVUVTVF9JTlRSX1NUQVRVU19TVUJGSUVMRF9CSVRNQVNL
Ow0KPiA+ID4gKyAgICAgICAgX192bXdyaXRlKEdVRVNUX0lOVFJfU1RBVFVTLCBzdGF0dXMpOw0K
PiA+ID4gKyAgICB9DQo+ID4gPiArDQo+ID4gPiArICAgIHJ2aSA9IHZsYXBpY19oYXNfcGVuZGlu
Z19pcnEodik7DQo+ID4gPiArICAgIGlmICggcnZpICE9IC0xICkNCj4gPiA+ICsgICAgew0KPiA+
ID4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBzdGF0dXM7DQo+ID4gPg0KPiA+ID4gKyAgICAgICAg
X192bXJlYWQoR1VFU1RfSU5UUl9TVEFUVVMsICZzdGF0dXMpOw0KPiA+ID4gKyAgICAgICAgc3Rh
dHVzICY9IH5WTVhfR1VFU1RfSU5UUl9TVEFUVVNfU1VCRklFTERfQklUTUFTSzsNCj4gPiA+ICsg
ICAgICAgIHN0YXR1cyB8PSBydmkgJiBWTVhfR1VFU1RfSU5UUl9TVEFUVVNfU1VCRklFTERfQklU
TUFTSzsNCj4gPiA+ICAgICAgICAgIF9fdm13cml0ZShHVUVTVF9JTlRSX1NUQVRVUywgc3RhdHVz
KTsNCj4gPiA+ICAgICAgfQ0KPiA+DQo+ID4gSSBoYXZlIHR3byBtaW5vciBjb21tZW50cy4gRmly
c3QsIG9yaWdpbmFsIGNvZGUgcmVxdWlyZXMgb25seSBvbmUNCj4gPiBfX3Ztd3JpdGUgYnV0IG5v
dyBuZWVkcyB0d28gd3JpdGVzIGFuZCBvbmUgcmVhZCBmb3IgQWNrLW9uLWV4aXQNCj4gPiBpcyBz
ZXQuIENhbiB3ZSBvcHRpbWl6ZSB0byBzdXN0YWluIHRoZSBvcmlnaW5hbCBiZWhhdmlvcj8NCj4g
DQo+IEkgdGhpbmsgSSBjYW4gbWFuYWdlIHRvIGRvIGEgc2luZ2xlIHdyaXRlIGJ5IHVzaW5nIGEg
Z2xvYmFsIHN0YXR1cw0KPiB2YXJpYWJsZSBpbml0aWFsaXplZCB0byAwIGFuZCBvbmx5IGRvIHRo
ZSB2bXdyaXRlIGlmIHRoZSB2YWx1ZSBpcyAhPSAwDQo+IGJ5IHRoZSBlbmQgb2YgdGhlIGZ1bmN0
aW9uLg0KPiANCj4gPiBTZWNvbmQsDQo+ID4gYWx0aG91Z2ggSSBkaWRuJ3QgY29tZSB1cCBhIGNh
c2Ugd2hlcmUgYWx3YXlzIHVwZGF0aW5nIFJWSSAody8NCj4gPiBwZW5kaW5nIGludGVycnVwdCkg
bWF5IGJyaW5nIHNvbWUgYmFkIGVmZmVjdCwgaXQgaXMgYW55d2F5IHNhZmVyDQo+ID4gdG8gcHV0
IHRoZSB3aG9sZSBsb2dpYyB3aXRoaW4gdGhlIGNoZWNrIG9mIHZtZXhpdCByZWFzb24gYW5kIGlu
dHINCj4gPiBzb3VyY2UuDQo+IA0KPiBJIGFsc28gY29uc2lkZXJlZCB0aGlzIGFuZCBkZWNpZGVk
IHRoZXJlIHdhcyBubyBoYXJtIGluIGFsd2F5cw0KPiB1cGRhdGluZyBSVkkgaWYgdGhlcmUncyBh
IHBlbmRpbmcgaW50ZXJydXB0LCBpdCBjb3VsZCBldmVuIHByZXZlbnQgYQ0KPiBmdXR1cmUgVk1F
WElUIHRvIHVwZGF0ZSBSVkkgQUZBSUNUPw0KPiANCj4gSWYgeW91IHByZWZlciBJIGNhbiByZXR1
cm4gZWFybHkgZnJvbSB0aGUgZnVuY3Rpb24gaWYgcmVhc29uICE9DQo+IEVYSVRfUkVBU09OX0VY
VEVSTkFMX0lOVEVSUlVQVC4NCj4gDQoNCkkgYWdyZWUgd2l0aCB5b3VyIGJ1dCBnaXZlbiB0aGUg
dHJpY2tpbmVzcyBvZiBuZXN0ZWQgaW50ciBoYW5kbGluZw0KSSBwcmVmZXIgdG8gYSBtb3JlIGNv
bnNlcnZhdGl2ZSBidXQgc2FmZXIgYXBwcm9hY2guIFNvIHllcywgcmV0dXJuDQplYXJseSBzb3Vu
ZHMgZ29vZCBoZXJlLg0KDQpUaGFua3MNCktldmluDQoNCg==

