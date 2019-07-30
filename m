Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E257B412
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 22:13:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsYSY-0003zt-Li; Tue, 30 Jul 2019 20:10:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsYSX-0003zo-HG
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 20:10:57 +0000
X-Inumbo-ID: 23a89257-b306-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 23a89257-b306-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 20:10:56 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE44520693;
 Tue, 30 Jul 2019 20:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564517455;
 bh=0e+D7qy5CservbjjBGMw3GDNyY4gKR22J+K4aavB+IA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=IIbiljViJqVyacdapeuLKOKw6isypn/rPTg0jVx9MjwIzzh3nktdRSJVgO9hEYV5n
 FAOF3eimZSkNk9sZMGJ6j29V5JyMsFtLA3Fs5xN+hMiAQDCFT+GooYdI8xAVwvVptM
 aUdA1EMpiK13JWIUcOQ1dO4zAk/9PUZ/WpGoprE4=
Date: Tue, 30 Jul 2019 13:10:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-26-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301310470.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-26-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 25/35] xen/arm32: head: Rework and
 document check_cpu_mode()
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

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEEgYnJhbmNoIGluIHRo
ZSBzdWNjZXNzIGNhc2UgY2FuIGJlIGF2b2lkZWQgYnkgaW52ZXJ0aW5nIHRoZSBicmFuY2gKPiBj
b25kaXRpb24uIEF0IHRoZSBzYW1lIHRpbWUsIHJlbW92ZSBhIHBvaW50bGVzcyBjb21tZW50IGFz
IFhlbiBjYW4gb25seQo+IHJ1biBhdCBIeXBlcnZpc29yIE1vZGUuCj4gCj4gTGFzdGx5LCBkb2N1
bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWluIHJlZ2lzdGVycyB1c2FnZSB3aXRoaW4gdGhl
Cj4gZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gUGF0
Y2ggYWRkZWQKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDE1ICsrKysrKysr
KysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNo
L2FybS9hcm0zMi9oZWFkLlMKPiBpbmRleCAxMzc5M2U4NWQ4Li4wOTU5YzRmMDQ0IDEwMDY0NAo+
IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJt
MzIvaGVhZC5TCj4gQEAgLTIwNSw2ICsyMDUsMTYgQEAgc2Vjb25kYXJ5X3N3aXRjaGVkOgo+ICAg
ICAgICAgIGIgICAgIGxhdW5jaAo+ICBFTkRQUk9DKGluaXRfc2Vjb25kYXJ5KQo+ICAKPiArLyoK
PiArICogQ2hlY2sgaWYgdGhlIENQVSBzdXBwb3J0cyB2aXJ0dWFsaXphdGlvbiBleHRlbnNpb25z
IGFuZCBoYXMgYmVlbiBib290ZWQKPiArICogaW4gSHlwZXJ2aXNvciBtb2RlLgo+ICsgKgo+ICsg
KiBUaGlzIGZ1bmN0aW9uIHdpbGwgbmV2ZXIgcmV0dXJuIHdoZW4gdGhlIENQVSBkb2Vzbid0IHN1
cHBvcnQKPiArICogdmlydHVhbGl6YXRpb24gZXh0ZW5zaW9ucyBvciBpcyBib290ZWQgaW4gYW5v
dGhlciBtb2RlIHRoYW4KPiArICogSHlwZXJ2aXNvciBtb2RlLgo+ICsgKgo+ICsgKiBDbG9iYmVy
cyByMCAtIHIzCj4gKyAqLwo+ICBjaGVja19jcHVfbW9kZToKPiAgICAgICAgICAvKiBDaGVjayB0
aGF0IHRoaXMgQ1BVIGhhcyBIeXAgbW9kZSAqLwo+ICAgICAgICAgIG1yYyAgIENQMzIocjAsIElE
X1BGUjEpCj4gQEAgLTIxOSwxNSArMjI5LDEyIEBAIGNoZWNrX2NwdV9tb2RlOgo+ICAgICAgICAg
IG1ycyAgIHIwLCBjcHNyCj4gICAgICAgICAgYW5kICAgcjAsIHIwLCAjMHgxZiAgICAgICAgICAv
KiBNb2RlIGlzIGluIHRoZSBsb3cgNSBiaXRzIG9mIENQU1IgKi8KPiAgICAgICAgICB0ZXEgICBy
MCwgIzB4MWEgICAgICAgICAgICAgIC8qIEh5cCBNb2RlPyAqLwo+IC0gICAgICAgIGJlcSAgIGh5
cAo+ICsgICAgICAgIG1vdmVxIHBjLCBsciAgICAgICAgICAgICAgICAgLyogWWVzLCByZXR1cm4g
Ki8KPiAgCj4gICAgICAgICAgLyogT0ssIHdlJ3JlIGJvbmVkLiAqLwo+ICAgICAgICAgIFBSSU5U
KCItIFhlbiBtdXN0IGJlIGVudGVyZWQgaW4gTlMgSHlwIG1vZGUgLVxyXG4iKQo+ICAgICAgICAg
IFBSSU5UKCItIFBsZWFzZSB1cGRhdGUgdGhlIGJvb3Rsb2FkZXIgLVxyXG4iKQo+ICAgICAgICAg
IGIgICAgIGZhaWwKPiAtCj4gLWh5cDogICAgUFJJTlQoIi0gWGVuIHN0YXJ0aW5nIGluIEh5cCBt
b2RlIC1cclxuIikKPiAtICAgICAgICBtb3YgICBwYywgbHIKPiAgRU5EUFJPQyhjaGVja19jcHVf
bW9kZSkKPiAgCj4gIHplcm9fYnNzOgo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
