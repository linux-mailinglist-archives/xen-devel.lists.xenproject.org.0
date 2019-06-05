Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43335A95
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 12:39:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTH3-0005vZ-3z; Wed, 05 Jun 2019 10:36:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYTH1-0005v2-SX
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 10:36:03 +0000
X-Inumbo-ID: b760e38d-877d-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b760e38d-877d-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 10:36:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD908374;
 Wed,  5 Jun 2019 03:36:02 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E276D3F690;
 Wed,  5 Jun 2019 03:36:01 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-17-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041048490.14041@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <97d5c58d-b198-a094-4f54-78d94d1c8d42@arm.com>
Date: Wed, 5 Jun 2019 11:36:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906041048490.14041@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 16/19] xen/arm: mm:
 Protect Xen page-table update with a spinlock
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
Cc: xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA1LzA2LzIwMTkgMDA6MTEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDE0IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFRoZSBmdW5j
dGlvbiBjcmVhdGVfeGVuX2VudHJpZXMoKSBtYXkgYmUgY2FsbGVkIGNvbmN1cnJlbnRseS4gRm9y
Cj4+IGluc3RhbmNlLCB3aGlsZSB0aGUgdm1hcCBhbGxvY2F0aW9uIGlzIHByb3RlY3RlZCBieSBh
IHNwaW5sb2NrLCB0aGUKPj4gbWFwcGluZyBpcyBub3QuCj4gCj4gRG8geW91IGhhdmUgYW4gZXhh
bXBsZSBvZiBwb3RlbnRpYWwgY29uY3VycmVudCBjYWxscyBvZgo+IGNyZWF0ZV94ZW5fZW50cmll
cygpIHdoaWNoIGRvZXNuJ3QgaW52b2x2ZSBjb25jdXJyZW50IHZtYXBzIChiZWNhdXNlCj4gdm1h
cHMgYXJlIGFscmVhZHkgcHJvdGVjdGVkIGJ5IHRoZWlyIHNwaW5sb2NrKT8gdm1hcCArIHNvbWV0
aGluZ19lbHNlCj4gZm9yIGluc3RhbmNlPwpXZWxsLCBJIGdhdmUgYW4gZXhhbXBsZSBoZXJlLiBU
aGUgdm1hcCBhbGxvY2F0aW9uIChpLmUgdm1fYWxsb2MpIGlzIHByb3RlY3RlZCBieSAKYSBzcGlu
bG9jay4gSG93ZXZlciwgd2hlbiB0aGUgbWFwcGluZyBpcyBkb25lIHRoZXJlIGFyZSBubyBzcGlu
bG9jayB0byBwcm90ZWN0ZWQgCmFnYWluc3QgY29uY3VycmVudCBvbmUuCgpTbyB0aGUgZm9sbG93
aW5nIHNjZW5hcmlvIGNvdWxkIGhhcHBlbjoKCkNQVTAJCQkJICAgICAgfAlDUFUxCgkJCQkgICAg
ICB8CnZtYXAoKQkJCQkgICAgICB8CXZtYXAoKQogICB2bV9hbGxvYygpCQkJICAgICAgfCAgIHZt
X2FsbG9jKCkKICAgICBzcGluX2xvY2soKQkJCSAgICAgIHwKICAgICAuLi4JCQkgIAkgICAgICB8
CiAgICAgc3Bpbl91bmxvY2soKQkJICAgICAgfAoJCQkJICAgICAgfAkgICAgc3Bpbl9sb2NrKCkK
ICAgICAqIGludGVycnVwdCAqCQkgICAgICB8CSAgICAuLi4KCQkJCSAgICAgIHwJICAgIHNwaW5f
dW5sb2NrKCkKCQkJCSAgICAgIHwKICAgICBtYXBfcGFnZXNfdG9feGVuKCkJCSAgICAgIHwJICAg
IG1hcF9wYWdlc190b194ZW4oKQoJZW50cnkgPSAmeGVuX3NlY29uZFtYXQkgICAgICB8CSAJZW50
cnkgPSAmeGVuX3NlY29uZFtZXQoJKiBlbnRyeSBpbnZhbGlkICogICAgICAgICAgICAgfCAgICAg
ICAgICogZW50cnkgaW52YWxpZCAqCgljcmVhdGVfeGVuX3RhYmxlKCkJICAgICAgfAkJY3JlYXRl
X3hlbl90YWJsZSgpCgkKCkFzc3VtaW5nIFggPT0gWSAoaS5lIHdlIHRoZSB4ZW4gc2Vjb25kIGVu
dHJ5IGlzIHRoZSBzYW1lKSwgdGhlbiBvbmUgd2lsbCB3aW4gdGhlIApyYWNlIGFuZCB0aGVyZWZv
cmUgb25lIG1hcHBpbmcgd2lsbCBiZSBpbmV4aXN0ZW50LgoKQnV0IGFzIEkgd3JvdGUsIHRoZSBj
aGFuY2UgaXQgaXMgaGFwcGVuaW5nIGlzIHZlcnkgbGltaXRlZC4KCkkgY2FuIGFkZCB0aGF0IGlu
IHRoZSBjb21taXQgbWVzc2FnZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
