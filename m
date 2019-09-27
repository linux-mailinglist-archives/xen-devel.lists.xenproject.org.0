Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187EEC0361
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 12:25:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDnOX-0007NT-66; Fri, 27 Sep 2019 10:22:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDnOV-0007NJ-TS
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 10:22:35 +0000
X-Inumbo-ID: 5de5617e-e110-11e9-b588-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 5de5617e-e110-11e9-b588-bc764e2007e4;
 Fri, 27 Sep 2019 10:20:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E82328;
 Fri, 27 Sep 2019 03:20:02 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B0403F534;
 Fri, 27 Sep 2019 03:20:01 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1569340911-20793-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <70a1fc15-9069-3971-5fe2-5265efa7e4ca@arm.com>
Date: Fri, 27 Sep 2019 11:20:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569340911-20793-1-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4] xen/arm: Restrict "p2m_ipa_bits"
 according to the IOMMU requirements
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKVGhhbmsgeW91IGZvciB0aGUgcmVzcGluLiBUaGUgY29kZSBpbiBwMm0u
YyBsb29rcyBnb29kIHRvIG1lIGtub3cuIE9uZSBjb21tZW50IHJlZ2FyZGluZyB0aGUgU01NVSBj
b2RlIGJlbG93LgoKT24gMjQvMDkvMjAxOSAxNzowMSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCj4gaW5kZXggOGFlOTg2YS4uNzAxZmU5
YyAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCj4gKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYwo+IEBAIC0yMTk4LDE0ICsyMTk4
LDkgQEAgc3RhdGljIGludCBhcm1fc21tdV9kZXZpY2VfY2ZnX3Byb2JlKHN0cnVjdCBhcm1fc21t
dV9kZXZpY2UgKnNtbXUpCj4gICAJc2l6ZSA9IGFybV9zbW11X2lkX3NpemVfdG9fYml0cygoaWQg
Pj4gSUQyX0lBU19TSElGVCkgJiBJRDJfSUFTX01BU0spOwo+ICAgCXNtbXUtPnMxX291dHB1dF9z
aXplID0gbWluX3QodW5zaWduZWQgbG9uZywgUEhZU19NQVNLX1NISUZULCBzaXplKTsKPiAgIAo+
IC0JLyogWGVuOiBTdGFnZS0yIGlucHV0IHNpemUgaGFzIHRvIG1hdGNoIHAybV9pcGFfYml0cy4g
ICovCj4gLQlpZiAoc2l6ZSA8IHAybV9pcGFfYml0cykgewo+IC0JCWRldl9lcnIoc21tdS0+ZGV2
LAo+IC0JCQkiUDJNIElQQSBzaXplIG5vdCBzdXBwb3J0ZWQgKFAyTT0ldSBTTU1VPSVsdSkhXG4i
LAo+IC0JCQlwMm1faXBhX2JpdHMsIHNpemUpOwo+IC0JCXJldHVybiAtRU5PREVWOwo+IC0JfQo+
IC0Jc21tdS0+czJfaW5wdXRfc2l6ZSA9IHAybV9pcGFfYml0czsKPiArCS8qIFhlbjogU2V0IG1h
eGltdW0gU3RhZ2UtMiBpbnB1dCBzaXplIHN1cHBvcnRlZCBieSB0aGUgU01NVS4gKi8KPiArCXAy
bV9yZXN0cmljdF9pcGFfYml0cyhzaXplKTsKPiArCXNtbXUtPnMyX2lucHV0X3NpemUgPSBzaXpl
OwoKU29ycnkgSSBkaWRuJ3QgcmV2aWV3IGNsb3NlbHkgdGhlIFNNTVUgY29kZSBjbG9zZWx5IHVu
dGlsIG5vdy4KCnMyX2lucHV0X3NpemUgaXMgZ29pbmcgdG8gYmUgdXNlZCBieSB0aGUgU01NVSB0
byBjb25maWd1cmUgdGhlCmNvbnRleHQgYmFua3MuIEhvd2V2ZXIsIHRoZSBudW1iZXIgb2YgSVBB
IGJpdHMgbWF5IGhhdmUgYmVlbgpyZXN0cmljdGVkIGZ1cnRoZXIgYnkgdGhlIFAyTSBsYXRlciBv
bi4KClNvIEkgd291bGQgc3F1YXNoIHRoZSBmb2xsb3dpbmcgaHVuayBpbiB0aGlzIHBhdGNoICh1
bnRlc3RlZCk6CgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUu
YyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMKaW5kZXggOGFlOTg2YTE4ZC4u
MjkzZjQyOGZjNyAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUu
YworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCkBAIC0xMTEwLDcgKzEx
MTAsMTEgQEAgc3RhdGljIHZvaWQgYXJtX3NtbXVfaW5pdF9jb250ZXh0X2Jhbmsoc3RydWN0IGFy
bV9zbW11X2RvbWFpbiAqc21tdV9kb21haW4pCiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IFRUQkNSX1RHMF82NEs7CiAKICAgICAgICAgICAgICAgIGlmICghc3RhZ2UxKSB7Ci0gICAgICAg
ICAgICAgICAgICAgICAgIHJlZyB8PSAoNjQgLSBzbW11LT5zMl9pbnB1dF9zaXplKSA8PCBUVEJD
Ul9UMFNaX1NISUZUOworICAgICAgICAgICAgICAgICAgICAgICAvKgorICAgICAgICAgICAgICAg
ICAgICAgICAgKiBYZW46IFRoZSBJT01NVSBzaGFyZSB0aGUgcGFnZS10YWJsZXMgd2l0aCB0aGUg
UDJNCisgICAgICAgICAgICAgICAgICAgICAgICAqIHdoaWNoIG1heSBoYXZlIHJlc3RyaWN0IHRo
ZSBzaXplIGZ1cnRoZXIuCisgICAgICAgICAgICAgICAgICAgICAgICAqLworICAgICAgICAgICAg
ICAgICAgICAgICByZWcgfD0gKDY0IC0gcDJtX2lwYV9iaXRzKSA8PCBUVEJDUl9UMFNaX1NISUZU
OwogCiAgICAgICAgICAgICAgICAgICAgICAgIHN3aXRjaCAoc21tdS0+czJfb3V0cHV0X3NpemUp
IHsKICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSAzMjoKCgoKPiAgICNpZiAwCj4gICAJLyog
U3RhZ2UtMiBpbnB1dCBzaXplIGxpbWl0ZWQgZHVlIHRvIHBnZCBhbGxvY2F0aW9uIChQVFJTX1BF
Ul9QR0QpICovCj4gICAjaWZkZWYgQ09ORklHXzY0QklUCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
