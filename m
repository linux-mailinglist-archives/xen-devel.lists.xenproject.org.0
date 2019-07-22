Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B32A70BCF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:43:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2j-0002l9-9o; Mon, 22 Jul 2019 21:40:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2h-0002he-5u
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:23 +0000
X-Inumbo-ID: 4edd0f0b-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4edd0f0b-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18CA7344;
 Mon, 22 Jul 2019 14:40:22 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BCDC3F71F;
 Mon, 22 Jul 2019 14:40:21 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:41 +0100
Message-Id: <20190722213958.5761-19-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 18/35] xen/arm64: head: Introduce a macro to
 get a PC-relative address of a symbol
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
Cc: Julien Grall <julien.grall@arm.coM>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXJtNjQgcHJvdmlkZXMgaW5zdHJ1Y3Rpb25zIHRvIGxvYWQgYSBQQy1yZWxhdGl2ZSBhZGRyZXNz
LCBidXQgd2l0aCBzb21lCmxpbWl0YXRpb25zOgogICAtIGFkciBpcyBlbmFibGUgdG8gY29wZSB3
aXRoICsvLTFNQgogICAtIGFkcnAgaXMgZW5hbGUgdG8gY29wZSB3aXRoICsvLTRHQiBidXQgcmVs
YXRpdmUgdG8gYSA0S0IgcGFnZQogICAgIGFkZHJlc3MKCkJlY2F1c2Ugb2YgdGhhdCwgdGhlIGNv
ZGUgcmVxdWlyZXMgdG8gdXNlIDIgaW5zdHJ1Y3Rpb25zIHRvIGxvYWQgYW55IFhlbgpzeW1ib2wu
IFRvIG1ha2UgdGhlIGNvZGUgbW9yZSBvYnZpb3VzLCBpbnRyb2R1Y2luZyBhIG5ldyBtYWNybyBh
ZHJfbCBpcwppbnRyb2R1Y2VkLgoKVGhlIG5ldyBtYWNybyBpcyB1c2VkIHRvIHJlcGxhY2UgYSBj
b3VwbGUgb2Ygb3Blbi1jb2RlZCB1c2UgaW4KZWZpX3hlbl9zdGFydC4KClRoZSBtYWNybyBpcyBj
b3BpZWQgZnJvbSBMaW51eCA1LjItcmM0LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvTT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIFBh
dGNoIGFkZGVkCi0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDE4ICsrKysrKysrKysr
KysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMKaW5kZXggOWFmZDg5ZDQ0Ny4uMjI4N2YzY2U0OCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL2FybTY0L2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBA
IC0xMTEsNiArMTExLDE4IEBACiAKICNlbmRpZiAvKiAhQ09ORklHX0VBUkxZX1BSSU5USyAqLwog
CisvKgorICogUHNldWRvLW9wIGZvciBQQyByZWxhdGl2ZSBhZHIgPHJlZz4sIDxzeW1ib2w+IHdo
ZXJlIDxzeW1ib2w+IGlzCisgKiB3aXRoaW4gdGhlIHJhbmdlICsvLSA0R0Igb2YgdGhlIFBDLgor
ICoKKyAqIEBkc3Q6IGRlc3RpbmF0aW9uIHJlZ2lzdGVyICg2NCBiaXQgd2lkZSkKKyAqIEBzeW06
IG5hbWUgb2YgdGhlIHN5bWJvbAorICovCisubWFjcm8gIGFkcl9sLCBkc3QsIHN5bQorICAgICAg
ICBhZHJwIFxkc3QsIFxzeW0KKyAgICAgICAgYWRkICBcZHN0LCBcZHN0LCA6bG8xMjpcc3ltCisu
ZW5kbQorCiAvKiBMb2FkIHRoZSBwaHlzaWNhbCBhZGRyZXNzIG9mIGEgc3ltYm9sIGludG8geGIg
Ki8KIC5tYWNybyBsb2FkX3BhZGRyIHhiLCBzeW0KICAgICAgICAgbGRyIFx4YiwgPVxzeW0KQEAg
LTg4NiwxMSArODk4LDkgQEAgRU5UUlkoZWZpX3hlbl9zdGFydCkKICAgICAgICAgICogRmx1c2gg
ZGNhY2hlIGNvdmVyaW5nIGN1cnJlbnQgcnVudGltZSBhZGRyZXNzZXMKICAgICAgICAgICogb2Yg
eGVuIHRleHQvZGF0YS4gVGhlbiBmbHVzaCBhbGwgb2YgaWNhY2hlLgogICAgICAgICAgKi8KLSAg
ICAgICAgYWRycCAgeDEsIF9zdGFydAotICAgICAgICBhZGQgICB4MSwgeDEsICM6bG8xMjpfc3Rh
cnQKKyAgICAgICAgYWRyX2wgeDEsIF9zdGFydAogICAgICAgICBtb3YgICB4MCwgeDEKLSAgICAg
ICAgYWRycCAgeDIsIF9lbmQKLSAgICAgICAgYWRkICAgeDIsIHgyLCAjOmxvMTI6X2VuZAorICAg
ICAgICBhZHJfbCB4MiwgX2VuZAogICAgICAgICBzdWIgICB4MSwgeDIsIHgxCiAKICAgICAgICAg
YmwgICAgX19mbHVzaF9kY2FjaGVfYXJlYQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
