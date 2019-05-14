Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D281C889
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:25:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWRI-00086W-27; Tue, 14 May 2019 12:21:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWRG-00086L-Az
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:21:46 +0000
X-Inumbo-ID: d6900b1c-7642-11e9-bdcd-e7faff90497c
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d6900b1c-7642-11e9-bdcd-e7faff90497c;
 Tue, 14 May 2019 12:21:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D936615AB;
 Tue, 14 May 2019 05:21:44 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C98B43F71E;
 Tue, 14 May 2019 05:21:43 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:21:10 +0100
Message-Id: <20190514122136.28215-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122136.28215-1-julien.grall@arm.com>
References: <20190514122136.28215-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART1 v3 1/8] xen/arm: Don't boot Xen on
 platform using AIVIVT instruction caches
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
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEFJVklWVCBpcyBhIHR5cGUgb2YgaW5zdHJ1Y3Rpb24gY2FjaGUgYXZhaWxhYmxlIG9uIEFy
bXY3LiBUaGlzIGlzCnRoZSBvbmx5IGNhY2hlIG5vdCBpbXBsZW1lbnRpbmcgdGhlIElWSVBUIGV4
dGVuc2lvbiBhbmQgdGhlcmVmb3JlCnJlcXVpcmluZyBzcGVjaWZpYyBjYXJlLgoKVG8gc2ltcGxp
ZnkgbWFpbnRlbmFuY2UgcmVxdWlyZW1lbnRzLCBYZW4gd2lsbCBub3QgYm9vdCBvbiBwbGF0Zm9y
bQp1c2luZyBBSVZJVlQgY2FjaGUuCgpUaGlzIHNob3VsZCBub3QgYmUgYW4gaXNzdWUgYmVjYXVz
ZSBYZW4gQXJtMzIgY2FuIG9ubHkgYm9vdCBvbiBhIHNtYWxsCm51bWJlciBvZiBwcm9jZXNzb3Jz
IChzZWUgYXJjaC9hcm0vYXJtMzIvcHJvYy12Ny5TKS4gQWxsIG9mIHRoZW0gYXJlCm5vdCB1c2lu
ZyBBSVZJVlQgY2FjaGUuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgoKLS0tCgogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIFBhdGNoIGFkZGVk
Ci0tLQogeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgICB8IDUgKysrKysKIHhlbi9pbmNs
dWRlL2FzbS1hcm0vcHJvY2Vzc29yLmggfCA1ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNo
L2FybS9zZXR1cC5jCmluZGV4IGNjYjBmMTgxZWEuLmZhYWYwMjliOTkgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL2FybS9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCkBAIC01MjYsMTAg
KzUyNiwxNSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odW5zaWduZWQgbG9uZyBkdGJf
cGFkZHIsIHNpemVfdCBkdGJfc2l6ZSkKICAgICB1bnNpZ25lZCBsb25nIGJvb3RfbWZuX3N0YXJ0
LCBib290X21mbl9lbmQ7CiAgICAgaW50IGk7CiAgICAgdm9pZCAqZmR0OworICAgIGNvbnN0IHVp
bnQzMl90IGN0ciA9IFJFQURfQ1AzMihDVFIpOwogCiAgICAgaWYgKCAhYm9vdGluZm8ubWVtLm5y
X2JhbmtzICkKICAgICAgICAgcGFuaWMoIk5vIG1lbW9yeSBiYW5rXG4iKTsKIAorICAgIC8qIFdl
IG9ubHkgc3VwcG9ydHMgaW5zdHJ1Y3Rpb24gY2FjaGVzIGltcGxlbWVudGluZyB0aGUgSVZJUFQg
ZXh0ZW5zaW9uLiAqLworICAgIGlmICggKChjdHIgPj4gQ1RSX0wxSXBfU0hJRlQpICYgQ1RSX0wx
SXBfTUFTSykgPT0gQ1RSX0wxSXBfQUlWSVZUICkKKyAgICAgICAgcGFuaWMoIkFJVklWVCBpbnN0
cnVjdGlvbiBjYWNoZSBub3Qgc3VwcG9ydGVkXG4iKTsKKwogICAgIGluaXRfcGR4KCk7CiAKICAg
ICByYW1fc3RhcnQgPSBib290aW5mby5tZW0uYmFua1swXS5zdGFydDsKZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nl
c3Nvci5oCmluZGV4IGI1ZjUxNTgwNWQuLjA0YjA1YjNmMzkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL2FzbS1hcm0vcHJvY2Vzc29yLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNz
b3IuaApAQCAtNiw2ICs2LDExIEBACiAjZW5kaWYKICNpbmNsdWRlIDxwdWJsaWMvYXJjaC1hcm0u
aD4KIAorLyogQ1RSIENhY2hlIFR5cGUgUmVnaXN0ZXIgKi8KKyNkZWZpbmUgQ1RSX0wxSXBfTUFT
SyAgICAgICAweDMKKyNkZWZpbmUgQ1RSX0wxSXBfU0hJRlQgICAgICAxNAorI2RlZmluZSBDVFJf
TDFJcF9BSVZJVlQgICAgIDB4MQorCiAvKiBNSURSIE1haW4gSUQgUmVnaXN0ZXIgKi8KICNkZWZp
bmUgTUlEUl9SRVZJU0lPTl9NQVNLICAgICAgMHhmCiAjZGVmaW5lIE1JRFJfUkVTSVZJT04obWlk
cikgICAgICgobWlkcikgJiBNSURSX1JFVklTSU9OX01BU0spCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
