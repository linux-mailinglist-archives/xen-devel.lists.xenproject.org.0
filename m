Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3E21C8CE
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:34:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWaq-0005Md-Sn; Tue, 14 May 2019 12:31:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWaq-0005MN-3t
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:31:40 +0000
X-Inumbo-ID: 3860fc25-7644-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3860fc25-7644-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:31:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9137315AD;
 Tue, 14 May 2019 05:31:38 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DFA63F71E;
 Tue, 14 May 2019 05:31:37 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:31:18 +0100
Message-Id: <20190514123125.29086-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514123125.29086-1-julien.grall@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v2 05/12] xen/arm: mm: Introduce
 _PAGE_PRESENT and _PAGE_POPULATE
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

QXQgdGhlIG1vbWVudCwgdGhlIGZsYWdzIGFyZSBub3QgZW5vdWdoIHRvIGRlc2NyaWJlIHdoYXQg
a2luZCBvZiB1cGRhdGUKd2lsbCBkb25lIG9uIHRoZSBWQSByYW5nZS4gVGhleSBuZWVkIHRvIGJl
IHVzZWQgaW4gY29uanVuY3Rpb24gd2l0aCB0aGUKZW51bSB4ZW5tYXBfb3BlcmF0aW9uLgoKSXQg
d291bGQgYmUgbW9yZSBjb252ZW5pZW50IHRvIGhhdmUgYWxsIHRoZSBpbmZvcm1hdGlvbiBmb3Ig
dGhlIHVwZGF0ZQppbiBhIHNpbmdsZSBwbGFjZS4KClR3byBuZXcgZmxhZ3MgYXJlIGFkZGVkIHRv
IHJlbW92ZSB0aGUgcmVsaWVuY2Ugb24geGVubWFwX29wZXJhdGlvbjoKICAgIC0gX1BBR0VfUFJF
U0VOVDogSW5kaWNhdGUgd2hldGhlciB3ZSBhcmUgYWRkaW5nL3JlbW92aW5nIHRoZSBtYXBwaW5n
CiAgICAtIF9QQUdFX1BPUFVMQVRFOiBJbmRpY2F0ZSB3aGV0aGVyIHdlIG9ubHkgcG9wdWxhdGUg
cGFnZS10YWJsZXMKClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29t
PgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2Vk
LWJ5Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICAgfCAyICstCiB4ZW4vaW5jbHVkZS9h
c20tYXJtL3BhZ2UuaCB8IDkgKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hl
bi9hcmNoL2FybS9tbS5jCmluZGV4IDlkZTJhMTE1MGYuLjIxOTJkZWRlNTUgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hlbi9hcmNoL2FybS9tbS5jCkBAIC0xMDgzLDcgKzEw
ODMsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbih1bnNpZ25lZCBsb25nIHZpcnQsCiAKIGludCBw
b3B1bGF0ZV9wdF9yYW5nZSh1bnNpZ25lZCBsb25nIHZpcnQsIHVuc2lnbmVkIGxvbmcgbnJfbWZu
cykKIHsKLSAgICByZXR1cm4geGVuX3B0X3VwZGF0ZShSRVNFUlZFLCB2aXJ0LCBJTlZBTElEX01G
TiwgbnJfbWZucywgMCk7CisgICAgcmV0dXJuIHhlbl9wdF91cGRhdGUoUkVTRVJWRSwgdmlydCwg
SU5WQUxJRF9NRk4sIG5yX21mbnMsIF9QQUdFX1BPUFVMQVRFKTsKIH0KIAogaW50IGRlc3Ryb3lf
eGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgdiwgdW5zaWduZWQgbG9uZyBlKQpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9wYWdlLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3BhZ2Uu
aAppbmRleCAyYmNkYjBmMWE1Li5jYWYyZmFjMWZmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9h
c20tYXJtL3BhZ2UuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3BhZ2UuaApAQCAtNzYsNiAr
NzYsOCBAQAogICoKICAqIFswOjJdIE1lbW9yeSBBdHRyaWJ1dGUgSW5kZXgKICAqIFszOjRdIFBl
cm1pc3Npb24gZmxhZ3MKKyAqIFs1XSAgIFByZXNlbnQgYml0CisgKiBbNl0gICBQb3B1bGF0ZSBw
YWdlIHRhYmxlCiAgKi8KICNkZWZpbmUgUEFHRV9BSV9NQVNLKHgpICgoeCkgJiAweDdVKQogCkBA
IC04NiwxMiArODgsMTUgQEAKICNkZWZpbmUgUEFHRV9YTl9NQVNLKHgpICgoKHgpID4+IF9QQUdF
X1hOX0JJVCkgJiAweDFVKQogI2RlZmluZSBQQUdFX1JPX01BU0soeCkgKCgoeCkgPj4gX1BBR0Vf
Uk9fQklUKSAmIDB4MVUpCiAKKyNkZWZpbmUgX1BBR0VfUFJFU0VOVCAgICAoMVUgPDwgNSkKKyNk
ZWZpbmUgX1BBR0VfUE9QVUxBVEUgICAoMVUgPDwgNikKKwogLyoKICAqIF9QQUdFX0RFVklDRSBh
bmQgX1BBR0VfTk9STUFMIGFyZSBjb252ZW5pZW5jZSBkZWZpbmVzLiBUaGV5IGFyZSBub3QKICAq
IG1lYW50IHRvIGJlIHVzZWQgb3V0c2lkZSBvZiB0aGlzIGhlYWRlci4KICAqLwotI2RlZmluZSBf
UEFHRV9ERVZJQ0UgICAgX1BBR0VfWE4KLSNkZWZpbmUgX1BBR0VfTk9STUFMICAgIE1UX05PUk1B
TAorI2RlZmluZSBfUEFHRV9ERVZJQ0UgICAgKF9QQUdFX1hOfF9QQUdFX1BSRVNFTlQpCisjZGVm
aW5lIF9QQUdFX05PUk1BTCAgICAoTVRfTk9STUFMfF9QQUdFX1BSRVNFTlQpCiAKICNkZWZpbmUg
UEFHRV9IWVBFUlZJU09SX1JPICAgICAgKF9QQUdFX05PUk1BTHxfUEFHRV9ST3xfUEFHRV9YTikK
ICNkZWZpbmUgUEFHRV9IWVBFUlZJU09SX1JYICAgICAgKF9QQUdFX05PUk1BTHxfUEFHRV9STykK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
