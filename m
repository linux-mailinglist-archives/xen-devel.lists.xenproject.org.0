Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BA519369E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 04:17:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHIy6-0008Bs-Ms; Thu, 26 Mar 2020 03:14:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ASzm=5L=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jHIy4-0008Bn-V7
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 03:14:04 +0000
X-Inumbo-ID: d705c3c2-6f0f-11ea-92cf-bc764e2007e4
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d705c3c2-6f0f-11ea-92cf-bc764e2007e4;
 Thu, 26 Mar 2020 03:14:01 +0000 (UTC)
IronPort-SDR: T7RErN87KDOnptKJHOFmDoij+uep+EKM3B7noHf2gE+zy2vjo0G0ZWSgodZ8fyLyOPE7zvGDiD
 MKGiyvVosyrQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 20:14:00 -0700
IronPort-SDR: 7SSGSjK3c/CPNrmsx4WOrEg6WYkckb36Vid2yh8bxFefBAnYT0SU7jZsiXkjtev4sc7J+ayblC
 l43hsxX/QFSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="446840341"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga005.fm.intel.com with ESMTP; 25 Mar 2020 20:14:00 -0700
Received: from fmsmsx122.amr.corp.intel.com (10.18.125.37) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Mar 2020 20:13:59 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx122.amr.corp.intel.com (10.18.125.37) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Mar 2020 20:13:59 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.232]) with mapi id 14.03.0439.000;
 Thu, 26 Mar 2020 11:13:56 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 3/4] x86/nvmx: split updating RVI from SVI in
 nvmx_update_apicv
Thread-Index: AQHWAo7qr8KzyVer30G5VQBBtNVu16haLRfQ
Date: Thu, 26 Mar 2020 03:13:56 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EA780@SHSMSX104.ccr.corp.intel.com>
References: <20200325101910.29168-1-roger.pau@citrix.com>
 <20200325101910.29168-4-roger.pau@citrix.com>
In-Reply-To: <20200325101910.29168-4-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIE1hcmNoIDI1LCAyMDIwIDY6MTkgUE0NCj4gDQo+IFVwZGF0aW5nIFNWSSBpcyBy
ZXF1aXJlZCB3aGVuIGFuIGludGVycnVwdCBoYXMgYmVlbiBpbmplY3RlZCB1c2luZyB0aGUNCj4g
QWNrIG9uIGV4aXQgVk1FWElUIGZlYXR1cmUsIHNvIHRoYXQgdGhlIGluIHNlcnZpY2UgaW50ZXJy
dXB0IGluIHRoZQ0KPiBHVUVTVF9JTlRSX1NUQVRVUyBtYXRjaGVzIHRoZSB2ZWN0b3IgdGhhdCBp
cyBzaWduYWxlZCBpbg0KPiBWTV9FWElUX0lOVFJfSU5GTy4NCj4gDQo+IFVwZGF0aW5nIFJWSSBo
b3dldmVyIGlzIG5vdCB0aWVkIHRvIHRoZSBBY2sgb24gZXhpdCBmZWF0dXJlLCBhcyBpdA0KPiBz
aWduYWxzIHRoZSBuZXh0IHZlY3RvciB0byBiZSBpbmplY3RlZCwgYW5kIGhlbmNlIHNob3VsZCBh
bHdheXMgYmUNCj4gdXBkYXRlZCB0byB0aGUgbmV4dCBwZW5kaW5nIHZlY3RvciwgcmVnYXJkbGVz
cyBvZiB3aGV0aGVyIEFjayBvbiBleGl0DQo+IGlzIGVuYWJsZWQuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+ICB4
ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCAyMiArKysrKysrKysrKysrKysrKy0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYv
aHZtL3ZteC92dm14LmMNCj4gaW5kZXggMTc1MzAwNWM5MS4uODQzMWM5MTJhMSAxMDA2NDQNCj4g
LS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9o
dm0vdm14L3Z2bXguYw0KPiBAQCAtMTM4NCwyNiArMTM4NCwzOCBAQCBzdGF0aWMgdm9pZCBudm14
X3VwZGF0ZV9hcGljdihzdHJ1Y3QgdmNwdSAqdikNCj4gICAgICBzdHJ1Y3QgbmVzdGVkdm14ICpu
dm14ID0gJnZjcHVfMl9udm14KHYpOw0KPiAgICAgIHVuc2lnbmVkIGxvbmcgcmVhc29uID0gZ2V0
X3Z2bWNzKHYsIFZNX0VYSVRfUkVBU09OKTsNCj4gICAgICB1bnNpZ25lZCBsb25nIGludHJfaW5m
byA9IGdldF92dm1jcyh2LCBWTV9FWElUX0lOVFJfSU5GTyk7DQo+ICsgICAgaW50IHJ2aTsNCj4g
DQo+ICAgICAgaWYgKCByZWFzb24gPT0gRVhJVF9SRUFTT05fRVhURVJOQUxfSU5URVJSVVBUICYm
DQo+ICAgICAgICAgICBudm14LT5pbnRyLnNvdXJjZSA9PSBodm1faW50c3JjX2xhcGljICYmDQo+
ICAgICAgICAgICAoaW50cl9pbmZvICYgSU5UUl9JTkZPX1ZBTElEX01BU0spICkNCj4gICAgICB7
DQo+ICAgICAgICAgIHVpbnQxNl90IHN0YXR1czsNCj4gLSAgICAgICAgdWludDMyX3QgcnZpLCBw
cHI7DQo+IC0gICAgICAgIHVpbnQzMl90IHZlY3RvciA9IGludHJfaW5mbyAmIDB4ZmY7DQo+ICsg
ICAgICAgIHVpbnQzMl90IHBwcjsNCj4gKyAgICAgICAgdW5zaWduZWQgaW50IHZlY3RvciA9IGlu
dHJfaW5mbyAmIElOVFJfSU5GT19WRUNUT1JfTUFTSzsNCj4gICAgICAgICAgc3RydWN0IHZsYXBp
YyAqdmxhcGljID0gdmNwdV92bGFwaWModik7DQo+IA0KPiArICAgICAgICAvKg0KPiArICAgICAg
ICAgKiBVcGRhdGUgU1ZJIHRvIHJlY29yZCB0aGUgY3VycmVudGx5IGluIHNlcnZpY2UgaW50ZXJy
dXB0IHRoYXQncw0KPiArICAgICAgICAgKiBzaWduYWxlZCBpbiBFWElUX0lOVFJfSU5GTy4NCj4g
KyAgICAgICAgICovDQo+ICAgICAgICAgIHZsYXBpY19hY2tfcGVuZGluZ19pcnEodiwgdmVjdG9y
LCAxKTsNCj4gDQo+ICAgICAgICAgIHBwciA9IHZsYXBpY19zZXRfcHByKHZsYXBpYyk7DQo+ICAg
ICAgICAgIFdBUk5fT04oKHBwciAmIDB4ZjApICE9ICh2ZWN0b3IgJiAweGYwKSk7DQo+IA0KPiAg
ICAgICAgICBzdGF0dXMgPSB2ZWN0b3IgPDwgVk1YX0dVRVNUX0lOVFJfU1RBVFVTX1NWSV9PRkZT
RVQ7DQo+IC0gICAgICAgIHJ2aSA9IHZsYXBpY19oYXNfcGVuZGluZ19pcnEodik7DQo+IC0gICAg
ICAgIGlmICggcnZpICE9IC0xICkNCj4gLSAgICAgICAgICAgIHN0YXR1cyB8PSBydmkgJiBWTVhf
R1VFU1RfSU5UUl9TVEFUVVNfU1VCRklFTERfQklUTUFTSzsNCj4gKyAgICAgICAgX192bXdyaXRl
KEdVRVNUX0lOVFJfU1RBVFVTLCBzdGF0dXMpOw0KPiArICAgIH0NCj4gKw0KPiArICAgIHJ2aSA9
IHZsYXBpY19oYXNfcGVuZGluZ19pcnEodik7DQo+ICsgICAgaWYgKCBydmkgIT0gLTEgKQ0KPiAr
ICAgIHsNCj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBzdGF0dXM7DQo+IA0KPiArICAgICAgICBf
X3ZtcmVhZChHVUVTVF9JTlRSX1NUQVRVUywgJnN0YXR1cyk7DQo+ICsgICAgICAgIHN0YXR1cyAm
PSB+Vk1YX0dVRVNUX0lOVFJfU1RBVFVTX1NVQkZJRUxEX0JJVE1BU0s7DQo+ICsgICAgICAgIHN0
YXR1cyB8PSBydmkgJiBWTVhfR1VFU1RfSU5UUl9TVEFUVVNfU1VCRklFTERfQklUTUFTSzsNCj4g
ICAgICAgICAgX192bXdyaXRlKEdVRVNUX0lOVFJfU1RBVFVTLCBzdGF0dXMpOw0KPiAgICAgIH0N
Cg0KSSBoYXZlIHR3byBtaW5vciBjb21tZW50cy4gRmlyc3QsIG9yaWdpbmFsIGNvZGUgcmVxdWly
ZXMgb25seSBvbmUNCl9fdm13cml0ZSBidXQgbm93IG5lZWRzIHR3byB3cml0ZXMgYW5kIG9uZSBy
ZWFkIGZvciBBY2stb24tZXhpdA0KaXMgc2V0LiBDYW4gd2Ugb3B0aW1pemUgdG8gc3VzdGFpbiB0
aGUgb3JpZ2luYWwgYmVoYXZpb3I/IFNlY29uZCwNCmFsdGhvdWdoIEkgZGlkbid0IGNvbWUgdXAg
YSBjYXNlIHdoZXJlIGFsd2F5cyB1cGRhdGluZyBSVkkgKHcvDQpwZW5kaW5nIGludGVycnVwdCkg
bWF5IGJyaW5nIHNvbWUgYmFkIGVmZmVjdCwgaXQgaXMgYW55d2F5IHNhZmVyDQp0byBwdXQgdGhl
IHdob2xlIGxvZ2ljIHdpdGhpbiB0aGUgY2hlY2sgb2Ygdm1leGl0IHJlYXNvbiBhbmQgaW50ciAN
CnNvdXJjZS4NCg0KVGhhbmtzDQpLZXZpbg0K

