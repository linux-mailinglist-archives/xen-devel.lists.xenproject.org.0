Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C14155BE5
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 17:36:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j06Yl-000716-OK; Fri, 07 Feb 2020 16:32:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hdY0=33=merlin.srs.infradead.org=batv+1a18ff0851e0951751f6+6011+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1j06Yk-000711-8l
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 16:32:50 +0000
X-Inumbo-ID: 7a4dcac0-49c7-11ea-b2cb-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a4dcac0-49c7-11ea-b2cb-bc764e2007e4;
 Fri, 07 Feb 2020 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-ID:From:CC:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=qTxOJxWPPdI7fiSSPUBwv4UvFRqoD+LPJMbWGJQwQ2k=; b=ReEahjUNZ3sOWrQH8awCc1w8gE
 mtDii0Cy3huPaonGE0gPFB6vKZzbdrpx6ZH8g4c5KfCyV8wI2Rug7LtWwNAV4ZQMwfRrBoTGd0PGZ
 EnIJy3RSNsrbifJvhUxtWpyUQVJYskWhGupu8Ng+bTOqmQB4f9vmxoXT3Ad16curmN49qDFfDRjuu
 lBuv+IIBeFpc21r3VsT+PqF56WVNXxQl2vfU83IpvcLhAAmHpRRkBuzJOvFSe30gPiIk9O2EzSOeg
 37+vfU67p5cBaLqfYNkPGNGAWD3fsI9XRStLlWYQktLFdM3D6K/3Y0UXNJPJ/A35rVjYZEz/xQXaI
 nYyY6VXg==;
Received: from [2a01:4c8:1019:135:a363:ccfb:5bcd:ec7]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j06YL-0004Jr-SK; Fri, 07 Feb 2020 16:32:26 +0000
Date: Fri, 07 Feb 2020 16:32:21 +0000
User-Agent: K-9 Mail for Android
In-Reply-To: <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
MIME-Version: 1.0
To: "Xia, Hongyan" <hongyxia@amazon.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
From: David Woodhouse <dwmw2@infradead.org>
Message-ID: <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 "stewart.hildebrand@dornerworks.com" <stewart.hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA3IEZlYnJ1YXJ5IDIwMjAgMTY6MzA6MDQgR01ULCAiWGlhLCBIb25neWFuIiA8aG9uZ3l4
aWFAYW1hem9uLmNvbT4gd3JvdGU6Cj5PbiBGcmksIDIwMjAtMDItMDcgYXQgMTU6NTcgKzAwMDAs
IERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4gRnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFt
YXpvbi5jby51az4KPj4gCj4+IC4uLgo+PiAKPj4gRmluYWxseSwgbWFrZSBmcmVlX3hlbmhlYXBf
cGFnZXMoKSBhbmQgZnJlZV9kb21oZWFwX3BhZ2VzKCkgY2FsbAo+PiB0aHJvdWdoIHRvIGluaXRf
aGVhcF9wYWdlcygpIGluc3RlYWQgb2YgZGlyZWN0bHkgdG8gZnJlZV9oZWFwX3BhZ2VzKCkKPj4g
aW4gdGhlIGNhc2Ugd2hlcmUgcGFnZXMgYXJlIGJlaW5nIGZyZWUgd2hpY2ggaGF2ZSBuZXZlciBw
YXNzZWQKPj4gdGhyb3VnaAo+PiBpbml0X2hlYXBfcGFnZXMoKS4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4KPklmIGJvdGggZW5kIHVw
IGNhbGxpbmcgZnJlZV9oZWFwX3BhZ2VzLCBjYW4gd2UganVzdCBwdXQgdGhlIGNoZWNrCj50aGVy
ZT8KCklkZWFsbHkgbm90IGJlY2F1c2UgaW5pdF9oZWFwX3BhZ2VzKCkgdGhlbiBjYWxscyBmcmVl
X2hlYXBfcGFnZXMoKSBhbmQgdGhlICJyZWN1cnNpb24iIGlzIGJlc3QgYXZvaWRlZC4KCi0tIApT
ZW50IGZyb20gbXkgQW5kcm9pZCBkZXZpY2Ugd2l0aCBLLTkgTWFpbC4gUGxlYXNlIGV4Y3VzZSBt
eSBicmV2aXR5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
