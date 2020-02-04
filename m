Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F29151402
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 02:43:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iynBw-0002s3-8p; Tue, 04 Feb 2020 01:39:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Mmy=3Y=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iynBu-0002ry-EV
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 01:39:50 +0000
X-Inumbo-ID: 3ac32bc8-46ef-11ea-b211-bc764e2007e4
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ac32bc8-46ef-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 01:39:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 17:39:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="234939920"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga006.jf.intel.com with ESMTP; 03 Feb 2020 17:39:47 -0800
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 17:39:47 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 17:39:46 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.196]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 09:39:44 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/4] x86/vvmx: fix VM_EXIT_ACK_INTR_ON_EXIT handling
Thread-Index: AQHV2ow2w5AB7U8G70uHxyioBVvRGagKQnJQ
Date: Tue, 4 Feb 2020 01:39:44 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D765915@SHSMSX104.ccr.corp.intel.com>
References: <20200203121919.15748-1-roger.pau@citrix.com>
 <20200203121919.15748-3-roger.pau@citrix.com>
In-Reply-To: <20200203121919.15748-3-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZmU0OGMxODUtMzBmYi00OGQ2LTlkZTItOGNiMGZiZTBiOTVmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYUdIT2hxOU9yUDBZamdSbkl5dkYzM1VKSHZXZlJpeTVocXNnTXdXemtCUTJsRmhBcDhIeVRoQ2RhV1FkMzhuTyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/vvmx: fix
 VM_EXIT_ACK_INTR_ON_EXIT handling
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBN
b25kYXksIEZlYnJ1YXJ5IDMsIDIwMjAgODoxOSBQTQ0KPiANCj4gV2hlbiBWTV9FWElUX0FDS19J
TlRSX09OX0VYSVQgaXMgc2V0IGluIHRoZSB2bWV4aXQgY29udHJvbCB2bWNzDQoNCnNldC0+Y2xl
YXJlZA0KDQo+IHJlZ2lzdGVyIHRoZSBiaXQgMzEgb2YgVk1fRVhJVF9JTlRSX0lORk8gbXVzdCBi
ZSAwLCBpbiBvcmRlciB0byBkZW5vdGUNCj4gdGhhdCB0aGUgZmllbGQgZG9lc24ndCBjb250YWlu
IGFueSBpbnRlcnJ1cHQgaW5mb3JtYXRpb24uIFRoaXMgaXMgbm90DQo+IGN1cnJlbnRseSBhY2tu
b3dsZWRnZWQgYXMgdGhlIGZpZWxkIGFsd2F5cyBnZXQgZmlsbGVkIHdpdGggdmFsaWQNCj4gaW50
ZXJydXB0IGluZm9ybWF0aW9uLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgVk1fRVhJVF9BQ0tfSU5U
Ul9PTl9FWElUDQo+IGlzIHNldC4NCj4gDQo+IEZpeCB0aGlzIGFuZCBvbmx5IGZpbGwgVk1fRVhJ
VF9JTlRSX0lORk8gd2hlbiBWTV9FWElUX0FDS19JTlRSX09OX0VYSVQNCj4gaXMgbm90IHNldC4g
Tm90ZSB0aGF0IHRoaXMgcmVxdWlyZXMgb25lIG1pbm9yIGNoYW5nZSBpbg0KDQpub3Qgc2V0IC0+
IHNldA0KDQo+IG52bXhfdXBkYXRlX2FwaWN2IGluIG9yZGVyIHRvIG9idGFpbiB0aGUgaW50ZXJy
dXB0IGluZm9ybWF0aW9uIGZyb20NCj4gdGhlIGludGVybmFsIHN0YXRlIHJhdGhlciB0aGFuIHRo
ZSBuZXN0ZWQgdm1jcyByZWdpc3Rlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQp3aXRoIGFib3ZlIGZpeGVkLCANCg0KUmV2
aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiBD
aGFuZ2VzIHNpbmNlIHYxOg0KPiAgLSBOZXcgaW4gdGhpcyB2ZXJzaW9uLg0KPiAtLS0NCj4gIHhl
bi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyB8IDYgKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYw0KPiBp
bmRleCAzZDk3YTI5M2IyLi40N2VlZTFlNWI5IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL3ZteC92dm14LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jDQo+IEBA
IC0xMjgzLDYgKzEyODMsNyBAQCBzdGF0aWMgdm9pZCBsb2FkX3Z2bWNzX2hvc3Rfc3RhdGUoc3Ry
dWN0IHZjcHUgKnYpDQo+ICBzdGF0aWMgdm9pZCBzeW5jX2V4Y2VwdGlvbl9zdGF0ZShzdHJ1Y3Qg
dmNwdSAqdikNCj4gIHsNCj4gICAgICBzdHJ1Y3QgbmVzdGVkdm14ICpudm14ID0gJnZjcHVfMl9u
dm14KHYpOw0KPiArICAgIHVpbnQzMl90IGV4aXRfY3RybCA9IGdldF92dm1jcyh2LCBWTV9FWElU
X0NPTlRST0xTKTsNCj4gDQo+ICAgICAgaWYgKCAhKG52bXgtPmludHIuaW50cl9pbmZvICYgSU5U
Ul9JTkZPX1ZBTElEX01BU0spICkNCj4gICAgICAgICAgcmV0dXJuOw0KPiBAQCAtMTI5NCw3ICsx
Mjk1LDggQEAgc3RhdGljIHZvaWQgc3luY19leGNlcHRpb25fc3RhdGUoc3RydWN0IHZjcHUgKnYp
DQo+ICAgICAgICAgIHNldF92dm1jcyh2LCBWTV9FWElUX1JFQVNPTiwgRVhJVF9SRUFTT05fRVhU
RVJOQUxfSU5URVJSVVBUKTsNCj4gICAgICAgICAgc2V0X3Z2bWNzKHYsIEVYSVRfUVVBTElGSUNB
VElPTiwgMCk7DQo+ICAgICAgICAgIHNldF92dm1jcyh2LCBWTV9FWElUX0lOVFJfSU5GTywNCj4g
LSAgICAgICAgICAgICAgICAgICAgbnZteC0+aW50ci5pbnRyX2luZm8pOw0KPiArICAgICAgICAg
ICAgICAgICAgKGV4aXRfY3RybCAmIFZNX0VYSVRfQUNLX0lOVFJfT05fRVhJVCkgPyBudm14LT5p
bnRyLmludHJfaW5mbw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgOiAwKTsNCj4gICAgICAgICAgYnJlYWs7DQo+IA0KPiAgICAgIGNh
c2UgWDg2X0VWRU5UVFlQRV9IV19FWENFUFRJT046DQo+IEBAIC0xMzIwLDcgKzEzMjIsNyBAQCBz
dGF0aWMgdm9pZCBudm14X3VwZGF0ZV9hcGljdihzdHJ1Y3QgdmNwdSAqdikNCj4gIHsNCj4gICAg
ICBzdHJ1Y3QgbmVzdGVkdm14ICpudm14ID0gJnZjcHVfMl9udm14KHYpOw0KPiAgICAgIHVuc2ln
bmVkIGxvbmcgcmVhc29uID0gZ2V0X3Z2bWNzKHYsIFZNX0VYSVRfUkVBU09OKTsNCj4gLSAgICB1
aW50MzJfdCBpbnRyX2luZm8gPSBnZXRfdnZtY3ModiwgVk1fRVhJVF9JTlRSX0lORk8pOw0KPiAr
ICAgIHVpbnQzMl90IGludHJfaW5mbyA9IG52bXgtPmludHIuaW50cl9pbmZvOw0KPiANCj4gICAg
ICBpZiAoIHJlYXNvbiA9PSBFWElUX1JFQVNPTl9FWFRFUk5BTF9JTlRFUlJVUFQgJiYNCj4gICAg
ICAgICAgIG52bXgtPmludHIuc291cmNlID09IGh2bV9pbnRzcmNfbGFwaWMgJiYNCj4gLS0NCj4g
Mi4yNS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
