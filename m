Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36671C8D2
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:34:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWam-0005LE-OD; Tue, 14 May 2019 12:31:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWal-0005L9-P6
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:31:35 +0000
X-Inumbo-ID: 35d8d544-7644-11e9-bbf8-af7ffef685ad
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 35d8d544-7644-11e9-bbf8-af7ffef685ad;
 Tue, 14 May 2019 12:31:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 318DC15AD;
 Tue, 14 May 2019 05:31:34 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F25383F71E;
 Tue, 14 May 2019 05:31:32 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:31:15 +0100
Message-Id: <20190514123125.29086-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514123125.29086-1-julien.grall@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v2 02/12] xen/arm: mm: Rename
 create_xen_entries() to xen_pt_update()
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

Y3JlYXRlX3hlbl9lbnRyaWVzKCkgaXMgZG9pbmcgbW9yZSB0aGFuIGNyZWF0aW5nIGVudHJpZXMu
IEl0IGNhbiBhbHNvCm1vZGlmeSBhbmQgcmVtb3ZlIGVudHJpZXMuCgpSZW5hbWUgdGhlIGZ1bmN0
aW9uIHRvIG1ha2UgY2xlYXIgd2hhdCB0aGUgZnVuY3Rpb24gaXMgYWN0dWFsbHkgZG9pbmcuCgpT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdl
ZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tLQogICAgQ2hh
bmdlcyBpbiB2MjoKICAgICAgICAtIEFkZCBBbmRyaWkncyByZXZpZXdlZC1ieQotLS0KIHhlbi9h
cmNoL2FybS9tbS5jIHwgMTkgKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCBiNDA4ZGU3Yzc1Li4zNmUyMmZjOWFkIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAt
OTcwLDExICs5NzAsMTEgQEAgZW51bSB4ZW5tYXBfb3BlcmF0aW9uIHsKIAogc3RhdGljIERFRklO
RV9TUElOTE9DSyh4ZW5fcHRfbG9jayk7CiAKLXN0YXRpYyBpbnQgY3JlYXRlX3hlbl9lbnRyaWVz
KGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgdmlydCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mbl90
IG1mbiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfbWZu
cywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykKK3N0
YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZShlbnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB2aXJ0LAorICAgICAgICAgICAgICAgICAg
ICAgICAgIG1mbl90IG1mbiwKKyAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IG5yX21mbnMsCisgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzKQog
ewogICAgIGludCByYyA9IDA7CiAgICAgdW5zaWduZWQgbG9uZyBhZGRyID0gdmlydCwgYWRkcl9l
bmQgPSBhZGRyICsgbnJfbWZucyAqIFBBR0VfU0laRTsKQEAgLTEwNjcsMjUgKzEwNjcsMjQgQEAg
aW50IG1hcF9wYWdlc190b194ZW4odW5zaWduZWQgbG9uZyB2aXJ0LAogICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBucl9tZm5zLAogICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGZsYWdzKQogewotICAgIHJldHVybiBjcmVhdGVfeGVuX2VudHJpZXMoSU5TRVJULCB2
aXJ0LCBtZm4sIG5yX21mbnMsIGZsYWdzKTsKKyAgICByZXR1cm4geGVuX3B0X3VwZGF0ZShJTlNF
UlQsIHZpcnQsIG1mbiwgbnJfbWZucywgZmxhZ3MpOwogfQogCiBpbnQgcG9wdWxhdGVfcHRfcmFu
Z2UodW5zaWduZWQgbG9uZyB2aXJ0LCB1bnNpZ25lZCBsb25nIG5yX21mbnMpCiB7Ci0gICAgcmV0
dXJuIGNyZWF0ZV94ZW5fZW50cmllcyhSRVNFUlZFLCB2aXJ0LCBJTlZBTElEX01GTiwgbnJfbWZu
cywgMCk7CisgICAgcmV0dXJuIHhlbl9wdF91cGRhdGUoUkVTRVJWRSwgdmlydCwgSU5WQUxJRF9N
Rk4sIG5yX21mbnMsIDApOwogfQogCiBpbnQgZGVzdHJveV94ZW5fbWFwcGluZ3ModW5zaWduZWQg
bG9uZyB2LCB1bnNpZ25lZCBsb25nIGUpCiB7CiAgICAgQVNTRVJUKHYgPD0gZSk7Ci0gICAgcmV0
dXJuIGNyZWF0ZV94ZW5fZW50cmllcyhSRU1PVkUsIHYsIElOVkFMSURfTUZOLCAoZSAtIHYpID4+
IFBBR0VfU0hJRlQsIDApOworICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKFJFTU9WRSwgdiwgSU5W
QUxJRF9NRk4sIChlIC0gdikgPj4gUEFHRV9TSElGVCwgMCk7CiB9CiAKIGludCBtb2RpZnlfeGVu
X21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQg
ZmxhZ3MpCiB7CiAgICAgQVNTRVJUKHMgPD0gZSk7Ci0gICAgcmV0dXJuIGNyZWF0ZV94ZW5fZW50
cmllcyhNT0RJRlksIHMsIElOVkFMSURfTUZOLCAoZSAtIHMpID4+IFBBR0VfU0hJRlQsCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFncyk7CisgICAgcmV0dXJuIHhlbl9wdF91cGRh
dGUoTU9ESUZZLCBzLCBJTlZBTElEX01GTiwgKGUgLSBzKSA+PiBQQUdFX1NISUZULCBmbGFncyk7
CiB9CiAKIGVudW0gbWcgeyBtZ19jbGVhciwgbWdfcm8sIG1nX3J3LCBtZ19yeCB9OwotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
