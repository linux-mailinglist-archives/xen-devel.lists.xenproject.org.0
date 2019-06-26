Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3E855D36
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 03:05:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfwLU-000353-3G; Wed, 26 Jun 2019 01:03:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfwLR-00034C-S2
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 01:03:29 +0000
X-Inumbo-ID: 350aace8-97ae-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 350aace8-97ae-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 01:03:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7919D2085A;
 Wed, 26 Jun 2019 01:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561511008;
 bh=KukHP2eNFODWXoWyUTPCb6Bj/4b+O747jGbC8gkk7tE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=c0Cr6mDzYjT/eCy2yLw9IoNKdnAVlMSjyB6ZWQuyy6BGdEmzbqz+WxFBdKH0637v2
 JFemJnRZx1k015rSKeurhrsl5m0/MB8HXYo/NHAHcSxJXpPX/SH1Aq55VTbgYjK1Sn
 Ds4lIs1ZmmFernLxk1K3Era+3ydnJOCkMQHmGKWc=
Date: Tue, 25 Jun 2019 18:03:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-13-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906251756580.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-13-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 12/17] xen/arm64: head: Move assembly switch
 to the runtime PT in secondary CPUs path
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBhc3NlbWJseSBz
d2l0Y2ggdG8gdGhlIHJ1bnRpbWUgUFQgaXMgb25seSBuZWNlc3NhcnkgZm9yIHRoZQo+IHNlY29u
ZGFyeSBDUFVzLiBTbyBtb3ZlIHRoZSBjb2RlIGluIHRoZSBzZWNvbmRhcnkgQ1BVcyBwYXRoLgo+
IAo+IFdoaWxlIHRoaXMgaXMgZGVmaW5pdGVseSBub3QgY29tcGxpYW50IHdpdGggdGhlIEFybSBB
cm0gYXMgd2UgYXJlCj4gc3dpdGNoaW5nIGJldHdlZW4gdHdvIGRpZmZlcmVudHMgc2V0IG9mIHBh
Z2UtdGFibGVzIHdpdGhvdXQgdHVybmluZyBvZmYKPiB0aGUgTU1VLiBUdXJuaW5nIG9mZiB0aGUg
TU1VIGlzIGltcG9zc2libGUgaGVyZSBhcyB0aGUgSUQgbWFwIG1heSBjbGFzaAo+IHdpdGggb3Ro
ZXIgbWFwcGluZ3MgaW4gdGhlIHJ1bnRpbWUgcGFnZS10YWJsZXMuIFRoaXMgd2lsbCByZXF1aXJl
IG1vcmUKPiByZXdvcmsgdG8gYXZvaWQgdGhlIHByb2JsZW0uIFNvIGZvciBub3cgYWRkIGEgVE9E
TyBpbiB0aGUgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KCgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMzMgKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBpbmRleCBkNjczZjdj
MGQ4Li42YmU0YWY3NTc5IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMK
PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gQEAgLTM0NCw2ICszNDQsMjMgQEAg
R0xPQkFMKGluaXRfc2Vjb25kYXJ5KQo+ICAgICAgICAgIGJyICAgIHgwCj4gIHNlY29uZGFyeV9z
d2l0Y2hlZDoKPiAgICAgICAgICBibCAgICBzZXR1cF9maXhtYXAKPiArCj4gKyAgICAgICAgLyoK
PiArICAgICAgICAgKiBOb24tYm9vdCBDUFVzIG5lZWQgdG8gbW92ZSBvbiB0byB0aGUgcHJvcGVy
IHBhZ2V0YWJsZXMsIHdoaWNoIHdlcmUKPiArICAgICAgICAgKiBzZXR1cCBpbiBpbml0X3NlY29u
ZGFyeV9wYWdldGFibGVzLgo+ICsgICAgICAgICAqCj4gKyAgICAgICAgICogWFhYOiBUaGlzIGlz
IG5vdCBjb21wbGlhbnQgd2l0aCB0aGUgQXJtIEFybS4KPiArICAgICAgICAgKi8KPiArICAgICAg
ICBsZHIgICB4NCwgPWluaXRfdHRiciAgICAgICAgIC8qIFZBIG9mIFRUQlIwX0VMMiBzdGFzaGVk
IGJ5IENQVSAwICovCj4gKyAgICAgICAgbGRyICAgeDQsIFt4NF0gICAgICAgICAgICAgICAvKiBB
Y3R1YWwgdmFsdWUgKi8KPiArICAgICAgICBkc2IgICBzeQo+ICsgICAgICAgIG1zciAgIFRUQlIw
X0VMMiwgeDQKPiArICAgICAgICBkc2IgICBzeQo+ICsgICAgICAgIGlzYgo+ICsgICAgICAgIHRs
YmkgIGFsbGUyCj4gKyAgICAgICAgZHNiICAgc3kgICAgICAgICAgICAgICAgICAgICAvKiBFbnN1
cmUgY29tcGxldGlvbiBvZiBUTEIgZmx1c2ggKi8KPiArICAgICAgICBpc2IKPiArCj4gICAgICAg
ICAgYiAgICAgbGF1bmNoCj4gIEVORFBST0MoaW5pdF9zZWNvbmRhcnkpCj4gIAo+IEBAIC02NTcs
MjIgKzY3NCw2IEBAIEVORFBST0Moc2V0dXBfZml4bWFwKQo+ICBsYXVuY2g6Cj4gICAgICAgICAg
UFJJTlQoIi0gUmVhZHkgLVxyXG4iKQo+ICAKPiAtICAgICAgICAvKiBUaGUgYm9vdCBDUFUgc2hv
dWxkIGdvIHN0cmFpZ2h0IGludG8gQyBub3cgKi8KPiAtICAgICAgICBjYnogICB4MjIsIGxhdW5j
aAo+IC0KPiAtICAgICAgICAvKiBOb24tYm9vdCBDUFVzIG5lZWQgdG8gbW92ZSBvbiB0byB0aGUg
cHJvcGVyIHBhZ2V0YWJsZXMsIHdoaWNoIHdlcmUKPiAtICAgICAgICAgKiBzZXR1cCBpbiBpbml0
X3NlY29uZGFyeV9wYWdldGFibGVzLiAqLwo+IC0KPiAtICAgICAgICBsZHIgICB4NCwgPWluaXRf
dHRiciAgICAgICAgIC8qIFZBIG9mIFRUQlIwX0VMMiBzdGFzaGVkIGJ5IENQVSAwICovCj4gLSAg
ICAgICAgbGRyICAgeDQsIFt4NF0gICAgICAgICAgICAgICAvKiBBY3R1YWwgdmFsdWUgKi8KPiAt
ICAgICAgICBkc2IgICBzeQo+IC0gICAgICAgIG1zciAgIFRUQlIwX0VMMiwgeDQKPiAtICAgICAg
ICBkc2IgICBzeQo+IC0gICAgICAgIGlzYgo+IC0gICAgICAgIHRsYmkgIGFsbGUyCj4gLSAgICAg
ICAgZHNiICAgc3kgICAgICAgICAgICAgICAgICAgICAvKiBFbnN1cmUgY29tcGxldGlvbiBvZiBU
TEIgZmx1c2ggKi8KPiAtICAgICAgICBpc2IKPiAtCj4gICAgICAgICAgbGRyICAgeDAsID1pbml0
X2RhdGEKPiAgICAgICAgICBhZGQgICB4MCwgeDAsICNJTklUSU5GT19zdGFjayAvKiBGaW5kIHRo
ZSBib290LXRpbWUgc3RhY2sgKi8KPiAgICAgICAgICBsZHIgICB4MCwgW3gwXQo+IC0tIAo+IDIu
MTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
