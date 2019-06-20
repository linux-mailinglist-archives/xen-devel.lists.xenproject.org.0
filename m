Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93D74CB2C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 11:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdtYP-0002uv-F1; Thu, 20 Jun 2019 09:40:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YAo9=UT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hdtYO-0002uk-6w
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 09:40:24 +0000
X-Inumbo-ID: 6a94a476-933f-11e9-820c-57c41817da3c
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a94a476-933f-11e9-820c-57c41817da3c;
 Thu, 20 Jun 2019 09:40:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 795A9AED4;
 Thu, 20 Jun 2019 09:40:18 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Date: Thu, 20 Jun 2019 11:40:15 +0200
Message-Id: <20190620094015.21206-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH RFC] mm: fix regression with deferred struct
 page init
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
Cc: Juergen Gross <jgross@suse.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDBlNTZhY2FlNGI0ZGQ0YTkgKCJtbTogaW5pdGlhbGl6ZSBNQVhfT1JERVJfTlJfUEFH
RVMgYXQgYSB0aW1lCmluc3RlYWQgb2YgZG9pbmcgbGFyZ2VyIHNlY3Rpb25zIikgaXMgY2F1c2lu
ZyBhIHJlZ3Jlc3Npb24gb24gc29tZQpzeXN0ZW1zIHdoZW4gdGhlIGtlcm5lbCBpcyBib290ZWQg
YXMgWGVuIGRvbTAuCgpUaGUgc3lzdGVtIHdpbGwganVzdCBoYW5nIGluIGVhcmx5IGJvb3QuCgpS
ZWFzb24gaXMgYW4gZW5kbGVzcyBsb29wIGluIGdldF9wYWdlX2Zyb21fZnJlZWxpc3QoKSBpbiBj
YXNlIHRoZSBmaXJzdAp6b25lIGxvb2tlZCBhdCBoYXMgbm8gZnJlZSBtZW1vcnkuIGRlZmVycmVk
X2dyb3dfem9uZSgpIGlzIGFsd2F5cwpyZXR1cm5pbmcgdHJ1ZSBkdWUgdG8gdGhlIGZvbGxvd2lu
ZyBjb2RlIHNuaXBwbGV0OgoKICAvKiBJZiB0aGUgem9uZSBpcyBlbXB0eSBzb21lYm9keSBlbHNl
IG1heSBoYXZlIGNsZWFyZWQgb3V0IHRoZSB6b25lICovCiAgaWYgKCFkZWZlcnJlZF9pbml0X21l
bV9wZm5fcmFuZ2VfaW5fem9uZSgmaSwgem9uZSwgJnNwZm4sICZlcGZuLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlyc3RfZGVmZXJyZWRfcGZuKSkgewogICAg
ICAgICAgcGdkYXQtPmZpcnN0X2RlZmVycmVkX3BmbiA9IFVMT05HX01BWDsKICAgICAgICAgIHBn
ZGF0X3Jlc2l6ZV91bmxvY2socGdkYXQsICZmbGFncyk7CiAgICAgICAgICByZXR1cm4gdHJ1ZTsK
ICB9CgpUaGlzIGluIHR1cm4gcmVzdWx0cyBpbiB0aGUgbG9vcCBhcyBnZXRfcGFnZV9mcm9tX2Zy
ZWVsaXN0KCkgaXMKYXNzdW1pbmcgZm9yd2FyZCBwcm9ncmVzcyBjYW4gYmUgbWFkZSBieSBkb2lu
ZyBzb21lIG1vcmUgc3RydWN0IHBhZ2UKaW5pdGlhbGl6YXRpb24uCgpGaXhlczogMGU1NmFjYWU0
YjRkZDRhOSAoIm1tOiBpbml0aWFsaXplIE1BWF9PUkRFUl9OUl9QQUdFUyBhdCBhIHRpbWUgaW5z
dGVhZCBvZiBkb2luZyBsYXJnZXIgc2VjdGlvbnMiKQotLS0KVGhpcyBwYXRjaCBtYWtlcyBteSBz
eXN0ZW0gYm9vdCBhZ2FpbiBhcyBYZW4gZG9tMCwgYnV0IEknbSBub3QgcmVhbGx5CnN1cmUgaXQg
aXMgdGhlIGNvcnJlY3Qgd2F5IHRvIGRvIGl0LCBoZW5jZSB0aGUgUkZDLgpTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogbW0vcGFnZV9hbGxvYy5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCmluZGV4IGQ2NmJjOGFi
ZTBhZi4uNmVlNzU0YjVjZDkyIDEwMDY0NAotLS0gYS9tbS9wYWdlX2FsbG9jLmMKKysrIGIvbW0v
cGFnZV9hbGxvYy5jCkBAIC0xODI2LDcgKzE4MjYsNyBAQCBkZWZlcnJlZF9ncm93X3pvbmUoc3Ry
dWN0IHpvbmUgKnpvbmUsIHVuc2lnbmVkIGludCBvcmRlcikKIAkJCQkJCSBmaXJzdF9kZWZlcnJl
ZF9wZm4pKSB7CiAJCXBnZGF0LT5maXJzdF9kZWZlcnJlZF9wZm4gPSBVTE9OR19NQVg7CiAJCXBn
ZGF0X3Jlc2l6ZV91bmxvY2socGdkYXQsICZmbGFncyk7Ci0JCXJldHVybiB0cnVlOworCQlyZXR1
cm4gZmFsc2U7CiAJfQogCiAJLyoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
