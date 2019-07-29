Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE0179A94
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 23:05:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsCmN-0003mY-39; Mon, 29 Jul 2019 21:01:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsCmL-0003mT-Re
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 21:01:57 +0000
X-Inumbo-ID: 18d74ec8-b244-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 18d74ec8-b244-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 21:01:56 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AC9421655;
 Mon, 29 Jul 2019 21:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564434115;
 bh=Mq8HxsCVKuYoHo7SHmx1FJ23mGiycr22Wzc7bzFF/Wk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=cVixfm3Ow5Fw9yBqlkTjtVxKl46V88rlzPHkLGGJ/ewBXDBSs5xKFj6eSfEOy2WyQ
 VdybNK4tU8xVwEyRf8ZH9jgMkCnbX7QoIKB/GIY+T4Q/dq8V5hdqLCR2xlLe4jN8wI
 biWej3oNqCQ0pFbbSzeXXtaWcbveqUHYcXiXZ30Q=
Date: Mon, 29 Jul 2019 14:01:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <b1b0e507-d9ac-8c3b-7613-494407580ce7@arm.com>
Message-ID: <alpine.DEB.2.21.1907291401400.1237@sstabellini-ThinkPad-T480s>
References: <20190602102614.22640-1-julien.grall@arm.com>
 <d39a21d8-12b3-5bb9-9f09-16fba17d0857@gmail.com>
 <b1b0e507-d9ac-8c3b-7613-494407580ce7@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: irq: Don't use _IRQ_PENDING
 when handling host interrupt
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
Cc: xen-devel@lists.xenproject.org, andre.przywara@arm.com,
 sstabellini@kernel.org, andrii_anisov@epam.com,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDYvMTAvMTkgMTI6
MjMgUE0sIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gPiBIZWxsbyBKdWxpZW4sCj4gCj4gSGksCj4g
Cj4gPiBPbiAwMi4wNi4xOSAxMzoyNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gCj4gPiA+ICsg
KiBUaGlzIHNob3VsZCBvbmx5IGJlIGNhbGxlZCB3aXRoIGludGVycnVwdCByb3V0ZWQgdG8gZ3Vl
c3QuIFRoZSBmbG93Cj4gPiA+ICsgKiBvZiBpbnRlcnJ1cHQgcm91dGVkIHRvIFhlbiBhbnkgc29m
dHdhcmUgY2hhbmdlIG9mIHRoZSBzdGF0ZS4KPiA+IAo+ID4gU29ycnkgSSBjYW4ndCBwYXJzZSB0
aGUgbGFzdCBzZW50ZW5jZS4gSXQgc2VlbXMgdG8gbWUgeW91IG1pc3NlZCBhCj4gPiB3b3JkL3dv
cmRzPwo+IAo+IEhtbW0sIHNvcnJ5IGZvciB0aGF0LiBIb3cgYWJvdXQgdGhlIGZvbGxvd2luZzoK
PiAKPiAiVGhpcyBzaG91bGQgb25seSBiZSBjYWxsZWQgd2l0aCBpbnRlcnJ1cHQgcm91dGVkIHRv
IGd1ZXN0LiBUaGUgZmxvdyBvZgo+IGludGVycnVwdCByb3V0ZWQgdG8gWGVuIGlzIG5vdCBhYmxl
IGNvcGUgd2l0aCBzb2Z0d2FyZSBjaGFuZ2Ugb2YgdGhlIGFjdGl2ZQo+IHN0YXRlIj8KPiAKPiA+
IAo+ID4gRm9yIHRoZSByZXN0Ogo+ID4gCj4gPiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8
YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPiAKPiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXchIEkg
YW0gbm90IHBsYW5uaW5nIHRvIHJlc2VuZCB0aGUgcGF0Y2ggYW5kIEkgd2lsbAo+IHVwZGF0ZSB0
aGUgY29tbWVudCBvbiBjb21taXQgKHBlbmRpbmcgU3RlZmFubydzIHJldmlldykuCgpSZXZpZXdl
ZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKSSdsbCB1
cGRhdGUgb24gY29tbWl0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
