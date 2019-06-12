Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E81841B98
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 07:47:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haw2N-0001Xw-ID; Wed, 12 Jun 2019 05:43:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v58P=UL=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1haw2M-0001Xr-KV
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 05:43:06 +0000
X-Inumbo-ID: ecab2262-8cd4-11e9-b3c1-aba32656215d
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecab2262-8cd4-11e9-b3c1-aba32656215d;
 Wed, 12 Jun 2019 05:42:56 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Wed, 12 Jun 2019 13:39:44 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 12 Jun 2019 13:42:34 +0800
Message-ID: <1560318154-19095-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH] xen/arm: io: add function swap_mmio_handler()
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
Cc: Baodong Chen <chenbaodong@mxnavi.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3dhcCBmdW5jdGlvbiBjYW4gYmUgdXNlZCB3aGVuIGNhbGxpbmcgc29ydCgpLgpvciBlbHNlLCB0
aGUgZGVmYXVsdCBzd2FwIGZ1bmN0aW9uIGdlbmVyaWNfc3dhcCgpIGlzIHVzZWQsCndoaWNoIGlz
IGEgbGl0dGxlIGluZWZmaWNpZW50LgoKU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVu
YmFvZG9uZ0BteG5hdmkuY29tPgotLS0KIHhlbi9hcmNoL2FybS9pby5jIHwgMTMgKysrKysrKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW8uYyBiL3hlbi9hcmNoL2FybS9pby5jCmluZGV4IGFl
N2VmOTYuLjVjZTdkYzQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9pby5jCisrKyBiL3hlbi9h
cmNoL2FybS9pby5jCkBAIC05Miw2ICs5MiwxNyBAQCBzdGF0aWMgaW50IGNtcF9tbWlvX2hhbmRs
ZXIoY29uc3Qgdm9pZCAqa2V5LCBjb25zdCB2b2lkICplbGVtKQogICAgIHJldHVybiAwOwogfQog
CitzdGF0aWMgdm9pZCBzd2FwX21taW9faGFuZGxlcih2b2lkICphLCB2b2lkICpiLCBpbnQgc2l6
ZSkKK3sKKyAgICBzdHJ1Y3QgbW1pb19oYW5kbGVyICpoYW5kbGVyMCA9IGE7CisgICAgc3RydWN0
IG1taW9faGFuZGxlciAqaGFuZGxlcjEgPSBiOworICAgIHN0cnVjdCBtbWlvX2hhbmRsZXIgdG1w
OworCisgICAgdG1wID0gKmhhbmRsZXIwOworICAgICpoYW5kbGVyMCA9ICpoYW5kbGVyMTsKKyAg
ICAqaGFuZGxlcjEgPSB0bXA7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbW1pb19oYW5kbGVy
ICpmaW5kX21taW9faGFuZGxlcihzdHJ1Y3QgZG9tYWluICpkLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgZ3BhKQogewpAQCAtMTc0
LDcgKzE4NSw3IEBAIHZvaWQgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKHN0cnVjdCBkb21haW4gKmQs
CiAKICAgICAvKiBTb3J0IG1taW8gaGFuZGxlcnMgaW4gYXNjZW5kaW5nIG9yZGVyIGJhc2VkIG9u
IGJhc2UgYWRkcmVzcyAqLwogICAgIHNvcnQodm1taW8tPmhhbmRsZXJzLCB2bW1pby0+bnVtX2Vu
dHJpZXMsIHNpemVvZihzdHJ1Y3QgbW1pb19oYW5kbGVyKSwKLSAgICAgICAgIGNtcF9tbWlvX2hh
bmRsZXIsIE5VTEwpOworICAgICAgICAgY21wX21taW9faGFuZGxlciwgc3dhcF9tbWlvX2hhbmRs
ZXIpOwogCiAgICAgd3JpdGVfdW5sb2NrKCZ2bW1pby0+bG9jayk7CiB9Ci0tIAoyLjcuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
