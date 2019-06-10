Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C073BCE8
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:34:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ1s-0007dR-68; Mon, 10 Jun 2019 19:32:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ1r-0007dH-AH
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:27 +0000
X-Inumbo-ID: 79f136ad-8bb6-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 79f136ad-8bb6-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 19:32:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACA74346;
 Mon, 10 Jun 2019 12:32:25 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C49683F73C;
 Mon, 10 Jun 2019 12:32:24 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:32:03 +0100
Message-Id: <20190610193215.23704-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 05/17] xen/arm64: head: Introduce print_reg
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

QXQgdGhlIG1vbWVudCwgdGhlIHVzZXIgc2hvdWxkIHNhdmUgeDMwL2xyIGlmIGl0IGNhcmVzIGFi
b3V0IGl0LgoKRm9sbG93LXVwIHBhdGNoZXMgd2lsbCBpbnRyb2R1Y2UgbW9yZSB1c2Ugb2YgcHV0
biBpbiBwbGFjZSB3aGVyZSBscgpzaG91bGQgYmUgcHJlc2VydmVkLgoKRnVydGhlcm1vcmUsIGFu
eSB1c2VyIG9mIHB1dG4gc2hvdWxkIGFsc28gbW92ZSB0aGUgdmFsdWUgdG8gcmVnaXN0ZXIgeDAK
aWYgaXQgd2FzIHN0b3JlZCBpbiBhIGRpZmZlcmVudCByZWdpc3Rlci4KCkZvciBjb252ZW5pZW5j
ZSwgYSBuZXcgbWFjcm8gaXMgaW50cm9kdWNlZCB0byBwcmludCBhIGdpdmVuIHJlZ2lzdGVyLgpU
aGUgbWFjcm8gd2lsbCB0YWtlIGNhcmUgZm9yIHVzIHRvIG1vdmUgdGhlIHZhbHVlIHRvIHgwIGFu
ZCBhbHNvCnByZXNlcnZlIGxyLgoKTGFzdGx5IHRoZSBuZXcgbWFjcm8gaXMgdXNlZCB0byByZXBs
YWNlIGFsbCB0aGUgY2FsbHNpdGUgb2YgcHV0bi4gVGhpcwp3aWxsIHNpbXBsaWZ5IHJld29yay9y
ZXZpZXcgbGF0ZXIgb24uCgpOb3RlIHRoYXQgQ3VycmVudEVMIGlzIG5vdyBzdG9yZWQgaW4geDUg
aW5zdGVhZCBvZiB4NCBiZWNhdXNlIHRoZSBsYXR0ZXIKd2lsbCBiZSBjbG9iYmVyZWQgYnkgdGhl
IG1hY3JvIHByaW50X3JlZy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDI5ICsrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIv
eGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwppbmRleCA4NGUyNjU4MmM0Li45MTQyYjRhNzc0IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMKQEAgLTkwLDggKzkwLDI1IEBACiAgICAgICAgIGJsICAgIHB1dHMgICAgOyAg
ICAgXAogICAgICAgICBtb3YgICBsciwgeDMgIDsgICAgIFwKICAgICAgICAgUk9EQVRBX1NUUig5
OCwgX3MpCisKKy8qCisgKiBNYWNybyB0byBwcmludCB0aGUgdmFsdWUgb2YgcmVnaXN0ZXIgXHhi
CisgKgorICogQ2xvYmJlcnMgeDAgLSB4NAorICovCisubWFjcm8gcHJpbnRfcmVnIHhiCisgICAg
ICAgIG1vdiAgIHg0LCBscgorICAgICAgICBtb3YgICB4MCwgXHhiCisgICAgICAgIGJsICAgIHB1
dG4KKyAgICAgICAgbW92ICAgbHIsIHg0CisuZW5kbQorCiAjZWxzZSAvKiBDT05GSUdfRUFSTFlf
UFJJTlRLICovCiAjZGVmaW5lIFBSSU5UKHMpCisKKy5tYWNybyBwcmludF9yZWcgeGIKKy5lbmRt
CisKICNlbmRpZiAvKiAhQ09ORklHX0VBUkxZX1BSSU5USyAqLwogCiAvKiBMb2FkIHRoZSBwaHlz
aWNhbCBhZGRyZXNzIG9mIGEgc3ltYm9sIGludG8geGIgKi8KQEAgLTMwNCwyMiArMzIxLDIwIEBA
IEdMT0JBTChpbml0X3NlY29uZGFyeSkKICNpZmRlZiBDT05GSUdfRUFSTFlfUFJJTlRLCiAgICAg
ICAgIGxkciAgIHgyMywgPUVBUkxZX1VBUlRfQkFTRV9BRERSRVNTIC8qIHgyMyA6PSBVQVJUIGJh
c2UgYWRkcmVzcyAqLwogICAgICAgICBQUklOVCgiLSBDUFUgIikKLSAgICAgICAgbW92ICAgeDAs
IHgyNAotICAgICAgICBibCAgICBwdXRuCisgICAgICAgIHByaW50X3JlZyB4MjQKICAgICAgICAg
UFJJTlQoIiBib290aW5nIC1cclxuIikKICNlbmRpZgogCiBjb21tb25fc3RhcnQ6CiAKICAgICAg
ICAgUFJJTlQoIi0gQ3VycmVudCBFTCAiKQotICAgICAgICBtcnMgICB4NCwgQ3VycmVudEVMCi0g
ICAgICAgIG1vdiAgIHgwLCB4NAotICAgICAgICBibCAgICBwdXRuCisgICAgICAgIG1ycyAgIHg1
LCBDdXJyZW50RUwKKyAgICAgICAgcHJpbnRfcmVnIHg1CiAgICAgICAgIFBSSU5UKCIgLVxyXG4i
KQogCiAgICAgICAgIC8qIEFyZSB3ZSBpbiBFTDIgKi8KLSAgICAgICAgY21wICAgeDQsICNQU1Jf
TU9ERV9FTDJ0Ci0gICAgICAgIGNjbXAgIHg0LCAjUFNSX01PREVfRUwyaCwgIzB4NCwgbmUKKyAg
ICAgICAgY21wICAgeDUsICNQU1JfTU9ERV9FTDJ0CisgICAgICAgIGNjbXAgIHg1LCAjUFNSX01P
REVfRUwyaCwgIzB4NCwgbmUKICAgICAgICAgYi5lcSAgZWwyIC8qIFllcyAqLwogCiAgICAgICAg
IC8qIE9LLCB3ZSdyZSBib25lZC4gKi8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
