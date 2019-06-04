Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46649352FE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 01:14:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYIaw-0008J8-NU; Tue, 04 Jun 2019 23:11:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmcs=UD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hYIav-0008Iy-Sb
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 23:11:53 +0000
X-Inumbo-ID: 23ae1d08-871e-11e9-ac65-ab5380d410cb
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23ae1d08-871e-11e9-ac65-ab5380d410cb;
 Tue, 04 Jun 2019 23:11:53 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7081A2067C;
 Tue,  4 Jun 2019 23:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559689912;
 bh=WtYtun+4iOwsvjWR323+yVTtqPxtPgw5SkSTTpsXzNM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FhgY8T9NL9rVDvo3Sm0pQC/aYSUc5RWkYjWrBvGs3J/Ny7wh82Av4KPgIbDkIniOT
 bvh2RhMHfi3yUyWRu6ElgnOtUf1JOncjqmml/7kIsaq5/ijz070R6AyPqRYeRem1AS
 Cg8PGRjkQqm04TW2CU4Uy7uRDwe/WW+1s7f4X8Uk=
Date: Tue, 4 Jun 2019 16:11:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-17-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906041048490.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-17-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBmdW5jdGlvbiBj
cmVhdGVfeGVuX2VudHJpZXMoKSBtYXkgYmUgY2FsbGVkIGNvbmN1cnJlbnRseS4gRm9yCj4gaW5z
dGFuY2UsIHdoaWxlIHRoZSB2bWFwIGFsbG9jYXRpb24gaXMgcHJvdGVjdGVkIGJ5IGEgc3Bpbmxv
Y2ssIHRoZQo+IG1hcHBpbmcgaXMgbm90LgoKRG8geW91IGhhdmUgYW4gZXhhbXBsZSBvZiBwb3Rl
bnRpYWwgY29uY3VycmVudCBjYWxscyBvZgpjcmVhdGVfeGVuX2VudHJpZXMoKSB3aGljaCBkb2Vz
bid0IGludm9sdmUgY29uY3VycmVudCB2bWFwcyAoYmVjYXVzZQp2bWFwcyBhcmUgYWxyZWFkeSBw
cm90ZWN0ZWQgYnkgdGhlaXIgc3BpbmxvY2spPyB2bWFwICsgc29tZXRoaW5nX2Vsc2UKZm9yIGlu
c3RhbmNlPwoKCj4gVGhlIGltcGxlbWVudGF0aW9uIGNyZWF0ZV94ZW5fZW50cmllcygpIGNvbnRh
aW5zIHF1aXRlIGEgZmV3IFRPQ1RPVQo+IHJhY2VzIHN1Y2ggYXMgd2hlbiBhbGxvY2F0aW5nIHRo
ZSAzcmQtbGV2ZWwgcGFnZS10YWJsZXMuCj4gCj4gVGhhbmtmdWxseSwgdGhleSBhcmUgcHJldHR5
IGhhcmQgdG8gcmVhY2ggYXMgcGFnZS10YWJsZXMgYXJlIGFsbG9jYXRlZAo+IG9uY2UgYW5kIG5l
dmVyIHJlbGVhc2VkLiBZZXQgaXQgaXMgcG9zc2libGUsIHNvIHdlIG5lZWQgdG8gcHJvdGVjdCB3
aXRoCj4gYSBzcGlubG9jayB0byBhdm9pZCBjb3JydXB0aW5nIHRoZSBwYWdlLXRhYmxlcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+
IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBSZXdvcmsgdGhlIGNvbW1pdCBt
ZXNzYWdlCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9tbS5jIHwgNiArKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0u
YyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gaW5kZXggOWE1ZjJlMWMzZi4uNzUwMmExNDc2MCAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0uYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jCj4g
QEAgLTk3NCw2ICs5NzQsOCBAQCBlbnVtIHhlbm1hcF9vcGVyYXRpb24gewo+ICAgICAgUkVTRVJW
RQo+ICB9Owo+ICAKPiArc3RhdGljIERFRklORV9TUElOTE9DSyh4ZW5fcHRfbG9jayk7Cj4gKwo+
ICBzdGF0aWMgaW50IGNyZWF0ZV94ZW5fZW50cmllcyhlbnVtIHhlbm1hcF9vcGVyYXRpb24gb3As
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmlydCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuLAo+IEBAIC05ODUsNiArOTg3
LDggQEAgc3RhdGljIGludCBjcmVhdGVfeGVuX2VudHJpZXMoZW51bSB4ZW5tYXBfb3BlcmF0aW9u
IG9wLAo+ICAgICAgbHBhZV90IHB0ZSwgKmVudHJ5Owo+ICAgICAgbHBhZV90ICp0aGlyZCA9IE5V
TEw7Cj4gIAo+ICsgICAgc3Bpbl9sb2NrKCZ4ZW5fcHRfbG9jayk7Cj4gKwo+ICAgICAgZm9yKDsg
YWRkciA8IGFkZHJfZW5kOyBhZGRyICs9IFBBR0VfU0laRSwgbWZuID0gbWZuX2FkZChtZm4sIDEp
KQo+ICAgICAgewo+ICAgICAgICAgIGVudHJ5ID0gJnhlbl9zZWNvbmRbc2Vjb25kX2xpbmVhcl9v
ZmZzZXQoYWRkcildOwo+IEBAIC0xMDU5LDYgKzEwNjMsOCBAQCBvdXQ6Cj4gICAgICAgKi8KPiAg
ICAgIGZsdXNoX3hlbl90bGJfcmFuZ2VfdmEodmlydCwgUEFHRV9TSVpFICogbnJfbWZucyk7Cj4g
IAo+ICsgICAgc3Bpbl91bmxvY2soJnhlbl9wdF9sb2NrKTsKPiArCj4gICAgICByZXR1cm4gcmM7
Cj4gIH0KPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
