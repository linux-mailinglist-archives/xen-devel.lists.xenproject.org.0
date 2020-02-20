Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CAA166126
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 16:40:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4nu4-00022v-6a; Thu, 20 Feb 2020 15:38:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4nu2-00022n-Mb
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:38:14 +0000
X-Inumbo-ID: 01338d2a-53f7-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01338d2a-53f7-11ea-b0fd-bc764e2007e4;
 Thu, 20 Feb 2020 15:38:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 509FAB345;
 Thu, 20 Feb 2020 15:38:11 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-2-dwmw2@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c84d313-6e7f-338b-723f-e76865a16798@suse.com>
Date: Thu, 20 Feb 2020 16:38:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200201003303.2363081-2-dwmw2@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/8] x86/setup: Fix badpage= handling for
 memory above HYPERVISOR_VIRT_END
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDIuMjAyMCAwMTozMiwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IC0tLSBhL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiBAQCAt
MTc1OCw2ICsxNzU4LDE4IEBAIGludCBxdWVyeV9wYWdlX29mZmxpbmUobWZuX3QgbWZuLCB1aW50
MzJfdCAqc3RhdHVzKQo+ICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyB1bnNpZ25l
ZCBsb25nIGNvbnRpZ19hdmFpbF9wYWdlcyhzdHJ1Y3QgcGFnZV9pbmZvICpwZywgdW5zaWduZWQg
bG9uZyBtYXhfcGFnZXMpCj4gK3sKPiArICAgIHVuc2lnbmVkIGxvbmcgaTsKPiArCj4gKyAgICBm
b3IgKCBpID0gMCA7IGkgPCBtYXhfcGFnZXM7IGkrKykKCk5pdDogU3RyYXkgYmxhbmsgYmVmb3Jl
IGZpcnN0IHNlbWljb2xvbi4KCj4gKyAgICB7Cj4gKyAgICAgICAgaWYgKCBwZ1tpXS5jb3VudF9p
bmZvICYgUEdDX2Jyb2tlbiApCj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgfQo+ICsgICAg
cmV0dXJuIGk7CgpGdXJ0aGVyIG5pdHM6IENvbW1vbmx5IHdlIG9taXQgdGhlIGJyYWNlcyBpbiBj
YXNlcyBsaWtlIHRoaXMgb25lLgpXZSBhbHNvIGxpa2UgdG8gaGF2ZSBibGFuayBsaW5lcyBiZWZv
cmUgdGhlIG1haW4gcmV0dXJuIHN0YXRlbWVudApvZiBhIGZ1bmN0aW9uLgoKPiBAQCAtMTg0Niw2
ICsxODYzLDYzIEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGF2YWlsX2hlYXBfcGFnZXMoCj4gICAg
ICByZXR1cm4gZnJlZV9wYWdlczsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgbWFya19iYWRfcGFn
ZXModm9pZCkKCl9faW5pdCBwbGVhc2UKCj4gK3sKPiArICAgIHVuc2lnbmVkIGxvbmcgYmFkX3Nw
Zm4sIGJhZF9lcGZuOwo+ICsgICAgY29uc3QgY2hhciAqcDsKPiArICAgIHN0cnVjdCBwYWdlX2lu
Zm8gKnBnOwo+ICsjaWZkZWYgQ09ORklHX1g4Ngo+ICsgICAgY29uc3Qgc3RydWN0IHBsYXRmb3Jt
X2JhZF9wYWdlICpiYWRwYWdlOwo+ICsgICAgdW5zaWduZWQgaW50IGksIGosIGFycmF5X3NpemU7
Cj4gKwo+ICsgICAgYmFkcGFnZSA9IGdldF9wbGF0Zm9ybV9iYWRwYWdlcygmYXJyYXlfc2l6ZSk7
Cj4gKyAgICBpZiAoIGJhZHBhZ2UgKQo+ICsgICAgewo+ICsgICAgICAgIGZvciAoIGkgPSAwOyBp
IDwgYXJyYXlfc2l6ZTsgaSsrICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIGZvciAoIGog
PSAwOyBqIDwgMVVMIDw8IGJhZHBhZ2UtPm9yZGVyOyBqKysgKQoKRWl0aGVyIHlvdSBtZWFuIGJh
ZHBhZ2VbaV0uKiBoZXJlIGFuZCBiZWxvdywgb3IgeW91J3JlIG1pc3NpbmcgYW4KaW5jcmVtZW50
IG9mIGJhZHBhZ2Ugc29tZXdoZXJlLgoKPiArICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAg
ICAgaWYgKCBtZm5fdmFsaWQoX21mbihiYWRwYWdlLT5tZm4gKyBqKSkgKQo+ICsgICAgICAgICAg
ICAgICAgewo+ICsgICAgICAgICAgICAgICAgICAgIHBnID0gbWZuX3RvX3BhZ2UoX21mbihiYWRw
YWdlLT5tZm4gKyBqKSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgcGctPmNvdW50X2luZm8gfD0g
UEdDX2Jyb2tlbjsKPiArICAgICAgICAgICAgICAgICAgICBwYWdlX2xpc3RfYWRkX3RhaWwocGcs
ICZwYWdlX2Jyb2tlbl9saXN0KTsKPiArICAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAg
fQo+ICsgICAgICAgIH0KPiArICAgIH0KPiArI2VuZGlmCj4gKwo+ICsgICAgLyogQ2hlY2sgbmV3
IHBhZ2VzIGFnYWluc3QgdGhlIGJhZC1wYWdlIGxpc3QuICovCj4gKyAgICBwID0gb3B0X2JhZHBh
Z2U7Cj4gKyAgICB3aGlsZSAoICpwICE9ICdcMCcgKQo+ICsgICAgewo+ICsgICAgICAgIGJhZF9z
cGZuID0gc2ltcGxlX3N0cnRvdWwocCwgJnAsIDApOwo+ICsgICAgICAgIGJhZF9lcGZuID0gYmFk
X3NwZm47Cj4gKwo+ICsgICAgICAgIGlmICggKnAgPT0gJy0nICkKPiArICAgICAgICB7Cj4gKyAg
ICAgICAgICAgIHArKzsKPiArICAgICAgICAgICAgYmFkX2VwZm4gPSBzaW1wbGVfc3RydG91bChw
LCAmcCwgMCk7Cj4gKyAgICAgICAgICAgIGlmICggYmFkX2VwZm4gPCBiYWRfc3BmbiApCj4gKyAg
ICAgICAgICAgICAgICBiYWRfZXBmbiA9IGJhZF9zcGZuOwo+ICsgICAgICAgIH0KPiArCj4gKyAg
ICAgICAgaWYgKCAqcCA9PSAnLCcgKQo+ICsgICAgICAgICAgICBwKys7Cj4gKyAgICAgICAgZWxz
ZSBpZiAoICpwICE9ICdcMCcgKQo+ICsgICAgICAgICAgICBicmVhazsKCkkgdGhpbmsgdGhpcyBj
b21tb24gKHdpdGggaW5pdF9ib290X3BhZ2VzKCkpIHBhcnQgb2YgcGFyc2luZwp3b3VsZCBiZXR0
ZXIgYWJzdHJhY3RlZCBvdXQsIHN1Y2ggdGhlcmUgd2lsbCBiZSBqdXN0IG9uZQppbnN0YW5jZSBv
ZiwgYW5kIGhlbmNlIHRoZXJlJ3Mgbm8gcmlzayBvZiB0aGluZ3MgZ29pbmcgb3V0IG9mCnN5bmMu
Cgo+ICsgICAgICAgIHdoaWxlICggbWZuX3ZhbGlkKF9tZm4oYmFkX3NwZm4pKSAmJiBiYWRfc3Bm
biA8IGJhZF9lcGZuICkKCkFzIHBlciBpbml0X2Jvb3RfcGFnZXMoKSBhcyB3ZWxsIGFzIHBlciB0
aGUgImJhZF9lcGZuID0gYmFkX3NwZm47Igp5b3UgaGF2ZSBmdXJ0aGVyIHVwLCB0aGUgcmFuZ2Ug
aGVyZSBpcyBpbmNsdXNpdmUgYXQgaXRzIGVuZC4gSSdtCmFsc28gdW5jZXJ0YWluIGFib3V0IHRo
ZSBzdG9wcGluZyBhdCB0aGUgZmlyc3QgIW1mbl92YWxpZCgpIC0KdGhlcmUgbWF5IHdlbGwgYmUg
ZnVydGhlciB2YWxpZCBwYWdlcyBsYXRlciBvbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
