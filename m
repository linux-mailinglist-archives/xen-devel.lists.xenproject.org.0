Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D46B18FAB
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 19:52:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOnBJ-0004d1-9m; Thu, 09 May 2019 17:50:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UEDQ=TJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOnBH-0004cv-BX
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 17:50:07 +0000
X-Inumbo-ID: e0e7674a-7282-11e9-abb8-0b3e9edf9fcd
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0e7674a-7282-11e9-abb8-0b3e9edf9fcd;
 Thu, 09 May 2019 17:50:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A54B20675;
 Thu,  9 May 2019 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557424205;
 bh=oPhGaCd1/FLYmwKT4a9dqV2WFLwn5WBXBsEQ0a+ySRE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=QBS4/GLg3kMVvQNsU28GPxjuBnoNfaZnzaZvqk8QLn+X6WhhXoMfQs9+AEoALpO9m
 T0Zges4g1O2qFzv6efc7DbE/Mw8IJVAKKyBPp2Ykwhf6WWWCz7n//5QC1Kx8Pi+BuH
 0+Vu0zvBndoRo2v1NpAB8WRs+78zWjQ3vzV3hhJ0=
Date: Thu, 9 May 2019 10:50:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190507151458.29350-2-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905091049250.25766@sstabellini-ThinkPad-T480s>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-2-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 01/14] xen/arm: Use mfn_to_pdx instead of
 pfn_to_pdx when possible
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCA3IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gbWZuX3RvX3BkeCBhZGRz
IG1vcmUgc2FmZXR5IHRoYW4gcGZuX3RvX3BkeC4gUmVwbGFjZSBhbGwgYnV0IG9uIHBsYWNlIGlu
Cj4gdGhlIEFybSBjb2RlIHRvIHVzZSB0aGUgZm9ybWVyLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KCgo+IC0tLQo+ICAgICBUaGVyZSBhcmUgc3RpbGwgb25lIHVzZSBvZiBwZm5fdG9fcGR4
IGluIHRoZSBBcm0gY29kZSAoc2VlCj4gICAgIG1mbl92YWxpZCkuIElkZWFsbHkgd2Ugd291bGQg
d2FudCB0byBzd2l0Y2ggX19tZm5fdmFsaWQoLi4uKSB0byBiZQo+ICAgICB0eXBlc2FmZSBidXQg
aXQgbG9va3MgbGlrZSBpdCBkb2VzIG5vdCBjb21waWxlIG9uIHg4Ni4gRm9yIHRoZQo+ICAgICBk
ZXRhaWxzIHNlZTogPDAyNDc4ZmY4LWQxZTItYWJlMS03NGE1LWNhNzJhYjg3ZjE1NEBhcm0uY29t
Pgo+IAo+ICAgICBUaGlzIGlzIHVubGlrZWx5IGdvaW5nIHRvIGJlIGhhbmRsZWQgaW4gdGhpcyBz
ZXJpZXMuCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9tbS5jICAgICAgICB8IDIgKy0KPiAgeGVuL2lu
Y2x1ZGUvYXNtLWFybS9tbS5oIHwgNiArKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9t
bS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPiBpbmRleCAwMWFlMmNjY2MwLi5iZTUzMzhiYjRjIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMK
PiBAQCAtODg2LDcgKzg4Niw3IEBAIHZvaWQgX19pbml0IHNldHVwX2ZyYW1ldGFibGVfbWFwcGlu
Z3MocGFkZHJfdCBwcywgcGFkZHJfdCBwZSkKPiAgICAgIGludCBpOwo+ICAjZW5kaWYKPiAgCj4g
LSAgICBmcmFtZXRhYmxlX2Jhc2VfcGR4ID0gcGZuX3RvX3BkeChwcyA+PiBQQUdFX1NISUZUKTsK
PiArICAgIGZyYW1ldGFibGVfYmFzZV9wZHggPSBtZm5fdG9fcGR4KG1hZGRyX3RvX21mbihwcykp
Owo+ICAgICAgLyogUm91bmQgdXAgdG8gMk0gb3IgMzJNIGJvdW5kYXJ5LCBhcyBhcHByb3ByaWF0
ZS4gKi8KPiAgICAgIGZyYW1ldGFibGVfc2l6ZSA9IFJPVU5EVVAoZnJhbWV0YWJsZV9zaXplLCBt
YXBwaW5nX3NpemUpOwo+ICAgICAgYmFzZV9tZm4gPSBhbGxvY19ib290X3BhZ2VzKGZyYW1ldGFi
bGVfc2l6ZSA+PiBQQUdFX1NISUZULCAzMjw8KDIwLTEyKSk7Cj4gZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL2FzbS1hcm0vbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+IGluZGV4IGVh
ZmEyNmY1NmUuLjdiNmFhZjVlM2YgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9t
bS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4gQEAgLTIyNSw3ICsyMjUsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAqaW9yZW1hcF93YyhwYWRkcl90IHN0YXJ0LCBz
aXplX3QgbGVuKQo+ICAvKiBDb252ZXJ0IGJldHdlZW4gZnJhbWUgbnVtYmVyIGFuZCBhZGRyZXNz
IGZvcm1hdHMuICAqLwo+ICAjZGVmaW5lIHBmbl90b19wYWRkcihwZm4pICgocGFkZHJfdCkocGZu
KSA8PCBQQUdFX1NISUZUKQo+ICAjZGVmaW5lIHBhZGRyX3RvX3BmbihwYSkgICgodW5zaWduZWQg
bG9uZykoKHBhKSA+PiBQQUdFX1NISUZUKSkKPiAtI2RlZmluZSBwYWRkcl90b19wZHgocGEpICAg
IHBmbl90b19wZHgocGFkZHJfdG9fcGZuKHBhKSkKPiArI2RlZmluZSBwYWRkcl90b19wZHgocGEp
ICAgIG1mbl90b19wZHgobWFkZHJfdG9fbWZuKHBhKSkKPiAgI2RlZmluZSBnZm5fdG9fZ2FkZHIo
Z2ZuKSAgIHBmbl90b19wYWRkcihnZm5feChnZm4pKQo+ICAjZGVmaW5lIGdhZGRyX3RvX2dmbihn
YSkgICAgX2dmbihwYWRkcl90b19wZm4oZ2EpKQo+ICAjZGVmaW5lIG1mbl90b19tYWRkcihtZm4p
ICAgcGZuX3RvX3BhZGRyKG1mbl94KG1mbikpCj4gQEAgLTI1Myw3ICsyNTMsNyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgKm1hZGRyX3RvX3ZpcnQocGFkZHJfdCBtYSkKPiAgI2Vsc2UKPiAgc3RhdGlj
IGlubGluZSB2b2lkICptYWRkcl90b192aXJ0KHBhZGRyX3QgbWEpCj4gIHsKPiAtICAgIEFTU0VS
VChwZm5fdG9fcGR4KG1hID4+IFBBR0VfU0hJRlQpIDwgKERJUkVDVE1BUF9TSVpFID4+IFBBR0Vf
U0hJRlQpKTsKPiArICAgIEFTU0VSVChtZm5fdG9fcGR4KG1hZGRyX3RvX21mbihtYSkpIDwgKERJ
UkVDVE1BUF9TSVpFID4+IFBBR0VfU0hJRlQpKTsKPiAgICAgIHJldHVybiAodm9pZCAqKShYRU5I
RUFQX1ZJUlRfU1RBUlQgLQo+ICAgICAgICAgICAgICAgICAgICAgIG1mbl90b19tYWRkcih4ZW5o
ZWFwX21mbl9zdGFydCkgKwo+ICAgICAgICAgICAgICAgICAgICAgICgobWEgJiBtYV92YV9ib3R0
b21fbWFzaykgfAo+IEBAIC0zMDEsNyArMzAxLDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFn
ZV9pbmZvICp2aXJ0X3RvX3BhZ2UoY29uc3Qgdm9pZCAqdikKPiAgICAgIEFTU0VSVCh2YSA8IHhl
bmhlYXBfdmlydF9lbmQpOwo+ICAKPiAgICAgIHBkeCA9ICh2YSAtIFhFTkhFQVBfVklSVF9TVEFS
VCkgPj4gUEFHRV9TSElGVDsKPiAtICAgIHBkeCArPSBwZm5fdG9fcGR4KG1mbl94KHhlbmhlYXBf
bWZuX3N0YXJ0KSk7Cj4gKyAgICBwZHggKz0gbWZuX3RvX3BkeCh4ZW5oZWFwX21mbl9zdGFydCk7
Cj4gICAgICByZXR1cm4gZnJhbWVfdGFibGUgKyBwZHggLSBmcmFtZXRhYmxlX2Jhc2VfcGR4Owo+
ICB9Cj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
