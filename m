Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFC4A2A4A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 00:50:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3TDC-0001fc-9U; Thu, 29 Aug 2019 22:48:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/L5Q=WZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i3TDB-0001fH-38
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 22:48:13 +0000
X-Inumbo-ID: 14785162-caaf-11e9-ae74-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14785162-caaf-11e9-ae74-12813bfff9fa;
 Thu, 29 Aug 2019 22:48:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A476C21874;
 Thu, 29 Aug 2019 22:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567118892;
 bh=qahLSZidWBqyiJ9KPLWGgOnki/Ohn0lpoN98VUjbdJo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=lox9/f+oJeZihIIKB+HOTjYdPrpnsEmbhUNTlvyPbLyIuqorYqCD/5ugnctXNXr5S
 h9zmT10Nj3xoPfMfmjrctVtlI6lWBTjpTEDIPjzV13CX8jSzyEDs3QtOFIQ8vJWNJn
 iP9g2neD8o6CjtcvfTYgSj6BBKHMbvfVJOT8Yk/g=
Date: Thu, 29 Aug 2019 15:48:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190826121944.515-11-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908281526470.8175@sstabellini-ThinkPad-T480s>
References: <20190826121944.515-1-hch@lst.de>
 <20190826121944.515-11-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 10/11] swiotlb-xen: merge xen_unmap_single
 into xen_swiotlb_unmap_page
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

T24gTW9uLCAyNiBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTm8gbmVlZCBm
b3IgYSBuby1vcCB3cmFwcGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgfCAxNSAr
KysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9k
cml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCj4gaW5kZXggOTU5MTFmZjljMTFjLi4zODQzMDRhNzcw
MjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwo+ICsrKyBiL2RyaXZl
cnMveGVuL3N3aW90bGIteGVuLmMKPiBAQCAtNDE0LDkgKzQxNCw4IEBAIHN0YXRpYyBkbWFfYWRk
cl90IHhlbl9zd2lvdGxiX21hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBhZ2Ug
KnBhZ2UsCj4gICAqIEFmdGVyIHRoaXMgY2FsbCwgcmVhZHMgYnkgdGhlIGNwdSB0byB0aGUgYnVm
ZmVyIGFyZSBndWFyYW50ZWVkIHRvIHNlZQo+ICAgKiB3aGF0ZXZlciB0aGUgZGV2aWNlIHdyb3Rl
IHRoZXJlLgo+ICAgKi8KPiAtc3RhdGljIHZvaWQgeGVuX3VubWFwX3NpbmdsZShzdHJ1Y3QgZGV2
aWNlICpod2RldiwgZG1hX2FkZHJfdCBkZXZfYWRkciwKPiAtCQkJICAgICBzaXplX3Qgc2l6ZSwg
ZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyLAo+IC0JCQkgICAgIHVuc2lnbmVkIGxvbmcgYXR0
cnMpCj4gK3N0YXRpYyB2b2lkIHhlbl9zd2lvdGxiX3VubWFwX3BhZ2Uoc3RydWN0IGRldmljZSAq
aHdkZXYsIGRtYV9hZGRyX3QgZGV2X2FkZHIsCj4gKwkJc2l6ZV90IHNpemUsIGVudW0gZG1hX2Rh
dGFfZGlyZWN0aW9uIGRpciwgdW5zaWduZWQgbG9uZyBhdHRycykKPiAgewo+ICAJcGh5c19hZGRy
X3QgcGFkZHIgPSB4ZW5fYnVzX3RvX3BoeXMoZGV2X2FkZHIpOwo+ICAKPiBAQCAtNDMwLDEzICs0
MjksNiBAQCBzdGF0aWMgdm9pZCB4ZW5fdW5tYXBfc2luZ2xlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2
LCBkbWFfYWRkcl90IGRldl9hZGRyLAo+ICAJCXN3aW90bGJfdGJsX3VubWFwX3NpbmdsZShod2Rl
diwgcGFkZHIsIHNpemUsIGRpciwgYXR0cnMpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCB4ZW5f
c3dpb3RsYl91bm1hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9h
ZGRyLAo+IC0JCQkgICAgc2l6ZV90IHNpemUsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpciwK
PiAtCQkJICAgIHVuc2lnbmVkIGxvbmcgYXR0cnMpCj4gLXsKPiAtCXhlbl91bm1hcF9zaW5nbGUo
aHdkZXYsIGRldl9hZGRyLCBzaXplLCBkaXIsIGF0dHJzKTsKPiAtfQo+IC0KPiAgc3RhdGljIHZv
aWQKPiAgeGVuX3N3aW90bGJfc3luY19zaW5nbGVfZm9yX2NwdShzdHJ1Y3QgZGV2aWNlICpkZXYs
IGRtYV9hZGRyX3QgZG1hX2FkZHIsCj4gIAkJc2l6ZV90IHNpemUsIGVudW0gZG1hX2RhdGFfZGly
ZWN0aW9uIGRpcikKPiBAQCAtNDc3LDcgKzQ2OSw4IEBAIHhlbl9zd2lvdGxiX3VubWFwX3NnKHN0
cnVjdCBkZXZpY2UgKmh3ZGV2LCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbCwgaW50IG5lbGVtcywK
PiAgCUJVR19PTihkaXIgPT0gRE1BX05PTkUpOwo+ICAKPiAgCWZvcl9lYWNoX3NnKHNnbCwgc2cs
IG5lbGVtcywgaSkKPiAtCQl4ZW5fdW5tYXBfc2luZ2xlKGh3ZGV2LCBzZy0+ZG1hX2FkZHJlc3Ms
IHNnX2RtYV9sZW4oc2cpLCBkaXIsIGF0dHJzKTsKPiArCQl4ZW5fc3dpb3RsYl91bm1hcF9wYWdl
KGh3ZGV2LCBzZy0+ZG1hX2FkZHJlc3MsIHNnX2RtYV9sZW4oc2cpLAo+ICsJCQkJZGlyLCBhdHRy
cyk7Cj4gIAo+ICB9Cj4gIAo+IC0tIAo+IDIuMjAuMQo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
