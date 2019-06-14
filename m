Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E6246664
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 19:54:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbqMu-0001t2-Oz; Fri, 14 Jun 2019 17:52:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbqMs-0001rD-J4
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 17:52:02 +0000
X-Inumbo-ID: 1ca75bb1-8ecd-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1ca75bb1-8ecd-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 17:52:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 112D7344;
 Fri, 14 Jun 2019 10:52:01 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 295123F718;
 Fri, 14 Jun 2019 10:52:00 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 14 Jun 2019 18:51:43 +0100
Message-Id: <20190614175144.20046-9-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190614175144.20046-1-julien.grall@arm.com>
References: <20190614175144.20046-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v3 8/9] xen/arm: mm: Don't open-code
 Xen PT update in {set, clear}_fixmap()
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

e3NldCwgY2xlYXJ9X2ZpeG1hcCgpIGFyZSBjdXJyZW50bHkgb3Blbi1jb2RpbmcgdXBkYXRlIHRv
IHRoZSBYZW4KcGFnZS10YWJsZXMuIFRoaXMgY2FuIGJlIGF2b2lkZWQgYnkgdXNpbmcgdGhlIGdl
bmVyaWMgaGVscGVycwptYXBfcGFnZXNfdG9feGVuKCkgYW5kIGRlc3Ryb3lfeGVuX21hcHBpbmdz
KCkuCgpCb3RoIGZ1bmN0aW9uIGFyZSBub3QgbWVhbnQgdG8gZmFpbCBmb3IgZml4bWFwLCBoZW5j
ZSB0aGUgQlVHX09OKCkKY2hlY2tpbmcgdGhlIHJldHVybi4KClNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292
IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYzOgogICAgICAgIC0g
QWRkIFN0ZWZhbm8ncyBhY2tlZC1ieQoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBBZGQg
QW5kcmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyB8IDE2ICsrKysrKysr
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRl
eCAwMjhmYmQzOGFkLi40NmJjM2Q4MDc1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYwor
KysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMzQ4LDE5ICszNDgsMTkgQEAgc3RhdGljIGlubGlu
ZSBscGFlX3QgbWZuX3RvX3hlbl9lbnRyeShtZm5fdCBtZm4sIHVuc2lnbmVkIGF0dHIpCiAvKiBN
YXAgYSA0ayBwYWdlIGluIGEgZml4bWFwIGVudHJ5ICovCiB2b2lkIHNldF9maXhtYXAodW5zaWdu
ZWQgbWFwLCBtZm5fdCBtZm4sIHVuc2lnbmVkIGludCBmbGFncykKIHsKLSAgICBscGFlX3QgcHRl
ID0gbWZuX3RvX3hlbl9lbnRyeShtZm4sIFBBR0VfQUlfTUFTSyhmbGFncykpOwotICAgIHB0ZS5w
dC50YWJsZSA9IDE7IC8qIDRrIG1hcHBpbmdzIGFsd2F5cyBoYXZlIHRoaXMgYml0IHNldCAqLwot
ICAgIHB0ZS5wdC54biA9IDE7Ci0gICAgd3JpdGVfcHRlKHhlbl9maXhtYXAgKyB0aGlyZF90YWJs
ZV9vZmZzZXQoRklYTUFQX0FERFIobWFwKSksIHB0ZSk7Ci0gICAgZmx1c2hfeGVuX3RsYl9yYW5n
ZV92YShGSVhNQVBfQUREUihtYXApLCBQQUdFX1NJWkUpOworICAgIGludCByZXM7CisKKyAgICBy
ZXMgPSBtYXBfcGFnZXNfdG9feGVuKEZJWE1BUF9BRERSKG1hcCksIG1mbiwgMSwgZmxhZ3MpOwor
ICAgIEJVR19PTihyZXMgIT0gMCk7CiB9CiAKIC8qIFJlbW92ZSBhIG1hcHBpbmcgZnJvbSBhIGZp
eG1hcCBlbnRyeSAqLwogdm9pZCBjbGVhcl9maXhtYXAodW5zaWduZWQgbWFwKQogewotICAgIGxw
YWVfdCBwdGUgPSB7MH07Ci0gICAgd3JpdGVfcHRlKHhlbl9maXhtYXAgKyB0aGlyZF90YWJsZV9v
ZmZzZXQoRklYTUFQX0FERFIobWFwKSksIHB0ZSk7Ci0gICAgZmx1c2hfeGVuX3RsYl9yYW5nZV92
YShGSVhNQVBfQUREUihtYXApLCBQQUdFX1NJWkUpOworICAgIGludCByZXM7CisKKyAgICByZXMg
PSBkZXN0cm95X3hlbl9tYXBwaW5ncyhGSVhNQVBfQUREUihtYXApLCBGSVhNQVBfQUREUihtYXAp
ICsgUEFHRV9TSVpFKTsKKyAgICBCVUdfT04ocmVzICE9IDApOwogfQogCiAvKiBDcmVhdGUgWGVu
J3MgbWFwcGluZ3Mgb2YgbWVtb3J5LgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
