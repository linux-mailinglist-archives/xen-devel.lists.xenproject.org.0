Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDDDC9454
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 00:29:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFn4h-0001Y8-MH; Wed, 02 Oct 2019 22:26:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFn4g-0001Y3-3g
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 22:26:22 +0000
X-Inumbo-ID: a8f5ae10-e563-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id a8f5ae10-e563-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 22:26:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6264A20700;
 Wed,  2 Oct 2019 22:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570055180;
 bh=MAzCITTrz5CeGnhkX6iD1Vuwy+DQLZfYuaBVTU5DsN0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=JO7lDC6nmauF9jI6WBcjvxdsQ/NvMCJ7zNR7FuTbLcW7hgiQo5+OJp7ugs4IIQTuM
 OHUzeQ9UwbUPn9R8P7LRgGrND/oBz8GqtBQuYWXoxR058KXid1rJLsxeYwP3u5SQRH
 DHYKoPazSecA0bE1g/XD4QZc3cLybe8/KE+d6mxI=
Date: Wed, 2 Oct 2019 15:26:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20191002180047.17144-3-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910021446440.2691@sstabellini-ThinkPad-T480s>
References: <20191002180047.17144-1-julien.grall@arm.com>
 <20191002180047.17144-3-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13 2/6] xen/arm64: bitops: Match the
 register size with the value size in flsl
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQ2xhbmcgaXMgcGlja2ll
ciB0aGFuIEdDQyBmb3IgdGhlIHJlZ2lzdGVyIHNpemUgaW4gYXNtIHN0YXRlbWVudC4gSXQgZXhw
ZWN0cwo+IHRoZSByZWdpc3RlciBzaXplIHRvIG1hdGNoIHRoZSB2YWx1ZSBzaXplLgo+IAo+IFRo
ZSBpbnN0cnVjdGlvbiBjbHogaXMgZXhwZWN0aW5nIHRoZSB0d28gb3BlcmFuZHMgdG8gYmUgdGhl
IHNhbWUgc2l6ZQo+IChpLmUgMzItYml0IG9yIDY0LWJpdCkuIEFzIHRoZSBmbHNsIGZ1bmN0aW9u
IGlzIGRlYWxpbmcgd2l0aCA2NC1iaXQKPiB2YWx1ZSwgd2UgbmVlZCB0byBtYWtlIHRoZSBkZXN0
aW5hdGlvbiB2YXJpYWJsZSA2NC1iaXQgYXMgd2VsbC4KPiAKPiBXaGlsZSBhdCBpdCwgYWRkIGEg
bmV3bGluZSBiZWZvcmUgdGhlIHJldHVybiBzdGF0ZW1lbnQuCj4gCj4gTm90ZSB0aGF0IHRoZSBy
ZXR1cm4gdHlwZSBvZiBmbHNsIGlzIG5vdCB1cGRhdGVkIGJlY2F1c2UgdGhlIHJlc3VsdCB3aWxs
Cj4gYWx3YXlzIGJlIHNtYWxsZXIgdGhhbiA2NCBhbmQgdGhlcmVmb3JlIGZpdCBpbiAzMi1iaXQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
CkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoK
PiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gVXBkYXRlIHRoZSBjb21taXQg
bWVzc2FnZSB0byBleHBsYWluIHdoeSB0aGUgcmV0dXJuIHR5cGUgaXMKPiAgICAgICAgIG5vdCBt
b2RpZmllZAo+IC0tLQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2JpdG9wcy5oIHwgMyAr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2JpdG9wcy5oIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaAo+IGluZGV4IDZjYzIyNGFkMTMuLmQ4NWE0OWJj
YTQgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaAo+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYml0b3BzLmgKPiBAQCAtMjQsMTIgKzI0LDEz
IEBAIHN0YXRpYyAvKl9fKi9hbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcgX19mZnModW5zaWdu
ZWQgbG9uZyB3b3JkKQo+ICAKPiAgc3RhdGljIGlubGluZSBpbnQgZmxzbCh1bnNpZ25lZCBsb25n
IHgpCj4gIHsKPiAtICAgICAgICBpbnQgcmV0Owo+ICsgICAgICAgIHVpbnQ2NF90IHJldDsKPiAg
Cj4gICAgICAgICAgaWYgKF9fYnVpbHRpbl9jb25zdGFudF9wKHgpKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gZ2VuZXJpY19mbHNsKHgpOwo+ICAKPiAgICAgICAgICBhc20oImNselx0JTAsICUx
IiA6ICI9ciIgKHJldCkgOiAiciIgKHgpKTsKPiArCj4gICAgICAgICAgcmV0dXJuIEJJVFNfUEVS
X0xPTkcgLSByZXQ7Cj4gIH0KPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
