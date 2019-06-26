Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969B656DAE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 17:30:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg9pU-0007B3-LJ; Wed, 26 Jun 2019 15:27:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hg9pS-0007Ay-Sh
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 15:27:22 +0000
X-Inumbo-ID: e3cb4043-9826-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e3cb4043-9826-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 15:27:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 567EA2133F;
 Wed, 26 Jun 2019 15:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561562840;
 bh=9atBhvcg3BTOAsOwLIFnLgiRv7Oc5Lkv5mmpKV9OW1Y=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=DpsvIGspmDzlMOJXGY8rUytyQ3a8uyw3iQW2mk3jFg22Hsf4gQIs0cf5SbdQ8hAkU
 LJaAbjKdPQPHiszL2FOJ2+9LaPaLHdF7BNqS4E+C4FGqedBPXCf/Yk9VKGimXqyHA8
 yiJgftQAPYb4A+r9JkJfgvn7ChlpU97CFCytz8GY=
Date: Wed, 26 Jun 2019 08:27:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <31afe099-1a7b-d8f3-6d11-0fdf78594c2e@arm.com>
Message-ID: <alpine.DEB.2.21.1906260827080.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-3-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251627270.5851@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906251656420.5851@sstabellini-ThinkPad-T480s>
 <31afe099-1a7b-d8f3-6d11-0fdf78594c2e@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 02/17] xen/arm64: head: Don't clobber x30/lr
 in the macro PRINT
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNiBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMjYvMDYvMjAxOSAwMDo1OSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
VHVlLCAyNSBKdW4gMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiBPbiBNb24s
IDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gPiAgIFRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIG9mIHRoZSBtYWNybyBQUklOVCB3aWxsIGNsb2JiZXIgeDMwL2xyLgo+
ID4gPiA+ID4gVGhpcwo+ID4gPiA+IG1lYW5zIHRoZSB1c2VyIHNob3VsZCBzYXZlIGxyIGlmIGl0
IGNhcmVzIGFib3V0IGl0Lgo+ID4gPiAKPiA+ID4gQnkgeDMwL2xyLCBkbyB5b3UgbWVhbiB4MC14
MyBhbmQgbHI/IEkgd291bGQgcHJlZmVyIGEgY2xlYXJlcgo+ID4gPiBleHByZXNzaW9uLgo+ID4g
Cj4gPiBObyBvZiBjb3Vyc2Ugbm90ISBZb3UgbWVhbnQgeDMwIHdoaWNoIGlzIGEgc3lub255bSBv
ZiBsciEgSXQgaXMganVzdAo+ID4gdGhhdCBpbiB0aGlzIGNhc2UgaXQgaXMgYWxzbyBzdXBwb3Nl
ZCB0byBjbG9iYmVyIHgwLXgzIC0tIEkgZ290Cj4gPiBjb25mdXNlZCEgVGhlIGNvbW1pdCBtZXNz
YWdlIGlzIGFsc28gZmluZSBhcyBpcyB0aGVuLiBNb3JlIGJlbG93Lgo+ID4gCj4gPiAKPiA+ID4g
UmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
PiA+ID4gCj4gPiA+IAo+ID4gPiA+IEZvbGxvdy11cCBwYXRjaGVzIHdpbGwgaW50cm9kdWNlIG1v
cmUgdXNlIG9mIFBSSU5UIGluIHBsYWNlIHdoZXJlIGxyCj4gPiA+ID4gc2hvdWxkIGJlIHByZXNl
cnZlZC4gUmF0aGVyIHRoYW4gcmVxdWlyaW5nIGFsbCB0aGUgdXNlcnMgdG8gcHJlc2VydmUgbHIs
Cj4gPiA+ID4gdGhlIG1hY3JvIFBSSU5UIGlzIG1vZGlmaWVkIHRvIHNhdmUgYW5kIHJlc3RvcmUg
aXQuCj4gPiA+ID4gCj4gPiA+ID4gV2hpbGUgdGhlIGNvbW1lbnQgc3RhdGUgeDMgd2lsbCBiZSBj
bG9iYmVyZWQsIHRoaXMgaXMgbm90IHRoZSBjYXNlLiBTbwo+ID4gPiA+IFBSSU5UIHdpbGwgdXNl
IHgzIHRvIHByZXNlcnZlIGxyLgo+ID4gPiA+IAo+ID4gPiA+IExhc3RseSwgdGFrZSB0aGUgb3Bw
b3J0dW5pdHkgdG8gbW92ZSB0aGUgY29tbWVudCBvbiB0b3Agb2YgUFJJTlQgYW5kIHVzZQo+ID4g
PiA+IFBSSU5UIGluIGluaXRfdWFydC4gQm90aCBjaGFuZ2VzIHdpbGwgYmUgaGVscGZ1bCBpbiBh
IGZvbGxvdy11cCBwYXRjaC4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAgeGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWQuUyB8IDE0ICsrKysrKysrKy0tLS0tCj4gPiA+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gPiA+IAo+ID4gPiA+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2Fy
bTY0L2hlYWQuUwo+ID4gPiA+IGluZGV4IGM4YmJkZjA1YTYuLmE1MTQ3YzhkODAgMTAwNjQ0Cj4g
PiA+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+ID4gPiA+ICsrKyBiL3hlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMKPiA+ID4gPiBAQCAtNzgsMTIgKzc4LDE3IEBACj4gPiA+ID4g
ICAgKiAgeDMwIC0gbHIKPiA+ID4gPiAgICAqLwo+ID4gPiA+ICAgLS8qIE1hY3JvIHRvIHByaW50
IGEgc3RyaW5nIHRvIHRoZSBVQVJULCBpZiB0aGVyZSBpcyBvbmUuCj4gPiA+ID4gLSAqIENsb2Ji
ZXJzIHgwLXgzLiAqLwo+ID4gPiA+ICAgI2lmZGVmIENPTkZJR19FQVJMWV9QUklOVEsKPiA+ID4g
PiArLyoKPiA+ID4gPiArICogTWFjcm8gdG8gcHJpbnQgYSBzdHJpbmcgdG8gdGhlIFVBUlQsIGlm
IHRoZXJlIGlzIG9uZS4KPiA+ID4gPiArICoKPiA+ID4gPiArICogQ2xvYmJlcnMgeDAgLSB4Mwo+
ID4gPiA+ICsgKi8KPiA+ID4gPiAgICNkZWZpbmUgUFJJTlQoX3MpICAgICAgICAgICBcCj4gPiA+
ID4gKyAgICAgICAgbW92ICAgeDMsIGxyICA7ICAgICBcCj4gPiA+ID4gICAgICAgICAgIGFkciAg
IHgwLCA5OGYgOyAgICAgXAo+ID4gPiA+ICAgICAgICAgICBibCAgICBwdXRzICAgIDsgICAgIFwK
PiA+ID4gPiArICAgICAgICBtb3YgICBsciwgeDMgIDsgICAgIFwKPiA+ID4gPiAgICAgICAgICAg
Uk9EQVRBX1NUUig5OCwgX3MpCj4gPiAKPiA+IFN0cmFuZ2VseSBlbm91Z2ggSSBnZXQgYSBidWls
ZCBlcnJvciB3aXRoIGdjYyA3LjMuMSwgYnV0IGlmIEkgdXNlIHgzMAo+ID4gaW5zdGVhZCBvZiBs
ciwgaXQgYnVpbGRzIGZpbmUuIEhhdmUgeW91IHNlZW4gdGhpcyBiZWZvcmU/Cj4gCj4gSG1tbSwg
SSBjYW4ndCB0byByZXByb2R1Y2UgaXQgZXZlbiBvbiBvbGRlciBjb21waWxlciAoNC45KS4gTXkg
Z3Vlc3MgaXMgbm90Cj4gYWxsIHRoZSBhc3NlbWJsZXIgaXMgYWJsZSB0byB1bmRlcnN0YW5kICJs
ciIuCj4gCj4gSW4gdGhlIGZpbGUgZW50cnkuUyB3ZSBoYXZlIHRoZSBmb2xsb3dpbmcgbGluZToK
PiAKPiBsciAgICAgIC5yZXEgICAgeDMwICAgICAgICAgICAgIC8vIGxpbmsgcmVnaXN0ZXIKPiAK
PiAKPiBDb3VsZCB5b3UgZ2l2ZSBhIHRyeSB0byBhZGQgdGhlIGxpbmUgaW4gaGVhZC5TPwoKVGhh
dCB3b3JrcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
