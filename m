Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A15140CDF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:43:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSnD-0003B7-PP; Fri, 17 Jan 2020 14:40:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HJCJ=3G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1isSnB-0003A0-Sy
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:40:09 +0000
X-Inumbo-ID: 3cce1218-3937-11ea-aecd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cce1218-3937-11ea-aecd-bc764e2007e4;
 Fri, 17 Jan 2020 14:39:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59B93B17A;
 Fri, 17 Jan 2020 14:39:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 17 Jan 2020 15:39:55 +0100
Message-Id: <20200117143955.18892-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/blkfront: limit allocated memory size to
 actual use case
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
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG9kYXkgdGhlIFhlbiBibGtmcm9udCBkcml2ZXIgYWxsb2NhdGVzIG1lbW9yeSBmb3Igb25lIHN0
cnVjdApibGtmcm9udF9yaW5nX2luZm8gZm9yIGVhY2ggY29tbXVuaWNhdGlvbiByaW5nLiBUaGlz
IHN0cnVjdHVyZSBpcwpzdGF0aWNhbGx5IHNpemVkIGZvciB0aGUgbWF4aW11bSBzdXBwb3J0ZWQg
Y29uZmlndXJhdGlvbiByZXN1bHRpbmcKaW4gYSBzaXplIG9mIG1vcmUgdGhhbiA5MCBrQi4KCkFz
IHRoZSBtYWluIHNpemUgY29udHJpYnV0b3IgaXMgb25lIGFycmF5IGluc2lkZSB0aGUgc3RydWN0
LCB0aGUKbWVtb3J5IGFsbG9jYXRpb24gY2FuIGVhc2lseSBiZSBsaW1pdGVkIGJ5IG1vdmluZyB0
aGlzIGFycmF5IHRvIGJlCnRoZSBsYXN0IHN0cnVjdHVyZSBlbGVtZW50IGFuZCB0byBhbGxvY2F0
ZSBvbmx5IHRoZSBtZW1vcnkgZm9yIHRoZQphY3R1YWxseSBuZWVkZWQgYXJyYXkgc2l6ZS4KClNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkcml2ZXJz
L2Jsb2NrL3hlbi1ibGtmcm9udC5jIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hl
bi1ibGtmcm9udC5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwppbmRleCBjMDJiZTA2
YzUyOTkuLjYxNDkxMTY3ZGExOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJv
bnQuYworKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCkBAIC0xNTEsOSArMTUxLDYg
QEAgTU9EVUxFX1BBUk1fREVTQyhtYXhfcmluZ19wYWdlX29yZGVyLCAiTWF4aW11bSBvcmRlciBv
ZiBwYWdlcyB0byBiZSB1c2VkIGZvciB0aGUKICNkZWZpbmUgQkxLX1JJTkdfU0laRShpbmZvKQlc
CiAJX19DT05TVF9SSU5HX1NJWkUoYmxraWYsIFhFTl9QQUdFX1NJWkUgKiAoaW5mbyktPm5yX3Jp
bmdfcGFnZXMpCiAKLSNkZWZpbmUgQkxLX01BWF9SSU5HX1NJWkUJXAotCV9fQ09OU1RfUklOR19T
SVpFKGJsa2lmLCBYRU5fUEFHRV9TSVpFICogWEVOQlVTX01BWF9SSU5HX0dSQU5UUykKLQogLyoK
ICAqIHJpbmctcmVmJXUgaT0oLTFVTCkgd291bGQgdGFrZSAxMSBjaGFyYWN0ZXJzICsgJ3Jpbmct
cmVmJyBpcyA4LCBzbyAxOQogICogY2hhcmFjdGVycyBhcmUgZW5vdWdoLiBEZWZpbmUgdG8gMjAg
dG8ga2VlcCBjb25zaXN0ZW50IHdpdGggYmFja2VuZC4KQEAgLTE3NywxMiArMTc0LDEyIEBAIHN0
cnVjdCBibGtmcm9udF9yaW5nX2luZm8gewogCXVuc2lnbmVkIGludCBldnRjaG4sIGlycTsKIAlz
dHJ1Y3Qgd29ya19zdHJ1Y3Qgd29yazsKIAlzdHJ1Y3QgZ250dGFiX2ZyZWVfY2FsbGJhY2sgY2Fs
bGJhY2s7Ci0Jc3RydWN0IGJsa19zaGFkb3cgc2hhZG93W0JMS19NQVhfUklOR19TSVpFXTsKIAlz
dHJ1Y3QgbGlzdF9oZWFkIGluZGlyZWN0X3BhZ2VzOwogCXN0cnVjdCBsaXN0X2hlYWQgZ3JhbnRz
OwogCXVuc2lnbmVkIGludCBwZXJzaXN0ZW50X2dudHNfYzsKIAl1bnNpZ25lZCBsb25nIHNoYWRv
d19mcmVlOwogCXN0cnVjdCBibGtmcm9udF9pbmZvICpkZXZfaW5mbzsKKwlzdHJ1Y3QgYmxrX3No
YWRvdyBzaGFkb3dbXTsKIH07CiAKIC8qCkBAIC0xOTE1LDcgKzE5MTIsOCBAQCBzdGF0aWMgaW50
IG5lZ290aWF0ZV9tcShzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbykKIAkJaW5mby0+bnJfcmlu
Z3MgPSAxOwogCiAJaW5mby0+cmluZm8gPSBrdmNhbGxvYyhpbmZvLT5ucl9yaW5ncywKLQkJCSAg
ICAgICBzaXplb2Yoc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyksCisJCQkgICAgICAgc3RydWN0
X3NpemUoaW5mby0+cmluZm8sIHNoYWRvdywKKwkJCQkJICAgQkxLX1JJTkdfU0laRShpbmZvKSks
CiAJCQkgICAgICAgR0ZQX0tFUk5FTCk7CiAJaWYgKCFpbmZvLT5yaW5mbykgewogCQl4ZW5idXNf
ZGV2X2ZhdGFsKGluZm8tPnhiZGV2LCAtRU5PTUVNLCAiYWxsb2NhdGluZyByaW5nX2luZm8gc3Ry
dWN0dXJlIik7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
