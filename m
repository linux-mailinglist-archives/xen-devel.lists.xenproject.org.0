Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C516C4392
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 00:12:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFQJc-0000uy-ST; Tue, 01 Oct 2019 22:08:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFQJb-0000ut-Sc
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 22:08:15 +0000
X-Inumbo-ID: f6e1c112-e497-11e9-9709-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id f6e1c112-e497-11e9-9709-12813bfff9fa;
 Tue, 01 Oct 2019 22:08:14 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB63021906;
 Tue,  1 Oct 2019 22:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569967694;
 bh=gNiNQ6K+VHMPz9BltF4z+oVkZorax4NPm0gAsLZ4M/A=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=c9eEcf2Cjr8/DSe/DdM4IffbMbu6ErkTV/2DqPyZOnKBabRV/T2qfNyhluzZSRVzr
 jl4y//tMC+gxHBp9PLC3CskfHOj6f46phmpO6ZSMoIiJKWP8jMh58BcPn5ea+8ddDr
 ywXcXpl6BV4AdRKKuJ/W/wg/w9OUS3If6RsKYycg=
Date: Tue, 1 Oct 2019 15:08:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87impd92i4.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1910011507590.2943@sstabellini-ThinkPad-T480s>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-9-julien.grall@arm.com> <87impd92i4.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 08/10] xen/arm: alternative:
 add auto-nop infrastructure
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Will Deacon <will.deacon@arm.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNyBTZXAgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gSnVsaWVuIEdy
YWxsIHdyaXRlczoKPiAKPiA+IEZyb206IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5j
b20+Cj4gPgo+ID4gSW4gc29tZSBjYXNlcywgb25lIHNpZGUgb2YgYW4gYWx0ZXJuYXRpdmUgc2Vx
dWVuY2UgaXMgc2ltcGx5IGEgbnVtYmVyIG9mCj4gPiBOT1BzIHVzZWQgdG8gYmFsYW5jZSB0aGUg
b3RoZXIgc2lkZS4gS2VlcGluZyB0cmFjayBvZiB0aGlzIG1hbnVhbGx5IGlzCj4gPiB0ZWRpb3Vz
LCBhbmQgdGhlIHByZXNlbmNlIG9mIGxhcmdlIGNoYWlucyBvZiBOT1BzIG1ha2VzIHRoZSBjb2Rl
IG1vcmUKPiA+IHBhaW5mdWwgdG8gcmVhZCB0aGFuIG5lY2Vzc2FyeS4KPiA+Cj4gPiBUbyBhbWVs
aW9yYXRlIG1hdHRlcnMsIHRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBhbHRlcm5hdGl2ZV9lbHNlX25v
cF9lbmRpZiwKPiA+IHdoaWNoIGF1dG9tYXRpY2FsbHkgYmFsYW5jZXMgYW4gYWx0ZXJuYXRpdmUg
c2VxdWVuY2Ugd2l0aCBhIHRyaXZpYWwgTk9QCj4gPiBzbGVkLgo+ID4KPiA+IEluIG1hbnkgY2Fz
ZXMsIHdlIHdvdWxkIGxpa2UgYSBOT1Atc2xlZCBpbiB0aGUgZGVmYXVsdCBjYXNlLCBhbmQKPiA+
IGluc3RydWN0aW9ucyBwYXRjaGVkIGluIGluIHRoZSBwcmVzZW5jZSBvZiBhIGZlYXR1cmUuIFRv
IGVuYWJsZSB0aGUgTk9Qcwo+ID4gdG8gYmUgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgZm9yIHRo
aXMgY2FzZSwgdGhpcyBwYXRjaCBhbHNvIGFkZHMgYSBuZXcKPiA+IGFsdGVybmF0aXZlX2lmLCBh
bmQgdXBkYXRlcyBhbHRlcm5hdGl2ZV9lbHNlIGFuZCBhbHRlcm5hdGl2ZV9lbmRpZiB0bwo+ID4g
d29yayB3aXRoIGVpdGhlciBhbHRlcm5hdGl2ZV9pZiBvciBhbHRlcm5hdGl2ZV9lbmRpZi4KPiA+
Cj4gPiBUaGUgYWx0ZXJuYXRpdmUgaW5mcmFzdHJ1Y3R1cmUgd2FzIG9yaWdpbmFsbHkgcG9ydGVk
IGZyb20gTGludXguIFNvIHRoaXMKPiA+IGlzIHByZXR0eSBtdWNoIGEgc3RyYWlnaHQgYmFja3Bv
cnQgZnJvbSBjb21taXQgNzkyZDQ3Mzc5ZjRkICJhcm02NDoKPiA+IGFsdGVybmF0aXZlOiBhZGQg
YXV0by1ub3AgaW5mcmFzdHJ1Y3R1cmUiLiBUaGUgb25seSBkaWZmZXJlbmNlIGlzIHRoZQo+ID4g
bm9wcyBtYWNybyBhZGRlZCBhcyBub3QgeWV0IGV4aXN0aW5nIGluIFhlbi4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPgo+ID4gW3dpbGw6
IHVzZSBuZXcgbm9wcyBtYWNybyB0byBnZW5lcmF0ZSBub3Agc2VxdWVuY2VzXQo+ID4gU2lnbmVk
LW9mZi1ieTogV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5jb20+Cj4gPiBbanVsaWVuOiBB
ZGQgbm9wcyBhbmQgcG9ydCB0byBYZW5dCj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8
dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
