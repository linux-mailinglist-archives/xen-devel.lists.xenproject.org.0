Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1DE7CEF9
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 22:44:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsvOu-0004ZR-IP; Wed, 31 Jul 2019 20:40:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNV9=V4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsvOs-0004ZM-SS
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 20:40:42 +0000
X-Inumbo-ID: 7620b84f-b3d3-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7620b84f-b3d3-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 20:40:41 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEF2A20659;
 Wed, 31 Jul 2019 20:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564605641;
 bh=AiMbuhO2KDX5pRk2BeoueKtf3mYXNGu65C5Vc2VJ+Dg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=cPddLL9FqADo/yhEmkgw7dwFdXupnEHhaJ2PKbyJsP4ItebtZKAVjlcKjt1wtkZGo
 ro6LRmaesDDh0IvTELRkSUAy/PNiFH+1H6qgaGrbDt8qCQNwTZYcTzdN2F3RPTeiWA
 1+MiLWWGmvqHTsMUFuxYyXDDG16gxBNDvx9Q9MZY=
Date: Wed, 31 Jul 2019 13:40:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <0f74ba78-6c38-61d4-98e4-885f5228fcca@arm.com>
Message-ID: <alpine.DEB.2.21.1907311329430.22968@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906271135340.5851@sstabellini-ThinkPad-T480s>
 <e802f230-52f7-a018-8902-ad466f2dab76@arm.com>
 <alpine.DEB.2.21.1907301024460.28600@sstabellini-ThinkPad-T480s>
 <0f74ba78-6c38-61d4-98e4-885f5228fcca@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 14/17] xen/arm64: head: Remove ID map as
 soon as it is not used
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAzMCBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNy8zMC8xOSA2OjMzIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBU
aHUsIDI3IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IE9uIDYvMjcvMTkgNzo1
NSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgMTAgSnVuIDIw
MTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiA+ICsxOgo+ID4gPiA+ID4gKyAgICAgICAg
LyoKPiA+ID4gPiA+ICsgICAgICAgICAqIEZpbmQgdGhlIHNlY29uZCBzbG90IHVzZWQuIFJlbW92
ZSB0aGUgZW50cnkgZm9yIHRoZSBmaXJzdAo+ID4gPiA+ID4gKyAgICAgICAgICogdGFibGUgaWYg
dGhlIHNsb3QgaXMgbm90IDEgKHJ1bnRpbWUgWGVuIG1hcHBpbmcgaXMgMk0gLQo+ID4gPiA+ID4g
NE0pLgo+ID4gPiA+ID4gKyAgICAgICAgICogRm9yIHNsb3QgMSwgaXQgbWVhbnMgdGhlIElEIG1h
cCB3YXMgbm90IGNyZWF0ZWQuCj4gPiA+ID4gPiArICAgICAgICAgKi8KPiA+ID4gPiA+ICsgICAg
ICAgIGxzciAgIHgxLCB4MTksICNTRUNPTkRfU0hJRlQKPiA+ID4gPiA+ICsgICAgICAgIGFuZCAg
IHgxLCB4MSwgI0xQQUVfRU5UUllfTUFTSyAgLyogeDEgOj0gZmlyc3Qgc2xvdCAqLwo+ID4gPiA+
ID4gKyAgICAgICAgY21wICAgeDEsICMxCj4gPiA+ID4gPiArICAgICAgICBiZXEgICBpZF9tYXBf
cmVtb3ZlZAo+ID4gPiA+ID4gKyAgICAgICAgLyogSXQgaXMgbm90IGluIHNsb3QgMSwgcmVtb3Zl
IHRoZSBlbnRyeSAqLwo+ID4gPiA+ID4gKyAgICAgICAgbGRyICAgeDAsID1ib290X3NlY29uZCAg
ICAgICAgICAvKiB4MCA6PSBzZWNvbmQgdGFibGUgKi8KPiA+ID4gPiA+ICsgICAgICAgIHN0ciAg
IHh6ciwgW3gwLCB4MSwgbHNsICMzXQo+ID4gPiA+IAo+ID4gPiA+IFdvdWxkbid0IGl0IGJlIGEg
Yml0IG1vcmUgcmVsaWFibGUgaWYgd2UgY2hlY2tlZCB3aGV0aGVyIHRoZSBzbG90IGluCj4gPiA+
ID4gcXVlc3Rpb24gZm9yIHgxOSAod2hldGhlciB6ZXJvLCBmaXJzdCwgc2Vjb25kKSBpcyBhIHBh
Z2V0YWJsZSBwb2ludGVyIG9yCj4gPiA+ID4gc2VjdGlvbiBtYXAsIHRoZW4gemVybyBpdCBpZiBp
dCBpcyBhIHNlY3Rpb24gbWFwLCBvdGhlcndpc2UgZ28gZG93biBvbmUKPiA+ID4gPiBsZXZlbD8g
SWYgd2UgZGlkIGl0IHRoaXMgd2F5IGl0IHdvdWxkIGJlIGluZGVwZW5kZW50IGZyb20gdGhlIHdh
eQo+ID4gPiA+IGNyZWF0ZV9wYWdlX3RhYmxlcyBpcyB3cml0dGVuLgo+ID4gPiAKPiA+ID4gWW91
ciBzdWdnZXN0aW9uIHdpbGwgbm90IGNvbXBseSB3aXRoIHRoZSBhcmNoaXRlY3R1cmUgY29tcGxp
YW5jZSBhbmQgaG93Cj4gPiA+IFhlbgo+ID4gPiBpcy93aWxsIGJlIHdvcmtpbmcgYWZ0ZXIgdGhl
IGZ1bGwgcmV3b3JrLiBXZSB3YW50IHRvIHJlbW92ZSBldmVyeXRoaW5nCj4gPiA+IChtYXBwaW5n
ICsgdGFibGUpIGFkZGVkIHNwZWNpZmljYWxseSBmb3IgdGhlIDE6MSBtYXBwaW5nLgo+ID4gPiAK
PiA+ID4gT3RoZXJ3aXNlLCB5b3UgbWF5IGVuZCB1cCBpbiBhIHBvc2l0aW9uIHdoZXJlIGJvb3Rf
Zmlyc3RfaWQgaXMgc3RpbGwgaW4KPiA+ID4gcGxhY2UuCj4gPiA+IFdlIHdvdWxkIG5lZWQgdG8g
dXNlIHRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZSBpbiBzdWJzZXF1ZW50IGNvZGUgaWYK
PiA+ID4gd2UKPiA+ID4gd2VyZSBhYm91dCB0byBpbnNlcnQgMUdCIG1hcHBpbmcgYXQgdGhlIHNh
bWUgcGxhY2UuCj4gPiA+IAo+ID4gPiBBZnRlciBteSByZXdvcmssIHdlIHdvdWxkIGhhdmUgdmly
dHVhbGx5IG5vIHBsYWNlIHdoZXJlIGJyZWFrLWJlZm9yZS1tYWtlCj4gPiA+IHdpbGwKPiA+ID4g
YmUgbmVjZXNzYXJ5IGFzIGl0IHdpbGwgZW5mb3JjZSBhbGwgdGhlIG1hcHBpbmdzIHRvIGJlIGRl
c3Ryb3llZCBiZWZvcmUKPiA+ID4gaGFuZC4KPiA+ID4gU28gSSB3b3VsZCByYXRoZXIgYXZvaWQg
dG8gbWFrZSBhIHNwZWNpZmljIGNhc2UgZm9yIHRoZSAxOjEgbWFwcGluZy4KPiA+IAo+ID4gSSBk
b24ndCBmdWxseSB1bmRlcnN0YW5kIHlvdXIgZXhwbGFuYXRpb24uIEkgdW5kZXJzdGFuZCB0aGUg
ZmluYWwgZ29hbAo+ID4gb2YgInJlbW92aW5nIGV2ZXJ5dGhpbmcgKG1hcHBpbmcgKyB0YWJsZSkg
YWRkZWQgc3BlY2lmaWNhbGx5IGZvciB0aGUgMToxCj4gPiBtYXBwaW5nIi4gSSBkb24ndCB1bmRl
cnN0YW5kIHdoeSBteSBzdWdnZXN0aW9uIHdvdWxkIGJlIGEgaGluZHJhbmNlCj4gPiB0b3dhcmQg
dGhhdCBnb2FsLCBjb21wYXJlZCB0byB3aGF0IGl0IGlzIGRvbmUgaW4gdGhpcyBwYXRjaC4KPiAK
PiBCZWNhdXNlLCBBRkFJQ1QsIHlvdXIgc3VnZ2VzdGlvbiB3aWxsIG9ubHkgcmVtb3ZlIHRoZSBt
YXBwaW5nIGFuZCBub3QgdGhlCj4gdGFibGVzIChzdWNoIGFzIGJvb3RfZmlyc3RfaWQpLiBUaGlz
IGlzIGRpZmZlcmVudCBmcm9tIHRoaXMgcGF0Y2ggd2hlcmUgYm90aAo+IG1hcHBpbmcgYW5kIHRh
YmxlcyBhcmUgcmVtb3ZlZC4KPgo+IFNvIHllcywgbXkgc3VnZ2VzdGlvbiBpcyBub3QgZ2VuZXJp
YywgYnV0IGF0IGxlYXN0IGl0IGRvZXMgdGhlIGpvYiB0aGF0IGlzCj4gZXhwZWN0ZWQgYnkgdGhp
cyBmdW5jdGlvbi4gSS5lIHJlbW92aW5nIGFueXRoaW5nIHRoYXQgd2FzIHNwZWNpZmljYWxseSBj
cmVhdGVkCj4gZm9yIHRoZSBpZGVudGl0eSBtYXBwaW5nLgoKSSB1bmRlcnN0YW5kIHlvdXIgY29t
bWVudCBub3csIGFuZCBvZiBjb3Vyc2UgSSBhZ3JlZSB0aGF0IGJvdGggbWFwcGluZwphbmQgdGFi
bGVzIG5lZWQgdG8gYmUgcmVtb3ZlZC4KCkkgYW0gY2FyZWZ1bCBtYWtpbmcgc3VnZ2VzdGlvbnMg
Zm9yIGFzc2VtYmx5IGNvZGluZyBiZWNhdXNlIEkgZG9uJ3QKcmVhbGx5IHdhbnQgdG8gc3VnZ2Vz
dCBzb21ldGhpbmcgdGhhdCBkb2Vzbid0IHdvcmssIG9yIGV2ZW4gaWYgaXQgd29ya3MKdGhhdCBp
dCdzIHdvcnNlIHRoYW4gdGhlIG9yaWdpbmFsLgoKSXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIHJl
bW92ZSBib3RoIHRoZSB0YWJsZSBhbmQgdGhlIG1hcHBpbmcgaW4gYQpnZW5lcmljIHdheS4gSW5z
dGVhZCBvZiBoYXJkY29kaW5nIHRoZSBhc3NlbXBseSBlcXVpdmFsZW50IG9mICJJdCBpcyBub3QK
aW4gc2xvdCAwLCByZW1vdmUgdGhlIGVudHJ5Iiwgd2UgY291bGQgY2hlY2sgd2hldGhlciB0aGUg
dGFibGUgb2Zmc2V0Cm1hdGNoZXMgdGhlIHRhYmxlIG9mZnNldCBvZiB0aGUgbWFwcGluZyB0aGF0
IHdlIHdhbnQgdG8gcHJlc2VydmUuIFRoYXQKd2F5LCAic2xvdCAwIiB3b3VsZCBiZSBjYWxjdWxh
dGUgaW5zdGVhZCBvZiBoYXJkY29kZWQsIGFuZCB0aGUgY29kZQp3b3VsZCBiZSBwcmV0dHkgZ2Vu
ZXJpYy4gV2hhdCBkbyB5b3UgdGhpbms/IEl0IHNob3VsZCBvbmx5IGJlIGEgc21hbGwKYWRkaXRp
b24uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
