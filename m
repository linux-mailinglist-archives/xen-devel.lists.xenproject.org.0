Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C92446665
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 19:55:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbqMq-0001ow-Ju; Fri, 14 Jun 2019 17:52:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbqMo-0001nJ-EK
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 17:51:58 +0000
X-Inumbo-ID: 18b281da-8ecd-11e9-806d-bbdfc0d74393
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 18b281da-8ecd-11e9-806d-bbdfc0d74393;
 Fri, 14 Jun 2019 17:51:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59628346;
 Fri, 14 Jun 2019 10:51:54 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 713AF3F718;
 Fri, 14 Jun 2019 10:51:53 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 14 Jun 2019 18:51:37 +0100
Message-Id: <20190614175144.20046-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190614175144.20046-1-julien.grall@arm.com>
References: <20190614175144.20046-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v3 2/9] xen/arm: mm: Introduce
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
PgoKLS0tCiAgICBDaGFuZ2VzIGluIHYzOgogICAgICAgIC0gQ2xhcmlmeSB0aGUgZGVzY3JpcHRp
b24gb2YgdGhlIG5ldyBmbGFncwoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBBZGQgQW5k
cmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAgICB8IDIgKy0K
IHhlbi9pbmNsdWRlL2FzbS1hcm0vcGFnZS5oIHwgOSArKysrKysrLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKaW5kZXggMjNlOTU2NWRkYy4uYjEzZDlhZGY0
MCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMK
QEAgLTEwNTYsNyArMTA1Niw3IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKHVuc2lnbmVkIGxvbmcg
dmlydCwKIAogaW50IHBvcHVsYXRlX3B0X3JhbmdlKHVuc2lnbmVkIGxvbmcgdmlydCwgdW5zaWdu
ZWQgbG9uZyBucl9tZm5zKQogewotICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKFJFU0VSVkUsIHZp
cnQsIElOVkFMSURfTUZOLCBucl9tZm5zLCAwKTsKKyAgICByZXR1cm4geGVuX3B0X3VwZGF0ZShS
RVNFUlZFLCB2aXJ0LCBJTlZBTElEX01GTiwgbnJfbWZucywgX1BBR0VfUE9QVUxBVEUpOwogfQog
CiBpbnQgZGVzdHJveV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyB2LCB1bnNpZ25lZCBsb25n
IGUpCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3BhZ2UuaCBiL3hlbi9pbmNsdWRl
L2FzbS1hcm0vcGFnZS5oCmluZGV4IDJiY2RiMGYxYTUuLjM3ZTFkOWFhZGIgMTAwNjQ0Ci0tLSBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vcGFnZS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGFn
ZS5oCkBAIC03Niw2ICs3Niw4IEBACiAgKgogICogWzA6Ml0gTWVtb3J5IEF0dHJpYnV0ZSBJbmRl
eAogICogWzM6NF0gUGVybWlzc2lvbiBmbGFncworICogWzVdICAgUGFnZSBwcmVzZW50CisgKiBb
Nl0gICBPbmx5IHBvcHVsYXRlIHBhZ2UgdGFibGVzCiAgKi8KICNkZWZpbmUgUEFHRV9BSV9NQVNL
KHgpICgoeCkgJiAweDdVKQogCkBAIC04NiwxMiArODgsMTUgQEAKICNkZWZpbmUgUEFHRV9YTl9N
QVNLKHgpICgoKHgpID4+IF9QQUdFX1hOX0JJVCkgJiAweDFVKQogI2RlZmluZSBQQUdFX1JPX01B
U0soeCkgKCgoeCkgPj4gX1BBR0VfUk9fQklUKSAmIDB4MVUpCiAKKyNkZWZpbmUgX1BBR0VfUFJF
U0VOVCAgICAoMVUgPDwgNSkKKyNkZWZpbmUgX1BBR0VfUE9QVUxBVEUgICAoMVUgPDwgNikKKwog
LyoKICAqIF9QQUdFX0RFVklDRSBhbmQgX1BBR0VfTk9STUFMIGFyZSBjb252ZW5pZW5jZSBkZWZp
bmVzLiBUaGV5IGFyZSBub3QKICAqIG1lYW50IHRvIGJlIHVzZWQgb3V0c2lkZSBvZiB0aGlzIGhl
YWRlci4KICAqLwotI2RlZmluZSBfUEFHRV9ERVZJQ0UgICAgX1BBR0VfWE4KLSNkZWZpbmUgX1BB
R0VfTk9STUFMICAgIE1UX05PUk1BTAorI2RlZmluZSBfUEFHRV9ERVZJQ0UgICAgKF9QQUdFX1hO
fF9QQUdFX1BSRVNFTlQpCisjZGVmaW5lIF9QQUdFX05PUk1BTCAgICAoTVRfTk9STUFMfF9QQUdF
X1BSRVNFTlQpCiAKICNkZWZpbmUgUEFHRV9IWVBFUlZJU09SX1JPICAgICAgKF9QQUdFX05PUk1B
THxfUEFHRV9ST3xfUEFHRV9YTikKICNkZWZpbmUgUEFHRV9IWVBFUlZJU09SX1JYICAgICAgKF9Q
QUdFX05PUk1BTHxfUEFHRV9STykKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
