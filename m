Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CD018044B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 18:05:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBiHS-0003p8-CF; Tue, 10 Mar 2020 17:02:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBiHR-0003ou-DT
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 17:02:57 +0000
X-Inumbo-ID: fcdba5b0-62f0-11ea-adf5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcdba5b0-62f0-11ea-adf5-12813bfff9fa;
 Tue, 10 Mar 2020 17:02:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 78DFFB028;
 Tue, 10 Mar 2020 17:02:55 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e1435c3-8320-184b-d097-2a6db011e084@suse.com>
Date: Tue, 10 Mar 2020 18:02:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310072853.27567-4-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/6] xen: add
 process_pending_softirqs_norcu() for keyhandlers
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAwODoyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NvZnRpcnEuYwo+ICsrKyBiL3hlbi9jb21tb24vc29mdGlycS5jCj4gQEAgLTI1LDcgKzI1
LDcgQEAgc3RhdGljIHNvZnRpcnFfaGFuZGxlciBzb2Z0aXJxX2hhbmRsZXJzW05SX1NPRlRJUlFT
XTsKPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKGNwdW1hc2tfdCwgYmF0Y2hfbWFzayk7Cj4gIHN0
YXRpYyBERUZJTkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIGJhdGNoaW5nKTsKPiAgCj4gLXN0YXRp
YyB2b2lkIF9fZG9fc29mdGlycSh1bnNpZ25lZCBsb25nIGlnbm9yZV9tYXNrKQo+ICtzdGF0aWMg
dm9pZCBfX2RvX3NvZnRpcnEodW5zaWduZWQgbG9uZyBpZ25vcmVfbWFzaywgYm9vbCByY3VfYWxs
b3dlZCkKCldoeSB0aGUgc2VwYXJhdGUgYm9vbD8gQ2FuJ3QgeW91IC4uLgoKPiBAQCAtMzgsNyAr
MzgsNyBAQCBzdGF0aWMgdm9pZCBfX2RvX3NvZnRpcnEodW5zaWduZWQgbG9uZyBpZ25vcmVfbWFz
aykKPiAgICAgICAgICAgKi8KPiAgICAgICAgICBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4g
IAo+IC0gICAgICAgIGlmICggcmN1X3BlbmRpbmcoY3B1KSApCj4gKyAgICAgICAgaWYgKCByY3Vf
YWxsb3dlZCAmJiByY3VfcGVuZGluZyhjcHUpICkKCi4uLiBjaGVjayAhKGlnbm9yZV9tYXNrICYg
UkNVX1NPRlRJUlEpIGhlcmU/Cgo+IEBAIC01NSwxMyArNTUsMjIgQEAgdm9pZCBwcm9jZXNzX3Bl
bmRpbmdfc29mdGlycXModm9pZCkKPiAgewo+ICAgICAgQVNTRVJUKCFpbl9pcnEoKSAmJiBsb2Nh
bF9pcnFfaXNfZW5hYmxlZCgpKTsKPiAgICAgIC8qIERvIG5vdCBlbnRlciBzY2hlZHVsZXIgYXMg
aXQgY2FuIHByZWVtcHQgdGhlIGNhbGxpbmcgY29udGV4dC4gKi8KPiAtICAgIF9fZG9fc29mdGly
cSgoMXVsIDw8IFNDSEVEVUxFX1NPRlRJUlEpIHwgKDF1bCA8PCBTQ0hFRF9TTEFWRV9TT0ZUSVJR
KSk7Cj4gKyAgICBfX2RvX3NvZnRpcnEoKDF1bCA8PCBTQ0hFRFVMRV9TT0ZUSVJRKSB8ICgxdWwg
PDwgU0NIRURfU0xBVkVfU09GVElSUSksCj4gKyAgICAgICAgICAgICAgICAgdHJ1ZSk7Cj4gK30K
PiArCj4gK3ZvaWQgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzX25vcmN1KHZvaWQpCj4gK3sKPiAr
ICAgIEFTU0VSVCghaW5faXJxKCkgJiYgbG9jYWxfaXJxX2lzX2VuYWJsZWQoKSk7Cj4gKyAgICAv
KiBEbyBub3QgZW50ZXIgc2NoZWR1bGVyIGFzIGl0IGNhbiBwcmVlbXB0IHRoZSBjYWxsaW5nIGNv
bnRleHQuICovCj4gKyAgICBfX2RvX3NvZnRpcnEoKDF1bCA8PCBTQ0hFRFVMRV9TT0ZUSVJRKSB8
ICgxdWwgPDwgU0NIRURfU0xBVkVfU09GVElSUSkgfAo+ICsgICAgICAgICAgICAgICAgICgxdWwg
PDwgUkNVX1NPRlRJUlEpLCBmYWxzZSk7CgpJIGd1ZXNzIHRoZSBjb21tZW50IGhlcmUgYWxzbyB3
YW50cyB0byBtZW50aW9uIFJDVT8KCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L3BjaV9hbWRfaW9tbXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lf
YW1kX2lvbW11LmMKPiBAQCAtNTg3LDcgKzU4Nyw3IEBAIHN0YXRpYyB2b2lkIGFtZF9kdW1wX3Ay
bV90YWJsZV9sZXZlbChzdHJ1Y3QgcGFnZV9pbmZvKiBwZywgaW50IGxldmVsLAo+ICAgICAgICAg
IHN0cnVjdCBhbWRfaW9tbXVfcHRlICpwZGUgPSAmdGFibGVfdmFkZHJbaW5kZXhdOwo+ICAKPiAg
ICAgICAgICBpZiAoICEoaW5kZXggJSAyKSApCj4gLSAgICAgICAgICAgIHByb2Nlc3NfcGVuZGlu
Z19zb2Z0aXJxcygpOwo+ICsgICAgICAgICAgICBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXNfbm9y
Y3UoKTsKCkF0IHRoZSBleGFtcGxlIG9mIHRoaXMgLSB0aGUgcHJvcGVydHkgb2YgaG9sZGluZyBh
biBSQ1UgbG9jayBpcwplbnRpcmVseSBpbnZpc2libGUgaGVyZSwgYXMgaXQncyB0aGUgZ2VuZXJp
Ywppb21tdV9kdW1wX3AybV90YWJsZSgpIHdoaWNoIGFjcXVpcmVzIGl0LiBUaGlzIHN1Z2dlc3Qg
dG8gbWUgdGhhdApnb2luZyBmb3J3YXJkIGJyZWFraW5nIHRoaXMgaXMgZ29pbmcgdG8gYmUgdmVy
eSBsaWtlbHkuIENvdWxkbid0CnByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpIGV4Y2x1ZGUgUkNV
IGhhbmRsaW5nIHdoZW4gZmluZGluZwpwcmVlbXB0X2NvdW50KCkgdG8gcmV0dXJuIG5vbi16ZXJv
PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
