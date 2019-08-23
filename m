Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B547E9A758
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 08:03:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i12at-00033M-1l; Fri, 23 Aug 2019 05:58:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VL6j=WT=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1i12ar-00033H-Hl
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 05:58:37 +0000
X-Inumbo-ID: 0b231582-c56b-11e9-ade3-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b231582-c56b-11e9-ade3-12813bfff9fa;
 Fri, 23 Aug 2019 05:58:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 22:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,420,1559545200"; d="scan'208";a="190835614"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga002.jf.intel.com with ESMTP; 22 Aug 2019 22:58:33 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 22:58:33 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 22:58:32 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.112]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.65]) with mapi id 14.03.0439.000;
 Fri, 23 Aug 2019 13:58:30 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] p2m/ept: pass correct level to atomic_write_ept_entry
 in ept_invalidate_emt
Thread-Index: AQHVV21KYt5E+rbt80WdY8+2XwwWeqcIQAQw
Date: Fri, 23 Aug 2019 05:58:29 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D545BBD@SHSMSX104.ccr.corp.intel.com>
References: <20190820153745.40103-1-roger.pau@citrix.com>
In-Reply-To: <20190820153745.40103-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2QzMDc0MjUtZjg5NS00MzU2LWI4NWQtNzIxZGZlNGI5ZDg0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSjdPcWN1SEE1ZVV0cmd2UitkSjNrcXdmVHhFMWxTT1dHeTVNWDVBb3hcL2o1YStwS3VVOHlINmpFVXFndFJaUk8ifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] p2m/ept: pass correct level to
 atomic_write_ept_entry in ept_invalidate_emt
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbV0NCj4g
U2VudDogVHVlc2RheSwgQXVndXN0IDIwLCAyMDE5IDExOjM4IFBNDQo+IA0KPiBUaGUgbGV2ZWwg
cGFzc2VkIHRvIGVwdF9pbnZhbGlkYXRlX2VtdCBjb3JyZXNwb25kcyB0byB0aGUgRVBUIGVudHJ5
DQo+IHBhc3NlZCBhcyB0aGUgbWZuIHBhcmFtZXRlciwgd2hpY2ggaXMgYSBwb2ludGVyIHRvIGFu
IEVQVCBwYWdlIHRhYmxlLA0KPiBoZW5jZSB0aGUgZW50cmllcyBpbiB0aGF0IHBhZ2UgdGFibGUg
d2lsbCBoYXZlIG9uZSBsZXZlbCBsZXNzIHRoYW4gdGhlDQo+IHBhcmVudC4NCj4gDQo+IEZpeCB0
aGUgY2FsbCB0byBhdG9taWNfd3JpdGVfZXB0X2VudHJ5IHRvIHBhc3MgdGhlIGNvcnJlY3QgbGV2
ZWwsIGllOg0KPiBvbmUgbGV2ZWwgbGVzcyB0aGFuIHRoZSBwYXJlbnQuDQo+IA0KPiBGaXhlczog
NTBmZTZlNzM3MDUgKCdwdmggZG9tMDogYWRkIGFuZCByZW1vdmUgZm9yZWlnbiBwYWdlcycpDQo+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0K
PiAtLS0NCj4gQ2M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4NCj4gQ2M6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPiBDYzogR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPg0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+IENjOiBTZXJnZXkgRHlhc2xpIDxzZXJn
ZXkuZHlhc2xpQGNpdHJpeC5jb20+DQo+IENjOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPg0KPiAtLS0NCj4gIHhlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgfCAyICstDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jIGIveGVuL2FyY2gveDg2L21tL3Ay
bS1lcHQuYw0KPiBpbmRleCA2Yjg0NjhjNzkzLi4yM2FlNmU5ZGEzIDEwMDY0NA0KPiAtLS0gYS94
ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0
LmMNCj4gQEAgLTM2Nyw3ICszNjcsNyBAQCBzdGF0aWMgYm9vbF90IGVwdF9pbnZhbGlkYXRlX2Vt
dChzdHJ1Y3QgcDJtX2RvbWFpbg0KPiAqcDJtLCBtZm5fdCBtZm4sDQo+ICAgICAgICAgIGUuZW10
ID0gTVRSUl9OVU1fVFlQRVM7DQo+ICAgICAgICAgIGlmICggcmVjYWxjICkNCj4gICAgICAgICAg
ICAgIGUucmVjYWxjID0gMTsNCj4gLSAgICAgICAgcmMgPSBhdG9taWNfd3JpdGVfZXB0X2VudHJ5
KHAybSwgJmVwdGVbaV0sIGUsIGxldmVsKTsNCj4gKyAgICAgICAgcmMgPSBhdG9taWNfd3JpdGVf
ZXB0X2VudHJ5KHAybSwgJmVwdGVbaV0sIGUsIGxldmVsIC0gMSk7DQo+ICAgICAgICAgIEFTU0VS
VChyYyA9PSAwKTsNCj4gICAgICAgICAgY2hhbmdlZCA9IDE7DQo+ICAgICAgfQ0KDQpSZXZpZXdl
ZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Lg0KDQpPbmUgc21hbGwgY29t
bWVudCBhYm91dCByZWFkYWJpbGl0eS4gV2hhdCBhYm91dCByZW5hbWluZyAnbGV2ZWwnDQp0byAn
cGFyZW50X2xldmVsJyBpbiB0aGlzIGZ1bmN0aW9uPw0KDQpUaGFua3MNCktldmluDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
