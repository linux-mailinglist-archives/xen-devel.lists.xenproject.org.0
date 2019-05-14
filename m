Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8D1C84B
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:14:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWHi-0006N0-11; Tue, 14 May 2019 12:11:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWHg-0006Lr-8Q
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:11:52 +0000
X-Inumbo-ID: 74a179be-7641-11e9-99f4-1f59df7d2d55
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 74a179be-7641-11e9-99f4-1f59df7d2d55;
 Tue, 14 May 2019 12:11:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B93415AD;
 Tue, 14 May 2019 05:11:51 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC6B13F71E;
 Tue, 14 May 2019 05:11:49 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:11:32 +0100
Message-Id: <20190514121132.26732-9-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514121132.26732-1-julien.grall@arm.com>
References: <20190514121132.26732-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART1 v3 8/8] xen/arm: mm: Flush the TLBs
 even if a mapping failed in create_xen_entries
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
c292QGVwYW0uY29tPgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gQWRkIEFuZHJp
aSdzIHJldmlld2VkLWJ5CiAgICAgICAgLSBBZGQgU3RlZmFubydzIHJldmlld2VkLWJ5Ci0tLQog
eGVuL2FyY2gvYXJtL21tLmMgfCAyMCArKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCA4ZWU4MjhkNDQ1Li45ZDU4NGU0
Y2JmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4vYXJjaC9hcm0vbW0u
YwpAQCAtOTg0LDcgKzk4NCw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl9lbnRyaWVzKGVudW0g
eGVubWFwX29wZXJhdGlvbiBvcCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgbnJfbWZucywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBmbGFncykKIHsKLSAgICBpbnQgcmM7CisgICAgaW50IHJjID0gMDsKICAgICB1bnNpZ25l
ZCBsb25nIGFkZHIgPSB2aXJ0LCBhZGRyX2VuZCA9IGFkZHIgKyBucl9tZm5zICogUEFHRV9TSVpF
OwogICAgIGxwYWVfdCBwdGUsICplbnRyeTsKICAgICBscGFlX3QgKnRoaXJkID0gTlVMTDsKQEAg
LTEwMTMsNyArMTAxMyw4IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl9lbnRyaWVzKGVudW0geGVu
bWFwX29wZXJhdGlvbiBvcCwKICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAg
IHByaW50aygiJXM6IHRyeWluZyB0byByZXBsYWNlIGFuIGV4aXN0aW5nIG1hcHBpbmcgYWRkcj0l
bHggbWZuPSUiUFJJX21mbiJcbiIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNf
XywgYWRkciwgbWZuX3gobWZuKSk7Ci0gICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
OworICAgICAgICAgICAgICAgICAgICByYyA9IC1FSU5WQUw7CisgICAgICAgICAgICAgICAgICAg
IGdvdG8gb3V0OwogICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICBpZiAoIG9wID09
IFJFU0VSVkUgKQogICAgICAgICAgICAgICAgICAgICBicmVhazsKQEAgLTEwMzAsNyArMTAzMSw4
IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl9lbnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBv
cCwKICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIHByaW50aygiJXM6IHRy
eWluZyB0byAlcyBhIG5vbi1leGlzdGluZyBtYXBwaW5nIGFkZHI9JWx4XG4iLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgX19mdW5jX18sIG9wID09IFJFTU9WRSA/ICJyZW1vdmUiIDogIm1v
ZGlmeSIsIGFkZHIpOwotICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICAg
ICAgICAgICAgICAgICAgcmMgPSAtRUlOVkFMOworICAgICAgICAgICAgICAgICAgICBnb3RvIG91
dDsKICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgaWYgKCBvcCA9PSBSRU1PVkUg
KQogICAgICAgICAgICAgICAgICAgICBwdGUuYml0cyA9IDA7CkBAIC0xMDQzLDcgKzEwNDUsOCBA
QCBzdGF0aWMgaW50IGNyZWF0ZV94ZW5fZW50cmllcyhlbnVtIHhlbm1hcF9vcGVyYXRpb24gb3As
CiAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgIHByaW50aygi
JXM6IEluY29ycmVjdCBjb21iaW5hdGlvbiBmb3IgYWRkcj0lbHhcbiIsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGFkZHIpOwotICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7CisgICAgICAgICAgICAgICAgICAgICAgICByYyA9IC1FSU5WQUw7
CisgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgICAgICAgICAgICAg
fQogICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICB3cml0ZV9wdGUoZW50cnksIHB0
ZSk7CkBAIC0xMDUyLDExICsxMDU1LDE0IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl9lbnRyaWVz
KGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKICAgICAgICAgICAgICAgICBCVUcoKTsKICAgICAg
ICAgfQogICAgIH0KK291dDoKKyAgICAvKgorICAgICAqIEZsdXNoIHRoZSBUTEJzIGV2ZW4gaW4g
Y2FzZSBvZiBmYWlsdXJlIGJlY2F1c2Ugd2UgbWF5IGhhdmUKKyAgICAgKiBwYXJ0aWFsbHkgbW9k
aWZpZWQgdGhlIFBULiBUaGlzIHdpbGwgcHJldmVudCBhbnkgdW5leHBlY3RlZAorICAgICAqIGJl
aGF2aW9yIGFmdGVyd2FyZHMuCisgICAgICovCiAgICAgZmx1c2hfeGVuX3RsYl9yYW5nZV92YSh2
aXJ0LCBQQUdFX1NJWkUgKiBucl9tZm5zKTsKIAotICAgIHJjID0gMDsKLQotb3V0OgogICAgIHJl
dHVybiByYzsKIH0KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
