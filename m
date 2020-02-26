Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55CF16FC72
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:42:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6u6c-0004Go-94; Wed, 26 Feb 2020 10:39:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6u6a-0004Gj-2d
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 10:39:52 +0000
X-Inumbo-ID: 512d98e8-5884-11ea-8cb6-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 512d98e8-5884-11ea-8cb6-bc764e2007e4;
 Wed, 26 Feb 2020 10:39:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5150AAF84;
 Wed, 26 Feb 2020 10:39:50 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54@SHSMSX104.ccr.corp.intel.com>
 <b33cc365-6537-d816-8a89-eadd514a2427@suse.com>
 <20200226100937.GA24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75a795c2-4218-5e1a-7db8-4167e69fabca@suse.com>
Date: Wed, 26 Feb 2020 11:39:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226100937.GA24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vPMU: don't blindly assume
 IA32_PERF_CAPABILITIES MSR exists
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Chen, Farrah" <farrah.chen@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Gao,
 Chao" <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMTowOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAyNiwgMjAyMCBhdCAxMDoxOToxOUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSnVz
dCBsaWtlIFZNWCdlcyBsYnJfdHN4X2ZpeHVwX2NoZWNrKCkgdGhlIHJlc3BlY3RpdmUgQ1BVSUQg
Yml0IHNob3VsZAo+PiBiZSBjb25zdWx0ZWQgZmlyc3QuCj4+Cj4+IFJlcG9ydGVkLWJ5OiBGYXJy
YWggQ2hlbiA8ZmFycmFoLmNoZW5AaW50ZWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvdnBt
dV9pbnRlbC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9pbnRlbC5jCj4+IEBAIC05
MDAsNyArOTAwLDYgQEAgaW50IHZteF92cG11X2luaXRpYWxpc2Uoc3RydWN0IHZjcHUgKnYpCj4+
ICAKPj4gIGludCBfX2luaXQgY29yZTJfdnBtdV9pbml0KHZvaWQpCj4+ICB7Cj4+IC0gICAgdTY0
IGNhcHM7Cj4+ICAgICAgdW5zaWduZWQgaW50IHZlcnNpb24gPSAwOwo+PiAgICAgIHVuc2lnbmVk
IGludCBpOwo+PiAgCj4+IEBAIC05MzIsOCArOTMxLDE0IEBAIGludCBfX2luaXQgY29yZTJfdnBt
dV9pbml0KHZvaWQpCj4+ICAKPj4gICAgICBhcmNoX3BtY19jbnQgPSBjb3JlMl9nZXRfYXJjaF9w
bWNfY291bnQoKTsKPj4gICAgICBmaXhlZF9wbWNfY250ID0gY29yZTJfZ2V0X2ZpeGVkX3BtY19j
b3VudCgpOwo+PiAtICAgIHJkbXNybChNU1JfSUEzMl9QRVJGX0NBUEFCSUxJVElFUywgY2Fwcyk7
Cj4+IC0gICAgZnVsbF93aWR0aF93cml0ZSA9IChjYXBzID4+IDEzKSAmIDE7Cj4+ICsKPj4gKyAg
ICBpZiAoIGNwdV9oYXNfcGRjbSApCj4+ICsgICAgewo+PiArICAgICAgICB1aW50NjRfdCBjYXBz
Owo+PiArCj4+ICsgICAgICAgIHJkbXNybChNU1JfSUEzMl9QRVJGX0NBUEFCSUxJVElFUywgY2Fw
cyk7Cj4+ICsgICAgICAgIGZ1bGxfd2lkdGhfd3JpdGUgPSAoY2FwcyA+PiAxMykgJiAxOwo+IAo+
IFdpbGwgUE1VIHdvcmsgd2l0aG91dCBQRENNPwo+IAo+IEkndmUgYmVlbiBncmVwcGluZyB0aGUg
SW50ZWwgU0RNcywgYnV0IHRoZSBvbmx5IG1lbnRpb24gaXMgdGhhdCBQRENNCj4gc2lnbmFsIHRo
ZSBhdmFpbGFiaWxpdHkgb2YgTVNSX0lBMzJfUEVSRl9DQVBBQklMSVRJRVMuCgpXZWxsLCB0aGVy
ZSdzIG5vIG90aGVyIHVzZSBvZiB0aGUgTVNSIGFmYWljcyBleGNlcHQgZm9yIGdldHRpbmcKdGhl
IG9uZSBiaXQgaGVyZSwgc28gSSBhc3N1bWUgaXQnbGwgd29yay4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
