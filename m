Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8B11C8DF
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:35:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWaw-0005Qu-Dp; Tue, 14 May 2019 12:31:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWav-0005Q2-GG
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:31:45 +0000
X-Inumbo-ID: 3be35306-7644-11e9-9745-a782c9656c67
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3be35306-7644-11e9-9745-a782c9656c67;
 Tue, 14 May 2019 12:31:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70476341;
 Tue, 14 May 2019 05:31:44 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C40F3F71E;
 Tue, 14 May 2019 05:31:43 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:31:22 +0100
Message-Id: <20190514123125.29086-10-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514123125.29086-1-julien.grall@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v2 09/12] xen/arm: mm: Use {,
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
dCBjYW4gb25seSB3b3JrIG9uIHhlbmhlYXAgcGFnZS4gV2hpbGUgaW4gcHJhY3RpY2UKYWxsIHRo
ZSBwYWdlLXRhYmxlcyB1cGRhdGVkIHdpbGwgcmVzaWRlIGluIHhlbmhlYXAsIGluIHByYWN0aXZl
IHRoZQpwYWdlLXRhYmxlcyBjb3ZlcmluZyBYZW4gbWVtb3J5IChlLmcgeGVuX21hcHBpbmcpIGlz
IHBhcnQgb2YgWGVuIGJpbmFyeS4KCkZ1cnRoZXJtb3JlLCBhIGZvbGxvdy11cCBjaGFuZ2Ugd2ls
bCB1cGRhdGUgeGVuX3B0X3VwZGF0ZV9lbnRyeSgpIHRvCndhbGsgYWxsIHRoZSBsZXZlbHMgYW5k
IHRoZXJlZm9yZSBiZSBtb3JlIGdlbmVyaWMuIFNvbWUgb2YgdGhlCnBhZ2UtdGFibGVzIHdpbGwg
YWxzbyBwYXJ0IG9mIFhlbiBtZW1vcnkgYW5kIHRoZXJlZm9yZSB3aWxsIG5vdCBiZQpyZWFjaGFi
bGUgdXNpbmcgbWZuX3RvX3ZpcnQoKS4KClRoZSBlYXNpZXN0IHdheSB0byByZWFjaCB0aG9zZSBw
YWdlcyBpcyB0byB1c2UgeywgdW59bWFwX2RvbWFpbl9wYWdlKCkuCldoaWxlIG9uIGFybTMyIHRo
aXMgbWVhbnMgYW4gZXh0cmEgbWFwcGluZyBpbiB0aGUgbm9ybWFsIGNhc2VzLCB0aGlzIGlzIG5v
dAp2ZXJ5IGltcG9ydGFudCBhcyB4ZW4gcGFnZS10YWJsZXMgYXJlIG5vdCB1cGRhdGVkIG9mdGVu
LgoKSW4gb3JkZXIgdG8gYWxsb3cgZnV0dXJlIGNoYW5nZSBpbiB0aGUgd2F5IFhlbiBwYWdlLXRh
YmxlcyBhcmUgbWFwcGVkLAp0d28gbmV3IGhlbHBlcnMgYXJlIGludHJvZHVjZWQgdG8gbWFwL3Vu
bWFwIHRoZSBwYWdlLXRhYmxlcy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292
QGVwYW0uY29tPgoKLS0tCgogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIEFkZCBBbmRyaWkn
cyByZXZpZXdlZC1ieQotLS0KIHhlbi9hcmNoL2FybS9tbS5jIHwgMjYgKysrKysrKysrKysrKysr
KysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMK
aW5kZXggNjUxZTI5NjA0MS4uZjU5NzlmNTQ5YiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL21t
LmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTk3NCw2ICs5NzQsMTYgQEAgc3RhdGljIGlu
dCBjcmVhdGVfeGVuX3RhYmxlKGxwYWVfdCAqZW50cnkpCiAgICAgcmV0dXJuIDA7CiB9CiAKK3N0
YXRpYyBscGFlX3QgKnhlbl9tYXBfdGFibGUobWZuX3QgbWZuKQoreworICAgIHJldHVybiBtYXBf
ZG9tYWluX3BhZ2UobWZuKTsKK30KKworc3RhdGljIHZvaWQgeGVuX3VubWFwX3RhYmxlKGNvbnN0
IGxwYWVfdCAqdGFibGUpCit7CisgICAgdW5tYXBfZG9tYWluX3BhZ2UodGFibGUpOworfQorCiAv
KiBTYW5pdHkgY2hlY2sgb2YgdGhlIGVudHJ5ICovCiBzdGF0aWMgYm9vbCB4ZW5fcHRfY2hlY2tf
ZW50cnkobHBhZV90IGVudHJ5LCBtZm5fdCBtZm4sIHVuc2lnbmVkIGludCBmbGFncykKIHsKQEAg
LTEwMzYsNiArMTA0Niw3IEBAIHN0YXRpYyBib29sIHhlbl9wdF9jaGVja19lbnRyeShscGFlX3Qg
ZW50cnksIG1mbl90IG1mbiwgdW5zaWduZWQgaW50IGZsYWdzKQogc3RhdGljIGludCB4ZW5fcHRf
dXBkYXRlX2VudHJ5KHVuc2lnbmVkIGxvbmcgYWRkciwgbWZuX3QgbWZuLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykKIHsKKyAgICBpbnQgcmM7CiAg
ICAgbHBhZV90IHB0ZSwgKmVudHJ5OwogICAgIGxwYWVfdCAqdGhpcmQgPSBOVUxMOwogCkBAIC0x
MDU0LDE1ICsxMDY1LDE3IEBAIHN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeSh1bnNpZ25l
ZCBsb25nIGFkZHIsIG1mbl90IG1mbiwKIAogICAgIEJVR19PTighbHBhZV9pc192YWxpZCgqZW50
cnkpKTsKIAotICAgIHRoaXJkID0gbWZuX3RvX3ZpcnQobHBhZV9nZXRfbWZuKCplbnRyeSkpOwor
ICAgIHRoaXJkID0geGVuX21hcF90YWJsZShscGFlX2dldF9tZm4oKmVudHJ5KSk7CiAgICAgZW50
cnkgPSAmdGhpcmRbdGhpcmRfdGFibGVfb2Zmc2V0KGFkZHIpXTsKIAorICAgIHJjID0gLUVJTlZB
TDsKICAgICBpZiAoICF4ZW5fcHRfY2hlY2tfZW50cnkoKmVudHJ5LCBtZm4sIGZsYWdzKSApCi0g
ICAgICAgIHJldHVybiAtRUlOVkFMOworICAgICAgICBnb3RvIG91dDsKIAogICAgIC8qIElmIHdl
IGFyZSBvbmx5IHBvcHVsYXRpbmcgcGFnZS10YWJsZSwgdGhlbiB3ZSBhcmUgZG9uZS4gKi8KKyAg
ICByYyA9IDA7CiAgICAgaWYgKCBmbGFncyAmIF9QQUdFX1BPUFVMQVRFICkKLSAgICAgICAgcmV0
dXJuIDA7CisgICAgICAgIGdvdG8gb3V0OwogCiAgICAgLyogV2UgYXJlIHJlbW92aW5nIHRoZSBw
YWdlICovCiAgICAgaWYgKCAhKGZsYWdzICYgX1BBR0VfUFJFU0VOVCkgKQpAQCAtMTA4Nyw3ICsx
MTAwLDEyIEBAIHN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeSh1bnNpZ25lZCBsb25nIGFk
ZHIsIG1mbl90IG1mbiwKIAogICAgIHdyaXRlX3B0ZShlbnRyeSwgcHRlKTsKIAotICAgIHJldHVy
biAwOworICAgIHJjID0gMDsKKworb3V0OgorICAgIHhlbl91bm1hcF90YWJsZSh0aGlyZCk7CisK
KyAgICByZXR1cm4gcmM7CiB9CiAKIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0soeGVuX3B0X2xvY2sp
OwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
