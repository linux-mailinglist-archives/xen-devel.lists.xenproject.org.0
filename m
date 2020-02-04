Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C650A1513FE
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 02:37:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyn7V-0002hb-IT; Tue, 04 Feb 2020 01:35:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Mmy=3Y=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iyn7U-0002hW-Im
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 01:35:16 +0000
X-Inumbo-ID: 9700d224-46ee-11ea-b211-bc764e2007e4
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9700d224-46ee-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 01:35:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 17:35:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="339651636"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2020 17:35:08 -0800
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 17:35:08 -0800
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 17:35:07 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.126]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 09:35:05 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 1/4] x86/vvmx: fix virtual interrupt injection when
 Ack on exit control is used
Thread-Index: AQHV2ow0m3vws6ZOxk+RY5iEaGwdxagKQScw
Date: Tue, 4 Feb 2020 01:35:05 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7658FC@SHSMSX104.ccr.corp.intel.com>
References: <20200203121919.15748-1-roger.pau@citrix.com>
 <20200203121919.15748-2-roger.pau@citrix.com>
In-Reply-To: <20200203121919.15748-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2ViZGFkOTktNmNjYS00YTE2LWI5NjYtYjZiM2RiYzZmMWJlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTjVvU1RRendzUzQzZW1JeFpcL2hTOHdNQVAwUXBxN3ZTcHVZQm5HYUE3b29wSFh3bjNWMm1vRG8zTjJzcEdBcWgifQ==
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBN
b25kYXksIEZlYnJ1YXJ5IDMsIDIwMjAgODoxOSBQTQ0KPiANCj4gV2hlbiBkb2luZyBhIHZpcnR1
YWwgdm1leGl0IChpZTogYSB2bWV4aXQgaGFuZGxlZCBieSB0aGUgTDEgVk1NKQ0KPiBpbnRlcnJ1
cHRzIHNob3VsZG4ndCBiZSBpbmplY3RlZCB1c2luZyB0aGUgdmlydHVhbCBpbnRlcnJ1cHQgZGVs
aXZlcnkNCj4gbWVjaGFuaXNtIHVubGVzcyB0aGUgQWNrIG9uIGV4aXQgdm1leGl0IGNvbnRyb2wg
Yml0IGlzbid0IHNldCBpbiB0aGUNCj4gbmVzdGVkIHZtY3MuDQo+IA0KPiBHYXRlIHRoZSBjYWxs
IHRvIG52bXhfdXBkYXRlX2FwaWN2IGhlbHBlciBvbiB3aGV0aGVyIHRoZSBuZXN0ZWQgdm1jcw0K
PiBoYXMgdGhlIEFjayBvbiBleGl0IGJpdCBzZXQgaW4gdGhlIHZtZXhpdCBjb250cm9sIGZpZWxk
Lg0KPiANCj4gTm90ZSB0aGF0IHRoaXMgZml4ZXMgdGhlIHVzYWdlIG9mIHgyQVBJQyBieSB0aGUg
TDEgVk1NLCBhdCBsZWFzdCB3aGVuDQo+IHRoZSBMMSBWTU0gaXMgWGVuLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmll
d2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4sIHdpdGggYSBzbWFsbCBj
b21tZW50Og0KDQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAgLSBDYWxsIG52bXhfdXBk
YXRlX2FwaWN2IGlmIHRoZSAiQWNrIG9uIGV4aXQiIHZtZXhpdCBjb250cm9sIGJpdA0KPiAgICBp
c24ndCBzZXQuDQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIHwgNyArKysr
KystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gv
eDg2L2h2bS92bXgvdnZteC5jDQo+IGluZGV4IGQ4YWIxNjdkNjIuLjNkOTdhMjkzYjIgMTAwNjQ0
DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYw0KPiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL3ZteC92dm14LmMNCj4gQEAgLTEzOTMsNyArMTM5MywxMiBAQCBzdGF0aWMgdm9pZCB2
aXJ0dWFsX3ZtZXhpdChzdHJ1Y3QgY3B1X3VzZXJfcmVncw0KPiAqcmVncykNCj4gICAgICAvKiB1
cGRhdGluZyBob3N0IGNyMCB0byBzeW5jIFRTIGJpdCAqLw0KPiAgICAgIF9fdm13cml0ZShIT1NU
X0NSMCwgdi0+YXJjaC5odm0udm14Lmhvc3RfY3IwKTsNCj4gDQo+IC0gICAgaWYgKCBjcHVfaGFz
X3ZteF92aXJ0dWFsX2ludHJfZGVsaXZlcnkgKQ0KPiArICAgIGlmICggY3B1X2hhc192bXhfdmly
dHVhbF9pbnRyX2RlbGl2ZXJ5ICYmDQo+ICsgICAgICAgICAvKg0KPiArICAgICAgICAgICogT25s
eSBpbmplY3QgdGhlIHZlY3RvciBpZiB0aGUgQWNrIG9uIGV4aXQgYml0IGlzIG5vdCBzZXQsIGVs
c2UgdGhlDQo+ICsgICAgICAgICAgKiBpbnRlcnJ1cHQgd2lsbCBiZSBzaWduYWxlZCBpbiB0aGUg
dm1jcyBWTV9FWElUX0lOVFJfSU5GTyBmaWVsZC4NCj4gKyAgICAgICAgICAqLw0KPiArICAgICAg
ICAgIShnZXRfdnZtY3ModiwgVk1fRVhJVF9DT05UUk9MUykgJiBWTV9FWElUX0FDS19JTlRSX09O
X0VYSVQpICkNCg0KSXQncyBhIGJpdCBvZGQgdG8gcHV0IGNvbW1lbnQgYmV0d2VlbiBjb2RlIGxp
bmVzLiBDYW4geW91IG1vdmUgaXQgdG8NCnRoZSBsaW5lIGJlZm9yZSAnaWYnPw0KDQo+ICAgICAg
ICAgIG52bXhfdXBkYXRlX2FwaWN2KHYpOw0KPiANCj4gICAgICBudmNwdS0+bnZfdm1zd2l0Y2hf
aW5fcHJvZ3Jlc3MgPSAwOw0KPiAtLQ0KPiAyLjI1LjANCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
