Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB12C057A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:48:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpcI-0000PO-HC; Fri, 27 Sep 2019 12:44:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDpcH-0000PJ-8k
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:44:57 +0000
X-Inumbo-ID: 9bdf89be-e124-11e9-9677-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 9bdf89be-e124-11e9-9677-12813bfff9fa;
 Fri, 27 Sep 2019 12:44:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E42A31000;
 Fri, 27 Sep 2019 05:44:55 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F3453F67D;
 Fri, 27 Sep 2019 05:44:55 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-4-julien.grall@arm.com> <871rw29d4s.fsf@epam.com>
 <aa4d64a4-98bf-d248-fc2e-c00bc1c76a91@arm.com> <87sgoh9b6r.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9b9b276e-21a0-78b2-1b42-c80a0d8d6353@arm.com>
Date: Fri, 27 Sep 2019 13:44:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87sgoh9b6r.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework
 entry/exit from the guest path
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNy8wOS8yMDE5IDEzOjI3LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBK
dWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBPbiAyNy8wOS8yMDE5IDEyOjQ1LCBWb2xvZHlteXIg
QmFiY2h1ayB3cm90ZToKPj4+Cj4+PiBKdWxpZW4sCj4+Cj4+IEhpLi4uCj4+Cj4+PiBKdWxpZW4g
R3JhbGwgd3JpdGVzOgo+Pj4KPj4+PiBBdCB0aGUgbW9tZW50LCBlbnRlcl9oeXBlcnZpc29yX2hl
YWQoKSBhbmQgbGVhdmVfaHlwZXJ2aXNvcl90YWlsKCkgYXJlCj4+Pj4gdXNlZCB0byBkZWFsIHdp
dGggYWN0aW9ucyB0byBiZSBkb25lIGJlZm9yZS9hZnRlciBhbnkgZ3Vlc3QgcmVxdWVzdCBpcwo+
Pj4+IGhhbmRsZWQuCj4+Pj4KPj4+PiBXaGlsZSB0aGV5IGFyZSBtZWFudCB0byB3b3JrIGluIHBh
aXIsIHRoZSBmb3JtZXIgaXMgY2FsbGVkIGZvciBtb3N0IG9mCj4+Pj4gdGhlIHRyYXBzLCBpbmNs
dWRpbmcgdHJhcHMgZnJvbSB0aGUgc2FtZSBleGNlcHRpb24gbGV2ZWwgKGkuZS4KPj4+PiBoeXBl
cnZpc29yKSB3aGlsc3QgdGhlIGxhdHRlciB3aWxsIG9ubHkgYmUgY2FsbGVkIHdoZW4gcmV0dXJu
aW5nIHRvIHRoZQo+Pj4+IGd1ZXN0Lgo+Pj4+Cj4+Pj4gQXMgcG9pbnRlZCBvdXQsIHRoZSBlbnRl
cl9oeXBlcnZpc29yX2hlYWQoKSBpcyBub3QgY2FsbGVkIGZyb20gYWxsIHRoZQo+Pj4+IHRyYXBz
LCBzbyB0aGlzIG1ha2VzIHBvdGVudGlhbGx5IGRpZmZpY3VsdCB0byBleHRlbmQgaXQgZm9yIHRo
ZSBkZWFsaW5nCj4+Pj4gd2l0aCBzYW1lIGV4Y2VwdGlvbiBsZXZlbC4KPj4+Pgo+Pj4+IEZ1cnRo
ZXJtb3JlLCBzb21lIGFzc2VtYmx5IG9ubHkgcGF0aCB3aWxsIHJlcXVpcmUgdG8gY2FsbAo+Pj4+
IGVudGVyX2h5cGVydmlzb3JfdGFpbCgpLiBTbyB0aGUgZnVuY3Rpb24gaXMgbm93IGRpcmVjdGx5
IGNhbGwgYnkKPj4+PiBhc3NlbWJseSBpbiBmb3IgZ3Vlc3QgdmVjdG9yIG9ubHkuIFRoaXMgbWVh
bnMgdGhhdCB0aGUgY2hlY2sgd2hldGhlciB3ZQo+Pj4+IGFyZSBjYWxsZWQgaW4gYSBndWVzdCB0
cmFwIGNhbiBub3cgYmUgcmVtb3ZlZC4KPj4+Pgo+Pj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRv
IHJlbmFtZSBlbnRlcl9oeXBlcnZpc29yX3RhaWwoKSBhbmQKPj4+PiBsZWF2ZV9oeXBlcnZpc29y
X3RhaWwoKSB0byBzb21ldGhpbmcgbW9yZSBtZWFuaW5nZnVsIGFuZCBkb2N1bWVudCB0aGVtLgo+
Pj4+IFRoaXMgc2hvdWxkIGhlbHAgZXZlcnlvbmUgdG8gdW5kZXJzdGFuZCB0aGUgcHVycG9zZSBv
ZiB0aGUgdHdvCj4+Pj4gZnVuY3Rpb25zLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+Pgo+Pj4+IC0tLQo+Pj4+Cj4+Pj4gSSBo
YXZlbid0IGRvbmUgdGhlIDMyLWJpdHMgcGFydCB5ZXQuIEkgd2FudGVkIHRvIGdhdGhlciBmZWVk
YmFjayBiZWZvcmUKPj4+PiBsb29raW5nIGluIGRldGFpbHMgaG93IHRvIGludGVncmF0ZSB0aGF0
IHdpdGggQXJtMzIuCj4+PiBJJ20gbG9va2luZyBhdCBwYXRjaGVzIG9uZSBieSBvbmUgYW5kIGl0
IGlzIGxvb2tpbmcgb2theSBzbyBmYXIuCj4+Pgo+Pj4KPj4+PiAtLS0KPj4+PiAgICB4ZW4vYXJj
aC9hcm0vYXJtNjQvZW50cnkuUyB8ICA0ICsrLQo+Pj4+ICAgIHhlbi9hcmNoL2FybS90cmFwcy5j
ICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25z
KC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgYi94
ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+Pj4+IGluZGV4IDQwZDlmM2VjOGMuLjllYWZhZTUx
NmIgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKPj4+PiArKysg
Yi94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+Pj4+IEBAIC0xNDcsNyArMTQ3LDcgQEAKPj4+
Pgo+Pj4+ICAgICAgICAgICAgLmlmIFxoeXAgPT0gMCAgICAgICAgIC8qIEd1ZXN0IG1vZGUgKi8K
Pj4+Pgo+Pj4+IC0gICAgICAgIGJsICAgICAgbGVhdmVfaHlwZXJ2aXNvcl90YWlsIC8qIERpc2Fi
bGVzIGludGVycnVwdHMgb24gcmV0dXJuICovCj4+Pj4gKyAgICAgICAgYmwgICAgICBsZWF2ZV9o
eXBlcnZpc29yX3RvX2d1ZXN0IC8qIERpc2FibGVzIGludGVycnVwdHMgb24gcmV0dXJuICovCj4+
Pj4KPj4+PiAgICAgICAgICAgIGV4aXRfZ3Vlc3QgXGNvbXBhdAo+Pj4+Cj4+Pj4gQEAgLTE3NSw2
ICsxNzUsOCBAQAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgU0tJUF9TWU5DSFJPTklaRV9T
RVJST1JfRU5UUllfRVhJVCkKPj4+PiAgICAgICAgICAgIG1zciAgICAgZGFpZmNsciwgXGlmbGFn
cwo+Pj4+ICAgICAgICAgICAgbW92ICAgICB4MCwgc3AKPj4+IExvb2tzIGxpa2UgdGhpcyBtb3Yg
Y2FuIGJlIHJlbW92ZWQgKHNlZSBjb21tZW5kIGJlbG93KS4KPj4+Cj4+Pj4gKyAgICAgICAgYmwg
ICAgICBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3QKPj4+PiArICAgICAgICBtb3YgICAgIHgw
LCBzcAo+Pj4+ICAgICAgICAgICAgYmwgICAgICBkb190cmFwX1x0cmFwCj4+Pj4gICAgMToKPj4+
PiAgICAgICAgICAgIGV4aXQgICAgaHlwPTAsIGNvbXBhdD1cY29tcGF0Cj4+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4+PiBpbmRl
eCBhM2I5NjFiZDA2Li4yMGJhMzRlYzkxIDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS90
cmFwcy5jCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4+PiBAQCAtMjAwNiw0NyAr
MjAwNiw0NiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgbmVlZHNfc3NiZF9mbGlwKHN0cnVjdCB2Y3B1
ICp2KQo+Pj4+ICAgICAgICAgICAgICAgICBjcHVfcmVxdWlyZV9zc2JkX21pdGlnYXRpb24oKTsK
Pj4+PiAgICB9Cj4+Pj4KPj4+PiAtc3RhdGljIHZvaWQgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKHN0
cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+Pj4+ICsvKgo+Pj4+ICsgKiBBY3Rpb25zIHRoYXQg
bmVlZHMgdG8gYmUgZG9uZSBhZnRlciBleGl0aW5nIHRoZSBndWVzdCBhbmQgYmVmb3JlIGFueQo+
Pj4+ICsgKiByZXF1ZXN0IGZyb20gaXQgaXMgaGFuZGxlZC4KPj4+IE1heWJlIGl0IGlzIG1lIG9u
bHksIGJ1dCB0aGUgcGhyYXNpbmcgaXMgY29uZnVzaW5nLiBJIGhhZCB0byByZWFkIGl0IHR3bwo+
Pj4gdGltZXMgYmVmb3JlIEkgZ2V0IGl0LiBXaGF0IGFib3V0ICJBY3Rpb25zIHRoYXQgbmVlZHMg
dG8gYmUgZG9uZSB3aGVuCj4+PiByYWlzaW5nIGV4Y2VwdGlvbiBsZXZlbCI/IE9yIG1heWJlICJB
Y3Rpb25zIHRoYXQgbmVlZHMgdG8gYmUgZG9uZSB3aGVuCj4+PiBzd2l0Y2hpbmcgZnJvbSBndWVz
dCB0byBoeXBlcnZpc29yIG1vZGUiID8KPj4KPj4gSXMgaXQgYSBzdWdnZXN0aW9uIHRvIHJlcGxh
Y2UgdGhlIGZ1bGwgc2VudGVuY2Ugb3IganVzdCB0aGUgZmlyc3QKPj4gYmVmb3JlIChpLmUuIGJl
Zm9yZSAnYW5kJyk/Cj4gVGhpcyBpcyBhIHN1Z2dlc3Rpb24gZm9yIHRoZSBmaXJzdCBwYXJ0LgoK
SG93IGFib3V0OgoKIkFjdGlvbnMgdGhhdCBuZWVkcyB0byBiZSBkb25lIGFmdGVyIGVudGVyaW5n
IHRoZSBoeXBlcnZpc29yIGZyb20gdGhlIGd1ZXN0IGFuZCAKYmVmb3JlIHdlIGhhbmRsZSBhbnkg
cmVxdWVzdC4iCgo+IAo+Pj4KPj4+PiArICovCj4+Pj4gK3ZvaWQgZW50ZXJfaHlwZXJ2aXNvcl9m
cm9tX2d1ZXN0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+Pj4gV2l0aCB0aGUgZ3Vlc3Rf
bW9kZShyZWdzKSBjaGVjayByZW1vdmFsICwgdGhpcyBmdW5jdGlvbiBkb2VzIG5vdCB1c2UgcmVn
cwo+Pj4gYW55bW9yZS4KPj4KPj4gSSBoYXZlIG5lYXJseSBkb25lIGl0IHdoaWxlIHdvcmtpbmcg
b24gdGhlIHNlcmllcywgYnV0IHRoZW4gSSB0aG91Z2h0Cj4+IHRoYXQgaXQgd291bGQgYmUgYmV0
dGVyIGtlZXAgYWxsIHRoZSBmdW5jdGlvbnMgY2FsbGVkIGZyb20gdGhlIGVudHJ5Cj4+IHBhdGgg
aW4gYXNzZW1ibHkgc2ltaWxhci4KPiBUaGlzIGNhbiBzYXZlIG9uZSBhc3NlbWJseSBpbnN0cnVj
dGlvbiBpbiB0aGUgZW50cnkgcGF0aC4gQnV0IEknbSBub3QKPiBzdXJlIGlmIGl0IGlzIHdvcnRo
IGl0LiBTbyBpdCBpcyB1cCB0byB5b3UuCgpNeSBjb25jZXJuIGlzIHVzZXIgbWF5IGRlY2lkZSB0
byB1c2UgZ3Vlc3RfY3B1X3VzZXJfcmVncygpIHdoZW4gdGhlICdyZWdzJyAKcGFyYW1ldGVyIGNv
dWxkIGhhdmUgYmVlbiB1c2VkLiBCdXQgSSBndWVzcywgd2UgY2FuIG5vdGljZSBpdCBkdXJpbmcg
cmV2aWV3LgoKU28gSSB3aWxsIGRyb3AgaXQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
