Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7CD8A497
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 19:33:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxE9c-0006py-VT; Mon, 12 Aug 2019 17:30:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxE9b-0006oW-8g
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:30:43 +0000
X-Inumbo-ID: e88a2bd5-bd26-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e88a2bd5-bd26-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 17:30:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC16C19BF;
 Mon, 12 Aug 2019 10:30:41 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1655B3F706;
 Mon, 12 Aug 2019 10:30:40 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:30:07 +0100
Message-Id: <20190812173019.11956-17-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 16/28] xen/arm32: head: Document
 create_pages_tables()
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

RG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFuZCB0aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGlu
IHRoZSBmdW5jdGlvbi4KTm90ZSB0aGF0IHI2IGlzIG5vdyBvbmx5IHVzZWQgd2l0aGluIHRoZSBm
dW5jdGlvbiwgc28gaXQgZG9lcyBub3QgbmVlZAp0byBiZSBwYXJ0IG9mIHRoZSBjb21tb24gcmVn
aXN0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoK
LS0tCiAgICBDaGFuZ2VzIGluIHYzOgogICAgICAgIC0gQWRkIFN0ZWZhbm8ncyBhY2tlZC1ieQoK
ICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9hcmNoL2Fy
bS9hcm0zMi9oZWFkLlMgfCAzMCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwpp
bmRleCAxMTg5ZWQ2YzQ3Li44M2Y4Nzc0ZTJhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJt
MzIvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKQEAgLTUzLDcgKzUzLDcg
QEAKICAqICAgcjMgIC0KICAqICAgcjQgIC0KICAqICAgcjUgIC0KLSAqICAgcjYgIC0gaWRlbnRp
dHkgbWFwIGluIHBsYWNlCisgKiAgIHI2ICAtCiAgKiAgIHI3ICAtCiAgKiAgIHI4ICAtIERUQiBh
ZGRyZXNzIChib290IENQVSBvbmx5KQogICogICByOSAgLSBwYWRkcihzdGFydCkKQEAgLTMwMiwx
OCArMzAyLDI2IEBAIGNwdV9pbml0X2RvbmU6CiAgICAgICAgIG1vdiAgIHBjLCByNSAgICAgICAg
ICAgICAgICAgICAgICAgIC8qIFJldHVybiBhZGRyZXNzIGlzIGluIHI1ICovCiBFTkRQUk9DKGNw
dV9pbml0KQogCisvKgorICogUmVidWlsZCB0aGUgYm9vdCBwYWdldGFibGUncyBmaXJzdC1sZXZl
bCBlbnRyaWVzLiBUaGUgc3RydWN0dXJlCisgKiBpcyBkZXNjcmliZWQgaW4gbW0uYy4KKyAqCisg
KiBBZnRlciB0aGUgQ1BVIGVuYWJsZXMgcGFnaW5nIGl0IHdpbGwgYWRkIHRoZSBmaXhtYXAgbWFw
cGluZworICogdG8gdGhlc2UgcGFnZSB0YWJsZXMsIGhvd2V2ZXIgdGhpcyBtYXkgY2xhc2ggd2l0
aCB0aGUgMToxCisgKiBtYXBwaW5nLiBTbyBlYWNoIENQVSBtdXN0IHJlYnVpbGQgdGhlIHBhZ2Ug
dGFibGVzIGhlcmUgd2l0aAorICogdGhlIDE6MSBpbiBwbGFjZS4KKyAqCisgKiBJbnB1dHM6Cisg
KiAgIHI5IDogcGFkZHIoc3RhcnQpCisgKiAgIHIxMDogcGh5cyBvZmZzZXQKKyAqCisgKiBDbG9i
YmVycyByMCAtIHI2CisgKgorICogUmVnaXN0ZXIgdXNhZ2Ugd2l0aGluIHRoaXMgZnVuY3Rpb246
CisgKiAgIHI2IDogSWRlbnRpdHkgbWFwIGluIHBsYWNlCisgKi8KIGNyZWF0ZV9wYWdlX3RhYmxl
czoKICAgICAgICAgLyoKLSAgICAgICAgICogUmVidWlsZCB0aGUgYm9vdCBwYWdldGFibGUncyBm
aXJzdC1sZXZlbCBlbnRyaWVzLiBUaGUgc3RydWN0dXJlCi0gICAgICAgICAqIGlzIGRlc2NyaWJl
ZCBpbiBtbS5jLgotICAgICAgICAgKgotICAgICAgICAgKiBBZnRlciB0aGUgQ1BVIGVuYWJsZXMg
cGFnaW5nIGl0IHdpbGwgYWRkIHRoZSBmaXhtYXAgbWFwcGluZwotICAgICAgICAgKiB0byB0aGVz
ZSBwYWdlIHRhYmxlcywgaG93ZXZlciB0aGlzIG1heSBjbGFzaCB3aXRoIHRoZSAxOjEKLSAgICAg
ICAgICogbWFwcGluZy4gU28gZWFjaCBDUFUgbXVzdCByZWJ1aWxkIHRoZSBwYWdlIHRhYmxlcyBo
ZXJlIHdpdGgKLSAgICAgICAgICogdGhlIDE6MSBpbiBwbGFjZS4KLSAgICAgICAgICovCi0KLSAg
ICAgICAgLyoKICAgICAgICAgICogSWYgWGVuIGlzIGxvYWRlZCBhdCBleGFjdGx5IFhFTl9WSVJU
X1NUQVJUIHRoZW4gd2UgZG9uJ3QKICAgICAgICAgICogbmVlZCBhbiBhZGRpdGlvbmFsIDE6MSBt
YXBwaW5nLCB0aGUgdmlydHVhbCBtYXBwaW5nIHdpbGwKICAgICAgICAgICogc3VmZmljZS4KLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
