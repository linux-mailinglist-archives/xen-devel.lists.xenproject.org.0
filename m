Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3F572D60
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 13:24:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqFLA-0001pK-Tl; Wed, 24 Jul 2019 11:21:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mQw0=VV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqFL9-0001pC-95
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 11:21:47 +0000
X-Inumbo-ID: 38778f6d-ae05-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 38778f6d-ae05-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 11:21:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ECC6337;
 Wed, 24 Jul 2019 04:21:45 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 023BE3F71A;
 Wed, 24 Jul 2019 04:21:44 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190718115714.634-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1907231654530.7102@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1a509d9b-0e7d-01c5-5d13-542f53c55949@arm.com>
Date: Wed, 24 Jul 2019 12:21:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907231654530.7102@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm64: Correctly compute the virtual
 address in maddr_to_virt()
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDI0LzA3LzIwMTkgMDE6MTcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUaHUsIDE4IEp1bCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFdpdGggdGhh
dCwgdGhlIHBhdGNoIDExOTExNTYzNjEgInhlbi9hcm06IGZpeCBtYXNrIGNhbGN1bGF0aW9uIGlu
Cj4+IHBkeF9pbml0X21hc2siIGNvdWxkIGJlIHJlLWluc3RhdGVkLgo+PiAtLS0KPj4gICB4ZW4v
YXJjaC9hcm0vbW0uYyAgICAgICAgfCAyICsrCj4+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9tbS5o
IHwgNiArKysrLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gv
YXJtL21tLmMKPj4gaW5kZXggNDQyNThhZDg5Yy4uZTFjZGVhYWYyZiAxMDA2NDQKPj4gLS0tIGEv
eGVuL2FyY2gvYXJtL21tLmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMKPj4gQEAgLTE2NSw2
ICsxNjUsNyBAQCBtZm5fdCB4ZW5oZWFwX21mbl9lbmQgX19yZWFkX21vc3RseTsKPj4gICB2YWRk
cl90IHhlbmhlYXBfdmlydF9lbmQgX19yZWFkX21vc3RseTsKPj4gICAjaWZkZWYgQ09ORklHX0FS
TV82NAo+PiAgIHZhZGRyX3QgeGVuaGVhcF92aXJ0X3N0YXJ0IF9fcmVhZF9tb3N0bHk7Cj4+ICt1
bnNpZ25lZCBsb25nIHhlbmhlYXBfYmFzZV9wZHggX19yZWFkX21vc3RseTsKPj4gICAjZW5kaWYK
Pj4gICAKPj4gICB1bnNpZ25lZCBsb25nIGZyYW1ldGFibGVfYmFzZV9wZHggX19yZWFkX21vc3Rs
eTsKPj4gQEAgLTc5Niw2ICs3OTcsNyBAQCB2b2lkIF9faW5pdCBzZXR1cF94ZW5oZWFwX21hcHBp
bmdzKHVuc2lnbmVkIGxvbmcgYmFzZV9tZm4sCj4+ICAgICAgIGlmICggbWZuX2VxKHhlbmhlYXBf
bWZuX3N0YXJ0LCBJTlZBTElEX01GTikgKQo+PiAgICAgICB7Cj4+ICAgICAgICAgICB4ZW5oZWFw
X21mbl9zdGFydCA9IF9tZm4oYmFzZV9tZm4pOwo+PiArICAgICAgICB4ZW5oZWFwX2Jhc2VfcGR4
ID0gbWZuX3RvX3BkeChfbWZuKGJhc2VfbWZuKSk7Cj4+ICAgICAgICAgICB4ZW5oZWFwX3ZpcnRf
c3RhcnQgPSBESVJFQ1RNQVBfVklSVF9TVEFSVCArCj4+ICAgICAgICAgICAgICAgKGJhc2VfbWZu
IC0gbWZuKSAqIFBBR0VfU0laRTsKPj4gICAgICAgfQo+IAo+IEkgY2FuIHNlZSB0aGF0IHRoaXMg
d291bGQgd29yaywgYnV0IHdvdWxkbid0IGl0IGJlIGEgYmV0dGVyIGZpdCB0byBzZXQKPiB4ZW5o
ZWFwX2Jhc2VfcGR4IGluIHhlbi9hcmNoL2FybS9zZXR1cC5jOnNldHVwX21tLCB3aGVyZSB3ZSBh
bHJlYWR5IHNldDoKPiAKPiAKPiAgICAgIHhlbmhlYXBfdmlydF9lbmQgPSBYRU5IRUFQX1ZJUlRf
U1RBUlQgKyByYW1fZW5kIC0gcmFtX3N0YXJ0Owo+ICAgICAgeGVuaGVhcF9tZm5fc3RhcnQgPSBt
YWRkcl90b19tZm4ocmFtX3N0YXJ0KTsKPiAgICAgIHhlbmhlYXBfbWZuX2VuZCA9IG1hZGRyX3Rv
X21mbihyYW1fZW5kKTsKPiAKPiBPciBpdCB0b28gbGF0ZSBieSB0aGVuPwoKWWVzIHNldHVwX3hl
bmhlYXBfbWFwcGluZ3MoKSBpcyB1c2luZyBfX21mbl90b192aXJ0KCkgdGhhdCB3aWxsIGNhbGwg
Cm1hZGRyX3RvX3ZpcnQoKS4gU28gd2UgbmVlZCB0byBzZXR1cCB4ZW5oZWFtX2Jhc2Vfc3RhcnQg
ZWFybGllci4KClRCSCwgdGhpcyAzIHZhcmlhYmxlcyBzaG91bGQgYmUgc2V0IHdpdGhpbiB4ZW5o
ZWFwIGFzIGl0IG1ha2VzIGNsZWFyZXIgaG93IHRoZXkgCmFyZSBjb21wdXRlZC4gQWN0dWFsbHks
IHhlbmhlYW1fbWZuX3N0YXJ0IHdpbGwgYmUgb3ZlcmlkZGVuLCB0aGFua2Z1bGx5IHRoZSBuZXcg
CmFuZCBvbGQgdmFsdWVzIGFyZSBleGFjdGx5IHRoZSBzYW1lLi4uCgpJIGhhdmUgcGxhbiB0byBy
ZXdyaXRlIHRoZSB4ZW5oZWFwIGNvZGUgYXMgdGhlcmUgYXJlIGZldyBwcm9ibGVtcyB3aXRoIGl0
OgogICAxKSBDaGlja2VuIGFuZCBlZ2dzIHByb2JsZW0gd2l0aCB0aGUgYWxsb2NfYm9vdF9wYWdl
cyguLi4pLiBXZSBtYXkgbmVlZCB0byAKYWxsb2NhdGUgbWVtb3J5IHdoaWxlIGRvaW5nIHRoZSB4
ZW5oZWFwIG1hcHBpbmcgYnV0IHBhZ2UgYXJlIG5vdCBnaXZlbiB0byB0aGUgCmFsbG9jYXRvciB1
bnRpbCBsYXRlLiBCdXQgaWYgeW91IGdpdmUgdG8gdGhlIGFsbG9jYXRvciB0aGUgcGFnZSBhbmQg
aXQgaXMgbm90IAp5ZXQgdW5tYXAsIHRoZW4geW91IHdvdWxkIHJlY2VpdmUgYSBkYXRhIGFib3J0
LgogICAyKSBXZSBhcmUgbWFwcGluZyBhbGwgdGhlIFJBTXMsIGluY2x1ZGUgcmVzZXJ2ZWQtbWVt
b3J5IG1hcmtlZCBuby1tYXAuIFRoaXMgCm1heSByZXN1bHQgdG8gY2FjaGluZyBwcm9ibGVtIGxh
dGVyIG9uLgogICAzKSBXZSBhcmUgdXNpbmcgMUdCIG1hcHBpbmcsIGhvd2V2ZXIgaWYgdGhlIFJB
TSBpcyBsZXNzIHRoYW4gYSAxR0IsIHdlIHdpbGwgCmVuZC11cCB0byBjb3ZlciBub24tUkFNLiBX
aXRoIGJhZCBsdWNrLCB0aGlzIG1heSBjb3ZlciBkZXZpY2UgbWVtb3J5IGxlYWRpbmcgdG8gCmlu
dGVyZXN0aW5nIHJlc3VsdC4gQUZBSUssIHRoZSBSUEk0IGhhcyB0aGlzIGV4YWN0IHVzZSBjYXNl
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
