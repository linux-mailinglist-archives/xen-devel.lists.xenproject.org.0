Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148D7194EE9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 03:28:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHedC-00061c-8T; Fri, 27 Mar 2020 02:21:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WxMQ=5M=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jHedA-00061X-HS
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 02:21:56 +0000
X-Inumbo-ID: b96c0fd4-6fd1-11ea-88dc-12813bfff9fa
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b96c0fd4-6fd1-11ea-88dc-12813bfff9fa;
 Fri, 27 Mar 2020 02:21:54 +0000 (UTC)
IronPort-SDR: sECb7eq2eU5kXUS9rLl8ZQxUdFKkCLR1rjwRKzEtqVkK9VZnfL7wgAXGjJaSk0aijftSL5xxSi
 iZQjPDMAbjuA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 19:21:53 -0700
IronPort-SDR: /pcLYKxDy1B/wWTSjdd6GFthEBoJdEzpXLci1yB7ofEizDmi6Qk6LHk5254kXMzIi3HOCxE7p/
 AAiR124236WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,310,1580803200"; d="scan'208";a="447251243"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga005.fm.intel.com with ESMTP; 26 Mar 2020 19:21:53 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 19:21:53 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 19:21:52 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.155]) with mapi id 14.03.0439.000;
 Fri, 27 Mar 2020 10:21:47 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 3/4] x86/nvmx: split updating RVI from SVI in
 nvmx_update_apicv
Thread-Index: AQHWA4MmTXS8fSzNA0CbJez5z0l2xKhbtWKw
Date: Fri, 27 Mar 2020 02:21:46 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EC9E0@SHSMSX104.ccr.corp.intel.com>
References: <20200326152720.36970-1-roger.pau@citrix.com>
 <20200326152720.36970-4-roger.pau@citrix.com>
In-Reply-To: <20200326152720.36970-4-roger.pau@citrix.com>
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
Subject: Re: [Xen-devel] [PATCH v3 3/4] x86/nvmx: split updating RVI from
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

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBU
aHVyc2RheSwgTWFyY2ggMjYsIDIwMjAgMTE6MjcgUE0NCj4gDQo+IFVwZGF0aW5nIFNWSSBpcyBy
ZXF1aXJlZCB3aGVuIGFuIGludGVycnVwdCBoYXMgYmVlbiBpbmplY3RlZCB1c2luZyB0aGUNCj4g
QWNrIG9uIGV4aXQgVk1FWElUIGZlYXR1cmUsIHNvIHRoYXQgdGhlIGluIHNlcnZpY2UgaW50ZXJy
dXB0IGluIHRoZQ0KPiBHVUVTVF9JTlRSX1NUQVRVUyBtYXRjaGVzIHRoZSB2ZWN0b3IgdGhhdCBp
cyBzaWduYWxlZCBpbg0KPiBWTV9FWElUX0lOVFJfSU5GTy4NCj4gDQo+IFVwZGF0aW5nIFJWSSBo
b3dldmVyIGlzIG5vdCB0aWVkIHRvIHRoZSBBY2sgb24gZXhpdCBmZWF0dXJlLCBhcyBpdA0KPiBz
aWduYWxzIHRoZSBuZXh0IHZlY3RvciB0byBiZSBpbmplY3RlZCwgYW5kIGhlbmNlIHNob3VsZCBh
bHdheXMgYmUNCj4gdXBkYXRlZCB0byB0aGUgbmV4dCBwZW5kaW5nIHZlY3RvciwgcmVnYXJkbGVz
cyBvZiB3aGV0aGVyIEFjayBvbiBleGl0DQo+IGlzIGVuYWJsZWQuDQo+IA0KPiBXaGVuIG5vdCB1
c2luZyB0aGUgQWNrIG9uIGV4aXQgZmVhdHVyZSBwcmVzZXJ2ZSB0aGUgcHJldmlvdXMgdmVjdG9y
IGluDQo+IFNWSSwgc28gdGhhdCBpdCdzIG5vdCBsb3N0IHdoZW4gUlZJIGlzIHVwZGF0ZWQgdG8g
Y29udGFpbiB0aGUgcGVuZGluZw0KPiB2ZWN0b3IgdG8gaW5qZWN0Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmlld2Vk
LWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4sIHdpdGggb25lIHNtYWxsIGNv
bW1lbnQ6DQoNCj4gLS0tDQo+IENoYW5nZXMgc2luY2UgdjI6DQo+ICAtIFJldHVybiBlYXJseSBp
ZiB0aGUgZXhpdCByZWFzb24gIT0gRVhURVJOQUxfSU5URVJSVVBULg0KPiAgLSBSZWR1Y2UgdGhl
IG51bWJlciBvZiB2bXdyaXRlcyBieSBhY2N1bXVsYXRpbmcgdGhlIGNoYW5nZXMgdG8gYQ0KPiAg
ICBsb2NhbCB2YXJpYWJsZSB3aGljaCBpcyBmbHVzaGVkIGF0IHRoZSBlbmQgb2YgdGhlIGZ1bmN0
aW9uLg0KPiAgLSBBdHRlbXB0IHRvIHByZXNlcnZlIHRoZSBleGl0aW5nIFNWSSBpZiBBY2sgb24g
ZXhpdCBpcyBub3QgZW5hYmxlZC4NCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14
LmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXgu
Yw0KPiBpbmRleCAxNzUzMDA1YzkxLi4zOWZiNTUzNTkwIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3ZteC92dm14LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5j
DQo+IEBAIC0xMzg0LDI4ICsxMzg0LDQzIEBAIHN0YXRpYyB2b2lkIG52bXhfdXBkYXRlX2FwaWN2
KHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgIHN0cnVjdCBuZXN0ZWR2bXggKm52bXggPSAmdmNwdV8y
X252bXgodik7DQo+ICAgICAgdW5zaWduZWQgbG9uZyByZWFzb24gPSBnZXRfdnZtY3ModiwgVk1f
RVhJVF9SRUFTT04pOw0KPiAgICAgIHVuc2lnbmVkIGxvbmcgaW50cl9pbmZvID0gZ2V0X3Z2bWNz
KHYsIFZNX0VYSVRfSU5UUl9JTkZPKTsNCj4gKyAgICB1bnNpZ25lZCBsb25nIHN0YXR1czsNCj4g
KyAgICBpbnQgcnZpOw0KPiANCj4gLSAgICBpZiAoIHJlYXNvbiA9PSBFWElUX1JFQVNPTl9FWFRF
Uk5BTF9JTlRFUlJVUFQgJiYNCj4gLSAgICAgICAgIG52bXgtPmludHIuc291cmNlID09IGh2bV9p
bnRzcmNfbGFwaWMgJiYNCj4gKyAgICBpZiAoIHJlYXNvbiAhPSBFWElUX1JFQVNPTl9FWFRFUk5B
TF9JTlRFUlJVUFQgKQ0KPiArICAgICAgICByZXR1cm47DQoNCmNhbiB3ZSBhbHNvIGV4aXQgaWYg
c291cmNlIGlzIG5vdCBsYXBpYz8gYXMgd2UgZGlzY3Vzc2VkIGluIGFub3RoZXINCnRocmVhZCwg
dGhlIHdob2xlIGxvZ2ljIGhlcmUgaXMgb25seSBmb3IgbGFwaWMgbm90IG90aGVycy4uLg0KDQpU
aGFua3MNCktldmluDQoNCj4gKw0KPiArICAgIGlmICggbnZteC0+aW50ci5zb3VyY2UgPT0gaHZt
X2ludHNyY19sYXBpYyAmJg0KPiAgICAgICAgICAgKGludHJfaW5mbyAmIElOVFJfSU5GT19WQUxJ
RF9NQVNLKSApDQo+ICAgICAgew0KPiAtICAgICAgICB1aW50MTZfdCBzdGF0dXM7DQo+IC0gICAg
ICAgIHVpbnQzMl90IHJ2aSwgcHByOw0KPiAtICAgICAgICB1aW50MzJfdCB2ZWN0b3IgPSBpbnRy
X2luZm8gJiAweGZmOw0KPiArICAgICAgICB1aW50MzJfdCBwcHI7DQo+ICsgICAgICAgIHVuc2ln
bmVkIGludCB2ZWN0b3IgPSBpbnRyX2luZm8gJiBJTlRSX0lORk9fVkVDVE9SX01BU0s7DQo+ICAg
ICAgICAgIHN0cnVjdCB2bGFwaWMgKnZsYXBpYyA9IHZjcHVfdmxhcGljKHYpOw0KPiANCj4gKyAg
ICAgICAgLyoNCj4gKyAgICAgICAgICogVXBkYXRlIFNWSSB0byByZWNvcmQgdGhlIGN1cnJlbnQg
aW4gc2VydmljZSBpbnRlcnJ1cHQgdGhhdCdzDQo+ICsgICAgICAgICAqIHNpZ25hbGVkIGluIEVY
SVRfSU5UUl9JTkZPLg0KPiArICAgICAgICAgKi8NCj4gICAgICAgICAgdmxhcGljX2Fja19wZW5k
aW5nX2lycSh2LCB2ZWN0b3IsIDEpOw0KPiANCj4gICAgICAgICAgcHByID0gdmxhcGljX3NldF9w
cHIodmxhcGljKTsNCj4gICAgICAgICAgV0FSTl9PTigocHByICYgMHhmMCkgIT0gKHZlY3RvciAm
IDB4ZjApKTsNCj4gDQo+ICAgICAgICAgIHN0YXR1cyA9IHZlY3RvciA8PCBWTVhfR1VFU1RfSU5U
Ul9TVEFUVVNfU1ZJX09GRlNFVDsNCj4gLSAgICAgICAgcnZpID0gdmxhcGljX2hhc19wZW5kaW5n
X2lycSh2KTsNCj4gLSAgICAgICAgaWYgKCBydmkgIT0gLTEgKQ0KPiAtICAgICAgICAgICAgc3Rh
dHVzIHw9IHJ2aSAmIFZNWF9HVUVTVF9JTlRSX1NUQVRVU19TVUJGSUVMRF9CSVRNQVNLOw0KPiAr
ICAgIH0NCj4gKyAgICBlbHNlDQo+ICsgICAgICAgLyogS2VlcCBwcmV2aW91cyBTVkkgaWYgdGhl
cmUncyBhbnkuICovDQo+ICsgICAgICAgX192bXJlYWQoR1VFU1RfSU5UUl9TVEFUVVMsICZzdGF0
dXMpOw0KPiANCj4gLSAgICAgICAgX192bXdyaXRlKEdVRVNUX0lOVFJfU1RBVFVTLCBzdGF0dXMp
Ow0KPiArICAgIHJ2aSA9IHZsYXBpY19oYXNfcGVuZGluZ19pcnEodik7DQo+ICsgICAgaWYgKCBy
dmkgIT0gLTEgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgc3RhdHVzICY9IH5WTVhfR1VFU1RfSU5U
Ul9TVEFUVVNfU1VCRklFTERfQklUTUFTSw0KPiArICAgICAgICBzdGF0dXMgfD0gcnZpICYgVk1Y
X0dVRVNUX0lOVFJfU1RBVFVTX1NVQkZJRUxEX0JJVE1BU0s7DQo+ICAgICAgfQ0KPiArDQo+ICsg
ICAgaWYgKCBzdGF0dXMgKQ0KPiArICAgICAgICBfX3Ztd3JpdGUoR1VFU1RfSU5UUl9TVEFUVVMs
IHN0YXR1cyk7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQgdmlydHVhbF92bWV4aXQoc3RydWN0
IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+IC0tDQo+IDIuMjYuMA0KDQo=

