Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E5C1C8D6
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:34:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWaw-0005QF-1M; Tue, 14 May 2019 12:31:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWau-0005O9-Ca
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:31:44 +0000
X-Inumbo-ID: 3b0516d9-7644-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3b0516d9-7644-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:31:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F250415AD;
 Tue, 14 May 2019 05:31:42 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEE743F71E;
 Tue, 14 May 2019 05:31:41 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:31:21 +0100
Message-Id: <20190514123125.29086-9-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514123125.29086-1-julien.grall@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v2 08/12] xen/arm: mm: Remove enum
 xenmap_operation
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

VGhlIGVudW0geGVubWFwX29wZXJhdGlvbiBpcyBub3QgdXNlZCBhbnltb3JlLiBTbyByZW1vdmUg
aXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tLQog
ICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIEFkZCBBbmRyaWkncyByZXZpZXdlZC1ieQotLS0K
IHhlbi9hcmNoL2FybS9tbS5jIHwgMjQgKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmluZGV4IDg2ZTFmYWVlYjUuLjY1
MWUyOTYwNDEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hlbi9hcmNoL2Fy
bS9tbS5jCkBAIC05NzQsMTMgKzk3NCw2IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl90YWJsZShs
cGFlX3QgKmVudHJ5KQogICAgIHJldHVybiAwOwogfQogCi1lbnVtIHhlbm1hcF9vcGVyYXRpb24g
ewotICAgIElOU0VSVCwKLSAgICBSRU1PVkUsCi0gICAgTU9ESUZZLAotICAgIFJFU0VSVkUKLX07
Ci0KIC8qIFNhbml0eSBjaGVjayBvZiB0aGUgZW50cnkgKi8KIHN0YXRpYyBib29sIHhlbl9wdF9j
aGVja19lbnRyeShscGFlX3QgZW50cnksIG1mbl90IG1mbiwgdW5zaWduZWQgaW50IGZsYWdzKQog
ewpAQCAtMTA0MCw4ICsxMDMzLDggQEAgc3RhdGljIGJvb2wgeGVuX3B0X2NoZWNrX2VudHJ5KGxw
YWVfdCBlbnRyeSwgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiAgICAgcmV0dXJuIHRy
dWU7CiB9CiAKLXN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeShlbnVtIHhlbm1hcF9vcGVy
YXRpb24gb3AsIHVuc2lnbmVkIGxvbmcgYWRkciwKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtZm5fdCBtZm4sIHVuc2lnbmVkIGludCBmbGFncykKK3N0YXRpYyBpbnQgeGVuX3B0X3Vw
ZGF0ZV9lbnRyeSh1bnNpZ25lZCBsb25nIGFkZHIsIG1mbl90IG1mbiwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7CiAgICAgbHBhZV90IHB0ZSwg
KmVudHJ5OwogICAgIGxwYWVfdCAqdGhpcmQgPSBOVUxMOwpAQCAtMTA5OSw4ICsxMDkyLDcgQEAg
c3RhdGljIGludCB4ZW5fcHRfdXBkYXRlX2VudHJ5KGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwg
dW5zaWduZWQgbG9uZyBhZGRyLAogCiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKHhlbl9wdF9sb2Nr
KTsKIAotc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwK
LSAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHZpcnQsCitzdGF0aWMgaW50
IHhlbl9wdF91cGRhdGUodW5zaWduZWQgbG9uZyB2aXJ0LAogICAgICAgICAgICAgICAgICAgICAg
ICAgIG1mbl90IG1mbiwKICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5y
X21mbnMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzKQpAQCAt
MTEzMSw3ICsxMTIzLDcgQEAgc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlKGVudW0geGVubWFwX29w
ZXJhdGlvbiBvcCwKIAogICAgIGZvciggOyBhZGRyIDwgYWRkcl9lbmQ7IGFkZHIgKz0gUEFHRV9T
SVpFICkKICAgICB7Ci0gICAgICAgIHJjID0geGVuX3B0X3VwZGF0ZV9lbnRyeShvcCwgYWRkciwg
bWZuLCBmbGFncyk7CisgICAgICAgIHJjID0geGVuX3B0X3VwZGF0ZV9lbnRyeShhZGRyLCBtZm4s
IGZsYWdzKTsKICAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAgICBicmVhazsKIApAQCAtMTE1
NiwyNCArMTE0OCwyNCBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbih1bnNpZ25lZCBsb25nIHZpcnQs
CiAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5yX21mbnMsCiAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7Ci0gICAgcmV0dXJuIHhlbl9wdF91cGRh
dGUoSU5TRVJULCB2aXJ0LCBtZm4sIG5yX21mbnMsIGZsYWdzKTsKKyAgICByZXR1cm4geGVuX3B0
X3VwZGF0ZSh2aXJ0LCBtZm4sIG5yX21mbnMsIGZsYWdzKTsKIH0KIAogaW50IHBvcHVsYXRlX3B0
X3JhbmdlKHVuc2lnbmVkIGxvbmcgdmlydCwgdW5zaWduZWQgbG9uZyBucl9tZm5zKQogewotICAg
IHJldHVybiB4ZW5fcHRfdXBkYXRlKFJFU0VSVkUsIHZpcnQsIElOVkFMSURfTUZOLCBucl9tZm5z
LCBfUEFHRV9QT1BVTEFURSk7CisgICAgcmV0dXJuIHhlbl9wdF91cGRhdGUodmlydCwgSU5WQUxJ
RF9NRk4sIG5yX21mbnMsIF9QQUdFX1BPUFVMQVRFKTsKIH0KIAogaW50IGRlc3Ryb3lfeGVuX21h
cHBpbmdzKHVuc2lnbmVkIGxvbmcgdiwgdW5zaWduZWQgbG9uZyBlKQogewogICAgIEFTU0VSVCh2
IDw9IGUpOwotICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKFJFTU9WRSwgdiwgSU5WQUxJRF9NRk4s
IChlIC0gdikgPj4gUEFHRV9TSElGVCwgMCk7CisgICAgcmV0dXJuIHhlbl9wdF91cGRhdGUodiwg
SU5WQUxJRF9NRk4sIChlIC0gdikgPj4gUEFHRV9TSElGVCwgMCk7CiB9CiAKIGludCBtb2RpZnlf
eGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBp
bnQgZmxhZ3MpCiB7CiAgICAgQVNTRVJUKHMgPD0gZSk7Ci0gICAgcmV0dXJuIHhlbl9wdF91cGRh
dGUoTU9ESUZZLCBzLCBJTlZBTElEX01GTiwgKGUgLSBzKSA+PiBQQUdFX1NISUZULCBmbGFncyk7
CisgICAgcmV0dXJuIHhlbl9wdF91cGRhdGUocywgSU5WQUxJRF9NRk4sIChlIC0gcykgPj4gUEFH
RV9TSElGVCwgZmxhZ3MpOwogfQogCiBlbnVtIG1nIHsgbWdfY2xlYXIsIG1nX3JvLCBtZ19ydywg
bWdfcnggfTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
