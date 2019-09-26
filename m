Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5778BEFDB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:43:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRBr-0001C4-3R; Thu, 26 Sep 2019 10:40:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDRBq-00018e-9b
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:40:02 +0000
X-Inumbo-ID: fd46b910-e049-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id fd46b910-e049-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 10:39:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0D6E1000;
 Thu, 26 Sep 2019 03:39:59 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2AF53F67D;
 Thu, 26 Sep 2019 03:39:56 -0700 (PDT)
To: hongyax@amazon.com, xen-devel@lists.xenproject.org
References: <cover.1569489002.git.hongyax@amazon.com>
 <30e7ab0c4eff006d752ecd004cd1f0130ef52536.1569489002.git.hongyax@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ff21a1f2-b97f-7ae4-018a-b14dc96e5bfe@arm.com>
Date: Thu, 26 Sep 2019 11:39:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <30e7ab0c4eff006d752ecd004cd1f0130ef52536.1569489002.git.hongyax@amazon.com>
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

SGksCgpOSVQgVGl0bGU6IFBsZWFzZSByZW1vdmUgZnVsbCBzdG9wLgoKT24gOS8yNi8xOSAxMDo0
NiBBTSwgaG9uZ3lheEBhbWF6b24uY29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25n
eWF4QGFtYXpvbi5jb20+CgpQbGVhc2UgcHJvdmlkZSBhIGRlc2NyaXB0aW9uIG9mIHdoYXQvd2h5
IHlvdSBhcmUgZG9pbmcgdGhpcyBpbiB0aGUgCmNvbW1pdCBtZXNzYWdlLgoKQWxzbywgSUlSQywg
eDg2IGFsd2F5cyBoYXZlICFDT05GSUdfU0VQQVJBVEVfWEVOSEVBUC4gU28gY2FuIHlvdSBleHBs
YWluIAp3aHkgdGhlIHBhdGggd2l0aCBzZXBhcmF0ZSB4ZW5oZWFwIGlzIGFsc28gbW9kaWZpZWQ/
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4g
LS0tCj4gICB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyB8IDE4ICsrKysrKysrKysrKysrKystLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2Fs
bG9jLmMKPiBpbmRleCA3Y2IxYmQzNjhiLi40ZWM2Mjk5YmE4IDEwMDY0NAo+IC0tLSBhL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiBAQCAt
MjE0Myw2ICsyMTQzLDcgQEAgdm9pZCBpbml0X3hlbmhlYXBfcGFnZXMocGFkZHJfdCBwcywgcGFk
ZHJfdCBwZSkKPiAgIHZvaWQgKmFsbG9jX3hlbmhlYXBfcGFnZXModW5zaWduZWQgaW50IG9yZGVy
LCB1bnNpZ25lZCBpbnQgbWVtZmxhZ3MpCj4gICB7Cj4gICAgICAgc3RydWN0IHBhZ2VfaW5mbyAq
cGc7Cj4gKyAgICB2b2lkICpyZXQ7Cj4gICAKPiAgICAgICBBU1NFUlQoIWluX2lycSgpKTsKPiAg
IAo+IEBAIC0yMTUxLDcgKzIxNTIsMTAgQEAgdm9pZCAqYWxsb2NfeGVuaGVhcF9wYWdlcyh1bnNp
Z25lZCBpbnQgb3JkZXIsIHVuc2lnbmVkIGludCBtZW1mbGFncykKPiAgICAgICBpZiAoIHVubGlr
ZWx5KHBnID09IE5VTEwpICkKPiAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gICAKPiAtICAgIG1l
bWd1YXJkX3VuZ3VhcmRfcmFuZ2UocGFnZV90b192aXJ0KHBnKSwgMSA8PCAob3JkZXIgKyBQQUdF
X1NISUZUKSk7Cj4gKyAgICByZXQgPSBwYWdlX3RvX3ZpcnQocGcpOwo+ICsgICAgbWVtZ3VhcmRf
dW5ndWFyZF9yYW5nZShyZXQsIDEgPDwgKG9yZGVyICsgUEFHRV9TSElGVCkpOwo+ICsgICAgbWFw
X3BhZ2VzX3RvX3hlbigodW5zaWduZWQgbG9uZylyZXQsIHBhZ2VfdG9fbWZuKHBnKSwKPiArICAg
ICAgICAgICAgICAgICAgICAgMVVMIDw8IG9yZGVyLCBQQUdFX0hZUEVSVklTT1IpOwoKQXMgbWVu
dGlvbmVkIGVhcmxpZXIgb24gZm9yIEFybSwgeGVuaGVhcCB3aWxsIGFsd2F5cyBiZSBtYXBwZWQu
IFNvIAp1bmxlc3MgeW91IGhhdmUgcGxhbiB0byB0YWNrbGUgdGhlIEFybSBzaWRlIGFzIHdlbGws
IHdlIHNob3VsZCBtYWtlIHN1cmUgCnRoYXQgdGhlIGJlaGF2aW9yIGlzIG5vdCBjaGFuZ2VkIGZv
ciBBcm0uCgpJdCBmZWVscyB0byBtZSB3ZSB3YW50IHRvIGludHJvZHVjZSBhIG5ldyBLY29uZmln
IHRoYXQgaXMgc2VsZWN0ZWQgYnkgCng4NiB0byB0ZWxsIHdoZXRoZXIgdGhlIGRpcmVjdCBtYXAg
aXMgbWFwcGVkLiBJIHdvdWxkIHRoZW4gaW1wbGVtZW50IAptYXliZSBpbiB4ZW4vbW0uaCB0d28g
c3R1YiAob25lIGZvciB3aGVuIHRoZSBjb25maWcgaXMgc2VsZWN0ZWQsIHRoZSAKb3RoZXIgd2hl
biBpdCBpcyBub3QpLgoKPiAgIAo+ICAgICAgIHJldHVybiBwYWdlX3RvX3ZpcnQocGcpOwo+ICAg
fQo+IEBAIC0yMTY1LDYgKzIxNjksOCBAQCB2b2lkIGZyZWVfeGVuaGVhcF9wYWdlcyh2b2lkICp2
LCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gICAgICAgICAgIHJldHVybjsKPiAgIAo+ICAgICAgIG1l
bWd1YXJkX2d1YXJkX3JhbmdlKHYsIDEgPDwgKG9yZGVyICsgUEFHRV9TSElGVCkpOwo+ICsgICAg
QVNTRVJUKCh1bnNpZ25lZCBsb25nKXYgPj0gRElSRUNUTUFQX1ZJUlRfU1RBUlQpOwoKVGhpcyBk
ZWZpbmUgZG9lcyBub3QgZXhpc3QgZm9yIEFybTMyIHNvIGl0IHdpbGwgYnJlYWsgY29tcGlsYXRp
b24uCgo+ICsgICAgbWFwX3BhZ2VzX3RvX3hlbigodW5zaWduZWQgbG9uZyl2LCBJTlZBTElEX01G
TiwgMVVMIDw8IG9yZGVyLCBfUEFHRV9OT05FKTsKPiAgIAo+ICAgICAgIGZyZWVfaGVhcF9wYWdl
cyh2aXJ0X3RvX3BhZ2UodiksIG9yZGVyLCBmYWxzZSk7Cj4gICB9Cj4gQEAgLTIxODksNiArMjE5
NSw3IEBAIHZvaWQgKmFsbG9jX3hlbmhlYXBfcGFnZXModW5zaWduZWQgaW50IG9yZGVyLCB1bnNp
Z25lZCBpbnQgbWVtZmxhZ3MpCj4gICB7Cj4gICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7Cj4g
ICAgICAgdW5zaWduZWQgaW50IGk7Cj4gKyAgICB2b2lkICpyZXQ7Cj4gICAKPiAgICAgICBBU1NF
UlQoIWluX2lycSgpKTsKPiAgIAo+IEBAIC0yMjA0LDcgKzIyMTEsMTEgQEAgdm9pZCAqYWxsb2Nf
eGVuaGVhcF9wYWdlcyh1bnNpZ25lZCBpbnQgb3JkZXIsIHVuc2lnbmVkIGludCBtZW1mbGFncykK
PiAgICAgICBmb3IgKCBpID0gMDsgaSA8ICgxdSA8PCBvcmRlcik7IGkrKyApCj4gICAgICAgICAg
IHBnW2ldLmNvdW50X2luZm8gfD0gUEdDX3hlbl9oZWFwOwo+ICAgCj4gLSAgICByZXR1cm4gcGFn
ZV90b192aXJ0KHBnKTsKPiArICAgIHJldCA9IHBhZ2VfdG9fdmlydChwZyk7Cj4gKyAgICBtYXBf
cGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKXJldCwgcGFnZV90b19tZm4ocGcpLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAxVUwgPDwgb3JkZXIsIFBBR0VfSFlQRVJWSVNPUik7Cj4gKwo+ICsg
ICAgcmV0dXJuIHJldDsKPiAgIH0KPiAgIAo+ICAgdm9pZCBmcmVlX3hlbmhlYXBfcGFnZXModm9p
ZCAqdiwgdW5zaWduZWQgaW50IG9yZGVyKQo+IEBAIC0yMjIyLDYgKzIyMzMsOSBAQCB2b2lkIGZy
ZWVfeGVuaGVhcF9wYWdlcyh2b2lkICp2LCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gICAgICAgZm9y
ICggaSA9IDA7IGkgPCAoMXUgPDwgb3JkZXIpOyBpKysgKQo+ICAgICAgICAgICBwZ1tpXS5jb3Vu
dF9pbmZvICY9IH5QR0NfeGVuX2hlYXA7Cj4gICAKPiArICAgIEFTU0VSVCgodW5zaWduZWQgbG9u
Zyl2ID49IERJUkVDVE1BUF9WSVJUX1NUQVJUKTsKPiArICAgIG1hcF9wYWdlc190b194ZW4oKHVu
c2lnbmVkIGxvbmcpdiwgSU5WQUxJRF9NRk4sIDFVTCA8PCBvcmRlciwgX1BBR0VfTk9ORSk7Cj4g
Kwo+ICAgICAgIGZyZWVfaGVhcF9wYWdlcyhwZywgb3JkZXIsIHRydWUpOwo+ICAgfQo+ICAgCj4g
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
