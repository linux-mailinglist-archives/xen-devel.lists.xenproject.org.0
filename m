Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E007B36E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 21:36:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsXsv-0000jw-P0; Tue, 30 Jul 2019 19:34:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsXsu-0000jr-6n
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 19:34:08 +0000
X-Inumbo-ID: febfe78b-b300-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id febfe78b-b300-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 19:34:07 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26D002089E;
 Tue, 30 Jul 2019 19:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564515246;
 bh=OCJcbSA6E23ax4pg6HpJibdp9iyr7oHmeFkKUsXQFNc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=axs+VftGVWQO9kaU6oM56EGx6Usu4tWf962YfpSDKcivodrABn/+vsYvYRRQoVUwj
 DgvLiQkSZ6cZTHT0tmBG6ru53poQEau/CztGKrwz7xPgeRdD8ZNpnKXfvvJ/kzBpio
 /+YZX38y0GpWPOlmjHd4eGNGXorfqWIlpaoCbhU8=
Date: Tue, 30 Jul 2019 12:34:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-22-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301233430.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-22-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 21/35] xen/arm32: head: Don't clobber
 r14/lr in the macro PRINT
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

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBjdXJyZW50IGlt
cGxlbWVudGF0aW9uIG9mIHRoZSBtYWNybyBQUklOVCB3aWxsIGNsb2JiZXIgcjE0L2xyLiBUaGlz
Cj4gbWVhbnMgdGhlIHVzZXIgc2hvdWxkIHNhdmUgcjE0IGlmIGl0IGNhcmVzIGFib3V0IGl0Lgo+
IAo+IEZvbGxvdy11cCBwYXRjaGVzIHdpbGwgaW50cm9kdWNlIG1vcmUgdXNlIG9mIFBSSU5UIGlu
IHBsYWNlcyB3aGVyZSBscgo+IHNob3VsZCBiZSBwcmVzZXJ2ZWQuIFJhdGhlciB0aGFuIHJlcXVp
cmluZyBhbGwgdGhlIHVzZXIgdG8gcHJlc2VydmUgbHIsCj4gdGhlIG1hY3JvIFBSSU5UIGlzIG1v
ZGlmaWVkIHRvIHNhdmUgYW5kIHJlc3RvcmUgaXQuCj4gCj4gV2hpbGUgdGhlIGNvbW1lbnQgc3Rh
dGUgcjMgd2lsbCBiZSBjbG9iYmVyZWQsIHRoaXMgaXMgbm90IHRoZSBjYXNlLiBTbwo+IFBSSU5U
IHdpbGwgdXNlIHIzIHRvIHByZXNlcnZlIGxyLgo+IAo+IExhc3RseSwgdGFrZSB0aGUgb3Bwb3J0
dW5pdHkgdG8gbW92ZSB0aGUgY29tbWVudCBvbiB0b3Agb2YgUFJJTlQgYW5kIHVzZQo+IFBSSU5U
IGluIGluaXRfdWFydC4gQm90aCBjaGFuZ2VzIHdpbGwgYmUgaGVscGZ1bCBpbiBhIGZvbGxvdy11
cCBwYXRjaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KCgo+IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBQYXRjaCBh
ZGRlZAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgMjcgKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBi
L3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBpbmRleCA4YjRjOGE0NzE0Li5iNTQzMzFjMTlk
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiArKysgYi94ZW4vYXJj
aC9hcm0vYXJtMzIvaGVhZC5TCj4gQEAgLTY0LDE1ICs2NCwyMCBAQAo+ICAgKiAgIHIxNCAtIExS
Cj4gICAqICAgcjE1IC0gUEMKPiAgICovCj4gLS8qIE1hY3JvIHRvIHByaW50IGEgc3RyaW5nIHRv
IHRoZSBVQVJULCBpZiB0aGVyZSBpcyBvbmUuCj4gLSAqIENsb2JiZXJzIHIwLXIzLiAqLwo+ICAj
aWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USwo+IC0jZGVmaW5lIFBSSU5UKF9zKSAgICAgICBcCj4g
LSAgICAgICAgYWRyICAgcjAsIDk4ZiA7IFwKPiAtICAgICAgICBibCAgICBwdXRzICAgIDsgXAo+
IC0gICAgICAgIGIgICAgIDk5ZiAgICAgOyBcCj4gLTk4OiAgICAgLmFzY2l6IF9zICAgICA7IFwK
PiAtICAgICAgICAuYWxpZ24gMiAgICAgIDsgXAo+ICsvKgo+ICsgKiBNYWNybyB0byBwcmludCBh
IHN0cmluZyB0byB0aGUgVUFSVCwgaWYgdGhlcmUgaXMgb25lLgo+ICsgKgo+ICsgKiBDbG9iYmVy
cyByMCAtIHIzCj4gKyAqLwo+ICsjZGVmaW5lIFBSSU5UKF9zKSAgICAgICAgICAgXAo+ICsgICAg
ICAgIG1vdiAgIHIzLCBsciAgICAgICA7XAo+ICsgICAgICAgIGFkciAgIHIwLCA5OGYgICAgICA7
XAo+ICsgICAgICAgIGJsICAgIHB1dHMgICAgICAgICA7XAo+ICsgICAgICAgIG1vdiAgIGxyLCBy
MyAgICAgICA7XAo+ICsgICAgICAgIGIgICAgIDk5ZiAgICAgICAgICA7XAo+ICs5ODogICAgIC5h
c2NpeiBfcyAgICAgICAgICA7XAo+ICsgICAgICAgIC5hbGlnbiAyICAgICAgICAgICA7XAo+ICA5
OToKPiAgI2Vsc2UgLyogQ09ORklHX0VBUkxZX1BSSU5USyAqLwo+ICAjZGVmaW5lIFBSSU5UKHMp
Cj4gQEAgLTUwMCwxMCArNTA1LDggQEAgaW5pdF91YXJ0Ogo+ICAjaWZkZWYgRUFSTFlfUFJJTlRL
X0lOSVRfVUFSVAo+ICAgICAgICAgIGVhcmx5X3VhcnRfaW5pdCByMTEsIHIxLCByMgo+ICAjZW5k
aWYKPiAtICAgICAgICBhZHIgICByMCwgMWYKPiAtICAgICAgICBiICAgICBwdXRzICAgICAgICAg
ICAgICAgICAgLyogSnVtcCB0byBwdXRzICovCj4gLTE6ICAgICAgLmFzY2l6ICItIFVBUlQgZW5h
YmxlZCAtXHJcbiIKPiAtICAgICAgICAuYWxpZ24gNAo+ICsgICAgICAgIFBSSU5UKCItIFVBUlQg
ZW5hYmxlZCAtXHJcbiIpCj4gKyAgICAgICAgbW92ICAgcGMsIGxyCj4gIAo+ICAvKgo+ICAgKiBQ
cmludCBlYXJseSBkZWJ1ZyBtZXNzYWdlcy4KPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
