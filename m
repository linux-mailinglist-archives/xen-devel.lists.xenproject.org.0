Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E67C4180
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 22:01:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFOHp-00077A-PS; Tue, 01 Oct 2019 19:58:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFOHo-000770-1E
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 19:58:16 +0000
X-Inumbo-ID: ce322f5c-e485-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id ce322f5c-e485-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 19:58:15 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C29921920;
 Tue,  1 Oct 2019 19:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569959895;
 bh=BTkt6MALdrN8EVVZdnhyv60l/CBsgFxjolIl3X/5gPE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Rx4sy0cDqPqBG50eZH3zw5fLHoa5VodobhNLoReHAye2E8zB+p0f4YoBJ1/QHCq+G
 qBG09v72r67NjYV0tUKKzY8r4WMeeVUd1Nv3wdyLa9f4Kw/7KLXIFyAPOXPgRWw8N/
 79mVk8GkkP6JLdkSJxnrlYV9m7p2RqLsmQ4IETEM=
Date: Tue, 1 Oct 2019 12:58:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <8736gi9dkj.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1910011257590.20899@sstabellini-ThinkPad-T480s>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-3-julien.grall@arm.com> <8736gi9dkj.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 02/10] xen/arm64: head: Check
 if an SError is pending when receiving a vSError
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNyBTZXAgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gSnVsaWVuIEdy
YWxsIHdyaXRlczoKPiAKPiA+IEF0IHRoZSBtb21lbnQsIHdoZW4gd2UgcmVjZWl2ZSBhbiBTRXJy
b3IgZXhjZXB0aW9uIGZyb20gdGhlIGd1ZXN0LCB3ZQo+ID4gZG9uJ3QgY2hlY2sgaWYgdGhlcmUg
YXJlIGFueSBvdGhlciBwZW5kaW5nLiBGb3IgaGFyZGVuaW5nIHRoZSBjb2RlLCB3ZQo+ID4gc2hv
dWxkIGVuc3VyZSBhbnkgcGVuZGluZyBTRXJyb3IgYXJlIGFjY291bnRlZCB0byB0aGUgZ3Vlc3Qg
YmVmb3JlCj4gPiBleGVjdXRpbmcgYW55IGNvZGUgd2l0aCBTRXJyb3IgdW5tYXNrZWQuCj4gPgo+
ID4gVGhlIHJlY2VudGx5IGludHJvZHVjZWQgbWFjcm8gJ2d1ZXN0X3ZlY3RvcicgY291bGQgdXNl
ZCB0byBnZW5lcmF0ZSB0aGUKPiA+IHR3byB2ZWN0b3JzIGFuZCB0aGVyZWZvcmUgdGFrZSBhZHZh
bnRhZ2Ugb2YgYW55IGNoYW5nZSByZXF1aXJlZCBpbiB0aGUKPiA+IGZ1dHVyZS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFJldmll
d2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+CgpS
ZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
