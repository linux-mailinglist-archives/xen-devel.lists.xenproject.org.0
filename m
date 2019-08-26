Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6C09CC83
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 11:23:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2BAW-0001J6-3L; Mon, 26 Aug 2019 09:20:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kt5+=WW=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1i2BAU-00018v-B4
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 09:20:06 +0000
X-Inumbo-ID: b032319c-c7e2-11e9-8980-bc764e2007e4
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b032319c-c7e2-11e9-8980-bc764e2007e4;
 Mon, 26 Aug 2019 09:20:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 46384227A81; Mon, 26 Aug 2019 11:20:01 +0200 (CEST)
Date: Mon, 26 Aug 2019 11:20:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190826092001.GA13476@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
 <20190816130013.31154-2-hch@lst.de>
 <65248838-f273-6097-22f4-e5809078ddba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65248838-f273-6097-22f4-e5809078ddba@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Xen-devel] [PATCH 01/11] xen/arm: use dma-noncoherent.h calls
 for xen-swiotlb cache maintainance
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
 xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTI6NDU6MTdQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IE9uIDgvMTYvMTkgMjowMCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+ICtz
dGF0aWMgaW5saW5lIHZvaWQgeGVuX2RtYV9tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpod2Rldiwg
c3RydWN0IHBhZ2UgKnBhZ2UsCj4+ICsJICAgICBkbWFfYWRkcl90IGRldl9hZGRyLCB1bnNpZ25l
ZCBsb25nIG9mZnNldCwgc2l6ZV90IHNpemUsCj4+ICsJICAgICBlbnVtIGRtYV9kYXRhX2RpcmVj
dGlvbiBkaXIsIHVuc2lnbmVkIGxvbmcgYXR0cnMpCj4+ICt7Cj4+ICsJdW5zaWduZWQgbG9uZyBw
YWdlX3BmbiA9IHBhZ2VfdG9feGVuX3BmbihwYWdlKTsKPj4gKwl1bnNpZ25lZCBsb25nIGRldl9w
Zm4gPSBYRU5fUEZOX0RPV04oZGV2X2FkZHIpOwo+PiArCXVuc2lnbmVkIGxvbmcgY29tcG91bmRf
cGFnZXMgPQo+PiArCQkoMTw8Y29tcG91bmRfb3JkZXIocGFnZSkpICogWEVOX1BGTl9QRVJfUEFH
RTsKPj4gKwlib29sIGxvY2FsID0gKHBhZ2VfcGZuIDw9IGRldl9wZm4pICYmCj4+ICsJCShkZXZf
cGZuIC0gcGFnZV9wZm4gPCBjb21wb3VuZF9wYWdlcyk7Cj4+ICsKPgo+IFRoZSBBcm0gdmVyc2lv
biBhcyBhIGNvbW1lbnQgaGVyZS4gQ291bGQgd2UgcmV0YWluIGl0PwoKSSd2ZSBhZGRlZCBpdCBp
biB0aGlzIHBhdGNoLCBhbHRvdWdoIHRoZSByZXdyaXRlcyBsYXRlciBvbiBtZWFuIGl0IHdpbGwK
Z28gYXdheSBpbiBmYXZvdXIgb2YgYSBuZXcgY29tbWVudCBlbHNld2hlcmUgYW55d2F5LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
