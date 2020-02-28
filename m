Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA9B173327
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 09:44:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7bD9-00046K-QE; Fri, 28 Feb 2020 08:41:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7bD8-00046F-MY
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 08:41:30 +0000
X-Inumbo-ID: 1d3c2ff8-5a06-11ea-b0f0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d3c2ff8-5a06-11ea-b0f0-bc764e2007e4;
 Fri, 28 Feb 2020 08:41:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A1CA5AD12;
 Fri, 28 Feb 2020 08:41:28 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200227184602.28282-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a55cd17-e006-ea81-0242-7a982aa89861@suse.com>
Date: Fri, 28 Feb 2020 09:41:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227184602.28282-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/grant: Fix signed/unsigned comparisons
 issues
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDIuMjAyMCAxOTo0NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBFYWNoIGZ1bmN0aW9u
IHRha2VzIGFuIHVuc2lnbmVkIGNvdW50LCBhbmQgbG9vcHMgYmFzZWQgb24gYSBzaWduZWQgaS4g
IFRoaXMKPiBjYXVzZXMgcHJvYmxlbXMgd2hlbiBiZXR3ZWVuIDIgYW5kIDQgYmlsbGlvbiBvcGVy
YXRpb25zIGFyZSByZXF1ZXN0ZWQuCgpJIGNhbiBzZWUgcHJvYmxlbXMsIGJ1dCBub3QgKGFzIHRo
ZSB0aXRsZSBzYXlzKSB3aXRoIGNvbXBhcmlzb24gaXNzdWVzCih0aGUgc2lnbmVkIGkgZ2V0cyBj
b252ZXJ0ZWQgdG8gdW5zaWduZWQgZm9yIHRoZSBwdXJwb3NlIG9mIHRoZQpjb21wYXJpc29uKS4K
Cj4gSW4gcHJhY3RpY2UsIHNpZ25lZC1uZXNzIGlzc3VlcyBhcmVuJ3QgcG9zc2libGUgYmVjYXVz
ZSBjb3VudCBleGNlZWRpbmcKPiBJTlRfTUFYIGlzIGV4Y2x1ZGVkIGVhcmxpZXIgaW4gZG9fZ3Jh
bnRfb3AoKSwgYnV0IHRoZSBjb2RlIHJlYWRzIGFzIGlmIGl0IGlzCj4gYnVnZ3ksIGFuZCBHQ0Mg
b2J2aW91c2x5IGNhbid0IHNwb3QgdGhpcyBlaXRoZXIuCj4gCj4gQmxvYXQtby1tZXRlciByZXBv
cnRzOgo+ICAgYWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAwLzQgdXAvZG93bjogMC8tOTUg
KC05NSkKPiAgIEZ1bmN0aW9uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9s
ZCAgICAgbmV3ICAgZGVsdGEKPiAgIGRvX2dyYW50X3RhYmxlX29wICAgICAgICAgICAgICAgICAg
ICAgICAgICAgNzE1NSAgICA3MTQwICAgICAtMTUKPiAgIGdudHRhYl90cmFuc2ZlciAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMjczMiAgICAyNzE2ICAgICAtMTYKPiAgIGdudHRhYl91bm1h
cF9ncmFudF9yZWYgICAgICAgICAgICAgICAgICAgICAgIDc3MSAgICAgNzM5ICAgICAtMzIKPiAg
IGdudHRhYl91bm1hcF9hbmRfcmVwbGFjZSAgICAgICAgICAgICAgICAgICAgIDc3MSAgICAgNzM5
ICAgICAtMzIKPiAgIFRvdGFsOiBCZWZvcmU9Mjk5NjM2NCwgQWZ0ZXI9Mjk5NjI2OSwgY2hnIC0w
LjAwJQo+IAo+IGFuZCBpbnNwZWN0aW9uIG9mIGdudHRhYl91bm1hcF9ncmFudF9yZWYoKSBhdCBs
ZWFzdCByZXZlYWxzIG9uZSBmZXdlciBsb2NhbAo+IHZhcmlhYmxlcyBvbiB0aGUgc3RhY2suCgpU
aGlzIGlzIGEgZ29vZCB0aGluZyBmb3IgeDg2LiBIb3dldmVyLCBoYXZpbmcgc3RhcnRlZCB0byBm
YW1pbGlhcml6ZQpteXNlbGYgYSB0aW55IGJpdCB3aXRoIFJJU0MtViwgSSdtIG5vIGxvbmdlciBj
ZXJ0YWluIG91ciBwcmVzZW50IHdheQpvZiBwcmVmZXJyaW5nIHVuc2lnbmVkIGludCBmb3IgYXJy
YXkgaW5kZXhpbmcgdmFyaWFibGUgYW5kIGFsaWtlIGlzCmFjdHVhbGx5IGEgZ29vZCB0aGluZyB3
aXRob3V0IGZ1cnRoZXIgYWJzdHJhY3Rpb24uIE5ldmVydGhlbGVzcywgdGhpcwppc24ndCBhbiBp
bW1lZGlhdGUgaXNzdWUsIHNvIC4uLgoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KYWxiZWl0IHByZWZlcmFibHkgd2l0aCB0aGUgdGl0bGUgYWRqdXN0ZWQs
IGFuZCB3aXRoIG9uZSBtb3JlCnN1Z2dlc3Rpb246Cgo+IEBAIC0xNTY4LDEzICsxNTY4LDE0IEBA
IHN0YXRpYyBsb25nCj4gIGdudHRhYl91bm1hcF9ncmFudF9yZWYoCj4gICAgICBYRU5fR1VFU1Rf
SEFORExFX1BBUkFNKGdudHRhYl91bm1hcF9ncmFudF9yZWZfdCkgdW9wLCB1bnNpZ25lZCBpbnQg
Y291bnQpCj4gIHsKPiAtICAgIGludCBpLCBjLCBwYXJ0aWFsX2RvbmUsIGRvbmUgPSAwOwo+ICsg
ICAgdW5zaWduZWQgaW50IGksIHBhcnRpYWxfZG9uZSwgZG9uZSA9IDA7Cj4gICAgICBzdHJ1Y3Qg
Z250dGFiX3VubWFwX2dyYW50X3JlZiBvcDsKPiAgICAgIHN0cnVjdCBnbnR0YWJfdW5tYXBfY29t
bW9uIGNvbW1vbltHTlRUQUJfVU5NQVBfQkFUQ0hfU0laRV07Cj4gIAo+ICAgICAgd2hpbGUgKCBj
b3VudCAhPSAwICkKPiAgICAgIHsKPiAtICAgICAgICBjID0gbWluKGNvdW50LCAodW5zaWduZWQg
aW50KUdOVFRBQl9VTk1BUF9CQVRDSF9TSVpFKTsKPiArICAgICAgICB1bnNpZ25lZCBpbnQgYyA9
IG1pbihjb3VudCwgKHVuc2lnbmVkIGludClHTlRUQUJfVU5NQVBfQkFUQ0hfU0laRSk7CgpTZWVp
bmcgdGhpcyBhbmQgYW5vdGhlciBpbnN0YW5jZSBmdXJ0aGVyIGRvd24sIHdvdWxkIHlvdSBtaW5k
CmRyb3BwaW5nIHRoZSBjYXN0IG9uIHRoaXMgb2NjYXNpb24sIGluIGZhdm9yIG9mIGFkZGluZyBh
IFUKc3VmZml4IHRvIEdOVFRBQl9VTk1BUF9CQVRDSF9TSVpFJ3MgZGVmaW5pdGlvbj8KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
