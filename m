Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDFD3BCEF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:34:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ23-0007oP-Ir; Mon, 10 Jun 2019 19:32:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ21-0007mR-FR
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:37 +0000
X-Inumbo-ID: 8096a8d5-8bb6-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 8096a8d5-8bb6-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 19:32:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D316AC0A;
 Mon, 10 Jun 2019 12:32:36 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB3913F73C;
 Mon, 10 Jun 2019 12:32:35 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:32:13 +0100
Message-Id: <20190610193215.23704-16-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 15/17] xen/arm64: head: Rework and document
 setup_fixmap()
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
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCwgdGhlIGZpeG1hcCB0YWJsZSBpcyBvbmx5IGhvb2tlZCB3aGVuIGVhcmx5
cHJpbnRrIGlzIHVzZWQuClRoaXMgaXMgZmluZSB0b2RheSBiZWNhdXNlIGluIEMgbGFuZCwgdGhl
IGZpeG1hcCBpcyBub3QgdXNlZCBieSBhbnlvbmUKdW50aWwgdGhlIHRoZSBib290IENQVSBpcyBz
d2l0Y2hpbmcgdG8gdGhlIHJ1bnRpbWUgcGFnZS10YWJsZXMuCgpJbiB0aGUgZnV0dXJlLCB0aGUg
Ym9vdCBDUFUgd2lsbCBub3Qgc3dpdGNoIGJldHdlZW4gcGFnZS10YWJsZXMgdG8gYXZvaWQKVExC
IGNvbmZsaWN0LiBUaGlzIG1lYW5zIHRoZSBmaXhtYXAgdGFibGUgd2lsbCBuZWVkIHRvIGJlIGhv
b2tlZCBiZWZvcmUKYW55IHVzZS4gRm9yIHNpbXBsaWNpdHksIHNldHVwX2ZpeG1hcCgpIHdpbGwg
bm93IGRvIHRoYXQgam9iLgoKTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBt
YWluIHJlZ2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlCmZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vYXJt
NjQvaGVhZC5TIHwgMTMgKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggOTZlODVmODgzNC4uNGY3ZmE2
NzY5ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUworKysgYi94ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TCkBAIC03MDAsOCArNzAwLDE3IEBAIGlkX21hcF9yZW1vdmVkOgog
ICAgICAgICByZXQKIEVORFBST0MocmVtb3ZlX2lkX21hcCkKIAorLyoKKyAqIE1hcCB0aGUgVUFS
VCBpbiB0aGUgZml4bWFwICh3aGVuIGVhcmx5cHJpbnRrIGlzIHVzZWQpIGFuZCBob29rIHRoZQor
ICogZml4bWFwIHRhYmxlIGluIHRoZSBwYWdlIHRhYmxlcy4KKyAqCisgKiBUaGUgZml4bWFwIGNh
bm5vdCBiZSBtYXBwZWQgaW4gY3JlYXRlX3BhZ2VfdGFibGVzIGJlY2F1c2UgaXQgbWF5CisgKiBj
bGFzaCB3aXRoIHRoZSBJRCBtYXAuCisgKgorICogQ2xvYmJlcnMgeDAgLSB4MQorICovCiBzZXR1
cF9maXhtYXA6Ci0jaWYgZGVmaW5lZChDT05GSUdfRUFSTFlfUFJJTlRLKSAvKiBGaXhtYXAgaXMg
b25seSB1c2VkIGJ5IGVhcmx5IHByaW50ayAqLworI2lmZGVmIENPTkZJR19FQVJMWV9QUklOVEsK
ICAgICAgICAgLyogQWRkIFVBUlQgdG8gdGhlIGZpeG1hcCB0YWJsZSAqLwogICAgICAgICBsZHIg
ICB4MSwgPXhlbl9maXhtYXAgICAgICAgIC8qIHgxIDo9IHZhZGRyICh4ZW5fZml4bWFwKSAqLwog
ICAgICAgICBsc3IgICB4MiwgeDIzLCAjVEhJUkRfU0hJRlQKQEAgLTcwOSw2ICs3MTgsNyBAQCBz
ZXR1cF9maXhtYXA6CiAgICAgICAgIG1vdiAgIHgzLCAjUFRfREVWX0wzCiAgICAgICAgIG9yciAg
IHgyLCB4MiwgeDMgICAgICAgICAgICAgLyogeDIgOj0gNEsgZGV2IG1hcCBpbmNsdWRpbmcgVUFS
VCAqLwogICAgICAgICBzdHIgICB4MiwgW3gxLCAjKEZJWE1BUF9DT05TT0xFKjgpXSAvKiBNYXAg
aXQgaW4gdGhlIGZpcnN0IGZpeG1hcCdzIHNsb3QgKi8KKyNlbmRpZgogCiAgICAgICAgIC8qIE1h
cCBmaXhtYXAgaW50byBib290X3NlY29uZCAqLwogICAgICAgICBsZHIgICB4NCwgPWJvb3Rfc2Vj
b25kICAgICAgIC8qIHg0IDo9IHZhZGRyIChib290X3NlY29uZCkgKi8KQEAgLTcyMSw3ICs3MzEs
NiBAQCBzZXR1cF9maXhtYXA6CiAKICAgICAgICAgLyogRW5zdXJlIGFueSBwYWdlIHRhYmxlIHVw
ZGF0ZXMgbWFkZSBhYm92ZSBoYXZlIG9jY3VycmVkICovCiAgICAgICAgIGRzYiAgIG5zaHN0Ci0j
ZW5kaWYKICAgICAgICAgcmV0CiBFTkRQUk9DKHNldHVwX2ZpeG1hcCkKIAotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
