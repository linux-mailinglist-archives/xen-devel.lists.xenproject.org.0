Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D35922B6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 13:48:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzg6J-0002Mk-2a; Mon, 19 Aug 2019 11:45:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzg6I-0002Mf-3b
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 11:45:26 +0000
X-Inumbo-ID: d28adaee-c276-11e9-a661-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d28adaee-c276-11e9-a661-bc764e2007e4;
 Mon, 19 Aug 2019 11:45:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 514ED28;
 Mon, 19 Aug 2019 04:45:20 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2BA23F246;
 Mon, 19 Aug 2019 04:45:18 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190816130013.31154-1-hch@lst.de>
 <20190816130013.31154-2-hch@lst.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <65248838-f273-6097-22f4-e5809078ddba@arm.com>
Date: Mon, 19 Aug 2019 12:45:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816130013.31154-2-hch@lst.de>
Content-Language: en-US
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQ2hyaXN0b3BoLAoKT24gOC8xNi8xOSAyOjAwIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiArc3RhdGljIGlubGluZSB2b2lkIHhlbl9kbWFfbWFwX3BhZ2Uoc3RydWN0IGRldmljZSAq
aHdkZXYsIHN0cnVjdCBwYWdlICpwYWdlLAo+ICsJICAgICBkbWFfYWRkcl90IGRldl9hZGRyLCB1
bnNpZ25lZCBsb25nIG9mZnNldCwgc2l6ZV90IHNpemUsCj4gKwkgICAgIGVudW0gZG1hX2RhdGFf
ZGlyZWN0aW9uIGRpciwgdW5zaWduZWQgbG9uZyBhdHRycykKPiArewo+ICsJdW5zaWduZWQgbG9u
ZyBwYWdlX3BmbiA9IHBhZ2VfdG9feGVuX3BmbihwYWdlKTsKPiArCXVuc2lnbmVkIGxvbmcgZGV2
X3BmbiA9IFhFTl9QRk5fRE9XTihkZXZfYWRkcik7Cj4gKwl1bnNpZ25lZCBsb25nIGNvbXBvdW5k
X3BhZ2VzID0KPiArCQkoMTw8Y29tcG91bmRfb3JkZXIocGFnZSkpICogWEVOX1BGTl9QRVJfUEFH
RTsKPiArCWJvb2wgbG9jYWwgPSAocGFnZV9wZm4gPD0gZGV2X3BmbikgJiYKPiArCQkoZGV2X3Bm
biAtIHBhZ2VfcGZuIDwgY29tcG91bmRfcGFnZXMpOwo+ICsKClRoZSBBcm0gdmVyc2lvbiBhcyBh
IGNvbW1lbnQgaGVyZS4gQ291bGQgd2UgcmV0YWluIGl0PwoKPiArCWlmIChsb2NhbCkKPiArCQlk
bWFfZGlyZWN0X21hcF9wYWdlKGh3ZGV2LCBwYWdlLCBvZmZzZXQsIHNpemUsIGRpciwgYXR0cnMp
Owo+ICsJZWxzZQo+ICsJCV9feGVuX2RtYV9tYXBfcGFnZShod2RldiwgcGFnZSwgZGV2X2FkZHIs
IG9mZnNldCwgc2l6ZSwgZGlyLCBhdHRycyk7Cj4gK30KPiArCgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
