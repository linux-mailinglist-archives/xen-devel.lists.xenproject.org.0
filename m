Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DF79CE6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 01:38:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsFBg-0006dy-0y; Mon, 29 Jul 2019 23:36:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsFBe-0006dt-KL
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 23:36:14 +0000
X-Inumbo-ID: a6c60528-b259-11e9-bdb9-430eaf741f6c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6c60528-b259-11e9-bdb9-430eaf741f6c;
 Mon, 29 Jul 2019 23:36:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EFF220679;
 Mon, 29 Jul 2019 23:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564443372;
 bh=+jaMTx4BrZVSf2Zo1EDNLnta64swh6s/xohVSgl83nA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=lT36jFA3ww8uIOXsF0zyxMnKFh5UwKrvogWKKGJJNQvT7+6N2sPta8pC7IUJxVppb
 aS7gZ9ldTMmpWwffgeiZYCn30OSgc+9eNLvQ4JFHhFaLQj/pwu3I3slkUgwx1/6vG+
 dh66R4rAxI8pFHYDqbPI4D0AFLPTfKat7JDJxFxo=
Date: Mon, 29 Jul 2019 16:36:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-6-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907291635570.1237@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-6-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 05/35] xen/arm64: head: Introduce
 print_reg
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

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHRoZSB1c2VyIHNob3VsZCBzYXZlIHgzMC9sciBpZiBpdCBjYXJlcyBhYm91dCBpdC4KPiAKPiBG
b2xsb3ctdXAgcGF0Y2hlcyB3aWxsIGludHJvZHVjZSBtb3JlIHVzZSBvZiBwdXRuIGluIHBsYWNl
IHdoZXJlIGxyCj4gc2hvdWxkIGJlIHByZXNlcnZlZC4KPiAKPiBGdXJ0aGVybW9yZSwgYW55IHVz
ZXIgb2YgcHV0biBzaG91bGQgYWxzbyBtb3ZlIHRoZSB2YWx1ZSB0byByZWdpc3RlciB4MAo+IGlm
IGl0IHdhcyBzdG9yZWQgaW4gYSBkaWZmZXJlbnQgcmVnaXN0ZXIuCj4gCj4gRm9yIGNvbnZlbmll
bmNlLCBhIG5ldyBtYWNybyBpcyBpbnRyb2R1Y2VkIHRvIHByaW50IGEgZ2l2ZW4gcmVnaXN0ZXIu
Cj4gVGhlIG1hY3JvIHdpbGwgdGFrZSBjYXJlIGZvciB1cyB0byBtb3ZlIHRoZSB2YWx1ZSB0byB4
MCBhbmQgYWxzbwo+IHByZXNlcnZlIGxyLgo+IAo+IExhc3RseSB0aGUgbmV3IG1hY3JvIGlzIHVz
ZWQgdG8gcmVwbGFjZSBhbGwgdGhlIGNhbGxzaXRlIG9mIHB1dG4uIFRoaXMKPiB3aWxsIHNpbXBs
aWZ5IHJld29yay9yZXZpZXcgbGF0ZXIgb24uCj4gCj4gTm90ZSB0aGF0IEN1cnJlbnRFTCBpcyBu
b3cgc3RvcmVkIGluIHg1IGluc3RlYWQgb2YgeDQgYmVjYXVzZSB0aGUgbGF0dGVyCj4gd2lsbCBi
ZSBjbG9iYmVyZWQgYnkgdGhlIG1hY3JvIHByaW50X3JlZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCmFuZCBjb21taXR0ZWQKCj4gLS0t
Cj4gICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIFJlLW9yZGVyIHRoZSBpbnN0cnVjdGlv
bnMgdG8gYXZvaWQgY2xvYmVycmluZyB4NCBlYXJseS4gVGhpcwo+ICAgICAgICAgYWxsb3dzIHRv
IHByaW50IGNvbnRlbnQgb2YgeDQuCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMg
fCAyOSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBpbmRleCBiNjg0
MDkxYWFjLi42M2Q2M2JjOGVjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFk
LlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gQEAgLTkwLDggKzkwLDI1IEBA
Cj4gICAgICAgICAgYmwgICAgcHV0cyAgICA7ICAgIFwKPiAgICAgICAgICBtb3YgICBsciwgeDMg
OyAgICAgXAo+ICAgICAgICAgIFJPREFUQV9TVFIoOTgsIF9zKQo+ICsKPiArLyoKPiArICogTWFj
cm8gdG8gcHJpbnQgdGhlIHZhbHVlIG9mIHJlZ2lzdGVyIFx4Ygo+ICsgKgo+ICsgKiBDbG9iYmVy
cyB4MCAtIHg0Cj4gKyAqLwo+ICsubWFjcm8gcHJpbnRfcmVnIHhiCj4gKyAgICAgICAgbW92ICAg
eDAsIFx4Ygo+ICsgICAgICAgIG1vdiAgIHg0LCBscgo+ICsgICAgICAgIGJsICAgIHB1dG4KPiAr
ICAgICAgICBtb3YgICBsciwgeDQKPiArLmVuZG0KPiArCj4gICNlbHNlIC8qIENPTkZJR19FQVJM
WV9QUklOVEsgKi8KPiAgI2RlZmluZSBQUklOVChzKQo+ICsKPiArLm1hY3JvIHByaW50X3JlZyB4
Ygo+ICsuZW5kbQo+ICsKPiAgI2VuZGlmIC8qICFDT05GSUdfRUFSTFlfUFJJTlRLICovCj4gIAo+
ICAvKiBMb2FkIHRoZSBwaHlzaWNhbCBhZGRyZXNzIG9mIGEgc3ltYm9sIGludG8geGIgKi8KPiBA
QCAtMzA0LDIyICszMjEsMjAgQEAgR0xPQkFMKGluaXRfc2Vjb25kYXJ5KQo+ICAjaWZkZWYgQ09O
RklHX0VBUkxZX1BSSU5USwo+ICAgICAgICAgIGxkciAgIHgyMywgPUVBUkxZX1VBUlRfQkFTRV9B
RERSRVNTIC8qIHgyMyA6PSBVQVJUIGJhc2UgYWRkcmVzcyAqLwo+ICAgICAgICAgIFBSSU5UKCIt
IENQVSAiKQo+IC0gICAgICAgIG1vdiAgIHgwLCB4MjQKPiAtICAgICAgICBibCAgICBwdXRuCj4g
KyAgICAgICAgcHJpbnRfcmVnIHgyNAo+ICAgICAgICAgIFBSSU5UKCIgYm9vdGluZyAtXHJcbiIp
Cj4gICNlbmRpZgo+ICAKPiAgY29tbW9uX3N0YXJ0Ogo+ICAKPiAgICAgICAgICBQUklOVCgiLSBD
dXJyZW50IEVMICIpCj4gLSAgICAgICAgbXJzICAgeDQsIEN1cnJlbnRFTAo+IC0gICAgICAgIG1v
diAgIHgwLCB4NAo+IC0gICAgICAgIGJsICAgIHB1dG4KPiArICAgICAgICBtcnMgICB4NSwgQ3Vy
cmVudEVMCj4gKyAgICAgICAgcHJpbnRfcmVnIHg1Cj4gICAgICAgICAgUFJJTlQoIiAtXHJcbiIp
Cj4gIAo+ICAgICAgICAgIC8qIEFyZSB3ZSBpbiBFTDIgKi8KPiAtICAgICAgICBjbXAgICB4NCwg
I1BTUl9NT0RFX0VMMnQKPiAtICAgICAgICBjY21wICB4NCwgI1BTUl9NT0RFX0VMMmgsICMweDQs
IG5lCj4gKyAgICAgICAgY21wICAgeDUsICNQU1JfTU9ERV9FTDJ0Cj4gKyAgICAgICAgY2NtcCAg
eDUsICNQU1JfTU9ERV9FTDJoLCAjMHg0LCBuZQo+ICAgICAgICAgIGIuZXEgIGVsMiAvKiBZZXMg
Ki8KPiAgCj4gICAgICAgICAgLyogT0ssIHdlJ3JlIGJvbmVkLiAqLwo+IC0tIAo+IDIuMTEuMAo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
