Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCBE17DF9
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 18:19:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOPEz-0008JD-Ek; Wed, 08 May 2019 16:16:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7fFX=TI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOPEy-0008IK-0W
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 16:16:20 +0000
X-Inumbo-ID: 9cb39e44-71ac-11e9-b79a-5f8566900e7a
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9cb39e44-71ac-11e9-b79a-5f8566900e7a;
 Wed, 08 May 2019 16:16:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A319E374;
 Wed,  8 May 2019 09:16:18 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FE603F238;
 Wed,  8 May 2019 09:16:17 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 May 2019 17:16:03 +0100
Message-Id: <20190508161603.21964-8-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190508161603.21964-1-julien.grall@arm.com>
References: <20190508161603.21964-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 7/7] xen/arm: mm: Flush the TLBs even if a
 mapping failed in create_xen_entries
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCwgY3JlYXRlX3hlbl9lbnRyaWVzIHdpbGwgb25seSBmbHVzaCB0aGUgVExC
cyBpZiB0aGUgZnVsbApyYW5nZSBoYXMgc3VjY2Vzc2Z1bGx5IGJlZW4gdXBkYXRlZC4gVGhpcyBt
YXkgbGVhZCB0byBsZWF2ZSB1bndhbnRlZAplbnRyaWVzIGluIHRoZSBUTEJzIGlmIHdlIGZhaWwg
dG8gdXBkYXRlIHNvbWUgZW50cmllcy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5p
c292QGVwYW0uY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gQWRkIEFuZHJp
aSdzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCAyMCArKysrKysrKysrKysr
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRl
eCA4ZWU4MjhkNDQ1Li45ZDU4NGU0Y2JmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYwor
KysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtOTg0LDcgKzk4NCw3IEBAIHN0YXRpYyBpbnQgY3Jl
YXRlX3hlbl9lbnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfbWZucywKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykKIHsKLSAgICBpbnQgcmM7CisgICAgaW50
IHJjID0gMDsKICAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSB2aXJ0LCBhZGRyX2VuZCA9IGFkZHIg
KyBucl9tZm5zICogUEFHRV9TSVpFOwogICAgIGxwYWVfdCBwdGUsICplbnRyeTsKICAgICBscGFl
X3QgKnRoaXJkID0gTlVMTDsKQEAgLTEwMTMsNyArMTAxMyw4IEBAIHN0YXRpYyBpbnQgY3JlYXRl
X3hlbl9lbnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKICAgICAgICAgICAgICAgICB7
CiAgICAgICAgICAgICAgICAgICAgIHByaW50aygiJXM6IHRyeWluZyB0byByZXBsYWNlIGFuIGV4
aXN0aW5nIG1hcHBpbmcgYWRkcj0lbHggbWZuPSUiUFJJX21mbiJcbiIsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBfX2Z1bmNfXywgYWRkciwgbWZuX3gobWZuKSk7Ci0gICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOworICAgICAgICAgICAgICAgICAgICByYyA9IC1FSU5WQUw7
CisgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0OwogICAgICAgICAgICAgICAgIH0KICAgICAg
ICAgICAgICAgICBpZiAoIG9wID09IFJFU0VSVkUgKQogICAgICAgICAgICAgICAgICAgICBicmVh
azsKQEAgLTEwMzAsNyArMTAzMSw4IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl9lbnRyaWVzKGVu
dW0geGVubWFwX29wZXJhdGlvbiBvcCwKICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAg
ICAgICAgIHByaW50aygiJXM6IHRyeWluZyB0byAlcyBhIG5vbi1leGlzdGluZyBtYXBwaW5nIGFk
ZHI9JWx4XG4iLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIG9wID09IFJF
TU9WRSA/ICJyZW1vdmUiIDogIm1vZGlmeSIsIGFkZHIpOwotICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKKyAgICAgICAgICAgICAgICAgICAgcmMgPSAtRUlOVkFMOworICAgICAg
ICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAg
ICAgaWYgKCBvcCA9PSBSRU1PVkUgKQogICAgICAgICAgICAgICAgICAgICBwdGUuYml0cyA9IDA7
CkBAIC0xMDQzLDcgKzEwNDUsOCBAQCBzdGF0aWMgaW50IGNyZWF0ZV94ZW5fZW50cmllcyhlbnVt
IHhlbm1hcF9vcGVyYXRpb24gb3AsCiAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAg
ICAgICAgICAgICAgIHByaW50aygiJXM6IEluY29ycmVjdCBjb21iaW5hdGlvbiBmb3IgYWRkcj0l
bHhcbiIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGFkZHIpOwot
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgICAgICAgICAgICAg
ICAgICAgICByYyA9IC1FSU5WQUw7CisgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsK
ICAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAg
ICB3cml0ZV9wdGUoZW50cnksIHB0ZSk7CkBAIC0xMDUyLDExICsxMDU1LDE0IEBAIHN0YXRpYyBp
bnQgY3JlYXRlX3hlbl9lbnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKICAgICAgICAg
ICAgICAgICBCVUcoKTsKICAgICAgICAgfQogICAgIH0KK291dDoKKyAgICAvKgorICAgICAqIEZs
dXNoIHRoZSBUTEJzIGV2ZW4gaW4gY2FzZSBvZiBmYWlsdXJlIGJlY2F1c2Ugd2UgbWF5IGhhdmUK
KyAgICAgKiBwYXJ0aWFsbHkgbW9kaWZpZWQgdGhlIFBULiBUaGlzIHdpbGwgcHJldmVudCBhbnkg
dW5leHBlY3RlZAorICAgICAqIGJlaGF2aW9yIGFmdGVyd2FyZHMuCisgICAgICovCiAgICAgZmx1
c2hfeGVuX3RsYl9yYW5nZV92YSh2aXJ0LCBQQUdFX1NJWkUgKiBucl9tZm5zKTsKIAotICAgIHJj
ID0gMDsKLQotb3V0OgogICAgIHJldHVybiByYzsKIH0KIAotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
