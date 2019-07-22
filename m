Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD1A70BB8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2Z-0002TJ-4Z; Mon, 22 Jul 2019 21:40:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2W-0002Rj-FM
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:12 +0000
X-Inumbo-ID: 47ca57b2-acc9-11e9-9a00-33efccef8bfa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 47ca57b2-acc9-11e9-9a00-33efccef8bfa;
 Mon, 22 Jul 2019 21:40:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 363241509;
 Mon, 22 Jul 2019 14:40:10 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83E673F71F;
 Mon, 22 Jul 2019 14:40:09 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:28 +0100
Message-Id: <20190722213958.5761-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 05/35] xen/arm64: head: Introduce print_reg
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
YWxsQGFybS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBSZS1vcmRlciB0
aGUgaW5zdHJ1Y3Rpb25zIHRvIGF2b2lkIGNsb2JlcnJpbmcgeDQgZWFybHkuIFRoaXMKICAgICAg
ICBhbGxvd3MgdG8gcHJpbnQgY29udGVudCBvZiB4NC4KLS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCmluZGV4IGI2ODQw
OTFhYWMuLjYzZDYzYmM4ZWMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMK
KysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpAQCAtOTAsOCArOTAsMjUgQEAKICAgICAg
ICAgYmwgICAgcHV0cyAgICA7ICAgIFwKICAgICAgICAgbW92ICAgbHIsIHgzIDsgICAgIFwKICAg
ICAgICAgUk9EQVRBX1NUUig5OCwgX3MpCisKKy8qCisgKiBNYWNybyB0byBwcmludCB0aGUgdmFs
dWUgb2YgcmVnaXN0ZXIgXHhiCisgKgorICogQ2xvYmJlcnMgeDAgLSB4NAorICovCisubWFjcm8g
cHJpbnRfcmVnIHhiCisgICAgICAgIG1vdiAgIHgwLCBceGIKKyAgICAgICAgbW92ICAgeDQsIGxy
CisgICAgICAgIGJsICAgIHB1dG4KKyAgICAgICAgbW92ICAgbHIsIHg0CisuZW5kbQorCiAjZWxz
ZSAvKiBDT05GSUdfRUFSTFlfUFJJTlRLICovCiAjZGVmaW5lIFBSSU5UKHMpCisKKy5tYWNybyBw
cmludF9yZWcgeGIKKy5lbmRtCisKICNlbmRpZiAvKiAhQ09ORklHX0VBUkxZX1BSSU5USyAqLwog
CiAvKiBMb2FkIHRoZSBwaHlzaWNhbCBhZGRyZXNzIG9mIGEgc3ltYm9sIGludG8geGIgKi8KQEAg
LTMwNCwyMiArMzIxLDIwIEBAIEdMT0JBTChpbml0X3NlY29uZGFyeSkKICNpZmRlZiBDT05GSUdf
RUFSTFlfUFJJTlRLCiAgICAgICAgIGxkciAgIHgyMywgPUVBUkxZX1VBUlRfQkFTRV9BRERSRVNT
IC8qIHgyMyA6PSBVQVJUIGJhc2UgYWRkcmVzcyAqLwogICAgICAgICBQUklOVCgiLSBDUFUgIikK
LSAgICAgICAgbW92ICAgeDAsIHgyNAotICAgICAgICBibCAgICBwdXRuCisgICAgICAgIHByaW50
X3JlZyB4MjQKICAgICAgICAgUFJJTlQoIiBib290aW5nIC1cclxuIikKICNlbmRpZgogCiBjb21t
b25fc3RhcnQ6CiAKICAgICAgICAgUFJJTlQoIi0gQ3VycmVudCBFTCAiKQotICAgICAgICBtcnMg
ICB4NCwgQ3VycmVudEVMCi0gICAgICAgIG1vdiAgIHgwLCB4NAotICAgICAgICBibCAgICBwdXRu
CisgICAgICAgIG1ycyAgIHg1LCBDdXJyZW50RUwKKyAgICAgICAgcHJpbnRfcmVnIHg1CiAgICAg
ICAgIFBSSU5UKCIgLVxyXG4iKQogCiAgICAgICAgIC8qIEFyZSB3ZSBpbiBFTDIgKi8KLSAgICAg
ICAgY21wICAgeDQsICNQU1JfTU9ERV9FTDJ0Ci0gICAgICAgIGNjbXAgIHg0LCAjUFNSX01PREVf
RUwyaCwgIzB4NCwgbmUKKyAgICAgICAgY21wICAgeDUsICNQU1JfTU9ERV9FTDJ0CisgICAgICAg
IGNjbXAgIHg1LCAjUFNSX01PREVfRUwyaCwgIzB4NCwgbmUKICAgICAgICAgYi5lcSAgZWwyIC8q
IFllcyAqLwogCiAgICAgICAgIC8qIE9LLCB3ZSdyZSBib25lZC4gKi8KLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
