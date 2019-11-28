Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E29010CAB9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:55:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaL9D-0000oc-NQ; Thu, 28 Nov 2019 14:51:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hS1O=ZU=arm.com=mark.rutland@srs-us1.protection.inumbo.net>)
 id 1iaL9B-0000oX-Ux
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:51:57 +0000
X-Inumbo-ID: 9fa826dc-11ee-11ea-a3d3-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9fa826dc-11ee-11ea-a3d3-12813bfff9fa;
 Thu, 28 Nov 2019 14:51:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 670C430E;
 Thu, 28 Nov 2019 06:51:56 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5D2C3F68E;
 Thu, 28 Nov 2019 06:51:53 -0800 (PST)
Date: Thu, 28 Nov 2019 14:51:51 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Message-ID: <20191128145151.GB22314@lakrids.cambridge.arm.com>
References: <20191127184453.229321-1-pasha.tatashin@soleen.com>
 <20191127184453.229321-3-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127184453.229321-3-pasha.tatashin@soleen.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Subject: Re: [Xen-devel] [PATCH 2/3] arm64: remove uaccess_ttbr0 asm macros
 from cache functions
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
Cc: catalin.marinas@arm.com, stefan@agner.ch, linux@armlinux.org.uk,
 yamada.masahiro@socionext.com, will@kernel.org, boris.ostrovsky@oracle.com,
 sashal@kernel.org, sstabellini@kernel.org, jmorris@namei.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
 vladimir.murzin@arm.com, marc.zyngier@arm.com, alexios.zavras@intel.com,
 tglx@linutronix.de, allison@lohutok.net, jgross@suse.com, steve.capper@arm.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, james.morse@arm.com,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDE6NDQ6NTJQTSAtMDUwMCwgUGF2ZWwgVGF0YXNoaW4g
d3JvdGU6Cj4gV2UgY3VycmVudGx5IGR1cGxpY2F0ZSB0aGUgbG9naWMgdG8gZW5hYmxlL2Rpc2Fi
bGUgdWFjY2VzcyB2aWEgVFRCUjAsCj4gd2l0aCBDIGZ1bmN0aW9ucyBhbmQgYXNzZW1ibHkgbWFj
cm9zLiBUaGlzIGlzIGEgbWFpbnRlbmVuYWNlIGJ1cmRlbgo+IGFuZCBpcyBsaWFibGUgdG8gbGVh
ZCB0byBzdWJ0bGUgYnVncywgc28gbGV0J3MgZ2V0IHJpZCBvZiB0aGUgYXNzZW1ibHkKPiBtYWNy
b3MsIGFuZCBhbHdheXMgdXNlIHRoZSBDIGZ1bmN0aW9ucy4gVGhpcyByZXF1aXJlcyByZWZhY3Rv
cmluZwo+IHNvbWUgYXNzZW1ibHkgZnVuY3Rpb25zIHRvIGhhdmUgYSBDIHdyYXBwZXIuCgpbLi4u
XQoKPiArc3RhdGljIGlubGluZSBpbnQgaW52YWxpZGF0ZV9pY2FjaGVfcmFuZ2UodW5zaWduZWQg
bG9uZyBzdGFydCwKPiArCQkJCQkgIHVuc2lnbmVkIGxvbmcgZW5kKQo+ICt7Cj4gKwlpbnQgcnY7
CgpQbGVhc2UgbWFrZSB0aGlzICdyZXQnLCBmb3IgY29uc2lzdGVuY3kgd2l0aCBvdGhlciBhcm02
NCBjb2RlLiBXZSBvbmx5CnVzZSAncnYnIGluIG9uZSBwbGFjZSB3aGVyZSBpdCdzIHNob3J0IGZv
ciAiUmV2aXNpb24gYW5kIFZhcmlhbnQiLCBhbmQKJ3JldCcgaXMgb3VyIHVzdWFsIG5hbWUgZm9y
IGEgdGVtcG9yYXJ5IHZhcmlhYmxlIHVzZWQgdG8gaG9sZCBhIHJldHVybgp2YWx1ZS4KCj4gKwo+
ICsJaWYgKGNwdXNfaGF2ZV9jb25zdF9jYXAoQVJNNjRfSEFTX0NBQ0hFX0RJQykpIHsKPiArCQlp
c2IoKTsKPiArCQlyZXR1cm4gMDsKPiArCX0KPiArCXVhY2Nlc3NfdHRicjBfZW5hYmxlKCk7CgpQ
bGVhc2UgcGxhY2UgYSBuZXdsaW5lIGJldHdlZW4gdGhlc2UgdHdvLCBmb3IgY29uc2lzdGVuY3kg
d2l0aCBvdGhlcgphcm02NCBjb2RlLgoKPiArCXJ2ID0gYXNtX2ludmFsaWRhdGVfaWNhY2hlX3Jh
bmdlKHN0YXJ0LCBlbmQpOwo+ICsJdWFjY2Vzc190dGJyMF9kaXNhYmxlKCk7Cj4gKwo+ICsJcmV0
dXJuIHJ2Owo+ICt9Cj4gKwo+ICBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfaWNhY2hlX3Jhbmdl
KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQo+ICB7Cj4gIAlfX2ZsdXNo
X2ljYWNoZV9yYW5nZShzdGFydCwgZW5kKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9j
YWNoZS5TIGIvYXJjaC9hcm02NC9tbS9jYWNoZS5TCj4gaW5kZXggZGI3NjdiMDcyNjAxLi5hNDhi
NmRiYTMwNGUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9tbS9jYWNoZS5TCj4gKysrIGIvYXJj
aC9hcm02NC9tbS9jYWNoZS5TCj4gQEAgLTE1LDcgKzE1LDcgQEAKPiAgI2luY2x1ZGUgPGFzbS9h
c20tdWFjY2Vzcy5oPgo+ICAKPiAgLyoKPiAtICoJZmx1c2hfaWNhY2hlX3JhbmdlKHN0YXJ0LGVu
ZCkKPiArICoJX19hc21fZmx1c2hfaWNhY2hlX3JhbmdlKHN0YXJ0LGVuZCkKPiAgICoKPiAgICoJ
RW5zdXJlIHRoYXQgdGhlIEkgYW5kIEQgY2FjaGVzIGFyZSBjb2hlcmVudCB3aXRoaW4gc3BlY2lm
aWVkIHJlZ2lvbi4KPiAgICoJVGhpcyBpcyB0eXBpY2FsbHkgdXNlZCB3aGVuIGNvZGUgaGFzIGJl
ZW4gd3JpdHRlbiB0byBhIG1lbW9yeSByZWdpb24sCj4gQEAgLTI0LDExICsyNCwxMSBAQAo+ICAg
KgktIHN0YXJ0ICAgLSB2aXJ0dWFsIHN0YXJ0IGFkZHJlc3Mgb2YgcmVnaW9uCj4gICAqCS0gZW5k
ICAgICAtIHZpcnR1YWwgZW5kIGFkZHJlc3Mgb2YgcmVnaW9uCj4gICAqLwo+IC1FTlRSWShfX2Zs
dXNoX2ljYWNoZV9yYW5nZSkKPiArRU5UUlkoX19hc21fZmx1c2hfaWNhY2hlX3JhbmdlKQo+ICAJ
LyogRkFMTFRIUk9VR0ggKi8KPiAgCj4gIC8qCj4gLSAqCV9fZmx1c2hfY2FjaGVfdXNlcl9yYW5n
ZShzdGFydCxlbmQpCj4gKyAqCV9fYXNtX2ZsdXNoX2NhY2hlX3VzZXJfcmFuZ2Uoc3RhcnQsZW5k
KQo+ICAgKgo+ICAgKglFbnN1cmUgdGhhdCB0aGUgSSBhbmQgRCBjYWNoZXMgYXJlIGNvaGVyZW50
IHdpdGhpbiBzcGVjaWZpZWQgcmVnaW9uLgo+ICAgKglUaGlzIGlzIHR5cGljYWxseSB1c2VkIHdo
ZW4gY29kZSBoYXMgYmVlbiB3cml0dGVuIHRvIGEgbWVtb3J5IHJlZ2lvbiwKPiBAQCAtMzcsOCAr
MzcsNyBAQCBFTlRSWShfX2ZsdXNoX2ljYWNoZV9yYW5nZSkKPiAgICoJLSBzdGFydCAgIC0gdmly
dHVhbCBzdGFydCBhZGRyZXNzIG9mIHJlZ2lvbgo+ICAgKgktIGVuZCAgICAgLSB2aXJ0dWFsIGVu
ZCBhZGRyZXNzIG9mIHJlZ2lvbgo+ICAgKi8KPiAtRU5UUlkoX19mbHVzaF9jYWNoZV91c2VyX3Jh
bmdlKQo+IC0JdWFjY2Vzc190dGJyMF9lbmFibGUgeDIsIHgzLCB4NAo+ICtFTlRSWShfX2FzbV9m
bHVzaF9jYWNoZV91c2VyX3JhbmdlKQo+ICBhbHRlcm5hdGl2ZV9pZiBBUk02NF9IQVNfQ0FDSEVf
SURDCgpJdCdzIHVuZm9ydHVuYXRlIHRoYXQgd2UgcHVsbGVkIHRoZSBJREMgYWx0ZXJuYXRpdmUg
b3V0IGZvcgppbnZhbGlkYXRlX2ljYWNoZV9yYW5nZSgpLCBidXQgbm90IGhlcmUuCgpJZiB3ZSB3
YW50IHRvIHB1bGwgb3V0IHRoYXQsIHRoZW4gSSByZWNrb24gd2hhdCB3ZSBtaWdodCB3YW50IHRv
IGRvIGlzCmhhdmUgdHdvIGFzbSBwcmltaXRpdmVzOgoKKiBfX2FzbV9jbGVhbl9kY2FjaGVfcmFu
Z2UKKiBfX2FzbV9pbnZhbGlkYXRlX2ljYWNoZV9yYW5nZQoKLi4uIHdoaWNoIGp1c3QgZG8gdGhl
IGJ5X2xpbmUgb3AsIHdpdGggYSBmaXh1cCB0aGF0IGNhbiByZXR1cm4gLUVGQVVMVC4KClRoZW4g
d2UgY2FuIGdpdmUgZWFjaCBhIEMgd3JhcHBlciB0aGF0IGp1c3QgZG9lcyB0aGUgSURDL0RJQyBj
aGVjaywgZS5nLgoKc3RhdGljIGludCBfX2NsZWFuX2RjYWNoZV9yYW5nZSh1bnNpZ25lZCBsb25n
IHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCkKewoJaWYgKGNwdXNfaGF2ZV9jb25zdF9jYXAoQVJN
NjRfSEFTX0NBQ0hFX0lEQykpIHsKCQlkc2IoaXNoc3QpOwoJCXJldHVybiAwOwoJfQoKCXJldHVy
biBfX2FzbV9jbGVhbl9kY2FjaGVfcmFuZ2Uoc3RhcnQsIGVuZCk7Cn0KClRoZW4gd2UgY2FuIGJ1
aWxkIGFsbCB0aGUgbW9yZSBjb21wbGljYXRlZCB2YXJpYW50cyBhdG9wIG9mIHRob3NlLCBlLmcu
CgpzdGF0aWMgaW50IF9fZmx1c2hfY2FjaGVfdXNlcl9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0
LCB1bnNpZ25lZCBsb25nIGVuZCkKewoJaW50IHJldDsKCgl1YWNjZXNzX3R0YnIwX2VuYWJsZSgp
OwoKCXJldCA9IF9fY2xlYW5fZGNhY2hlX3JhbmdlKHN0YXJ0LCBlbmQpOwoJaWYgKHJldCkKCQln
b3RvIG91dDsKCQoJcmV0ID0gX19pbnZhbGlkYXRlX2ljYWNoZV9yYW5nZShzdGFydCwgZW5kKTsK
Cm91dDoKCXVhY2Nlc3NfdHRicjBfZGlzYWJsZSgpOwoJcmV0dXJuIHJldDsKfQoKVGhhbmtzLApN
YXJrLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
