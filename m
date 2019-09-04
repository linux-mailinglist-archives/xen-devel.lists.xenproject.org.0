Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4378BA7C13
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 08:54:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5P8g-00051i-Vf; Wed, 04 Sep 2019 06:51:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NniL=W7=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1i5P8f-00051W-LF
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 06:51:33 +0000
X-Inumbo-ID: 6d54a06c-cee0-11e9-abab-12813bfff9fa
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d54a06c-cee0-11e9-abab-12813bfff9fa;
 Wed, 04 Sep 2019 06:51:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 23:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,465,1559545200"; d="scan'208";a="212275098"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2019 23:51:31 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 3 Sep 2019 23:51:30 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Sep 2019 23:51:30 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 3 Sep 2019 23:51:30 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.89]) with mapi id 14.03.0439.000;
 Wed, 4 Sep 2019 14:50:26 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [PATCH] p2m/ept: pass correct level to atomic_write_ept_entry
 in ept_invalidate_emt
Thread-Index: AQHVV21KYt5E+rbt80WdY8+2XwwWeqcIQAQwgAZhy4CAAtGfAIAJtPyg
Date: Wed, 4 Sep 2019 06:50:25 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D562422@SHSMSX104.ccr.corp.intel.com>
References: <20190820153745.40103-1-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D545BBD@SHSMSX104.ccr.corp.intel.com>
 <824ee21b-d9d9-434b-2125-25420cadfcea@suse.com>
 <20190829102620.6gut2dmpouynbj44@Air-de-Roger>
In-Reply-To: <20190829102620.6gut2dmpouynbj44@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDY3ODE2YjQtZjM2Ni00MmIzLTlhZjQtYjU1NDM4NGNlM2VjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiS3ZEcUtCdU1sNmNuVVU4eGVheEJCWVRFKzU3c0tLVjJqbHR3TUJ0amtZZ2RsT2xUcGhPbGROXC9aV2NGRnNOUEwifQ==
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5jb21dCj4g
U2VudDogVGh1cnNkYXksIEF1Z3VzdCAyOSwgMjAxOSA2OjI2IFBNCj4gCj4gT24gVHVlLCBBdWcg
MjcsIDIwMTkgYXQgMDU6MjM6MzNQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBPbiAy
My4wOC4yMDE5IDA3OjU4LCAgVGlhbiwgS2V2aW4gIHdyb3RlOgo+ID4gPiA+IEZyb206IFJvZ2Vy
IFBhdSBNb25uZSBbbWFpbHRvOnJvZ2VyLnBhdUBjaXRyaXguY29tXQo+ID4gPiA+IFNlbnQ6IFR1
ZXNkYXksIEF1Z3VzdCAyMCwgMjAxOSAxMTozOCBQTQo+ID4gPiA+Cj4gPiA+ID4gVGhlIGxldmVs
IHBhc3NlZCB0byBlcHRfaW52YWxpZGF0ZV9lbXQgY29ycmVzcG9uZHMgdG8gdGhlIEVQVCBlbnRy
eQo+ID4gPiA+IHBhc3NlZCBhcyB0aGUgbWZuIHBhcmFtZXRlciwgd2hpY2ggaXMgYSBwb2ludGVy
IHRvIGFuIEVQVCBwYWdlIHRhYmxlLAo+ID4gPiA+IGhlbmNlIHRoZSBlbnRyaWVzIGluIHRoYXQg
cGFnZSB0YWJsZSB3aWxsIGhhdmUgb25lIGxldmVsIGxlc3MgdGhhbiB0aGUKPiA+ID4gPiBwYXJl
bnQuCj4gPiA+ID4KPiA+ID4gPiBGaXggdGhlIGNhbGwgdG8gYXRvbWljX3dyaXRlX2VwdF9lbnRy
eSB0byBwYXNzIHRoZSBjb3JyZWN0IGxldmVsLCBpZToKPiA+ID4gPiBvbmUgbGV2ZWwgbGVzcyB0
aGFuIHRoZSBwYXJlbnQuCj4gPiA+ID4KPiA+ID4gPiBGaXhlczogNTBmZTZlNzM3MDUgKCdwdmgg
ZG9tMDogYWRkIGFuZCByZW1vdmUgZm9yZWlnbiBwYWdlcycpCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4gLS0tCj4g
PiA+ID4gQ2M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KPiA+ID4gPiBD
YzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4gPiA+ID4gQ2M6IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KPiA+ID4gPiBDYzogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gPiA+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+ID4gPiA+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4g
PiA+IENjOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Cj4gPiA+ID4g
Q2M6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gPiA+ID4gLS0tCj4g
PiA+ID4gICB4ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jIHwgMiArLQo+ID4gPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4KPiA+ID4gPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyBiL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0tZXB0LmMKPiA+ID4gPiBpbmRleCA2Yjg0NjhjNzkzLi4yM2FlNmU5ZGEzIDEwMDY0NAo+ID4g
PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMKPiA+ID4gPiArKysgYi94ZW4vYXJj
aC94ODYvbW0vcDJtLWVwdC5jCj4gPiA+ID4gQEAgLTM2Nyw3ICszNjcsNyBAQCBzdGF0aWMgYm9v
bF90IGVwdF9pbnZhbGlkYXRlX2VtdChzdHJ1Y3QKPiBwMm1fZG9tYWluCj4gPiA+ID4gKnAybSwg
bWZuX3QgbWZuLAo+ID4gPiA+ICAgICAgICAgICBlLmVtdCA9IE1UUlJfTlVNX1RZUEVTOwo+ID4g
PiA+ICAgICAgICAgICBpZiAoIHJlY2FsYyApCj4gPiA+ID4gICAgICAgICAgICAgICBlLnJlY2Fs
YyA9IDE7Cj4gPiA+ID4gLSAgICAgICAgcmMgPSBhdG9taWNfd3JpdGVfZXB0X2VudHJ5KHAybSwg
JmVwdGVbaV0sIGUsIGxldmVsKTsKPiA+ID4gPiArICAgICAgICByYyA9IGF0b21pY193cml0ZV9l
cHRfZW50cnkocDJtLCAmZXB0ZVtpXSwgZSwgbGV2ZWwgLSAxKTsKPiA+ID4gPiAgICAgICAgICAg
QVNTRVJUKHJjID09IDApOwo+ID4gPiA+ICAgICAgICAgICBjaGFuZ2VkID0gMTsKPiA+ID4gPiAg
ICAgICB9Cj4gPiA+Cj4gPiA+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4uCj4gPiA+Cj4gPiA+IE9uZSBzbWFsbCBjb21tZW50IGFib3V0IHJlYWRhYmlsaXR5
LiBXaGF0IGFib3V0IHJlbmFtaW5nICdsZXZlbCcKPiA+ID4gdG8gJ3BhcmVudF9sZXZlbCcgaW4g
dGhpcyBmdW5jdGlvbj8KPiA+Cj4gPiBBbmQgYWxzbyB0YWtpbmcgdGhlIG9wcG9ydHVuaXR5IGFu
ZCBtYWtpbmcgaXQgdW5zaWduZWQgaW50Pwo+IAo+IEkndmUgYmVlbiB0aGlua2luZyBhYm91dCB0
aGlzLCBhbmQgSSdtIG5vdCBzdXJlIHJlbmFtaW5nIGxldmVsIHRvCj4gcGFyZW50X2xldmVsIGlz
IGNvcnJlY3QsIGxldmVsIGFjdHVhbGx5IG1hdGNoZXMgdGhlIGxldmVsIG9mIHRoZSBtZm4KPiBh
bHNvIHBhc3NlZCBhcyBhIHBhcmFtZXRlciwgYW5kIGhlbmNlIGl0J3MgY29ycmVjdC4gSXQncyB0
aGUgZnVuY3Rpb24KPiBpdHNlbGYgdGhhdCBhY3R1YWxseSBpdGVyYXRlcyBvdmVyIHRoZSBwYWdl
IHRhYmxlIGVudHJpZXMsIGFuZCBoZW5jZQo+IGRlc2NlbmRzIG9uZSBsZXZlbCBpbnRvIHRoZSBw
YWdlIHRhYmxlcy4KPiAKPiBpZTogSSBjb3VsZCBhZGQgc29tZXRoaW5nIGxpa2UgQVNTRVJUKGxl
dmVsKSB0byBtYWtlIHN1cmUgbm8gbGV2ZWwgMAo+IGVudHJpZXMgYXJlIHBhc3NlZCB0byB0aGUg
ZnVuY3Rpb24sIGJ1dCByZW5hbWluZyBkb2Vzbid0IHNlZW0gY29ycmVjdAo+IHRvIG1lLgo+IAoK
VGhlIHByb2JsZW0gdG8gbWUgaXMgdGhhdCBpdCBpcyB2ZXJ5IG9ic2N1cmUgYWJvdXQgd2hhdCBh
ICdsZXZlbCcgYWN0dWFsbHkKbWVhbnMuIEFsdGhvdWdoIEkgZmlndXJlZCBpdCBvdXQgbGFzdCB0
aW1lIHdoZW4gcmV2aWV3aW5nIHRoaXMgcGF0Y2gsCm5vdyBJJ20gZ2V0dGluZyBjb25mdXNlZCBh
Z2FpbiB3aGVuIGxvb2tpbmcgYXQgcmVsYXRlZCBjb2RlLiBlLmcuLCB5b3UKbWludXMgbGV2ZWwg
Ynkgb25lIGluIHRoaXMgcGF0Y2ggd2hlbiBpbnZva2luZyBhdG9taWNfd3JpdGVfZXB0X2VudHJ5
LAp3aGlsZSB0aGUgbGF0dGVyIGluY3JlbWVudHMgdGhlIGxldmVsIGJ5IG9uZSB3aGVuIGludm9r
aW5nIHAybV9lbnRyeV8KbW9kaWZ5LiBUaGV5IGFyZSBhbGwgYWJvdXQgZW50cnkgdXBkYXRlIGFj
Y29yZGluZyB0byB0aGUgZnVuY3Rpb24gbmFtZSwKYnV0IGNsZWFybHkgdGhlIGxldmVsIG1lYW5z
IGRpZmZlcmVudCB0aGluZy4gOi8KCnNwZWNpZmljYWxseSBmb3IgdGhpcyBwYXRjaCwgbWF5YmUg
Y2FsbCBlcHRfaW52YWxpZGF0ZV9lbXRfc3VidHJlZSBjYW4KYWxzbyBpbXByb3ZlIHJlYWRhYmls
aXR5IGEgYml0LCBhbG9uZyB3aXRoIEFTU0VSVChsZXZlbCkgdGhpbmc/CgpUaGFua3MKS2V2aW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
