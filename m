Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8389A2A41
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 00:49:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3TCA-0001Ul-82; Thu, 29 Aug 2019 22:47:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/L5Q=WZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i3TC9-0001Uc-7u
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 22:47:09 +0000
X-Inumbo-ID: ee1eab60-caae-11e9-8980-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee1eab60-caae-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 22:47:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A34F22CEA;
 Thu, 29 Aug 2019 22:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567118827;
 bh=sm/nKdM9UsIhUb6FhRZ+kQtsA7U5a/JALl6VUJ4+q2Q=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=CVS10g5rx/XTa3zAqZYWqPzwDeS4hTCFiG0WkGUDDDvXuwqoTWMRvCZy+4vIOeCa2
 EitnmAkmPhgz8IptegpIpXy8m7xG5dzQc1bFjFWw2Ct4h9eHOTj1kDXw4/JUM1rcEQ
 U7l6bmF3dACn+UY4Le2fqo/wliNCIcEHTnE8qZXE=
Date: Thu, 29 Aug 2019 15:47:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190826121944.515-8-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908281506430.8175@sstabellini-ThinkPad-T480s>
References: <20190826121944.515-1-hch@lst.de> <20190826121944.515-8-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 07/11] swiotlb-xen: use the same foreign
 page check everywhere
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNiBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4geGVuX2RtYV9t
YXBfcGFnZSB1c2VzIGEgZGlmZmVyZW50IGFuZCBtb3JlIGNvbXBsaWNhdGVkIGNoZWNrIGZvciBm
b3JlaWduCj4gcGFnZXMgdGhhbiB0aGUgb3RoZXIgdGhyZWUgY2FjaGUgbWFpbnRhaW5hbmNlIGhl
bHBlcnMuICBTd2l0Y2ggaXQgdG8gdGhlCj4gc2ltcGxlciBwZm5fdmFsaWQgbWV0aG9kIGEgd2Vs
bCwgYW5kIGRvY3VtZW50IHRoZSBzY2hlbWUgd2l0aCBhIHNpbmdsZQo+IGltcHJvdmVkIGNvbW1l
bnQgaW4geGVuX2RtYV9tYXBfcGFnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgaW5jbHVkZS94ZW4vYXJtL3BhZ2UtY29oZXJl
bnQuaCB8IDMxICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUveGVuL2FybS9wYWdlLWNvaGVyZW50LmggYi9pbmNsdWRlL3hlbi9hcm0vcGFnZS1jb2hl
cmVudC5oCj4gaW5kZXggMGUyNDRmNGZlYzFhLi4wN2MxMDRkYmMyMWYgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS94ZW4vYXJtL3BhZ2UtY29oZXJlbnQuaAo+ICsrKyBiL2luY2x1ZGUveGVuL2FybS9w
YWdlLWNvaGVyZW50LmgKPiBAQCAtNDEsMjMgKzQxLDE3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB4
ZW5fZG1hX21hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzdHJ1Y3QgcGFnZSAqcGFnZSwK
PiAgCSAgICAgZG1hX2FkZHJfdCBkZXZfYWRkciwgdW5zaWduZWQgbG9uZyBvZmZzZXQsIHNpemVf
dCBzaXplLAo+ICAJICAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIsIHVuc2lnbmVkIGxv
bmcgYXR0cnMpCj4gIHsKPiAtCXVuc2lnbmVkIGxvbmcgcGFnZV9wZm4gPSBwYWdlX3RvX3hlbl9w
Zm4ocGFnZSk7Cj4gLQl1bnNpZ25lZCBsb25nIGRldl9wZm4gPSBYRU5fUEZOX0RPV04oZGV2X2Fk
ZHIpOwo+IC0JdW5zaWduZWQgbG9uZyBjb21wb3VuZF9wYWdlcyA9Cj4gLQkJKDE8PGNvbXBvdW5k
X29yZGVyKHBhZ2UpKSAqIFhFTl9QRk5fUEVSX1BBR0U7Cj4gLQlib29sIGxvY2FsID0gKHBhZ2Vf
cGZuIDw9IGRldl9wZm4pICYmCj4gLQkJKGRldl9wZm4gLSBwYWdlX3BmbiA8IGNvbXBvdW5kX3Bh
Z2VzKTsKPiArCXVuc2lnbmVkIGxvbmcgcGZuID0gUEZOX0RPV04oZGV2X2FkZHIpOwo+ICAKPiAg
CS8qCj4gLQkgKiBEb20wIGlzIG1hcHBlZCAxOjEsIHdoaWxlIHRoZSBMaW51eCBwYWdlIGNhbiBz
cGFuIGFjcm9zcwo+IC0JICogbXVsdGlwbGUgWGVuIHBhZ2VzLCBpdCdzIG5vdCBwb3NzaWJsZSBm
b3IgaXQgdG8gY29udGFpbiBhCj4gLQkgKiBtaXggb2YgbG9jYWwgYW5kIGZvcmVpZ24gWGVuIHBh
Z2VzLiBTbyBpZiB0aGUgZmlyc3QgeGVuX3Bmbgo+IC0JICogPT0gbWZuIHRoZSBwYWdlIGlzIGxv
Y2FsIG90aGVyd2lzZSBpdCdzIGEgZm9yZWlnbiBwYWdlCj4gLQkgKiBncmFudC1tYXBwZWQgaW4g
ZG9tMC4gSWYgdGhlIHBhZ2UgaXMgbG9jYWwgd2UgY2FuIHNhZmVseQo+IC0JICogY2FsbCB0aGUg
bmF0aXZlIGRtYV9vcHMgZnVuY3Rpb24sIG90aGVyd2lzZSB3ZSBjYWxsIHRoZSB4ZW4KPiAtCSAq
IHNwZWNpZmljIGZ1bmN0aW9uLgo+ICsJICogRG9tMCBpcyBtYXBwZWQgMToxLCBhbmQgd2hpbGUg
dGhlIExpbnV4IHBhZ2UgY2FuIHNwYW4gYWNyb3NzIG11bHRpcGxlCj4gKwkgKiBYZW4gcGFnZXMs
IGl0IGlzIG5vdCBwb3NzaWJsZSBmb3IgaXQgdG8gY29udGFpbiBhIG1peCBvZiBsb2NhbCBhbmQK
PiArCSAqIGZvcmVpZ24gWGVuIHBhZ2VzLiAgQ2FsbGluZyBwZm5fdmFsaWQgb24gYSBmb3JlaWdu
IG1mbiB3aWxsIGFsd2F5cwo+ICsJICogcmV0dXJuIGZhbHNlLCBzbyBpZiBwZm5fdmFsaWQgcmV0
dXJucyB0cnVlIHRoZSBwYWdlcyBpcyBsb2NhbCBhbmQgd2UKPiArCSAqIGNhbiB1c2UgdGhlIG5h
dGl2ZSBkbWEtZGlyZWN0IGZ1bmN0aW9ucywgb3RoZXJ3aXNlIHdlIGNhbGwgdGhlIFhlbgo+ICsJ
ICogc3BlY2lmaWMgdmVyc2lvbi4KPiAgCSAqLwo+IC0JaWYgKGxvY2FsKQo+ICsJaWYgKHBmbl92
YWxpZChwZm4pKQo+ICAJCWRtYV9kaXJlY3RfbWFwX3BhZ2UoaHdkZXYsIHBhZ2UsIG9mZnNldCwg
c2l6ZSwgZGlyLCBhdHRycyk7Cj4gIAllbHNlCj4gIAkJX194ZW5fZG1hX21hcF9wYWdlKGh3ZGV2
LCBwYWdlLCBkZXZfYWRkciwgb2Zmc2V0LCBzaXplLCBkaXIsIGF0dHJzKTsKPiBAQCAtNjcsMTQg
KzYxLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHhlbl9kbWFfdW5tYXBfcGFnZShzdHJ1Y3QgZGV2
aWNlICpod2RldiwgZG1hX2FkZHJfdCBoYW5kbGUsCj4gIAkJc2l6ZV90IHNpemUsIGVudW0gZG1h
X2RhdGFfZGlyZWN0aW9uIGRpciwgdW5zaWduZWQgbG9uZyBhdHRycykKPiAgewo+ICAJdW5zaWdu
ZWQgbG9uZyBwZm4gPSBQRk5fRE9XTihoYW5kbGUpOwo+IC0JLyoKPiAtCSAqIERvbTAgaXMgbWFw
cGVkIDE6MSwgd2hpbGUgdGhlIExpbnV4IHBhZ2UgY2FuIGJlIHNwYW5uZWQgYWNjcm9zcwo+IC0J
ICogbXVsdGlwbGUgWGVuIHBhZ2UsIGl0J3Mgbm90IHBvc3NpYmxlIHRvIGhhdmUgYSBtaXggb2Yg
bG9jYWwgYW5kCj4gLQkgKiBmb3JlaWduIFhlbiBwYWdlLiBEb20wIGlzIG1hcHBlZCAxOjEsIHNv
IGNhbGxpbmcgcGZuX3ZhbGlkIG9uIGEKPiAtCSAqIGZvcmVpZ24gbWZuIHdpbGwgYWx3YXlzIHJl
dHVybiBmYWxzZS4gSWYgdGhlIHBhZ2UgaXMgbG9jYWwgd2UgY2FuCj4gLQkgKiBzYWZlbHkgY2Fs
bCB0aGUgbmF0aXZlIGRtYV9vcHMgZnVuY3Rpb24sIG90aGVyd2lzZSB3ZSBjYWxsIHRoZSB4ZW4K
PiAtCSAqIHNwZWNpZmljIGZ1bmN0aW9uLgo+IC0JICovCj4gKwo+ICAJaWYgKHBmbl92YWxpZChw
Zm4pKQo+ICAJCWRtYV9kaXJlY3RfdW5tYXBfcGFnZShod2RldiwgaGFuZGxlLCBzaXplLCBkaXIs
IGF0dHJzKTsKPiAgCWVsc2UKPiAtLSAKPiAyLjIwLjEKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
