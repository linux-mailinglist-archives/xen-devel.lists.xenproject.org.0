Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE68F5E26F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 13:03:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hid1A-0001s3-V2; Wed, 03 Jul 2019 11:01:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yqyy=VA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hid18-0001ry-VV
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 11:01:39 +0000
X-Inumbo-ID: ecf3ad8a-9d81-11e9-b56e-7bdc8682a3da
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecf3ad8a-9d81-11e9-b56e-7bdc8682a3da;
 Wed, 03 Jul 2019 11:01:36 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FyVPC+DLA5inYplWL+/qNhOBihuYE06iCG7pMCIEbkZZMpJ41/xBm7E4p6PxEl/oLdyaMl63df
 1pcVpUa2kYow4tXf6OkKBTonRzfkN04QqgKjKKnDnrs8H4KyXkVCQ5ZC5jr/h//zvHnUZsI9R2
 +wSB57nBsn+UFi9BH9Io1NnJs7V4n/DFDjKsSx3rhGqnxn6Sem7ZUkrOF8/aMxoZ8B0tw5JyJi
 sucZtImdV9t3rRIakZ8CRYXwWOi0EyIsGw8tyU0m7Dt2V7wUP93e100Q77nf0KsWe2h+MTjwdP
 dWE=
X-SBRS: 2.7
X-MesageID: 2535344
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2535344"
Date: Wed, 3 Jul 2019 13:01:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190703110124.ejxkiiwtijrzf4qr@Air-de-Roger>
References: <20190703094322.1551-1-roger.pau@citrix.com>
 <00beccee-3e59-ed0d-23fc-6e24bacfcfaf@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00beccee-3e59-ed0d-23fc-6e24bacfcfaf@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/ept: pass correct level to
 p2m_entry_modify
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTA6MjI6MDNBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDcuMjAxOSAxMTo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gRVBU
IGRpZmZlcnMgZnJvbSBOUFQgYW5kIHNoYWRvdyB3aGVuIHRyYW5zbGF0aW5nIHBhZ2Ugb3JkZXJz
IHRvIGxldmVscwo+ID4gaW4gdGhlIHBoeXNtYXAgcGFnZSB0YWJsZXMuIEVQVCBwYWdlIHRhYmxl
cyBsZXZlbCBmb3Igb3JkZXIgMCBwYWdlcyBpcwo+ID4gMCwgd2hpbGUgTlBUIGFuZCBzaGFkb3cg
aW5zdGVhZCB1c2UgMSwgaWU6IEVQVCBwYWdlIHRhYmxlcyBsZXZlbHMKPiA+IHN0YXJ0cyBhdCAw
IHdoaWxlIE5QVCBhbmQgc2hhZG93IHN0YXJ0cyBhdCAxLgo+ID4gCj4gPiBGaXggdGhlIHAybV9l
bnRyeV9tb2RpZnkgY2FsbCBpbiBhdG9taWNfd3JpdGVfZXB0X2VudHJ5IHRvIGFsd2F5cyBhZGQK
PiA+IG9uZSB0byB0aGUgbGV2ZWwsIGluIG9yZGVyIHRvIG1hdGNoIE5QVCBhbmQgc2hhZG93IHVz
YWdlLgo+ID4gCj4gPiBXaGlsZSB0aGVyZSBhbHNvIGZpeCBwMm1fZW50cnlfbW9kaWZ5IEJVRyBj
b25kaXRpb24gdG8gdHJpZ2dlciB3aGVuCj4gPiBmb3JlaWduIG9yIGlvcmVxIGVudHJpZXMgd2l0
aCBsZXZlbCBkaWZmZXJlbnQgdGhhbiAwIGFyZSBhdHRlbXB0ZWQuCj4gPiBUaGF0IHNob3VsZCBh
bGxvdyB0byBjYXRjaCBmdXR1cmUgZXJyb3JzIHJlbGF0ZWQgdG8gdGhlIGxldmVsCj4gPiBwYXJh
bWV0ZXIuCj4gPiAKPiA+IEZpeGVzOiBjN2E0YzAgKCd4ODYvbW06IHNwbGl0IHAybSBpb3JlcSBz
ZXJ2ZXIgcGFnZXMgc3BlY2lhbCBoYW5kbGluZyBpbnRvIGhlbHBlcicpCj4gCj4gQSA2LWRpZ2l0
IGhhc2ggaXMgZGVmaW5pdGVseSB0b28gc2hvcnQgaW4gdGhlIGxvbmcgcnVuLiBJIHVuZGVyc3Rh
bmQKPiB0aGF0IHRoaXMgdGhlbiB3YW50cyBiYWNrcG9ydGluZyB0byB0aGUgNC4xMiB0cmVlLgoK
WWVzLgoKSXMgdGhlcmUgY29uc2Vuc3VzIG9uIGhvdyBtYW55IGRpZ2l0cyB0byB1c2UgOCwgMTIs
IDE2PwoKPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPiA+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvcDJtLmgKPiA+IEBAIC05NDYsNyArOTQ2LDcgQEAgc3RhdGljIGlubGlu
ZSBpbnQgcDJtX2VudHJ5X21vZGlmeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBwMm1fdHlwZV90
IG50LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3Qg
b3QsIG1mbl90IG5mbiwgbWZuX3Qgb2ZuLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBsZXZlbCkKPiA+ICAgewo+ID4gLSAgICBCVUdfT04obGV2
ZWwgPiAxICYmIChudCA9PSBwMm1faW9yZXFfc2VydmVyIHx8IG50ID09IHAybV9tYXBfZm9yZWln
bikpOwo+ID4gKyAgICBCVUdfT04obGV2ZWwgIT0gMSAmJiAobnQgPT0gcDJtX2lvcmVxX3NlcnZl
ciB8fCBudCA9PSBwMm1fbWFwX2ZvcmVpZ24pKTsKPiAKPiBXb3VsZG4ndCB5b3UgYmV0dGVyIGxl
YXZlIHRoaXMgYWxvbmUgYW5kIGFkZCBCVUdfT04oIWxldmVsKT8KClRoYXQncyBhbiBvcHRpb24g
YWxzby4gSSBndWVzcyB5b3VyIGNoZWNrIGlzIGJldHRlciBiZWNhdXNlIGl0IHdpbGwKdHJpZ2dl
ciBmb3IgYW55IGNhbGwgd2l0aCBsZXZlbCA9PSAwLCB3aGlsZSBtaW5lIHdvdWxkIG9ubHkgZG8g
aWYgc3VjaApjYWxsIGlzIGFsc28gdG8gYWRkIGFuIGVudHJ5IG9mIHR5cGUgaW9yZXEgb3IgZm9y
ZWlnbi4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
