Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50488B028
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:52:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQdv-0001PO-QL; Tue, 13 Aug 2019 06:50:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxQdt-0001P2-HG
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:50:49 +0000
X-Inumbo-ID: e335e1d6-bd26-11e9-80d0-7b22129d03e0
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e335e1d6-bd26-11e9-80d0-7b22129d03e0;
 Mon, 12 Aug 2019 17:30:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A305A1715;
 Mon, 12 Aug 2019 10:30:32 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F146E3F706;
 Mon, 12 Aug 2019 10:30:31 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:29:57 +0100
Message-Id: <20190812173019.11956-7-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 06/28] xen/arm64: head: Introduce a macro to
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
Cc: Julien Grall <julien.grall@arm.com>,
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
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIEZpeCB0
eXBvIGluIG15IGUtbWFpbCBhZGRyZXNzCiAgICAgICAgLSBBZGQgU3RlZmFubydzIGFja2VkLWJ5
CgogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIFBhdGNoIGFkZGVkCi0tLQogeGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUyB8IDE4ICsrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggOWI3MDNl
NzljZS4uY2QwMzEwMTE5NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwor
KysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBAIC0xMTcsNiArMTE3LDE4IEBACiAKICNl
bmRpZiAvKiAhQ09ORklHX0VBUkxZX1BSSU5USyAqLwogCisvKgorICogUHNldWRvLW9wIGZvciBQ
QyByZWxhdGl2ZSBhZHIgPHJlZz4sIDxzeW1ib2w+IHdoZXJlIDxzeW1ib2w+IGlzCisgKiB3aXRo
aW4gdGhlIHJhbmdlICsvLSA0R0Igb2YgdGhlIFBDLgorICoKKyAqIEBkc3Q6IGRlc3RpbmF0aW9u
IHJlZ2lzdGVyICg2NCBiaXQgd2lkZSkKKyAqIEBzeW06IG5hbWUgb2YgdGhlIHN5bWJvbAorICov
CisubWFjcm8gIGFkcl9sLCBkc3QsIHN5bQorICAgICAgICBhZHJwIFxkc3QsIFxzeW0KKyAgICAg
ICAgYWRkICBcZHN0LCBcZHN0LCA6bG8xMjpcc3ltCisuZW5kbQorCiAvKiBMb2FkIHRoZSBwaHlz
aWNhbCBhZGRyZXNzIG9mIGEgc3ltYm9sIGludG8geGIgKi8KIC5tYWNybyBsb2FkX3BhZGRyIHhi
LCBzeW0KICAgICAgICAgbGRyIFx4YiwgPVxzeW0KQEAgLTg5NSwxMSArOTA3LDkgQEAgRU5UUlko
ZWZpX3hlbl9zdGFydCkKICAgICAgICAgICogRmx1c2ggZGNhY2hlIGNvdmVyaW5nIGN1cnJlbnQg
cnVudGltZSBhZGRyZXNzZXMKICAgICAgICAgICogb2YgeGVuIHRleHQvZGF0YS4gVGhlbiBmbHVz
aCBhbGwgb2YgaWNhY2hlLgogICAgICAgICAgKi8KLSAgICAgICAgYWRycCAgeDEsIF9zdGFydAot
ICAgICAgICBhZGQgICB4MSwgeDEsICM6bG8xMjpfc3RhcnQKKyAgICAgICAgYWRyX2wgeDEsIF9z
dGFydAogICAgICAgICBtb3YgICB4MCwgeDEKLSAgICAgICAgYWRycCAgeDIsIF9lbmQKLSAgICAg
ICAgYWRkICAgeDIsIHgyLCAjOmxvMTI6X2VuZAorICAgICAgICBhZHJfbCB4MiwgX2VuZAogICAg
ICAgICBzdWIgICB4MSwgeDIsIHgxCiAKICAgICAgICAgYmwgICAgX19mbHVzaF9kY2FjaGVfYXJl
YQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
