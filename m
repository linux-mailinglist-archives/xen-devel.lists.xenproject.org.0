Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168221C8D0
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:34:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWau-0005O8-Je; Tue, 14 May 2019 12:31:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWat-0005NT-26
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:31:43 +0000
X-Inumbo-ID: 3a201512-7644-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3a201512-7644-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:31:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80C1315AB;
 Tue, 14 May 2019 05:31:41 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CF8D3F71E;
 Tue, 14 May 2019 05:31:40 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:31:20 +0100
Message-Id: <20190514123125.29086-8-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514123125.29086-1-julien.grall@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v2 07/12] xen/arm: mm: Rework
 xen_pt_update_entry to avoid use xenmap_operation
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

V2l0aCB0aGUgbmV3bHkgaW50cm9kdWNlZCBmbGFncywgaXQgaXMgbm93IHBvc3NpYmxlIHRvIGtu
b3cgaG93IHRoZSBwYWdlCndpbGwgYmUgdXBkYXRlZCB0aHJvdWdoIHRoZSBmbGFncy4KCkFsbCB0
aGUgdXNlIG9mIHhlbm1hcF9vcGVyYXRpb24gYXJlIG5vdyByZXBsYWNlZCB3aXRoIHRoZSBmbGFn
cy4gQXQgdGhlCnNhbWUgdGltZSwgdmFsaWRpdHkgY2hlY2sgYXJlIG5vdyByZW1vdmVkIGFzIHRo
ZXkgYXJlIGdhdGhlcmVkIGluCnhlbl9wdF9jaGVja19lbnRyeSgpLgoKU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLS0KCiAgICBDaGFuZ2VzIGluIHYyOgog
ICAgICAgIC0gRml4IHR5cG8gaW4gdGhlIGNvbW1pdCBtZXNzYWdlCiAgICAgICAgLSBBZGQgQW5k
cmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyB8IDQ3ICsrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjMg
aW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCA0NWE2ZjkyODdmLi44NmUxZmFlZWI1IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAt
MTA2NywzNCArMTA2NywzMyBAQCBzdGF0aWMgaW50IHhlbl9wdF91cGRhdGVfZW50cnkoZW51bSB4
ZW5tYXBfb3BlcmF0aW9uIG9wLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAgICAgaWYgKCAheGVuX3B0
X2NoZWNrX2VudHJ5KCplbnRyeSwgbWZuLCBmbGFncykgKQogICAgICAgICByZXR1cm4gLUVJTlZB
TDsKIAotICAgIHN3aXRjaCAoIG9wICkgewotICAgICAgICBjYXNlIElOU0VSVDoKLSAgICAgICAg
Y2FzZSBSRVNFUlZFOgotICAgICAgICAgICAgaWYgKCBvcCA9PSBSRVNFUlZFICkKLSAgICAgICAg
ICAgICAgICBicmVhazsKKyAgICAvKiBJZiB3ZSBhcmUgb25seSBwb3B1bGF0aW5nIHBhZ2UtdGFi
bGUsIHRoZW4gd2UgYXJlIGRvbmUuICovCisgICAgaWYgKCBmbGFncyAmIF9QQUdFX1BPUFVMQVRF
ICkKKyAgICAgICAgcmV0dXJuIDA7CisKKyAgICAvKiBXZSBhcmUgcmVtb3ZpbmcgdGhlIHBhZ2Ug
Ki8KKyAgICBpZiAoICEoZmxhZ3MgJiBfUEFHRV9QUkVTRU5UKSApCisgICAgICAgIG1lbXNldCgm
cHRlLCAweDAwLCBzaXplb2YocHRlKSk7CisgICAgZWxzZQorICAgIHsKKyAgICAgICAgLyogV2Ug
YXJlIGluc2VydGluZyBhIG1hcHBpbmcgPT4gQ3JlYXRlIG5ldyBwdGUuICovCisgICAgICAgIGlm
ICggIW1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCisgICAgICAgIHsKICAgICAgICAgICAgIHB0
ZSA9IG1mbl90b194ZW5fZW50cnkobWZuLCBQQUdFX0FJX01BU0soZmxhZ3MpKTsKLSAgICAgICAg
ICAgIHB0ZS5wdC5ybyA9IFBBR0VfUk9fTUFTSyhmbGFncyk7Ci0gICAgICAgICAgICBwdGUucHQu
eG4gPSBQQUdFX1hOX01BU0soZmxhZ3MpOwotICAgICAgICAgICAgQlVHX09OKCFwdGUucHQucm8g
JiYgIXB0ZS5wdC54bik7CisKKyAgICAgICAgICAgIC8qIFRoaXJkIGxldmVsIGVudHJpZXMgc2V0
IHB0ZS5wdC50YWJsZSA9IDEgKi8KICAgICAgICAgICAgIHB0ZS5wdC50YWJsZSA9IDE7Ci0gICAg
ICAgICAgICB3cml0ZV9wdGUoZW50cnksIHB0ZSk7Ci0gICAgICAgICAgICBicmVhazsKLSAgICAg
ICAgY2FzZSBNT0RJRlk6Ci0gICAgICAgIGNhc2UgUkVNT1ZFOgotICAgICAgICAgICAgaWYgKCBv
cCA9PSBSRU1PVkUgKQotICAgICAgICAgICAgICAgIHB0ZS5iaXRzID0gMDsKLSAgICAgICAgICAg
IGVsc2UKLSAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBwdGUgPSAqZW50cnk7Ci0gICAg
ICAgICAgICAgICAgcHRlLnB0LnJvID0gUEFHRV9ST19NQVNLKGZsYWdzKTsKLSAgICAgICAgICAg
ICAgICBwdGUucHQueG4gPSBQQUdFX1hOX01BU0soZmxhZ3MpOwotICAgICAgICAgICAgfQotICAg
ICAgICAgICAgd3JpdGVfcHRlKGVudHJ5LCBwdGUpOwotICAgICAgICAgICAgYnJlYWs7Ci0gICAg
ICAgIGRlZmF1bHQ6Ci0gICAgICAgICAgICBCVUcoKTsKKyAgICAgICAgfQorICAgICAgICBlbHNl
IC8qIFdlIGFyZSB1cGRhdGluZyB0aGUgcGVybWlzc2lvbiA9PiBDb3B5IHRoZSBjdXJyZW50IHB0
ZS4gKi8KKyAgICAgICAgICAgIHB0ZSA9ICplbnRyeTsKKworICAgICAgICAvKiBTZXQgcGVybWlz
c2lvbiAqLworICAgICAgICBwdGUucHQucm8gPSBQQUdFX1JPX01BU0soZmxhZ3MpOworICAgICAg
ICBwdGUucHQueG4gPSBQQUdFX1hOX01BU0soZmxhZ3MpOwogICAgIH0KIAorICAgIHdyaXRlX3B0
ZShlbnRyeSwgcHRlKTsKKwogICAgIHJldHVybiAwOwogfQogCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
