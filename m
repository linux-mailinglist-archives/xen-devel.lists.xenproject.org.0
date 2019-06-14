Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E14666A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 19:55:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbqMs-0001ps-8d; Fri, 14 Jun 2019 17:52:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbqMp-0001ob-Oj
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 17:51:59 +0000
X-Inumbo-ID: 1b4d369a-8ecd-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1b4d369a-8ecd-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 17:51:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC1D0346;
 Fri, 14 Jun 2019 10:51:58 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E41BF3F718;
 Fri, 14 Jun 2019 10:51:57 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 14 Jun 2019 18:51:41 +0100
Message-Id: <20190614175144.20046-7-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190614175144.20046-1-julien.grall@arm.com>
References: <20190614175144.20046-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v3 6/9] xen/arm: mm: Use {,
 un}map_domain_page() to map/unmap Xen page-tables
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

Q3VycmVudGx5LCB0aGUgdmlydHVhbCBhZGRyZXNzIG9mIHRoZSAzcmQgbGV2ZWwgcGFnZS10YWJs
ZXMgaXMgb2J0YWluZWQKdXNpbmcgbWZuX3RvX3ZpcnQoKS4KCk9uIEFybTMyLCBtZm5fdG9fdmly
dCBjYW4gb25seSB3b3JrIG9uIHhlbmhlYXAgcGFnZS4gV2hpbGUgaW4gdGhlb3J5CmFsbCB0aGUg
cGFnZS10YWJsZXMgdXBkYXRlZCB3aWxsIHJlc2lkZSBpbiB4ZW5oZWFwLCBpbiBwcmFjdGljZSB0
aGUKcGFnZS10YWJsZXMgY292ZXJpbmcgWGVuIG1lbW9yeSAoZS5nIHhlbl9tYXBwaW5nKSBpcyBw
YXJ0IG9mIFhlbiBiaW5hcnkuCgpGdXJ0aGVybW9yZSwgYSBmb2xsb3ctdXAgY2hhbmdlIHdpbGwg
dXBkYXRlIHhlbl9wdF91cGRhdGVfZW50cnkoKSB0bwp3YWxrIGFsbCB0aGUgbGV2ZWxzIGFuZCB0
aGVyZWZvcmUgYmUgbW9yZSBnZW5lcmljLiBTb21lIG9mIHRoZQpwYWdlLXRhYmxlcyB3aWxsIGFs
c28gcGFydCBvZiBYZW4gbWVtb3J5IGFuZCB0aGVyZWZvcmUgd2lsbCBub3QgYmUKcmVhY2hhYmxl
IHVzaW5nIG1mbl90b192aXJ0KCkuCgpUaGUgZWFzaWVzdCB3YXkgdG8gcmVhY2ggdGhvc2UgcGFn
ZXMgaXMgdG8gdXNlIHssIHVufW1hcF9kb21haW5fcGFnZSgpLgpXaGlsZSBvbiBhcm0zMiB0aGlz
IG1lYW5zIGFuIGV4dHJhIG1hcHBpbmcgaW4gdGhlIG5vcm1hbCBjYXNlcywgdGhpcyBpcyBub3QK
dmVyeSBpbXBvcnRhbnQgYXMgeGVuIHBhZ2UtdGFibGVzIGFyZSBub3QgdXBkYXRlZCBvZnRlbi4K
CkluIG9yZGVyIHRvIGFsbG93IGZ1dHVyZSBjaGFuZ2UgaW4gdGhlIHdheSBYZW4gcGFnZS10YWJs
ZXMgYXJlIG1hcHBlZCwKdHdvIG5ldyBoZWxwZXJzIGFyZSBpbnRyb2R1Y2VkIHRvIG1hcC91bm1h
cCB0aGUgcGFnZS10YWJsZXMuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBl
cGFtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIEZpeCB0eXBvIGluIHRo
ZSBjb21taXQgbWVzc2FnZQogICAgICAgIC0gQWRkIFN0ZWZhbm8ncyBhY2tlZC1ieQoKICAgIENo
YW5nZXMgaW4gdjI6CiAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4v
YXJjaC9hcm0vbW0uYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmluZGV4IDNmNmQwZTI5ZDUuLmMzZGQy
YzA4YmEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hlbi9hcmNoL2FybS9t
bS5jCkBAIC05NDcsNiArOTQ3LDE2IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl90YWJsZShscGFl
X3QgKmVudHJ5KQogICAgIHJldHVybiAwOwogfQogCitzdGF0aWMgbHBhZV90ICp4ZW5fbWFwX3Rh
YmxlKG1mbl90IG1mbikKK3sKKyAgICByZXR1cm4gbWFwX2RvbWFpbl9wYWdlKG1mbik7Cit9CisK
K3N0YXRpYyB2b2lkIHhlbl91bm1hcF90YWJsZShjb25zdCBscGFlX3QgKnRhYmxlKQoreworICAg
IHVubWFwX2RvbWFpbl9wYWdlKHRhYmxlKTsKK30KKwogLyogU2FuaXR5IGNoZWNrIG9mIHRoZSBl
bnRyeSAqLwogc3RhdGljIGJvb2wgeGVuX3B0X2NoZWNrX2VudHJ5KGxwYWVfdCBlbnRyeSwgbWZu
X3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7CkBAIC0xMDE2LDYgKzEwMjYsNyBAQCBzdGF0
aWMgYm9vbCB4ZW5fcHRfY2hlY2tfZW50cnkobHBhZV90IGVudHJ5LCBtZm5fdCBtZm4sIHVuc2ln
bmVkIGludCBmbGFncykKIHN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeSh1bnNpZ25lZCBs
b25nIGFkZHIsIG1mbl90IG1mbiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgZmxhZ3MpCiB7CisgICAgaW50IHJjOwogICAgIGxwYWVfdCBwdGUsICplbnRyeTsK
ICAgICBscGFlX3QgKnRoaXJkID0gTlVMTDsKIApAQCAtMTAzNCwxNSArMTA0NSwxNyBAQCBzdGF0
aWMgaW50IHhlbl9wdF91cGRhdGVfZW50cnkodW5zaWduZWQgbG9uZyBhZGRyLCBtZm5fdCBtZm4s
CiAKICAgICBCVUdfT04oIWxwYWVfaXNfdmFsaWQoKmVudHJ5KSk7CiAKLSAgICB0aGlyZCA9IG1m
bl90b192aXJ0KGxwYWVfZ2V0X21mbigqZW50cnkpKTsKKyAgICB0aGlyZCA9IHhlbl9tYXBfdGFi
bGUobHBhZV9nZXRfbWZuKCplbnRyeSkpOwogICAgIGVudHJ5ID0gJnRoaXJkW3RoaXJkX3RhYmxl
X29mZnNldChhZGRyKV07CiAKKyAgICByYyA9IC1FSU5WQUw7CiAgICAgaWYgKCAheGVuX3B0X2No
ZWNrX2VudHJ5KCplbnRyeSwgbWZuLCBmbGFncykgKQotICAgICAgICByZXR1cm4gLUVJTlZBTDsK
KyAgICAgICAgZ290byBvdXQ7CiAKICAgICAvKiBJZiB3ZSBhcmUgb25seSBwb3B1bGF0aW5nIHBh
Z2UtdGFibGUsIHRoZW4gd2UgYXJlIGRvbmUuICovCisgICAgcmMgPSAwOwogICAgIGlmICggZmxh
Z3MgJiBfUEFHRV9QT1BVTEFURSApCi0gICAgICAgIHJldHVybiAwOworICAgICAgICBnb3RvIG91
dDsKIAogICAgIC8qIFdlIGFyZSByZW1vdmluZyB0aGUgcGFnZSAqLwogICAgIGlmICggIShmbGFn
cyAmIF9QQUdFX1BSRVNFTlQpICkKQEAgLTEwNjcsNyArMTA4MCwxMiBAQCBzdGF0aWMgaW50IHhl
bl9wdF91cGRhdGVfZW50cnkodW5zaWduZWQgbG9uZyBhZGRyLCBtZm5fdCBtZm4sCiAKICAgICB3
cml0ZV9wdGUoZW50cnksIHB0ZSk7CiAKLSAgICByZXR1cm4gMDsKKyAgICByYyA9IDA7CisKK291
dDoKKyAgICB4ZW5fdW5tYXBfdGFibGUodGhpcmQpOworCisgICAgcmV0dXJuIHJjOwogfQogCiBz
dGF0aWMgREVGSU5FX1NQSU5MT0NLKHhlbl9wdF9sb2NrKTsKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
