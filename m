Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A8A46663
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 19:54:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbqMq-0001oo-8s; Fri, 14 Jun 2019 17:52:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbqMo-0001nG-6z
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 17:51:58 +0000
X-Inumbo-ID: 19fa9a05-8ecd-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 19fa9a05-8ecd-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 17:51:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92969367;
 Fri, 14 Jun 2019 10:51:56 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA3023F718;
 Fri, 14 Jun 2019 10:51:55 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 14 Jun 2019 18:51:39 +0100
Message-Id: <20190614175144.20046-5-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190614175144.20046-1-julien.grall@arm.com>
References: <20190614175144.20046-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v3 4/9] xen/arm: mm: Rework
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
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgotLS0KICAgIENoYW5nZXMgaW4gdjM6CiAg
ICAgICAgLSBBZGQgU3RlZmFubydzIHJldmlld2VkLWJ5CgogICAgQ2hhbmdlcyBpbiB2MjoKICAg
ICAgICAtIEZpeCB0eXBvIGluIHRoZSBjb21taXQgbWVzc2FnZQogICAgICAgIC0gQWRkIEFuZHJp
aSdzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCA0NyArKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIzIGlu
c2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9t
bS5jIGIveGVuL2FyY2gvYXJtL21tLmMKaW5kZXggZGNmMDQxNTc4Yi4uYjJiOGJkM2RjNiAxMDA2
NDQKLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTEw
NDcsMzQgKzEwNDcsMzMgQEAgc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlX2VudHJ5KGVudW0geGVu
bWFwX29wZXJhdGlvbiBvcCwgdW5zaWduZWQgbG9uZyBhZGRyLAogICAgIGlmICggIXhlbl9wdF9j
aGVja19lbnRyeSgqZW50cnksIG1mbiwgZmxhZ3MpICkKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
CiAKLSAgICBzd2l0Y2ggKCBvcCApIHsKLSAgICAgICAgY2FzZSBJTlNFUlQ6Ci0gICAgICAgIGNh
c2UgUkVTRVJWRToKLSAgICAgICAgICAgIGlmICggb3AgPT0gUkVTRVJWRSApCi0gICAgICAgICAg
ICAgICAgYnJlYWs7CisgICAgLyogSWYgd2UgYXJlIG9ubHkgcG9wdWxhdGluZyBwYWdlLXRhYmxl
LCB0aGVuIHdlIGFyZSBkb25lLiAqLworICAgIGlmICggZmxhZ3MgJiBfUEFHRV9QT1BVTEFURSAp
CisgICAgICAgIHJldHVybiAwOworCisgICAgLyogV2UgYXJlIHJlbW92aW5nIHRoZSBwYWdlICov
CisgICAgaWYgKCAhKGZsYWdzICYgX1BBR0VfUFJFU0VOVCkgKQorICAgICAgICBtZW1zZXQoJnB0
ZSwgMHgwMCwgc2l6ZW9mKHB0ZSkpOworICAgIGVsc2UKKyAgICB7CisgICAgICAgIC8qIFdlIGFy
ZSBpbnNlcnRpbmcgYSBtYXBwaW5nID0+IENyZWF0ZSBuZXcgcHRlLiAqLworICAgICAgICBpZiAo
ICFtZm5fZXEobWZuLCBJTlZBTElEX01GTikgKQorICAgICAgICB7CiAgICAgICAgICAgICBwdGUg
PSBtZm5fdG9feGVuX2VudHJ5KG1mbiwgUEFHRV9BSV9NQVNLKGZsYWdzKSk7Ci0gICAgICAgICAg
ICBwdGUucHQucm8gPSBQQUdFX1JPX01BU0soZmxhZ3MpOwotICAgICAgICAgICAgcHRlLnB0Lnhu
ID0gUEFHRV9YTl9NQVNLKGZsYWdzKTsKLSAgICAgICAgICAgIEJVR19PTighcHRlLnB0LnJvICYm
ICFwdGUucHQueG4pOworCisgICAgICAgICAgICAvKiBUaGlyZCBsZXZlbCBlbnRyaWVzIHNldCBw
dGUucHQudGFibGUgPSAxICovCiAgICAgICAgICAgICBwdGUucHQudGFibGUgPSAxOwotICAgICAg
ICAgICAgd3JpdGVfcHRlKGVudHJ5LCBwdGUpOwotICAgICAgICAgICAgYnJlYWs7Ci0gICAgICAg
IGNhc2UgTU9ESUZZOgotICAgICAgICBjYXNlIFJFTU9WRToKLSAgICAgICAgICAgIGlmICggb3Ag
PT0gUkVNT1ZFICkKLSAgICAgICAgICAgICAgICBwdGUuYml0cyA9IDA7Ci0gICAgICAgICAgICBl
bHNlCi0gICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgcHRlID0gKmVudHJ5OwotICAgICAg
ICAgICAgICAgIHB0ZS5wdC5ybyA9IFBBR0VfUk9fTUFTSyhmbGFncyk7Ci0gICAgICAgICAgICAg
ICAgcHRlLnB0LnhuID0gUEFHRV9YTl9NQVNLKGZsYWdzKTsKLSAgICAgICAgICAgIH0KLSAgICAg
ICAgICAgIHdyaXRlX3B0ZShlbnRyeSwgcHRlKTsKLSAgICAgICAgICAgIGJyZWFrOwotICAgICAg
ICBkZWZhdWx0OgotICAgICAgICAgICAgQlVHKCk7CisgICAgICAgIH0KKyAgICAgICAgZWxzZSAv
KiBXZSBhcmUgdXBkYXRpbmcgdGhlIHBlcm1pc3Npb24gPT4gQ29weSB0aGUgY3VycmVudCBwdGUu
ICovCisgICAgICAgICAgICBwdGUgPSAqZW50cnk7CisKKyAgICAgICAgLyogU2V0IHBlcm1pc3Np
b24gKi8KKyAgICAgICAgcHRlLnB0LnJvID0gUEFHRV9ST19NQVNLKGZsYWdzKTsKKyAgICAgICAg
cHRlLnB0LnhuID0gUEFHRV9YTl9NQVNLKGZsYWdzKTsKICAgICB9CiAKKyAgICB3cml0ZV9wdGUo
ZW50cnksIHB0ZSk7CisKICAgICByZXR1cm4gMDsKIH0KIAotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
