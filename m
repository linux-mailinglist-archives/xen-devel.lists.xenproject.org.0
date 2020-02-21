Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74305168460
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 18:05:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5Bh4-0004fn-D1; Fri, 21 Feb 2020 17:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5Bh3-0004fi-Cs
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 17:02:25 +0000
X-Inumbo-ID: 83be6d80-54cb-11ea-86b4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83be6d80-54cb-11ea-86b4-12813bfff9fa;
 Fri, 21 Feb 2020 16:59:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D4500ACBD;
 Fri, 21 Feb 2020 16:59:23 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-7-dwmw2@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3821a29a-7d60-c18b-71dd-12ed3c5b708d@suse.com>
Date: Fri, 21 Feb 2020 17:59:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200201003303.2363081-7-dwmw2@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 7/8] x86/setup: simplify handling of
 initrdidx when no initrd present
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

T24gMDEuMDIuMjAyMCAwMTozMywgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IEZyb206IERhdmlk
IFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4gUmVtb3ZlIGEgdGVybmFyeSBvcGVy
YXRvciB0aGF0IG1hZGUgbXkgYnJhaW4gaHVydC4KClBlcnNvbmFsbHkgSSdkIHByZWZlciB0aGUg
Y29kZSB0byBzdGF5IGFzIGlzLCBidXQgaWYgQW5kcmV3IGFncmVlcwp3aXRoIHRoaXMgYmVpbmcg
YW4gaW1wcm92ZW1lbnQsIHRoZW4gSSBhbHNvIHdvdWxkbid0IHdhbnQgdG8gc3RhbmQKaW4gdGhl
IHdheS4gSWYgaXQgaXMgdG8gZ28gaW4gSSBoYXZlIGEgZmV3IHNtYWxsIGFkanVzdG1lbnQgcmVx
dWVzdHM6Cgo+IFJlcGxhY2UgaXQgd2l0aCBzb21ldGhpbmcgc2ltcGxlciB0aGF0IG1ha2VzIGl0
IHNvbWV3aGF0IGNsZWFyZXIgdGhhdAo+IHRoZSBjaGVjayBmb3IgaW5pdHJkaWR4IDwgbWJpLT5t
b2RzX2NvdW50IGlzIGJlY2F1c2UgbWJpLT5tb2RzX2NvdW50Cj4gaXMgd2hhdCBmaW5kX2ZpcnN0
X2JpdCgpIHdpbGwgcmV0dXJuIHdoZW4gaXQgZG9lc24ndCBmaW5kIGFueXRoaW5nLgoKRXNwZWNp
YWxseSBpbiBsaWdodCBvZiB0aGUgcmVjZW50IFhTQS0zMDcgSSdkIGxpa2UgdG8gYXNrIHRoYXQg
d2UKYXZvaWQgaW1wcmVjaXNlIHN0YXRlbWVudHMgbGlrZSB0aGlzOiBBZmFpY3QgZmluZF9maXJz
dF9iaXQoKSBtYXkKYWxzbyB2YWxpZGx5IHJldHVybiBhbnkgdmFsdWUgbGFyZ2VyIHRoYW4gdGhl
IHBhc3NlZCBpbiBiaXRtYXAKbGVuZ3RoLgoKPiBAQCAtMTc5Myw2ICsxNzkzLDkgQEAgdm9pZCBf
X2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKPiAgICAgICAg
ICB4ZW5fcHJvY2Vzc29yX3BtYml0cyB8PSBYRU5fUFJPQ0VTU09SX1BNX0NYOwo+ICAKPiAgICAg
IGluaXRyZGlkeCA9IGZpbmRfZmlyc3RfYml0KG1vZHVsZV9tYXAsIG1iaS0+bW9kc19jb3VudCk7
Cj4gKyAgICBpZiAoIGluaXRyZGlkeCA8IG1iaS0+bW9kc19jb3VudCApCj4gKyAgICAgICAgaW5p
dHJkID0gbW9kICsgaW5pdHJkaWR4Owo+ICsKPiAgICAgIGlmICggYml0bWFwX3dlaWdodChtb2R1
bGVfbWFwLCBtYmktPm1vZHNfY291bnQpID4gMSApCj4gICAgICAgICAgcHJpbnRrKFhFTkxPR19X
QVJOSU5HCj4gICAgICAgICAgICAgICAgICJNdWx0aXBsZSBpbml0cmQgY2FuZGlkYXRlcywgcGlj
a2luZyBtb2R1bGUgIyV1XG4iLAoKU2luY2UgdGhpcyBpZigpIGlzIHRpZ2h0bHkgY291cGxlZCB3
aXRoIHRoZSBmaW5kX2ZpcnN0X2JpdCgpCmludm9jYXRpb24sIEknZCBsaWtlIHRvIGFzayBmb3Ig
dGhlcmUgdG8gbm90IGJlIGEgYmxhbmsgbGluZSBpbgpiZXR3ZWVuLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
