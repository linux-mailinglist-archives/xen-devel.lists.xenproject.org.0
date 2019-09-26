Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C5BF4A0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:04:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUKp-0004z1-Tz; Thu, 26 Sep 2019 14:01:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDUKn-0004yt-U3
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:01:29 +0000
X-Inumbo-ID: 21d96450-e066-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 21d96450-e066-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 14:01:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D23181570;
 Thu, 26 Sep 2019 07:01:26 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E02B03F534;
 Thu, 26 Sep 2019 07:01:23 -0700 (PDT)
To: hongyax@amazon.com, xen-devel@lists.xenproject.org
References: <cover.1569489002.git.hongyax@amazon.com>
 <30e7ab0c4eff006d752ecd004cd1f0130ef52536.1569489002.git.hongyax@amazon.com>
 <ff21a1f2-b97f-7ae4-018a-b14dc96e5bfe@arm.com>
 <fb8d955d-5b21-d9c6-85a5-6eda77a91b05@amazon.com>
 <96170e54-3c9a-84f5-c292-6cb23d32212b@arm.com>
 <db12612c-fa9d-3692-4940-4f1e54cbb698@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d3c0cee1-5139-307e-5b56-e8bb537c3e24@arm.com>
Date: Thu, 26 Sep 2019 15:01:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <db12612c-fa9d-3692-4940-4f1e54cbb698@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 68/84] page_alloc: actually do the
 mapping and unmapping on xenheap.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzI2LzE5IDI6MDMgUE0sIGhvbmd5YXhAYW1hem9uLmNvbSB3cm90ZToKPiBPbiAy
Ni8wOS8yMDE5IDEzOjI0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiA5LzI2
LzE5IDEyOjE4IFBNLCBob25neWF4QGFtYXpvbi5jb20gd3JvdGU6Cj4+PiBPbiAyNi8wOS8yMDE5
IDExOjM5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBOSVQgVGl0bGU6
IFBsZWFzZSByZW1vdmUgZnVsbCBzdG9wLgo+Pj4+Cj4+Pj4gT24gOS8yNi8xOSAxMDo0NiBBTSwg
aG9uZ3lheEBhbWF6b24uY29tIHdyb3RlOgo+Pj4+PiBGcm9tOiBIb25neWFuIFhpYSA8aG9uZ3lh
eEBhbWF6b24uY29tPgo+Pj4+Cj4+Pj4gUGxlYXNlIHByb3ZpZGUgYSBkZXNjcmlwdGlvbiBvZiB3
aGF0L3doeSB5b3UgYXJlIGRvaW5nIHRoaXMgaW4gdGhlIAo+Pj4+IGNvbW1pdCBtZXNzYWdlLgo+
Pj4+Cj4+Pj4gQWxzbywgSUlSQywgeDg2IGFsd2F5cyBoYXZlICFDT05GSUdfU0VQQVJBVEVfWEVO
SEVBUC4gU28gY2FuIHlvdSAKPj4+PiBleHBsYWluIHdoeSB0aGUgcGF0aCB3aXRoIHNlcGFyYXRl
IHhlbmhlYXAgaXMgYWxzbyBtb2RpZmllZD8KPj4+Pgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBIb25neWFuIFhpYSA8aG9uZ3lheEBhbWF6b24uY29tPgo+Pj4+PiAtLS0KPj4+Pj4gwqAgeGVu
L2NvbW1vbi9wYWdlX2FsbG9jLmMgfCAxOCArKysrKysrKysrKysrKysrLS0KPj4+Pj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+
IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9h
bGxvYy5jCj4+Pj4+IGluZGV4IDdjYjFiZDM2OGIuLjRlYzYyOTliYTggMTAwNjQ0Cj4+Pj4+IC0t
LSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+Pj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9h
bGxvYy5jCj4+Pj4+IEBAIC0yMTQzLDYgKzIxNDMsNyBAQCB2b2lkIGluaXRfeGVuaGVhcF9wYWdl
cyhwYWRkcl90IHBzLCBwYWRkcl90IHBlKQo+Pj4+PiDCoCB2b2lkICphbGxvY194ZW5oZWFwX3Bh
Z2VzKHVuc2lnbmVkIGludCBvcmRlciwgdW5zaWduZWQgaW50IG1lbWZsYWdzKQo+Pj4+PiDCoCB7
Cj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7Cj4+Pj4+ICvCoMKgwqAgdm9p
ZCAqcmV0Owo+Pj4+PiDCoMKgwqDCoMKgIEFTU0VSVCghaW5faXJxKCkpOwo+Pj4+PiBAQCAtMjE1
MSw3ICsyMTUyLDEwIEBAIHZvaWQgKmFsbG9jX3hlbmhlYXBfcGFnZXModW5zaWduZWQgaW50IAo+
Pj4+PiBvcmRlciwgdW5zaWduZWQgaW50IG1lbWZsYWdzKQo+Pj4+PiDCoMKgwqDCoMKgIGlmICgg
dW5saWtlbHkocGcgPT0gTlVMTCkgKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5V
TEw7Cj4+Pj4+IC3CoMKgwqAgbWVtZ3VhcmRfdW5ndWFyZF9yYW5nZShwYWdlX3RvX3ZpcnQocGcp
LCAxIDw8IChvcmRlciArIAo+Pj4+PiBQQUdFX1NISUZUKSk7Cj4+Pj4+ICvCoMKgwqAgcmV0ID0g
cGFnZV90b192aXJ0KHBnKTsKPj4+Pj4gK8KgwqDCoCBtZW1ndWFyZF91bmd1YXJkX3JhbmdlKHJl
dCwgMSA8PCAob3JkZXIgKyBQQUdFX1NISUZUKSk7Cj4+Pj4+ICvCoMKgwqAgbWFwX3BhZ2VzX3Rv
X3hlbigodW5zaWduZWQgbG9uZylyZXQsIHBhZ2VfdG9fbWZuKHBnKSwKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMVVMIDw8IG9yZGVyLCBQQUdFX0hZUEVS
VklTT1IpOwo+Pj4+Cj4+Pj4gQXMgbWVudGlvbmVkIGVhcmxpZXIgb24gZm9yIEFybSwgeGVuaGVh
cCB3aWxsIGFsd2F5cyBiZSBtYXBwZWQuIFNvIAo+Pj4+IHVubGVzcyB5b3UgaGF2ZSBwbGFuIHRv
IHRhY2tsZSB0aGUgQXJtIHNpZGUgYXMgd2VsbCwgd2Ugc2hvdWxkIG1ha2UgCj4+Pj4gc3VyZSB0
aGF0IHRoZSBiZWhhdmlvciBpcyBub3QgY2hhbmdlZCBmb3IgQXJtLgo+Pj4KPj4+IEkgY2FuIGFk
ZCBhbiAjaWZkZWYgZm9yIHg4Ni4gQWx0aG91Z2ggSSB0aGluayBpZiB0aGUgQXJtIGNvZGUgaXMg
Cj4+PiBjb3JyZWN0LCB0aGlzIHNob3VsZCBzdGlsbCBub3QgYnJlYWsgdGhpbmdzLiBJdCBicmVh
a3MgaWYgYSB4ZW5oZWFwIAo+Pj4gYWNjZXNzIGlzIG1hZGUgZXZlbiBiZWZvcmUgYWxsb2NhdGlv
biBvciBhZnRlciBmcmVlLCB3aGljaCBJIHRoaW5rIGlzIAo+Pj4gYSBidWcuCj4+Cj4+IENvcnJl
Y3RuZXNzIGlzIGEgbWF0dGVyIG9mIHBlcnNwZWN0aXZlIDspLiB4ZW5oZWFwIGlzIGFscmVhZHkg
bWFwIG9uIAo+PiBBcm0gYW5kIHRoZXJlZm9yZSB0cnlpbmcgdG8gbWFwIGl0IGFnYWluIGlzIGNv
bnNpZGVyZWQgYXMgYW4gZXJyb3IuIEkgCj4+IHRoaW5rIHRoaXMgaXMgYSB2YWxpZCBiZWhhdmlv
ciBiZWNhdXNlIGlmIHlvdSB0cnkgdG8gbWFwIHR3aWNlIHRoZW4gaXQgCj4+IGxpa2VseSBtZWFu
cyB5b3UgbWF5IGhhdmUgdG8gdW5tYXAgbGF0ZXIgb24uCj4gCj4gR29vZCBwb2ludC4gVGhhbmtz
LiBXaWxsIGFuIGlmZGVmIGRvIHRoZSBqb2I/CgpJIHdvdWxkIHN1Z2dlc3QgdG8gcHJvdmlkZSBo
ZWxwZXJzIHNvIHlvdSBjYW4gZG9jdW1lbnQgaW4gYSBzaW5nbGUgcGxhY2UgCndoeSB0aGlzIGlz
IG5lY2Vzc2FyeSBhbmQgYXZvaWQgdG8gYWRkICNpZmRlZmVyeSBldmVyeXdoZXJlLgoKQWxzbywg
ZG8gd2UgZXhwZWN0IHNpbWlsYXIgYml0cyBpbiBvdGhlciBwYXJ0IG9mIHRoZSBjb21tb24gY29k
ZT8gSWYgCnllcywgSSB3b3VsZCBzdWdnZXN0IHRvIGFkZCB0aG9zZSBoZWxwZXJzIGluIHRoZSBo
ZWFkZXIuIElmIG5vdCwgCnBhZ2VfYWxsb2MuYyBzaG91bGQgYmUgZW5vdWdoLgoKUmVnYXJkaW5n
IHRoZSBjb25maWcgbmFtZSwgSSB3b3VsZCByYXRoZXIgbm90IHVzZSBDT05GSUdfWDg2IGJ1dCB1
c2UgYSAKbmV3IGFyY2gtYWdub3N0aWMgb25lLiBNYXliZSBDT05GSUdfRElSRUNUTUFQX05PVF9B
TFdBWVNfTUFQUEVEPyAKKHByb2JhYmx5IHRvbyB2ZXJib3NlKS4KCj4gCj4+Cj4+IEZ1cnRoZXJt
b3JlLCB4ZW5oZWFwIGlzIHVzaW5nIHN1cGVycGFnZSAoMk1CLCAxR0IpIG1hcHBpbmcgYXQgdGhl
IAo+PiBtb21lbnQuIFdlIGNvbXBsZXRlbHkgZm9yYmlkIHNoYXR0ZXJpbmcgc3VwZXJwYWdlIGJl
Y2F1c2UgdGhleSBhcmUgbm90IAo+PiB0cml2aWFsIHRvIGRlYWwgd2l0aC4KPj4KPj4gSW4gc2hv
cnQsIGlmIHlvdSB3YW50ZWQgdG8gdW5tYXAgcGFydCBpdCwgdGhlbiB5b3Ugd291bGQgbmVlZCB0
byAKPj4gc2hhdHRlciB0aGUgcGFnZS4gU2hhdHRlcmluZyBzdXBlcnBhZ2UgcmVxdWlyZWQgdG8g
Zm9sbG93IGEgc3BlY2lmaWMgCj4+IHNlcXVlbmNlIChjYWxsZWQgYnJlYWstYmVmb3JlLW1ha2Up
IHRoYXQgd2lsbCBnbyB0aHJvdWdoIGFuIGludmFsaWQgCj4+IG1hcHBpbmcuIFdlIG5lZWQgdG8g
YmUgY2FyZWZ1bCBhcyBhbm90aGVyIHByb2Nlc3NvciBtYXkgYWNjZXNzIHRoZSAKPj4gc3VwZXJw
YWdlIGF0IHRoZSBzYW1lIHRpbWUuCj4+Cj4+IEl0IG1heSBiZSBwb3NzaWJsZSB0byB1c2Ugb25s
eSA0S0IgbWFwcGluZyBmb3IgdGhlIHhlbmhlYXAsIGJ1dCB0aGF0J3MgCj4+IG5lZWQgdG8gYmUg
aW52ZXN0aWdhdGVkIGZpcnN0Lgo+IAo+IFRoZSBzZXJpZXMgaXMgaW50ZW5kZWQgZm9yIHg4NiB3
aGljaCB0aGVuIHN0YXJ0cyB3aXRoIG5vIHhlbmhlYXAgCj4gbWFwcGluZ3MuIElmIG9uZSBjYWxs
IHRvIG1hcF9wYWdlc190b194ZW4oKSBtYXBzIHRoZSBmaXJzdCBoYWxmIG9mIGEgCj4gc3VwZXJw
YWdlIGFuZCBhIHNlY29uZCBvbmUgbWFwcyB0aGUgcmVtYWluaW5nLCB3aWxsIHRoZSBzZWNvbmQg
Y2FsbCAKPiBtZXJnZSB0aGVtIGludG8gYW4gYWN0dWFsIHN1cGVycGFnZSBtYXBwaW5nPyBBbHNv
LCBkbyB3ZSBkbyBhIHhlbmhlYXAgCj4gYWxsb2NhdGlvbiBhbmQgdGhlbiBvbmx5IGZyZWUgcGFy
dCBvZiBpdCBpbiBzb21lIGNhc2VzPyBJZiBib3RoIGFuc3dlcnMgCj4gYXJlIGhvcGVmdWxseSBu
bywgdGhlbiBzaGF0dGVyaW5nIHdvbid0IGhhcHBlbi4KCkZvciBhdm9pZGFuY2Ugb2YgZG91YnQs
IEkgd2FzIGRlc2NyaWJpbmcgaG93IEFybSB3b3Jrcy4gRm9yIGFueSB4ODYgCnNwZWNpZmljIHF1
ZXN0aW9uLCB0aGVuIEphbi9BbmRyZXcgYXJlIHRoZSBiZXN0IHBvaW50IG9mIGNvbnRhY3QgKEkg
c2F3IApKYW4gYWxyZWFkeSBhbnN3ZXJlZCkuCgpUaGUgbWFpbiBwb2ludCBpcyBhbnkgY29tbW9u
IGNvZGUgc2hvdWxkIGJlIGFibGUgdG8gd29yayBmb3IgYW55IApleGlzdGluZyBhcmNoaXRlY3R1
cmUgKEFUTSB4ODYsIGFybSkKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
