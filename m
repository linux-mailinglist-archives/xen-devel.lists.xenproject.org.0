Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6711B7B438
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 22:17:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsYWG-0004DY-JN; Tue, 30 Jul 2019 20:14:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsYWE-0004DT-BY
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 20:14:46 +0000
X-Inumbo-ID: abff9cae-b306-11e9-876a-ef316d02f684
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abff9cae-b306-11e9-876a-ef316d02f684;
 Tue, 30 Jul 2019 20:14:45 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B4EF20693;
 Tue, 30 Jul 2019 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564517684;
 bh=ErDqGIcud36JlAFX6NAXaggl0r/5DGIIEOMd9MF26ww=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=y+uvjMp6jTSm9V761Jqk42C34QPlCNsxfApbzexYP3lPmmEuAIBzbsZrbtqLnESbd
 /Ai0JqOT2gMqMPtB+Rs+gYpm18OrF/zkARg7N/XHnDG0+hb13foq3KmoYyYdOpLe3D
 iGtOGYhNG3p4ggo4TJB3AkB8cdGh5pbDkJxNM79I=
Date: Tue, 30 Jul 2019 13:14:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-27-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301314370.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-27-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 26/35] xen/arm32: head: Rework and
 document zero_bss()
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIHNlY29uZGFyeSBD
UFVzLCB6ZXJvX2JzcygpIHdpbGwgYmUgYSBOT1AgYmVjYXVzZSBCU1Mgb25seSBuZWVkIHRvIGJl
Cj4gemVyb2VkIG9uY2UgYXQgYm9vdC4gU28gdGhlIGNhbGwgaW4gdGhlIHNlY29uZGFyeSBDUFVz
IHBhdGggY2FuIGJlCj4gcmVtb3ZlZC4KPiAKPiBMYXN0bHksIGRvY3VtZW50IHRoZSBiZWhhdmlv
ciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiB0aGUKPiBmdW5jdGlvbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2
aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+
ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBQYXRjaCBhZGRlZAo+IC0tLQo+ICB4ZW4v
YXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgMTQgKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBpbmRl
eCAwOTU5YzRmMDQ0Li4xMTlkMmEwZGY4IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0z
Mi9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gQEAgLTE5Miw3ICsx
OTIsNiBAQCBHTE9CQUwoaW5pdF9zZWNvbmRhcnkpCj4gICAgICAgICAgUFJJTlQoIiBib290aW5n
IC1cclxuIikKPiAgI2VuZGlmCj4gICAgICAgICAgYmwgICAgY2hlY2tfY3B1X21vZGUKPiAtICAg
ICAgICBibCAgICB6ZXJvX2Jzcwo+ICAgICAgICAgIGJsICAgIGNwdV9pbml0Cj4gICAgICAgICAg
YmwgICAgY3JlYXRlX3BhZ2VfdGFibGVzCj4gICAgICAgICAgYmwgICAgZW5hYmxlX21tdQo+IEBA
IC0yMzcsMTEgKzIzNiwxNSBAQCBjaGVja19jcHVfbW9kZToKPiAgICAgICAgICBiICAgICBmYWls
Cj4gIEVORFBST0MoY2hlY2tfY3B1X21vZGUpCj4gIAo+ICsvKgo+ICsgKiBaZXJvIEJTUwo+ICsg
Kgo+ICsgKiBJbnB1dHM6Cj4gKyAqICAgcjEwOiBQaHlzaWNhbCBvZmZzZXQKPiArICoKPiArICog
Q2xvYmJlcnMgcjAgLSByMwo+ICsgKi8KPiAgemVyb19ic3M6Cj4gLSAgICAgICAgLyogWmVybyBC
U1MgT24gdGhlIGJvb3QgQ1BVIHRvIGF2b2lkIG5hc3R5IHN1cnByaXNlcyAqLwo+IC0gICAgICAg
IHRlcSAgIHIxMiwgIzAKPiAtICAgICAgICBibmUgICBza2lwX2Jzcwo+IC0KPiAgICAgICAgICBQ
UklOVCgiLSBaZXJvIEJTUyAtXHJcbiIpCj4gICAgICAgICAgbGRyICAgcjAsID1fX2Jzc19zdGFy
dCAgICAgICAvKiBMb2FkIHN0YXJ0ICYgZW5kIG9mIGJzcyAqLwo+ICAgICAgICAgIGxkciAgIHIx
LCA9X19ic3NfZW5kCj4gQEAgLTI1Myw3ICsyNTYsNiBAQCB6ZXJvX2JzczoKPiAgICAgICAgICBj
bXAgICByMCwgcjEKPiAgICAgICAgICBibG8gICAxYgo+ICAKPiAtc2tpcF9ic3M6Cj4gICAgICAg
ICAgbW92ICAgcGMsIGxyCj4gIEVORFBST0MoemVyb19ic3MpCj4gIAo+IC0tIAo+IDIuMTEuMAo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
