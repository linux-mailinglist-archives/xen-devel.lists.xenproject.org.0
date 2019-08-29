Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47004A2A70
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 01:00:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3TKr-0002u7-Nf; Thu, 29 Aug 2019 22:56:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/L5Q=WZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i3TKp-0002u2-PI
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 22:56:07 +0000
X-Inumbo-ID: 2f496c28-cab0-11e9-b95f-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f496c28-cab0-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 22:56:07 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11A082189D;
 Thu, 29 Aug 2019 22:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567119366;
 bh=0kUMYx7gzVlJowquO77IfOfcqdoB3q98qT54dRfDbCg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=EqimipHf7BH6EosF+GwoK6BM8E2syjcI0kMZftzMiYm6rAZSnLaWOt686dkvfGR/T
 9IkxHwg9ivTMCQi2vw/hoW7Ups6jtlB+W006m6+Xm+1RpSUCK4StjNRtFJvRRfnwIg
 in2Z0zXILN00ru92/mCbUQrfTw7f3x/nZElUXS60=
Date: Thu, 29 Aug 2019 15:55:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190826121944.515-1-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908291554270.4927@sstabellini-ThinkPad-T480s>
References: <20190826121944.515-1-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] swiotlb-xen cleanups v2
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

T24gTW9uLCAyNiBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSGkgWGVuIG1h
aW50YWluZXJzIGFuZCBmcmllbmRzLAo+IAo+IHBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzIHNl
cmllcyB0aGF0IGNsZWFucyB1cCB0aGUgcGFydHMgb2Ygc3dpb3RsYi14ZW4KPiB0aGF0IGRlYWwg
d2l0aCBub24tY29oZXJlbnQgY2FjaGVzLgo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gIC0gcmV3
cml0ZSBkbWFfY2FjaGVfbWFpbnQgdG8gYmUgbXVjaCBzaW1wbGVyCj4gIC0gaW1wcm92ZSB2YXJp
b3VzIGNvbW1lbnRzIGFuZCBjb21taXQgbG9ncwo+ICAtIHJlbW92ZSBwYWdlLWNvaGVyZW50Lmgg
ZW50aXJlbHkKClRoYW5rcyBmb3IgeW91ciB3b3JrIG9uIHRoaXMsIGl0IHJlYWxseSBtYWtlcyB0
aGUgY29kZSBiZXR0ZXIuIEkgdGVzdGVkCml0IG9uIEFSTTY0IHdpdGggYSBub24tY29oZXJlbnQg
bmV0d29yayBkZXZpY2UgYW5kIHZlcmlmaWVkIGl0IHdvcmtzIGFzCmludGVuZGVkIChDYWRlbmNl
IEdFTSBvbiBaeW5xTVApLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
