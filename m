Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97501A29FF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 00:45:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3T7P-0000yR-0t; Thu, 29 Aug 2019 22:42:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/L5Q=WZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i3T7N-0000y8-4X
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 22:42:13 +0000
X-Inumbo-ID: 3d54c544-caae-11e9-b95f-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d54c544-caae-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 22:42:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A39D32189D;
 Thu, 29 Aug 2019 22:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567118531;
 bh=xHkEUC70NyhQrdUtUwDNpqvFabXbH4FNTzDPXPE1tqY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=LG+7fN41BbkQDRJj56NLA6759Otnvnf3nvVutDii10+eEzLBlDeRKXwPCpCclCsiA
 Cl7GH+XwZzjeaHNfXrbRV8R+5ceePqFPWCu9iGGxmTfFsCxbnOr/pXW9XZEEsWSbYn
 rrnwK2ejARhZqSJAQfOT6+NQJikZVzm+uVGT9078=
Date: Thu, 29 Aug 2019 15:42:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190826121944.515-5-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908281458070.8175@sstabellini-ThinkPad-T480s>
References: <20190826121944.515-1-hch@lst.de> <20190826121944.515-5-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 04/11] xen/arm: remove xen_dma_ops
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNiBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gYXJtIGFuZCBh
cm02NCBjYW4ganVzdCB1c2UgeGVuX3N3aW90bGJfZG1hX29wcyBkaXJlY3RseSBsaWtlIHg4Niwg
bm8KPiBuZWVkIGZvciBhIHBvaW50ZXIgaW5kaXJlY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gIGFyY2gvYXJtL21tL2RtYS1tYXBw
aW5nLmMgICAgfCAzICsrLQo+ICBhcmNoL2FybS94ZW4vbW0uYyAgICAgICAgICAgIHwgNCAtLS0t
Cj4gIGFyY2gvYXJtNjQvbW0vZG1hLW1hcHBpbmcuYyAgfCAzICsrLQo+ICBpbmNsdWRlL3hlbi9h
cm0vaHlwZXJ2aXNvci5oIHwgMiAtLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0vZG1hLW1hcHBp
bmcuYyBiL2FyY2gvYXJtL21tL2RtYS1tYXBwaW5nLmMKPiBpbmRleCA3MzgwOTczOTY0NDUuLjI2
NjFjYWQzNjM1OSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9tbS9kbWEtbWFwcGluZy5jCj4gKysr
IGIvYXJjaC9hcm0vbW0vZG1hLW1hcHBpbmcuYwo+IEBAIC0zNSw2ICszNSw3IEBACj4gICNpbmNs
dWRlIDxhc20vbWFjaC9tYXAuaD4KPiAgI2luY2x1ZGUgPGFzbS9zeXN0ZW1faW5mby5oPgo+ICAj
aW5jbHVkZSA8YXNtL2RtYS1jb250aWd1b3VzLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vc3dpb3RsYi14
ZW4uaD4KPiAgCj4gICNpbmNsdWRlICJkbWEuaCIKPiAgI2luY2x1ZGUgIm1tLmgiCj4gQEAgLTIz
NjAsNyArMjM2MSw3IEBAIHZvaWQgYXJjaF9zZXR1cF9kbWFfb3BzKHN0cnVjdCBkZXZpY2UgKmRl
diwgdTY0IGRtYV9iYXNlLCB1NjQgc2l6ZSwKPiAgCj4gICNpZmRlZiBDT05GSUdfWEVOCj4gIAlp
ZiAoeGVuX2luaXRpYWxfZG9tYWluKCkpCj4gLQkJZGV2LT5kbWFfb3BzID0geGVuX2RtYV9vcHM7
Cj4gKwkJZGV2LT5kbWFfb3BzID0gJnhlbl9zd2lvdGxiX2RtYV9vcHM7Cj4gICNlbmRpZgo+ICAJ
ZGV2LT5hcmNoZGF0YS5kbWFfb3BzX3NldHVwID0gdHJ1ZTsKPiAgfQo+IGRpZmYgLS1naXQgYS9h
cmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hlbi9tbS5jCj4gaW5kZXggMTQyMTBlYmRlYTFh
Li45YjNhNmMwY2E2ODEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0veGVuL21tLmMKPiArKysgYi9h
cmNoL2FybS94ZW4vbW0uYwo+IEBAIC0xNjMsMTYgKzE2MywxMiBAQCB2b2lkIHhlbl9kZXN0cm95
X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVy
KQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9u
KTsKPiAgCj4gLWNvbnN0IHN0cnVjdCBkbWFfbWFwX29wcyAqeGVuX2RtYV9vcHM7Cj4gLUVYUE9S
VF9TWU1CT0woeGVuX2RtYV9vcHMpOwo+IC0KPiAgaW50IF9faW5pdCB4ZW5fbW1faW5pdCh2b2lk
KQo+ICB7Cj4gIAlzdHJ1Y3QgZ250dGFiX2NhY2hlX2ZsdXNoIGNmbHVzaDsKPiAgCWlmICgheGVu
X2luaXRpYWxfZG9tYWluKCkpCj4gIAkJcmV0dXJuIDA7Cj4gIAl4ZW5fc3dpb3RsYl9pbml0KDEs
IGZhbHNlKTsKPiAtCXhlbl9kbWFfb3BzID0gJnhlbl9zd2lvdGxiX2RtYV9vcHM7Cj4gIAo+ICAJ
Y2ZsdXNoLm9wID0gMDsKPiAgCWNmbHVzaC5hLmRldl9idXNfYWRkciA9IDA7Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvbW0vZG1hLW1hcHBpbmcuYyBiL2FyY2gvYXJtNjQvbW0vZG1hLW1hcHBp
bmcuYwo+IGluZGV4IGJkMmIwMzlmNDNhNi4uNGIyNDRhMDM3MzQ5IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvYXJtNjQvbW0vZG1hLW1hcHBpbmcuYwo+ICsrKyBiL2FyY2gvYXJtNjQvbW0vZG1hLW1hcHBp
bmcuYwo+IEBAIC04LDYgKzgsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvY2FjaGUuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2RtYS1ub25jb2hlcmVudC5oPgo+ICAjaW5jbHVkZSA8bGludXgvZG1hLWlv
bW11Lmg+Cj4gKyNpbmNsdWRlIDx4ZW4vc3dpb3RsYi14ZW4uaD4KPiAgCj4gICNpbmNsdWRlIDxh
c20vY2FjaGVmbHVzaC5oPgo+ICAKPiBAQCAtNjQsNiArNjUsNiBAQCB2b2lkIGFyY2hfc2V0dXBf
ZG1hX29wcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHU2NCBkbWFfYmFzZSwgdTY0IHNpemUsCj4gIAo+
ICAjaWZkZWYgQ09ORklHX1hFTgo+ICAJaWYgKHhlbl9pbml0aWFsX2RvbWFpbigpKQo+IC0JCWRl
di0+ZG1hX29wcyA9IHhlbl9kbWFfb3BzOwo+ICsJCWRldi0+ZG1hX29wcyA9ICZ4ZW5fc3dpb3Rs
Yl9kbWFfb3BzOwo+ICAjZW5kaWYKPiAgfQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi9hcm0v
aHlwZXJ2aXNvci5oIGIvaW5jbHVkZS94ZW4vYXJtL2h5cGVydmlzb3IuaAo+IGluZGV4IDI5ODI1
NzFmN2NjMS4uNDNlZjI0ZGQwMzBlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUveGVuL2FybS9oeXBl
cnZpc29yLmgKPiArKysgYi9pbmNsdWRlL3hlbi9hcm0vaHlwZXJ2aXNvci5oCj4gQEAgLTE5LDgg
KzE5LDYgQEAgc3RhdGljIGlubGluZSBlbnVtIHBhcmF2aXJ0X2xhenlfbW9kZSBwYXJhdmlydF9n
ZXRfbGF6eV9tb2RlKHZvaWQpCj4gIAlyZXR1cm4gUEFSQVZJUlRfTEFaWV9OT05FOwo+ICB9Cj4g
IAo+IC1leHRlcm4gY29uc3Qgc3RydWN0IGRtYV9tYXBfb3BzICp4ZW5fZG1hX29wczsKPiAtCj4g
ICNpZmRlZiBDT05GSUdfWEVOCj4gIHZvaWQgX19pbml0IHhlbl9lYXJseV9pbml0KHZvaWQpOwo+
ICAjZWxzZQo+IC0tIAo+IDIuMjAuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
