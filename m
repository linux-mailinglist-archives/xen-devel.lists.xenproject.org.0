Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249DA429EF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 16:51:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb4Yb-0000ni-A4; Wed, 12 Jun 2019 14:48:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uepN=UL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hb4Ya-0000nd-AN
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 14:48:56 +0000
X-Inumbo-ID: 32b4fe23-8d21-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 32b4fe23-8d21-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 14:48:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46CDF2B;
 Wed, 12 Jun 2019 07:48:53 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADB5E3F557;
 Wed, 12 Jun 2019 07:48:52 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1906111710110.13737@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a1921f46-f042-f167-4461-72b903a9418d@arm.com>
Date: Wed, 12 Jun 2019 15:48:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906111710110.13737@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 06/12] xen/arm: mm: Sanity check
 any update of Xen page tables
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDEyLzA2LzIwMTkgMDE6MTAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDE0IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFRoZSBjb2Rl
IGhhbmRsaW5nIFhlbiBQVCB1cGRhdGUgaGFzIHF1aXRlIGEgZmV3IHJlc3RyaWN0aW9ucyBvbiB3
aGF0IGl0Cj4+IGNhbiBkby4gVGhpcyBpcyBub3QgYSBiYWQgdGhpbmcgYXMgaXQga2VlcHMgdGhl
IGNvZGUgc2ltcGxlLgo+Pgo+PiBUaGVyZSBhcmUgYWxyZWFkeSBhIGZldyBjaGVja3Mgc2NhdHRl
cmVkIGluIGN1cnJlbnQgcGFnZSB0YWJsZSBoYW5kbGluZy4KPj4gSG93ZXZlciB0aGV5IGFyZSBu
b3Qgc3VmZmljaWVudCBhcyB0aGV5IGNvdWxkIHN0aWxsIGFsbG93IHRvCj4+IG1vZGlmeS9yZW1v
dmUgZW50cnkgd2l0aCBjb250aWd1b3VzIGJpdCBzZXQuCj4+Cj4+IFRoZSBjaGVja3MgYXJlIGRp
dmlkZWQgaW4gdHdvIHNldHM6Cj4+ICAgICAgLSBwZXIgZW50cnkgY2hlY2s6IFRoZXkgYXJlIGdh
dGhlcmVkIGluIGEgbmV3IGZ1bmN0aW9uIHRoYXQgd2lsbAo+PiAgICAgIGNoZWNrIHdoZXRoZXIg
YW4gdXBkYXRlIGlzIHZhbGlkIGJhc2VkIG9uIHRoZSBmbGFncyBwYXNzZWQgYW5kIHRoZQo+PiAg
ICAgIGN1cnJlbnQgdmFsdWUgb2YgYW4gZW50cnkuCj4+ICAgICAgLSBnbG9iYWwgY2hlY2s6IFRo
ZXkgYXJlIHNhbml0eSBjaGVjayBvbiB4ZW5fcHRfdXBkYXRlKCkgcGFyYW1ldGVycy4KPj4KPj4g
QWRkaXRpb25hbGx5IHRvIGNvbnRpZ3VvdXMgY2hlY2ssIHdlIGFsc28gbm93IGNoZWNrIHRoYXQg
dGhlIGNhbGxlciBpcwo+PiBub3QgdHJ5aW5nIHRvIG1vZGlmeSB0aGUgbWVtb3J5IGF0dHJpYnV0
ZXMgb2YgYW4gZW50cnkuCj4+Cj4+IExhc3RseSwgaXQgd2FzIHByb2JhYmx5IGEgYml0IG92ZXIg
dGhlIHRvcCB0byBmb3JiaWQgcmVtb3ZpbmcgYW4KPj4gaW52YWxpZCBtYXBwaW5nLiBUaGlzIGNv
dWxkIGp1c3QgYmUgaWdub3JlZC4gVGhlIG5ldyBiZWhhdmlvciB3aWxsIGJlCj4+IGhlbHBmdWwg
aW4gZnV0dXJlIGNoYW5nZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Cj4+IFJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlf
YW5pc292QGVwYW0uY29tPgo+Pgo+PiAtLS0KPj4gICAgICBDaGFuZ2VzIGluIHYyOgo+PiAgICAg
ICAgICAtIENvcnJlY3RseSBkZXRlY3QgdGhlIHJlbW92YWwgb2YgYSBwYWdlCj4+ICAgICAgICAg
IC0gRml4IEFTU0VSVCBvbiBmbGFncyBpbiB0aGUgZWxzZSBjYXNlCj4+ICAgICAgICAgIC0gQWRk
IEFuZHJpaSdzIHJldmlld2VkLWJ5Cj4+IC0tLQo+PiAgIHhlbi9hcmNoL2FybS9tbS5jIHwgMTE1
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPj4g
aW5kZXggMjE5MmRlZGU1NS4uNDVhNmY5Mjg3ZiAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJt
L21tLmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMKPj4gQEAgLTUwLDYgKzUwLDE5IEBAIHN0
cnVjdCBkb21haW4gKmRvbV94ZW4sICpkb21faW8sICpkb21fY293Owo+PiAgICN1bmRlZiBtZm5f
dG9fdmlydAo+PiAgICNkZWZpbmUgbWZuX3RvX3ZpcnQobWZuKSBfX21mbl90b192aXJ0KG1mbl94
KG1mbikpCj4+ICAgCj4+ICsjaWZkZWYgTkRFQlVHCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQKPj4g
K19fYXR0cmlidXRlX18gKChfX2Zvcm1hdF9fIChfX3ByaW50Zl9fLCAxLCAyKSkpCj4+ICttbV9w
cmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pIHt9Cj4+ICsjZWxzZQo+PiArI2RlZmluZSBtbV9w
cmludGsoZm10LCBhcmdzLi4uKSAgICAgICAgICAgICBcCj4+ICsgICAgZG8gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICB7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIGZtdCwg
IyMgYXJncyk7ICBcCj4+ICsgICAgICAgIFdBUk4oKTsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPj4gKyAgICB9IHdoaWxlICgwKTsKPj4gKyNlbmRpZgo+PiArCj4+ICAgI2RlZmluZSBE
RUZJTkVfUEFHRV9UQUJMRVMobmFtZSwgbnIpICAgICAgICAgICAgICAgICAgICBcCj4+ICAgbHBh
ZV90IF9fYWxpZ25lZChQQUdFX1NJWkUpIG5hbWVbTFBBRV9FTlRSSUVTICogKG5yKV0KPj4gICAK
Pj4gQEAgLTk2OCwxMiArOTgxLDc0IEBAIGVudW0geGVubWFwX29wZXJhdGlvbiB7Cj4+ICAgICAg
IFJFU0VSVkUKPj4gICB9Owo+PiAgIAo+PiArLyogU2FuaXR5IGNoZWNrIG9mIHRoZSBlbnRyeSAq
Lwo+PiArc3RhdGljIGJvb2wgeGVuX3B0X2NoZWNrX2VudHJ5KGxwYWVfdCBlbnRyeSwgbWZuX3Qg
bWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4+ICt7Cj4+ICsgICAgLyogU2FuaXR5IGNoZWNrIHdo
ZW4gbW9kaWZ5aW5nIGEgcGFnZS4gKi8KPj4gKyAgICBpZiAoIChmbGFncyAmIF9QQUdFX1BSRVNF
TlQpICYmIG1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCj4+ICsgICAgewo+IAo+IEkgdW5kZXJz
dGFuZCB3ZSBjb3VsZCBza2lwIHRoZSB2YWxpZCBjaGVjayBvbiBSRU1PVkUsIGJ1dCBzaG91bGQg
d2Ugc2tpcAo+IGl0IG9uIE1PRElGWSB0b28/IElzIHRoYXQgYWxzbyBnb2luZyB0byBiZSBoZWxw
ZnVsIGluIGZ1dHVyZSBjaGFuZ2VzPwoKSG1tbSwgSSBjYW4ndCBleGFjdGx5IHJlbWVtYmVyIHdo
eSBJIGRpZG4ndCBjaGVjayB0aGUgdmFsaWQgYml0IGhlcmUuCgpJIGRpZCBpdCBmb3IgUkVNT1ZF
IGFzIGZvciB0aGUgZWFybHkgRkRUIG1hcHBpbmcgaXQgaXMgbW9yZSBjb252ZW5pZW50IHRvIHJl
bW92ZSAKdGhlIGZ1bGwgcG9zc2libGUgcmFuZ2Ugb3ZlciBrZWVwaW5nIHRyYWNrIG9mIHRoZSBl
eGFjdCBzdGFydC9zaXplLgoKSSB3b3VsZCBhc3N1bWUgdGhlIHNhbWUgd291bGQgaG9sZCBmb3Ig
TU9ESUZZLCBidXQgSSBkb24ndCBoYXZlIGEgY29uY3JldGUgCmV4YW1wbGUgaGVyZS4gSSBhbSBo
YXBweSB0byBhZGQgdGhlIHZhbGlkIGNoZWNrIGFuZCBkZWZlciB0aGUgZGVjaXNpb24gdG8gcmVt
b3ZlIAppdCBpZiBpdCBpcyBkZWVtIHRvIGJlIHVzZWZ1bCBpbiB0aGUgZnV0dXJlLgoKPiAKPiAK
Pj4gKyAgICAgICAgLyogV2UgZG9uJ3QgYWxsb3cgY2hhbmdpbmcgbWVtb3J5IGF0dHJpYnV0ZXMu
ICovCj4+ICsgICAgICAgIGlmICggZW50cnkucHQuYWkgIT0gUEFHRV9BSV9NQVNLKGZsYWdzKSAp
Cj4+ICsgICAgICAgIHsKPj4gKyAgICAgICAgICAgIG1tX3ByaW50aygiTW9kaWZ5aW5nIG1lbW9y
eSBhdHRyaWJ1dGVzIGlzIG5vdCBhbGxvd2VkICgweCV4IC0+IDB4JXgpLlxuIiwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICBlbnRyeS5wdC5haSwgUEFHRV9BSV9NQVNLKGZsYWdzKSk7Cj4+ICsg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+ICsgICAgICAgIH0KPj4gKwo+PiArICAgICAgICAv
KiBXZSBkb24ndCBhbGxvdyBtb2RpZnlpbmcgZW50cnkgd2l0aCBjb250aWd1b3VzIGJpdCBzZXQu
ICovCj4+ICsgICAgICAgIGlmICggZW50cnkucHQuY29udGlnICkKPj4gKyAgICAgICAgewo+PiAr
ICAgICAgICAgICAgbW1fcHJpbnRrKCJNb2RpZnlpbmcgZW50cnkgd2l0aCBjb250aWd1b3VzIGJp
dCBzZXQgaXMgbm90IGFsbG93ZWQuXG4iKTsKPj4gKyAgICAgICAgICAgIHJldHVybiBmYWxzZTsK
Pj4gKyAgICAgICAgfQo+PiArICAgIH0KPj4gKyAgICAvKiBTYW5pdHkgY2hlY2sgd2hlbiBpbnNl
cnRpbmcgYSBwYWdlICovCj4+ICsgICAgZWxzZSBpZiAoIGZsYWdzICYgX1BBR0VfUFJFU0VOVCAp
Cj4+ICsgICAgewo+PiArICAgICAgICAvKiBXZSBzaG91bGQgYmUgaGVyZSB3aXRoIGEgdmFsaWQg
TUZOLiAqLwo+PiArICAgICAgICBBU1NFUlQoIW1mbl9lcShtZm4sIElOVkFMSURfTUZOKSk7Cj4+
ICsKPj4gKyAgICAgICAgLyogV2UgZG9uJ3QgYWxsb3cgcmVwbGFjaW5nIGFueSB2YWxpZCBlbnRy
eS4gKi8KPj4gKyAgICAgICAgaWYgKCBscGFlX2lzX3ZhbGlkKGVudHJ5KSApCj4+ICsgICAgICAg
IHsKPj4gKyAgICAgICAgICAgIG1tX3ByaW50aygiQ2hhbmdpbmcgTUZOIGZvciBhIHZhbGlkIGVu
dHJ5IGlzIG5vdCBhbGxvd2VkICglIyJQUklfbWZuIiAtPiAlIyJQUklfbWZuIikuXG4iLAo+PiAr
ICAgICAgICAgICAgICAgICAgICAgIG1mbl94KGxwYWVfZ2V0X21mbihlbnRyeSkpLCBtZm5feCht
Zm4pKTsKPj4gKyAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPj4gKyAgICAgICAgfQo+PiArICAg
IH0KPj4gKyAgICAvKiBTYW5pdHkgY2hlY2sgd2hlbiByZW1vdmluZyBhIHBhZ2UuICovCj4+ICsg
ICAgZWxzZSBpZiAoIChmbGFncyAmIChfUEFHRV9QUkVTRU5UfF9QQUdFX1BPUFVMQVRFKSkgPT0g
MCApCj4+ICsgICAgewo+PiArICAgICAgICAvKiBXZSBzaG91bGQgYmUgaGVyZSB3aXRoIGFuIGlu
dmFsaWQgTUZOLiAqLwo+PiArICAgICAgICBBU1NFUlQobWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4p
KTsKPj4gKwo+PiArICAgICAgICAvKiBXZSBkb24ndCBhbGxvdyByZW1vdmluZyBwYWdlIHdpdGgg
Y29udGlndW91cyBiaXQgc2V0LiAqLwo+PiArICAgICAgICBpZiAoIGVudHJ5LnB0LmNvbnRpZyAp
Cj4+ICsgICAgICAgIHsKPj4gKyAgICAgICAgICAgIG1tX3ByaW50aygiUmVtb3ZpbmcgZW50cnkg
d2l0aCBjb250aWd1b3VzIGJpdCBzZXQgaXMgbm90IGFsbG93ZWQuXG4iKTsKPj4gKyAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPj4gKyAgICAgICAgfQo+PiArICAgIH0KPj4gKyAgICAvKiBTYW5p
dHkgY2hlY2sgd2hlbiBwb3B1bGF0aW5nIHRoZSBwYWdlLXRhYmxlLiBObyBjaGVjayBzbyBmYXIu
ICovCj4+ICsgICAgZWxzZQo+PiArICAgIHsKPj4gKyAgICAgICAgQVNTRVJUKGZsYWdzICYgX1BB
R0VfUE9QVUxBVEUpOwo+PiArICAgICAgICAvKiBXZSBzaG91bGQgYmUgaGVyZSB3aXRoIGFuIGlu
dmFsaWQgTUZOICovCj4+ICsgICAgICAgIEFTU0VSVChtZm5fZXEobWZuLCBJTlZBTElEX01GTikp
Owo+PiArICAgIH0KPj4gKwo+PiArICAgIHJldHVybiB0cnVlOwo+PiArfQo+PiArCj4+ICAgc3Rh
dGljIGludCB4ZW5fcHRfdXBkYXRlX2VudHJ5KGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwgdW5z
aWduZWQgbG9uZyBhZGRyLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZm5f
dCBtZm4sIHVuc2lnbmVkIGludCBmbGFncykKPj4gICB7Cj4+ICAgICAgIGxwYWVfdCBwdGUsICpl
bnRyeTsKPj4gICAgICAgbHBhZV90ICp0aGlyZCA9IE5VTEw7Cj4+ICAgCj4+ICsgICAgLyogX1BB
R0VfUE9QVUxBVEUgYW5kIF9QQUdFX1BSRVNFTlQgc2hvdWxkIG5ldmVyIGJlIHNldCB0b2dldGhl
ci4gKi8KPj4gKyAgICBBU1NFUlQoKGZsYWdzICYgKF9QQUdFX1BPUFVMQVRFfF9QQUdFX1BSRVNF
TlQpKSAhPSAoX1BBR0VfUE9QVUxBVEV8X1BBR0VfUFJFU0VOVCkpOwo+IAo+IG92ZXIgODAgY2hh
cnM/CgpJdCBpcyA4NyBjaGFycywgSSB3YXMgaG9waW5nIHlvdSBkaWRuJ3Qgbm90aWNlIGl0IDop
LiBUaGUgbGluZSBzcGxpdHRpbmcgcmVzdWx0IAp0byBuYXN0eSBjb2RlLiBBbHRlcm5hdGl2ZWx5
LCBJIGNvdWxkIGludHJvZHVjZSBhIGRlZmluZSBmb3IgCl9QQUdFX1BPUFVMQVRFfF9QQUdFX1BS
RVNFTlQsIG1heWJlIEVYQ0xVU0lWRV9GTEFHUz8KCkFueSBwcmVmZXJlbmNlPwoKPiAKPiAKPj4g
ICAgICAgZW50cnkgPSAmeGVuX3NlY29uZFtzZWNvbmRfbGluZWFyX29mZnNldChhZGRyKV07Cj4+
ICAgICAgIGlmICggIWxwYWVfaXNfdmFsaWQoKmVudHJ5KSB8fCAhbHBhZV9pc190YWJsZSgqZW50
cnksIDIpICkKPj4gICAgICAgewo+PiBAQCAtOTg5LDE1ICsxMDY0LDEyIEBAIHN0YXRpYyBpbnQg
eGVuX3B0X3VwZGF0ZV9lbnRyeShlbnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsIHVuc2lnbmVkIGxv
bmcgYWRkciwKPj4gICAgICAgdGhpcmQgPSBtZm5fdG9fdmlydChscGFlX2dldF9tZm4oKmVudHJ5
KSk7Cj4+ICAgICAgIGVudHJ5ID0gJnRoaXJkW3RoaXJkX3RhYmxlX29mZnNldChhZGRyKV07Cj4+
ICAgCj4+ICsgICAgaWYgKCAheGVuX3B0X2NoZWNrX2VudHJ5KCplbnRyeSwgbWZuLCBmbGFncykg
KQo+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gKwo+PiAgICAgICBzd2l0Y2ggKCBvcCAp
IHsKPj4gICAgICAgICAgIGNhc2UgSU5TRVJUOgo+PiAgICAgICAgICAgY2FzZSBSRVNFUlZFOgo+
PiAtICAgICAgICAgICAgaWYgKCBscGFlX2lzX3ZhbGlkKCplbnRyeSkgKQo+PiAtICAgICAgICAg
ICAgewo+PiAtICAgICAgICAgICAgICAgIHByaW50aygiJXM6IHRyeWluZyB0byByZXBsYWNlIGFu
IGV4aXN0aW5nIG1hcHBpbmcgYWRkcj0lbHggbWZuPSUiUFJJX21mbiJcbiIsCj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgIF9fZnVuY19fLCBhZGRyLCBtZm5feChtZm4pKTsKPj4gLSAgICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gLSAgICAgICAgICAgIH0KPj4gICAgICAgICAgICAg
ICBpZiAoIG9wID09IFJFU0VSVkUgKQo+PiAgICAgICAgICAgICAgICAgICBicmVhazsKPj4gICAg
ICAgICAgICAgICBwdGUgPSBtZm5fdG9feGVuX2VudHJ5KG1mbiwgUEFHRV9BSV9NQVNLKGZsYWdz
KSk7Cj4+IEBAIC0xMDA5LDEyICsxMDgxLDYgQEAgc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlX2Vu
dHJ5KGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+PiAgICAg
ICAgICAgICAgIGJyZWFrOwo+PiAgICAgICAgICAgY2FzZSBNT0RJRlk6Cj4+ICAgICAgICAgICBj
YXNlIFJFTU9WRToKPj4gLSAgICAgICAgICAgIGlmICggIWxwYWVfaXNfdmFsaWQoKmVudHJ5KSAp
Cj4+IC0gICAgICAgICAgICB7Cj4+IC0gICAgICAgICAgICAgICAgcHJpbnRrKCIlczogdHJ5aW5n
IHRvICVzIGEgbm9uLWV4aXN0aW5nIG1hcHBpbmcgYWRkcj0lbHhcbiIsCj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgIF9fZnVuY19fLCBvcCA9PSBSRU1PVkUgPyAicmVtb3ZlIiA6ICJtb2RpZnki
LCBhZGRyKTsKPj4gLSAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gLSAgICAgICAg
ICAgIH0KPj4gICAgICAgICAgICAgICBpZiAoIG9wID09IFJFTU9WRSApCj4+ICAgICAgICAgICAg
ICAgICAgIHB0ZS5iaXRzID0gMDsKPj4gICAgICAgICAgICAgICBlbHNlCj4+IEBAIC0xMDIyLDEy
ICsxMDg4LDYgQEAgc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlX2VudHJ5KGVudW0geGVubWFwX29w
ZXJhdGlvbiBvcCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+PiAgICAgICAgICAgICAgICAgICBwdGUg
PSAqZW50cnk7Cj4+ICAgICAgICAgICAgICAgICAgIHB0ZS5wdC5ybyA9IFBBR0VfUk9fTUFTSyhm
bGFncyk7Cj4+ICAgICAgICAgICAgICAgICAgIHB0ZS5wdC54biA9IFBBR0VfWE5fTUFTSyhmbGFn
cyk7Cj4+IC0gICAgICAgICAgICAgICAgaWYgKCAhcHRlLnB0LnJvICYmICFwdGUucHQueG4gKQo+
PiAtICAgICAgICAgICAgICAgIHsKPj4gLSAgICAgICAgICAgICAgICAgICAgcHJpbnRrKCIlczog
SW5jb3JyZWN0IGNvbWJpbmF0aW9uIGZvciBhZGRyPSVseFxuIiwKPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF9fZnVuY19fLCBhZGRyKTsKPj4gLSAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4+IC0gICAgICAgICAgICAgICAgfQo+PiAgICAgICAgICAgICAgIH0KPj4g
ICAgICAgICAgICAgICB3cml0ZV9wdGUoZW50cnksIHB0ZSk7Cj4+ICAgICAgICAgICAgICAgYnJl
YWs7Cj4+IEBAIC0xMDQ5LDYgKzExMDksMjUgQEAgc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlKGVu
dW0geGVubWFwX29wZXJhdGlvbiBvcCwKPj4gICAgICAgaW50IHJjID0gMDsKPj4gICAgICAgdW5z
aWduZWQgbG9uZyBhZGRyID0gdmlydCwgYWRkcl9lbmQgPSBhZGRyICsgbnJfbWZucyAqIFBBR0Vf
U0laRTsKPj4gICAKPj4gKyAgICAvKgo+PiArICAgICAqIFRoZSBoYXJkd2FyZSB3YXMgY29uZmln
dXJlZCB0byBmb3JiaWQgbWFwcGluZyBib3RoIHdyaXRlYWJsZSBhbmQKPj4gKyAgICAgKiBleGVj
dXRhYmxlLgo+PiArICAgICAqIFdoZW4gbW9kaWZ5aW5nL2NyZWF0aW5nIG1hcHBpbmcgKGkuZSBf
UEFHRV9QUkVTRU5UIGlzIHNldCksCj4+ICsgICAgICogcHJldmVudCBhbnkgdXBkYXRlIGlmIHRo
aXMgaGFwcGVuLgo+PiArICAgICAqLwo+PiArICAgIGlmICggKGZsYWdzICYgX1BBR0VfUFJFU0VO
VCkgJiYgIVBBR0VfUk9fTUFTSyhmbGFncykgJiYKPj4gKyAgICAgICAgICFQQUdFX1hOX01BU0so
ZmxhZ3MpICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIG1tX3ByaW50aygiTWFwcGluZ3Mgc2hvdWxk
IG5vdCBiZSBib3RoIFdyaXRlYWJsZSBhbmQgRXhlY3V0YWJsZS5cbiIpOwo+PiArICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPj4gKyAgICB9Cj4gCj4gSSBhbSB0aGlua2luZyB0aGlzIGlzIHNlcmlv
dXMgZW5vdWdoIHRoYXQgd2UgbWlnaHQgd2FudCB0byBhbHdheXMgcHJpbnQKPiB0aGlzIHdhcm5p
bmcgd2hlbiB0aGlzIGVycm9yIGhhcHBlbnMuIEF0IHRoZSBzYW1lIHRpbWUgaXQgaXMgYXdrd2Fy
ZCB0bwo+IGhhdmUgYWxsIHRoZSBvdGhlciBtZXNzYWdlcyB1c2luZyBtbV9wcmludGsgYW5kIG9u
bHkgdGhpcyBvbmUgYmVpbmcKPiBkaWZmZXJlbnQuIFNvIEknbGwgbGl2ZSBpdCB0byB5b3UsIGl0
IGlzIGFsc28gT0sgYXQgdGhpcy4KCkFueSBlcnJvciBoZXJlIG1lYW5zIHRoZSBjYWxsZXIgZGlk
bid0IGRvIHNhbml0eSBjaGVjayAoaWYgaW5wdXQgaXMgZXh0ZXJuYWwpIG9yIApwYXNzIHRoZSB3
cm9uZyBwYXJhbWV0ZXJzLiBJIHB1cnBvc2VmdWxseSBjaG9zZSBtbV9wcmludGsgb3ZlciBhIG5v
cm1hbCBwcmludGsgCmJlY2F1c2UgdGhpcyBjb3VsZCBwb3RlbnRpYWxseSBsZWFkIHRvIGEgRG9T
IGlmIGFjY2Vzc2libGUgZnJvbSBvdXRzaWRlIG9mIFhlbi4KCklmIHRoZSBlcnJvciBoYXBwZW4s
IHRoZW4gdGhlcmUgYXJlIGFuIGhpZ2ggY2hhbmNlIHdpdGggREVCVUcgKG9yIGhhY2tpbmcgCm1t
X3ByaW50ayB0byBiZSB1c2VkIGluIG5vbi1kZWJ1ZyBidWlsZCkgd2lsbCBtYWtlIGl0IGFwcGVh
ciBhcyB3ZWxsLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
