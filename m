Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3824BBF001
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:47:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRHB-0002hW-Qv; Thu, 26 Sep 2019 10:45:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDRHA-0002hL-7P
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:45:32 +0000
X-Inumbo-ID: c2d1bb76-e04a-11e9-964e-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id c2d1bb76-e04a-11e9-964e-12813bfff9fa;
 Thu, 26 Sep 2019 10:45:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05DA31576;
 Thu, 26 Sep 2019 03:45:31 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B38073F67D;
 Thu, 26 Sep 2019 03:45:28 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: hongyax@amazon.com, xen-devel@lists.xenproject.org
References: <cover.1569489002.git.hongyax@amazon.com>
 <30e7ab0c4eff006d752ecd004cd1f0130ef52536.1569489002.git.hongyax@amazon.com>
 <ff21a1f2-b97f-7ae4-018a-b14dc96e5bfe@arm.com>
Message-ID: <9363b6d2-0b30-f0f3-06df-092aeac21274@arm.com>
Date: Thu, 26 Sep 2019 11:45:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ff21a1f2-b97f-7ae4-018a-b14dc96e5bfe@arm.com>
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

SGksCgpPbiA5LzI2LzE5IDExOjM5IEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4g
TklUIFRpdGxlOiBQbGVhc2UgcmVtb3ZlIGZ1bGwgc3RvcC4KPiAKPiBPbiA5LzI2LzE5IDEwOjQ2
IEFNLCBob25neWF4QGFtYXpvbi5jb20gd3JvdGU6Cj4+IEZyb206IEhvbmd5YW4gWGlhIDxob25n
eWF4QGFtYXpvbi5jb20+Cj4gCj4gUGxlYXNlIHByb3ZpZGUgYSBkZXNjcmlwdGlvbiBvZiB3aGF0
L3doeSB5b3UgYXJlIGRvaW5nIHRoaXMgaW4gdGhlIAo+IGNvbW1pdCBtZXNzYWdlLgo+IAo+IEFs
c28sIElJUkMsIHg4NiBhbHdheXMgaGF2ZSAhQ09ORklHX1NFUEFSQVRFX1hFTkhFQVAuIFNvIGNh
biB5b3UgZXhwbGFpbiAKPiB3aHkgdGhlIHBhdGggd2l0aCBzZXBhcmF0ZSB4ZW5oZWFwIGlzIGFs
c28gbW9kaWZpZWQ/Cj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neWF4
QGFtYXpvbi5jb20+Cj4+IC0tLQo+PiDCoCB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyB8IDE4ICsr
KysrKysrKysrKysrKystLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
IGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4gaW5kZXggN2NiMWJkMzY4Yi4uNGVjNjI5OWJh
OCAxMDA2NDQKPj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4gKysrIGIveGVuL2Nv
bW1vbi9wYWdlX2FsbG9jLmMKPj4gQEAgLTIxNDMsNiArMjE0Myw3IEBAIHZvaWQgaW5pdF94ZW5o
ZWFwX3BhZ2VzKHBhZGRyX3QgcHMsIHBhZGRyX3QgcGUpCj4+IMKgIHZvaWQgKmFsbG9jX3hlbmhl
YXBfcGFnZXModW5zaWduZWQgaW50IG9yZGVyLCB1bnNpZ25lZCBpbnQgbWVtZmxhZ3MpCj4+IMKg
IHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsKPj4gK8KgwqDCoCB2b2lkICpy
ZXQ7Cj4+IMKgwqDCoMKgwqAgQVNTRVJUKCFpbl9pcnEoKSk7Cj4+IEBAIC0yMTUxLDcgKzIxNTIs
MTAgQEAgdm9pZCAqYWxsb2NfeGVuaGVhcF9wYWdlcyh1bnNpZ25lZCBpbnQgb3JkZXIsIAo+PiB1
bnNpZ25lZCBpbnQgbWVtZmxhZ3MpCj4+IMKgwqDCoMKgwqAgaWYgKCB1bmxpa2VseShwZyA9PSBO
VUxMKSApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsKPj4gLcKgwqDCoCBtZW1n
dWFyZF91bmd1YXJkX3JhbmdlKHBhZ2VfdG9fdmlydChwZyksIDEgPDwgKG9yZGVyICsgUEFHRV9T
SElGVCkpOwo+PiArwqDCoMKgIHJldCA9IHBhZ2VfdG9fdmlydChwZyk7Cj4+ICvCoMKgwqAgbWVt
Z3VhcmRfdW5ndWFyZF9yYW5nZShyZXQsIDEgPDwgKG9yZGVyICsgUEFHRV9TSElGVCkpOwo+PiAr
wqDCoMKgIG1hcF9wYWdlc190b194ZW4oKHVuc2lnbmVkIGxvbmcpcmV0LCBwYWdlX3RvX21mbihw
ZyksCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDFVTCA8PCBv
cmRlciwgUEFHRV9IWVBFUlZJU09SKTsKPiAKPiBBcyBtZW50aW9uZWQgZWFybGllciBvbiBmb3Ig
QXJtLCB4ZW5oZWFwIHdpbGwgYWx3YXlzIGJlIG1hcHBlZC4gU28gCj4gdW5sZXNzIHlvdSBoYXZl
IHBsYW4gdG8gdGFja2xlIHRoZSBBcm0gc2lkZSBhcyB3ZWxsLCB3ZSBzaG91bGQgbWFrZSBzdXJl
IAo+IHRoYXQgdGhlIGJlaGF2aW9yIGlzIG5vdCBjaGFuZ2VkIGZvciBBcm0uCj4gCj4gSXQgZmVl
bHMgdG8gbWUgd2Ugd2FudCB0byBpbnRyb2R1Y2UgYSBuZXcgS2NvbmZpZyB0aGF0IGlzIHNlbGVj
dGVkIGJ5IAo+IHg4NiB0byB0ZWxsIHdoZXRoZXIgdGhlIGRpcmVjdCBtYXAgaXMgbWFwcGVkLiBJ
IHdvdWxkIHRoZW4gaW1wbGVtZW50IAo+IG1heWJlIGluIHhlbi9tbS5oIHR3byBzdHViIChvbmUg
Zm9yIHdoZW4gdGhlIGNvbmZpZyBpcyBzZWxlY3RlZCwgdGhlIAo+IG90aGVyIHdoZW4gaXQgaXMg
bm90KS4KPiAKPj4gwqDCoMKgwqDCoCByZXR1cm4gcGFnZV90b192aXJ0KHBnKTsKPj4gwqAgfQo+
PiBAQCAtMjE2NSw2ICsyMTY5LDggQEAgdm9pZCBmcmVlX3hlbmhlYXBfcGFnZXModm9pZCAqdiwg
dW5zaWduZWQgaW50IAo+PiBvcmRlcikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4g
wqDCoMKgwqDCoCBtZW1ndWFyZF9ndWFyZF9yYW5nZSh2LCAxIDw8IChvcmRlciArIFBBR0VfU0hJ
RlQpKTsKPj4gK8KgwqDCoCBBU1NFUlQoKHVuc2lnbmVkIGxvbmcpdiA+PSBESVJFQ1RNQVBfVklS
VF9TVEFSVCk7Cj4gCj4gVGhpcyBkZWZpbmUgZG9lcyBub3QgZXhpc3QgZm9yIEFybTMyIHNvIGl0
IHdpbGwgYnJlYWsgY29tcGlsYXRpb24uCj4gCj4+ICvCoMKgwqAgbWFwX3BhZ2VzX3RvX3hlbigo
dW5zaWduZWQgbG9uZyl2LCBJTlZBTElEX01GTiwgMVVMIDw8IG9yZGVyLCAKPj4gX1BBR0VfTk9O
RSk7Cj4+IMKgwqDCoMKgwqAgZnJlZV9oZWFwX3BhZ2VzKHZpcnRfdG9fcGFnZSh2KSwgb3JkZXIs
IGZhbHNlKTsKPj4gwqAgfQo+PiBAQCAtMjE4OSw2ICsyMTk1LDcgQEAgdm9pZCAqYWxsb2NfeGVu
aGVhcF9wYWdlcyh1bnNpZ25lZCBpbnQgb3JkZXIsIAo+PiB1bnNpZ25lZCBpbnQgbWVtZmxhZ3Mp
Cj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsKPj4gwqDCoMKgwqDC
oCB1bnNpZ25lZCBpbnQgaTsKPj4gK8KgwqDCoCB2b2lkICpyZXQ7Cj4+IMKgwqDCoMKgwqAgQVNT
RVJUKCFpbl9pcnEoKSk7Cj4+IEBAIC0yMjA0LDcgKzIyMTEsMTEgQEAgdm9pZCAqYWxsb2NfeGVu
aGVhcF9wYWdlcyh1bnNpZ25lZCBpbnQgb3JkZXIsIAo+PiB1bnNpZ25lZCBpbnQgbWVtZmxhZ3Mp
Cj4+IMKgwqDCoMKgwqAgZm9yICggaSA9IDA7IGkgPCAoMXUgPDwgb3JkZXIpOyBpKysgKQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgcGdbaV0uY291bnRfaW5mbyB8PSBQR0NfeGVuX2hlYXA7Cj4+IC3C
oMKgwqAgcmV0dXJuIHBhZ2VfdG9fdmlydChwZyk7Cj4+ICvCoMKgwqAgcmV0ID0gcGFnZV90b192
aXJ0KHBnKTsKPj4gK8KgwqDCoCBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKXJldCwg
cGFnZV90b19tZm4ocGcpLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAxVUwgPDwgb3JkZXIsIFBBR0VfSFlQRVJWSVNPUik7Cj4+ICsKPj4gK8KgwqDCoCByZXR1
cm4gcmV0Owo+PiDCoCB9Cj4+IMKgIHZvaWQgZnJlZV94ZW5oZWFwX3BhZ2VzKHZvaWQgKnYsIHVu
c2lnbmVkIGludCBvcmRlcikKPj4gQEAgLTIyMjIsNiArMjIzMyw5IEBAIHZvaWQgZnJlZV94ZW5o
ZWFwX3BhZ2VzKHZvaWQgKnYsIHVuc2lnbmVkIGludCAKPj4gb3JkZXIpCj4+IMKgwqDCoMKgwqAg
Zm9yICggaSA9IDA7IGkgPCAoMXUgPDwgb3JkZXIpOyBpKysgKQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgcGdbaV0uY291bnRfaW5mbyAmPSB+UEdDX3hlbl9oZWFwOwo+PiArwqDCoMKgIEFTU0VSVCgo
dW5zaWduZWQgbG9uZyl2ID49IERJUkVDVE1BUF9WSVJUX1NUQVJUKTsKPj4gK8KgwqDCoCBtYXBf
cGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKXYsIElOVkFMSURfTUZOLCAxVUwgPDwgb3JkZXIs
IAo+PiBfUEFHRV9OT05FKTsKPj4gKwoKSSBmb3Jnb3QgdG8gbWVudGlvbiBvbmUgdGhpbmcuIENh
biB5b3UgZXhwbGFpbiB3aHkgeW91IGFyZSB1c2luZyAKbWFwX3BhZ2VzX3RvX3hlbiBhbmQgbm90
IGRlc3Ryb3lfeGVuX21hcHBpbmdzIGhlcmU/CgogRnJvbSBteSB1bmRlcnN0YW5kaW5nLCB0aGUg
Zm9ybWVyIHdpbGwgbm90IHRlYXJkb3duIGludGVybWVkaWF0ZSAKcGFnZXRhYmxlcy4gSWYgdGhp
cyBpcyB3aGF0IHlvdSB3YW50IHRoZW4gcGxlYXNlIHdyaXRlIGl0IGRvd24gaW4gYSAKY29tbWVu
dC4gTm90ZSB0aGF0IEFybSBkb2VzIG5vdCBzdXBwb3J0IF9QQUdFX05PTkUgc28gc29tZXRoaW5n
IHNpbWlsYXIgCnRvIGltcGxlbWVudGF0aW9uIG9mIHZ1bm1hcCB3b3VsZCBiZSBuZWNlc3Nhcnku
CgpUaGlzIG1pZ2h0IGJlIGEgY2FsbCBmb3IgYSBoZWxwZXIgdG8gZG8gaXQuCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
