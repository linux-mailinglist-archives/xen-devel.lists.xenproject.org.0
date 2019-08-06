Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A048398F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 21:24:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv50P-0007Vp-VI; Tue, 06 Aug 2019 19:20:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv50N-0007Vk-H6
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 19:20:19 +0000
X-Inumbo-ID: 39899fbb-b87f-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 39899fbb-b87f-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 19:20:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD024205C9;
 Tue,  6 Aug 2019 19:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565119217;
 bh=eSNZgLpJ1W4a4qIKbDNxKLVCdiUhHm/3thP5cLl0itU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nquHPMo6ETY3v0IDGzsIEw2BGfuzK6u4EDQ75S7do8XDEu2nj1TXIFkKha0PqOHHJ
 JnZI8lnjHd+UOvTINqg2OQRwqGq3BFOWBelGcD88LvYezx+glMDg2m4SICSrjEkSMT
 MaFmvM1axHsPg1J0yzPUZauOZLOrOseXEpJLXQGg=
Date: Tue, 6 Aug 2019 12:20:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <12f22d4a-0a39-6878-1471-fd2fdbfd54f9@arm.com>
Message-ID: <alpine.DEB.2.21.1908061206000.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
 <20190621235608.2153-3-sstabellini@kernel.org>
 <024a54c3-29b6-92d2-0cf3-e74297282b31@gmail.com>
 <12f22d4a-0a39-6878-1471-fd2fdbfd54f9@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 3/6] xen/arm: keep track of
 reserved-memory regions
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
Cc: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMCBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDcv
OC8xOSA4OjAyIFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4gPiBPbiAyMi4wNi4xOSAwMjo1NiwgU3Rl
ZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gSSBoYXZlIHRlc3RlZCB0aGlzIHNlcmllcyBhbmQg
Z290IHRoZSBzYW1lIGJlaGF2aW9yIGFzIHdpdGggVjIgWzFdLgo+ID4gCj4gPiBUaGUgIm5vbi1y
ZXNlcnZlZC1tZW1vcnkiIG5vZGUgaW4gbXkgZGV2aWNlLXRyZWUKPiA+IChzcmFtQDQ3RkZGMDAw
LT5zY3Bfc2htZW1AMCkgaXMgc3RpbGwgaW50ZXJwcmV0ZWQgYXMgYSAicmVzZXJ2ZWQtbWVtb3J5
Ii4KPiA+IEkgdGhpbmssIHRoaXMgdGFrZXMgcGxhY2UgYmVjYXVzZSBjdXJyZW50IGltcGxlbWVu
dGF0aW9uIGl0ZXJhdGVzIG92ZXIgYWxsCj4gPiBkZXZpY2UgdHJlZSBub2RlcyBzdGFydGluZwo+
ID4gZnJvbSByZWFsICJyZXNlcnZlZC1tZW1vcnkiIG5vZGUgdXAgdG8gdGhlIGVuZCBvZiB0aGUg
ZGV2aWNlIHRyZWUuIEFuZCBpZgo+ID4gdGhlcmUgaXMgYXQgbGVhc3Qgb25lICJub24tcmVzZXJ2
ZWQtbWVtb3J5IiBub2RlICh3aXRoIGEgc3VpdGFibGUgZGVwdGggYW5kCj4gPiB2YWxpZCAicmVn
IiBwcm9wZXJ0eSkKPiA+IGxvY2F0ZWQgZG93biB0aGUgZGV2aWNlIHRyZWUsIGl0IHdpbGwgYmUg
bWlzdGFrZW5seSBpbnNlcnRlZCB0bwo+ID4gYm9vdGluZm8ucmVzZXJ2ZWRfbWVtIChhcyBpbiBt
eSBjYXNlKS4KPiAKPiBUaGUgcHJvYmxlbSBpcyBiZWNhdXNlIHdlIGFyZSBwYXNzaW5nIHRoZSBk
ZXB0aCBvZiB0aGUgcGFyZW50LiBCZWNhdXNlIG9mCj4gdGhhdCwgaXQgd2lsbCBsb29rIGZvciBh
bnl0aGluZyBhdCB0aGUgc2FtZSBkZXB0aCAoc2VlIHRoZSBjaGVjayBkZXB0aCA+PQo+IG1pbl9k
ZXB0aCBpbiBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlKS4KPiAKPiBUaGUgY29ycmVjdCBzb2x1
dGlvbiBoZXJlLCB3b3VsZCBiZSB0byB1c2UgdGhlIGRlcHRoIG9mIHRoZSBjaGlsZCAoaS5lIGRl
cHRoICsKPiAxKSB3aGVuIGNhbGxpbmcgZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZSBpbiBwcm9j
ZXNzX3Jlc2VydmVkX21lbW9yeV9ub2RlLgoKWWVzLCB0aGF0IGlzIHRoZSByaWdodCB0aGluZyB0
byBkbywgdG9nZXRoZXIgd2l0aCBhbHNvIHBhc3NpbmcKYWRkcmVzc19jZWxscyBhbmQgc2l6ZV9j
ZWxscyBvZiB0aGUgcGFyZW50IHRvIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUsCnNvIHRoYXQg
aXQgY2FuIGJlIGNhbGN1bGF0ZSBhcHByb3ByaWF0ZWx5IGF0IGFsbCB0aW1lcywgcmVnYXJkbGVz
cyBvZgpkZXB0aC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
