Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80FBB93E9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 17:25:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBKjp-0001Ll-Bj; Fri, 20 Sep 2019 15:22:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZtOk=XP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iBKjm-0001LX-Vy
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 15:22:23 +0000
X-Inumbo-ID: 714b5706-dbba-11e9-b299-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 714b5706-dbba-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 15:22:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A049F2080F;
 Fri, 20 Sep 2019 15:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568992942;
 bh=J8z9FXkXbX+H6a8OrPrjakup7zPmY47VHkGgIP0DRD0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tJqWlL0jic1VJvzRBDIK0bpozxcgJ2vauVcYKsJr1v8jWLdA6wPlxIVY8NE19fONQ
 XnLGgmpv3/ce6QCSm4FbCCl0+nj4OKnTlvzTc+8tC10O2i0EA4nslVVpCkP5xfD+Pv
 tWqs2SHcZy5tR2F8JgKtcLcP92GQ1hdWyyW7T1gY=
Date: Fri, 20 Sep 2019 08:22:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190920093130.11842-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1909200821260.3272@sstabellini-ThinkPad-T480s>
References: <20190920093130.11842-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] xen/arm32: setup: Give a
 xenheap page to the boot allocator
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMCBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFmdGVyIGNvbW1pdCA2
ZTNlNzcxMjAzICJ4ZW4vYXJtOiBzZXR1cDogUmVsb2NhdGUgdGhlIERldmljZS1UcmVlIGxhdGVy
IG9uCj4gaW4gdGhlIGJvb3QiLCB0aGUgYm9vdCBhbGxvY2F0b3Igd2lsbCBub3QgcmVjZWl2ZSBh
bnkgeGVuaGVhcCBwYWdlIChpLmUuCj4gbWFwcGVkIHBhZ2UpIG9uIEFybTMyLgo+IAo+IEhvd2V2
ZXIsIHRoZSBib290IGFsbG9jYXRvciBpbXBsaWNpdGVseSByZWx5IG9uIGhhdmluZyB0aGUgZmly
c3QgcGFnZQoKImltcGxpY2l0bHkgcmVsaWVzIgoKSSBmaXhlZCB0aGUgY29tbWl0IG1lc3NhZ2Ug
YW5kIGNvbW1pdHRlZC4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CgoKPiBhbHJlYWR5IG1hcHBlZCBhbmQgdGhlcmVmb3JlIHJlc3VsdCB0
byBicmVhayBib290IG9uIEFybTMyLgo+IAo+IFRoZSBlYXNpZXN0IHdheSBmb3Igbm93IGlzIHRv
IGdpdmUgYSB4ZW5oZWFwIHBhZ2UgdG8gdGhlIGJvb3QgYWxsb2NhdG9yLgo+IFdlIG1heSB3YW50
IHRvIHJldGhpbmsgdGhlIGludGVyZmFjZSBpbiB0aGUgZnV0dXJlLgo+IAo+IEZpeGVzOiA2ZTNl
NzcxMjAzICgneGVuL2FybTogc2V0dXA6IFJlbG9jYXRlIHRoZSBEZXZpY2UtVHJlZSBsYXRlciBv
biBpbiB0aGUgYm9vdCcpCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBBZGQgSmFuJ3MgcmV2aWV3
ZWQtYnkKPiAgICAgICAgIC0gVXNlIGJvb3RfbWZuX3N0YXJ0IHJhdGhlciB0aGFuIGJvb3RfbWZu
X2VuZCB3aGVuIGdpdmluZwo+ICAgICAgICAgeGVuaGVhcCBwYWdlcy4KPiAtLS0KPiAgeGVuL2Fy
Y2gvYXJtL3NldHVwLmMgfCA4ICsrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVw
LmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+IGluZGV4IDU4MWIyNjI2NTUuLmZjYTdlNjhjYmEg
MTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC9hcm0v
c2V0dXAuYwo+IEBAIC01OTMsNiArNTkzLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX21t
KHZvaWQpCj4gICAgICB1bnNpZ25lZCBsb25nIGhlYXBfcGFnZXMsIHhlbmhlYXBfcGFnZXMsIGRv
bWhlYXBfcGFnZXM7Cj4gICAgICBpbnQgaTsKPiAgICAgIGNvbnN0IHVpbnQzMl90IGN0ciA9IFJF
QURfQ1AzMihDVFIpOwo+ICsgICAgbWZuX3QgYm9vdF9tZm5fc3RhcnQsIGJvb3RfbWZuX2VuZDsK
PiAgCj4gICAgICBpZiAoICFib290aW5mby5tZW0ubnJfYmFua3MgKQo+ICAgICAgICAgIHBhbmlj
KCJObyBtZW1vcnkgYmFua1xuIik7Cj4gQEAgLTY2NSw2ICs2NjYsMTEgQEAgc3RhdGljIHZvaWQg
X19pbml0IHNldHVwX21tKHZvaWQpCj4gIAo+ICAgICAgc2V0dXBfeGVuaGVhcF9tYXBwaW5ncygo
ZSA+PiBQQUdFX1NISUZUKSAtIHhlbmhlYXBfcGFnZXMsIHhlbmhlYXBfcGFnZXMpOwo+ICAKPiAr
ICAgIC8qIFdlIG5lZWQgYSBzaW5nbGUgbWFwcGVkIHBhZ2UgZm9yIHBvcHVsYXRpbmcgYm9vdG1l
bV9yZWdpb25fbGlzdC4gKi8KPiArICAgIGJvb3RfbWZuX3N0YXJ0ID0gbWZuX2FkZCh4ZW5oZWFw
X21mbl9lbmQsIC0xKTsKPiArICAgIGJvb3RfbWZuX2VuZCA9IHhlbmhlYXBfbWZuX2VuZDsKPiAr
ICAgIGluaXRfYm9vdF9wYWdlcyhtZm5fdG9fbWFkZHIoYm9vdF9tZm5fc3RhcnQpLCBtZm5fdG9f
bWFkZHIoYm9vdF9tZm5fZW5kKSk7Cj4gKwo+ICAgICAgLyogQWRkIG5vbi14ZW5oZWFwIG1lbW9y
eSAqLwo+ICAgICAgZm9yICggaSA9IDA7IGkgPCBib290aW5mby5tZW0ubnJfYmFua3M7IGkrKyAp
Cj4gICAgICB7Cj4gQEAgLTcxMCw3ICs3MTYsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBf
bW0odm9pZCkKPiAgCj4gICAgICAvKiBBZGQgeGVuaGVhcCBtZW1vcnkgdGhhdCB3YXMgbm90IGFs
cmVhZHkgYWRkZWQgdG8gdGhlIGJvb3QgYWxsb2NhdG9yLiAqLwo+ICAgICAgaW5pdF94ZW5oZWFw
X3BhZ2VzKG1mbl90b19tYWRkcih4ZW5oZWFwX21mbl9zdGFydCksCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgbWZuX3RvX21hZGRyKHhlbmhlYXBfbWZuX2VuZCkpOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIG1mbl90b19tYWRkcihib290X21mbl9zdGFydCkpOwo+ICB9Cj4gICNlbHNlIC8q
IENPTkZJR19BUk1fNjQgKi8KPiAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX21tKHZvaWQpCj4g
LS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
